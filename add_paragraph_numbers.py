import sys
from bs4 import BeautifulSoup

def process_html(html_content):
    soup = BeautifulSoup(html_content, 'html.parser')
    paragraph_counter = 0

    for element in soup.descendants:
        if element.name and element.name.startswith('h'):
            # Reset counter when a header tag is found
            paragraph_counter = 0
        elif element.name == 'p' and element.get_text(strip=True):
            # Increment counter for each non-empty paragraph
            paragraph_counter += 1
            # Add the paragraph number as an attribute
            element['paragraph-number'] = str(paragraph_counter)

    return str(soup)

# Main function to handle command line usage
def main():
    if len(sys.argv) != 2:
        print("Usage: python script.py <filename.html>")
        sys.exit(1)

    filename = sys.argv[1]

    # Read the HTML content from the file
    with open(filename, 'r', encoding='utf-8') as file:
        html_content = file.read()

    # Process the HTML content
    processed_html = process_html(html_content)

    # Write the processed HTML back to the file
    with open(filename, 'w', encoding='utf-8') as file:
        file.write(processed_html)

if __name__ == '__main__':
    main()



