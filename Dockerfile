FROM homeassistant/home-assistant:0.108.3

# Bluepy for Bluetooth
RUN pip install --no-cache-dir --quiet --upgrade pip && \
    pip install --no-cache-dir --quiet --upgrade bluepy

# Samba common tools
# Remotely send commands to Windows 10
RUN apk add --no-cache samba-common-tools==4.11.8-r0 && \
    mkdir -p /etc/samba/ /var/lib/samba/private/

COPY smb.conf /etc/samba/smb.conf
