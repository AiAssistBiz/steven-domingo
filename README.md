# Steven Domingo — Visual Content Hub
### Self-editing site with Supabase CMS + Vercel hosting

No code needed after setup. Add, edit, and remove cards from `/admin`.

---

## Setup (one time, ~15 minutes)

### Step 1 — Create your Supabase project
1. Go to **supabase.com** → Sign up free → New project
2. Name it anything (e.g. "steven-domingo")
3. Set a strong database password → Create project
4. Wait ~2 minutes for it to spin up

### Step 2 — Run the database schema
1. In your Supabase dashboard → **SQL Editor** → New query
2. Open `supabase-schema.sql` from this folder
3. Copy the entire contents → Paste into the editor → **Run**
4. You should see "Success" — your `cards` table is created

### Step 3 — Get your Supabase keys
1. In Supabase → **Project Settings** → API
2. Copy your **Project URL** (looks like `https://xxxx.supabase.co`)
3. Copy your **anon / public** key (long string starting with `eyJ...`)

### Step 4 — Add your keys to the site files
Open both `index.html` and `admin.html` in any text editor.
Find these two lines near the top of the `<script>` section in each file:

```js
const SUPABASE_URL = 'YOUR_SUPABASE_URL';
const SUPABASE_ANON_KEY = 'YOUR_SUPABASE_ANON_KEY';
```

Replace both placeholder values with your actual keys. Do this in **both files**.

### Step 5 — Create your admin account
1. In Supabase → **Authentication** → Users → **Add user**
2. Enter your email and a password
3. This is what you'll use to log into `/admin`

### Step 6 — Deploy to Vercel
**Option A — Drag and drop (easiest)**
1. Go to **vercel.com** → New Project
2. Drag this entire folder into the import area
3. Click Deploy

**Option B — CLI**
```bash
npm i -g vercel
cd this-folder
vercel
```

Your site goes live at a `.vercel.app` URL.

**Option C — GitHub (recommended for ongoing use)**
1. Push this folder to a GitHub repo
2. Import from vercel.com/new
3. Auto-deploys every time you push a change

---

## Using the admin

| URL | What it does |
|-----|-------------|
| `yoursite.com` | Public site visitors see |
| `yoursite.com/admin` | Your content manager |

### In `/admin` you can:
- **Add** video, photo, graphic, or link cards
- **Edit** any card — change title, subtitle, embed URL, image, overlay text
- **Publish / Unpublish** cards without deleting them (draft mode)
- **Delete** cards permanently
- **Mark as Featured** — appears in the "Start here" section at the top
- **Filter** by category or card type in the sidebar

### Adding a video
Paste the **embed URL** (not the watch URL) into the Embed URL field:
- YouTube Shorts: `https://www.youtube.com/embed/VIDEO_ID`
- Vimeo: `https://player.vimeo.com/video/VIDEO_ID`
- TikTok: find the oEmbed iframe `src` from the share → embed menu

### Adding a photo
Upload your image to any CDN (Cloudinary free tier works great, or Supabase Storage) and paste the public URL.

### Adding a graphic card
Type a quote or stat. Pick a background color. It renders as a styled text card — great for callouts or context between videos.

### Adding a link card
Destination URL + emoji icon + background color. Shows as a tappable card that opens the link.

---

## File structure
```
/
├── index.html          ← public-facing site
├── admin.html          ← content management interface
├── supabase-schema.sql ← run once in Supabase SQL editor
├── vercel.json         ← Vercel routing config
└── README.md           ← this file
```

No build step. No npm. No framework. Plain HTML + vanilla JS.
