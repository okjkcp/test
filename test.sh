#!/bin/bash
set -e

# 安监项目后端部署脚本

ctime=$(date +%Y_%m_%d_%H_%M)
#root="192.168.19.13:/home/"
dir="/data/newyctech/"
JAVA_BIN="/usr/local/jdk1.8.0_181/bin/java"
MAVEN_BIN="/usr/local/apache-maven-3.8.5/bin"
project_dir="/data/newyctech/yygl/"
backup="/data/ymwj/backup/"
#PROCESS_JAR=`find $target_dir -maxdepth 1 -name "*.jar" | awk -F "/" '{print $NF}'`
PROCESS_PID=`ps -ef| grep test | grep -v grep | awk '{print $2}'`
project_dir_jar='-Dspring.profiles.active=test -Xdebug -Xrunjdwp:server=y,transport=dt_socket,suspend=n,'
jmx='-Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.registry.ssl=false -Djava.rmi.server.hostname=192.168.13.30 -Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.'
JAR_OPS='-Xmx256m'
JAR_Xms='-Xms256m'
#project_dir="/data/newyctech/yygl/"
git_frame="git@139.196.255.21:newyctech-frame/newyctech-"
git_project="git@139.196.255.21:newyctech-yyglpt/newyctech-yyglpt-"
dev="-b dev_1.1.0_20220421_01 "

equip_target="newyctech-yyglpt-equip/newyctech-yyglpt-equip-web/target/"
file_target="newyctech-yyglpt-file/newyctech-yyglpt-file-web/target/"
gateway_target="newyctech-yyglpt-gateway/target/"
manage_target="newyctech-yyglpt-manage/newyctech-yyglpt-manage-web/target/"
user_target="newyctech-yyglpt-user/newyctech-yyglpt-user-web/target/"

echo "  ?(????ε ???? ? )))Σ≡=─冲鸭!  "


cd ${project_dir}newyctech-repositories
git pull
if (( $? ))
then
    echo "git pull failed"
	exit 1
else
    echo "git pull success"
fi
mvn clean install -Dmaven.test.skip=true
if (( $? ))
then
    echo "mvn cdh failed"
    exit 1
else
    echo "mvn cdh success"
fi

cd ${project_dir}newyctech-first-repositories
git pull
if (( $? ))
then
    echo "git pull failed"
	exit 1
else
    echo "git pull success"
fi
mvn clean install -Dmaven.test.skip=true
if (( $? ))
then
    echo "mvn cdh failed"
    exit 1
else
    echo "mvn cdh success"
fi

cd ${project_dir}newyctech-second-repositories
git pull
if (( $? ))
then
    echo "git pull failed"
	exit 1
else
    echo "git pull success"
fi
mvn clean install -Dmaven.test.skip=true
if (( $? ))
then
    echo "mvn cdh failed"
    exit 1
else
    echo "mvn cdh success"
fi

cd ${project_dir}newyctech-third-repositories
git pull
if (( $? ))
then
    echo "git pull failed"
	exit 1
else
    echo "git pull success"
fi
mvn clean install -Dmaven.test.skip=true
if (( $? ))
then
    echo "mvn cdh failed"
    exit 1
else
    echo "mvn cdh success"
fi

cd ${project_dir}newyctech-base
git pull
if (( $? ))
then
    echo "git pull failed"
	exit 1
else
    echo "git pull success"
fi
mvn clean install -Dmaven.test.skip=true
if (( $? ))
then
    echo "mvn cdh failed"
    exit 1
else
    echo "mvn cdh success"
fi

cd ${project_dir}newyctech-base-common
git pull
if (( $? ))
then
    echo "git pull failed"
	exit 1
else
    echo "git pull success"
fi
mvn clean install -Dmaven.test.skip=true
if (( $? ))
then
    echo "mvn cdh failed"
    exit 1
else
    echo "mvn cdh success"
fi

