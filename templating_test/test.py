import jinja2
import sys
import json


def main():

    json_string = sys.argv[1]
    json_string = json_string.replace('\n','')
    json_obj = json.loads(json_string)
    environment = jinja2.Environment(loader=jinja2.FileSystemLoader('/root'))
    template_one = environment.get_template("hi.html")
    rendered_html = template_one.render(json_obj)
    print(rendered_html)

if __name__ == "__main__":
    main()
