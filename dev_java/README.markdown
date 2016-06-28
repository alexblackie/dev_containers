# alexblackie/dev_java

This provides a Java 8 runtime under Fedora with Maven already installed.

Usage of this container is fairly standard, below is how I organize things.

```
$ mkdir ~/.maven/projectname
$ chcon -Rt svirt_sandbox_file_t ~/.maven/projectname
$ docker run -it --rm \
	-v `pwd`:/data
	-v ~/.maven/projectname:/home/developer/.m2
	-p 8080:8080
	alexblackie/dev_java -lc "mvn compile jetty:run"
```
