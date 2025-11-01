FROM node:20

WORKDIR /app

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    git \
    ca-certificates \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Install Foundry
RUN curl -L https://foundry.paradigm.xyz | bash

# Install Foundry binaries
RUN /root/.foundry/bin/foundryup

# Add to PATH
ENV PATH="/root/.foundry/bin:${PATH}"

# Verify (will fail build if install failed)
RUN forge --version && cast --version && anvil --version

COPY package.json yarn.lock ./
RUN yarn install

COPY client/package.json client/yarn.lock ./client/
RUN yarn install --cwd ./client

COPY . .
RUN git submodule update --init --recursive

EXPOSE 3000
EXPOSE 8545

CMD ["yarn", "start"]

