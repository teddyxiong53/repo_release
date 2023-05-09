import os
from xml.etree import ElementTree as et
import sys

xml_dir=sys.argv[1] + "/.repo/manifests/"

xml_file=xml_dir+os.environ.get('xml_file')


def process_xml():
    tree = et.parse(xml_file)
    # 文档根元素
    root = tree.getroot()
    projects = root.findall('project')
    of = open('name_path.txt', 'w')
    # print("size: {}".format(len(projects)))
    name_list = []
    for project in projects:
        name_attr = project.attrib['name']
        path_attr = name_attr
        if project.attrib.__contains__('path'):
            path_attr = project.attrib['path']
        # 如果是tdk的，那么跳过。
        if "tdk" in name_attr:
            print("skip repo {}".format(name_attr))
            continue

        if "src_ao" in path_attr:
            print("skip repo {}".format(name_attr))
            continue
        if "third_party/broadcom" in path_attr:
            print("skip repo {}".format(name_attr))
            continue
        if "third_party/wake_engine/alexa" in path_attr:
            print("skip repo {}".format(name_attr))
            continue
        if "third_party/wake_engine/horizon" in path_attr:
            print("skip repo {}".format(name_attr))
            continue
        if "third_party/wake_engine/sai" in path_attr:
            print("skip repo {}".format(name_attr))
            continue
        # toolchain版本都不会变化的。所以没有必要每次都创建分支。
        if "toolchain/" in path_attr:
            print("skip repo {}".format(name_attr))
            continue
        of.write("{}|{}\n".format(name_attr, path_attr))
    # 写入文件
    of.close()

if __name__ == '__main__':
    if not os.path.exists(xml_file):
        print('xml file is not exists')
        sys.exit(1)
    process_xml()

