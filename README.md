# kong-handon-101

Webinar資料： \
https://speakerdeck.com/ipppppei/sabamokuraudomobu-yao-rokarupcwoshi-tute-kong-gatewaywogou-zhu-sitemiyou

## 01-build-gw.sh
以下を行います。
- Docker Networkの作成
- Kong Gateway用DBの起動
- Kong Gateway用DBの初期化
- Kong Gatewayの起動
- ブラウザでKong Managerへアクセス

## 02-define-service-route.sh
以下を行います。
- Serviceの作成
- Routeの作成
- ブラウザでKong ManagerのService、Routeの設定を表示
- ブラウザでProxy経由でServiceへアクセス

## 03-ratelimiting.sh
以下を行います。
- ServiceにRate Limiting Pluginを設定する

## 04-ratelimiting-test.sh
以下を行います。
- 設定したRate Limiting Pluginの動作確認

## 05-keyauth.sh
以下を行います。
- RouteにKey Auth Pluginを設定する
- 設定したKey Auth Pluginの動作確認

## 06-consumer.sh
以下を行います。
- Consumerの作成
- 作成したConsumerに鍵認証のAPIキーを設定
- 作成したConsumerで鍵認証の動作確認

## 11-deck-dump.sh
以下を行います。
- deckコマンドによるGatewayの設定のdump（標準出力）
- deckコマンドによるGatewayの設定のdump（ファイル出力）

## 12-deck-restore.sh
以下を行います。
- deckコマンドによるGatewayの設定の初期化
- deckコマンドによるGatewayの設定のリストア

## 99-remove-all.sh
以下を行います。
- Kong Gateway、Kong Gateway用DBの削除（コンテナの削除）
- 作成したDocker Networkの削除
