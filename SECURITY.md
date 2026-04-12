# Security Notes

This project is a static Flutter Web marketing site. Most meaningful security controls depend on the hosting layer, not only on the Flutter code.

## Current App-Side Posture

- No authentication, sessions, API keys, or server-side secrets are stored in the client.
- Browser storage is only used for language preference (`dl_lang`) and cookie banner state (`dl_cookie_consent`).
- External links are limited in app code to `https` and `mailto` schemes.
- Flutter bootstrap is loaded locally through [web/index.html](web/index.html) and [web/flutter_bootstrap.js](web/flutter_bootstrap.js).

## Recommended Hosting Headers

Configure these at the CDN / reverse proxy / hosting platform level:

```text
Strict-Transport-Security: max-age=31536000; includeSubDomains; preload
Content-Security-Policy: default-src 'self'; base-uri 'self'; object-src 'none'; frame-ancestors 'none'; img-src 'self' data: blob:; style-src 'self' 'unsafe-inline' https://fonts.googleapis.com; font-src 'self' https://fonts.gstatic.com data:; script-src 'self'; connect-src 'self'; worker-src 'self' blob:; manifest-src 'self'
Referrer-Policy: strict-origin-when-cross-origin
X-Content-Type-Options: nosniff
X-Frame-Options: DENY
Permissions-Policy: camera=(), microphone=(), geolocation=(), payment=(), usb=()
Cross-Origin-Opener-Policy: same-origin
Cross-Origin-Resource-Policy: same-origin
```

## Notes About CSP

- If Google Fonts remain enabled through the `google_fonts` package, `style-src` and `font-src` may need the Google Fonts origins shown above.
- If the site is migrated to fully local fonts, remove those external origins from CSP.
- If future features add APIs, analytics, tag managers, chat widgets, or embedded media, `connect-src`, `script-src`, `frame-src`, or `img-src` will need to be reviewed.

## Operational Checklist

- Serve only over HTTPS.
- Disable directory listing on the host.
- Keep dependencies updated with `flutter pub outdated` and regular upgrades.
- Avoid adding any secrets to Flutter Web code because all client code is public after build.
- Review any new external script, widget, analytics tag, or iframe before deployment.
- If forms or APIs are added later, implement server-side validation, rate limiting, and abuse protection there.