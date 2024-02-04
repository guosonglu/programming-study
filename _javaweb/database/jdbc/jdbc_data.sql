/*
SQLyog Ultimate v11.25 (64 bit)
MySQL - 5.5.28 : Database - test
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`learn_jdbc` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `learn_jdbc`;

/*Table structure for table `customers` */

DROP TABLE IF EXISTS `customers`;

CREATE TABLE `customers` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(15) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `photo` mediumblob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=gb2312;

/*Data for the table `customers` */

insert  into `customers`(`id`,`name`,`email`,`birth`,`photo`) values (1,'æ±ªå³°','wf@126.com','2010-02-02',NULL),(2,'çŽ‹è²','wangf@163.com','1988-12-26',NULL),(3,'æž—å¿—çŽ²','linzl@gmail.com','1984-06-12',NULL),(4,'æ±¤å”¯','tangw@sina.com','1986-06-13',NULL),(5,'æˆé¾™','Jackey@gmai.com','1955-07-14',NULL),(6,'è¿ªä¸½çƒ­å·´','reba@163.com','1983-05-17',NULL),(7,'åˆ˜äº¦è²','liuyifei@qq.com','1991-11-14',NULL),(8,'é™ˆé“æ˜Ž','bdf@126.com','2014-01-17',NULL),(10,'å‘¨æ°ä¼¦','zhoujl@sina.com','1979-11-15',NULL),(12,'é»Žæ˜Ž','LiM@126.com','1998-09-08',NULL),(13,'å¼ å­¦å‹','zhangxy@126.com','1998-12-21',NULL),(16,'æœ±èŒµ','zhuyin@126.com','2014-01-16','ÿØÿà\0JFIF\0\0H\0H\0\0ÿÛ\0C\0		\n\n	\r\r\r \"\" $(4,$&1\'-=-157:::#+?D?8C49:7ÿÛ\0C\n\n\n\r\r\Z\Z7%%77777777777777777777777777777777777777777777777777ÿÀ\0¼\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0@\0\0!1AQ\"aq2B‘#3r¡±ÁRÑ4báðñ$5C6s’‚ƒÿÄ\0\Z\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0\"\0\0\0\0\0\0\0\0!1A\"2QqÿÚ\0\0\0?\0ø²Š(½ˆ¢°¢C¡5 jcp¢¶ÁŒ¥¦1Å…™œ­Qð-g]Xhh‰­³Žˆ@Å¦@-Æº¬Úêõt±ÛC©t\"`	\Z`CG·+k}$pUG•Ï¯(cÝÏ	r\0}é<šY¥8*ãÎ×šÃ©Úv´Zåjhš×CRIq¬•†F›µmøçLñ7÷vt\rÀ–ØX!Œ‡‹]­20Í¯¾’&††õÿ\0³§†0Ñéã…ÍÓ|.¬š0•qvÓQÈ0åDM>6ÑëH#5ýÓnù<¨èûŽ\"(°_Â&C8Œ6‡Ý‹M»<žˆ8¯&#tÆÛ¹Â¯\" K„m0{Õ_NU×½ÒGõ,Á XÒ/²°ÆÑ÷F,ìª­Ã¨?Ñ2è%Œ-§hƒCp±Âº-w7jÍ\0O6ìÑD^]°YuÀVØbo©Œm¢|a^	³þ\0#` mo~dd@ÓYD \0´SA®¶²Êæ±»Þú\0ŸUðÏ‡‚ÿ\0ê¢–D\035À2‡#ªãË¨šŽ=Kæ˜Ù»;GZõRŸüDáô²7\Z¾‚ú|¥þ&ÕÄÏ~œ@\"\05$Qët´ugÄ‘Æ”Ç{XKšÆ“¸Š\'¢Ê÷mÝ6“çþ$›@Váfð©´‹¼ŠBpJ¼R¢lå5ÅT\nR–€…RŠ\"\Z(¢‰„QEdW	Zº%XU€BB \nº\"è nÚºB:\0r¬ÖÇ‹«Év¹’ƒ\0ˆéÞ¹jŠ7Œ¡±7©%OØî²ÊöC¶ŽWTéØñ†•6— f;§÷‰úW<êu³ögàdrˆiHÑ`‚\0÷GÙS5‘ƒp@Ês p?O¨ƒÙhò6¼íú]ÝOÝsE€Ñè…‘’00ºEz@°­°ìÓg²W’/ø»sK$tTYœ®„¥¦ï*™Æ›i?¼ÄÀc¡îÀ­Í†îð•,Moæ³ìœÔF¸¼2Œ+«Dáì„*Œ¬é\\vUãî¥É}”\"‘AÊ¢	AP…*p¦{!8Zt/Ù©ˆÝSÚªÌôtuß`²‚×§Õ´¾\\²êÚû¡0“˜‘õU¬E\0\0ÒÞÊËáÎõj$`\rh!™åÝËÛô¶¢q,$òÇt?¼Í{¡ò…c®\n¼˜è¸4¶ùûû!-Èú¡™¸íkRÌQÈ`´V(Mp ÀÎ‘ƒìƒÊ`°\0ZjbP8{ð)2è¦ÆÆ‘Ÿè˜é65k†ÞmS¨‘‹®©3ÈCš\Z1µ\nã|‰ETö\nºBŒ)8°µFÞTÖÙ5™Zcä,ìK3K:éÏ£šG²Ñ§e¸^>ãa?~ž<ãôQÒ9y:pAimöC§m\0ÔÚ¥r<®Mw@û¬$Ni†Ö‡Ü$Jiî«§3›#wr³¹™[ß¥ùVxM¤ÑZvY]#\0¢±é¢Í×«¤ŒíË’öß¦nAèºzq]}Ö;r1x]€$Å¢:	ÀÐ\"’YýÓA³’‘§@=Ó†û__t@úMâùAÃÚ8Ï(éì§î®ìm#à¥UØ¼ŒR½·Ž½•6€\"ùEI\Z¹§ó+ÅQ\"‡e/ž£ºpu\\¨>ImåNhð;¡s…†Ù2Y4wbú‹Î~.×ƒjÏKžÒÆ»µò»Ó\Z«ûöÃ~8{õ~-¤ðæ:š[½í<È‹Ç¶?ÀºøÎ±Í‘î¢]ù@ì¼ŸˆjŸ¬×êu2z+Ë‰í•ïµþW„~\ZZ—õÞÒx+Â1úHà³$’KôÐ\06•çÛ§{¬n7¿¸\'vëÝ8\rÎvÇbŽ\nAÁVÖ‹BB—`*B—jADA]aJµWÑWÑRj]+Uj$š°ˆYÂÊs\0¤¬À€ˆuÙe*×1lŒš°µGh*ˆ{YSbq¬WÊÏZk £…”+„öµ£òÒ¨ÚÖ×u®!gèµÒº\\qX€\ZžØY{\\ÀS¢µnì¯k€°wKú’ý4o€(%»DÆ³ž2¶1œa6L¶_[x\nnÎaÃ~™¾pèW,-iÚGÝwF‡yË@…Rh”\"§ƒû1Þ6õ	ñé[AÎ²@ª]xtlkìŒ¢±›«%Eäož?IÐ5ÀƒžRgÒ›L…Ü°F×Œw$Á ¹¤è–wNæ8†7€øYÜwÖ¢êÎÊw¤sÝd”5í;›GÙtçLu¹á\0z\nÊ[DY]WÆ>BÉ,a¤ç!o8ù#ÔãªamáÉdWL-X¬Yà+pu¡}—\nî\n@µHˆŒ!¬¦Š®«N„ª­Lþë1]ŒËâšFQ§J8B5éôý+kW® îó×W@=–ãNŒƒÐó÷Y4L\róe²íÀvÞ2µîÛõñÈpÿ\0)<Ûî¨X»?•KßíþU–Ø¿ÑCT7ÃGåBCÇLûªâÍsÑÈ¡ª¯Uc¢\0k·Ý,Q<¦tîJ¡UX	-Ãû,Z³#dhhÆÕ¿Õ,¸`t¬>6¢ŠÓzèJÇ)*&0 jc9S[æ\ZÕªd,ÌV¨E‘K:ÛÔo…«£§ªË¦ŽéutÑSqÂO?Ÿ~L‰ž‘Ý4Æ0H¤È£¡šèÞÊ°xTàÖ»c‘µCôHx¿•´³¢TŒøÂ}¥„Ç÷6Y#¢Øcè¨E“~È†; ]{.¦„UYYáˆÂèiÚ6Ô!4è…\Ziê¶Æ\0÷	·­-Q„“Ð˜h]¦Ž\0”-£7Ó²¶äšÊ01fÊ	ìTÆÙh¤Âš\0pÛÁPî\rºFÖß<rª’R4þ½û&n ð€\n#(ÙñiUJ˜#ç²¾•‹Ç\nQªJPw5Â›Iqqà ¥ØÝ‡\01îP9Çh»y I3Èè´î•å»\Z©Æ®½×”ðíõºOŠê‹e\Z—‚ÆG`žÔÏÆÚ™|ˆ|3Iü}Sö\Z<3ªv¶ô:Hô\ZcètMŠ*à=_Ø”4“©ÿ\0¯)øÿ\0RC`Ó5Ž\rË‰#Ð/9+£ã:§Ï­’Þç1‡`ã—k\\úuñç¨mÐÜ\r^%à¡\"•+¥T*(… QE:BiY\n•ÞPQ@)ž0¥Z”‚[;¦ap\n66ÀI¦DÐI µÃ†ìË¡YöYkNŒç¤Š :­‘ÄF?TZxšãéãªÜÖÆÊ#%a­,¸´Ñà¼VsKTqÄ¦;¨	p\02›iñÆâ,Ð²µ`$òž\"\'õNŒ9ÃÑYåh† ÑIYÚ¼Â›o»Š6Å´üeiÙ›ê­‘äžë;ZÈX\04ß*GŒ¦˜ñÂ ÊIRèÃßØöIòaèàV·1FÇ›SÛHÀèKO§ŽÉ/¯ñG¡ìº²DJÌø}©9£®<úG¶ƒ]W:m5P¡ì½3šMq÷ê“6Ž)zmwe®y:gqÛÊËfYÁî²I¢hËÑjü9ñê%¾Ý/Q¦{IpZºxù%sïÈ{\Z>ž9û¤=‡þ‹lŒ§XRA²BéÍrÜ²×ê®»#|yÂ°0­•„§¥ÛÙ(vTÎ¬Š+½ø>7Ç4”2Ûu.9Êõ¡{¼U³Fê0Žá%þ¯¡µ¡‘GêÛG€­¦úsPÄ÷™¹ 8²Í&9Á£m86±Ë¾T<éäÐnEð… n.mwø=“	¼{öAÓƒVj°«àß¿tDßýæû&Gê¥ØÆmY¢Ú¾B¦ð+(ì¿T@.ì*Ò\'o©´*{MšéÝfÔ†9à¸ÚŽ×ˆù%T­S×ˆ­ª‘4)ªžÆÐk‹]8†0enÒ²Ü;,±‹ø]M|,ê÷ã.Ž–0\0ÂêiÛdVz¬zf\0éé›bŠqãskû\ZÆÐÆ}”szRsZ\0Bán==Õ9»gso„·°e¥Í´$c„!nTluÂÒcêÊ¶4ÝmNDËvp¶FÊ8ê“3CŸu¶&P¾Od‘¶š´\0 ck‘„æ4ß·)4žÇºcö¡Â›lw¾°V!!‚6Œ#ƒ|tT[Ô}Â\"0)½háXéð¬ V¹5„\0‘n¿èš/AêùLoDS°;¨Ò[êcº™ÚGê¡8Çõê’‚áÉ±¹Æý’·4ÿ\0ËåÓ\\i®u\0áy¿ÆZé´^Í.Ö«X|¶÷®éŒùÓ\'„x·êüLäi›åÀ]ÁîRøƒ`ð¹µÏ{€˜´Ññì\\Å®¶ŸLÝƒG£€zc\08Ž\\óÊñŸ‹\'3êCží3kwäÍ\'=¶Ïtòº°Æ–ìkš×gÖl’²t]Fø|Î€Îøä,ÎG_uÌw4Þ±Õd)ÍÚ¡‚¯ºf¥Q3EQŠ(¢	Êˆº$UC…\n–¢-£¢Ñ!-­¼­ZfYÊVØzX‹²åÐŽ?§JÒ°¸Tº2Ûý—6´è†ÄÆ5”\rw¤ø#\0žåH£¨÷ZbiùXÚ¥²;úöLqØ£Â¨ÙYëîŸGE¨Èãk@¥ 2Â\\kCFU@íèˆ6‚0ÞªégZÂvÚ¢ÚOÚ„‹*;\\$°•mm\'+ÚÚÊ,”bêµíBæ¥Ù°>:<%>+Èåo‘¶)g-£\\]ª1<4ôwV®|ðcnÛ>Ë±0±ëéÔr²¾,çƒÙ^uÑ\\öòšø{2;t\\·džBõzý(¯I%¤d/=>š‰\r?\0®î.NÜ\\¸êöç‘ÉvBáMOÛD´ò“¶Ã›Û…Ó/n]d·?D\0[¬pšÜ·ŒŒ%ðïeqÏ ðâ½oà=ÇS¨hÃŒdß^‹ÉœºÂ÷€´íl2NÛóÀ×ž?±EssxË×5»\Z[^–»ÈÃ¨dò0ïð¥8¿Òï¨Z›h–îÁãåKu\n\n£Ù÷ÉBþÝPAÝÊ£Ò”EÔ=ú¡9i\rLƒßß’¨\n÷ÿ\0\nÏý…~š>ü \0dú›C­,zÂÑ#m®úBÛy’\'\rhq7µÇ‡Ç”\nè«7±Q€¨…a*¬Ï&±9ƒ8),Z#=:r|mõ.Æ ÒåÂßP]l…š¹¿Ë©§h]H[xX4Àc£n§²¬¼>oôk@®mS›i 2(ª ‡njS›\\p€„çJ·î…*Ê&Çïe1­ö¢šÆt#Scáj´µ´Ÿ¯~˜AQÆÒ2˜ÖÑû(ÀCz`¢<úyI+n\0ÍÒ FëB\róýš¾¹L†w\Z¥D“óÙQiYÍ‘Ð¤bi\'7T¬Ÿì©¶,•	-< „Ña^+%PÉD{| ÔoÕKÀÅu*èPíú $œ·Ÿú Ã¬ŸdMÞv5¦Üî€å|#oøÆ§Å$¦Žâƒü´~,žmkãð}ñ%h’W_¼¾ý$1è¼:=>•­m6Çõé´ÏˆOˆêÿ\0fÓê&2»M˜q[¯/êu\"M’Où@Ëô‘Èã7ò½oâMv›JïÙ_¤Œ´™7>‰??áx}G‰\r;&dDÜ™°i½3í·zò_‹k<ñlpÃ\" Vr¸ÈåÈlãØ [7Ê+<ªQ\nEQ3EQQD‰t¥áR‰’Õ´YB£	*­ÚA]ŠÇôeÑÒÂËm°éhØI¨-ð´5Þœ¬°š:ð·BÚnçRãÝo\rkœMÐZ£\Z	1‹\0·…¡­§|,íi!Í×õO·Ñ%œ§Ç‚¦¯£˜†šm0\n-T†Ž=‘\0…¿JcG\n-i˜\nR‘‘•U•ªD¤Mer¬ÒJ.ji	v¦gŒ¤½·ÑixIpOµFw6Å,å˜ÂÖáId\0ªU9šˆ÷6ú©y­[H”³ô=W®Ô0óF—™ñ˜öL%±EupëË›ägÃ‰9Úë¥Ÿ‰.°V½Cw\0æä,¯æ¯C/?d‹(FIE\'ñ	è«¯Èµ¤shÿ\0O+éƒ\Z·—¿ÓCÐ+û•ó–‚Mu\"—Ö<é4z=S¼«q=Ñ§È¾:tjÍý\' RìÝÿ\0ÑvN1ŽU\rµ.5ßú*#<«o\nºý“*9ëÕ·Ñã¢«î€\Z¼•,¿²²+s„Ð¤^+€BÉ©.?/e¤\ZÍxYuNõ¶åïH8ù%Rˆˆ%B{ \"\n­¨¢O&3+L#+<bÖ¨†p³Ó§\rq\rõ]}J=W%€Š]]48µŒ¾UË?«µ§¥­Ñ.|œÒèÀ-s^\'6|´³<üªuu\0û«aôtøV@¬ôVã°³wÙXm\ZéÑ]Y´T\rah¾™	ìÈ‚<“@æŠ;k	0wÉê[bûû!h£Hð6Ò@Æ^þè€$‹÷BCD¢hÏDýÑ´dßCÃ¿U`ÙöAt\':©X ÙÔ\'Òt°UôP’]Žäv#º A&’‘n-t|ë¬p¥sV+²Ï®ÕþÏcZçÕØ¯ü§K#@\rÚâNG+‹ªÓWˆ1òÝE—4d7µû ÉðÍšXªÖ8V¡ÛÜã’á©ž%­ýƒK$Ïk´¢ÑÔü­L\0O,“[Dcé¼uâxœ³Èc€Ñ&ÞçžÈöÓí\\oÔê¥•úLk^G”7^ð¼þ¢MÒ8–7ŽE«S©|à¹óXf\Z?e…ÃíóÊ×9é×3ÐnÏeQh´QEE@EQRÔ@ER²Dæ7	mKYMµ:ª‘m–Ð]m¦6ï•†&nhèéÀØÓÀYj¶Ë£	\0×$­±«è°Ç‚ÓÂèÀÞuÉ¦ÙkˆvÊA\0	àaeZÄci6?©Ø(¨«5©)må4`©­$0Æœ%ôD8QW!—j\0„\ZLµˆ£i X?¢Gú4²2Œ@ò‘ô[ÂK‚kŠS°ª-Ã	C²\\EÆi†<Òóž2ÚoW¤”`Ø\\mF+\"ð·âöÇšWžÔ6…r\nÇ.[w·êº:ätî>Z\0‘fð½<<½ø)çÕÍŒ*4UÐÙ}ú!s“ý®m×SðÞ‰ºß\0·xm¶WÔ3ûH-kv‹îŽü aö™ÖÂO,=¬Ò¹â`l²ÅŸÎ•yÜÚî¶9­Ù¼ýWê…\0\0P•;é }$niîˆÐRbŸ…	Æ(Ëü«¬ßD¡†ã’UlãÊ2(çä*²A±XM Ãh„Òí2ˆa>×J€7þØ¸ÈYµQ³Ìní—·©[@á½~?](.ÜNÑôŒ*^*ëÂ…¶6åQmŸo¢ú’E+hDFQ4aWi™ò(…-0RÎÎxZaæÖzo™å©„®ž=(®ldZêèÇ¨ZË¥røË­§Í_QVº1qì±iÆß +ìµËÃæ×éâˆÜ9TÁ¸8<¢¬ªŽ:¢3uJÈ¡hšú+\0g¨L*1Fð›uÛÝÁ“X.ÀÏ\\¤H,Ÿ„C&©PÉ÷EUGº„×§¯uwU×á@aÅ¨Ñ´„YîðTinÜã·²!ŽìÞêSuT\"³Ñ#qæ¬+ßŽ)Sq‹RÏ8@¢nìvSy{BqßMr²–Âù1M®ß#µBêë…³VöùºÈ\\?Ô0È4q¾‰!Ò–ãv>ŸŠ@Ìµ‡Ç¼Ah¨ˆßD8s#‡á|ë]©—Qª|³#¹uð»ž5¯n¿Uû’\\\"ýÛO°^iî1¸¹Ž!ÃZb;8óõ…<mÂ	µEhÞ\"Š(˜EVt‚”VU ‘ELÑE\n ¿…`+5¼¤®”ÑêZjÂDu¸­0\rÀ…\Z\\j¾€:ÒÙ¶•›LnÞ«tA U,tÒV0ÞàzÒ€ûõX Ú\Z)nŠˆÝsé®[bÊ{RcZÂÆ¶ƒ`´c”\r°ŽÅ©X›‡&–ÞSyQZAa1¢ÂŒ&0PSWÑhéFŒ+\nÒ\"O*ÁÂ,á«%”Õ–ä—§·à-FPxTqšN\r.€Šýyøq|]·¶Œõ÷[q{gÉ<<äãÑGêë™ ¶—^k²ïOøšâ(Ô/??¦G\0z¯OŠöòùç@¯FyW{ßz—\0>U€¥÷N(}ÂÞ8öúg†°Aå1ÀW‘±ÄÍÎ­3\\ÖlÁtfÚRâõCY\r¥À­mfã#Ø®<WR¼½{¦Çë½™iÍvD2ßè†ç·qô¸çãÈ-ëhJ¨ÕtR±Ç<£ ÕPàW(ŠhïÝBÛ#§pŽ®Ía\ràÓª ¸\nÉ(jÝ]Õ^õÕS‡\0šD.¸dZæëšçLIoBº=@ \nÁ¬\0Ê1^žéž_1pp„·4›D:°®­aÛêfYöd©U„âÛá˜B;+IñswžÉ4™)ÓÏ†Ø~ »:>†ª×+DÛpë·£etê£§?Èäê:pŠkeãß„ˆ[@-‘ã•Yxü´èÇý‘¢ºÝ¨Ág *ÀUÃøá@ÞÊV~4_°åQö&x¤lçþŠš68M\0öHn@ºDš\nW~7\0öÂ°íþª…ƒÙã\0œ£hÿ\0ú¥DPaã¨8t¨‚ €ë®r¡6¸¾-L’Hâú«\"ò5kž7+\'ÙP¼V)K²}’\nd÷BÒvAÃ~QØ6•©>HN$zEà&:añ½H‚=Œ-ý¡äÐu%x¿\ZÖEv„Û†éd»¥Ñlñ}{e–I,ÈCªÏÊÞ‰^G_­dº‡yC÷Qe¥ÆË¹O3·Ou²µ–ÀÝ¤}!§öùXÞú‰¬»$î%-Î...6I²©Ã+y:tt‡¥*QDÔŠ(¢\r¸SBòÛ„;ºDIQ¼«\r¼(àG(%U(¢f…Gt)ƒÝ 67ú¢‰èšÆPKx¢BjÍíL“ÞÖ˜©¹&–a€›ê£”Uzif¢6¹kRÊÈtR„«a-\0›\n.e9§¦ÓLÇºI\\^J)ÞÃÊÝ§×½¤ov:âm=|­mc¥æ´ºï0€ºðj.óetæöè’õ@×Z`YZÖdlN	-)€¨­#C0ÞéLu\'5Ö¢®\n”áR‰\ZÊ±Â B²´.V¨•5E¸e	Ý„Lá”Q½,á3„H\'Å›q×z¥Øpç+‘â£Ó]\\­xýôZé’hÚtÖrC*‡Uã5\'÷®¹ö^âz8Ý5¬^çsžîî^Æòó>g]N”º8žæE€p\\„xû-\'ÃëÐ[»õêºÞ~½>áÎý¦\r&ÍÁ³ÄÐò{ñý—U¯ÙG¬-Ñp?Êu>œò]ËIöáwHß!ŒýAÛ¯ÙKÌßú­Q‡lÚpìã²¦Âî•ƒm»Áµc\0WÊ°l{ŽGuYp¨› Ž@¾ÜÛõÂVœOÂ»Ï7J9¤¶úõ¤MPÇýÐ».ï]U‘Y•;èˆóœü.7ŠE+µ ¶F´`®Ël8YÊÍ;\Z\\ÒX\rµ3Ëæn)W¶Ñ¼9ÕžÈÃNW\'o®ÎHsOL%8QZ‹Rdjr–¡„pÙxTBÑ¤‹ÕkG?&ºt´Qfév´ÈèV\r|.¶˜À¢ŽžW7\'uª!M\0t[biÀÊD`mã+Tm®¦ú\'#‹tl‘ß²fÚ\nšÜŒå0-å4m~ÈÚÿ\0*ÅÆz«³ÏÂ\0ØÚªë„m°,óÕ}Å“Ç²6çòà —¶œ;+®¤(3]’¯t4ãC•ud{)Mu~ÙA„4]Ö+6¬\nú+<·á_Ô8@ŠshŽêÁžxÂ¯~ªÆGùHÕ]î½•“TàÏeAÞª¯º>—–Ž‰\0Êê¢O\rÎøÿ\0Š:\r9ò½EçËqo {.‡Šk£Óie•ß\\ÚÐ9^>ILÓJYIxèb‚MqžÜ¿{Ù›±­¨Ùî:“Ü¯53šl3‹]Ÿ×:W·lq3c\Z:{•Âq.­Ý0µÄuçÄU#{\0Á9AÕh¨Š(¢jEQÝk÷Fÿ\0¦–%¢\rêÔßB–/&RÒlt=Òž1»¿k¶ê#k\0·½ß¢Å5±Å‡òšD(RŠ(šÖ9	Ì\"S¨-Þ%RÖÖñíÑ\"FÜŽ[\ZßÕ&Vl(íQV¸0Et¤ÈNÚÒ«¢Ö‚Úä«\ZV¼\n•ÉF{­Ð:–ZÕŠÎ{b—@ñ€ÜwY%‚h\\;w¥é# €N-kAYÿ\0-ŽœñvòÑjß…ãáutž0Y‰8öê]áŒ˜n`!ß‹¨ÑË§&¬…]ã~ÎçXôöz?†AMw=\néC©ÿ\0uóX¦|n±Ñw<;ÆœßL†ÂÇ“ãþÆØåÿ\0¯j×ñÙ9®¾«…¥ñLµë|s_UÉ¬ÙáÑ›+¨ÒXõ‰’XNcéeZÆâ®ÒCŠ½é(íÊZI*ó8yqo9)[ÉB^<ôIG9Á-ÎI’v·“Ac›Ä#eú­\\Í¾ŠØÜ÷a!ÒV¹Sø³/ÑÁ÷X%ñØ³Éákž+Qy$wÝ3\rW7ÄN÷BÒ0]`…Ën¡äF÷4ö¤Èõ2™ãÔv­gW´^YLñ‡ù^3ÎÚ¼QéÝzÄ³ÿ\0éÙA\rq·/0án+·ãN§o;å^ôdMÝ#YK§ª¾áá•¸—‡ÚÂÃ¥¡4O9§‹×_[¦Á´:ž7HZÆŽÆÿ\0Ùt~¼íÞ«·ø%ínŸPÀë`}\ZébízXEjõ/ÜNÆµ™éÊòÿ\0ƒ[³QªŒKšÇ\Zù¥é fã¨p6çÌAûþéW$òØÁQóÏT@–šâ²Pv°UŽÝ¸_D2B{EQ&Ã…á]X÷V9A%‚1ú!sœÛ\'¬\r§ÒêªŽúsÏ µÂ”p¼“öBxäÚ¢{w@Ë…ã²çë¤JÐÃ€Ð·¶·…sõ­i”*b<#›OøE_en²Ž¨]._k™à¢d’,ÿ\0Þ%UY¬ôC¸®––qÊFž/eÔÓÇU|žF^WÊäé³LÁc¸]Xc²Ç§fBéiÙé	¼j0ÒE¥ €;á}“[œƒGªÚ6Šr±Û¡Q¢€ÎQUÝ`÷(LFç4˜ÑTtÜ„ÏË„)c(ºàŸuGƒð­†ñyAVìr®«åP9ùTñŽi*±Å€¥tªy³bÀ’M¾Ü  9ïž<\0‡ßª±Á òƒ\0ÑUdnÊ;­)»tÝuëò³ëµi´²Ë3ÚÖ°&I#YoÀ\rîËÍø¤òkõ¬Ò5ÀÅód}]‚TãŠLíAn¡çÓ´°þAÝpüCVu\Zx£û¥{[AÀt]?ŸÉiÓ´Ûæõ¸Ö\Z8pu$|·<FH°}ºÿ\0„f:xã‹®‘ÆG“V\\xXÛÍœÒd®Ü\\îùÊr¶Ï†ðÉÃƒíü¸]v		³:B\\EÕØKêœ8Š•ªMH¢Š \"Õáç÷ÕÁä,ªØòÇ7”©7FDZ—–š‚±ÊnS›OÕb6WÔ9IÓGæH\Zã@¥©ÍÛ#›ÙMF´`£NÜû¤3éåk„a˜ùQ¢­Ñ×²GeÁ6æøùNúõXÚ¼ÇVí´…ŽÍõ]9`‘ù›•Qð0{+Î»mõFËYºLÿ\0î!ƒ‚åŠBF(ŠIu§õ”zu£ñ­µl+T^7äWÊóN±Ê¸Ü/Ðr¼9¢|‹—¯Å´ÒVi1ïÓêAh{n×Ñi‡‰x›túB\"l‡Ó¼ð»:Ï\0ñ=¡Ñ˜Û6ÖîqŒô\\ûã™¾+«žêy„êü,¹€Ì“K$N!Ã×SO¬{æñŒ9Žå«sY¦2æSävDÞ³|µúMO&–gÄáÍsKÐè5Îx\rvOB¹ïÑñÅ§i›å¼\Z 0§’ÍÅg7+ÑÅ.y[#}ŽW’2VøŸt¸µžòè6E\"Ì×eIV¡¤‡:Zæ’]ª\rÉ †}FÞ2WU6¦Rl6•çíì]XïOâðÄ2ð~/Uø‚½0´¸ÿ\0eÉvŠYIÞò2†3«œVó>Y]nú\'Qã:¹Mð;,ŸQ;ðOÁ]Øü>A,²;­±BÆpÖƒì.s<Dÿ\0µî¹ZOÕM[éç%utÞ\r#ÎqqZ\Zí¸¥¢7Ö	 ±ß.«lðæ4\ZvpÜ¬RFÏ=òHª]ÈO~ëM0¹ÂÜ\\–uKXŸ=ø‰ÔÈšà˜KÀáyâ-Ç§UÚüDðuÁ Økj».DmÞ÷_Å/O‡üÇ•ò/ö­šh*?–U9µÙñ#ðßÒ¼’nÏ½‚°F€7v×m¦Ôö]g™®ðø(µÑCnö8Z¼ÍÞëáA²Mk‹\\[\0®¸6½„‡FCë¢r¼ïá¹Kô^!+EoŸ`÷5_Ýz0‘ÎÐ	êŠçä9¤c#ü¢ì£‹žç8´4“À\nY&ÈÕS¢ªWÇ²\Z=Ò‰G\rÌ-ªéð¨QäcþªÜNEÚ=B®ˆÊ ²oØû ¾Æd©œØ)ÇKøè€»·ÞGÊÃ¨“Ö/&»-œ»&×\'Zdáîì…fvòê)£Ù`o§”Nmü¯2×ÚæVwŽ¿Ùg\"ÉZÞ+	M\0œ­1í‡7ˆn˜¥§egªÍ§oèºZVYù]Y|ÿ\0Êßu®åt!ušÈ8[â3Ê·­£Õ5¢Á¢ƒG	Œ ýÒ%´PöÝFÝ_¿€«âÐ:@NQbéP4¬qi–*²­‚ˆ\'.Sñ•l\'“Â=³ýT¾µ~ÊÀçj³Ç¨`£³	ã»(ÒG¦Á!Y jÕ7°\\£³B(Ý•.›ÉÇöS“Î=Ôp ÖÐh»8¿ÌÌaqŽÐ9î–3éåÅgÔÈ\\D1_¨Q®‰5ÚÖFû–¾6´·k¿2áF\\#‘äºGí¼µŸ‘Ìk=MØÑÍžë—-‰—æ:÷<ÿ\0P•S“ªQâ,óA,yk‡?ð¼ç‰LÙ-¸î ›TøáÔ°m1¾ÚçWÓð¼¶¢@^áí_eyŽŽ8Å8å£¢¶šÃ²8Ùµdñ\\¤ÂyT£”LE•JÕ&¤QEE@ysCzØ›µ ðãý–u§ÌkšsÒ’\"dËÉ(\'áÊ‡(.Ž-l`–œZÇ¿Np£DÙ	ýØëì·1¶þ9œÛ\\\r®¤Ýdr>ü6ãžI1[Úx<!:Baw§-?Ñtï‘›Z Œæ®{»¿WŸÃšg@(î:¯M©„†s]WX—páoÇÉlggU‡W¡{š$‰·_P\\Ç0‡QìBö:RÒÞ.‚tz(evó]öUü×ÊðMÞã‹ø_Á$ñ\rX{íGEÎ_IòµÎckÑ¶½—7C&–Ãû²yìº¬ššù›Ž ®.~_¶»ŽŽ.Ÿø‹ÂÎ—Qû^›ßS,ÛÙ£Ãé{}×«ñG²g†ÆZáÆW™’ÙµÀ¡²šso‚¯çªê¼__1Ð¦‘h<°]|§ùc„4Aíî¦_4÷ê\0¯…ºÚÉ§n2ºP2Ú²äF¦<§@Y5\'mûác=ºdaÔ:§•‰îisË@êJ-S‹dëËø†®i¤-y4;.Î?³ŸŸ—ø§uÖÔxÎš\rÂ&:WW\'…ZOÖëžY¦cXê¶ŠåyÁd¯¥ôãÄ`:iôp¿K[!gªûn]˜Ï{‘çãärroß‡—ŸUâ0ÝLoi®Ü„ý&½’¦WóE}_§ÓÏ8w”Ñ}.ä/)ãß‡bt&hXÖ¸¶.|òc~,uwÉ=R¢2“ûNóXcÖ˜5n2ySDXþý–ˆjôòl»À!Äâ—oI6·PÑa§¹<„¹8º÷áÑÇËöñ×—VG¹À0rQù`5 Uõ´½4/æþµ.ÄùO\ra?XOs¦—Ä¯âïó5ó‘Ã]BÒ4qïxi;z„.q‘²=Ùœ¦À}/ 9•Dö^¾<f<.]wk†4ju‘DûvÙoìžé]&«_ªšMÛ\r]r?ÊN‘ÿ\0²ÃûUí—! õ@Âñ£‚ê’W\rÍö»*Ü\ZzÃ0ˆâÑÃ&w—LáØÙ¥éd.·î¹Z8˜ÉÛÉnÖ;¸õ]3{ã9kŠNnMvÙ~¼d¥äÖRšì\n9)X}”3?ª«î‡v¢/¢8ê™ÏT·šmuAºˆ«T÷ð7| †]bû¨\rr*Å¥ï$U^ìƒï)­>ºá*X·‘|+.%ÅÝ–\rdÒ¶P#²Ý©¯<Z(G9Nœ¨“ ¾ÝKËý}¶Ìe™Yr9¿ª­ñŸ#^+l…ÕÓ\n-¹Ú`/Ùu4ã…Ó=>sä_.„-È[\Z(óž«4\0u»Z›´{•NHkGµ„méM : `È£ŽÈÎ\0##ª1Â¾òó“ŠV3þÈ²iXB0ˆv÷H.ý=Ñ\ZpÈUV*ÔÜ ,\Z=•‚oÙû¢9£ ½ÆÕÙ##ŽPð,«²hÕ‚2Ž‚Œdôµ:ÕÑ¥Wì+¢¹ ß¢ä{¦òpy_äÃ$ú¾–ŸtÖXé?1Àºvyr=¢ÚÒ\ZßsÝHsº][F`Œ¹ÇÝ#UNy2½ÍÆÓ}Iãôµ«FÑ:‰åÃ\0.$õ\\mN¥³hØÁq.#šè…GÆõº@ÊÝ,žf>qýŸ”WN´VŸ›ÎÔ¹ÁÖÖznõdÒÖ;8ç‚Ï~Š5ÇEÂ¥¨¨­RfŠ(¢fŠ(¢(¢ˆ¢Š$XåWTc„‘ýAnÔ\0Xr\nÛªìTh«tnÚöåu4¹\0‚¹›4º\ZY(¼,6¾;åØ‹ ×	‡ÐÆÈÞXê#Ù\'Nw°[‡à¸ôôqæ*x[#C›–œ®~£I½–0Bë5»\Zámè©ÐfÇ)c]ãíçâŒÆhØlô´‘îµ?KgusÊYà×AÕV·*øñaÌ„À·ÔÐ’ÝÃˆ{½ŠÇ^]˜‚xƒ}WÙ&}$FØý@ØwTèá·YZÙô¦ò§Òõ|2¸±ú¤ÁE®œ±Šágs™®]ÞÃ¤ŠÅ•Ó‰”Þ}+ÞË{MYrUñ³¼,s²ÉÆ?²Þñi%–Hî³ÍvGR$c‰Š0ðE\\=g‡C1hp1Èz¯S«Ñ¶Ú.º,AÞª4áÍºø¹.|Ç76&üWCøYÓLÍóÏùy^÷Áô±è l0¶‡sÝqâ84†ìwq…¢öS<4ôG\'.·â¹ññ¦};¯ÚïS±X7Õq¼WPpÂwõW$’86g½õÅñI&?ô\r­¾>Xãé‚(t»¨\\-ñh\ZøÜXöÝŸ\04\ZkdqÐJîµ’229„Þ¹ZZ´²xôÂÔ?»~ë¤úÎ~/›ËÑGÑ{ÿ\0U|3í¹óëëÇkÌ±·¥w¾3. jUUoæ»\0uVÇyz†J†ž;ž‹Öx:òÝ¨qq·e´@=tqDâHrZ<¸ï©ëþVB¨Õºòì]cÔÂïø\\†pæä,ÿ\0r›‘Óâ cy»OÛ•¹²Óöþ^irc;$am‘d×µ­±¹ÆÏ~ri¾9=Nè;ªQågk‰¿èJ½ÙÉ´ÓÙ¤FP™H$uJó0+wwL$ak÷Øv6R#’o©H2²‚Lsì„œço•Á>®R†8î¨Hç!\0ï6‰5k&¥ÒŽ¡µ5ÏýOD¹%p ^¬8óé^[ôž^S§hlÎK{$¼YÊý}´¿Ö3L,ßN¨àÂ·2Ç²t-àu]X?äë©Z´Íí…ÕÒ´ÕÑºX4Íõ\nîºº|g“Êéæ½é²ái\rÀ®Rap—Ë[(€xöC–¦« £WÈ²­àm*¸‚+ªµŽêºÑþêt`^)N·”…UÊÆ\r^ä•m#§)z@°j†\n#]0–\rQã¹V	ÍpP³ŸÑXÈ±÷UV}E]g !85šVÓš	÷Â«ªÛŸ”.³ìO	2;}¹‚«ÒeP.mÖÒšŽ¦Å”Œ½KœØƒ#äâ×3Ä\ZÓ&ŸK©€î?¢Û$ždÅÍä­o°ê¹Ï§êcqËsê?éHÙ|Ro/NÍ;~—¿o°÷ø^ÅµQé4­Õ¨˜qØ.´ò7U¬”œ@Ó_þ«ÉøÄîÕëÀÐYÀP<ÆüsË›1ÿ\0ÓÆ\\IýVwò>g~é(\rëÝ(’FBÙÕÍ\" ])Ð’p›$b6Ëð‚+¿(UœaR¥\"ŠÕ ÑE@EQQD(›Í!FÎ‰2>ij„â–VŠpO3ÙM¶#ê[´ïõ‚>ë›³Ö–Í;è¬õ|WfŸMg+¥ÜÚ=W\"XjèFâÒšëK‹qèqWB´±ßSVˆøÏe”s2¨\\×¶Ç#‘ÙrëÃ·ÀsÕ-Ì–€-ãÊ]¯¦g0c\n5–´aˆôDtÐ\0†éSœŽ“­$…!ÊHô½àÒÖF:­š~æJÃ¤ÊÜ¤¬yqRœ\0Œò¬‹²©ˆ9·¶ÊãÏ¦Úìc6¡¥“QÎ8Zcv&æ8ñ´´EÖV˜Ü¸Z&FÛá]Ñu\0M2¬ºœÈÛÙ5±ð¢é@c(&A43\nŽ\Z£¾Ã,àC“ÙxÆ’‡xŒP´úYo¾W·ÙknIö_4ñ­@ÕxŽª^iôß…ÝðóÞ»p|íõŽ‚^imÐuç½fd\'ÒùBÁA´.Ûemð˜up`;$û/K§‘»Ôt´Z0ÉÛ˜×3t¯íì^ýcc*«„,[fw«ps÷n#Š]6j^ó;ôIéq¤œ<š$±ÍØwQkNkp¾R4ñ¼î¿VÛZ[ôÿ\0D9ô¶n\r<ü©ùo”MçiÂ¢Þ§	 7@ð;ª.Ç‚£€u_Nª§òáºò…Û¨‹¬£-¾J¢ß|#²\08mF‹;°k•`{®‡Ø t±‚pi^i´ò0­¢þ¬XPº\no˜ò\\RjÃ“¨73Èþë;Á&Á¤ÇÓŽ‰dxµæIåöz¿Ö ÀOœw@ÁNã+DMÿ\0WÙub<•¾åi„V)t ËqÕc„dt[`Ë{-Þ&¯u²> ­,ºoÏ%\" ,vOöá	4AIÂ!’©˜9÷Tq‹»A çŸè¬ãªxÏú”²O·dÅÇ*Ã€Àê„o\nXn@ÂtEŠþedÖ(áSM°ú®¸÷TÒåÕ\0@ú²HWtï”;‡AŽèŽ9=Rã@‘ÕE`ñÝS}D»ý#„D›\ršÂ:ÙC\r½¿%*gy0:ù\r)™3[Æ2uPçjµL`?ºiÏøHÊ£wýnnÖ´{ô\\¯”Á;ÁOÚ#kG¸]IædšÖ°šŽ+.eæõšÚ\'|ä6¼·¦}Òý^gu‹Äõ_²øc‹\\¤p-® ¼œ’?ÔKŽyZüKUûD£L¥¡žëž÷t%k˜íÎd€Íu…Te®k\Zò:À\n–¨£ß#\ZNIE¨q|¸àcà\"iòÚ77òÕ ‘¥·ñ”$‚¢…EFµJ(‘¢Š(™¢Š(€Š(­Hã@‡”ˆÚ6šlg¢XÈLü¾áM0Ð–ˆ]G²C2-2?ª”Pëidt]m9ÀîWHóm×cNn».NXëá®¤@íNc2Ü9‹[cáqméñú27^\n4¢Î½QV}µén ´dÚT†“…`\\ê	/‘.ijÖ9\'®«lç·>õ#D´ªŠÇçÙOŒÝ-f\\ó}ºÚYö]@ßA\\ÍmÖ8]p?v¹ù]|,„e\n<eWUÎíÈ©¬Ü)0@XGeX¼š*Û·1VÕ]¤¶3)¡ªEY4‘¬Š	º°ÏÂÍ3³îpœ‡Ä:Æèü:wØsv³<’¾yÝº’»_‹|@jµ‡Ñõ+•§hÛ‰Ú½ÇôÇ—‡òù~ûñé¿Kv”¼:ÚÖóv]o„AÀ/‰ƒÂæh\Z	¡åÌ4ï…Þð¨¶j¥5ô†ðzu[¼ÎMtèøt-kåÉä¸{_tp1Á¡Ûjý\\¢ž—mÛ{u¤D\0<M¡Ëod@À`÷ÜI>éÐÆ=‘†m­¡|#ˆP 4àôARÜÚ~2ÂEöL>¢E*ÂA`îP0´{*-<Ÿ²oÜwBZhõIoNÀ3Vg5}Uµ™Åç4îâ•´0`­¦þß¢T´6‚Ûôòµ–X®·j˜°mh#Ý8yy™l…•Æ\"ŒŒ‘’®HÏíYîŸ2JâÆ_KÍÍõ’eýXÚ r¬pìš]Ÿ›¾ÆÀZ~V¸\\½ŠÈ\rŽå:C‹¾«GŸöòéFEŽËCH<ý–(uEhß@uB¡ûð¡uXÀJ/÷ÙVðMÞR3®€ì:BL’üœ«Ìär‚<º°¯x=Vo3wM÷I¥¤<\0¬:úóÊÎ×[FO(šì¤£ìÙ\0«y±W’–ÒASp.°…°ú•êP´š9Â¹i¬è±„:‰FŸNéOÔáè¬’Rš]£Ó™\'¥Œ/ ŽIW¨sœè#c¿6áŽ\0ê°ëf3Hæ;Ÿg7€¥YŒZíO‘¥quî›$œP^kÄõlo‡³D×_n{ÇZ8‹ê[ ‘¬#Ë.ú‰^[U+K_6wHÚ\rèÔó;tñáŽI\Z]u×9`#à{Rª\rù+wGBŽ‘Á½{¦1¾tìhÈ’Ë‹@=SÅAÜHþ¾ÉG#.¦GGêdn¯ê³LnCYv4ºhôñju-ÓHèÌ¶áy\n÷\\iŽç—UYÊQ9(ªQEkEP¤KT­RjEŠÇ)+QD@¤Lå\n¶à„–e¢º&·!*.›ŠšSHÈÍæd¤tèÈSJ¶i¨u])ô…Â‰Ä8WEÖÓ;®nIáÑÃ]˜	èqÙt!8•¦xª]C§ºáÜòõ8¯†ÆåQnP1È­béŠ8Y¦8+CÎ;_¨lL=ÕbwFµ3;¬º™@.\\¹¦·úM„2êŒÇ(z\0W~8ú››í¯²NCLn^‹™NWWDÛ®Á=uÐâòîø{)¢óÖ×Q§Ò°h€lc\0-£-\\<¯KŠ3Èr•¾Šd¡fq¥ƒ²50Ù	Í (Ÿeji´t%	Rð©$¢š\n”·¿”Ì>‚âøï‰Ñ¾KÈ¦åtf’M›ì¾wø‹ÄÏˆë´Ü1úYþë¯ãñ}ôæù|ßÇÇgírËÝ#‰q$“n>ë«áÑ6M.¡ÀÙ‰ÙãŽ …è4Pµúy\"\0‡±×­/_©\'‡ÏîÑiŒ^n©Í²Â¬wì½\'‡ÆÖÅ«;\\	-\"ÿ\0)åy¯¨ž52b)703±þëÖéÁˆm.ÜÖ4ÿ\0Ì@RæämÑ7lm‘Í«ËÓ˜Ð#.®8¢\\FÛ#pÜâwD:ò‡:ãñ—Žy¥#$´àòœßNïaÑY\'Òx@\rQÊ²3÷Mk[e´£Ø\0<€„–(‹P°™V½ev+)‹3Ÿè¡ŽN\ré^èhäUžé‘E¶¿T-n-0s·¢§\nÊd\n¢²jß3$\rˆ»VÐsáeÔƒ¼c§trK/Vÿ\0•¤3hâ•½Ž\Z©lQ%4q•Ïœ½.~^éUÇýÚ¢A\0pŠCBë„‡;¯Yo%ìÖ¾œ›«¯è±¶L÷NŽNýÕ²ôè1øçôMùX\ZþÉžmRT­›ÅZ¯4ü¬n”ŽxAæð; 6™E*2Š÷µÌ4B¦9Ùþé“g™ÛÃñÎV6›)±ºÎ8	^î*þÉ‘“ÍáfmñÀOŒ’IGÝ~Š]m@çbÏÑ·¡÷IPá{o²TŽ.’8û]”NÃHÝc©Hkœã#Ï¥»qðƒ&yYŽ–Cô3\r\'²âku/ldSœÂC‡RV¿Ô\\Äj»®6¥ÎleÒqW}e5¶#™âl-…¢Ã?y3›Àö\\T¦@Òk\0K]V©ík›\Zón\'ºäLw<ÖE¦c¯W<ò„ãhœqJ€ªì´üh6\rîõ^;‹Lr¾I\"c\Zk½.¬ª†8ë§ÉégùF×·LÌ:ªÏOu(¾Jñ	$–{‘Åò8úœM”Œ‡‚\\NOeUL/üÄãá*G¸Š²Ž€\rÚ¥2¢³‹\n”Q#Z¥aB8A©XåR±ÊtQCÂJ(¢DNÎxZ›KG4µÆnÒ æ„m9ã”\0ãÝ[O¢ŠÕ×cátàvG²åEÈ+£§qä,v×ŽºÚwPny]…ËÀÔRßÂáÜòô¸¯†øÝ„Ðå–7kR†wÓJó~-9 …ßÔd\\/Ó9Û‹OºßãÉ/uÍòµzðäÄö›=xÊ=Ö(r²jšý$ÅÜÆþOd—ëÚÁ`î+Ð“¿O3ëã·RÙ»¥ÙÐ8X¯#ˆ‡:žÝ¿³áºÃc·uŸ&|7àöözW£<.ƒ^6apôš‘°lu[Ù¨,…æo¾ÞÆ2l¥!ÙI›VÒí­ÏöG·4½¶ém4å©†ÂË^ ´0ÐÂu¡Ü‡u!%HG?)2ÉØå[Ü²Lý­sœà\0«3¿BÙ\'—ñO‰þË£0Äêš_OÃz¯t}–ÿ\0\Z×~¶Iz}-øŸÁÚøü_L<“ËüœþEž¸û®îž@Í,24šÝ±ßp¸Næ—[@jA¸‹i}û€¶rëÉúrvÄÙžLqJj½ùÿ\0ÖÂ#sWæºœzÊò¾™¢{Ž¸áz­!,Ò¶RÛsÛæÜ•:rò7º]Œqm÷ß^«Øƒ†ÆçådÓ0»O¶P7Yuûž¦Èé\"Ý!·þb‡=9¦˜{ž¨E1ãoT¶8—mè®COwSÑÒÒlû¨hŽsÆRƒ­Š lRA\Z}x(‰Ñ%×|”`Ø÷ì‚ý\"ÁÏDÈTMýPIB¹Ê(óc•¹öCbìÚÁõ O	¶Ü+}Wåá4dƒV-eŸsžâ1À4©P\Zˆü­dÉ6«m„zÃZÙ¬-)Î«¬œ‹äßö&gÕõY$yå}]~…dØÆB¸ÇÚÚëÿ\0)ñ¿Û¢Æžßå>\'Z(¹jk±ì¬¾‚FêB÷ã)\'£ËíP}Œ¬åä*´ÇMmrQ‡~«#_cªsI¯ê‚ha±žSšR\ZODÁõqöAt×ôÚ|Dœuš>HÏÙ=‚ùá%CÀºcMª¤ 	!½²‰À—Vr’ [7t\'“©–ç0`†îÏPŸ+š\0$SBäë¤qtÄ[KÙ—Ê\n‘ÊÖNÓ!s¶6zî¹šœˆ¢ÜA}:Kà¥k{Ëáa,A{‡¹èªãëõ#\"÷îm8öJ{tñÇ3Ä%%å­ªcˆiaÝC¹÷G(!Çy|«»-cª(²Sâˆ½Þ¬4\'°I`4·iâs¡ò€¹íßdÅ¦½¦(ƒÜ(þì‹	ýãÆçS@«Zµr$;ÚíÂƒØ¬ò†Äyêãî„åSJm®¤œÿ\0DDÞzv@¢jC•J(˜EQ#XVr: )X9TU·”~‡¥\n·*A©EL-§k‚×ÂÆS w§Ü)¤ÚÃc	‘Æ9Mo=”ÑžÆ—JÁâð¹> x+£¦p4\nÏm0êið?²ßúZpW?Ní¶u±Éþë‹sË¿^c7Âk_šî²1õGôWæºËêèû4¼Šî²LÀæÕ\"2Úì\'™Ó=ysõz&JÍ¤Zàê<Ìw c²õ†ÊD¬´G=Vùå±Ž¸»y	¼2V\'á7ÃÌ4A±ÑéÃƒA\0‹C©ÑÄÓ¼1¦º€ž¾LõÓN/ŒÉ¢á¢Åü.ˆsäa{¡Ò†Ó„öÛÇ?¢âäßwÄz¼xê{&\rI½ò¹Ç·EÑŒ\0(p’Ìä&´¬­ív`4ÁF8C1^\"I{…%}¼Ïâ¿ýŸH!Þ¹¿²ík\'dlsä~Ö0[—ÎüWXín±ó;é?HìoÅáû_µq|Îo¦zžë%àª4…cÔ«0š-ä8[%~Êˆv\0”­$^f¢6ž²žñ·Xæ‘m ’{t4s†xvª§9Â‰^·NZý)\rËš)ÇØ/åþæpÜÓÅ/Oás9ú;]EîÚà:…5ÏÍè\Zh	GÃ]|=Éåmààý“]bÚ@«IÉØÙº»›¥lpsîÕ1Ûc‹ÿ\0uqS‹ž8.Àì€<Òƒâ­S¹öVÛ³ÕN7Õ@oà+£ƒ\\ª.Ç(%žjÿ\0¢Qî‰Æ°xTlŒ¦]V^âkõWÏT\0ÝÖqWdÝ ç<\'<d÷J/khÉ¯J×ýt·\\¤HîG	šú\ZÙºeeÜx&Òˆäÿ\0@”Ý›áe‘ÖÐ?²|„+œr®„nå27íIÊcNJÅÓ·ìP9×T:å	¼Ê°,öÿ\0)\"Ä\0“Ê6‡\nLk(\0›/Ø¡ dd`ÚÕT(ý•GµÇû¡!lV3Çdÿ\0\"êŽz#duð´±´\ra#*6qÉ)ìŽÂ‚3vÔæ€y69û €Y=•½”Ðxê¢ßG·÷A¬ykZrãÂJ(Ûåm‹cNW#[ Üñ{œ÷Ø\0+ìºº¯ÝiË\rsð>WÅŸºVw1{“É¯Õ.šb9\"]šI5G{‰üÏ8ÿ\0uç5Ž,‡Ê¼ŸS‰ëy]Ÿ-ý–60‚Àà^ä®¥¿¿0—z[œªÌuâ3êFÙ8!$•r$žJ ­»63–Ö6çåu66•ÆK=À7®ibÐ†²hœá{M»Ù®Y5šƒ+Ÿa§k}‚H¾Eç¹óË4¾©ÝŠè0±;sÈªÑV]µþ×ý^ÉI²Ü{„+Ð[€h_º\råi‘®¶†·kˆËi!â¹D>ËQEQXVÑ`¤jWùJŠÉô”…!‚¨}Jÿ\02b)ÊÊ¤QEmS\nVÒZl(yT‘6FûêžÒ°Dý¦–¦xQaµ0Ùø[ô®-sk•³M âè¬õŸäG×ºÕ­r°iÞÐZ0ÈäüÞë“sË³Žø<1Í t•Žüu÷Xu¥íi1Ù#;TIÝmç¦çMuY´Æ?¼¿íºº/,qgØ£oŠÌÖçuñ•§ñTÎízØšGKW$@“X¥å#ñyx\'K<Ngœ¼R‹Å¨ß9íë´lÚÃþ®kº9£kØæŒ^BóZ?ž	»×þ•ÙƒÅ¡š2dJÃxÔ®¬bÉá£O¦¸ÝÒº¥ƒ’âìáŒ&ð¤^!4àA;:3HÐÆÑ8sŽ2f>Ë\\ÓòŒ8\ZáGEm1¡8@\n²êNbs©e•ÿ\0`ŽGÕû®ân†5†ç“þQÝ^3÷½Dro8ÏÚ¹?ŠüKs†ŽÜÈGö^eÊä{¤{žãn&Éî›D-<þUìqãéžž\'%åÝµ6&ÛÅáIXhØ=UéÝ±û†OE£6½nÅ%àf–ÀÑ4}SC‹ÇÅÒNŠÙ¹;€@ík¥§‰î¡ÀãcOÇ_Õ.ØjùaˆŸ*VŒ6íÄ®ÿ\0‡&&ÅVÝÙ‰/”7‡È]Jô·láÎ.´­G%î;0)¯i°*Ó#©Ö,;éU¼–3ÓžJý‚1É<WåIÇbß!ÚYUyMÒ‚[g…l‰Ý6,9ô1Ñ	ºD\0#Ž¸à_!Bl7uaUm²x(?1®8ô«=&û\'\0úgÆl#vyÈTqôäÓJ7ú*ÜNkÝÞè âÐSØO¸°V\r]‰>†ÞÓd}Ð€ý£k¨R\ZaÏñIíóÖháesë=q:é½5êY98Œõþ”çg)Dg“\\Ü!\r¯u]‰HÛÝ(¢xç²(À •RÀ¼¦±™QÆÀyZ#hma$Ú¦F\0´ö0rhuDÆún°z\'FÀ’U¨Z5–*‚sYCÝ\0,ms”ö´\ZÖ‚ Ñ#AŒ÷W`4ã¯ê¬œ+«ê#! %®ïÔ$o–O³AéÝh¦ƒŽy¾ËœD;Ç/q(Q2=®™Ïæ(£5îõåõ³9ìÓÂHnç—;ß+Ñj]äÁ.ÆÙ\"ëÝy‰^Ûó>¦Ä)£¹<¡®,~­Ìcˆ†6ÛUÆ/$I#ýEÂ‚Û¨xÙ-¾åö\\ù‹FÐÑîB¼Çfa$YVÞr„›6›hsKÇ¦ò­G´9ãõv\n‹68²ÀpÉ)‘IË3Üàÿ\0þ„áô~@ì‘ c¶õàW\nâif÷œ4býÕìxp‰ž©K¬íê·êc\r•±mn‹H]0ï`6ã+±ð•¨¬úwgy]²èÜ›¶´{÷Hñ¼¹]ƒ}»¥ni\n‘8QöUÂµ\'EdÕ*%]Ù@ˆ¯¸öSªºþÉ(\r½Ôáª¯ •åRq)iÏû%§Kº »/ªŠVTB¢Ç)Ñ?4Œc)`rlrp²Æë	ìöåMŠv´³9[bšòp{.$.¡Œì·A#¹µÍ¼·ã×QÖúŠ’€æ9•Š	ñE?ÌY}z¾Í¹d–;Ëuí.²éD2ÄÆ˜›¹Ï\0šà%ê#ç‚âö\0o!]îþº8·=SÛápÎdlc<0÷H“Á¦aÓ+N’z~àMýWSIª£{7SÉ¾«=kYzâÎ£Ì–j!}HºÕ¯`Í•ÞÔ~Î%–¸€²´ºi½Ô$P*//sË£†eÇ.”ž£ª\"Éˆ»\"ÍÑuLp7u›¦ñÝ\0\rsT™ ÿ\0…wMÌëÛ+²÷±ÁÎœÇpº~éÌm|¤›èUia/ ¸]pJÒ´ããág­Kã§\'¿\rM~¨çÐJöX¼K]Ž#,‡r³“ízŒîægÙ^/âQètÆWŸ_åguàõZ—êÜù&6çÈ¼S]7ˆjœùMv‚ÌÎ¢¹Öàá˜¼o‘Ïy5zôQå:µírQìQF=Bø]Ë“>)ú§y’6›ž¨#Œš«¢êW»÷î<€0Ÿ¥#VÒîï¥uÛ^˜˜–ÖM9v¤Ý:]†Ý°4ßBò¹7ÜN{‹<Ë½¬`‘Œ¶œ\r4v÷KÛ—“Ås|=…Þ,Ö@Äã©]†æ4î¯-à_úº,š@È|A’QÚ÷ú-¾ÍôÒ/soá*ÇUÙqF3À°i\Zdv÷q}xUFf±îu€*—B\0Ê¨ð†5n¦‚:U*ŒâýÓ¶ƒÒÁBÖ×¦¨ É=»«ª\nËqŽŠÈýz \0Œ_NÝPY¾žk\nY#n>ÉÂVÝ¦Çd#Vã^ô„ßû¦¸¤ZQ}Ú7å-àßÙDð:Z ØHfàïd.¢@ê¬oÚ6uBñá‡Å#i×Nk;–0×ÂÑ¬Ÿ~¶Mâ‰*€²:…1;Íš(Œð€°5i|G¦>RK?UQ™ºýÂ.‚lƒŽ-HÛgoTÕÛD`ŒR{”¦ÕU”ø…©OgFÑtœÆ›Ï\Z1Ù5 ž—Ý\0Øï4P)Lo¤æŽŸ¢BÛ‡Ê&›çî©¸ç”bÈÊJ[læ«Ù\\B…×“ŽjÑ’\ZÀìð˜¦Û =%&JlQ†Œmî »êxþ‹.­à˜ÒpÒJçxœ¯\ra¾Okáy¿w“£Á¢ïpî½‹Ë²0×4\\ƒÛ•ä¼iæ2ÌÛdnú=ÏšßŽ8³?q»qoæµÄ¹ÄôMÔ<¸¹Û¹è“ÑjìŠÂcZ\\º]\'ÆðØ\\Ò2]`û&hïSÜ[€;§i	y®Äz@=ÐKB-‚¬±ÎWCÁôOžA)ËYšîTÔêõ;o‡Fýot…¾qo®Aùo€N„é¼?Ï—ý\'¨ÿ\0ªêaÔ§$ŸPóèy´\Z>|æ8‹dlxcOÕÐ•=¹¦î«‰¨•¶pÀeÛµ­û”¹ô®:W0·ø®¾ì¶éôït…Ïòni-›^Á¥‡<9ÍhwÒÏD¥m90úè8K*Ý—*ZÆÈ9L`äª‰†GmZ6Pî!$QT2Kl×D5ýJÇ¥\rPFñt¸á@«ª°¨rª&¬‹Z\"turVrin‚!.Œ3ó:Èû$›í…EnU\"4DA\n$P&š¥¦7åeZ¦®:»ÙjŒúqÀ\\Ø¥Å®”ëÕV±Ô<ß&‡œ­y\"‚ZÛÀá1‘‘Î+‚²Ói)Žcˆ¶ºÇ<’@ïSl|.Œm \0þ?²qÓ6V[†ìÐYý¤ößöäÅ,rÌ!®#…®\'g¨8²ÉàŒ$íôû…\"ð‰ÚïDÎøroK‡“Y˜7n¸Âeýºá|>aVï°F4R6²VYüvN[Ð\ZkŠ©iÓÃgs²;)œ7çÝj‰¸!F¯üN¹-1¸\07•¼Ó(\0=’uS²Ÿ$Ž\rc¸©“ºÃVNõIÖê™¤„Ë9¦Ü“ì¼oˆø„šÉ]#Å4}-ì«Æ|Qþ!¨–&ý\rÜ¤HÏÜŽ\"ïºô¸8&<éåssÿ\0%³>™†\\Oumoª‚AFZmtöçÎ{*FÑ¾…Fÿ\0\nú‚´jXDM¡ŠIc‰Í¯º}³Ôê©–~åt¤hktÌÀ-aq¾ëŸpÜþeº@^öÖlbÔÚ¼FÏŒ^9}ÏuØÓ—\0”ÞÚküË\'ÅpÑ¢ãm¤ý8t­&Ú9ÿ\0+šòu®š^	¬ö(LSø”Ï1‚Üû.Ÿî4ÒÆÓcÒåçt;çiv\\A²ºÃÄ\"x’ÝÊÛìàäâ³Ó±¡oÕìl|-±°\0O¿¦¼:9(ŒsÊ×­í\0;k¯’­É¬Ùí¼œPîƒ’¤gÌäâ‘@­§ŠC:\n¬ò¯v²º${¡x6/ú!!§*”5Ó€Çõ@BfÊ@,dŽ–…Ùæí	ª5| xöDàœóß¢ (ŒßQÝèm®É„ÙBæ“´–Ž8ó\ZÙëXâã‹åmÓêZ[ÊÇâÖªZW1º§ie¾’³ž]šãûW®a¶Ýe‘ô…G«k\\t·	CÀ<*ôäÖ,fÛé7‚ª6Ñái{w)m2b-Q7ÕÈãªÌÑn+dc„ˆæQ	¬\0¾è\ZÓÐ¦¶‡7„š-4P´f¾öŽ¸HÄ¾:¢É>ÃÍ«²	´€Ž\\\Zxî©ÆÍtî„»>“dôì£FçQ(TI¶\'Ži¸\\Ø]çÎ®Þ)«dïýÞà9ÃZ°Å(Ó½Àz¤\r¶ïÿ\0„SŽg‹OûÉI\0†;i÷^?Å%/ÔÈp>“ïÙwüaæ6<€KÚëq^WU&ëê$§ˆëâË†Í!PœÚ¬…£q4p.²šã°sg·d{˜$U#!®{ZÓºÀ´Ê¤Q¹Î$“ÂöZ\r8Òi†‘ôÝH§¼Ÿ¥£ås<F+gÔúc`;Z\\Säšiæ0Dæ¼×ïäwg|±ä½øtN² $fœy†Lï^á²ê\Z\'~ÝÎÃ+–Ï\0ü?«s|Ùát\ZcA¦AEãØv^ž\rŸDÃ©‘»¼±Lcxµ6²“¯æ5mnƒJçjn8Z+g@{{¯¯ÕN¡Ò‚ð»Ÿ|[öÝQŠ:1Ä‘wnïkËÛœUã?®œN¢‰² V´i´î{·×¥§%U­ÓÆæ\0mîëÙ<Ä“š+Dql`mzÝ‘ÝªÞÐÝÖo c²°sž6œŽ„î–FÚV¹Zmï9¯H3qnîJr´¢Ó÷	da>JÚsù’ˆ«TT»TöTŒÐWWHÓ°Ž™þ¹\\¡Õuü4îÓ’Q«á‹_ŠZK½MøY‚éx“¡‰õ{vïb¹ÀW=R”ò¤C\n.‰ÖjU(Ü…´ƒcË0º:I²:®]&ÆòÒ§QS/IêµÆÐæÑïú.WUÝucžÈ®«›y­³á¹­Áõ]pµiÆ+ú.O°“|œ­šyÁË\r…Ž³[ã^]ˆÀ<\'ÆÖ“uƒÝb†P\ZiiŽLÐ—QÝŠs¢%¢í(Â¯m”øÝcœ+ymgÓyYŒ#š¥a€n9«I–f±„î9%95Nõ=ƒQ#basÍ4$ô^ñŠ?W1„ˆÀÿ\0WÊÙâþ.uo1ÆH…¦Éÿ\0Q^vwHIê½Áû^_ÌçîuÃêëv£s4Íµ…¿[~Vßuˆãè:®Í8qþhakv6ù9Føéà^S!éÅá\\ ~Š{òÖª#Ë=kE0Ž¥o”‘›Wk-/5VYrNéšvî“Õšcƒ-›2\0ªJÐŠ–[Æ)?NÚ•…Ô-Ê4¼=ƒ±1„}~;.ÄÌ¨åh»kW/Âñå‡~Z\'î»2?ÌÛ°`…ÁÉ³¯>žz]v¸µ¦ý!×ð¨é®½Vz®ÄQ4êµÀ€:®n¾?*wlÅåk÷zsòg¯&mÓ†Pcƒêì«³áÑøkãißÛY6myO;ÝàœÑhw§6¼þN>Þê´tßÙµ¡ÉÎVöG¥‘ïp/7àY­s*´þ-,$sHþ«NÜzã{Iôoa\"?U,csO«Ë¥üRö:ž,.¤% Õ6¤1ýÉI[\"²=Êª$\'»Ní·„­#–¥› ÆSIdUÊb‘8`Ïp©ÂøH\0·á-â‰®É…UY«á0]S»Š@òßN]Çåá0Õö=Ë+Ùµ¬`#o)ÁÄ©úÉk‹\\mdûºŽ‹§<­’y/<ÀQìr°Íéèõeî¹\Z=[ô’ùrp=×{I«4Q^{Ä~ 2Âõ$84Þ½v\\™š½–û©m:ÂÍ¡xsZin«SßO?Yê–ÐC½¹Zã’Mû\'Æ@²¶m-£›ÂeU©##	ã { 	¸ª*¡aOŽáãœvHÖxVx±”$¨_CA„]Ž\Z˜Öÿ\0ÌÏ)0ŒœÛ¸ìQºÜágŽ1ÊÏ9úœxh\\N¥ì¯ˆ÷ŠoµåtuÒyzyA7ÈÏºMŸ½sª¢&Ït½´Æ{qüvax2[·ú‡r¼ìïÁ	úùL.\'u;\'¿ºÄNJ×1Ý‰ÔÁV3EWôP\ZV£	Þë<ô[t\rh;êÈúM`ëmsÞFW´ð/ÔD74LÑ¹±?é”ü¥Yònf3è´zÍ~ÐéÐE–‡}Rü/UøOÁ|-ºA®ñAoc½:FæÜ«[øsö9tºí©­’I2ÁË;Ë¥áÍ‡CbI»sÝÊÊë¦uéÜ˜ÉªÕ6yX7†z8c+ú/øçÇãÓÇšÓ qsKO¥¾çÝOÅŸ‹™¢ÐïŠ?Îö»×!ÿ\0|ëQ¨“[©/”›<õ)ÉûZc«ä‰^\\OªóyêP¶·\0M¨äŒ·Ÿ«·UPÆ^CZ	$ÐªÓ¿\rÓiŽ¦-ŸHüÇ·uÙ{\ZÈšÈ›éŒSW¤«ƒGû+fŒî™ÍÝ)ÿ\0O²ÐØ›m$ÝJhy!¬Ù˜çzÕh#`{ÅsÔöL˜‡H\r`t=T‰Á‘_±µŸm2ÈèÁËÝ.Ñð‘+\ZÝP\rå¼­Ía‹}X!c–Ž©äŒu–µ³Ã£êx]¬àÛ²™¨u8‹I­§¦V£Å)´²ª&¢êøIý×ÿ\0ë…Ë¿eÒð¬µÝÃ’¥×mÒÅæiõMº-Oî¸OÁ#·ÓÂÀøõDrøHeæ¤mIJ3{´uÑ`Z0”À/å]«-iaVZijŽ;Í(ÖºoŒvCaqGä8ZÛ#Œ\'61\\¬¯#¯<=¹Ñ±ÀÝ-1K#MŒ„çD7\"Ž:r›É*¿ƒþj¬óNLÓëžÉ)ÔtÓ¥ŽP7G÷J>Nb˜g)ûfûÁÉ<æ;ZmNð,Ðçåt\"Ô9^r¦71Í5Ø­Œn¨VÒ×6óŸÊêã›ëÌéÝn¥ƒ‡oÔšÉÂã±“Ž^Ð}•<·Ô÷8¬~Ž™/N„þ#M6âêšñ—QLk:Êf¿Q´‹Ž÷¸ž¥upñOuÍÍ¿À¸ÔuÜ¬³áøè´Hhme”ÛŠíÄy|õLúÛò¶Ì/VÖsNXYõÑˆëÞk†ÿ\0„oÃ_ÆÈëö%9›Ÿc‚w²]YÝ‚–ZŽpà6–]·×†I~—W6²èEê]ÊÙ©Œp8$X+/‡Ð›qè.–“Äí•öÑ¢$=î¬‡øæ=Ì\0ÝRt ¹?êq5ú­\n–MŸPo¤µÌw|6_3Jçãx »\Z|iÜòsÉ\\MÉ#\0ô—4¼{Ø’ÄØ/v+¸\\\\“ºè”\Zv9š‡5Ãÿ\0„Ÿ½„¿€íó[HÝöZ´á®ÖO\'f†ü½ÂtÚs>Êo! þÍê£“ÌxòZçQé” á›F«OåÊú1Ñ :.Üß?fSÈÀáqŽi[¤s˜ÑdÍ!lpþ1°Èäº^§ðÓôÇE.£RÈË˜í­¾¥ya—ú-0FŸnâ]º½Òe¬ö÷ìÒHç5úIÚãêh8Z_áºð\\Ö¿©¥áô:É´²‰b‘ÁÃ¡8+¹âÏ\045‡<R®åsÜXèL×Dâ$Ñ×G6F1Ü#gâ½\\Ñê´qÊáË‰å\0Õø~±Þ‹ÒNsµ×D¤_ZYû‹By ¦Éã%’\n5‚8)wDŽé¥D`ÇõYõ›¸ºöôZGÍ8}%f˜8:tLåxˆgÛ)c¸O{ð=V¹¯wïI	ÆRG9\\þ«Û×dêÞ6•Ï‰þ\\Á×…«PêÀÊÀëÝošËêö«i\ràð»ð¸sKÁxV§cö:ë–ü¯Y¡Ö[E›YëÃ—“þ:¿˜t¤ÀAáfóÅŽª2M¦¹‘9w‹C…ršÙkšµ¯k‡dM Þ•öÊÆ‹»ëì‰¶}Ê[cA\0UÚ\n-Çœž¨fyo|pºVÆG›·–´õG±Ç€B§6P×ƒÀÛO-wÔ=Òí]UÇA¡¶\"ÉïÙ˜\\	k¶ŠÇ²lZG>&Ée¿™ p²êdkã’gÓ,ÐªGÕbÕ?Íl[>­Ý~Žñ{MBËÚA¥ã>%°–Œ2òBò³Úù7—rÑÙ<ÎÝ|Xýe™Ý;$£¹K+hèôµ`uà{¨!ŒÊðÎœ”_Òð8ãk3â’M¼WÖÇ«|‡I7†‡FœQ5‚Õçt,`h‡sÚÎI·‹è|60ØÚ+E5 úG¹÷Yo_ñ…ÅÕzGI(cµ\Zëˆ<dþcð;¯%ãˆâc¥ÓhŸèwç<×ªâx‡êõz‡<Îÿ\0W¤Ñ GÂäÈýÏ%ÇíkõèRÈdx.q=ïýÕÇ¹Ò5°äß¦¹´¶\0ßE²( 5ß¼v\0o\rZxŠ(²WI[\\ézÞðÍÓ·÷MaÕ<fN[§î´øW…y\0½ÀŒQ/äü-äE|¨éäžåa­÷é]3¶&F6°ÙåÏ<¸¤É—í¨-®8ÃGRA\'<6¦Fc	 —%‡ÐJèGç“´S›HÕGdíhÚÁÕOÙ®c—w<M8\0Ý¬sIRÊàÚÚ2·í­CÈá£‰©”Ñ\\l­s;^µÔg•ÅÏ.î‡ª²ªémøÀÎZÜ§Ò©â¾\n¯0u<æAWÕrét¼ÔÎ#¢ZôˆôBVï‡´µßuç|ONí6¥Íw1»aÿ\0¾ÁL)ã”¿ÓþÕ§XúDzŠäÃ–9½UWf49²3épFØÅèákŒoÂÝ©£Ù\\c›ç€®ßÆ˜•·!i‡ªk}[Qµ”Co=jøuñÆ¶6Ç²kYŽ0†§åk˜\0ð¹w]Ü~ˆ1ßEB*;¹cYCJšÎ	Qöo3ëÛ¢{FG_~ÊRkFÍõYêµÌ‰dú#Wl©nÎdð³h·»ÓÑbÕÍ@öN‘Ý/+“¯”\0@[qç¶|»úå‹Y>ó]’¢–Nç¡…wO§—ÝÕî³NhÔ,Žå>W[ŠIåm˜áæ½Õ°zÛòºÚVnÕNFz•È ö]¿	í‘îÆçÐ*y=#ÛYaå­ú§{Ú©ƒ@s›€\rŸtÍ;LŽÔL*ïh>À!ÔK…„kºæøˆ$Ý‚Ü{,ú\ny<m9Mñ\'\r¤:fú	Åm¥´ÿ\0)Ï¶(¨a$e§)ð´Å®¿Íw]‚\0ÚÓJoÉkH¯²s‰\Z­+è‘#6Ÿù–WËiá×ckRE“D~ã…ÐÝ»Jýä‚Ñv9YÑ½£ÈÏdàK[#\\E<mzñKšùi\Z˜HÒO+(¿}²Üù69£Ž;RÅ¦¦iÌ|´cÙl\05å¶Ú”§N7év´j#—œ×ˆ½Ž¢/3Løhrò3GåLøú·§_Ž.HUr?EÉéaÙS‡¨»?-hþ«Pw¡ƒ–·ú¬Á¶ÝÞéàQ×(&àö=&ÂÓe„8r²iŽè;r·Fë`Êk£Î;hcƒZmÀO\r‘¾±ðBÍ ¿º	øÚÒ\r#:ì·ÇÓ£¦×¾\0bœ™a<ËV¡3A§=¥Žú$è~W“ï®ƒº~’q	òd yõ7·Â¿³\rq÷<;5ËHÍ[V]DAÎisH;VHµ¿²½Ì‘Åð]5ß˜-÷ìdŒ• ªî2˜±ó{·g¢»Ï)D»q÷BwZÅïv©rVWŠ+SÁÅ¤½½–’²Ð#qiò ðíNøÁÝKÏ\0¶häòÝ]Ñ©Û-gíª\r^Â3m[[3_[NWœŽRF¨f{\\^™ë‡ÃÑE#k­­¬6,89ø\\¼Í¤ÝOeÕŠ#µù `ŽªiÅÉÇÑÌÁÏl„µÒNÅ~‰1ÀIkhðºz}3½Ó\Z¦Î™o	Ý2Ì°§M\"ÙìA9G¦†2\06Å\ZÏÂÎ$“È÷3`ç<ZçøŒºÇ¾_)Á¯ÈÁ\nmk˜Ý«0i˜îqâ¸Ìxßiì±‘úËB\'˜ål­Ô‰¼MúöýÅü/]™’k ‰þ¨5-®ÎìŒù­fc“«Ön‘ï`¹S<½ÜãºÖ¯ýÛë&½=QÇáïc·O…r×Ñ\'M.¦\\ö°»·=Õì®Ÿ!tÚí;CÌšv¼¹´=U´÷XÜæ[¸±Õ9j¥.\r;æ\'hÀ9+©‚y~¡|—®{µUŽ!´rOt‡J÷»sœI÷G]‡SWã0ù05»F7‘•É|®{‰\'ôáNyZbsX×Ìvd)ñ•}Yóî›N•Ô+Dq‰\"Žq<\0,¹zü:\0lþ Ý¬«òÏÜ©ß$Ê³ÇÛ… ð½F¸5ºvSY{æ?Hÿ\0ué|3Át¾ë³$þ¾à.”Ž!#…¿Dmá%Ïp[OË—\\·Mf:MD•ÊÉË­1ûªö¨ØË°ºY½3Ð6`Ú|X¬r‰±§Òr´µ®/¦\n±ÝGœ³‡µæ<nv\\R5m·4[¿ ]™åÄ7?—ÙsuWûé_u¶‡ùS/u·]8Z™Qj%¼½Ä7Ø/>òi¿‰N$”FÏáÇºç¼æ».ìg¨ÃwµZ§(²ŒÖÒŒz›E,a\r•Y[ü!Õ©#¡jÄO¨§è·Wó\0‹è¿^ y€qÈþÉÚy[Þº0Èr4ö),ËÁMsmaÃ+žž\\}n•Þâ[»Ë6ßùØŽ};b‘Á™iõ1ÝÚx]É´ÿ\0ýÇB\"ÀÕ@.\'Ì;ÃæH¼§‡y¤ó]GÛ	[ÜiÅz¡Ý¦Â›z›-¬m;I@bÅß\\¬þîüå4ü‚9]…·µä,0×9½²ºù;uñÉ\"«¢ž^;ZsZpÜ+s:ð°ºuHAmâóÝY²}ÀFöá	°sÙ‘@àåC+ÿ\0DÀªÁGG¯Dj$É\\=cíä^SVúðG‹1·.Î¸¾F‚Ñ•&5µjœí­÷Y¥y+ªgºóù7õÈ¬ªT­]ö°=sÂ±¡m6É“‰X»àMÞ#aà<•ô¬ûnÑØŠvõàöU ©\rž=8ÚÉ›Í¼¡y·àìý—?¥_.>´Öî ¿¯`¯JÐawR²¯CåÖJw‡°þÏ-Œ†ámø¬ÇCA_bVí$üa+éÒ‘“$cŸì¶x4aúOOÿ\0òRµm,™ín	»?êöXKå¯QÚ;_êoháQh“PÍâÚKGÁfð×ï€6þž²Ãç3š{4²éM1’ÖJÉ0æË´×¿kËKƒïô»ù–YXI.®[µ46x\Zà=/o>êQhâNÿ\0½¯;ãyz’YDõ^†6îe/‚³ø¶M§köƒB-1z¬9<¼°O`›‚=Õ>2[ù‡!AÚo›]3Ó–¯m0€¿,c³ÆÕEÃiÅ¯˜Íw´ÓÙºgì—\'Òæí]-!kãÚ[…È Ï¿ÂtR:7ún:Ôj5ÆºuÝéÁî“¨õG×	‘È5×e	ËKOÂÇ7ªÛS¸Éƒ½=û§±Ô(äƒÈXä)m½ú­M;ž×ekXOkœnõß±EæDÐÛªÂcv»ÓÐáÒÊkn‚ž×ôíãÏÖP¨¢¸ëT¤¨¢sÚtIM‡øEßHŽ¤ål•Y_g]¯þ¿‘ßÙzü\r?ÙEprûttß[>O_ÿ\0ÉþÊ(–½¹ã?ü#þVÿ\0â¿ÿ\0™þÊ(†±ÃÑÿ\0î­ø½ø›ÿ\0À¼Gùÿ\0ÊŠ\'Ÿô·É|#þ3Iÿ\0ío÷^£ñ/þá7ýôQEÓK“ñã5?QùXÿ\0)QEQ®} úB¥B âþ+~WkÇò¨¢¦™ôoáýûCÿ\0}W¼ÖOäQEÍÏí¯¦7ýMþP³¿éû¨¢çÊèYô”Ø8?\n(©Ï}µ7ønF~—*Š%Za?øò…Èñø	”QöÒú¯	\'×/ó$;ê*(½úréAB¢ŠÉ5EGªnþ*ç\n(Ê¯Y!hê¢‹–z=5éÿ\0óÂ?þG¯ù“û¨¢_õX÷gÒßåB~ƒò¢‹§ñü«~ŸøaEéÑÄÔÏâ#wðþê(¹´ëÉ\'…ÊŠ\'OT2~_‚¢Š‹^œÝEÈ—êQEÛÃéÁÎLœ,¯QEÕ—›ÎÂ ¢ŠœÙ@»ß‡þ¦ü•YòzV]9›ÿ\0Ø°UñdþB¢‹ÅOn\'Œÿ\0\ZäZôÃÂŠ-oùk‡[À?áó”!üaüçû\\óý43Â~€»0ÿ\0çÿ\0*(¦û\r²uþT^ÿ\0¶ÃüÁE&Ž.üå£þß*(ª{Œ4ñÓÿ\0ÆÉöþÉªŠ.ÉéÍ¥Â&}QDã5OÁZ™ôÇüª(¢®6é~¿²oæQE‡ëªzaÕÿ\0îüZßL\'³áä|§TQDkÿÙ'),(18,'è´å¤šèŠ¬','beidf@126.com','2014-01-17',NULL);

