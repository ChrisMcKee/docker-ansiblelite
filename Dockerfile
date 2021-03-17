FROM alpine:3

MAINTAINER C.McKee <pcdevils@gmail.com>


RUN apk --update add sudo && \
    apk --update add python3 py-pip openssl ca-certificates && \    
    apk --update add --virtual build-dependencies python3-dev libffi-dev openssl-dev build-base gcc musl-dev cargo && \
    pip install --upgrade pip cffi && \
    pip install wheel                && \
    pip install ansible                && \
    pip install --upgrade pywinrm                  && \
    apk --update add sshpass openssh-client rsync  && \
    echo "Purge junk"  && \
    apk del build-dependencies            && \
    rm -rf /var/cache/apk/*               && \
    mkdir -p /etc/ansible                        && \
    echo 'localhost' > /etc/ansible/hosts

CMD [ "ansible-playbook", "--version" ]
