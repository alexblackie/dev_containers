# alexblackie/dev_java

This provides a Java 8 runtime under Fedora with Maven already installed.

Maven is configured to store its cache/settings under `/data/.m2` in the
container (so make sure `$(pwd)/.m2` is ignored from your version control). This
is to avoid having to mount a second volume just for Maven, or have the caches
blown away every container restart.