/*Table structure for table `examstudent` */

DROP TABLE IF EXISTS `examstudent`;

CREATE TABLE `examstudent` (
  `FlowID` int(20) NOT NULL AUTO_INCREMENT,
  `Type` int(20) DEFAULT NULL,
  `IDCard` varchar(18) DEFAULT NULL,
  `ExamCard` varchar(15) DEFAULT NULL,
  `StudentName` varchar(20) DEFAULT NULL,
  `Location` varchar(20) DEFAULT NULL,
  `Grade` int(10) DEFAULT NULL,
  PRIMARY KEY (`FlowID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=gb2312;

/*Data for the table `examstudent` */

insert  into `examstudent`(`FlowID`,`Type`,`IDCard`,`ExamCard`,`StudentName`,`Location`,`Grade`) values (1,4,'412824195263214584','200523164754000','å¼ é”‹','éƒ‘å·ž',85),(2,4,'222224195263214584','200523164754001','å­™æœ‹','å¤§è¿ž',56),(3,6,'342824195263214584','200523164754002','åˆ˜æ˜Ž','æ²ˆé˜³',72),(4,6,'100824195263214584','200523164754003','èµµè™Ž','å“ˆå°”æ»¨\r\n',95),(5,4,'454524195263214584','200523164754004','æ¨ä¸½','åŒ—äº¬',64),(6,4,'854524195263214584','200523164754005','çŽ‹å°çº¢','å¤ªåŽŸ',60);

/*Table structure for table `order` */

DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
  `order_id` int(10) NOT NULL AUTO_INCREMENT,
  `order_name` varchar(20) DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=gb2312;

/*Data for the table `order` */

insert  into `order`(`order_id`,`order_name`,`order_date`) values (1,'AA','2010-03-04'),(2,'BB','2000-02-01'),(4,'GG','1994-06-28');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `password` varchar(15) NOT NULL DEFAULT '123456',
  `address` varchar(25) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=gb2312;

/*Data for the table `user` */

insert  into `user`(`id`,`name`,`password`,`address`,`phone`) values (1,'ç« å­æ€¡','qwerty','Beijing','13788658672'),(2,'éƒ­å¯ŒåŸŽ','abc123','HongKong','15678909898'),(3,'æž—å¿—é¢–','654321','Taiwan','18612124565'),(4,'æ¢é™èŒ¹','987654367','malaixiya','18912340998'),(5,'LadyGaGa','123456','America','13012386565');

/*Table structure for table `user_table` */

DROP TABLE IF EXISTS `user_table`;

CREATE TABLE `user_table` (
  `user` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `balance` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

/*Data for the table `user_table` */

insert  into `user_table`(`user`,`password`,`balance`) values ('AA','123456',1000),('BB','654321',1000),('CC','abcd',2000),('DD','abcder',3000);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
