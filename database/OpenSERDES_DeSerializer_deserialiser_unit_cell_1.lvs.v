/* Verilog module written by vlog2Verilog (qflow) */
/* With explicit power connections */
/* With case-insensitive names (SPICE-compatible) */

module deserialiser_unit_cell_1(
    inout vpwr,
    inout vgnd,
    input CLK,
    output COMPLETE,
    output INTERNAL_FINISH,
    input READY,
    input RESET,
    input SERIAL_IN,
    input VDD,
    input VSS,
    output [5:0] COUNT,
    output [31:0] OUT,
    output [31:0] PAR_IN1,
    output [31:0] PAR_IN2,
    output [31:0] PAR_IN3,
    output [31:0] PAR_IN4,
    output [31:0] PAR_IN5,
    output [31:0] PAR_IN6,
    output [31:0] PAR_IN7,
    output [31:0] PAR_IN8,
    output [3:0] SAMPLE_COUNT
);

wire _0719_ ;
wire _0892_ ;
wire _0472_ ;
wire _0052_ ;
wire _1677_ ;
wire _1257_ ;
wire _0948_ ;
wire _0528_ ;
wire _0108_ ;
wire \int_PAR_IN4[24]  ;
wire _0281_ ;
wire _1486_ ;
wire _1066_ ;
wire _0757_ ;
wire _0337_ ;
wire _0090_ ;
wire _1295_ ;
wire _0986_ ;
wire _0566_ ;
wire _0146_ ;
wire \int_PAR_IN7[30]  ;
wire \int_PAR_IN6[11]  ;
wire _0795_ ;
wire _0375_ ;
wire \int_PAR_IN5[9]  ;
wire _0184_ ;
wire _1389_ ;
wire clk_0_144 ;
wire _1601_ ;
wire _1198_ ;
wire _0889_ ;
wire _0469_ ;
wire _0049_ ;
wire _1410_ ;
wire _0698_ ;
wire _0278_ ;
wire _0910_ ;
wire \int_PAR_IN8[11]  ;
wire _0087_ ;
wire _1504_ ;
wire \int_PAR_IN6[28]  ;
wire _1733_ ;
wire _1313_ ;
wire _1542_ ;
wire _1122_ ;
wire _0813_ ;
wire _1351_ ;
wire _0622_ ;
wire _0202_ ;
wire _1407_ ;
wire _1580_ ;
wire _1160_ ;
wire \int_PAR_IN3[20]  ;
wire _0851_ ;
wire _0431_ ;
wire _0011_ ;
wire _1636_ ;
wire _1216_ ;
wire \int_PAR_IN7[8]  ;
wire _0907_ ;
wire _0660_ ;
wire _0240_ ;
wire \int_PAR_IN8[28]  ;
wire _1445_ ;
wire _1025_ ;
wire _0716_ ;
wire \int_PAR_IN2[14]  ;
wire \int_PAR_IN2[8]  ;
wire _1674_ ;
wire _1254_ ;
wire _0945_ ;
wire _0525_ ;
wire _0105_ ;
wire _1483_ ;
wire _1063_ ;
wire _0754_ ;
wire _0334_ ;
wire _1539_ ;
wire _1119_ ;
wire _1292_ ;
wire \int_PAR_IN5[20]  ;
wire _0983_ ;
wire _0563_ ;
wire _0143_ ;
wire _1348_ ;
wire _0619_ ;
wire _0792_ ;
wire _0372_ ;
wire _1577_ ;
wire _1157_ ;
wire _0848_ ;
wire _0428_ ;
wire _0008_ ;
wire \int_PAR_IN4[14]  ;
wire _0181_ ;
wire _1386_ ;
wire clk_0_112 ;
wire _0657_ ;
wire _0237_ ;
wire _1195_ ;
wire _0886_ ;
wire _0466_ ;
wire _0046_ ;
wire clk_1_256 ;
wire \int_PAR_IN7[20]  ;
wire _0695_ ;
wire _0275_ ;
wire _0084_ ;
wire _1289_ ;
wire _1501_ ;
wire _1098_ ;
wire \int_PAR_IN4[7]  ;
wire _0789_ ;
wire _0369_ ;
wire _1730_ ;
wire _1310_ ;
wire _0598_ ;
wire _0178_ ;
wire _0810_ ;
wire _1404_ ;
wire \int_PAR_IN6[18]  ;
wire _1633_ ;
wire _1213_ ;
wire READY ;
wire _0904_ ;
wire \int_PAR_IN1[23]  ;
wire _1442_ ;
wire _1022_ ;
wire _0713_ ;
wire [3:0] SAMPLE_COUNT ;
wire _1671_ ;
wire _1251_ ;
wire _0942_ ;
wire _0522_ ;
wire _0102_ ;
wire _1727_ ;
wire _1307_ ;
wire _1480_ ;
wire _1060_ ;
wire \int_PAR_IN3[10]  ;
wire _0751_ ;
wire _0331_ ;
wire _1536_ ;
wire _1116_ ;
wire _0807_ ;
wire _0980_ ;
wire _0560_ ;
wire _0140_ ;
wire \int_PAR_IN8[18]  ;
wire _1345_ ;
wire _0616_ ;
wire \int_PAR_IN6[6]  ;
wire _1574_ ;
wire _1154_ ;
wire _0845_ ;
wire _0425_ ;
wire _0005_ ;
wire _1383_ ;
wire \int_PAR_IN1[6]  ;
wire _0654_ ;
wire _0234_ ;
wire _1439_ ;
wire _1019_ ;
wire _1192_ ;
wire \int_PAR_IN5[10]  ;
wire _0883_ ;
wire _0463_ ;
wire _0043_ ;
wire _1668_ ;
wire _1248_ ;
wire _0939_ ;
wire _0519_ ;
wire _0692_ ;
wire _0272_ ;
wire _1477_ ;
wire _1057_ ;
wire _0748_ ;
wire _0328_ ;
wire \int_PAR_IN3[27]  ;
wire _0081_ ;
wire _1286_ ;
wire _0977_ ;
wire _0557_ ;
wire _0137_ ;
wire _1095_ ;
wire _0786_ ;
wire _0366_ ;
wire \int_PAR_IN7[10]  ;
wire _0595_ ;
wire _0175_ ;
wire _1189_ ;
wire \int_PAR_IN5[27]  ;
wire _1401_ ;
wire \int_PAR_IN8[5]  ;
wire _0689_ ;
wire _0269_ ;
wire _1630_ ;
wire _1210_ ;
wire _0901_ ;
wire _0498_ ;
wire _0078_ ;
wire \int_PAR_IN3[5]  ;
wire _0710_ ;
wire clk_0_48 ;
wire _1724_ ;
wire _1304_ ;
wire \int_PAR_IN7[27]  ;
wire _1533_ ;
wire _1113_ ;
wire _0804_ ;
wire \int_PAR_IN1[13]  ;
wire _1342_ ;
wire _0613_ ;
wire _1571_ ;
wire _1151_ ;
wire _0842_ ;
wire _0422_ ;
wire _0002_ ;
wire _1627_ ;
wire _1207_ ;
wire _1380_ ;
wire _0651_ ;
wire _0231_ ;
wire _1436_ ;
wire _1016_ ;
wire _0707_ ;
wire _0880_ ;
wire _0460_ ;
wire _0040_ ;
wire _1665_ ;
wire _1245_ ;
wire _0936_ ;
wire _0516_ ;
wire _1474_ ;
wire _1054_ ;
wire _0745_ ;
wire _0325_ ;
wire _1283_ ;
wire \int_PAR_IN5[4]  ;
wire _0974_ ;
wire _0554_ ;
wire _0134_ ;
wire _1759_ ;
wire _1339_ ;
wire _1092_ ;
wire _0783_ ;
wire _0363_ ;
wire _1568_ ;
wire _1148_ ;
wire _0839_ ;
wire _0419_ ;
wire _0592_ ;
wire _0172_ ;
wire _1377_ ;
wire _0648_ ;
wire _0228_ ;
wire \int_PAR_IN3[17]  ;
wire _1186_ ;
wire _0877_ ;
wire _0457_ ;
wire _0037_ ;
wire _0686_ ;
wire _0266_ ;
wire \int_PAR_IN6[23]  ;
wire _0495_ ;
wire _0075_ ;
wire clk_0_16 ;
wire _1089_ ;
wire \int_PAR_IN5[17]  ;
wire _1721_ ;
wire _1301_ ;
wire clknet_1_0_0_clk_1_256 ;
wire _0589_ ;
wire _0169_ ;
wire _1530_ ;
wire _1110_ ;
wire _0801_ ;
wire _0398_ ;
wire \int_PAR_IN7[3]  ;
wire _0610_ ;
wire \int_PAR_IN8[23]  ;
wire \int_PAR_IN2[3]  ;
wire _1624_ ;
wire _1204_ ;
wire RESET ;
wire \int_PAR_IN7[17]  ;
wire _1433_ ;
wire _1013_ ;
wire _0704_ ;
wire _1662_ ;
wire _1242_ ;
wire SERIAL_IN ;
wire _0933_ ;
wire _0513_ ;
wire _1718_ ;
wire _1471_ ;
wire _1051_ ;
wire _0742_ ;
wire _0322_ ;
wire _1527_ ;
wire _1107_ ;
wire _1280_ ;
wire _0971_ ;
wire _0551_ ;
wire _0131_ ;
wire _1756_ ;
wire _1336_ ;
wire _0607_ ;
wire _0780_ ;
wire _0360_ ;
wire _1565_ ;
wire _1145_ ;
wire _0836_ ;
wire _0416_ ;
wire \int_PAR_IN2[26]  ;
wire _1374_ ;
wire _0645_ ;
wire _0225_ ;
wire _1183_ ;
wire _0874_ ;
wire _0454_ ;
wire _0034_ ;
wire _1659_ ;
wire _1239_ ;
wire _0683_ ;
wire _0263_ ;
wire _1468_ ;
wire _1048_ ;
wire \int_PAR_IN4[2]  ;
wire _0739_ ;
wire _0319_ ;
wire _0492_ ;
wire _0072_ ;
wire _1697_ ;
wire _1277_ ;
wire _0968_ ;
wire _0548_ ;
wire _0128_ ;
wire \int_PAR_IN4[26]  ;
wire _1086_ ;
wire _0777_ ;
wire _0357_ ;
wire _0586_ ;
wire _0166_ ;
wire \int_PAR_IN6[13]  ;
wire _0395_ ;
wire _1621_ ;
wire _1201_ ;
wire _0489_ ;
wire _0069_ ;
wire _1430_ ;
wire _1010_ ;
wire _0701_ ;
wire _0298_ ;
wire _0930_ ;
wire _0510_ ;
wire \int_PAR_IN8[13]  ;
wire _1715_ ;
wire \int_PAR_IN6[1]  ;
wire _1524_ ;
wire _1104_ ;
wire _1753_ ;
wire _1333_ ;
wire \int_PAR_IN1[1]  ;
wire _0604_ ;
wire _1562_ ;
wire _1142_ ;
wire _0833_ ;
wire _0413_ ;
wire _1618_ ;
wire _1371_ ;
wire _0642_ ;
wire _0222_ ;
wire _1427_ ;
wire _1007_ ;
wire _1180_ ;
wire \int_PAR_IN3[22]  ;
wire _0871_ ;
wire _0451_ ;
wire _0031_ ;
wire _1656_ ;
wire _1236_ ;
wire _0927_ ;
wire _0507_ ;
wire _0680_ ;
wire _0260_ ;
wire _1465_ ;
wire _1045_ ;
wire _0736_ ;
wire _0316_ ;
wire \int_PAR_IN2[16]  ;
wire _1694_ ;
wire _1274_ ;
wire _0965_ ;
wire _0545_ ;
wire _0125_ ;
wire _1083_ ;
wire clknet_1_0_0_clk_1_0 ;
wire _0774_ ;
wire _0354_ ;
wire _1559_ ;
wire _1139_ ;
wire \int_PAR_IN5[22]  ;
wire _0583_ ;
wire _0163_ ;
wire _1368_ ;
wire \int_PAR_IN8[0]  ;
wire _0639_ ;
wire _0219_ ;
wire _0392_ ;
wire _1597_ ;
wire _1177_ ;
wire _0868_ ;
wire _0448_ ;
wire _0028_ ;
wire \int_PAR_IN4[16]  ;
wire \int_PAR_IN3[0]  ;
wire _0677_ ;
wire _0257_ ;
wire _0486_ ;
wire _0066_ ;
wire \int_PAR_IN7[22]  ;
wire _0295_ ;
wire _1712_ ;
wire _1521_ ;
wire _1101_ ;
wire \int_PAR_IN4[9]  ;
wire _0389_ ;
wire _1750_ ;
wire _1330_ ;
wire _0601_ ;
wire _0198_ ;
wire _0830_ ;
wire _0410_ ;
wire clk_0_288 ;
wire _1615_ ;
wire \int_PAR_IN2[31]  ;
wire _1424_ ;
wire _1004_ ;
wire _1653_ ;
wire _1233_ ;
wire _0924_ ;
wire _0504_ ;
wire \int_PAR_IN1[25]  ;
wire _1709_ ;
wire _1462_ ;
wire _1042_ ;
wire _0733_ ;
wire _0313_ ;
wire _1518_ ;
wire _1691_ ;
wire _1271_ ;
wire _0962_ ;
wire _0542_ ;
wire _0122_ ;
wire _1747_ ;
wire _1327_ ;
wire _1080_ ;
wire \int_PAR_IN4[31]  ;
wire \int_PAR_IN3[12]  ;
wire _0771_ ;
wire _0351_ ;
wire _1556_ ;
wire _1136_ ;
wire _0827_ ;
wire _0407_ ;
wire _0580_ ;
wire _0160_ ;
wire _1365_ ;
wire _0636_ ;
wire _0216_ ;
wire \int_PAR_IN6[8]  ;
wire _1594_ ;
wire _1174_ ;
wire _0865_ ;
wire _0445_ ;
wire _0025_ ;
wire \int_PAR_IN1[8]  ;
wire _0674_ ;
wire _0254_ ;
wire _1459_ ;
wire _1039_ ;
wire \int_PAR_IN5[12]  ;
wire _0483_ ;
wire _0063_ ;
wire _1688_ ;
wire _1268_ ;
wire _0959_ ;
wire _0539_ ;
wire _0119_ ;
wire _0292_ ;
wire _1497_ ;
wire _1077_ ;
wire _0768_ ;
wire _0348_ ;
wire \int_PAR_IN3[29]  ;
wire _0997_ ;
wire _0577_ ;
wire _0157_ ;
wire _0386_ ;
wire \int_PAR_IN7[12]  ;
wire VSS ;
wire _0195_ ;
wire clk_0_256 ;
wire _1612_ ;
wire \int_PAR_IN5[29]  ;
wire _1421_ ;
wire _1001_ ;
wire \int_PAR_IN8[7]  ;
wire _0289_ ;
wire _1650_ ;
wire _1230_ ;
wire _0921_ ;
wire _0501_ ;
wire _1706_ ;
wire _0098_ ;
wire \int_PAR_IN3[7]  ;
wire _0730_ ;
wire _0310_ ;
wire _1515_ ;
wire \int_PAR_IN2[21]  ;
wire _1744_ ;
wire _1324_ ;
wire \int_PAR_IN7[29]  ;
wire _1553_ ;
wire _1133_ ;
wire _0824_ ;
wire _0404_ ;
wire \int_PAR_IN1[15]  ;
wire _1609_ ;
wire _1362_ ;
wire _0633_ ;
wire _0213_ ;
wire _1418_ ;
wire _1591_ ;
wire _1171_ ;
wire _0862_ ;
wire _0442_ ;
wire _0022_ ;
wire _1647_ ;
wire _1227_ ;
wire _0918_ ;
wire \int_PAR_IN4[21]  ;
wire _0671_ ;
wire _0251_ ;
wire _1456_ ;
wire _1036_ ;
wire _0727_ ;
wire _0307_ ;
wire _0480_ ;
wire _0060_ ;
wire _1685_ ;
wire _1265_ ;
wire _0956_ ;
wire _0536_ ;
wire _0116_ ;
wire _1494_ ;
wire _1074_ ;
wire _0765_ ;
wire _0345_ ;
wire clknet_1_1_0_clk_1_0 ;
wire \int_PAR_IN5[6]  ;
wire _0994_ ;
wire _0574_ ;
wire _0154_ ;
wire _1359_ ;
wire _0383_ ;
wire _1588_ ;
wire _1168_ ;
wire _0859_ ;
wire _0439_ ;
wire _0019_ ;
wire _0192_ ;
wire _1397_ ;
wire clk_0_224 ;
wire _0668_ ;
wire _0248_ ;
wire \int_PAR_IN3[19]  ;
wire _0897_ ;
wire _0477_ ;
wire _0057_ ;
wire _0286_ ;
wire \int_PAR_IN6[25]  ;
wire _1703_ ;
wire _0095_ ;
wire \int_PAR_IN1[30]  ;
wire _1512_ ;
wire \int_PAR_IN5[19]  ;
wire _1741_ ;
wire _1321_ ;
wire _0189_ ;
wire _1550_ ;
wire _1130_ ;
wire _0821_ ;
wire _0401_ ;
wire clk_0_192 ;
wire _1606_ ;
wire \int_PAR_IN7[5]  ;
wire _0630_ ;
wire _0210_ ;
wire \int_PAR_IN8[25]  ;
wire _1415_ ;
wire \int_PAR_IN2[11]  ;
wire \int_PAR_IN2[5]  ;
wire _1644_ ;
wire _1224_ ;
wire _0915_ ;
wire \int_PAR_IN7[19]  ;
wire _1453_ ;
wire _1033_ ;
wire _0724_ ;
wire _0304_ ;
wire _1509_ ;
wire _1682_ ;
wire _1262_ ;
wire _0953_ ;
wire _0533_ ;
wire _0113_ ;
wire _1738_ ;
wire _1318_ ;
wire _1491_ ;
wire _1071_ ;
wire _0762_ ;
wire _0342_ ;
wire _1547_ ;
wire _1127_ ;
wire _0818_ ;
wire \int_PAR_IN4[11]  ;
wire _0991_ ;
wire _0571_ ;
wire _0151_ ;
wire _1356_ ;
wire _0627_ ;
wire _0207_ ;
wire _0380_ ;
wire _1585_ ;
wire _1165_ ;
wire _0856_ ;
wire _0436_ ;
wire _0016_ ;
wire \int_PAR_IN2[28]  ;
wire _1394_ ;
wire _0665_ ;
wire _0245_ ;
wire _0894_ ;
wire _0474_ ;
wire _0054_ ;
wire _1679_ ;
wire _1259_ ;
wire _0283_ ;
wire _1488_ ;
wire _1068_ ;
wire \int_PAR_IN4[4]  ;
wire _0759_ ;
wire _0339_ ;
wire _1700_ ;
wire _0092_ ;
wire _1297_ ;
wire _0988_ ;
wire _0568_ ;
wire _0148_ ;
wire \int_PAR_IN4[28]  ;
wire _0797_ ;
wire _0377_ ;
wire _0186_ ;
wire clk_0_160 ;
wire \int_PAR_IN6[15]  ;
wire _1603_ ;
wire \int_PAR_IN1[20]  ;
wire _1412_ ;
wire _1641_ ;
wire _1221_ ;
wire _0912_ ;
wire _0089_ ;
wire _1450_ ;
wire _1030_ ;
wire _0721_ ;
wire _0301_ ;
wire _1506_ ;
wire _0950_ ;
wire _0530_ ;
wire _0110_ ;
wire \int_PAR_IN8[15]  ;
wire _1735_ ;
wire _1315_ ;
wire \int_PAR_IN6[3]  ;
wire _1544_ ;
wire _1124_ ;
wire _0815_ ;
wire _1353_ ;
wire \int_PAR_IN1[3]  ;
wire _0624_ ;
wire _0204_ ;
wire _1409_ ;
wire _1582_ ;
wire _1162_ ;
wire _0853_ ;
wire _0433_ ;
wire _0013_ ;
wire _1638_ ;
wire _1218_ ;
wire _1391_ ;
wire _0909_ ;
wire _0662_ ;
wire _0242_ ;
wire _1447_ ;
wire _1027_ ;
wire _0718_ ;
wire \int_PAR_IN3[24]  ;
wire _0891_ ;
wire _0471_ ;
wire _0051_ ;
wire _1676_ ;
wire _1256_ ;
wire _0947_ ;
wire _0527_ ;
wire _0107_ ;
wire _0280_ ;
wire _1485_ ;
wire _1065_ ;
wire _0756_ ;
wire _0336_ ;
wire \int_PAR_IN2[18]  ;
wire _1294_ ;
wire \int_PAR_IN6[30]  ;
wire _0985_ ;
wire _0565_ ;
wire _0145_ ;
wire _0794_ ;
wire _0374_ ;
wire _1579_ ;
wire _1159_ ;
wire \int_PAR_IN5[24]  ;
wire _0183_ ;
wire _1388_ ;
wire \int_PAR_IN8[2]  ;
wire _0659_ ;
wire _0239_ ;
wire _1600_ ;
wire _1197_ ;
wire _0888_ ;
wire _0468_ ;
wire _0048_ ;
wire \int_PAR_IN4[18]  ;
wire \int_PAR_IN3[2]  ;
wire \int_PAR_IN8[30]  ;
wire _0697_ ;
wire _0277_ ;
wire _0086_ ;
wire \int_PAR_IN7[24]  ;
wire _1503_ ;
wire \int_PAR_IN1[10]  ;
wire _1732_ ;
wire _1312_ ;
wire _1541_ ;
wire _1121_ ;
wire _0812_ ;
wire _1350_ ;
wire _0621_ ;
wire _0201_ ;
wire _1406_ ;
wire _0850_ ;
wire _0430_ ;
wire _0010_ ;
wire _1635_ ;
wire _1215_ ;
wire _0906_ ;
wire _1444_ ;
wire _1024_ ;
wire _0715_ ;
wire clk_0_96 ;
wire _1673_ ;
wire _1253_ ;
wire \int_PAR_IN5[1]  ;
wire _0944_ ;
wire _0524_ ;
wire _0104_ ;
wire \int_PAR_IN1[27]  ;
wire _1729_ ;
wire _1309_ ;
wire _1482_ ;
wire _1062_ ;
wire _0753_ ;
wire _0333_ ;
wire _1538_ ;
wire _1118_ ;
wire _1291_ ;
wire _0809_ ;
wire _0982_ ;
wire _0562_ ;
wire _0142_ ;
wire _1347_ ;
wire _0618_ ;
wire \int_PAR_IN3[14]  ;
wire _0791_ ;
wire _0371_ ;
wire _1576_ ;
wire _1156_ ;
wire _0847_ ;
wire _0427_ ;
wire _0007_ ;
wire _0180_ ;
wire _1385_ ;
wire _0656_ ;
wire _0236_ ;
wire _1194_ ;
wire \int_PAR_IN6[20]  ;
wire _0885_ ;
wire _0465_ ;
wire _0045_ ;
wire _0694_ ;
wire _0274_ ;
wire _1479_ ;
wire _1059_ ;
wire clk_0_0 ;
wire \int_PAR_IN5[14]  ;
wire _0083_ ;
wire _1288_ ;
wire _0979_ ;
wire _0559_ ;
wire _0139_ ;
wire _1500_ ;
wire _1097_ ;
wire _0788_ ;
wire _0368_ ;
wire \int_PAR_IN7[0]  ;
wire \int_PAR_IN8[20]  ;
wire _0597_ ;
wire _0177_ ;
wire \int_PAR_IN2[0]  ;
wire \int_PAR_IN7[14]  ;
wire _1403_ ;
wire VDD ;
wire _1632_ ;
wire _1212_ ;
wire _0903_ ;
wire _1441_ ;
wire _1021_ ;
wire \int_PAR_IN8[9]  ;
wire _0712_ ;
wire clk_0_64 ;
wire _1670_ ;
wire _1250_ ;
wire _0941_ ;
wire _0521_ ;
wire _0101_ ;
wire _1726_ ;
wire _1306_ ;
wire clknet_1_1_0_clk_1_256 ;
wire \int_PAR_IN3[9]  ;
wire _0750_ ;
wire _0330_ ;
wire _1535_ ;
wire _1115_ ;
wire _0806_ ;
wire \int_PAR_IN2[23]  ;
wire _1344_ ;
wire _0615_ ;
wire _1573_ ;
wire _1153_ ;
wire _0844_ ;
wire _0424_ ;
wire _0004_ ;
wire \int_PAR_IN1[17]  ;
wire _1629_ ;
wire _1209_ ;
wire _1382_ ;
wire _0653_ ;
wire _0233_ ;
wire _1438_ ;
wire _1018_ ;
wire _1191_ ;
wire _0709_ ;
wire _0882_ ;
wire _0462_ ;
wire _0042_ ;
wire _1667_ ;
wire _1247_ ;
wire _0938_ ;
wire _0518_ ;
wire \int_PAR_IN4[23]  ;
wire _0691_ ;
wire _0271_ ;
wire _1476_ ;
wire _1056_ ;
wire _0747_ ;
wire _0327_ ;
wire _0080_ ;
wire _1285_ ;
wire _0976_ ;
wire _0556_ ;
wire _0136_ ;
wire _1094_ ;
wire \int_PAR_IN6[10]  ;
wire _0785_ ;
wire _0365_ ;
wire \int_PAR_IN5[8]  ;
wire _0594_ ;
wire _0174_ ;
wire _1379_ ;
wire _1188_ ;
wire _0879_ ;
wire _0459_ ;
wire _0039_ ;
wire _1400_ ;
wire clknet_0_clk_2_0 ;
wire _0688_ ;
wire _0268_ ;
wire _0900_ ;
wire \int_PAR_IN8[10]  ;
wire _0497_ ;
wire _0077_ ;
wire clk_0_32 ;
wire \int_PAR_IN6[27]  ;
wire _1723_ ;
wire _1303_ ;
wire _1532_ ;
wire _1112_ ;
wire _0803_ ;
wire _1341_ ;
wire _0612_ ;
wire _1570_ ;
wire _1150_ ;
wire _0841_ ;
wire _0421_ ;
wire _0001_ ;
wire _1626_ ;
wire _1206_ ;
wire \int_PAR_IN7[7]  ;
wire _0650_ ;
wire _0230_ ;
wire \int_PAR_IN8[27]  ;
wire _1435_ ;
wire _1015_ ;
wire _0706_ ;
wire \int_PAR_IN2[13]  ;
wire \int_PAR_IN2[7]  ;
wire _1664_ ;
wire _1244_ ;
wire _0935_ ;
wire _0515_ ;
wire _1473_ ;
wire _1053_ ;
wire _0744_ ;
wire _0324_ ;
wire _1529_ ;
wire _1109_ ;
wire _1282_ ;
wire _0973_ ;
wire _0553_ ;
wire _0133_ ;
wire _1758_ ;
wire _1338_ ;
wire _1091_ ;
wire _0609_ ;
wire _0782_ ;
wire _0362_ ;
wire _1567_ ;
wire _1147_ ;
wire _0838_ ;
wire _0418_ ;
wire \int_PAR_IN4[13]  ;
wire _0591_ ;
wire _0171_ ;
wire _1376_ ;
wire _0647_ ;
wire _0227_ ;
wire _1185_ ;
wire _0876_ ;
wire _0456_ ;
wire _0036_ ;
wire _0685_ ;
wire _0265_ ;
wire _0494_ ;
wire _0074_ ;
wire _1699_ ;
wire _1279_ ;
wire _1088_ ;
wire \int_PAR_IN4[6]  ;
wire _0779_ ;
wire _0359_ ;
wire _1720_ ;
wire _1300_ ;
wire _0588_ ;
wire _0168_ ;
wire _0800_ ;
wire _0397_ ;
wire \int_PAR_IN6[17]  ;
wire _1623_ ;
wire _1203_ ;
wire \int_PAR_IN1[22]  ;
wire _1432_ ;
wire _1012_ ;
wire _0703_ ;
wire _1661_ ;
wire _1241_ ;
wire _0932_ ;
wire _0512_ ;
wire _1717_ ;
wire _1470_ ;
wire _1050_ ;
wire _0741_ ;
wire _0321_ ;
wire _1526_ ;
wire _1106_ ;
wire _0970_ ;
wire _0550_ ;
wire _0130_ ;
wire \int_PAR_IN8[17]  ;
wire _1755_ ;
wire _1335_ ;
wire _0606_ ;
wire \int_PAR_IN6[5]  ;
wire _1564_ ;
wire _1144_ ;
wire _0835_ ;
wire _0415_ ;
wire _1373_ ;
wire \int_PAR_IN1[5]  ;
wire _0644_ ;
wire _0224_ ;
wire _1429_ ;
wire _1009_ ;
wire _1182_ ;
wire _0873_ ;
wire _0453_ ;
wire _0033_ ;
wire _1658_ ;
wire _1238_ ;
wire _0929_ ;
wire _0509_ ;
wire _0682_ ;
wire _0262_ ;
wire _1467_ ;
wire _1047_ ;
wire _0738_ ;
wire _0318_ ;
wire \int_PAR_IN3[26]  ;
wire _0491_ ;
wire _0071_ ;
wire _1696_ ;
wire _1276_ ;
wire [31:0] OUT ;
wire _0967_ ;
wire _0547_ ;
wire _0127_ ;
wire _1085_ ;
wire _0776_ ;
wire _0356_ ;
wire _0585_ ;
wire _0165_ ;
wire _0394_ ;
wire _1599_ ;
wire _1179_ ;
wire \int_PAR_IN5[26]  ;
wire \int_PAR_IN8[4]  ;
wire _0679_ ;
wire _0259_ ;
wire _1620_ ;
wire _1200_ ;
wire _0488_ ;
wire _0068_ ;
wire \int_PAR_IN3[4]  ;
wire _0700_ ;
wire _0297_ ;
wire _1714_ ;
wire \int_PAR_IN7[26]  ;
wire _1523_ ;
wire _1103_ ;
wire \int_PAR_IN1[12]  ;
wire _1752_ ;
wire _1332_ ;
wire _0603_ ;
wire _1561_ ;
wire _1141_ ;
wire _0832_ ;
wire _0412_ ;
wire _1617_ ;
wire _1370_ ;
wire _0641_ ;
wire _0221_ ;
wire _1426_ ;
wire _1006_ ;
wire _0870_ ;
wire _0450_ ;
wire _0030_ ;
wire _1655_ ;
wire _1235_ ;
wire _0926_ ;
wire _0506_ ;
wire _1464_ ;
wire _1044_ ;
wire _0735_ ;
wire _0315_ ;
wire _1693_ ;
wire _1273_ ;
wire \int_PAR_IN5[3]  ;
wire _0964_ ;
wire _0544_ ;
wire _0124_ ;
wire \int_PAR_IN1[29]  ;
wire _1749_ ;
wire _1329_ ;
wire _1082_ ;
wire _0773_ ;
wire _0353_ ;
wire _1558_ ;
wire _1138_ ;
wire _0829_ ;
wire _0409_ ;
wire _0582_ ;
wire _0162_ ;
wire _1367_ ;
wire _0638_ ;
wire _0218_ ;
wire \int_PAR_IN3[16]  ;
wire _0391_ ;
wire _1596_ ;
wire _1176_ ;
wire _0867_ ;
wire _0447_ ;
wire _0027_ ;
wire _0676_ ;
wire _0256_ ;
wire \int_PAR_IN6[22]  ;
wire _0485_ ;
wire _0065_ ;
wire _0294_ ;
wire _1499_ ;
wire _1079_ ;
wire clk_2_0 ;
wire \int_PAR_IN5[16]  ;
wire _1711_ ;
wire _0999_ ;
wire _0579_ ;
wire _0159_ ;
wire _1520_ ;
wire _1100_ ;
wire _0388_ ;
wire \int_PAR_IN7[2]  ;
wire _0600_ ;
wire \int_PAR_IN8[22]  ;
wire _0197_ ;
wire clk_0_272 ;
wire \int_PAR_IN2[2]  ;
wire _1614_ ;
wire \int_PAR_IN7[16]  ;
wire _1423_ ;
wire _1003_ ;
wire _1652_ ;
wire _1232_ ;
wire _0923_ ;
wire _0503_ ;
wire _1708_ ;
wire _1461_ ;
wire _1041_ ;
wire _0732_ ;
wire _0312_ ;
wire _1517_ ;
wire _1690_ ;
wire _1270_ ;
wire \int_PAR_IN3[31]  ;
wire _0961_ ;
wire _0541_ ;
wire _0121_ ;
wire _1746_ ;
wire _1326_ ;
wire _0770_ ;
wire _0350_ ;
wire _1555_ ;
wire _1135_ ;
wire _0826_ ;
wire _0406_ ;
wire \int_PAR_IN2[25]  ;
wire _1364_ ;
wire _0635_ ;
wire _0215_ ;
wire _1593_ ;
wire _1173_ ;
wire _0864_ ;
wire _0444_ ;
wire _0024_ ;
wire \int_PAR_IN1[19]  ;
wire _1649_ ;
wire _1229_ ;
wire \int_PAR_IN5[31]  ;
wire _0673_ ;
wire _0253_ ;
wire _1458_ ;
wire _1038_ ;
wire \int_PAR_IN4[1]  ;
wire _0729_ ;
wire _0309_ ;
wire _0482_ ;
wire _0062_ ;
wire _1687_ ;
wire _1267_ ;
wire _0958_ ;
wire _0538_ ;
wire _0118_ ;
wire \int_PAR_IN4[25]  ;
wire _0291_ ;
wire _1496_ ;
wire _1076_ ;
wire _0767_ ;
wire _0347_ ;
wire _0996_ ;
wire _0576_ ;
wire _0156_ ;
wire \int_PAR_IN7[31]  ;
wire \int_PAR_IN6[12]  ;
wire _0385_ ;
wire _0194_ ;
wire _1399_ ;
wire clk_0_240 ;
wire _1611_ ;
wire _0899_ ;
wire _0479_ ;
wire _0059_ ;
wire _1420_ ;
wire _1000_ ;
wire _0288_ ;
wire _0920_ ;
wire _0500_ ;
wire \int_PAR_IN8[12]  ;
wire _1705_ ;
wire _0097_ ;
wire \int_PAR_IN6[0]  ;
wire _1514_ ;
wire \int_PAR_IN6[29]  ;
wire _1743_ ;
wire _1323_ ;
wire \int_PAR_IN1[0]  ;
wire _1552_ ;
wire _1132_ ;
wire _0823_ ;
wire _0403_ ;
wire _1608_ ;
wire _1361_ ;
wire _0632_ ;
wire _0212_ ;
wire _1417_ ;
wire _1590_ ;
wire _1170_ ;
wire \int_PAR_IN3[21]  ;
wire _0861_ ;
wire _0441_ ;
wire _0021_ ;
wire _1646_ ;
wire _1226_ ;
wire \int_PAR_IN7[9]  ;
wire _0917_ ;
wire _0670_ ;
wire _0250_ ;
wire \int_PAR_IN8[29]  ;
wire _1455_ ;
wire _1035_ ;
wire _0726_ ;
wire _0306_ ;
wire \int_PAR_IN2[15]  ;
wire \int_PAR_IN2[9]  ;
wire _1684_ ;
wire _1264_ ;
wire _0955_ ;
wire _0535_ ;
wire _0115_ ;
wire _1493_ ;
wire _1073_ ;
wire _0764_ ;
wire _0344_ ;
wire _1549_ ;
wire _1129_ ;
wire \int_PAR_IN5[21]  ;
wire _0993_ ;
wire _0573_ ;
wire _0153_ ;
wire _1358_ ;
wire _0629_ ;
wire _0209_ ;
wire _0382_ ;
wire _1587_ ;
wire _1167_ ;
wire _0858_ ;
wire _0438_ ;
wire _0018_ ;
wire \int_PAR_IN4[15]  ;
wire _0191_ ;
wire _1396_ ;
wire _0667_ ;
wire _0247_ ;
wire INTERNAL_FINISH ;
wire _0896_ ;
wire _0476_ ;
wire _0056_ ;
wire \int_PAR_IN7[21]  ;
wire _0285_ ;
wire _1702_ ;
wire _0094_ ;
wire _1299_ ;
wire _1511_ ;
wire \int_PAR_IN4[8]  ;
wire _0799_ ;
wire _0379_ ;
wire _1740_ ;
wire _1320_ ;
wire _0188_ ;
wire _0820_ ;
wire _0400_ ;
wire _1605_ ;
wire \int_PAR_IN2[30]  ;
wire _1414_ ;
wire \int_PAR_IN6[19]  ;
wire _1643_ ;
wire _1223_ ;
wire _0914_ ;
wire \int_PAR_IN1[24]  ;
wire _1452_ ;
wire _1032_ ;
wire _0723_ ;
wire _0303_ ;
wire _1508_ ;
wire _1681_ ;
wire _1261_ ;
wire _0952_ ;
wire _0532_ ;
wire _0112_ ;
wire _1737_ ;
wire _1317_ ;
wire _1490_ ;
wire _1070_ ;
wire \int_PAR_IN4[30]  ;
wire \int_PAR_IN3[11]  ;
wire _0761_ ;
wire _0341_ ;
wire _1546_ ;
wire _1126_ ;
wire [31:0] PAR_IN1 ;
wire [31:0] PAR_IN2 ;
wire [31:0] PAR_IN3 ;
wire [31:0] PAR_IN4 ;
wire [31:0] PAR_IN5 ;
wire [31:0] PAR_IN6 ;
wire [31:0] PAR_IN7 ;
wire [31:0] PAR_IN8 ;
wire _0817_ ;
wire _0990_ ;
wire _0570_ ;
wire _0150_ ;
wire \int_PAR_IN8[19]  ;
wire _1355_ ;
wire _0626_ ;
wire _0206_ ;
wire \int_PAR_IN6[7]  ;
wire _1584_ ;
wire _1164_ ;
wire CLK ;
wire _0855_ ;
wire _0435_ ;
wire _0015_ ;
wire _1393_ ;
wire \int_PAR_IN1[7]  ;
wire _0664_ ;
wire _0244_ ;
wire _1449_ ;
wire _1029_ ;
wire \int_PAR_IN5[11]  ;
wire _0893_ ;
wire _0473_ ;
wire _0053_ ;
wire _1678_ ;
wire _1258_ ;
wire _0949_ ;
wire _0529_ ;
wire _0109_ ;
wire _0282_ ;
wire _1487_ ;
wire _1067_ ;
wire _0758_ ;
wire _0338_ ;
wire \int_PAR_IN3[28]  ;
wire _0091_ ;
wire _1296_ ;
wire _0987_ ;
wire _0567_ ;
wire _0147_ ;
wire _0796_ ;
wire _0376_ ;
wire \int_PAR_IN7[11]  ;
wire _0185_ ;
wire _1602_ ;
wire _1199_ ;
wire \int_PAR_IN5[28]  ;
wire _1411_ ;
wire \int_PAR_IN8[6]  ;
wire _0699_ ;
wire _0279_ ;
wire _1640_ ;
wire _1220_ ;
wire _0911_ ;
wire _0088_ ;
wire \int_PAR_IN3[6]  ;
wire _0720_ ;
wire _0300_ ;
wire _1505_ ;
wire \int_PAR_IN2[20]  ;
wire _1734_ ;
wire _1314_ ;
wire \int_PAR_IN7[28]  ;
wire _1543_ ;
wire _1123_ ;
wire _0814_ ;
wire \int_PAR_IN1[14]  ;
wire _1352_ ;
wire _0623_ ;
wire _0203_ ;
wire _1408_ ;
wire _1581_ ;
wire _1161_ ;
wire _0852_ ;
wire _0432_ ;
wire _0012_ ;
wire _1637_ ;
wire _1217_ ;
wire _1390_ ;
wire _0908_ ;
wire \int_PAR_IN4[20]  ;
wire _0661_ ;
wire _0241_ ;
wire _1446_ ;
wire _1026_ ;
wire _0717_ ;
wire _0890_ ;
wire _0470_ ;
wire _0050_ ;
wire _1675_ ;
wire _1255_ ;
wire _0946_ ;
wire _0526_ ;
wire _0106_ ;
wire _1484_ ;
wire _1064_ ;
wire _0755_ ;
wire _0335_ ;
wire _1293_ ;
wire \int_PAR_IN5[5]  ;
wire _0984_ ;
wire _0564_ ;
wire _0144_ ;
wire _1349_ ;
wire _0793_ ;
wire _0373_ ;
wire _1578_ ;
wire _1158_ ;
wire _0849_ ;
wire _0429_ ;
wire _0009_ ;
wire _0182_ ;
wire _1387_ ;
wire clk_0_128 ;
wire _0658_ ;
wire _0238_ ;
wire \int_PAR_IN3[18]  ;
wire _1196_ ;
wire _0887_ ;
wire _0467_ ;
wire _0047_ ;
wire _0696_ ;
wire _0276_ ;
wire \int_PAR_IN6[24]  ;
wire _0085_ ;
wire _1502_ ;
wire _1099_ ;
wire \int_PAR_IN5[18]  ;
wire _1731_ ;
wire _1311_ ;
wire _0599_ ;
wire _0179_ ;
wire _1540_ ;
wire _1120_ ;
wire _0811_ ;
wire \int_PAR_IN7[4]  ;
wire _0620_ ;
wire _0200_ ;
wire \int_PAR_IN8[24]  ;
wire _1405_ ;
wire \int_PAR_IN2[10]  ;
wire \int_PAR_IN2[4]  ;
wire _1634_ ;
wire _1214_ ;
wire _0905_ ;
wire \int_PAR_IN7[18]  ;
wire _1443_ ;
wire _1023_ ;
wire _0714_ ;
wire clk_0_80 ;
wire _1672_ ;
wire _1252_ ;
wire _0943_ ;
wire _0523_ ;
wire _0103_ ;
wire _1728_ ;
wire _1308_ ;
wire _1481_ ;
wire _1061_ ;
wire _0752_ ;
wire _0332_ ;
wire _1537_ ;
wire _1117_ ;
wire _1290_ ;
wire _0808_ ;
wire \int_PAR_IN4[10]  ;
wire _0981_ ;
wire _0561_ ;
wire _0141_ ;
wire _1346_ ;
wire _0617_ ;
wire _0790_ ;
wire _0370_ ;
wire _1575_ ;
wire _1155_ ;
wire _0846_ ;
wire _0426_ ;
wire _0006_ ;
wire \int_PAR_IN2[27]  ;
wire _1384_ ;
wire _0655_ ;
wire _0235_ ;
wire _1193_ ;
wire _0884_ ;
wire _0464_ ;
wire _0044_ ;
wire _1669_ ;
wire _1249_ ;
wire _0693_ ;
wire _0273_ ;
wire _1478_ ;
wire _1058_ ;
wire \int_PAR_IN4[3]  ;
wire _0749_ ;
wire _0329_ ;
wire _0082_ ;
wire _1287_ ;
wire _0978_ ;
wire _0558_ ;
wire _0138_ ;
wire \int_PAR_IN4[27]  ;
wire _1096_ ;
wire _0787_ ;
wire _0367_ ;
wire _0596_ ;
wire _0176_ ;
wire \int_PAR_IN6[14]  ;
wire _1402_ ;
wire _1631_ ;
wire _1211_ ;
wire _0902_ ;
wire _0499_ ;
wire _0079_ ;
wire _1440_ ;
wire _1020_ ;
wire _0711_ ;
wire _0940_ ;
wire _0520_ ;
wire _0100_ ;
wire \int_PAR_IN8[14]  ;
wire _1725_ ;
wire _1305_ ;
wire \int_PAR_IN6[2]  ;
wire _1534_ ;
wire _1114_ ;
wire clknet_0_clk_1_256 ;
wire _0805_ ;
wire _1343_ ;
wire \int_PAR_IN1[2]  ;
wire _0614_ ;
wire _1572_ ;
wire _1152_ ;
wire _0843_ ;
wire _0423_ ;
wire _0003_ ;
wire _1628_ ;
wire _1208_ ;
wire _1381_ ;
wire _0652_ ;
wire _0232_ ;
wire _1437_ ;
wire _1017_ ;
wire _1190_ ;
wire _0708_ ;
wire \int_PAR_IN3[23]  ;
wire _0881_ ;
wire _0461_ ;
wire _0041_ ;
wire _1666_ ;
wire _1246_ ;
wire _0937_ ;
wire _0517_ ;
wire _0690_ ;
wire _0270_ ;
wire _1475_ ;
wire _1055_ ;
wire _0746_ ;
wire _0326_ ;
wire \int_PAR_IN2[17]  ;
wire _1284_ ;
wire _0975_ ;
wire _0555_ ;
wire _0135_ ;
wire _1093_ ;
wire clknet_1_0_0_clk_2_0 ;
wire _0784_ ;
wire _0364_ ;
wire _1569_ ;
wire _1149_ ;
wire \int_PAR_IN5[23]  ;
wire _0593_ ;
wire _0173_ ;
wire _1378_ ;
wire \int_PAR_IN8[1]  ;
wire _0649_ ;
wire _0229_ ;
wire _1187_ ;
wire _0878_ ;
wire _0458_ ;
wire _0038_ ;
wire \int_PAR_IN4[17]  ;
wire \int_PAR_IN3[1]  ;
wire _0687_ ;
wire _0267_ ;
wire _0496_ ;
wire _0076_ ;
wire \int_PAR_IN7[23]  ;
wire _1722_ ;
wire _1302_ ;
wire _1531_ ;
wire _1111_ ;
wire _0802_ ;
wire _0399_ ;
wire _1760_ ;
wire _1340_ ;
wire _0611_ ;
wire COMPLETE ;
wire _0840_ ;
wire _0420_ ;
wire _0000_ ;
wire _1625_ ;
wire _1205_ ;
wire _1434_ ;
wire _1014_ ;
wire _0705_ ;
wire _1663_ ;
wire _1243_ ;
wire \int_PAR_IN5[0]  ;
wire _0934_ ;
wire _0514_ ;
wire \int_PAR_IN1[26]  ;
wire _1719_ ;
wire _1472_ ;
wire _1052_ ;
wire _0743_ ;
wire _0323_ ;
wire _1528_ ;
wire _1108_ ;
wire _1281_ ;
wire _0972_ ;
wire _0552_ ;
wire _0132_ ;
wire _1757_ ;
wire _1337_ ;
wire _1090_ ;
wire _0608_ ;
wire \int_PAR_IN3[13]  ;
wire _0781_ ;
wire _0361_ ;
wire _1566_ ;
wire _1146_ ;
wire _0837_ ;
wire _0417_ ;
wire _0590_ ;
wire _0170_ ;
wire _1375_ ;
wire _0646_ ;
wire _0226_ ;
wire \int_PAR_IN6[9]  ;
wire _1184_ ;
wire _0875_ ;
wire _0455_ ;
wire _0035_ ;
wire \int_PAR_IN1[9]  ;
wire _0684_ ;
wire _0264_ ;
wire _1469_ ;
wire _1049_ ;
wire \int_PAR_IN5[13]  ;
wire _0493_ ;
wire _0073_ ;
wire _1698_ ;
wire _1278_ ;
wire _0969_ ;
wire _0549_ ;
wire _0129_ ;
wire _1087_ ;
wire [5:0] COUNT ;
wire _0778_ ;
wire _0358_ ;
wire _0587_ ;
wire _0167_ ;
wire _0396_ ;
wire \int_PAR_IN7[13]  ;
wire _1622_ ;
wire _1202_ ;
wire _1431_ ;
wire _1011_ ;
wire \int_PAR_IN8[8]  ;
wire _0702_ ;
wire _0299_ ;
wire _1660_ ;
wire _1240_ ;
wire _0931_ ;
wire _0511_ ;
wire _1716_ ;
wire \int_PAR_IN3[8]  ;
wire _0740_ ;
wire _0320_ ;
wire _1525_ ;
wire _1105_ ;
wire \int_PAR_IN2[22]  ;
wire _1754_ ;
wire _1334_ ;
wire _0605_ ;
wire _1563_ ;
wire _1143_ ;
wire _0834_ ;
wire _0414_ ;
wire \int_PAR_IN1[16]  ;
wire _1619_ ;
wire _1372_ ;
wire _0643_ ;
wire _0223_ ;
wire _1428_ ;
wire _1008_ ;
wire _1181_ ;
wire _0872_ ;
wire _0452_ ;
wire _0032_ ;
wire _1657_ ;
wire _1237_ ;
wire _0928_ ;
wire _0508_ ;
wire \int_PAR_IN4[22]  ;
wire _0681_ ;
wire _0261_ ;
wire _1466_ ;
wire _1046_ ;
wire _0737_ ;
wire _0317_ ;
wire _0490_ ;
wire _0070_ ;
wire _1695_ ;
wire _1275_ ;
wire _0966_ ;
wire _0546_ ;
wire _0126_ ;
wire _1084_ ;
wire _0775_ ;
wire _0355_ ;
wire clknet_1_1_0_clk_2_0 ;
wire \int_PAR_IN5[7]  ;
wire _0584_ ;
wire _0164_ ;
wire _1369_ ;
wire _0393_ ;
wire _1598_ ;
wire _1178_ ;
wire _0869_ ;
wire _0449_ ;
wire _0029_ ;
wire clknet_0_clk_1_0 ;
wire _0678_ ;
wire _0258_ ;
wire _0487_ ;
wire _0067_ ;
wire _0296_ ;
wire \int_PAR_IN6[26]  ;
wire _1713_ ;
wire \int_PAR_IN1[31]  ;
wire _1522_ ;
wire _1102_ ;
wire _1751_ ;
wire _1331_ ;
wire _0602_ ;
wire _0199_ ;
wire _1560_ ;
wire _1140_ ;
wire _0831_ ;
wire _0411_ ;
wire _1616_ ;
wire \int_PAR_IN7[6]  ;
wire _0640_ ;
wire _0220_ ;
wire \int_PAR_IN8[26]  ;
wire _1425_ ;
wire _1005_ ;
wire \int_PAR_IN2[12]  ;
wire \int_PAR_IN2[6]  ;
wire _1654_ ;
wire _1234_ ;
wire _0925_ ;
wire _0505_ ;
wire _1463_ ;
wire _1043_ ;
wire _0734_ ;
wire _0314_ ;
wire _1519_ ;
wire _1692_ ;
wire _1272_ ;
wire _0963_ ;
wire _0543_ ;
wire _0123_ ;
wire _1748_ ;
wire _1328_ ;
wire _1081_ ;
wire _0772_ ;
wire _0352_ ;
wire _1557_ ;
wire _1137_ ;
wire _0828_ ;
wire _0408_ ;
wire \int_PAR_IN4[12]  ;
wire _0581_ ;
wire _0161_ ;
wire _1366_ ;
wire _0637_ ;
wire _0217_ ;
wire _0390_ ;
wire _1595_ ;
wire _1175_ ;
wire _0866_ ;
wire _0446_ ;
wire _0026_ ;
wire \int_PAR_IN2[29]  ;
wire _0675_ ;
wire _0255_ ;
wire _0484_ ;
wire _0064_ ;
wire _1689_ ;
wire _1269_ ;
wire _0293_ ;
wire _1498_ ;
wire _1078_ ;
wire \int_PAR_IN4[5]  ;
wire _0769_ ;
wire _0349_ ;
wire _1710_ ;
wire _0998_ ;
wire _0578_ ;
wire _0158_ ;
wire \int_PAR_IN4[29]  ;
wire _0387_ ;
wire _0196_ ;
wire \int_PAR_IN6[16]  ;
wire _1613_ ;
wire \int_PAR_IN1[21]  ;
wire _1422_ ;
wire _1002_ ;
wire _1651_ ;
wire _1231_ ;
wire _0922_ ;
wire _0502_ ;
wire _1707_ ;
wire _0099_ ;
wire _1460_ ;
wire _1040_ ;
wire _0731_ ;
wire _0311_ ;
wire _1516_ ;
wire _0960_ ;
wire _0540_ ;
wire _0120_ ;
wire \int_PAR_IN8[16]  ;
wire _1745_ ;
wire _1325_ ;
wire \int_PAR_IN6[4]  ;
wire _1554_ ;
wire _1134_ ;
wire _0825_ ;
wire _0405_ ;
wire _1363_ ;
wire \int_PAR_IN1[4]  ;
wire _0634_ ;
wire _0214_ ;
wire _1419_ ;
wire _1592_ ;
wire _1172_ ;
wire _0863_ ;
wire _0443_ ;
wire _0023_ ;
wire _1648_ ;
wire _1228_ ;
wire _0919_ ;
wire _0672_ ;
wire _0252_ ;
wire _1457_ ;
wire _1037_ ;
wire _0728_ ;
wire _0308_ ;
wire \int_PAR_IN3[25]  ;
wire _0481_ ;
wire _0061_ ;
wire _1686_ ;
wire _1266_ ;
wire _0957_ ;
wire _0537_ ;
wire _0117_ ;
wire _0290_ ;
wire _1495_ ;
wire _1075_ ;
wire _0766_ ;
wire _0346_ ;
wire \int_PAR_IN2[19]  ;
wire \int_PAR_IN6[31]  ;
wire _0995_ ;
wire _0575_ ;
wire _0155_ ;
wire _0384_ ;
wire _1589_ ;
wire _1169_ ;
wire \int_PAR_IN5[25]  ;
wire _0193_ ;
wire _1398_ ;
wire \int_PAR_IN8[3]  ;
wire _0669_ ;
wire _0249_ ;
wire _1610_ ;
wire _0898_ ;
wire _0478_ ;
wire _0058_ ;
wire \int_PAR_IN4[19]  ;
wire \int_PAR_IN3[3]  ;
wire \int_PAR_IN8[31]  ;
wire _0287_ ;
wire _1704_ ;
wire _0096_ ;
wire \int_PAR_IN7[25]  ;
wire _1513_ ;
wire \int_PAR_IN1[11]  ;
wire _1742_ ;
wire _1322_ ;
wire _1551_ ;
wire _1131_ ;
wire _0822_ ;
wire _0402_ ;
wire _1607_ ;
wire _1360_ ;
wire _0631_ ;
wire _0211_ ;
wire _1416_ ;
wire _0860_ ;
wire _0440_ ;
wire _0020_ ;
wire _1645_ ;
wire _1225_ ;
wire _0916_ ;
wire _1454_ ;
wire _1034_ ;
wire _0725_ ;
wire _0305_ ;
wire _1683_ ;
wire _1263_ ;
wire \int_PAR_IN5[2]  ;
wire _0954_ ;
wire _0534_ ;
wire _0114_ ;
wire \int_PAR_IN1[28]  ;
wire _1739_ ;
wire _1319_ ;
wire _1492_ ;
wire _1072_ ;
wire _0763_ ;
wire _0343_ ;
wire _1548_ ;
wire _1128_ ;
wire _0819_ ;
wire _0992_ ;
wire _0572_ ;
wire _0152_ ;
wire _1357_ ;
wire _0628_ ;
wire _0208_ ;
wire \int_PAR_IN3[15]  ;
wire _0381_ ;
wire _1586_ ;
wire _1166_ ;
wire _0857_ ;
wire _0437_ ;
wire _0017_ ;
wire _0190_ ;
wire _1395_ ;
wire clk_0_208 ;
wire _0666_ ;
wire _0246_ ;
wire \int_PAR_IN6[21]  ;
wire _0895_ ;
wire _0475_ ;
wire _0055_ ;
wire _0284_ ;
wire _1489_ ;
wire _1069_ ;
wire clk_1_0 ;
wire \int_PAR_IN5[15]  ;
wire _1701_ ;
wire _0093_ ;
wire _1298_ ;
wire _0989_ ;
wire _0569_ ;
wire _0149_ ;
wire _1510_ ;
wire _0798_ ;
wire _0378_ ;
wire \int_PAR_IN7[1]  ;
wire \int_PAR_IN8[21]  ;
wire _0187_ ;
wire clk_0_176 ;
wire \int_PAR_IN2[1]  ;
wire _1604_ ;
wire \int_PAR_IN7[15]  ;
wire _1413_ ;
wire _1642_ ;
wire _1222_ ;
wire _0913_ ;
wire _1451_ ;
wire _1031_ ;
wire _0722_ ;
wire _0302_ ;
wire _1507_ ;
wire _1680_ ;
wire _1260_ ;
wire \int_PAR_IN3[30]  ;
wire _0951_ ;
wire _0531_ ;
wire _0111_ ;
wire _1736_ ;
wire _1316_ ;
wire _0760_ ;
wire _0340_ ;
wire _1545_ ;
wire _1125_ ;
wire _0816_ ;
wire \int_PAR_IN2[24]  ;
wire _1354_ ;
wire _0625_ ;
wire _0205_ ;
wire _1583_ ;
wire _1163_ ;
wire _0854_ ;
wire _0434_ ;
wire _0014_ ;
wire \int_PAR_IN1[18]  ;
wire _1639_ ;
wire _1219_ ;
wire _1392_ ;
wire \int_PAR_IN5[30]  ;
wire _0663_ ;
wire _0243_ ;
wire _1448_ ;
wire _1028_ ;
wire \int_PAR_IN4[0]  ;

sky130_fd_sc_hd__or2_4 _1761_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1534_),
    .B(_1532_),
    .X(_1535_)
);

sky130_fd_sc_hd__o22a_4 _1762_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1531_),
    .A2(_1533_),
    .B1(_1499_),
    .B2(_1535_),
    .X(_1536_)
);

sky130_fd_sc_hd__o22a_4 _1763_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1487_),
    .A2(_1536_),
    .B1(_1531_),
    .B2(_1522_),
    .X(_1537_)
);

sky130_fd_sc_hd__nor2_4 _1764_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1530_),
    .B(_1537_),
    .Y(_0028_)
);

sky130_fd_sc_hd__buf_1 _1765_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1486_),
    .X(_1538_)
);

sky130_fd_sc_hd__inv_8 _1766_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(OUT[7]),
    .Y(_1539_)
);

sky130_fd_sc_hd__buf_1 _1767_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1461_),
    .X(_1540_)
);

sky130_fd_sc_hd__or4_4 _1768_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1490_),
    .B(_1476_),
    .C(_1456_),
    .D(_1516_),
    .X(_1541_)
);

sky130_fd_sc_hd__buf_1 _1769_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1541_),
    .X(_1542_)
);

sky130_fd_sc_hd__nor2_4 _1770_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1540_),
    .B(_1542_),
    .Y(_1543_)
);

sky130_fd_sc_hd__buf_1 _1771_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1498_),
    .X(_1544_)
);

sky130_fd_sc_hd__or2_4 _1772_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1534_),
    .B(_1542_),
    .X(_1545_)
);

sky130_fd_sc_hd__o22a_4 _1773_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1539_),
    .A2(_1543_),
    .B1(_1544_),
    .B2(_1545_),
    .X(_1546_)
);

sky130_fd_sc_hd__o22a_4 _1774_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1538_),
    .A2(_1546_),
    .B1(_1539_),
    .B2(_1522_),
    .X(_1547_)
);

sky130_fd_sc_hd__nor2_4 _1775_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1530_),
    .B(_1547_),
    .Y(_0029_)
);

sky130_fd_sc_hd__inv_8 _1776_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(OUT[8]),
    .Y(_1548_)
);

sky130_fd_sc_hd__buf_1 _1777_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1422_),
    .X(_1549_)
);

sky130_fd_sc_hd__or4_4 _1778_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1475_),
    .B(_1491_),
    .C(_1507_),
    .D(_1549_),
    .X(_1550_)
);

sky130_fd_sc_hd__nor2_4 _1779_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1540_),
    .B(_1550_),
    .Y(_1551_)
);

sky130_fd_sc_hd__or2_4 _1780_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1534_),
    .B(_1550_),
    .X(_1552_)
);

sky130_fd_sc_hd__o22a_4 _1781_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1548_),
    .A2(_1551_),
    .B1(_1544_),
    .B2(_1552_),
    .X(_1553_)
);

sky130_fd_sc_hd__o22a_4 _1782_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1538_),
    .A2(_1553_),
    .B1(_1548_),
    .B2(_1522_),
    .X(_1554_)
);

sky130_fd_sc_hd__nor2_4 _1783_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1530_),
    .B(_1554_),
    .Y(_0030_)
);

sky130_fd_sc_hd__inv_8 _1784_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(OUT[9]),
    .Y(_1555_)
);

sky130_fd_sc_hd__or4_4 _1785_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1475_),
    .B(_1476_),
    .C(_1507_),
    .D(_1549_),
    .X(_1556_)
);

sky130_fd_sc_hd__nor2_4 _1786_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1540_),
    .B(_1556_),
    .Y(_1557_)
);

sky130_fd_sc_hd__or2_4 _1787_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1534_),
    .B(_1556_),
    .X(_1558_)
);

sky130_fd_sc_hd__o22a_4 _1788_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1555_),
    .A2(_1557_),
    .B1(_1544_),
    .B2(_1558_),
    .X(_1559_)
);

sky130_fd_sc_hd__buf_1 _1789_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1501_),
    .X(_1560_)
);

sky130_fd_sc_hd__o22a_4 _1790_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1538_),
    .A2(_1559_),
    .B1(_1555_),
    .B2(_1560_),
    .X(_1561_)
);

sky130_fd_sc_hd__nor2_4 _1791_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1530_),
    .B(_1561_),
    .Y(_0031_)
);

sky130_fd_sc_hd__inv_8 _1792_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(OUT[10]),
    .Y(_1562_)
);

sky130_fd_sc_hd__or4_4 _1793_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1490_),
    .B(_1491_),
    .C(_1477_),
    .D(_1549_),
    .X(_1563_)
);

sky130_fd_sc_hd__nor2_4 _1794_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1540_),
    .B(_1563_),
    .Y(_1564_)
);

sky130_fd_sc_hd__or2_4 _1795_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1534_),
    .B(_1563_),
    .X(_1565_)
);

sky130_fd_sc_hd__o22a_4 _1796_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1562_),
    .A2(_1564_),
    .B1(_1544_),
    .B2(_1565_),
    .X(_1566_)
);

sky130_fd_sc_hd__o22a_4 _1797_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1538_),
    .A2(_1566_),
    .B1(_1562_),
    .B2(_1560_),
    .X(_1567_)
);

sky130_fd_sc_hd__nor2_4 _1798_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1530_),
    .B(_1567_),
    .Y(_0001_)
);

sky130_fd_sc_hd__buf_1 _1799_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1472_),
    .X(_1568_)
);

sky130_fd_sc_hd__inv_8 _1800_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(OUT[11]),
    .Y(_1569_)
);

sky130_fd_sc_hd__or4_4 _1801_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1490_),
    .B(_1476_),
    .C(_1477_),
    .D(_1549_),
    .X(_1570_)
);

sky130_fd_sc_hd__nor2_4 _1802_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1540_),
    .B(_1570_),
    .Y(_1571_)
);

sky130_fd_sc_hd__or2_4 _1803_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1495_),
    .B(_1570_),
    .X(_1572_)
);

sky130_fd_sc_hd__o22a_4 _1804_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1569_),
    .A2(_1571_),
    .B1(_1544_),
    .B2(_1572_),
    .X(_1573_)
);

sky130_fd_sc_hd__o22a_4 _1805_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1538_),
    .A2(_1573_),
    .B1(_1569_),
    .B2(_1560_),
    .X(_1574_)
);

sky130_fd_sc_hd__nor2_4 _1806_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1568_),
    .B(_1574_),
    .Y(_0002_)
);

sky130_fd_sc_hd__buf_1 _1807_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1486_),
    .X(_1575_)
);

sky130_fd_sc_hd__inv_8 _1808_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(OUT[12]),
    .Y(_1576_)
);

sky130_fd_sc_hd__or4_4 _1809_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1475_),
    .B(_1491_),
    .C(_1422_),
    .D(_1516_),
    .X(_1577_)
);

sky130_fd_sc_hd__nor2_4 _1810_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1482_),
    .B(_1577_),
    .Y(_1578_)
);

sky130_fd_sc_hd__or2_4 _1811_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1495_),
    .B(_1577_),
    .X(_1579_)
);

sky130_fd_sc_hd__o22a_4 _1812_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1576_),
    .A2(_1578_),
    .B1(_1498_),
    .B2(_1579_),
    .X(_1580_)
);

sky130_fd_sc_hd__o22a_4 _1813_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1575_),
    .A2(_1580_),
    .B1(_1576_),
    .B2(_1560_),
    .X(_1581_)
);

sky130_fd_sc_hd__nor2_4 _1814_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1568_),
    .B(_1581_),
    .Y(_0003_)
);

sky130_fd_sc_hd__inv_8 _1815_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(OUT[13]),
    .Y(_1582_)
);

sky130_fd_sc_hd__or4_4 _1816_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1422_),
    .B(_1516_),
    .C(_1514_),
    .D(_1506_),
    .X(_1583_)
);

sky130_fd_sc_hd__nor2_4 _1817_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1482_),
    .B(_1583_),
    .Y(_1584_)
);

sky130_fd_sc_hd__or2_4 _1818_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1495_),
    .B(_1583_),
    .X(_1585_)
);

sky130_fd_sc_hd__o22a_4 _1819_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1582_),
    .A2(_1584_),
    .B1(_1498_),
    .B2(_1585_),
    .X(_1586_)
);

sky130_fd_sc_hd__o22a_4 _1820_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1575_),
    .A2(_1586_),
    .B1(_1582_),
    .B2(_1560_),
    .X(_1587_)
);

sky130_fd_sc_hd__nor2_4 _1821_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1568_),
    .B(_1587_),
    .Y(_0004_)
);

sky130_fd_sc_hd__inv_8 _1822_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(OUT[14]),
    .Y(_1588_)
);

sky130_fd_sc_hd__or4_4 _1823_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1422_),
    .B(_1516_),
    .C(_1505_),
    .D(_1515_),
    .X(_1589_)
);

sky130_fd_sc_hd__nor2_4 _1824_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1482_),
    .B(_1589_),
    .Y(_1590_)
);

sky130_fd_sc_hd__or2_4 _1825_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1495_),
    .B(_1589_),
    .X(_1591_)
);

sky130_fd_sc_hd__o22a_4 _1826_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1588_),
    .A2(_1590_),
    .B1(_1498_),
    .B2(_1591_),
    .X(_1592_)
);

sky130_fd_sc_hd__buf_1 _1827_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1501_),
    .X(_1593_)
);

sky130_fd_sc_hd__o22a_4 _1828_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1575_),
    .A2(_1592_),
    .B1(_1588_),
    .B2(_1593_),
    .X(_1594_)
);

sky130_fd_sc_hd__nor2_4 _1829_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1568_),
    .B(_1594_),
    .Y(_0005_)
);

sky130_fd_sc_hd__or2_4 _1830_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1482_),
    .B(_1425_),
    .X(_1595_)
);

sky130_fd_sc_hd__or4_4 _1831_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1408_),
    .B(_1461_),
    .C(_1433_),
    .D(_1425_),
    .X(_1596_)
);

sky130_fd_sc_hd__a21boi_4 _1832_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(OUT[15]),
    .A2(_1595_),
    .B1_N(_1596_),
    .Y(_1597_)
);

sky130_fd_sc_hd__inv_8 _1833_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(OUT[15]),
    .Y(_1598_)
);

sky130_fd_sc_hd__o22a_4 _1834_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1575_),
    .A2(_1597_),
    .B1(_1598_),
    .B2(_1593_),
    .X(_1599_)
);

sky130_fd_sc_hd__nor2_4 _1835_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1568_),
    .B(_1599_),
    .Y(_0006_)
);

sky130_fd_sc_hd__buf_1 _1836_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1472_),
    .X(_1600_)
);

sky130_fd_sc_hd__inv_8 _1837_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(OUT[16]),
    .Y(_1601_)
);

sky130_fd_sc_hd__or2_4 _1838_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(COUNT[5]),
    .B(_1419_),
    .X(_1602_)
);

sky130_fd_sc_hd__buf_1 _1839_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1602_),
    .X(_1603_)
);

sky130_fd_sc_hd__buf_1 _1840_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1603_),
    .X(_1604_)
);

sky130_fd_sc_hd__nor2_4 _1841_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1457_),
    .B(_1604_),
    .Y(_1605_)
);

sky130_fd_sc_hd__or2_4 _1842_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1407_),
    .B(_1602_),
    .X(_1606_)
);

sky130_fd_sc_hd__buf_1 _1843_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1606_),
    .X(_1607_)
);

sky130_fd_sc_hd__buf_1 _1844_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1607_),
    .X(_1608_)
);

sky130_fd_sc_hd__o22a_4 _1845_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1601_),
    .A2(_1605_),
    .B1(_1462_),
    .B2(_1608_),
    .X(_1609_)
);

sky130_fd_sc_hd__o22a_4 _1846_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1575_),
    .A2(_1609_),
    .B1(_1601_),
    .B2(_1593_),
    .X(_1610_)
);

sky130_fd_sc_hd__nor2_4 _1847_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1600_),
    .B(_1610_),
    .Y(_0007_)
);

sky130_fd_sc_hd__buf_1 _1848_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1455_),
    .X(_1611_)
);

sky130_fd_sc_hd__or2_4 _1849_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1478_),
    .B(_1603_),
    .X(_1612_)
);

sky130_fd_sc_hd__or4_4 _1850_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1408_),
    .B(_1603_),
    .C(_1433_),
    .D(_1478_),
    .X(_1613_)
);

sky130_fd_sc_hd__a21boi_4 _1851_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(OUT[17]),
    .A2(_1612_),
    .B1_N(_1613_),
    .Y(_1614_)
);

sky130_fd_sc_hd__inv_8 _1852_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(OUT[17]),
    .Y(_1615_)
);

sky130_fd_sc_hd__o22a_4 _1853_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1611_),
    .A2(_1614_),
    .B1(_1615_),
    .B2(_1593_),
    .X(_1616_)
);

sky130_fd_sc_hd__nor2_4 _1854_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1600_),
    .B(_1616_),
    .Y(_0008_)
);

sky130_fd_sc_hd__inv_8 _1855_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(OUT[18]),
    .Y(_1617_)
);

sky130_fd_sc_hd__nor2_4 _1856_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1493_),
    .B(_1604_),
    .Y(_1618_)
);

sky130_fd_sc_hd__o22a_4 _1857_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1617_),
    .A2(_1618_),
    .B1(_1496_),
    .B2(_1608_),
    .X(_1619_)
);

sky130_fd_sc_hd__o22a_4 _1858_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1611_),
    .A2(_1619_),
    .B1(_1617_),
    .B2(_1593_),
    .X(_1620_)
);

sky130_fd_sc_hd__nor2_4 _1859_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1600_),
    .B(_1620_),
    .Y(_0009_)
);

sky130_fd_sc_hd__inv_8 _1860_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(OUT[19]),
    .Y(_1621_)
);

sky130_fd_sc_hd__nor2_4 _1861_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1508_),
    .B(_1604_),
    .Y(_1622_)
);

sky130_fd_sc_hd__o22a_4 _1862_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1621_),
    .A2(_1622_),
    .B1(_1510_),
    .B2(_1608_),
    .X(_1623_)
);

sky130_fd_sc_hd__buf_1 _1863_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1450_),
    .X(_1624_)
);

sky130_fd_sc_hd__o22a_4 _1864_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1611_),
    .A2(_1623_),
    .B1(_1621_),
    .B2(_1624_),
    .X(_1625_)
);

sky130_fd_sc_hd__nor2_4 _1865_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1600_),
    .B(_1625_),
    .Y(_0010_)
);

sky130_fd_sc_hd__inv_8 _1866_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(OUT[20]),
    .Y(_1626_)
);

sky130_fd_sc_hd__nor2_4 _1867_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1518_),
    .B(_1604_),
    .Y(_1627_)
);

sky130_fd_sc_hd__o22a_4 _1868_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1626_),
    .A2(_1627_),
    .B1(_1520_),
    .B2(_1608_),
    .X(_1628_)
);

sky130_fd_sc_hd__o22a_4 _1869_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1611_),
    .A2(_1628_),
    .B1(_1626_),
    .B2(_1624_),
    .X(_1629_)
);

sky130_fd_sc_hd__nor2_4 _1870_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1600_),
    .B(_1629_),
    .Y(_0012_)
);

sky130_fd_sc_hd__buf_1 _1871_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1472_),
    .X(_1630_)
);

sky130_fd_sc_hd__inv_8 _1872_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(OUT[21]),
    .Y(_1631_)
);

sky130_fd_sc_hd__buf_1 _1873_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1603_),
    .X(_1632_)
);

sky130_fd_sc_hd__nor2_4 _1874_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1525_),
    .B(_1632_),
    .Y(_1633_)
);

sky130_fd_sc_hd__o22a_4 _1875_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1631_),
    .A2(_1633_),
    .B1(_1527_),
    .B2(_1608_),
    .X(_1634_)
);

sky130_fd_sc_hd__o22a_4 _1876_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1611_),
    .A2(_1634_),
    .B1(_1631_),
    .B2(_1624_),
    .X(_1635_)
);

sky130_fd_sc_hd__nor2_4 _1877_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1630_),
    .B(_1635_),
    .Y(_0013_)
);

sky130_fd_sc_hd__buf_1 _1878_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1455_),
    .X(_1636_)
);

sky130_fd_sc_hd__inv_8 _1879_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(OUT[22]),
    .Y(_1637_)
);

sky130_fd_sc_hd__nor2_4 _1880_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1532_),
    .B(_1632_),
    .Y(_1638_)
);

sky130_fd_sc_hd__buf_1 _1881_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1606_),
    .X(_1639_)
);

sky130_fd_sc_hd__o22a_4 _1882_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1637_),
    .A2(_1638_),
    .B1(_1535_),
    .B2(_1639_),
    .X(_1640_)
);

sky130_fd_sc_hd__o22a_4 _1883_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1636_),
    .A2(_1640_),
    .B1(_1637_),
    .B2(_1624_),
    .X(_1641_)
);

sky130_fd_sc_hd__nor2_4 _1884_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1630_),
    .B(_1641_),
    .Y(_0014_)
);

sky130_fd_sc_hd__inv_8 _1885_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(OUT[23]),
    .Y(_1642_)
);

sky130_fd_sc_hd__nor2_4 _1886_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1542_),
    .B(_1632_),
    .Y(_1643_)
);

sky130_fd_sc_hd__o22a_4 _1887_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1642_),
    .A2(_1643_),
    .B1(_1545_),
    .B2(_1639_),
    .X(_1644_)
);

sky130_fd_sc_hd__o22a_4 _1888_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1636_),
    .A2(_1644_),
    .B1(_1642_),
    .B2(_1624_),
    .X(_1645_)
);

sky130_fd_sc_hd__nor2_4 _1889_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1630_),
    .B(_1645_),
    .Y(_0015_)
);

sky130_fd_sc_hd__inv_8 _1890_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(OUT[24]),
    .Y(_1646_)
);

sky130_fd_sc_hd__nor2_4 _1891_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1550_),
    .B(_1632_),
    .Y(_1647_)
);

sky130_fd_sc_hd__o22a_4 _1892_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1646_),
    .A2(_1647_),
    .B1(_1552_),
    .B2(_1639_),
    .X(_1648_)
);

sky130_fd_sc_hd__buf_1 _1893_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1450_),
    .X(_1649_)
);

sky130_fd_sc_hd__o22a_4 _1894_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1636_),
    .A2(_1648_),
    .B1(_1646_),
    .B2(_1649_),
    .X(_1650_)
);

sky130_fd_sc_hd__nor2_4 _1895_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1630_),
    .B(_1650_),
    .Y(_0016_)
);

sky130_fd_sc_hd__inv_8 _1896_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(OUT[25]),
    .Y(_1651_)
);

sky130_fd_sc_hd__nor2_4 _1897_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1556_),
    .B(_1632_),
    .Y(_1652_)
);

sky130_fd_sc_hd__o22a_4 _1898_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1651_),
    .A2(_1652_),
    .B1(_1558_),
    .B2(_1639_),
    .X(_1653_)
);

sky130_fd_sc_hd__o22a_4 _1899_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1636_),
    .A2(_1653_),
    .B1(_1651_),
    .B2(_1649_),
    .X(_1654_)
);

sky130_fd_sc_hd__nor2_4 _1900_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1630_),
    .B(_1654_),
    .Y(_0017_)
);

sky130_fd_sc_hd__buf_1 _1901_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1470_),
    .X(_1655_)
);

sky130_fd_sc_hd__inv_8 _1902_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(OUT[26]),
    .Y(_1656_)
);

sky130_fd_sc_hd__buf_1 _1903_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1603_),
    .X(_1657_)
);

sky130_fd_sc_hd__nor2_4 _1904_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1563_),
    .B(_1657_),
    .Y(_1658_)
);

sky130_fd_sc_hd__o22a_4 _1905_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1656_),
    .A2(_1658_),
    .B1(_1565_),
    .B2(_1639_),
    .X(_1659_)
);

sky130_fd_sc_hd__o22a_4 _1906_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1636_),
    .A2(_1659_),
    .B1(_1656_),
    .B2(_1649_),
    .X(_1660_)
);

sky130_fd_sc_hd__nor2_4 _1907_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1655_),
    .B(_1660_),
    .Y(_0018_)
);

sky130_fd_sc_hd__buf_1 _1908_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1455_),
    .X(_1661_)
);

sky130_fd_sc_hd__inv_8 _1909_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(OUT[27]),
    .Y(_1662_)
);

sky130_fd_sc_hd__nor2_4 _1910_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1570_),
    .B(_1657_),
    .Y(_1663_)
);

sky130_fd_sc_hd__o22a_4 _1911_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1662_),
    .A2(_1663_),
    .B1(_1572_),
    .B2(_1607_),
    .X(_1664_)
);

sky130_fd_sc_hd__o22a_4 _1912_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1661_),
    .A2(_1664_),
    .B1(_1662_),
    .B2(_1649_),
    .X(_1665_)
);

sky130_fd_sc_hd__nor2_4 _1913_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1655_),
    .B(_1665_),
    .Y(_0019_)
);

sky130_fd_sc_hd__inv_8 _1914_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(OUT[28]),
    .Y(_1666_)
);

sky130_fd_sc_hd__nor2_4 _1915_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1577_),
    .B(_1657_),
    .Y(_1667_)
);

sky130_fd_sc_hd__o22a_4 _1916_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1666_),
    .A2(_1667_),
    .B1(_1579_),
    .B2(_1607_),
    .X(_1668_)
);

sky130_fd_sc_hd__o22a_4 _1917_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1661_),
    .A2(_1668_),
    .B1(_1666_),
    .B2(_1649_),
    .X(_1669_)
);

sky130_fd_sc_hd__nor2_4 _1918_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1655_),
    .B(_1669_),
    .Y(_0020_)
);

sky130_fd_sc_hd__inv_8 _1919_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(OUT[29]),
    .Y(_1670_)
);

sky130_fd_sc_hd__nor2_4 _1920_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1583_),
    .B(_1657_),
    .Y(_1671_)
);

sky130_fd_sc_hd__o22a_4 _1921_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1670_),
    .A2(_1671_),
    .B1(_1585_),
    .B2(_1607_),
    .X(_1672_)
);

sky130_fd_sc_hd__o22a_4 _1922_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1661_),
    .A2(_1672_),
    .B1(_1670_),
    .B2(_1451_),
    .X(_1673_)
);

sky130_fd_sc_hd__nor2_4 _1923_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1655_),
    .B(_1673_),
    .Y(_0021_)
);

sky130_fd_sc_hd__inv_8 _1924_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(OUT[30]),
    .Y(_1674_)
);

sky130_fd_sc_hd__nor2_4 _1925_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1589_),
    .B(_1657_),
    .Y(_1675_)
);

sky130_fd_sc_hd__o22a_4 _1926_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1674_),
    .A2(_1675_),
    .B1(_1591_),
    .B2(_1607_),
    .X(_1676_)
);

sky130_fd_sc_hd__o22a_4 _1927_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1661_),
    .A2(_1676_),
    .B1(_1674_),
    .B2(_1451_),
    .X(_1677_)
);

sky130_fd_sc_hd__nor2_4 _1928_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1655_),
    .B(_1677_),
    .Y(_0023_)
);

sky130_fd_sc_hd__inv_8 _1929_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1425_),
    .Y(_1678_)
);

sky130_fd_sc_hd__and4_4 _1930_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1426_),
    .B(COUNT[4]),
    .C(_1678_),
    .D(_1474_),
    .X(_1679_)
);

sky130_fd_sc_hd__inv_8 _1931_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(OUT[31]),
    .Y(_1680_)
);

sky130_fd_sc_hd__o21a_4 _1932_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1425_),
    .A2(_1604_),
    .B1(_1680_),
    .X(_1681_)
);

sky130_fd_sc_hd__or3_4 _1933_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1486_),
    .B(_1679_),
    .C(_1681_),
    .X(_1682_)
);

sky130_fd_sc_hd__a21o_4 _1934_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1680_),
    .A2(_1409_),
    .B1(_1470_),
    .X(_1683_)
);

sky130_fd_sc_hd__a21oi_4 _1935_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1502_),
    .A2(_1682_),
    .B1(_1683_),
    .Y(_0024_)
);

sky130_fd_sc_hd__buf_1 _1936_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1441_),
    .X(_1684_)
);

sky130_fd_sc_hd__or2_4 _1937_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1410_),
    .B(_1466_),
    .X(_1685_)
);

sky130_fd_sc_hd__or2_4 _1938_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1427_),
    .B(_1685_),
    .X(_1686_)
);

sky130_fd_sc_hd__buf_1 _1939_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1686_),
    .X(_1687_)
);

sky130_fd_sc_hd__buf_1 _1940_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1687_),
    .X(_1688_)
);

sky130_fd_sc_hd__inv_8 _1941_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1688_),
    .Y(_1689_)
);

sky130_fd_sc_hd__and2_4 _1942_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1684_),
    .B(_1689_),
    .X(_1690_)
);

sky130_fd_sc_hd__buf_1 _1943_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(SAMPLE_COUNT[0]),
    .X(_1691_)
);

sky130_fd_sc_hd__and2_4 _1944_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1437_),
    .B(_1449_),
    .X(_1692_)
);

sky130_fd_sc_hd__a21o_4 _1945_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1691_),
    .A2(_1688_),
    .B1(_1692_),
    .X(_1693_)
);

sky130_fd_sc_hd__or2_4 _1946_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1470_),
    .B(_1469_),
    .X(_1694_)
);

sky130_fd_sc_hd__buf_1 _1947_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1694_),
    .X(_1695_)
);

sky130_fd_sc_hd__inv_8 _1948_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1695_),
    .Y(_1696_)
);

sky130_fd_sc_hd__o21a_4 _1949_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1690_),
    .A2(_1693_),
    .B1(_1696_),
    .X(_0040_)
);

sky130_fd_sc_hd__or2_4 _1950_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1694_),
    .B(_1692_),
    .X(_1697_)
);

sky130_fd_sc_hd__buf_1 _1951_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1697_),
    .X(_1698_)
);

sky130_fd_sc_hd__buf_1 _1952_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1698_),
    .X(_1699_)
);

sky130_fd_sc_hd__buf_1 _1953_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1699_),
    .X(_1700_)
);

sky130_fd_sc_hd__buf_1 _1954_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1427_),
    .X(_1701_)
);

sky130_fd_sc_hd__buf_1 _1955_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1685_),
    .X(_1702_)
);

sky130_fd_sc_hd__buf_1 _1956_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(SAMPLE_COUNT[1]),
    .X(_1703_)
);

sky130_fd_sc_hd__inv_8 _1957_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1703_),
    .Y(_1704_)
);

sky130_fd_sc_hd__buf_1 _1958_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1704_),
    .X(_1705_)
);

sky130_fd_sc_hd__or4_4 _1959_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1701_),
    .B(_1702_),
    .C(_1705_),
    .D(_1684_),
    .X(_1706_)
);

sky130_fd_sc_hd__buf_1 _1960_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1706_),
    .X(_1707_)
);

sky130_fd_sc_hd__inv_8 _1961_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1707_),
    .Y(_1708_)
);

sky130_fd_sc_hd__o21a_4 _1962_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1684_),
    .A2(_1688_),
    .B1(_1705_),
    .X(_1709_)
);

sky130_fd_sc_hd__nor3_4 _1963_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1700_),
    .B(_1708_),
    .C(_1709_),
    .Y(_0041_)
);

sky130_fd_sc_hd__buf_1 _1964_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1413_),
    .X(_1710_)
);

sky130_fd_sc_hd__and3_4 _1965_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1703_),
    .B(_1691_),
    .C(_1435_),
    .X(_1711_)
);

sky130_fd_sc_hd__and2_4 _1966_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1689_),
    .B(_1711_),
    .X(_1712_)
);

sky130_fd_sc_hd__or2_4 _1967_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1699_),
    .B(_1712_),
    .X(_1713_)
);

sky130_fd_sc_hd__a21oi_4 _1968_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1710_),
    .A2(_1707_),
    .B1(_1713_),
    .Y(_0042_)
);

sky130_fd_sc_hd__buf_1 _1969_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1702_),
    .X(_1714_)
);

sky130_fd_sc_hd__buf_1 _1970_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1714_),
    .X(_1715_)
);

sky130_fd_sc_hd__and2_4 _1971_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1661_),
    .B(_1715_),
    .X(_1716_)
);

sky130_fd_sc_hd__o21a_4 _1972_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1712_),
    .A2(_1716_),
    .B1(_1696_),
    .X(_0043_)
);

sky130_fd_sc_hd__buf_1 _1973_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1701_),
    .X(_1717_)
);

sky130_fd_sc_hd__and3_4 _1974_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(INTERNAL_FINISH),
    .B(_1506_),
    .C(_1717_),
    .X(_1718_)
);

sky130_fd_sc_hd__or2_4 _1975_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1437_),
    .B(_1428_),
    .X(_1719_)
);

sky130_fd_sc_hd__buf_1 _1976_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1719_),
    .X(_1720_)
);

sky130_fd_sc_hd__inv_8 _1977_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1720_),
    .Y(_1721_)
);

sky130_fd_sc_hd__and2_4 _1978_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1515_),
    .B(_1721_),
    .X(_1722_)
);

sky130_fd_sc_hd__a21oi_4 _1979_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1506_),
    .A2(_1720_),
    .B1(_1722_),
    .Y(_1723_)
);

sky130_fd_sc_hd__nor2_4 _1980_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1409_),
    .B(_1723_),
    .Y(_1724_)
);

sky130_fd_sc_hd__nor4_4 _1981_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1410_),
    .B(_1695_),
    .C(_1718_),
    .D(_1724_),
    .Y(_0033_)
);

sky130_fd_sc_hd__buf_1 _1982_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1685_),
    .X(_1725_)
);

sky130_fd_sc_hd__inv_8 _1983_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1725_),
    .Y(_1726_)
);

sky130_fd_sc_hd__or2_4 _1984_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1454_),
    .B(_1701_),
    .X(_1727_)
);

sky130_fd_sc_hd__a2bb2o_4 _1985_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1_N(_1409_),
    .A2_N(_1722_),
    .B1(_1726_),
    .B2(_1727_),
    .X(_1728_)
);

sky130_fd_sc_hd__and2_4 _1986_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1514_),
    .B(_1728_),
    .X(_1729_)
);

sky130_fd_sc_hd__and4_4 _1987_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1515_),
    .B(_1721_),
    .C(_1505_),
    .D(_1450_),
    .X(_1730_)
);

sky130_fd_sc_hd__or2_4 _1988_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1469_),
    .B(_1730_),
    .X(_1731_)
);

sky130_fd_sc_hd__o21a_4 _1989_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1729_),
    .A2(_1731_),
    .B1(READY),
    .X(_0034_)
);

sky130_fd_sc_hd__buf_1 _1990_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1701_),
    .X(_1732_)
);

sky130_fd_sc_hd__and3_4 _1991_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1514_),
    .B(_1515_),
    .C(_1517_),
    .X(_1733_)
);

sky130_fd_sc_hd__a32o_4 _1992_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1412_),
    .A2(_1450_),
    .A3(_1733_),
    .B1(_1507_),
    .B2(_1726_),
    .X(_1734_)
);

sky130_fd_sc_hd__and2_4 _1993_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1732_),
    .B(_1734_),
    .X(_1735_)
);

sky130_fd_sc_hd__or4_4 _1994_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1505_),
    .B(_1506_),
    .C(_1454_),
    .D(_1430_),
    .X(_1736_)
);

sky130_fd_sc_hd__and3_4 _1995_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1507_),
    .B(_1451_),
    .C(_1736_),
    .X(_1737_)
);

sky130_fd_sc_hd__o21a_4 _1996_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1735_),
    .A2(_1737_),
    .B1(_1696_),
    .X(_0035_)
);

sky130_fd_sc_hd__buf_1 _1997_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1430_),
    .X(_1738_)
);

sky130_fd_sc_hd__or3_4 _1998_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1738_),
    .B(_1714_),
    .C(_1549_),
    .X(_1739_)
);

sky130_fd_sc_hd__and2_4 _1999_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1409_),
    .B(_1739_),
    .X(_1740_)
);

sky130_fd_sc_hd__or2_4 _2000_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1517_),
    .B(_1736_),
    .X(_1741_)
);

sky130_fd_sc_hd__o21a_4 _2001_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1542_),
    .A2(_1720_),
    .B1(_1501_),
    .X(_1742_)
);

sky130_fd_sc_hd__a21boi_4 _2002_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1492_),
    .A2(_1741_),
    .B1_N(_1742_),
    .Y(_1743_)
);

sky130_fd_sc_hd__nor3_4 _2003_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1695_),
    .B(_1740_),
    .C(_1743_),
    .Y(_0036_)
);

sky130_fd_sc_hd__a21o_4 _2004_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1717_),
    .A2(_1726_),
    .B1(_1451_),
    .X(_1744_)
);

sky130_fd_sc_hd__a32oi_4 _2005_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1502_),
    .A2(_1678_),
    .A3(_1721_),
    .B1(COUNT[4]),
    .B2(_1744_),
    .Y(_1745_)
);

sky130_fd_sc_hd__nor2_4 _2006_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1695_),
    .B(_1745_),
    .Y(_0037_)
);

sky130_fd_sc_hd__and4_4 _2007_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(READY),
    .B(_1468_),
    .C(COUNT[5]),
    .D(_1502_),
    .X(_0038_)
);

sky130_fd_sc_hd__buf_1 _2008_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1699_),
    .X(_1746_)
);

sky130_fd_sc_hd__buf_1 _2009_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1746_),
    .X(_1747_)
);

sky130_fd_sc_hd__inv_8 _2010_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN8[0] ),
    .Y(_1748_)
);

sky130_fd_sc_hd__buf_1 _2011_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1429_),
    .X(_1749_)
);

sky130_fd_sc_hd__buf_1 _2012_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1749_),
    .X(_1750_)
);

sky130_fd_sc_hd__buf_1 _2013_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1686_),
    .X(_1751_)
);

sky130_fd_sc_hd__or2_4 _2014_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1417_),
    .B(_1751_),
    .X(_1752_)
);

sky130_fd_sc_hd__buf_1 _2015_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1752_),
    .X(_1753_)
);

sky130_fd_sc_hd__o21a_4 _2016_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1748_),
    .A2(_1750_),
    .B1(_1753_),
    .X(_1754_)
);

sky130_fd_sc_hd__or4_4 _2017_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1704_),
    .B(_1441_),
    .C(_1710_),
    .D(_1452_),
    .X(_1755_)
);

sky130_fd_sc_hd__buf_1 _2018_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1755_),
    .X(_1756_)
);

sky130_fd_sc_hd__buf_1 _2019_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1756_),
    .X(_1757_)
);

sky130_fd_sc_hd__buf_1 _2020_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1757_),
    .X(_1758_)
);

sky130_fd_sc_hd__o21a_4 _2021_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1453_),
    .A2(_1711_),
    .B1(_1726_),
    .X(_1759_)
);

sky130_fd_sc_hd__buf_1 _2022_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1759_),
    .X(_1760_)
);

sky130_fd_sc_hd__buf_1 _2023_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1760_),
    .X(_0300_)
);

sky130_fd_sc_hd__o22a_4 _2024_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1754_),
    .A2(_1758_),
    .B1(_1748_),
    .B2(_0300_),
    .X(_0301_)
);

sky130_fd_sc_hd__nor2_4 _2025_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1747_),
    .B(_0301_),
    .Y(_0268_)
);

sky130_fd_sc_hd__inv_8 _2026_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN8[1] ),
    .Y(_0302_)
);

sky130_fd_sc_hd__buf_1 _2027_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1738_),
    .X(_0303_)
);

sky130_fd_sc_hd__or2_4 _2028_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1481_),
    .B(_1688_),
    .X(_0304_)
);

sky130_fd_sc_hd__buf_1 _2029_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0304_),
    .X(_0305_)
);

sky130_fd_sc_hd__o21a_4 _2030_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0302_),
    .A2(_0303_),
    .B1(_0305_),
    .X(_0306_)
);

sky130_fd_sc_hd__o22a_4 _2031_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1758_),
    .A2(_0306_),
    .B1(_0302_),
    .B2(_0300_),
    .X(_0307_)
);

sky130_fd_sc_hd__nor2_4 _2032_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1747_),
    .B(_0307_),
    .Y(_0279_)
);

sky130_fd_sc_hd__inv_8 _2033_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN8[2] ),
    .Y(_0308_)
);

sky130_fd_sc_hd__or2_4 _2034_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1488_),
    .B(_1688_),
    .X(_0309_)
);

sky130_fd_sc_hd__buf_1 _2035_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0309_),
    .X(_0310_)
);

sky130_fd_sc_hd__o21a_4 _2036_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0308_),
    .A2(_0303_),
    .B1(_0310_),
    .X(_0311_)
);

sky130_fd_sc_hd__o22a_4 _2037_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1758_),
    .A2(_0311_),
    .B1(_0308_),
    .B2(_0300_),
    .X(_0312_)
);

sky130_fd_sc_hd__nor2_4 _2038_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1747_),
    .B(_0312_),
    .Y(_0290_)
);

sky130_fd_sc_hd__inv_8 _2039_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN8[3] ),
    .Y(_0313_)
);

sky130_fd_sc_hd__buf_1 _2040_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1751_),
    .X(_0314_)
);

sky130_fd_sc_hd__or2_4 _2041_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1504_),
    .B(_0314_),
    .X(_0315_)
);

sky130_fd_sc_hd__buf_1 _2042_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0315_),
    .X(_0316_)
);

sky130_fd_sc_hd__o21a_4 _2043_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0313_),
    .A2(_0303_),
    .B1(_0316_),
    .X(_0317_)
);

sky130_fd_sc_hd__o22a_4 _2044_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1758_),
    .A2(_0317_),
    .B1(_0313_),
    .B2(_0300_),
    .X(_0318_)
);

sky130_fd_sc_hd__nor2_4 _2045_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1747_),
    .B(_0318_),
    .Y(_0293_)
);

sky130_fd_sc_hd__inv_8 _2046_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN8[4] ),
    .Y(_0319_)
);

sky130_fd_sc_hd__or2_4 _2047_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1513_),
    .B(_0314_),
    .X(_0320_)
);

sky130_fd_sc_hd__buf_1 _2048_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0320_),
    .X(_0321_)
);

sky130_fd_sc_hd__o21a_4 _2049_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0319_),
    .A2(_0303_),
    .B1(_0321_),
    .X(_0322_)
);

sky130_fd_sc_hd__o22a_4 _2050_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1758_),
    .A2(_0322_),
    .B1(_0319_),
    .B2(_0300_),
    .X(_0323_)
);

sky130_fd_sc_hd__nor2_4 _2051_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1747_),
    .B(_0323_),
    .Y(_0294_)
);

sky130_fd_sc_hd__buf_1 _2052_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1746_),
    .X(_0324_)
);

sky130_fd_sc_hd__buf_1 _2053_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1757_),
    .X(_0325_)
);

sky130_fd_sc_hd__inv_8 _2054_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN8[5] ),
    .Y(_0326_)
);

sky130_fd_sc_hd__or2_4 _2055_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1524_),
    .B(_0314_),
    .X(_0327_)
);

sky130_fd_sc_hd__buf_1 _2056_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0327_),
    .X(_0328_)
);

sky130_fd_sc_hd__o21a_4 _2057_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0326_),
    .A2(_0303_),
    .B1(_0328_),
    .X(_0329_)
);

sky130_fd_sc_hd__buf_1 _2058_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1760_),
    .X(_0330_)
);

sky130_fd_sc_hd__o22a_4 _2059_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0325_),
    .A2(_0329_),
    .B1(_0326_),
    .B2(_0330_),
    .X(_0331_)
);

sky130_fd_sc_hd__nor2_4 _2060_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0324_),
    .B(_0331_),
    .Y(_0295_)
);

sky130_fd_sc_hd__inv_8 _2061_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN8[6] ),
    .Y(_0332_)
);

sky130_fd_sc_hd__buf_1 _2062_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1738_),
    .X(_0333_)
);

sky130_fd_sc_hd__or2_4 _2063_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1531_),
    .B(_0314_),
    .X(_0334_)
);

sky130_fd_sc_hd__buf_1 _2064_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0334_),
    .X(_0335_)
);

sky130_fd_sc_hd__o21a_4 _2065_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0332_),
    .A2(_0333_),
    .B1(_0335_),
    .X(_0336_)
);

sky130_fd_sc_hd__o22a_4 _2066_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0325_),
    .A2(_0336_),
    .B1(_0332_),
    .B2(_0330_),
    .X(_0337_)
);

sky130_fd_sc_hd__nor2_4 _2067_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0324_),
    .B(_0337_),
    .Y(_0296_)
);

sky130_fd_sc_hd__inv_8 _2068_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN8[7] ),
    .Y(_0338_)
);

sky130_fd_sc_hd__or2_4 _2069_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1539_),
    .B(_0314_),
    .X(_0339_)
);

sky130_fd_sc_hd__buf_1 _2070_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0339_),
    .X(_0340_)
);

sky130_fd_sc_hd__o21a_4 _2071_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0338_),
    .A2(_0333_),
    .B1(_0340_),
    .X(_0341_)
);

sky130_fd_sc_hd__o22a_4 _2072_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0325_),
    .A2(_0341_),
    .B1(_0338_),
    .B2(_0330_),
    .X(_0342_)
);

sky130_fd_sc_hd__nor2_4 _2073_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0324_),
    .B(_0342_),
    .Y(_0297_)
);

sky130_fd_sc_hd__inv_8 _2074_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN8[8] ),
    .Y(_0343_)
);

sky130_fd_sc_hd__buf_1 _2075_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1687_),
    .X(_0344_)
);

sky130_fd_sc_hd__or2_4 _2076_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1548_),
    .B(_0344_),
    .X(_0345_)
);

sky130_fd_sc_hd__buf_1 _2077_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0345_),
    .X(_0346_)
);

sky130_fd_sc_hd__o21a_4 _2078_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0343_),
    .A2(_0333_),
    .B1(_0346_),
    .X(_0347_)
);

sky130_fd_sc_hd__o22a_4 _2079_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0325_),
    .A2(_0347_),
    .B1(_0343_),
    .B2(_0330_),
    .X(_0348_)
);

sky130_fd_sc_hd__nor2_4 _2080_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0324_),
    .B(_0348_),
    .Y(_0298_)
);

sky130_fd_sc_hd__inv_8 _2081_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN8[9] ),
    .Y(_0349_)
);

sky130_fd_sc_hd__or2_4 _2082_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1555_),
    .B(_0344_),
    .X(_0350_)
);

sky130_fd_sc_hd__buf_1 _2083_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0350_),
    .X(_0351_)
);

sky130_fd_sc_hd__o21a_4 _2084_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0349_),
    .A2(_0333_),
    .B1(_0351_),
    .X(_0352_)
);

sky130_fd_sc_hd__o22a_4 _2085_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0325_),
    .A2(_0352_),
    .B1(_0349_),
    .B2(_0330_),
    .X(_0353_)
);

sky130_fd_sc_hd__nor2_4 _2086_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0324_),
    .B(_0353_),
    .Y(_0299_)
);

sky130_fd_sc_hd__buf_1 _2087_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1746_),
    .X(_0354_)
);

sky130_fd_sc_hd__buf_1 _2088_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1757_),
    .X(_0355_)
);

sky130_fd_sc_hd__inv_8 _2089_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN8[10] ),
    .Y(_0356_)
);

sky130_fd_sc_hd__or2_4 _2090_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1562_),
    .B(_0344_),
    .X(_0357_)
);

sky130_fd_sc_hd__buf_1 _2091_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0357_),
    .X(_0358_)
);

sky130_fd_sc_hd__o21a_4 _2092_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0356_),
    .A2(_0333_),
    .B1(_0358_),
    .X(_0359_)
);

sky130_fd_sc_hd__buf_1 _2093_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1760_),
    .X(_0360_)
);

sky130_fd_sc_hd__o22a_4 _2094_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0355_),
    .A2(_0359_),
    .B1(_0356_),
    .B2(_0360_),
    .X(_0361_)
);

sky130_fd_sc_hd__nor2_4 _2095_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0354_),
    .B(_0361_),
    .Y(_0269_)
);

sky130_fd_sc_hd__inv_8 _2096_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN8[11] ),
    .Y(_0362_)
);

sky130_fd_sc_hd__buf_1 _2097_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1738_),
    .X(_0363_)
);

sky130_fd_sc_hd__or2_4 _2098_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1569_),
    .B(_0344_),
    .X(_0364_)
);

sky130_fd_sc_hd__buf_1 _2099_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0364_),
    .X(_0365_)
);

sky130_fd_sc_hd__o21a_4 _2100_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0362_),
    .A2(_0363_),
    .B1(_0365_),
    .X(_0366_)
);

sky130_fd_sc_hd__o22a_4 _2101_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0355_),
    .A2(_0366_),
    .B1(_0362_),
    .B2(_0360_),
    .X(_0367_)
);

sky130_fd_sc_hd__nor2_4 _2102_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0354_),
    .B(_0367_),
    .Y(_0270_)
);

sky130_fd_sc_hd__inv_8 _2103_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN8[12] ),
    .Y(_0368_)
);

sky130_fd_sc_hd__or2_4 _2104_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1576_),
    .B(_0344_),
    .X(_0369_)
);

sky130_fd_sc_hd__buf_1 _2105_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0369_),
    .X(_0370_)
);

sky130_fd_sc_hd__o21a_4 _2106_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0368_),
    .A2(_0363_),
    .B1(_0370_),
    .X(_0371_)
);

sky130_fd_sc_hd__o22a_4 _2107_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0355_),
    .A2(_0371_),
    .B1(_0368_),
    .B2(_0360_),
    .X(_0372_)
);

sky130_fd_sc_hd__nor2_4 _2108_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0354_),
    .B(_0372_),
    .Y(_0271_)
);

sky130_fd_sc_hd__inv_8 _2109_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN8[13] ),
    .Y(_0373_)
);

sky130_fd_sc_hd__buf_1 _2110_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1687_),
    .X(_0374_)
);

sky130_fd_sc_hd__or2_4 _2111_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1582_),
    .B(_0374_),
    .X(_0375_)
);

sky130_fd_sc_hd__buf_1 _2112_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0375_),
    .X(_0376_)
);

sky130_fd_sc_hd__o21a_4 _2113_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0373_),
    .A2(_0363_),
    .B1(_0376_),
    .X(_0377_)
);

sky130_fd_sc_hd__o22a_4 _2114_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0355_),
    .A2(_0377_),
    .B1(_0373_),
    .B2(_0360_),
    .X(_0378_)
);

sky130_fd_sc_hd__nor2_4 _2115_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0354_),
    .B(_0378_),
    .Y(_0272_)
);

sky130_fd_sc_hd__inv_8 _2116_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN8[14] ),
    .Y(_0379_)
);

sky130_fd_sc_hd__or2_4 _2117_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1588_),
    .B(_0374_),
    .X(_0380_)
);

sky130_fd_sc_hd__buf_1 _2118_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0380_),
    .X(_0381_)
);

sky130_fd_sc_hd__o21a_4 _2119_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0379_),
    .A2(_0363_),
    .B1(_0381_),
    .X(_0382_)
);

sky130_fd_sc_hd__o22a_4 _2120_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0355_),
    .A2(_0382_),
    .B1(_0379_),
    .B2(_0360_),
    .X(_0383_)
);

sky130_fd_sc_hd__nor2_4 _2121_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0354_),
    .B(_0383_),
    .Y(_0273_)
);

sky130_fd_sc_hd__buf_1 _2122_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1697_),
    .X(_0384_)
);

sky130_fd_sc_hd__buf_1 _2123_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0384_),
    .X(_0385_)
);

sky130_fd_sc_hd__buf_1 _2124_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0385_),
    .X(_0386_)
);

sky130_fd_sc_hd__buf_1 _2125_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1756_),
    .X(_0387_)
);

sky130_fd_sc_hd__inv_8 _2126_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN8[15] ),
    .Y(_0388_)
);

sky130_fd_sc_hd__or2_4 _2127_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1598_),
    .B(_0374_),
    .X(_0389_)
);

sky130_fd_sc_hd__buf_1 _2128_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0389_),
    .X(_0390_)
);

sky130_fd_sc_hd__o21a_4 _2129_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0388_),
    .A2(_0363_),
    .B1(_0390_),
    .X(_0391_)
);

sky130_fd_sc_hd__buf_1 _2130_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1760_),
    .X(_0392_)
);

sky130_fd_sc_hd__o22a_4 _2131_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0387_),
    .A2(_0391_),
    .B1(_0388_),
    .B2(_0392_),
    .X(_0393_)
);

sky130_fd_sc_hd__nor2_4 _2132_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0386_),
    .B(_0393_),
    .Y(_0274_)
);

sky130_fd_sc_hd__inv_8 _2133_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN8[16] ),
    .Y(_0394_)
);

sky130_fd_sc_hd__buf_1 _2134_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1738_),
    .X(_0395_)
);

sky130_fd_sc_hd__or2_4 _2135_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1601_),
    .B(_0374_),
    .X(_0396_)
);

sky130_fd_sc_hd__buf_1 _2136_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0396_),
    .X(_0397_)
);

sky130_fd_sc_hd__o21a_4 _2137_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0394_),
    .A2(_0395_),
    .B1(_0397_),
    .X(_0398_)
);

sky130_fd_sc_hd__o22a_4 _2138_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0387_),
    .A2(_0398_),
    .B1(_0394_),
    .B2(_0392_),
    .X(_0399_)
);

sky130_fd_sc_hd__nor2_4 _2139_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0386_),
    .B(_0399_),
    .Y(_0275_)
);

sky130_fd_sc_hd__inv_8 _2140_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN8[17] ),
    .Y(_0400_)
);

sky130_fd_sc_hd__or2_4 _2141_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1615_),
    .B(_0374_),
    .X(_0401_)
);

sky130_fd_sc_hd__buf_1 _2142_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0401_),
    .X(_0402_)
);

sky130_fd_sc_hd__o21a_4 _2143_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0400_),
    .A2(_0395_),
    .B1(_0402_),
    .X(_0403_)
);

sky130_fd_sc_hd__o22a_4 _2144_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0387_),
    .A2(_0403_),
    .B1(_0400_),
    .B2(_0392_),
    .X(_0404_)
);

sky130_fd_sc_hd__nor2_4 _2145_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0386_),
    .B(_0404_),
    .Y(_0276_)
);

sky130_fd_sc_hd__inv_8 _2146_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN8[18] ),
    .Y(_0405_)
);

sky130_fd_sc_hd__buf_1 _2147_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1687_),
    .X(_0406_)
);

sky130_fd_sc_hd__or2_4 _2148_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1617_),
    .B(_0406_),
    .X(_0407_)
);

sky130_fd_sc_hd__buf_1 _2149_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0407_),
    .X(_0408_)
);

sky130_fd_sc_hd__o21a_4 _2150_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0405_),
    .A2(_0395_),
    .B1(_0408_),
    .X(_0409_)
);

sky130_fd_sc_hd__o22a_4 _2151_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0387_),
    .A2(_0409_),
    .B1(_0405_),
    .B2(_0392_),
    .X(_0410_)
);

sky130_fd_sc_hd__nor2_4 _2152_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0386_),
    .B(_0410_),
    .Y(_0277_)
);

sky130_fd_sc_hd__inv_8 _2153_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN8[19] ),
    .Y(_0411_)
);

sky130_fd_sc_hd__or2_4 _2154_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1621_),
    .B(_0406_),
    .X(_0412_)
);

sky130_fd_sc_hd__buf_1 _2155_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0412_),
    .X(_0413_)
);

sky130_fd_sc_hd__o21a_4 _2156_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0411_),
    .A2(_0395_),
    .B1(_0413_),
    .X(_0414_)
);

sky130_fd_sc_hd__o22a_4 _2157_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0387_),
    .A2(_0414_),
    .B1(_0411_),
    .B2(_0392_),
    .X(_0415_)
);

sky130_fd_sc_hd__nor2_4 _2158_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0386_),
    .B(_0415_),
    .Y(_0278_)
);

sky130_fd_sc_hd__buf_1 _2159_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0385_),
    .X(_0416_)
);

sky130_fd_sc_hd__buf_1 _2160_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1756_),
    .X(_0417_)
);

sky130_fd_sc_hd__inv_8 _2161_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN8[20] ),
    .Y(_0418_)
);

sky130_fd_sc_hd__or2_4 _2162_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1626_),
    .B(_0406_),
    .X(_0419_)
);

sky130_fd_sc_hd__buf_1 _2163_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0419_),
    .X(_0420_)
);

sky130_fd_sc_hd__o21a_4 _2164_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0418_),
    .A2(_0395_),
    .B1(_0420_),
    .X(_0421_)
);

sky130_fd_sc_hd__buf_1 _2165_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1759_),
    .X(_0422_)
);

sky130_fd_sc_hd__o22a_4 _2166_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0417_),
    .A2(_0421_),
    .B1(_0418_),
    .B2(_0422_),
    .X(_0423_)
);

sky130_fd_sc_hd__nor2_4 _2167_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0416_),
    .B(_0423_),
    .Y(_0280_)
);

sky130_fd_sc_hd__inv_8 _2168_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN8[21] ),
    .Y(_0424_)
);

sky130_fd_sc_hd__buf_1 _2169_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1430_),
    .X(_0425_)
);

sky130_fd_sc_hd__buf_1 _2170_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0425_),
    .X(_0426_)
);

sky130_fd_sc_hd__or2_4 _2171_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1631_),
    .B(_0406_),
    .X(_0427_)
);

sky130_fd_sc_hd__buf_1 _2172_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0427_),
    .X(_0428_)
);

sky130_fd_sc_hd__o21a_4 _2173_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0424_),
    .A2(_0426_),
    .B1(_0428_),
    .X(_0429_)
);

sky130_fd_sc_hd__o22a_4 _2174_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0417_),
    .A2(_0429_),
    .B1(_0424_),
    .B2(_0422_),
    .X(_0430_)
);

sky130_fd_sc_hd__nor2_4 _2175_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0416_),
    .B(_0430_),
    .Y(_0281_)
);

sky130_fd_sc_hd__inv_8 _2176_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN8[22] ),
    .Y(_0431_)
);

sky130_fd_sc_hd__or2_4 _2177_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1637_),
    .B(_0406_),
    .X(_0432_)
);

sky130_fd_sc_hd__buf_1 _2178_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0432_),
    .X(_0433_)
);

sky130_fd_sc_hd__o21a_4 _2179_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0431_),
    .A2(_0426_),
    .B1(_0433_),
    .X(_0434_)
);

sky130_fd_sc_hd__o22a_4 _2180_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0417_),
    .A2(_0434_),
    .B1(_0431_),
    .B2(_0422_),
    .X(_0435_)
);

sky130_fd_sc_hd__nor2_4 _2181_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0416_),
    .B(_0435_),
    .Y(_0282_)
);

sky130_fd_sc_hd__inv_8 _2182_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN8[23] ),
    .Y(_0436_)
);

sky130_fd_sc_hd__buf_1 _2183_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1687_),
    .X(_0437_)
);

sky130_fd_sc_hd__or2_4 _2184_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1642_),
    .B(_0437_),
    .X(_0438_)
);

sky130_fd_sc_hd__buf_1 _2185_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0438_),
    .X(_0439_)
);

sky130_fd_sc_hd__o21a_4 _2186_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0436_),
    .A2(_0426_),
    .B1(_0439_),
    .X(_0440_)
);

sky130_fd_sc_hd__o22a_4 _2187_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0417_),
    .A2(_0440_),
    .B1(_0436_),
    .B2(_0422_),
    .X(_0441_)
);

sky130_fd_sc_hd__nor2_4 _2188_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0416_),
    .B(_0441_),
    .Y(_0283_)
);

sky130_fd_sc_hd__inv_8 _2189_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN8[24] ),
    .Y(_0442_)
);

sky130_fd_sc_hd__or2_4 _2190_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1646_),
    .B(_0437_),
    .X(_0443_)
);

sky130_fd_sc_hd__buf_1 _2191_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0443_),
    .X(_0444_)
);

sky130_fd_sc_hd__o21a_4 _2192_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0442_),
    .A2(_0426_),
    .B1(_0444_),
    .X(_0445_)
);

sky130_fd_sc_hd__o22a_4 _2193_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0417_),
    .A2(_0445_),
    .B1(_0442_),
    .B2(_0422_),
    .X(_0446_)
);

sky130_fd_sc_hd__nor2_4 _2194_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0416_),
    .B(_0446_),
    .Y(_0284_)
);

sky130_fd_sc_hd__buf_1 _2195_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0385_),
    .X(_0447_)
);

sky130_fd_sc_hd__buf_1 _2196_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1756_),
    .X(_0448_)
);

sky130_fd_sc_hd__inv_8 _2197_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN8[25] ),
    .Y(_0449_)
);

sky130_fd_sc_hd__or2_4 _2198_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1651_),
    .B(_0437_),
    .X(_0450_)
);

sky130_fd_sc_hd__buf_1 _2199_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0450_),
    .X(_0451_)
);

sky130_fd_sc_hd__o21a_4 _2200_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0449_),
    .A2(_0426_),
    .B1(_0451_),
    .X(_0452_)
);

sky130_fd_sc_hd__buf_1 _2201_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1759_),
    .X(_0453_)
);

sky130_fd_sc_hd__o22a_4 _2202_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0448_),
    .A2(_0452_),
    .B1(_0449_),
    .B2(_0453_),
    .X(_0454_)
);

sky130_fd_sc_hd__nor2_4 _2203_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0447_),
    .B(_0454_),
    .Y(_0285_)
);

sky130_fd_sc_hd__inv_8 _2204_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN8[26] ),
    .Y(_0455_)
);

sky130_fd_sc_hd__buf_1 _2205_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0425_),
    .X(_0456_)
);

sky130_fd_sc_hd__or2_4 _2206_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1656_),
    .B(_0437_),
    .X(_0457_)
);

sky130_fd_sc_hd__buf_1 _2207_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0457_),
    .X(_0458_)
);

sky130_fd_sc_hd__o21a_4 _2208_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0455_),
    .A2(_0456_),
    .B1(_0458_),
    .X(_0459_)
);

sky130_fd_sc_hd__o22a_4 _2209_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0448_),
    .A2(_0459_),
    .B1(_0455_),
    .B2(_0453_),
    .X(_0460_)
);

sky130_fd_sc_hd__nor2_4 _2210_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0447_),
    .B(_0460_),
    .Y(_0286_)
);

sky130_fd_sc_hd__inv_8 _2211_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN8[27] ),
    .Y(_0461_)
);

sky130_fd_sc_hd__or2_4 _2212_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1662_),
    .B(_0437_),
    .X(_0462_)
);

sky130_fd_sc_hd__buf_1 _2213_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0462_),
    .X(_0463_)
);

sky130_fd_sc_hd__o21a_4 _2214_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0461_),
    .A2(_0456_),
    .B1(_0463_),
    .X(_0464_)
);

sky130_fd_sc_hd__o22a_4 _2215_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0448_),
    .A2(_0464_),
    .B1(_0461_),
    .B2(_0453_),
    .X(_0465_)
);

sky130_fd_sc_hd__nor2_4 _2216_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0447_),
    .B(_0465_),
    .Y(_0287_)
);

sky130_fd_sc_hd__inv_8 _2217_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN8[28] ),
    .Y(_0466_)
);

sky130_fd_sc_hd__or2_4 _2218_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1666_),
    .B(_1751_),
    .X(_0467_)
);

sky130_fd_sc_hd__buf_1 _2219_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0467_),
    .X(_0468_)
);

sky130_fd_sc_hd__o21a_4 _2220_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0466_),
    .A2(_0456_),
    .B1(_0468_),
    .X(_0469_)
);

sky130_fd_sc_hd__o22a_4 _2221_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0448_),
    .A2(_0469_),
    .B1(_0466_),
    .B2(_0453_),
    .X(_0470_)
);

sky130_fd_sc_hd__nor2_4 _2222_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0447_),
    .B(_0470_),
    .Y(_0288_)
);

sky130_fd_sc_hd__inv_8 _2223_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN8[29] ),
    .Y(_0471_)
);

sky130_fd_sc_hd__or2_4 _2224_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1670_),
    .B(_1751_),
    .X(_0472_)
);

sky130_fd_sc_hd__buf_1 _2225_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0472_),
    .X(_0473_)
);

sky130_fd_sc_hd__o21a_4 _2226_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0471_),
    .A2(_0456_),
    .B1(_0473_),
    .X(_0474_)
);

sky130_fd_sc_hd__o22a_4 _2227_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0448_),
    .A2(_0474_),
    .B1(_0471_),
    .B2(_0453_),
    .X(_0475_)
);

sky130_fd_sc_hd__nor2_4 _2228_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0447_),
    .B(_0475_),
    .Y(_0289_)
);

sky130_fd_sc_hd__buf_1 _2229_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0385_),
    .X(_0476_)
);

sky130_fd_sc_hd__inv_8 _2230_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN8[30] ),
    .Y(_0477_)
);

sky130_fd_sc_hd__or2_4 _2231_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1674_),
    .B(_1751_),
    .X(_0478_)
);

sky130_fd_sc_hd__buf_1 _2232_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0478_),
    .X(_0479_)
);

sky130_fd_sc_hd__o21a_4 _2233_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0477_),
    .A2(_0456_),
    .B1(_0479_),
    .X(_0480_)
);

sky130_fd_sc_hd__o22a_4 _2234_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1757_),
    .A2(_0480_),
    .B1(_0477_),
    .B2(_1760_),
    .X(_0481_)
);

sky130_fd_sc_hd__nor2_4 _2235_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0476_),
    .B(_0481_),
    .Y(_0291_)
);

sky130_fd_sc_hd__buf_1 _2236_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1714_),
    .X(_0482_)
);

sky130_fd_sc_hd__inv_8 _2237_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN8[31] ),
    .Y(_0483_)
);

sky130_fd_sc_hd__nor3_4 _2238_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1486_),
    .B(_1711_),
    .C(_0483_),
    .Y(_0484_)
);

sky130_fd_sc_hd__and2_4 _2239_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1680_),
    .B(_1429_),
    .X(_0485_)
);

sky130_fd_sc_hd__buf_1 _2240_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0485_),
    .X(_0486_)
);

sky130_fd_sc_hd__or2_4 _2241_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1756_),
    .B(_0486_),
    .X(_0487_)
);

sky130_fd_sc_hd__a21oi_4 _2242_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0483_),
    .A2(_1732_),
    .B1(_0487_),
    .Y(_0488_)
);

sky130_fd_sc_hd__nor3_4 _2243_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0482_),
    .B(_0484_),
    .C(_0488_),
    .Y(_0489_)
);

sky130_fd_sc_hd__buf_1 _2244_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1714_),
    .X(_0490_)
);

sky130_fd_sc_hd__buf_1 _2245_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1699_),
    .X(_0491_)
);

sky130_fd_sc_hd__a21o_4 _2246_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0483_),
    .A2(_0490_),
    .B1(_0491_),
    .X(_0492_)
);

sky130_fd_sc_hd__nor2_4 _2247_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0489_),
    .B(_0492_),
    .Y(_0292_)
);

sky130_fd_sc_hd__inv_8 _2248_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN7[0] ),
    .Y(_0493_)
);

sky130_fd_sc_hd__o21a_4 _2249_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0493_),
    .A2(_1431_),
    .B1(_1752_),
    .X(_0494_)
);

sky130_fd_sc_hd__or4_4 _2250_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1705_),
    .B(_1691_),
    .C(_1710_),
    .D(_1452_),
    .X(_0495_)
);

sky130_fd_sc_hd__buf_1 _2251_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0495_),
    .X(_0496_)
);

sky130_fd_sc_hd__buf_1 _2252_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0496_),
    .X(_0497_)
);

sky130_fd_sc_hd__buf_1 _2253_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0497_),
    .X(_0498_)
);

sky130_fd_sc_hd__and3_4 _2254_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1703_),
    .B(_1684_),
    .C(_1435_),
    .X(_0499_)
);

sky130_fd_sc_hd__nor2_4 _2255_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1453_),
    .B(_0499_),
    .Y(_0500_)
);

sky130_fd_sc_hd__nor2_4 _2256_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1702_),
    .B(_0500_),
    .Y(_0501_)
);

sky130_fd_sc_hd__buf_1 _2257_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0501_),
    .X(_0502_)
);

sky130_fd_sc_hd__buf_1 _2258_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0502_),
    .X(_0503_)
);

sky130_fd_sc_hd__o22a_4 _2259_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0494_),
    .A2(_0498_),
    .B1(_0493_),
    .B2(_0503_),
    .X(_0504_)
);

sky130_fd_sc_hd__nor2_4 _2260_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0476_),
    .B(_0504_),
    .Y(_0236_)
);

sky130_fd_sc_hd__inv_8 _2261_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN7[1] ),
    .Y(_0505_)
);

sky130_fd_sc_hd__buf_1 _2262_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0425_),
    .X(_0506_)
);

sky130_fd_sc_hd__o21a_4 _2263_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0505_),
    .A2(_0506_),
    .B1(_0305_),
    .X(_0507_)
);

sky130_fd_sc_hd__o22a_4 _2264_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0498_),
    .A2(_0507_),
    .B1(_0505_),
    .B2(_0503_),
    .X(_0508_)
);

sky130_fd_sc_hd__nor2_4 _2265_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0476_),
    .B(_0508_),
    .Y(_0247_)
);

sky130_fd_sc_hd__inv_8 _2266_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN7[2] ),
    .Y(_0509_)
);

sky130_fd_sc_hd__o21a_4 _2267_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0509_),
    .A2(_0506_),
    .B1(_0310_),
    .X(_0510_)
);

sky130_fd_sc_hd__o22a_4 _2268_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0498_),
    .A2(_0510_),
    .B1(_0509_),
    .B2(_0503_),
    .X(_0511_)
);

sky130_fd_sc_hd__nor2_4 _2269_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0476_),
    .B(_0511_),
    .Y(_0258_)
);

sky130_fd_sc_hd__inv_8 _2270_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN7[3] ),
    .Y(_0512_)
);

sky130_fd_sc_hd__o21a_4 _2271_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0512_),
    .A2(_0506_),
    .B1(_0316_),
    .X(_0513_)
);

sky130_fd_sc_hd__o22a_4 _2272_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0498_),
    .A2(_0513_),
    .B1(_0512_),
    .B2(_0503_),
    .X(_0514_)
);

sky130_fd_sc_hd__nor2_4 _2273_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0476_),
    .B(_0514_),
    .Y(_0261_)
);

sky130_fd_sc_hd__buf_1 _2274_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0385_),
    .X(_0515_)
);

sky130_fd_sc_hd__inv_8 _2275_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN7[4] ),
    .Y(_0516_)
);

sky130_fd_sc_hd__o21a_4 _2276_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0516_),
    .A2(_0506_),
    .B1(_0321_),
    .X(_0517_)
);

sky130_fd_sc_hd__o22a_4 _2277_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0498_),
    .A2(_0517_),
    .B1(_0516_),
    .B2(_0503_),
    .X(_0518_)
);

sky130_fd_sc_hd__nor2_4 _2278_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0515_),
    .B(_0518_),
    .Y(_0262_)
);

sky130_fd_sc_hd__buf_1 _2279_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0497_),
    .X(_0519_)
);

sky130_fd_sc_hd__inv_8 _2280_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN7[5] ),
    .Y(_0520_)
);

sky130_fd_sc_hd__o21a_4 _2281_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0520_),
    .A2(_0506_),
    .B1(_0328_),
    .X(_0521_)
);

sky130_fd_sc_hd__buf_1 _2282_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0502_),
    .X(_0522_)
);

sky130_fd_sc_hd__o22a_4 _2283_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0519_),
    .A2(_0521_),
    .B1(_0520_),
    .B2(_0522_),
    .X(_0523_)
);

sky130_fd_sc_hd__nor2_4 _2284_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0515_),
    .B(_0523_),
    .Y(_0263_)
);

sky130_fd_sc_hd__inv_8 _2285_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN7[6] ),
    .Y(_0524_)
);

sky130_fd_sc_hd__buf_1 _2286_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0425_),
    .X(_0525_)
);

sky130_fd_sc_hd__o21a_4 _2287_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0524_),
    .A2(_0525_),
    .B1(_0335_),
    .X(_0526_)
);

sky130_fd_sc_hd__o22a_4 _2288_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0519_),
    .A2(_0526_),
    .B1(_0524_),
    .B2(_0522_),
    .X(_0527_)
);

sky130_fd_sc_hd__nor2_4 _2289_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0515_),
    .B(_0527_),
    .Y(_0264_)
);

sky130_fd_sc_hd__inv_8 _2290_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN7[7] ),
    .Y(_0528_)
);

sky130_fd_sc_hd__o21a_4 _2291_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0528_),
    .A2(_0525_),
    .B1(_0340_),
    .X(_0529_)
);

sky130_fd_sc_hd__o22a_4 _2292_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0519_),
    .A2(_0529_),
    .B1(_0528_),
    .B2(_0522_),
    .X(_0530_)
);

sky130_fd_sc_hd__nor2_4 _2293_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0515_),
    .B(_0530_),
    .Y(_0265_)
);

sky130_fd_sc_hd__inv_8 _2294_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN7[8] ),
    .Y(_0531_)
);

sky130_fd_sc_hd__o21a_4 _2295_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0531_),
    .A2(_0525_),
    .B1(_0346_),
    .X(_0532_)
);

sky130_fd_sc_hd__o22a_4 _2296_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0519_),
    .A2(_0532_),
    .B1(_0531_),
    .B2(_0522_),
    .X(_0533_)
);

sky130_fd_sc_hd__nor2_4 _2297_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0515_),
    .B(_0533_),
    .Y(_0266_)
);

sky130_fd_sc_hd__buf_1 _2298_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0384_),
    .X(_0534_)
);

sky130_fd_sc_hd__buf_1 _2299_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0534_),
    .X(_0535_)
);

sky130_fd_sc_hd__inv_8 _2300_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN7[9] ),
    .Y(_0536_)
);

sky130_fd_sc_hd__o21a_4 _2301_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0536_),
    .A2(_0525_),
    .B1(_0351_),
    .X(_0537_)
);

sky130_fd_sc_hd__o22a_4 _2302_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0519_),
    .A2(_0537_),
    .B1(_0536_),
    .B2(_0522_),
    .X(_0538_)
);

sky130_fd_sc_hd__nor2_4 _2303_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0535_),
    .B(_0538_),
    .Y(_0267_)
);

sky130_fd_sc_hd__buf_1 _2304_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0497_),
    .X(_0539_)
);

sky130_fd_sc_hd__inv_8 _2305_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN7[10] ),
    .Y(_0540_)
);

sky130_fd_sc_hd__o21a_4 _2306_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0540_),
    .A2(_0525_),
    .B1(_0358_),
    .X(_0541_)
);

sky130_fd_sc_hd__buf_1 _2307_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0502_),
    .X(_0542_)
);

sky130_fd_sc_hd__o22a_4 _2308_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0539_),
    .A2(_0541_),
    .B1(_0540_),
    .B2(_0542_),
    .X(_0543_)
);

sky130_fd_sc_hd__nor2_4 _2309_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0535_),
    .B(_0543_),
    .Y(_0237_)
);

sky130_fd_sc_hd__inv_8 _2310_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN7[11] ),
    .Y(_0544_)
);

sky130_fd_sc_hd__buf_1 _2311_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0425_),
    .X(_0545_)
);

sky130_fd_sc_hd__o21a_4 _2312_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0544_),
    .A2(_0545_),
    .B1(_0365_),
    .X(_0546_)
);

sky130_fd_sc_hd__o22a_4 _2313_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0539_),
    .A2(_0546_),
    .B1(_0544_),
    .B2(_0542_),
    .X(_0547_)
);

sky130_fd_sc_hd__nor2_4 _2314_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0535_),
    .B(_0547_),
    .Y(_0238_)
);

sky130_fd_sc_hd__inv_8 _2315_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN7[12] ),
    .Y(_0548_)
);

sky130_fd_sc_hd__o21a_4 _2316_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0548_),
    .A2(_0545_),
    .B1(_0370_),
    .X(_0549_)
);

sky130_fd_sc_hd__o22a_4 _2317_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0539_),
    .A2(_0549_),
    .B1(_0548_),
    .B2(_0542_),
    .X(_0550_)
);

sky130_fd_sc_hd__nor2_4 _2318_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0535_),
    .B(_0550_),
    .Y(_0239_)
);

sky130_fd_sc_hd__inv_8 _2319_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN7[13] ),
    .Y(_0551_)
);

sky130_fd_sc_hd__o21a_4 _2320_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0551_),
    .A2(_0545_),
    .B1(_0376_),
    .X(_0552_)
);

sky130_fd_sc_hd__o22a_4 _2321_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0539_),
    .A2(_0552_),
    .B1(_0551_),
    .B2(_0542_),
    .X(_0553_)
);

sky130_fd_sc_hd__nor2_4 _2322_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0535_),
    .B(_0553_),
    .Y(_0240_)
);

sky130_fd_sc_hd__buf_1 _2323_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0534_),
    .X(_0554_)
);

sky130_fd_sc_hd__inv_8 _2324_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN7[14] ),
    .Y(_0555_)
);

sky130_fd_sc_hd__o21a_4 _2325_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0555_),
    .A2(_0545_),
    .B1(_0381_),
    .X(_0556_)
);

sky130_fd_sc_hd__o22a_4 _2326_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0539_),
    .A2(_0556_),
    .B1(_0555_),
    .B2(_0542_),
    .X(_0557_)
);

sky130_fd_sc_hd__nor2_4 _2327_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0554_),
    .B(_0557_),
    .Y(_0241_)
);

sky130_fd_sc_hd__buf_1 _2328_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0497_),
    .X(_0558_)
);

sky130_fd_sc_hd__inv_8 _2329_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN7[15] ),
    .Y(_0559_)
);

sky130_fd_sc_hd__o21a_4 _2330_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0559_),
    .A2(_0545_),
    .B1(_0390_),
    .X(_0560_)
);

sky130_fd_sc_hd__buf_1 _2331_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0502_),
    .X(_0561_)
);

sky130_fd_sc_hd__o22a_4 _2332_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0558_),
    .A2(_0560_),
    .B1(_0559_),
    .B2(_0561_),
    .X(_0562_)
);

sky130_fd_sc_hd__nor2_4 _2333_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0554_),
    .B(_0562_),
    .Y(_0242_)
);

sky130_fd_sc_hd__inv_8 _2334_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN7[16] ),
    .Y(_0563_)
);

sky130_fd_sc_hd__buf_1 _2335_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1428_),
    .X(_0564_)
);

sky130_fd_sc_hd__buf_1 _2336_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0564_),
    .X(_0565_)
);

sky130_fd_sc_hd__buf_1 _2337_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0565_),
    .X(_0566_)
);

sky130_fd_sc_hd__o21a_4 _2338_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0563_),
    .A2(_0566_),
    .B1(_0397_),
    .X(_0567_)
);

sky130_fd_sc_hd__o22a_4 _2339_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0558_),
    .A2(_0567_),
    .B1(_0563_),
    .B2(_0561_),
    .X(_0568_)
);

sky130_fd_sc_hd__nor2_4 _2340_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0554_),
    .B(_0568_),
    .Y(_0243_)
);

sky130_fd_sc_hd__inv_8 _2341_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN7[17] ),
    .Y(_0569_)
);

sky130_fd_sc_hd__o21a_4 _2342_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0569_),
    .A2(_0566_),
    .B1(_0402_),
    .X(_0570_)
);

sky130_fd_sc_hd__o22a_4 _2343_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0558_),
    .A2(_0570_),
    .B1(_0569_),
    .B2(_0561_),
    .X(_0571_)
);

sky130_fd_sc_hd__nor2_4 _2344_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0554_),
    .B(_0571_),
    .Y(_0244_)
);

sky130_fd_sc_hd__inv_8 _2345_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN7[18] ),
    .Y(_0572_)
);

sky130_fd_sc_hd__o21a_4 _2346_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0572_),
    .A2(_0566_),
    .B1(_0408_),
    .X(_0573_)
);

sky130_fd_sc_hd__o22a_4 _2347_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0558_),
    .A2(_0573_),
    .B1(_0572_),
    .B2(_0561_),
    .X(_0574_)
);

sky130_fd_sc_hd__nor2_4 _2348_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0554_),
    .B(_0574_),
    .Y(_0245_)
);

sky130_fd_sc_hd__buf_1 _2349_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0534_),
    .X(_0575_)
);

sky130_fd_sc_hd__inv_8 _2350_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN7[19] ),
    .Y(_0576_)
);

sky130_fd_sc_hd__o21a_4 _2351_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0576_),
    .A2(_0566_),
    .B1(_0413_),
    .X(_0577_)
);

sky130_fd_sc_hd__o22a_4 _2352_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0558_),
    .A2(_0577_),
    .B1(_0576_),
    .B2(_0561_),
    .X(_0578_)
);

sky130_fd_sc_hd__nor2_4 _2353_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0575_),
    .B(_0578_),
    .Y(_0246_)
);

sky130_fd_sc_hd__buf_1 _2354_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0496_),
    .X(_0579_)
);

sky130_fd_sc_hd__inv_8 _2355_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN7[20] ),
    .Y(_0580_)
);

sky130_fd_sc_hd__o21a_4 _2356_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0580_),
    .A2(_0566_),
    .B1(_0420_),
    .X(_0581_)
);

sky130_fd_sc_hd__buf_1 _2357_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0501_),
    .X(_0582_)
);

sky130_fd_sc_hd__o22a_4 _2358_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0579_),
    .A2(_0581_),
    .B1(_0580_),
    .B2(_0582_),
    .X(_0583_)
);

sky130_fd_sc_hd__nor2_4 _2359_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0575_),
    .B(_0583_),
    .Y(_0248_)
);

sky130_fd_sc_hd__inv_8 _2360_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN7[21] ),
    .Y(_0584_)
);

sky130_fd_sc_hd__buf_1 _2361_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0565_),
    .X(_0585_)
);

sky130_fd_sc_hd__o21a_4 _2362_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0584_),
    .A2(_0585_),
    .B1(_0428_),
    .X(_0586_)
);

sky130_fd_sc_hd__o22a_4 _2363_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0579_),
    .A2(_0586_),
    .B1(_0584_),
    .B2(_0582_),
    .X(_0587_)
);

sky130_fd_sc_hd__nor2_4 _2364_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0575_),
    .B(_0587_),
    .Y(_0249_)
);

sky130_fd_sc_hd__inv_8 _2365_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN7[22] ),
    .Y(_0588_)
);

sky130_fd_sc_hd__o21a_4 _2366_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0588_),
    .A2(_0585_),
    .B1(_0433_),
    .X(_0589_)
);

sky130_fd_sc_hd__o22a_4 _2367_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0579_),
    .A2(_0589_),
    .B1(_0588_),
    .B2(_0582_),
    .X(_0590_)
);

sky130_fd_sc_hd__nor2_4 _2368_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0575_),
    .B(_0590_),
    .Y(_0250_)
);

sky130_fd_sc_hd__inv_8 _2369_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN7[23] ),
    .Y(_0591_)
);

sky130_fd_sc_hd__o21a_4 _2370_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0591_),
    .A2(_0585_),
    .B1(_0439_),
    .X(_0592_)
);

sky130_fd_sc_hd__o22a_4 _2371_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0579_),
    .A2(_0592_),
    .B1(_0591_),
    .B2(_0582_),
    .X(_0593_)
);

sky130_fd_sc_hd__nor2_4 _2372_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0575_),
    .B(_0593_),
    .Y(_0251_)
);

sky130_fd_sc_hd__buf_1 _2373_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0534_),
    .X(_0594_)
);

sky130_fd_sc_hd__inv_8 _2374_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN7[24] ),
    .Y(_0595_)
);

sky130_fd_sc_hd__o21a_4 _2375_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0595_),
    .A2(_0585_),
    .B1(_0444_),
    .X(_0596_)
);

sky130_fd_sc_hd__o22a_4 _2376_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0579_),
    .A2(_0596_),
    .B1(_0595_),
    .B2(_0582_),
    .X(_0597_)
);

sky130_fd_sc_hd__nor2_4 _2377_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0594_),
    .B(_0597_),
    .Y(_0252_)
);

sky130_fd_sc_hd__buf_1 _2378_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0496_),
    .X(_0598_)
);

sky130_fd_sc_hd__inv_8 _2379_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN7[25] ),
    .Y(_0599_)
);

sky130_fd_sc_hd__o21a_4 _2380_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0599_),
    .A2(_0585_),
    .B1(_0451_),
    .X(_0600_)
);

sky130_fd_sc_hd__buf_1 _2381_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0501_),
    .X(_0601_)
);

sky130_fd_sc_hd__o22a_4 _2382_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0598_),
    .A2(_0600_),
    .B1(_0599_),
    .B2(_0601_),
    .X(_0602_)
);

sky130_fd_sc_hd__nor2_4 _2383_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0594_),
    .B(_0602_),
    .Y(_0253_)
);

sky130_fd_sc_hd__inv_8 _2384_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN7[26] ),
    .Y(_0603_)
);

sky130_fd_sc_hd__buf_1 _2385_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0565_),
    .X(_0604_)
);

sky130_fd_sc_hd__o21a_4 _2386_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0603_),
    .A2(_0604_),
    .B1(_0458_),
    .X(_0605_)
);

sky130_fd_sc_hd__o22a_4 _2387_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0598_),
    .A2(_0605_),
    .B1(_0603_),
    .B2(_0601_),
    .X(_0606_)
);

sky130_fd_sc_hd__nor2_4 _2388_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0594_),
    .B(_0606_),
    .Y(_0254_)
);

sky130_fd_sc_hd__inv_8 _2389_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN7[27] ),
    .Y(_0607_)
);

sky130_fd_sc_hd__o21a_4 _2390_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0607_),
    .A2(_0604_),
    .B1(_0463_),
    .X(_0608_)
);

sky130_fd_sc_hd__o22a_4 _2391_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0598_),
    .A2(_0608_),
    .B1(_0607_),
    .B2(_0601_),
    .X(_0609_)
);

sky130_fd_sc_hd__nor2_4 _2392_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0594_),
    .B(_0609_),
    .Y(_0255_)
);

sky130_fd_sc_hd__inv_8 _2393_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN7[28] ),
    .Y(_0610_)
);

sky130_fd_sc_hd__o21a_4 _2394_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0610_),
    .A2(_0604_),
    .B1(_0468_),
    .X(_0611_)
);

sky130_fd_sc_hd__o22a_4 _2395_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0598_),
    .A2(_0611_),
    .B1(_0610_),
    .B2(_0601_),
    .X(_0612_)
);

sky130_fd_sc_hd__nor2_4 _2396_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0594_),
    .B(_0612_),
    .Y(_0256_)
);

sky130_fd_sc_hd__buf_1 _2397_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0534_),
    .X(_0613_)
);

sky130_fd_sc_hd__inv_8 _2398_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN7[29] ),
    .Y(_0614_)
);

sky130_fd_sc_hd__o21a_4 _2399_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0614_),
    .A2(_0604_),
    .B1(_0473_),
    .X(_0615_)
);

sky130_fd_sc_hd__o22a_4 _2400_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0598_),
    .A2(_0615_),
    .B1(_0614_),
    .B2(_0601_),
    .X(_0616_)
);

sky130_fd_sc_hd__nor2_4 _2401_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0613_),
    .B(_0616_),
    .Y(_0257_)
);

sky130_fd_sc_hd__inv_8 _2402_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN7[30] ),
    .Y(_0617_)
);

sky130_fd_sc_hd__o21a_4 _2403_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0617_),
    .A2(_0604_),
    .B1(_0479_),
    .X(_0618_)
);

sky130_fd_sc_hd__o22a_4 _2404_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0497_),
    .A2(_0618_),
    .B1(_0617_),
    .B2(_0502_),
    .X(_0619_)
);

sky130_fd_sc_hd__nor2_4 _2405_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0613_),
    .B(_0619_),
    .Y(_0259_)
);

sky130_fd_sc_hd__and2_4 _2406_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN7[31] ),
    .B(_0500_),
    .X(_0620_)
);

sky130_fd_sc_hd__inv_8 _2407_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN7[31] ),
    .Y(_0621_)
);

sky130_fd_sc_hd__or2_4 _2408_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0486_),
    .B(_0496_),
    .X(_0622_)
);

sky130_fd_sc_hd__a21oi_4 _2409_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0621_),
    .A2(_1732_),
    .B1(_0622_),
    .Y(_0623_)
);

sky130_fd_sc_hd__nor3_4 _2410_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0482_),
    .B(_0620_),
    .C(_0623_),
    .Y(_0624_)
);

sky130_fd_sc_hd__a21o_4 _2411_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0621_),
    .A2(_0490_),
    .B1(_0491_),
    .X(_0625_)
);

sky130_fd_sc_hd__nor2_4 _2412_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0624_),
    .B(_0625_),
    .Y(_0260_)
);

sky130_fd_sc_hd__inv_8 _2413_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN6[0] ),
    .Y(_0626_)
);

sky130_fd_sc_hd__o21a_4 _2414_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0626_),
    .A2(_1431_),
    .B1(_1752_),
    .X(_0627_)
);

sky130_fd_sc_hd__or4_4 _2415_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1703_),
    .B(_1441_),
    .C(_1710_),
    .D(_1452_),
    .X(_0628_)
);

sky130_fd_sc_hd__buf_1 _2416_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0628_),
    .X(_0629_)
);

sky130_fd_sc_hd__buf_1 _2417_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0629_),
    .X(_0630_)
);

sky130_fd_sc_hd__buf_1 _2418_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0630_),
    .X(_0631_)
);

sky130_fd_sc_hd__and3_4 _2419_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1705_),
    .B(_1691_),
    .C(_1435_),
    .X(_0632_)
);

sky130_fd_sc_hd__nor2_4 _2420_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1453_),
    .B(_0632_),
    .Y(_0633_)
);

sky130_fd_sc_hd__nor2_4 _2421_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1702_),
    .B(_0633_),
    .Y(_0634_)
);

sky130_fd_sc_hd__buf_1 _2422_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0634_),
    .X(_0635_)
);

sky130_fd_sc_hd__buf_1 _2423_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0635_),
    .X(_0636_)
);

sky130_fd_sc_hd__o22a_4 _2424_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0627_),
    .A2(_0631_),
    .B1(_0626_),
    .B2(_0636_),
    .X(_0637_)
);

sky130_fd_sc_hd__nor2_4 _2425_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0613_),
    .B(_0637_),
    .Y(_0204_)
);

sky130_fd_sc_hd__inv_8 _2426_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN6[1] ),
    .Y(_0638_)
);

sky130_fd_sc_hd__buf_1 _2427_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0565_),
    .X(_0639_)
);

sky130_fd_sc_hd__o21a_4 _2428_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0638_),
    .A2(_0639_),
    .B1(_0305_),
    .X(_0640_)
);

sky130_fd_sc_hd__o22a_4 _2429_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0631_),
    .A2(_0640_),
    .B1(_0638_),
    .B2(_0636_),
    .X(_0641_)
);

sky130_fd_sc_hd__nor2_4 _2430_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0613_),
    .B(_0641_),
    .Y(_0215_)
);

sky130_fd_sc_hd__inv_8 _2431_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN6[2] ),
    .Y(_0642_)
);

sky130_fd_sc_hd__o21a_4 _2432_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0642_),
    .A2(_0639_),
    .B1(_0310_),
    .X(_0643_)
);

sky130_fd_sc_hd__o22a_4 _2433_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0631_),
    .A2(_0643_),
    .B1(_0642_),
    .B2(_0636_),
    .X(_0644_)
);

sky130_fd_sc_hd__nor2_4 _2434_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0613_),
    .B(_0644_),
    .Y(_0226_)
);

sky130_fd_sc_hd__buf_1 _2435_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0384_),
    .X(_0645_)
);

sky130_fd_sc_hd__buf_1 _2436_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0645_),
    .X(_0646_)
);

sky130_fd_sc_hd__inv_8 _2437_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN6[3] ),
    .Y(_0647_)
);

sky130_fd_sc_hd__o21a_4 _2438_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0647_),
    .A2(_0639_),
    .B1(_0316_),
    .X(_0648_)
);

sky130_fd_sc_hd__o22a_4 _2439_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0631_),
    .A2(_0648_),
    .B1(_0647_),
    .B2(_0636_),
    .X(_0649_)
);

sky130_fd_sc_hd__nor2_4 _2440_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0646_),
    .B(_0649_),
    .Y(_0229_)
);

sky130_fd_sc_hd__inv_8 _2441_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN6[4] ),
    .Y(_0650_)
);

sky130_fd_sc_hd__o21a_4 _2442_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0650_),
    .A2(_0639_),
    .B1(_0321_),
    .X(_0651_)
);

sky130_fd_sc_hd__o22a_4 _2443_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0631_),
    .A2(_0651_),
    .B1(_0650_),
    .B2(_0636_),
    .X(_0652_)
);

sky130_fd_sc_hd__nor2_4 _2444_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0646_),
    .B(_0652_),
    .Y(_0230_)
);

sky130_fd_sc_hd__buf_1 _2445_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0630_),
    .X(_0653_)
);

sky130_fd_sc_hd__inv_8 _2446_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN6[5] ),
    .Y(_0654_)
);

sky130_fd_sc_hd__o21a_4 _2447_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0654_),
    .A2(_0639_),
    .B1(_0328_),
    .X(_0655_)
);

sky130_fd_sc_hd__buf_1 _2448_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0635_),
    .X(_0656_)
);

sky130_fd_sc_hd__o22a_4 _2449_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0653_),
    .A2(_0655_),
    .B1(_0654_),
    .B2(_0656_),
    .X(_0657_)
);

sky130_fd_sc_hd__nor2_4 _2450_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0646_),
    .B(_0657_),
    .Y(_0231_)
);

sky130_fd_sc_hd__inv_8 _2451_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN6[6] ),
    .Y(_0658_)
);

sky130_fd_sc_hd__buf_1 _2452_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0565_),
    .X(_0659_)
);

sky130_fd_sc_hd__o21a_4 _2453_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0658_),
    .A2(_0659_),
    .B1(_0335_),
    .X(_0660_)
);

sky130_fd_sc_hd__o22a_4 _2454_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0653_),
    .A2(_0660_),
    .B1(_0658_),
    .B2(_0656_),
    .X(_0661_)
);

sky130_fd_sc_hd__nor2_4 _2455_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0646_),
    .B(_0661_),
    .Y(_0232_)
);

sky130_fd_sc_hd__inv_8 _2456_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN6[7] ),
    .Y(_0662_)
);

sky130_fd_sc_hd__o21a_4 _2457_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0662_),
    .A2(_0659_),
    .B1(_0340_),
    .X(_0663_)
);

sky130_fd_sc_hd__o22a_4 _2458_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0653_),
    .A2(_0663_),
    .B1(_0662_),
    .B2(_0656_),
    .X(_0664_)
);

sky130_fd_sc_hd__nor2_4 _2459_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0646_),
    .B(_0664_),
    .Y(_0233_)
);

sky130_fd_sc_hd__buf_1 _2460_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0645_),
    .X(_0665_)
);

sky130_fd_sc_hd__inv_8 _2461_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN6[8] ),
    .Y(_0666_)
);

sky130_fd_sc_hd__o21a_4 _2462_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0666_),
    .A2(_0659_),
    .B1(_0346_),
    .X(_0667_)
);

sky130_fd_sc_hd__o22a_4 _2463_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0653_),
    .A2(_0667_),
    .B1(_0666_),
    .B2(_0656_),
    .X(_0668_)
);

sky130_fd_sc_hd__nor2_4 _2464_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0665_),
    .B(_0668_),
    .Y(_0234_)
);

sky130_fd_sc_hd__inv_8 _2465_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN6[9] ),
    .Y(_0669_)
);

sky130_fd_sc_hd__o21a_4 _2466_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0669_),
    .A2(_0659_),
    .B1(_0351_),
    .X(_0670_)
);

sky130_fd_sc_hd__o22a_4 _2467_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0653_),
    .A2(_0670_),
    .B1(_0669_),
    .B2(_0656_),
    .X(_0671_)
);

sky130_fd_sc_hd__nor2_4 _2468_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0665_),
    .B(_0671_),
    .Y(_0235_)
);

sky130_fd_sc_hd__buf_1 _2469_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0630_),
    .X(_0672_)
);

sky130_fd_sc_hd__inv_8 _2470_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN6[10] ),
    .Y(_0673_)
);

sky130_fd_sc_hd__o21a_4 _2471_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0673_),
    .A2(_0659_),
    .B1(_0358_),
    .X(_0674_)
);

sky130_fd_sc_hd__buf_1 _2472_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0635_),
    .X(_0675_)
);

sky130_fd_sc_hd__o22a_4 _2473_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0672_),
    .A2(_0674_),
    .B1(_0673_),
    .B2(_0675_),
    .X(_0676_)
);

sky130_fd_sc_hd__nor2_4 _2474_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0665_),
    .B(_0676_),
    .Y(_0205_)
);

sky130_fd_sc_hd__inv_8 _2475_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN6[11] ),
    .Y(_0677_)
);

sky130_fd_sc_hd__buf_1 _2476_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0564_),
    .X(_0678_)
);

sky130_fd_sc_hd__buf_1 _2477_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0678_),
    .X(_0679_)
);

sky130_fd_sc_hd__o21a_4 _2478_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0677_),
    .A2(_0679_),
    .B1(_0365_),
    .X(_0680_)
);

sky130_fd_sc_hd__o22a_4 _2479_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0672_),
    .A2(_0680_),
    .B1(_0677_),
    .B2(_0675_),
    .X(_0681_)
);

sky130_fd_sc_hd__nor2_4 _2480_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0665_),
    .B(_0681_),
    .Y(_0206_)
);

sky130_fd_sc_hd__inv_8 _2481_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN6[12] ),
    .Y(_0682_)
);

sky130_fd_sc_hd__o21a_4 _2482_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0682_),
    .A2(_0679_),
    .B1(_0370_),
    .X(_0683_)
);

sky130_fd_sc_hd__o22a_4 _2483_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0672_),
    .A2(_0683_),
    .B1(_0682_),
    .B2(_0675_),
    .X(_0684_)
);

sky130_fd_sc_hd__nor2_4 _2484_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0665_),
    .B(_0684_),
    .Y(_0207_)
);

sky130_fd_sc_hd__buf_1 _2485_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0645_),
    .X(_0685_)
);

sky130_fd_sc_hd__inv_8 _2486_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN6[13] ),
    .Y(_0686_)
);

sky130_fd_sc_hd__o21a_4 _2487_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0686_),
    .A2(_0679_),
    .B1(_0376_),
    .X(_0687_)
);

sky130_fd_sc_hd__o22a_4 _2488_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0672_),
    .A2(_0687_),
    .B1(_0686_),
    .B2(_0675_),
    .X(_0688_)
);

sky130_fd_sc_hd__nor2_4 _2489_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0685_),
    .B(_0688_),
    .Y(_0208_)
);

sky130_fd_sc_hd__inv_8 _2490_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN6[14] ),
    .Y(_0689_)
);

sky130_fd_sc_hd__o21a_4 _2491_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0689_),
    .A2(_0679_),
    .B1(_0381_),
    .X(_0690_)
);

sky130_fd_sc_hd__o22a_4 _2492_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0672_),
    .A2(_0690_),
    .B1(_0689_),
    .B2(_0675_),
    .X(_0691_)
);

sky130_fd_sc_hd__nor2_4 _2493_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0685_),
    .B(_0691_),
    .Y(_0209_)
);

sky130_fd_sc_hd__buf_1 _2494_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0630_),
    .X(_0692_)
);

sky130_fd_sc_hd__inv_8 _2495_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN6[15] ),
    .Y(_0693_)
);

sky130_fd_sc_hd__o21a_4 _2496_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0693_),
    .A2(_0679_),
    .B1(_0390_),
    .X(_0694_)
);

sky130_fd_sc_hd__buf_1 _2497_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0635_),
    .X(_0695_)
);

sky130_fd_sc_hd__o22a_4 _2498_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0692_),
    .A2(_0694_),
    .B1(_0693_),
    .B2(_0695_),
    .X(_0696_)
);

sky130_fd_sc_hd__nor2_4 _2499_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0685_),
    .B(_0696_),
    .Y(_0210_)
);

sky130_fd_sc_hd__inv_8 _2500_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN6[16] ),
    .Y(_0697_)
);

sky130_fd_sc_hd__buf_1 _2501_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0678_),
    .X(_0698_)
);

sky130_fd_sc_hd__o21a_4 _2502_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0697_),
    .A2(_0698_),
    .B1(_0397_),
    .X(_0699_)
);

sky130_fd_sc_hd__o22a_4 _2503_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0692_),
    .A2(_0699_),
    .B1(_0697_),
    .B2(_0695_),
    .X(_0700_)
);

sky130_fd_sc_hd__nor2_4 _2504_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0685_),
    .B(_0700_),
    .Y(_0211_)
);

sky130_fd_sc_hd__inv_8 _2505_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN6[17] ),
    .Y(_0701_)
);

sky130_fd_sc_hd__o21a_4 _2506_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0701_),
    .A2(_0698_),
    .B1(_0402_),
    .X(_0702_)
);

sky130_fd_sc_hd__o22a_4 _2507_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0692_),
    .A2(_0702_),
    .B1(_0701_),
    .B2(_0695_),
    .X(_0703_)
);

sky130_fd_sc_hd__nor2_4 _2508_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0685_),
    .B(_0703_),
    .Y(_0212_)
);

sky130_fd_sc_hd__buf_1 _2509_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0645_),
    .X(_0704_)
);

sky130_fd_sc_hd__inv_8 _2510_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN6[18] ),
    .Y(_0705_)
);

sky130_fd_sc_hd__o21a_4 _2511_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0705_),
    .A2(_0698_),
    .B1(_0408_),
    .X(_0706_)
);

sky130_fd_sc_hd__o22a_4 _2512_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0692_),
    .A2(_0706_),
    .B1(_0705_),
    .B2(_0695_),
    .X(_0707_)
);

sky130_fd_sc_hd__nor2_4 _2513_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0704_),
    .B(_0707_),
    .Y(_0213_)
);

sky130_fd_sc_hd__inv_8 _2514_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN6[19] ),
    .Y(_0708_)
);

sky130_fd_sc_hd__o21a_4 _2515_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0708_),
    .A2(_0698_),
    .B1(_0413_),
    .X(_0709_)
);

sky130_fd_sc_hd__o22a_4 _2516_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0692_),
    .A2(_0709_),
    .B1(_0708_),
    .B2(_0695_),
    .X(_0710_)
);

sky130_fd_sc_hd__nor2_4 _2517_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0704_),
    .B(_0710_),
    .Y(_0214_)
);

sky130_fd_sc_hd__buf_1 _2518_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0629_),
    .X(_0711_)
);

sky130_fd_sc_hd__inv_8 _2519_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN6[20] ),
    .Y(_0712_)
);

sky130_fd_sc_hd__o21a_4 _2520_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0712_),
    .A2(_0698_),
    .B1(_0420_),
    .X(_0713_)
);

sky130_fd_sc_hd__buf_1 _2521_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0634_),
    .X(_0714_)
);

sky130_fd_sc_hd__o22a_4 _2522_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0711_),
    .A2(_0713_),
    .B1(_0712_),
    .B2(_0714_),
    .X(_0715_)
);

sky130_fd_sc_hd__nor2_4 _2523_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0704_),
    .B(_0715_),
    .Y(_0216_)
);

sky130_fd_sc_hd__inv_8 _2524_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN6[21] ),
    .Y(_0716_)
);

sky130_fd_sc_hd__buf_1 _2525_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0678_),
    .X(_0717_)
);

sky130_fd_sc_hd__o21a_4 _2526_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0716_),
    .A2(_0717_),
    .B1(_0428_),
    .X(_0718_)
);

sky130_fd_sc_hd__o22a_4 _2527_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0711_),
    .A2(_0718_),
    .B1(_0716_),
    .B2(_0714_),
    .X(_0719_)
);

sky130_fd_sc_hd__nor2_4 _2528_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0704_),
    .B(_0719_),
    .Y(_0217_)
);

sky130_fd_sc_hd__inv_8 _2529_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN6[22] ),
    .Y(_0720_)
);

sky130_fd_sc_hd__o21a_4 _2530_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0720_),
    .A2(_0717_),
    .B1(_0433_),
    .X(_0721_)
);

sky130_fd_sc_hd__o22a_4 _2531_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0711_),
    .A2(_0721_),
    .B1(_0720_),
    .B2(_0714_),
    .X(_0722_)
);

sky130_fd_sc_hd__nor2_4 _2532_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0704_),
    .B(_0722_),
    .Y(_0218_)
);

sky130_fd_sc_hd__buf_1 _2533_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0645_),
    .X(_0723_)
);

sky130_fd_sc_hd__inv_8 _2534_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN6[23] ),
    .Y(_0724_)
);

sky130_fd_sc_hd__o21a_4 _2535_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0724_),
    .A2(_0717_),
    .B1(_0439_),
    .X(_0725_)
);

sky130_fd_sc_hd__o22a_4 _2536_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0711_),
    .A2(_0725_),
    .B1(_0724_),
    .B2(_0714_),
    .X(_0726_)
);

sky130_fd_sc_hd__nor2_4 _2537_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0723_),
    .B(_0726_),
    .Y(_0219_)
);

sky130_fd_sc_hd__inv_8 _2538_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN6[24] ),
    .Y(_0727_)
);

sky130_fd_sc_hd__o21a_4 _2539_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0727_),
    .A2(_0717_),
    .B1(_0444_),
    .X(_0728_)
);

sky130_fd_sc_hd__o22a_4 _2540_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0711_),
    .A2(_0728_),
    .B1(_0727_),
    .B2(_0714_),
    .X(_0729_)
);

sky130_fd_sc_hd__nor2_4 _2541_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0723_),
    .B(_0729_),
    .Y(_0220_)
);

sky130_fd_sc_hd__buf_1 _2542_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0629_),
    .X(_0730_)
);

sky130_fd_sc_hd__inv_8 _2543_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN6[25] ),
    .Y(_0731_)
);

sky130_fd_sc_hd__o21a_4 _2544_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0731_),
    .A2(_0717_),
    .B1(_0451_),
    .X(_0732_)
);

sky130_fd_sc_hd__buf_1 _2545_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0634_),
    .X(_0733_)
);

sky130_fd_sc_hd__o22a_4 _2546_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0730_),
    .A2(_0732_),
    .B1(_0731_),
    .B2(_0733_),
    .X(_0734_)
);

sky130_fd_sc_hd__nor2_4 _2547_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0723_),
    .B(_0734_),
    .Y(_0221_)
);

sky130_fd_sc_hd__inv_8 _2548_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN6[26] ),
    .Y(_0735_)
);

sky130_fd_sc_hd__buf_1 _2549_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0678_),
    .X(_0736_)
);

sky130_fd_sc_hd__o21a_4 _2550_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0735_),
    .A2(_0736_),
    .B1(_0458_),
    .X(_0737_)
);

sky130_fd_sc_hd__o22a_4 _2551_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0730_),
    .A2(_0737_),
    .B1(_0735_),
    .B2(_0733_),
    .X(_0738_)
);

sky130_fd_sc_hd__nor2_4 _2552_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0723_),
    .B(_0738_),
    .Y(_0222_)
);

sky130_fd_sc_hd__inv_8 _2553_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN6[27] ),
    .Y(_0739_)
);

sky130_fd_sc_hd__o21a_4 _2554_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0739_),
    .A2(_0736_),
    .B1(_0463_),
    .X(_0740_)
);

sky130_fd_sc_hd__o22a_4 _2555_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0730_),
    .A2(_0740_),
    .B1(_0739_),
    .B2(_0733_),
    .X(_0741_)
);

sky130_fd_sc_hd__nor2_4 _2556_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0723_),
    .B(_0741_),
    .Y(_0223_)
);

sky130_fd_sc_hd__buf_1 _2557_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0384_),
    .X(_0742_)
);

sky130_fd_sc_hd__buf_1 _2558_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0742_),
    .X(_0743_)
);

sky130_fd_sc_hd__inv_8 _2559_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN6[28] ),
    .Y(_0744_)
);

sky130_fd_sc_hd__o21a_4 _2560_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0744_),
    .A2(_0736_),
    .B1(_0468_),
    .X(_0745_)
);

sky130_fd_sc_hd__o22a_4 _2561_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0730_),
    .A2(_0745_),
    .B1(_0744_),
    .B2(_0733_),
    .X(_0746_)
);

sky130_fd_sc_hd__nor2_4 _2562_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0743_),
    .B(_0746_),
    .Y(_0224_)
);

sky130_fd_sc_hd__inv_8 _2563_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN6[29] ),
    .Y(_0747_)
);

sky130_fd_sc_hd__o21a_4 _2564_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0747_),
    .A2(_0736_),
    .B1(_0473_),
    .X(_0748_)
);

sky130_fd_sc_hd__o22a_4 _2565_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0730_),
    .A2(_0748_),
    .B1(_0747_),
    .B2(_0733_),
    .X(_0749_)
);

sky130_fd_sc_hd__nor2_4 _2566_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0743_),
    .B(_0749_),
    .Y(_0225_)
);

sky130_fd_sc_hd__inv_8 _2567_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN6[30] ),
    .Y(_0750_)
);

sky130_fd_sc_hd__o21a_4 _2568_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0750_),
    .A2(_0736_),
    .B1(_0479_),
    .X(_0751_)
);

sky130_fd_sc_hd__o22a_4 _2569_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0630_),
    .A2(_0751_),
    .B1(_0750_),
    .B2(_0635_),
    .X(_0752_)
);

sky130_fd_sc_hd__nor2_4 _2570_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0743_),
    .B(_0752_),
    .Y(_0227_)
);

sky130_fd_sc_hd__and2_4 _2571_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN6[31] ),
    .B(_0633_),
    .X(_0753_)
);

sky130_fd_sc_hd__inv_8 _2572_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN6[31] ),
    .Y(_0754_)
);

sky130_fd_sc_hd__or2_4 _2573_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0485_),
    .B(_0629_),
    .X(_0755_)
);

sky130_fd_sc_hd__a21oi_4 _2574_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0754_),
    .A2(_1732_),
    .B1(_0755_),
    .Y(_0756_)
);

sky130_fd_sc_hd__nor3_4 _2575_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0482_),
    .B(_0753_),
    .C(_0756_),
    .Y(_0757_)
);

sky130_fd_sc_hd__a21o_4 _2576_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0754_),
    .A2(_0490_),
    .B1(_0491_),
    .X(_0758_)
);

sky130_fd_sc_hd__nor2_4 _2577_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0757_),
    .B(_0758_),
    .Y(_0228_)
);

sky130_fd_sc_hd__inv_8 _2578_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN5[0] ),
    .Y(_0759_)
);

sky130_fd_sc_hd__o21a_4 _2579_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0759_),
    .A2(_1431_),
    .B1(_1752_),
    .X(_0760_)
);

sky130_fd_sc_hd__or4_4 _2580_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1703_),
    .B(_1691_),
    .C(_1710_),
    .D(_1452_),
    .X(_0761_)
);

sky130_fd_sc_hd__buf_1 _2581_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0761_),
    .X(_0762_)
);

sky130_fd_sc_hd__buf_1 _2582_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0762_),
    .X(_0763_)
);

sky130_fd_sc_hd__buf_1 _2583_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0763_),
    .X(_0764_)
);

sky130_fd_sc_hd__and3_4 _2584_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1705_),
    .B(_1684_),
    .C(_1435_),
    .X(_0765_)
);

sky130_fd_sc_hd__nor2_4 _2585_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1453_),
    .B(_0765_),
    .Y(_0766_)
);

sky130_fd_sc_hd__nor2_4 _2586_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1702_),
    .B(_0766_),
    .Y(_0767_)
);

sky130_fd_sc_hd__buf_1 _2587_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0767_),
    .X(_0768_)
);

sky130_fd_sc_hd__buf_1 _2588_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0768_),
    .X(_0769_)
);

sky130_fd_sc_hd__o22a_4 _2589_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0760_),
    .A2(_0764_),
    .B1(_0759_),
    .B2(_0769_),
    .X(_0770_)
);

sky130_fd_sc_hd__nor2_4 _2590_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0743_),
    .B(_0770_),
    .Y(_0172_)
);

sky130_fd_sc_hd__inv_8 _2591_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN5[1] ),
    .Y(_0771_)
);

sky130_fd_sc_hd__buf_1 _2592_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0678_),
    .X(_0772_)
);

sky130_fd_sc_hd__o21a_4 _2593_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0771_),
    .A2(_0772_),
    .B1(_0305_),
    .X(_0773_)
);

sky130_fd_sc_hd__o22a_4 _2594_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0764_),
    .A2(_0773_),
    .B1(_0771_),
    .B2(_0769_),
    .X(_0774_)
);

sky130_fd_sc_hd__nor2_4 _2595_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0743_),
    .B(_0774_),
    .Y(_0183_)
);

sky130_fd_sc_hd__buf_1 _2596_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0742_),
    .X(_0775_)
);

sky130_fd_sc_hd__inv_8 _2597_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN5[2] ),
    .Y(_0776_)
);

sky130_fd_sc_hd__o21a_4 _2598_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0776_),
    .A2(_0772_),
    .B1(_0310_),
    .X(_0777_)
);

sky130_fd_sc_hd__o22a_4 _2599_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0764_),
    .A2(_0777_),
    .B1(_0776_),
    .B2(_0769_),
    .X(_0778_)
);

sky130_fd_sc_hd__nor2_4 _2600_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0775_),
    .B(_0778_),
    .Y(_0194_)
);

sky130_fd_sc_hd__inv_8 _2601_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN5[3] ),
    .Y(_0779_)
);

sky130_fd_sc_hd__o21a_4 _2602_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0779_),
    .A2(_0772_),
    .B1(_0316_),
    .X(_0780_)
);

sky130_fd_sc_hd__o22a_4 _2603_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0764_),
    .A2(_0780_),
    .B1(_0779_),
    .B2(_0769_),
    .X(_0781_)
);

sky130_fd_sc_hd__nor2_4 _2604_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0775_),
    .B(_0781_),
    .Y(_0197_)
);

sky130_fd_sc_hd__inv_8 _2605_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN5[4] ),
    .Y(_0782_)
);

sky130_fd_sc_hd__o21a_4 _2606_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0782_),
    .A2(_0772_),
    .B1(_0321_),
    .X(_0783_)
);

sky130_fd_sc_hd__o22a_4 _2607_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0764_),
    .A2(_0783_),
    .B1(_0782_),
    .B2(_0769_),
    .X(_0784_)
);

sky130_fd_sc_hd__nor2_4 _2608_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0775_),
    .B(_0784_),
    .Y(_0198_)
);

sky130_fd_sc_hd__buf_1 _2609_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0763_),
    .X(_0785_)
);

sky130_fd_sc_hd__inv_8 _2610_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN5[5] ),
    .Y(_0786_)
);

sky130_fd_sc_hd__o21a_4 _2611_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0786_),
    .A2(_0772_),
    .B1(_0328_),
    .X(_0787_)
);

sky130_fd_sc_hd__buf_1 _2612_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0768_),
    .X(_0788_)
);

sky130_fd_sc_hd__o22a_4 _2613_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0785_),
    .A2(_0787_),
    .B1(_0786_),
    .B2(_0788_),
    .X(_0789_)
);

sky130_fd_sc_hd__nor2_4 _2614_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0775_),
    .B(_0789_),
    .Y(_0199_)
);

sky130_fd_sc_hd__inv_8 _2615_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN5[6] ),
    .Y(_0790_)
);

sky130_fd_sc_hd__buf_1 _2616_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0564_),
    .X(_0791_)
);

sky130_fd_sc_hd__buf_1 _2617_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0791_),
    .X(_0792_)
);

sky130_fd_sc_hd__o21a_4 _2618_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0790_),
    .A2(_0792_),
    .B1(_0335_),
    .X(_0793_)
);

sky130_fd_sc_hd__o22a_4 _2619_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0785_),
    .A2(_0793_),
    .B1(_0790_),
    .B2(_0788_),
    .X(_0794_)
);

sky130_fd_sc_hd__nor2_4 _2620_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0775_),
    .B(_0794_),
    .Y(_0200_)
);

sky130_fd_sc_hd__buf_1 _2621_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0742_),
    .X(_0795_)
);

sky130_fd_sc_hd__inv_8 _2622_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN5[7] ),
    .Y(_0796_)
);

sky130_fd_sc_hd__o21a_4 _2623_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0796_),
    .A2(_0792_),
    .B1(_0340_),
    .X(_0797_)
);

sky130_fd_sc_hd__o22a_4 _2624_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0785_),
    .A2(_0797_),
    .B1(_0796_),
    .B2(_0788_),
    .X(_0798_)
);

sky130_fd_sc_hd__nor2_4 _2625_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0795_),
    .B(_0798_),
    .Y(_0201_)
);

sky130_fd_sc_hd__inv_8 _2626_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN5[8] ),
    .Y(_0799_)
);

sky130_fd_sc_hd__o21a_4 _2627_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0799_),
    .A2(_0792_),
    .B1(_0346_),
    .X(_0800_)
);

sky130_fd_sc_hd__o22a_4 _2628_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0785_),
    .A2(_0800_),
    .B1(_0799_),
    .B2(_0788_),
    .X(_0801_)
);

sky130_fd_sc_hd__nor2_4 _2629_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0795_),
    .B(_0801_),
    .Y(_0202_)
);

sky130_fd_sc_hd__inv_8 _2630_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN5[9] ),
    .Y(_0802_)
);

sky130_fd_sc_hd__o21a_4 _2631_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0802_),
    .A2(_0792_),
    .B1(_0351_),
    .X(_0803_)
);

sky130_fd_sc_hd__o22a_4 _2632_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0785_),
    .A2(_0803_),
    .B1(_0802_),
    .B2(_0788_),
    .X(_0804_)
);

sky130_fd_sc_hd__nor2_4 _2633_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0795_),
    .B(_0804_),
    .Y(_0203_)
);

sky130_fd_sc_hd__buf_1 _2634_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0763_),
    .X(_0805_)
);

sky130_fd_sc_hd__inv_8 _2635_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN5[10] ),
    .Y(_0806_)
);

sky130_fd_sc_hd__o21a_4 _2636_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0806_),
    .A2(_0792_),
    .B1(_0358_),
    .X(_0807_)
);

sky130_fd_sc_hd__buf_1 _2637_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0768_),
    .X(_0808_)
);

sky130_fd_sc_hd__o22a_4 _2638_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0805_),
    .A2(_0807_),
    .B1(_0806_),
    .B2(_0808_),
    .X(_0809_)
);

sky130_fd_sc_hd__nor2_4 _2639_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0795_),
    .B(_0809_),
    .Y(_0173_)
);

sky130_fd_sc_hd__inv_8 _2640_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN5[11] ),
    .Y(_0810_)
);

sky130_fd_sc_hd__buf_1 _2641_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0791_),
    .X(_0811_)
);

sky130_fd_sc_hd__o21a_4 _2642_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0810_),
    .A2(_0811_),
    .B1(_0365_),
    .X(_0812_)
);

sky130_fd_sc_hd__o22a_4 _2643_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0805_),
    .A2(_0812_),
    .B1(_0810_),
    .B2(_0808_),
    .X(_0813_)
);

sky130_fd_sc_hd__nor2_4 _2644_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0795_),
    .B(_0813_),
    .Y(_0174_)
);

sky130_fd_sc_hd__buf_1 _2645_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0742_),
    .X(_0814_)
);

sky130_fd_sc_hd__inv_8 _2646_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN5[12] ),
    .Y(_0815_)
);

sky130_fd_sc_hd__o21a_4 _2647_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0815_),
    .A2(_0811_),
    .B1(_0370_),
    .X(_0816_)
);

sky130_fd_sc_hd__o22a_4 _2648_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0805_),
    .A2(_0816_),
    .B1(_0815_),
    .B2(_0808_),
    .X(_0817_)
);

sky130_fd_sc_hd__nor2_4 _2649_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0814_),
    .B(_0817_),
    .Y(_0175_)
);

sky130_fd_sc_hd__inv_8 _2650_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN5[13] ),
    .Y(_0818_)
);

sky130_fd_sc_hd__o21a_4 _2651_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0818_),
    .A2(_0811_),
    .B1(_0376_),
    .X(_0819_)
);

sky130_fd_sc_hd__o22a_4 _2652_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0805_),
    .A2(_0819_),
    .B1(_0818_),
    .B2(_0808_),
    .X(_0820_)
);

sky130_fd_sc_hd__nor2_4 _2653_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0814_),
    .B(_0820_),
    .Y(_0176_)
);

sky130_fd_sc_hd__inv_8 _2654_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN5[14] ),
    .Y(_0821_)
);

sky130_fd_sc_hd__o21a_4 _2655_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0821_),
    .A2(_0811_),
    .B1(_0381_),
    .X(_0822_)
);

sky130_fd_sc_hd__o22a_4 _2656_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0805_),
    .A2(_0822_),
    .B1(_0821_),
    .B2(_0808_),
    .X(_0823_)
);

sky130_fd_sc_hd__nor2_4 _2657_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0814_),
    .B(_0823_),
    .Y(_0177_)
);

sky130_fd_sc_hd__buf_1 _2658_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0763_),
    .X(_0824_)
);

sky130_fd_sc_hd__inv_8 _2659_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN5[15] ),
    .Y(_0825_)
);

sky130_fd_sc_hd__o21a_4 _2660_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0825_),
    .A2(_0811_),
    .B1(_0390_),
    .X(_0826_)
);

sky130_fd_sc_hd__buf_1 _2661_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0768_),
    .X(_0827_)
);

sky130_fd_sc_hd__o22a_4 _2662_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0824_),
    .A2(_0826_),
    .B1(_0825_),
    .B2(_0827_),
    .X(_0828_)
);

sky130_fd_sc_hd__nor2_4 _2663_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0814_),
    .B(_0828_),
    .Y(_0178_)
);

sky130_fd_sc_hd__inv_8 _2664_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN5[16] ),
    .Y(_0829_)
);

sky130_fd_sc_hd__buf_1 _2665_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0791_),
    .X(_0830_)
);

sky130_fd_sc_hd__o21a_4 _2666_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0829_),
    .A2(_0830_),
    .B1(_0397_),
    .X(_0831_)
);

sky130_fd_sc_hd__o22a_4 _2667_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0824_),
    .A2(_0831_),
    .B1(_0829_),
    .B2(_0827_),
    .X(_0832_)
);

sky130_fd_sc_hd__nor2_4 _2668_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0814_),
    .B(_0832_),
    .Y(_0179_)
);

sky130_fd_sc_hd__buf_1 _2669_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0742_),
    .X(_0833_)
);

sky130_fd_sc_hd__inv_8 _2670_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN5[17] ),
    .Y(_0834_)
);

sky130_fd_sc_hd__o21a_4 _2671_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0834_),
    .A2(_0830_),
    .B1(_0402_),
    .X(_0835_)
);

sky130_fd_sc_hd__o22a_4 _2672_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0824_),
    .A2(_0835_),
    .B1(_0834_),
    .B2(_0827_),
    .X(_0836_)
);

sky130_fd_sc_hd__nor2_4 _2673_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0833_),
    .B(_0836_),
    .Y(_0180_)
);

sky130_fd_sc_hd__inv_8 _2674_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN5[18] ),
    .Y(_0837_)
);

sky130_fd_sc_hd__o21a_4 _2675_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0837_),
    .A2(_0830_),
    .B1(_0408_),
    .X(_0838_)
);

sky130_fd_sc_hd__o22a_4 _2676_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0824_),
    .A2(_0838_),
    .B1(_0837_),
    .B2(_0827_),
    .X(_0839_)
);

sky130_fd_sc_hd__nor2_4 _2677_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0833_),
    .B(_0839_),
    .Y(_0181_)
);

sky130_fd_sc_hd__inv_8 _2678_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN5[19] ),
    .Y(_0840_)
);

sky130_fd_sc_hd__o21a_4 _2679_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0840_),
    .A2(_0830_),
    .B1(_0413_),
    .X(_0841_)
);

sky130_fd_sc_hd__o22a_4 _2680_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0824_),
    .A2(_0841_),
    .B1(_0840_),
    .B2(_0827_),
    .X(_0842_)
);

sky130_fd_sc_hd__nor2_4 _2681_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0833_),
    .B(_0842_),
    .Y(_0182_)
);

sky130_fd_sc_hd__buf_1 _2682_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0762_),
    .X(_0843_)
);

sky130_fd_sc_hd__inv_8 _2683_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN5[20] ),
    .Y(_0844_)
);

sky130_fd_sc_hd__o21a_4 _2684_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0844_),
    .A2(_0830_),
    .B1(_0420_),
    .X(_0845_)
);

sky130_fd_sc_hd__buf_1 _2685_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0767_),
    .X(_0846_)
);

sky130_fd_sc_hd__o22a_4 _2686_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0843_),
    .A2(_0845_),
    .B1(_0844_),
    .B2(_0846_),
    .X(_0847_)
);

sky130_fd_sc_hd__nor2_4 _2687_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0833_),
    .B(_0847_),
    .Y(_0184_)
);

sky130_fd_sc_hd__inv_8 _2688_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN5[21] ),
    .Y(_0848_)
);

sky130_fd_sc_hd__buf_1 _2689_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0791_),
    .X(_0849_)
);

sky130_fd_sc_hd__o21a_4 _2690_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0848_),
    .A2(_0849_),
    .B1(_0428_),
    .X(_0850_)
);

sky130_fd_sc_hd__o22a_4 _2691_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0843_),
    .A2(_0850_),
    .B1(_0848_),
    .B2(_0846_),
    .X(_0851_)
);

sky130_fd_sc_hd__nor2_4 _2692_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0833_),
    .B(_0851_),
    .Y(_0185_)
);

sky130_fd_sc_hd__buf_1 _2693_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0384_),
    .X(_0852_)
);

sky130_fd_sc_hd__buf_1 _2694_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0852_),
    .X(_0853_)
);

sky130_fd_sc_hd__inv_8 _2695_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN5[22] ),
    .Y(_0854_)
);

sky130_fd_sc_hd__o21a_4 _2696_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0854_),
    .A2(_0849_),
    .B1(_0433_),
    .X(_0855_)
);

sky130_fd_sc_hd__o22a_4 _2697_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0843_),
    .A2(_0855_),
    .B1(_0854_),
    .B2(_0846_),
    .X(_0856_)
);

sky130_fd_sc_hd__nor2_4 _2698_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0853_),
    .B(_0856_),
    .Y(_0186_)
);

sky130_fd_sc_hd__inv_8 _2699_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN5[23] ),
    .Y(_0857_)
);

sky130_fd_sc_hd__o21a_4 _2700_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0857_),
    .A2(_0849_),
    .B1(_0439_),
    .X(_0858_)
);

sky130_fd_sc_hd__o22a_4 _2701_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0843_),
    .A2(_0858_),
    .B1(_0857_),
    .B2(_0846_),
    .X(_0859_)
);

sky130_fd_sc_hd__nor2_4 _2702_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0853_),
    .B(_0859_),
    .Y(_0187_)
);

sky130_fd_sc_hd__inv_8 _2703_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN5[24] ),
    .Y(_0860_)
);

sky130_fd_sc_hd__o21a_4 _2704_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0860_),
    .A2(_0849_),
    .B1(_0444_),
    .X(_0861_)
);

sky130_fd_sc_hd__o22a_4 _2705_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0843_),
    .A2(_0861_),
    .B1(_0860_),
    .B2(_0846_),
    .X(_0862_)
);

sky130_fd_sc_hd__nor2_4 _2706_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0853_),
    .B(_0862_),
    .Y(_0188_)
);

sky130_fd_sc_hd__buf_1 _2707_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0762_),
    .X(_0863_)
);

sky130_fd_sc_hd__inv_8 _2708_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN5[25] ),
    .Y(_0864_)
);

sky130_fd_sc_hd__o21a_4 _2709_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0864_),
    .A2(_0849_),
    .B1(_0451_),
    .X(_0865_)
);

sky130_fd_sc_hd__buf_1 _2710_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0767_),
    .X(_0866_)
);

sky130_fd_sc_hd__o22a_4 _2711_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0863_),
    .A2(_0865_),
    .B1(_0864_),
    .B2(_0866_),
    .X(_0867_)
);

sky130_fd_sc_hd__nor2_4 _2712_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0853_),
    .B(_0867_),
    .Y(_0189_)
);

sky130_fd_sc_hd__inv_8 _2713_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN5[26] ),
    .Y(_0868_)
);

sky130_fd_sc_hd__buf_1 _2714_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0791_),
    .X(_0869_)
);

sky130_fd_sc_hd__o21a_4 _2715_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0868_),
    .A2(_0869_),
    .B1(_0458_),
    .X(_0870_)
);

sky130_fd_sc_hd__o22a_4 _2716_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0863_),
    .A2(_0870_),
    .B1(_0868_),
    .B2(_0866_),
    .X(_0871_)
);

sky130_fd_sc_hd__nor2_4 _2717_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0853_),
    .B(_0871_),
    .Y(_0190_)
);

sky130_fd_sc_hd__buf_1 _2718_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0852_),
    .X(_0872_)
);

sky130_fd_sc_hd__inv_8 _2719_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN5[27] ),
    .Y(_0873_)
);

sky130_fd_sc_hd__o21a_4 _2720_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0873_),
    .A2(_0869_),
    .B1(_0463_),
    .X(_0874_)
);

sky130_fd_sc_hd__o22a_4 _2721_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0863_),
    .A2(_0874_),
    .B1(_0873_),
    .B2(_0866_),
    .X(_0875_)
);

sky130_fd_sc_hd__nor2_4 _2722_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0872_),
    .B(_0875_),
    .Y(_0191_)
);

sky130_fd_sc_hd__inv_8 _2723_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN5[28] ),
    .Y(_0876_)
);

sky130_fd_sc_hd__o21a_4 _2724_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0876_),
    .A2(_0869_),
    .B1(_0468_),
    .X(_0877_)
);

sky130_fd_sc_hd__o22a_4 _2725_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0863_),
    .A2(_0877_),
    .B1(_0876_),
    .B2(_0866_),
    .X(_0878_)
);

sky130_fd_sc_hd__nor2_4 _2726_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0872_),
    .B(_0878_),
    .Y(_0192_)
);

sky130_fd_sc_hd__inv_8 _2727_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN5[29] ),
    .Y(_0879_)
);

sky130_fd_sc_hd__o21a_4 _2728_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0879_),
    .A2(_0869_),
    .B1(_0473_),
    .X(_0880_)
);

sky130_fd_sc_hd__o22a_4 _2729_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0863_),
    .A2(_0880_),
    .B1(_0879_),
    .B2(_0866_),
    .X(_0881_)
);

sky130_fd_sc_hd__nor2_4 _2730_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0872_),
    .B(_0881_),
    .Y(_0193_)
);

sky130_fd_sc_hd__inv_8 _2731_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN5[30] ),
    .Y(_0882_)
);

sky130_fd_sc_hd__o21a_4 _2732_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0882_),
    .A2(_0869_),
    .B1(_0479_),
    .X(_0883_)
);

sky130_fd_sc_hd__o22a_4 _2733_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0763_),
    .A2(_0883_),
    .B1(_0882_),
    .B2(_0768_),
    .X(_0884_)
);

sky130_fd_sc_hd__nor2_4 _2734_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0872_),
    .B(_0884_),
    .Y(_0195_)
);

sky130_fd_sc_hd__and2_4 _2735_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN5[31] ),
    .B(_0766_),
    .X(_0885_)
);

sky130_fd_sc_hd__inv_8 _2736_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN5[31] ),
    .Y(_0886_)
);

sky130_fd_sc_hd__or2_4 _2737_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0485_),
    .B(_0762_),
    .X(_0887_)
);

sky130_fd_sc_hd__a21oi_4 _2738_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0886_),
    .A2(_1732_),
    .B1(_0887_),
    .Y(_0888_)
);

sky130_fd_sc_hd__nor3_4 _2739_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0482_),
    .B(_0885_),
    .C(_0888_),
    .Y(_0889_)
);

sky130_fd_sc_hd__a21o_4 _2740_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0886_),
    .A2(_1715_),
    .B1(_0491_),
    .X(_0890_)
);

sky130_fd_sc_hd__nor2_4 _2741_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0889_),
    .B(_0890_),
    .Y(_0196_)
);

sky130_fd_sc_hd__buf_1 _2742_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1416_),
    .X(_0891_)
);

sky130_fd_sc_hd__buf_1 _2743_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0891_),
    .X(_0892_)
);

sky130_fd_sc_hd__inv_8 _2744_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN4[0] ),
    .Y(_0893_)
);

sky130_fd_sc_hd__buf_1 _2745_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0564_),
    .X(_0894_)
);

sky130_fd_sc_hd__buf_1 _2746_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0894_),
    .X(_0895_)
);

sky130_fd_sc_hd__o21a_4 _2747_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0893_),
    .A2(_0895_),
    .B1(_1753_),
    .X(_0896_)
);

sky130_fd_sc_hd__nor2_4 _2748_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1446_),
    .B(_1725_),
    .Y(_0897_)
);

sky130_fd_sc_hd__buf_1 _2749_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0897_),
    .X(_0898_)
);

sky130_fd_sc_hd__buf_1 _2750_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0898_),
    .X(_0899_)
);

sky130_fd_sc_hd__o22a_4 _2751_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0892_),
    .A2(_0896_),
    .B1(_0893_),
    .B2(_0899_),
    .X(_0900_)
);

sky130_fd_sc_hd__nor2_4 _2752_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0872_),
    .B(_0900_),
    .Y(_0140_)
);

sky130_fd_sc_hd__buf_1 _2753_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0852_),
    .X(_0901_)
);

sky130_fd_sc_hd__inv_8 _2754_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN4[1] ),
    .Y(_0902_)
);

sky130_fd_sc_hd__o21a_4 _2755_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0902_),
    .A2(_0895_),
    .B1(_0305_),
    .X(_0903_)
);

sky130_fd_sc_hd__o22a_4 _2756_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0892_),
    .A2(_0903_),
    .B1(_0902_),
    .B2(_0899_),
    .X(_0904_)
);

sky130_fd_sc_hd__nor2_4 _2757_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0901_),
    .B(_0904_),
    .Y(_0151_)
);

sky130_fd_sc_hd__inv_8 _2758_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN4[2] ),
    .Y(_0905_)
);

sky130_fd_sc_hd__o21a_4 _2759_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0905_),
    .A2(_0895_),
    .B1(_0310_),
    .X(_0906_)
);

sky130_fd_sc_hd__o22a_4 _2760_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0892_),
    .A2(_0906_),
    .B1(_0905_),
    .B2(_0899_),
    .X(_0907_)
);

sky130_fd_sc_hd__nor2_4 _2761_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0901_),
    .B(_0907_),
    .Y(_0162_)
);

sky130_fd_sc_hd__inv_8 _2762_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN4[3] ),
    .Y(_0908_)
);

sky130_fd_sc_hd__o21a_4 _2763_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0908_),
    .A2(_0895_),
    .B1(_0316_),
    .X(_0909_)
);

sky130_fd_sc_hd__o22a_4 _2764_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0892_),
    .A2(_0909_),
    .B1(_0908_),
    .B2(_0899_),
    .X(_0910_)
);

sky130_fd_sc_hd__nor2_4 _2765_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0901_),
    .B(_0910_),
    .Y(_0165_)
);

sky130_fd_sc_hd__inv_8 _2766_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN4[4] ),
    .Y(_0911_)
);

sky130_fd_sc_hd__o21a_4 _2767_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0911_),
    .A2(_0895_),
    .B1(_0321_),
    .X(_0912_)
);

sky130_fd_sc_hd__o22a_4 _2768_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0892_),
    .A2(_0912_),
    .B1(_0911_),
    .B2(_0899_),
    .X(_0913_)
);

sky130_fd_sc_hd__nor2_4 _2769_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0901_),
    .B(_0913_),
    .Y(_0166_)
);

sky130_fd_sc_hd__buf_1 _2770_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0891_),
    .X(_0914_)
);

sky130_fd_sc_hd__inv_8 _2771_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN4[5] ),
    .Y(_0915_)
);

sky130_fd_sc_hd__buf_1 _2772_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0894_),
    .X(_0916_)
);

sky130_fd_sc_hd__o21a_4 _2773_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0915_),
    .A2(_0916_),
    .B1(_0328_),
    .X(_0917_)
);

sky130_fd_sc_hd__buf_1 _2774_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0898_),
    .X(_0918_)
);

sky130_fd_sc_hd__o22a_4 _2775_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0914_),
    .A2(_0917_),
    .B1(_0915_),
    .B2(_0918_),
    .X(_0919_)
);

sky130_fd_sc_hd__nor2_4 _2776_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0901_),
    .B(_0919_),
    .Y(_0167_)
);

sky130_fd_sc_hd__buf_1 _2777_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0852_),
    .X(_0920_)
);

sky130_fd_sc_hd__inv_8 _2778_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN4[6] ),
    .Y(_0921_)
);

sky130_fd_sc_hd__o21a_4 _2779_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0921_),
    .A2(_0916_),
    .B1(_0335_),
    .X(_0922_)
);

sky130_fd_sc_hd__o22a_4 _2780_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0914_),
    .A2(_0922_),
    .B1(_0921_),
    .B2(_0918_),
    .X(_0923_)
);

sky130_fd_sc_hd__nor2_4 _2781_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0920_),
    .B(_0923_),
    .Y(_0168_)
);

sky130_fd_sc_hd__inv_8 _2782_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN4[7] ),
    .Y(_0924_)
);

sky130_fd_sc_hd__o21a_4 _2783_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0924_),
    .A2(_0916_),
    .B1(_0340_),
    .X(_0925_)
);

sky130_fd_sc_hd__o22a_4 _2784_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0914_),
    .A2(_0925_),
    .B1(_0924_),
    .B2(_0918_),
    .X(_0926_)
);

sky130_fd_sc_hd__nor2_4 _2785_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0920_),
    .B(_0926_),
    .Y(_0169_)
);

sky130_fd_sc_hd__inv_8 _2786_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN4[8] ),
    .Y(_0927_)
);

sky130_fd_sc_hd__o21a_4 _2787_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0927_),
    .A2(_0916_),
    .B1(_0346_),
    .X(_0928_)
);

sky130_fd_sc_hd__o22a_4 _2788_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0914_),
    .A2(_0928_),
    .B1(_0927_),
    .B2(_0918_),
    .X(_0929_)
);

sky130_fd_sc_hd__nor2_4 _2789_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0920_),
    .B(_0929_),
    .Y(_0170_)
);

sky130_fd_sc_hd__inv_8 _2790_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN4[9] ),
    .Y(_0930_)
);

sky130_fd_sc_hd__o21a_4 _2791_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0930_),
    .A2(_0916_),
    .B1(_0351_),
    .X(_0931_)
);

sky130_fd_sc_hd__o22a_4 _2792_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0914_),
    .A2(_0931_),
    .B1(_0930_),
    .B2(_0918_),
    .X(_0932_)
);

sky130_fd_sc_hd__nor2_4 _2793_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0920_),
    .B(_0932_),
    .Y(_0171_)
);

sky130_fd_sc_hd__buf_1 _2794_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0891_),
    .X(_0933_)
);

sky130_fd_sc_hd__inv_8 _2795_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN4[10] ),
    .Y(_0934_)
);

sky130_fd_sc_hd__buf_1 _2796_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0894_),
    .X(_0935_)
);

sky130_fd_sc_hd__o21a_4 _2797_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0934_),
    .A2(_0935_),
    .B1(_0358_),
    .X(_0936_)
);

sky130_fd_sc_hd__buf_1 _2798_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0898_),
    .X(_0937_)
);

sky130_fd_sc_hd__o22a_4 _2799_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0933_),
    .A2(_0936_),
    .B1(_0934_),
    .B2(_0937_),
    .X(_0938_)
);

sky130_fd_sc_hd__nor2_4 _2800_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0920_),
    .B(_0938_),
    .Y(_0141_)
);

sky130_fd_sc_hd__buf_1 _2801_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0852_),
    .X(_0939_)
);

sky130_fd_sc_hd__inv_8 _2802_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN4[11] ),
    .Y(_0940_)
);

sky130_fd_sc_hd__o21a_4 _2803_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0940_),
    .A2(_0935_),
    .B1(_0365_),
    .X(_0941_)
);

sky130_fd_sc_hd__o22a_4 _2804_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0933_),
    .A2(_0941_),
    .B1(_0940_),
    .B2(_0937_),
    .X(_0942_)
);

sky130_fd_sc_hd__nor2_4 _2805_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0939_),
    .B(_0942_),
    .Y(_0142_)
);

sky130_fd_sc_hd__inv_8 _2806_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN4[12] ),
    .Y(_0943_)
);

sky130_fd_sc_hd__o21a_4 _2807_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0943_),
    .A2(_0935_),
    .B1(_0370_),
    .X(_0944_)
);

sky130_fd_sc_hd__o22a_4 _2808_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0933_),
    .A2(_0944_),
    .B1(_0943_),
    .B2(_0937_),
    .X(_0945_)
);

sky130_fd_sc_hd__nor2_4 _2809_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0939_),
    .B(_0945_),
    .Y(_0143_)
);

sky130_fd_sc_hd__inv_8 _2810_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN4[13] ),
    .Y(_0946_)
);

sky130_fd_sc_hd__o21a_4 _2811_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0946_),
    .A2(_0935_),
    .B1(_0376_),
    .X(_0947_)
);

sky130_fd_sc_hd__o22a_4 _2812_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0933_),
    .A2(_0947_),
    .B1(_0946_),
    .B2(_0937_),
    .X(_0948_)
);

sky130_fd_sc_hd__nor2_4 _2813_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0939_),
    .B(_0948_),
    .Y(_0144_)
);

sky130_fd_sc_hd__inv_8 _2814_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN4[14] ),
    .Y(_0949_)
);

sky130_fd_sc_hd__o21a_4 _2815_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0949_),
    .A2(_0935_),
    .B1(_0381_),
    .X(_0950_)
);

sky130_fd_sc_hd__o22a_4 _2816_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0933_),
    .A2(_0950_),
    .B1(_0949_),
    .B2(_0937_),
    .X(_0951_)
);

sky130_fd_sc_hd__nor2_4 _2817_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0939_),
    .B(_0951_),
    .Y(_0145_)
);

sky130_fd_sc_hd__buf_1 _2818_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1416_),
    .X(_0952_)
);

sky130_fd_sc_hd__inv_8 _2819_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN4[15] ),
    .Y(_0953_)
);

sky130_fd_sc_hd__buf_1 _2820_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0894_),
    .X(_0954_)
);

sky130_fd_sc_hd__o21a_4 _2821_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0953_),
    .A2(_0954_),
    .B1(_0390_),
    .X(_0955_)
);

sky130_fd_sc_hd__buf_1 _2822_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0897_),
    .X(_0956_)
);

sky130_fd_sc_hd__o22a_4 _2823_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0952_),
    .A2(_0955_),
    .B1(_0953_),
    .B2(_0956_),
    .X(_0957_)
);

sky130_fd_sc_hd__nor2_4 _2824_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0939_),
    .B(_0957_),
    .Y(_0146_)
);

sky130_fd_sc_hd__buf_1 _2825_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1698_),
    .X(_0958_)
);

sky130_fd_sc_hd__buf_1 _2826_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0958_),
    .X(_0959_)
);

sky130_fd_sc_hd__inv_8 _2827_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN4[16] ),
    .Y(_0960_)
);

sky130_fd_sc_hd__o21a_4 _2828_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0960_),
    .A2(_0954_),
    .B1(_0397_),
    .X(_0961_)
);

sky130_fd_sc_hd__o22a_4 _2829_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0952_),
    .A2(_0961_),
    .B1(_0960_),
    .B2(_0956_),
    .X(_0962_)
);

sky130_fd_sc_hd__nor2_4 _2830_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0959_),
    .B(_0962_),
    .Y(_0147_)
);

sky130_fd_sc_hd__inv_8 _2831_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN4[17] ),
    .Y(_0963_)
);

sky130_fd_sc_hd__o21a_4 _2832_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0963_),
    .A2(_0954_),
    .B1(_0402_),
    .X(_0964_)
);

sky130_fd_sc_hd__o22a_4 _2833_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0952_),
    .A2(_0964_),
    .B1(_0963_),
    .B2(_0956_),
    .X(_0965_)
);

sky130_fd_sc_hd__nor2_4 _2834_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0959_),
    .B(_0965_),
    .Y(_0148_)
);

sky130_fd_sc_hd__inv_8 _2835_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN4[18] ),
    .Y(_0966_)
);

sky130_fd_sc_hd__o21a_4 _2836_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0966_),
    .A2(_0954_),
    .B1(_0408_),
    .X(_0967_)
);

sky130_fd_sc_hd__o22a_4 _2837_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0952_),
    .A2(_0967_),
    .B1(_0966_),
    .B2(_0956_),
    .X(_0968_)
);

sky130_fd_sc_hd__nor2_4 _2838_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0959_),
    .B(_0968_),
    .Y(_0149_)
);

sky130_fd_sc_hd__inv_8 _2839_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN4[19] ),
    .Y(_0969_)
);

sky130_fd_sc_hd__o21a_4 _2840_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0969_),
    .A2(_0954_),
    .B1(_0413_),
    .X(_0970_)
);

sky130_fd_sc_hd__o22a_4 _2841_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0952_),
    .A2(_0970_),
    .B1(_0969_),
    .B2(_0956_),
    .X(_0971_)
);

sky130_fd_sc_hd__nor2_4 _2842_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0959_),
    .B(_0971_),
    .Y(_0150_)
);

sky130_fd_sc_hd__buf_1 _2843_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1416_),
    .X(_0972_)
);

sky130_fd_sc_hd__inv_8 _2844_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN4[20] ),
    .Y(_0973_)
);

sky130_fd_sc_hd__buf_1 _2845_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0894_),
    .X(_0974_)
);

sky130_fd_sc_hd__o21a_4 _2846_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0973_),
    .A2(_0974_),
    .B1(_0420_),
    .X(_0975_)
);

sky130_fd_sc_hd__buf_1 _2847_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0897_),
    .X(_0976_)
);

sky130_fd_sc_hd__o22a_4 _2848_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0972_),
    .A2(_0975_),
    .B1(_0973_),
    .B2(_0976_),
    .X(_0977_)
);

sky130_fd_sc_hd__nor2_4 _2849_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0959_),
    .B(_0977_),
    .Y(_0152_)
);

sky130_fd_sc_hd__buf_1 _2850_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0958_),
    .X(_0978_)
);

sky130_fd_sc_hd__inv_8 _2851_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN4[21] ),
    .Y(_0979_)
);

sky130_fd_sc_hd__o21a_4 _2852_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0979_),
    .A2(_0974_),
    .B1(_0428_),
    .X(_0980_)
);

sky130_fd_sc_hd__o22a_4 _2853_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0972_),
    .A2(_0980_),
    .B1(_0979_),
    .B2(_0976_),
    .X(_0981_)
);

sky130_fd_sc_hd__nor2_4 _2854_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0978_),
    .B(_0981_),
    .Y(_0153_)
);

sky130_fd_sc_hd__inv_8 _2855_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN4[22] ),
    .Y(_0982_)
);

sky130_fd_sc_hd__o21a_4 _2856_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0982_),
    .A2(_0974_),
    .B1(_0433_),
    .X(_0983_)
);

sky130_fd_sc_hd__o22a_4 _2857_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0972_),
    .A2(_0983_),
    .B1(_0982_),
    .B2(_0976_),
    .X(_0984_)
);

sky130_fd_sc_hd__nor2_4 _2858_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0978_),
    .B(_0984_),
    .Y(_0154_)
);

sky130_fd_sc_hd__inv_8 _2859_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN4[23] ),
    .Y(_0985_)
);

sky130_fd_sc_hd__o21a_4 _2860_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0985_),
    .A2(_0974_),
    .B1(_0439_),
    .X(_0986_)
);

sky130_fd_sc_hd__o22a_4 _2861_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0972_),
    .A2(_0986_),
    .B1(_0985_),
    .B2(_0976_),
    .X(_0987_)
);

sky130_fd_sc_hd__nor2_4 _2862_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0978_),
    .B(_0987_),
    .Y(_0155_)
);

sky130_fd_sc_hd__inv_8 _2863_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN4[24] ),
    .Y(_0988_)
);

sky130_fd_sc_hd__o21a_4 _2864_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0988_),
    .A2(_0974_),
    .B1(_0444_),
    .X(_0989_)
);

sky130_fd_sc_hd__o22a_4 _2865_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0972_),
    .A2(_0989_),
    .B1(_0988_),
    .B2(_0976_),
    .X(_0990_)
);

sky130_fd_sc_hd__nor2_4 _2866_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0978_),
    .B(_0990_),
    .Y(_0156_)
);

sky130_fd_sc_hd__buf_1 _2867_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1416_),
    .X(_0991_)
);

sky130_fd_sc_hd__inv_8 _2868_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN4[25] ),
    .Y(_0992_)
);

sky130_fd_sc_hd__buf_1 _2869_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0564_),
    .X(_0993_)
);

sky130_fd_sc_hd__buf_1 _2870_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0993_),
    .X(_0994_)
);

sky130_fd_sc_hd__o21a_4 _2871_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0992_),
    .A2(_0994_),
    .B1(_0451_),
    .X(_0995_)
);

sky130_fd_sc_hd__buf_1 _2872_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0897_),
    .X(_0996_)
);

sky130_fd_sc_hd__o22a_4 _2873_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0991_),
    .A2(_0995_),
    .B1(_0992_),
    .B2(_0996_),
    .X(_0997_)
);

sky130_fd_sc_hd__nor2_4 _2874_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0978_),
    .B(_0997_),
    .Y(_0157_)
);

sky130_fd_sc_hd__buf_1 _2875_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0958_),
    .X(_0998_)
);

sky130_fd_sc_hd__inv_8 _2876_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN4[26] ),
    .Y(_0999_)
);

sky130_fd_sc_hd__o21a_4 _2877_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0999_),
    .A2(_0994_),
    .B1(_0458_),
    .X(_1000_)
);

sky130_fd_sc_hd__o22a_4 _2878_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0991_),
    .A2(_1000_),
    .B1(_0999_),
    .B2(_0996_),
    .X(_1001_)
);

sky130_fd_sc_hd__nor2_4 _2879_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0998_),
    .B(_1001_),
    .Y(_0158_)
);

sky130_fd_sc_hd__inv_8 _2880_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN4[27] ),
    .Y(_1002_)
);

sky130_fd_sc_hd__o21a_4 _2881_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1002_),
    .A2(_0994_),
    .B1(_0463_),
    .X(_1003_)
);

sky130_fd_sc_hd__o22a_4 _2882_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0991_),
    .A2(_1003_),
    .B1(_1002_),
    .B2(_0996_),
    .X(_1004_)
);

sky130_fd_sc_hd__nor2_4 _2883_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0998_),
    .B(_1004_),
    .Y(_0159_)
);

sky130_fd_sc_hd__inv_8 _2884_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN4[28] ),
    .Y(_1005_)
);

sky130_fd_sc_hd__o21a_4 _2885_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1005_),
    .A2(_0994_),
    .B1(_0468_),
    .X(_1006_)
);

sky130_fd_sc_hd__o22a_4 _2886_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0991_),
    .A2(_1006_),
    .B1(_1005_),
    .B2(_0996_),
    .X(_1007_)
);

sky130_fd_sc_hd__nor2_4 _2887_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0998_),
    .B(_1007_),
    .Y(_0160_)
);

sky130_fd_sc_hd__inv_8 _2888_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN4[29] ),
    .Y(_1008_)
);

sky130_fd_sc_hd__o21a_4 _2889_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1008_),
    .A2(_0994_),
    .B1(_0473_),
    .X(_1009_)
);

sky130_fd_sc_hd__o22a_4 _2890_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0991_),
    .A2(_1009_),
    .B1(_1008_),
    .B2(_0996_),
    .X(_1010_)
);

sky130_fd_sc_hd__nor2_4 _2891_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0998_),
    .B(_1010_),
    .Y(_0161_)
);

sky130_fd_sc_hd__inv_8 _2892_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN4[30] ),
    .Y(_1011_)
);

sky130_fd_sc_hd__buf_1 _2893_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0993_),
    .X(_1012_)
);

sky130_fd_sc_hd__o21a_4 _2894_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1011_),
    .A2(_1012_),
    .B1(_0479_),
    .X(_1013_)
);

sky130_fd_sc_hd__o22a_4 _2895_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0891_),
    .A2(_1013_),
    .B1(_1011_),
    .B2(_0898_),
    .X(_1014_)
);

sky130_fd_sc_hd__nor2_4 _2896_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0998_),
    .B(_1014_),
    .Y(_0163_)
);

sky130_fd_sc_hd__buf_1 _2897_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0958_),
    .X(_1015_)
);

sky130_fd_sc_hd__inv_8 _2898_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN4[31] ),
    .Y(_1016_)
);

sky130_fd_sc_hd__o32a_4 _2899_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1680_),
    .A2(_1714_),
    .A3(_1701_),
    .B1(_1016_),
    .B2(_1431_),
    .X(_1017_)
);

sky130_fd_sc_hd__o22a_4 _2900_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_0891_),
    .A2(_1017_),
    .B1(_1016_),
    .B2(_0898_),
    .X(_1018_)
);

sky130_fd_sc_hd__nor2_4 _2901_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1015_),
    .B(_1018_),
    .Y(_0164_)
);

sky130_fd_sc_hd__inv_8 _2902_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1445_),
    .Y(_1019_)
);

sky130_fd_sc_hd__buf_1 _2903_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1019_),
    .X(_1020_)
);

sky130_fd_sc_hd__buf_1 _2904_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1020_),
    .X(_1021_)
);

sky130_fd_sc_hd__inv_8 _2905_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN3[0] ),
    .Y(_1022_)
);

sky130_fd_sc_hd__o21a_4 _2906_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1022_),
    .A2(_1012_),
    .B1(_1753_),
    .X(_1023_)
);

sky130_fd_sc_hd__or4_4 _2907_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1436_),
    .B(_1440_),
    .C(_1444_),
    .D(_1415_),
    .X(_1024_)
);

sky130_fd_sc_hd__nor2_4 _2908_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1725_),
    .B(_1024_),
    .Y(_1025_)
);

sky130_fd_sc_hd__buf_1 _2909_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1025_),
    .X(_1026_)
);

sky130_fd_sc_hd__buf_1 _2910_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1026_),
    .X(_1027_)
);

sky130_fd_sc_hd__o22a_4 _2911_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1021_),
    .A2(_1023_),
    .B1(_1022_),
    .B2(_1027_),
    .X(_1028_)
);

sky130_fd_sc_hd__nor2_4 _2912_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1015_),
    .B(_1028_),
    .Y(_0108_)
);

sky130_fd_sc_hd__inv_8 _2913_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN3[1] ),
    .Y(_1029_)
);

sky130_fd_sc_hd__o21a_4 _2914_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1029_),
    .A2(_1012_),
    .B1(_0304_),
    .X(_1030_)
);

sky130_fd_sc_hd__o22a_4 _2915_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1021_),
    .A2(_1030_),
    .B1(_1029_),
    .B2(_1027_),
    .X(_1031_)
);

sky130_fd_sc_hd__nor2_4 _2916_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1015_),
    .B(_1031_),
    .Y(_0119_)
);

sky130_fd_sc_hd__inv_8 _2917_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN3[2] ),
    .Y(_1032_)
);

sky130_fd_sc_hd__o21a_4 _2918_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1032_),
    .A2(_1012_),
    .B1(_0309_),
    .X(_1033_)
);

sky130_fd_sc_hd__o22a_4 _2919_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1021_),
    .A2(_1033_),
    .B1(_1032_),
    .B2(_1027_),
    .X(_1034_)
);

sky130_fd_sc_hd__nor2_4 _2920_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1015_),
    .B(_1034_),
    .Y(_0130_)
);

sky130_fd_sc_hd__inv_8 _2921_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN3[3] ),
    .Y(_1035_)
);

sky130_fd_sc_hd__o21a_4 _2922_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1035_),
    .A2(_1012_),
    .B1(_0315_),
    .X(_1036_)
);

sky130_fd_sc_hd__o22a_4 _2923_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1021_),
    .A2(_1036_),
    .B1(_1035_),
    .B2(_1027_),
    .X(_1037_)
);

sky130_fd_sc_hd__nor2_4 _2924_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1015_),
    .B(_1037_),
    .Y(_0133_)
);

sky130_fd_sc_hd__buf_1 _2925_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0958_),
    .X(_1038_)
);

sky130_fd_sc_hd__inv_8 _2926_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN3[4] ),
    .Y(_1039_)
);

sky130_fd_sc_hd__buf_1 _2927_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0993_),
    .X(_1040_)
);

sky130_fd_sc_hd__o21a_4 _2928_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1039_),
    .A2(_1040_),
    .B1(_0320_),
    .X(_1041_)
);

sky130_fd_sc_hd__o22a_4 _2929_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1021_),
    .A2(_1041_),
    .B1(_1039_),
    .B2(_1027_),
    .X(_1042_)
);

sky130_fd_sc_hd__nor2_4 _2930_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1038_),
    .B(_1042_),
    .Y(_0134_)
);

sky130_fd_sc_hd__buf_1 _2931_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1020_),
    .X(_1043_)
);

sky130_fd_sc_hd__inv_8 _2932_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN3[5] ),
    .Y(_1044_)
);

sky130_fd_sc_hd__o21a_4 _2933_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1044_),
    .A2(_1040_),
    .B1(_0327_),
    .X(_1045_)
);

sky130_fd_sc_hd__buf_1 _2934_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1026_),
    .X(_1046_)
);

sky130_fd_sc_hd__o22a_4 _2935_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1043_),
    .A2(_1045_),
    .B1(_1044_),
    .B2(_1046_),
    .X(_1047_)
);

sky130_fd_sc_hd__nor2_4 _2936_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1038_),
    .B(_1047_),
    .Y(_0135_)
);

sky130_fd_sc_hd__inv_8 _2937_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN3[6] ),
    .Y(_1048_)
);

sky130_fd_sc_hd__o21a_4 _2938_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1048_),
    .A2(_1040_),
    .B1(_0334_),
    .X(_1049_)
);

sky130_fd_sc_hd__o22a_4 _2939_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1043_),
    .A2(_1049_),
    .B1(_1048_),
    .B2(_1046_),
    .X(_1050_)
);

sky130_fd_sc_hd__nor2_4 _2940_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1038_),
    .B(_1050_),
    .Y(_0136_)
);

sky130_fd_sc_hd__inv_8 _2941_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN3[7] ),
    .Y(_1051_)
);

sky130_fd_sc_hd__o21a_4 _2942_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1051_),
    .A2(_1040_),
    .B1(_0339_),
    .X(_1052_)
);

sky130_fd_sc_hd__o22a_4 _2943_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1043_),
    .A2(_1052_),
    .B1(_1051_),
    .B2(_1046_),
    .X(_1053_)
);

sky130_fd_sc_hd__nor2_4 _2944_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1038_),
    .B(_1053_),
    .Y(_0137_)
);

sky130_fd_sc_hd__inv_8 _2945_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN3[8] ),
    .Y(_1054_)
);

sky130_fd_sc_hd__o21a_4 _2946_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1054_),
    .A2(_1040_),
    .B1(_0345_),
    .X(_1055_)
);

sky130_fd_sc_hd__o22a_4 _2947_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1043_),
    .A2(_1055_),
    .B1(_1054_),
    .B2(_1046_),
    .X(_1056_)
);

sky130_fd_sc_hd__nor2_4 _2948_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1038_),
    .B(_1056_),
    .Y(_0138_)
);

sky130_fd_sc_hd__buf_1 _2949_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1698_),
    .X(_1057_)
);

sky130_fd_sc_hd__buf_1 _2950_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1057_),
    .X(_1058_)
);

sky130_fd_sc_hd__inv_8 _2951_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN3[9] ),
    .Y(_1059_)
);

sky130_fd_sc_hd__buf_1 _2952_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0993_),
    .X(_1060_)
);

sky130_fd_sc_hd__o21a_4 _2953_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1059_),
    .A2(_1060_),
    .B1(_0350_),
    .X(_1061_)
);

sky130_fd_sc_hd__o22a_4 _2954_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1043_),
    .A2(_1061_),
    .B1(_1059_),
    .B2(_1046_),
    .X(_1062_)
);

sky130_fd_sc_hd__nor2_4 _2955_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1058_),
    .B(_1062_),
    .Y(_0139_)
);

sky130_fd_sc_hd__buf_1 _2956_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1020_),
    .X(_1063_)
);

sky130_fd_sc_hd__inv_8 _2957_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN3[10] ),
    .Y(_1064_)
);

sky130_fd_sc_hd__o21a_4 _2958_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1064_),
    .A2(_1060_),
    .B1(_0357_),
    .X(_1065_)
);

sky130_fd_sc_hd__buf_1 _2959_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1026_),
    .X(_1066_)
);

sky130_fd_sc_hd__o22a_4 _2960_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1063_),
    .A2(_1065_),
    .B1(_1064_),
    .B2(_1066_),
    .X(_1067_)
);

sky130_fd_sc_hd__nor2_4 _2961_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1058_),
    .B(_1067_),
    .Y(_0109_)
);

sky130_fd_sc_hd__inv_8 _2962_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN3[11] ),
    .Y(_1068_)
);

sky130_fd_sc_hd__o21a_4 _2963_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1068_),
    .A2(_1060_),
    .B1(_0364_),
    .X(_1069_)
);

sky130_fd_sc_hd__o22a_4 _2964_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1063_),
    .A2(_1069_),
    .B1(_1068_),
    .B2(_1066_),
    .X(_1070_)
);

sky130_fd_sc_hd__nor2_4 _2965_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1058_),
    .B(_1070_),
    .Y(_0110_)
);

sky130_fd_sc_hd__inv_8 _2966_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN3[12] ),
    .Y(_1071_)
);

sky130_fd_sc_hd__o21a_4 _2967_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1071_),
    .A2(_1060_),
    .B1(_0369_),
    .X(_1072_)
);

sky130_fd_sc_hd__o22a_4 _2968_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1063_),
    .A2(_1072_),
    .B1(_1071_),
    .B2(_1066_),
    .X(_1073_)
);

sky130_fd_sc_hd__nor2_4 _2969_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1058_),
    .B(_1073_),
    .Y(_0111_)
);

sky130_fd_sc_hd__inv_8 _2970_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN3[13] ),
    .Y(_1074_)
);

sky130_fd_sc_hd__o21a_4 _2971_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1074_),
    .A2(_1060_),
    .B1(_0375_),
    .X(_1075_)
);

sky130_fd_sc_hd__o22a_4 _2972_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1063_),
    .A2(_1075_),
    .B1(_1074_),
    .B2(_1066_),
    .X(_1076_)
);

sky130_fd_sc_hd__nor2_4 _2973_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1058_),
    .B(_1076_),
    .Y(_0112_)
);

sky130_fd_sc_hd__buf_1 _2974_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1057_),
    .X(_1077_)
);

sky130_fd_sc_hd__inv_8 _2975_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN3[14] ),
    .Y(_1078_)
);

sky130_fd_sc_hd__buf_1 _2976_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0993_),
    .X(_1079_)
);

sky130_fd_sc_hd__o21a_4 _2977_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1078_),
    .A2(_1079_),
    .B1(_0380_),
    .X(_1080_)
);

sky130_fd_sc_hd__o22a_4 _2978_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1063_),
    .A2(_1080_),
    .B1(_1078_),
    .B2(_1066_),
    .X(_1081_)
);

sky130_fd_sc_hd__nor2_4 _2979_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1077_),
    .B(_1081_),
    .Y(_0113_)
);

sky130_fd_sc_hd__buf_1 _2980_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1020_),
    .X(_1082_)
);

sky130_fd_sc_hd__inv_8 _2981_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN3[15] ),
    .Y(_1083_)
);

sky130_fd_sc_hd__o21a_4 _2982_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1083_),
    .A2(_1079_),
    .B1(_0389_),
    .X(_1084_)
);

sky130_fd_sc_hd__buf_1 _2983_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1026_),
    .X(_1085_)
);

sky130_fd_sc_hd__o22a_4 _2984_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1082_),
    .A2(_1084_),
    .B1(_1083_),
    .B2(_1085_),
    .X(_1086_)
);

sky130_fd_sc_hd__nor2_4 _2985_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1077_),
    .B(_1086_),
    .Y(_0114_)
);

sky130_fd_sc_hd__inv_8 _2986_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN3[16] ),
    .Y(_1087_)
);

sky130_fd_sc_hd__o21a_4 _2987_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1087_),
    .A2(_1079_),
    .B1(_0396_),
    .X(_1088_)
);

sky130_fd_sc_hd__o22a_4 _2988_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1082_),
    .A2(_1088_),
    .B1(_1087_),
    .B2(_1085_),
    .X(_1089_)
);

sky130_fd_sc_hd__nor2_4 _2989_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1077_),
    .B(_1089_),
    .Y(_0115_)
);

sky130_fd_sc_hd__inv_8 _2990_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN3[17] ),
    .Y(_1090_)
);

sky130_fd_sc_hd__o21a_4 _2991_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1090_),
    .A2(_1079_),
    .B1(_0401_),
    .X(_1091_)
);

sky130_fd_sc_hd__o22a_4 _2992_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1082_),
    .A2(_1091_),
    .B1(_1090_),
    .B2(_1085_),
    .X(_1092_)
);

sky130_fd_sc_hd__nor2_4 _2993_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1077_),
    .B(_1092_),
    .Y(_0116_)
);

sky130_fd_sc_hd__inv_8 _2994_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN3[18] ),
    .Y(_1093_)
);

sky130_fd_sc_hd__o21a_4 _2995_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1093_),
    .A2(_1079_),
    .B1(_0407_),
    .X(_1094_)
);

sky130_fd_sc_hd__o22a_4 _2996_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1082_),
    .A2(_1094_),
    .B1(_1093_),
    .B2(_1085_),
    .X(_1095_)
);

sky130_fd_sc_hd__nor2_4 _2997_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1077_),
    .B(_1095_),
    .Y(_0117_)
);

sky130_fd_sc_hd__buf_1 _2998_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1057_),
    .X(_1096_)
);

sky130_fd_sc_hd__inv_8 _2999_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN3[19] ),
    .Y(_1097_)
);

sky130_fd_sc_hd__buf_1 _3000_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1429_),
    .X(_1098_)
);

sky130_fd_sc_hd__buf_1 _3001_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1098_),
    .X(_1099_)
);

sky130_fd_sc_hd__o21a_4 _3002_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1097_),
    .A2(_1099_),
    .B1(_0412_),
    .X(_1100_)
);

sky130_fd_sc_hd__o22a_4 _3003_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1082_),
    .A2(_1100_),
    .B1(_1097_),
    .B2(_1085_),
    .X(_1101_)
);

sky130_fd_sc_hd__nor2_4 _3004_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1096_),
    .B(_1101_),
    .Y(_0118_)
);

sky130_fd_sc_hd__buf_1 _3005_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1019_),
    .X(_1102_)
);

sky130_fd_sc_hd__inv_8 _3006_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN3[20] ),
    .Y(_1103_)
);

sky130_fd_sc_hd__o21a_4 _3007_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1103_),
    .A2(_1099_),
    .B1(_0419_),
    .X(_1104_)
);

sky130_fd_sc_hd__buf_1 _3008_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1025_),
    .X(_1105_)
);

sky130_fd_sc_hd__o22a_4 _3009_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1102_),
    .A2(_1104_),
    .B1(_1103_),
    .B2(_1105_),
    .X(_1106_)
);

sky130_fd_sc_hd__nor2_4 _3010_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1096_),
    .B(_1106_),
    .Y(_0120_)
);

sky130_fd_sc_hd__inv_8 _3011_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN3[21] ),
    .Y(_1107_)
);

sky130_fd_sc_hd__o21a_4 _3012_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1107_),
    .A2(_1099_),
    .B1(_0427_),
    .X(_1108_)
);

sky130_fd_sc_hd__o22a_4 _3013_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1102_),
    .A2(_1108_),
    .B1(_1107_),
    .B2(_1105_),
    .X(_1109_)
);

sky130_fd_sc_hd__nor2_4 _3014_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1096_),
    .B(_1109_),
    .Y(_0121_)
);

sky130_fd_sc_hd__inv_8 _3015_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN3[22] ),
    .Y(_1110_)
);

sky130_fd_sc_hd__o21a_4 _3016_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1110_),
    .A2(_1099_),
    .B1(_0432_),
    .X(_1111_)
);

sky130_fd_sc_hd__o22a_4 _3017_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1102_),
    .A2(_1111_),
    .B1(_1110_),
    .B2(_1105_),
    .X(_1112_)
);

sky130_fd_sc_hd__nor2_4 _3018_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1096_),
    .B(_1112_),
    .Y(_0122_)
);

sky130_fd_sc_hd__inv_8 _3019_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN3[23] ),
    .Y(_1113_)
);

sky130_fd_sc_hd__o21a_4 _3020_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1113_),
    .A2(_1099_),
    .B1(_0438_),
    .X(_1114_)
);

sky130_fd_sc_hd__o22a_4 _3021_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1102_),
    .A2(_1114_),
    .B1(_1113_),
    .B2(_1105_),
    .X(_1115_)
);

sky130_fd_sc_hd__nor2_4 _3022_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1096_),
    .B(_1115_),
    .Y(_0123_)
);

sky130_fd_sc_hd__buf_1 _3023_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1057_),
    .X(_1116_)
);

sky130_fd_sc_hd__inv_8 _3024_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN3[24] ),
    .Y(_1117_)
);

sky130_fd_sc_hd__buf_1 _3025_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1098_),
    .X(_1118_)
);

sky130_fd_sc_hd__o21a_4 _3026_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1117_),
    .A2(_1118_),
    .B1(_0443_),
    .X(_1119_)
);

sky130_fd_sc_hd__o22a_4 _3027_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1102_),
    .A2(_1119_),
    .B1(_1117_),
    .B2(_1105_),
    .X(_1120_)
);

sky130_fd_sc_hd__nor2_4 _3028_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1116_),
    .B(_1120_),
    .Y(_0124_)
);

sky130_fd_sc_hd__buf_1 _3029_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1019_),
    .X(_1121_)
);

sky130_fd_sc_hd__inv_8 _3030_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN3[25] ),
    .Y(_1122_)
);

sky130_fd_sc_hd__o21a_4 _3031_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1122_),
    .A2(_1118_),
    .B1(_0450_),
    .X(_1123_)
);

sky130_fd_sc_hd__buf_1 _3032_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1025_),
    .X(_1124_)
);

sky130_fd_sc_hd__o22a_4 _3033_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1121_),
    .A2(_1123_),
    .B1(_1122_),
    .B2(_1124_),
    .X(_1125_)
);

sky130_fd_sc_hd__nor2_4 _3034_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1116_),
    .B(_1125_),
    .Y(_0125_)
);

sky130_fd_sc_hd__inv_8 _3035_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN3[26] ),
    .Y(_1126_)
);

sky130_fd_sc_hd__o21a_4 _3036_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1126_),
    .A2(_1118_),
    .B1(_0457_),
    .X(_1127_)
);

sky130_fd_sc_hd__o22a_4 _3037_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1121_),
    .A2(_1127_),
    .B1(_1126_),
    .B2(_1124_),
    .X(_1128_)
);

sky130_fd_sc_hd__nor2_4 _3038_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1116_),
    .B(_1128_),
    .Y(_0126_)
);

sky130_fd_sc_hd__inv_8 _3039_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN3[27] ),
    .Y(_1129_)
);

sky130_fd_sc_hd__o21a_4 _3040_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1129_),
    .A2(_1118_),
    .B1(_0462_),
    .X(_1130_)
);

sky130_fd_sc_hd__o22a_4 _3041_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1121_),
    .A2(_1130_),
    .B1(_1129_),
    .B2(_1124_),
    .X(_1131_)
);

sky130_fd_sc_hd__nor2_4 _3042_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1116_),
    .B(_1131_),
    .Y(_0127_)
);

sky130_fd_sc_hd__inv_8 _3043_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN3[28] ),
    .Y(_1132_)
);

sky130_fd_sc_hd__o21a_4 _3044_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1132_),
    .A2(_1118_),
    .B1(_0467_),
    .X(_1133_)
);

sky130_fd_sc_hd__o22a_4 _3045_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1121_),
    .A2(_1133_),
    .B1(_1132_),
    .B2(_1124_),
    .X(_1134_)
);

sky130_fd_sc_hd__nor2_4 _3046_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1116_),
    .B(_1134_),
    .Y(_0128_)
);

sky130_fd_sc_hd__buf_1 _3047_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1057_),
    .X(_1135_)
);

sky130_fd_sc_hd__inv_8 _3048_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN3[29] ),
    .Y(_1136_)
);

sky130_fd_sc_hd__buf_1 _3049_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1098_),
    .X(_1137_)
);

sky130_fd_sc_hd__o21a_4 _3050_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1136_),
    .A2(_1137_),
    .B1(_0472_),
    .X(_1138_)
);

sky130_fd_sc_hd__o22a_4 _3051_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1121_),
    .A2(_1138_),
    .B1(_1136_),
    .B2(_1124_),
    .X(_1139_)
);

sky130_fd_sc_hd__nor2_4 _3052_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1135_),
    .B(_1139_),
    .Y(_0129_)
);

sky130_fd_sc_hd__inv_8 _3053_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN3[30] ),
    .Y(_1140_)
);

sky130_fd_sc_hd__o21a_4 _3054_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1140_),
    .A2(_1137_),
    .B1(_0478_),
    .X(_1141_)
);

sky130_fd_sc_hd__o22a_4 _3055_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1020_),
    .A2(_1141_),
    .B1(_1140_),
    .B2(_1026_),
    .X(_1142_)
);

sky130_fd_sc_hd__nor2_4 _3056_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1135_),
    .B(_1142_),
    .Y(_0131_)
);

sky130_fd_sc_hd__and2_4 _3057_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN3[31] ),
    .B(_1024_),
    .X(_1143_)
);

sky130_fd_sc_hd__inv_8 _3058_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN3[31] ),
    .Y(_1144_)
);

sky130_fd_sc_hd__or2_4 _3059_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1019_),
    .B(_0486_),
    .X(_1145_)
);

sky130_fd_sc_hd__a21oi_4 _3060_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1144_),
    .A2(_1717_),
    .B1(_1145_),
    .Y(_1146_)
);

sky130_fd_sc_hd__nor3_4 _3061_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0482_),
    .B(_1143_),
    .C(_1146_),
    .Y(_1147_)
);

sky130_fd_sc_hd__a21o_4 _3062_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1144_),
    .A2(_1715_),
    .B1(_0491_),
    .X(_1148_)
);

sky130_fd_sc_hd__nor2_4 _3063_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1147_),
    .B(_1148_),
    .Y(_0132_)
);

sky130_fd_sc_hd__buf_1 _3064_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1443_),
    .X(_1149_)
);

sky130_fd_sc_hd__buf_1 _3065_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1149_),
    .X(_1150_)
);

sky130_fd_sc_hd__inv_8 _3066_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN2[0] ),
    .Y(_1151_)
);

sky130_fd_sc_hd__o21a_4 _3067_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1151_),
    .A2(_1137_),
    .B1(_1753_),
    .X(_1152_)
);

sky130_fd_sc_hd__or3_4 _3068_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1436_),
    .B(_1440_),
    .C(_1414_),
    .X(_1153_)
);

sky130_fd_sc_hd__nor2_4 _3069_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1725_),
    .B(_1153_),
    .Y(_1154_)
);

sky130_fd_sc_hd__buf_1 _3070_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1154_),
    .X(_1155_)
);

sky130_fd_sc_hd__buf_1 _3071_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1155_),
    .X(_1156_)
);

sky130_fd_sc_hd__o22a_4 _3072_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1150_),
    .A2(_1152_),
    .B1(_1151_),
    .B2(_1156_),
    .X(_1157_)
);

sky130_fd_sc_hd__nor2_4 _3073_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1135_),
    .B(_1157_),
    .Y(_0076_)
);

sky130_fd_sc_hd__inv_8 _3074_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN2[1] ),
    .Y(_1158_)
);

sky130_fd_sc_hd__o21a_4 _3075_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1158_),
    .A2(_1137_),
    .B1(_0304_),
    .X(_1159_)
);

sky130_fd_sc_hd__o22a_4 _3076_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1150_),
    .A2(_1159_),
    .B1(_1158_),
    .B2(_1156_),
    .X(_1160_)
);

sky130_fd_sc_hd__nor2_4 _3077_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1135_),
    .B(_1160_),
    .Y(_0087_)
);

sky130_fd_sc_hd__inv_8 _3078_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN2[2] ),
    .Y(_1161_)
);

sky130_fd_sc_hd__o21a_4 _3079_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1161_),
    .A2(_1137_),
    .B1(_0309_),
    .X(_1162_)
);

sky130_fd_sc_hd__o22a_4 _3080_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1150_),
    .A2(_1162_),
    .B1(_1161_),
    .B2(_1156_),
    .X(_1163_)
);

sky130_fd_sc_hd__nor2_4 _3081_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1135_),
    .B(_1163_),
    .Y(_0098_)
);

sky130_fd_sc_hd__buf_1 _3082_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1698_),
    .X(_1164_)
);

sky130_fd_sc_hd__buf_1 _3083_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1164_),
    .X(_1165_)
);

sky130_fd_sc_hd__inv_8 _3084_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN2[3] ),
    .Y(_1166_)
);

sky130_fd_sc_hd__buf_1 _3085_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1098_),
    .X(_1167_)
);

sky130_fd_sc_hd__o21a_4 _3086_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1166_),
    .A2(_1167_),
    .B1(_0315_),
    .X(_1168_)
);

sky130_fd_sc_hd__o22a_4 _3087_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1150_),
    .A2(_1168_),
    .B1(_1166_),
    .B2(_1156_),
    .X(_1169_)
);

sky130_fd_sc_hd__nor2_4 _3088_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1165_),
    .B(_1169_),
    .Y(_0101_)
);

sky130_fd_sc_hd__inv_8 _3089_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN2[4] ),
    .Y(_1170_)
);

sky130_fd_sc_hd__o21a_4 _3090_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1170_),
    .A2(_1167_),
    .B1(_0320_),
    .X(_1171_)
);

sky130_fd_sc_hd__o22a_4 _3091_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1150_),
    .A2(_1171_),
    .B1(_1170_),
    .B2(_1156_),
    .X(_1172_)
);

sky130_fd_sc_hd__nor2_4 _3092_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1165_),
    .B(_1172_),
    .Y(_0102_)
);

sky130_fd_sc_hd__buf_1 _3093_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1149_),
    .X(_1173_)
);

sky130_fd_sc_hd__inv_8 _3094_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN2[5] ),
    .Y(_1174_)
);

sky130_fd_sc_hd__o21a_4 _3095_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1174_),
    .A2(_1167_),
    .B1(_0327_),
    .X(_1175_)
);

sky130_fd_sc_hd__buf_1 _3096_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1155_),
    .X(_1176_)
);

sky130_fd_sc_hd__o22a_4 _3097_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1173_),
    .A2(_1175_),
    .B1(_1174_),
    .B2(_1176_),
    .X(_1177_)
);

sky130_fd_sc_hd__nor2_4 _3098_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1165_),
    .B(_1177_),
    .Y(_0103_)
);

sky130_fd_sc_hd__inv_8 _3099_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN2[6] ),
    .Y(_1178_)
);

sky130_fd_sc_hd__o21a_4 _3100_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1178_),
    .A2(_1167_),
    .B1(_0334_),
    .X(_1179_)
);

sky130_fd_sc_hd__o22a_4 _3101_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1173_),
    .A2(_1179_),
    .B1(_1178_),
    .B2(_1176_),
    .X(_1180_)
);

sky130_fd_sc_hd__nor2_4 _3102_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1165_),
    .B(_1180_),
    .Y(_0104_)
);

sky130_fd_sc_hd__inv_8 _3103_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN2[7] ),
    .Y(_1181_)
);

sky130_fd_sc_hd__o21a_4 _3104_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1181_),
    .A2(_1167_),
    .B1(_0339_),
    .X(_1182_)
);

sky130_fd_sc_hd__o22a_4 _3105_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1173_),
    .A2(_1182_),
    .B1(_1181_),
    .B2(_1176_),
    .X(_1183_)
);

sky130_fd_sc_hd__nor2_4 _3106_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1165_),
    .B(_1183_),
    .Y(_0105_)
);

sky130_fd_sc_hd__buf_1 _3107_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1164_),
    .X(_1184_)
);

sky130_fd_sc_hd__inv_8 _3108_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN2[8] ),
    .Y(_1185_)
);

sky130_fd_sc_hd__buf_1 _3109_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1098_),
    .X(_1186_)
);

sky130_fd_sc_hd__o21a_4 _3110_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1185_),
    .A2(_1186_),
    .B1(_0345_),
    .X(_1187_)
);

sky130_fd_sc_hd__o22a_4 _3111_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1173_),
    .A2(_1187_),
    .B1(_1185_),
    .B2(_1176_),
    .X(_1188_)
);

sky130_fd_sc_hd__nor2_4 _3112_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1184_),
    .B(_1188_),
    .Y(_0106_)
);

sky130_fd_sc_hd__inv_8 _3113_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN2[9] ),
    .Y(_1189_)
);

sky130_fd_sc_hd__o21a_4 _3114_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1189_),
    .A2(_1186_),
    .B1(_0350_),
    .X(_1190_)
);

sky130_fd_sc_hd__o22a_4 _3115_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1173_),
    .A2(_1190_),
    .B1(_1189_),
    .B2(_1176_),
    .X(_1191_)
);

sky130_fd_sc_hd__nor2_4 _3116_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1184_),
    .B(_1191_),
    .Y(_0107_)
);

sky130_fd_sc_hd__buf_1 _3117_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1149_),
    .X(_1192_)
);

sky130_fd_sc_hd__inv_8 _3118_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN2[10] ),
    .Y(_1193_)
);

sky130_fd_sc_hd__o21a_4 _3119_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1193_),
    .A2(_1186_),
    .B1(_0357_),
    .X(_1194_)
);

sky130_fd_sc_hd__buf_1 _3120_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1155_),
    .X(_1195_)
);

sky130_fd_sc_hd__o22a_4 _3121_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1192_),
    .A2(_1194_),
    .B1(_1193_),
    .B2(_1195_),
    .X(_1196_)
);

sky130_fd_sc_hd__nor2_4 _3122_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1184_),
    .B(_1196_),
    .Y(_0077_)
);

sky130_fd_sc_hd__inv_8 _3123_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN2[11] ),
    .Y(_1197_)
);

sky130_fd_sc_hd__o21a_4 _3124_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1197_),
    .A2(_1186_),
    .B1(_0364_),
    .X(_1198_)
);

sky130_fd_sc_hd__o22a_4 _3125_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1192_),
    .A2(_1198_),
    .B1(_1197_),
    .B2(_1195_),
    .X(_1199_)
);

sky130_fd_sc_hd__nor2_4 _3126_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1184_),
    .B(_1199_),
    .Y(_0078_)
);

sky130_fd_sc_hd__inv_8 _3127_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN2[12] ),
    .Y(_1200_)
);

sky130_fd_sc_hd__o21a_4 _3128_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1200_),
    .A2(_1186_),
    .B1(_0369_),
    .X(_1201_)
);

sky130_fd_sc_hd__o22a_4 _3129_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1192_),
    .A2(_1201_),
    .B1(_1200_),
    .B2(_1195_),
    .X(_1202_)
);

sky130_fd_sc_hd__nor2_4 _3130_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1184_),
    .B(_1202_),
    .Y(_0079_)
);

sky130_fd_sc_hd__buf_1 _3131_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1164_),
    .X(_1203_)
);

sky130_fd_sc_hd__inv_8 _3132_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN2[13] ),
    .Y(_1204_)
);

sky130_fd_sc_hd__buf_1 _3133_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1429_),
    .X(_1205_)
);

sky130_fd_sc_hd__buf_1 _3134_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1205_),
    .X(_1206_)
);

sky130_fd_sc_hd__o21a_4 _3135_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1204_),
    .A2(_1206_),
    .B1(_0375_),
    .X(_1207_)
);

sky130_fd_sc_hd__o22a_4 _3136_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1192_),
    .A2(_1207_),
    .B1(_1204_),
    .B2(_1195_),
    .X(_1208_)
);

sky130_fd_sc_hd__nor2_4 _3137_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1203_),
    .B(_1208_),
    .Y(_0080_)
);

sky130_fd_sc_hd__inv_8 _3138_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN2[14] ),
    .Y(_1209_)
);

sky130_fd_sc_hd__o21a_4 _3139_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1209_),
    .A2(_1206_),
    .B1(_0380_),
    .X(_1210_)
);

sky130_fd_sc_hd__o22a_4 _3140_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1192_),
    .A2(_1210_),
    .B1(_1209_),
    .B2(_1195_),
    .X(_1211_)
);

sky130_fd_sc_hd__nor2_4 _3141_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1203_),
    .B(_1211_),
    .Y(_0081_)
);

sky130_fd_sc_hd__buf_1 _3142_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1149_),
    .X(_1212_)
);

sky130_fd_sc_hd__inv_8 _3143_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN2[15] ),
    .Y(_1213_)
);

sky130_fd_sc_hd__o21a_4 _3144_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1213_),
    .A2(_1206_),
    .B1(_0389_),
    .X(_1214_)
);

sky130_fd_sc_hd__buf_1 _3145_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1155_),
    .X(_1215_)
);

sky130_fd_sc_hd__o22a_4 _3146_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1212_),
    .A2(_1214_),
    .B1(_1213_),
    .B2(_1215_),
    .X(_1216_)
);

sky130_fd_sc_hd__nor2_4 _3147_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1203_),
    .B(_1216_),
    .Y(_0082_)
);

sky130_fd_sc_hd__inv_8 _3148_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN2[16] ),
    .Y(_1217_)
);

sky130_fd_sc_hd__o21a_4 _3149_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1217_),
    .A2(_1206_),
    .B1(_0396_),
    .X(_1218_)
);

sky130_fd_sc_hd__o22a_4 _3150_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1212_),
    .A2(_1218_),
    .B1(_1217_),
    .B2(_1215_),
    .X(_1219_)
);

sky130_fd_sc_hd__nor2_4 _3151_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1203_),
    .B(_1219_),
    .Y(_0083_)
);

sky130_fd_sc_hd__inv_8 _3152_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN2[17] ),
    .Y(_1220_)
);

sky130_fd_sc_hd__o21a_4 _3153_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1220_),
    .A2(_1206_),
    .B1(_0401_),
    .X(_1221_)
);

sky130_fd_sc_hd__o22a_4 _3154_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1212_),
    .A2(_1221_),
    .B1(_1220_),
    .B2(_1215_),
    .X(_1222_)
);

sky130_fd_sc_hd__nor2_4 _3155_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1203_),
    .B(_1222_),
    .Y(_0084_)
);

sky130_fd_sc_hd__buf_1 _3156_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1164_),
    .X(_1223_)
);

sky130_fd_sc_hd__inv_8 _3157_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN2[18] ),
    .Y(_1224_)
);

sky130_fd_sc_hd__buf_1 _3158_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1205_),
    .X(_1225_)
);

sky130_fd_sc_hd__o21a_4 _3159_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1224_),
    .A2(_1225_),
    .B1(_0407_),
    .X(_1226_)
);

sky130_fd_sc_hd__o22a_4 _3160_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1212_),
    .A2(_1226_),
    .B1(_1224_),
    .B2(_1215_),
    .X(_1227_)
);

sky130_fd_sc_hd__nor2_4 _3161_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1223_),
    .B(_1227_),
    .Y(_0085_)
);

sky130_fd_sc_hd__inv_8 _3162_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN2[19] ),
    .Y(_1228_)
);

sky130_fd_sc_hd__o21a_4 _3163_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1228_),
    .A2(_1225_),
    .B1(_0412_),
    .X(_1229_)
);

sky130_fd_sc_hd__o22a_4 _3164_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1212_),
    .A2(_1229_),
    .B1(_1228_),
    .B2(_1215_),
    .X(_1230_)
);

sky130_fd_sc_hd__nor2_4 _3165_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1223_),
    .B(_1230_),
    .Y(_0086_)
);

sky130_fd_sc_hd__buf_1 _3166_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1443_),
    .X(_1231_)
);

sky130_fd_sc_hd__inv_8 _3167_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN2[20] ),
    .Y(_1232_)
);

sky130_fd_sc_hd__o21a_4 _3168_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1232_),
    .A2(_1225_),
    .B1(_0419_),
    .X(_1233_)
);

sky130_fd_sc_hd__buf_1 _3169_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1154_),
    .X(_1234_)
);

sky130_fd_sc_hd__o22a_4 _3170_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1231_),
    .A2(_1233_),
    .B1(_1232_),
    .B2(_1234_),
    .X(_1235_)
);

sky130_fd_sc_hd__nor2_4 _3171_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1223_),
    .B(_1235_),
    .Y(_0088_)
);

sky130_fd_sc_hd__inv_8 _3172_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN2[21] ),
    .Y(_1236_)
);

sky130_fd_sc_hd__o21a_4 _3173_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1236_),
    .A2(_1225_),
    .B1(_0427_),
    .X(_1237_)
);

sky130_fd_sc_hd__o22a_4 _3174_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1231_),
    .A2(_1237_),
    .B1(_1236_),
    .B2(_1234_),
    .X(_1238_)
);

sky130_fd_sc_hd__nor2_4 _3175_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1223_),
    .B(_1238_),
    .Y(_0089_)
);

sky130_fd_sc_hd__inv_8 _3176_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN2[22] ),
    .Y(_1239_)
);

sky130_fd_sc_hd__o21a_4 _3177_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1239_),
    .A2(_1225_),
    .B1(_0432_),
    .X(_1240_)
);

sky130_fd_sc_hd__o22a_4 _3178_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1231_),
    .A2(_1240_),
    .B1(_1239_),
    .B2(_1234_),
    .X(_1241_)
);

sky130_fd_sc_hd__nor2_4 _3179_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1223_),
    .B(_1241_),
    .Y(_0090_)
);

sky130_fd_sc_hd__buf_1 _3180_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1164_),
    .X(_1242_)
);

sky130_fd_sc_hd__inv_8 _3181_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN2[23] ),
    .Y(_1243_)
);

sky130_fd_sc_hd__buf_1 _3182_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1205_),
    .X(_1244_)
);

sky130_fd_sc_hd__o21a_4 _3183_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1243_),
    .A2(_1244_),
    .B1(_0438_),
    .X(_1245_)
);

sky130_fd_sc_hd__o22a_4 _3184_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1231_),
    .A2(_1245_),
    .B1(_1243_),
    .B2(_1234_),
    .X(_1246_)
);

sky130_fd_sc_hd__nor2_4 _3185_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1242_),
    .B(_1246_),
    .Y(_0091_)
);

sky130_fd_sc_hd__inv_8 _3186_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN2[24] ),
    .Y(_1247_)
);

sky130_fd_sc_hd__o21a_4 _3187_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1247_),
    .A2(_1244_),
    .B1(_0443_),
    .X(_1248_)
);

sky130_fd_sc_hd__o22a_4 _3188_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1231_),
    .A2(_1248_),
    .B1(_1247_),
    .B2(_1234_),
    .X(_1249_)
);

sky130_fd_sc_hd__nor2_4 _3189_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1242_),
    .B(_1249_),
    .Y(_0092_)
);

sky130_fd_sc_hd__buf_1 _3190_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1443_),
    .X(_1250_)
);

sky130_fd_sc_hd__inv_8 _3191_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN2[25] ),
    .Y(_1251_)
);

sky130_fd_sc_hd__o21a_4 _3192_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1251_),
    .A2(_1244_),
    .B1(_0450_),
    .X(_1252_)
);

sky130_fd_sc_hd__buf_1 _3193_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1154_),
    .X(_1253_)
);

sky130_fd_sc_hd__o22a_4 _3194_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1250_),
    .A2(_1252_),
    .B1(_1251_),
    .B2(_1253_),
    .X(_1254_)
);

sky130_fd_sc_hd__nor2_4 _3195_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1242_),
    .B(_1254_),
    .Y(_0093_)
);

sky130_fd_sc_hd__inv_8 _3196_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN2[26] ),
    .Y(_1255_)
);

sky130_fd_sc_hd__o21a_4 _3197_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1255_),
    .A2(_1244_),
    .B1(_0457_),
    .X(_1256_)
);

sky130_fd_sc_hd__o22a_4 _3198_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1250_),
    .A2(_1256_),
    .B1(_1255_),
    .B2(_1253_),
    .X(_1257_)
);

sky130_fd_sc_hd__nor2_4 _3199_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1242_),
    .B(_1257_),
    .Y(_0094_)
);

sky130_fd_sc_hd__inv_8 _3200_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN2[27] ),
    .Y(_1258_)
);

sky130_fd_sc_hd__o21a_4 _3201_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1258_),
    .A2(_1244_),
    .B1(_0462_),
    .X(_1259_)
);

sky130_fd_sc_hd__o22a_4 _3202_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1250_),
    .A2(_1259_),
    .B1(_1258_),
    .B2(_1253_),
    .X(_1260_)
);

sky130_fd_sc_hd__nor2_4 _3203_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1242_),
    .B(_1260_),
    .Y(_0095_)
);

sky130_fd_sc_hd__buf_1 _3204_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1698_),
    .X(_1261_)
);

sky130_fd_sc_hd__buf_1 _3205_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1261_),
    .X(_1262_)
);

sky130_fd_sc_hd__inv_8 _3206_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN2[28] ),
    .Y(_1263_)
);

sky130_fd_sc_hd__buf_1 _3207_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1205_),
    .X(_1264_)
);

sky130_fd_sc_hd__o21a_4 _3208_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1263_),
    .A2(_1264_),
    .B1(_0467_),
    .X(_1265_)
);

sky130_fd_sc_hd__o22a_4 _3209_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1250_),
    .A2(_1265_),
    .B1(_1263_),
    .B2(_1253_),
    .X(_1266_)
);

sky130_fd_sc_hd__nor2_4 _3210_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1262_),
    .B(_1266_),
    .Y(_0096_)
);

sky130_fd_sc_hd__inv_8 _3211_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN2[29] ),
    .Y(_1267_)
);

sky130_fd_sc_hd__o21a_4 _3212_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1267_),
    .A2(_1264_),
    .B1(_0472_),
    .X(_1268_)
);

sky130_fd_sc_hd__o22a_4 _3213_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1250_),
    .A2(_1268_),
    .B1(_1267_),
    .B2(_1253_),
    .X(_1269_)
);

sky130_fd_sc_hd__nor2_4 _3214_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1262_),
    .B(_1269_),
    .Y(_0097_)
);

sky130_fd_sc_hd__inv_8 _3215_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN2[30] ),
    .Y(_1270_)
);

sky130_fd_sc_hd__o21a_4 _3216_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1270_),
    .A2(_1264_),
    .B1(_0478_),
    .X(_1271_)
);

sky130_fd_sc_hd__o22a_4 _3217_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1149_),
    .A2(_1271_),
    .B1(_1270_),
    .B2(_1155_),
    .X(_1272_)
);

sky130_fd_sc_hd__nor2_4 _3218_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1262_),
    .B(_1272_),
    .Y(_0099_)
);

sky130_fd_sc_hd__and2_4 _3219_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN2[31] ),
    .B(_1153_),
    .X(_1273_)
);

sky130_fd_sc_hd__inv_8 _3220_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN2[31] ),
    .Y(_1274_)
);

sky130_fd_sc_hd__or2_4 _3221_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1443_),
    .B(_0486_),
    .X(_1275_)
);

sky130_fd_sc_hd__a21oi_4 _3222_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1274_),
    .A2(_1717_),
    .B1(_1275_),
    .Y(_1276_)
);

sky130_fd_sc_hd__nor3_4 _3223_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0490_),
    .B(_1273_),
    .C(_1276_),
    .Y(_1277_)
);

sky130_fd_sc_hd__a21o_4 _3224_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1274_),
    .A2(_1715_),
    .B1(_1746_),
    .X(_1278_)
);

sky130_fd_sc_hd__nor2_4 _3225_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1277_),
    .B(_1278_),
    .Y(_0100_)
);

sky130_fd_sc_hd__buf_1 _3226_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1439_),
    .X(_1279_)
);

sky130_fd_sc_hd__buf_1 _3227_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1279_),
    .X(_1280_)
);

sky130_fd_sc_hd__inv_8 _3228_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN1[0] ),
    .Y(_1281_)
);

sky130_fd_sc_hd__o21a_4 _3229_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1281_),
    .A2(_1264_),
    .B1(_1753_),
    .X(_1282_)
);

sky130_fd_sc_hd__or3_4 _3230_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1414_),
    .B(_1436_),
    .C(_1444_),
    .X(_1283_)
);

sky130_fd_sc_hd__nor2_4 _3231_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1725_),
    .B(_1283_),
    .Y(_1284_)
);

sky130_fd_sc_hd__buf_1 _3232_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1284_),
    .X(_1285_)
);

sky130_fd_sc_hd__buf_1 _3233_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1285_),
    .X(_1286_)
);

sky130_fd_sc_hd__o22a_4 _3234_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1280_),
    .A2(_1282_),
    .B1(_1281_),
    .B2(_1286_),
    .X(_1287_)
);

sky130_fd_sc_hd__nor2_4 _3235_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1262_),
    .B(_1287_),
    .Y(_0044_)
);

sky130_fd_sc_hd__inv_8 _3236_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN1[1] ),
    .Y(_1288_)
);

sky130_fd_sc_hd__o21a_4 _3237_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1288_),
    .A2(_1264_),
    .B1(_0304_),
    .X(_1289_)
);

sky130_fd_sc_hd__o22a_4 _3238_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1280_),
    .A2(_1289_),
    .B1(_1288_),
    .B2(_1286_),
    .X(_1290_)
);

sky130_fd_sc_hd__nor2_4 _3239_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1262_),
    .B(_1290_),
    .Y(_0055_)
);

sky130_fd_sc_hd__buf_1 _3240_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1261_),
    .X(_1291_)
);

sky130_fd_sc_hd__inv_8 _3241_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN1[2] ),
    .Y(_1292_)
);

sky130_fd_sc_hd__buf_1 _3242_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1205_),
    .X(_1293_)
);

sky130_fd_sc_hd__o21a_4 _3243_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1292_),
    .A2(_1293_),
    .B1(_0309_),
    .X(_1294_)
);

sky130_fd_sc_hd__o22a_4 _3244_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1280_),
    .A2(_1294_),
    .B1(_1292_),
    .B2(_1286_),
    .X(_1295_)
);

sky130_fd_sc_hd__nor2_4 _3245_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1291_),
    .B(_1295_),
    .Y(_0066_)
);

sky130_fd_sc_hd__inv_8 _3246_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN1[3] ),
    .Y(_1296_)
);

sky130_fd_sc_hd__o21a_4 _3247_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1296_),
    .A2(_1293_),
    .B1(_0315_),
    .X(_1297_)
);

sky130_fd_sc_hd__o22a_4 _3248_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1280_),
    .A2(_1297_),
    .B1(_1296_),
    .B2(_1286_),
    .X(_1298_)
);

sky130_fd_sc_hd__nor2_4 _3249_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1291_),
    .B(_1298_),
    .Y(_0069_)
);

sky130_fd_sc_hd__inv_8 _3250_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN1[4] ),
    .Y(_1299_)
);

sky130_fd_sc_hd__o21a_4 _3251_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1299_),
    .A2(_1293_),
    .B1(_0320_),
    .X(_1300_)
);

sky130_fd_sc_hd__o22a_4 _3252_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1280_),
    .A2(_1300_),
    .B1(_1299_),
    .B2(_1286_),
    .X(_1301_)
);

sky130_fd_sc_hd__nor2_4 _3253_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1291_),
    .B(_1301_),
    .Y(_0070_)
);

sky130_fd_sc_hd__buf_1 _3254_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1279_),
    .X(_1302_)
);

sky130_fd_sc_hd__inv_8 _3255_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN1[5] ),
    .Y(_1303_)
);

sky130_fd_sc_hd__o21a_4 _3256_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1303_),
    .A2(_1293_),
    .B1(_0327_),
    .X(_1304_)
);

sky130_fd_sc_hd__buf_1 _3257_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1285_),
    .X(_1305_)
);

sky130_fd_sc_hd__o22a_4 _3258_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1302_),
    .A2(_1304_),
    .B1(_1303_),
    .B2(_1305_),
    .X(_1306_)
);

sky130_fd_sc_hd__nor2_4 _3259_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1291_),
    .B(_1306_),
    .Y(_0071_)
);

sky130_fd_sc_hd__inv_8 _3260_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN1[6] ),
    .Y(_1307_)
);

sky130_fd_sc_hd__o21a_4 _3261_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1307_),
    .A2(_1293_),
    .B1(_0334_),
    .X(_1308_)
);

sky130_fd_sc_hd__o22a_4 _3262_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1302_),
    .A2(_1308_),
    .B1(_1307_),
    .B2(_1305_),
    .X(_1309_)
);

sky130_fd_sc_hd__nor2_4 _3263_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1291_),
    .B(_1309_),
    .Y(_0072_)
);

sky130_fd_sc_hd__buf_1 _3264_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1261_),
    .X(_1310_)
);

sky130_fd_sc_hd__inv_8 _3265_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN1[7] ),
    .Y(_1311_)
);

sky130_fd_sc_hd__buf_1 _3266_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1749_),
    .X(_1312_)
);

sky130_fd_sc_hd__o21a_4 _3267_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1311_),
    .A2(_1312_),
    .B1(_0339_),
    .X(_1313_)
);

sky130_fd_sc_hd__o22a_4 _3268_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1302_),
    .A2(_1313_),
    .B1(_1311_),
    .B2(_1305_),
    .X(_1314_)
);

sky130_fd_sc_hd__nor2_4 _3269_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1310_),
    .B(_1314_),
    .Y(_0073_)
);

sky130_fd_sc_hd__inv_8 _3270_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN1[8] ),
    .Y(_1315_)
);

sky130_fd_sc_hd__o21a_4 _3271_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1315_),
    .A2(_1312_),
    .B1(_0345_),
    .X(_1316_)
);

sky130_fd_sc_hd__o22a_4 _3272_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1302_),
    .A2(_1316_),
    .B1(_1315_),
    .B2(_1305_),
    .X(_1317_)
);

sky130_fd_sc_hd__nor2_4 _3273_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1310_),
    .B(_1317_),
    .Y(_0074_)
);

sky130_fd_sc_hd__inv_8 _3274_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN1[9] ),
    .Y(_1318_)
);

sky130_fd_sc_hd__o21a_4 _3275_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1318_),
    .A2(_1312_),
    .B1(_0350_),
    .X(_1319_)
);

sky130_fd_sc_hd__o22a_4 _3276_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1302_),
    .A2(_1319_),
    .B1(_1318_),
    .B2(_1305_),
    .X(_1320_)
);

sky130_fd_sc_hd__nor2_4 _3277_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1310_),
    .B(_1320_),
    .Y(_0075_)
);

sky130_fd_sc_hd__buf_1 _3278_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1279_),
    .X(_1321_)
);

sky130_fd_sc_hd__inv_8 _3279_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN1[10] ),
    .Y(_1322_)
);

sky130_fd_sc_hd__o21a_4 _3280_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1322_),
    .A2(_1312_),
    .B1(_0357_),
    .X(_1323_)
);

sky130_fd_sc_hd__buf_1 _3281_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1285_),
    .X(_1324_)
);

sky130_fd_sc_hd__o22a_4 _3282_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1321_),
    .A2(_1323_),
    .B1(_1322_),
    .B2(_1324_),
    .X(_1325_)
);

sky130_fd_sc_hd__nor2_4 _3283_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1310_),
    .B(_1325_),
    .Y(_0045_)
);

sky130_fd_sc_hd__inv_8 _3284_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN1[11] ),
    .Y(_1326_)
);

sky130_fd_sc_hd__o21a_4 _3285_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1326_),
    .A2(_1312_),
    .B1(_0364_),
    .X(_1327_)
);

sky130_fd_sc_hd__o22a_4 _3286_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1321_),
    .A2(_1327_),
    .B1(_1326_),
    .B2(_1324_),
    .X(_1328_)
);

sky130_fd_sc_hd__nor2_4 _3287_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1310_),
    .B(_1328_),
    .Y(_0046_)
);

sky130_fd_sc_hd__buf_1 _3288_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1261_),
    .X(_1329_)
);

sky130_fd_sc_hd__inv_8 _3289_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN1[12] ),
    .Y(_1330_)
);

sky130_fd_sc_hd__buf_1 _3290_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1749_),
    .X(_1331_)
);

sky130_fd_sc_hd__o21a_4 _3291_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1330_),
    .A2(_1331_),
    .B1(_0369_),
    .X(_1332_)
);

sky130_fd_sc_hd__o22a_4 _3292_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1321_),
    .A2(_1332_),
    .B1(_1330_),
    .B2(_1324_),
    .X(_1333_)
);

sky130_fd_sc_hd__nor2_4 _3293_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1329_),
    .B(_1333_),
    .Y(_0047_)
);

sky130_fd_sc_hd__inv_8 _3294_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN1[13] ),
    .Y(_1334_)
);

sky130_fd_sc_hd__o21a_4 _3295_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1334_),
    .A2(_1331_),
    .B1(_0375_),
    .X(_1335_)
);

sky130_fd_sc_hd__o22a_4 _3296_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1321_),
    .A2(_1335_),
    .B1(_1334_),
    .B2(_1324_),
    .X(_1336_)
);

sky130_fd_sc_hd__nor2_4 _3297_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1329_),
    .B(_1336_),
    .Y(_0048_)
);

sky130_fd_sc_hd__inv_8 _3298_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN1[14] ),
    .Y(_1337_)
);

sky130_fd_sc_hd__o21a_4 _3299_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1337_),
    .A2(_1331_),
    .B1(_0380_),
    .X(_1338_)
);

sky130_fd_sc_hd__o22a_4 _3300_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1321_),
    .A2(_1338_),
    .B1(_1337_),
    .B2(_1324_),
    .X(_1339_)
);

sky130_fd_sc_hd__nor2_4 _3301_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1329_),
    .B(_1339_),
    .Y(_0049_)
);

sky130_fd_sc_hd__buf_1 _3302_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1279_),
    .X(_1340_)
);

sky130_fd_sc_hd__inv_8 _3303_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN1[15] ),
    .Y(_1341_)
);

sky130_fd_sc_hd__o21a_4 _3304_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1341_),
    .A2(_1331_),
    .B1(_0389_),
    .X(_1342_)
);

sky130_fd_sc_hd__buf_1 _3305_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1285_),
    .X(_1343_)
);

sky130_fd_sc_hd__o22a_4 _3306_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1340_),
    .A2(_1342_),
    .B1(_1341_),
    .B2(_1343_),
    .X(_1344_)
);

sky130_fd_sc_hd__nor2_4 _3307_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1329_),
    .B(_1344_),
    .Y(_0050_)
);

sky130_fd_sc_hd__inv_8 _3308_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN1[16] ),
    .Y(_1345_)
);

sky130_fd_sc_hd__o21a_4 _3309_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1345_),
    .A2(_1331_),
    .B1(_0396_),
    .X(_1346_)
);

sky130_fd_sc_hd__o22a_4 _3310_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1340_),
    .A2(_1346_),
    .B1(_1345_),
    .B2(_1343_),
    .X(_1347_)
);

sky130_fd_sc_hd__nor2_4 _3311_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1329_),
    .B(_1347_),
    .Y(_0051_)
);

sky130_fd_sc_hd__buf_1 _3312_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1261_),
    .X(_1348_)
);

sky130_fd_sc_hd__inv_8 _3313_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN1[17] ),
    .Y(_1349_)
);

sky130_fd_sc_hd__buf_1 _3314_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1749_),
    .X(_1350_)
);

sky130_fd_sc_hd__o21a_4 _3315_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1349_),
    .A2(_1350_),
    .B1(_0401_),
    .X(_1351_)
);

sky130_fd_sc_hd__o22a_4 _3316_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1340_),
    .A2(_1351_),
    .B1(_1349_),
    .B2(_1343_),
    .X(_1352_)
);

sky130_fd_sc_hd__nor2_4 _3317_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1348_),
    .B(_1352_),
    .Y(_0052_)
);

sky130_fd_sc_hd__inv_8 _3318_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN1[18] ),
    .Y(_1353_)
);

sky130_fd_sc_hd__o21a_4 _3319_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1353_),
    .A2(_1350_),
    .B1(_0407_),
    .X(_1354_)
);

sky130_fd_sc_hd__o22a_4 _3320_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1340_),
    .A2(_1354_),
    .B1(_1353_),
    .B2(_1343_),
    .X(_1355_)
);

sky130_fd_sc_hd__nor2_4 _3321_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1348_),
    .B(_1355_),
    .Y(_0053_)
);

sky130_fd_sc_hd__inv_8 _3322_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN1[19] ),
    .Y(_1356_)
);

sky130_fd_sc_hd__o21a_4 _3323_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1356_),
    .A2(_1350_),
    .B1(_0412_),
    .X(_1357_)
);

sky130_fd_sc_hd__o22a_4 _3324_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1340_),
    .A2(_1357_),
    .B1(_1356_),
    .B2(_1343_),
    .X(_1358_)
);

sky130_fd_sc_hd__nor2_4 _3325_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1348_),
    .B(_1358_),
    .Y(_0054_)
);

sky130_fd_sc_hd__buf_1 _3326_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1439_),
    .X(_1359_)
);

sky130_fd_sc_hd__inv_8 _3327_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN1[20] ),
    .Y(_1360_)
);

sky130_fd_sc_hd__o21a_4 _3328_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1360_),
    .A2(_1350_),
    .B1(_0419_),
    .X(_1361_)
);

sky130_fd_sc_hd__buf_1 _3329_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1284_),
    .X(_1362_)
);

sky130_fd_sc_hd__o22a_4 _3330_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1359_),
    .A2(_1361_),
    .B1(_1360_),
    .B2(_1362_),
    .X(_1363_)
);

sky130_fd_sc_hd__nor2_4 _3331_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1348_),
    .B(_1363_),
    .Y(_0056_)
);

sky130_fd_sc_hd__inv_8 _3332_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN1[21] ),
    .Y(_1364_)
);

sky130_fd_sc_hd__o21a_4 _3333_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1364_),
    .A2(_1350_),
    .B1(_0427_),
    .X(_1365_)
);

sky130_fd_sc_hd__o22a_4 _3334_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1359_),
    .A2(_1365_),
    .B1(_1364_),
    .B2(_1362_),
    .X(_1366_)
);

sky130_fd_sc_hd__nor2_4 _3335_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1348_),
    .B(_1366_),
    .Y(_0057_)
);

sky130_fd_sc_hd__buf_1 _3336_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1699_),
    .X(_1367_)
);

sky130_fd_sc_hd__inv_8 _3337_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN1[22] ),
    .Y(_1368_)
);

sky130_fd_sc_hd__buf_1 _3338_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1749_),
    .X(_1369_)
);

sky130_fd_sc_hd__o21a_4 _3339_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1368_),
    .A2(_1369_),
    .B1(_0432_),
    .X(_1370_)
);

sky130_fd_sc_hd__o22a_4 _3340_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1359_),
    .A2(_1370_),
    .B1(_1368_),
    .B2(_1362_),
    .X(_1371_)
);

sky130_fd_sc_hd__nor2_4 _3341_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1367_),
    .B(_1371_),
    .Y(_0058_)
);

sky130_fd_sc_hd__inv_8 _3342_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN1[23] ),
    .Y(_1372_)
);

sky130_fd_sc_hd__o21a_4 _3343_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1372_),
    .A2(_1369_),
    .B1(_0438_),
    .X(_1373_)
);

sky130_fd_sc_hd__o22a_4 _3344_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1359_),
    .A2(_1373_),
    .B1(_1372_),
    .B2(_1362_),
    .X(_1374_)
);

sky130_fd_sc_hd__nor2_4 _3345_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1367_),
    .B(_1374_),
    .Y(_0059_)
);

sky130_fd_sc_hd__inv_8 _3346_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN1[24] ),
    .Y(_1375_)
);

sky130_fd_sc_hd__o21a_4 _3347_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1375_),
    .A2(_1369_),
    .B1(_0443_),
    .X(_1376_)
);

sky130_fd_sc_hd__o22a_4 _3348_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1359_),
    .A2(_1376_),
    .B1(_1375_),
    .B2(_1362_),
    .X(_1377_)
);

sky130_fd_sc_hd__nor2_4 _3349_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1367_),
    .B(_1377_),
    .Y(_0060_)
);

sky130_fd_sc_hd__buf_1 _3350_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1439_),
    .X(_1378_)
);

sky130_fd_sc_hd__inv_8 _3351_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN1[25] ),
    .Y(_1379_)
);

sky130_fd_sc_hd__o21a_4 _3352_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1379_),
    .A2(_1369_),
    .B1(_0450_),
    .X(_1380_)
);

sky130_fd_sc_hd__buf_1 _3353_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1284_),
    .X(_1381_)
);

sky130_fd_sc_hd__o22a_4 _3354_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1378_),
    .A2(_1380_),
    .B1(_1379_),
    .B2(_1381_),
    .X(_1382_)
);

sky130_fd_sc_hd__nor2_4 _3355_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1367_),
    .B(_1382_),
    .Y(_0061_)
);

sky130_fd_sc_hd__inv_8 _3356_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN1[26] ),
    .Y(_1383_)
);

sky130_fd_sc_hd__o21a_4 _3357_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1383_),
    .A2(_1369_),
    .B1(_0457_),
    .X(_1384_)
);

sky130_fd_sc_hd__o22a_4 _3358_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1378_),
    .A2(_1384_),
    .B1(_1383_),
    .B2(_1381_),
    .X(_1385_)
);

sky130_fd_sc_hd__nor2_4 _3359_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1367_),
    .B(_1385_),
    .Y(_0062_)
);

sky130_fd_sc_hd__inv_8 _3360_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN1[27] ),
    .Y(_1386_)
);

sky130_fd_sc_hd__o21a_4 _3361_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1386_),
    .A2(_1750_),
    .B1(_0462_),
    .X(_1387_)
);

sky130_fd_sc_hd__o22a_4 _3362_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1378_),
    .A2(_1387_),
    .B1(_1386_),
    .B2(_1381_),
    .X(_1388_)
);

sky130_fd_sc_hd__nor2_4 _3363_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1700_),
    .B(_1388_),
    .Y(_0063_)
);

sky130_fd_sc_hd__inv_8 _3364_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN1[28] ),
    .Y(_1389_)
);

sky130_fd_sc_hd__o21a_4 _3365_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1389_),
    .A2(_1750_),
    .B1(_0467_),
    .X(_1390_)
);

sky130_fd_sc_hd__o22a_4 _3366_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1378_),
    .A2(_1390_),
    .B1(_1389_),
    .B2(_1381_),
    .X(_1391_)
);

sky130_fd_sc_hd__nor2_4 _3367_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1700_),
    .B(_1391_),
    .Y(_0064_)
);

sky130_fd_sc_hd__inv_8 _3368_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN1[29] ),
    .Y(_1392_)
);

sky130_fd_sc_hd__o21a_4 _3369_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1392_),
    .A2(_1750_),
    .B1(_0472_),
    .X(_1393_)
);

sky130_fd_sc_hd__o22a_4 _3370_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1378_),
    .A2(_1393_),
    .B1(_1392_),
    .B2(_1381_),
    .X(_1394_)
);

sky130_fd_sc_hd__nor2_4 _3371_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1700_),
    .B(_1394_),
    .Y(_0065_)
);

sky130_fd_sc_hd__inv_8 _3372_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN1[30] ),
    .Y(_1395_)
);

sky130_fd_sc_hd__o21a_4 _3373_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1395_),
    .A2(_1750_),
    .B1(_0478_),
    .X(_1396_)
);

sky130_fd_sc_hd__o22a_4 _3374_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1279_),
    .A2(_1396_),
    .B1(_1395_),
    .B2(_1285_),
    .X(_1397_)
);

sky130_fd_sc_hd__nor2_4 _3375_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1700_),
    .B(_1397_),
    .Y(_0067_)
);

sky130_fd_sc_hd__and2_4 _3376_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN1[31] ),
    .B(_1283_),
    .X(_1398_)
);

sky130_fd_sc_hd__inv_8 _3377_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(\int_PAR_IN1[31] ),
    .Y(_1399_)
);

sky130_fd_sc_hd__or2_4 _3378_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1439_),
    .B(_0486_),
    .X(_1400_)
);

sky130_fd_sc_hd__a21oi_4 _3379_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1399_),
    .A2(_1717_),
    .B1(_1400_),
    .Y(_1401_)
);

sky130_fd_sc_hd__nor3_4 _3380_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_0490_),
    .B(_1398_),
    .C(_1401_),
    .Y(_1402_)
);

sky130_fd_sc_hd__a21o_4 _3381_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1399_),
    .A2(_1715_),
    .B1(_1746_),
    .X(_1403_)
);

sky130_fd_sc_hd__nor2_4 _3382_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1402_),
    .B(_1403_),
    .Y(_0068_)
);

sky130_fd_sc_hd__and2_4 _3383_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1696_),
    .B(_1712_),
    .X(_0032_)
);

sky130_fd_sc_hd__and2_4 _3384_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1689_),
    .B(_1757_),
    .X(_1404_)
);

sky130_fd_sc_hd__o21a_4 _3385_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1410_),
    .A2(_1721_),
    .B1(_1466_),
    .X(_1405_)
);

sky130_fd_sc_hd__nor3_4 _3386_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1695_),
    .B(_1404_),
    .C(_1405_),
    .Y(_0039_)
);

sky130_fd_sc_hd__or2_4 _3387_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(COMPLETE),
    .B(INTERNAL_FINISH),
    .X(_1406_)
);

sky130_fd_sc_hd__buf_1 _3388_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1406_),
    .X(_1407_)
);

sky130_fd_sc_hd__buf_1 _3389_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1407_),
    .X(_1408_)
);

sky130_fd_sc_hd__buf_1 _3390_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1408_),
    .X(_1409_)
);

sky130_fd_sc_hd__buf_1 _3391_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(COMPLETE),
    .X(_1410_)
);

sky130_fd_sc_hd__inv_8 _3392_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1410_),
    .Y(_1411_)
);

sky130_fd_sc_hd__inv_8 _3393_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(SAMPLE_COUNT[3]),
    .Y(_1412_)
);

sky130_fd_sc_hd__inv_8 _3394_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(SAMPLE_COUNT[2]),
    .Y(_1413_)
);

sky130_fd_sc_hd__and3_4 _3395_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1412_),
    .B(_1413_),
    .C(SAMPLE_COUNT[1]),
    .X(_1414_)
);

sky130_fd_sc_hd__and2_4 _3396_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(SAMPLE_COUNT[0]),
    .B(_1414_),
    .X(_1415_)
);

sky130_fd_sc_hd__inv_8 _3397_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1415_),
    .Y(_1416_)
);

sky130_fd_sc_hd__inv_8 _3398_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(OUT[0]),
    .Y(_1417_)
);

sky130_fd_sc_hd__a21o_4 _3399_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1411_),
    .A2(_1416_),
    .B1(_1417_),
    .X(_1418_)
);

sky130_fd_sc_hd__inv_8 _3400_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(COUNT[4]),
    .Y(_1419_)
);

sky130_fd_sc_hd__inv_8 _3401_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(COUNT[1]),
    .Y(_1420_)
);

sky130_fd_sc_hd__inv_8 _3402_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(COUNT[0]),
    .Y(_1421_)
);

sky130_fd_sc_hd__inv_8 _3403_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(COUNT[3]),
    .Y(_1422_)
);

sky130_fd_sc_hd__inv_8 _3404_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(COUNT[2]),
    .Y(_1423_)
);

sky130_fd_sc_hd__or4_4 _3405_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1420_),
    .B(_1421_),
    .C(_1422_),
    .D(_1423_),
    .X(_1424_)
);

sky130_fd_sc_hd__buf_1 _3406_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1424_),
    .X(_1425_)
);

sky130_fd_sc_hd__inv_8 _3407_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(COUNT[5]),
    .Y(_1426_)
);

sky130_fd_sc_hd__o21a_4 _3408_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1419_),
    .A2(_1425_),
    .B1(_1426_),
    .X(_1427_)
);

sky130_fd_sc_hd__inv_8 _3409_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1427_),
    .Y(_1428_)
);

sky130_fd_sc_hd__buf_1 _3410_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1428_),
    .X(_1429_)
);

sky130_fd_sc_hd__buf_1 _3411_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1429_),
    .X(_1430_)
);

sky130_fd_sc_hd__buf_1 _3412_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1430_),
    .X(_1431_)
);

sky130_fd_sc_hd__inv_8 _3413_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(SERIAL_IN),
    .Y(_1432_)
);

sky130_fd_sc_hd__buf_1 _3414_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1432_),
    .X(_1433_)
);

sky130_fd_sc_hd__or2_4 _3415_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1410_),
    .B(_1433_),
    .X(_1434_)
);

sky130_fd_sc_hd__buf_1 _3416_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(SAMPLE_COUNT[2]),
    .X(_1435_)
);

sky130_fd_sc_hd__and2_4 _3417_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1412_),
    .B(_1435_),
    .X(_1436_)
);

sky130_fd_sc_hd__buf_1 _3418_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(SAMPLE_COUNT[3]),
    .X(_1437_)
);

sky130_fd_sc_hd__or4_4 _3419_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1437_),
    .B(SAMPLE_COUNT[2]),
    .C(SAMPLE_COUNT[1]),
    .D(SAMPLE_COUNT[0]),
    .X(_1438_)
);

sky130_fd_sc_hd__buf_1 _3420_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1438_),
    .X(_1439_)
);

sky130_fd_sc_hd__inv_8 _3421_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1439_),
    .Y(_1440_)
);

sky130_fd_sc_hd__inv_8 _3422_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(SAMPLE_COUNT[0]),
    .Y(_1441_)
);

sky130_fd_sc_hd__or4_4 _3423_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1437_),
    .B(SAMPLE_COUNT[2]),
    .C(SAMPLE_COUNT[1]),
    .D(_1441_),
    .X(_1442_)
);

sky130_fd_sc_hd__buf_1 _3424_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1442_),
    .X(_1443_)
);

sky130_fd_sc_hd__inv_8 _3425_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1443_),
    .Y(_1444_)
);

sky130_fd_sc_hd__and2_4 _3426_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1441_),
    .B(_1414_),
    .X(_1445_)
);

sky130_fd_sc_hd__or4_4 _3427_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1436_),
    .B(_1440_),
    .C(_1444_),
    .D(_1445_),
    .X(_1446_)
);

sky130_fd_sc_hd__o21a_4 _3428_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(OUT[0]),
    .A2(_1430_),
    .B1(_1446_),
    .X(_1447_)
);

sky130_fd_sc_hd__a21bo_4 _3429_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1431_),
    .A2(_1434_),
    .B1_N(_1447_),
    .X(_1448_)
);

sky130_fd_sc_hd__inv_8 _3430_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1407_),
    .Y(_1449_)
);

sky130_fd_sc_hd__buf_1 _3431_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1449_),
    .X(_1450_)
);

sky130_fd_sc_hd__buf_1 _3432_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1450_),
    .X(_1451_)
);

sky130_fd_sc_hd__buf_1 _3433_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1437_),
    .X(_1452_)
);

sky130_fd_sc_hd__buf_1 _3434_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1452_),
    .X(_1453_)
);

sky130_fd_sc_hd__buf_1 _3435_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1453_),
    .X(_1454_)
);

sky130_fd_sc_hd__buf_1 _3436_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1454_),
    .X(_1455_)
);

sky130_fd_sc_hd__buf_1 _3437_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(COUNT[3]),
    .X(_1456_)
);

sky130_fd_sc_hd__or4_4 _3438_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(COUNT[1]),
    .B(COUNT[0]),
    .C(COUNT[2]),
    .D(_1456_),
    .X(_1457_)
);

sky130_fd_sc_hd__or2_4 _3439_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(COUNT[5]),
    .B(COUNT[4]),
    .X(_1458_)
);

sky130_fd_sc_hd__buf_1 _3440_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1458_),
    .X(_1459_)
);

sky130_fd_sc_hd__nor2_4 _3441_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1457_),
    .B(_1459_),
    .Y(_1460_)
);

sky130_fd_sc_hd__buf_1 _3442_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1459_),
    .X(_1461_)
);

sky130_fd_sc_hd__or2_4 _3443_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1432_),
    .B(_1457_),
    .X(_1462_)
);

sky130_fd_sc_hd__o22a_4 _3444_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1417_),
    .A2(_1460_),
    .B1(_1461_),
    .B2(_1462_),
    .X(_1463_)
);

sky130_fd_sc_hd__or2_4 _3445_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1455_),
    .B(_1463_),
    .X(_1464_)
);

sky130_fd_sc_hd__a32o_4 _3446_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1409_),
    .A2(_1418_),
    .A3(_1448_),
    .B1(_1451_),
    .B2(_1464_),
    .X(_1465_)
);

sky130_fd_sc_hd__inv_8 _3447_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(INTERNAL_FINISH),
    .Y(_1466_)
);

sky130_fd_sc_hd__or2_4 _3448_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1466_),
    .B(_1412_),
    .X(_1467_)
);

sky130_fd_sc_hd__buf_1 _3449_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1467_),
    .X(_1468_)
);

sky130_fd_sc_hd__inv_8 _3450_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1468_),
    .Y(_1469_)
);

sky130_fd_sc_hd__inv_8 _3451_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(READY),
    .Y(_1470_)
);

sky130_fd_sc_hd__a21o_4 _3452_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1417_),
    .A2(_1469_),
    .B1(_1470_),
    .X(_1471_)
);

sky130_fd_sc_hd__a21oi_4 _3453_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1465_),
    .A2(_1468_),
    .B1(_1471_),
    .Y(_0000_)
);

sky130_fd_sc_hd__buf_1 _3454_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1470_),
    .X(_1472_)
);

sky130_fd_sc_hd__buf_1 _3455_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1472_),
    .X(_1473_)
);

sky130_fd_sc_hd__buf_1 _3456_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1432_),
    .X(_1474_)
);

sky130_fd_sc_hd__buf_1 _3457_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(COUNT[1]),
    .X(_1475_)
);

sky130_fd_sc_hd__buf_1 _3458_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1421_),
    .X(_1476_)
);

sky130_fd_sc_hd__buf_1 _3459_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(COUNT[2]),
    .X(_1477_)
);

sky130_fd_sc_hd__or4_4 _3460_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1475_),
    .B(_1476_),
    .C(_1477_),
    .D(_1456_),
    .X(_1478_)
);

sky130_fd_sc_hd__or4_4 _3461_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1461_),
    .B(_1478_),
    .C(_1454_),
    .D(_1408_),
    .X(_1479_)
);

sky130_fd_sc_hd__and2_4 _3462_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1468_),
    .B(_1479_),
    .X(_1480_)
);

sky130_fd_sc_hd__inv_8 _3463_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(OUT[1]),
    .Y(_1481_)
);

sky130_fd_sc_hd__buf_1 _3464_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1459_),
    .X(_1482_)
);

sky130_fd_sc_hd__nor3_4 _3465_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1482_),
    .B(_1478_),
    .C(INTERNAL_FINISH),
    .Y(_1483_)
);

sky130_fd_sc_hd__o22a_4 _3466_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1455_),
    .A2(_1483_),
    .B1(_1411_),
    .B2(INTERNAL_FINISH),
    .X(_1484_)
);

sky130_fd_sc_hd__o22a_4 _3467_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1474_),
    .A2(_1480_),
    .B1(_1481_),
    .B2(_1484_),
    .X(_1485_)
);

sky130_fd_sc_hd__nor2_4 _3468_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1473_),
    .B(_1485_),
    .Y(_0011_)
);

sky130_fd_sc_hd__buf_1 _3469_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1454_),
    .X(_1486_)
);

sky130_fd_sc_hd__buf_1 _3470_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1486_),
    .X(_1487_)
);

sky130_fd_sc_hd__inv_8 _3471_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(OUT[2]),
    .Y(_1488_)
);

sky130_fd_sc_hd__buf_1 _3472_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1461_),
    .X(_1489_)
);

sky130_fd_sc_hd__buf_1 _3473_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1420_),
    .X(_1490_)
);

sky130_fd_sc_hd__buf_1 _3474_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(COUNT[0]),
    .X(_1491_)
);

sky130_fd_sc_hd__buf_1 _3475_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1456_),
    .X(_1492_)
);

sky130_fd_sc_hd__or4_4 _3476_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1490_),
    .B(_1491_),
    .C(_1477_),
    .D(_1492_),
    .X(_1493_)
);

sky130_fd_sc_hd__nor2_4 _3477_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1489_),
    .B(_1493_),
    .Y(_1494_)
);

sky130_fd_sc_hd__buf_1 _3478_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1433_),
    .X(_1495_)
);

sky130_fd_sc_hd__or2_4 _3479_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1495_),
    .B(_1493_),
    .X(_1496_)
);

sky130_fd_sc_hd__or2_4 _3480_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1408_),
    .B(_1459_),
    .X(_1497_)
);

sky130_fd_sc_hd__buf_1 _3481_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1497_),
    .X(_1498_)
);

sky130_fd_sc_hd__buf_1 _3482_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1498_),
    .X(_1499_)
);

sky130_fd_sc_hd__o22a_4 _3483_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1488_),
    .A2(_1494_),
    .B1(_1496_),
    .B2(_1499_),
    .X(_1500_)
);

sky130_fd_sc_hd__buf_1 _3484_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1449_),
    .X(_1501_)
);

sky130_fd_sc_hd__buf_1 _3485_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1501_),
    .X(_1502_)
);

sky130_fd_sc_hd__o22a_4 _3486_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1487_),
    .A2(_1500_),
    .B1(_1488_),
    .B2(_1502_),
    .X(_1503_)
);

sky130_fd_sc_hd__nor2_4 _3487_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1473_),
    .B(_1503_),
    .Y(_0022_)
);

sky130_fd_sc_hd__inv_8 _3488_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(OUT[3]),
    .Y(_1504_)
);

sky130_fd_sc_hd__buf_1 _3489_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1490_),
    .X(_1505_)
);

sky130_fd_sc_hd__buf_1 _3490_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1421_),
    .X(_1506_)
);

sky130_fd_sc_hd__buf_1 _3491_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1477_),
    .X(_1507_)
);

sky130_fd_sc_hd__or4_4 _3492_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1505_),
    .B(_1506_),
    .C(_1507_),
    .D(_1492_),
    .X(_1508_)
);

sky130_fd_sc_hd__nor2_4 _3493_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1489_),
    .B(_1508_),
    .Y(_1509_)
);

sky130_fd_sc_hd__or2_4 _3494_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1474_),
    .B(_1508_),
    .X(_1510_)
);

sky130_fd_sc_hd__o22a_4 _3495_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1504_),
    .A2(_1509_),
    .B1(_1499_),
    .B2(_1510_),
    .X(_1511_)
);

sky130_fd_sc_hd__o22a_4 _3496_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1487_),
    .A2(_1511_),
    .B1(_1504_),
    .B2(_1502_),
    .X(_1512_)
);

sky130_fd_sc_hd__nor2_4 _3497_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1473_),
    .B(_1512_),
    .Y(_0025_)
);

sky130_fd_sc_hd__inv_8 _3498_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(OUT[4]),
    .Y(_1513_)
);

sky130_fd_sc_hd__buf_1 _3499_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1475_),
    .X(_1514_)
);

sky130_fd_sc_hd__buf_1 _3500_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(COUNT[0]),
    .X(_1515_)
);

sky130_fd_sc_hd__buf_1 _3501_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1423_),
    .X(_1516_)
);

sky130_fd_sc_hd__buf_1 _3502_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1516_),
    .X(_1517_)
);

sky130_fd_sc_hd__or4_4 _3503_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1514_),
    .B(_1515_),
    .C(_1492_),
    .D(_1517_),
    .X(_1518_)
);

sky130_fd_sc_hd__nor2_4 _3504_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1489_),
    .B(_1518_),
    .Y(_1519_)
);

sky130_fd_sc_hd__or2_4 _3505_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1474_),
    .B(_1518_),
    .X(_1520_)
);

sky130_fd_sc_hd__o22a_4 _3506_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1513_),
    .A2(_1519_),
    .B1(_1499_),
    .B2(_1520_),
    .X(_1521_)
);

sky130_fd_sc_hd__buf_1 _3507_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1501_),
    .X(_1522_)
);

sky130_fd_sc_hd__o22a_4 _3508_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1487_),
    .A2(_1521_),
    .B1(_1513_),
    .B2(_1522_),
    .X(_1523_)
);

sky130_fd_sc_hd__nor2_4 _3509_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1473_),
    .B(_1523_),
    .Y(_0026_)
);

sky130_fd_sc_hd__inv_8 _3510_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(OUT[5]),
    .Y(_1524_)
);

sky130_fd_sc_hd__or4_4 _3511_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1514_),
    .B(_1476_),
    .C(_1492_),
    .D(_1517_),
    .X(_1525_)
);

sky130_fd_sc_hd__nor2_4 _3512_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1489_),
    .B(_1525_),
    .Y(_1526_)
);

sky130_fd_sc_hd__or2_4 _3513_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1474_),
    .B(_1525_),
    .X(_1527_)
);

sky130_fd_sc_hd__o22a_4 _3514_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1524_),
    .A2(_1526_),
    .B1(_1499_),
    .B2(_1527_),
    .X(_1528_)
);

sky130_fd_sc_hd__o22a_4 _3515_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A1(_1487_),
    .A2(_1528_),
    .B1(_1524_),
    .B2(_1522_),
    .X(_1529_)
);

sky130_fd_sc_hd__nor2_4 _3516_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1473_),
    .B(_1529_),
    .Y(_0027_)
);

sky130_fd_sc_hd__buf_1 _3517_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1472_),
    .X(_1530_)
);

sky130_fd_sc_hd__inv_8 _3518_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(OUT[6]),
    .Y(_1531_)
);

sky130_fd_sc_hd__or4_4 _3519_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1505_),
    .B(_1491_),
    .C(_1456_),
    .D(_1517_),
    .X(_1532_)
);

sky130_fd_sc_hd__nor2_4 _3520_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1489_),
    .B(_1532_),
    .Y(_1533_)
);

sky130_fd_sc_hd__buf_1 _3521_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(_1433_),
    .X(_1534_)
);

sky130_fd_sc_hd__dfrtp_4 _3522_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN1[0] ),
    .Q(PAR_IN1[0]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3523_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN1[1] ),
    .Q(PAR_IN1[1]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3524_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN1[2] ),
    .Q(PAR_IN1[2]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3525_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN1[3] ),
    .Q(PAR_IN1[3]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3526_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN1[4] ),
    .Q(PAR_IN1[4]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3527_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN1[5] ),
    .Q(PAR_IN1[5]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3528_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN1[6] ),
    .Q(PAR_IN1[6]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3529_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN1[7] ),
    .Q(PAR_IN1[7]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3530_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN1[8] ),
    .Q(PAR_IN1[8]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3531_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN1[9] ),
    .Q(PAR_IN1[9]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3532_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN1[10] ),
    .Q(PAR_IN1[10]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3533_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN1[11] ),
    .Q(PAR_IN1[11]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3534_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN1[12] ),
    .Q(PAR_IN1[12]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3535_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN1[13] ),
    .Q(PAR_IN1[13]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3536_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN1[14] ),
    .Q(PAR_IN1[14]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3537_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN1[15] ),
    .Q(PAR_IN1[15]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3538_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN1[16] ),
    .Q(PAR_IN1[16]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3539_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN1[17] ),
    .Q(PAR_IN1[17]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3540_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN1[18] ),
    .Q(PAR_IN1[18]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3541_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN1[19] ),
    .Q(PAR_IN1[19]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3542_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN1[20] ),
    .Q(PAR_IN1[20]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3543_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN1[21] ),
    .Q(PAR_IN1[21]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3544_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN1[22] ),
    .Q(PAR_IN1[22]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3545_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN1[23] ),
    .Q(PAR_IN1[23]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3546_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN1[24] ),
    .Q(PAR_IN1[24]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3547_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN1[25] ),
    .Q(PAR_IN1[25]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3548_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN1[26] ),
    .Q(PAR_IN1[26]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3549_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN1[27] ),
    .Q(PAR_IN1[27]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3550_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN1[28] ),
    .Q(PAR_IN1[28]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3551_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN1[29] ),
    .Q(PAR_IN1[29]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3552_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN1[30] ),
    .Q(PAR_IN1[30]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3553_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN1[31] ),
    .Q(PAR_IN1[31]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3554_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN2[0] ),
    .Q(PAR_IN2[0]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3555_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN2[1] ),
    .Q(PAR_IN2[1]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3556_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN2[2] ),
    .Q(PAR_IN2[2]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3557_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN2[3] ),
    .Q(PAR_IN2[3]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3558_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN2[4] ),
    .Q(PAR_IN2[4]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3559_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN2[5] ),
    .Q(PAR_IN2[5]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3560_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN2[6] ),
    .Q(PAR_IN2[6]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3561_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN2[7] ),
    .Q(PAR_IN2[7]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3562_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN2[8] ),
    .Q(PAR_IN2[8]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3563_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN2[9] ),
    .Q(PAR_IN2[9]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3564_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN2[10] ),
    .Q(PAR_IN2[10]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3565_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN2[11] ),
    .Q(PAR_IN2[11]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3566_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN2[12] ),
    .Q(PAR_IN2[12]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3567_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN2[13] ),
    .Q(PAR_IN2[13]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3568_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN2[14] ),
    .Q(PAR_IN2[14]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3569_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN2[15] ),
    .Q(PAR_IN2[15]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3570_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN2[16] ),
    .Q(PAR_IN2[16]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3571_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN2[17] ),
    .Q(PAR_IN2[17]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3572_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN2[18] ),
    .Q(PAR_IN2[18]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3573_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN2[19] ),
    .Q(PAR_IN2[19]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3574_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN2[20] ),
    .Q(PAR_IN2[20]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3575_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN2[21] ),
    .Q(PAR_IN2[21]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3576_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN2[22] ),
    .Q(PAR_IN2[22]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3577_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN2[23] ),
    .Q(PAR_IN2[23]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3578_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN2[24] ),
    .Q(PAR_IN2[24]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3579_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN2[25] ),
    .Q(PAR_IN2[25]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3580_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN2[26] ),
    .Q(PAR_IN2[26]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3581_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN2[27] ),
    .Q(PAR_IN2[27]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3582_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN2[28] ),
    .Q(PAR_IN2[28]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3583_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN2[29] ),
    .Q(PAR_IN2[29]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3584_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN2[30] ),
    .Q(PAR_IN2[30]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3585_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN2[31] ),
    .Q(PAR_IN2[31]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3586_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN3[0] ),
    .Q(PAR_IN3[0]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3587_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN3[1] ),
    .Q(PAR_IN3[1]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3588_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN3[2] ),
    .Q(PAR_IN3[2]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3589_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN3[3] ),
    .Q(PAR_IN3[3]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3590_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN3[4] ),
    .Q(PAR_IN3[4]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3591_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN3[5] ),
    .Q(PAR_IN3[5]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3592_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN3[6] ),
    .Q(PAR_IN3[6]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3593_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN3[7] ),
    .Q(PAR_IN3[7]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3594_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN3[8] ),
    .Q(PAR_IN3[8]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3595_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN3[9] ),
    .Q(PAR_IN3[9]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3596_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN3[10] ),
    .Q(PAR_IN3[10]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3597_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN3[11] ),
    .Q(PAR_IN3[11]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3598_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN3[12] ),
    .Q(PAR_IN3[12]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3599_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN3[13] ),
    .Q(PAR_IN3[13]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3600_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN3[14] ),
    .Q(PAR_IN3[14]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3601_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN3[15] ),
    .Q(PAR_IN3[15]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3602_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN3[16] ),
    .Q(PAR_IN3[16]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3603_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN3[17] ),
    .Q(PAR_IN3[17]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3604_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN3[18] ),
    .Q(PAR_IN3[18]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3605_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN3[19] ),
    .Q(PAR_IN3[19]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3606_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN3[20] ),
    .Q(PAR_IN3[20]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3607_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN3[21] ),
    .Q(PAR_IN3[21]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3608_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN3[22] ),
    .Q(PAR_IN3[22]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3609_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN3[23] ),
    .Q(PAR_IN3[23]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3610_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN3[24] ),
    .Q(PAR_IN3[24]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3611_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN3[25] ),
    .Q(PAR_IN3[25]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3612_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN3[26] ),
    .Q(PAR_IN3[26]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3613_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN3[27] ),
    .Q(PAR_IN3[27]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3614_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN3[28] ),
    .Q(PAR_IN3[28]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3615_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN3[29] ),
    .Q(PAR_IN3[29]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3616_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN3[30] ),
    .Q(PAR_IN3[30]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3617_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN3[31] ),
    .Q(PAR_IN3[31]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3618_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN4[0] ),
    .Q(PAR_IN4[0]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3619_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN4[1] ),
    .Q(PAR_IN4[1]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3620_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN4[2] ),
    .Q(PAR_IN4[2]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3621_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN4[3] ),
    .Q(PAR_IN4[3]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3622_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN4[4] ),
    .Q(PAR_IN4[4]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3623_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN4[5] ),
    .Q(PAR_IN4[5]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3624_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN4[6] ),
    .Q(PAR_IN4[6]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3625_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN4[7] ),
    .Q(PAR_IN4[7]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3626_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN4[8] ),
    .Q(PAR_IN4[8]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3627_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN4[9] ),
    .Q(PAR_IN4[9]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3628_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN4[10] ),
    .Q(PAR_IN4[10]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3629_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN4[11] ),
    .Q(PAR_IN4[11]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3630_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN4[12] ),
    .Q(PAR_IN4[12]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3631_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN4[13] ),
    .Q(PAR_IN4[13]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3632_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN4[14] ),
    .Q(PAR_IN4[14]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3633_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN4[15] ),
    .Q(PAR_IN4[15]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3634_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN4[16] ),
    .Q(PAR_IN4[16]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3635_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN4[17] ),
    .Q(PAR_IN4[17]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3636_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN4[18] ),
    .Q(PAR_IN4[18]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3637_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN4[19] ),
    .Q(PAR_IN4[19]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3638_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN4[20] ),
    .Q(PAR_IN4[20]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3639_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN4[21] ),
    .Q(PAR_IN4[21]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3640_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN4[22] ),
    .Q(PAR_IN4[22]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3641_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN4[23] ),
    .Q(PAR_IN4[23]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3642_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN4[24] ),
    .Q(PAR_IN4[24]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3643_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN4[25] ),
    .Q(PAR_IN4[25]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3644_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN4[26] ),
    .Q(PAR_IN4[26]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3645_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN4[27] ),
    .Q(PAR_IN4[27]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3646_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN4[28] ),
    .Q(PAR_IN4[28]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3647_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN4[29] ),
    .Q(PAR_IN4[29]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3648_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN4[30] ),
    .Q(PAR_IN4[30]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3649_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN4[31] ),
    .Q(PAR_IN4[31]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3650_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN5[0] ),
    .Q(PAR_IN5[0]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3651_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN5[1] ),
    .Q(PAR_IN5[1]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3652_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN5[2] ),
    .Q(PAR_IN5[2]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3653_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN5[3] ),
    .Q(PAR_IN5[3]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3654_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN5[4] ),
    .Q(PAR_IN5[4]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3655_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN5[5] ),
    .Q(PAR_IN5[5]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3656_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN5[6] ),
    .Q(PAR_IN5[6]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3657_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN5[7] ),
    .Q(PAR_IN5[7]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3658_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN5[8] ),
    .Q(PAR_IN5[8]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3659_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN5[9] ),
    .Q(PAR_IN5[9]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3660_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN5[10] ),
    .Q(PAR_IN5[10]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3661_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN5[11] ),
    .Q(PAR_IN5[11]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3662_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN5[12] ),
    .Q(PAR_IN5[12]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3663_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN5[13] ),
    .Q(PAR_IN5[13]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3664_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN5[14] ),
    .Q(PAR_IN5[14]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3665_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN5[15] ),
    .Q(PAR_IN5[15]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3666_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN5[16] ),
    .Q(PAR_IN5[16]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3667_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN5[17] ),
    .Q(PAR_IN5[17]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3668_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN5[18] ),
    .Q(PAR_IN5[18]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3669_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN5[19] ),
    .Q(PAR_IN5[19]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3670_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN5[20] ),
    .Q(PAR_IN5[20]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3671_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN5[21] ),
    .Q(PAR_IN5[21]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3672_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN5[22] ),
    .Q(PAR_IN5[22]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3673_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN5[23] ),
    .Q(PAR_IN5[23]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3674_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN5[24] ),
    .Q(PAR_IN5[24]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3675_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN5[25] ),
    .Q(PAR_IN5[25]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3676_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN5[26] ),
    .Q(PAR_IN5[26]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3677_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN5[27] ),
    .Q(PAR_IN5[27]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3678_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN5[28] ),
    .Q(PAR_IN5[28]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3679_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN5[29] ),
    .Q(PAR_IN5[29]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3680_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN5[30] ),
    .Q(PAR_IN5[30]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3681_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN5[31] ),
    .Q(PAR_IN5[31]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3682_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN6[0] ),
    .Q(PAR_IN6[0]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3683_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN6[1] ),
    .Q(PAR_IN6[1]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3684_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN6[2] ),
    .Q(PAR_IN6[2]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3685_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN6[3] ),
    .Q(PAR_IN6[3]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3686_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN6[4] ),
    .Q(PAR_IN6[4]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3687_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN6[5] ),
    .Q(PAR_IN6[5]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3688_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN6[6] ),
    .Q(PAR_IN6[6]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3689_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN6[7] ),
    .Q(PAR_IN6[7]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3690_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN6[8] ),
    .Q(PAR_IN6[8]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3691_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN6[9] ),
    .Q(PAR_IN6[9]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3692_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN6[10] ),
    .Q(PAR_IN6[10]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3693_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN6[11] ),
    .Q(PAR_IN6[11]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3694_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN6[12] ),
    .Q(PAR_IN6[12]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3695_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN6[13] ),
    .Q(PAR_IN6[13]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3696_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN6[14] ),
    .Q(PAR_IN6[14]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3697_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN6[15] ),
    .Q(PAR_IN6[15]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3698_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN6[16] ),
    .Q(PAR_IN6[16]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3699_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN6[17] ),
    .Q(PAR_IN6[17]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3700_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN6[18] ),
    .Q(PAR_IN6[18]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3701_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN6[19] ),
    .Q(PAR_IN6[19]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3702_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN6[20] ),
    .Q(PAR_IN6[20]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3703_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN6[21] ),
    .Q(PAR_IN6[21]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3704_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN6[22] ),
    .Q(PAR_IN6[22]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3705_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN6[23] ),
    .Q(PAR_IN6[23]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3706_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN6[24] ),
    .Q(PAR_IN6[24]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3707_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN6[25] ),
    .Q(PAR_IN6[25]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3708_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN6[26] ),
    .Q(PAR_IN6[26]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3709_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN6[27] ),
    .Q(PAR_IN6[27]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3710_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN6[28] ),
    .Q(PAR_IN6[28]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3711_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN6[29] ),
    .Q(PAR_IN6[29]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3712_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN6[30] ),
    .Q(PAR_IN6[30]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3713_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN6[31] ),
    .Q(PAR_IN6[31]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3714_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN7[0] ),
    .Q(PAR_IN7[0]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3715_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN7[1] ),
    .Q(PAR_IN7[1]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3716_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN7[2] ),
    .Q(PAR_IN7[2]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3717_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN7[3] ),
    .Q(PAR_IN7[3]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3718_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN7[4] ),
    .Q(PAR_IN7[4]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3719_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN7[5] ),
    .Q(PAR_IN7[5]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3720_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN7[6] ),
    .Q(PAR_IN7[6]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3721_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN7[7] ),
    .Q(PAR_IN7[7]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3722_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN7[8] ),
    .Q(PAR_IN7[8]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3723_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN7[9] ),
    .Q(PAR_IN7[9]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3724_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN7[10] ),
    .Q(PAR_IN7[10]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3725_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN7[11] ),
    .Q(PAR_IN7[11]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3726_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN7[12] ),
    .Q(PAR_IN7[12]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3727_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN7[13] ),
    .Q(PAR_IN7[13]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3728_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN7[14] ),
    .Q(PAR_IN7[14]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3729_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN7[15] ),
    .Q(PAR_IN7[15]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3730_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN7[16] ),
    .Q(PAR_IN7[16]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3731_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN7[17] ),
    .Q(PAR_IN7[17]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3732_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN7[18] ),
    .Q(PAR_IN7[18]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3733_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN7[19] ),
    .Q(PAR_IN7[19]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3734_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN7[20] ),
    .Q(PAR_IN7[20]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3735_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN7[21] ),
    .Q(PAR_IN7[21]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3736_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN7[22] ),
    .Q(PAR_IN7[22]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3737_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN7[23] ),
    .Q(PAR_IN7[23]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3738_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN7[24] ),
    .Q(PAR_IN7[24]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3739_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN7[25] ),
    .Q(PAR_IN7[25]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3740_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN7[26] ),
    .Q(PAR_IN7[26]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3741_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN7[27] ),
    .Q(PAR_IN7[27]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3742_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN7[28] ),
    .Q(PAR_IN7[28]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3743_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN7[29] ),
    .Q(PAR_IN7[29]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3744_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN7[30] ),
    .Q(PAR_IN7[30]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3745_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN7[31] ),
    .Q(PAR_IN7[31]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3746_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN8[0] ),
    .Q(PAR_IN8[0]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3747_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN8[1] ),
    .Q(PAR_IN8[1]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3748_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN8[2] ),
    .Q(PAR_IN8[2]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3749_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN8[3] ),
    .Q(PAR_IN8[3]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3750_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN8[4] ),
    .Q(PAR_IN8[4]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3751_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN8[5] ),
    .Q(PAR_IN8[5]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3752_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN8[6] ),
    .Q(PAR_IN8[6]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3753_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN8[7] ),
    .Q(PAR_IN8[7]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3754_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN8[8] ),
    .Q(PAR_IN8[8]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3755_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN8[9] ),
    .Q(PAR_IN8[9]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3756_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN8[10] ),
    .Q(PAR_IN8[10]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3757_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN8[11] ),
    .Q(PAR_IN8[11]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3758_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN8[12] ),
    .Q(PAR_IN8[12]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3759_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN8[13] ),
    .Q(PAR_IN8[13]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3760_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN8[14] ),
    .Q(PAR_IN8[14]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3761_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN8[15] ),
    .Q(PAR_IN8[15]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3762_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN8[16] ),
    .Q(PAR_IN8[16]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3763_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN8[17] ),
    .Q(PAR_IN8[17]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3764_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN8[18] ),
    .Q(PAR_IN8[18]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3765_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN8[19] ),
    .Q(PAR_IN8[19]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3766_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN8[20] ),
    .Q(PAR_IN8[20]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3767_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN8[21] ),
    .Q(PAR_IN8[21]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3768_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN8[22] ),
    .Q(PAR_IN8[22]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3769_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN8[23] ),
    .Q(PAR_IN8[23]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3770_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN8[24] ),
    .Q(PAR_IN8[24]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3771_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN8[25] ),
    .Q(PAR_IN8[25]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3772_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN8[26] ),
    .Q(PAR_IN8[26]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3773_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN8[27] ),
    .Q(PAR_IN8[27]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3774_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN8[28] ),
    .Q(PAR_IN8[28]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3775_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN8[29] ),
    .Q(PAR_IN8[29]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3776_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN8[30] ),
    .Q(PAR_IN8[30]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3777_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(\int_PAR_IN8[31] ),
    .Q(PAR_IN8[31]),
    .RESET_B(RESET),
    .CLK(COMPLETE)
);

sky130_fd_sc_hd__dfrtp_4 _3778_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0000_),
    .Q(OUT[0]),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3779_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0011_),
    .Q(OUT[1]),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3780_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0022_),
    .Q(OUT[2]),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3781_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0025_),
    .Q(OUT[3]),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3782_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0026_),
    .Q(OUT[4]),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3783_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0027_),
    .Q(OUT[5]),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3784_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0028_),
    .Q(OUT[6]),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3785_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0029_),
    .Q(OUT[7]),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3786_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0030_),
    .Q(OUT[8]),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3787_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0031_),
    .Q(OUT[9]),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3788_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0001_),
    .Q(OUT[10]),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3789_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0002_),
    .Q(OUT[11]),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3790_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0003_),
    .Q(OUT[12]),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3791_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0004_),
    .Q(OUT[13]),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3792_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0005_),
    .Q(OUT[14]),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3793_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0006_),
    .Q(OUT[15]),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3794_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0007_),
    .Q(OUT[16]),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3795_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0008_),
    .Q(OUT[17]),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3796_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0009_),
    .Q(OUT[18]),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3797_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0010_),
    .Q(OUT[19]),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3798_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0012_),
    .Q(OUT[20]),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3799_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0013_),
    .Q(OUT[21]),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3800_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0014_),
    .Q(OUT[22]),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3801_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0015_),
    .Q(OUT[23]),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3802_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0016_),
    .Q(OUT[24]),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3803_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0017_),
    .Q(OUT[25]),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3804_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0018_),
    .Q(OUT[26]),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3805_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0019_),
    .Q(OUT[27]),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3806_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0020_),
    .Q(OUT[28]),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3807_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0021_),
    .Q(OUT[29]),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3808_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0023_),
    .Q(OUT[30]),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3809_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0024_),
    .Q(OUT[31]),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3810_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0044_),
    .Q(\int_PAR_IN1[0] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3811_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0055_),
    .Q(\int_PAR_IN1[1] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3812_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0066_),
    .Q(\int_PAR_IN1[2] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3813_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0069_),
    .Q(\int_PAR_IN1[3] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3814_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0070_),
    .Q(\int_PAR_IN1[4] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3815_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0071_),
    .Q(\int_PAR_IN1[5] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3816_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0072_),
    .Q(\int_PAR_IN1[6] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3817_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0073_),
    .Q(\int_PAR_IN1[7] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3818_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0074_),
    .Q(\int_PAR_IN1[8] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3819_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0075_),
    .Q(\int_PAR_IN1[9] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3820_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0045_),
    .Q(\int_PAR_IN1[10] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3821_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0046_),
    .Q(\int_PAR_IN1[11] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3822_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0047_),
    .Q(\int_PAR_IN1[12] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3823_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0048_),
    .Q(\int_PAR_IN1[13] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3824_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0049_),
    .Q(\int_PAR_IN1[14] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3825_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0050_),
    .Q(\int_PAR_IN1[15] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3826_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0051_),
    .Q(\int_PAR_IN1[16] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3827_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0052_),
    .Q(\int_PAR_IN1[17] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3828_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0053_),
    .Q(\int_PAR_IN1[18] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3829_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0054_),
    .Q(\int_PAR_IN1[19] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3830_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0056_),
    .Q(\int_PAR_IN1[20] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3831_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0057_),
    .Q(\int_PAR_IN1[21] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3832_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0058_),
    .Q(\int_PAR_IN1[22] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3833_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0059_),
    .Q(\int_PAR_IN1[23] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3834_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0060_),
    .Q(\int_PAR_IN1[24] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3835_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0061_),
    .Q(\int_PAR_IN1[25] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3836_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0062_),
    .Q(\int_PAR_IN1[26] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3837_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0063_),
    .Q(\int_PAR_IN1[27] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3838_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0064_),
    .Q(\int_PAR_IN1[28] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3839_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0065_),
    .Q(\int_PAR_IN1[29] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3840_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0067_),
    .Q(\int_PAR_IN1[30] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3841_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0068_),
    .Q(\int_PAR_IN1[31] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3842_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0076_),
    .Q(\int_PAR_IN2[0] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3843_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0087_),
    .Q(\int_PAR_IN2[1] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3844_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0098_),
    .Q(\int_PAR_IN2[2] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3845_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0101_),
    .Q(\int_PAR_IN2[3] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3846_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0102_),
    .Q(\int_PAR_IN2[4] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3847_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0103_),
    .Q(\int_PAR_IN2[5] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3848_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0104_),
    .Q(\int_PAR_IN2[6] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3849_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0105_),
    .Q(\int_PAR_IN2[7] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3850_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0106_),
    .Q(\int_PAR_IN2[8] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3851_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0107_),
    .Q(\int_PAR_IN2[9] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3852_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0077_),
    .Q(\int_PAR_IN2[10] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3853_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0078_),
    .Q(\int_PAR_IN2[11] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3854_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0079_),
    .Q(\int_PAR_IN2[12] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3855_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0080_),
    .Q(\int_PAR_IN2[13] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3856_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0081_),
    .Q(\int_PAR_IN2[14] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3857_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0082_),
    .Q(\int_PAR_IN2[15] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3858_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0083_),
    .Q(\int_PAR_IN2[16] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3859_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0084_),
    .Q(\int_PAR_IN2[17] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3860_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0085_),
    .Q(\int_PAR_IN2[18] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3861_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0086_),
    .Q(\int_PAR_IN2[19] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3862_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0088_),
    .Q(\int_PAR_IN2[20] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3863_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0089_),
    .Q(\int_PAR_IN2[21] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3864_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0090_),
    .Q(\int_PAR_IN2[22] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3865_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0091_),
    .Q(\int_PAR_IN2[23] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3866_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0092_),
    .Q(\int_PAR_IN2[24] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3867_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0093_),
    .Q(\int_PAR_IN2[25] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3868_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0094_),
    .Q(\int_PAR_IN2[26] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3869_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0095_),
    .Q(\int_PAR_IN2[27] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3870_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0096_),
    .Q(\int_PAR_IN2[28] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3871_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0097_),
    .Q(\int_PAR_IN2[29] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3872_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0099_),
    .Q(\int_PAR_IN2[30] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3873_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0100_),
    .Q(\int_PAR_IN2[31] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3874_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0108_),
    .Q(\int_PAR_IN3[0] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3875_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0119_),
    .Q(\int_PAR_IN3[1] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3876_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0130_),
    .Q(\int_PAR_IN3[2] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3877_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0133_),
    .Q(\int_PAR_IN3[3] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3878_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0134_),
    .Q(\int_PAR_IN3[4] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3879_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0135_),
    .Q(\int_PAR_IN3[5] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3880_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0136_),
    .Q(\int_PAR_IN3[6] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3881_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0137_),
    .Q(\int_PAR_IN3[7] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3882_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0138_),
    .Q(\int_PAR_IN3[8] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3883_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0139_),
    .Q(\int_PAR_IN3[9] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3884_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0109_),
    .Q(\int_PAR_IN3[10] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3885_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0110_),
    .Q(\int_PAR_IN3[11] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3886_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0111_),
    .Q(\int_PAR_IN3[12] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3887_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0112_),
    .Q(\int_PAR_IN3[13] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3888_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0113_),
    .Q(\int_PAR_IN3[14] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3889_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0114_),
    .Q(\int_PAR_IN3[15] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3890_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0115_),
    .Q(\int_PAR_IN3[16] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3891_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0116_),
    .Q(\int_PAR_IN3[17] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3892_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0117_),
    .Q(\int_PAR_IN3[18] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3893_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0118_),
    .Q(\int_PAR_IN3[19] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3894_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0120_),
    .Q(\int_PAR_IN3[20] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3895_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0121_),
    .Q(\int_PAR_IN3[21] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3896_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0122_),
    .Q(\int_PAR_IN3[22] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3897_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0123_),
    .Q(\int_PAR_IN3[23] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3898_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0124_),
    .Q(\int_PAR_IN3[24] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3899_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0125_),
    .Q(\int_PAR_IN3[25] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3900_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0126_),
    .Q(\int_PAR_IN3[26] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3901_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0127_),
    .Q(\int_PAR_IN3[27] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3902_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0128_),
    .Q(\int_PAR_IN3[28] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3903_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0129_),
    .Q(\int_PAR_IN3[29] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3904_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0131_),
    .Q(\int_PAR_IN3[30] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3905_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0132_),
    .Q(\int_PAR_IN3[31] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3906_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0140_),
    .Q(\int_PAR_IN4[0] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3907_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0151_),
    .Q(\int_PAR_IN4[1] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3908_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0162_),
    .Q(\int_PAR_IN4[2] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3909_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0165_),
    .Q(\int_PAR_IN4[3] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3910_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0166_),
    .Q(\int_PAR_IN4[4] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3911_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0167_),
    .Q(\int_PAR_IN4[5] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3912_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0168_),
    .Q(\int_PAR_IN4[6] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3913_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0169_),
    .Q(\int_PAR_IN4[7] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3914_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0170_),
    .Q(\int_PAR_IN4[8] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3915_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0171_),
    .Q(\int_PAR_IN4[9] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3916_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0141_),
    .Q(\int_PAR_IN4[10] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3917_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0142_),
    .Q(\int_PAR_IN4[11] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3918_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0143_),
    .Q(\int_PAR_IN4[12] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3919_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0144_),
    .Q(\int_PAR_IN4[13] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3920_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0145_),
    .Q(\int_PAR_IN4[14] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3921_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0146_),
    .Q(\int_PAR_IN4[15] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3922_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0147_),
    .Q(\int_PAR_IN4[16] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3923_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0148_),
    .Q(\int_PAR_IN4[17] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3924_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0149_),
    .Q(\int_PAR_IN4[18] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3925_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0150_),
    .Q(\int_PAR_IN4[19] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3926_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0152_),
    .Q(\int_PAR_IN4[20] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3927_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0153_),
    .Q(\int_PAR_IN4[21] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3928_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0154_),
    .Q(\int_PAR_IN4[22] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3929_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0155_),
    .Q(\int_PAR_IN4[23] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3930_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0156_),
    .Q(\int_PAR_IN4[24] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3931_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0157_),
    .Q(\int_PAR_IN4[25] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3932_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0158_),
    .Q(\int_PAR_IN4[26] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3933_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0159_),
    .Q(\int_PAR_IN4[27] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3934_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0160_),
    .Q(\int_PAR_IN4[28] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3935_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0161_),
    .Q(\int_PAR_IN4[29] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3936_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0163_),
    .Q(\int_PAR_IN4[30] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3937_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0164_),
    .Q(\int_PAR_IN4[31] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3938_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0172_),
    .Q(\int_PAR_IN5[0] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3939_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0183_),
    .Q(\int_PAR_IN5[1] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3940_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0194_),
    .Q(\int_PAR_IN5[2] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3941_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0197_),
    .Q(\int_PAR_IN5[3] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3942_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0198_),
    .Q(\int_PAR_IN5[4] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3943_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0199_),
    .Q(\int_PAR_IN5[5] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3944_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0200_),
    .Q(\int_PAR_IN5[6] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3945_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0201_),
    .Q(\int_PAR_IN5[7] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3946_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0202_),
    .Q(\int_PAR_IN5[8] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3947_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0203_),
    .Q(\int_PAR_IN5[9] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3948_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0173_),
    .Q(\int_PAR_IN5[10] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3949_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0174_),
    .Q(\int_PAR_IN5[11] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3950_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0175_),
    .Q(\int_PAR_IN5[12] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3951_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0176_),
    .Q(\int_PAR_IN5[13] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3952_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0177_),
    .Q(\int_PAR_IN5[14] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3953_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0178_),
    .Q(\int_PAR_IN5[15] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3954_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0179_),
    .Q(\int_PAR_IN5[16] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3955_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0180_),
    .Q(\int_PAR_IN5[17] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3956_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0181_),
    .Q(\int_PAR_IN5[18] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3957_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0182_),
    .Q(\int_PAR_IN5[19] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3958_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0184_),
    .Q(\int_PAR_IN5[20] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3959_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0185_),
    .Q(\int_PAR_IN5[21] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3960_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0186_),
    .Q(\int_PAR_IN5[22] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3961_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0187_),
    .Q(\int_PAR_IN5[23] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3962_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0188_),
    .Q(\int_PAR_IN5[24] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3963_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0189_),
    .Q(\int_PAR_IN5[25] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3964_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0190_),
    .Q(\int_PAR_IN5[26] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3965_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0191_),
    .Q(\int_PAR_IN5[27] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3966_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0192_),
    .Q(\int_PAR_IN5[28] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3967_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0193_),
    .Q(\int_PAR_IN5[29] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3968_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0195_),
    .Q(\int_PAR_IN5[30] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3969_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0196_),
    .Q(\int_PAR_IN5[31] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3970_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0204_),
    .Q(\int_PAR_IN6[0] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3971_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0215_),
    .Q(\int_PAR_IN6[1] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3972_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0226_),
    .Q(\int_PAR_IN6[2] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3973_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0229_),
    .Q(\int_PAR_IN6[3] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3974_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0230_),
    .Q(\int_PAR_IN6[4] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3975_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0231_),
    .Q(\int_PAR_IN6[5] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3976_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0232_),
    .Q(\int_PAR_IN6[6] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3977_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0233_),
    .Q(\int_PAR_IN6[7] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3978_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0234_),
    .Q(\int_PAR_IN6[8] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3979_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0235_),
    .Q(\int_PAR_IN6[9] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3980_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0205_),
    .Q(\int_PAR_IN6[10] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3981_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0206_),
    .Q(\int_PAR_IN6[11] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3982_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0207_),
    .Q(\int_PAR_IN6[12] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3983_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0208_),
    .Q(\int_PAR_IN6[13] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3984_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0209_),
    .Q(\int_PAR_IN6[14] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3985_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0210_),
    .Q(\int_PAR_IN6[15] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3986_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0211_),
    .Q(\int_PAR_IN6[16] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3987_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0212_),
    .Q(\int_PAR_IN6[17] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3988_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0213_),
    .Q(\int_PAR_IN6[18] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3989_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0214_),
    .Q(\int_PAR_IN6[19] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3990_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0216_),
    .Q(\int_PAR_IN6[20] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3991_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0217_),
    .Q(\int_PAR_IN6[21] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3992_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0218_),
    .Q(\int_PAR_IN6[22] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3993_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0219_),
    .Q(\int_PAR_IN6[23] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3994_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0220_),
    .Q(\int_PAR_IN6[24] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3995_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0221_),
    .Q(\int_PAR_IN6[25] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3996_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0222_),
    .Q(\int_PAR_IN6[26] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3997_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0223_),
    .Q(\int_PAR_IN6[27] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3998_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0224_),
    .Q(\int_PAR_IN6[28] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _3999_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0225_),
    .Q(\int_PAR_IN6[29] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _4000_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0227_),
    .Q(\int_PAR_IN6[30] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _4001_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0228_),
    .Q(\int_PAR_IN6[31] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _4002_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0236_),
    .Q(\int_PAR_IN7[0] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _4003_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0247_),
    .Q(\int_PAR_IN7[1] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _4004_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0258_),
    .Q(\int_PAR_IN7[2] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _4005_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0261_),
    .Q(\int_PAR_IN7[3] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _4006_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0262_),
    .Q(\int_PAR_IN7[4] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _4007_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0263_),
    .Q(\int_PAR_IN7[5] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _4008_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0264_),
    .Q(\int_PAR_IN7[6] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _4009_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0265_),
    .Q(\int_PAR_IN7[7] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _4010_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0266_),
    .Q(\int_PAR_IN7[8] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _4011_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0267_),
    .Q(\int_PAR_IN7[9] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _4012_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0237_),
    .Q(\int_PAR_IN7[10] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _4013_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0238_),
    .Q(\int_PAR_IN7[11] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _4014_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0239_),
    .Q(\int_PAR_IN7[12] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _4015_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0240_),
    .Q(\int_PAR_IN7[13] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _4016_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0241_),
    .Q(\int_PAR_IN7[14] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _4017_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0242_),
    .Q(\int_PAR_IN7[15] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _4018_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0243_),
    .Q(\int_PAR_IN7[16] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _4019_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0244_),
    .Q(\int_PAR_IN7[17] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _4020_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0245_),
    .Q(\int_PAR_IN7[18] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _4021_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0246_),
    .Q(\int_PAR_IN7[19] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _4022_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0248_),
    .Q(\int_PAR_IN7[20] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _4023_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0249_),
    .Q(\int_PAR_IN7[21] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _4024_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0250_),
    .Q(\int_PAR_IN7[22] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _4025_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0251_),
    .Q(\int_PAR_IN7[23] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _4026_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0252_),
    .Q(\int_PAR_IN7[24] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _4027_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0253_),
    .Q(\int_PAR_IN7[25] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _4028_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0254_),
    .Q(\int_PAR_IN7[26] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _4029_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0255_),
    .Q(\int_PAR_IN7[27] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _4030_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0256_),
    .Q(\int_PAR_IN7[28] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _4031_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0257_),
    .Q(\int_PAR_IN7[29] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _4032_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0259_),
    .Q(\int_PAR_IN7[30] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _4033_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0260_),
    .Q(\int_PAR_IN7[31] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _4034_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0268_),
    .Q(\int_PAR_IN8[0] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _4035_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0279_),
    .Q(\int_PAR_IN8[1] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _4036_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0290_),
    .Q(\int_PAR_IN8[2] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _4037_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0293_),
    .Q(\int_PAR_IN8[3] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _4038_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0294_),
    .Q(\int_PAR_IN8[4] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _4039_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0295_),
    .Q(\int_PAR_IN8[5] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _4040_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0296_),
    .Q(\int_PAR_IN8[6] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _4041_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0297_),
    .Q(\int_PAR_IN8[7] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _4042_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0298_),
    .Q(\int_PAR_IN8[8] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _4043_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0299_),
    .Q(\int_PAR_IN8[9] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _4044_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0269_),
    .Q(\int_PAR_IN8[10] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _4045_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0270_),
    .Q(\int_PAR_IN8[11] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _4046_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0271_),
    .Q(\int_PAR_IN8[12] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _4047_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0272_),
    .Q(\int_PAR_IN8[13] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _4048_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0273_),
    .Q(\int_PAR_IN8[14] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _4049_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0274_),
    .Q(\int_PAR_IN8[15] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _4050_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0275_),
    .Q(\int_PAR_IN8[16] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _4051_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0276_),
    .Q(\int_PAR_IN8[17] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _4052_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0277_),
    .Q(\int_PAR_IN8[18] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _4053_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0278_),
    .Q(\int_PAR_IN8[19] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _4054_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0280_),
    .Q(\int_PAR_IN8[20] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _4055_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0281_),
    .Q(\int_PAR_IN8[21] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _4056_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0282_),
    .Q(\int_PAR_IN8[22] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _4057_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0283_),
    .Q(\int_PAR_IN8[23] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _4058_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0284_),
    .Q(\int_PAR_IN8[24] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _4059_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0285_),
    .Q(\int_PAR_IN8[25] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _4060_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0286_),
    .Q(\int_PAR_IN8[26] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _4061_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0287_),
    .Q(\int_PAR_IN8[27] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _4062_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0288_),
    .Q(\int_PAR_IN8[28] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _4063_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0289_),
    .Q(\int_PAR_IN8[29] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _4064_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0291_),
    .Q(\int_PAR_IN8[30] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _4065_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0292_),
    .Q(\int_PAR_IN8[31] ),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _4066_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0033_),
    .Q(COUNT[0]),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _4067_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0034_),
    .Q(COUNT[1]),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _4068_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0035_),
    .Q(COUNT[2]),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _4069_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0036_),
    .Q(COUNT[3]),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _4070_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0037_),
    .Q(COUNT[4]),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _4071_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0038_),
    .Q(COUNT[5]),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _4072_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0040_),
    .Q(SAMPLE_COUNT[0]),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _4073_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0041_),
    .Q(SAMPLE_COUNT[1]),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _4074_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0042_),
    .Q(SAMPLE_COUNT[2]),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _4075_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0043_),
    .Q(SAMPLE_COUNT[3]),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _4076_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0039_),
    .Q(INTERNAL_FINISH),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__dfrtp_4 _4077_ (
    .VGND(vgnd),
    .VPWR(vpwr),
    .D(_0032_),
    .Q(COMPLETE),
    .RESET_B(RESET)
);

sky130_fd_sc_hd__clkbuf_4 _CTS_buf_1_0 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(clknet_1_1_0_clk_1_0),
    .X(clk_0_0)
);

sky130_fd_sc_hd__clkbuf_4 _CTS_buf_1_112 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(clknet_1_0_0_clk_1_0),
    .X(clk_0_112)
);

sky130_fd_sc_hd__clkbuf_4 _CTS_buf_1_128 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(clknet_1_1_0_clk_1_0),
    .X(clk_0_128)
);

sky130_fd_sc_hd__clkbuf_4 _CTS_buf_1_144 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(clknet_1_0_0_clk_1_0),
    .X(clk_0_144)
);

sky130_fd_sc_hd__clkbuf_4 _CTS_buf_1_16 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(clknet_1_1_0_clk_1_0),
    .X(clk_0_16)
);

sky130_fd_sc_hd__clkbuf_4 _CTS_buf_1_160 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(clknet_1_0_0_clk_1_0),
    .X(clk_0_160)
);

sky130_fd_sc_hd__clkbuf_4 _CTS_buf_1_176 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(clknet_1_1_0_clk_1_0),
    .X(clk_0_176)
);

sky130_fd_sc_hd__clkbuf_4 _CTS_buf_1_192 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(clknet_1_0_0_clk_1_0),
    .X(clk_0_192)
);

sky130_fd_sc_hd__clkbuf_4 _CTS_buf_1_208 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(clknet_1_1_0_clk_1_0),
    .X(clk_0_208)
);

sky130_fd_sc_hd__clkbuf_4 _CTS_buf_1_224 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(clknet_1_0_0_clk_1_0),
    .X(clk_0_224)
);

sky130_fd_sc_hd__clkbuf_4 _CTS_buf_1_240 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(clknet_1_0_0_clk_1_0),
    .X(clk_0_240)
);

sky130_fd_sc_hd__clkbuf_4 _CTS_buf_1_256 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(clknet_1_0_0_clk_1_256),
    .X(clk_0_256)
);

sky130_fd_sc_hd__clkbuf_4 _CTS_buf_1_272 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(clknet_1_1_0_clk_1_256),
    .X(clk_0_272)
);

sky130_fd_sc_hd__clkbuf_4 _CTS_buf_1_288 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(clknet_1_0_0_clk_1_256),
    .X(clk_0_288)
);

sky130_fd_sc_hd__clkbuf_4 _CTS_buf_1_32 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(clknet_1_1_0_clk_1_0),
    .X(clk_0_32)
);

sky130_fd_sc_hd__clkbuf_4 _CTS_buf_1_48 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(clknet_1_0_0_clk_1_0),
    .X(clk_0_48)
);

sky130_fd_sc_hd__clkbuf_4 _CTS_buf_1_64 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(clknet_1_0_0_clk_1_0),
    .X(clk_0_64)
);

sky130_fd_sc_hd__clkbuf_4 _CTS_buf_1_80 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(clknet_1_1_0_clk_1_0),
    .X(clk_0_80)
);

sky130_fd_sc_hd__clkbuf_4 _CTS_buf_1_96 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(clknet_1_1_0_clk_1_0),
    .X(clk_0_96)
);

sky130_fd_sc_hd__clkbuf_4 _CTS_buf_2_0 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(clknet_1_1_0_clk_2_0),
    .X(clk_1_0)
);

sky130_fd_sc_hd__clkbuf_4 _CTS_buf_2_256 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(clknet_1_0_0_clk_2_0),
    .X(clk_1_256)
);

sky130_fd_sc_hd__clkbuf_16 _CTS_root (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(CLK),
    .X(clk_2_0)
);

sky130_fd_sc_hd__decap_3 PHY_0 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_1 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_2 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_3 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_4 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_5 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_6 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_7 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_8 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_9 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_10 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_11 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_12 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_13 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_14 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_15 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_16 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_17 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_18 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_19 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_20 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_21 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_22 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_23 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_24 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_25 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_26 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_27 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_28 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_29 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_30 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_31 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_32 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_33 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_34 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_35 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_36 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_37 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_38 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_39 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_40 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_41 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_42 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_43 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_44 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_45 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_46 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_47 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_48 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_49 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_50 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_51 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_52 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_53 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_54 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_55 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_56 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_57 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_58 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_59 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_60 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_61 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_62 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_63 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_64 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_65 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_66 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_67 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_68 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_69 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_70 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_71 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_72 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_73 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_74 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_75 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_76 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_77 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_78 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_79 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_80 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_81 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_82 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_83 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_84 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_85 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_86 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_87 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_88 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_89 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_90 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_91 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_92 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_93 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_94 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_95 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_96 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_97 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_98 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_99 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_100 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_101 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_102 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_103 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_104 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_105 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_106 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_107 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_108 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_109 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_110 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_111 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_112 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_113 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_114 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_115 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_116 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_117 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_118 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_119 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_120 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_121 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_122 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_123 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_124 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_125 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_126 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_127 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_128 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_129 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_130 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_131 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_132 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_133 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_134 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_135 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_136 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_137 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_138 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_139 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_140 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_141 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_142 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_143 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_144 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_145 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_146 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_147 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_148 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_149 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_150 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_151 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_152 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_153 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_154 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_155 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_156 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_157 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_158 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_159 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_160 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_161 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_162 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_163 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_164 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_165 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_166 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_167 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_168 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_169 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_170 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_171 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_172 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_173 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_174 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_175 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_176 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_177 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_178 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_179 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_180 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_181 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_182 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_183 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_184 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_185 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_186 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_187 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_188 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_189 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_190 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_191 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_192 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_193 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_194 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_195 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_196 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_197 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_198 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_199 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_200 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_201 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_202 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_203 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_204 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_205 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_206 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_207 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_208 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_209 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_210 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_211 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_212 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_213 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_214 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_215 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_216 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_217 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_218 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_219 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_220 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_221 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_222 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_223 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_224 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_225 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_226 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_227 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_228 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_229 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_230 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_231 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_232 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_233 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_234 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_235 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_236 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_237 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_238 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_239 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_240 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_241 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_242 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_243 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_244 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_245 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_246 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_247 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_248 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_249 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_250 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__decap_3 PHY_251 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_252 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_253 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_254 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_255 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_256 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_257 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_258 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_259 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_260 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_261 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_262 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_263 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_264 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_265 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_266 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_267 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_268 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_269 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_270 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_271 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_272 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_273 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_274 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_275 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_276 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_277 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_278 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_279 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_280 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_281 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_282 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_283 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_284 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_285 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_286 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_287 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_288 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_289 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_290 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_291 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_292 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_293 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_294 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_295 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_296 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_297 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_298 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_299 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_300 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_301 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_302 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_303 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_304 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_305 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_306 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_307 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_308 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_309 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_310 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_311 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_312 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_313 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_314 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_315 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_316 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_317 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_318 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_319 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_320 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_321 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_322 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_323 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_324 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_325 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_326 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_327 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_328 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_329 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_330 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_331 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_332 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_333 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_334 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_335 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_336 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_337 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_338 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_339 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_340 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_341 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_342 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_343 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_344 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_345 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_346 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_347 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_348 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_349 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_350 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_351 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_352 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_353 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_354 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_355 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_356 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_357 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_358 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_359 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_360 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_361 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_362 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_363 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_364 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_365 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_366 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_367 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_368 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_369 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_370 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_371 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_372 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_373 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_374 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_375 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_376 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_377 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_378 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_379 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_380 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_381 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_382 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_383 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_384 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_385 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_386 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_387 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_388 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_389 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_390 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_391 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_392 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_393 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_394 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_395 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_396 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_397 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_398 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_399 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_400 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_401 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_402 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_403 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_404 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_405 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_406 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_407 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_408 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_409 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_410 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_411 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_412 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_413 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_414 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_415 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_416 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_417 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_418 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_419 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_420 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_421 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_422 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_423 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_424 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_425 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_426 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_427 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_428 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_429 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_430 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_431 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_432 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_433 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_434 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_435 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_436 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_437 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_438 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_439 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_440 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_441 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_442 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_443 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_444 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_445 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_446 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_447 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_448 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_449 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_450 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_451 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_452 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_453 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_454 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_455 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_456 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_457 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_458 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_459 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_460 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_461 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_462 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_463 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_464 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_465 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_466 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_467 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_468 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_469 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_470 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_471 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_472 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_473 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_474 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_475 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_476 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_477 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_478 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_479 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_480 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_481 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_482 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_483 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_484 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_485 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_486 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_487 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_488 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_489 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_490 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_491 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_492 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_493 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_494 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_495 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_496 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_497 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_498 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_499 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_500 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_501 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_502 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_503 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_504 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_505 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_506 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_507 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_508 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_509 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_510 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_511 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_512 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_513 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_514 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_515 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_516 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_517 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_518 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_519 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_520 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_521 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_522 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_523 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_524 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_525 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_526 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_527 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_528 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_529 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_530 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_531 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_532 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_533 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_534 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_535 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_536 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_537 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_538 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_539 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_540 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_541 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_542 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_543 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_544 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_545 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_546 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_547 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_548 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_549 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_550 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_551 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_552 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_553 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_554 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_555 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_556 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_557 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_558 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_559 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_560 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_561 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_562 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_563 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_564 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_565 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_566 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_567 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_568 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_569 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_570 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_571 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_572 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_573 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_574 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_575 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_576 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_577 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_578 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_579 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_580 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_581 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_582 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_583 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_584 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_585 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_586 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_587 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_588 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_589 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_590 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_591 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_592 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_593 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_594 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_595 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_596 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_597 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_598 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_599 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_600 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_601 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_602 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_603 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_604 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_605 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_606 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_607 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_608 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_609 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_610 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_611 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_612 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_613 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_614 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_615 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_616 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_617 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_618 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_619 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_620 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_621 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_622 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_623 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_624 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_625 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_626 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_627 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_628 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_629 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_630 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_631 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_632 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_633 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_634 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_635 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_636 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_637 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_638 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_639 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_640 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_641 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_642 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_643 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_644 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_645 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_646 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_647 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_648 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_649 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_650 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_651 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_652 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_653 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_654 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_655 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_656 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_657 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_658 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_659 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_660 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_661 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_662 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_663 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_664 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_665 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_666 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_667 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_668 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_669 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_670 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_671 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_672 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_673 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_674 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_675 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_676 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_677 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_678 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_679 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_680 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_681 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_682 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_683 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_684 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_685 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_686 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_687 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_688 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_689 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_690 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_691 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_692 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_693 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_694 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_695 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_696 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_697 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_698 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_699 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_700 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_701 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_702 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_703 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_704 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_705 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_706 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_707 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_708 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_709 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_710 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_711 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_712 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_713 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_714 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_715 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_716 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_717 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_718 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_719 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_720 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_721 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_722 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_723 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_724 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_725 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_726 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_727 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_728 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_729 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_730 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_731 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_732 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_733 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_734 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_735 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_736 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_737 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_738 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_739 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_740 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_741 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_742 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_743 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_744 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_745 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_746 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_747 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_748 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_749 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_750 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_751 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_752 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_753 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_754 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_755 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_756 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_757 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_758 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_759 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_760 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_761 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_762 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_763 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_764 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_765 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_766 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_767 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_768 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_769 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_770 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_771 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_772 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_773 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_774 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_775 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_776 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_777 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_778 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_779 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_780 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_781 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_782 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_783 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_784 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_785 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_786 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_787 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_788 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_789 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_790 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_791 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_792 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_793 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_794 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_795 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_796 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_797 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_798 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_799 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_800 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_801 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_802 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_803 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_804 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_805 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_806 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_807 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_808 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_809 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_810 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_811 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_812 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_813 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_814 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_815 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_816 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_817 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_818 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_819 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_820 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_821 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_822 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_823 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_824 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_825 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_826 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_827 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_828 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_829 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_830 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_831 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_832 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_833 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_834 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_835 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_836 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_837 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_838 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_839 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_840 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_841 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_842 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_843 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_844 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_845 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_846 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_847 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_848 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_849 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_850 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_851 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_852 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_853 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_854 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_855 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_856 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_857 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_858 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_859 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_860 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_861 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_862 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_863 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_864 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_865 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_866 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_867 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_868 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_869 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_870 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_871 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_872 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_873 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_874 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_875 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_876 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_877 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_878 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_879 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_880 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_881 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_882 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_883 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_884 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_885 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_886 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_887 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_888 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_889 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_890 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_891 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_892 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_893 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_894 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_895 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_896 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_897 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_898 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_899 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_900 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_901 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_902 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_903 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_904 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_905 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_906 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_907 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_908 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_909 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_910 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_911 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_912 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_913 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_914 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_915 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_916 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_917 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_918 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_919 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_920 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_921 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_922 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_923 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_924 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_925 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_926 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_927 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_928 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_929 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_930 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_931 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_932 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_933 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_934 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_935 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_936 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_937 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_938 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_939 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_940 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_941 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_942 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_943 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_944 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_945 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_946 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_947 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_948 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_949 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_950 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_951 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_952 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_953 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_954 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_955 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_956 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_957 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_958 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_959 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_960 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_961 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_962 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_963 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_964 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_965 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_966 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_967 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_968 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_969 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_970 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_971 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_972 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_973 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_974 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_975 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_976 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_977 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_978 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_979 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_980 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_981 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_982 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_983 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_984 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_985 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_986 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_987 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_988 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_989 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_990 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_991 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_992 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_993 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_994 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_995 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_996 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_997 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_998 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_999 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1000 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1001 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1002 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1003 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1004 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1005 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1006 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1007 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1008 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1009 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1010 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1011 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1012 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1013 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1014 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1015 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1016 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1017 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1018 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1019 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1020 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1021 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1022 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1023 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1024 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1025 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1026 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1027 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1028 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1029 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1030 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1031 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1032 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1033 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1034 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1035 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1036 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1037 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1038 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1039 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1040 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1041 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1042 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1043 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1044 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1045 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1046 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1047 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1048 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1049 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1050 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1051 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1052 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1053 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1054 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1055 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1056 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1057 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1058 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1059 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1060 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1061 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1062 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1063 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1064 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1065 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1066 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1067 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1068 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1069 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1070 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1071 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1072 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1073 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1074 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1075 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1076 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1077 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1078 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1079 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1080 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1081 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1082 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1083 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1084 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1085 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1086 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1087 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1088 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1089 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1090 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1091 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1092 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1093 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1094 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1095 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1096 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1097 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1098 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1099 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1100 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1101 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1102 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1103 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1104 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1105 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1106 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1107 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1108 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1109 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1110 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1111 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1112 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1113 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1114 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1115 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1116 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1117 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1118 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1119 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1120 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1121 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1122 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1123 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1124 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1125 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1126 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1127 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1128 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1129 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1130 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1131 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1132 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1133 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1134 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1135 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1136 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1137 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1138 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1139 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1140 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1141 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1142 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1143 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1144 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1145 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1146 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1147 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1148 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1149 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1150 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1151 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1152 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1153 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1154 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1155 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1156 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1157 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1158 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1159 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1160 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1161 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1162 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1163 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1164 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1165 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1166 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1167 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1168 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1169 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1170 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1171 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1172 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1173 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1174 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1175 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1176 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1177 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1178 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1179 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1180 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1181 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1182 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1183 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1184 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1185 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1186 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1187 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1188 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1189 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1190 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1191 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1192 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1193 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1194 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1195 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1196 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1197 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1198 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1199 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1200 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1201 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1202 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1203 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1204 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1205 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1206 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1207 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1208 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1209 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1210 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1211 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1212 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1213 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1214 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1215 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1216 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1217 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1218 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1219 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1220 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1221 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1222 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1223 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1224 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1225 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1226 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1227 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1228 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1229 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1230 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1231 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1232 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1233 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1234 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1235 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1236 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1237 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1238 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1239 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1240 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1241 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1242 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1243 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1244 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1245 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1246 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1247 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1248 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1249 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1250 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1251 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1252 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1253 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1254 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1255 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1256 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1257 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1258 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1259 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1260 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1261 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1262 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1263 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1264 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1265 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1266 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1267 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1268 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1269 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1270 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1271 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1272 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1273 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1274 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1275 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1276 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1277 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1278 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1279 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1280 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1281 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1282 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1283 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1284 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1285 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1286 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1287 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1288 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1289 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1290 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1291 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1292 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1293 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1294 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1295 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1296 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1297 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1298 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1299 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1300 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1301 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1302 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1303 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1304 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1305 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1306 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1307 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1308 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1309 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1310 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1311 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1312 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1313 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1314 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1315 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1316 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1317 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1318 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1319 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1320 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1321 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1322 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1323 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1324 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1325 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1326 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1327 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1328 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1329 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1330 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1331 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1332 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1333 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1334 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1335 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1336 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1337 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1338 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1339 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1340 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1341 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1342 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1343 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1344 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1345 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1346 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1347 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1348 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1349 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1350 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1351 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1352 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1353 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1354 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1355 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1356 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1357 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1358 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1359 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1360 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1361 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1362 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1363 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1364 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1365 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1366 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1367 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1368 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1369 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1370 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1371 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1372 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1373 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1374 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1375 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1376 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1377 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1378 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1379 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1380 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1381 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1382 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1383 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1384 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1385 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1386 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1387 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1388 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1389 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1390 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1391 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1392 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1393 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1394 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1395 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1396 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1397 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1398 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1399 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1400 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1401 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1402 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1403 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1404 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1405 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1406 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1407 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1408 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1409 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1410 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1411 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1412 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1413 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1414 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1415 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1416 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1417 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1418 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1419 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1420 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1421 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1422 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1423 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1424 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1425 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1426 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1427 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1428 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1429 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1430 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1431 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1432 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1433 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1434 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1435 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1436 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1437 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1438 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1439 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1440 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1441 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1442 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1443 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1444 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1445 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1446 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1447 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1448 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1449 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1450 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1451 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1452 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1453 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1454 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1455 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1456 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1457 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1458 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1459 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1460 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1461 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1462 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1463 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1464 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1465 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1466 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1467 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1468 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1469 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1470 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1471 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1472 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1473 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1474 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1475 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1476 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1477 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1478 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1479 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1480 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1481 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1482 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1483 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1484 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1485 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1486 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1487 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1488 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1489 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1490 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1491 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1492 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1493 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1494 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1495 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1496 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1497 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1498 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1499 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1500 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1501 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1502 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1503 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1504 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1505 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1506 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1507 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1508 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1509 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1510 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1511 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1512 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1513 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1514 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1515 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1516 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1517 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1518 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1519 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1520 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1521 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1522 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1523 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1524 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1525 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1526 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1527 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1528 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1529 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1530 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1531 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1532 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1533 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1534 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1535 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1536 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1537 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1538 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1539 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1540 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1541 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1542 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1543 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1544 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1545 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1546 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1547 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1548 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1549 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1550 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1551 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1552 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1553 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1554 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1555 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1556 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1557 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1558 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1559 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1560 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1561 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1562 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1563 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1564 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1565 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1566 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1567 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1568 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1569 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1570 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1571 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1572 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1573 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1574 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1575 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1576 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1577 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1578 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1579 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1580 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1581 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1582 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1583 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1584 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1585 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1586 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1587 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1588 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1589 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1590 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1591 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1592 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1593 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1594 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1595 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1596 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1597 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1598 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1599 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1600 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1601 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1602 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1603 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1604 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1605 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1606 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1607 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1608 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1609 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1610 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1611 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1612 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1613 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1614 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1615 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1616 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1617 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1618 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1619 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1620 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1621 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1622 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1623 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1624 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1625 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1626 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1627 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1628 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1629 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1630 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1631 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1632 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1633 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1634 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1635 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1636 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1637 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1638 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1639 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1640 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1641 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1642 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1643 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1644 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1645 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1646 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1647 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1648 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1649 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1650 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1651 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1652 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1653 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1654 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1655 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1656 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1657 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1658 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1659 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1660 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1661 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1662 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1663 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1664 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1665 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1666 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1667 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1668 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1669 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1670 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1671 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1672 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1673 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1674 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1675 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1676 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1677 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1678 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1679 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1680 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1681 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1682 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1683 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1684 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1685 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1686 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1687 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1688 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1689 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1690 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1691 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1692 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1693 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1694 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1695 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1696 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1697 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1698 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1699 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1700 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1701 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1702 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1703 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1704 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1705 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1706 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1707 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1708 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1709 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1710 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1711 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1712 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1713 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1714 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1715 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1716 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1717 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1718 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1719 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1720 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1721 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1722 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1723 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1724 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1725 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1726 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1727 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1728 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1729 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1730 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1731 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1732 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1733 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1734 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1735 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1736 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1737 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1738 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1739 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1740 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1741 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1742 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1743 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1744 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1745 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1746 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1747 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1748 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1749 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1750 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1751 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1752 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1753 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1754 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1755 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1756 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1757 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1758 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1759 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1760 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1761 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1762 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1763 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1764 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1765 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1766 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1767 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1768 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1769 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1770 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1771 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1772 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1773 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1774 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1775 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1776 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1777 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1778 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1779 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1780 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1781 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1782 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1783 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1784 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1785 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1786 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_1787 (
    .VGND(vgnd),
    .VPWR(vpwr)
);

sky130_fd_sc_hd__clkbuf_16 clkbuf_0_clk_1_0 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(clk_1_0),
    .X(clknet_0_clk_1_0)
);

sky130_fd_sc_hd__clkbuf_1 clkbuf_1_0_0_clk_1_0 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(clknet_0_clk_1_0),
    .X(clknet_1_0_0_clk_1_0)
);

sky130_fd_sc_hd__clkbuf_1 clkbuf_1_1_0_clk_1_0 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(clknet_0_clk_1_0),
    .X(clknet_1_1_0_clk_1_0)
);

sky130_fd_sc_hd__clkbuf_16 clkbuf_0_clk_1_256 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(clk_1_256),
    .X(clknet_0_clk_1_256)
);

sky130_fd_sc_hd__clkbuf_1 clkbuf_1_0_0_clk_1_256 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(clknet_0_clk_1_256),
    .X(clknet_1_0_0_clk_1_256)
);

sky130_fd_sc_hd__clkbuf_1 clkbuf_1_1_0_clk_1_256 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(clknet_0_clk_1_256),
    .X(clknet_1_1_0_clk_1_256)
);

sky130_fd_sc_hd__clkbuf_16 clkbuf_0_clk_2_0 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(clk_2_0),
    .X(clknet_0_clk_2_0)
);

sky130_fd_sc_hd__clkbuf_1 clkbuf_1_0_0_clk_2_0 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(clknet_0_clk_2_0),
    .X(clknet_1_0_0_clk_2_0)
);

sky130_fd_sc_hd__clkbuf_1 clkbuf_1_1_0_clk_2_0 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .A(clknet_0_clk_2_0),
    .X(clknet_1_1_0_clk_2_0)
);

sky130_fd_sc_hd__diode_2 ANTENNA__CTS_root_A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(CLK)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3777__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3776__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3775__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3774__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3773__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3772__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3771__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3770__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3769__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3768__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3767__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3766__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3765__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3764__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3763__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3762__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3761__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3760__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3759__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3758__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3757__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3756__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3755__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3754__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3753__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3752__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3751__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3750__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3749__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3748__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3747__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3746__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3745__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3744__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3743__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3742__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3741__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3740__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3739__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3738__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3737__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3736__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3735__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3734__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3733__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3732__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3731__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3730__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3729__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3728__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3727__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3726__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3725__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3724__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3723__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3722__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3721__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3720__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3719__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3718__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3717__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3716__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3715__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3714__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3713__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3712__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3711__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3710__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3709__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3708__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3707__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3706__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3705__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3704__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3703__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3702__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3701__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3700__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3699__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3698__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3697__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3696__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3695__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3694__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3693__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3692__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3691__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3690__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3689__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3688__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3687__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3686__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3685__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3684__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3683__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3682__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3681__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3680__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3679__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3678__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3677__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3676__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3675__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3674__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3673__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3672__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3671__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3670__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3669__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3668__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3667__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3666__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3665__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3664__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3663__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3662__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3661__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3660__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3659__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3658__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3657__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3656__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3655__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3654__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3653__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3652__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3651__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3650__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3649__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3648__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3647__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3646__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3645__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3644__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3643__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3642__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3641__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3640__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3639__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3638__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3637__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3636__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3635__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3634__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3633__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3632__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3631__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3630__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3629__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3628__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3627__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3626__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3625__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3624__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3623__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3622__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3621__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3620__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3619__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3618__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3617__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3616__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3615__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3614__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3613__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3612__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3611__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3610__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3609__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3608__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3607__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3606__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3605__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3604__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3603__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3602__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3601__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3600__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3599__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3598__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3597__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3596__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3595__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3594__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3593__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3592__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3591__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3590__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3589__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3588__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3587__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3586__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3585__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3584__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3583__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3582__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3581__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3580__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3579__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3578__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3577__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3576__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3575__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3574__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3573__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3572__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3571__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3570__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3569__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3568__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3567__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3566__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3565__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3564__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3563__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3562__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3561__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3560__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3559__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3558__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3557__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3556__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3555__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3554__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3553__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3552__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3551__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3550__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3549__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3548__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3547__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3546__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3545__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3544__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3543__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3542__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3541__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3540__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3539__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3538__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3537__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3536__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3535__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3534__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3533__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3532__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3531__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3530__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3529__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3528__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3527__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3526__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3525__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3524__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3523__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3522__CLK (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3391__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3387__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COMPLETE)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3500__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COUNT[0])
);

sky130_fd_sc_hd__diode_2 ANTENNA__3474__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COUNT[0])
);

sky130_fd_sc_hd__diode_2 ANTENNA__3438__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COUNT[0])
);

sky130_fd_sc_hd__diode_2 ANTENNA__3402__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COUNT[0])
);

sky130_fd_sc_hd__diode_2 ANTENNA__3457__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COUNT[1])
);

sky130_fd_sc_hd__diode_2 ANTENNA__3438__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COUNT[1])
);

sky130_fd_sc_hd__diode_2 ANTENNA__3401__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COUNT[1])
);

sky130_fd_sc_hd__diode_2 ANTENNA__3459__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COUNT[2])
);

sky130_fd_sc_hd__diode_2 ANTENNA__3438__C (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COUNT[2])
);

sky130_fd_sc_hd__diode_2 ANTENNA__3404__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COUNT[2])
);

sky130_fd_sc_hd__diode_2 ANTENNA__3437__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COUNT[3])
);

sky130_fd_sc_hd__diode_2 ANTENNA__3403__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COUNT[3])
);

sky130_fd_sc_hd__diode_2 ANTENNA__3439__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COUNT[4])
);

sky130_fd_sc_hd__diode_2 ANTENNA__3400__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COUNT[4])
);

sky130_fd_sc_hd__diode_2 ANTENNA__2005__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COUNT[4])
);

sky130_fd_sc_hd__diode_2 ANTENNA__1930__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COUNT[4])
);

sky130_fd_sc_hd__diode_2 ANTENNA__3439__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COUNT[5])
);

sky130_fd_sc_hd__diode_2 ANTENNA__3407__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COUNT[5])
);

sky130_fd_sc_hd__diode_2 ANTENNA__2007__C (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COUNT[5])
);

sky130_fd_sc_hd__diode_2 ANTENNA__1838__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(COUNT[5])
);

sky130_fd_sc_hd__diode_2 ANTENNA__3466__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(INTERNAL_FINISH)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3465__C (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(INTERNAL_FINISH)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3447__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(INTERNAL_FINISH)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3387__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(INTERNAL_FINISH)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1974__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(INTERNAL_FINISH)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3428__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(OUT[0])
);

sky130_fd_sc_hd__diode_2 ANTENNA__3398__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(OUT[0])
);

sky130_fd_sc_hd__diode_2 ANTENNA__1792__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(OUT[10])
);

sky130_fd_sc_hd__diode_2 ANTENNA__1800__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(OUT[11])
);

sky130_fd_sc_hd__diode_2 ANTENNA__1808__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(OUT[12])
);

sky130_fd_sc_hd__diode_2 ANTENNA__1815__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(OUT[13])
);

sky130_fd_sc_hd__diode_2 ANTENNA__1822__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(OUT[14])
);

sky130_fd_sc_hd__diode_2 ANTENNA__1833__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(OUT[15])
);

sky130_fd_sc_hd__diode_2 ANTENNA__1832__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(OUT[15])
);

sky130_fd_sc_hd__diode_2 ANTENNA__1837__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(OUT[16])
);

sky130_fd_sc_hd__diode_2 ANTENNA__1852__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(OUT[17])
);

sky130_fd_sc_hd__diode_2 ANTENNA__1851__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(OUT[17])
);

sky130_fd_sc_hd__diode_2 ANTENNA__1855__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(OUT[18])
);

sky130_fd_sc_hd__diode_2 ANTENNA__1860__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(OUT[19])
);

sky130_fd_sc_hd__diode_2 ANTENNA__3463__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(OUT[1])
);

sky130_fd_sc_hd__diode_2 ANTENNA__1866__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(OUT[20])
);

sky130_fd_sc_hd__diode_2 ANTENNA__1872__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(OUT[21])
);

sky130_fd_sc_hd__diode_2 ANTENNA__1879__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(OUT[22])
);

sky130_fd_sc_hd__diode_2 ANTENNA__1885__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(OUT[23])
);

sky130_fd_sc_hd__diode_2 ANTENNA__1890__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(OUT[24])
);

sky130_fd_sc_hd__diode_2 ANTENNA__1896__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(OUT[25])
);

sky130_fd_sc_hd__diode_2 ANTENNA__1902__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(OUT[26])
);

sky130_fd_sc_hd__diode_2 ANTENNA__1909__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(OUT[27])
);

sky130_fd_sc_hd__diode_2 ANTENNA__1914__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(OUT[28])
);

sky130_fd_sc_hd__diode_2 ANTENNA__1919__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(OUT[29])
);

sky130_fd_sc_hd__diode_2 ANTENNA__3471__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(OUT[2])
);

sky130_fd_sc_hd__diode_2 ANTENNA__1924__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(OUT[30])
);

sky130_fd_sc_hd__diode_2 ANTENNA__1931__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(OUT[31])
);

sky130_fd_sc_hd__diode_2 ANTENNA__3488__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(OUT[3])
);

sky130_fd_sc_hd__diode_2 ANTENNA__3498__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(OUT[4])
);

sky130_fd_sc_hd__diode_2 ANTENNA__3510__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(OUT[5])
);

sky130_fd_sc_hd__diode_2 ANTENNA__3518__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(OUT[6])
);

sky130_fd_sc_hd__diode_2 ANTENNA__1766__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(OUT[7])
);

sky130_fd_sc_hd__diode_2 ANTENNA__1776__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(OUT[8])
);

sky130_fd_sc_hd__diode_2 ANTENNA__1784__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(OUT[9])
);

sky130_fd_sc_hd__diode_2 ANTENNA__3451__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(READY)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2007__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(READY)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1989__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(READY)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4077__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4076__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4075__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4074__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4073__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4072__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4071__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4070__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4069__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4068__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4067__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4066__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4065__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4064__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4063__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4062__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4061__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4060__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4059__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4058__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4057__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4056__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4055__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4054__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4053__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4052__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4051__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4050__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4049__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4048__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4047__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4046__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4045__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4044__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4043__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4042__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4041__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4040__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4039__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4038__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4037__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4036__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4035__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4034__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4033__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4032__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4031__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4030__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4029__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4028__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4027__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4026__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4025__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4024__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4023__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4022__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4021__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4020__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4019__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4018__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4017__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4016__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4015__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4014__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4013__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4012__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4011__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4010__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4009__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4008__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4007__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4006__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4005__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4004__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4003__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4002__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4001__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4000__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3999__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3998__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3997__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3996__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3995__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3994__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3993__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3992__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3991__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3990__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3989__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3988__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3987__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3986__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3985__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3984__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3983__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3982__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3981__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3980__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3979__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3978__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3977__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3976__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3975__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3974__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3973__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3972__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3971__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3970__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3969__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3968__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3967__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3966__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3965__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3964__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3963__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3962__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3961__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3960__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3959__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3958__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3957__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3956__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3955__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3954__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3953__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3952__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3951__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3950__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3949__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3948__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3947__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3946__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3945__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3944__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3943__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3942__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3941__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3940__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3939__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3938__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3937__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3936__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3935__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3934__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3933__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3932__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3931__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3930__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3929__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3928__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3927__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3926__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3925__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3924__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3923__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3922__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3921__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3920__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3919__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3918__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3917__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3916__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3915__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3914__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3913__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3912__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3911__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3910__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3909__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3908__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3907__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3906__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3905__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3904__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3903__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3902__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3901__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3900__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3899__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3898__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3897__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3896__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3895__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3894__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3893__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3892__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3891__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3890__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3889__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3888__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3887__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3886__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3885__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3884__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3883__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3882__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3881__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3880__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3879__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3878__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3877__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3876__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3875__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3874__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3873__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3872__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3871__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3870__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3869__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3868__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3867__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3866__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3865__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3864__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3863__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3862__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3861__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3860__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3859__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3858__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3857__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3856__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3855__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3854__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3853__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3852__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3851__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3850__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3849__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3848__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3847__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3846__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3845__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3844__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3843__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3842__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3841__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3840__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3839__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3838__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3837__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3836__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3835__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3834__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3833__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3832__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3831__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3830__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3829__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3828__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3827__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3826__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3825__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3824__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3823__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3822__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3821__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3820__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3819__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3818__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3817__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3816__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3815__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3814__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3813__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3812__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3811__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3810__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3809__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3808__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3807__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3806__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3805__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3804__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3803__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3802__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3801__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3800__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3799__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3798__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3797__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3796__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3795__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3794__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3793__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3792__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3791__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3790__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3789__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3788__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3787__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3786__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3785__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3784__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3783__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3782__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3781__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3780__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3779__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3778__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3777__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3776__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3775__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3774__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3773__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3772__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3771__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3770__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3769__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3768__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3767__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3766__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3765__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3764__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3763__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3762__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3761__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3760__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3759__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3758__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3757__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3756__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3755__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3754__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3753__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3752__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3751__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3750__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3749__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3748__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3747__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3746__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3745__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3744__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3743__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3742__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3741__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3740__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3739__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3738__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3737__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3736__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3735__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3734__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3733__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3732__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3731__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3730__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3729__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3728__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3727__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3726__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3725__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3724__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3723__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3722__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3721__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3720__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3719__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3718__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3717__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3716__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3715__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3714__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3713__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3712__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3711__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3710__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3709__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3708__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3707__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3706__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3705__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3704__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3703__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3702__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3701__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3700__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3699__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3698__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3697__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3696__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3695__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3694__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3693__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3692__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3691__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3690__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3689__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3688__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3687__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3686__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3685__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3684__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3683__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3682__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3681__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3680__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3679__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3678__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3677__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3676__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3675__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3674__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3673__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3672__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3671__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3670__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3669__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3668__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3667__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3666__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3665__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3664__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3663__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3662__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3661__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3660__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3659__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3658__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3657__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3656__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3655__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3654__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3653__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3652__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3651__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3650__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3649__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3648__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3647__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3646__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3645__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3644__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3643__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3642__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3641__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3640__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3639__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3638__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3637__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3636__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3635__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3634__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3633__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3632__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3631__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3630__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3629__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3628__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3627__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3626__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3625__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3624__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3623__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3622__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3621__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3620__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3619__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3618__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3617__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3616__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3615__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3614__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3613__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3612__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3611__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3610__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3609__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3608__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3607__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3606__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3605__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3604__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3603__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3602__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3601__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3600__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3599__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3598__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3597__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3596__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3595__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3594__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3593__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3592__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3591__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3590__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3589__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3588__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3587__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3586__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3585__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3584__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3583__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3582__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3581__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3580__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3579__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3578__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3577__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3576__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3575__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3574__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3573__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3572__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3571__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3570__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3569__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3568__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3567__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3566__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3565__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3564__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3563__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3562__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3561__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3560__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3559__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3558__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3557__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3556__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3555__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3554__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3553__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3552__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3551__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3550__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3549__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3548__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3547__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3546__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3545__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3544__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3543__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3542__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3541__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3540__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3539__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3538__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3537__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3536__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3535__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3534__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3533__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3532__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3531__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3530__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3529__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3528__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3527__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3526__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3525__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3524__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3523__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3522__RESET_B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(RESET)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3422__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(SAMPLE_COUNT[0])
);

sky130_fd_sc_hd__diode_2 ANTENNA__3419__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(SAMPLE_COUNT[0])
);

sky130_fd_sc_hd__diode_2 ANTENNA__3396__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(SAMPLE_COUNT[0])
);

sky130_fd_sc_hd__diode_2 ANTENNA__1943__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(SAMPLE_COUNT[0])
);

sky130_fd_sc_hd__diode_2 ANTENNA__3423__C (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(SAMPLE_COUNT[1])
);

sky130_fd_sc_hd__diode_2 ANTENNA__3419__C (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(SAMPLE_COUNT[1])
);

sky130_fd_sc_hd__diode_2 ANTENNA__3395__C (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(SAMPLE_COUNT[1])
);

sky130_fd_sc_hd__diode_2 ANTENNA__1956__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(SAMPLE_COUNT[1])
);

sky130_fd_sc_hd__diode_2 ANTENNA__3423__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(SAMPLE_COUNT[2])
);

sky130_fd_sc_hd__diode_2 ANTENNA__3419__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(SAMPLE_COUNT[2])
);

sky130_fd_sc_hd__diode_2 ANTENNA__3416__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(SAMPLE_COUNT[2])
);

sky130_fd_sc_hd__diode_2 ANTENNA__3394__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(SAMPLE_COUNT[2])
);

sky130_fd_sc_hd__diode_2 ANTENNA__3418__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(SAMPLE_COUNT[3])
);

sky130_fd_sc_hd__diode_2 ANTENNA__3393__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(SAMPLE_COUNT[3])
);

sky130_fd_sc_hd__diode_2 ANTENNA__3413__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(SERIAL_IN)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3778__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0000_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3788__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0001_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3789__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0002_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3790__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0003_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3791__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0004_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3792__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0005_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3793__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0006_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3794__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0007_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3795__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0008_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3796__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0009_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3797__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0010_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3779__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0011_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3798__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0012_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3799__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0013_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3800__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0014_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3801__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0015_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3802__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0016_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3803__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0017_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3804__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0018_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3805__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0019_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3806__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0020_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3807__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0021_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3780__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0022_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3808__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0023_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3809__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0024_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3781__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0025_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3782__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0026_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3783__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0027_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3784__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0028_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3785__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0029_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3786__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0030_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3787__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0031_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4077__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0032_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4066__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0033_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4067__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0034_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4068__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0035_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4069__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0036_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4070__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0037_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4071__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0038_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4076__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0039_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4072__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0040_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4073__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0041_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4074__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0042_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4075__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0043_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3810__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0044_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3820__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0045_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3821__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0046_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3822__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0047_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3823__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0048_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3824__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0049_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3825__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0050_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3826__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0051_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3827__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0052_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3828__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0053_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3829__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0054_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3811__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0055_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3830__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0056_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3831__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0057_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3832__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0058_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3833__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0059_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3834__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0060_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3835__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0061_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3836__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0062_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3837__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0063_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3838__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0064_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3839__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0065_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3812__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0066_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3840__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0067_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3841__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0068_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3813__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0069_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3814__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0070_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3815__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0071_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3816__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0072_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3817__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0073_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3818__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0074_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3819__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0075_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3842__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0076_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3852__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0077_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3853__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0078_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3854__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0079_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3855__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0080_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3856__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0081_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3857__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0082_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3858__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0083_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3859__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0084_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3860__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0085_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3861__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0086_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3843__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0087_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3862__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0088_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3863__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0089_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3864__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0090_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3865__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0091_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3866__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0092_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3867__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0093_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3868__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0094_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3869__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0095_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3870__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0096_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3871__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0097_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3844__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0098_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3872__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0099_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3873__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0100_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3845__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0101_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3846__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0102_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3847__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0103_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3848__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0104_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3849__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0105_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3850__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0106_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3851__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0107_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3874__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0108_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3884__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0109_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3885__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0110_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3886__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0111_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3887__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0112_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3888__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0113_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3889__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0114_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3890__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0115_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3891__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0116_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3892__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0117_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3893__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0118_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3875__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0119_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3894__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0120_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3895__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0121_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3896__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0122_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3897__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0123_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3898__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0124_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3899__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0125_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3900__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0126_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3901__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0127_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3902__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0128_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3903__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0129_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3876__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0130_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3904__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0131_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3905__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0132_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3877__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0133_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3878__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0134_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3879__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0135_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3880__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0136_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3881__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0137_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3882__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0138_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3883__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0139_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3906__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0140_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3916__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0141_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3917__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0142_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3918__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0143_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3919__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0144_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3920__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0145_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3921__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0146_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3922__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0147_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3923__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0148_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3924__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0149_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3925__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0150_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3907__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0151_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3926__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0152_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3927__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0153_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3928__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0154_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3929__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0155_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3930__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0156_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3931__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0157_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3932__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0158_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3933__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0159_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3934__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0160_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3935__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0161_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3908__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0162_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3936__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0163_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3937__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0164_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3909__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0165_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3910__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0166_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3911__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0167_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3912__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0168_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3913__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0169_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3914__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0170_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3915__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0171_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3938__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0172_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3948__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0173_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3949__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0174_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3950__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0175_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3951__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0176_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3952__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0177_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3953__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0178_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3954__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0179_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3955__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0180_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3956__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0181_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3957__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0182_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3939__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0183_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3958__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0184_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3959__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0185_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3960__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0186_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3961__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0187_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3962__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0188_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3963__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0189_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3964__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0190_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3965__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0191_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3966__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0192_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3967__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0193_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3940__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0194_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3968__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0195_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3969__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0196_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3941__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0197_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3942__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0198_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3943__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0199_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3944__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0200_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3945__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0201_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3946__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0202_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3947__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0203_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3970__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0204_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3980__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0205_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3981__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0206_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3982__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0207_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3983__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0208_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3984__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0209_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3985__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0210_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3986__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0211_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3987__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0212_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3988__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0213_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3989__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0214_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3971__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0215_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3990__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0216_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3991__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0217_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3992__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0218_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3993__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0219_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3994__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0220_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3995__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0221_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3996__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0222_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3997__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0223_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3998__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0224_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3999__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0225_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3972__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0226_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4000__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0227_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4001__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0228_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3973__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0229_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3974__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0230_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3975__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0231_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3976__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0232_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3977__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0233_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3978__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0234_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3979__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0235_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4002__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0236_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4012__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0237_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4013__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0238_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4014__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0239_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4015__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0240_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4016__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0241_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4017__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0242_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4018__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0243_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4019__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0244_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4020__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0245_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4021__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0246_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4003__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0247_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4022__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0248_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4023__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0249_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4024__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0250_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4025__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0251_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4026__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0252_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4027__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0253_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4028__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0254_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4029__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0255_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4030__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0256_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4031__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0257_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4004__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0258_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4032__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0259_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4033__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0260_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4005__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0261_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4006__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0262_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4007__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0263_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4008__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0264_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4009__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0265_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4010__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0266_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4011__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0267_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4034__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0268_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4044__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0269_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4045__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0270_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4046__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0271_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4047__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0272_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4048__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0273_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4049__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0274_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4050__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0275_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4051__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0276_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4052__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0277_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4053__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0278_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4035__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0279_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4054__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0280_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4055__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0281_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4056__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0282_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4057__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0283_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4058__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0284_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4059__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0285_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4060__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0286_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4061__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0287_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4062__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0288_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4063__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0289_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4036__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0290_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4064__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0291_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4065__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0292_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4037__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0293_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4038__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0294_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4039__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0295_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4040__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0296_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4041__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0297_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4042__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0298_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__4043__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0299_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2050__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0300_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2044__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0300_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2037__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0300_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2031__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0300_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2024__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0300_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2025__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0301_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2031__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0302_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2030__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0302_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2057__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0303_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2049__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0303_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2043__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0303_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2036__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0303_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2030__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0303_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3237__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0304_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3075__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0304_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2914__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0304_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2029__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0304_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2755__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0305_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2593__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0305_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2428__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0305_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2263__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0305_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2030__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0305_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2031__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0306_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2032__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0307_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2037__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0308_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2036__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0308_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3243__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0309_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3079__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0309_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2918__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0309_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2035__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0309_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2759__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0310_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2598__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0310_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2432__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0310_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2267__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0310_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2036__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0310_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2037__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0311_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2038__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0312_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2044__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0313_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2043__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0313_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2069__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0314_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2063__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0314_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2055__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0314_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2047__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0314_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2041__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0314_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3247__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0315_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3086__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0315_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2922__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0315_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2042__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0315_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2763__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0316_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2602__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0316_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2438__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0316_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2271__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0316_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2043__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0316_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2044__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0317_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2045__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0318_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2050__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0319_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2049__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0319_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3251__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0320_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3090__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0320_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2928__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0320_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2048__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0320_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2767__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0321_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2606__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0321_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2442__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0321_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2276__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0321_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2049__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0321_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2050__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0322_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2051__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0323_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2086__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0324_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2080__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0324_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2073__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0324_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2067__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0324_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2060__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0324_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2085__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0325_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2079__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0325_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2072__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0325_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2066__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0325_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2059__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0325_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2059__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0326_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2057__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0326_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3256__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0327_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3095__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0327_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2933__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0327_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2056__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0327_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2773__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0328_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2611__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0328_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2447__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0328_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2281__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0328_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2057__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0328_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2059__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0329_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2085__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0330_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2079__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0330_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2072__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0330_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2066__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0330_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2059__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0330_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2060__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0331_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2066__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0332_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2065__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0332_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2092__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0333_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2084__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0333_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2078__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0333_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2071__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0333_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2065__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0333_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3261__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0334_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3100__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0334_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2938__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0334_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2064__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0334_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2779__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0335_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2618__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0335_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2453__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0335_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2287__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0335_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2065__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0335_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2066__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0336_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2067__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0337_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2072__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0338_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2071__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0338_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3267__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0339_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3104__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0339_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2942__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0339_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2070__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0339_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2783__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0340_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2623__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0340_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2457__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0340_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2291__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0340_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2071__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0340_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2072__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0341_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2073__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0342_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2079__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0343_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2078__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0343_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2104__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0344_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2098__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0344_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2090__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0344_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2082__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0344_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2076__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0344_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3271__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0345_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3110__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0345_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2946__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0345_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2077__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0345_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2787__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0346_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2627__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0346_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2462__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0346_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2295__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0346_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2078__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0346_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2079__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0347_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2080__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0348_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2085__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0349_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2084__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0349_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3275__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0350_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3114__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0350_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2953__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0350_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2083__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0350_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2791__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0351_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2631__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0351_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2466__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0351_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2301__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0351_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2084__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0351_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2085__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0352_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2086__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0353_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2121__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0354_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2115__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0354_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2108__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0354_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2102__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0354_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2095__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0354_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2120__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0355_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2114__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0355_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2107__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0355_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2101__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0355_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2094__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0355_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2094__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0356_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2092__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0356_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3280__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0357_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3119__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0357_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2958__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0357_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2091__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0357_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2797__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0358_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2636__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0358_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2471__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0358_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2306__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0358_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2092__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0358_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2094__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0359_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2120__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0360_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2114__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0360_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2107__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0360_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2101__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0360_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2094__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0360_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2095__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0361_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2101__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0362_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2100__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0362_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2129__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0363_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2119__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0363_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2113__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0363_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2106__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0363_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2100__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0363_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3285__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0364_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3124__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0364_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2963__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0364_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2099__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0364_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2803__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0365_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2642__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0365_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2478__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0365_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2312__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0365_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2100__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0365_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2101__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0366_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2102__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0367_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2107__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0368_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2106__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0368_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3291__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0369_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3128__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0369_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2967__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0369_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2105__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0369_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2807__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0370_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2647__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0370_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2482__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0370_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2316__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0370_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2106__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0370_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2107__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0371_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2108__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0372_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2114__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0373_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2113__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0373_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2141__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0374_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2135__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0374_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2127__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0374_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2117__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0374_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2111__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0374_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3295__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0375_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3135__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0375_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2971__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0375_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2112__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0375_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2811__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0376_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2651__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0376_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2487__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0376_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2320__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0376_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2113__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0376_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2114__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0377_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2115__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0378_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2120__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0379_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2119__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0379_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3299__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0380_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3139__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0380_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2977__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0380_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2118__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0380_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2815__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0381_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2655__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0381_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2491__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0381_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2325__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0381_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2119__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0381_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2120__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0382_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2121__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0383_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2693__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0384_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2557__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0384_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2435__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0384_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2298__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0384_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2123__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0384_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2274__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0385_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2229__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0385_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2195__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0385_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2159__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0385_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2124__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0385_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2158__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0386_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2152__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0386_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2145__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0386_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2139__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0386_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2132__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0386_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2157__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0387_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2151__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0387_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2144__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0387_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2138__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0387_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2131__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0387_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2131__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0388_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2129__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0388_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3304__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0389_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3144__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0389_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2982__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0389_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2128__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0389_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2821__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0390_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2660__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0390_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2496__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0390_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2330__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0390_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2129__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0390_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2131__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0391_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2157__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0392_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2151__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0392_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2144__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0392_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2138__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0392_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2131__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0392_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2132__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0393_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2138__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0394_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2137__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0394_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2164__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0395_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2156__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0395_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2150__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0395_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2143__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0395_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2137__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0395_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3309__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0396_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3149__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0396_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2987__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0396_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2136__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0396_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2828__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0397_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2666__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0397_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2502__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0397_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2338__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0397_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2137__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0397_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2138__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0398_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2139__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0399_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2144__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0400_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2143__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0400_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3315__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0401_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3153__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0401_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2991__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0401_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2142__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0401_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2832__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0402_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2671__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0402_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2506__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0402_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2342__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0402_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2143__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0402_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2144__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0403_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2145__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0404_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2151__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0405_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2150__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0405_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2177__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0406_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2171__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0406_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2162__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0406_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2154__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0406_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2148__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0406_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3319__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0407_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3159__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0407_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2995__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0407_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2149__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0407_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2836__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0408_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2675__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0408_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2511__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0408_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2346__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0408_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2150__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0408_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2151__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0409_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2152__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0410_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2157__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0411_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2156__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0411_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3323__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0412_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3163__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0412_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3002__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0412_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2155__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0412_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2840__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0413_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2679__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0413_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2515__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0413_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2351__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0413_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2156__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0413_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2157__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0414_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2158__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0415_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2194__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0416_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2188__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0416_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2181__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0416_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2175__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0416_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2167__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0416_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2193__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0417_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2187__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0417_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2180__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0417_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2174__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0417_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2166__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0417_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2166__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0418_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2164__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0418_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3328__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0419_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3168__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0419_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3007__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0419_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2163__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0419_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2846__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0420_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2684__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0420_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2520__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0420_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2356__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0420_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2164__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0420_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2166__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0421_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2193__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0422_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2187__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0422_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2180__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0422_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2174__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0422_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2166__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0422_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2167__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0423_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2174__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0424_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2173__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0424_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2311__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0425_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2286__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0425_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2262__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0425_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2205__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0425_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2170__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0425_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2200__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0426_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2192__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0426_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2186__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0426_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2179__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0426_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2173__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0426_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3333__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0427_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3173__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0427_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3012__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0427_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2172__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0427_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2852__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0428_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2690__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0428_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2526__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0428_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2362__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0428_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2173__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0428_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2174__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0429_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2175__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0430_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2180__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0431_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2179__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0431_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3339__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0432_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3177__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0432_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3016__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0432_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2178__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0432_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2856__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0433_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2696__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0433_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2530__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0433_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2366__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0433_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2179__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0433_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2180__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0434_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2181__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0435_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2187__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0436_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2186__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0436_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2212__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0437_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2206__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0437_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2198__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0437_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2190__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0437_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2184__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0437_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3343__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0438_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3183__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0438_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3020__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0438_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2185__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0438_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2860__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0439_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2700__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0439_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2535__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0439_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2370__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0439_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2186__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0439_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2187__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0440_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2188__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0441_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2193__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0442_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2192__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0442_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3347__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0443_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3187__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0443_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3026__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0443_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2191__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0443_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2864__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0444_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2704__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0444_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2539__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0444_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2375__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0444_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2192__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0444_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2193__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0445_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2194__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0446_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2228__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0447_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2222__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0447_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2216__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0447_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2210__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0447_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2203__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0447_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2227__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0448_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2221__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0448_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2215__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0448_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2209__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0448_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2202__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0448_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2202__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0449_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2200__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0449_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3352__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0450_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3192__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0450_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3031__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0450_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2199__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0450_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2871__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0451_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2709__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0451_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2544__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0451_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2380__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0451_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2200__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0451_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2202__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0452_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2227__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0453_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2221__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0453_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2215__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0453_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2209__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0453_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2202__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0453_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2203__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0454_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2209__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0455_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2208__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0455_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2233__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0456_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2226__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0456_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2220__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0456_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2214__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0456_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2208__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0456_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3357__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0457_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3197__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0457_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3036__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0457_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2207__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0457_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2877__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0458_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2715__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0458_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2550__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0458_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2386__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0458_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2208__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0458_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2209__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0459_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2210__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0460_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2215__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0461_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2214__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0461_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3361__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0462_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3201__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0462_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3040__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0462_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2213__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0462_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2881__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0463_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2720__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0463_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2554__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0463_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2390__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0463_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2214__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0463_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2215__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0464_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2216__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0465_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2221__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0466_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2220__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0466_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3365__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0467_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3208__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0467_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3044__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0467_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2219__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0467_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2885__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0468_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2724__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0468_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2560__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0468_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2394__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0468_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2220__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0468_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2221__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0469_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2222__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0470_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2227__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0471_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2226__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0471_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3369__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0472_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3212__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0472_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3050__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0472_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2225__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0472_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2889__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0473_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2728__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0473_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2564__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0473_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2399__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0473_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2226__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0473_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2227__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0474_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2228__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0475_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2273__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0476_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2269__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0476_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2265__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0476_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2260__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0476_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2235__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0476_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2234__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0477_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2233__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0477_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3373__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0478_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3216__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0478_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3054__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0478_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2232__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0478_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2894__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0479_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2732__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0479_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2568__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0479_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2403__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0479_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2233__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0479_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2234__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0480_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2235__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0481_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3061__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0482_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2739__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0482_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2575__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0482_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2410__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0482_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2243__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0482_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2246__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0483_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2242__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0483_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2238__C (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0483_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2243__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0484_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2737__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0485_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2573__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0485_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2240__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0485_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3378__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0486_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3221__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0486_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3059__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0486_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2408__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0486_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2241__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0486_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2242__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0487_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2243__C (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0488_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2247__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0489_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3380__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0490_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3223__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0490_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2576__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0490_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2411__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0490_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2246__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0490_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3062__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0491_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2740__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0491_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2576__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0491_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2411__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0491_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2246__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0491_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2247__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0492_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2259__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0493_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2249__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0493_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2259__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0494_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2251__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0495_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2408__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0496_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2378__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0496_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2354__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0496_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2252__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0496_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2404__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0497_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2328__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0497_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2304__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0497_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2279__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0497_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2253__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0497_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2277__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0498_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2272__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0498_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2268__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0498_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2264__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0498_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2259__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0498_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2255__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0499_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2406__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0500_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2256__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0500_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2381__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0501_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2357__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0501_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2257__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0501_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2404__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0502_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2331__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0502_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2307__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0502_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2282__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0502_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2258__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0502_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2277__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0503_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2272__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0503_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2268__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0503_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2264__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0503_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2259__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0503_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2260__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0504_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2264__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0505_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2263__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0505_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2281__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0506_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2276__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0506_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2271__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0506_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2267__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0506_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2263__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0506_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2264__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0507_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2265__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0508_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2268__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0509_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2267__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0509_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2268__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0510_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2269__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0511_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2272__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0512_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2271__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0512_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2272__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0513_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2273__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0514_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2297__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0515_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2293__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0515_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2289__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0515_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2284__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0515_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2278__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0515_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2277__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0516_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2276__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0516_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2277__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0517_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2278__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0518_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2302__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0519_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2296__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0519_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2292__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0519_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2288__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0519_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2283__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0519_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2283__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0520_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2281__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0520_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2283__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0521_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2302__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0522_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2296__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0522_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2292__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0522_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2288__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0522_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2283__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0522_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2284__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0523_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2288__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0524_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2287__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0524_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2306__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0525_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2301__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0525_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2295__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0525_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2291__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0525_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2287__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0525_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2288__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0526_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2289__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0527_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2292__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0528_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2291__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0528_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2292__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0529_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2293__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0530_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2296__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0531_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2295__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0531_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2296__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0532_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2297__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0533_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2397__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0534_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2373__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0534_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2349__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0534_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2323__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0534_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2299__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0534_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2322__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0535_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2318__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0535_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2314__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0535_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2309__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0535_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2303__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0535_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2302__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0536_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2301__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0536_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2302__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0537_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2303__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0538_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2326__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0539_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2321__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0539_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2317__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0539_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2313__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0539_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2308__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0539_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2308__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0540_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2306__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0540_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2308__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0541_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2326__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0542_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2321__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0542_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2317__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0542_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2313__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0542_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2308__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0542_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2309__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0543_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2313__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0544_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2312__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0544_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2330__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0545_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2325__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0545_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2320__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0545_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2316__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0545_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2312__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0545_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2313__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0546_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2314__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0547_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2317__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0548_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2316__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0548_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2317__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0549_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2318__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0550_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2321__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0551_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2320__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0551_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2321__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0552_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2322__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0553_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2348__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0554_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2344__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0554_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2340__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0554_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2333__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0554_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2327__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0554_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2326__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0555_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2325__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0555_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2326__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0556_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2327__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0557_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2352__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0558_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2347__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0558_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2343__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0558_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2339__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0558_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2332__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0558_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2332__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0559_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2330__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0559_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2332__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0560_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2352__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0561_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2347__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0561_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2343__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0561_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2339__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0561_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2332__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0561_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2333__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0562_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2339__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0563_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2338__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0563_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2869__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0564_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2745__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0564_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2616__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0564_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2476__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0564_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2336__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0564_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2452__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0565_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2427__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0565_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2385__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0565_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2361__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0565_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2337__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0565_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2356__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0566_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2351__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0566_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2346__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0566_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2342__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0566_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2338__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0566_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2339__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0567_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2340__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0568_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2343__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0569_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2342__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0569_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2343__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0570_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2344__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0571_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2347__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0572_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2346__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0572_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2347__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0573_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2348__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0574_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2372__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0575_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2368__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0575_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2364__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0575_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2359__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0575_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2353__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0575_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2352__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0576_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2351__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0576_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2352__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0577_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2353__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0578_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2376__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0579_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2371__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0579_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2367__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0579_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2363__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0579_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2358__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0579_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2358__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0580_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2356__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0580_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2358__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0581_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2376__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0582_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2371__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0582_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2367__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0582_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2363__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0582_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2358__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0582_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2359__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0583_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2363__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0584_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2362__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0584_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2380__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0585_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2375__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0585_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2370__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0585_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2366__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0585_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2362__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0585_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2363__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0586_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2364__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0587_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2367__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0588_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2366__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0588_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2367__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0589_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2368__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0590_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2371__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0591_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2370__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0591_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2371__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0592_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2372__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0593_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2396__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0594_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2392__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0594_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2388__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0594_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2383__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0594_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2377__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0594_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2376__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0595_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2375__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0595_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2376__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0596_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2377__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0597_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2400__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0598_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2395__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0598_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2391__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0598_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2387__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0598_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2382__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0598_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2382__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0599_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2380__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0599_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2382__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0600_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2400__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0601_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2395__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0601_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2391__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0601_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2387__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0601_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2382__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0601_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2383__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0602_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2387__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0603_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2386__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0603_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2403__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0604_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2399__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0604_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2394__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0604_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2390__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0604_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2386__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0604_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2387__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0605_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2388__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0606_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2391__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0607_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2390__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0607_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2391__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0608_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2392__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0609_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2395__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0610_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2394__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0610_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2395__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0611_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2396__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0612_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2434__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0613_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2430__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0613_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2425__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0613_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2405__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0613_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2401__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0613_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2400__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0614_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2399__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0614_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2400__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0615_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2401__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0616_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2404__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0617_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2403__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0617_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2404__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0618_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2405__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0619_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2410__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0620_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2411__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0621_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2409__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0621_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2409__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0622_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2410__C (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0623_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2412__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0624_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2412__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0625_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2424__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0626_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2414__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0626_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2424__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0627_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2416__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0628_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2573__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0629_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2542__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0629_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2518__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0629_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2417__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0629_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2569__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0630_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2494__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0630_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2469__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0630_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2445__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0630_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2418__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0630_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2443__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0631_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2439__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0631_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2433__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0631_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2429__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0631_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2424__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0631_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2420__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0632_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2571__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0633_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2421__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0633_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2545__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0634_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2521__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0634_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2422__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0634_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2569__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0635_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2497__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0635_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2472__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0635_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2448__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0635_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2423__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0635_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2443__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0636_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2439__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0636_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2433__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0636_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2429__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0636_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2424__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0636_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2425__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0637_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2429__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0638_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2428__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0638_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2447__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0639_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2442__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0639_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2438__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0639_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2432__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0639_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2428__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0639_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2429__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0640_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2430__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0641_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2433__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0642_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2432__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0642_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2433__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0643_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2434__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0644_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2533__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0645_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2509__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0645_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2485__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0645_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2460__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0645_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2436__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0645_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2459__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0646_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2455__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0646_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2450__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0646_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2444__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0646_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2440__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0646_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2439__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0647_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2438__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0647_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2439__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0648_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2440__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0649_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2443__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0650_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2442__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0650_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2443__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0651_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2444__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0652_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2467__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0653_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2463__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0653_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2458__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0653_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2454__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0653_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2449__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0653_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2449__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0654_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2447__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0654_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2449__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0655_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2467__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0656_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2463__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0656_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2458__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0656_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2454__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0656_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2449__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0656_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2450__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0657_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2454__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0658_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2453__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0658_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2471__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0659_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2466__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0659_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2462__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0659_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2457__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0659_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2453__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0659_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2454__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0660_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2455__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0661_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2458__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0662_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2457__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0662_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2458__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0663_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2459__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0664_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2484__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0665_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2480__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0665_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2474__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0665_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2468__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0665_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2464__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0665_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2463__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0666_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2462__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0666_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2463__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0667_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2464__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0668_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2467__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0669_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2466__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0669_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2467__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0670_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2468__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0671_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2492__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0672_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2488__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0672_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2483__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0672_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2479__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0672_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2473__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0672_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2473__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0673_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2471__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0673_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2473__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0674_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2492__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0675_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2488__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0675_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2483__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0675_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2479__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0675_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2473__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0675_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2474__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0676_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2479__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0677_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2478__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0677_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2592__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0678_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2549__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0678_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2525__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0678_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2501__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0678_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2477__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0678_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2496__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0679_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2491__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0679_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2487__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0679_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2482__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0679_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2478__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0679_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2479__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0680_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2480__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0681_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2483__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0682_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2482__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0682_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2483__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0683_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2484__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0684_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2508__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0685_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2504__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0685_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2499__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0685_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2493__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0685_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2489__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0685_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2488__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0686_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2487__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0686_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2488__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0687_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2489__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0688_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2492__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0689_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2491__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0689_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2492__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0690_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2493__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0691_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2516__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0692_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2512__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0692_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2507__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0692_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2503__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0692_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2498__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0692_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2498__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0693_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2496__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0693_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2498__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0694_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2516__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0695_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2512__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0695_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2507__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0695_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2503__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0695_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2498__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0695_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2499__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0696_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2503__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0697_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2502__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0697_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2520__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0698_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2515__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0698_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2511__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0698_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2506__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0698_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2502__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0698_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2503__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0699_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2504__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0700_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2507__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0701_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2506__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0701_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2507__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0702_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2508__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0703_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2532__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0704_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2528__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0704_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2523__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0704_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2517__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0704_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2513__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0704_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2512__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0705_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2511__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0705_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2512__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0706_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2513__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0707_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2516__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0708_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2515__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0708_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2516__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0709_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2517__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0710_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2540__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0711_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2536__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0711_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2531__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0711_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2527__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0711_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2522__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0711_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2522__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0712_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2520__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0712_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2522__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0713_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2540__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0714_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2536__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0714_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2531__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0714_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2527__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0714_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2522__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0714_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2523__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0715_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2527__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0716_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2526__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0716_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2544__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0717_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2539__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0717_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2535__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0717_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2530__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0717_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2526__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0717_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2527__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0718_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2528__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0719_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2531__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0720_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2530__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0720_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2531__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0721_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2532__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0722_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2556__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0723_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2552__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0723_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2547__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0723_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2541__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0723_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2537__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0723_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2536__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0724_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2535__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0724_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2536__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0725_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2537__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0726_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2540__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0727_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2539__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0727_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2540__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0728_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2541__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0729_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2565__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0730_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2561__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0730_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2555__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0730_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2551__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0730_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2546__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0730_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2546__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0731_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2544__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0731_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2546__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0732_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2565__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0733_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2561__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0733_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2555__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0733_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2551__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0733_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2546__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0733_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2547__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0734_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2551__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0735_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2550__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0735_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2568__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0736_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2564__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0736_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2560__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0736_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2554__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0736_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2550__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0736_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2551__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0737_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2552__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0738_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2555__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0739_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2554__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0739_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2555__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0740_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2556__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0741_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2669__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0742_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2645__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0742_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2621__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0742_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2596__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0742_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2558__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0742_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2595__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0743_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2590__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0743_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2570__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0743_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2566__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0743_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2562__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0743_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2561__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0744_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2560__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0744_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2561__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0745_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2562__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0746_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2565__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0747_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2564__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0747_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2565__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0748_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2566__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0749_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2569__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0750_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2568__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0750_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2569__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0751_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2570__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0752_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2575__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0753_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2576__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0754_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2574__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0754_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2574__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0755_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2575__C (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0756_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2577__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0757_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2577__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0758_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2589__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0759_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2579__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0759_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2589__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0760_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2581__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0761_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2737__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0762_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2707__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0762_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2682__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0762_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2582__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0762_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2733__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0763_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2658__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0763_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2634__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0763_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2609__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0763_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2583__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0763_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2607__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0764_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2603__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0764_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2599__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0764_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2594__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0764_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2589__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0764_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2585__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0765_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2735__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0766_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2586__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0766_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2710__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0767_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2685__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0767_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2587__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0767_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2733__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0768_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2661__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0768_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2637__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0768_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2612__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0768_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2588__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0768_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2607__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0769_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2603__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0769_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2599__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0769_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2594__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0769_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2589__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0769_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2590__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0770_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2594__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0771_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2593__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0771_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2611__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0772_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2606__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0772_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2602__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0772_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2598__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0772_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2593__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0772_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2594__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0773_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2595__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0774_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2620__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0775_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2614__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0775_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2608__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0775_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2604__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0775_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2600__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0775_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2599__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0776_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2598__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0776_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2599__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0777_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2600__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0778_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2603__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0779_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2602__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0779_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2603__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0780_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2604__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0781_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2607__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0782_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2606__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0782_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2607__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0783_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2608__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0784_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2632__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0785_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2628__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0785_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2624__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0785_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2619__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0785_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2613__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0785_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2613__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0786_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2611__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0786_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2613__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0787_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2632__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0788_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2628__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0788_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2624__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0788_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2619__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0788_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2613__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0788_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2614__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0789_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2619__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0790_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2618__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0790_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2714__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0791_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2689__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0791_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2665__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0791_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2641__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0791_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2617__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0791_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2636__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0792_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2631__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0792_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2627__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0792_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2623__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0792_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2618__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0792_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2619__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0793_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2620__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0794_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2644__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0795_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2639__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0795_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2633__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0795_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2629__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0795_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2625__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0795_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2624__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0796_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2623__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0796_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2624__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0797_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2625__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0798_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2628__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0799_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2627__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0799_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2628__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0800_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2629__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0801_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2632__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0802_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2631__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0802_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2632__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0803_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2633__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0804_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2656__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0805_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2652__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0805_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2648__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0805_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2643__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0805_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2638__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0805_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2638__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0806_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2636__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0806_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2638__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0807_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2656__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0808_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2652__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0808_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2648__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0808_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2643__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0808_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2638__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0808_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2639__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0809_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2643__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0810_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2642__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0810_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2660__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0811_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2655__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0811_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2651__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0811_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2647__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0811_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2642__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0811_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2643__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0812_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2644__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0813_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2668__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0814_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2663__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0814_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2657__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0814_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2653__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0814_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2649__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0814_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2648__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0815_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2647__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0815_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2648__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0816_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2649__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0817_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2652__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0818_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2651__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0818_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2652__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0819_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2653__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0820_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2656__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0821_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2655__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0821_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2656__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0822_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2657__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0823_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2680__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0824_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2676__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0824_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2672__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0824_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2667__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0824_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2662__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0824_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2662__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0825_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2660__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0825_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2662__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0826_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2680__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0827_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2676__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0827_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2672__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0827_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2667__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0827_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2662__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0827_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2663__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0828_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2667__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0829_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2666__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0829_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2684__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0830_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2679__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0830_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2675__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0830_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2671__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0830_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2666__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0830_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2667__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0831_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2668__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0832_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2692__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0833_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2687__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0833_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2681__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0833_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2677__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0833_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2673__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0833_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2672__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0834_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2671__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0834_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2672__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0835_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2673__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0836_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2676__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0837_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2675__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0837_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2676__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0838_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2677__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0839_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2680__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0840_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2679__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0840_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2680__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0841_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2681__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0842_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2705__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0843_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2701__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0843_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2697__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0843_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2691__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0843_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2686__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0843_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2686__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0844_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2684__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0844_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2686__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0845_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2705__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0846_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2701__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0846_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2697__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0846_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2691__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0846_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2686__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0846_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2687__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0847_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2691__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0848_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2690__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0848_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2709__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0849_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2704__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0849_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2700__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0849_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2696__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0849_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2690__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0849_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2691__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0850_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2692__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0851_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2801__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0852_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2777__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0852_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2753__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0852_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2718__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0852_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2694__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0852_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2717__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0853_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2712__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0853_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2706__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0853_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2702__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0853_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2698__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0853_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2697__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0854_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2696__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0854_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2697__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0855_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2698__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0856_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2701__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0857_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2700__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0857_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2701__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0858_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2702__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0859_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2705__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0860_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2704__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0860_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2705__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0861_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2706__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0862_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2729__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0863_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2725__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0863_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2721__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0863_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2716__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0863_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2711__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0863_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2711__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0864_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2709__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0864_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2711__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0865_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2729__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0866_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2725__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0866_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2721__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0866_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2716__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0866_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2711__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0866_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2712__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0867_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2716__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0868_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2715__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0868_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2732__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0869_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2728__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0869_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2724__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0869_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2720__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0869_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2715__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0869_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2716__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0870_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2717__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0871_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2752__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0872_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2734__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0872_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2730__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0872_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2726__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0872_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2722__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0872_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2721__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0873_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2720__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0873_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2721__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0874_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2722__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0875_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2725__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0876_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2724__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0876_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2725__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0877_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2726__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0878_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2729__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0879_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2728__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0879_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2729__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0880_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2730__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0881_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2733__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0882_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2732__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0882_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2733__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0883_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2734__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0884_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2739__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0885_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2740__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0886_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2738__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0886_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2738__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0887_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2739__C (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0888_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2741__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0889_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2741__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0890_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2900__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0891_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2895__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0891_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2794__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0891_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2770__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0891_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2743__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0891_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2768__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0892_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2764__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0892_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2760__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0892_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2756__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0892_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2751__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0892_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2751__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0893_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2747__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0893_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2845__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0894_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2820__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0894_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2796__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0894_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2772__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0894_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2746__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0894_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2767__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0895_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2763__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0895_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2759__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0895_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2755__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0895_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2747__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0895_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2751__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0896_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2872__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0897_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2847__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0897_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2822__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0897_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2749__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0897_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2900__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0898_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2895__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0898_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2798__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0898_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2774__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0898_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2750__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0898_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2768__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0899_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2764__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0899_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2760__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0899_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2756__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0899_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2751__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0899_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2752__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0900_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2776__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0901_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2769__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0901_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2765__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0901_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2761__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0901_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2757__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0901_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2756__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0902_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2755__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0902_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2756__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0903_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2757__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0904_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2760__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0905_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2759__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0905_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2760__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0906_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2761__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0907_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2764__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0908_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2763__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0908_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2764__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0909_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2765__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0910_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2768__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0911_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2767__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0911_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2768__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0912_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2769__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0913_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2792__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0914_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2788__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0914_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2784__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0914_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2780__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0914_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2775__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0914_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2775__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0915_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2773__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0915_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2791__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0916_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2787__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0916_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2783__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0916_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2779__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0916_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2773__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0916_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2775__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0917_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2792__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0918_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2788__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0918_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2784__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0918_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2780__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0918_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2775__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0918_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2776__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0919_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2800__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0920_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2793__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0920_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2789__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0920_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2785__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0920_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2781__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0920_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2780__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0921_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2779__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0921_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2780__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0922_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2781__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0923_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2784__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0924_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2783__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0924_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2784__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0925_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2785__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0926_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2788__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0927_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2787__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0927_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2788__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0928_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2789__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0929_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2792__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0930_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2791__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0930_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2792__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0931_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2793__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0932_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2816__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0933_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2812__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0933_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2808__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0933_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2804__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0933_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2799__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0933_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2799__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0934_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2797__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0934_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2815__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0935_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2811__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0935_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2807__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0935_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2803__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0935_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2797__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0935_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2799__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0936_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2816__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0937_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2812__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0937_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2808__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0937_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2804__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0937_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2799__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0937_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2800__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0938_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2824__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0939_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2817__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0939_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2813__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0939_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2809__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0939_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2805__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0939_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2804__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0940_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2803__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0940_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2804__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0941_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2805__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0942_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2808__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0943_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2807__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0943_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2808__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0944_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2809__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0945_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2812__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0946_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2811__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0946_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2812__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0947_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2813__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0948_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2816__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0949_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2815__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0949_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2816__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0950_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2817__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0951_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2841__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0952_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2837__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0952_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2833__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0952_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2829__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0952_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2823__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0952_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2823__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0953_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2821__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0953_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2840__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0954_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2836__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0954_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2832__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0954_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2828__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0954_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2821__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0954_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2823__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0955_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2841__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0956_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2837__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0956_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2833__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0956_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2829__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0956_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2823__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0956_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2824__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0957_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2925__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0958_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2897__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0958_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2875__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0958_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2850__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0958_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2826__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0958_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2849__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0959_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2842__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0959_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2838__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0959_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2834__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0959_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2830__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0959_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2829__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0960_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2828__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0960_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2829__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0961_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2830__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0962_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2833__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0963_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2832__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0963_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2833__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0964_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2834__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0965_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2837__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0966_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2836__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0966_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2837__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0967_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2838__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0968_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2841__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0969_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2840__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0969_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2841__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0970_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2842__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0971_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2865__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0972_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2861__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0972_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2857__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0972_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2853__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0972_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2848__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0972_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2848__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0973_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2846__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0973_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2864__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0974_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2860__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0974_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2856__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0974_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2852__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0974_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2846__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0974_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2848__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0975_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2865__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0976_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2861__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0976_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2857__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0976_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2853__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0976_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2848__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0976_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2849__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0977_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2874__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0978_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2866__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0978_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2862__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0978_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2858__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0978_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2854__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0978_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2853__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0979_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2852__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0979_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2853__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0980_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2854__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0981_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2857__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0982_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2856__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0982_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2857__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0983_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2858__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0984_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2861__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0985_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2860__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0985_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2861__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0986_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2862__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0987_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2865__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0988_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2864__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0988_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2865__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0989_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2866__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0990_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2890__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0991_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2886__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0991_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2882__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0991_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2878__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0991_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2873__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0991_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2873__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0992_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2871__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0992_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2976__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0993_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2952__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0993_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2927__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0993_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2893__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0993_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2870__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0993_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2889__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0994_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2885__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0994_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2881__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0994_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2877__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0994_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2871__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0994_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2873__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0995_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2890__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0996_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2886__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0996_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2882__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0996_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2878__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0996_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2873__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0996_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2874__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0997_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2896__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0998_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2891__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0998_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2887__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0998_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2883__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0998_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2879__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0998_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2878__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0999_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2877__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_0999_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2878__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1000_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2879__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1001_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2882__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1002_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2881__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1002_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2882__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1003_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2883__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1004_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2886__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1005_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2885__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1005_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2886__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1006_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2887__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1007_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2890__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1008_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2889__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1008_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2890__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1009_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2891__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1010_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2895__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1011_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2894__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1011_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2922__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1012_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2918__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1012_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2914__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1012_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2906__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1012_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2894__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1012_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2895__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1013_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2896__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1014_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2924__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1015_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2920__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1015_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2916__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1015_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2912__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1015_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2901__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1015_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2900__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1016_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2899__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1016_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2900__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1017_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2901__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1018_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3059__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1019_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3029__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1019_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3005__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1019_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2903__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1019_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3055__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1020_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2980__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1020_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2956__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1020_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2931__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1020_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2904__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1020_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2929__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1021_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2923__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1021_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2919__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1021_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2915__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1021_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2911__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1021_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2911__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1022_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2906__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1022_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2911__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1023_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3057__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1024_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2908__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1024_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3032__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1025_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3008__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1025_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2909__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1025_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3055__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1026_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2983__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1026_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2959__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1026_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2934__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1026_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2910__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1026_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2929__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1027_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2923__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1027_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2919__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1027_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2915__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1027_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2911__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1027_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2912__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1028_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2915__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1029_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2914__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1029_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2915__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1030_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2916__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1031_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2919__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1032_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2918__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1032_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2919__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1033_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2920__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1034_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2923__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1035_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2922__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1035_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2923__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1036_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2924__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1037_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2948__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1038_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2944__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1038_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2940__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1038_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2936__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1038_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2930__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1038_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2929__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1039_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2928__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1039_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2946__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1040_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2942__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1040_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2938__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1040_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2933__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1040_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2928__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1040_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2929__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1041_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2930__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1042_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2954__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1043_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2947__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1043_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2943__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1043_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2939__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1043_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2935__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1043_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2935__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1044_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2933__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1044_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2935__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1045_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2954__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1046_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2947__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1046_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2943__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1046_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2939__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1046_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2935__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1046_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2936__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1047_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2939__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1048_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2938__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1048_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2939__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1049_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2940__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1050_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2943__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1051_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2942__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1051_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2943__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1052_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2944__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1053_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2947__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1054_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2946__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1054_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2947__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1055_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2948__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1056_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3047__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1057_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3023__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1057_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2998__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1057_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2974__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1057_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2950__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1057_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2973__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1058_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2969__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1058_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2965__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1058_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2961__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1058_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2955__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1058_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2954__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1059_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2953__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1059_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2971__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1060_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2967__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1060_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2963__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1060_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2958__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1060_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2953__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1060_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2954__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1061_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2955__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1062_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2978__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1063_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2972__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1063_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2968__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1063_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2964__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1063_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2960__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1063_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2960__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1064_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2958__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1064_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2960__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1065_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2978__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1066_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2972__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1066_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2968__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1066_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2964__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1066_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2960__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1066_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2961__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1067_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2964__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1068_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2963__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1068_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2964__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1069_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2965__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1070_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2968__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1071_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2967__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1071_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2968__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1072_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2969__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1073_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2972__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1074_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2971__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1074_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2972__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1075_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2973__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1076_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2997__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1077_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2993__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1077_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2989__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1077_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2985__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1077_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2979__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1077_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2978__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1078_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2977__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1078_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2995__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1079_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2991__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1079_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2987__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1079_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2982__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1079_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2977__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1079_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2978__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1080_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2979__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1081_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3003__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1082_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2996__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1082_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2992__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1082_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2988__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1082_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2984__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1082_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2984__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1083_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2982__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1083_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2984__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1084_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3003__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1085_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2996__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1085_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2992__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1085_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2988__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1085_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2984__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1085_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2985__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1086_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2988__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1087_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2987__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1087_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2988__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1088_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2989__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1089_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2992__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1090_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2991__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1090_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2992__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1091_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2993__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1092_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2996__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1093_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2995__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1093_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2996__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1094_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2997__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1095_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3022__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1096_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3018__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1096_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3014__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1096_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3010__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1096_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3004__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1096_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3003__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1097_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3002__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1097_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3109__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1098_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3085__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1098_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3049__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1098_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3025__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1098_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3001__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1098_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3020__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1099_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3016__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1099_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3012__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1099_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3007__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1099_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3002__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1099_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3003__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1100_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3004__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1101_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3027__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1102_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3021__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1102_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3017__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1102_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3013__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1102_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3009__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1102_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3009__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1103_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3007__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1103_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3009__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1104_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3027__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1105_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3021__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1105_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3017__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1105_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3013__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1105_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3009__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1105_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3010__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1106_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3013__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1107_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3012__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1107_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3013__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1108_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3014__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1109_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3017__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1110_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3016__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1110_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3017__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1111_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3018__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1112_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3021__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1113_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3020__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1113_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3021__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1114_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3022__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1115_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3046__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1116_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3042__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1116_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3038__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1116_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3034__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1116_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3028__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1116_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3027__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1117_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3026__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1117_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3044__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1118_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3040__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1118_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3036__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1118_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3031__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1118_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3026__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1118_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3027__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1119_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3028__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1120_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3051__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1121_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3045__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1121_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3041__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1121_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3037__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1121_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3033__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1121_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3033__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1122_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3031__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1122_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3033__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1123_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3051__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1124_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3045__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1124_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3041__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1124_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3037__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1124_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3033__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1124_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3034__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1125_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3037__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1126_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3036__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1126_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3037__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1127_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3038__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1128_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3041__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1129_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3040__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1129_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3041__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1130_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3042__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1131_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3045__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1132_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3044__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1132_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3045__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1133_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3046__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1134_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3081__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1135_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3077__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1135_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3073__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1135_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3056__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1135_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3052__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1135_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3051__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1136_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3050__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1136_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3079__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1137_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3075__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1137_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3067__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1137_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3054__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1137_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3050__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1137_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3051__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1138_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3052__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1139_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3055__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1140_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3054__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1140_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3055__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1141_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3056__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1142_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3061__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1143_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3062__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1144_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3060__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1144_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3060__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1145_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3061__C (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1146_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3063__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1147_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3063__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1148_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3217__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1149_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3142__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1149_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3117__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1149_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3093__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1149_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3065__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1149_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3091__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1150_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3087__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1150_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3080__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1150_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3076__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1150_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3072__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1150_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3072__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1151_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3067__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1151_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3072__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1152_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3219__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1153_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3069__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1153_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3193__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1154_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3169__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1154_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3070__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1154_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3217__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1155_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3145__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1155_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3120__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1155_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3096__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1155_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3071__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1155_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3091__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1156_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3087__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1156_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3080__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1156_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3076__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1156_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3072__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1156_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3073__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1157_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3076__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1158_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3075__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1158_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3076__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1159_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3077__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1160_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3080__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1161_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3079__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1161_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3080__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1162_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3081__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1163_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3180__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1164_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3156__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1164_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3131__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1164_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3107__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1164_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3083__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1164_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3106__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1165_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3102__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1165_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3098__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1165_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3092__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1165_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3088__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1165_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3087__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1166_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3086__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1166_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3104__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1167_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3100__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1167_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3095__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1167_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3090__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1167_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3086__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1167_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3087__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1168_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3088__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1169_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3091__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1170_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3090__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1170_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3091__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1171_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3092__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1172_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3115__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1173_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3111__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1173_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3105__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1173_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3101__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1173_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3097__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1173_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3097__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1174_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3095__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1174_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3097__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1175_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3115__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1176_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3111__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1176_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3105__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1176_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3101__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1176_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3097__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1176_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3098__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1177_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3101__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1178_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3100__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1178_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3101__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1179_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3102__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1180_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3105__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1181_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3104__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1181_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3105__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1182_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3106__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1183_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3130__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1184_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3126__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1184_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3122__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1184_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3116__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1184_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3112__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1184_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3111__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1185_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3110__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1185_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3128__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1186_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3124__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1186_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3119__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1186_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3114__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1186_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3110__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1186_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3111__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1187_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3112__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1188_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3115__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1189_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3114__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1189_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3115__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1190_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3116__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1191_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3140__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1192_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3136__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1192_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3129__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1192_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3125__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1192_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3121__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1192_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3121__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1193_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3119__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1193_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3121__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1194_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3140__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1195_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3136__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1195_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3129__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1195_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3125__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1195_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3121__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1195_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3122__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1196_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3125__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1197_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3124__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1197_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3125__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1198_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3126__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1199_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3129__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1200_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3128__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1200_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3129__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1201_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3130__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1202_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3155__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1203_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3151__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1203_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3147__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1203_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3141__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1203_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3137__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1203_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3136__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1204_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3135__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1204_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3242__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1205_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3207__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1205_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3182__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1205_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3158__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1205_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3134__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1205_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3153__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1206_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3149__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1206_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3144__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1206_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3139__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1206_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3135__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1206_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3136__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1207_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3137__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1208_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3140__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1209_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3139__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1209_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3140__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1210_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3141__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1211_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3164__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1212_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3160__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1212_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3154__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1212_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3150__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1212_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3146__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1212_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3146__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1213_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3144__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1213_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3146__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1214_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3164__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1215_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3160__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1215_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3154__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1215_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3150__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1215_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3146__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1215_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3147__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1216_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3150__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1217_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3149__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1217_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3150__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1218_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3151__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1219_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3154__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1220_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3153__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1220_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3154__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1221_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3155__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1222_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3179__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1223_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3175__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1223_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3171__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1223_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3165__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1223_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3161__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1223_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3160__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1224_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3159__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1224_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3177__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1225_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3173__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1225_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3168__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1225_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3163__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1225_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3159__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1225_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3160__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1226_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3161__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1227_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3164__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1228_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3163__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1228_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3164__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1229_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3165__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1230_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3188__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1231_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3184__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1231_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3178__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1231_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3174__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1231_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3170__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1231_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3170__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1232_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3168__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1232_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3170__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1233_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3188__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1234_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3184__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1234_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3178__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1234_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3174__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1234_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3170__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1234_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3171__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1235_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3174__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1236_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3173__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1236_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3174__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1237_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3175__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1238_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3178__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1239_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3177__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1239_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3178__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1240_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3179__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1241_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3203__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1242_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3199__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1242_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3195__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1242_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3189__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1242_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3185__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1242_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3184__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1243_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3183__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1243_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3201__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1244_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3197__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1244_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3192__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1244_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3187__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1244_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3183__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1244_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3184__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1245_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3185__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1246_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3188__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1247_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3187__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1247_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3188__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1248_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3189__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1249_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3213__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1250_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3209__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1250_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3202__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1250_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3198__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1250_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3194__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1250_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3194__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1251_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3192__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1251_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3194__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1252_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3213__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1253_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3209__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1253_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3202__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1253_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3198__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1253_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3194__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1253_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3195__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1254_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3198__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1255_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3197__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1255_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3198__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1256_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3199__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1257_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3202__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1258_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3201__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1258_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3202__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1259_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3203__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1260_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3312__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1261_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3288__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1261_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3264__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1261_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3240__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1261_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3205__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1261_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3239__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1262_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3235__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1262_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3218__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1262_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3214__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1262_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3210__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1262_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3209__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1263_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3208__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1263_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3237__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1264_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3229__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1264_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3216__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1264_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3212__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1264_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3208__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1264_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3209__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1265_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3210__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1266_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3213__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1267_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3212__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1267_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3213__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1268_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3214__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1269_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3217__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1270_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3216__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1270_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3217__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1271_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3218__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1272_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3223__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1273_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3224__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1274_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3222__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1274_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3222__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1275_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3223__C (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1276_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3225__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1277_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3225__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1278_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3374__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1279_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3302__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1279_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3278__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1279_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3254__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1279_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3227__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1279_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3252__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1280_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3248__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1280_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3244__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1280_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3238__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1280_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3234__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1280_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3234__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1281_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3229__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1281_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3234__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1282_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3376__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1283_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3231__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1283_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3353__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1284_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3329__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1284_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3232__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1284_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3374__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1285_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3305__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1285_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3281__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1285_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3257__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1285_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3233__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1285_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3252__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1286_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3248__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1286_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3244__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1286_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3238__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1286_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3234__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1286_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3235__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1287_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3238__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1288_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3237__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1288_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3238__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1289_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3239__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1290_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3263__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1291_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3259__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1291_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3253__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1291_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3249__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1291_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3245__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1291_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3244__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1292_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3243__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1292_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3261__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1293_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3256__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1293_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3251__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1293_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3247__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1293_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3243__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1293_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3244__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1294_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3245__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1295_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3248__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1296_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3247__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1296_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3248__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1297_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3249__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1298_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3252__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1299_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3251__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1299_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3252__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1300_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3253__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1301_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3276__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1302_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3272__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1302_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3268__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1302_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3262__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1302_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3258__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1302_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3258__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1303_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3256__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1303_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3258__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1304_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3276__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1305_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3272__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1305_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3268__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1305_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3262__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1305_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3258__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1305_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3259__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1306_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3262__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1307_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3261__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1307_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3262__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1308_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3263__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1309_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3287__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1310_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3283__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1310_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3277__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1310_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3273__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1310_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3269__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1310_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3268__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1311_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3267__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1311_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3285__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1312_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3280__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1312_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3275__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1312_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3271__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1312_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3267__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1312_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3268__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1313_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3269__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1314_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3272__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1315_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3271__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1315_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3272__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1316_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3273__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1317_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3276__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1318_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3275__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1318_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3276__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1319_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3277__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1320_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3300__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1321_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3296__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1321_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3292__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1321_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3286__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1321_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3282__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1321_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3282__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1322_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3280__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1322_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3282__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1323_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3300__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1324_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3296__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1324_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3292__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1324_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3286__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1324_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3282__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1324_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3283__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1325_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3286__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1326_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3285__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1326_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3286__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1327_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3287__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1328_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3311__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1329_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3307__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1329_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3301__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1329_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3297__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1329_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3293__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1329_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3292__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1330_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3291__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1330_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3309__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1331_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3304__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1331_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3299__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1331_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3295__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1331_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3291__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1331_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3292__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1332_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3293__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1333_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3296__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1334_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3295__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1334_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3296__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1335_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3297__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1336_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3300__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1337_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3299__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1337_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3300__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1338_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3301__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1339_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3324__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1340_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3320__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1340_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3316__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1340_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3310__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1340_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3306__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1340_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3306__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1341_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3304__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1341_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3306__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1342_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3324__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1343_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3320__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1343_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3316__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1343_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3310__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1343_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3306__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1343_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3307__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1344_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3310__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1345_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3309__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1345_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3310__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1346_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3311__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1347_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3335__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1348_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3331__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1348_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3325__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1348_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3321__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1348_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3317__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1348_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3316__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1349_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3315__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1349_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3333__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1350_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3328__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1350_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3323__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1350_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3319__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1350_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3315__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1350_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3316__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1351_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3317__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1352_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3320__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1353_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3319__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1353_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3320__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1354_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3321__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1355_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3324__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1356_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3323__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1356_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3324__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1357_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3325__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1358_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3348__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1359_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3344__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1359_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3340__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1359_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3334__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1359_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3330__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1359_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3330__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1360_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3328__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1360_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3330__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1361_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3348__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1362_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3344__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1362_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3340__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1362_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3334__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1362_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3330__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1362_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3331__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1363_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3334__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1364_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3333__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1364_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3334__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1365_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3335__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1366_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3359__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1367_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3355__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1367_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3349__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1367_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3345__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1367_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3341__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1367_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3340__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1368_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3339__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1368_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3357__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1369_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3352__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1369_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3347__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1369_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3343__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1369_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3339__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1369_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3340__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1370_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3341__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1371_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3344__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1372_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3343__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1372_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3344__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1373_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3345__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1374_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3348__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1375_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3347__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1375_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3348__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1376_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3349__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1377_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3370__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1378_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3366__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1378_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3362__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1378_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3358__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1378_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3354__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1378_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3354__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1379_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3352__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1379_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3354__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1380_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3370__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1381_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3366__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1381_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3362__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1381_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3358__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1381_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3354__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1381_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3355__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1382_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3358__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1383_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3357__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1383_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3358__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1384_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3359__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1385_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3362__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1386_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3361__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1386_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3362__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1387_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3363__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1388_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3366__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1389_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3365__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1389_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3366__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1390_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3367__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1391_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3370__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1392_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3369__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1392_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3370__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1393_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3371__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1394_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3374__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1395_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3373__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1395_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3374__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1396_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3375__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1397_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3380__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1398_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3381__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1399_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3379__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1399_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3379__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1400_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3380__C (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1401_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3382__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1402_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3382__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1403_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3386__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1404_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3386__C (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1405_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3388__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1406_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3430__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1407_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3389__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1407_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1842__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1407_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3480__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1408_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3461__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1408_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3390__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1408_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1850__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1408_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1831__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1408_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3446__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1409_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1999__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1409_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1985__A1_N (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1409_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1980__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1409_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1934__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1409_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3415__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1410_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3392__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1410_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3385__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1410_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1981__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1410_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1937__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1410_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3466__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1411_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3399__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1411_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3448__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1412_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3417__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1412_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3395__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1412_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1992__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1412_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3395__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1413_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1964__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1413_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3426__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1414_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3396__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1414_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3230__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1414_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3068__C (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1414_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3397__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1415_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2907__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1415_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3399__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1416_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2867__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1416_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2843__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1416_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2818__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1416_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2742__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1416_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3452__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1417_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3444__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1417_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3399__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1417_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2014__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1417_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3446__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1418_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3408__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1419_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1838__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1419_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3473__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1420_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3405__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1420_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3490__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1421_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3458__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1421_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3405__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1421_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3405__C (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1422_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1823__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1422_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1816__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1422_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1809__C (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1422_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1777__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1422_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3501__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1423_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3405__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1423_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3406__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1424_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3408__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1425_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1932__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1425_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1929__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1425_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1831__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1425_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1830__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1425_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3408__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1426_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1930__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1426_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3409__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1427_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1954__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1427_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1938__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1427_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3410__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1428_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2335__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1428_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1975__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1428_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3411__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1429_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3133__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1429_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3000__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1429_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2239__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1429_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2011__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1429_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3428__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1430_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3412__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1430_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2169__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1430_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1997__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1430_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1994__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1430_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3429__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1431_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2899__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1431_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2579__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1431_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2414__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1431_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2249__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1431_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3456__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1432_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3443__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1432_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3414__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1432_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3521__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1433_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3478__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1433_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3415__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1433_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1850__C (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1433_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1831__C (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1433_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3429__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1434_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3417__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1435_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2584__C (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1435_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2419__C (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1435_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2254__C (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1435_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1965__C (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1435_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3427__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1436_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3230__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1436_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3068__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1436_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2907__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1436_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3433__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1437_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3423__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1437_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3419__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1437_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1975__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1437_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1944__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1437_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3420__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1438_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3421__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1439_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3378__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1439_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3350__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1439_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3326__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1439_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3226__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1439_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3427__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1440_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3068__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1440_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2907__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1440_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3426__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1441_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3423__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1441_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2415__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1441_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2017__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1441_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1936__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1441_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3424__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1442_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3425__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1443_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3221__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1443_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3190__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1443_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3166__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1443_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3064__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1443_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3427__C (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1444_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3230__C (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1444_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2907__C (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1444_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3427__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1445_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2902__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1445_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3428__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1446_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2748__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1446_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3429__B1_N (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1447_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3446__A3 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1448_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3484__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1449_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3431__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1449_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1944__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1449_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3432__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1450_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1992__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1450_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1987__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1450_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1893__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1450_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1863__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1450_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3446__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1451_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2004__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1451_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1995__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1451_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1927__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1451_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1922__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1451_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3434__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1452_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2580__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1452_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2415__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1452_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2250__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1452_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2017__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1452_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3435__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1453_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2585__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1453_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2420__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1453_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2255__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1453_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2021__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1453_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3469__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1454_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3461__C (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1454_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3436__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1454_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1994__C (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1454_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1984__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1454_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3466__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1455_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3445__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1455_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1908__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1455_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1878__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1455_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1848__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1455_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3519__C (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1456_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3475__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1456_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3460__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1456_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3438__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1456_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1768__C (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1456_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3443__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1457_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3441__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1457_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1841__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1457_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3440__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1458_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3480__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1459_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3464__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1459_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3442__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1459_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3441__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1459_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3444__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1460_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3472__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1461_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3461__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1461_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3444__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1461_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1831__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1461_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1767__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1461_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3444__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1462_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1845__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1462_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3445__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1463_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3446__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1464_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3453__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1465_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3448__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1466_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3385__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1466_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1937__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1466_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3449__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1467_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3462__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1468_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3453__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1468_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3450__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1468_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2007__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1468_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3452__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1469_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1988__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1469_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1946__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1469_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3454__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1470_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3452__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1470_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1946__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1470_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1934__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1470_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1901__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1470_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3453__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1471_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3517__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1472_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3455__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1472_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1871__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1472_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1836__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1472_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1799__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1472_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3516__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1473_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3509__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1473_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3497__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1473_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3487__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1473_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3468__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1473_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3513__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1474_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3505__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1474_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3494__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1474_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3467__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1474_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1930__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1474_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3499__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1475_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3460__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1475_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1809__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1475_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1785__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1475_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1778__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1475_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3511__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1476_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3460__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1476_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1801__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1476_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1785__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1476_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1768__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1476_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3491__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1477_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3476__C (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1477_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3460__C (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1477_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1801__C (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1477_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1793__C (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1477_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3465__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1478_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3461__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1478_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1850__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1478_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1849__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1478_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3462__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1479_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3467__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1480_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3467__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1481_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2028__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1481_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3465__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1482_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1830__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1482_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1824__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1482_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1817__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1482_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1810__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1482_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3466__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1483_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3467__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1484_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3468__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1485_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3470__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1486_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2238__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1486_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1933__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1486_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1807__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1486_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1765__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1486_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3515__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1487_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3508__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1487_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3496__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1487_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3486__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1487_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1763__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1487_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3486__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1488_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3483__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1488_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2034__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1488_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3520__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1489_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3512__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1489_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3504__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1489_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3493__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1489_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3477__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1489_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3489__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1490_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3476__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1490_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1801__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1490_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1793__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1490_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1768__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1490_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3519__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1491_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3476__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1491_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1809__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1491_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1793__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1491_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1778__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1491_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3511__C (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1492_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3503__C (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1492_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3492__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1492_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3476__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1492_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2002__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1492_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3479__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1493_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3477__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1493_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1856__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1493_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3483__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1494_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3479__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1495_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1825__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1495_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1818__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1495_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1811__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1495_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1803__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1495_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3483__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1496_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1857__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1496_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3481__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1497_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3482__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1498_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1826__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1498_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1819__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1498_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1812__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1498_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1771__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1498_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3514__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1499_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3506__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1499_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3495__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1499_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3483__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1499_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1762__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1499_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3486__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1500_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3507__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1501_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3485__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1501_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2001__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1501_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1827__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1501_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1789__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1501_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3496__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1502_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3486__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1502_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2007__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1502_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2005__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1502_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1935__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1502_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3487__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1503_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3496__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1504_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3495__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1504_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2041__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1504_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3519__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1505_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3492__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1505_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1994__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1505_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1987__C (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1505_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1823__C (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1505_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3492__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1506_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1994__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1506_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1979__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1506_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1974__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1506_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1816__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1506_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3492__C (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1507_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1995__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1507_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1992__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1507_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1785__C (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1507_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1778__C (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1507_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3494__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1508_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3493__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1508_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1861__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1508_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3495__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1509_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3495__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1510_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1862__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1510_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3496__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1511_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3497__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1512_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3508__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1513_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3506__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1513_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2047__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1513_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3511__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1514_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3503__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1514_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1991__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1514_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1986__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1514_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1816__C (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1514_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3503__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1515_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1991__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1515_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1987__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1515_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1978__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1515_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1823__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1515_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3502__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1516_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1823__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1516_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1816__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1516_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1809__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1516_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1768__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1516_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3519__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1517_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3511__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1517_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3503__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1517_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2000__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1517_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1991__C (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1517_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3505__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1518_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3504__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1518_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1867__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1518_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3506__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1519_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3506__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1520_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1868__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1520_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3508__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1521_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3515__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1522_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3508__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1522_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1782__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1522_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1774__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1522_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1763__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1522_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3509__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1523_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3515__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1524_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3514__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1524_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2055__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1524_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3513__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1525_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3512__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1525_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1874__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1525_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3514__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1526_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3514__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1527_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1875__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1527_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3515__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1528_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3516__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1529_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1798__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1530_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1791__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1530_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1783__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1530_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1775__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1530_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1764__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1530_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2063__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1531_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1763__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1531_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1762__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1531_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3520__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1532_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1880__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1532_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1761__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1532_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1762__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1533_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1795__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1534_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1787__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1534_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1780__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1534_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1772__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1534_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1761__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1534_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1882__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1535_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1762__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1535_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1763__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1536_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1764__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1537_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1805__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1538_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1797__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1538_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1790__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1538_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1782__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1538_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1774__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1538_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2069__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1539_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1774__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1539_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1773__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1539_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1802__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1540_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1794__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1540_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1786__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1540_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1779__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1540_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1770__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1540_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1769__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1541_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2001__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1542_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1886__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1542_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1772__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1542_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1770__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1542_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1773__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1543_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1804__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1544_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1796__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1544_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1788__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1544_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1781__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1544_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1773__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1544_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1887__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1545_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1773__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1545_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1774__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1546_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1775__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1547_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2076__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1548_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1782__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1548_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1781__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1548_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1998__C (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1549_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1801__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1549_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1793__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1549_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1785__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1549_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1778__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1549_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1891__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1550_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1780__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1550_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1779__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1550_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1781__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1551_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1892__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1552_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1781__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1552_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1782__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1553_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1783__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1554_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2082__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1555_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1790__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1555_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1788__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1555_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1897__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1556_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1787__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1556_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1786__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1556_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1788__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1557_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1898__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1558_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1788__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1558_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1790__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1559_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1820__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1560_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1813__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1560_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1805__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1560_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1797__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1560_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1790__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1560_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1791__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1561_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2090__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1562_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1797__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1562_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1796__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1562_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1904__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1563_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1795__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1563_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1794__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1563_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1796__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1564_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1905__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1565_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1796__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1565_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1797__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1566_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1798__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1567_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1835__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1568_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1829__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1568_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1821__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1568_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1814__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1568_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1806__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1568_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2098__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1569_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1805__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1569_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1804__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1569_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1910__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1570_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1803__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1570_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1802__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1570_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1804__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1571_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1911__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1572_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1804__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1572_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1805__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1573_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1806__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1574_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1846__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1575_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1834__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1575_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1828__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1575_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1820__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1575_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1813__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1575_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2104__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1576_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1813__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1576_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1812__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1576_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1915__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1577_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1811__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1577_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1810__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1577_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1812__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1578_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1916__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1579_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1812__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1579_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1813__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1580_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1814__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1581_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2111__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1582_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1820__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1582_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1819__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1582_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1920__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1583_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1818__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1583_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1817__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1583_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1819__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1584_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1921__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1585_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1819__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1585_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1820__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1586_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1821__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1587_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2117__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1588_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1828__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1588_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1826__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1588_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1925__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1589_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1825__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1589_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1824__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1589_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1826__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1590_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1926__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1591_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1826__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1591_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1828__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1592_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1858__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1593_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1853__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1593_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1846__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1593_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1834__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1593_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1828__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1593_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1829__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1594_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1832__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1595_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1832__B1_N (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1596_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1834__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1597_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2127__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1598_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1834__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1598_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1835__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1599_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1870__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1600_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1865__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1600_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1859__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1600_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1854__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1600_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1847__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1600_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2135__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1601_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1846__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1601_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1845__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1601_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1842__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1602_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1839__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1602_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1903__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1603_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1873__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1603_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1850__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1603_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1849__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1603_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1840__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1603_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1932__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1604_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1867__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1604_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1861__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1604_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1856__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1604_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1841__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1604_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1845__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1605_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1881__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1606_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1843__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1606_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1926__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1607_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1921__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1607_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1916__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1607_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1911__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1607_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1844__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1607_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1875__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1608_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1868__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1608_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1862__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1608_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1857__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1608_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1845__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1608_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1846__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1609_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1847__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1610_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1876__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1611_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1869__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1611_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1864__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1611_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1858__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1611_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1853__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1611_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1851__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1612_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1851__B1_N (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1613_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1853__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1614_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2141__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1615_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1853__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1615_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1854__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1616_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2148__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1617_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1858__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1617_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1857__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1617_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1857__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1618_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1858__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1619_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1859__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1620_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2154__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1621_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1864__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1621_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1862__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1621_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1862__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1622_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1864__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1623_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1888__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1624_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1883__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1624_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1876__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1624_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1869__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1624_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1864__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1624_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1865__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1625_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2162__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1626_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1869__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1626_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1868__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1626_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1868__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1627_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1869__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1628_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1870__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1629_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1900__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1630_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1895__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1630_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1889__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1630_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1884__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1630_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1877__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1630_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2171__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1631_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1876__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1631_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1875__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1631_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1897__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1632_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1891__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1632_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1886__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1632_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1880__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1632_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1874__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1632_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1875__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1633_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1876__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1634_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1877__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1635_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1906__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1636_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1899__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1636_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1894__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1636_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1888__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1636_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1883__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1636_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2177__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1637_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1883__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1637_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1882__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1637_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1882__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1638_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1905__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1639_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1898__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1639_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1892__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1639_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1887__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1639_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1882__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1639_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1883__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1640_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1884__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1641_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2184__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1642_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1888__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1642_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1887__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1642_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1887__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1643_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1888__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1644_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1889__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1645_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2190__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1646_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1894__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1646_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1892__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1646_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1892__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1647_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1894__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1648_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1917__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1649_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1912__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1649_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1906__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1649_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1899__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1649_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1894__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1649_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1895__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1650_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2198__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1651_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1899__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1651_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1898__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1651_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1898__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1652_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1899__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1653_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1900__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1654_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1928__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1655_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1923__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1655_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1918__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1655_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1913__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1655_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1907__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1655_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2206__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1656_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1906__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1656_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1905__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1656_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1925__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1657_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1920__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1657_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1915__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1657_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1910__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1657_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1904__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1657_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1905__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1658_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1906__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1659_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1907__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1660_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1971__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1661_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1927__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1661_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1922__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1661_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1917__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1661_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1912__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1661_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2212__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1662_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1912__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1662_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1911__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1662_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1911__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1663_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1912__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1664_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1913__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1665_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2218__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1666_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1917__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1666_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1916__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1666_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1916__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1667_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1917__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1668_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1918__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1669_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2224__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1670_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1922__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1670_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1921__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1670_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1921__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1671_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1922__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1672_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1923__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1673_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2231__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1674_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1927__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1674_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1926__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1674_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1926__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1675_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1927__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1676_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1928__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1677_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2005__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1678_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1930__C (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1678_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1933__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1679_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2899__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1680_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2239__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1680_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1934__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1680_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1932__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1680_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1933__C (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1681_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1935__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1682_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1935__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1683_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2584__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1684_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2254__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1684_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1962__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1684_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1959__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1684_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1942__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1684_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1982__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1685_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1955__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1685_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1938__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1685_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2013__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1686_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1939__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1686_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2183__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1687_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2147__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1687_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2110__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1687_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2075__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1687_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1940__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1687_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2034__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1688_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2028__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1688_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1962__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1688_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1945__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1688_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1941__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1688_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3384__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1689_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1966__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1689_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1942__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1689_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1949__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1690_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2580__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1691_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2419__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1691_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2250__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1691_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1965__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1691_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1945__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1691_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1950__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1692_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1945__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1692_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1949__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1693_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1950__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1694_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1947__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1694_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3386__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1695_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2006__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1695_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2003__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1695_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1981__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1695_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1948__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1695_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3383__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1696_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1996__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1696_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1972__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1696_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1949__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1696_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2122__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1697_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1951__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1697_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3204__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1698_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3082__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1698_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2949__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1698_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2825__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1698_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1952__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1698_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3336__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1699_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2245__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1699_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2008__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1699_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1967__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1699_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1953__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1699_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3375__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1700_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3371__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1700_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3367__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1700_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3363__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1700_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1963__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1700_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2899__A3 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1701_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1990__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1701_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1984__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1701_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1973__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1701_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1959__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1701_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2586__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1702_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2421__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1702_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2256__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1702_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1969__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1702_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1959__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1702_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2580__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1703_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2415__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1703_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2254__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1703_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1965__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1703_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1957__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1703_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2017__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1704_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1958__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1704_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2584__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1705_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2419__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1705_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2250__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1705_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1962__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1705_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1959__C (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1705_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1960__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1706_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1968__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1707_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1961__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1707_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1963__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1708_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1963__C (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1709_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2580__C (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1710_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2415__C (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1710_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2250__C (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1710_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2017__C (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1710_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1968__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1710_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2238__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1711_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2021__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1711_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1966__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1711_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3383__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1712_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1972__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1712_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1967__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1712_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1968__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1713_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2899__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1714_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2244__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1714_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2236__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1714_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1998__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1714_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1970__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1714_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3381__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1715_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3224__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1715_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3062__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1715_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2740__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1715_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1971__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1715_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1972__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1716_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3379__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1717_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3222__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1717_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3060__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1717_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2004__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1717_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1974__C (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1717_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1981__C (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1718_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1976__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1719_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2001__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1720_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1979__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1720_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1977__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1720_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3385__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1721_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2005__A3 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1721_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1987__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1721_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1978__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1721_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1985__A2_N (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1722_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1979__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1722_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1980__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1723_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1981__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1724_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3231__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1725_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3069__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1725_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2908__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1725_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2748__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1725_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1983__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1725_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2021__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1726_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2004__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1726_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1992__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1726_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1985__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1726_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1985__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1727_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1986__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1728_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1989__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1729_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1988__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1730_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1989__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1731_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2738__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1732_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2574__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1732_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2409__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1732_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2242__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1732_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1993__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1732_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1992__A3 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1733_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1993__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1734_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1996__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1735_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2000__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1736_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1995__C (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1736_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1996__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1737_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2134__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1738_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2097__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1738_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2062__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1738_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2027__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1738_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1998__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1738_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__1999__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1739_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2003__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1740_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2002__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1741_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2002__B1_N (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1742_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2003__C (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1743_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2005__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1744_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2006__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1745_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3381__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1746_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3224__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1746_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2087__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1746_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2052__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1746_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2009__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1746_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2051__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1747_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2045__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1747_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2038__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1747_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2032__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1747_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2025__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1747_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2024__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1748_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2016__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1748_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3338__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1749_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3314__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1749_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3290__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1749_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3266__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1749_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2012__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1749_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3373__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1750_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3369__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1750_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3365__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1750_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3361__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1750_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2016__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1750_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2231__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1751_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2224__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1751_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2218__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1751_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2040__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1751_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2014__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1751_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2579__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1752_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2414__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1752_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2249__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1752_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2015__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1752_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3229__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1753_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3067__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1753_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2906__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1753_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2747__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1753_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2016__B1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1753_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2024__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1754_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2018__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1755_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2241__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1756_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2196__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1756_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2160__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1756_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2125__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1756_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2019__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1756_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3384__B (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1757_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2234__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1757_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2088__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1757_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2053__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1757_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2020__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1757_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2050__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1758_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2044__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1758_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2037__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1758_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2031__A1 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1758_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2024__A2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1758_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2201__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1759_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2165__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1759_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2022__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1759_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2234__B2 (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1760_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2130__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1760_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2093__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1760_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2058__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1760_)
);

sky130_fd_sc_hd__diode_2 ANTENNA__2023__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(_1760_)
);

sky130_fd_sc_hd__diode_2 ANTENNA_clkbuf_0_clk_1_0_A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(clk_1_0)
);

sky130_fd_sc_hd__diode_2 ANTENNA_clkbuf_0_clk_1_256_A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(clk_1_256)
);

sky130_fd_sc_hd__diode_2 ANTENNA_clkbuf_0_clk_2_0_A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(clk_2_0)
);

sky130_fd_sc_hd__diode_2 ANTENNA__3522__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN1[0] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3228__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN1[0] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3532__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN1[10] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3279__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN1[10] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3533__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN1[11] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3284__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN1[11] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3534__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN1[12] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3289__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN1[12] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3535__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN1[13] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3294__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN1[13] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3536__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN1[14] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3298__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN1[14] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3537__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN1[15] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3303__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN1[15] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3538__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN1[16] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3308__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN1[16] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3539__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN1[17] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3313__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN1[17] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3540__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN1[18] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3318__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN1[18] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3541__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN1[19] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3322__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN1[19] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3523__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN1[1] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3236__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN1[1] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3542__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN1[20] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3327__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN1[20] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3543__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN1[21] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3332__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN1[21] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3544__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN1[22] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3337__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN1[22] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3545__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN1[23] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3342__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN1[23] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3546__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN1[24] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3346__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN1[24] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3547__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN1[25] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3351__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN1[25] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3548__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN1[26] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3356__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN1[26] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3549__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN1[27] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3360__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN1[27] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3550__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN1[28] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3364__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN1[28] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3551__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN1[29] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3368__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN1[29] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3524__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN1[2] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3241__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN1[2] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3552__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN1[30] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3372__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN1[30] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3553__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN1[31] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3377__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN1[31] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3376__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN1[31] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3525__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN1[3] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3246__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN1[3] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3526__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN1[4] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3250__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN1[4] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3527__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN1[5] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3255__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN1[5] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3528__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN1[6] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3260__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN1[6] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3529__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN1[7] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3265__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN1[7] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3530__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN1[8] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3270__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN1[8] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3531__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN1[9] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3274__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN1[9] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3554__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN2[0] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3066__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN2[0] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3564__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN2[10] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3118__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN2[10] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3565__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN2[11] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3123__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN2[11] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3566__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN2[12] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3127__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN2[12] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3567__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN2[13] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3132__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN2[13] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3568__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN2[14] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3138__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN2[14] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3569__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN2[15] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3143__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN2[15] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3570__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN2[16] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3148__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN2[16] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3571__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN2[17] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3152__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN2[17] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3572__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN2[18] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3157__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN2[18] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3573__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN2[19] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3162__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN2[19] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3555__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN2[1] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3074__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN2[1] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3574__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN2[20] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3167__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN2[20] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3575__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN2[21] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3172__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN2[21] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3576__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN2[22] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3176__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN2[22] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3577__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN2[23] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3181__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN2[23] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3578__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN2[24] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3186__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN2[24] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3579__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN2[25] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3191__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN2[25] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3580__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN2[26] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3196__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN2[26] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3581__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN2[27] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3200__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN2[27] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3582__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN2[28] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3206__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN2[28] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3583__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN2[29] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3211__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN2[29] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3556__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN2[2] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3078__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN2[2] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3584__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN2[30] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3215__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN2[30] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3585__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN2[31] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3220__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN2[31] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3219__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN2[31] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3557__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN2[3] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3084__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN2[3] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3558__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN2[4] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3089__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN2[4] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3559__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN2[5] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3094__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN2[5] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3560__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN2[6] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3099__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN2[6] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3561__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN2[7] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3103__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN2[7] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3562__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN2[8] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3108__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN2[8] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3563__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN2[9] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3113__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN2[9] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3586__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN3[0] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__2905__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN3[0] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3596__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN3[10] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__2957__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN3[10] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3597__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN3[11] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__2962__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN3[11] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3598__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN3[12] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__2966__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN3[12] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3599__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN3[13] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__2970__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN3[13] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3600__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN3[14] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__2975__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN3[14] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3601__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN3[15] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__2981__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN3[15] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3602__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN3[16] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__2986__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN3[16] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3603__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN3[17] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__2990__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN3[17] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3604__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN3[18] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__2994__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN3[18] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3605__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN3[19] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__2999__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN3[19] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3587__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN3[1] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__2913__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN3[1] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3606__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN3[20] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3006__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN3[20] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3607__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN3[21] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3011__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN3[21] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3608__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN3[22] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3015__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN3[22] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3609__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN3[23] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3019__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN3[23] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3610__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN3[24] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3024__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN3[24] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3611__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN3[25] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3030__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN3[25] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3612__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN3[26] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3035__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN3[26] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3613__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN3[27] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3039__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN3[27] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3614__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN3[28] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3043__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN3[28] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3615__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN3[29] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3048__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN3[29] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3588__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN3[2] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__2917__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN3[2] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3616__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN3[30] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3053__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN3[30] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3617__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN3[31] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3058__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN3[31] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3057__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN3[31] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3589__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN3[3] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__2921__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN3[3] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3590__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN3[4] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__2926__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN3[4] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3591__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN3[5] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__2932__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN3[5] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3592__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN3[6] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__2937__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN3[6] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3593__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN3[7] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__2941__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN3[7] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3594__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN3[8] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__2945__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN3[8] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3595__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN3[9] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__2951__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN3[9] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3618__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN4[0] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__2744__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN4[0] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3628__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN4[10] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__2795__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN4[10] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3629__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN4[11] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__2802__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN4[11] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3630__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN4[12] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__2806__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN4[12] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3631__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN4[13] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__2810__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN4[13] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3632__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN4[14] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__2814__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN4[14] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3633__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN4[15] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__2819__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN4[15] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3634__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN4[16] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__2827__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN4[16] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3635__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN4[17] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__2831__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN4[17] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3636__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN4[18] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__2835__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN4[18] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3637__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN4[19] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__2839__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN4[19] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3619__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN4[1] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__2754__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN4[1] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3638__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN4[20] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__2844__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN4[20] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3639__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN4[21] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__2851__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN4[21] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3640__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN4[22] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__2855__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN4[22] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3641__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN4[23] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__2859__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN4[23] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3642__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN4[24] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__2863__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN4[24] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3643__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN4[25] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__2868__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN4[25] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3644__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN4[26] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__2876__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN4[26] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3645__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN4[27] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__2880__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN4[27] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3646__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN4[28] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__2884__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN4[28] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3647__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN4[29] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__2888__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN4[29] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3620__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN4[2] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__2758__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN4[2] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3648__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN4[30] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__2892__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN4[30] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3649__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN4[31] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__2898__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN4[31] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3621__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN4[3] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__2762__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN4[3] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3622__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN4[4] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__2766__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN4[4] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3623__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN4[5] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__2771__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN4[5] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3624__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN4[6] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__2778__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN4[6] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3625__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN4[7] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__2782__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN4[7] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3626__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN4[8] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__2786__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN4[8] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3627__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN4[9] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__2790__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN4[9] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3650__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN5[0] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__2578__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN5[0] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3660__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN5[10] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__2635__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN5[10] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3661__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN5[11] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__2640__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN5[11] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3662__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN5[12] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__2646__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN5[12] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3663__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN5[13] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__2650__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN5[13] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3664__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN5[14] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__2654__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN5[14] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3665__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN5[15] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__2659__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN5[15] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3666__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN5[16] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__2664__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN5[16] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3667__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN5[17] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__2670__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN5[17] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3668__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN5[18] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__2674__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN5[18] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3669__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN5[19] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__2678__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN5[19] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3651__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN5[1] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__2591__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN5[1] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3670__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN5[20] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__2683__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN5[20] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3671__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN5[21] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__2688__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN5[21] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3672__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN5[22] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__2695__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN5[22] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3673__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN5[23] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__2699__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN5[23] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3674__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN5[24] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__2703__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN5[24] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3675__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN5[25] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__2708__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN5[25] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3676__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN5[26] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__2713__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN5[26] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3677__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN5[27] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__2719__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN5[27] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3678__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN5[28] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__2723__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN5[28] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3679__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN5[29] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__2727__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN5[29] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3652__D (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN5[2] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__2597__A (
    .VGND(vgnd),
    .VPWR(vpwr),
    .DIODE(\int_PAR_IN5[2] )
);

sky130_fd_sc_hd__diode_2 ANTENNA__3680__D (
);

