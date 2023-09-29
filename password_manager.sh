#!/bin/bash

echo "パスワードマネージャーへようこそ！"

while [ true ]
do
    # 変数を初期化
    menu=0
    service=0
    user=0
    password=0
    info=0

    read -p  "次の選択肢から入力してください(Add Password/Get Password/Exit)：" menu

    if [[ $menu = "Add Password" ]] ; then 
        read -p "サービス名を入力してください：" service
        read -p "ユーザー名を入力してください：" user
        read -p "パスワードを入力してください：" password

        info="サービス名:${service} ユーザー名:${user} パスワード:${password}" 
        # ファイルに出力
        echo $info >> database.txt

        echo -e "\nパスワードの追加は成功しました。"

    elif [[ $menu = "Get Password" ]] ; then
        read -p "サービス名を入力してください：" service
        # ファイルから該当するWordが含まれる行を検索
        info=$(fgrep "サービス名:${service}" database.txt)

        # 変数が空（=該当する行を取得できなかった）の場合
        if [[ -z $info ]] ; then
            echo "そのサービスは登録されていません。"
        
        else
            # スペースを改行に変えて出力
            echo -e $info"\n" | tr ' ' '\n'
        fi
    elif [[ $menu = "Exit" ]] ; then
        echo "Thank you!"
        break

    else
        echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"
    fi
done