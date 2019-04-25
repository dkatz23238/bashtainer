import shutil
import os

if not os.path.exists("/data-backups"):
    os.mkdir("/data-backups")

foutp = shutil.make_archive("BACKUP", "zip", "/ro-dirs/git-backups/")
new_path = shutil.move(foutp, "/data-backups/BACKUP.zip")