# Alur Kerja Program Kegiatan

Diagram berikut menggambarkan alur kerja lintas divisi dalam menjalankan sebuah program kegiatan, mulai dari perencanaan awal hingga evaluasi pasca kegiatan.

```mermaid
flowchart TD
    %% ===== STYLING =====
    classDef mgmt fill:#e1bee7,stroke:#8e24aa,stroke-width:2px,color:#000;
    classDef core fill:#bbdefb,stroke:#1976d2,stroke-width:2px,color:#000;
    classDef ext fill:#c8e6c9,stroke:#388e3c,stroke-width:2px,color:#000;
    classDef supp fill:#ffe0b2,stroke:#f57c00,stroke-width:2px,color:#000;

    %% ===== TAHAP 1 =====
    subgraph T1["🔹 TAHAP 1: PERENCANAAN & SURVEI LAPANGAN"]
        direction LR
        M1["CEO + COO +<br>Creative Media Director"]:::mgmt -->|"Buat kerangka<br>& strategi program"| P1["Divisi<br>Creative Program"]:::core
        P1 -->|"Minta survei<br>lokasi"| S1["Divisi<br>Surveyor"]:::core
        S1 -->|"Kembalikan data<br>& rekomendasi"| P1
    end

    %% ===== TAHAP 2 =====
    subgraph T2["🔹 TAHAP 2: PERSIAPAN SUMBER DAYA (DANA, BARANG, KONTEN)"]
        direction TB
        P2["Divisi<br>Creative Program"]:::core -->|"Kirim daftar<br>kebutuhan barang"| L2["Divisi<br>Logistik"]:::supp
        P2 -->|"Kirim brief<br>cerita program"| D2["Creative Media<br>Director"]:::mgmt
        D2 --> C2["Co-Director &<br>Media Specialist"]:::supp
        C2 --> K2["Tim Konten<br>& Dokumentasi"]:::supp
        K2 -->|"Kirim materi<br>visual & narasi"| F2["Divisi<br>Fundraising"]:::ext
        K2 -->|"Kirim materi<br>visual & narasi"| H2["Divisi<br>Humas"]:::ext
    end

    %% ===== TAHAP 3 =====
    subgraph T3["🔹 TAHAP 3: EKSEKUSI LAPANGAN (HARI-H)"]
        direction LR
        T3_core["🗂️ TIM LAPANGAN<br>(Eksekusi Bareng)"]:::core
        P3["Divisi<br>Creative Program"]:::core -->|"Pimpin jalannya<br>acara"| T3_core
        S3["Divisi<br>Surveyor"]:::core -->|"Verifikasi<br>penerima manfaat"| T3_core
        L3["Divisi<br>Logistik"]:::supp -->|"Distribusi barang<br>& konsumsi"| T3_core
        D3["Tim<br>Dokumentasi"]:::supp -->|"Shooting &<br>wawancara"| T3_core
        M3["COO"]:::mgmt -->|"Memantau<br>jalannya acara"| T3_core
    end

    %% ===== TAHAP 4 =====
    subgraph T4["🔹 TAHAP 4: EVALUASI & PELAPORAN (PASCA KEGIATAN)"]
        direction TB
        T4_core["🗂️ TIM LAPANGAN"]:::core -->|"Buat laporan<br>capaian"| E4["COO + CEO"]:::mgmt
        T4_core -->|"Serahkan footage<br>& data mentah"| C4["Co-Director<br>& Editor"]:::supp
        C4 -->|"Kirim hasil edit<br>& narasi"| FH4["Fundraising &<br>Humas"]:::ext
        FH4 -->|"Buat laporan<br>pertanggungjawaban"| R4["📄 Laporan<br>Donatur"]:::ext
        FH4 -->|"Buat konten<br>publikasi"| M4["📱 Publikasi<br>Media Sosial"]:::ext
        E4 -->|"Hasil evaluasi<br>buat perbaikan"| N4["🔄 Program<br>Berikutnya"]:::mgmt
    end

    %% ===== ALUR PANAH ANTAR TAHAP =====
    T1 -->|"Rancangan program<br>sudah matang"| T2
    T2 -->|"Semua kebutuhan<br>sudah siap"| T3
    T3 -->|"Kegiatan selesai<br>& data terkumpul"| T4
```

---

### 📝 _PENJELASAN SINGKAT SETIAP TAHAP:_

| Tahap | Nama | Inti Kerjasama |
| --- | --- | --- |
| **1** | Perencanaan & Survei | CEO/COO/Creative Media Director bikin kerangka ➡️ Creative Program bikin rancangan detail ➡️ Surveyor turun lapangan cek lokasi ➡️ hasil survei dipakai buat revisi rancangan. |
| **2** | Persiapan Sumber Daya | Creative Program kirim kebutuhan ke Logistik (barang) & ke Creative Media Director (brief) ➡️ Co-Director/Media Specialist atur produksi konten ➡️ Tim Konten/Dokumentasi bikin materi ➡️ materi dikasih ke Fundraising (buat galang dana) & Humas (buat jalin mitra). |
| **3** | Eksekusi Lapangan | Semua tim inti (Program, Surveyor, Logistik, Dokumentasi) bergerak bareng di lapangan, dipimpin Program Lead, dimonitor COO. |
| **4** | Evaluasi & Pelaporan | Tim Lapangan bikin laporan ke CEO/COO ➡️ Tim Lapangan juga serahin footage ke Co-Director/Editor ➡️ hasil edit + narasi dikasih ke Fundraising & Humas ➡️ mereka bikin laporan donatur & publikasi medsos ➡️ CEO/COO pakai evaluasi buat program berikutnya. |
