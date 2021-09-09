FROM openjdk
COPY . .
CMD java -jar *.jar
