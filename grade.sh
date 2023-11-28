CPATH='.;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'


# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# list-examples-grader
#   lib
#       hamcrest-core-1.3.jar
#       junit-4.13.2.jar
#   grade.sh
#   GradeServer.java
#   Server.java
#   TestListExamples.java
#   grading-area
#   student-submission
#       ~GIT FOLDER CLONED~

# Then, add here code to compile and run, and do any post-processing of the
# tests

if [[ -f ./student-submission/ListExamples.java ]]
then
    echo ""
    echo "Correct file submitted!"
    echo ""
else 
    echo ""
    echo "Incorrect submission! Please submit ListExamples.java"
    echo ""
    exit
fi

cp -r ./student-submission/*.java ./grading-area/
cp ./TestListExamples.java ./grading-area/

javac.exe -cp $CPATH ./grading-area/*.java

compileExitCode=$?

if [[ $compileExitCode -eq 0 ]]
then
    echo "Compilation successful!"
else
    echo "Compilation failed! Exit code: $compileExitCode"
    exit
fi