import jinja2
import sys
import json
import os


def main():

    with open("reports/output.json", "r") as data_file:
        json_string = data_file.read()
    json_obj = json.loads(json_string)

    environment = jinja2.Environment(loader=jinja2.FileSystemLoader(os.getcwd()))
    template_one = environment.get_template("reports/template.html")
    rendered_html = template_one.render(data=json_obj)
    output_file = open("reports/test_results.html","w")
    output_file.write(rendered_html)
    output_file.close()

if __name__ == "__main__":
    main()
