# Utility Settings

## Vim

```ini
# ~/.vimrc
syntax on
set background=dark
```

## Password Store

> the standard unix password manager: [https://www.passwordstore.org/](https://www.passwordstore.org/)

1. Download

```sh
sudo apt-get install pass
```

2. GPG keyring

```sh
gpg --export-secret-keys > secret.gpg

gpg --import /path/to/secret.gpg
gpg --list-keys
gpg --edit-key $USER_ID trust
```

3. Clone from GitHub

```sh
git clone git@github.com:${YOUR_NAME}/password-store.git ~/.password-store
```

## Codec

#### Covert video via FFMPEG

```sh
ffmpeg -i $INPUT_FILE -vcodec libx264 -acodec copy -preset fast -crf [18-24] $OUTPUT_FILE
```

#### MKV Merge

```sh
mkvmerge -o output.mkv input.mkv --language 0:chn --track-name 0:Chinese input.chn.srt
```

## Pandoc

```sh
sudo apt install pandoc

# markdown to word document
pandoc input.md -f gfm -t docx -o output.docx

sudo apt install fonts-noto-cjk fonts-noto-cjk-extra
sudo apt install texlive-xetex

# markdown to pdf format
pandoc input.md -f gfm --pdf-engine=xelatex -V "mainfont:NotoSansCJK-Regular.ttc" -V 'monofont:NotoSansCJK-Regular.ttc' -o output.pdf
```

