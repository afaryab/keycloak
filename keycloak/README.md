# Keycloak Tailwind Theme

A modern, responsive Keycloak theme built with Tailwind CSS.

## Features

- 🎨 Modern, clean design with Tailwind CSS
- 📱 Fully responsive layout
- ♿ Accessible components
- 🌙 Dark mode support (system preference)
- 🎯 Smooth animations and transitions
- 🔒 Professional login/registration forms

## Setup Instructions

### 1. Install Dependencies (Optional - for development)

If you want to customize the CSS further:

```bash
cd keycloak
npm install
```

### 2. Build CSS (Optional)

To rebuild the Tailwind CSS:

```bash
cd keycloak
npm run build
```

For development with auto-rebuild:

```bash
cd keycloak
npm run build-css
```

### 3. Restart Keycloak

The theme is automatically mounted when you restart Keycloak:

```bash
docker-compose restart keycloak
```

### 4. Configure Keycloak to Use the Theme

1. Go to your Keycloak admin console: `http://localhost:9999`
2. Login with admin/admin
3. Navigate to **Realm Settings** > **Themes**
4. Set **Login theme** to `tailwind-theme`
5. Click **Save**

## Theme Structure

```
keycloak/
├── themes/
│   └── tailwind-theme/
│       ├── theme.properties          # Theme configuration
│       └── login/
│           ├── login.ftl            # Login page template
│           ├── register.ftl         # Registration page template
│           ├── template.ftl         # Base template
│           └── resources/
│               ├── css/
│               │   ├── tailwind.css # Main Tailwind styles
│               │   └── login.css    # Keycloak overrides
│               ├── js/              # JavaScript files
│               └── img/             # Images and icons
├── src/
│   └── input.css                    # Tailwind source file
├── package.json                     # NPM dependencies
├── tailwind.config.js              # Tailwind configuration
└── README.md                        # This file
```

## Customization

### Colors

The theme uses CSS custom properties for easy color customization. Edit the `:root` section in `login/resources/css/tailwind.css`:

```css
:root {
  --primary-color: #3b82f6;        /* Blue-500 */
  --primary-dark: #1d4ed8;         /* Blue-700 */
  --secondary-color: #6b7280;      /* Gray-500 */
  /* ... more colors */
}
```

### Fonts

The theme uses Inter font from Google Fonts. To change it, update the `@import` statement and the CSS custom properties.

### Layout

The main layout is defined in `template.ftl`. The individual page layouts are in their respective `.ftl` files.

## Available Pages

Currently themed pages:
- ✅ Login (`login.ftl`)
- ✅ Registration (`register.ftl`)
- ✅ Base template (`template.ftl`)

Additional pages can be added by creating corresponding `.ftl` files.

## Development

### Adding New Templates

1. Create a new `.ftl` file in `keycloak/themes/tailwind-theme/login/`
2. Import the base template: `<#import "template.ftl" as layout>`
3. Use the layout macro: `<@layout.registrationLayout>`
4. Add your custom HTML with Tailwind classes

### CSS Development

1. Edit `src/input.css` for source styles
2. Run `npm run build-css` to watch for changes
3. Restart Keycloak to see changes

## Browser Support

- ✅ Chrome/Chromium (latest)
- ✅ Firefox (latest)
- ✅ Safari (latest)
- ✅ Edge (latest)

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test with Keycloak
5. Submit a pull request

## License

This theme is open source and available under the [MIT License](LICENSE).
