# 🧩 Auto Install Pterodactyl & WHM

Script Termux serbaguna untuk meng-install:
- 🟦 **Pterodactyl Panel**
- 🟪 **WHM / cPanel**
- 🎨 Tampilan RGB GOXDILL
- 🔧 Auto dependency installer (Termux)
- 💠 Anti-error & struktur rapi

Repository:  
👉 https://github.com/anugraww/autoinstalpanel

---

## 🎨 Fitur Script

| Fitur | Status |
|------|--------|
| Auto Install Pterodactyl | ✔️ |
| Auto Install WHM/cPanel | ✔️ |
| RGB Gradient Banner GOXDILL | ✔️ |
| Auto Install Package Termux | ✔️ |
| Clean UI Menu | ✔️ |
| Support VPS Root Access | ✔️ |
| SSH Auto Login (via sshpass) | ✔️ |

---

## 📦 Persyaratan

### **📱 Di Termux**
Pastikan kamu sudah:
- Termux versi terbaru
- Internet stabil
- Izin storage (opsional)

### **🖥 Di VPS**
**WHM/cPanel** wajib:
- OS: AlmaLinux 8/9, RockyLinux 8/9
- RAM minimal 2GB (recommended 4GB+)
- Fresh VPS (belum ada panel lain)
- Port 2087 terbuka

**Pterodactyl** wajib:
- Rocky/AlmaLinux / Ubuntu
- RAM minimal 2GB
- Support Docker (opsional)

---

## 🚀 Cara Install Script

```bash
pkg update && pkg upgrade -y
pkg install git -y
git clone https://github.com/anugraww/autoinstalpanel
cd autoinstalpanel
chmod +x goxdill-installer.sh
bash goxdill-installer.sh