cd ${project_dir}newyctech-common
git pull
if (( $? ))
then
    echo "git pull failed"
	exit 1
else
    echo "git pull success"
fi
mvn clean install -Dmaven.test.skip=true
if (( $? ))
then
    echo "mvn cdh failed"
    exit 1
else
    echo "mvn cdh success"
fi

cd ${project_dir}newyctech-common-excel
git pull
if (( $? ))
then
    echo "git pull failed"
	exit 1
else
    echo "git pull success"
fi
mvn clean install -Dmaven.test.skip=true
if (( $? ))
then
    echo "mvn cdh failed"
    exit 1
else
    echo "mvn cdh success"
fi

cd ${project_dir}newyctech-common-mail
git pull
if (( $? ))
then
    echo "git pull failed"
	exit 1
else
    echo "git pull success"
fi
mvn clean install -Dmaven.test.skip=true
if (( $? ))
then
    echo "mvn cdh failed"
    exit 1
else
    echo "mvn cdh success"
fi

cd ${project_dir}newyctech-common-redis
git pull
if (( $? ))
then
    echo "git pull failed"
	exit 1
else
    echo "git pull success"
fi
mvn clean install -Dmaven.test.skip=true
if (( $? ))
then
    echo "mvn cdh failed"
    exit 1
else
    echo "mvn cdh success"
fi

cd ${project_dir}newyctech-yyglpt-file
git pull
mvn sonar:sonar -Dsonar.projectKey=newyctech-yyglpt-file -Dsonar.host.url=http://192.168.19.38:9000 -Dsonar.login=8d068996938293cd99f062980a0eb9773e97fc26
if (( $? ))
then
    echo "git pull failed"
	exit 1
else
    echo "git pull success"
fi
mvn clean install -Dmaven.test.skip=true
if (( $? ))
then
    echo "mvn cdh failed"
    exit 1
else
    echo "mvn cdh success"
fi

cd ${project_dir}newyctech-yyglpt-user
git pull
mvn sonar:sonar -Dsonar.projectKey=newyctech-yyglpt-user -Dsonar.host.url=http://192.168.19.38:9000 -Dsonar.login=039a904734ca0d756b66a48853756c4a880aab53
if (( $? ))
then
    echo "git pull failed"
	exit 1
else
    echo "git pull success"
fi
mvn clean install -Dmaven.test.skip=true
if (( $? ))
then
    echo "mvn cdh failed"
    exit 1
else
    echo "mvn cdh success"
fi

cd ${project_dir}newyctech-yyglpt-manage
git pull
mvn sonar:sonar -Dsonar.projectKey=newyctech-yyglpt-manage -Dsonar.host.url=http://192.168.19.38:9000 -Dsonar.login=8a485ca4f74173ba7debdb7f4ec544f022b178c3
if (( $? ))
then
    echo "git pull failed"
	exit 1
else
    echo "git pull success"
fi
mvn clean install -Dmaven.test.skip=true
if (( $? ))
then
    echo "mvn cdh failed"
    exit 1
else
    echo "mvn cdh success"
fi

cd ${project_dir}newyctech-yyglpt-equip
git pull
mvn sonar:sonar -Dsonar.projectKey=newyctech-yyglpt-equip -Dsonar.host.url=http://192.168.19.38:9000 -Dsonar.login=cb5ac73c00064c99bd2462b5b987bb2c3e2f23a3
if (( $? ))
then
    echo "git pull failed"
	exit 1
else
    echo "git pull success"
fi
mvn clean install -Dmaven.test.skip=true
if (( $? ))
then
    echo "mvn cdh failed"
    exit 1
else
    echo "mvn cdh success"
fi

cd ${project_dir}newyctech-yyglpt-gateway
git pull
mvn sonar:sonar -Dsonar.projectKey=newyctech-yyglpt-gateway -Dsonar.host.url=http://192.168.19.38:9000 -Dsonar.login=1b713a188944368e5298772f2e58b2590b4c0ae4
if (( $? ))
then
    echo "git pull failed"
	exit 1
