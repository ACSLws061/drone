# 共通プログラムを用いた開発の手順

* github上にアカウントを作り，関口先生にアカウントを連絡する．
* 共通プログラムのcollaborator へのinvitationが送られてくるので承認する．
* git clone する．
* localで開発用ブランチを作る．
* 日々の変更をadd, commitで記録しながら開発を進める．
* ちゃんと動くようになったらリモートにpushする（　git push origin branch-name　）
* github上でpull requestをおこなう．


# 用語集

## プログラムの中で使われる用語

|単語 | 意味 |
|---|---|
|agent| Drone classのインスタンス |
| obj | class instance |
|self | "agent" など obj : sensor class内でのみ使って良い|
|param | parameter |
|f*** | *** 用フラグ |

## プロパティに設定するクラスについて

estimatorのサブクラスEKFを例に説明する．

単体でクラスインスタンスを作成する場合
estimator = EKF(agent.model,param);
と設定するがagentに推定器を設定する場合はagentのmethod であるset_propertyを用いる
agent.set_property("estimator",Param);
この時，Paramは
Param = struct('type','EKF','name','ekf','param',param);
となる．
EKFの第一引数であるagent.modelはset_estimatorの中で設定される．
EKFの第二引数であるparamはParamのparamフィールドに設定するものと同じ．
set_estimatorの場合typeやnameフィールドを持たせるが，typeでEKFというクラス名を指定し，
nameは複数の推定器を設定する場合に参照するための文字列となる．

単体で作成した場合は
estimator 自体がEKFクラスのインスタンスであるが，
set_propertyを使った場合
agent.estimator.ekf がEKFクラスのインスタンスになる．


### estimator, reference, controller プロパティ
例えばローパスフィルタをかけてから後退差分近似で速度を求める場合など，複数の処理をカスケードにおこなうことが求められるクラスがある．estimator,reference,controllerはカスケードなつながりに対応するプロパティである．
これらはnameというフィールドを持つ．nameは登録した（例えば）推定器の名前の配列
カスケードな処理はnameの配列順におこなわれる．
例：estimator.name : ['lpf','adiff']
の場合ローパスフィルタをかけた情報を使って後退差分近似微分をおこなうことを意味する．

### sensor プロパティ
sensorプロパティに設定する複数のセンサーはカスケードな関係ではなくパラレルの関係にある．
agent.sensor は必ずname, resultプロパティを持つ
nameは登録したセンサー名配列
resultは全てのセンサー値を集約したもの．ただし重複するフィールドを持つ場合上書きされる点に注意

> agent.sensor.rpos = RangePos_sim(agent,struct('r',1));

