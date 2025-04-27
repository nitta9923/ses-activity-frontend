# 公式Nodeイメージ（軽量版）
FROM node:20

# 作業ディレクトリ作成
WORKDIR /app

# package.jsonとlockファイルをコピー
COPY package.json package-lock.json ./
# lockファイルやnode_modulesは除去しておく 依存関係のインストール
# 依存関係うまくいかないのでDocke側ではinstallしない
RUN npm ci

# ソースコードをコピー
COPY . .

# Viteの開発サーバを起動（本番用ならビルドしてserve）
CMD ["npm", "run", "dev", "--", "--host", "--force"]
