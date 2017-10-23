#! /bin/bash
clear

# archetypeGroup=org.apache.maven.plugins
# archetypeArtifact=maven-archetype-plugin
# archetypeVersion=2.4
# archetypeRepository=http://maven.codenvycorp.com/content/groups/public/
# archetypeGroupId=org.eclipse.che.archetype

echo -n -e "\e[92mSelect the number of one of the following maven actions and press [Enter]: \n"
echo -n -e "\e[92m [1] all \n"
echo -n -e "\e[92m [2] generate \n"
echo -n -e "\e[92m [3] build \n"
echo -n -e "\e[92m [4] run \n"
read option
action="None"
if [ "$option" == "1" ];then
  action="all"
elif [ "$option" == "2" ]; then
  action="generate"
elif [ "$option" == "3" ]; then
  action="build"
else
  action="run"
fi
echo $action selected!
echo -n -e "\e[92mSelect the number of one of the archetype type and press [Enter]: \n"
echo -n -e "\e[92m [1] agent-archetype	 \n"
echo -n -e "\e[92m [2] plugin-menu-archetype	 \n"
echo -n -e "\e[92m [3] plugin-wizard-archetype	 \n"
echo -n -e "\e[92m [4] plugin-embedjs-archetype	 \n"
echo -n -e "\e[92m [5] plugin-serverservice-archetype	 \n"
echo -n -e "\e[92m [6] plugin-json-archetype	 \n"
read option
type="None"
if [ "$option" == "1" ];then
  type="agent-archetype"
elif [ "$option" == "2" ]; then
  type="plugin-menu-archetype"
elif [ "$option" == "3" ]; then
  type="plugin-wizard-archetype"
elif [ "$option" == "4" ]; then
  type="plugin-embedjs-archetype"
elif [ "$option" == "5" ]; then
  type="plugin-serverservice-archetype"
else
  type="plugin-json-archetype"
fi
echo $type selected!
echo -n -e "\e[92mType the archetype version(eclipse che version compiled)(e.g. x.x.x)[Enter]: \n"
read archV
echo -n -e "\e[92mGroup Id[Enter]: \n"
read gid
echo -n -e "\e[92mArtifact Id[Enter]: \n"
read aid
# echo -n -e "\e[92mVersion(e.g. x.x.x)[Enter]: \n"
# read version
echo -n -e "\e[39m \n"
clear
# echo "mvn $archetypeGroup:$archetypeArtifact:$action -DarchetypeRepository=$archetypeRepository -DarchetypeGroupId=$archetypeGroupId -DarchetypeArtifactId=$type -DarchetypeVersion=$archV -DgroupId=$gid -DartifactId=$aid -Dversion=$version -DskipITs -DinteractiveMode=false"
#
# mvn $archetypeGroup:$archetypeArtifact:$action -DarchetypeRepository=$archetypeRepository -DarchetypeGroupId=$archetypeGroupId -DarchetypeArtifactId=$type -DarchetypeVersion=$archV -DgroupId=$gid -DartifactId=$aid -Dversion=$version -DskipITs -DinteractiveMode=false


docker run -it --rm \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /home/atryfo03/unicornPg/archetype:/archetype \
  -v /home/atryfo03/unicornPg/tmp:/data \
  -v /home/atryfo03/m2/repository:/m2 \
    eclipse/che \
      archetype $action --no:interactive \
      --archid=$type \
      --archversion=$archV --version=$archV --group=$gid --id=$aid
