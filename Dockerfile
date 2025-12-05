FROM f_main:latest

# ----------------------------------------------------
# UTILIDADES BÁSICAS
# ----------------------------------------------------
RUN apt-get update && apt-get install -y \
    openssh-server \
    apache2 \
    python3 \
    python3-pip \
    cron \
    sudo \
    net-tools \
    vim \
    && mkdir /var/run/sshd

# ----------------------------------------------------
# USUARIO ELLIOT
# ----------------------------------------------------
RUN useradd -m elliot && echo "elliot:secret123" | chpasswd
RUN usermod -aG sudo elliot
RUN chown -R elliot:elliot /home/elliot/.hidden

# ----------------------------------------------------
# Permitir login por contraseña (opcional, pero más sencillo para pruebas)
# ----------------------------------------------------
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

# ----------------------------------------------------
# ESTRUCTURA DEL CTF
# ----------------------------------------------------
RUN mkdir -p /home/elliot/.hidden
RUN mkdir -p /tmp/logs/.trash
RUN mkdir -p /run/sshd
# ----------------------------------------------------
# CREAR ARCHIVO robots.txt
# ----------------------------------------------------
RUN echo -e "User-agent: *\nDisallow: /secrets" > /var/www/html/robots.txt

# ----------------------------------------------------
# COPIAR ARCHIVOS DEL CTF
# ----------------------------------------------------
COPY www/ /var/www/html/	

COPY levels/level2_note /home/elliot/.hidden/level2_note
COPY levels/authenticator.py /home/elliot/.hidden/authenticator.py

COPY levels/level3_note /tmp/logs/.trash/level3_note

COPY services/hidden_service.py /opt/hidden_service.py

COPY cron/fsociety-cron /etc/cron.d/fsociety-cron

# ----------------------------------------------------
# CONFIGURAR SERVICIOS
# ----------------------------------------------------
RUN chmod 0644 /etc/cron.d/fsociety-cron
RUN crontab /etc/cron.d/fsociety-cron

EXPOSE 22 80 1337

CMD service cron start && \
    service apache2 start && \
    python3 /opt/hidden_service.py & \
    /usr/sbin/sshd -D

