#!/bin/bash

echo "パスワードマネージャーへようこそ！"

FILE=database.txt.gpg

# 暗号化ファイルが存在しない場合は作成
if [ ! -e $FILE ]; then
    touch database.txt
    cat passphrase.txt | gpg --passphrase-fd 0 --batch --yes -c database.txt
    shred -u database.txt
fi

while [ true ]
do
    # 変数を初期化
    menu=0
    service=0
    user=0
    password=0
    info=0

    read -p  "次の選択肢から入力してください(Add Password/Get Password/Exit)：" menu

    case  "$menu"  in
        "Add Password" )
            read -p "サービス名を入力してください：" service
            read -p "ユーザー名を入力してください：" user
            read -p "パスワードを入力してください：" password
            info="サービス名:${service} ユーザー名:${user} パスワード:${password}" 
            
            # ファイルを復号
            # GPG パスフレーズを渡し、バッチ処理で database.txt.gpg を復号、database.txt に出力
            cat passphrase.txt | gpg --passphrase-fd 0 --batch -q --output database.txt --decrypt database.txt.gpg

            # 入力された値をファイルに追記
            echo $info >> database.txt
            
            # ファイルを暗号化
            # GPG パスフレーズを渡して、バッチ処理で database.txt を暗号化した database.txt.gpg 作成
			# database.txt.gpg がすでに存在しているというエラーを無視して上書きするために --yes を記述
            cat passphrase.txt | gpg --passphrase-fd 0 --batch --yes -c database.txt
            
            # database.txt を上書きして安全に削除
            shred -u database.txt

            echo -e "\nパスワードの追加は成功しました。"
        ;;
        
        "Get Password" )
            read -p "サービス名を入力してください：" service

            # ファイルを復号
            # GPG パスフレーズを渡し、バッチ処理で database.txt.gpg を復号、database.txt に出力
            cat passphrase.txt | gpg --passphrase-fd 0 --batch -q --output database.txt --decrypt database.txt.gpg
            
            # ファイルから該当する文字が含まれる行を検索して取得
            info=$(fgrep "サービス名:${service}" database.txt)

            # ファイルを暗号化
            # GPG パスフレーズを渡して、バッチ処理で database.txt を暗号化した database.txt.gpg 作成
            cat passphrase.txt | gpg --passphrase-fd 0 --batch --yes -c database.txt

            # database.txt を削除
            shred -u database.txt

            # 変数が空（=該当する行を取得できなかった）の場合
            if [[ -z $info ]] ; then
                echo "そのサービスは登録されていません。"
            
            else
                # スペースを改行に変えて出力
                echo -e $info"\n" | tr ' ' '\n'
            fi
        ;;

        "Exit" )
            echo "Thank you!"
            break
        ;;

        * )
            # 選択がどれにも当てはまらない場合
            echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"
        ;;
    esac

done