[1mdiff --git a/docker/ssh_docker/Dockerfile b/docker/ssh_docker/Dockerfile[m
[1mindex 1eeea04..a3629d6 100644[m
[1m--- a/docker/ssh_docker/Dockerfile[m
[1m+++ b/docker/ssh_docker/Dockerfile[m
[36m@@ -1,4 +1,4 @@[m
[31m-FROM tensorflow/tensorflow:latest-gpu-py3[m
[32m+[m[32mFROM tensorflow/tensorflow:latest-gpu[m
 [m
 ENV NVIDIA_VISIBLE_DEVICES all[m
 ENV NVIDIA_DRIVER_CAPABILITIES compute,video,utility[m
[36m@@ -82,7 +82,7 @@[m [mRUN mkdir /var/run/sshd[m
 ARG SSH_PASS[m
 ENV SSH_PASS ${SSH_PASS}[m
 [m
[31m-RUN echo -e "root:$SSH_PASS" | chpasswd[m
[32m+[m[32mRUN echo "root:$SSH_PASS" | chpasswd[m
 RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config[m
 RUN sed -i 's/#PermitRootLogin yes/PermitRootLogin yes/' /etc/ssh/sshd_config[m
 [m
[1mdiff --git a/docker/ssh_docker/conda-gpu.yml b/docker/ssh_docker/conda-gpu.yml[m
[1mindex 2d1c377..432c15c 100644[m
[1m--- a/docker/ssh_docker/conda-gpu.yml[m
[1m+++ b/docker/ssh_docker/conda-gpu.yml[m
[36m@@ -1,16 +1,15 @@[m
 name: gpu[m
[31m-[m
 dependencies:[m
   - python[m
   - pip[m
[31m-  - matplotlib[m
   - opencv[m
   - cudnn[m
[31m-  - pandas[m
[32m+[m[32m  - anaconda::tensorflow-gpu==2.1[m
   - cudatoolkit[m
   - pip:[m
[31m-    - tensorflow-gpu[m
     - keras[m
[32m+[m[32m    - matplotlib[m
[32m+[m[32m    - pandas[m
     - lxml[m
     - tqdm[m
     - Augmentor[m
[1mdiff --git a/docker/ssh_docker/run.sh b/docker/ssh_docker/run.sh[m
[1mindex f176126..e5cf60a 100644[m
[1m--- a/docker/ssh_docker/run.sh[m
[1m+++ b/docker/ssh_docker/run.sh[m
[36m@@ -6,7 +6,6 @@[m [msource ./conf.sh[m
 run_build_dockerfile() [m
 {[m
     echo "building...";[m
[31m-    [m
     docker build --tag sidkas/simply_ssh:latest \[m
                  --build-arg SSH_PASS=$ssh_pass .[m
 }[m
[1mdiff --git a/docs/linux cmds.txt b/docs/linux cmds.txt[m
[1mindex 88eb2a0..cf0882f 100755[m
[1m--- a/docs/linux cmds.txt[m	
[1m+++ b/docs/linux cmds.txt[m	
[36m@@ -40,6 +40,9 @@[m [msudo nano /etc/rc.local[m
 [m
 sudo apt --fix-broken install[m
 [m
[32m+[m[32mLC_MESSAGES=C dpkg-divert --list '*nvidia-340*' | sed -nre 's/^diversion of (.*) to .*/\1/p' | xargs -rd'\n' -n1 -- sudo dpkg-divert --remove[m
[32m+[m[32msudo apt --fix-broken install[m
[32m+[m
 ls -l filename /* Size of the file*/[m
 ls -l *        /* Size of All the files in the current directory */[m
 ls -al *       /* Size of All the files including hidden files in the current directory */[m
