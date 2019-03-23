FROM fedora:29

RUN true \
    && dnf upgrade -y \
    && dnf install -y \
        @development-tools \
        xorg-x11-server-devel \
        libXtst-devel \
        libXmu-devel

RUN true \
    && mkdir /source \
    && mkdir /output \
    && cd /source \
    && curl -L "https://downloads.sourceforge.net/project/imwheel/imwheel-source/1.0.0pre12/imwheel-1.0.0pre12.tar.gz" -o src.tar.gz \
    && tar -xz --strip-components=1 -f src.tar.gz \
    && ./configure \
    && make -j8 \
    && make install DESTDIR=/output
