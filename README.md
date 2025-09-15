# Mega Delivery (Free-first)

**Flutter 3-role single-app (Customer, Rider, Admin) — 100% free SDKs only.**

## Features

- Role-based UI: Customer, Rider, Admin
- Maps: OpenStreetMap via `flutter_map` (no paid Google API)
- Location: Geolocator, manual or GPS address entry
- Auth: Google Sign-In & Email/Password (no SMS/Phone)
- Orders: Cart, checkout, manual payment proof (image upload)
- Live tracking: Rider shares location → shown on map, or "Open in Maps" fallback (opens devices's map app)
- Admin: Manage restaurants, menus, verify payments, assign riders
- Firestore-based (Spark/free tier)
- **No paid SDKs or APIs by default!** Optional features (e.g. FCM, Google Maps) marked as OPTIONAL and commented

## Free-Only Choices

- **Maps:** OpenStreetMap (via flutter_map)
- **Reverse geocode:** Nominatim (free, limited quota). UI warns about rate limits. Manual address entry is fallback.
- **Payments:** Manual proof upload only (no paid payment gateway)
- **Notifications:** Admin contacts via WhatsApp/SMS/phone manually. OPTIONAL: FCM hooks are commented and off by default.
- **Live tracking:** Rider → Firestore location update; Customer sees on OSM map or via "Open in Maps" button.
- **No phone/SMS authentication.**

## Setup

1. **Create Firebase project** (Spark plan is free)
2. Add Android app in Firebase console, download `google-services.json`, and place in `android/app/`
3. Enable Email/Password and Google Sign-In in Firebase Auth
4. Clone repo, run `flutter pub get`
5. (Recommended) Set up GitHub Actions secrets for signing & `google-services.json` (see workflow comments)
6. To build APK for Android:
    - Locally: `flutter build apk --release`
    - Or use GitHub Actions (see Actions tab after push)
    - Or use [Codemagic.io](https://codemagic.io/) — connect GitHub, click build, download APK (free for small projects)

## Firestore Security Rules

See [`firestore.rules`](firestore.rules) for basic setup. Adjust as needed for your features.

## Nominatim Quota Notice

Nominatim is free but has strict rate limits. App UI warns when using reverse geocode or autocomplete. Always provide manual address entry as fallback.

## Optional Features

- FCM push notifications (free but disabled by default; enable in code if needed)
- Cloud Functions for advanced logic (not required)
- Paid SMS/phone verification (not used here)

## Folder Structure

- `lib/` — Dart code
  - `models/` — data models
  - `services/` — Firebase/services
  - `screens/` — UI screens per role
  - `widgets/` — reusable widgets (e.g. open-in-maps button)
  - `utils/` — helpers (e.g. Haversine)
- `.github/workflows/` — CI build workflow
- `firestore.rules` — Firestore security rules

## License

MIT — use, fork, extend!

---

### Web-based APK build

You can use [Codemagic.io](https://codemagic.io/) for free (limited minutes per month) to build Flutter APKs from your GitHub repo. No local Flutter install needed.

1. Push your code to GitHub.
2. Sign in to Codemagic with GitHub.
3. Connect your repo, click "Start new build".
4. Download APK from build artifacts.

---

## TODO

- Implement full auth UI & flows
- Implement Firestore data models and screens
- Add image compression before upload
- Add tests