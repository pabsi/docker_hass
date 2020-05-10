FROM homeassistant/home-assistant:0.108.3

# Bluepy for Bluetooth
RUN pip install --no-cache-dir --upgrade pip==20.1 && \
    pip install --no-cache-dir --upgrade bluepy==1.3.0

# Samba common tools
# Remotely send commands to Windows 10
RUN apk add --no-cache samba-common-tools==4.11.8-r0 && \
    mkdir -p /etc/samba/ /var/lib/samba/private/

# Without this file, "net" will fail
COPY smb.conf /etc/samba/smb.conf
