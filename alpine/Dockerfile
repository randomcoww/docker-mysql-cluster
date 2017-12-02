## based on haproxy dockerfile
## https://github.com/docker-library/haproxy/blob/master/1.8/alpine/Dockerfile

FROM alpine:edge

ENV MYSQL_VERSION 7.6.2

RUN set -x \
  \
  && apk add --no-cache --virtual .build-deps \
      openssl \
      cmake \
      make \
      zlib \
      libaio \
      tar \
      g++ \
  \
  && mkdir -p /usr/src/mysql/build \
  && mkdir -p /usr/src/mysql/out \
  \
## build mysql-cluster
  && cd / \
  && wget -O mysql.tar.gz https://downloads.mysql.com/archives/get/file/mysql-cluster-gpl-$MYSQL_VERSION.tar.gz \
  && tar -zxf mysql.tar.gz -C /usr/src/mysql --strip-components=1 \
  && rm mysql.tar.gz \
  && cd /usr/src/mysql/build \
  && CFLAGS="-DSIGEV_THREAD_ID=4" cmake ../ -DWITH_ZLIB=system \
      -DWITH_SSL=system \
      -DWITH_LIBWRAP=OFF \
      -DCMAKE_EXE_LINKER_FLAGS='-ljemalloc' \
      -DWITH_EXTRA_CHARSETS=complex \
      -DWITH_EMBEDDED_SERVER=ON \
      -DWITH_ARCHIVE_STORAGE_ENGINE=ON \
      -DWITH_BLACKHOLE_STORAGE_ENGINE=ON \
      -DWITH_INNOBASE_STORAGE_ENGINE=ON \
      -DWITH_PARTITION_STORAGE_ENGINE=ON \
      -DWITHOUT_EXAMPLE_STORAGE_ENGINE=ON \
      -DWITHOUT_FEDERATED_STORAGE_ENGINE=ON \
      -DWITH_NDBCLUSTER_STORAGE_ENGINE=ON \
      -DCMAKE_C_FLAGS="-fPIC ${CFLAGS} -fno-strict-aliasing -DBIG_JOINS=1 -fomit-frame-pointer -fno-delete-null-pointer-checks" \
      -DCMAKE_CXX_FLAGS="-fPIC ${CXXFLAGS} -std=gnu++98 -fno-strict-aliasing -DBIG_JOINS=1 -felide-constructors -fno-delete-null-pointer-checks" \
      -DWITH_MYSQLD_LDFLAGS="-pie ${LDFLAGS},-z,now" \
      -DDOWNLOAD_BOOST=1 \
      -DWITH_BOOST="../boost" \
