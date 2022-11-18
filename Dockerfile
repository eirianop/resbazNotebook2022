FROM debian:buster

RUN apt -y update
RUN apt -y install dpkg

RUN apt -y install haskell-platform
RUN cabal install cabal-install
RUN gunzip pandoc-2.18.tar.gz
RUN tar xf pandoc-2.18.tar
RUN cd pandoc-2.18 && cabal install

#COPY *tar.gz .
#RUN gunzip *gz
#RUN tar xf *tar
#RUN mv */bin/pandoc /bin
# v 2.18 appears to actually be v 2.2 :(

#RUN dpkg -i *deb
#RUN wget -O . 'https://github.com/jgm/pandoc/releases/download/2.19.2/pandoc-2.19.2-1-amd64.deb' 
#RUN dpkg -i "pandoc-2.19.2-1-amd64.deb"
#RUN TEMP_DEB="$(mktemp)" wget -O "$TEMP_DEB" 'https://github.com/jgm/pandoc/releases/download/2.19.2/pandoc-2.19.2-1-amd64.deb' && dpkg -i "$TEMP_DEB"

#RUN python3 -m pip install --upgrade pip
RUN apt -y install pandoc-citeproc
RUN apt -y install vim 
RUN apt -y install make
RUN apt -y install texlive-full
RUN apt -y install biber
RUN apt -y install bibutils
RUN apt -y install python-pygments
RUN apt -y install cysignals-tools
RUN apt -y install sagemath
RUN apt -y install python-sagetex
RUN apt -y install sagetex
RUN apt -y install bsdmainutils
RUN apt -y install rsync

#COPY notebook2022-tools /tools
#RUN dpkg -i /tools/*deb

WORKDIR /results
ENTRYPOINT ["/usr/bin/make"]

# then do something locally like

# source commands.sh
# create pdf

###############################################################################

# commands.sh contains the following function:
# create() { docker run --rm -v $(pwd):/results notebook2022:latest "$@"; }