else
    echo "git pull success"
fi
mvn clean install -Dmaven.test.skip=true
if (( $? ))
then
    echo "mvn cdh failed"
    exit 1
else
    echo "mvn cdh success"
fi

echo "mvm success!good! (??????)??"

cd ${dir}
echo "备份中"
if [ -d ${backup} ]
then
	tar czf ${backup}${ctime}-jar.tar.gz ${dir}*.jar  &>/dev/null
	echo "备份ok"
else
	echo "备份失败！"
fi

cd ${dir}
find ${backup} -mtime +30 -name "*tar.gz" -exec rm -rf {} \;
echo "删除大于30天的备份文件ok"
# echo "rm -rf failed! Σ(っ °Д °;)っ"

echo "kill进程 o(*≧▽≦)ツ┏━┓"
if [ -n "$PROCESS_PID" ]
then            
    kill -9 $PROCESS_PID
	sleep 10
else
    echo "previsous service not found Σ(っ °Д °;)っ"
fi
echo "kill进程ok (?????)? ??"
sleep 20

#cd ${dir}
#rm -rf ${dir}*.jar
#echo "传输新jar包至newyctech文件夹 o(^▽^)o"

if [ -d ${dir} ]
then
	mv -f ${project_dir}${equip_target}*.jar $dir
	echo "mv success!"
else
    echo "mv failed!"    
	sleep 5
	
fi
if [ -d ${dir} ]
then
	mv -f ${project_dir}${file_target}*.jar $dir
	echo "mv success!"
else
    echo "mv failed!" 
    sleep 5
	
fi

if [ -d ${dir} ]
then
	mv -f ${project_dir}${gateway_target}*.jar $dir
	echo "mv success!"
else
    echo "mv failed!" 
    sleep 5
	
fi

if [ -d ${dir} ]
then
	mv -f ${project_dir}${user_target}*.jar $dir
	echo "mv success!"
else
    echo "mv failed!" 
    sleep 5
	
fi

if [ -d ${dir} ]
then
	mv -f ${project_dir}${manage_target}*.jar $dir
	echo "mv success!"
else
    echo "mv failed!" 
    sleep 2
	
fi

#echo ""
echo "启动服务中 (^▽^)"

    cd $dir
    nohup $JAVA_BIN ${project_dir_jar}address=35294, $JAR_OPS $JAR_Xms ${jmx}port=10004 -jar newyctech-yyglpt-file-web-1.0.0-SNAPSHOT.jar &
    echo start 1

    cd $dir
    nohup $JAVA_BIN ${project_dir_jar}address=35290, $JAR_OPS $JAR_Xms ${jmx}port=10009 -jar newyctech-yyglpt-gateway-1.0.0-SNAPSHOT.jar &
    echo start 2

    cd $dir
    nohup $JAVA_BIN ${project_dir_jar}address=35292, $JAR_OPS $JAR_Xms ${jmx}port=10002 -jar newyctech-yyglpt-manage-web-1.0.0-SNAPSHOT.jar &
    echo start 3

    cd $dir
    nohup $JAVA_BIN ${project_dir_jar}address=35291, $JAR_OPS $JAR_Xms ${jmx}port=10001 -jar newyctech-yyglpt-user-web-1.0.0-SNAPSHOT.jar &
    echo start 4
	
    cd $dir
    nohup $JAVA_BIN ${project_dir_jar}address=35299, $JAR_OPS $JAR_Xms ${jmx}port=10003 -jar newyctech-yyglpt-equip-web-1.0.0-SNAPSHOT.jar &
    echo start 5

sleep 10
command=`ps -ef | grep -m 5 newyctech`
   if [  "$command" == "" ]
   then
exit 1
   else
exit 0
   fi

echo "通关，撒花 qwq"
