ARG KEYCLOAK_VERSION=7.0.0
FROM jboss/keycloak:${KEYCLOAK_VERSION}

ARG OJDBC_VERSION=19.3.0.0

USER root

RUN set -x \
    && yum install -y wget \
    && mkdir -p /opt/jboss/keycloak/modules/system/layers/base/com/oracle/jdbc/main/driver/ \
    && wget -O /opt/jboss/keycloak/modules/system/layers/base/com/oracle/jdbc/main/driver/ojdbc.jar -q https://repo1.maven.org/maven2/com/oracle/ojdbc/ojdbc8/${OJDBC_VERSION}/ojdbc8-${OJDBC_VERSION}.jar \
    && yum remove -y wget \
    && yum clean all

USER 1000
