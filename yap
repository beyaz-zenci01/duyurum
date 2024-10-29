<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Duyuru Sitesi</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        h1 {
            color: #333;
        }
        ul {
            list-style-type: none;
            padding: 0;
        }
        li {
            margin-bottom: 20px;
            padding: 10px;
            border: 1px solid #ddd;
        }
        form {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <h1>Duyurular</h1>
    <form id="announcementForm">
        <input type="text" id="title" placeholder="Duyuru Başlığı" required>
        <textarea id="content" placeholder="Duyuru İçeriği" required></textarea>
        <button type="submit">Paylaş</button>
    </form>
    <ul id="announcementList"></ul>

    <script>
        // Duyuruları yükle
        function loadAnnouncements() {
            const announcements = JSON.parse(localStorage.getItem('announcements')) || [];
            const announcementList = document.getElementById('announcementList');
            announcementList.innerHTML = ''; // Mevcut duyuruları temizle
            announcements.forEach(announcement => {
                const li = document.createElement('li');
                li.innerHTML = `<h2>${announcement.title}</h2><p>${announcement.content}</p>`;
                announcementList.appendChild(li);
            });
        }

        // Duyuru ekle
        document.getElementById('announcementForm').addEventListener('submit', function(event) {
            event.preventDefault();
            const title = document.getElementById('title').value;
            const content = document.getElementById('content').value;

            const announcements = JSON.parse(localStorage.getItem('announcements')) || [];
            announcements.push({ title, content });
            localStorage.setItem('announcements', JSON.stringify(announcements));

            // Formu sıfırla ve duyuruları yenile
            document.getElementById('announcementForm').reset();
            loadAnnouncements();
        });

        // Sayfa yüklendiğinde duyuruları göster
        loadAnnouncements();
    </script>
</body>
</html>
