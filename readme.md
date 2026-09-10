# 💡 Waterways Navigation Lights

A lightweight Luanti/Minetest mod that adds high-intensity, blinking navigation lights for marking paths, runways, or waterways.

## ✨ Features

*   **🚨 High-Intensity Blinking:** Uses maximum light level (`14`) with a smooth 0.5-second blink cycle (On/Off).
*   **🧱 Mese Block Aesthetic:** Nodes use the standard `default_mese_block` texture with colorization, ensuring they look like solid, high-quality blocks rather than flat items.
*   **🚫 No Physics Interference:** Unlike sand or gravel, these blocks are static. They will **not** sink, fall, or interfere with player flight mechanics or movement.
*   **🎨 Two Variants:**
    *   🔴 **Red Light:** Standard port-side/navigation marker.
    *   🟢 **Green Light:** Standard starboard-side/navigation marker.
*   **🧹 Cleanup Tool:** Includes a chat command to easily remove all placed lights in a large radius.

## 📦 Installation

1.  Download the latest release or clone this repository.
2.  Place the folder named `waterways` into your Minetest/Luanti `mods/` directory.
3.  Enable the mod in your world settings.
4.  Restart the world/server.

##  Usage

### Placing Lights
*   Select **Red Mese Light** or **Green Mese Light** from your creative inventory.
*   Right-click on any solid block or in the air to place.
*   The light will immediately begin blinking upon placement.

### Removing Lights
*   **Manual:** Break the node with any tool or by hand.
*   **Bulk Removal:** Type `/removewaterways` in the chat. This removes all `waterways` nodes within a 100-node radius of your current position. *(Requires `interact` privilege)*

## ⚙️ Technical Details

*   **Light Source:** `14` (Maximum brightness in Minetest).
*   **Blink Rate:** 0.5 seconds On / 0.5 seconds Off.
*   **Dependencies:** `default` (Standard Minetest Game).
*   **Node Names:**
    *   `waterways:red` / `waterways:red_off`
    *   `waterways:green` / `waterways:green_off`

## 📜 License & Credits

*   **Code:** MIT
*   **Textures:** Derived from Minetest Game default textures (CC BY-SA 3.0).
*   **Author:** ronrob-lu

---

*Created for precise, reliable visual signaling in Luanti/Minetest.*
