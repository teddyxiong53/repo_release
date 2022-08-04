import os
from xml.etree import ElementTree as et
import sys

if len(sys.argv) < 2:
    print("usage: {} xml_file_name".format(sys.argv[0]))
    sys.exit(1)

xml_file=sys.argv[1]




def process_xml():
    tree = et.parse(xml_file)
    # 文档根元素
    root = tree.getroot()
    projects = root.findall('project')
    # print("size: {}".format(len(projects)))
    name_list = []
    for project in projects:
        name_attr = project.attrib['name']
        path_attr = name_attr
        if project.attrib.__contains__('path'):
            path_attr = project.attrib['path']
        print(name_attr)

process_xml()

