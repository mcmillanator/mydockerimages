FROM node:16-alpine AS build

# Install dependencies
RUN apk update && apk add --no-cache build-base python3

ARG TIMED_URL

# Set environment variables
ENV FOUNDRY_VTT_TIMED_URL=$TIMED_URL \
    FOUNDRY_VTT_DIR=/opt/foundryvtt


# Download and extract Foundry VTT
RUN wget -O /tmp/foundry.zip ${FOUNDRY_VTT_TIMED_URL}
RUN unzip -d ${FOUNDRY_VTT_DIR} /tmp/foundry.zip

FROM node:16-alpine

# Set environment variables
ENV FOUNDRY_VTT_DIR=/opt/foundryvtt \
    FOUNDRY_VTT_PORT=30000 \
    FOUNDRY_VTT_START_SCRIPT=/usr/local/bin/start-foundryvtt

# Copy files from build stage
COPY --from=build ${FOUNDRY_VTT_DIR} ${FOUNDRY_VTT_DIR}
COPY ./scripts/start-foundryvtt.sh ${FOUNDRY_VTT_START_SCRIPT}

# Change working directory
WORKDIR ${FOUNDRY_VTT_DIR}

# Expose port
EXPOSE ${FOUNDRY_VTT_PORT}

# Set healthcheck
HEALTHCHECK --interval=5s --timeout=3s \
  CMD wget -qO- http://localhost:${FOUNDRY_VTT_PORT}/ || exit 1

# Start Foundry VTT
CMD ${FOUNDRY_VTT_START_SCRIPT}
