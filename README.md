# Chatwork Task Action

[![actionlint](https://github.com/okuzawats/chatwork-task-action/actions/workflows/actionlint.yml/badge.svg)](https://github.com/okuzawats/chatwork-task-action/actions/workflows/actionlint.yml)

[![yamllint](https://github.com/okuzawats/chatwork-task-action/actions/workflows/yamllint.yml/badge.svg)](https://github.com/okuzawats/chatwork-task-action/actions/workflows/yamllint.yml)

[![rubocop](https://github.com/okuzawats/chatwork-task-action/actions/workflows/rubocop.yml/badge.svg)](https://github.com/okuzawats/chatwork-task-action/actions/workflows/rubocop.yml)

Chatworkのタスクを作成するActionです。指定したルームの、指定したユーザーにタスクを割り当てます。

## 使い方

以下のように使用します。

```yml
- uses: okuzawats/chatwork-task-action@v1.0 # またはコミットハッシュを使用してください。
  with:
    # ChatworkのAPIキー
    apiToken: "${{ secrets.API_KEY }}"
    # タスクを作成するルームID
    roomId: "${{ secrets.ROOM_ID }}"
    # タスクを割り当てるユーザーID（カンマ区切りで複数指定可能）
    userIds: "${{ secrets.USER_ID }}"
    # タスク本文
    body: "get some milk for me."
```

## APIトークン

[Chatwork API へようこそ！](https://developer.chatwork.com/docs)から「API の利用申請」を行い、発行されたトークンです。本Actionで作成されるタスクは、このトークンを発行したユーザーによって作成されたタスクとなります。このトークンを作成したユーザーは、タスクを作成するルームのメンバーであり、ルームで投稿する権限を持つ必要があります。

## ルームID

以下から取得できるIDです。

- チャットの説明 > グループチャットの設定 > チャット情報 > 画面下部のルームID

## ユーザーID

自分宛に返信した時に `aid=XXXXXXX` と表示される `XXXXXXX` の部分のIDです。

## メッセージ記法

`body` ではメッセージ記法を利用可能です。Chatworkのメッセージ記法については、以下を参照してください。

- [メッセージ記法について](https://developer.chatwork.com/docs/message-notation)
