FROM quay.io/lyfe00011/md:beta

# Clone the repository
RUN git clone https://github.com/cpmodzyt/levanter.git /root/LyFE/

# Set working directory
WORKDIR /root/LyFE/

# Install dependencies
RUN yarn install

# Install PM2 globally
RUN yarn global add pm2

# Save environment variables to config.env
RUN echo "SESSION_ID=levanter_15a370df18805c45fcbf7e1fe672dfac85\n\
PREFIX=.\n\
STICKER_PACKNAME=Interworld\n\
ALWAYS_ONLINE=false\n\
RMBG_KEY=null\n\
LANGUAG=en\n\
WARN_LIMIT=3\n\
FORCE_LOGOUT=false\n\
BRAINSHOP=159501,6pq8dPiYt7PdqHz3\n\
MAX_UPLOAD=200\n\
REJECT_CALL=false\n\
SUDO=94773789258\n\
TZ=Asia/colombo\n\
VPS=true\n\
AUTO_STATUS_VIEW=true\n\
SEND_READ=true\n\
AJOIN=true\n\
DISABLE_START_MESSAGE=false\n\
PERSONAL_MESSAGE=null" > /root/LyFE/config.env

# Start the application with PM2 (without --attach)
CMD ["pm2", "start", ".", "--name", "botName", "--time"]
