#!/bin/bash

# Check if exactly one argument is provided
if [ "$#" -ne 1 ]; then
    echo "Error: Exactly one argument with the ePub file name is required."
    exit 1
fi

# Extract the argument
file="$1"

# Check if the argument ends with ".epub"
if [[ "$file" != *.epub ]]; then
    echo "Error: The file must have a '.epub' extension."
    exit 1
fi

# Check if the file exists
if [ ! -f "$file" ]; then
    echo "Error: The file '$file' does not exist."
    exit 1
fi

file=$(realpath "$file")
DIR=${file%%.epub}
if [ -d "$DIR" ]; then
    rm -rf "$DIR"
fi
mkdir "$DIR"
unzip "$file" -d "$DIR"
cd "$DIR"
cat >>stylesheet.css <<EOT
p {
    position: relative;
    left: 1.5em;
    padding-left: 1.5em;
}
p::before {
    content: attr(paragraph-number);
    position: absolute;
    left: -1.5em;
    color: blue; /* Change the color of the paragraph number */
    font-size: 0.7em; /* Change the font size of the paragraph number */
    margin-right: 1.5em; /* Add margin to the right of the paragraph number */
}
EOT
for html in *.html; do
    python ../add_paragraph_numbers.py "$html"
done
zip -r "$file" .
cd ..
rm -rf "$DIR"