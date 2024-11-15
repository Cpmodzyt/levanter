
# Set the environment to avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary packages, Node.js, Yarn, PM2, and clone the repository
RUN apt -y update && \
    apt -y upgrade && \
    apt -y install git ffmpeg curl && \
    curl -fsSL https://deb.nodesource.com/setup_20.x -o nodesource_setup.sh && \
    bash nodesource_setup.sh && \
    apt-get install -y nodejs && \
    npm install -g yarn && \
    yarn global add pm2 && \
    git clone https://github.com/cpmodzyt/levanter && \
    cd levanter && \
    yarn install && \
    apt -y clean && \
    rm -rf /var/lib/apt/lists/* nodesource_setup.sh

# Create the config.env file with the specified environment variables
RUN echo "SESSION_ID = levanter_15f6e32e713a034b338d93ed4b5c54c2d4\n\
PREFIX = .\n\
STICKER_PACKNAME = Interworld\n\
ALWAYS_ONLINE = false\n\
RMBG_KEY = null\n\
LANGUAG = en\n\
WARN_LIMIT = 3\n\
FORCE_LOGOUT = false\n\
BRAINSHOP = 159501,6pq8dPiYt7PdqHz3\n\
MAX_UPLOAD = 200\n\
REJECT_CALL = false\n\
SUDO = 94773789258\n\
TZ = Asia/colombo\n\
VPS = true\n\
AUTO_STATUS_VIEW = true\n\
SEND_READ = true\n\
AJOIN = true\n\
DISABLE_START_MESSAGE = false\n\
PERSONAL_MESSAGE = null" > /levanter/config.env

# Set the default working directory
WORKDIR /levanter

# Start the bot using PM2
CMD ["pm2", "start", ".", "--name", "botName", "--attach", "--time"]
