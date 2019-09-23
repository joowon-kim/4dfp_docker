from ubuntu:16.04

RUN apt update && apt -y upgrade
RUN apt update
RUN apt install -y csh gcc gawk gfortran make

ENV NILSRC=/src/nil-tools
ENV RELEASE=/usr/local/4dfp

# copy and extract src
RUN mkdir -p $NILSRC
COPY 4dfp_scripts.tar /src
COPY nil-tools.tar /src
WORKDIR /src/nil-tools
RUN tar -xvf ../nil-tools.tar

# fix typo
RUN sed -i 's/setnev/setenv/g' make_nil-tools.csh

# clean up .o files
RUN rm -f */*.o

# compile
RUN ./make_nil-tools.csh

# compile diff_4dfp_js (excluding bad volumes/slices)
#COPY diff_4dfp_js.mak /src/nil-tools/diff4dfp
#COPY diff_4dfp_js.c /src/nil-tools/diff4dfp
#RUN cd diff4dfp && make -f diff_4dfp_js.mak release

# extract scripts
RUN cd $RELEASE && tar -xvf /src/4dfp_scripts.tar

# if you want to install Atlas, uncomment the following 4 lines
#ENV REFDIR=$RELEASE/ref
#RUN mkdir -p $REFDIR
#COPY refdir.tar $REFDIR
#RUN cd $REFDIR && tar -xvf refdir.tar && rm -f refdir.tar

ENV PATH=$PATH:$RELEASE

VOLUME ["/data"]
WORKDIR /data

RUN rm -rf /src

CMD bash

