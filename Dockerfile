FROM ubuntu:jammy
LABEL Name=broseph Version=0.0.1
RUN apt-get -y update && apt-get install -y curl g++ openssh-server bubblewrap patch bzip2 git unzip make vim
RUN bash -c "sh <(curl -fsSL https://raw.githubusercontent.com/ocaml/opam/master/shell/install.sh)"
RUN opam init --compiler=4.09.1 < yes
RUN service ssh start
RUN eval $(opam env) && opam repo add coq-released https://coq.inria.fr/opam/released && opam install -j4 coq.8.9.1 menhir.20200624 coq-menhirlib.20200624 < yes
RUN git clone git@github.com:INRIA/velus.git
RUN git submodule update --init --recursive
ENTRYPOINT ["bash"]
