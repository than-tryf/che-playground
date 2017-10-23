#! /bin/bash
clear

echo -e "\e[34m==============================================================="
echo -e "\e[34m#                      Clearing                               #"
echo -e "\e[34m===============================================================\e[39m"
echo -e -n "\e[91mStopping Docker................................................"
sudo docker stop $(sudo docker ps -a -q) >/dev/null 2>&1
echo -e "\e[32mOK!"
echo -e -n "\e[91mRemoving Docker................................................"
sudo docker rm $(sudo docker ps -a -q) >/dev/null 2>&1
echo -e "\e[32mOK!"
echo -e -n "\e[91mClearing :/data................................................"
sudo rm /home/atryfo03/che_data -rf >/dev/null 2>&1
echo -e "\e[32mOK!"
echo -e "\e[34m==============================================================="
echo -e "\e[34m#                      Building                               #"
echo -e "\e[34m===============================================================\e[39m"
cd /home/atryfo03/unicornPg/che
mvn  -DskipTests=true -Dfindbugs.skip=true -Dgwt.compiler.localWorkers=4 -T 1C -Dlicense.skip=True -Dmdep.analyze.skip=True clean install
echo -e "\e[34m==============================================================="
echo -e "\e[34m#                       Docker                                #"
echo -e "\e[34m===============================================================\e[39m"
sudo docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock -v /home/atryfo03/che_data:/data -v /home/atryfo03/unicornPg/che:/repo eclipse/che start
