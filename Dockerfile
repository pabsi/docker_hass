FROM homeassistant/home-assistant:2021.1.5

# Samba common tools
# Remotely send commands to Windows 10
RUN apk add --no-cache samba-common-tools==4.12.9-r0 && \
    mkdir -p /etc/samba/ /var/lib/samba/private/

# Without this file, "net" command will fail
COPY smb.conf /etc/samba/smb.conf

# Bluepy, for Bluetooth
RUN apk add --no-cache make gcc musl-dev glib-dev && \
    pip install --no-cache-dir --upgrade pip==20.2 && \
    pip install --no-cache-dir --upgrade bluepy
