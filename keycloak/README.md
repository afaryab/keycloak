# Keycloak Tailwind Theme

A modern, production-ready Keycloak theme built with Tailwind CSS.

## Features

- ✨ Modern Tailwind CSS design
- 🎨 Dynamic color theming (9 color options)
- 🌍 Full internationalization support
- 🔐 Complete authentication screens (login, register, password reset, etc.)
- 👤 User account management theme
- 📱 Responsive design
- ♿ Accessible components
- 🎯 Environment-based customization

## Theme Types

This theme includes:

1. **Login Theme** - Authentication screens (login, register, password reset, 2FA, etc.)
2. **Account Theme** - User profile and account management screens
3. **Admin Console** - Uses default Keycloak theme (as per design requirements)

## Environment Variables

You can customize the theme using the following environment variables:

### Logo Path
Set a custom logo path:
```bash
KC_THEME_LOGO_PATH=img/custom-logo.png
```

### Theme Color
Choose from the following color schemes:
```bash
KC_THEME_COLOR=emerald  # Default
# Options: blue, green, emerald, red, purple, pink, indigo, yellow, orange
```

### Background Image
Set a custom background image:
```bash
KC_THEME_BG_IMAGE=img/custom-background.svg
```

## Usage with Docker

### Build the Image
```bash
docker build -t keycloak-tailwind .
```

### Run with Custom Configuration
```bash
docker run -d \
  -e KEYCLOAK_ADMIN=admin \
  -e KEYCLOAK_ADMIN_PASSWORD=admin \
  -e KC_THEME_COLOR=blue \
  -e KC_THEME_LOGO_PATH=img/my-logo.png \
  -p 8080:8080 \
  keycloak-tailwind start-dev
```

### With Docker Compose
```yaml
services:
  keycloak:
    image: keycloak-tailwind
    environment:
      KEYCLOAK_ADMIN: admin
      KEYCLOAK_ADMIN_PASSWORD: admin
      KC_THEME_COLOR: purple
      KC_THEME_LOGO_PATH: img/logo.png
    ports:
      - "8080:8080"
```

## Development

### Prerequisites
- Node.js 18+
- npm

### Install Dependencies
```bash
cd keycloak
npm install
```

### Build CSS
```bash
npm run build
```

### Watch Mode (Development)
```bash
npm run dev
```

## Theme Structure

```
themes/tailwind-theme/
├── login/                      # Login theme
│   ├── messages/              # Translations
│   │   └── messages_en.properties
│   ├── resources/
│   │   ├── css/
│   │   ├── js/
│   │   └── img/
│   ├── template.ftl           # Base template
│   ├── login.ftl              # Login page
│   ├── register.ftl           # Registration page
│   └── ...                    # Other auth pages
├── account/                    # Account theme
│   ├── messages/              # Translations
│   ├── resources/
│   ├── template.ftl           # Base template
│   ├── account.ftl            # Profile page
│   ├── password.ftl           # Password page
│   └── sessions.ftl           # Sessions page
└── theme.properties           # Theme configuration
```

## Customization

### Adding Custom Colors

Edit `themes/tailwind-theme/login/template.ftl` or `themes/tailwind-theme/account/template.ftl` to add new color schemes in the CSS variables section.

### Adding Translations

Add new message files in the `messages/` directory:
- `messages_en.properties` - English (default)
- `messages_es.properties` - Spanish
- `messages_fr.properties` - French
- etc.

### Custom Logo

1. Place your logo in `themes/tailwind-theme/login/resources/img/`
2. Set the environment variable: `KC_THEME_LOGO_PATH=img/your-logo.png`

## Color Schemes

The theme supports the following color schemes out of the box:

- **Emerald** (default) - Fresh and modern green
- **Blue** - Professional and trustworthy
- **Green** - Natural and calming
- **Purple** - Creative and unique
- **Red** - Bold and energetic
- **Indigo** - Deep and sophisticated
- **Pink** - Friendly and approachable
- **Yellow** - Bright and optimistic
- **Orange** - Warm and inviting

Each color automatically generates all necessary shades (50-900) for consistent theming.

## Internationalization

All text is externalized using Keycloak's message system. To add a new language:

1. Create `messages_XX.properties` in the `messages/` directory
2. Translate all keys from `messages_en.properties`
3. The theme will automatically detect and use the appropriate language

## Browser Support

- Chrome/Edge (latest)
- Firefox (latest)
- Safari (latest)
- Mobile browsers (iOS Safari, Chrome Mobile)

## License

This theme is provided as-is for use with Keycloak.

## Credits

Built with:
- [Tailwind CSS](https://tailwindcss.com/)
- [Keycloak](https://www.keycloak.org/)
- [Inter Font](https://rsms.me/inter/)

