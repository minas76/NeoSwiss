Neo‑Swiss Demo

This is a minimal Neo‑Swiss (New Swiss) demo site implementing the design principles described in the prompt.

Files
- index.html — static HTML page (mobile-first, semantic structure)
- styles.css — mobile-first CSS implementing a responsive grid (4 → 6 → 12), fluid typography, and accessibility features

New pages
- history-overview.html — executive overview describing why Neo‑Swiss matters for enterprise brands.
- history-origins.html — origins, key figures, and Swiss masters.
- history-digital-shift.html — responsive web and CSS Grid enabling the Neo‑Swiss transformation.
- history-modern.html — how Neo‑Swiss is applied at enterprise scale (design systems, tokens, components).

How to view
- Open `index.html` in your browser. On macOS you can run:

  open index.html

 Updated content
 - The site content has been revised to focus on the history of Neo‑Swiss design, core principles, and interactive demonstrations (typographic scale, color palette, and a grid overlay toggle).
 Interactive demos
 - Toggle the grid overlay using the "Toggle grid overlay" button in the demos section to visualize the underlying column structure (JS sets the overlay to 12/6/4 based on viewport).
 - Typographic scale is shown in the "Typographic scale" demo and uses clamp() values for h1 and body.

 Notes
 - The grid overlay is a simple visual guide for demonstration and uses a semi-transparent repeating gradient. It is intended for prototyping and learning; for production you may want a developer-only overlay or a CSS inspector plugin.

License
MIT — feel free to adapt for educational use.