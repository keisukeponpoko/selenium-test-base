#seleniumテスト構築用レポジトリ
[SeleniumサーバもDockerで。「Docker Selenium」レビュー](http://knowledge.sakura.ad.jp/tech/2631/)を参考にしました。

##Rubyのインストール
[rbenv を利用した Ruby 環境の構築](http://dev.classmethod.jp/server-side/language/build-ruby-environment-by-rbenv/)
注意)ruby -v　と　rbenv --version が一緒じゃなかったために、エラーが起きた時あり。上のURLにある

```
$ echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
$ source ~/.bash_profile
```
を行えば問題ないはずだが、bashでなくzshを使ってる場合等、注意。

```
$ echo 'eval "$(rbenv init -)"' >> ~/. zshrc
$ source ~/. zshrc
```

##GitからCloneして、bundle install
```
$ git clone selenium-ruby
$ cd selenium-ruby
$ gem install bundler
$ bundle install
```

##Docker for Mac のインストール
[Public BetaになったDocker for Macを使ってみる](http://dev.classmethod.jp/server-side/docker-server-side/using-docker-for-mac-public-beta/)


##Dockerコンテナを追加
下記を実行。
[詳しい説明](https://github.com/elgalu/docker-selenium/blob/master/docs/docker-compose.md)

```
$ docker pull elgalu/selenium #upgrades to latest if a newer version is available
$ docker run -d --name=grid -p 4444:24444 -p 5900:25900 \
    -e TZ="Asia/Tokyo" --shm-size=1g elgalu/selenium
$ docker exec grid wait_all_done 30s
```

##Test実行！
```
$ ruby test.rb
```
成功すれば、ルートフォルダにfirefox.pngができて、キャプチャーが出きているはず。

##VNCで確認。

```
$ brew install Caskroom/cask/real-vnc
```
localhost:5900 で接続可能。  
実行したら、動きが見える！
