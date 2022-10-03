# GitをSourceTreeで使えるようにする手順

## 環境構築
Gitのインストール  
https://backlog.com/ja/git-tutorial/intro/05/

SourceTreeインストール  
https://sukkiri.jp/technologies/devtools/git/sourcetree_win.html

GitHubアカウントを作成  
https://qiita.com/ayatokura/items/9eabb7ae20752e6dc79d

##  GitHubとSourceTreeを紐づけ、GitHubにプッシュ
以下サイトに則って行う。ただし鍵生成の方法は別サイトを参照  
https://www.pc-koubou.jp/magazine/28571  
※ 鍵生成  
https://pajoca.com/sourcetree-error-ssh-sha-1/

###  -------------------------------------------------------------------------------------------------


#  使用方法

## コード ダウンロード方法 2通り
GitHubサイトより「Code」をクリックし、「git@github.com:iwamoto-magic/SQL-Server.git」を取得  
https://github.com/iwamoto-magic/SQL-Server  

1. コマンドプロント  
git clone git@github.com:iwamoto-magic/SQL-Server.git  

2. SourceTree  
ツールから「Clone」を選択  
リポジトリタイプを「git@github.com:iwamoto-magic/SQL-Server.git」  
保存先パスを「任意の場所に設定」  

## 使用上の注意点
1.ブランチを切って作業をする事  
2.コミット、プッシュをする時は、必ず 「プル」 を行う事  
