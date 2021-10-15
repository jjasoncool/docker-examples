-- --------------------------------------------------------
-- 主機:                           192.168.50.201
-- 伺服器版本:                        10.5.9-MariaDB-1:10.5.9+maria~focal - mariadb.org binary distribution
-- 伺服器作業系統:                      debian-linux-gnu
-- HeidiSQL 版本:                  11.3.0.6348
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- 傾印 FCF_careservice 的資料庫結構
DROP DATABASE IF EXISTS `FCF_careservice`;
CREATE DATABASE IF NOT EXISTS `FCF_careservice` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `FCF_careservice`;

-- 傾印  資料表 FCF_careservice.Accuser 結構
DROP TABLE IF EXISTS `Accuser`;
CREATE TABLE IF NOT EXISTS `Accuser` (
  `IDno` int(11) NOT NULL AUTO_INCREMENT,
  `Acc_name` varchar(50) DEFAULT NULL,
  `Acc_mail` varchar(80) DEFAULT NULL,
  `Acc_password` varchar(80) DEFAULT NULL,
  `Acc_title` varchar(50) DEFAULT NULL,
  `Acc_area` varchar(20) DEFAULT NULL COMMENT 'Taipei / Kaohsiung',
  `Acc_level` int(11) DEFAULT NULL COMMENT '1:管理者 2:一般使用者 3:志工 4:保險顧問 5:個案',
  `Acc_status` int(11) NOT NULL DEFAULT 1 COMMENT '1: 啟用 0:停用',
  `Acc_judge` tinyint(1) DEFAULT 0 COMMENT '評估量表窗口 0:否 1:是',
  `AdmincheckID` int(11) DEFAULT 1,
  `acc_stmapimg` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`IDno`),
  UNIQUE KEY `Acc_mail` (`Acc_mail`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4;

-- 取消選取資料匯出。

-- 傾印  資料表 FCF_careservice.Anonymous 結構
DROP TABLE IF EXISTS `Anonymous`;
CREATE TABLE IF NOT EXISTS `Anonymous` (
  `IDno` int(11) NOT NULL AUTO_INCREMENT,
  `Keydate` datetime DEFAULT NULL COMMENT '紀錄時間',
  `AdminID` int(11) DEFAULT NULL,
  `AdName` varchar(50) DEFAULT NULL,
  `del` tinyint(1) DEFAULT 0 COMMENT '0:有效資料 1:已刪除',
  `C_from` tinyint(4) DEFAULT 1 COMMENT '諮詢方式 1:電話 2:email 3:APP',
  `C_name` varchar(50) DEFAULT NULL COMMENT '姓名/暱稱',
  `C_sex` varchar(10) DEFAULT NULL COMMENT '性別',
  `C_tele` varchar(20) DEFAULT NULL COMMENT '聯絡電話(不限手機或市話)',
  `C_mail` varchar(80) DEFAULT NULL COMMENT '電子信箱',
  `Last_update` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新時間',
  PRIMARY KEY (`IDno`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24364 DEFAULT CHARSET=utf8mb4 COMMENT='線上諮詢紀錄(匿名諮詢)';

-- 取消選取資料匯出。

-- 傾印  資料表 FCF_careservice.assess_mental 結構
DROP TABLE IF EXISTS `assess_mental`;
CREATE TABLE IF NOT EXISTS `assess_mental` (
  `IDno` int(11) NOT NULL AUTO_INCREMENT,
  `Keydate` datetime DEFAULT NULL,
  `MemberID` int(11) DEFAULT NULL COMMENT '個案ID',
  `AdminID` int(11) DEFAULT NULL COMMENT '填寫者帳號ID',
  `AdName` varchar(50) DEFAULT NULL COMMENT '填寫者名稱',
  `mind_trouble` smallint(6) DEFAULT 0 COMMENT '心理困擾程度有多大，請以數字表示。(0為無困擾，10為極度困擾)',
  `life_child` tinyint(1) DEFAULT 0 COMMENT '照顧小孩問題',
  `life_live` tinyint(1) DEFAULT 0 COMMENT '居住問題',
  `life_eco` tinyint(1) DEFAULT 0 COMMENT '保險經濟問題',
  `life_traffic` tinyint(1) DEFAULT 0 COMMENT '交通問題',
  `life_work` tinyint(1) DEFAULT 0 COMMENT '工作或就學問題',
  `life_treatment` tinyint(1) DEFAULT 0 COMMENT '治療方式問題',
  `mood_melancholy` tinyint(1) DEFAULT 0 COMMENT '憂鬱',
  `mood_afraid` tinyint(1) DEFAULT 0 COMMENT '害怕',
  `mood_tension` tinyint(1) DEFAULT 0 COMMENT '緊張',
  `mood_sad` tinyint(1) DEFAULT 0 COMMENT '難過、傷心',
  `mood_worry` tinyint(1) DEFAULT 0 COMMENT '擔心',
  `mood_lose_interest` tinyint(1) DEFAULT 0 COMMENT '對日常生活失去興趣',
  `family_kid` tinyint(1) DEFAULT 0 COMMENT '和小孩相處',
  `family_mate` tinyint(1) DEFAULT 0 COMMENT '和伴侶相處',
  `family_infertility` tinyint(1) DEFAULT 0 COMMENT '擔心不孕',
  `family_health` tinyint(1) DEFAULT 0 COMMENT '家人健康議題',
  `religious` tinyint(1) DEFAULT 0 COMMENT '靈性或宗教問題',
  `body_exterior` tinyint(1) DEFAULT 0 COMMENT '身體外觀方面',
  `body_bath_dress` tinyint(1) DEFAULT 0 COMMENT '身體穿衣沐浴方面',
  `body_breathe` tinyint(1) DEFAULT 0 COMMENT '呼吸方面',
  `body_pee` tinyint(1) DEFAULT 0 COMMENT '小便方面',
  `body_constipation` tinyint(1) DEFAULT 0 COMMENT '便祕',
  `body_diarrhea` tinyint(1) DEFAULT 0 COMMENT '腹瀉',
  `body_eat` tinyint(1) DEFAULT 0 COMMENT '進食方面',
  `body_tired` tinyint(1) DEFAULT 0 COMMENT '疲倦',
  `body_swelling` tinyint(1) DEFAULT 0 COMMENT '腫脹感',
  `body_fever` tinyint(1) DEFAULT 0 COMMENT '發燒',
  `body_action` tinyint(1) DEFAULT 0 COMMENT '行動方面',
  `body_indigestion` tinyint(1) DEFAULT 0 COMMENT '消化不良',
  `body_memory` tinyint(1) DEFAULT 0 COMMENT '記憶力或專注力方面',
  `body_mouth` tinyint(1) DEFAULT 0 COMMENT '嘴巴破皮',
  `body_nausea` tinyint(1) DEFAULT 0 COMMENT '噁心',
  `body_nose` tinyint(1) DEFAULT 0 COMMENT '鼻子乾或鼻塞',
  `body_pain` tinyint(1) DEFAULT 0 COMMENT '疼痛',
  `body_sexual` tinyint(1) DEFAULT 0 COMMENT '性生活方面',
  `body_skin` tinyint(1) DEFAULT 0 COMMENT '皮膚乾或癢',
  `body_sleep` tinyint(1) DEFAULT 0 COMMENT '睡眠方面',
  `body_abuse` tinyint(1) DEFAULT 0 COMMENT '物質濫用',
  `body_tingling` tinyint(1) DEFAULT 0 COMMENT '手或腳有刺痛感',
  `score` int(11) DEFAULT 0 COMMENT '得到總分',
  `R_note` longtext DEFAULT '' COMMENT '備註',
  `AdmincheckID` int(11) DEFAULT 0,
  `Admincheck` int(11) DEFAULT 0,
  `checktime` datetime DEFAULT NULL,
  PRIMARY KEY (`IDno`) USING BTREE,
  KEY `memberIndex` (`MemberID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='心理評估量表';

-- 取消選取資料匯出。

-- 傾印  資料表 FCF_careservice.assess_nursing 結構
DROP TABLE IF EXISTS `assess_nursing`;
CREATE TABLE IF NOT EXISTS `assess_nursing` (
  `IDno` int(11) NOT NULL AUTO_INCREMENT,
  `Keydate` datetime DEFAULT NULL,
  `MemberID` int(11) DEFAULT NULL COMMENT '個案ID',
  `AdminID` int(11) DEFAULT NULL COMMENT '填寫者帳號ID',
  `AdName` varchar(50) DEFAULT NULL COMMENT '填寫者名稱',
  `physical` smallint(6) DEFAULT 0 COMMENT '個案目前體能狀態評估(ECOG)',
  `mucosal` tinyint(1) DEFAULT 0 COMMENT '是否因治療造成腸胃道黏膜受損情形',
  `mucosal_area` varchar(10) DEFAULT '' COMMENT '1:腹瀉 2:口腔',
  `mucosal_grade` smallint(6) DEFAULT 0 COMMENT '咽喉黏膜潰瘍等級 第1級 紅、腫、痛、無潰瘍 第2級 紅、腫、潰瘍 (範圍＜25%) 可吃固體食物 第3級 紅、腫、潰瘍 (範圍25~50%) 只能吃流質食物 第4級 出血性潰瘍範圍＞50% 無法由口腔進食',
  `pain` tinyint(1) DEFAULT 0 COMMENT '是否有疼痛問題 1:有 0:無',
  `pain_area` varchar(20) DEFAULT '' COMMENT '疼痛部位',
  `pain_analgesics` varchar(20) DEFAULT '' COMMENT '止痛用藥',
  `pain_level` smallint(6) DEFAULT 1 COMMENT '疼痛指數 1~10',
  `exhausted` tinyint(1) DEFAULT 0 COMMENT '是否有癌因性疲憊',
  `exhaust_level` smallint(6) DEFAULT 1 COMMENT '疲憊指數 1~10',
  `nutrition_tube` tinyint(1) DEFAULT 0 COMMENT '供給營養補充之管路',
  `nutrition_tube_type` varchar(10) DEFAULT '' COMMENT '供給營養補充之管路 1:鼻胃管 2:胃管 3空腸',
  `special_tube` tinyint(1) DEFAULT 0 COMMENT '特殊管路',
  `special_tube_type` varchar(10) DEFAULT '' COMMENT '特殊管路 1:氣切 2:尿管 3:人工肛門 4:洗腎用動靜脈廔管',
  `caregiver` tinyint(1) DEFAULT 0 COMMENT '照顧者協助',
  `score` int(11) DEFAULT 0 COMMENT '得到總分',
  `R_note` longtext DEFAULT '' COMMENT '備註',
  `AdmincheckID` int(11) DEFAULT 0,
  `Admincheck` int(11) DEFAULT 0,
  `checktime` datetime DEFAULT NULL,
  PRIMARY KEY (`IDno`) USING BTREE,
  KEY `memberIndex` (`MemberID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='護理評估量表';

-- 取消選取資料匯出。

-- 傾印  資料表 FCF_careservice.assess_nutrition 結構
DROP TABLE IF EXISTS `assess_nutrition`;
CREATE TABLE IF NOT EXISTS `assess_nutrition` (
  `IDno` int(11) NOT NULL AUTO_INCREMENT,
  `Keydate` datetime DEFAULT NULL,
  `MemberID` int(11) DEFAULT NULL COMMENT '個案ID',
  `AdminID` int(11) DEFAULT NULL COMMENT '填寫者帳號ID',
  `AdName` varchar(50) DEFAULT NULL COMMENT '填寫者名稱',
  `height` smallint(6) DEFAULT 0 COMMENT '身高',
  `weight` smallint(6) DEFAULT 0 COMMENT '體重',
  `weight_year` smallint(6) DEFAULT 0 COMMENT '半年前體重',
  `weight_month` smallint(6) DEFAULT 0 COMMENT '一個月前體重',
  `weight_change` smallint(6) DEFAULT 0 COMMENT '體重變化 0:沒有改變 1:減少 2:增加',
  `eat_change` smallint(6) DEFAULT 0 COMMENT '吃食物的量與以往相比 0:沒有改變 1:減少 2:增加',
  `eat_only` smallint(6) DEFAULT 0 COMMENT '0: 比較少的正常食物 1:固體食物 2:液體食物 3:營養補充品 4:非常少的食物 5:靜脈注射',
  `other_nutrition` tinyint(1) DEFAULT 0 COMMENT '補充其他營養品',
  `use_nutrition` varchar(50) DEFAULT '' COMMENT '敘述營養補充品項及使用頻率',
  `symptom` varchar(20) DEFAULT '' COMMENT '0:沒有問題 1:沒有食慾 2:噁心 3:嘔吐 4:便秘 5:腹瀉 6:口痛 7:口乾 8:疼痛 9:吃起來沒有味道 10:怪味 11:其他',
  `symptom_pain` varchar(20) DEFAULT '' COMMENT '症狀疼痛部位',
  `symptom_other` varchar(20) DEFAULT '' COMMENT '其他症狀',
  `body_status` smallint(6) DEFAULT 0 COMMENT '身體狀況 0:無限制 1:有點不同，但可自理 2:不舒服，床上半天 3:少數活動，大部分床上 4:絕大多數時間在床上',
  `diagnosis` varchar(20) DEFAULT '0' COMMENT '疾病診斷',
  `disease_level` smallint(6) DEFAULT 0 COMMENT '1 2 3 4期 5:其他',
  `age` smallint(6) DEFAULT 0 COMMENT '年齡',
  `score` int(11) DEFAULT 0 COMMENT '得到總分',
  `R_note` longtext DEFAULT '' COMMENT '備註',
  `AdmincheckID` int(11) DEFAULT 0,
  `Admincheck` int(11) DEFAULT 0,
  `checktime` datetime DEFAULT NULL,
  PRIMARY KEY (`IDno`) USING BTREE,
  KEY `memberIndex` (`MemberID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='營養評估量表';

-- 取消選取資料匯出。

-- 傾印  資料表 FCF_careservice.assess_social 結構
DROP TABLE IF EXISTS `assess_social`;
CREATE TABLE IF NOT EXISTS `assess_social` (
  `IDno` int(11) NOT NULL AUTO_INCREMENT,
  `Keydate` datetime DEFAULT NULL,
  `MemberID` int(11) DEFAULT NULL COMMENT '個案ID',
  `AdminID` int(11) DEFAULT NULL COMMENT '填寫者帳號ID',
  `AdName` varchar(50) DEFAULT NULL COMMENT '填寫者名稱',
  `disability_book` tinyint(1) DEFAULT 0 COMMENT '身心障礙手冊 0:無 1:有 2:其他',
  `other_source` tinyint(1) DEFAULT 0 COMMENT '其他資源輔助 0:無 1:有 2:其他',
  `disability_other` varchar(20) DEFAULT '' COMMENT '身心障礙手冊其他文字',
  `source_other` varchar(20) DEFAULT '' COMMENT '其他資源輔助文字',
  `work_status` tinyint(1) DEFAULT 0 COMMENT '目前工作狀態 1:有工作 0:無工作',
  `life_before` smallint(6) DEFAULT 0 COMMENT '生活適應(病前) 1~5 不佳~良好',
  `life_after` smallint(6) DEFAULT 0 COMMENT '生活適應(病後) 1~5 不佳~良好',
  `relation_before` smallint(6) DEFAULT 0 COMMENT '人際關係(病前) 1~5 不佳~良好',
  `relation_after` smallint(6) DEFAULT 0 COMMENT '人際關係(病後) 1~5 不佳~良好',
  `social_before` smallint(6) DEFAULT 0 COMMENT '社交關係(病前) 1~5 不佳~良好',
  `social_after` smallint(6) DEFAULT 0 COMMENT '社交關係(病後) 1~5 不佳~良好',
  `tele_talk` smallint(6) DEFAULT 0 COMMENT '一周內與他人電話交談 0:從未有過 1:一次 2:兩次 3:三次 4:每天一次或更多',
  `get_together` smallint(6) DEFAULT 0 COMMENT '與你同住的人相聚 0:從未有過 1:一次 2:兩次 3:三次 4:每天一次或更多',
  `trust_people` tinyint(1) DEFAULT 0 COMMENT '0:否 1:是',
  `give_help` tinyint(1) DEFAULT 0 COMMENT '是否有人能在你生病給你幫助 0:否 1:是',
  `give_help_peop` varchar(20) DEFAULT '' COMMENT '提供幫助的人',
  `give_help_type` varchar(10) DEFAULT '' COMMENT '1:經濟 2:醫療 3:照顧 4:情感',
  `take_care` smallint(6) DEFAULT 0 COMMENT '1:無 2:幾乎沒有 3:偶爾 4:短期照顧 5:無限期協助',
  `score` int(11) DEFAULT 0 COMMENT '得到總分',
  `R_note` longtext DEFAULT '' COMMENT '備註',
  `AdmincheckID` int(11) DEFAULT 0,
  `Admincheck` int(11) DEFAULT 0,
  `checktime` datetime DEFAULT NULL,
  PRIMARY KEY (`IDno`) USING BTREE,
  KEY `memberIndex` (`MemberID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='社工評估量表';

-- 取消選取資料匯出。

-- 傾印  資料表 FCF_careservice.EventArchives 結構
DROP TABLE IF EXISTS `EventArchives`;
CREATE TABLE IF NOT EXISTS `EventArchives` (
  `IDno` int(11) NOT NULL AUTO_INCREMENT,
  `Fdate` datetime DEFAULT NULL,
  `Fname` varchar(50) DEFAULT NULL,
  `Ftitle` varchar(50) DEFAULT NULL,
  `Ftype` int(11) DEFAULT NULL,
  `ClassID` int(11) DEFAULT NULL COMMENT '對應課程 ID',
  PRIMARY KEY (`IDno`)
) ENGINE=InnoDB AUTO_INCREMENT=6286 DEFAULT CHARSET=utf8mb4;

-- 取消選取資料匯出。

-- 傾印  資料表 FCF_careservice.EventAttend 結構
DROP TABLE IF EXISTS `EventAttend`;
CREATE TABLE IF NOT EXISTS `EventAttend` (
  `IDno` int(11) NOT NULL AUTO_INCREMENT,
  `ClassID` int(11) DEFAULT NULL,
  `Eventime` date DEFAULT NULL,
  `PeopNum` int(11) DEFAULT NULL,
  `PeopID` longtext DEFAULT NULL,
  `AdminID` int(11) DEFAULT NULL,
  `ADname` varchar(50) DEFAULT NULL,
  `Keydate` datetime DEFAULT NULL,
  PRIMARY KEY (`IDno`)
) ENGINE=InnoDB AUTO_INCREMENT=3335 DEFAULT CHARSET=utf8mb4;

-- 取消選取資料匯出。

-- 傾印  資料表 FCF_careservice.EventCategory 結構
DROP TABLE IF EXISTS `EventCategory`;
CREATE TABLE IF NOT EXISTS `EventCategory` (
  `IDno` int(11) NOT NULL AUTO_INCREMENT,
  `C_name` varchar(100) DEFAULT NULL,
  `C_kind` varchar(50) DEFAULT NULL,
  `cityLocation` varchar(50) NOT NULL DEFAULT '',
  `Del` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1:代表被刪除了',
  PRIMARY KEY (`IDno`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4;

-- 取消選取資料匯出。

-- 傾印  資料表 FCF_careservice.Memberdata 結構
DROP TABLE IF EXISTS `Memberdata`;
CREATE TABLE IF NOT EXISTS `Memberdata` (
  `IDno` int(11) NOT NULL AUTO_INCREMENT,
  `Keydate` datetime DEFAULT NULL,
  `AdminID` int(11) DEFAULT NULL,
  `AdName` varchar(50) DEFAULT NULL,
  `C_opendate` date DEFAULT NULL,
  `C_closedate` date DEFAULT NULL,
  `C_status` int(11) DEFAULT 1 COMMENT '往生關檔 -1:往生 1:健在',
  `C_member` int(11) DEFAULT 0 COMMENT '案件類型 0:一般民眾 1:個案 2:家屬 3:志工基本資料(不歸類在個案內)',
  `FCFvolunte` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否為志工 1:志工 0:非志工',
  `caseClosed` tinyint(1) DEFAULT 0 COMMENT '是否關檔 1:關檔 0:未關檔',
  `C_comefrom` varchar(20) DEFAULT NULL,
  `C_name` varchar(50) DEFAULT NULL,
  `C_sex` varchar(10) DEFAULT NULL,
  `C_marriage` varchar(10) DEFAULT NULL,
  `haveChilds` int(11) DEFAULT 0,
  `C_idno` varchar(10) DEFAULT NULL COMMENT '身分證字號',
  `C_job` int(11) DEFAULT 0 COMMENT '1:一般職業(機關團體/公司行號) 2:農牧業 3:漁業 4:木材森林業 5:礦業採石業\r\n6:交通運輸業 7:餐旅業 8:建築工程業 9:製造業 10:新聞廣告業\r\n11:保健業(醫院人員/保健人員) 12:娛樂業 13:文教機關(教職員/學生) 14:宗教團體 15:公共事業\r\n16:一般商業 17:服務業(銀行/保險/信託/租賃/自由業/殯葬業/其他) 18:家庭管理(家管/佣人/保母) 19:治安人員 20:軍人\r\n21:資訊業 22:職業運動人員 23:公務人員 24:待業中 25:退休',
  `C_edu` varchar(20) DEFAULT NULL,
  `BD_yy` int(11) DEFAULT 0,
  `BD_mm` int(11) DEFAULT 1,
  `BD_dd` int(11) DEFAULT 1,
  `C_file` varchar(50) DEFAULT NULL COMMENT '家系圖位址',
  `C_subscribe` int(11) NOT NULL DEFAULT 0 COMMENT '訂閱會訊(三個月一次) 0:無訂閱 1:紙本 2:email',
  `C_tele` varchar(20) DEFAULT NULL,
  `C_mail` varchar(80) DEFAULT NULL,
  `C_mobile1` varchar(20) DEFAULT NULL,
  `C_mobile2` varchar(20) DEFAULT NULL,
  `getSMS` tinyint(1) NOT NULL DEFAULT 0 COMMENT '接收最新活動消息 1:是 0:否',
  `C_area` varchar(20) DEFAULT NULL,
  `C_zip` varchar(5) DEFAULT NULL,
  `C_city` varchar(10) DEFAULT NULL,
  `C_zone` varchar(10) DEFAULT NULL,
  `C_address` varchar(200) DEFAULT NULL,
  `C_contact` varchar(20) DEFAULT NULL,
  `C_relation` varchar(10) DEFAULT NULL,
  `C_reltele` varchar(20) DEFAULT NULL,
  `C_note` longtext DEFAULT NULL,
  `id_normal` int(11) DEFAULT 0,
  `id_lowincome` int(11) DEFAULT 0,
  `id_weakincome` int(11) DEFAULT 0,
  `id_oldman` int(11) DEFAULT 0,
  `id_handicapped` int(11) DEFAULT 0,
  `id_indigenous` int(11) DEFAULT 0,
  `id_foreign` int(11) DEFAULT 0,
  `id_singlemon` int(11) DEFAULT 0,
  `id_specstatus` int(11) DEFAULT 0,
  `Ins_none` int(11) DEFAULT 0,
  `Ins_health` int(11) DEFAULT 0,
  `Ins_work` int(11) DEFAULT 0,
  `Ins_gov` int(11) DEFAULT 0,
  `Ins_fisher` int(11) DEFAULT 0,
  `Ins_farmer` int(11) DEFAULT 0,
  `Ins_soldier` int(11) DEFAULT 0,
  `Ins_commerce` int(11) DEFAULT 0,
  `Ins_social` int(11) DEFAULT 0,
  `Ins_others` varchar(30) DEFAULT '',
  `life_ability` int(11) DEFAULT 0 COMMENT '0:--- 1:正常 2:需要他人幫忙 3:需要輔助用具 4:完全無法自行活動',
  `residence` int(11) DEFAULT 0 COMMENT '居住狀況 0:--- 1:與家人同住 2:獨居 3:醫療機構 4:安置機構 5:無固定住所 6:服刑中 7:其他',
  `cohabitation` varchar(20) DEFAULT '' COMMENT '同住家人',
  `houseown` int(11) DEFAULT 0 COMMENT '現在住所 0:--- 1:自宅無貸款 2:自宅有貸款 3:租屋 4:借住 5:其他',
  `payMonth` int(11) DEFAULT 0 COMMENT '居住月支出(貸款/租金)',
  `caregiver` int(11) DEFAULT 0 COMMENT '主要照顧者 0:--- 1:父母 2:配偶 3:子女 4:同居人 5:朋友 6:其他',
  `ecoStatus` varchar(30) DEFAULT '' COMMENT '經濟狀況 0:自己有工作 1:政府補助 2:父母扶養 3:子女提供 4:親友提供 5:其他',
  `monthIncome` int(11) DEFAULT 0 COMMENT '月收入',
  `chronic` varchar(30) DEFAULT '' COMMENT '慢性疾病史 0:無 1:糖尿病 2:高血壓 3:心臟病 4:中風 5:COPD 6:CRF 7:其他',
  `otherChronic` varchar(30) DEFAULT '' COMMENT '其他慢性疾病史',
  `privacy` tinyint(1) NOT NULL DEFAULT 0 COMMENT '個資保密條款，基本上都要同意 1:同意 0:不同意',
  `assessForm` tinyint(1) NOT NULL DEFAULT 0 COMMENT '評估量表 1:已填寫過 0:未填寫',
  `Last_update` datetime DEFAULT NULL,
  `Close_reason` varchar(200) DEFAULT NULL,
  `Lastcare` varchar(50) DEFAULT NULL,
  `handSignature` longtext DEFAULT '' COMMENT '簽名',
  PRIMARY KEY (`IDno`),
  UNIQUE KEY `C_idno` (`C_idno`)
) ENGINE=InnoDB AUTO_INCREMENT=24390 DEFAULT CHARSET=utf8mb4;

-- 取消選取資料匯出。

-- 傾印  資料表 FCF_careservice.MindBodyCourse 結構
DROP TABLE IF EXISTS `MindBodyCourse`;
CREATE TABLE IF NOT EXISTS `MindBodyCourse` (
  `IDno` int(11) NOT NULL AUTO_INCREMENT,
  `Keydate` datetime DEFAULT NULL,
  `AdminID` int(11) DEFAULT NULL,
  `Adname` varchar(50) DEFAULT NULL,
  `C_kind` varchar(10) DEFAULT NULL,
  `C_name` varchar(50) DEFAULT NULL,
  `categoryID` int(11) NOT NULL DEFAULT 0,
  `C_No` varchar(20) DEFAULT '',
  `C_location` varchar(50) DEFAULT NULL,
  `C_partner` longtext DEFAULT NULL,
  `C_startday` date DEFAULT NULL,
  `C_endday` date DEFAULT NULL,
  `C_manager` varchar(50) DEFAULT NULL,
  `C_teacher` varchar(50) DEFAULT NULL,
  `C_assistant` varchar(50) DEFAULT NULL,
  `C_num` int(11) DEFAULT NULL,
  `C_joinnum` int(11) DEFAULT NULL,
  `C_servicenum` int(11) DEFAULT NULL,
  `C_leavenum` int(11) DEFAULT NULL,
  `C_note` longtext DEFAULT NULL,
  `C_specrec` longtext DEFAULT NULL,
  `C_comment` longtext DEFAULT NULL,
  `C_issue` longtext DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1 COMMENT '0:刪除 1:有效',
  `AdmincheckID` int(11) DEFAULT 0,
  `Admincheck` int(11) DEFAULT 0,
  `checktime` datetime DEFAULT NULL,
  PRIMARY KEY (`IDno`)
) ENGINE=InnoDB AUTO_INCREMENT=507 DEFAULT CHARSET=utf8mb4;

-- 取消選取資料匯出。

-- 傾印  資料表 FCF_careservice.notification 結構
DROP TABLE IF EXISTS `notification`;
CREATE TABLE IF NOT EXISTS `notification` (
  `IDno` int(11) NOT NULL AUTO_INCREMENT,
  `noticeTime` datetime DEFAULT NULL,
  `noticeAcc` int(11) DEFAULT NULL COMMENT '通知帳號ID',
  `noticeType` int(11) DEFAULT 0 COMMENT '通知類型 0:一般通知, 1:新增資料通知 2:資料修改通知 3:資料結案通知 4:資料刪除通知',
  `noticeLink` varchar(100) DEFAULT '' COMMENT '通知連結',
  `noticeMsg` mediumtext DEFAULT '' COMMENT '通知訊息',
  `checktime` datetime DEFAULT NULL COMMENT '確認時間',
  PRIMARY KEY (`IDno`) USING BTREE,
  KEY `accIndex` (`noticeAcc`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='系統通知';

-- 取消選取資料匯出。

-- 傾印  資料表 FCF_careservice.Projects 結構
DROP TABLE IF EXISTS `Projects`;
CREATE TABLE IF NOT EXISTS `Projects` (
  `IDno` int(11) NOT NULL AUTO_INCREMENT,
  `Keydate` datetime DEFAULT NULL,
  `AdminID` int(11) DEFAULT NULL,
  `Adname` varchar(50) DEFAULT NULL,
  `C_kind` varchar(10) DEFAULT NULL,
  `C_name` varchar(50) DEFAULT NULL,
  `categoryID` int(11) NOT NULL DEFAULT 0,
  `C_No` varchar(20) DEFAULT '',
  `C_location` varchar(50) DEFAULT NULL,
  `C_partner` longtext DEFAULT NULL,
  `C_startday` date DEFAULT NULL,
  `C_endday` date DEFAULT NULL,
  `C_manager` varchar(50) DEFAULT NULL,
  `C_teacher` varchar(50) DEFAULT NULL,
  `C_assistant` varchar(50) DEFAULT NULL,
  `C_num` int(11) DEFAULT NULL,
  `C_joinnum` int(11) DEFAULT NULL,
  `C_servicenum` int(11) DEFAULT NULL,
  `C_leavenum` int(11) DEFAULT NULL,
  `C_note` longtext DEFAULT NULL,
  `C_specrec` longtext DEFAULT NULL,
  `C_comment` longtext DEFAULT NULL,
  `C_issue` longtext DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1 COMMENT '0:刪除 1:有效',
  `AdmincheckID` int(11) DEFAULT 0,
  `Admincheck` int(11) DEFAULT 0,
  `checktime` datetime DEFAULT NULL,
  PRIMARY KEY (`IDno`)
) ENGINE=InnoDB AUTO_INCREMENT=510 DEFAULT CHARSET=utf8mb4;

-- 取消選取資料匯出。

-- 傾印  資料表 FCF_careservice.Rec_ask 結構
DROP TABLE IF EXISTS `Rec_ask`;
CREATE TABLE IF NOT EXISTS `Rec_ask` (
  `IDno` int(11) NOT NULL AUTO_INCREMENT,
  `Keydate` datetime DEFAULT NULL,
  `MemberID` int(11) DEFAULT NULL,
  `CanMember` int(11) DEFAULT NULL,
  `AdminID` int(11) DEFAULT NULL,
  `AdName` varchar(50) DEFAULT NULL,
  `anonym` tinyint(1) DEFAULT 0 COMMENT '是否為匿名 0:個案諮詢 1匿名(線上)',
  `R_date` date DEFAULT NULL,
  `R_time` int(11) DEFAULT 0,
  `R_loc` varchar(200) DEFAULT NULL,
  `R_way` varchar(20) DEFAULT NULL,
  `vegetarian` int(11) DEFAULT 0,
  `Vege_1` int(11) DEFAULT 0,
  `Vege_2` int(11) DEFAULT 0,
  `Vege_3` int(11) DEFAULT 0,
  `Vege_4` int(11) DEFAULT 0,
  `Vege_5` int(11) DEFAULT 0,
  `Vege_6` int(11) DEFAULT 0,
  `Vege_other` int(11) DEFAULT 0,
  `Vege_othertxt` varchar(30) DEFAULT '',
  `prevent` int(11) DEFAULT 0,
  `prev_1` int(11) DEFAULT 0,
  `prev_2` int(11) DEFAULT 0,
  `prev_3` int(11) DEFAULT 0,
  `Knowledge` int(11) DEFAULT 0,
  `Konw_1` int(11) DEFAULT 0,
  `Konw_2` int(11) DEFAULT 0,
  `Konw_3` int(11) DEFAULT 0,
  `Other` int(11) DEFAULT 0,
  `Oth_1` int(11) DEFAULT 0,
  `Oth_2` int(11) DEFAULT 0,
  `Oth_3` int(11) DEFAULT 0,
  `hair` tinyint(1) DEFAULT 0 COMMENT '捐贈頭髮',
  `R_note` longtext DEFAULT NULL,
  `AdmincheckID` int(11) DEFAULT 0,
  `Admincheck` int(11) DEFAULT 0,
  `checktime` datetime DEFAULT NULL,
  PRIMARY KEY (`IDno`),
  KEY `MemberID` (`MemberID`)
) ENGINE=InnoDB AUTO_INCREMENT=336 DEFAULT CHARSET=utf8mb4;

-- 取消選取資料匯出。

-- 傾印  資料表 FCF_careservice.Rec_cancer 結構
DROP TABLE IF EXISTS `Rec_cancer`;
CREATE TABLE IF NOT EXISTS `Rec_cancer` (
  `IDno` int(11) NOT NULL AUTO_INCREMENT,
  `Keydate` datetime DEFAULT NULL,
  `MemberID` int(11) DEFAULT NULL,
  `AdminID` int(11) DEFAULT NULL,
  `AdName` varchar(50) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '資料狀態 0:已刪除 1:有效資料',
  `Find_date` date DEFAULT NULL COMMENT '診斷日期',
  `hospital` varchar(20) DEFAULT '' COMMENT '就診醫院',
  `genetic_test` varchar(50) DEFAULT '' COMMENT '基因檢測',
  `Cancer_type` varchar(10) DEFAULT 'New' COMMENT '癌症復發',
  `recurrence` date DEFAULT NULL COMMENT '復發時間',
  `Cancer_name` varchar(50) DEFAULT NULL,
  `Cancer_level` int(11) DEFAULT 0,
  `Cancer_trans` varchar(50) DEFAULT NULL,
  `Surgery` tinyint(1) DEFAULT 0 COMMENT '手術切除(是/否)',
  `Surgery_date` varchar(50) DEFAULT NULL,
  `Chemical` int(11) DEFAULT 0,
  `Chemical_date` varchar(50) DEFAULT NULL,
  `Chemical_name` varchar(50) DEFAULT NULL,
  `Target` int(11) NOT NULL DEFAULT 0,
  `Target_date` varchar(50) DEFAULT NULL,
  `Target_name` varchar(100) DEFAULT NULL,
  `Immune` tinyint(1) DEFAULT 0 COMMENT '免疫治療',
  `Immune_date` varchar(50) DEFAULT '' COMMENT '免疫治療期間',
  `Immune_medicine` varchar(50) DEFAULT '' COMMENT '免疫治療使用藥名',
  `Radiation` tinyint(1) DEFAULT 0 COMMENT '放射治療',
  `Radiat_date` varchar(50) DEFAULT NULL,
  `Rad_time` int(11) DEFAULT 0 COMMENT '放射治療次數',
  `Rad_part` varchar(50) DEFAULT '' COMMENT '放射治療部位',
  `hormone` tinyint(1) NOT NULL DEFAULT 0 COMMENT '賀爾蒙療法',
  `hormone_date` varchar(50) DEFAULT '' COMMENT '賀爾蒙療法期間',
  `hormone_medicine` varchar(50) DEFAULT '' COMMENT '賀爾蒙療法使用藥名',
  `integrated` tinyint(1) NOT NULL DEFAULT 0 COMMENT '中西醫整合療法',
  `tracking` tinyint(1) NOT NULL DEFAULT 0 COMMENT '定期門診追蹤',
  `peace` tinyint(1) NOT NULL DEFAULT 0 COMMENT '安寧療護',
  `other` tinyint(1) DEFAULT 0 COMMENT '其他治療',
  `R_note` longtext DEFAULT NULL,
  `AdmincheckID` int(11) DEFAULT 0,
  `Admincheck` int(11) DEFAULT 0,
  `checktime` datetime DEFAULT NULL,
  PRIMARY KEY (`IDno`),
  KEY `memberIndex` (`MemberID`)
) ENGINE=InnoDB AUTO_INCREMENT=9186 DEFAULT CHARSET=utf8mb4;

-- 取消選取資料匯出。

-- 傾印  資料表 FCF_careservice.Rec_care 結構
DROP TABLE IF EXISTS `Rec_care`;
CREATE TABLE IF NOT EXISTS `Rec_care` (
  `IDno` int(11) NOT NULL AUTO_INCREMENT,
  `Keydate` datetime DEFAULT NULL,
  `MemberID` int(11) DEFAULT NULL,
  `AdminID` int(11) DEFAULT NULL,
  `AdName` varchar(50) DEFAULT NULL,
  `anonym` tinyint(1) DEFAULT 0 COMMENT '是否為匿名 0:個案諮詢 1匿名(線上)',
  `R_date` date DEFAULT NULL,
  `R_time` int(11) DEFAULT 0,
  `R_loc` varchar(200) DEFAULT NULL,
  `R_way` varchar(20) DEFAULT NULL,
  `Contactpeop` varchar(30) DEFAULT NULL,
  `Act_care` int(11) DEFAULT 0,
  `Act_expshare` int(11) DEFAULT 0,
  `Act_support` int(11) DEFAULT 0,
  `Act_other` int(11) DEFAULT 0,
  `Act_othertxt` varchar(50) DEFAULT NULL,
  `Transfer` int(11) DEFAULT 0,
  `Trans_medical` int(11) DEFAULT 0,
  `Trans_nutrition` int(11) DEFAULT 0,
  `Trans_social` int(11) DEFAULT 0,
  `Trans_mental` int(11) DEFAULT 0,
  `R_note` longtext DEFAULT '',
  `AdmincheckID` int(11) DEFAULT 0,
  `Admincheck` int(11) DEFAULT 0,
  `checktime` datetime DEFAULT NULL,
  PRIMARY KEY (`IDno`),
  KEY `memberIndex` (`MemberID`)
) ENGINE=InnoDB AUTO_INCREMENT=11126 DEFAULT CHARSET=utf8mb4;

-- 取消選取資料匯出。

-- 傾印  資料表 FCF_careservice.Rec_courses 結構
DROP TABLE IF EXISTS `Rec_courses`;
CREATE TABLE IF NOT EXISTS `Rec_courses` (
  `IDno` int(11) NOT NULL AUTO_INCREMENT,
  `Keydate` date DEFAULT NULL COMMENT '資料建立日期',
  `MemberID` int(11) DEFAULT NULL,
  `AdminID` int(11) DEFAULT NULL,
  `AdName` varchar(50) DEFAULT NULL,
  `ClassID` int(11) NOT NULL COMMENT '課程ID',
  PRIMARY KEY (`IDno`) USING BTREE,
  KEY `memberIndex` (`MemberID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8192 DEFAULT CHARSET=utf8mb4 COMMENT='身心靈課程紀錄';

-- 取消選取資料匯出。

-- 傾印  資料表 FCF_careservice.Rec_insurance 結構
DROP TABLE IF EXISTS `Rec_insurance`;
CREATE TABLE IF NOT EXISTS `Rec_insurance` (
  `IDno` int(11) NOT NULL AUTO_INCREMENT,
  `Keydate` datetime DEFAULT NULL,
  `MemberID` int(11) DEFAULT NULL,
  `AdminID` int(11) DEFAULT NULL,
  `AdName` varchar(50) DEFAULT NULL,
  `anonym` tinyint(1) DEFAULT 0 COMMENT '是否為匿名 0:個案諮詢 1匿名(線上)',
  `R_date` date DEFAULT NULL,
  `R_time` int(11) DEFAULT NULL,
  `R_loc` varchar(20) DEFAULT NULL,
  `R_way` varchar(20) DEFAULT NULL,
  `Ins_med` tinyint(1) NOT NULL DEFAULT 0 COMMENT '醫療相關',
  `Ins_admission` tinyint(1) NOT NULL DEFAULT 0 COMMENT '住院給付(醫療)',
  `Ins_clinic` tinyint(1) NOT NULL DEFAULT 0 COMMENT '門診給付(醫療)',
  `Ins_surgery` tinyint(1) NOT NULL DEFAULT 0 COMMENT '手術給付(醫療)',
  `Ins_expenses` tinyint(1) NOT NULL DEFAULT 0 COMMENT '自費醫材給付(醫療)',
  `Ins_targeted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '標靶藥物給付(醫療)',
  `Ins_radiology` tinyint(1) NOT NULL DEFAULT 0 COMMENT '放射治療給付(醫療)',
  `Ins_chemotherapy` tinyint(1) NOT NULL DEFAULT 0 COMMENT '化學治療給付(醫療)',
  `Ins_immunotherapy` tinyint(1) NOT NULL DEFAULT 0 COMMENT '免疫治療給付(醫療)',
  `Ins_discharged` tinyint(1) NOT NULL DEFAULT 0 COMMENT '出院帶藥給付(醫療)',
  `Ins_tcm` tinyint(1) NOT NULL DEFAULT 0 COMMENT '中醫門診(醫療)',
  `Ins_hospice` tinyint(1) NOT NULL DEFAULT 0 COMMENT '安寧病房給付(醫療)',
  `Ins_policy` tinyint(1) NOT NULL DEFAULT 0 COMMENT '保單相關',
  `Ins_view` tinyint(1) NOT NULL DEFAULT 0 COMMENT '保單檢視(保單)',
  `Ins_plan` tinyint(1) NOT NULL DEFAULT 0 COMMENT '保險規劃(保單)',
  `Ins_law` tinyint(1) NOT NULL DEFAULT 0 COMMENT '保險法律(保單)',
  `R_note` longtext DEFAULT '',
  `filePath` varchar(100) DEFAULT '' COMMENT '上傳檔案名稱與路徑',
  `AdmincheckID` int(11) DEFAULT 0,
  `Admincheck` int(11) DEFAULT 0,
  `checktime` datetime DEFAULT NULL,
  PRIMARY KEY (`IDno`) USING BTREE,
  KEY `memberIndex` (`MemberID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- 取消選取資料匯出。

-- 傾印  資料表 FCF_careservice.Rec_medical 結構
DROP TABLE IF EXISTS `Rec_medical`;
CREATE TABLE IF NOT EXISTS `Rec_medical` (
  `IDno` int(11) NOT NULL AUTO_INCREMENT,
  `Keydate` datetime DEFAULT NULL,
  `MemberID` int(11) DEFAULT NULL,
  `AdminID` int(11) DEFAULT NULL,
  `AdName` varchar(50) DEFAULT NULL,
  `anonym` tinyint(1) DEFAULT 0 COMMENT '是否為匿名 0:個案諮詢 1匿名(線上)',
  `R_date` date DEFAULT NULL,
  `R_time` int(11) DEFAULT NULL,
  `R_loc` varchar(200) DEFAULT NULL,
  `R_way` varchar(20) DEFAULT NULL,
  `Medical` int(11) DEFAULT NULL,
  `Med_cure` int(11) DEFAULT NULL,
  `Med_check` int(11) DEFAULT NULL,
  `Med_drug` int(11) DEFAULT NULL,
  `Med_clinical` int(11) DEFAULT NULL,
  `Med_suggest` int(11) DEFAULT NULL,
  `Med_assist` int(11) DEFAULT NULL,
  `Nurse` int(11) DEFAULT NULL,
  `Nur_surgery` int(11) DEFAULT NULL,
  `Nur_chemical` int(11) DEFAULT NULL,
  `Nur_target` int(11) DEFAULT NULL,
  `Nur_radiation` int(11) DEFAULT NULL,
  `Nur_drug` int(11) DEFAULT NULL,
  `Nur_home` int(11) DEFAULT NULL,
  `Nur_assuage` int(11) DEFAULT NULL,
  `Nur_hospital` int(11) DEFAULT NULL,
  `Nur_food` int(11) DEFAULT NULL,
  `Nur_mood` int(11) DEFAULT NULL,
  `Rights` tinyint(1) NOT NULL DEFAULT 0 COMMENT '權利倡議',
  `Right_drugpay` tinyint(1) NOT NULL DEFAULT 0 COMMENT '健保藥品給付',
  `Right_newdrug` tinyint(1) NOT NULL DEFAULT 0 COMMENT '新藥審查及使用條件',
  `Right_buydrug` tinyint(1) NOT NULL DEFAULT 0 COMMENT '自購藥物管道',
  `Right_clinical` tinyint(1) NOT NULL DEFAULT 0 COMMENT '臨床試驗',
  `Right_doctor` tinyint(1) NOT NULL DEFAULT 0 COMMENT '醫病關係',
  `Right_quality` tinyint(1) NOT NULL DEFAULT 0 COMMENT '醫療品質',
  `Right_other` tinyint(1) NOT NULL DEFAULT 0 COMMENT '其他議題',
  `Right_othertxt` varchar(50) DEFAULT '' COMMENT '其他議題文字輸入',
  `R_note` longtext DEFAULT NULL,
  `filePath` varchar(100) DEFAULT '' COMMENT '上傳檔案名稱與路徑',
  `AdmincheckID` int(11) DEFAULT 0,
  `Admincheck` int(11) DEFAULT 0,
  `checktime` datetime DEFAULT NULL,
  PRIMARY KEY (`IDno`),
  KEY `memberIndex` (`MemberID`)
) ENGINE=InnoDB AUTO_INCREMENT=7037 DEFAULT CHARSET=utf8mb4;

-- 取消選取資料匯出。

-- 傾印  資料表 FCF_careservice.Rec_mental 結構
DROP TABLE IF EXISTS `Rec_mental`;
CREATE TABLE IF NOT EXISTS `Rec_mental` (
  `IDno` int(11) NOT NULL AUTO_INCREMENT,
  `Keydate` datetime DEFAULT NULL,
  `MemberID` int(11) DEFAULT NULL,
  `AdminID` int(11) DEFAULT NULL,
  `AdName` varchar(50) DEFAULT NULL,
  `anonym` tinyint(1) DEFAULT 0 COMMENT '是否為匿名 0:個案諮詢 1匿名(線上)',
  `R_date` date DEFAULT NULL,
  `R_time` int(11) DEFAULT NULL,
  `R_loc` varchar(20) DEFAULT NULL,
  `R_way` varchar(20) DEFAULT NULL,
  `Mind` tinyint(1) NOT NULL DEFAULT 0 COMMENT '心理諮商',
  `Mind_feeling` tinyint(1) NOT NULL DEFAULT 0 COMMENT '情緒議題',
  `Mind_self` tinyint(1) NOT NULL DEFAULT 0 COMMENT '自我概念',
  `Mind_adapt` tinyint(1) NOT NULL DEFAULT 0 COMMENT '生活適應',
  `Mind_friends` tinyint(1) NOT NULL DEFAULT 0 COMMENT '人際關係',
  `Mind_family` tinyint(1) NOT NULL DEFAULT 0 COMMENT '家庭議題',
  `Mind_sickbed` tinyint(1) NOT NULL DEFAULT 0 COMMENT '疾病末期',
  `Mind_suicide` tinyint(1) NOT NULL DEFAULT 0 COMMENT '自殺意念',
  `Mind_selfcare` tinyint(1) NOT NULL DEFAULT 0 COMMENT '自我照顧',
  `Mind_lost` tinyint(1) NOT NULL DEFAULT 0 COMMENT '失落經驗',
  `Mind_other` tinyint(1) NOT NULL DEFAULT 0 COMMENT '其他',
  `Mind_othertxt` varchar(50) NOT NULL DEFAULT '',
  `R_note` longtext DEFAULT '',
  `filePath` varchar(100) DEFAULT '' COMMENT '上傳檔案名稱與路徑',
  `AdmincheckID` int(11) DEFAULT 0,
  `Admincheck` int(11) DEFAULT 0,
  `checktime` datetime DEFAULT NULL,
  PRIMARY KEY (`IDno`) USING BTREE,
  KEY `memberIndex` (`MemberID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2053 DEFAULT CHARSET=utf8mb4;

-- 取消選取資料匯出。

-- 傾印  資料表 FCF_careservice.Rec_nutrition 結構
DROP TABLE IF EXISTS `Rec_nutrition`;
CREATE TABLE IF NOT EXISTS `Rec_nutrition` (
  `IDno` int(11) NOT NULL AUTO_INCREMENT,
  `Keydate` datetime DEFAULT NULL,
  `MemberID` int(11) DEFAULT NULL,
  `AdminID` int(11) DEFAULT NULL,
  `AdName` varchar(50) DEFAULT NULL,
  `anonym` tinyint(1) DEFAULT 0 COMMENT '是否為匿名 0:個案諮詢 1匿名(線上)',
  `R_date` date DEFAULT NULL,
  `R_time` int(11) DEFAULT NULL,
  `R_loc` varchar(200) DEFAULT NULL,
  `R_way` varchar(20) DEFAULT NULL,
  `R_height` smallint(6) DEFAULT 0 COMMENT '身高(cm)',
  `R_weight` smallint(6) DEFAULT 0 COMMENT '體重(kg)',
  `general_weight` smallint(6) DEFAULT 0 COMMENT '平常體重',
  `R_BMI` float(4,1) DEFAULT 0.0 COMMENT 'BMI',
  `R_analysis` varchar(20) DEFAULT '' COMMENT '體態分析',
  `Aim` tinyint(1) NOT NULL DEFAULT 0 COMMENT '諮詢目的',
  `Aim_therapeutic` tinyint(1) NOT NULL DEFAULT 0 COMMENT '治療飲食',
  `Aim_nutrition` tinyint(1) NOT NULL DEFAULT 0 COMMENT '營養品補助',
  `Aim_balance` tinyint(1) NOT NULL DEFAULT 0 COMMENT '均衡營養',
  `Aim_countermeasures` tinyint(1) NOT NULL DEFAULT 0 COMMENT '生理狀況之飲食對策',
  `Aim_other` tinyint(1) NOT NULL DEFAULT 0 COMMENT '其他諮詢目的',
  `Aim_othertxt` varchar(50) DEFAULT '' COMMENT '其他諮詢目的文字說明',
  `Provide` tinyint(1) NOT NULL DEFAULT 0 COMMENT '進食方式',
  `Pv_self` tinyint(1) NOT NULL DEFAULT 0 COMMENT '由口進食',
  `Pv_ng` tinyint(1) NOT NULL DEFAULT 0 COMMENT '鼻胃管餵食',
  `Pv_gastric` tinyint(1) NOT NULL DEFAULT 0 COMMENT '胃管餵食',
  `Pv_intestinal` tinyint(1) NOT NULL DEFAULT 0 COMMENT '腸管餵食',
  `Pv_ppn` tinyint(1) NOT NULL DEFAULT 0 COMMENT '週邊靜脈營養',
  `Pv_tpn` tinyint(1) NOT NULL DEFAULT 0 COMMENT '全靜脈營養',
  `Pv_other` tinyint(1) NOT NULL DEFAULT 0 COMMENT '其他進食方式',
  `Pv_othertxt` varchar(50) DEFAULT '' COMMENT '其他進食方式文字說明',
  `Caloric` float(6,1) DEFAULT 0.0 COMMENT '熱量需求',
  `Cal_pressure` float(3,1) DEFAULT 0.0 COMMENT '壓力因子',
  `Cal_activity` float(3,1) DEFAULT 0.0 COMMENT '活動因子',
  `Protein` float(5,1) DEFAULT 0.0 COMMENT '蛋白質需求',
  `Protein_factor` float(3,1) DEFAULT 0.0 COMMENT '需求量因子',
  `beforeSurgery` tinyint(1) NOT NULL DEFAULT 0 COMMENT '手術前飲食衛教',
  `afterSurgery` tinyint(1) NOT NULL DEFAULT 0 COMMENT '手術後飲食衛教',
  `Cure` tinyint(1) NOT NULL DEFAULT 0 COMMENT '治療期間飲食衛教',
  `Cure_calorie` tinyint(1) NOT NULL DEFAULT 0 COMMENT '熱量需求',
  `Cure_protein` tinyint(1) NOT NULL DEFAULT 0 COMMENT '蛋白質需求與估算',
  `Effect` tinyint(1) NOT NULL DEFAULT 0 COMMENT '生理狀況之飲食對策',
  `Effect_vomit` tinyint(1) NOT NULL DEFAULT 0 COMMENT '噁心嘔吐 ',
  `Effect_oral` tinyint(1) NOT NULL DEFAULT 0 COMMENT '口腔破損',
  `Effect_full` tinyint(1) NOT NULL DEFAULT 0 COMMENT '飽脹感',
  `Effect_flatulence` tinyint(1) NOT NULL DEFAULT 0 COMMENT '脹氣',
  `Effect_diarrhea` tinyint(1) NOT NULL DEFAULT 0 COMMENT '腹瀉',
  `Effect_constipation` tinyint(1) NOT NULL DEFAULT 0 COMMENT '便秘',
  `Effect_lowHeme` tinyint(1) NOT NULL DEFAULT 0 COMMENT '血色素不足',
  `Effect_lowLeukocyte` tinyint(1) NOT NULL DEFAULT 0 COMMENT '白血球低下',
  `Effect_appetiteLoss` tinyint(1) NOT NULL DEFAULT 0 COMMENT '食慾不振',
  `Effect_weightLoss` tinyint(1) NOT NULL DEFAULT 0 COMMENT '體重下降',
  `Effect_gainWeight` tinyint(1) NOT NULL DEFAULT 0 COMMENT '體重增加',
  `Effect_other` tinyint(1) NOT NULL DEFAULT 0 COMMENT '其他生理狀況',
  `Effect_othertxt` varchar(50) DEFAULT '' COMMENT '其他生理狀況文字說明',
  `Diet` tinyint(1) NOT NULL DEFAULT 0 COMMENT '飲食原則',
  `Diet_blance` tinyint(1) NOT NULL DEFAULT 0 COMMENT '均衡飲食',
  `Diet_diabetes` tinyint(1) NOT NULL DEFAULT 0 COMMENT '糖尿病飲食',
  `Diet_renalFailure` tinyint(1) NOT NULL DEFAULT 0 COMMENT '慢性腎衰竭飲食',
  `Diet_dialysis` tinyint(1) NOT NULL DEFAULT 0 COMMENT '透析飲食',
  `Diet_liver` tinyint(1) NOT NULL DEFAULT 0 COMMENT '肝病飲食',
  `Diet_other` tinyint(1) NOT NULL DEFAULT 0 COMMENT '其他飲食原則',
  `Diet_othertxt` varchar(50) DEFAULT '' COMMENT '其他飲食原則說明文字',
  `Nutrition` tinyint(1) NOT NULL DEFAULT 0 COMMENT '保健營養品相關資訊',
  `Nu_panax` tinyint(1) NOT NULL DEFAULT 0 COMMENT '蔘類',
  `Nu_algae` tinyint(1) NOT NULL DEFAULT 0 COMMENT '藻類',
  `Nu_vitamins` tinyint(1) NOT NULL DEFAULT 0 COMMENT '維生素類',
  `Nu_calcium` tinyint(1) NOT NULL DEFAULT 0 COMMENT '鈣片',
  `Nu_mushroom` tinyint(1) NOT NULL DEFAULT 0 COMMENT '菇菌類保健品',
  `Nu_phytochemicals` tinyint(1) NOT NULL DEFAULT 0 COMMENT '植化素萃取物',
  `Nu_other` tinyint(1) DEFAULT 0 COMMENT '其他保健營養品',
  `Nu_othertxt` varchar(50) DEFAULT '' COMMENT '保健營養品其他文字說明',
  `Eat` tinyint(1) NOT NULL DEFAULT 0 COMMENT '飲食製備方式',
  `Eat_normal` tinyint(1) NOT NULL DEFAULT 0 COMMENT '普通飲食',
  `Eat_liquid` tinyint(1) NOT NULL DEFAULT 0 COMMENT '流質飲食',
  `Eat_bland` tinyint(1) NOT NULL DEFAULT 0 COMMENT '溫和飲食',
  `Eat_lowResidue` tinyint(1) NOT NULL DEFAULT 0 COMMENT '低渣飲食',
  `Eat_highFiber` tinyint(1) NOT NULL DEFAULT 0 COMMENT '高纖飲食',
  `Eat_tube` tinyint(1) NOT NULL DEFAULT 0 COMMENT '管灌飲食',
  `Eat_elemental` tinyint(1) NOT NULL DEFAULT 0 COMMENT '元素飲',
  `Eat_other` tinyint(1) NOT NULL DEFAULT 0 COMMENT '其他飲食方法',
  `Eat_othertxt` varchar(50) DEFAULT '' COMMENT '其他飲食方法文字說明',
  `Special` tinyint(1) NOT NULL DEFAULT 0 COMMENT '特殊營養品需求',
  `Sp_glutamine` tinyint(1) NOT NULL DEFAULT 0 COMMENT '麩醯胺酸',
  `Sp_balanced` tinyint(1) NOT NULL DEFAULT 0 COMMENT '均衡配方',
  `Sp_tumor` tinyint(1) NOT NULL DEFAULT 0 COMMENT '腫瘤配方',
  `Sp_pneumonia` tinyint(1) NOT NULL DEFAULT 0 COMMENT '肺病配方',
  `Sp_diabetes` tinyint(1) NOT NULL DEFAULT 0 COMMENT '糖尿病配方',
  `Sp_nephropathy` tinyint(1) NOT NULL DEFAULT 0 COMMENT '腎病配方',
  `Sp_other` tinyint(1) NOT NULL DEFAULT 0 COMMENT '其他特殊營養品',
  `Sp_othertxt` varchar(50) DEFAULT '' COMMENT '其他特殊營養品文字說明',
  `R_note` longtext DEFAULT NULL,
  `filePath` varchar(100) DEFAULT '' COMMENT '上傳檔案名稱與路徑',
  `AdmincheckID` int(11) DEFAULT 0,
  `Admincheck` int(11) DEFAULT 0,
  `checktime` datetime DEFAULT NULL,
  PRIMARY KEY (`IDno`),
  KEY `memberIndex` (`MemberID`)
) ENGINE=InnoDB AUTO_INCREMENT=6661 DEFAULT CHARSET=utf8mb4;

-- 取消選取資料匯出。

-- 傾印  資料表 FCF_careservice.Rec_projects 結構
DROP TABLE IF EXISTS `Rec_projects`;
CREATE TABLE IF NOT EXISTS `Rec_projects` (
  `IDno` int(11) NOT NULL AUTO_INCREMENT,
  `Keydate` date DEFAULT NULL COMMENT '資料建立日期',
  `MemberID` int(11) DEFAULT NULL,
  `AdminID` int(11) DEFAULT NULL,
  `AdName` varchar(50) DEFAULT NULL,
  `ClassID` int(11) NOT NULL COMMENT '課程ID',
  PRIMARY KEY (`IDno`) USING BTREE,
  KEY `memberIndex` (`MemberID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2053 DEFAULT CHARSET=utf8mb4 COMMENT='活動專案紀錄';

-- 取消選取資料匯出。

-- 傾印  資料表 FCF_careservice.Rec_referrals 結構
DROP TABLE IF EXISTS `Rec_referrals`;
CREATE TABLE IF NOT EXISTS `Rec_referrals` (
  `IDno` int(11) NOT NULL AUTO_INCREMENT,
  `Keydate` datetime DEFAULT NULL COMMENT '輸入資料時間',
  `MemberID` int(11) DEFAULT NULL COMMENT '個案ID',
  `AdminID` int(11) DEFAULT NULL COMMENT '轉介人ID',
  `AdName` varchar(50) DEFAULT NULL,
  `R_date` date DEFAULT NULL COMMENT '轉介日期',
  `refComment` varchar(500) DEFAULT '' COMMENT '轉介說明',
  `refID` int(11) NOT NULL COMMENT '被轉介人ID',
  `refReply` varchar(500) DEFAULT '' COMMENT '被轉介回覆',
  PRIMARY KEY (`IDno`) USING BTREE,
  KEY `memberIndex` (`MemberID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='轉介單';

-- 取消選取資料匯出。

-- 傾印  資料表 FCF_careservice.Rec_social 結構
DROP TABLE IF EXISTS `Rec_social`;
CREATE TABLE IF NOT EXISTS `Rec_social` (
  `IDno` int(11) NOT NULL AUTO_INCREMENT,
  `Keydate` datetime DEFAULT NULL,
  `MemberID` int(11) DEFAULT NULL,
  `AdminID` int(11) DEFAULT NULL,
  `AdName` varchar(50) DEFAULT NULL,
  `anonym` tinyint(1) DEFAULT 0 COMMENT '是否為匿名 0:個案諮詢 1匿名(線上)',
  `R_date` date DEFAULT NULL,
  `R_time` int(11) DEFAULT NULL,
  `R_loc` varchar(200) DEFAULT NULL,
  `R_way` varchar(20) DEFAULT NULL,
  `Aim_wig` tinyint(1) NOT NULL DEFAULT 0 COMMENT '假髮租借',
  `Aim_welfare` tinyint(1) NOT NULL DEFAULT 0 COMMENT '福利諮詢(原就業/服務需求)',
  `Aim_goods` tinyint(1) NOT NULL DEFAULT 0 COMMENT '物資需求',
  `Aim_volcare` tinyint(1) NOT NULL DEFAULT 0 COMMENT '志工關懷需求',
  `Aim_other` tinyint(1) NOT NULL DEFAULT 0 COMMENT '其他',
  `Grants` tinyint(1) NOT NULL DEFAULT 0 COMMENT '補助評估',
  `Grant_help` tinyint(1) NOT NULL DEFAULT 0 COMMENT '急難救助',
  `Grant_nutrition` tinyint(1) NOT NULL DEFAULT 0 COMMENT '營養品補助',
  `Grant_traffic` tinyint(1) NOT NULL DEFAULT 0 COMMENT '交通補助',
  `Grant_respitecare` tinyint(1) NOT NULL DEFAULT 0 COMMENT '喘息服務',
  `Aim_othertxt` varchar(20) DEFAULT '',
  `R_note` longtext DEFAULT NULL,
  `filePath` varchar(100) DEFAULT '' COMMENT '上傳檔案名稱與路徑',
  `AdmincheckID` int(11) DEFAULT 0,
  `Admincheck` int(11) DEFAULT 0,
  `checktime` datetime DEFAULT NULL,
  PRIMARY KEY (`IDno`),
  KEY `memberIndex` (`MemberID`)
) ENGINE=InnoDB AUTO_INCREMENT=16305 DEFAULT CHARSET=utf8mb4;

-- 取消選取資料匯出。

-- 傾印  資料表 FCF_careservice.Rec_volunteerTrain 結構
DROP TABLE IF EXISTS `Rec_volunteerTrain`;
CREATE TABLE IF NOT EXISTS `Rec_volunteerTrain` (
  `IDno` int(11) NOT NULL AUTO_INCREMENT,
  `Keydate` datetime DEFAULT NULL,
  `VolunteerID` int(11) DEFAULT NULL,
  `AdminID` int(11) DEFAULT NULL,
  `AdName` varchar(50) DEFAULT NULL,
  `ClassID` int(11) NOT NULL COMMENT '課程ID',
  PRIMARY KEY (`IDno`) USING BTREE,
  KEY `volIndex` (`VolunteerID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=512 DEFAULT CHARSET=utf8mb4 COMMENT='志工訓練課程紀錄';

-- 取消選取資料匯出。

-- 傾印  資料表 FCF_careservice.Resource 結構
DROP TABLE IF EXISTS `Resource`;
CREATE TABLE IF NOT EXISTS `Resource` (
  `IDno` int(11) NOT NULL AUTO_INCREMENT,
  `Inputdate` datetime DEFAULT NULL COMMENT '輸入資料時間',
  `AdminID` int(11) DEFAULT NULL COMMENT '資料輸入者',
  `dataType` int(11) DEFAULT 0 COMMENT '資料分類 0:無 1:癌症資源中心, 2:專科個管師, 3:醫院社工室, 4:醫院窗口, 5:北區醫院, 6:政府單位, 7:社福團體, 8:病友團體, 9:合作單位',
  `region` varchar(50) NOT NULL DEFAULT '' COMMENT '區域',
  `city` varchar(50) NOT NULL DEFAULT '' COMMENT '縣市',
  `hospital` varchar(50) NOT NULL DEFAULT '' COMMENT '醫院',
  `hospitalLevel` smallint(6) NOT NULL DEFAULT 0 COMMENT '醫院等級: 0:不適用 1:地區醫院 2:區域醫院 3:醫學中心',
  `category` varchar(50) NOT NULL DEFAULT '' COMMENT '資源類別',
  `unit` varchar(50) NOT NULL DEFAULT '' COMMENT '單位',
  `contact` varchar(50) NOT NULL DEFAULT '' COMMENT '姓名/窗口聯絡人',
  `doctor` varchar(50) NOT NULL DEFAULT '' COMMENT '主治醫師',
  `jobTitle` varchar(50) NOT NULL DEFAULT '' COMMENT '職稱',
  `tel` varchar(50) NOT NULL DEFAULT '' COMMENT '電話',
  `mobile` varchar(50) NOT NULL DEFAULT '' COMMENT '手機',
  `fax` varchar(50) NOT NULL DEFAULT '' COMMENT '傳真',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT 'email',
  `address` varchar(100) NOT NULL DEFAULT '' COMMENT '地址',
  `patientGroup` varchar(100) NOT NULL DEFAULT '' COMMENT '病友團體',
  `resource` varchar(500) NOT NULL DEFAULT '' COMMENT '資源',
  `memo` varchar(600) NOT NULL DEFAULT '' COMMENT '備註',
  PRIMARY KEY (`IDno`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=501 DEFAULT CHARSET=utf8mb4 COMMENT='資源清單';

-- 取消選取資料匯出。

-- 傾印  資料表 FCF_careservice.Specialist 結構
DROP TABLE IF EXISTS `Specialist`;
CREATE TABLE IF NOT EXISTS `Specialist` (
  `IDno` int(11) NOT NULL AUTO_INCREMENT,
  `Inputdate` datetime DEFAULT NULL COMMENT '輸入資料時間',
  `AdminID` int(11) DEFAULT NULL COMMENT '資料輸入者',
  `dataType` int(11) DEFAULT 0 COMMENT '資料分類 0:無, 1:醫療專家, 2:各領域專家',
  `region` varchar(50) NOT NULL DEFAULT '' COMMENT '區域',
  `category` varchar(50) NOT NULL DEFAULT '' COMMENT '資源類別',
  `unit` varchar(50) NOT NULL DEFAULT '' COMMENT '單位',
  `expertName` varchar(50) NOT NULL DEFAULT '' COMMENT '專家姓名',
  `jobTitle` varchar(50) NOT NULL DEFAULT '' COMMENT '職稱',
  `contact` varchar(50) NOT NULL DEFAULT '' COMMENT '聯絡人',
  `tel` varchar(50) NOT NULL DEFAULT '' COMMENT '電話',
  `mobile` varchar(50) NOT NULL DEFAULT '' COMMENT '手機',
  `fax` varchar(50) NOT NULL DEFAULT '' COMMENT '傳真',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT 'email',
  `address` varchar(100) NOT NULL DEFAULT '' COMMENT '地址',
  `experience` varchar(1000) NOT NULL DEFAULT '' COMMENT '經歷',
  `memo` varchar(600) NOT NULL DEFAULT '' COMMENT '備註',
  PRIMARY KEY (`IDno`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COMMENT='專家名單';

-- 取消選取資料匯出。

-- 傾印  資料表 FCF_careservice.Tracklist 結構
DROP TABLE IF EXISTS `Tracklist`;
CREATE TABLE IF NOT EXISTS `Tracklist` (
  `IDno` int(11) NOT NULL AUTO_INCREMENT,
  `MemberID` int(11) DEFAULT NULL,
  `assess_type` smallint(6) DEFAULT 0 COMMENT '追蹤類型 0:舊資料 1:護理 2:營養 3:社工 4:心理',
  `Opendate` datetime DEFAULT NULL COMMENT '建立追蹤日期',
  `Closedate` datetime DEFAULT NULL COMMENT '結束此次追蹤日期',
  `judgeID` int(11) DEFAULT 0 COMMENT '窗口評估帳號',
  `judgedate` datetime DEFAULT NULL COMMENT '窗口處理日期',
  `judgenote` text DEFAULT '' COMMENT '窗口指派說明',
  `AdminID` int(11) DEFAULT 0 COMMENT '追蹤專人帳號',
  `T_date` date DEFAULT NULL COMMENT '預計追蹤日期',
  `T_name` varchar(50) DEFAULT '' COMMENT '追蹤個案姓名',
  `T_status` tinyint(1) DEFAULT 0 COMMENT '追蹤狀態 1:已追蹤完成 0:待追蹤',
  `T_phone` varchar(50) DEFAULT '' COMMENT '追蹤電話',
  `T_note` text DEFAULT '' COMMENT '追蹤註記',
  PRIMARY KEY (`IDno`),
  KEY `MemberID` (`MemberID`)
) ENGINE=InnoDB AUTO_INCREMENT=2593 DEFAULT CHARSET=utf8mb4;

-- 取消選取資料匯出。

-- 傾印  資料表 FCF_careservice.Volunteer 結構
DROP TABLE IF EXISTS `Volunteer`;
CREATE TABLE IF NOT EXISTS `Volunteer` (
  `IDno` int(11) NOT NULL AUTO_INCREMENT,
  `MemberID` int(11) DEFAULT NULL COMMENT '志工與會員ID的關聯，無關聯為null',
  `V_name` varchar(20) NOT NULL DEFAULT '' COMMENT '志工姓名',
  `V_sex` varchar(10) NOT NULL DEFAULT '' COMMENT '志工性別',
  `V_idno` varchar(10) DEFAULT NULL COMMENT '志工身分證',
  `V_joindate` datetime DEFAULT NULL,
  `V_status` smallint(6) DEFAULT 1 COMMENT '0:休息 1:參與',
  `V_recbook` tinyint(1) DEFAULT 0 COMMENT '是否有志願服務紀錄冊 0:無 1:有',
  `V_No` varchar(30) DEFAULT '' COMMENT '志工手冊編號',
  `V_school` varchar(50) DEFAULT NULL,
  `V_major` varchar(50) DEFAULT NULL,
  `Skill_lang` tinyint(1) DEFAULT 0 COMMENT '語文能力',
  `lang_english` tinyint(1) DEFAULT 0 COMMENT '英文',
  `lang_japanese` tinyint(1) DEFAULT 0 COMMENT '日文',
  `lang_taiwanese` tinyint(1) DEFAULT 0 COMMENT '台語',
  `lang_hakka` tinyint(1) DEFAULT 0 COMMENT '客語',
  `lang_other` tinyint(1) DEFAULT 0 COMMENT '其他',
  `lang_othertxt` varchar(30) DEFAULT '' COMMENT '其他語言文字',
  `Skill_medical` tinyint(1) DEFAULT 0 COMMENT '醫護背景',
  `med_hospital` tinyint(1) DEFAULT 0 COMMENT '醫護',
  `med_social` tinyint(1) DEFAULT 0 COMMENT '社工',
  `med_mental` tinyint(1) DEFAULT 0 COMMENT '心理',
  `med_recover` tinyint(1) DEFAULT 0 COMMENT '復健',
  `med_nutrition` tinyint(1) DEFAULT 0 COMMENT '營養',
  `med_other` tinyint(1) DEFAULT 0 COMMENT '其他',
  `med_othertxt` varchar(30) DEFAULT '' COMMENT '其他醫護文字',
  `Skill_PC` tinyint(1) DEFAULT 0 COMMENT '電腦文書',
  `PC_word` tinyint(1) DEFAULT 0 COMMENT 'word',
  `PC_excel` tinyint(1) DEFAULT 0 COMMENT 'excel',
  `PC_powerpoint` tinyint(1) DEFAULT 0 COMMENT 'power point',
  `PC_media` tinyint(1) DEFAULT 0 COMMENT '數位媒體',
  `PC_other` tinyint(1) DEFAULT 0 COMMENT '其他',
  `PC_othertxt` varchar(30) DEFAULT '' COMMENT '其他電腦技能',
  `Skill_market` tinyint(1) DEFAULT 0 COMMENT '行銷企劃',
  `Skill_art` tinyint(1) DEFAULT 0 COMMENT '美工設計',
  `art_photo` tinyint(1) DEFAULT 0 COMMENT '攝影',
  `art_maker` tinyint(1) DEFAULT 0 COMMENT '手工藝',
  `Skill_other` tinyint(1) DEFAULT 0 COMMENT '其他專長',
  `Skill_othertxt` varchar(60) DEFAULT '' COMMENT '其他專長文字',
  `Dept_active` int(11) DEFAULT 0,
  `Dept_exec` int(11) DEFAULT 0,
  `Dept_care` int(11) DEFAULT 0,
  `Dept_peopcare` int(11) DEFAULT 0,
  `Dept_dance` int(11) DEFAULT 0,
  `Tim_Mon` varchar(10) DEFAULT NULL,
  `Tim_Tue` varchar(10) DEFAULT NULL,
  `Tim_Wed` varchar(10) DEFAULT NULL,
  `Tim_Thu` varchar(10) DEFAULT NULL,
  `Tim_Fri` varchar(10) DEFAULT NULL,
  `Tim_Sat` varchar(10) DEFAULT NULL,
  `Tim_Sun` varchar(10) DEFAULT NULL,
  `V_joincity` varchar(20) DEFAULT NULL,
  `V_expname1` varchar(50) DEFAULT NULL,
  `V_expjob1` varchar(50) DEFAULT NULL,
  `V_exptime1` varchar(50) DEFAULT NULL,
  `V_expname2` varchar(50) DEFAULT NULL,
  `V_expjob2` varchar(50) DEFAULT NULL,
  `V_exptime2` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`IDno`),
  UNIQUE KEY `MemberID` (`MemberID`),
  UNIQUE KEY `V_idno` (`V_idno`)
) ENGINE=InnoDB AUTO_INCREMENT=365 DEFAULT CHARSET=utf8mb4;

-- 取消選取資料匯出。

-- 傾印  資料表 FCF_careservice.VolunteerHours 結構
DROP TABLE IF EXISTS `VolunteerHours`;
CREATE TABLE IF NOT EXISTS `VolunteerHours` (
  `IDno` int(11) NOT NULL AUTO_INCREMENT,
  `Keydate` datetime DEFAULT NULL,
  `AdminID` int(11) DEFAULT NULL,
  `Adname` varchar(50) DEFAULT NULL,
  `VolunteerID` int(11) DEFAULT NULL,
  `R_date` date DEFAULT NULL,
  `V_time` double NOT NULL DEFAULT 0,
  `V_group` varchar(20) DEFAULT NULL,
  `V_peop` int(11) DEFAULT 0,
  PRIMARY KEY (`IDno`),
  KEY `VolunteerID` (`VolunteerID`)
) ENGINE=InnoDB AUTO_INCREMENT=533 DEFAULT CHARSET=utf8mb4 COMMENT='志工服務時數';

-- 取消選取資料匯出。

-- 傾印  資料表 FCF_careservice.VolunteerTrain 結構
DROP TABLE IF EXISTS `VolunteerTrain`;
CREATE TABLE IF NOT EXISTS `VolunteerTrain` (
  `IDno` int(11) NOT NULL AUTO_INCREMENT,
  `Keydate` datetime DEFAULT NULL,
  `AdminID` int(11) DEFAULT NULL,
  `Adname` varchar(50) DEFAULT NULL,
  `C_kind` varchar(10) DEFAULT NULL,
  `C_name` varchar(50) DEFAULT NULL,
  `categoryID` int(11) NOT NULL DEFAULT 0,
  `C_No` varchar(20) DEFAULT '',
  `C_location` varchar(50) DEFAULT NULL,
  `C_partner` longtext DEFAULT NULL,
  `C_startday` date DEFAULT NULL,
  `C_endday` date DEFAULT NULL,
  `C_manager` varchar(50) DEFAULT NULL,
  `C_teacher` varchar(50) DEFAULT NULL,
  `C_assistant` varchar(50) DEFAULT NULL,
  `C_num` int(11) DEFAULT NULL,
  `C_joinnum` int(11) DEFAULT NULL,
  `C_servicenum` int(11) DEFAULT NULL,
  `C_leavenum` int(11) DEFAULT NULL,
  `C_note` longtext DEFAULT NULL,
  `C_specrec` longtext DEFAULT NULL,
  `C_comment` longtext DEFAULT NULL,
  `C_issue` longtext DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1 COMMENT '0:刪除 1:有效',
  `AdmincheckID` int(11) DEFAULT 0,
  `Admincheck` int(11) DEFAULT 0,
  `checktime` datetime DEFAULT NULL,
  PRIMARY KEY (`IDno`)
) ENGINE=InnoDB AUTO_INCREMENT=502 DEFAULT CHARSET=utf8mb4;

-- 取消選取資料匯出。

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
