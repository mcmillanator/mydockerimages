FROM node:14-alpine AS build

# Install dependencies
RUN apk add --no-cache build-base python

# Set environment variables
ENV FOUNDRY_VTT_VERSION=0.7.8 \
    FOUNDRY_VTT_DIR=/opt/foundryvtt

# Download and extract Foundry VTT
RUN wget -O - https://github.com/foundrynet/foundryvtt/releases/download/${FOUNDRY_VTT_VERSION}/foundryvtt-${FOUNDRY_VTT_VERSION}.zip | \
    unzip -d ${FOUNDRY_VTT_DIR}

FROM node:14-alpine

# Set environment variables
ENV FOUNDRY_VTT_DIR=/opt/foundryvtt

# Copy files from build stage
COPY --from=build ${FOUNDRY_VTT_DIR} ${FOUNDRY_VTT_DIR}

# Change working directory
WORKDIR ${FOUNDRY_VTT_DIR}

# Install dependencies
RUN npm install

# Expose port
EXPOSE 30000

# Set healthcheck
HEALTHCHECK --interval=5s --timeout=3s \
  CMD wget -qO- http://localhost:30000/ || exit 1

# Start Foundry VTT
CMD ["node", "./resources/app/main.js", "--headless"]
