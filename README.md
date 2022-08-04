# repo_release

自己提交代码到openlinux上的工具脚本，为了保存并避免丢失。

使用方法：

1、首先需要设置3个环境变量

```
export code_dir=/home/hanliang.xiong/work/a113x2/code12
export xml_file=buildroot-openlinux-202207-a113x2-av400-sbr.xml
export version=buildroot-openlinux-202207-a113x2-av400-sbr
```

code_dir表示要处理的代码所在的目录。

xml_file表示.repo/manifests/目录下的xml文件名字。

version表示要release的版本名字。

2、依次执行01/02/03/04这4个脚本。0x开头的脚本都是要按顺序依次执行的。

```
# 生成name_path.txt文件，是提取的xml文件内容。
bash 01_gen_name_path.sh  
# 生成远程的地址openlinux
bash 02_gen_remote_url.sh  
# 创建分支
bash 03_create_branch.sh  
# 把分支推送到远程地址
bash 04_push_to_remote.sh
```

3、10_check_branch.sh 这个脚本是调试脚本。

要应对的这种情况：

当前代码都已经固定版本了。但是还有不少的代码更新合入。

为了避免代码更新后忘记切换分支，所以要检查一下分支情况。

