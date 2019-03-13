FROM  ubuntu:latest 

WORKDIR /root

COPY entrypoint.sh entrypoint.sh

COPY polipo polipo

RUN chmod +x entrypoint.sh 

EXPOSE 31080

ENTRYPOINT ["./entrypoint.sh"]
