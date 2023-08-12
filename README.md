# s3-manipulator.rb

🧉🧉🧉 RubyでS3を操作するためのスクリプトです！  

## 開発環境の構築方法

最初にAWS CLIをインストールします。  
<https://docs.aws.amazon.com/ja_jp/cli/latest/userguide/install-cliv2.html>  

以下のコマンドを実行して、AWS CLIのバージョンが表示されればOKです。  

```shell
aws --version
```

認証情報を設定します。  

```shell
aws configure
```

以下のように聞かれるので、適宜入力してください。

```shell
AWS Access Key ID [None]: アクセスキーID
AWS Secret Access Key [None]: シークレットアクセスキー
Default region name [None]: リージョン名
Default output format [None]: json
```

---

タグをプッシュすると、GitHub Actionsが実行されて、スタックがデプロイされます。  

| Name | Value |
| --- | --- |
| STACK_NAME | プロジェクト名 |
| AWS_ACCESS_KEY_ID | アクセスキーID |
| AWS_SECRET_ACCESS_KEY | シークレットアクセスキー |
| AWS_REGION | リージョン名 |
| DOTENV | .envファイルの中身 |

## 実行方法

```shell
# Ref: https://docs.aws.amazon.com/ja_jp/AWSCloudFormation/latest/UserGuide/using-cfn-cli-creating-stack.html
aws cloudformation deploy \
    --stack-name <stack-name> \
    --template <template>

# 例)
aws cloudformation deploy \
    --stack-name s3-manipulator-rb \
    --template ./template.yml
```

`Output`で指定した値を取得するには、以下のコマンドを実行します。  

```shell
aws cloudformation describe-stacks --stack-name <stack-name> --query <query> --output <output> --no-cli-pager

# 例) バケット名を取得
aws cloudformation describe-stacks --stack-name s3-manipulator-rb --query "Stacks[].Outputs[?OutputKey=='S3BucketName'].OutputValue" --output text --no-cli-pager
```

```shell
aws s3 ls s3://<S3BucketName>

# 例)
aws s3 ls s3://s3-manipulator-rb-s3-bucket
```

削除するには、以下のコマンドを実行します。  

```shell
aws cloudformation delete-stack --stack-name <stack-name>

# 例)
aws cloudformation delete-stack --stack-name s3-manipulator-rb
```

## S3の操作

RubyでS3を操作する簡単なコードを用意しています。  
以下のコマンドを実行してください。  

```shell
ruby ./main.rb
```

このプログラムを実行する前に、`.env.example`を`.env`にリネームして、環境変数を設定してください。  
