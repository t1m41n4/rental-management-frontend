# Use official Node.js image for Next.js
FROM node:18


# Set the working directory inside the container
WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm install

# Copy frontend code into the container
COPY . .

# Build the Next.js application
RUN npm run build


# RUN rm -rf .next/cache && \
#     cp -r .next/standalone/* ./ && \
#     mkdir -p .next/static && \
#     mv .next/static .next/ && \
#     cp -r public ./

# Set up the production environment
RUN rm -rf .next/cache && \
    cp -r .next/standalone/* ./ && \
    mkdir -p .next/static && \
    cp -r .next/static/* .next/static/ && \
    cp -r public ./

# Expose Next.js port
EXPOSE 3000

# Run the Next.js application
CMD ["node", "server.js"]
