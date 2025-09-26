# Build stage for theme assets
FROM node:18 as build

WORKDIR /build
# Copy theme and dependencies
COPY keycloak/themes/tailwind-theme ./tailwind-theme
COPY keycloak/package.json keycloak/package-lock.json ./
RUN npm install
COPY keycloak/tailwind.config.js ./
COPY keycloak/src ./src
RUN npm run build || true

# Final Keycloak image
FROM quay.io/keycloak/keycloak:24.0

# Copy built theme to Keycloak themes directory
COPY --from=build /build/tailwind-theme /opt/keycloak/themes/tailwind-theme

ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
CMD ["start"]
