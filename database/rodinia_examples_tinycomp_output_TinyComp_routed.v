`timescale 1 ps/ 1 ps

module Top(
	clk,
	bank0,
	bank1,
	bank2,
	bank3);
input	clk;
output	[7:0] bank0;
output	[7:0] bank1;
output	[7:0] bank2;
output	[7:0] bank3;

//wire	gnd;
//wire	vcc;
wire	AsyncReset_X1000_Y1002_GND;
wire	AsyncReset_X1001_Y1002_GND;
wire	AsyncReset_X1002_Y1002_GND;
wire	AsyncReset_X1004_Y1002_GND;
wire	AsyncReset_X1005_Y1002_GND;
wire	AsyncReset_X1006_Y1002_GND;
wire	AsyncReset_X1008_Y1002_GND;
wire	AsyncReset_X1009_Y1001_GND;
wire	AsyncReset_X1011_Y1001_GND;
wire	AsyncReset_X1012_Y1001_GND;
wire	[31:0] IOaddr1;
//wire	IOaddr1[0];
//wire	IOaddr1[10];
//wire	IOaddr1[11];
//wire	IOaddr1[12];
//wire	IOaddr1[13];
//wire	IOaddr1[14];
//wire	IOaddr1[15];
//wire	IOaddr1[16];
//wire	IOaddr1[17];
//wire	IOaddr1[18];
//wire	IOaddr1[19];
//wire	IOaddr1[1];
//wire	IOaddr1[20];
//wire	IOaddr1[21];
//wire	IOaddr1[22];
//wire	IOaddr1[23];
//wire	IOaddr1[24];
//wire	IOaddr1[25];
//wire	IOaddr1[26];
//wire	IOaddr1[27];
//wire	IOaddr1[28];
//wire	IOaddr1[29];
//wire	IOaddr1[2];
//wire	IOaddr1[30];
//wire	IOaddr1[31];
//wire	IOaddr1[3];
//wire	IOaddr1[4];
//wire	IOaddr1[5];
//wire	IOaddr1[6];
//wire	IOaddr1[7];
//wire	IOaddr1[8];
//wire	IOaddr1[9];
wire	[31:0] IOaddr2;
//wire	IOaddr2[0];
//wire	IOaddr2[10];
//wire	IOaddr2[11];
//wire	IOaddr2[12];
//wire	IOaddr2[13];
//wire	IOaddr2[14];
//wire	IOaddr2[15];
//wire	IOaddr2[16];
//wire	IOaddr2[17];
//wire	IOaddr2[18];
//wire	IOaddr2[19];
//wire	IOaddr2[1];
//wire	IOaddr2[20];
//wire	IOaddr2[21];
//wire	IOaddr2[22];
//wire	IOaddr2[23];
//wire	IOaddr2[24];
//wire	IOaddr2[25];
//wire	IOaddr2[26];
//wire	IOaddr2[27];
//wire	IOaddr2[28];
//wire	IOaddr2[29];
//wire	IOaddr2[2];
//wire	IOaddr2[30];
//wire	IOaddr2[31];
//wire	IOaddr2[3];
//wire	IOaddr2[4];
//wire	IOaddr2[5];
//wire	IOaddr2[6];
//wire	IOaddr2[7];
//wire	IOaddr2[8];
//wire	IOaddr2[9];
wire	[31:0] IOaddr3;
//wire	IOaddr3[0];
//wire	IOaddr3[10];
//wire	IOaddr3[11];
//wire	IOaddr3[12];
//wire	IOaddr3[13];
//wire	IOaddr3[14];
//wire	IOaddr3[15];
//wire	IOaddr3[16];
//wire	IOaddr3[17];
//wire	IOaddr3[18];
//wire	IOaddr3[19];
//wire	IOaddr3[1];
//wire	IOaddr3[20];
//wire	IOaddr3[21];
//wire	IOaddr3[22];
//wire	IOaddr3[23];
//wire	IOaddr3[24];
//wire	IOaddr3[25];
//wire	IOaddr3[26];
//wire	IOaddr3[27];
//wire	IOaddr3[28];
//wire	IOaddr3[29];
//wire	IOaddr3[2];
//wire	IOaddr3[30];
//wire	IOaddr3[31];
//wire	IOaddr3[3];
//wire	IOaddr3[4];
//wire	IOaddr3[5];
//wire	IOaddr3[6];
//wire	IOaddr3[7];
//wire	IOaddr3[8];
//wire	IOaddr3[9];
wire	[31:0] IOvalue1;
//wire	IOvalue1[0];
//wire	IOvalue1[10];
//wire	IOvalue1[11];
//wire	IOvalue1[12];
//wire	IOvalue1[13];
//wire	IOvalue1[14];
//wire	IOvalue1[15];
//wire	IOvalue1[16];
//wire	IOvalue1[17];
//wire	IOvalue1[18];
//wire	IOvalue1[19];
//wire	IOvalue1[1];
//wire	IOvalue1[20];
//wire	IOvalue1[21];
//wire	IOvalue1[22];
//wire	IOvalue1[23];
//wire	IOvalue1[24];
//wire	IOvalue1[25];
//wire	IOvalue1[26];
//wire	IOvalue1[27];
//wire	IOvalue1[28];
//wire	IOvalue1[29];
//wire	IOvalue1[2];
//wire	IOvalue1[30];
//wire	IOvalue1[31];
//wire	IOvalue1[3];
//wire	IOvalue1[4];
//wire	IOvalue1[5];
//wire	IOvalue1[6];
//wire	IOvalue1[7];
//wire	IOvalue1[8];
//wire	IOvalue1[9];
wire	[31:0] IOvalue2;
//wire	IOvalue2[0];
//wire	IOvalue2[10];
//wire	IOvalue2[11];
//wire	IOvalue2[12];
//wire	IOvalue2[13];
//wire	IOvalue2[14];
//wire	IOvalue2[15];
//wire	IOvalue2[16];
//wire	IOvalue2[17];
//wire	IOvalue2[18];
//wire	IOvalue2[19];
//wire	IOvalue2[1];
//wire	IOvalue2[20];
//wire	IOvalue2[21];
//wire	IOvalue2[22];
//wire	IOvalue2[23];
//wire	IOvalue2[24];
//wire	IOvalue2[25];
//wire	IOvalue2[26];
//wire	IOvalue2[27];
//wire	IOvalue2[28];
//wire	IOvalue2[29];
//wire	IOvalue2[2];
//wire	IOvalue2[30];
//wire	IOvalue2[31];
//wire	IOvalue2[3];
//wire	IOvalue2[4];
//wire	IOvalue2[5];
//wire	IOvalue2[6];
//wire	IOvalue2[7];
//wire	IOvalue2[8];
//wire	IOvalue2[9];
wire	[31:0] IOvalue3;
//wire	IOvalue3[0];
//wire	IOvalue3[10];
//wire	IOvalue3[11];
//wire	IOvalue3[12];
//wire	IOvalue3[13];
//wire	IOvalue3[14];
//wire	IOvalue3[15];
//wire	IOvalue3[16];
//wire	IOvalue3[17];
//wire	IOvalue3[18];
//wire	IOvalue3[19];
//wire	IOvalue3[1];
//wire	IOvalue3[20];
//wire	IOvalue3[21];
//wire	IOvalue3[22];
//wire	IOvalue3[23];
//wire	IOvalue3[24];
//wire	IOvalue3[25];
//wire	IOvalue3[26];
//wire	IOvalue3[27];
//wire	IOvalue3[28];
//wire	IOvalue3[29];
//wire	IOvalue3[2];
//wire	IOvalue3[30];
//wire	IOvalue3[31];
//wire	IOvalue3[3];
//wire	IOvalue3[4];
//wire	IOvalue3[5];
//wire	IOvalue3[6];
//wire	IOvalue3[7];
//wire	IOvalue3[8];
//wire	IOvalue3[9];
wire	[7:0] syn__0000_;
//wire	syn__0000_[0];
//wire	syn__0000_[1];
//wire	syn__0000_[2];
//wire	syn__0000_[3];
//wire	syn__0000_[4];
//wire	syn__0000_[5];
//wire	syn__0000_[6];
//wire	syn__0000_[7];
wire	[7:0] syn__0001_;
//wire	syn__0001_[0];
//wire	syn__0001_[1];
//wire	syn__0001_[2];
//wire	syn__0001_[3];
//wire	syn__0001_[4];
//wire	syn__0001_[5];
//wire	syn__0001_[6];
//wire	syn__0001_[7];
wire	[7:0] syn__0002_;
//wire	syn__0002_[0];
//wire	syn__0002_[1];
//wire	syn__0002_[2];
//wire	syn__0002_[3];
//wire	syn__0002_[4];
//wire	syn__0002_[5];
//wire	syn__0002_[6];
//wire	syn__0002_[7];
wire	syn__0003_;
wire	syn__0004_;
wire	syn__0005_;
wire	syn__0006_;
wire	syn__0007_;
wire	syn__0008_;
wire	syn__0009_;
wire	syn__0010_;
wire	syn__0011_;
wire	syn__0012_;
wire	syn__0013_;
wire	syn__0014_;
wire	syn__0015_;
wire	syn__0016_;
wire	syn__0017_;
wire	syn__0018_;
wire	syn__0019_;
wire	syn__0020_;
wire	syn__0021_;
wire	syn__0022_;
wire	syn__0023_;
wire	syn__0024_;
wire	syn__0025_;
wire	syn__0026_;
wire	syn__0027_;
wire	syn__0028_;
wire	syn__0029_;
wire	syn__0030_;
wire	syn__0031_;
wire	syn__0032_;
wire	syn__0033_;
wire	syn__0034_;
wire	syn__0035_;
wire	syn__0036_;
wire	syn__0037_;
wire	syn__0038_;
wire	syn__0039_;
wire	syn__0040_;
wire	syn__0041_;
wire	syn__0042_;
wire	syn__0043_;
wire	syn__0044_;
wire	syn__0045_;
wire	syn__0046_;
wire	syn__0047_;
wire	syn__0048_;
wire	syn__0049_;
wire	syn__0050_;
wire	syn__0051_;
wire	syn__0052_;
wire	syn__0053_;
wire	syn__0054_;
wire	syn__0055_;
wire	syn__0056_;
wire	syn__0057_;
wire	syn__0058_;
wire	syn__0059_;
wire	syn__0060_;
wire	syn__0061_;
wire	syn__0062_;
wire	syn__0063_;
wire	syn__0064_;
wire	syn__0065_;
wire	syn__0066_;
wire	syn__0067_;
wire	syn__0068_;
wire	syn__0069_;
wire	syn__0070_;
wire	syn__0071_;
wire	syn__0072_;
wire	syn__0073_;
wire	syn__0074_;
wire	syn__0075_;
wire	syn__0076_;
wire	syn__0077_;
wire	syn__0078_;
wire	syn__0079_;
wire	syn__0080_;
wire	syn__0081_;
wire	syn__0082_;
wire	syn__0083_;
wire	syn__0084_;
wire	syn__0085_;
wire	syn__0086_;
wire	syn__0087_;
wire	syn__0088_;
wire	syn__0089_;
wire	syn__0090_;
wire	syn__0091_;
wire	syn__0092_;
wire	syn__0093_;
wire	syn__0094_;
wire	syn__0095_;
wire	syn__0096_;
wire	syn__0097_;
wire	syn__0098_;
wire	syn__0099_;
wire	syn__0100_;
wire	syn__0101_;
wire	syn__0102_;
wire	syn__0103_;
wire	syn__0104_;
wire	syn__0105_;
wire	syn__0106_;
wire	syn__0107_;
wire	syn__0108_;
wire	syn__0109_;
wire	syn__0110_;
wire	syn__0111_;
wire	syn__0112_;
wire	syn__0113_;
wire	syn__0114_;
wire	syn__0115_;
wire	syn__0116_;
wire	syn__0117_;
wire	syn__0118_;
wire	syn__0119_;
wire	syn__0120_;
wire	syn__0121_;
wire	syn__0122_;
wire	syn__0123_;
wire	syn__0124_;
wire	syn__0125_;
wire	syn__0126_;
wire	syn__0127_;
wire	syn__0128_;
wire	syn__0129_;
wire	syn__0130_;
wire	syn__0131_;
wire	syn__0132_;
wire	syn__0133_;
wire	syn__0134_;
wire	syn__0135_;
wire	syn__0136_;
wire	syn__0137_;
wire	syn__0138_;
wire	syn__0139_;
wire	syn__0140_;
wire	syn__0141_;
wire	syn__0142_;
wire	syn__0143_;
wire	syn__0144_;
wire	syn__0145_;
wire	syn__0146_;
wire	syn__0147_;
wire	syn__0148_;
wire	syn__0149_;
wire	syn__0150_;
wire	syn__0151_;
wire	syn__0152_;
wire	syn__0153_;
wire	syn__0154_;
wire	syn__0155_;
wire	syn__0156_;
wire	syn__0157_;
wire	syn__0158_;
wire	syn__0159_;
wire	syn__0160_;
wire	syn__0161_;
wire	syn__0162_;
wire	syn__0163_;
wire	syn__0164_;
wire	syn__0165_;
wire	syn__0166_;
wire	syn__0167_;
wire	syn__0168_;
wire	syn__0169_;
wire	syn__0170_;
wire	syn__0171_;
wire	syn__0172_;
wire	syn__0173_;
wire	syn__0174_;
wire	syn__0175_;
wire	syn__0176_;
wire	syn__0177_;
wire	syn__0178_;
wire	syn__0179_;
wire	syn__0180_;
wire	syn__0181_;
wire	syn__0182_;
wire	syn__0183_;
wire	syn__0184_;
wire	syn__0185_;
wire	syn__0186_;
wire	syn__0187_;
wire	syn__0188_;
wire	syn__0189_;
wire	syn__0190_;
wire	syn__0191_;
wire	syn__0192_;
wire	syn__0193_;
wire	syn__0194_;
wire	syn__0195_;
wire	syn__0196_;
wire	syn__0197_;
wire	syn__0198_;
wire	syn__0199_;
wire	syn__0200_;
wire	syn__0201_;
wire	syn__0202_;
wire	syn__0203_;
wire	syn__0204_;
wire	syn__0205_;
wire	syn__0206_;
wire	syn__0207_;
wire	syn__0208_;
wire	syn__0209_;
wire	syn__0210_;
wire	syn__0211_;
wire	syn__0212_;
wire	syn__0213_;
wire	syn__0214_;
wire	syn__0215_;
wire	syn__0216_;
wire	syn__0217_;
wire	syn__0218_;
wire	syn__0219_;
wire	syn__0220_;
wire	syn__0221_;
wire	syn__0222_;
wire	syn__0223_;
wire	syn__0224_;
wire	syn__0225_;
wire	syn__0226_;
wire	syn__0227_;
wire	syn__0228_;
wire	syn__0229_;
wire	syn__0230_;
wire	syn__0231_;
wire	syn__0232_;
wire	syn__0233_;
wire	syn__0234_;
wire	syn__0235_;
wire	syn__0236_;
wire	syn__0237_;
wire	syn__0238_;
wire	syn__0239_;
wire	syn__0240_;
wire	syn__0241_;
wire	syn__0242_;
wire	syn__0243_;
wire	syn__0244_;
wire	syn__0245_;
wire	syn__0246_;
wire	syn__0247_;
wire	syn__0248_;
wire	syn__0249_;
wire	syn__0250_;
wire	syn__0251_;
wire	syn__0252_;
wire	syn__0253_;
wire	syn__0254_;
wire	syn__0255_;
wire	syn__0256_;
wire	syn__0257_;
wire	syn__0258_;
wire	syn__0259_;
wire	syn__0260_;
wire	syn__0261_;
wire	syn__0262_;
wire	syn__0263_;
wire	syn__0264_;
wire	syn__0265_;
wire	syn__0266_;
wire	syn__0267_;
wire	syn__0268_;
wire	syn__0269_;
wire	syn__0270_;
wire	syn__0271_;
wire	syn__0272_;
wire	syn__0273_;
wire	syn__0274_;
wire	syn__0275_;
wire	syn__0276_;
wire	syn__0277_;
wire	syn__0278_;
wire	syn__0279_;
wire	syn__0280_;
wire	syn__0281_;
wire	syn__0282_;
wire	syn__0283_;
wire	syn__0284_;
wire	syn__0285_;
wire	syn__0286_;
wire	syn__0287_;
wire	syn__0288_;
wire	syn__0289_;
wire	syn__0290_;
wire	syn__0291_;
wire	syn__0292_;
wire	syn__0293_;
wire	syn__0294_;
wire	syn__0295_;
wire	syn__0296_;
wire	syn__0297_;
wire	syn__0298_;
wire	syn__0299_;
wire	syn__0300_;
wire	syn__0301_;
wire	syn__0302_;
wire	syn__0303_;
wire	syn__0304_;
wire	syn__0305_;
wire	syn__0306_;
wire	syn__0307_;
wire	syn__0308_;
wire	syn__0309_;
wire	syn__0310_;
wire	syn__0311_;
wire	syn__0312_;
wire	syn__0313_;
wire	syn__0314_;
wire	syn__0315_;
wire	syn__0316_;
wire	syn__0317_;
wire	syn__0318_;
wire	syn__0319_;
wire	syn__0320_;
wire	syn__0321_;
wire	syn__0322_;
wire	syn__0323_;
wire	syn__0324_;
wire	syn__0325_;
wire	syn__0326_;
wire	syn__0327_;
wire	syn__0328_;
wire	syn__0329_;
wire	syn__0330_;
wire	syn__0331_;
wire	syn__0332_;
wire	syn__0333_;
wire	syn__0334_;
wire	syn__0335_;
wire	syn__0336_;
wire	syn__0337_;
wire	syn__0338_;
wire	syn__0339_;
wire	syn__0340_;
wire	syn__0341_;
wire	syn__0342_;
wire	syn__0343_;
wire	syn__0344_;
wire	syn__0345_;
wire	syn__0346_;
wire	syn__0347_;
wire	syn__0348_;
wire	syn__0349_;
wire	syn__0350_;
wire	syn__0351_;
wire	syn__0352_;
wire	syn__0353_;
wire	syn__0354_;
wire	syn__0355_;
wire	syn__0356_;
wire	syn__0357_;
wire	syn__0358_;
wire	syn__0359_;
wire	syn__0360_;
wire	syn__0361_;
wire	syn__0362_;
wire	syn__0363_;
wire	syn__0364_;
wire	syn__0365_;
wire	syn__0366_;
wire	syn__0367_;
wire	syn__0368_;
wire	syn__0369_;
wire	syn__0370_;
wire	syn__0371_;
wire	syn__0372_;
wire	syn__0373_;
wire	syn__0374_;
wire	syn__0375_;
wire	syn__0376_;
wire	syn__0377_;
wire	syn__0378_;
wire	syn__0379_;
wire	syn__0380_;
wire	syn__0381_;
wire	syn__0382_;
wire	syn__0383_;
wire	syn__0384_;
wire	syn__0385_;
wire	syn__0386_;
wire	syn__0387_;
wire	syn__0388_;
wire	syn__0389_;
wire	syn__0390_;
wire	syn__0391_;
wire	syn__0392_;
wire	syn__0393_;
wire	syn__0394_;
wire	syn__0395_;
wire	syn__0396_;
wire	syn__0397_;
wire	syn__0398_;
wire	syn__0399_;
wire	syn__0400_;
wire	syn__0401_;
wire	syn__0402_;
wire	syn__0403_;
wire	syn__0404_;
wire	syn__0405_;
wire	syn__0406_;
wire	syn__0407_;
wire	syn__0408_;
wire	syn__0409_;
wire	syn__0410_;
wire	syn__0411_;
wire	syn__0412_;
wire	syn__0413_;
wire	syn__0414_;
wire	syn__0415_;
wire	syn__0416_;
wire	syn__0417_;
wire	syn__0418_;
wire	syn__0419_;
wire	syn__0420_;
wire	syn__0421_;
wire	syn__0422_;
wire	syn__0423_;
wire	syn__0424_;
wire	syn__0425_;
wire	syn__0426_;
wire	syn__0427_;
wire	syn__0428_;
wire	syn__0429_;
wire	syn__0430_;
wire	syn__0431_;
wire	syn__0432_;
wire	syn__0433_;
wire	syn__0434_;
wire	syn__0435_;
wire	syn__0436_;
wire	syn__0437_;
wire	syn__0438_;
wire	syn__0439_;
wire	syn__0440_;
wire	syn__0441_;
wire	syn__0442_;
wire	syn__0443_;
wire	syn__0444_;
wire	syn__0445_;
wire	syn__0446_;
wire	syn__0447_;
wire	syn__0448_;
wire	syn__0449_;
wire	syn__0450_;
wire	syn__0451_;
wire	syn__0452_;
wire	syn__0453_;
wire	syn__0454_;
wire	syn__0455_;
wire	syn__0456_;
wire	syn__0457_;
wire	syn__0458_;
wire	syn__0459_;
wire	syn__0460_;
wire	syn__0461_;
wire	syn__0462_;
wire	syn__0463_;
wire	syn__0464_;
wire	syn__0465_;
wire	syn__0466_;
wire	syn__0467_;
wire	syn__0468_;
wire	syn__0469_;
wire	syn__0470_;
wire	syn__0471_;
wire	syn__0472_;
wire	syn__0473_;
wire	syn__0474_;
wire	syn__0475_;
wire	syn__0476_;
wire	syn__0477_;
wire	syn__0478_;
wire	syn__0479_;
wire	syn__0480_;
wire	syn__0481_;
wire	syn__0482_;
wire	syn__0483_;
wire	syn__0484_;
wire	syn__0485_;
wire	syn__0486_;
wire	syn__0487_;
wire	syn__0488_;
wire	syn__0489_;
wire	syn__0490_;
wire	syn__0491_;
wire	syn__0492_;
wire	syn__0493_;
wire	syn__0494_;
wire	syn__0495_;
wire	syn__0496_;
wire	syn__0497_;
wire	syn__0498_;
wire	syn__0499_;
wire	syn__0500_;
wire	syn__0501_;
wire	syn__0502_;
wire	syn__0503_;
wire	syn__0504_;
wire	syn__0505_;
wire	syn__0506_;
wire	syn__0507_;
wire	syn__0508_;
wire	syn__0509_;
wire	syn__0510_;
wire	syn__0511_;
wire	syn__0512_;
wire	syn__0513_;
wire	syn__0514_;
wire	syn__0515_;
wire	syn__0516_;
wire	syn__0517_;
wire	syn__0518_;
wire	syn__0519_;
wire	syn__0520_;
wire	syn__0521_;
wire	syn__0522_;
wire	syn__0523_;
wire	syn__0524_;
wire	syn__0525_;
wire	syn__0526_;
wire	syn__0527_;
wire	syn__0528_;
wire	syn__0529_;
wire	syn__0530_;
wire	syn__0531_;
wire	syn__0532_;
wire	syn__0533_;
wire	syn__0534_;
wire	syn__0535_;
wire	syn__0536_;
wire	syn__0537_;
wire	syn__0538_;
wire	syn__0539_;
wire	syn__0540_;
wire	syn__0541_;
wire	syn__0542_;
wire	syn__0543_;
wire	syn__0544_;
wire	syn__0545_;
wire	syn__0546_;
wire	syn__0547_;
wire	syn__0548_;
wire	syn__0549_;
wire	syn__0550_;
wire	syn__0551_;
wire	syn__0552_;
wire	syn__0553_;
wire	syn__0554_;
wire	syn__0555_;
wire	syn__0556_;
wire	syn__0557_;
wire	syn__0558_;
wire	syn__0559_;
wire	syn__0560_;
wire	syn__0561_;
wire	syn__0562_;
wire	syn__0563_;
wire	syn__0564_;
wire	syn__0565_;
wire	syn__0566_;
wire	syn__0567_;
wire	syn__0568_;
wire	syn__0569_;
wire	syn__0570_;
wire	syn__0571_;
wire	syn__0572_;
wire	syn__0573_;
wire	syn__0574_;
wire	syn__0575_;
wire	syn__0576_;
wire	syn__0577_;
wire	syn__0578_;
wire	syn__0579_;
wire	syn__0580_;
wire	syn__0581_;
wire	syn__0582_;
wire	syn__0583_;
wire	syn__0584_;
wire	syn__0585_;
wire	syn__0586_;
wire	syn__0587_;
wire	syn__0588_;
wire	syn__0589_;
wire	syn__0590_;
wire	syn__0591_;
wire	syn__0592_;
wire	syn__0593_;
wire	syn__0594_;
wire	syn__0595_;
wire	syn__0596_;
wire	syn__0597_;
wire	syn__0598_;
wire	syn__0599_;
wire	syn__0600_;
wire	syn__0601_;
wire	syn__0602_;
wire	syn__0603_;
wire	syn__0604_;
wire	syn__0605_;
wire	syn__0606_;
wire	syn__0607_;
wire	syn__0608_;
wire	syn__0609_;
wire	syn__0610_;
wire	syn__0611_;
wire	syn__0612_;
wire	syn__0613_;
wire	syn__0614_;
wire	syn__0615_;
wire	syn__0616_;
wire	syn__0617_;
wire	syn__0618_;
wire	syn__0619_;
wire	syn__0620_;
wire	syn__0621_;
wire	syn__0622_;
wire	syn__0623_;
wire	syn__0624_;
wire	syn__0625_;
wire	syn__0626_;
wire	syn__0627_;
wire	syn__0628_;
wire	syn__0629_;
wire	syn__0630_;
wire	syn__0631_;
wire	syn__0632_;
wire	syn__0633_;
wire	syn__0634_;
wire	syn__0635_;
wire	syn__0636_;
wire	syn__0637_;
wire	syn__0638_;
wire	syn__0639_;
wire	syn__0640_;
wire	syn__0641_;
wire	syn__0642_;
wire	syn__0643_;
wire	syn__0644_;
wire	syn__0645_;
wire	syn__0646_;
wire	syn__0647_;
wire	syn__0648_;
wire	syn__0649_;
wire	syn__0650_;
wire	syn__0651_;
wire	syn__0652_;
wire	syn__0653_;
wire	syn__0654_;
wire	syn__0655_;
wire	syn__0656_;
wire	syn__0657_;
wire	syn__0658_;
wire	syn__0659_;
wire	syn__0660_;
wire	syn__0661_;
wire	syn__0662_;
wire	syn__0663_;
wire	syn__0664_;
wire	syn__0665_;
wire	syn__0666_;
wire	syn__0667_;
wire	syn__0668_;
wire	syn__0669_;
wire	syn__0670_;
wire	syn__0671_;
wire	syn__0672_;
wire	syn__0673_;
wire	syn__0674_;
wire	syn__0675_;
wire	syn__0676_;
wire	syn__0677_;
wire	syn__0678_;
wire	syn__0679_;
wire	syn__0680_;
wire	syn__0681_;
wire	syn__0682_;
wire	syn__0683_;
wire	syn__0684_;
wire	syn__0685_;
wire	syn__0686_;
wire	syn__0687_;
wire	syn__0688_;
wire	syn__0689_;
wire	syn__0690_;
wire	syn__0691_;
wire	syn__0692_;
wire	syn__0693_;
wire	syn__0694_;
wire	syn__0695_;
wire	syn__0696_;
wire	syn__0697_;
wire	syn__0698_;
wire	syn__0699_;
wire	syn__0700_;
wire	syn__0701_;
wire	syn__0702_;
wire	syn__0703_;
wire	syn__0704_;
wire	syn__0705_;
wire	syn__0706_;
wire	syn__0707_;
wire	syn__0708_;
wire	syn__0709_;
wire	syn__0710_;
wire	syn__0711_;
wire	syn__0712_;
wire	syn__0713_;
wire	syn__0714_;
wire	syn__0715_;
wire	syn__0716_;
wire	syn__0717_;
wire	syn__0718_;
wire	syn__0719_;
wire	syn__0720_;
wire	syn__0721_;
wire	syn__0722_;
wire	syn__0723_;
wire	syn__0724_;
wire	syn__0725_;
wire	syn__0726_;
wire	syn__0727_;
wire	syn__0728_;
wire	syn__0729_;
wire	syn__0730_;
wire	syn__0731_;
wire	syn__0732_;
wire	syn__0733_;
wire	syn__0734_;
wire	syn__0735_;
wire	syn__0736_;
wire	syn__0737_;
wire	syn__0738_;
wire	syn__0739_;
wire	syn__0740_;
wire	syn__0741_;
wire	syn__0742_;
wire	syn__0743_;
wire	syn__0744_;
wire	syn__0745_;
wire	syn__0746_;
wire	syn__0747_;
wire	syn__0748_;
wire	syn__0749_;
wire	syn__0750_;
wire	syn__0751_;
wire	syn__0752_;
wire	syn__0753_;
wire	syn__0754_;
wire	syn__0755_;
wire	syn__0756_;
wire	syn__0757_;
wire	syn__0758_;
wire	syn__0759_;
wire	syn__0760_;
wire	syn__0761_;
wire	syn__0762_;
wire	syn__0763_;
wire	syn__0764_;
wire	syn__0765_;
wire	syn__0766_;
wire	syn__0767_;
wire	syn__0768_;
wire	syn__0769_;
wire	syn__0770_;
wire	syn__0771_;
wire	syn__0772_;
wire	syn__0773_;
wire	syn__0774_;
wire	syn__0775_;
wire	syn__0776_;
wire	syn__0777_;
wire	syn__0778_;
wire	syn__0779_;
wire	syn__0780_;
wire	syn__0781_;
wire	syn__0782_;
wire	syn__0783_;
wire	syn__0784_;
wire	syn__0785_;
wire	syn__0786_;
wire	syn__0787_;
wire	syn__0788_;
wire	syn__0789_;
wire	syn__0790_;
wire	syn__0791_;
wire	syn__0792_;
wire	syn__0793_;
wire	syn__0794_;
wire	syn__0795_;
wire	syn__0796_;
wire	syn__0797_;
wire	syn__0798_;
wire	syn__0799_;
wire	syn__0800_;
wire	syn__0801_;
wire	syn__0802_;
wire	syn__0803_;
wire	syn__0804_;
wire	syn__0805_;
wire	syn__0806_;
wire	syn__0807_;
wire	syn__0808_;
wire	syn__0809_;
wire	syn__0810_;
wire	syn__0811_;
wire	syn__0812_;
wire	syn__0813_;
wire	syn__0814_;
wire	syn__0815_;
wire	syn__0816_;
wire	syn__0817_;
wire	syn__0818_;
wire	syn__0819_;
wire	syn__0820_;
wire	syn__0821_;
wire	syn__0822_;
wire	syn__0823_;
wire	syn__0824_;
wire	syn__0825_;
wire	syn__0826_;
wire	syn__0827_;
wire	syn__0828_;
wire	syn__0829_;
wire	syn__0830_;
wire	syn__0831_;
wire	syn__0832_;
wire	syn__0833_;
wire	syn__0834_;
wire	syn__0835_;
wire	syn__0836_;
wire	syn__0837_;
wire	syn__0838_;
wire	syn__0839_;
wire	syn__0840_;
wire	syn__0841_;
wire	syn__0842_;
wire	syn__0843_;
wire	syn__0844_;
wire	syn__0845_;
wire	syn__0846_;
wire	syn__0847_;
wire	syn__0848_;
wire	syn__0849_;
wire	syn__0850_;
wire	syn__0851_;
wire	syn__0852_;
wire	syn__0853_;
wire	syn__0854_;
wire	syn__0855_;
wire	syn__0856_;
wire	syn__0857_;
wire	syn__0858_;
wire	syn__0859_;
wire	syn__0860_;
wire	syn__0861_;
wire	syn__0862_;
wire	syn__0863_;
wire	syn__0864_;
wire	syn__0865_;
wire	syn__0866_;
wire	syn__0867_;
wire	syn__0868_;
wire	syn__0869_;
wire	syn__0870_;
wire	syn__0871_;
wire	syn__0872_;
wire	syn__0873_;
wire	syn__0874_;
wire	syn__0875_;
wire	syn__0876_;
wire	syn__0877_;
wire	syn__0878_;
wire	syn__0879_;
wire	syn__0880_;
wire	syn__0881_;
wire	syn__0882_;
wire	syn__0883_;
wire	syn__0884_;
wire	syn__0885_;
wire	syn__0886_;
wire	syn__0887_;
wire	syn__0888_;
wire	syn__0889_;
wire	syn__0890_;
wire	syn__0891_;
wire	syn__0892_;
wire	syn__0893_;
wire	syn__0894_;
wire	syn__0895_;
wire	syn__0896_;
wire	syn__0897_;
wire	syn__0898_;
wire	syn__0899_;
wire	syn__0900_;
wire	syn__0901_;
wire	syn__0902_;
wire	syn__0903_;
wire	syn__0904_;
wire	syn__0905_;
wire	syn__0906_;
wire	syn__0907_;
wire	syn__0908_;
wire	syn__0909_;
wire	syn__0910_;
wire	syn__0911_;
wire	syn__0912_;
wire	syn__0913_;
wire	syn__0914_;
wire	syn__0915_;
wire	syn__0916_;
wire	syn__0917_;
wire	syn__0918_;
wire	syn__0919_;
wire	syn__0920_;
wire	syn__0921_;
wire	syn__0922_;
wire	syn__0923_;
wire	syn__0924_;
wire	syn__0925_;
wire	syn__0926_;
wire	syn__0927_;
wire	syn__0928_;
wire	syn__0929_;
wire	syn__0930_;
wire	syn__0931_;
wire	syn__0932_;
wire	syn__0933_;
wire	syn__0934_;
wire	syn__0935_;
wire	syn__0936_;
wire	syn__0937_;
wire	syn__0938_;
wire	syn__0939_;
wire	syn__0940_;
wire	syn__0941_;
wire	syn__0942_;
wire	syn__0943_;
wire	syn__0944_;
wire	syn__0945_;
wire	syn__0946_;
wire	syn__0947_;
wire	syn__0948_;
wire	syn__0949_;
wire	syn__0950_;
wire	syn__0951_;
wire	syn__0952_;
wire	syn__0953_;
wire	syn__0954_;
wire	syn__0955_;
wire	syn__0956_;
wire	syn__0957_;
wire	syn__0958_;
wire	syn__0959_;
wire	syn__0960_;
wire	syn__0961_;
wire	syn__0962_;
wire	syn__0963_;
wire	syn__0964_;
wire	syn__0965_;
wire	syn__0966_;
wire	syn__0967_;
wire	syn__0968_;
wire	syn__0969_;
wire	syn__0970_;
wire	syn__0971_;
wire	syn__0972_;
wire	syn__0973_;
wire	syn__0974_;
wire	syn__0975_;
wire	syn__0976_;
wire	syn__0977_;
wire	syn__0978_;
wire	syn__0979_;
wire	syn__0980_;
wire	syn__0981_;
wire	syn__0982_;
wire	syn__0983_;
wire	syn__0984_;
wire	syn__0985_;
wire	syn__0986_;
wire	syn__0987_;
wire	syn__0988_;
wire	syn__0989_;
wire	syn__0990_;
wire	syn__0991_;
wire	syn__0992_;
wire	syn__0993_;
wire	syn__0994_;
wire	syn__0995_;
wire	syn__0996_;
wire	syn__0997_;
wire	syn__0998_;
wire	syn__0999_;
wire	syn__1000_;
wire	syn__1001_;
wire	syn__1002_;
wire	syn__1003_;
wire	syn__1004_;
wire	syn__1005_;
wire	syn__1006_;
wire	syn__1007_;
wire	syn__1008_;
wire	syn__1009_;
wire	syn__1010_;
wire	syn__1011_;
wire	syn__1012_;
wire	syn__1013_;
wire	syn__1014_;
wire	syn__1015_;
wire	syn__1016_;
wire	syn__1017_;
wire	syn__1018_;
wire	syn__1019_;
wire	syn__1020_;
wire	syn__1021_;
wire	syn__1022_;
wire	syn__1023_;
wire	syn__1024_;
wire	syn__1025_;
wire	syn__1026_;
wire	syn__1027_;
wire	syn__1028_;
wire	syn__1029_;
wire	syn__1030_;
wire	syn__1031_;
wire	syn__1032_;
wire	syn__1033_;
wire	syn__1034_;
wire	syn__1035_;
wire	syn__1036_;
wire	syn__1037_;
wire	syn__1038_;
wire	syn__1039_;
wire	syn__1040_;
wire	syn__1041_;
wire	syn__1042_;
wire	syn__1043_;
wire	syn__1044_;
wire	syn__1045_;
wire	syn__1046_;
wire	syn__1047_;
wire	syn__1048_;
wire	syn__1049_;
wire	syn__1050_;
wire	syn__1051_;
wire	syn__1052_;
wire	syn__1053_;
wire	syn__1054_;
wire	syn__1055_;
wire	syn__1056_;
wire	syn__1057_;
wire	syn__1058_;
wire	syn__1059_;
wire	syn__1060_;
wire	syn__1061_;
wire	syn__1062_;
wire	syn__1063_;
wire	syn__1064_;
wire	syn__1065_;
wire	syn__1066_;
wire	syn__1067_;
wire	syn__1068_;
wire	syn__1069_;
wire	syn__1070_;
wire	syn__1071_;
wire	syn__1072_;
wire	syn__1073_;
wire	syn__1074_;
wire	syn__1075_;
wire	syn__1076_;
wire	syn__1077_;
wire	syn__1078_;
wire	syn__1079_;
wire	syn__1080_;
wire	syn__1081_;
wire	syn__1082_;
wire	syn__1083_;
wire	syn__1084_;
wire	syn__1085_;
wire	syn__1086_;
wire	syn__1087_;
wire	syn__1088_;
wire	syn__1089_;
wire	syn__1090_;
wire	syn__1091_;
wire	syn__1092_;
wire	syn__1093_;
wire	syn__1094_;
wire	syn__1095_;
wire	syn__1096_;
wire	syn__1097_;
wire	syn__1098_;
wire	syn__1099_;
wire	[7:0] syn__1100_;
//wire	syn__1100_[0];
//wire	syn__1100_[1];
//wire	syn__1100_[2];
//wire	syn__1100_[3];
//wire	syn__1100_[4];
//wire	syn__1100_[5];
//wire	syn__1100_[6];
//wire	syn__1100_[7];
wire	[7:0] syn__1101_;
//wire	syn__1101_[0];
//wire	syn__1101_[1];
//wire	syn__1101_[2];
//wire	syn__1101_[3];
//wire	syn__1101_[4];
//wire	syn__1101_[5];
//wire	syn__1101_[6];
//wire	syn__1101_[7];
wire	[7:0] syn__1102_;
//wire	syn__1102_[0];
//wire	syn__1102_[1];
//wire	syn__1102_[2];
//wire	syn__1102_[3];
//wire	syn__1102_[4];
//wire	syn__1102_[5];
//wire	syn__1102_[6];
//wire	syn__1102_[7];
wire	syn__1103_;
wire	syn__1103__X1000_Y1002_SIG_VCC;
wire	syn__1103__X1001_Y1002_SIG_VCC;
wire	syn__1103__X1002_Y1002_SIG_VCC;
wire	syn__1103__X1004_Y1002_SIG_VCC;
wire	syn__1103__X1005_Y1002_SIG_VCC;
wire	syn__1103__X1006_Y1002_SIG_VCC;
wire	syn__1103__X1008_Y1002_SIG_VCC;
wire	syn__1103__X1009_Y1001_SIG_VCC;
wire	syn__1103__X1011_Y1001_SIG_VCC;
wire	syn__1103__X1012_Y1001_SIG_VCC;
wire	[31:0] \tc1.DM ;
//wire	\tc1.DM [0];
//wire	\tc1.DM [10];
//wire	\tc1.DM [11];
//wire	\tc1.DM [12];
//wire	\tc1.DM [13];
//wire	\tc1.DM [14];
//wire	\tc1.DM [15];
//wire	\tc1.DM [16];
//wire	\tc1.DM [17];
//wire	\tc1.DM [18];
//wire	\tc1.DM [19];
//wire	\tc1.DM [1];
//wire	\tc1.DM [20];
//wire	\tc1.DM [21];
//wire	\tc1.DM [22];
//wire	\tc1.DM [23];
//wire	\tc1.DM [24];
//wire	\tc1.DM [25];
//wire	\tc1.DM [26];
//wire	\tc1.DM [27];
//wire	\tc1.DM [28];
//wire	\tc1.DM [29];
//wire	\tc1.DM [2];
//wire	\tc1.DM [30];
//wire	\tc1.DM [31];
//wire	\tc1.DM [3];
//wire	\tc1.DM [4];
//wire	\tc1.DM [5];
//wire	\tc1.DM [6];
//wire	\tc1.DM [7];
//wire	\tc1.DM [8];
//wire	\tc1.DM [9];
wire	[31:0] \tc1.IM ;
//wire	\tc1.IM [0];
//wire	\tc1.IM [10];
//wire	\tc1.IM [11];
//wire	\tc1.IM [12];
//wire	\tc1.IM [13];
//wire	\tc1.IM [14];
//wire	\tc1.IM [15];
//wire	\tc1.IM [16];
//wire	\tc1.IM [17];
//wire	\tc1.IM [18];
//wire	\tc1.IM [19];
//wire	\tc1.IM [1];
//wire	\tc1.IM [20];
//wire	\tc1.IM [21];
//wire	\tc1.IM [22];
//wire	\tc1.IM [23];
//wire	\tc1.IM [24];
//wire	\tc1.IM [25];
//wire	\tc1.IM [26];
//wire	\tc1.IM [27];
//wire	\tc1.IM [28];
//wire	\tc1.IM [29];
//wire	\tc1.IM [2];
//wire	\tc1.IM [30];
//wire	\tc1.IM [31];
//wire	\tc1.IM [3];
//wire	\tc1.IM [4];
//wire	\tc1.IM [5];
//wire	\tc1.IM [6];
//wire	\tc1.IM [7];
//wire	\tc1.IM [8];
//wire	\tc1.IM [9];
wire	[6:0] \tc1.PC ;
//wire	\tc1.PC [0];
//wire	\tc1.PC [1];
//wire	\tc1.PC [2];
//wire	\tc1.PC [3];
//wire	\tc1.PC [4];
//wire	\tc1.PC [5];
//wire	\tc1.PC [6];
wire	[6:0] \tc1.PCmux ;
//wire	\tc1.PCmux [0];
//wire	\tc1.PCmux [1];
//wire	\tc1.PCmux [2];
//wire	\tc1.PCmux [3];
//wire	\tc1.PCmux [4];
//wire	\tc1.PCmux [5];
//wire	\tc1.PCmux [6];
wire	[31:0] \tc1.WD ;
//wire	\tc1.WD [0];
//wire	\tc1.WD [10];
//wire	\tc1.WD [11];
//wire	\tc1.WD [12];
//wire	\tc1.WD [13];
//wire	\tc1.WD [14];
//wire	\tc1.WD [15];
//wire	\tc1.WD [16];
//wire	\tc1.WD [17];
//wire	\tc1.WD [18];
//wire	\tc1.WD [19];
//wire	\tc1.WD [1];
//wire	\tc1.WD [20];
//wire	\tc1.WD [21];
//wire	\tc1.WD [22];
//wire	\tc1.WD [23];
//wire	\tc1.WD [24];
//wire	\tc1.WD [25];
//wire	\tc1.WD [26];
//wire	\tc1.WD [27];
//wire	\tc1.WD [28];
//wire	\tc1.WD [29];
//wire	\tc1.WD [2];
//wire	\tc1.WD [30];
//wire	\tc1.WD [31];
//wire	\tc1.WD [3];
//wire	\tc1.WD [4];
//wire	\tc1.WD [5];
//wire	\tc1.WD [6];
//wire	\tc1.WD [7];
//wire	\tc1.WD [8];
//wire	\tc1.WD [9];
wire	\tc1.WriteDM ;
wire	\tc1.WriteIM ;
wire	[31:0] \tc1.dm.douta ;
//wire	\tc1.dm.douta [0];
//wire	\tc1.dm.douta [10];
//wire	\tc1.dm.douta [11];
//wire	\tc1.dm.douta [12];
//wire	\tc1.dm.douta [13];
//wire	\tc1.dm.douta [14];
//wire	\tc1.dm.douta [15];
//wire	\tc1.dm.douta [16];
//wire	\tc1.dm.douta [17];
//wire	\tc1.dm.douta [18];
//wire	\tc1.dm.douta [19];
//wire	\tc1.dm.douta [1];
//wire	\tc1.dm.douta [20];
//wire	\tc1.dm.douta [21];
//wire	\tc1.dm.douta [22];
//wire	\tc1.dm.douta [23];
//wire	\tc1.dm.douta [24];
//wire	\tc1.dm.douta [25];
//wire	\tc1.dm.douta [26];
//wire	\tc1.dm.douta [27];
//wire	\tc1.dm.douta [28];
//wire	\tc1.dm.douta [29];
//wire	\tc1.dm.douta [2];
//wire	\tc1.dm.douta [30];
//wire	\tc1.dm.douta [31];
//wire	\tc1.dm.douta [3];
//wire	\tc1.dm.douta [4];
//wire	\tc1.dm.douta [5];
//wire	\tc1.dm.douta [6];
//wire	\tc1.dm.douta [7];
//wire	\tc1.dm.douta [8];
//wire	\tc1.dm.douta [9];
wire	[31:0] \tc1.im.douta ;
//wire	\tc1.im.douta [0];
//wire	\tc1.im.douta [10];
//wire	\tc1.im.douta [11];
//wire	\tc1.im.douta [12];
//wire	\tc1.im.douta [13];
//wire	\tc1.im.douta [14];
//wire	\tc1.im.douta [15];
//wire	\tc1.im.douta [16];
//wire	\tc1.im.douta [17];
//wire	\tc1.im.douta [18];
//wire	\tc1.im.douta [19];
//wire	\tc1.im.douta [1];
//wire	\tc1.im.douta [20];
//wire	\tc1.im.douta [21];
//wire	\tc1.im.douta [22];
//wire	\tc1.im.douta [23];
//wire	\tc1.im.douta [24];
//wire	\tc1.im.douta [25];
//wire	\tc1.im.douta [26];
//wire	\tc1.im.douta [27];
//wire	\tc1.im.douta [28];
//wire	\tc1.im.douta [29];
//wire	\tc1.im.douta [2];
//wire	\tc1.im.douta [30];
//wire	\tc1.im.douta [31];
//wire	\tc1.im.douta [3];
//wire	\tc1.im.douta [4];
//wire	\tc1.im.douta [5];
//wire	\tc1.im.douta [6];
//wire	\tc1.im.douta [7];
//wire	\tc1.im.douta [8];
//wire	\tc1.im.douta [9];
wire	[31:0] \tc1.rfA.douta ;
//wire	\tc1.rfA.douta [0];
//wire	\tc1.rfA.douta [10];
//wire	\tc1.rfA.douta [11];
//wire	\tc1.rfA.douta [12];
//wire	\tc1.rfA.douta [13];
//wire	\tc1.rfA.douta [14];
//wire	\tc1.rfA.douta [15];
//wire	\tc1.rfA.douta [16];
//wire	\tc1.rfA.douta [17];
//wire	\tc1.rfA.douta [18];
//wire	\tc1.rfA.douta [19];
//wire	\tc1.rfA.douta [1];
//wire	\tc1.rfA.douta [20];
//wire	\tc1.rfA.douta [21];
//wire	\tc1.rfA.douta [22];
//wire	\tc1.rfA.douta [23];
//wire	\tc1.rfA.douta [24];
//wire	\tc1.rfA.douta [25];
//wire	\tc1.rfA.douta [26];
//wire	\tc1.rfA.douta [27];
//wire	\tc1.rfA.douta [28];
//wire	\tc1.rfA.douta [29];
//wire	\tc1.rfA.douta [2];
//wire	\tc1.rfA.douta [30];
//wire	\tc1.rfA.douta [31];
//wire	\tc1.rfA.douta [3];
//wire	\tc1.rfA.douta [4];
//wire	\tc1.rfA.douta [5];
//wire	\tc1.rfA.douta [6];
//wire	\tc1.rfA.douta [7];
//wire	\tc1.rfA.douta [8];
//wire	\tc1.rfA.douta [9];
wire	[31:0] \tc1.rfB.douta ;
//wire	\tc1.rfB.douta [0];
//wire	\tc1.rfB.douta [10];
//wire	\tc1.rfB.douta [11];
//wire	\tc1.rfB.douta [12];
//wire	\tc1.rfB.douta [13];
//wire	\tc1.rfB.douta [14];
//wire	\tc1.rfB.douta [15];
//wire	\tc1.rfB.douta [16];
//wire	\tc1.rfB.douta [17];
//wire	\tc1.rfB.douta [18];
//wire	\tc1.rfB.douta [19];
//wire	\tc1.rfB.douta [1];
//wire	\tc1.rfB.douta [20];
//wire	\tc1.rfB.douta [21];
//wire	\tc1.rfB.douta [22];
//wire	\tc1.rfB.douta [23];
//wire	\tc1.rfB.douta [24];
//wire	\tc1.rfB.douta [25];
//wire	\tc1.rfB.douta [26];
//wire	\tc1.rfB.douta [27];
//wire	\tc1.rfB.douta [28];
//wire	\tc1.rfB.douta [29];
//wire	\tc1.rfB.douta [2];
//wire	\tc1.rfB.douta [30];
//wire	\tc1.rfB.douta [31];
//wire	\tc1.rfB.douta [3];
//wire	\tc1.rfB.douta [4];
//wire	\tc1.rfB.douta [5];
//wire	\tc1.rfB.douta [6];
//wire	\tc1.rfB.douta [7];
//wire	\tc1.rfB.douta [8];
//wire	\tc1.rfB.douta [9];
wire	[31:0] \tc2.DM ;
//wire	\tc2.DM [0];
//wire	\tc2.DM [10];
//wire	\tc2.DM [11];
//wire	\tc2.DM [12];
//wire	\tc2.DM [13];
//wire	\tc2.DM [14];
//wire	\tc2.DM [15];
//wire	\tc2.DM [16];
//wire	\tc2.DM [17];
//wire	\tc2.DM [18];
//wire	\tc2.DM [19];
//wire	\tc2.DM [1];
//wire	\tc2.DM [20];
//wire	\tc2.DM [21];
//wire	\tc2.DM [22];
//wire	\tc2.DM [23];
//wire	\tc2.DM [24];
//wire	\tc2.DM [25];
//wire	\tc2.DM [26];
//wire	\tc2.DM [27];
//wire	\tc2.DM [28];
//wire	\tc2.DM [29];
//wire	\tc2.DM [2];
//wire	\tc2.DM [30];
//wire	\tc2.DM [31];
//wire	\tc2.DM [3];
//wire	\tc2.DM [4];
//wire	\tc2.DM [5];
//wire	\tc2.DM [6];
//wire	\tc2.DM [7];
//wire	\tc2.DM [8];
//wire	\tc2.DM [9];
wire	[31:0] \tc2.IM ;
//wire	\tc2.IM [0];
//wire	\tc2.IM [10];
//wire	\tc2.IM [11];
//wire	\tc2.IM [12];
//wire	\tc2.IM [13];
//wire	\tc2.IM [14];
//wire	\tc2.IM [15];
//wire	\tc2.IM [16];
//wire	\tc2.IM [17];
//wire	\tc2.IM [18];
//wire	\tc2.IM [19];
//wire	\tc2.IM [1];
//wire	\tc2.IM [20];
//wire	\tc2.IM [21];
//wire	\tc2.IM [22];
//wire	\tc2.IM [23];
//wire	\tc2.IM [24];
//wire	\tc2.IM [25];
//wire	\tc2.IM [26];
//wire	\tc2.IM [27];
//wire	\tc2.IM [28];
//wire	\tc2.IM [29];
//wire	\tc2.IM [2];
//wire	\tc2.IM [30];
//wire	\tc2.IM [31];
//wire	\tc2.IM [3];
//wire	\tc2.IM [4];
//wire	\tc2.IM [5];
//wire	\tc2.IM [6];
//wire	\tc2.IM [7];
//wire	\tc2.IM [8];
//wire	\tc2.IM [9];
wire	[6:0] \tc2.PC ;
//wire	\tc2.PC [0];
//wire	\tc2.PC [1];
//wire	\tc2.PC [2];
//wire	\tc2.PC [3];
//wire	\tc2.PC [4];
//wire	\tc2.PC [5];
//wire	\tc2.PC [6];
wire	[6:0] \tc2.PCmux ;
//wire	\tc2.PCmux [0];
//wire	\tc2.PCmux [1];
//wire	\tc2.PCmux [2];
//wire	\tc2.PCmux [3];
//wire	\tc2.PCmux [4];
//wire	\tc2.PCmux [5];
//wire	\tc2.PCmux [6];
wire	[31:0] \tc2.WD ;
//wire	\tc2.WD [0];
//wire	\tc2.WD [10];
//wire	\tc2.WD [11];
//wire	\tc2.WD [12];
//wire	\tc2.WD [13];
//wire	\tc2.WD [14];
//wire	\tc2.WD [15];
//wire	\tc2.WD [16];
//wire	\tc2.WD [17];
//wire	\tc2.WD [18];
//wire	\tc2.WD [19];
//wire	\tc2.WD [1];
//wire	\tc2.WD [20];
//wire	\tc2.WD [21];
//wire	\tc2.WD [22];
//wire	\tc2.WD [23];
//wire	\tc2.WD [24];
//wire	\tc2.WD [25];
//wire	\tc2.WD [26];
//wire	\tc2.WD [27];
//wire	\tc2.WD [28];
//wire	\tc2.WD [29];
//wire	\tc2.WD [2];
//wire	\tc2.WD [30];
//wire	\tc2.WD [31];
//wire	\tc2.WD [3];
//wire	\tc2.WD [4];
//wire	\tc2.WD [5];
//wire	\tc2.WD [6];
//wire	\tc2.WD [7];
//wire	\tc2.WD [8];
//wire	\tc2.WD [9];
wire	\tc2.WriteDM ;
wire	\tc2.WriteIM ;
wire	[31:0] \tc2.dm.douta ;
//wire	\tc2.dm.douta [0];
//wire	\tc2.dm.douta [10];
//wire	\tc2.dm.douta [11];
//wire	\tc2.dm.douta [12];
//wire	\tc2.dm.douta [13];
//wire	\tc2.dm.douta [14];
//wire	\tc2.dm.douta [15];
//wire	\tc2.dm.douta [16];
//wire	\tc2.dm.douta [17];
//wire	\tc2.dm.douta [18];
//wire	\tc2.dm.douta [19];
//wire	\tc2.dm.douta [1];
//wire	\tc2.dm.douta [20];
//wire	\tc2.dm.douta [21];
//wire	\tc2.dm.douta [22];
//wire	\tc2.dm.douta [23];
//wire	\tc2.dm.douta [24];
//wire	\tc2.dm.douta [25];
//wire	\tc2.dm.douta [26];
//wire	\tc2.dm.douta [27];
//wire	\tc2.dm.douta [28];
//wire	\tc2.dm.douta [29];
//wire	\tc2.dm.douta [2];
//wire	\tc2.dm.douta [30];
//wire	\tc2.dm.douta [31];
//wire	\tc2.dm.douta [3];
//wire	\tc2.dm.douta [4];
//wire	\tc2.dm.douta [5];
//wire	\tc2.dm.douta [6];
//wire	\tc2.dm.douta [7];
//wire	\tc2.dm.douta [8];
//wire	\tc2.dm.douta [9];
wire	[31:0] \tc2.im.douta ;
//wire	\tc2.im.douta [0];
//wire	\tc2.im.douta [10];
//wire	\tc2.im.douta [11];
//wire	\tc2.im.douta [12];
//wire	\tc2.im.douta [13];
//wire	\tc2.im.douta [14];
//wire	\tc2.im.douta [15];
//wire	\tc2.im.douta [16];
//wire	\tc2.im.douta [17];
//wire	\tc2.im.douta [18];
//wire	\tc2.im.douta [19];
//wire	\tc2.im.douta [1];
//wire	\tc2.im.douta [20];
//wire	\tc2.im.douta [21];
//wire	\tc2.im.douta [22];
//wire	\tc2.im.douta [23];
//wire	\tc2.im.douta [24];
//wire	\tc2.im.douta [25];
//wire	\tc2.im.douta [26];
//wire	\tc2.im.douta [27];
//wire	\tc2.im.douta [28];
//wire	\tc2.im.douta [29];
//wire	\tc2.im.douta [2];
//wire	\tc2.im.douta [30];
//wire	\tc2.im.douta [31];
//wire	\tc2.im.douta [3];
//wire	\tc2.im.douta [4];
//wire	\tc2.im.douta [5];
//wire	\tc2.im.douta [6];
//wire	\tc2.im.douta [7];
//wire	\tc2.im.douta [8];
//wire	\tc2.im.douta [9];
wire	[31:0] \tc2.rfA.douta ;
//wire	\tc2.rfA.douta [0];
//wire	\tc2.rfA.douta [10];
//wire	\tc2.rfA.douta [11];
//wire	\tc2.rfA.douta [12];
//wire	\tc2.rfA.douta [13];
//wire	\tc2.rfA.douta [14];
//wire	\tc2.rfA.douta [15];
//wire	\tc2.rfA.douta [16];
//wire	\tc2.rfA.douta [17];
//wire	\tc2.rfA.douta [18];
//wire	\tc2.rfA.douta [19];
//wire	\tc2.rfA.douta [1];
//wire	\tc2.rfA.douta [20];
//wire	\tc2.rfA.douta [21];
//wire	\tc2.rfA.douta [22];
//wire	\tc2.rfA.douta [23];
//wire	\tc2.rfA.douta [24];
//wire	\tc2.rfA.douta [25];
//wire	\tc2.rfA.douta [26];
//wire	\tc2.rfA.douta [27];
//wire	\tc2.rfA.douta [28];
//wire	\tc2.rfA.douta [29];
//wire	\tc2.rfA.douta [2];
//wire	\tc2.rfA.douta [30];
//wire	\tc2.rfA.douta [31];
//wire	\tc2.rfA.douta [3];
//wire	\tc2.rfA.douta [4];
//wire	\tc2.rfA.douta [5];
//wire	\tc2.rfA.douta [6];
//wire	\tc2.rfA.douta [7];
//wire	\tc2.rfA.douta [8];
//wire	\tc2.rfA.douta [9];
wire	[31:0] \tc2.rfB.douta ;
//wire	\tc2.rfB.douta [0];
//wire	\tc2.rfB.douta [10];
//wire	\tc2.rfB.douta [11];
//wire	\tc2.rfB.douta [12];
//wire	\tc2.rfB.douta [13];
//wire	\tc2.rfB.douta [14];
//wire	\tc2.rfB.douta [15];
//wire	\tc2.rfB.douta [16];
//wire	\tc2.rfB.douta [17];
//wire	\tc2.rfB.douta [18];
//wire	\tc2.rfB.douta [19];
//wire	\tc2.rfB.douta [1];
//wire	\tc2.rfB.douta [20];
//wire	\tc2.rfB.douta [21];
//wire	\tc2.rfB.douta [22];
//wire	\tc2.rfB.douta [23];
//wire	\tc2.rfB.douta [24];
//wire	\tc2.rfB.douta [25];
//wire	\tc2.rfB.douta [26];
//wire	\tc2.rfB.douta [27];
//wire	\tc2.rfB.douta [28];
//wire	\tc2.rfB.douta [29];
//wire	\tc2.rfB.douta [2];
//wire	\tc2.rfB.douta [30];
//wire	\tc2.rfB.douta [31];
//wire	\tc2.rfB.douta [3];
//wire	\tc2.rfB.douta [4];
//wire	\tc2.rfB.douta [5];
//wire	\tc2.rfB.douta [6];
//wire	\tc2.rfB.douta [7];
//wire	\tc2.rfB.douta [8];
//wire	\tc2.rfB.douta [9];
wire	[31:0] \tc3.DM ;
//wire	\tc3.DM [0];
//wire	\tc3.DM [10];
//wire	\tc3.DM [11];
//wire	\tc3.DM [12];
//wire	\tc3.DM [13];
//wire	\tc3.DM [14];
//wire	\tc3.DM [15];
//wire	\tc3.DM [16];
//wire	\tc3.DM [17];
//wire	\tc3.DM [18];
//wire	\tc3.DM [19];
//wire	\tc3.DM [1];
//wire	\tc3.DM [20];
//wire	\tc3.DM [21];
//wire	\tc3.DM [22];
//wire	\tc3.DM [23];
//wire	\tc3.DM [24];
//wire	\tc3.DM [25];
//wire	\tc3.DM [26];
//wire	\tc3.DM [27];
//wire	\tc3.DM [28];
//wire	\tc3.DM [29];
//wire	\tc3.DM [2];
//wire	\tc3.DM [30];
//wire	\tc3.DM [31];
//wire	\tc3.DM [3];
//wire	\tc3.DM [4];
//wire	\tc3.DM [5];
//wire	\tc3.DM [6];
//wire	\tc3.DM [7];
//wire	\tc3.DM [8];
//wire	\tc3.DM [9];
wire	[31:0] \tc3.IM ;
//wire	\tc3.IM [0];
//wire	\tc3.IM [10];
//wire	\tc3.IM [11];
//wire	\tc3.IM [12];
//wire	\tc3.IM [13];
//wire	\tc3.IM [14];
//wire	\tc3.IM [15];
//wire	\tc3.IM [16];
//wire	\tc3.IM [17];
//wire	\tc3.IM [18];
//wire	\tc3.IM [19];
//wire	\tc3.IM [1];
//wire	\tc3.IM [20];
//wire	\tc3.IM [21];
//wire	\tc3.IM [22];
//wire	\tc3.IM [23];
//wire	\tc3.IM [24];
//wire	\tc3.IM [25];
//wire	\tc3.IM [26];
//wire	\tc3.IM [27];
//wire	\tc3.IM [28];
//wire	\tc3.IM [29];
//wire	\tc3.IM [2];
//wire	\tc3.IM [30];
//wire	\tc3.IM [31];
//wire	\tc3.IM [3];
//wire	\tc3.IM [4];
//wire	\tc3.IM [5];
//wire	\tc3.IM [6];
//wire	\tc3.IM [7];
//wire	\tc3.IM [8];
//wire	\tc3.IM [9];
wire	[6:0] \tc3.PC ;
//wire	\tc3.PC [0];
//wire	\tc3.PC [1];
//wire	\tc3.PC [2];
//wire	\tc3.PC [3];
//wire	\tc3.PC [4];
//wire	\tc3.PC [5];
//wire	\tc3.PC [6];
wire	[6:0] \tc3.PCmux ;
//wire	\tc3.PCmux [0];
//wire	\tc3.PCmux [1];
//wire	\tc3.PCmux [2];
//wire	\tc3.PCmux [3];
//wire	\tc3.PCmux [4];
//wire	\tc3.PCmux [5];
//wire	\tc3.PCmux [6];
wire	[31:0] \tc3.WD ;
//wire	\tc3.WD [0];
//wire	\tc3.WD [10];
//wire	\tc3.WD [11];
//wire	\tc3.WD [12];
//wire	\tc3.WD [13];
//wire	\tc3.WD [14];
//wire	\tc3.WD [15];
//wire	\tc3.WD [16];
//wire	\tc3.WD [17];
//wire	\tc3.WD [18];
//wire	\tc3.WD [19];
//wire	\tc3.WD [1];
//wire	\tc3.WD [20];
//wire	\tc3.WD [21];
//wire	\tc3.WD [22];
//wire	\tc3.WD [23];
//wire	\tc3.WD [24];
//wire	\tc3.WD [25];
//wire	\tc3.WD [26];
//wire	\tc3.WD [27];
//wire	\tc3.WD [28];
//wire	\tc3.WD [29];
//wire	\tc3.WD [2];
//wire	\tc3.WD [30];
//wire	\tc3.WD [31];
//wire	\tc3.WD [3];
//wire	\tc3.WD [4];
//wire	\tc3.WD [5];
//wire	\tc3.WD [6];
//wire	\tc3.WD [7];
//wire	\tc3.WD [8];
//wire	\tc3.WD [9];
wire	\tc3.WriteDM ;
wire	\tc3.WriteIM ;
wire	[31:0] \tc3.dm.douta ;
//wire	\tc3.dm.douta [0];
//wire	\tc3.dm.douta [10];
//wire	\tc3.dm.douta [11];
//wire	\tc3.dm.douta [12];
//wire	\tc3.dm.douta [13];
//wire	\tc3.dm.douta [14];
//wire	\tc3.dm.douta [15];
//wire	\tc3.dm.douta [16];
//wire	\tc3.dm.douta [17];
//wire	\tc3.dm.douta [18];
//wire	\tc3.dm.douta [19];
//wire	\tc3.dm.douta [1];
//wire	\tc3.dm.douta [20];
//wire	\tc3.dm.douta [21];
//wire	\tc3.dm.douta [22];
//wire	\tc3.dm.douta [23];
//wire	\tc3.dm.douta [24];
//wire	\tc3.dm.douta [25];
//wire	\tc3.dm.douta [26];
//wire	\tc3.dm.douta [27];
//wire	\tc3.dm.douta [28];
//wire	\tc3.dm.douta [29];
//wire	\tc3.dm.douta [2];
//wire	\tc3.dm.douta [30];
//wire	\tc3.dm.douta [31];
//wire	\tc3.dm.douta [3];
//wire	\tc3.dm.douta [4];
//wire	\tc3.dm.douta [5];
//wire	\tc3.dm.douta [6];
//wire	\tc3.dm.douta [7];
//wire	\tc3.dm.douta [8];
//wire	\tc3.dm.douta [9];
wire	[31:0] \tc3.im.douta ;
//wire	\tc3.im.douta [0];
//wire	\tc3.im.douta [10];
//wire	\tc3.im.douta [11];
//wire	\tc3.im.douta [12];
//wire	\tc3.im.douta [13];
//wire	\tc3.im.douta [14];
//wire	\tc3.im.douta [15];
//wire	\tc3.im.douta [16];
//wire	\tc3.im.douta [17];
//wire	\tc3.im.douta [18];
//wire	\tc3.im.douta [19];
//wire	\tc3.im.douta [1];
//wire	\tc3.im.douta [20];
//wire	\tc3.im.douta [21];
//wire	\tc3.im.douta [22];
//wire	\tc3.im.douta [23];
//wire	\tc3.im.douta [24];
//wire	\tc3.im.douta [25];
//wire	\tc3.im.douta [26];
//wire	\tc3.im.douta [27];
//wire	\tc3.im.douta [28];
//wire	\tc3.im.douta [29];
//wire	\tc3.im.douta [2];
//wire	\tc3.im.douta [30];
//wire	\tc3.im.douta [31];
//wire	\tc3.im.douta [3];
//wire	\tc3.im.douta [4];
//wire	\tc3.im.douta [5];
//wire	\tc3.im.douta [6];
//wire	\tc3.im.douta [7];
//wire	\tc3.im.douta [8];
//wire	\tc3.im.douta [9];
wire	[31:0] \tc3.rfA.douta ;
//wire	\tc3.rfA.douta [0];
//wire	\tc3.rfA.douta [10];
//wire	\tc3.rfA.douta [11];
//wire	\tc3.rfA.douta [12];
//wire	\tc3.rfA.douta [13];
//wire	\tc3.rfA.douta [14];
//wire	\tc3.rfA.douta [15];
//wire	\tc3.rfA.douta [16];
//wire	\tc3.rfA.douta [17];
//wire	\tc3.rfA.douta [18];
//wire	\tc3.rfA.douta [19];
//wire	\tc3.rfA.douta [1];
//wire	\tc3.rfA.douta [20];
//wire	\tc3.rfA.douta [21];
//wire	\tc3.rfA.douta [22];
//wire	\tc3.rfA.douta [23];
//wire	\tc3.rfA.douta [24];
//wire	\tc3.rfA.douta [25];
//wire	\tc3.rfA.douta [26];
//wire	\tc3.rfA.douta [27];
//wire	\tc3.rfA.douta [28];
//wire	\tc3.rfA.douta [29];
//wire	\tc3.rfA.douta [2];
//wire	\tc3.rfA.douta [30];
//wire	\tc3.rfA.douta [31];
//wire	\tc3.rfA.douta [3];
//wire	\tc3.rfA.douta [4];
//wire	\tc3.rfA.douta [5];
//wire	\tc3.rfA.douta [6];
//wire	\tc3.rfA.douta [7];
//wire	\tc3.rfA.douta [8];
//wire	\tc3.rfA.douta [9];
wire	[31:0] \tc3.rfB.douta ;
//wire	\tc3.rfB.douta [0];
//wire	\tc3.rfB.douta [10];
//wire	\tc3.rfB.douta [11];
//wire	\tc3.rfB.douta [12];
//wire	\tc3.rfB.douta [13];
//wire	\tc3.rfB.douta [14];
//wire	\tc3.rfB.douta [15];
//wire	\tc3.rfB.douta [16];
//wire	\tc3.rfB.douta [17];
//wire	\tc3.rfB.douta [18];
//wire	\tc3.rfB.douta [19];
//wire	\tc3.rfB.douta [1];
//wire	\tc3.rfB.douta [20];
//wire	\tc3.rfB.douta [21];
//wire	\tc3.rfB.douta [22];
//wire	\tc3.rfB.douta [23];
//wire	\tc3.rfB.douta [24];
//wire	\tc3.rfB.douta [25];
//wire	\tc3.rfB.douta [26];
//wire	\tc3.rfB.douta [27];
//wire	\tc3.rfB.douta [28];
//wire	\tc3.rfB.douta [29];
//wire	\tc3.rfB.douta [2];
//wire	\tc3.rfB.douta [30];
//wire	\tc3.rfB.douta [31];
//wire	\tc3.rfB.douta [3];
//wire	\tc3.rfB.douta [4];
//wire	\tc3.rfB.douta [5];
//wire	\tc3.rfB.douta [6];
//wire	\tc3.rfB.douta [7];
//wire	\tc3.rfB.douta [8];
//wire	\tc3.rfB.douta [9];

assign vcc = 1'b1;
assign gnd = 1'b0;

alta_asyncctrl asyncreset_ctrl_X1000_Y1002_N0(
	.Din(),
	.Dout(AsyncReset_X1000_Y1002_GND));
defparam asyncreset_ctrl_X1000_Y1002_N0.coord_x = 12;
defparam asyncreset_ctrl_X1000_Y1002_N0.coord_y = 8;
defparam asyncreset_ctrl_X1000_Y1002_N0.coord_z = 0;
defparam asyncreset_ctrl_X1000_Y1002_N0.AsyncCtrlMux = 2'b00;

alta_asyncctrl asyncreset_ctrl_X1001_Y1002_N0(
	.Din(),
	.Dout(AsyncReset_X1001_Y1002_GND));
defparam asyncreset_ctrl_X1001_Y1002_N0.coord_x = 12;
defparam asyncreset_ctrl_X1001_Y1002_N0.coord_y = 7;
defparam asyncreset_ctrl_X1001_Y1002_N0.coord_z = 0;
defparam asyncreset_ctrl_X1001_Y1002_N0.AsyncCtrlMux = 2'b00;

alta_asyncctrl asyncreset_ctrl_X1002_Y1002_N0(
	.Din(),
	.Dout(AsyncReset_X1002_Y1002_GND));
defparam asyncreset_ctrl_X1002_Y1002_N0.coord_x = 12;
defparam asyncreset_ctrl_X1002_Y1002_N0.coord_y = 3;
defparam asyncreset_ctrl_X1002_Y1002_N0.coord_z = 0;
defparam asyncreset_ctrl_X1002_Y1002_N0.AsyncCtrlMux = 2'b00;

alta_asyncctrl asyncreset_ctrl_X1004_Y1002_N0(
	.Din(),
	.Dout(AsyncReset_X1004_Y1002_GND));
defparam asyncreset_ctrl_X1004_Y1002_N0.coord_x = 11;
defparam asyncreset_ctrl_X1004_Y1002_N0.coord_y = 3;
defparam asyncreset_ctrl_X1004_Y1002_N0.coord_z = 0;
defparam asyncreset_ctrl_X1004_Y1002_N0.AsyncCtrlMux = 2'b00;

alta_asyncctrl asyncreset_ctrl_X1005_Y1002_N0(
	.Din(),
	.Dout(AsyncReset_X1005_Y1002_GND));
defparam asyncreset_ctrl_X1005_Y1002_N0.coord_x = 1;
defparam asyncreset_ctrl_X1005_Y1002_N0.coord_y = 8;
defparam asyncreset_ctrl_X1005_Y1002_N0.coord_z = 0;
defparam asyncreset_ctrl_X1005_Y1002_N0.AsyncCtrlMux = 2'b00;

alta_asyncctrl asyncreset_ctrl_X1006_Y1002_N0(
	.Din(),
	.Dout(AsyncReset_X1006_Y1002_GND));
defparam asyncreset_ctrl_X1006_Y1002_N0.coord_x = 0;
defparam asyncreset_ctrl_X1006_Y1002_N0.coord_y = 8;
defparam asyncreset_ctrl_X1006_Y1002_N0.coord_z = 0;
defparam asyncreset_ctrl_X1006_Y1002_N0.AsyncCtrlMux = 2'b00;

alta_asyncctrl asyncreset_ctrl_X1008_Y1002_N0(
	.Din(),
	.Dout(AsyncReset_X1008_Y1002_GND));
defparam asyncreset_ctrl_X1008_Y1002_N0.coord_x = 1;
defparam asyncreset_ctrl_X1008_Y1002_N0.coord_y = 7;
defparam asyncreset_ctrl_X1008_Y1002_N0.coord_z = 0;
defparam asyncreset_ctrl_X1008_Y1002_N0.AsyncCtrlMux = 2'b00;

alta_asyncctrl asyncreset_ctrl_X1009_Y1001_N0(
	.Din(),
	.Dout(AsyncReset_X1009_Y1001_GND));
defparam asyncreset_ctrl_X1009_Y1001_N0.coord_x = 4;
defparam asyncreset_ctrl_X1009_Y1001_N0.coord_y = 6;
defparam asyncreset_ctrl_X1009_Y1001_N0.coord_z = 0;
defparam asyncreset_ctrl_X1009_Y1001_N0.AsyncCtrlMux = 2'b00;

alta_asyncctrl asyncreset_ctrl_X1011_Y1001_N0(
	.Din(),
	.Dout(AsyncReset_X1011_Y1001_GND));
defparam asyncreset_ctrl_X1011_Y1001_N0.coord_x = 9;
defparam asyncreset_ctrl_X1011_Y1001_N0.coord_y = 1;
defparam asyncreset_ctrl_X1011_Y1001_N0.coord_z = 0;
defparam asyncreset_ctrl_X1011_Y1001_N0.AsyncCtrlMux = 2'b00;

alta_asyncctrl asyncreset_ctrl_X1012_Y1001_N0(
	.Din(),
	.Dout(AsyncReset_X1012_Y1001_GND));
defparam asyncreset_ctrl_X1012_Y1001_N0.coord_x = 9;
defparam asyncreset_ctrl_X1012_Y1001_N0.coord_y = 5;
defparam asyncreset_ctrl_X1012_Y1001_N0.coord_z = 0;
defparam asyncreset_ctrl_X1012_Y1001_N0.AsyncCtrlMux = 2'b00;

alta_clkenctrl clken_ctrl_X1000_Y1002_N0(
	.ClkIn(syn__1103_),
	.ClkEn(),
	.ClkOut(syn__1103__X1000_Y1002_SIG_VCC));
defparam clken_ctrl_X1000_Y1002_N0.coord_x = 12;
defparam clken_ctrl_X1000_Y1002_N0.coord_y = 8;
defparam clken_ctrl_X1000_Y1002_N0.coord_z = 0;
defparam clken_ctrl_X1000_Y1002_N0.ClkMux = 2'b10;
defparam clken_ctrl_X1000_Y1002_N0.ClkEnMux = 2'b01;

alta_clkenctrl clken_ctrl_X1001_Y1002_N0(
	.ClkIn(syn__1103_),
	.ClkEn(),
	.ClkOut(syn__1103__X1001_Y1002_SIG_VCC));
defparam clken_ctrl_X1001_Y1002_N0.coord_x = 12;
defparam clken_ctrl_X1001_Y1002_N0.coord_y = 7;
defparam clken_ctrl_X1001_Y1002_N0.coord_z = 0;
defparam clken_ctrl_X1001_Y1002_N0.ClkMux = 2'b10;
defparam clken_ctrl_X1001_Y1002_N0.ClkEnMux = 2'b01;

alta_clkenctrl clken_ctrl_X1002_Y1002_N0(
	.ClkIn(syn__1103_),
	.ClkEn(),
	.ClkOut(syn__1103__X1002_Y1002_SIG_VCC));
defparam clken_ctrl_X1002_Y1002_N0.coord_x = 12;
defparam clken_ctrl_X1002_Y1002_N0.coord_y = 3;
defparam clken_ctrl_X1002_Y1002_N0.coord_z = 0;
defparam clken_ctrl_X1002_Y1002_N0.ClkMux = 2'b10;
defparam clken_ctrl_X1002_Y1002_N0.ClkEnMux = 2'b01;

alta_clkenctrl clken_ctrl_X1004_Y1002_N0(
	.ClkIn(syn__1103_),
	.ClkEn(),
	.ClkOut(syn__1103__X1004_Y1002_SIG_VCC));
defparam clken_ctrl_X1004_Y1002_N0.coord_x = 11;
defparam clken_ctrl_X1004_Y1002_N0.coord_y = 3;
defparam clken_ctrl_X1004_Y1002_N0.coord_z = 0;
defparam clken_ctrl_X1004_Y1002_N0.ClkMux = 2'b10;
defparam clken_ctrl_X1004_Y1002_N0.ClkEnMux = 2'b01;

alta_clkenctrl clken_ctrl_X1005_Y1002_N0(
	.ClkIn(syn__1103_),
	.ClkEn(),
	.ClkOut(syn__1103__X1005_Y1002_SIG_VCC));
defparam clken_ctrl_X1005_Y1002_N0.coord_x = 1;
defparam clken_ctrl_X1005_Y1002_N0.coord_y = 8;
defparam clken_ctrl_X1005_Y1002_N0.coord_z = 0;
defparam clken_ctrl_X1005_Y1002_N0.ClkMux = 2'b10;
defparam clken_ctrl_X1005_Y1002_N0.ClkEnMux = 2'b01;

alta_clkenctrl clken_ctrl_X1006_Y1002_N0(
	.ClkIn(syn__1103_),
	.ClkEn(),
	.ClkOut(syn__1103__X1006_Y1002_SIG_VCC));
defparam clken_ctrl_X1006_Y1002_N0.coord_x = 0;
defparam clken_ctrl_X1006_Y1002_N0.coord_y = 8;
defparam clken_ctrl_X1006_Y1002_N0.coord_z = 0;
defparam clken_ctrl_X1006_Y1002_N0.ClkMux = 2'b10;
defparam clken_ctrl_X1006_Y1002_N0.ClkEnMux = 2'b01;

alta_clkenctrl clken_ctrl_X1008_Y1002_N0(
	.ClkIn(syn__1103_),
	.ClkEn(),
	.ClkOut(syn__1103__X1008_Y1002_SIG_VCC));
defparam clken_ctrl_X1008_Y1002_N0.coord_x = 1;
defparam clken_ctrl_X1008_Y1002_N0.coord_y = 7;
defparam clken_ctrl_X1008_Y1002_N0.coord_z = 0;
defparam clken_ctrl_X1008_Y1002_N0.ClkMux = 2'b10;
defparam clken_ctrl_X1008_Y1002_N0.ClkEnMux = 2'b01;

alta_clkenctrl clken_ctrl_X1009_Y1001_N0(
	.ClkIn(syn__1103_),
	.ClkEn(),
	.ClkOut(syn__1103__X1009_Y1001_SIG_VCC));
defparam clken_ctrl_X1009_Y1001_N0.coord_x = 4;
defparam clken_ctrl_X1009_Y1001_N0.coord_y = 6;
defparam clken_ctrl_X1009_Y1001_N0.coord_z = 0;
defparam clken_ctrl_X1009_Y1001_N0.ClkMux = 2'b10;
defparam clken_ctrl_X1009_Y1001_N0.ClkEnMux = 2'b01;

alta_clkenctrl clken_ctrl_X1011_Y1001_N0(
	.ClkIn(syn__1103_),
	.ClkEn(),
	.ClkOut(syn__1103__X1011_Y1001_SIG_VCC));
defparam clken_ctrl_X1011_Y1001_N0.coord_x = 9;
defparam clken_ctrl_X1011_Y1001_N0.coord_y = 1;
defparam clken_ctrl_X1011_Y1001_N0.coord_z = 0;
defparam clken_ctrl_X1011_Y1001_N0.ClkMux = 2'b10;
defparam clken_ctrl_X1011_Y1001_N0.ClkEnMux = 2'b01;

alta_clkenctrl clken_ctrl_X1012_Y1001_N0(
	.ClkIn(syn__1103_),
	.ClkEn(),
	.ClkOut(syn__1103__X1012_Y1001_SIG_VCC));
defparam clken_ctrl_X1012_Y1001_N0.coord_x = 9;
defparam clken_ctrl_X1012_Y1001_N0.coord_y = 5;
defparam clken_ctrl_X1012_Y1001_N0.coord_z = 0;
defparam clken_ctrl_X1012_Y1001_N0.ClkMux = 2'b10;
defparam clken_ctrl_X1012_Y1001_N0.ClkEnMux = 2'b01;

alta_slice syn__1105_(
	.A(syn__0786_),
	.B(syn__0782_),
	.C(syn__0793_),
	.D(syn__0788_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0781_),
	.Cout(),
	.Q());
defparam syn__1105_.coord_x = 4;
defparam syn__1105_.coord_y = 6;
defparam syn__1105_.coord_z = 8;
defparam syn__1105_.mask = 16'h8000;
defparam syn__1105_.modeMux = 1'b0;
defparam syn__1105_.FeedbackMux = 1'b0;
defparam syn__1105_.ShiftMux = 1'b0;
defparam syn__1105_.BypassEn = 1'b0;
defparam syn__1105_.CarryEnb = 1'b1;

alta_slice syn__1106_(
	.A(syn__0785_),
	.B(vcc),
	.C(syn__0783_),
	.D(syn__0784_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0782_),
	.Cout(),
	.Q());
defparam syn__1106_.coord_x = 4;
defparam syn__1106_.coord_y = 6;
defparam syn__1106_.coord_z = 9;
defparam syn__1106_.mask = 16'hA000;
defparam syn__1106_.modeMux = 1'b0;
defparam syn__1106_.FeedbackMux = 1'b0;
defparam syn__1106_.ShiftMux = 1'b0;
defparam syn__1106_.BypassEn = 1'b0;
defparam syn__1106_.CarryEnb = 1'b1;

alta_slice syn__1107_(
	.A(IOaddr3[7]),
	.B(IOaddr3[9]),
	.C(IOaddr3[6]),
	.D(IOaddr3[8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0783_),
	.Cout(),
	.Q());
defparam syn__1107_.coord_x = 4;
defparam syn__1107_.coord_y = 5;
defparam syn__1107_.coord_z = 6;
defparam syn__1107_.mask = 16'h8000;
defparam syn__1107_.modeMux = 1'b0;
defparam syn__1107_.FeedbackMux = 1'b0;
defparam syn__1107_.ShiftMux = 1'b0;
defparam syn__1107_.BypassEn = 1'b0;
defparam syn__1107_.CarryEnb = 1'b1;

alta_slice syn__1108_(
	.A(IOaddr3[3]),
	.B(IOaddr3[4]),
	.C(IOaddr3[2]),
	.D(IOaddr3[5]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0784_),
	.Cout(),
	.Q());
defparam syn__1108_.coord_x = 4;
defparam syn__1108_.coord_y = 4;
defparam syn__1108_.coord_z = 15;
defparam syn__1108_.mask = 16'h8000;
defparam syn__1108_.modeMux = 1'b0;
defparam syn__1108_.FeedbackMux = 1'b0;
defparam syn__1108_.ShiftMux = 1'b0;
defparam syn__1108_.BypassEn = 1'b0;
defparam syn__1108_.CarryEnb = 1'b1;

alta_slice syn__1109_(
	.A(\tc3.IM [0]),
	.B(\tc3.IM [1]),
	.C(IOaddr3[1]),
	.D(IOaddr3[0]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0785_),
	.Cout(),
	.Q());
defparam syn__1109_.coord_x = 4;
defparam syn__1109_.coord_y = 6;
defparam syn__1109_.coord_z = 2;
defparam syn__1109_.mask = 16'h8000;
defparam syn__1109_.modeMux = 1'b0;
defparam syn__1109_.FeedbackMux = 1'b0;
defparam syn__1109_.ShiftMux = 1'b0;
defparam syn__1109_.BypassEn = 1'b0;
defparam syn__1109_.CarryEnb = 1'b1;

alta_slice syn__1110_(
	.A(IOaddr3[10]),
	.B(syn__0787_),
	.C(IOaddr3[11]),
	.D(vcc),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0786_),
	.Cout(),
	.Q());
defparam syn__1110_.coord_x = 4;
defparam syn__1110_.coord_y = 3;
defparam syn__1110_.coord_z = 7;
defparam syn__1110_.mask = 16'h0404;
defparam syn__1110_.modeMux = 1'b0;
defparam syn__1110_.FeedbackMux = 1'b0;
defparam syn__1110_.ShiftMux = 1'b0;
defparam syn__1110_.BypassEn = 1'b0;
defparam syn__1110_.CarryEnb = 1'b1;

alta_slice syn__1111_(
	.A(vcc),
	.B(\tc3.IM [24]),
	.C(vcc),
	.D(\tc3.IM [2]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0787_),
	.Cout(),
	.Q());
defparam syn__1111_.coord_x = 2;
defparam syn__1111_.coord_y = 7;
defparam syn__1111_.coord_z = 1;
defparam syn__1111_.mask = 16'h0033;
defparam syn__1111_.modeMux = 1'b0;
defparam syn__1111_.FeedbackMux = 1'b0;
defparam syn__1111_.ShiftMux = 1'b0;
defparam syn__1111_.BypassEn = 1'b0;
defparam syn__1111_.CarryEnb = 1'b1;

alta_slice syn__1112_(
	.A(syn__0790_),
	.B(syn__0792_),
	.C(syn__0789_),
	.D(syn__0791_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0788_),
	.Cout(),
	.Q());
defparam syn__1112_.coord_x = 1;
defparam syn__1112_.coord_y = 7;
defparam syn__1112_.coord_z = 6;
defparam syn__1112_.mask = 16'h8000;
defparam syn__1112_.modeMux = 1'b0;
defparam syn__1112_.FeedbackMux = 1'b0;
defparam syn__1112_.ShiftMux = 1'b0;
defparam syn__1112_.BypassEn = 1'b0;
defparam syn__1112_.CarryEnb = 1'b1;

alta_slice syn__1113_(
	.A(IOaddr3[28]),
	.B(IOaddr3[29]),
	.C(IOaddr3[30]),
	.D(IOaddr3[31]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0789_),
	.Cout(),
	.Q());
defparam syn__1113_.coord_x = 0;
defparam syn__1113_.coord_y = 6;
defparam syn__1113_.coord_z = 3;
defparam syn__1113_.mask = 16'h0001;
defparam syn__1113_.modeMux = 1'b0;
defparam syn__1113_.FeedbackMux = 1'b0;
defparam syn__1113_.ShiftMux = 1'b0;
defparam syn__1113_.BypassEn = 1'b0;
defparam syn__1113_.CarryEnb = 1'b1;

alta_slice syn__1114_(
	.A(IOaddr3[24]),
	.B(IOaddr3[25]),
	.C(IOaddr3[26]),
	.D(IOaddr3[27]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0790_),
	.Cout(),
	.Q());
defparam syn__1114_.coord_x = 1;
defparam syn__1114_.coord_y = 7;
defparam syn__1114_.coord_z = 10;
defparam syn__1114_.mask = 16'h0001;
defparam syn__1114_.modeMux = 1'b0;
defparam syn__1114_.FeedbackMux = 1'b0;
defparam syn__1114_.ShiftMux = 1'b0;
defparam syn__1114_.BypassEn = 1'b0;
defparam syn__1114_.CarryEnb = 1'b1;

alta_slice syn__1115_(
	.A(IOaddr3[19]),
	.B(IOaddr3[18]),
	.C(IOaddr3[17]),
	.D(IOaddr3[16]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0791_),
	.Cout(),
	.Q());
defparam syn__1115_.coord_x = 1;
defparam syn__1115_.coord_y = 2;
defparam syn__1115_.coord_z = 2;
defparam syn__1115_.mask = 16'h0001;
defparam syn__1115_.modeMux = 1'b0;
defparam syn__1115_.FeedbackMux = 1'b0;
defparam syn__1115_.ShiftMux = 1'b0;
defparam syn__1115_.BypassEn = 1'b0;
defparam syn__1115_.CarryEnb = 1'b1;

alta_slice syn__1116_(
	.A(IOaddr3[20]),
	.B(IOaddr3[21]),
	.C(IOaddr3[22]),
	.D(IOaddr3[23]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0792_),
	.Cout(),
	.Q());
defparam syn__1116_.coord_x = 1;
defparam syn__1116_.coord_y = 7;
defparam syn__1116_.coord_z = 11;
defparam syn__1116_.mask = 16'h0001;
defparam syn__1116_.modeMux = 1'b0;
defparam syn__1116_.FeedbackMux = 1'b0;
defparam syn__1116_.ShiftMux = 1'b0;
defparam syn__1116_.BypassEn = 1'b0;
defparam syn__1116_.CarryEnb = 1'b1;

alta_slice syn__1117_(
	.A(IOaddr3[14]),
	.B(IOaddr3[15]),
	.C(IOaddr3[12]),
	.D(IOaddr3[13]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0793_),
	.Cout(),
	.Q());
defparam syn__1117_.coord_x = 2;
defparam syn__1117_.coord_y = 2;
defparam syn__1117_.coord_z = 1;
defparam syn__1117_.mask = 16'h0001;
defparam syn__1117_.modeMux = 1'b0;
defparam syn__1117_.FeedbackMux = 1'b0;
defparam syn__1117_.ShiftMux = 1'b0;
defparam syn__1117_.BypassEn = 1'b0;
defparam syn__1117_.CarryEnb = 1'b1;

alta_slice syn__1126_(
	.A(syn__0805_),
	.B(syn__0804_),
	.C(syn__0806_),
	.D(syn__0795_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0794_),
	.Cout(),
	.Q());
defparam syn__1126_.coord_x = 9;
defparam syn__1126_.coord_y = 1;
defparam syn__1126_.coord_z = 8;
defparam syn__1126_.mask = 16'h8000;
defparam syn__1126_.modeMux = 1'b0;
defparam syn__1126_.FeedbackMux = 1'b0;
defparam syn__1126_.ShiftMux = 1'b0;
defparam syn__1126_.BypassEn = 1'b0;
defparam syn__1126_.CarryEnb = 1'b1;

alta_slice syn__1127_(
	.A(syn__0803_),
	.B(syn__0802_),
	.C(syn__0796_),
	.D(syn__0799_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0795_),
	.Cout(),
	.Q());
defparam syn__1127_.coord_x = 8;
defparam syn__1127_.coord_y = 2;
defparam syn__1127_.coord_z = 7;
defparam syn__1127_.mask = 16'h8000;
defparam syn__1127_.modeMux = 1'b0;
defparam syn__1127_.FeedbackMux = 1'b0;
defparam syn__1127_.ShiftMux = 1'b0;
defparam syn__1127_.BypassEn = 1'b0;
defparam syn__1127_.CarryEnb = 1'b1;

alta_slice syn__1128_(
	.A(syn__0797_),
	.B(IOaddr2[10]),
	.C(IOaddr2[11]),
	.D(syn__0798_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0796_),
	.Cout(),
	.Q());
defparam syn__1128_.coord_x = 11;
defparam syn__1128_.coord_y = 5;
defparam syn__1128_.coord_z = 3;
defparam syn__1128_.mask = 16'h0200;
defparam syn__1128_.modeMux = 1'b0;
defparam syn__1128_.FeedbackMux = 1'b0;
defparam syn__1128_.ShiftMux = 1'b0;
defparam syn__1128_.BypassEn = 1'b0;
defparam syn__1128_.CarryEnb = 1'b1;

alta_slice syn__1129_(
	.A(IOaddr2[15]),
	.B(IOaddr2[13]),
	.C(IOaddr2[12]),
	.D(IOaddr2[14]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0797_),
	.Cout(),
	.Q());
defparam syn__1129_.coord_x = 12;
defparam syn__1129_.coord_y = 2;
defparam syn__1129_.coord_z = 9;
defparam syn__1129_.mask = 16'h0001;
defparam syn__1129_.modeMux = 1'b0;
defparam syn__1129_.FeedbackMux = 1'b0;
defparam syn__1129_.ShiftMux = 1'b0;
defparam syn__1129_.BypassEn = 1'b0;
defparam syn__1129_.CarryEnb = 1'b1;

alta_slice syn__1130_(
	.A(vcc),
	.B(\tc2.IM [24]),
	.C(vcc),
	.D(\tc2.IM [2]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0798_),
	.Cout(),
	.Q());
defparam syn__1130_.coord_x = 11;
defparam syn__1130_.coord_y = 4;
defparam syn__1130_.coord_z = 13;
defparam syn__1130_.mask = 16'h0033;
defparam syn__1130_.modeMux = 1'b0;
defparam syn__1130_.FeedbackMux = 1'b0;
defparam syn__1130_.ShiftMux = 1'b0;
defparam syn__1130_.BypassEn = 1'b0;
defparam syn__1130_.CarryEnb = 1'b1;

alta_slice syn__1131_(
	.A(vcc),
	.B(vcc),
	.C(syn__0801_),
	.D(syn__0800_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0799_),
	.Cout(),
	.Q());
defparam syn__1131_.coord_x = 8;
defparam syn__1131_.coord_y = 2;
defparam syn__1131_.coord_z = 11;
defparam syn__1131_.mask = 16'hF000;
defparam syn__1131_.modeMux = 1'b0;
defparam syn__1131_.FeedbackMux = 1'b0;
defparam syn__1131_.ShiftMux = 1'b0;
defparam syn__1131_.BypassEn = 1'b0;
defparam syn__1131_.CarryEnb = 1'b1;

alta_slice syn__1132_(
	.A(IOaddr2[28]),
	.B(IOaddr2[29]),
	.C(IOaddr2[30]),
	.D(IOaddr2[31]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0800_),
	.Cout(),
	.Q());
defparam syn__1132_.coord_x = 1;
defparam syn__1132_.coord_y = 6;
defparam syn__1132_.coord_z = 11;
defparam syn__1132_.mask = 16'h0001;
defparam syn__1132_.modeMux = 1'b0;
defparam syn__1132_.FeedbackMux = 1'b0;
defparam syn__1132_.ShiftMux = 1'b0;
defparam syn__1132_.BypassEn = 1'b0;
defparam syn__1132_.CarryEnb = 1'b1;

alta_slice syn__1133_(
	.A(IOaddr2[24]),
	.B(IOaddr2[25]),
	.C(IOaddr2[26]),
	.D(IOaddr2[27]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0801_),
	.Cout(),
	.Q());
defparam syn__1133_.coord_x = 8;
defparam syn__1133_.coord_y = 3;
defparam syn__1133_.coord_z = 7;
defparam syn__1133_.mask = 16'h0001;
defparam syn__1133_.modeMux = 1'b0;
defparam syn__1133_.FeedbackMux = 1'b0;
defparam syn__1133_.ShiftMux = 1'b0;
defparam syn__1133_.BypassEn = 1'b0;
defparam syn__1133_.CarryEnb = 1'b1;

alta_slice syn__1134_(
	.A(IOaddr2[20]),
	.B(IOaddr2[21]),
	.C(IOaddr2[22]),
	.D(IOaddr2[23]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0802_),
	.Cout(),
	.Q());
defparam syn__1134_.coord_x = 8;
defparam syn__1134_.coord_y = 3;
defparam syn__1134_.coord_z = 11;
defparam syn__1134_.mask = 16'h0001;
defparam syn__1134_.modeMux = 1'b0;
defparam syn__1134_.FeedbackMux = 1'b0;
defparam syn__1134_.ShiftMux = 1'b0;
defparam syn__1134_.BypassEn = 1'b0;
defparam syn__1134_.CarryEnb = 1'b1;

alta_slice syn__1135_(
	.A(IOaddr2[19]),
	.B(IOaddr2[18]),
	.C(IOaddr2[17]),
	.D(IOaddr2[16]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0803_),
	.Cout(),
	.Q());
defparam syn__1135_.coord_x = 12;
defparam syn__1135_.coord_y = 1;
defparam syn__1135_.coord_z = 0;
defparam syn__1135_.mask = 16'h0001;
defparam syn__1135_.modeMux = 1'b0;
defparam syn__1135_.FeedbackMux = 1'b0;
defparam syn__1135_.ShiftMux = 1'b0;
defparam syn__1135_.BypassEn = 1'b0;
defparam syn__1135_.CarryEnb = 1'b1;

alta_slice syn__1136_(
	.A(IOaddr2[8]),
	.B(IOaddr2[9]),
	.C(IOaddr2[6]),
	.D(IOaddr2[7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0804_),
	.Cout(),
	.Q());
defparam syn__1136_.coord_x = 9;
defparam syn__1136_.coord_y = 1;
defparam syn__1136_.coord_z = 3;
defparam syn__1136_.mask = 16'h8000;
defparam syn__1136_.modeMux = 1'b0;
defparam syn__1136_.FeedbackMux = 1'b0;
defparam syn__1136_.ShiftMux = 1'b0;
defparam syn__1136_.BypassEn = 1'b0;
defparam syn__1136_.CarryEnb = 1'b1;

alta_slice syn__1137_(
	.A(IOaddr2[3]),
	.B(IOaddr2[4]),
	.C(IOaddr2[2]),
	.D(IOaddr2[5]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0805_),
	.Cout(),
	.Q());
defparam syn__1137_.coord_x = 9;
defparam syn__1137_.coord_y = 1;
defparam syn__1137_.coord_z = 2;
defparam syn__1137_.mask = 16'h8000;
defparam syn__1137_.modeMux = 1'b0;
defparam syn__1137_.FeedbackMux = 1'b0;
defparam syn__1137_.ShiftMux = 1'b0;
defparam syn__1137_.BypassEn = 1'b0;
defparam syn__1137_.CarryEnb = 1'b1;

alta_slice syn__1138_(
	.A(\tc2.IM [1]),
	.B(\tc2.IM [0]),
	.C(IOaddr2[1]),
	.D(IOaddr2[0]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0806_),
	.Cout(),
	.Q());
defparam syn__1138_.coord_x = 11;
defparam syn__1138_.coord_y = 2;
defparam syn__1138_.coord_z = 2;
defparam syn__1138_.mask = 16'h8000;
defparam syn__1138_.modeMux = 1'b0;
defparam syn__1138_.FeedbackMux = 1'b0;
defparam syn__1138_.ShiftMux = 1'b0;
defparam syn__1138_.BypassEn = 1'b0;
defparam syn__1138_.CarryEnb = 1'b1;

alta_slice syn__1147_(
	.A(syn__0818_),
	.B(syn__0817_),
	.C(syn__0808_),
	.D(syn__0819_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0807_),
	.Cout(),
	.Q());
defparam syn__1147_.coord_x = 9;
defparam syn__1147_.coord_y = 5;
defparam syn__1147_.coord_z = 8;
defparam syn__1147_.mask = 16'h8000;
defparam syn__1147_.modeMux = 1'b0;
defparam syn__1147_.FeedbackMux = 1'b0;
defparam syn__1147_.ShiftMux = 1'b0;
defparam syn__1147_.BypassEn = 1'b0;
defparam syn__1147_.CarryEnb = 1'b1;

alta_slice syn__1148_(
	.A(syn__0809_),
	.B(syn__0812_),
	.C(syn__0815_),
	.D(syn__0816_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0808_),
	.Cout(),
	.Q());
defparam syn__1148_.coord_x = 11;
defparam syn__1148_.coord_y = 5;
defparam syn__1148_.coord_z = 5;
defparam syn__1148_.mask = 16'h8000;
defparam syn__1148_.modeMux = 1'b0;
defparam syn__1148_.FeedbackMux = 1'b0;
defparam syn__1148_.ShiftMux = 1'b0;
defparam syn__1148_.BypassEn = 1'b0;
defparam syn__1148_.CarryEnb = 1'b1;

alta_slice syn__1149_(
	.A(IOaddr1[11]),
	.B(syn__0810_),
	.C(IOaddr1[10]),
	.D(syn__0811_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0809_),
	.Cout(),
	.Q());
defparam syn__1149_.coord_x = 11;
defparam syn__1149_.coord_y = 5;
defparam syn__1149_.coord_z = 6;
defparam syn__1149_.mask = 16'h0400;
defparam syn__1149_.modeMux = 1'b0;
defparam syn__1149_.FeedbackMux = 1'b0;
defparam syn__1149_.ShiftMux = 1'b0;
defparam syn__1149_.BypassEn = 1'b0;
defparam syn__1149_.CarryEnb = 1'b1;

alta_slice syn__1150_(
	.A(IOaddr1[14]),
	.B(IOaddr1[13]),
	.C(IOaddr1[15]),
	.D(IOaddr1[12]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0810_),
	.Cout(),
	.Q());
defparam syn__1150_.coord_x = 11;
defparam syn__1150_.coord_y = 5;
defparam syn__1150_.coord_z = 7;
defparam syn__1150_.mask = 16'h0001;
defparam syn__1150_.modeMux = 1'b0;
defparam syn__1150_.FeedbackMux = 1'b0;
defparam syn__1150_.ShiftMux = 1'b0;
defparam syn__1150_.BypassEn = 1'b0;
defparam syn__1150_.CarryEnb = 1'b1;

alta_slice syn__1151_(
	.A(vcc),
	.B(\tc1.IM [24]),
	.C(vcc),
	.D(\tc1.IM [2]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0811_),
	.Cout(),
	.Q());
defparam syn__1151_.coord_x = 11;
defparam syn__1151_.coord_y = 7;
defparam syn__1151_.coord_z = 4;
defparam syn__1151_.mask = 16'h0033;
defparam syn__1151_.modeMux = 1'b0;
defparam syn__1151_.FeedbackMux = 1'b0;
defparam syn__1151_.ShiftMux = 1'b0;
defparam syn__1151_.BypassEn = 1'b0;
defparam syn__1151_.CarryEnb = 1'b1;

alta_slice syn__1152_(
	.A(vcc),
	.B(syn__0813_),
	.C(vcc),
	.D(syn__0814_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0812_),
	.Cout(),
	.Q());
defparam syn__1152_.coord_x = 11;
defparam syn__1152_.coord_y = 5;
defparam syn__1152_.coord_z = 15;
defparam syn__1152_.mask = 16'hCC00;
defparam syn__1152_.modeMux = 1'b0;
defparam syn__1152_.FeedbackMux = 1'b0;
defparam syn__1152_.ShiftMux = 1'b0;
defparam syn__1152_.BypassEn = 1'b0;
defparam syn__1152_.CarryEnb = 1'b1;

alta_slice syn__1153_(
	.A(IOaddr1[20]),
	.B(IOaddr1[21]),
	.C(IOaddr1[22]),
	.D(IOaddr1[23]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0813_),
	.Cout(),
	.Q());
defparam syn__1153_.coord_x = 8;
defparam syn__1153_.coord_y = 3;
defparam syn__1153_.coord_z = 9;
defparam syn__1153_.mask = 16'h0001;
defparam syn__1153_.modeMux = 1'b0;
defparam syn__1153_.FeedbackMux = 1'b0;
defparam syn__1153_.ShiftMux = 1'b0;
defparam syn__1153_.BypassEn = 1'b0;
defparam syn__1153_.CarryEnb = 1'b1;

alta_slice syn__1154_(
	.A(IOaddr1[18]),
	.B(IOaddr1[19]),
	.C(IOaddr1[16]),
	.D(IOaddr1[17]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0814_),
	.Cout(),
	.Q());
defparam syn__1154_.coord_x = 11;
defparam syn__1154_.coord_y = 5;
defparam syn__1154_.coord_z = 14;
defparam syn__1154_.mask = 16'h0001;
defparam syn__1154_.modeMux = 1'b0;
defparam syn__1154_.FeedbackMux = 1'b0;
defparam syn__1154_.ShiftMux = 1'b0;
defparam syn__1154_.BypassEn = 1'b0;
defparam syn__1154_.CarryEnb = 1'b1;

alta_slice syn__1155_(
	.A(IOaddr1[28]),
	.B(IOaddr1[29]),
	.C(IOaddr1[30]),
	.D(IOaddr1[31]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0815_),
	.Cout(),
	.Q());
defparam syn__1155_.coord_x = 8;
defparam syn__1155_.coord_y = 3;
defparam syn__1155_.coord_z = 15;
defparam syn__1155_.mask = 16'h0001;
defparam syn__1155_.modeMux = 1'b0;
defparam syn__1155_.FeedbackMux = 1'b0;
defparam syn__1155_.ShiftMux = 1'b0;
defparam syn__1155_.BypassEn = 1'b0;
defparam syn__1155_.CarryEnb = 1'b1;

alta_slice syn__1156_(
	.A(IOaddr1[24]),
	.B(IOaddr1[25]),
	.C(IOaddr1[26]),
	.D(IOaddr1[27]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0816_),
	.Cout(),
	.Q());
defparam syn__1156_.coord_x = 6;
defparam syn__1156_.coord_y = 2;
defparam syn__1156_.coord_z = 11;
defparam syn__1156_.mask = 16'h0001;
defparam syn__1156_.modeMux = 1'b0;
defparam syn__1156_.FeedbackMux = 1'b0;
defparam syn__1156_.ShiftMux = 1'b0;
defparam syn__1156_.BypassEn = 1'b0;
defparam syn__1156_.CarryEnb = 1'b1;

alta_slice syn__1157_(
	.A(IOaddr1[8]),
	.B(IOaddr1[9]),
	.C(IOaddr1[6]),
	.D(IOaddr1[7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0817_),
	.Cout(),
	.Q());
defparam syn__1157_.coord_x = 9;
defparam syn__1157_.coord_y = 5;
defparam syn__1157_.coord_z = 15;
defparam syn__1157_.mask = 16'h8000;
defparam syn__1157_.modeMux = 1'b0;
defparam syn__1157_.FeedbackMux = 1'b0;
defparam syn__1157_.ShiftMux = 1'b0;
defparam syn__1157_.BypassEn = 1'b0;
defparam syn__1157_.CarryEnb = 1'b1;

alta_slice syn__1158_(
	.A(IOaddr1[5]),
	.B(IOaddr1[2]),
	.C(IOaddr1[4]),
	.D(IOaddr1[3]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0818_),
	.Cout(),
	.Q());
defparam syn__1158_.coord_x = 12;
defparam syn__1158_.coord_y = 6;
defparam syn__1158_.coord_z = 7;
defparam syn__1158_.mask = 16'h8000;
defparam syn__1158_.modeMux = 1'b0;
defparam syn__1158_.FeedbackMux = 1'b0;
defparam syn__1158_.ShiftMux = 1'b0;
defparam syn__1158_.BypassEn = 1'b0;
defparam syn__1158_.CarryEnb = 1'b1;

alta_slice syn__1159_(
	.A(\tc1.IM [0]),
	.B(IOaddr1[1]),
	.C(\tc1.IM [1]),
	.D(IOaddr1[0]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0819_),
	.Cout(),
	.Q());
defparam syn__1159_.coord_x = 9;
defparam syn__1159_.coord_y = 5;
defparam syn__1159_.coord_z = 7;
defparam syn__1159_.mask = 16'h8000;
defparam syn__1159_.modeMux = 1'b0;
defparam syn__1159_.FeedbackMux = 1'b0;
defparam syn__1159_.ShiftMux = 1'b0;
defparam syn__1159_.BypassEn = 1'b0;
defparam syn__1159_.CarryEnb = 1'b1;

alta_slice syn__1168_(
	.A(\tc1.IM [3]),
	.B(syn__0821_),
	.C(syn__1055_),
	.D(syn__1062_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0820_),
	.Cout(),
	.Q());
defparam syn__1168_.coord_x = 6;
defparam syn__1168_.coord_y = 8;
defparam syn__1168_.coord_z = 1;
defparam syn__1168_.mask = 16'hEA00;
defparam syn__1168_.modeMux = 1'b0;
defparam syn__1168_.FeedbackMux = 1'b0;
defparam syn__1168_.ShiftMux = 1'b0;
defparam syn__1168_.BypassEn = 1'b0;
defparam syn__1168_.CarryEnb = 1'b1;

alta_slice syn__1169_(
	.A(syn__0934_),
	.B(syn__1048_),
	.C(syn__0923_),
	.D(syn__0822_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0821_),
	.Cout(),
	.Q());
defparam syn__1169_.coord_x = 6;
defparam syn__1169_.coord_y = 8;
defparam syn__1169_.coord_z = 15;
defparam syn__1169_.mask = 16'h8000;
defparam syn__1169_.modeMux = 1'b0;
defparam syn__1169_.FeedbackMux = 1'b0;
defparam syn__1169_.ShiftMux = 1'b0;
defparam syn__1169_.BypassEn = 1'b0;
defparam syn__1169_.CarryEnb = 1'b1;

alta_slice syn__1170_(
	.A(syn__0910_),
	.B(syn__0915_),
	.C(syn__0823_),
	.D(syn__0922_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0822_),
	.Cout(),
	.Q());
defparam syn__1170_.coord_x = 7;
defparam syn__1170_.coord_y = 8;
defparam syn__1170_.coord_z = 2;
defparam syn__1170_.mask = 16'h4044;
defparam syn__1170_.modeMux = 1'b0;
defparam syn__1170_.FeedbackMux = 1'b0;
defparam syn__1170_.ShiftMux = 1'b0;
defparam syn__1170_.BypassEn = 1'b0;
defparam syn__1170_.CarryEnb = 1'b1;

alta_slice syn__1171_(
	.A(syn__0909_),
	.B(syn__0905_),
	.C(syn__0824_),
	.D(\tc1.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0823_),
	.Cout(),
	.Q());
defparam syn__1171_.coord_x = 7;
defparam syn__1171_.coord_y = 8;
defparam syn__1171_.coord_z = 3;
defparam syn__1171_.mask = 16'hCC84;
defparam syn__1171_.modeMux = 1'b0;
defparam syn__1171_.FeedbackMux = 1'b0;
defparam syn__1171_.ShiftMux = 1'b0;
defparam syn__1171_.BypassEn = 1'b0;
defparam syn__1171_.CarryEnb = 1'b1;

alta_slice syn__1172_(
	.A(syn__0825_),
	.B(syn__0902_),
	.C(syn__0903_),
	.D(syn__0904_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0824_),
	.Cout(),
	.Q());
defparam syn__1172_.coord_x = 5;
defparam syn__1172_.coord_y = 7;
defparam syn__1172_.coord_z = 1;
defparam syn__1172_.mask = 16'h0313;
defparam syn__1172_.modeMux = 1'b0;
defparam syn__1172_.FeedbackMux = 1'b0;
defparam syn__1172_.ShiftMux = 1'b0;
defparam syn__1172_.BypassEn = 1'b0;
defparam syn__1172_.CarryEnb = 1'b1;

alta_slice syn__1173_(
	.A(syn__0901_),
	.B(syn__0899_),
	.C(syn__0826_),
	.D(syn__0900_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0825_),
	.Cout(),
	.Q());
defparam syn__1173_.coord_x = 5;
defparam syn__1173_.coord_y = 7;
defparam syn__1173_.coord_z = 2;
defparam syn__1173_.mask = 16'h0113;
defparam syn__1173_.modeMux = 1'b0;
defparam syn__1173_.FeedbackMux = 1'b0;
defparam syn__1173_.ShiftMux = 1'b0;
defparam syn__1173_.BypassEn = 1'b0;
defparam syn__1173_.CarryEnb = 1'b1;

alta_slice syn__1174_(
	.A(syn__0827_),
	.B(syn__0896_),
	.C(syn__0898_),
	.D(syn__0897_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0826_),
	.Cout(),
	.Q());
defparam syn__1174_.coord_x = 5;
defparam syn__1174_.coord_y = 7;
defparam syn__1174_.coord_z = 4;
defparam syn__1174_.mask = 16'hCD04;
defparam syn__1174_.modeMux = 1'b0;
defparam syn__1174_.FeedbackMux = 1'b0;
defparam syn__1174_.ShiftMux = 1'b0;
defparam syn__1174_.BypassEn = 1'b0;
defparam syn__1174_.CarryEnb = 1'b1;

alta_slice syn__1175_(
	.A(syn__0893_),
	.B(syn__0894_),
	.C(syn__0895_),
	.D(syn__0828_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0827_),
	.Cout(),
	.Q());
defparam syn__1175_.coord_x = 5;
defparam syn__1175_.coord_y = 7;
defparam syn__1175_.coord_z = 10;
defparam syn__1175_.mask = 16'h022A;
defparam syn__1175_.modeMux = 1'b0;
defparam syn__1175_.FeedbackMux = 1'b0;
defparam syn__1175_.ShiftMux = 1'b0;
defparam syn__1175_.BypassEn = 1'b0;
defparam syn__1175_.CarryEnb = 1'b1;

alta_slice syn__1176_(
	.A(syn__0891_),
	.B(syn__0890_),
	.C(syn__0829_),
	.D(syn__0892_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0828_),
	.Cout(),
	.Q());
defparam syn__1176_.coord_x = 7;
defparam syn__1176_.coord_y = 7;
defparam syn__1176_.coord_z = 12;
defparam syn__1176_.mask = 16'h3331;
defparam syn__1176_.modeMux = 1'b0;
defparam syn__1176_.FeedbackMux = 1'b0;
defparam syn__1176_.ShiftMux = 1'b0;
defparam syn__1176_.BypassEn = 1'b0;
defparam syn__1176_.CarryEnb = 1'b1;

alta_slice syn__1177_(
	.A(syn__0889_),
	.B(syn__0887_),
	.C(syn__0830_),
	.D(syn__0888_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0829_),
	.Cout(),
	.Q());
defparam syn__1177_.coord_x = 7;
defparam syn__1177_.coord_y = 7;
defparam syn__1177_.coord_z = 0;
defparam syn__1177_.mask = 16'h3220;
defparam syn__1177_.modeMux = 1'b0;
defparam syn__1177_.FeedbackMux = 1'b0;
defparam syn__1177_.ShiftMux = 1'b0;
defparam syn__1177_.BypassEn = 1'b0;
defparam syn__1177_.CarryEnb = 1'b1;

alta_slice syn__1178_(
	.A(syn__0884_),
	.B(syn__0885_),
	.C(syn__0886_),
	.D(syn__0831_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0830_),
	.Cout(),
	.Q());
defparam syn__1178_.coord_x = 6;
defparam syn__1178_.coord_y = 7;
defparam syn__1178_.coord_z = 8;
defparam syn__1178_.mask = 16'h888E;
defparam syn__1178_.modeMux = 1'b0;
defparam syn__1178_.FeedbackMux = 1'b0;
defparam syn__1178_.ShiftMux = 1'b0;
defparam syn__1178_.BypassEn = 1'b0;
defparam syn__1178_.CarryEnb = 1'b1;

alta_slice syn__1179_(
	.A(syn__0832_),
	.B(syn__0881_),
	.C(syn__0882_),
	.D(syn__0883_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0831_),
	.Cout(),
	.Q());
defparam syn__1179_.coord_x = 6;
defparam syn__1179_.coord_y = 7;
defparam syn__1179_.coord_z = 13;
defparam syn__1179_.mask = 16'hC0C4;
defparam syn__1179_.modeMux = 1'b0;
defparam syn__1179_.FeedbackMux = 1'b0;
defparam syn__1179_.ShiftMux = 1'b0;
defparam syn__1179_.BypassEn = 1'b0;
defparam syn__1179_.CarryEnb = 1'b1;

alta_slice syn__1180_(
	.A(syn__0879_),
	.B(syn__0878_),
	.C(syn__0833_),
	.D(syn__0880_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0832_),
	.Cout(),
	.Q());
defparam syn__1180_.coord_x = 6;
defparam syn__1180_.coord_y = 5;
defparam syn__1180_.coord_z = 11;
defparam syn__1180_.mask = 16'h1113;
defparam syn__1180_.modeMux = 1'b0;
defparam syn__1180_.FeedbackMux = 1'b0;
defparam syn__1180_.ShiftMux = 1'b0;
defparam syn__1180_.BypassEn = 1'b0;
defparam syn__1180_.CarryEnb = 1'b1;

alta_slice syn__1181_(
	.A(syn__0834_),
	.B(syn__0877_),
	.C(syn__0876_),
	.D(syn__0875_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0833_),
	.Cout(),
	.Q());
defparam syn__1181_.coord_x = 6;
defparam syn__1181_.coord_y = 5;
defparam syn__1181_.coord_z = 8;
defparam syn__1181_.mask = 16'h0223;
defparam syn__1181_.modeMux = 1'b0;
defparam syn__1181_.FeedbackMux = 1'b0;
defparam syn__1181_.ShiftMux = 1'b0;
defparam syn__1181_.BypassEn = 1'b0;
defparam syn__1181_.CarryEnb = 1'b1;

alta_slice syn__1182_(
	.A(syn__0874_),
	.B(syn__0873_),
	.C(syn__0872_),
	.D(syn__0835_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0834_),
	.Cout(),
	.Q());
defparam syn__1182_.coord_x = 11;
defparam syn__1182_.coord_y = 5;
defparam syn__1182_.coord_z = 8;
defparam syn__1182_.mask = 16'h3F2B;
defparam syn__1182_.modeMux = 1'b0;
defparam syn__1182_.FeedbackMux = 1'b0;
defparam syn__1182_.ShiftMux = 1'b0;
defparam syn__1182_.BypassEn = 1'b0;
defparam syn__1182_.CarryEnb = 1'b1;

alta_slice syn__1183_(
	.A(syn__0870_),
	.B(syn__0836_),
	.C(syn__0869_),
	.D(syn__0871_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0835_),
	.Cout(),
	.Q());
defparam syn__1183_.coord_x = 7;
defparam syn__1183_.coord_y = 5;
defparam syn__1183_.coord_z = 14;
defparam syn__1183_.mask = 16'hA0B0;
defparam syn__1183_.modeMux = 1'b0;
defparam syn__1183_.FeedbackMux = 1'b0;
defparam syn__1183_.ShiftMux = 1'b0;
defparam syn__1183_.BypassEn = 1'b0;
defparam syn__1183_.CarryEnb = 1'b1;

alta_slice syn__1184_(
	.A(syn__0837_),
	.B(syn__0866_),
	.C(syn__0867_),
	.D(syn__0868_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0836_),
	.Cout(),
	.Q());
defparam syn__1184_.coord_x = 7;
defparam syn__1184_.coord_y = 5;
defparam syn__1184_.coord_z = 15;
defparam syn__1184_.mask = 16'h0313;
defparam syn__1184_.modeMux = 1'b0;
defparam syn__1184_.FeedbackMux = 1'b0;
defparam syn__1184_.ShiftMux = 1'b0;
defparam syn__1184_.BypassEn = 1'b0;
defparam syn__1184_.CarryEnb = 1'b1;

alta_slice syn__1185_(
	.A(syn__0865_),
	.B(syn__0864_),
	.C(syn__0838_),
	.D(syn__0863_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0837_),
	.Cout(),
	.Q());
defparam syn__1185_.coord_x = 7;
defparam syn__1185_.coord_y = 5;
defparam syn__1185_.coord_z = 2;
defparam syn__1185_.mask = 16'h1700;
defparam syn__1185_.modeMux = 1'b0;
defparam syn__1185_.FeedbackMux = 1'b0;
defparam syn__1185_.ShiftMux = 1'b0;
defparam syn__1185_.BypassEn = 1'b0;
defparam syn__1185_.CarryEnb = 1'b1;

alta_slice syn__1186_(
	.A(syn__0862_),
	.B(syn__0860_),
	.C(syn__0861_),
	.D(syn__0839_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0838_),
	.Cout(),
	.Q());
defparam syn__1186_.coord_x = 12;
defparam syn__1186_.coord_y = 5;
defparam syn__1186_.coord_z = 5;
defparam syn__1186_.mask = 16'h1113;
defparam syn__1186_.modeMux = 1'b0;
defparam syn__1186_.FeedbackMux = 1'b0;
defparam syn__1186_.ShiftMux = 1'b0;
defparam syn__1186_.BypassEn = 1'b0;
defparam syn__1186_.CarryEnb = 1'b1;

alta_slice syn__1187_(
	.A(syn__0857_),
	.B(syn__0859_),
	.C(syn__0858_),
	.D(syn__0840_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0839_),
	.Cout(),
	.Q());
defparam syn__1187_.coord_x = 12;
defparam syn__1187_.coord_y = 5;
defparam syn__1187_.coord_z = 4;
defparam syn__1187_.mask = 16'hA0A2;
defparam syn__1187_.modeMux = 1'b0;
defparam syn__1187_.FeedbackMux = 1'b0;
defparam syn__1187_.ShiftMux = 1'b0;
defparam syn__1187_.BypassEn = 1'b0;
defparam syn__1187_.CarryEnb = 1'b1;

alta_slice syn__1188_(
	.A(syn__0841_),
	.B(syn__0855_),
	.C(syn__0856_),
	.D(syn__0854_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0840_),
	.Cout(),
	.Q());
defparam syn__1188_.coord_x = 12;
defparam syn__1188_.coord_y = 6;
defparam syn__1188_.coord_z = 15;
defparam syn__1188_.mask = 16'hCD04;
defparam syn__1188_.modeMux = 1'b0;
defparam syn__1188_.FeedbackMux = 1'b0;
defparam syn__1188_.ShiftMux = 1'b0;
defparam syn__1188_.BypassEn = 1'b0;
defparam syn__1188_.CarryEnb = 1'b1;

alta_slice syn__1189_(
	.A(syn__0842_),
	.B(syn__0851_),
	.C(syn__0853_),
	.D(syn__0852_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0841_),
	.Cout(),
	.Q());
defparam syn__1189_.coord_x = 12;
defparam syn__1189_.coord_y = 6;
defparam syn__1189_.coord_z = 14;
defparam syn__1189_.mask = 16'h0113;
defparam syn__1189_.modeMux = 1'b0;
defparam syn__1189_.FeedbackMux = 1'b0;
defparam syn__1189_.ShiftMux = 1'b0;
defparam syn__1189_.BypassEn = 1'b0;
defparam syn__1189_.CarryEnb = 1'b1;

alta_slice syn__1190_(
	.A(syn__0848_),
	.B(syn__0849_),
	.C(syn__0843_),
	.D(syn__0850_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0842_),
	.Cout(),
	.Q());
defparam syn__1190_.coord_x = 12;
defparam syn__1190_.coord_y = 6;
defparam syn__1190_.coord_z = 0;
defparam syn__1190_.mask = 16'h0155;
defparam syn__1190_.modeMux = 1'b0;
defparam syn__1190_.FeedbackMux = 1'b0;
defparam syn__1190_.ShiftMux = 1'b0;
defparam syn__1190_.BypassEn = 1'b0;
defparam syn__1190_.CarryEnb = 1'b1;

alta_slice syn__1191_(
	.A(syn__0844_),
	.B(syn__0847_),
	.C(syn__0846_),
	.D(syn__0845_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0843_),
	.Cout(),
	.Q());
defparam syn__1191_.coord_x = 11;
defparam syn__1191_.coord_y = 6;
defparam syn__1191_.coord_z = 0;
defparam syn__1191_.mask = 16'h40C4;
defparam syn__1191_.modeMux = 1'b0;
defparam syn__1191_.FeedbackMux = 1'b0;
defparam syn__1191_.ShiftMux = 1'b0;
defparam syn__1191_.BypassEn = 1'b0;
defparam syn__1191_.CarryEnb = 1'b1;

alta_slice syn__1192_(
	.A(vcc),
	.B(\tc1.IM [7]),
	.C(IOaddr1[1]),
	.D(\tc1.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0844_),
	.Cout(),
	.Q());
defparam syn__1192_.coord_x = 11;
defparam syn__1192_.coord_y = 6;
defparam syn__1192_.coord_z = 4;
defparam syn__1192_.mask = 16'h33C3;
defparam syn__1192_.modeMux = 1'b0;
defparam syn__1192_.FeedbackMux = 1'b0;
defparam syn__1192_.ShiftMux = 1'b0;
defparam syn__1192_.BypassEn = 1'b0;
defparam syn__1192_.CarryEnb = 1'b1;

alta_slice syn__1193_(
	.A(vcc),
	.B(IOvalue1[1]),
	.C(IOaddr1[1]),
	.D(\tc1.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0845_),
	.Cout(),
	.Q());
defparam syn__1193_.coord_x = 11;
defparam syn__1193_.coord_y = 6;
defparam syn__1193_.coord_z = 3;
defparam syn__1193_.mask = 16'h0F33;
defparam syn__1193_.modeMux = 1'b0;
defparam syn__1193_.FeedbackMux = 1'b0;
defparam syn__1193_.ShiftMux = 1'b0;
defparam syn__1193_.BypassEn = 1'b0;
defparam syn__1193_.CarryEnb = 1'b1;

alta_slice syn__1194_(
	.A(IOvalue1[0]),
	.B(IOaddr1[0]),
	.C(\tc1.IM [7]),
	.D(\tc1.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0846_),
	.Cout(),
	.Q());
defparam syn__1194_.coord_x = 9;
defparam syn__1194_.coord_y = 5;
defparam syn__1194_.coord_z = 0;
defparam syn__1194_.mask = 16'hCC28;
defparam syn__1194_.modeMux = 1'b0;
defparam syn__1194_.FeedbackMux = 1'b0;
defparam syn__1194_.ShiftMux = 1'b0;
defparam syn__1194_.BypassEn = 1'b0;
defparam syn__1194_.CarryEnb = 1'b1;

alta_slice syn__1195_(
	.A(IOvalue1[2]),
	.B(\tc1.IM [7]),
	.C(IOaddr1[2]),
	.D(\tc1.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0847_),
	.Cout(),
	.Q());
defparam syn__1195_.coord_x = 11;
defparam syn__1195_.coord_y = 6;
defparam syn__1195_.coord_z = 11;
defparam syn__1195_.mask = 16'h3C96;
defparam syn__1195_.modeMux = 1'b0;
defparam syn__1195_.FeedbackMux = 1'b0;
defparam syn__1195_.ShiftMux = 1'b0;
defparam syn__1195_.BypassEn = 1'b0;
defparam syn__1195_.CarryEnb = 1'b1;

alta_slice syn__1196_(
	.A(IOvalue1[3]),
	.B(\tc1.IM [7]),
	.C(IOaddr1[3]),
	.D(\tc1.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0848_),
	.Cout(),
	.Q());
defparam syn__1196_.coord_x = 11;
defparam syn__1196_.coord_y = 6;
defparam syn__1196_.coord_z = 7;
defparam syn__1196_.mask = 16'hC028;
defparam syn__1196_.modeMux = 1'b0;
defparam syn__1196_.FeedbackMux = 1'b0;
defparam syn__1196_.ShiftMux = 1'b0;
defparam syn__1196_.BypassEn = 1'b0;
defparam syn__1196_.CarryEnb = 1'b1;

alta_slice syn__1197_(
	.A(IOvalue1[2]),
	.B(\tc1.IM [7]),
	.C(IOaddr1[2]),
	.D(\tc1.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0849_),
	.Cout(),
	.Q());
defparam syn__1197_.coord_x = 11;
defparam syn__1197_.coord_y = 6;
defparam syn__1197_.coord_z = 15;
defparam syn__1197_.mask = 16'hC028;
defparam syn__1197_.modeMux = 1'b0;
defparam syn__1197_.FeedbackMux = 1'b0;
defparam syn__1197_.ShiftMux = 1'b0;
defparam syn__1197_.BypassEn = 1'b0;
defparam syn__1197_.CarryEnb = 1'b1;

alta_slice syn__1198_(
	.A(IOvalue1[3]),
	.B(\tc1.IM [7]),
	.C(IOaddr1[3]),
	.D(\tc1.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0850_),
	.Cout(),
	.Q());
defparam syn__1198_.coord_x = 11;
defparam syn__1198_.coord_y = 6;
defparam syn__1198_.coord_z = 9;
defparam syn__1198_.mask = 16'h3C96;
defparam syn__1198_.modeMux = 1'b0;
defparam syn__1198_.FeedbackMux = 1'b0;
defparam syn__1198_.ShiftMux = 1'b0;
defparam syn__1198_.BypassEn = 1'b0;
defparam syn__1198_.CarryEnb = 1'b1;

alta_slice syn__1199_(
	.A(\tc1.IM [8]),
	.B(IOvalue1[5]),
	.C(IOaddr1[5]),
	.D(\tc1.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0851_),
	.Cout(),
	.Q());
defparam syn__1199_.coord_x = 12;
defparam syn__1199_.coord_y = 6;
defparam syn__1199_.coord_z = 11;
defparam syn__1199_.mask = 16'h100B;
defparam syn__1199_.modeMux = 1'b0;
defparam syn__1199_.FeedbackMux = 1'b0;
defparam syn__1199_.ShiftMux = 1'b0;
defparam syn__1199_.BypassEn = 1'b0;
defparam syn__1199_.CarryEnb = 1'b1;

alta_slice syn__1200_(
	.A(vcc),
	.B(\tc1.IM [7]),
	.C(\tc1.IM [8]),
	.D(IOaddr1[4]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0852_),
	.Cout(),
	.Q());
defparam syn__1200_.coord_x = 12;
defparam syn__1200_.coord_y = 6;
defparam syn__1200_.coord_z = 5;
defparam syn__1200_.mask = 16'h3C33;
defparam syn__1200_.modeMux = 1'b0;
defparam syn__1200_.FeedbackMux = 1'b0;
defparam syn__1200_.ShiftMux = 1'b0;
defparam syn__1200_.BypassEn = 1'b0;
defparam syn__1200_.CarryEnb = 1'b1;

alta_slice syn__1201_(
	.A(\tc1.IM [8]),
	.B(vcc),
	.C(IOaddr1[4]),
	.D(IOvalue1[4]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0853_),
	.Cout(),
	.Q());
defparam syn__1201_.coord_x = 12;
defparam syn__1201_.coord_y = 6;
defparam syn__1201_.coord_z = 10;
defparam syn__1201_.mask = 16'h0A5F;
defparam syn__1201_.modeMux = 1'b0;
defparam syn__1201_.FeedbackMux = 1'b0;
defparam syn__1201_.ShiftMux = 1'b0;
defparam syn__1201_.BypassEn = 1'b0;
defparam syn__1201_.CarryEnb = 1'b1;

alta_slice syn__1202_(
	.A(vcc),
	.B(\tc1.IM [7]),
	.C(IOaddr1[6]),
	.D(\tc1.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0854_),
	.Cout(),
	.Q());
defparam syn__1202_.coord_x = 11;
defparam syn__1202_.coord_y = 6;
defparam syn__1202_.coord_z = 2;
defparam syn__1202_.mask = 16'h33C3;
defparam syn__1202_.modeMux = 1'b0;
defparam syn__1202_.FeedbackMux = 1'b0;
defparam syn__1202_.ShiftMux = 1'b0;
defparam syn__1202_.BypassEn = 1'b0;
defparam syn__1202_.CarryEnb = 1'b1;

alta_slice syn__1203_(
	.A(IOaddr1[6]),
	.B(vcc),
	.C(IOvalue1[6]),
	.D(\tc1.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0855_),
	.Cout(),
	.Q());
defparam syn__1203_.coord_x = 11;
defparam syn__1203_.coord_y = 6;
defparam syn__1203_.coord_z = 14;
defparam syn__1203_.mask = 16'h550F;
defparam syn__1203_.modeMux = 1'b0;
defparam syn__1203_.FeedbackMux = 1'b0;
defparam syn__1203_.ShiftMux = 1'b0;
defparam syn__1203_.BypassEn = 1'b0;
defparam syn__1203_.CarryEnb = 1'b1;

alta_slice syn__1204_(
	.A(IOaddr1[5]),
	.B(\tc1.IM [8]),
	.C(\tc1.IM [7]),
	.D(IOvalue1[5]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0856_),
	.Cout(),
	.Q());
defparam syn__1204_.coord_x = 12;
defparam syn__1204_.coord_y = 6;
defparam syn__1204_.coord_z = 2;
defparam syn__1204_.mask = 16'h9280;
defparam syn__1204_.modeMux = 1'b0;
defparam syn__1204_.FeedbackMux = 1'b0;
defparam syn__1204_.ShiftMux = 1'b0;
defparam syn__1204_.BypassEn = 1'b0;
defparam syn__1204_.CarryEnb = 1'b1;

alta_slice syn__1205_(
	.A(IOaddr1[8]),
	.B(IOvalue1[8]),
	.C(\tc1.IM [7]),
	.D(\tc1.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0857_),
	.Cout(),
	.Q());
defparam syn__1205_.coord_x = 8;
defparam syn__1205_.coord_y = 5;
defparam syn__1205_.coord_z = 8;
defparam syn__1205_.mask = 16'h5A96;
defparam syn__1205_.modeMux = 1'b0;
defparam syn__1205_.FeedbackMux = 1'b0;
defparam syn__1205_.ShiftMux = 1'b0;
defparam syn__1205_.BypassEn = 1'b0;
defparam syn__1205_.CarryEnb = 1'b1;

alta_slice syn__1206_(
	.A(\tc1.IM [8]),
	.B(IOaddr1[7]),
	.C(\tc1.IM [7]),
	.D(IOvalue1[7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0858_),
	.Cout(),
	.Q());
defparam syn__1206_.coord_x = 12;
defparam syn__1206_.coord_y = 5;
defparam syn__1206_.coord_z = 10;
defparam syn__1206_.mask = 16'h9480;
defparam syn__1206_.modeMux = 1'b0;
defparam syn__1206_.FeedbackMux = 1'b0;
defparam syn__1206_.ShiftMux = 1'b0;
defparam syn__1206_.BypassEn = 1'b0;
defparam syn__1206_.CarryEnb = 1'b1;

alta_slice syn__1207_(
	.A(\tc1.IM [8]),
	.B(IOaddr1[7]),
	.C(\tc1.IM [7]),
	.D(IOvalue1[7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0859_),
	.Cout(),
	.Q());
defparam syn__1207_.coord_x = 12;
defparam syn__1207_.coord_y = 5;
defparam syn__1207_.coord_z = 3;
defparam syn__1207_.mask = 16'h0243;
defparam syn__1207_.modeMux = 1'b0;
defparam syn__1207_.FeedbackMux = 1'b0;
defparam syn__1207_.ShiftMux = 1'b0;
defparam syn__1207_.BypassEn = 1'b0;
defparam syn__1207_.CarryEnb = 1'b1;

alta_slice syn__1208_(
	.A(\tc1.IM [7]),
	.B(\tc1.IM [8]),
	.C(IOaddr1[9]),
	.D(IOvalue1[9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0860_),
	.Cout(),
	.Q());
defparam syn__1208_.coord_x = 12;
defparam syn__1208_.coord_y = 5;
defparam syn__1208_.coord_z = 1;
defparam syn__1208_.mask = 16'h9280;
defparam syn__1208_.modeMux = 1'b0;
defparam syn__1208_.FeedbackMux = 1'b0;
defparam syn__1208_.ShiftMux = 1'b0;
defparam syn__1208_.BypassEn = 1'b0;
defparam syn__1208_.CarryEnb = 1'b1;

alta_slice syn__1209_(
	.A(IOaddr1[8]),
	.B(IOvalue1[8]),
	.C(\tc1.IM [7]),
	.D(\tc1.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0861_),
	.Cout(),
	.Q());
defparam syn__1209_.coord_x = 8;
defparam syn__1209_.coord_y = 5;
defparam syn__1209_.coord_z = 9;
defparam syn__1209_.mask = 16'hA048;
defparam syn__1209_.modeMux = 1'b0;
defparam syn__1209_.FeedbackMux = 1'b0;
defparam syn__1209_.ShiftMux = 1'b0;
defparam syn__1209_.BypassEn = 1'b0;
defparam syn__1209_.CarryEnb = 1'b1;

alta_slice syn__1210_(
	.A(IOvalue1[9]),
	.B(\tc1.IM [7]),
	.C(IOaddr1[9]),
	.D(\tc1.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0862_),
	.Cout(),
	.Q());
defparam syn__1210_.coord_x = 12;
defparam syn__1210_.coord_y = 5;
defparam syn__1210_.coord_z = 8;
defparam syn__1210_.mask = 16'h3C96;
defparam syn__1210_.modeMux = 1'b0;
defparam syn__1210_.FeedbackMux = 1'b0;
defparam syn__1210_.ShiftMux = 1'b0;
defparam syn__1210_.BypassEn = 1'b0;
defparam syn__1210_.CarryEnb = 1'b1;

alta_slice syn__1211_(
	.A(IOaddr1[11]),
	.B(IOvalue1[11]),
	.C(\tc1.IM [7]),
	.D(\tc1.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0863_),
	.Cout(),
	.Q());
defparam syn__1211_.coord_x = 8;
defparam syn__1211_.coord_y = 5;
defparam syn__1211_.coord_z = 10;
defparam syn__1211_.mask = 16'h5A96;
defparam syn__1211_.modeMux = 1'b0;
defparam syn__1211_.FeedbackMux = 1'b0;
defparam syn__1211_.ShiftMux = 1'b0;
defparam syn__1211_.BypassEn = 1'b0;
defparam syn__1211_.CarryEnb = 1'b1;

alta_slice syn__1212_(
	.A(\tc1.IM [7]),
	.B(\tc1.IM [8]),
	.C(IOaddr1[10]),
	.D(vcc),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0864_),
	.Cout(),
	.Q());
defparam syn__1212_.coord_x = 7;
defparam syn__1212_.coord_y = 5;
defparam syn__1212_.coord_z = 1;
defparam syn__1212_.mask = 16'h6565;
defparam syn__1212_.modeMux = 1'b0;
defparam syn__1212_.FeedbackMux = 1'b0;
defparam syn__1212_.ShiftMux = 1'b0;
defparam syn__1212_.BypassEn = 1'b0;
defparam syn__1212_.CarryEnb = 1'b1;

alta_slice syn__1213_(
	.A(vcc),
	.B(IOaddr1[10]),
	.C(IOvalue1[10]),
	.D(\tc1.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0865_),
	.Cout(),
	.Q());
defparam syn__1213_.coord_x = 7;
defparam syn__1213_.coord_y = 5;
defparam syn__1213_.coord_z = 4;
defparam syn__1213_.mask = 16'h330F;
defparam syn__1213_.modeMux = 1'b0;
defparam syn__1213_.FeedbackMux = 1'b0;
defparam syn__1213_.ShiftMux = 1'b0;
defparam syn__1213_.BypassEn = 1'b0;
defparam syn__1213_.CarryEnb = 1'b1;

alta_slice syn__1214_(
	.A(\tc1.IM [7]),
	.B(IOaddr1[12]),
	.C(IOvalue1[12]),
	.D(\tc1.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0866_),
	.Cout(),
	.Q());
defparam syn__1214_.coord_x = 7;
defparam syn__1214_.coord_y = 5;
defparam syn__1214_.coord_z = 3;
defparam syn__1214_.mask = 16'h8860;
defparam syn__1214_.modeMux = 1'b0;
defparam syn__1214_.FeedbackMux = 1'b0;
defparam syn__1214_.ShiftMux = 1'b0;
defparam syn__1214_.BypassEn = 1'b0;
defparam syn__1214_.CarryEnb = 1'b1;

alta_slice syn__1215_(
	.A(IOvalue1[12]),
	.B(IOaddr1[12]),
	.C(\tc1.IM [7]),
	.D(\tc1.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0867_),
	.Cout(),
	.Q());
defparam syn__1215_.coord_x = 7;
defparam syn__1215_.coord_y = 5;
defparam syn__1215_.coord_z = 8;
defparam syn__1215_.mask = 16'h3C96;
defparam syn__1215_.modeMux = 1'b0;
defparam syn__1215_.FeedbackMux = 1'b0;
defparam syn__1215_.ShiftMux = 1'b0;
defparam syn__1215_.BypassEn = 1'b0;
defparam syn__1215_.CarryEnb = 1'b1;

alta_slice syn__1216_(
	.A(IOaddr1[11]),
	.B(IOvalue1[11]),
	.C(\tc1.IM [7]),
	.D(\tc1.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0868_),
	.Cout(),
	.Q());
defparam syn__1216_.coord_x = 8;
defparam syn__1216_.coord_y = 5;
defparam syn__1216_.coord_z = 11;
defparam syn__1216_.mask = 16'hA048;
defparam syn__1216_.modeMux = 1'b0;
defparam syn__1216_.FeedbackMux = 1'b0;
defparam syn__1216_.ShiftMux = 1'b0;
defparam syn__1216_.BypassEn = 1'b0;
defparam syn__1216_.CarryEnb = 1'b1;

alta_slice syn__1217_(
	.A(IOaddr1[14]),
	.B(IOvalue1[14]),
	.C(\tc1.IM [7]),
	.D(\tc1.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0869_),
	.Cout(),
	.Q());
defparam syn__1217_.coord_x = 8;
defparam syn__1217_.coord_y = 5;
defparam syn__1217_.coord_z = 2;
defparam syn__1217_.mask = 16'h5A96;
defparam syn__1217_.modeMux = 1'b0;
defparam syn__1217_.FeedbackMux = 1'b0;
defparam syn__1217_.ShiftMux = 1'b0;
defparam syn__1217_.BypassEn = 1'b0;
defparam syn__1217_.CarryEnb = 1'b1;

alta_slice syn__1218_(
	.A(IOaddr1[13]),
	.B(IOvalue1[13]),
	.C(\tc1.IM [7]),
	.D(\tc1.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0870_),
	.Cout(),
	.Q());
defparam syn__1218_.coord_x = 7;
defparam syn__1218_.coord_y = 5;
defparam syn__1218_.coord_z = 10;
defparam syn__1218_.mask = 16'hA048;
defparam syn__1218_.modeMux = 1'b0;
defparam syn__1218_.FeedbackMux = 1'b0;
defparam syn__1218_.ShiftMux = 1'b0;
defparam syn__1218_.BypassEn = 1'b0;
defparam syn__1218_.CarryEnb = 1'b1;

alta_slice syn__1219_(
	.A(\tc1.IM [7]),
	.B(IOvalue1[13]),
	.C(IOaddr1[13]),
	.D(\tc1.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0871_),
	.Cout(),
	.Q());
defparam syn__1219_.coord_x = 7;
defparam syn__1219_.coord_y = 5;
defparam syn__1219_.coord_z = 13;
defparam syn__1219_.mask = 16'h0521;
defparam syn__1219_.modeMux = 1'b0;
defparam syn__1219_.FeedbackMux = 1'b0;
defparam syn__1219_.ShiftMux = 1'b0;
defparam syn__1219_.BypassEn = 1'b0;
defparam syn__1219_.CarryEnb = 1'b1;

alta_slice syn__1220_(
	.A(IOaddr1[15]),
	.B(vcc),
	.C(\tc1.IM [7]),
	.D(\tc1.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0872_),
	.Cout(),
	.Q());
defparam syn__1220_.coord_x = 11;
defparam syn__1220_.coord_y = 5;
defparam syn__1220_.coord_z = 4;
defparam syn__1220_.mask = 16'h0FA5;
defparam syn__1220_.modeMux = 1'b0;
defparam syn__1220_.FeedbackMux = 1'b0;
defparam syn__1220_.ShiftMux = 1'b0;
defparam syn__1220_.BypassEn = 1'b0;
defparam syn__1220_.CarryEnb = 1'b1;

alta_slice syn__1221_(
	.A(vcc),
	.B(\tc1.IM [8]),
	.C(IOaddr1[15]),
	.D(IOvalue1[15]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0873_),
	.Cout(),
	.Q());
defparam syn__1221_.coord_x = 12;
defparam syn__1221_.coord_y = 5;
defparam syn__1221_.coord_z = 6;
defparam syn__1221_.mask = 16'h0C3F;
defparam syn__1221_.modeMux = 1'b0;
defparam syn__1221_.FeedbackMux = 1'b0;
defparam syn__1221_.ShiftMux = 1'b0;
defparam syn__1221_.BypassEn = 1'b0;
defparam syn__1221_.CarryEnb = 1'b1;

alta_slice syn__1222_(
	.A(IOaddr1[14]),
	.B(IOvalue1[14]),
	.C(\tc1.IM [7]),
	.D(\tc1.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0874_),
	.Cout(),
	.Q());
defparam syn__1222_.coord_x = 8;
defparam syn__1222_.coord_y = 5;
defparam syn__1222_.coord_z = 4;
defparam syn__1222_.mask = 16'hA048;
defparam syn__1222_.modeMux = 1'b0;
defparam syn__1222_.FeedbackMux = 1'b0;
defparam syn__1222_.ShiftMux = 1'b0;
defparam syn__1222_.BypassEn = 1'b0;
defparam syn__1222_.CarryEnb = 1'b1;

alta_slice syn__1223_(
	.A(vcc),
	.B(\tc1.IM [7]),
	.C(IOaddr1[16]),
	.D(\tc1.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0875_),
	.Cout(),
	.Q());
defparam syn__1223_.coord_x = 6;
defparam syn__1223_.coord_y = 5;
defparam syn__1223_.coord_z = 1;
defparam syn__1223_.mask = 16'h33C3;
defparam syn__1223_.modeMux = 1'b0;
defparam syn__1223_.FeedbackMux = 1'b0;
defparam syn__1223_.ShiftMux = 1'b0;
defparam syn__1223_.BypassEn = 1'b0;
defparam syn__1223_.CarryEnb = 1'b1;

alta_slice syn__1224_(
	.A(IOaddr1[16]),
	.B(vcc),
	.C(IOvalue1[16]),
	.D(\tc1.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0876_),
	.Cout(),
	.Q());
defparam syn__1224_.coord_x = 6;
defparam syn__1224_.coord_y = 5;
defparam syn__1224_.coord_z = 14;
defparam syn__1224_.mask = 16'h550F;
defparam syn__1224_.modeMux = 1'b0;
defparam syn__1224_.FeedbackMux = 1'b0;
defparam syn__1224_.ShiftMux = 1'b0;
defparam syn__1224_.BypassEn = 1'b0;
defparam syn__1224_.CarryEnb = 1'b1;

alta_slice syn__1225_(
	.A(IOaddr1[17]),
	.B(\tc1.IM [7]),
	.C(IOvalue1[17]),
	.D(\tc1.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0877_),
	.Cout(),
	.Q());
defparam syn__1225_.coord_x = 6;
defparam syn__1225_.coord_y = 5;
defparam syn__1225_.coord_z = 7;
defparam syn__1225_.mask = 16'h1109;
defparam syn__1225_.modeMux = 1'b0;
defparam syn__1225_.FeedbackMux = 1'b0;
defparam syn__1225_.ShiftMux = 1'b0;
defparam syn__1225_.BypassEn = 1'b0;
defparam syn__1225_.CarryEnb = 1'b1;

alta_slice syn__1226_(
	.A(IOvalue1[18]),
	.B(\tc1.IM [7]),
	.C(IOaddr1[18]),
	.D(\tc1.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0878_),
	.Cout(),
	.Q());
defparam syn__1226_.coord_x = 6;
defparam syn__1226_.coord_y = 5;
defparam syn__1226_.coord_z = 9;
defparam syn__1226_.mask = 16'hC028;
defparam syn__1226_.modeMux = 1'b0;
defparam syn__1226_.FeedbackMux = 1'b0;
defparam syn__1226_.ShiftMux = 1'b0;
defparam syn__1226_.BypassEn = 1'b0;
defparam syn__1226_.CarryEnb = 1'b1;

alta_slice syn__1227_(
	.A(IOaddr1[18]),
	.B(IOvalue1[18]),
	.C(\tc1.IM [7]),
	.D(\tc1.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0879_),
	.Cout(),
	.Q());
defparam syn__1227_.coord_x = 5;
defparam syn__1227_.coord_y = 5;
defparam syn__1227_.coord_z = 13;
defparam syn__1227_.mask = 16'h5A96;
defparam syn__1227_.modeMux = 1'b0;
defparam syn__1227_.FeedbackMux = 1'b0;
defparam syn__1227_.ShiftMux = 1'b0;
defparam syn__1227_.BypassEn = 1'b0;
defparam syn__1227_.CarryEnb = 1'b1;

alta_slice syn__1228_(
	.A(IOaddr1[17]),
	.B(\tc1.IM [7]),
	.C(IOvalue1[17]),
	.D(\tc1.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0880_),
	.Cout(),
	.Q());
defparam syn__1228_.coord_x = 6;
defparam syn__1228_.coord_y = 5;
defparam syn__1228_.coord_z = 3;
defparam syn__1228_.mask = 16'h8860;
defparam syn__1228_.modeMux = 1'b0;
defparam syn__1228_.FeedbackMux = 1'b0;
defparam syn__1228_.ShiftMux = 1'b0;
defparam syn__1228_.BypassEn = 1'b0;
defparam syn__1228_.CarryEnb = 1'b1;

alta_slice syn__1229_(
	.A(IOaddr1[20]),
	.B(IOvalue1[20]),
	.C(\tc1.IM [7]),
	.D(\tc1.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0881_),
	.Cout(),
	.Q());
defparam syn__1229_.coord_x = 6;
defparam syn__1229_.coord_y = 7;
defparam syn__1229_.coord_z = 15;
defparam syn__1229_.mask = 16'h5A96;
defparam syn__1229_.modeMux = 1'b0;
defparam syn__1229_.FeedbackMux = 1'b0;
defparam syn__1229_.ShiftMux = 1'b0;
defparam syn__1229_.BypassEn = 1'b0;
defparam syn__1229_.CarryEnb = 1'b1;

alta_slice syn__1230_(
	.A(IOvalue1[19]),
	.B(IOaddr1[19]),
	.C(\tc1.IM [7]),
	.D(\tc1.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0882_),
	.Cout(),
	.Q());
defparam syn__1230_.coord_x = 6;
defparam syn__1230_.coord_y = 7;
defparam syn__1230_.coord_z = 14;
defparam syn__1230_.mask = 16'hC028;
defparam syn__1230_.modeMux = 1'b0;
defparam syn__1230_.FeedbackMux = 1'b0;
defparam syn__1230_.ShiftMux = 1'b0;
defparam syn__1230_.BypassEn = 1'b0;
defparam syn__1230_.CarryEnb = 1'b1;

alta_slice syn__1231_(
	.A(IOaddr1[19]),
	.B(IOvalue1[19]),
	.C(\tc1.IM [7]),
	.D(\tc1.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0883_),
	.Cout(),
	.Q());
defparam syn__1231_.coord_x = 6;
defparam syn__1231_.coord_y = 7;
defparam syn__1231_.coord_z = 7;
defparam syn__1231_.mask = 16'h0521;
defparam syn__1231_.modeMux = 1'b0;
defparam syn__1231_.FeedbackMux = 1'b0;
defparam syn__1231_.ShiftMux = 1'b0;
defparam syn__1231_.BypassEn = 1'b0;
defparam syn__1231_.CarryEnb = 1'b1;

alta_slice syn__1232_(
	.A(vcc),
	.B(IOaddr1[21]),
	.C(\tc1.IM [7]),
	.D(\tc1.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0884_),
	.Cout(),
	.Q());
defparam syn__1232_.coord_x = 6;
defparam syn__1232_.coord_y = 7;
defparam syn__1232_.coord_z = 6;
defparam syn__1232_.mask = 16'h0FC3;
defparam syn__1232_.modeMux = 1'b0;
defparam syn__1232_.FeedbackMux = 1'b0;
defparam syn__1232_.ShiftMux = 1'b0;
defparam syn__1232_.BypassEn = 1'b0;
defparam syn__1232_.CarryEnb = 1'b1;

alta_slice syn__1233_(
	.A(IOvalue1[21]),
	.B(IOaddr1[21]),
	.C(vcc),
	.D(\tc1.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0885_),
	.Cout(),
	.Q());
defparam syn__1233_.coord_x = 6;
defparam syn__1233_.coord_y = 7;
defparam syn__1233_.coord_z = 9;
defparam syn__1233_.mask = 16'h3355;
defparam syn__1233_.modeMux = 1'b0;
defparam syn__1233_.FeedbackMux = 1'b0;
defparam syn__1233_.ShiftMux = 1'b0;
defparam syn__1233_.BypassEn = 1'b0;
defparam syn__1233_.CarryEnb = 1'b1;

alta_slice syn__1234_(
	.A(IOvalue1[20]),
	.B(IOaddr1[20]),
	.C(\tc1.IM [7]),
	.D(\tc1.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0886_),
	.Cout(),
	.Q());
defparam syn__1234_.coord_x = 6;
defparam syn__1234_.coord_y = 7;
defparam syn__1234_.coord_z = 10;
defparam syn__1234_.mask = 16'hC028;
defparam syn__1234_.modeMux = 1'b0;
defparam syn__1234_.FeedbackMux = 1'b0;
defparam syn__1234_.ShiftMux = 1'b0;
defparam syn__1234_.BypassEn = 1'b0;
defparam syn__1234_.CarryEnb = 1'b1;

alta_slice syn__1235_(
	.A(IOvalue1[23]),
	.B(IOaddr1[23]),
	.C(\tc1.IM [7]),
	.D(\tc1.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0887_),
	.Cout(),
	.Q());
defparam syn__1235_.coord_x = 7;
defparam syn__1235_.coord_y = 7;
defparam syn__1235_.coord_z = 7;
defparam syn__1235_.mask = 16'hC028;
defparam syn__1235_.modeMux = 1'b0;
defparam syn__1235_.FeedbackMux = 1'b0;
defparam syn__1235_.ShiftMux = 1'b0;
defparam syn__1235_.BypassEn = 1'b0;
defparam syn__1235_.CarryEnb = 1'b1;

alta_slice syn__1236_(
	.A(vcc),
	.B(IOaddr1[22]),
	.C(\tc1.IM [7]),
	.D(\tc1.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0888_),
	.Cout(),
	.Q());
defparam syn__1236_.coord_x = 7;
defparam syn__1236_.coord_y = 7;
defparam syn__1236_.coord_z = 15;
defparam syn__1236_.mask = 16'h0FC3;
defparam syn__1236_.modeMux = 1'b0;
defparam syn__1236_.FeedbackMux = 1'b0;
defparam syn__1236_.ShiftMux = 1'b0;
defparam syn__1236_.BypassEn = 1'b0;
defparam syn__1236_.CarryEnb = 1'b1;

alta_slice syn__1237_(
	.A(IOvalue1[22]),
	.B(IOaddr1[22]),
	.C(vcc),
	.D(\tc1.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0889_),
	.Cout(),
	.Q());
defparam syn__1237_.coord_x = 7;
defparam syn__1237_.coord_y = 7;
defparam syn__1237_.coord_z = 1;
defparam syn__1237_.mask = 16'h3355;
defparam syn__1237_.modeMux = 1'b0;
defparam syn__1237_.FeedbackMux = 1'b0;
defparam syn__1237_.ShiftMux = 1'b0;
defparam syn__1237_.BypassEn = 1'b0;
defparam syn__1237_.CarryEnb = 1'b1;

alta_slice syn__1238_(
	.A(IOvalue1[24]),
	.B(IOaddr1[24]),
	.C(\tc1.IM [7]),
	.D(\tc1.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0890_),
	.Cout(),
	.Q());
defparam syn__1238_.coord_x = 7;
defparam syn__1238_.coord_y = 7;
defparam syn__1238_.coord_z = 9;
defparam syn__1238_.mask = 16'hC028;
defparam syn__1238_.modeMux = 1'b0;
defparam syn__1238_.FeedbackMux = 1'b0;
defparam syn__1238_.ShiftMux = 1'b0;
defparam syn__1238_.BypassEn = 1'b0;
defparam syn__1238_.CarryEnb = 1'b1;

alta_slice syn__1239_(
	.A(IOaddr1[24]),
	.B(IOvalue1[24]),
	.C(\tc1.IM [7]),
	.D(\tc1.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0891_),
	.Cout(),
	.Q());
defparam syn__1239_.coord_x = 7;
defparam syn__1239_.coord_y = 7;
defparam syn__1239_.coord_z = 4;
defparam syn__1239_.mask = 16'h5A96;
defparam syn__1239_.modeMux = 1'b0;
defparam syn__1239_.FeedbackMux = 1'b0;
defparam syn__1239_.ShiftMux = 1'b0;
defparam syn__1239_.BypassEn = 1'b0;
defparam syn__1239_.CarryEnb = 1'b1;

alta_slice syn__1240_(
	.A(IOaddr1[23]),
	.B(IOvalue1[23]),
	.C(\tc1.IM [7]),
	.D(\tc1.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0892_),
	.Cout(),
	.Q());
defparam syn__1240_.coord_x = 7;
defparam syn__1240_.coord_y = 7;
defparam syn__1240_.coord_z = 3;
defparam syn__1240_.mask = 16'h0521;
defparam syn__1240_.modeMux = 1'b0;
defparam syn__1240_.FeedbackMux = 1'b0;
defparam syn__1240_.ShiftMux = 1'b0;
defparam syn__1240_.BypassEn = 1'b0;
defparam syn__1240_.CarryEnb = 1'b1;

alta_slice syn__1241_(
	.A(IOaddr1[26]),
	.B(IOvalue1[26]),
	.C(\tc1.IM [7]),
	.D(\tc1.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0893_),
	.Cout(),
	.Q());
defparam syn__1241_.coord_x = 5;
defparam syn__1241_.coord_y = 8;
defparam syn__1241_.coord_z = 8;
defparam syn__1241_.mask = 16'h5A96;
defparam syn__1241_.modeMux = 1'b0;
defparam syn__1241_.FeedbackMux = 1'b0;
defparam syn__1241_.ShiftMux = 1'b0;
defparam syn__1241_.BypassEn = 1'b0;
defparam syn__1241_.CarryEnb = 1'b1;

alta_slice syn__1242_(
	.A(vcc),
	.B(IOaddr1[25]),
	.C(\tc1.IM [7]),
	.D(\tc1.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0894_),
	.Cout(),
	.Q());
defparam syn__1242_.coord_x = 5;
defparam syn__1242_.coord_y = 8;
defparam syn__1242_.coord_z = 12;
defparam syn__1242_.mask = 16'h0FC3;
defparam syn__1242_.modeMux = 1'b0;
defparam syn__1242_.FeedbackMux = 1'b0;
defparam syn__1242_.ShiftMux = 1'b0;
defparam syn__1242_.BypassEn = 1'b0;
defparam syn__1242_.CarryEnb = 1'b1;

alta_slice syn__1243_(
	.A(IOvalue1[25]),
	.B(IOaddr1[25]),
	.C(vcc),
	.D(\tc1.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0895_),
	.Cout(),
	.Q());
defparam syn__1243_.coord_x = 5;
defparam syn__1243_.coord_y = 8;
defparam syn__1243_.coord_z = 1;
defparam syn__1243_.mask = 16'h3355;
defparam syn__1243_.modeMux = 1'b0;
defparam syn__1243_.FeedbackMux = 1'b0;
defparam syn__1243_.ShiftMux = 1'b0;
defparam syn__1243_.BypassEn = 1'b0;
defparam syn__1243_.CarryEnb = 1'b1;

alta_slice syn__1244_(
	.A(\tc1.IM [8]),
	.B(IOaddr1[27]),
	.C(vcc),
	.D(\tc1.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0896_),
	.Cout(),
	.Q());
defparam syn__1244_.coord_x = 5;
defparam syn__1244_.coord_y = 7;
defparam syn__1244_.coord_z = 12;
defparam syn__1244_.mask = 16'h44BB;
defparam syn__1244_.modeMux = 1'b0;
defparam syn__1244_.FeedbackMux = 1'b0;
defparam syn__1244_.ShiftMux = 1'b0;
defparam syn__1244_.BypassEn = 1'b0;
defparam syn__1244_.CarryEnb = 1'b1;

alta_slice syn__1245_(
	.A(IOvalue1[27]),
	.B(IOaddr1[27]),
	.C(vcc),
	.D(\tc1.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0897_),
	.Cout(),
	.Q());
defparam syn__1245_.coord_x = 5;
defparam syn__1245_.coord_y = 5;
defparam syn__1245_.coord_z = 8;
defparam syn__1245_.mask = 16'h3355;
defparam syn__1245_.modeMux = 1'b0;
defparam syn__1245_.FeedbackMux = 1'b0;
defparam syn__1245_.ShiftMux = 1'b0;
defparam syn__1245_.BypassEn = 1'b0;
defparam syn__1245_.CarryEnb = 1'b1;

alta_slice syn__1246_(
	.A(\tc1.IM [8]),
	.B(IOvalue1[26]),
	.C(IOaddr1[26]),
	.D(\tc1.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0898_),
	.Cout(),
	.Q());
defparam syn__1246_.coord_x = 5;
defparam syn__1246_.coord_y = 7;
defparam syn__1246_.coord_z = 6;
defparam syn__1246_.mask = 16'hA440;
defparam syn__1246_.modeMux = 1'b0;
defparam syn__1246_.FeedbackMux = 1'b0;
defparam syn__1246_.ShiftMux = 1'b0;
defparam syn__1246_.BypassEn = 1'b0;
defparam syn__1246_.CarryEnb = 1'b1;

alta_slice syn__1247_(
	.A(IOaddr1[29]),
	.B(IOvalue1[29]),
	.C(\tc1.IM [7]),
	.D(\tc1.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0899_),
	.Cout(),
	.Q());
defparam syn__1247_.coord_x = 5;
defparam syn__1247_.coord_y = 8;
defparam syn__1247_.coord_z = 10;
defparam syn__1247_.mask = 16'h0521;
defparam syn__1247_.modeMux = 1'b0;
defparam syn__1247_.FeedbackMux = 1'b0;
defparam syn__1247_.ShiftMux = 1'b0;
defparam syn__1247_.BypassEn = 1'b0;
defparam syn__1247_.CarryEnb = 1'b1;

alta_slice syn__1248_(
	.A(vcc),
	.B(\tc1.IM [7]),
	.C(IOaddr1[28]),
	.D(\tc1.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0900_),
	.Cout(),
	.Q());
defparam syn__1248_.coord_x = 5;
defparam syn__1248_.coord_y = 7;
defparam syn__1248_.coord_z = 9;
defparam syn__1248_.mask = 16'h33C3;
defparam syn__1248_.modeMux = 1'b0;
defparam syn__1248_.FeedbackMux = 1'b0;
defparam syn__1248_.ShiftMux = 1'b0;
defparam syn__1248_.BypassEn = 1'b0;
defparam syn__1248_.CarryEnb = 1'b1;

alta_slice syn__1249_(
	.A(IOvalue1[28]),
	.B(IOaddr1[28]),
	.C(vcc),
	.D(\tc1.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0901_),
	.Cout(),
	.Q());
defparam syn__1249_.coord_x = 5;
defparam syn__1249_.coord_y = 7;
defparam syn__1249_.coord_z = 14;
defparam syn__1249_.mask = 16'h3355;
defparam syn__1249_.modeMux = 1'b0;
defparam syn__1249_.FeedbackMux = 1'b0;
defparam syn__1249_.ShiftMux = 1'b0;
defparam syn__1249_.BypassEn = 1'b0;
defparam syn__1249_.CarryEnb = 1'b1;

alta_slice syn__1250_(
	.A(IOvalue1[30]),
	.B(IOaddr1[30]),
	.C(\tc1.IM [7]),
	.D(\tc1.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0902_),
	.Cout(),
	.Q());
defparam syn__1250_.coord_x = 5;
defparam syn__1250_.coord_y = 5;
defparam syn__1250_.coord_z = 10;
defparam syn__1250_.mask = 16'hC028;
defparam syn__1250_.modeMux = 1'b0;
defparam syn__1250_.FeedbackMux = 1'b0;
defparam syn__1250_.ShiftMux = 1'b0;
defparam syn__1250_.BypassEn = 1'b0;
defparam syn__1250_.CarryEnb = 1'b1;

alta_slice syn__1251_(
	.A(IOaddr1[30]),
	.B(IOvalue1[30]),
	.C(\tc1.IM [7]),
	.D(\tc1.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0903_),
	.Cout(),
	.Q());
defparam syn__1251_.coord_x = 5;
defparam syn__1251_.coord_y = 8;
defparam syn__1251_.coord_z = 14;
defparam syn__1251_.mask = 16'h5A96;
defparam syn__1251_.modeMux = 1'b0;
defparam syn__1251_.FeedbackMux = 1'b0;
defparam syn__1251_.ShiftMux = 1'b0;
defparam syn__1251_.BypassEn = 1'b0;
defparam syn__1251_.CarryEnb = 1'b1;

alta_slice syn__1252_(
	.A(IOvalue1[29]),
	.B(\tc1.IM [7]),
	.C(IOaddr1[29]),
	.D(\tc1.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0904_),
	.Cout(),
	.Q());
defparam syn__1252_.coord_x = 5;
defparam syn__1252_.coord_y = 7;
defparam syn__1252_.coord_z = 3;
defparam syn__1252_.mask = 16'hC028;
defparam syn__1252_.modeMux = 1'b0;
defparam syn__1252_.FeedbackMux = 1'b0;
defparam syn__1252_.ShiftMux = 1'b0;
defparam syn__1252_.BypassEn = 1'b0;
defparam syn__1252_.CarryEnb = 1'b1;

alta_slice syn__1253_(
	.A(IOvalue1[31]),
	.B(IOaddr1[31]),
	.C(syn__0906_),
	.D(syn__0908_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0905_),
	.Cout(),
	.Q());
defparam syn__1253_.coord_x = 6;
defparam syn__1253_.coord_y = 8;
defparam syn__1253_.coord_z = 7;
defparam syn__1253_.mask = 16'h090F;
defparam syn__1253_.modeMux = 1'b0;
defparam syn__1253_.FeedbackMux = 1'b0;
defparam syn__1253_.ShiftMux = 1'b0;
defparam syn__1253_.BypassEn = 1'b0;
defparam syn__1253_.CarryEnb = 1'b1;

alta_slice syn__1254_(
	.A(IOaddr1[31]),
	.B(IOvalue1[31]),
	.C(\tc1.IM [7]),
	.D(syn__0907_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0906_),
	.Cout(),
	.Q());
defparam syn__1254_.coord_x = 5;
defparam syn__1254_.coord_y = 8;
defparam syn__1254_.coord_z = 9;
defparam syn__1254_.mask = 16'hE800;
defparam syn__1254_.modeMux = 1'b0;
defparam syn__1254_.FeedbackMux = 1'b0;
defparam syn__1254_.ShiftMux = 1'b0;
defparam syn__1254_.BypassEn = 1'b0;
defparam syn__1254_.CarryEnb = 1'b1;

alta_slice syn__1255_(
	.A(vcc),
	.B(vcc),
	.C(\tc1.IM [9]),
	.D(\tc1.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0907_),
	.Cout(),
	.Q());
defparam syn__1255_.coord_x = 5;
defparam syn__1255_.coord_y = 8;
defparam syn__1255_.coord_z = 7;
defparam syn__1255_.mask = 16'h00F0;
defparam syn__1255_.modeMux = 1'b0;
defparam syn__1255_.FeedbackMux = 1'b0;
defparam syn__1255_.ShiftMux = 1'b0;
defparam syn__1255_.BypassEn = 1'b0;
defparam syn__1255_.CarryEnb = 1'b1;

alta_slice syn__1256_(
	.A(\tc1.IM [9]),
	.B(vcc),
	.C(\tc1.IM [7]),
	.D(\tc1.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0908_),
	.Cout(),
	.Q());
defparam syn__1256_.coord_x = 5;
defparam syn__1256_.coord_y = 8;
defparam syn__1256_.coord_z = 4;
defparam syn__1256_.mask = 16'hA000;
defparam syn__1256_.modeMux = 1'b0;
defparam syn__1256_.FeedbackMux = 1'b0;
defparam syn__1256_.ShiftMux = 1'b0;
defparam syn__1256_.BypassEn = 1'b0;
defparam syn__1256_.CarryEnb = 1'b1;

alta_slice syn__1257_(
	.A(IOaddr1[31]),
	.B(IOvalue1[31]),
	.C(\tc1.IM [8]),
	.D(\tc1.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0909_),
	.Cout(),
	.Q());
defparam syn__1257_.coord_x = 6;
defparam syn__1257_.coord_y = 6;
defparam syn__1257_.coord_z = 0;
defparam syn__1257_.mask = 16'hA659;
defparam syn__1257_.modeMux = 1'b0;
defparam syn__1257_.FeedbackMux = 1'b0;
defparam syn__1257_.ShiftMux = 1'b0;
defparam syn__1257_.BypassEn = 1'b0;
defparam syn__1257_.CarryEnb = 1'b1;

alta_slice syn__1258_(
	.A(vcc),
	.B(syn__0912_),
	.C(syn__0911_),
	.D(syn__0914_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0910_),
	.Cout(),
	.Q());
defparam syn__1258_.coord_x = 7;
defparam syn__1258_.coord_y = 8;
defparam syn__1258_.coord_z = 4;
defparam syn__1258_.mask = 16'hF300;
defparam syn__1258_.modeMux = 1'b0;
defparam syn__1258_.FeedbackMux = 1'b0;
defparam syn__1258_.ShiftMux = 1'b0;
defparam syn__1258_.BypassEn = 1'b0;
defparam syn__1258_.CarryEnb = 1'b1;

alta_slice syn__1259_(
	.A(syn__0825_),
	.B(syn__0904_),
	.C(syn__0903_),
	.D(\tc1.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0911_),
	.Cout(),
	.Q());
defparam syn__1259_.coord_x = 5;
defparam syn__1259_.coord_y = 7;
defparam syn__1259_.coord_z = 0;
defparam syn__1259_.mask = 16'h001E;
defparam syn__1259_.modeMux = 1'b0;
defparam syn__1259_.FeedbackMux = 1'b0;
defparam syn__1259_.ShiftMux = 1'b0;
defparam syn__1259_.BypassEn = 1'b0;
defparam syn__1259_.CarryEnb = 1'b1;

alta_slice syn__1260_(
	.A(IOvalue1[30]),
	.B(IOaddr1[30]),
	.C(syn__0908_),
	.D(syn__0913_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0912_),
	.Cout(),
	.Q());
defparam syn__1260_.coord_x = 7;
defparam syn__1260_.coord_y = 8;
defparam syn__1260_.coord_z = 5;
defparam syn__1260_.mask = 16'h009F;
defparam syn__1260_.modeMux = 1'b0;
defparam syn__1260_.FeedbackMux = 1'b0;
defparam syn__1260_.ShiftMux = 1'b0;
defparam syn__1260_.BypassEn = 1'b0;
defparam syn__1260_.CarryEnb = 1'b1;

alta_slice syn__1261_(
	.A(IOaddr1[30]),
	.B(IOvalue1[30]),
	.C(\tc1.IM [7]),
	.D(syn__0907_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0913_),
	.Cout(),
	.Q());
defparam syn__1261_.coord_x = 5;
defparam syn__1261_.coord_y = 8;
defparam syn__1261_.coord_z = 0;
defparam syn__1261_.mask = 16'hE800;
defparam syn__1261_.modeMux = 1'b0;
defparam syn__1261_.FeedbackMux = 1'b0;
defparam syn__1261_.ShiftMux = 1'b0;
defparam syn__1261_.BypassEn = 1'b0;
defparam syn__1261_.CarryEnb = 1'b1;

alta_slice syn__1262_(
	.A(vcc),
	.B(vcc),
	.C(\tc1.IM [6]),
	.D(\tc1.IM [5]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0914_),
	.Cout(),
	.Q());
defparam syn__1262_.coord_x = 8;
defparam syn__1262_.coord_y = 8;
defparam syn__1262_.coord_z = 13;
defparam syn__1262_.mask = 16'h000F;
defparam syn__1262_.modeMux = 1'b0;
defparam syn__1262_.FeedbackMux = 1'b0;
defparam syn__1262_.ShiftMux = 1'b0;
defparam syn__1262_.BypassEn = 1'b0;
defparam syn__1262_.CarryEnb = 1'b1;

alta_slice syn__1263_(
	.A(syn__0916_),
	.B(syn__0608_),
	.C(\tc1.IM [6]),
	.D(\tc1.IM [5]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0915_),
	.Cout(),
	.Q());
defparam syn__1263_.coord_x = 8;
defparam syn__1263_.coord_y = 7;
defparam syn__1263_.coord_z = 5;
defparam syn__1263_.mask = 16'hAFCF;
defparam syn__1263_.modeMux = 1'b0;
defparam syn__1263_.FeedbackMux = 1'b0;
defparam syn__1263_.ShiftMux = 1'b0;
defparam syn__1263_.BypassEn = 1'b0;
defparam syn__1263_.CarryEnb = 1'b1;

alta_slice syn__1264_(
	.A(syn__0918_),
	.B(syn__0917_),
	.C(syn__0869_),
	.D(\tc1.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0916_),
	.Cout(),
	.Q());
defparam syn__1264_.coord_x = 8;
defparam syn__1264_.coord_y = 5;
defparam syn__1264_.coord_z = 6;
defparam syn__1264_.mask = 16'hAA28;
defparam syn__1264_.modeMux = 1'b0;
defparam syn__1264_.FeedbackMux = 1'b0;
defparam syn__1264_.ShiftMux = 1'b0;
defparam syn__1264_.BypassEn = 1'b0;
defparam syn__1264_.CarryEnb = 1'b1;

alta_slice syn__1265_(
	.A(vcc),
	.B(syn__0836_),
	.C(syn__0870_),
	.D(syn__0871_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0917_),
	.Cout(),
	.Q());
defparam syn__1265_.coord_x = 7;
defparam syn__1265_.coord_y = 5;
defparam syn__1265_.coord_z = 12;
defparam syn__1265_.mask = 16'h0F0C;
defparam syn__1265_.modeMux = 1'b0;
defparam syn__1265_.FeedbackMux = 1'b0;
defparam syn__1265_.ShiftMux = 1'b0;
defparam syn__1265_.BypassEn = 1'b0;
defparam syn__1265_.CarryEnb = 1'b1;

alta_slice syn__1266_(
	.A(syn__0908_),
	.B(syn__0919_),
	.C(IOaddr1[14]),
	.D(IOvalue1[14]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0918_),
	.Cout(),
	.Q());
defparam syn__1266_.coord_x = 8;
defparam syn__1266_.coord_y = 5;
defparam syn__1266_.coord_z = 7;
defparam syn__1266_.mask = 16'h3113;
defparam syn__1266_.modeMux = 1'b0;
defparam syn__1266_.FeedbackMux = 1'b0;
defparam syn__1266_.ShiftMux = 1'b0;
defparam syn__1266_.BypassEn = 1'b0;
defparam syn__1266_.CarryEnb = 1'b1;

alta_slice syn__1267_(
	.A(IOaddr1[14]),
	.B(IOvalue1[14]),
	.C(\tc1.IM [7]),
	.D(syn__0907_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0919_),
	.Cout(),
	.Q());
defparam syn__1267_.coord_x = 8;
defparam syn__1267_.coord_y = 5;
defparam syn__1267_.coord_z = 1;
defparam syn__1267_.mask = 16'hE800;
defparam syn__1267_.modeMux = 1'b0;
defparam syn__1267_.FeedbackMux = 1'b0;
defparam syn__1267_.ShiftMux = 1'b0;
defparam syn__1267_.BypassEn = 1'b0;
defparam syn__1267_.CarryEnb = 1'b1;

alta_slice syn__1268_(
	.A(syn__0841_),
	.B(syn__0921_),
	.C(syn__0856_),
	.D(\tc1.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0920_),
	.Cout(),
	.Q());
defparam syn__1268_.coord_x = 12;
defparam syn__1268_.coord_y = 6;
defparam syn__1268_.coord_z = 3;
defparam syn__1268_.mask = 16'h0036;
defparam syn__1268_.modeMux = 1'b0;
defparam syn__1268_.FeedbackMux = 1'b0;
defparam syn__1268_.ShiftMux = 1'b0;
defparam syn__1268_.BypassEn = 1'b0;
defparam syn__1268_.CarryEnb = 1'b1;

alta_slice syn__1269_(
	.A(vcc),
	.B(vcc),
	.C(syn__0855_),
	.D(syn__0854_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0921_),
	.Cout(),
	.Q());
defparam syn__1269_.coord_x = 6;
defparam syn__1269_.coord_y = 6;
defparam syn__1269_.coord_z = 1;
defparam syn__1269_.mask = 16'h0FF0;
defparam syn__1269_.modeMux = 1'b0;
defparam syn__1269_.FeedbackMux = 1'b0;
defparam syn__1269_.ShiftMux = 1'b0;
defparam syn__1269_.BypassEn = 1'b0;
defparam syn__1269_.CarryEnb = 1'b1;

alta_slice syn__1270_(
	.A(vcc),
	.B(vcc),
	.C(\tc1.IM [6]),
	.D(\tc1.IM [5]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0922_),
	.Cout(),
	.Q());
defparam syn__1270_.coord_x = 8;
defparam syn__1270_.coord_y = 7;
defparam syn__1270_.coord_z = 13;
defparam syn__1270_.mask = 16'h0F00;
defparam syn__1270_.modeMux = 1'b0;
defparam syn__1270_.FeedbackMux = 1'b0;
defparam syn__1270_.ShiftMux = 1'b0;
defparam syn__1270_.BypassEn = 1'b0;
defparam syn__1270_.CarryEnb = 1'b1;

alta_slice syn__1271_(
	.A(syn__0922_),
	.B(syn__0924_),
	.C(syn__0911_),
	.D(syn__0912_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0923_),
	.Cout(),
	.Q());
defparam syn__1271_.coord_x = 7;
defparam syn__1271_.coord_y = 8;
defparam syn__1271_.coord_z = 1;
defparam syn__1271_.mask = 16'h4C44;
defparam syn__1271_.modeMux = 1'b0;
defparam syn__1271_.FeedbackMux = 1'b0;
defparam syn__1271_.ShiftMux = 1'b0;
defparam syn__1271_.BypassEn = 1'b0;
defparam syn__1271_.CarryEnb = 1'b1;

alta_slice syn__1272_(
	.A(vcc),
	.B(syn__0930_),
	.C(syn__0925_),
	.D(syn__0914_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0924_),
	.Cout(),
	.Q());
defparam syn__1272_.coord_x = 7;
defparam syn__1272_.coord_y = 8;
defparam syn__1272_.coord_z = 9;
defparam syn__1272_.mask = 16'hC0CC;
defparam syn__1272_.modeMux = 1'b0;
defparam syn__1272_.FeedbackMux = 1'b0;
defparam syn__1272_.ShiftMux = 1'b0;
defparam syn__1272_.BypassEn = 1'b0;
defparam syn__1272_.CarryEnb = 1'b1;

alta_slice syn__1273_(
	.A(syn__0928_),
	.B(vcc),
	.C(syn__0926_),
	.D(\tc1.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0925_),
	.Cout(),
	.Q());
defparam syn__1273_.coord_x = 6;
defparam syn__1273_.coord_y = 8;
defparam syn__1273_.coord_z = 0;
defparam syn__1273_.mask = 16'hAA0A;
defparam syn__1273_.modeMux = 1'b0;
defparam syn__1273_.FeedbackMux = 1'b0;
defparam syn__1273_.ShiftMux = 1'b0;
defparam syn__1273_.BypassEn = 1'b0;
defparam syn__1273_.CarryEnb = 1'b1;

alta_slice syn__1274_(
	.A(syn__0901_),
	.B(syn__0927_),
	.C(syn__0826_),
	.D(syn__0900_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0926_),
	.Cout(),
	.Q());
defparam syn__1274_.coord_x = 5;
defparam syn__1274_.coord_y = 7;
defparam syn__1274_.coord_z = 13;
defparam syn__1274_.mask = 16'hC993;
defparam syn__1274_.modeMux = 1'b0;
defparam syn__1274_.FeedbackMux = 1'b0;
defparam syn__1274_.ShiftMux = 1'b0;
defparam syn__1274_.BypassEn = 1'b0;
defparam syn__1274_.CarryEnb = 1'b1;

alta_slice syn__1275_(
	.A(vcc),
	.B(syn__0899_),
	.C(vcc),
	.D(syn__0904_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0927_),
	.Cout(),
	.Q());
defparam syn__1275_.coord_x = 5;
defparam syn__1275_.coord_y = 7;
defparam syn__1275_.coord_z = 15;
defparam syn__1275_.mask = 16'h0033;
defparam syn__1275_.modeMux = 1'b0;
defparam syn__1275_.FeedbackMux = 1'b0;
defparam syn__1275_.ShiftMux = 1'b0;
defparam syn__1275_.BypassEn = 1'b0;
defparam syn__1275_.CarryEnb = 1'b1;

alta_slice syn__1276_(
	.A(IOvalue1[29]),
	.B(IOaddr1[29]),
	.C(syn__0929_),
	.D(syn__0908_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0928_),
	.Cout(),
	.Q());
defparam syn__1276_.coord_x = 6;
defparam syn__1276_.coord_y = 8;
defparam syn__1276_.coord_z = 2;
defparam syn__1276_.mask = 16'h090F;
defparam syn__1276_.modeMux = 1'b0;
defparam syn__1276_.FeedbackMux = 1'b0;
defparam syn__1276_.ShiftMux = 1'b0;
defparam syn__1276_.BypassEn = 1'b0;
defparam syn__1276_.CarryEnb = 1'b1;

alta_slice syn__1277_(
	.A(IOaddr1[29]),
	.B(IOvalue1[29]),
	.C(\tc1.IM [7]),
	.D(syn__0907_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0929_),
	.Cout(),
	.Q());
defparam syn__1277_.coord_x = 5;
defparam syn__1277_.coord_y = 8;
defparam syn__1277_.coord_z = 11;
defparam syn__1277_.mask = 16'hE800;
defparam syn__1277_.modeMux = 1'b0;
defparam syn__1277_.FeedbackMux = 1'b0;
defparam syn__1277_.ShiftMux = 1'b0;
defparam syn__1277_.BypassEn = 1'b0;
defparam syn__1277_.CarryEnb = 1'b1;

alta_slice syn__1278_(
	.A(syn__0612_),
	.B(syn__0610_),
	.C(\tc1.IM [6]),
	.D(\tc1.IM [5]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0930_),
	.Cout(),
	.Q());
defparam syn__1278_.coord_x = 8;
defparam syn__1278_.coord_y = 7;
defparam syn__1278_.coord_z = 0;
defparam syn__1278_.mask = 16'hCFAF;
defparam syn__1278_.modeMux = 1'b0;
defparam syn__1278_.FeedbackMux = 1'b0;
defparam syn__1278_.ShiftMux = 1'b0;
defparam syn__1278_.BypassEn = 1'b0;
defparam syn__1278_.CarryEnb = 1'b1;

alta_slice syn__1279_(
	.A(vcc),
	.B(vcc),
	.C(syn__0870_),
	.D(syn__0871_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0931_),
	.Cout(),
	.Q());
defparam syn__1279_.coord_x = 7;
defparam syn__1279_.coord_y = 5;
defparam syn__1279_.coord_z = 6;
defparam syn__1279_.mask = 16'h000F;
defparam syn__1279_.modeMux = 1'b0;
defparam syn__1279_.FeedbackMux = 1'b0;
defparam syn__1279_.ShiftMux = 1'b0;
defparam syn__1279_.BypassEn = 1'b0;
defparam syn__1279_.CarryEnb = 1'b1;

alta_slice syn__1280_(
	.A(syn__0842_),
	.B(vcc),
	.C(syn__0853_),
	.D(syn__0852_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0932_),
	.Cout(),
	.Q());
defparam syn__1280_.coord_x = 12;
defparam syn__1280_.coord_y = 6;
defparam syn__1280_.coord_z = 9;
defparam syn__1280_.mask = 16'hFAA0;
defparam syn__1280_.modeMux = 1'b0;
defparam syn__1280_.FeedbackMux = 1'b0;
defparam syn__1280_.ShiftMux = 1'b0;
defparam syn__1280_.BypassEn = 1'b0;
defparam syn__1280_.CarryEnb = 1'b1;

alta_slice syn__1281_(
	.A(vcc),
	.B(vcc),
	.C(syn__0856_),
	.D(syn__0851_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0933_),
	.Cout(),
	.Q());
defparam syn__1281_.coord_x = 12;
defparam syn__1281_.coord_y = 6;
defparam syn__1281_.coord_z = 6;
defparam syn__1281_.mask = 16'h000F;
defparam syn__1281_.modeMux = 1'b0;
defparam syn__1281_.FeedbackMux = 1'b0;
defparam syn__1281_.ShiftMux = 1'b0;
defparam syn__1281_.BypassEn = 1'b0;
defparam syn__1281_.CarryEnb = 1'b1;

alta_slice syn__1282_(
	.A(syn__0935_),
	.B(syn__1043_),
	.C(syn__0662_),
	.D(syn__1036_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0934_),
	.Cout(),
	.Q());
defparam syn__1282_.coord_x = 6;
defparam syn__1282_.coord_y = 8;
defparam syn__1282_.coord_z = 6;
defparam syn__1282_.mask = 16'h8000;
defparam syn__1282_.modeMux = 1'b0;
defparam syn__1282_.FeedbackMux = 1'b0;
defparam syn__1282_.ShiftMux = 1'b0;
defparam syn__1282_.BypassEn = 1'b0;
defparam syn__1282_.CarryEnb = 1'b1;

alta_slice syn__1283_(
	.A(syn__0957_),
	.B(syn__0949_),
	.C(syn__0936_),
	.D(syn__1032_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0935_),
	.Cout(),
	.Q());
defparam syn__1283_.coord_x = 9;
defparam syn__1283_.coord_y = 7;
defparam syn__1283_.coord_z = 3;
defparam syn__1283_.mask = 16'h8000;
defparam syn__1283_.modeMux = 1'b0;
defparam syn__1283_.FeedbackMux = 1'b0;
defparam syn__1283_.ShiftMux = 1'b0;
defparam syn__1283_.BypassEn = 1'b0;
defparam syn__1283_.CarryEnb = 1'b1;

alta_slice syn__1284_(
	.A(syn__0938_),
	.B(syn__0943_),
	.C(syn__0614_),
	.D(syn__0922_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0936_),
	.Cout(),
	.Q());
defparam syn__1284_.coord_x = 9;
defparam syn__1284_.coord_y = 7;
defparam syn__1284_.coord_z = 8;
defparam syn__1284_.mask = 16'h4044;
defparam syn__1284_.modeMux = 1'b0;
defparam syn__1284_.FeedbackMux = 1'b0;
defparam syn__1284_.ShiftMux = 1'b0;
defparam syn__1284_.BypassEn = 1'b0;
defparam syn__1284_.CarryEnb = 1'b1;

alta_slice syn__1285_(
	.A(vcc),
	.B(vcc),
	.C(syn__0901_),
	.D(syn__0900_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0937_),
	.Cout(),
	.Q());
defparam syn__1285_.coord_x = 5;
defparam syn__1285_.coord_y = 7;
defparam syn__1285_.coord_z = 8;
defparam syn__1285_.mask = 16'h0FF0;
defparam syn__1285_.modeMux = 1'b0;
defparam syn__1285_.FeedbackMux = 1'b0;
defparam syn__1285_.ShiftMux = 1'b0;
defparam syn__1285_.BypassEn = 1'b0;
defparam syn__1285_.CarryEnb = 1'b1;

alta_slice syn__1286_(
	.A(vcc),
	.B(syn__0941_),
	.C(syn__0939_),
	.D(syn__0914_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0938_),
	.Cout(),
	.Q());
defparam syn__1286_.coord_x = 9;
defparam syn__1286_.coord_y = 7;
defparam syn__1286_.coord_z = 2;
defparam syn__1286_.mask = 16'hF300;
defparam syn__1286_.modeMux = 1'b0;
defparam syn__1286_.FeedbackMux = 1'b0;
defparam syn__1286_.ShiftMux = 1'b0;
defparam syn__1286_.BypassEn = 1'b0;
defparam syn__1286_.CarryEnb = 1'b1;

alta_slice syn__1287_(
	.A(syn__0898_),
	.B(\tc1.IM [9]),
	.C(syn__0827_),
	.D(syn__0940_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0939_),
	.Cout(),
	.Q());
defparam syn__1287_.coord_x = 5;
defparam syn__1287_.coord_y = 7;
defparam syn__1287_.coord_z = 7;
defparam syn__1287_.mask = 16'h0132;
defparam syn__1287_.modeMux = 1'b0;
defparam syn__1287_.FeedbackMux = 1'b0;
defparam syn__1287_.ShiftMux = 1'b0;
defparam syn__1287_.BypassEn = 1'b0;
defparam syn__1287_.CarryEnb = 1'b1;

alta_slice syn__1288_(
	.A(vcc),
	.B(syn__0897_),
	.C(vcc),
	.D(syn__0896_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0940_),
	.Cout(),
	.Q());
defparam syn__1288_.coord_x = 5;
defparam syn__1288_.coord_y = 7;
defparam syn__1288_.coord_z = 11;
defparam syn__1288_.mask = 16'h33CC;
defparam syn__1288_.modeMux = 1'b0;
defparam syn__1288_.FeedbackMux = 1'b0;
defparam syn__1288_.ShiftMux = 1'b0;
defparam syn__1288_.BypassEn = 1'b0;
defparam syn__1288_.CarryEnb = 1'b1;

alta_slice syn__1289_(
	.A(IOvalue1[27]),
	.B(IOaddr1[27]),
	.C(syn__0908_),
	.D(syn__0942_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0941_),
	.Cout(),
	.Q());
defparam syn__1289_.coord_x = 8;
defparam syn__1289_.coord_y = 5;
defparam syn__1289_.coord_z = 13;
defparam syn__1289_.mask = 16'h009F;
defparam syn__1289_.modeMux = 1'b0;
defparam syn__1289_.FeedbackMux = 1'b0;
defparam syn__1289_.ShiftMux = 1'b0;
defparam syn__1289_.BypassEn = 1'b0;
defparam syn__1289_.CarryEnb = 1'b1;

alta_slice syn__1290_(
	.A(IOaddr1[27]),
	.B(IOvalue1[27]),
	.C(\tc1.IM [7]),
	.D(syn__0907_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0942_),
	.Cout(),
	.Q());
defparam syn__1290_.coord_x = 5;
defparam syn__1290_.coord_y = 8;
defparam syn__1290_.coord_z = 6;
defparam syn__1290_.mask = 16'hE800;
defparam syn__1290_.modeMux = 1'b0;
defparam syn__1290_.FeedbackMux = 1'b0;
defparam syn__1290_.ShiftMux = 1'b0;
defparam syn__1290_.BypassEn = 1'b0;
defparam syn__1290_.CarryEnb = 1'b1;

alta_slice syn__1291_(
	.A(syn__0616_),
	.B(syn__0944_),
	.C(\tc1.IM [6]),
	.D(\tc1.IM [5]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0943_),
	.Cout(),
	.Q());
defparam syn__1291_.coord_x = 8;
defparam syn__1291_.coord_y = 7;
defparam syn__1291_.coord_z = 14;
defparam syn__1291_.mask = 16'hCFAF;
defparam syn__1291_.modeMux = 1'b0;
defparam syn__1291_.FeedbackMux = 1'b0;
defparam syn__1291_.ShiftMux = 1'b0;
defparam syn__1291_.BypassEn = 1'b0;
defparam syn__1291_.CarryEnb = 1'b1;

alta_slice syn__1292_(
	.A(syn__0945_),
	.B(syn__0946_),
	.C(syn__0863_),
	.D(\tc1.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0944_),
	.Cout(),
	.Q());
defparam syn__1292_.coord_x = 8;
defparam syn__1292_.coord_y = 5;
defparam syn__1292_.coord_z = 12;
defparam syn__1292_.mask = 16'hCC48;
defparam syn__1292_.modeMux = 1'b0;
defparam syn__1292_.FeedbackMux = 1'b0;
defparam syn__1292_.ShiftMux = 1'b0;
defparam syn__1292_.BypassEn = 1'b0;
defparam syn__1292_.CarryEnb = 1'b1;

alta_slice syn__1293_(
	.A(syn__0838_),
	.B(vcc),
	.C(syn__0865_),
	.D(syn__0864_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0945_),
	.Cout(),
	.Q());
defparam syn__1293_.coord_x = 7;
defparam syn__1293_.coord_y = 5;
defparam syn__1293_.coord_z = 11;
defparam syn__1293_.mask = 16'hFAA0;
defparam syn__1293_.modeMux = 1'b0;
defparam syn__1293_.FeedbackMux = 1'b0;
defparam syn__1293_.ShiftMux = 1'b0;
defparam syn__1293_.BypassEn = 1'b0;
defparam syn__1293_.CarryEnb = 1'b1;

alta_slice syn__1294_(
	.A(syn__0908_),
	.B(IOvalue1[11]),
	.C(IOaddr1[11]),
	.D(syn__0947_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0946_),
	.Cout(),
	.Q());
defparam syn__1294_.coord_x = 8;
defparam syn__1294_.coord_y = 5;
defparam syn__1294_.coord_z = 3;
defparam syn__1294_.mask = 16'h00D7;
defparam syn__1294_.modeMux = 1'b0;
defparam syn__1294_.FeedbackMux = 1'b0;
defparam syn__1294_.ShiftMux = 1'b0;
defparam syn__1294_.BypassEn = 1'b0;
defparam syn__1294_.CarryEnb = 1'b1;

alta_slice syn__1295_(
	.A(IOaddr1[11]),
	.B(IOvalue1[11]),
	.C(\tc1.IM [7]),
	.D(syn__0907_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0947_),
	.Cout(),
	.Q());
defparam syn__1295_.coord_x = 8;
defparam syn__1295_.coord_y = 5;
defparam syn__1295_.coord_z = 15;
defparam syn__1295_.mask = 16'hE800;
defparam syn__1295_.modeMux = 1'b0;
defparam syn__1295_.FeedbackMux = 1'b0;
defparam syn__1295_.ShiftMux = 1'b0;
defparam syn__1295_.BypassEn = 1'b0;
defparam syn__1295_.CarryEnb = 1'b1;

alta_slice syn__1296_(
	.A(syn__0843_),
	.B(syn__0850_),
	.C(\tc1.IM [9]),
	.D(syn__0849_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0948_),
	.Cout(),
	.Q());
defparam syn__1296_.coord_x = 11;
defparam syn__1296_.coord_y = 6;
defparam syn__1296_.coord_z = 5;
defparam syn__1296_.mask = 16'h0306;
defparam syn__1296_.modeMux = 1'b0;
defparam syn__1296_.FeedbackMux = 1'b0;
defparam syn__1296_.ShiftMux = 1'b0;
defparam syn__1296_.BypassEn = 1'b0;
defparam syn__1296_.CarryEnb = 1'b1;

alta_slice syn__1297_(
	.A(syn__0951_),
	.B(vcc),
	.C(syn__0950_),
	.D(syn__0956_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0949_),
	.Cout(),
	.Q());
defparam syn__1297_.coord_x = 9;
defparam syn__1297_.coord_y = 6;
defparam syn__1297_.coord_z = 1;
defparam syn__1297_.mask = 16'hA0AA;
defparam syn__1297_.modeMux = 1'b0;
defparam syn__1297_.FeedbackMux = 1'b0;
defparam syn__1297_.ShiftMux = 1'b0;
defparam syn__1297_.BypassEn = 1'b0;
defparam syn__1297_.CarryEnb = 1'b1;

alta_slice syn__1298_(
	.A(vcc),
	.B(vcc),
	.C(syn__0939_),
	.D(syn__0941_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0950_),
	.Cout(),
	.Q());
defparam syn__1298_.coord_x = 9;
defparam syn__1298_.coord_y = 7;
defparam syn__1298_.coord_z = 7;
defparam syn__1298_.mask = 16'h0F00;
defparam syn__1298_.modeMux = 1'b0;
defparam syn__1298_.FeedbackMux = 1'b0;
defparam syn__1298_.ShiftMux = 1'b0;
defparam syn__1298_.BypassEn = 1'b0;
defparam syn__1298_.CarryEnb = 1'b1;

alta_slice syn__1299_(
	.A(vcc),
	.B(syn__0618_),
	.C(syn__0953_),
	.D(syn__0922_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0951_),
	.Cout(),
	.Q());
defparam syn__1299_.coord_x = 9;
defparam syn__1299_.coord_y = 6;
defparam syn__1299_.coord_z = 10;
defparam syn__1299_.mask = 16'hC0F0;
defparam syn__1299_.modeMux = 1'b0;
defparam syn__1299_.FeedbackMux = 1'b0;
defparam syn__1299_.ShiftMux = 1'b0;
defparam syn__1299_.BypassEn = 1'b0;
defparam syn__1299_.CarryEnb = 1'b1;

alta_slice syn__1300_(
	.A(syn__0832_),
	.B(syn__0881_),
	.C(syn__0882_),
	.D(syn__0883_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0952_),
	.Cout(),
	.Q());
defparam syn__1300_.coord_x = 6;
defparam syn__1300_.coord_y = 7;
defparam syn__1300_.coord_z = 0;
defparam syn__1300_.mask = 16'h3C39;
defparam syn__1300_.modeMux = 1'b0;
defparam syn__1300_.FeedbackMux = 1'b0;
defparam syn__1300_.ShiftMux = 1'b0;
defparam syn__1300_.BypassEn = 1'b0;
defparam syn__1300_.CarryEnb = 1'b1;

alta_slice syn__1301_(
	.A(syn__0616_),
	.B(syn__0955_),
	.C(syn__0620_),
	.D(syn__0914_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0953_),
	.Cout(),
	.Q());
defparam syn__1301_.coord_x = 8;
defparam syn__1301_.coord_y = 8;
defparam syn__1301_.coord_z = 6;
defparam syn__1301_.mask = 16'hB0BB;
defparam syn__1301_.modeMux = 1'b0;
defparam syn__1301_.FeedbackMux = 1'b0;
defparam syn__1301_.ShiftMux = 1'b0;
defparam syn__1301_.BypassEn = 1'b0;
defparam syn__1301_.CarryEnb = 1'b1;

alta_slice syn__1302_(
	.A(vcc),
	.B(vcc),
	.C(syn__0882_),
	.D(syn__0883_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0954_),
	.Cout(),
	.Q());
defparam syn__1302_.coord_x = 6;
defparam syn__1302_.coord_y = 7;
defparam syn__1302_.coord_z = 4;
defparam syn__1302_.mask = 16'h000F;
defparam syn__1302_.modeMux = 1'b0;
defparam syn__1302_.FeedbackMux = 1'b0;
defparam syn__1302_.ShiftMux = 1'b0;
defparam syn__1302_.BypassEn = 1'b0;
defparam syn__1302_.CarryEnb = 1'b1;

alta_slice syn__1303_(
	.A(vcc),
	.B(vcc),
	.C(\tc1.IM [6]),
	.D(\tc1.IM [5]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0955_),
	.Cout(),
	.Q());
defparam syn__1303_.coord_x = 8;
defparam syn__1303_.coord_y = 8;
defparam syn__1303_.coord_z = 8;
defparam syn__1303_.mask = 16'hF000;
defparam syn__1303_.modeMux = 1'b0;
defparam syn__1303_.FeedbackMux = 1'b0;
defparam syn__1303_.ShiftMux = 1'b0;
defparam syn__1303_.BypassEn = 1'b0;
defparam syn__1303_.CarryEnb = 1'b1;

alta_slice syn__1304_(
	.A(vcc),
	.B(vcc),
	.C(\tc1.IM [6]),
	.D(\tc1.IM [5]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0956_),
	.Cout(),
	.Q());
defparam syn__1304_.coord_x = 8;
defparam syn__1304_.coord_y = 7;
defparam syn__1304_.coord_z = 12;
defparam syn__1304_.mask = 16'h00F0;
defparam syn__1304_.modeMux = 1'b0;
defparam syn__1304_.FeedbackMux = 1'b0;
defparam syn__1304_.ShiftMux = 1'b0;
defparam syn__1304_.BypassEn = 1'b0;
defparam syn__1304_.CarryEnb = 1'b1;

alta_slice syn__1305_(
	.A(syn__0622_),
	.B(syn__0964_),
	.C(syn__0656_),
	.D(syn__0658_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0957_),
	.Cout(),
	.Q());
defparam syn__1305_.coord_x = 9;
defparam syn__1305_.coord_y = 7;
defparam syn__1305_.coord_z = 10;
defparam syn__1305_.mask = 16'h8000;
defparam syn__1305_.modeMux = 1'b0;
defparam syn__1305_.FeedbackMux = 1'b0;
defparam syn__1305_.ShiftMux = 1'b0;
defparam syn__1305_.BypassEn = 1'b0;
defparam syn__1305_.CarryEnb = 1'b1;

alta_slice syn__1306_(
	.A(syn__0894_),
	.B(syn__0893_),
	.C(syn__0828_),
	.D(syn__0895_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0958_),
	.Cout(),
	.Q());
defparam syn__1306_.coord_x = 7;
defparam syn__1306_.coord_y = 7;
defparam syn__1306_.coord_z = 10;
defparam syn__1306_.mask = 16'hC993;
defparam syn__1306_.modeMux = 1'b0;
defparam syn__1306_.FeedbackMux = 1'b0;
defparam syn__1306_.ShiftMux = 1'b0;
defparam syn__1306_.BypassEn = 1'b0;
defparam syn__1306_.CarryEnb = 1'b1;

alta_slice syn__1307_(
	.A(syn__0879_),
	.B(\tc1.IM [9]),
	.C(syn__0961_),
	.D(syn__0960_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0959_),
	.Cout(),
	.Q());
defparam syn__1307_.coord_x = 6;
defparam syn__1307_.coord_y = 5;
defparam syn__1307_.coord_z = 13;
defparam syn__1307_.mask = 16'hD0E0;
defparam syn__1307_.modeMux = 1'b0;
defparam syn__1307_.FeedbackMux = 1'b0;
defparam syn__1307_.ShiftMux = 1'b0;
defparam syn__1307_.BypassEn = 1'b0;
defparam syn__1307_.CarryEnb = 1'b1;

alta_slice syn__1308_(
	.A(vcc),
	.B(vcc),
	.C(syn__0833_),
	.D(syn__0880_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0960_),
	.Cout(),
	.Q());
defparam syn__1308_.coord_x = 6;
defparam syn__1308_.coord_y = 5;
defparam syn__1308_.coord_z = 15;
defparam syn__1308_.mask = 16'h000F;
defparam syn__1308_.modeMux = 1'b0;
defparam syn__1308_.FeedbackMux = 1'b0;
defparam syn__1308_.ShiftMux = 1'b0;
defparam syn__1308_.BypassEn = 1'b0;
defparam syn__1308_.CarryEnb = 1'b1;

alta_slice syn__1309_(
	.A(IOvalue1[18]),
	.B(IOaddr1[18]),
	.C(syn__0908_),
	.D(syn__0962_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0961_),
	.Cout(),
	.Q());
defparam syn__1309_.coord_x = 8;
defparam syn__1309_.coord_y = 5;
defparam syn__1309_.coord_z = 0;
defparam syn__1309_.mask = 16'h009F;
defparam syn__1309_.modeMux = 1'b0;
defparam syn__1309_.FeedbackMux = 1'b0;
defparam syn__1309_.ShiftMux = 1'b0;
defparam syn__1309_.BypassEn = 1'b0;
defparam syn__1309_.CarryEnb = 1'b1;

alta_slice syn__1310_(
	.A(IOaddr1[18]),
	.B(IOvalue1[18]),
	.C(\tc1.IM [7]),
	.D(syn__0907_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0962_),
	.Cout(),
	.Q());
defparam syn__1310_.coord_x = 5;
defparam syn__1310_.coord_y = 8;
defparam syn__1310_.coord_z = 3;
defparam syn__1310_.mask = 16'hE800;
defparam syn__1310_.modeMux = 1'b0;
defparam syn__1310_.FeedbackMux = 1'b0;
defparam syn__1310_.ShiftMux = 1'b0;
defparam syn__1310_.BypassEn = 1'b0;
defparam syn__1310_.CarryEnb = 1'b1;

alta_slice syn__1311_(
	.A(vcc),
	.B(vcc),
	.C(syn__0864_),
	.D(syn__0865_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0963_),
	.Cout(),
	.Q());
defparam syn__1311_.coord_x = 9;
defparam syn__1311_.coord_y = 7;
defparam syn__1311_.coord_z = 14;
defparam syn__1311_.mask = 16'h0FF0;
defparam syn__1311_.modeMux = 1'b0;
defparam syn__1311_.FeedbackMux = 1'b0;
defparam syn__1311_.ShiftMux = 1'b0;
defparam syn__1311_.BypassEn = 1'b0;
defparam syn__1311_.CarryEnb = 1'b1;

alta_slice syn__1312_(
	.A(syn__1026_),
	.B(syn__0972_),
	.C(syn__0965_),
	.D(syn__1029_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0964_),
	.Cout(),
	.Q());
defparam syn__1312_.coord_x = 7;
defparam syn__1312_.coord_y = 6;
defparam syn__1312_.coord_z = 13;
defparam syn__1312_.mask = 16'h8000;
defparam syn__1312_.modeMux = 1'b0;
defparam syn__1312_.FeedbackMux = 1'b0;
defparam syn__1312_.ShiftMux = 1'b0;
defparam syn__1312_.BypassEn = 1'b0;
defparam syn__1312_.CarryEnb = 1'b1;

alta_slice syn__1313_(
	.A(vcc),
	.B(syn__0628_),
	.C(syn__0967_),
	.D(syn__0955_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0965_),
	.Cout(),
	.Q());
defparam syn__1313_.coord_x = 7;
defparam syn__1313_.coord_y = 6;
defparam syn__1313_.coord_z = 0;
defparam syn__1313_.mask = 16'hC0F0;
defparam syn__1313_.modeMux = 1'b0;
defparam syn__1313_.FeedbackMux = 1'b0;
defparam syn__1313_.ShiftMux = 1'b0;
defparam syn__1313_.BypassEn = 1'b0;
defparam syn__1313_.CarryEnb = 1'b1;

alta_slice syn__1314_(
	.A(vcc),
	.B(vcc),
	.C(syn__0894_),
	.D(syn__0895_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0966_),
	.Cout(),
	.Q());
defparam syn__1314_.coord_x = 5;
defparam syn__1314_.coord_y = 8;
defparam syn__1314_.coord_z = 13;
defparam syn__1314_.mask = 16'h0FF0;
defparam syn__1314_.modeMux = 1'b0;
defparam syn__1314_.FeedbackMux = 1'b0;
defparam syn__1314_.ShiftMux = 1'b0;
defparam syn__1314_.BypassEn = 1'b0;
defparam syn__1314_.CarryEnb = 1'b1;

alta_slice syn__1315_(
	.A(syn__0970_),
	.B(syn__0630_),
	.C(vcc),
	.D(syn__0956_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0967_),
	.Cout(),
	.Q());
defparam syn__1315_.coord_x = 7;
defparam syn__1315_.coord_y = 6;
defparam syn__1315_.coord_z = 14;
defparam syn__1315_.mask = 16'h88AA;
defparam syn__1315_.modeMux = 1'b0;
defparam syn__1315_.FeedbackMux = 1'b0;
defparam syn__1315_.ShiftMux = 1'b0;
defparam syn__1315_.BypassEn = 1'b0;
defparam syn__1315_.CarryEnb = 1'b1;

alta_slice syn__1316_(
	.A(syn__0834_),
	.B(vcc),
	.C(syn__0876_),
	.D(syn__0875_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0968_),
	.Cout(),
	.Q());
defparam syn__1316_.coord_x = 6;
defparam syn__1316_.coord_y = 5;
defparam syn__1316_.coord_z = 5;
defparam syn__1316_.mask = 16'hF550;
defparam syn__1316_.modeMux = 1'b0;
defparam syn__1316_.FeedbackMux = 1'b0;
defparam syn__1316_.ShiftMux = 1'b0;
defparam syn__1316_.BypassEn = 1'b0;
defparam syn__1316_.CarryEnb = 1'b1;

alta_slice syn__1317_(
	.A(vcc),
	.B(syn__0877_),
	.C(vcc),
	.D(syn__0880_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0969_),
	.Cout(),
	.Q());
defparam syn__1317_.coord_x = 6;
defparam syn__1317_.coord_y = 5;
defparam syn__1317_.coord_z = 2;
defparam syn__1317_.mask = 16'h0033;
defparam syn__1317_.modeMux = 1'b0;
defparam syn__1317_.FeedbackMux = 1'b0;
defparam syn__1317_.ShiftMux = 1'b0;
defparam syn__1317_.BypassEn = 1'b0;
defparam syn__1317_.CarryEnb = 1'b1;

alta_slice syn__1318_(
	.A(syn__0632_),
	.B(syn__0914_),
	.C(syn__0626_),
	.D(syn__0922_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0970_),
	.Cout(),
	.Q());
defparam syn__1318_.coord_x = 8;
defparam syn__1318_.coord_y = 6;
defparam syn__1318_.coord_z = 1;
defparam syn__1318_.mask = 16'hB0BB;
defparam syn__1318_.modeMux = 1'b0;
defparam syn__1318_.FeedbackMux = 1'b0;
defparam syn__1318_.ShiftMux = 1'b0;
defparam syn__1318_.BypassEn = 1'b0;
defparam syn__1318_.CarryEnb = 1'b1;

alta_slice syn__1319_(
	.A(syn__0861_),
	.B(syn__0862_),
	.C(syn__0839_),
	.D(\tc1.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0971_),
	.Cout(),
	.Q());
defparam syn__1319_.coord_x = 12;
defparam syn__1319_.coord_y = 5;
defparam syn__1319_.coord_z = 9;
defparam syn__1319_.mask = 16'h0036;
defparam syn__1319_.modeMux = 1'b0;
defparam syn__1319_.FeedbackMux = 1'b0;
defparam syn__1319_.ShiftMux = 1'b0;
defparam syn__1319_.BypassEn = 1'b0;
defparam syn__1319_.CarryEnb = 1'b1;

alta_slice syn__1320_(
	.A(syn__0996_),
	.B(syn__0984_),
	.C(syn__0636_),
	.D(syn__0973_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0972_),
	.Cout(),
	.Q());
defparam syn__1320_.coord_x = 7;
defparam syn__1320_.coord_y = 6;
defparam syn__1320_.coord_z = 15;
defparam syn__1320_.mask = 16'h8000;
defparam syn__1320_.modeMux = 1'b0;
defparam syn__1320_.FeedbackMux = 1'b0;
defparam syn__1320_.ShiftMux = 1'b0;
defparam syn__1320_.BypassEn = 1'b0;
defparam syn__1320_.CarryEnb = 1'b1;

alta_slice syn__1321_(
	.A(syn__0974_),
	.B(syn__0982_),
	.C(syn__0955_),
	.D(syn__0975_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0973_),
	.Cout(),
	.Q());
defparam syn__1321_.coord_x = 8;
defparam syn__1321_.coord_y = 8;
defparam syn__1321_.coord_z = 15;
defparam syn__1321_.mask = 16'h4F00;
defparam syn__1321_.modeMux = 1'b0;
defparam syn__1321_.FeedbackMux = 1'b0;
defparam syn__1321_.ShiftMux = 1'b0;
defparam syn__1321_.BypassEn = 1'b0;
defparam syn__1321_.CarryEnb = 1'b1;

alta_slice syn__1322_(
	.A(syn__0891_),
	.B(syn__0892_),
	.C(syn__0829_),
	.D(\tc1.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0974_),
	.Cout(),
	.Q());
defparam syn__1322_.coord_x = 7;
defparam syn__1322_.coord_y = 7;
defparam syn__1322_.coord_z = 5;
defparam syn__1322_.mask = 16'h00A9;
defparam syn__1322_.modeMux = 1'b0;
defparam syn__1322_.FeedbackMux = 1'b0;
defparam syn__1322_.ShiftMux = 1'b0;
defparam syn__1322_.BypassEn = 1'b0;
defparam syn__1322_.CarryEnb = 1'b1;

alta_slice syn__1323_(
	.A(vcc),
	.B(syn__0977_),
	.C(syn__0634_),
	.D(syn__0956_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0975_),
	.Cout(),
	.Q());
defparam syn__1323_.coord_x = 9;
defparam syn__1323_.coord_y = 6;
defparam syn__1323_.coord_z = 13;
defparam syn__1323_.mask = 16'hC0CC;
defparam syn__1323_.modeMux = 1'b0;
defparam syn__1323_.FeedbackMux = 1'b0;
defparam syn__1323_.ShiftMux = 1'b0;
defparam syn__1323_.BypassEn = 1'b0;
defparam syn__1323_.CarryEnb = 1'b1;

alta_slice syn__1324_(
	.A(vcc),
	.B(vcc),
	.C(syn__0876_),
	.D(syn__0875_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0976_),
	.Cout(),
	.Q());
defparam syn__1324_.coord_x = 6;
defparam syn__1324_.coord_y = 5;
defparam syn__1324_.coord_z = 0;
defparam syn__1324_.mask = 16'h0FF0;
defparam syn__1324_.modeMux = 1'b0;
defparam syn__1324_.FeedbackMux = 1'b0;
defparam syn__1324_.ShiftMux = 1'b0;
defparam syn__1324_.BypassEn = 1'b0;
defparam syn__1324_.CarryEnb = 1'b1;

alta_slice syn__1325_(
	.A(syn__0632_),
	.B(syn__0914_),
	.C(syn__0978_),
	.D(syn__0922_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0977_),
	.Cout(),
	.Q());
defparam syn__1325_.coord_x = 8;
defparam syn__1325_.coord_y = 6;
defparam syn__1325_.coord_z = 5;
defparam syn__1325_.mask = 16'hA2F3;
defparam syn__1325_.modeMux = 1'b0;
defparam syn__1325_.FeedbackMux = 1'b0;
defparam syn__1325_.ShiftMux = 1'b0;
defparam syn__1325_.BypassEn = 1'b0;
defparam syn__1325_.CarryEnb = 1'b1;

alta_slice syn__1326_(
	.A(syn__0980_),
	.B(syn__0857_),
	.C(syn__0979_),
	.D(\tc1.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0978_),
	.Cout(),
	.Q());
defparam syn__1326_.coord_x = 8;
defparam syn__1326_.coord_y = 6;
defparam syn__1326_.coord_z = 10;
defparam syn__1326_.mask = 16'hAA28;
defparam syn__1326_.modeMux = 1'b0;
defparam syn__1326_.FeedbackMux = 1'b0;
defparam syn__1326_.ShiftMux = 1'b0;
defparam syn__1326_.BypassEn = 1'b0;
defparam syn__1326_.CarryEnb = 1'b1;

alta_slice syn__1327_(
	.A(vcc),
	.B(syn__0859_),
	.C(syn__0858_),
	.D(syn__0840_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0979_),
	.Cout(),
	.Q());
defparam syn__1327_.coord_x = 12;
defparam syn__1327_.coord_y = 5;
defparam syn__1327_.coord_z = 2;
defparam syn__1327_.mask = 16'h0F0C;
defparam syn__1327_.modeMux = 1'b0;
defparam syn__1327_.FeedbackMux = 1'b0;
defparam syn__1327_.ShiftMux = 1'b0;
defparam syn__1327_.BypassEn = 1'b0;
defparam syn__1327_.CarryEnb = 1'b1;

alta_slice syn__1328_(
	.A(syn__0908_),
	.B(IOvalue1[8]),
	.C(IOaddr1[8]),
	.D(syn__0981_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0980_),
	.Cout(),
	.Q());
defparam syn__1328_.coord_x = 8;
defparam syn__1328_.coord_y = 5;
defparam syn__1328_.coord_z = 14;
defparam syn__1328_.mask = 16'h00D7;
defparam syn__1328_.modeMux = 1'b0;
defparam syn__1328_.FeedbackMux = 1'b0;
defparam syn__1328_.ShiftMux = 1'b0;
defparam syn__1328_.BypassEn = 1'b0;
defparam syn__1328_.CarryEnb = 1'b1;

alta_slice syn__1329_(
	.A(IOaddr1[8]),
	.B(IOvalue1[8]),
	.C(\tc1.IM [7]),
	.D(syn__0907_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0981_),
	.Cout(),
	.Q());
defparam syn__1329_.coord_x = 8;
defparam syn__1329_.coord_y = 5;
defparam syn__1329_.coord_z = 5;
defparam syn__1329_.mask = 16'hE800;
defparam syn__1329_.modeMux = 1'b0;
defparam syn__1329_.FeedbackMux = 1'b0;
defparam syn__1329_.ShiftMux = 1'b0;
defparam syn__1329_.BypassEn = 1'b0;
defparam syn__1329_.CarryEnb = 1'b1;

alta_slice syn__1330_(
	.A(IOvalue1[24]),
	.B(IOaddr1[24]),
	.C(syn__0908_),
	.D(syn__0983_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0982_),
	.Cout(),
	.Q());
defparam syn__1330_.coord_x = 7;
defparam syn__1330_.coord_y = 8;
defparam syn__1330_.coord_z = 15;
defparam syn__1330_.mask = 16'h009F;
defparam syn__1330_.modeMux = 1'b0;
defparam syn__1330_.FeedbackMux = 1'b0;
defparam syn__1330_.ShiftMux = 1'b0;
defparam syn__1330_.BypassEn = 1'b0;
defparam syn__1330_.CarryEnb = 1'b1;

alta_slice syn__1331_(
	.A(IOaddr1[24]),
	.B(IOvalue1[24]),
	.C(\tc1.IM [7]),
	.D(syn__0907_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0983_),
	.Cout(),
	.Q());
defparam syn__1331_.coord_x = 5;
defparam syn__1331_.coord_y = 8;
defparam syn__1331_.coord_z = 5;
defparam syn__1331_.mask = 16'hE800;
defparam syn__1331_.modeMux = 1'b0;
defparam syn__1331_.FeedbackMux = 1'b0;
defparam syn__1331_.ShiftMux = 1'b0;
defparam syn__1331_.BypassEn = 1'b0;
defparam syn__1331_.CarryEnb = 1'b1;

alta_slice syn__1332_(
	.A(syn__0985_),
	.B(syn__0982_),
	.C(syn__0956_),
	.D(syn__0974_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0984_),
	.Cout(),
	.Q());
defparam syn__1332_.coord_x = 7;
defparam syn__1332_.coord_y = 8;
defparam syn__1332_.coord_z = 11;
defparam syn__1332_.mask = 16'h0A8A;
defparam syn__1332_.modeMux = 1'b0;
defparam syn__1332_.FeedbackMux = 1'b0;
defparam syn__1332_.ShiftMux = 1'b0;
defparam syn__1332_.BypassEn = 1'b0;
defparam syn__1332_.CarryEnb = 1'b1;

alta_slice syn__1333_(
	.A(syn__0922_),
	.B(vcc),
	.C(syn__0630_),
	.D(syn__0986_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0985_),
	.Cout(),
	.Q());
defparam syn__1333_.coord_x = 7;
defparam syn__1333_.coord_y = 8;
defparam syn__1333_.coord_z = 10;
defparam syn__1333_.mask = 16'hF500;
defparam syn__1333_.modeMux = 1'b0;
defparam syn__1333_.FeedbackMux = 1'b0;
defparam syn__1333_.ShiftMux = 1'b0;
defparam syn__1333_.BypassEn = 1'b0;
defparam syn__1333_.CarryEnb = 1'b1;

alta_slice syn__1334_(
	.A(syn__0634_),
	.B(syn__0914_),
	.C(syn__0955_),
	.D(syn__0987_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0986_),
	.Cout(),
	.Q());
defparam syn__1334_.coord_x = 8;
defparam syn__1334_.coord_y = 8;
defparam syn__1334_.coord_z = 10;
defparam syn__1334_.mask = 16'hBB0B;
defparam syn__1334_.modeMux = 1'b0;
defparam syn__1334_.FeedbackMux = 1'b0;
defparam syn__1334_.ShiftMux = 1'b0;
defparam syn__1334_.BypassEn = 1'b0;
defparam syn__1334_.CarryEnb = 1'b1;

alta_slice syn__1335_(
	.A(syn__0990_),
	.B(syn__0988_),
	.C(\tc1.IM [9]),
	.D(syn__0846_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0987_),
	.Cout(),
	.Q());
defparam syn__1335_.coord_x = 9;
defparam syn__1335_.coord_y = 5;
defparam syn__1335_.coord_z = 1;
defparam syn__1335_.mask = 16'hCCC8;
defparam syn__1335_.modeMux = 1'b0;
defparam syn__1335_.FeedbackMux = 1'b0;
defparam syn__1335_.ShiftMux = 1'b0;
defparam syn__1335_.BypassEn = 1'b0;
defparam syn__1335_.CarryEnb = 1'b1;

alta_slice syn__1336_(
	.A(IOvalue1[0]),
	.B(syn__0989_),
	.C(syn__0908_),
	.D(IOaddr1[0]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0988_),
	.Cout(),
	.Q());
defparam syn__1336_.coord_x = 9;
defparam syn__1336_.coord_y = 5;
defparam syn__1336_.coord_z = 11;
defparam syn__1336_.mask = 16'h2313;
defparam syn__1336_.modeMux = 1'b0;
defparam syn__1336_.FeedbackMux = 1'b0;
defparam syn__1336_.ShiftMux = 1'b0;
defparam syn__1336_.BypassEn = 1'b0;
defparam syn__1336_.CarryEnb = 1'b1;

alta_slice syn__1337_(
	.A(IOvalue1[0]),
	.B(IOaddr1[0]),
	.C(\tc1.IM [7]),
	.D(syn__0907_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0989_),
	.Cout(),
	.Q());
defparam syn__1337_.coord_x = 9;
defparam syn__1337_.coord_y = 5;
defparam syn__1337_.coord_z = 13;
defparam syn__1337_.mask = 16'hE800;
defparam syn__1337_.modeMux = 1'b0;
defparam syn__1337_.FeedbackMux = 1'b0;
defparam syn__1337_.ShiftMux = 1'b0;
defparam syn__1337_.BypassEn = 1'b0;
defparam syn__1337_.CarryEnb = 1'b1;

alta_slice syn__1338_(
	.A(IOvalue1[0]),
	.B(IOaddr1[0]),
	.C(\tc1.IM [7]),
	.D(\tc1.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0990_),
	.Cout(),
	.Q());
defparam syn__1338_.coord_x = 9;
defparam syn__1338_.coord_y = 5;
defparam syn__1338_.coord_z = 10;
defparam syn__1338_.mask = 16'h0041;
defparam syn__1338_.modeMux = 1'b0;
defparam syn__1338_.FeedbackMux = 1'b0;
defparam syn__1338_.ShiftMux = 1'b0;
defparam syn__1338_.BypassEn = 1'b0;
defparam syn__1338_.CarryEnb = 1'b1;

alta_slice syn__1339_(
	.A(syn__0830_),
	.B(syn__0889_),
	.C(vcc),
	.D(syn__0888_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0991_),
	.Cout(),
	.Q());
defparam syn__1339_.coord_x = 6;
defparam syn__1339_.coord_y = 7;
defparam syn__1339_.coord_z = 3;
defparam syn__1339_.mask = 16'hEE88;
defparam syn__1339_.modeMux = 1'b0;
defparam syn__1339_.FeedbackMux = 1'b0;
defparam syn__1339_.ShiftMux = 1'b0;
defparam syn__1339_.BypassEn = 1'b0;
defparam syn__1339_.CarryEnb = 1'b1;

alta_slice syn__1340_(
	.A(vcc),
	.B(syn__0887_),
	.C(vcc),
	.D(syn__0892_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0992_),
	.Cout(),
	.Q());
defparam syn__1340_.coord_x = 7;
defparam syn__1340_.coord_y = 7;
defparam syn__1340_.coord_z = 2;
defparam syn__1340_.mask = 16'h0033;
defparam syn__1340_.modeMux = 1'b0;
defparam syn__1340_.FeedbackMux = 1'b0;
defparam syn__1340_.ShiftMux = 1'b0;
defparam syn__1340_.BypassEn = 1'b0;
defparam syn__1340_.CarryEnb = 1'b1;

alta_slice syn__1341_(
	.A(syn__0994_),
	.B(syn__0874_),
	.C(syn__0835_),
	.D(\tc1.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0993_),
	.Cout(),
	.Q());
defparam syn__1341_.coord_x = 12;
defparam syn__1341_.coord_y = 5;
defparam syn__1341_.coord_z = 15;
defparam syn__1341_.mask = 16'h0056;
defparam syn__1341_.modeMux = 1'b0;
defparam syn__1341_.FeedbackMux = 1'b0;
defparam syn__1341_.ShiftMux = 1'b0;
defparam syn__1341_.BypassEn = 1'b0;
defparam syn__1341_.CarryEnb = 1'b1;

alta_slice syn__1342_(
	.A(vcc),
	.B(vcc),
	.C(syn__0872_),
	.D(syn__0873_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0994_),
	.Cout(),
	.Q());
defparam syn__1342_.coord_x = 11;
defparam syn__1342_.coord_y = 5;
defparam syn__1342_.coord_z = 1;
defparam syn__1342_.mask = 16'h0FF0;
defparam syn__1342_.modeMux = 1'b0;
defparam syn__1342_.FeedbackMux = 1'b0;
defparam syn__1342_.ShiftMux = 1'b0;
defparam syn__1342_.BypassEn = 1'b0;
defparam syn__1342_.CarryEnb = 1'b1;

alta_slice syn__1343_(
	.A(vcc),
	.B(vcc),
	.C(syn__0858_),
	.D(syn__0859_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0995_),
	.Cout(),
	.Q());
defparam syn__1343_.coord_x = 12;
defparam syn__1343_.coord_y = 5;
defparam syn__1343_.coord_z = 13;
defparam syn__1343_.mask = 16'h000F;
defparam syn__1343_.modeMux = 1'b0;
defparam syn__1343_.FeedbackMux = 1'b0;
defparam syn__1343_.ShiftMux = 1'b0;
defparam syn__1343_.BypassEn = 1'b0;
defparam syn__1343_.CarryEnb = 1'b1;

alta_slice syn__1344_(
	.A(syn__1006_),
	.B(syn__1011_),
	.C(syn__1001_),
	.D(syn__0997_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0996_),
	.Cout(),
	.Q());
defparam syn__1344_.coord_x = 12;
defparam syn__1344_.coord_y = 7;
defparam syn__1344_.coord_z = 11;
defparam syn__1344_.mask = 16'h8000;
defparam syn__1344_.modeMux = 1'b0;
defparam syn__1344_.FeedbackMux = 1'b0;
defparam syn__1344_.ShiftMux = 1'b0;
defparam syn__1344_.BypassEn = 1'b0;
defparam syn__1344_.CarryEnb = 1'b1;

alta_slice syn__1345_(
	.A(vcc),
	.B(syn__0644_),
	.C(syn__0999_),
	.D(syn__0955_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0997_),
	.Cout(),
	.Q());
defparam syn__1345_.coord_x = 7;
defparam syn__1345_.coord_y = 6;
defparam syn__1345_.coord_z = 1;
defparam syn__1345_.mask = 16'hC0F0;
defparam syn__1345_.modeMux = 1'b0;
defparam syn__1345_.FeedbackMux = 1'b0;
defparam syn__1345_.ShiftMux = 1'b0;
defparam syn__1345_.BypassEn = 1'b0;
defparam syn__1345_.CarryEnb = 1'b1;

alta_slice syn__1346_(
	.A(vcc),
	.B(vcc),
	.C(syn__0888_),
	.D(syn__0889_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0998_),
	.Cout(),
	.Q());
defparam syn__1346_.coord_x = 7;
defparam syn__1346_.coord_y = 7;
defparam syn__1346_.coord_z = 14;
defparam syn__1346_.mask = 16'h0FF0;
defparam syn__1346_.modeMux = 1'b0;
defparam syn__1346_.FeedbackMux = 1'b0;
defparam syn__1346_.ShiftMux = 1'b0;
defparam syn__1346_.BypassEn = 1'b0;
defparam syn__1346_.CarryEnb = 1'b1;

alta_slice syn__1347_(
	.A(vcc),
	.B(syn__0916_),
	.C(syn__1000_),
	.D(syn__0956_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0999_),
	.Cout(),
	.Q());
defparam syn__1347_.coord_x = 7;
defparam syn__1347_.coord_y = 6;
defparam syn__1347_.coord_z = 10;
defparam syn__1347_.mask = 16'hC0F0;
defparam syn__1347_.modeMux = 1'b0;
defparam syn__1347_.FeedbackMux = 1'b0;
defparam syn__1347_.ShiftMux = 1'b0;
defparam syn__1347_.BypassEn = 1'b0;
defparam syn__1347_.CarryEnb = 1'b1;

alta_slice syn__1348_(
	.A(syn__0608_),
	.B(syn__0914_),
	.C(syn__0642_),
	.D(syn__0922_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1000_),
	.Cout(),
	.Q());
defparam syn__1348_.coord_x = 7;
defparam syn__1348_.coord_y = 6;
defparam syn__1348_.coord_z = 6;
defparam syn__1348_.mask = 16'hB0BB;
defparam syn__1348_.modeMux = 1'b0;
defparam syn__1348_.FeedbackMux = 1'b0;
defparam syn__1348_.ShiftMux = 1'b0;
defparam syn__1348_.BypassEn = 1'b0;
defparam syn__1348_.CarryEnb = 1'b1;

alta_slice syn__1349_(
	.A(vcc),
	.B(syn__0955_),
	.C(syn__0646_),
	.D(syn__1004_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1001_),
	.Cout(),
	.Q());
defparam syn__1349_.coord_x = 12;
defparam syn__1349_.coord_y = 7;
defparam syn__1349_.coord_z = 10;
defparam syn__1349_.mask = 16'hF300;
defparam syn__1349_.modeMux = 1'b0;
defparam syn__1349_.FeedbackMux = 1'b0;
defparam syn__1349_.ShiftMux = 1'b0;
defparam syn__1349_.BypassEn = 1'b0;
defparam syn__1349_.CarryEnb = 1'b1;

alta_slice syn__1350_(
	.A(vcc),
	.B(vcc),
	.C(syn__0886_),
	.D(syn__0831_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1002_),
	.Cout(),
	.Q());
defparam syn__1350_.coord_x = 6;
defparam syn__1350_.coord_y = 7;
defparam syn__1350_.coord_z = 11;
defparam syn__1350_.mask = 16'h000F;
defparam syn__1350_.modeMux = 1'b0;
defparam syn__1350_.FeedbackMux = 1'b0;
defparam syn__1350_.ShiftMux = 1'b0;
defparam syn__1350_.BypassEn = 1'b0;
defparam syn__1350_.CarryEnb = 1'b1;

alta_slice syn__1351_(
	.A(vcc),
	.B(vcc),
	.C(syn__0884_),
	.D(syn__0885_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1003_),
	.Cout(),
	.Q());
defparam syn__1351_.coord_x = 6;
defparam syn__1351_.coord_y = 7;
defparam syn__1351_.coord_z = 2;
defparam syn__1351_.mask = 16'h0FF0;
defparam syn__1351_.modeMux = 1'b0;
defparam syn__1351_.FeedbackMux = 1'b0;
defparam syn__1351_.ShiftMux = 1'b0;
defparam syn__1351_.BypassEn = 1'b0;
defparam syn__1351_.CarryEnb = 1'b1;

alta_slice syn__1352_(
	.A(vcc),
	.B(syn__1005_),
	.C(syn__0610_),
	.D(syn__0956_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1004_),
	.Cout(),
	.Q());
defparam syn__1352_.coord_x = 11;
defparam syn__1352_.coord_y = 7;
defparam syn__1352_.coord_z = 10;
defparam syn__1352_.mask = 16'hC0CC;
defparam syn__1352_.modeMux = 1'b0;
defparam syn__1352_.FeedbackMux = 1'b0;
defparam syn__1352_.ShiftMux = 1'b0;
defparam syn__1352_.BypassEn = 1'b0;
defparam syn__1352_.CarryEnb = 1'b1;

alta_slice syn__1353_(
	.A(syn__0608_),
	.B(syn__0914_),
	.C(syn__0612_),
	.D(syn__0922_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1005_),
	.Cout(),
	.Q());
defparam syn__1353_.coord_x = 7;
defparam syn__1353_.coord_y = 6;
defparam syn__1353_.coord_z = 8;
defparam syn__1353_.mask = 16'hA2F3;
defparam syn__1353_.modeMux = 1'b0;
defparam syn__1353_.FeedbackMux = 1'b0;
defparam syn__1353_.ShiftMux = 1'b0;
defparam syn__1353_.BypassEn = 1'b0;
defparam syn__1353_.CarryEnb = 1'b1;

alta_slice syn__1354_(
	.A(syn__0955_),
	.B(vcc),
	.C(syn__1007_),
	.D(syn__0618_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1006_),
	.Cout(),
	.Q());
defparam syn__1354_.coord_x = 8;
defparam syn__1354_.coord_y = 8;
defparam syn__1354_.coord_z = 4;
defparam syn__1354_.mask = 16'hF050;
defparam syn__1354_.modeMux = 1'b0;
defparam syn__1354_.FeedbackMux = 1'b0;
defparam syn__1354_.ShiftMux = 1'b0;
defparam syn__1354_.BypassEn = 1'b0;
defparam syn__1354_.CarryEnb = 1'b1;

alta_slice syn__1355_(
	.A(syn__1009_),
	.B(vcc),
	.C(syn__0648_),
	.D(syn__0956_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1007_),
	.Cout(),
	.Q());
defparam syn__1355_.coord_x = 9;
defparam syn__1355_.coord_y = 6;
defparam syn__1355_.coord_z = 9;
defparam syn__1355_.mask = 16'hA0AA;
defparam syn__1355_.modeMux = 1'b0;
defparam syn__1355_.FeedbackMux = 1'b0;
defparam syn__1355_.ShiftMux = 1'b0;
defparam syn__1355_.BypassEn = 1'b0;
defparam syn__1355_.CarryEnb = 1'b1;

alta_slice syn__1356_(
	.A(syn__0837_),
	.B(syn__0868_),
	.C(syn__0867_),
	.D(\tc1.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1008_),
	.Cout(),
	.Q());
defparam syn__1356_.coord_x = 7;
defparam syn__1356_.coord_y = 5;
defparam syn__1356_.coord_z = 9;
defparam syn__1356_.mask = 16'h001E;
defparam syn__1356_.modeMux = 1'b0;
defparam syn__1356_.FeedbackMux = 1'b0;
defparam syn__1356_.ShiftMux = 1'b0;
defparam syn__1356_.BypassEn = 1'b0;
defparam syn__1356_.CarryEnb = 1'b1;

alta_slice syn__1357_(
	.A(syn__0650_),
	.B(syn__0612_),
	.C(syn__0914_),
	.D(syn__0922_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1009_),
	.Cout(),
	.Q());
defparam syn__1357_.coord_x = 9;
defparam syn__1357_.coord_y = 6;
defparam syn__1357_.coord_z = 2;
defparam syn__1357_.mask = 16'h8CAF;
defparam syn__1357_.modeMux = 1'b0;
defparam syn__1357_.FeedbackMux = 1'b0;
defparam syn__1357_.ShiftMux = 1'b0;
defparam syn__1357_.BypassEn = 1'b0;
defparam syn__1357_.CarryEnb = 1'b1;

alta_slice syn__1358_(
	.A(vcc),
	.B(vcc),
	.C(syn__0853_),
	.D(syn__0852_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1010_),
	.Cout(),
	.Q());
defparam syn__1358_.coord_x = 12;
defparam syn__1358_.coord_y = 6;
defparam syn__1358_.coord_z = 4;
defparam syn__1358_.mask = 16'h0FF0;
defparam syn__1358_.modeMux = 1'b0;
defparam syn__1358_.FeedbackMux = 1'b0;
defparam syn__1358_.ShiftMux = 1'b0;
defparam syn__1358_.BypassEn = 1'b0;
defparam syn__1358_.CarryEnb = 1'b1;

alta_slice syn__1359_(
	.A(syn__1023_),
	.B(syn__1012_),
	.C(syn__1019_),
	.D(syn__1015_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1011_),
	.Cout(),
	.Q());
defparam syn__1359_.coord_x = 12;
defparam syn__1359_.coord_y = 7;
defparam syn__1359_.coord_z = 13;
defparam syn__1359_.mask = 16'h8000;
defparam syn__1359_.modeMux = 1'b0;
defparam syn__1359_.FeedbackMux = 1'b0;
defparam syn__1359_.ShiftMux = 1'b0;
defparam syn__1359_.BypassEn = 1'b0;
defparam syn__1359_.CarryEnb = 1'b1;

alta_slice syn__1360_(
	.A(syn__0620_),
	.B(vcc),
	.C(syn__0955_),
	.D(syn__1013_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1012_),
	.Cout(),
	.Q());
defparam syn__1360_.coord_x = 8;
defparam syn__1360_.coord_y = 8;
defparam syn__1360_.coord_z = 0;
defparam syn__1360_.mask = 16'hAF00;
defparam syn__1360_.modeMux = 1'b0;
defparam syn__1360_.FeedbackMux = 1'b0;
defparam syn__1360_.ShiftMux = 1'b0;
defparam syn__1360_.BypassEn = 1'b0;
defparam syn__1360_.CarryEnb = 1'b1;

alta_slice syn__1361_(
	.A(syn__1014_),
	.B(vcc),
	.C(syn__0944_),
	.D(syn__0956_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1013_),
	.Cout(),
	.Q());
defparam syn__1361_.coord_x = 9;
defparam syn__1361_.coord_y = 6;
defparam syn__1361_.coord_z = 8;
defparam syn__1361_.mask = 16'hA0AA;
defparam syn__1361_.modeMux = 1'b0;
defparam syn__1361_.FeedbackMux = 1'b0;
defparam syn__1361_.ShiftMux = 1'b0;
defparam syn__1361_.BypassEn = 1'b0;
defparam syn__1361_.CarryEnb = 1'b1;

alta_slice syn__1362_(
	.A(syn__0616_),
	.B(syn__0650_),
	.C(syn__0914_),
	.D(syn__0922_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1014_),
	.Cout(),
	.Q());
defparam syn__1362_.coord_x = 9;
defparam syn__1362_.coord_y = 6;
defparam syn__1362_.coord_z = 4;
defparam syn__1362_.mask = 16'h8CAF;
defparam syn__1362_.modeMux = 1'b0;
defparam syn__1362_.FeedbackMux = 1'b0;
defparam syn__1362_.ShiftMux = 1'b0;
defparam syn__1362_.BypassEn = 1'b0;
defparam syn__1362_.CarryEnb = 1'b1;

alta_slice syn__1363_(
	.A(syn__1016_),
	.B(syn__0959_),
	.C(vcc),
	.D(syn__0955_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1015_),
	.Cout(),
	.Q());
defparam syn__1363_.coord_x = 12;
defparam syn__1363_.coord_y = 7;
defparam syn__1363_.coord_z = 5;
defparam syn__1363_.mask = 16'h88AA;
defparam syn__1363_.modeMux = 1'b0;
defparam syn__1363_.FeedbackMux = 1'b0;
defparam syn__1363_.ShiftMux = 1'b0;
defparam syn__1363_.BypassEn = 1'b0;
defparam syn__1363_.CarryEnb = 1'b1;

alta_slice syn__1364_(
	.A(syn__1017_),
	.B(vcc),
	.C(syn__0626_),
	.D(syn__0956_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1016_),
	.Cout(),
	.Q());
defparam syn__1364_.coord_x = 9;
defparam syn__1364_.coord_y = 6;
defparam syn__1364_.coord_z = 7;
defparam syn__1364_.mask = 16'hA0AA;
defparam syn__1364_.modeMux = 1'b0;
defparam syn__1364_.FeedbackMux = 1'b0;
defparam syn__1364_.ShiftMux = 1'b0;
defparam syn__1364_.BypassEn = 1'b0;
defparam syn__1364_.CarryEnb = 1'b1;

alta_slice syn__1365_(
	.A(syn__0616_),
	.B(syn__0652_),
	.C(syn__0914_),
	.D(syn__0922_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1017_),
	.Cout(),
	.Q());
defparam syn__1365_.coord_x = 9;
defparam syn__1365_.coord_y = 6;
defparam syn__1365_.coord_z = 14;
defparam syn__1365_.mask = 16'h8ACF;
defparam syn__1365_.modeMux = 1'b0;
defparam syn__1365_.FeedbackMux = 1'b0;
defparam syn__1365_.ShiftMux = 1'b0;
defparam syn__1365_.BypassEn = 1'b0;
defparam syn__1365_.CarryEnb = 1'b1;

alta_slice syn__1366_(
	.A(syn__0844_),
	.B(syn__0847_),
	.C(syn__0846_),
	.D(syn__0845_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1018_),
	.Cout(),
	.Q());
defparam syn__1366_.coord_x = 11;
defparam syn__1366_.coord_y = 6;
defparam syn__1366_.coord_z = 13;
defparam syn__1366_.mask = 16'h9C39;
defparam syn__1366_.modeMux = 1'b0;
defparam syn__1366_.FeedbackMux = 1'b0;
defparam syn__1366_.ShiftMux = 1'b0;
defparam syn__1366_.BypassEn = 1'b0;
defparam syn__1366_.CarryEnb = 1'b1;

alta_slice syn__1367_(
	.A(syn__1020_),
	.B(vcc),
	.C(syn__0955_),
	.D(syn__0630_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1019_),
	.Cout(),
	.Q());
defparam syn__1367_.coord_x = 8;
defparam syn__1367_.coord_y = 8;
defparam syn__1367_.coord_z = 1;
defparam syn__1367_.mask = 16'hAA0A;
defparam syn__1367_.modeMux = 1'b0;
defparam syn__1367_.FeedbackMux = 1'b0;
defparam syn__1367_.ShiftMux = 1'b0;
defparam syn__1367_.BypassEn = 1'b0;
defparam syn__1367_.CarryEnb = 1'b1;

alta_slice syn__1368_(
	.A(syn__1021_),
	.B(vcc),
	.C(syn__0632_),
	.D(syn__0956_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1020_),
	.Cout(),
	.Q());
defparam syn__1368_.coord_x = 8;
defparam syn__1368_.coord_y = 6;
defparam syn__1368_.coord_z = 15;
defparam syn__1368_.mask = 16'hA0AA;
defparam syn__1368_.modeMux = 1'b0;
defparam syn__1368_.FeedbackMux = 1'b0;
defparam syn__1368_.ShiftMux = 1'b0;
defparam syn__1368_.BypassEn = 1'b0;
defparam syn__1368_.CarryEnb = 1'b1;

alta_slice syn__1369_(
	.A(syn__0654_),
	.B(syn__0922_),
	.C(syn__0652_),
	.D(syn__0914_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1021_),
	.Cout(),
	.Q());
defparam syn__1369_.coord_x = 8;
defparam syn__1369_.coord_y = 6;
defparam syn__1369_.coord_z = 0;
defparam syn__1369_.mask = 16'hA2F3;
defparam syn__1369_.modeMux = 1'b0;
defparam syn__1369_.FeedbackMux = 1'b0;
defparam syn__1369_.ShiftMux = 1'b0;
defparam syn__1369_.BypassEn = 1'b0;
defparam syn__1369_.CarryEnb = 1'b1;

alta_slice syn__1370_(
	.A(vcc),
	.B(vcc),
	.C(syn__0844_),
	.D(syn__0845_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1022_),
	.Cout(),
	.Q());
defparam syn__1370_.coord_x = 11;
defparam syn__1370_.coord_y = 6;
defparam syn__1370_.coord_z = 10;
defparam syn__1370_.mask = 16'h0FF0;
defparam syn__1370_.modeMux = 1'b0;
defparam syn__1370_.FeedbackMux = 1'b0;
defparam syn__1370_.ShiftMux = 1'b0;
defparam syn__1370_.BypassEn = 1'b0;
defparam syn__1370_.CarryEnb = 1'b1;

alta_slice syn__1371_(
	.A(syn__0634_),
	.B(vcc),
	.C(syn__0955_),
	.D(syn__1024_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1023_),
	.Cout(),
	.Q());
defparam syn__1371_.coord_x = 8;
defparam syn__1371_.coord_y = 8;
defparam syn__1371_.coord_z = 5;
defparam syn__1371_.mask = 16'hAF00;
defparam syn__1371_.modeMux = 1'b0;
defparam syn__1371_.FeedbackMux = 1'b0;
defparam syn__1371_.ShiftMux = 1'b0;
defparam syn__1371_.BypassEn = 1'b0;
defparam syn__1371_.CarryEnb = 1'b1;

alta_slice syn__1372_(
	.A(syn__1025_),
	.B(vcc),
	.C(syn__0978_),
	.D(syn__0956_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1024_),
	.Cout(),
	.Q());
defparam syn__1372_.coord_x = 8;
defparam syn__1372_.coord_y = 6;
defparam syn__1372_.coord_z = 3;
defparam syn__1372_.mask = 16'hA0AA;
defparam syn__1372_.modeMux = 1'b0;
defparam syn__1372_.FeedbackMux = 1'b0;
defparam syn__1372_.ShiftMux = 1'b0;
defparam syn__1372_.BypassEn = 1'b0;
defparam syn__1372_.CarryEnb = 1'b1;

alta_slice syn__1373_(
	.A(syn__0654_),
	.B(syn__0914_),
	.C(syn__0987_),
	.D(syn__0922_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1025_),
	.Cout(),
	.Q());
defparam syn__1373_.coord_x = 8;
defparam syn__1373_.coord_y = 6;
defparam syn__1373_.coord_z = 8;
defparam syn__1373_.mask = 16'hA2F3;
defparam syn__1373_.modeMux = 1'b0;
defparam syn__1373_.FeedbackMux = 1'b0;
defparam syn__1373_.ShiftMux = 1'b0;
defparam syn__1373_.BypassEn = 1'b0;
defparam syn__1373_.CarryEnb = 1'b1;

alta_slice syn__1374_(
	.A(vcc),
	.B(syn__0628_),
	.C(syn__1027_),
	.D(syn__0956_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1026_),
	.Cout(),
	.Q());
defparam syn__1374_.coord_x = 7;
defparam syn__1374_.coord_y = 6;
defparam syn__1374_.coord_z = 4;
defparam syn__1374_.mask = 16'hC0F0;
defparam syn__1374_.modeMux = 1'b0;
defparam syn__1374_.FeedbackMux = 1'b0;
defparam syn__1374_.ShiftMux = 1'b0;
defparam syn__1374_.BypassEn = 1'b0;
defparam syn__1374_.CarryEnb = 1'b1;

alta_slice syn__1375_(
	.A(syn__1028_),
	.B(vcc),
	.C(syn__0959_),
	.D(syn__0922_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1027_),
	.Cout(),
	.Q());
defparam syn__1375_.coord_x = 9;
defparam syn__1375_.coord_y = 7;
defparam syn__1375_.coord_z = 13;
defparam syn__1375_.mask = 16'hA0AA;
defparam syn__1375_.modeMux = 1'b0;
defparam syn__1375_.FeedbackMux = 1'b0;
defparam syn__1375_.ShiftMux = 1'b0;
defparam syn__1375_.BypassEn = 1'b0;
defparam syn__1375_.CarryEnb = 1'b1;

alta_slice syn__1376_(
	.A(syn__0654_),
	.B(syn__0630_),
	.C(syn__0955_),
	.D(syn__0914_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1028_),
	.Cout(),
	.Q());
defparam syn__1376_.coord_x = 8;
defparam syn__1376_.coord_y = 8;
defparam syn__1376_.coord_z = 9;
defparam syn__1376_.mask = 16'h8CAF;
defparam syn__1376_.modeMux = 1'b0;
defparam syn__1376_.FeedbackMux = 1'b0;
defparam syn__1376_.ShiftMux = 1'b0;
defparam syn__1376_.BypassEn = 1'b0;
defparam syn__1376_.CarryEnb = 1'b1;

alta_slice syn__1377_(
	.A(syn__1031_),
	.B(syn__0922_),
	.C(syn__1030_),
	.D(syn__0628_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1029_),
	.Cout(),
	.Q());
defparam syn__1377_.coord_x = 7;
defparam syn__1377_.coord_y = 6;
defparam syn__1377_.coord_z = 7;
defparam syn__1377_.mask = 16'h0A02;
defparam syn__1377_.modeMux = 1'b0;
defparam syn__1377_.FeedbackMux = 1'b0;
defparam syn__1377_.ShiftMux = 1'b0;
defparam syn__1377_.BypassEn = 1'b0;
defparam syn__1377_.CarryEnb = 1'b1;

alta_slice syn__1378_(
	.A(vcc),
	.B(syn__0982_),
	.C(syn__0974_),
	.D(syn__0914_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1030_),
	.Cout(),
	.Q());
defparam syn__1378_.coord_x = 8;
defparam syn__1378_.coord_y = 8;
defparam syn__1378_.coord_z = 12;
defparam syn__1378_.mask = 16'hF300;
defparam syn__1378_.modeMux = 1'b0;
defparam syn__1378_.FeedbackMux = 1'b0;
defparam syn__1378_.ShiftMux = 1'b0;
defparam syn__1378_.BypassEn = 1'b0;
defparam syn__1378_.CarryEnb = 1'b1;

alta_slice syn__1379_(
	.A(syn__0978_),
	.B(syn__0987_),
	.C(\tc1.IM [6]),
	.D(\tc1.IM [5]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1031_),
	.Cout(),
	.Q());
defparam syn__1379_.coord_x = 8;
defparam syn__1379_.coord_y = 6;
defparam syn__1379_.coord_z = 11;
defparam syn__1379_.mask = 16'hAFCF;
defparam syn__1379_.modeMux = 1'b0;
defparam syn__1379_.FeedbackMux = 1'b0;
defparam syn__1379_.ShiftMux = 1'b0;
defparam syn__1379_.BypassEn = 1'b0;
defparam syn__1379_.CarryEnb = 1'b1;

alta_slice syn__1380_(
	.A(syn__1033_),
	.B(syn__0950_),
	.C(syn__0660_),
	.D(syn__0922_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1032_),
	.Cout(),
	.Q());
defparam syn__1380_.coord_x = 9;
defparam syn__1380_.coord_y = 7;
defparam syn__1380_.coord_z = 15;
defparam syn__1380_.mask = 16'h80A0;
defparam syn__1380_.modeMux = 1'b0;
defparam syn__1380_.FeedbackMux = 1'b0;
defparam syn__1380_.ShiftMux = 1'b0;
defparam syn__1380_.BypassEn = 1'b0;
defparam syn__1380_.CarryEnb = 1'b1;

alta_slice syn__1381_(
	.A(syn__1034_),
	.B(syn__0941_),
	.C(syn__0939_),
	.D(syn__0955_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1033_),
	.Cout(),
	.Q());
defparam syn__1381_.coord_x = 9;
defparam syn__1381_.coord_y = 7;
defparam syn__1381_.coord_z = 0;
defparam syn__1381_.mask = 16'h08AA;
defparam syn__1381_.modeMux = 1'b0;
defparam syn__1381_.FeedbackMux = 1'b0;
defparam syn__1381_.ShiftMux = 1'b0;
defparam syn__1381_.BypassEn = 1'b0;
defparam syn__1381_.CarryEnb = 1'b1;

alta_slice syn__1382_(
	.A(vcc),
	.B(syn__1035_),
	.C(syn__0620_),
	.D(syn__0956_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1034_),
	.Cout(),
	.Q());
defparam syn__1382_.coord_x = 9;
defparam syn__1382_.coord_y = 6;
defparam syn__1382_.coord_z = 15;
defparam syn__1382_.mask = 16'hC0CC;
defparam syn__1382_.modeMux = 1'b0;
defparam syn__1382_.FeedbackMux = 1'b0;
defparam syn__1382_.ShiftMux = 1'b0;
defparam syn__1382_.BypassEn = 1'b0;
defparam syn__1382_.CarryEnb = 1'b1;

alta_slice syn__1383_(
	.A(syn__0944_),
	.B(syn__0648_),
	.C(syn__0922_),
	.D(syn__0914_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1035_),
	.Cout(),
	.Q());
defparam syn__1383_.coord_x = 8;
defparam syn__1383_.coord_y = 6;
defparam syn__1383_.coord_z = 4;
defparam syn__1383_.mask = 16'h8ACF;
defparam syn__1383_.modeMux = 1'b0;
defparam syn__1383_.FeedbackMux = 1'b0;
defparam syn__1383_.ShiftMux = 1'b0;
defparam syn__1383_.BypassEn = 1'b0;
defparam syn__1383_.CarryEnb = 1'b1;

alta_slice syn__1384_(
	.A(vcc),
	.B(vcc),
	.C(syn__1037_),
	.D(syn__1040_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1036_),
	.Cout(),
	.Q());
defparam syn__1384_.coord_x = 9;
defparam syn__1384_.coord_y = 6;
defparam syn__1384_.coord_z = 3;
defparam syn__1384_.mask = 16'hF000;
defparam syn__1384_.modeMux = 1'b0;
defparam syn__1384_.FeedbackMux = 1'b0;
defparam syn__1384_.ShiftMux = 1'b0;
defparam syn__1384_.BypassEn = 1'b0;
defparam syn__1384_.CarryEnb = 1'b1;

alta_slice syn__1385_(
	.A(vcc),
	.B(syn__0614_),
	.C(syn__1038_),
	.D(syn__0956_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1037_),
	.Cout(),
	.Q());
defparam syn__1385_.coord_x = 9;
defparam syn__1385_.coord_y = 6;
defparam syn__1385_.coord_z = 0;
defparam syn__1385_.mask = 16'hC0F0;
defparam syn__1385_.modeMux = 1'b0;
defparam syn__1385_.FeedbackMux = 1'b0;
defparam syn__1385_.ShiftMux = 1'b0;
defparam syn__1385_.BypassEn = 1'b0;
defparam syn__1385_.CarryEnb = 1'b1;

alta_slice syn__1386_(
	.A(vcc),
	.B(syn__0646_),
	.C(syn__1039_),
	.D(syn__0922_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1038_),
	.Cout(),
	.Q());
defparam syn__1386_.coord_x = 9;
defparam syn__1386_.coord_y = 6;
defparam syn__1386_.coord_z = 12;
defparam syn__1386_.mask = 16'hC0F0;
defparam syn__1386_.modeMux = 1'b0;
defparam syn__1386_.FeedbackMux = 1'b0;
defparam syn__1386_.ShiftMux = 1'b0;
defparam syn__1386_.BypassEn = 1'b0;
defparam syn__1386_.CarryEnb = 1'b1;

alta_slice syn__1387_(
	.A(syn__0650_),
	.B(syn__0914_),
	.C(syn__0955_),
	.D(syn__0618_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1039_),
	.Cout(),
	.Q());
defparam syn__1387_.coord_x = 8;
defparam syn__1387_.coord_y = 8;
defparam syn__1387_.coord_z = 7;
defparam syn__1387_.mask = 16'hAF23;
defparam syn__1387_.modeMux = 1'b0;
defparam syn__1387_.FeedbackMux = 1'b0;
defparam syn__1387_.ShiftMux = 1'b0;
defparam syn__1387_.BypassEn = 1'b0;
defparam syn__1387_.CarryEnb = 1'b1;

alta_slice syn__1388_(
	.A(syn__1041_),
	.B(syn__0614_),
	.C(syn__0955_),
	.D(vcc),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1040_),
	.Cout(),
	.Q());
defparam syn__1388_.coord_x = 9;
defparam syn__1388_.coord_y = 6;
defparam syn__1388_.coord_z = 11;
defparam syn__1388_.mask = 16'h8A8A;
defparam syn__1388_.modeMux = 1'b0;
defparam syn__1388_.FeedbackMux = 1'b0;
defparam syn__1388_.ShiftMux = 1'b0;
defparam syn__1388_.BypassEn = 1'b0;
defparam syn__1388_.CarryEnb = 1'b1;

alta_slice syn__1389_(
	.A(vcc),
	.B(syn__0618_),
	.C(syn__1042_),
	.D(syn__0956_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1041_),
	.Cout(),
	.Q());
defparam syn__1389_.coord_x = 8;
defparam syn__1389_.coord_y = 6;
defparam syn__1389_.coord_z = 9;
defparam syn__1389_.mask = 16'hC0F0;
defparam syn__1389_.modeMux = 1'b0;
defparam syn__1389_.FeedbackMux = 1'b0;
defparam syn__1389_.ShiftMux = 1'b0;
defparam syn__1389_.BypassEn = 1'b0;
defparam syn__1389_.CarryEnb = 1'b1;

alta_slice syn__1390_(
	.A(syn__0922_),
	.B(syn__0914_),
	.C(syn__0610_),
	.D(syn__0648_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1042_),
	.Cout(),
	.Q());
defparam syn__1390_.coord_x = 8;
defparam syn__1390_.coord_y = 6;
defparam syn__1390_.coord_z = 14;
defparam syn__1390_.mask = 16'hF531;
defparam syn__1390_.modeMux = 1'b0;
defparam syn__1390_.FeedbackMux = 1'b0;
defparam syn__1390_.ShiftMux = 1'b0;
defparam syn__1390_.BypassEn = 1'b0;
defparam syn__1390_.CarryEnb = 1'b1;

alta_slice syn__1391_(
	.A(syn__1044_),
	.B(syn__1045_),
	.C(syn__0664_),
	.D(syn__1046_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1043_),
	.Cout(),
	.Q());
defparam syn__1391_.coord_x = 6;
defparam syn__1391_.coord_y = 8;
defparam syn__1391_.coord_z = 5;
defparam syn__1391_.mask = 16'h1000;
defparam syn__1391_.modeMux = 1'b0;
defparam syn__1391_.FeedbackMux = 1'b0;
defparam syn__1391_.ShiftMux = 1'b0;
defparam syn__1391_.BypassEn = 1'b0;
defparam syn__1391_.CarryEnb = 1'b1;

alta_slice syn__1392_(
	.A(syn__0928_),
	.B(syn__0956_),
	.C(syn__0926_),
	.D(\tc1.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1044_),
	.Cout(),
	.Q());
defparam syn__1392_.coord_x = 6;
defparam syn__1392_.coord_y = 8;
defparam syn__1392_.coord_z = 8;
defparam syn__1392_.mask = 16'h44C4;
defparam syn__1392_.modeMux = 1'b0;
defparam syn__1392_.FeedbackMux = 1'b0;
defparam syn__1392_.ShiftMux = 1'b0;
defparam syn__1392_.BypassEn = 1'b0;
defparam syn__1392_.CarryEnb = 1'b1;

alta_slice syn__1393_(
	.A(syn__0928_),
	.B(syn__0922_),
	.C(syn__0926_),
	.D(\tc1.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1045_),
	.Cout(),
	.Q());
defparam syn__1393_.coord_x = 6;
defparam syn__1393_.coord_y = 8;
defparam syn__1393_.coord_z = 11;
defparam syn__1393_.mask = 16'h44C4;
defparam syn__1393_.modeMux = 1'b0;
defparam syn__1393_.FeedbackMux = 1'b0;
defparam syn__1393_.ShiftMux = 1'b0;
defparam syn__1393_.BypassEn = 1'b0;
defparam syn__1393_.CarryEnb = 1'b1;

alta_slice syn__1394_(
	.A(syn__1047_),
	.B(vcc),
	.C(syn__0955_),
	.D(syn__0612_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1046_),
	.Cout(),
	.Q());
defparam syn__1394_.coord_x = 8;
defparam syn__1394_.coord_y = 8;
defparam syn__1394_.coord_z = 14;
defparam syn__1394_.mask = 16'hAA0A;
defparam syn__1394_.modeMux = 1'b0;
defparam syn__1394_.FeedbackMux = 1'b0;
defparam syn__1394_.ShiftMux = 1'b0;
defparam syn__1394_.BypassEn = 1'b0;
defparam syn__1394_.CarryEnb = 1'b1;

alta_slice syn__1395_(
	.A(syn__0644_),
	.B(syn__0646_),
	.C(\tc1.IM [6]),
	.D(\tc1.IM [5]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1047_),
	.Cout(),
	.Q());
defparam syn__1395_.coord_x = 8;
defparam syn__1395_.coord_y = 7;
defparam syn__1395_.coord_z = 3;
defparam syn__1395_.mask = 16'hFAFC;
defparam syn__1395_.modeMux = 1'b0;
defparam syn__1395_.FeedbackMux = 1'b0;
defparam syn__1395_.ShiftMux = 1'b0;
defparam syn__1395_.BypassEn = 1'b0;
defparam syn__1395_.CarryEnb = 1'b1;

alta_slice syn__1396_(
	.A(syn__1049_),
	.B(syn__1052_),
	.C(vcc),
	.D(vcc),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1048_),
	.Cout(),
	.Q());
defparam syn__1396_.coord_x = 6;
defparam syn__1396_.coord_y = 8;
defparam syn__1396_.coord_z = 14;
defparam syn__1396_.mask = 16'h8888;
defparam syn__1396_.modeMux = 1'b0;
defparam syn__1396_.FeedbackMux = 1'b0;
defparam syn__1396_.ShiftMux = 1'b0;
defparam syn__1396_.BypassEn = 1'b0;
defparam syn__1396_.CarryEnb = 1'b1;

alta_slice syn__1397_(
	.A(syn__0911_),
	.B(syn__1050_),
	.C(syn__0956_),
	.D(syn__0912_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1049_),
	.Cout(),
	.Q());
defparam syn__1397_.coord_x = 7;
defparam syn__1397_.coord_y = 8;
defparam syn__1397_.coord_z = 7;
defparam syn__1397_.mask = 16'h4C0C;
defparam syn__1397_.modeMux = 1'b0;
defparam syn__1397_.FeedbackMux = 1'b0;
defparam syn__1397_.ShiftMux = 1'b0;
defparam syn__1397_.BypassEn = 1'b0;
defparam syn__1397_.CarryEnb = 1'b1;

alta_slice syn__1398_(
	.A(syn__0922_),
	.B(syn__0638_),
	.C(syn__1051_),
	.D(vcc),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1050_),
	.Cout(),
	.Q());
defparam syn__1398_.coord_x = 7;
defparam syn__1398_.coord_y = 8;
defparam syn__1398_.coord_z = 6;
defparam syn__1398_.mask = 16'hD0D0;
defparam syn__1398_.modeMux = 1'b0;
defparam syn__1398_.FeedbackMux = 1'b0;
defparam syn__1398_.ShiftMux = 1'b0;
defparam syn__1398_.BypassEn = 1'b0;
defparam syn__1398_.CarryEnb = 1'b1;

alta_slice syn__1399_(
	.A(syn__0608_),
	.B(syn__0644_),
	.C(syn__0955_),
	.D(syn__0914_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1051_),
	.Cout(),
	.Q());
defparam syn__1399_.coord_x = 8;
defparam syn__1399_.coord_y = 8;
defparam syn__1399_.coord_z = 11;
defparam syn__1399_.mask = 16'h8CAF;
defparam syn__1399_.modeMux = 1'b0;
defparam syn__1399_.FeedbackMux = 1'b0;
defparam syn__1399_.ShiftMux = 1'b0;
defparam syn__1399_.BypassEn = 1'b0;
defparam syn__1399_.CarryEnb = 1'b1;

alta_slice syn__1400_(
	.A(syn__0955_),
	.B(syn__0912_),
	.C(syn__0911_),
	.D(syn__1053_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1052_),
	.Cout(),
	.Q());
defparam syn__1400_.coord_x = 7;
defparam syn__1400_.coord_y = 8;
defparam syn__1400_.coord_z = 13;
defparam syn__1400_.mask = 16'h5D00;
defparam syn__1400_.modeMux = 1'b0;
defparam syn__1400_.FeedbackMux = 1'b0;
defparam syn__1400_.ShiftMux = 1'b0;
defparam syn__1400_.BypassEn = 1'b0;
defparam syn__1400_.CarryEnb = 1'b1;

alta_slice syn__1401_(
	.A(vcc),
	.B(syn__0644_),
	.C(syn__1054_),
	.D(syn__0956_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1053_),
	.Cout(),
	.Q());
defparam syn__1401_.coord_x = 7;
defparam syn__1401_.coord_y = 6;
defparam syn__1401_.coord_z = 2;
defparam syn__1401_.mask = 16'hC0F0;
defparam syn__1401_.modeMux = 1'b0;
defparam syn__1401_.FeedbackMux = 1'b0;
defparam syn__1401_.ShiftMux = 1'b0;
defparam syn__1401_.BypassEn = 1'b0;
defparam syn__1401_.CarryEnb = 1'b1;

alta_slice syn__1402_(
	.A(syn__0640_),
	.B(syn__0916_),
	.C(syn__0922_),
	.D(syn__0914_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1054_),
	.Cout(),
	.Q());
defparam syn__1402_.coord_x = 7;
defparam syn__1402_.coord_y = 6;
defparam syn__1402_.coord_z = 12;
defparam syn__1402_.mask = 16'h8CAF;
defparam syn__1402_.modeMux = 1'b0;
defparam syn__1402_.FeedbackMux = 1'b0;
defparam syn__1402_.ShiftMux = 1'b0;
defparam syn__1402_.BypassEn = 1'b0;
defparam syn__1402_.CarryEnb = 1'b1;

alta_slice syn__1403_(
	.A(syn__0666_),
	.B(syn__1059_),
	.C(vcc),
	.D(syn__1056_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1055_),
	.Cout(),
	.Q());
defparam syn__1403_.coord_x = 6;
defparam syn__1403_.coord_y = 8;
defparam syn__1403_.coord_z = 4;
defparam syn__1403_.mask = 16'h8800;
defparam syn__1403_.modeMux = 1'b0;
defparam syn__1403_.FeedbackMux = 1'b0;
defparam syn__1403_.ShiftMux = 1'b0;
defparam syn__1403_.BypassEn = 1'b0;
defparam syn__1403_.CarryEnb = 1'b1;

alta_slice syn__1404_(
	.A(syn__0956_),
	.B(vcc),
	.C(syn__1057_),
	.D(syn__0823_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1056_),
	.Cout(),
	.Q());
defparam syn__1404_.coord_x = 7;
defparam syn__1404_.coord_y = 8;
defparam syn__1404_.coord_z = 12;
defparam syn__1404_.mask = 16'hF050;
defparam syn__1404_.modeMux = 1'b0;
defparam syn__1404_.FeedbackMux = 1'b0;
defparam syn__1404_.ShiftMux = 1'b0;
defparam syn__1404_.BypassEn = 1'b0;
defparam syn__1404_.CarryEnb = 1'b1;

alta_slice syn__1405_(
	.A(syn__0982_),
	.B(syn__0974_),
	.C(syn__0922_),
	.D(syn__1058_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1057_),
	.Cout(),
	.Q());
defparam syn__1405_.coord_x = 7;
defparam syn__1405_.coord_y = 8;
defparam syn__1405_.coord_z = 14;
defparam syn__1405_.mask = 16'h2F00;
defparam syn__1405_.modeMux = 1'b0;
defparam syn__1405_.FeedbackMux = 1'b0;
defparam syn__1405_.ShiftMux = 1'b0;
defparam syn__1405_.BypassEn = 1'b0;
defparam syn__1405_.CarryEnb = 1'b1;

alta_slice syn__1406_(
	.A(syn__0955_),
	.B(syn__0638_),
	.C(syn__0642_),
	.D(syn__0914_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1058_),
	.Cout(),
	.Q());
defparam syn__1406_.coord_x = 8;
defparam syn__1406_.coord_y = 8;
defparam syn__1406_.coord_z = 3;
defparam syn__1406_.mask = 16'hC4F5;
defparam syn__1406_.modeMux = 1'b0;
defparam syn__1406_.FeedbackMux = 1'b0;
defparam syn__1406_.ShiftMux = 1'b0;
defparam syn__1406_.BypassEn = 1'b0;
defparam syn__1406_.CarryEnb = 1'b1;

alta_slice syn__1407_(
	.A(vcc),
	.B(syn__0823_),
	.C(syn__1060_),
	.D(syn__0914_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1059_),
	.Cout(),
	.Q());
defparam syn__1407_.coord_x = 7;
defparam syn__1407_.coord_y = 8;
defparam syn__1407_.coord_z = 8;
defparam syn__1407_.mask = 16'hC0F0;
defparam syn__1407_.modeMux = 1'b0;
defparam syn__1407_.FeedbackMux = 1'b0;
defparam syn__1407_.ShiftMux = 1'b0;
defparam syn__1407_.BypassEn = 1'b0;
defparam syn__1407_.CarryEnb = 1'b1;

alta_slice syn__1408_(
	.A(syn__0640_),
	.B(vcc),
	.C(syn__0955_),
	.D(syn__1061_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1060_),
	.Cout(),
	.Q());
defparam syn__1408_.coord_x = 8;
defparam syn__1408_.coord_y = 8;
defparam syn__1408_.coord_z = 2;
defparam syn__1408_.mask = 16'hAF00;
defparam syn__1408_.modeMux = 1'b0;
defparam syn__1408_.FeedbackMux = 1'b0;
defparam syn__1408_.ShiftMux = 1'b0;
defparam syn__1408_.BypassEn = 1'b0;
defparam syn__1408_.CarryEnb = 1'b1;

alta_slice syn__1409_(
	.A(syn__0642_),
	.B(syn__0922_),
	.C(syn__0987_),
	.D(syn__0956_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1061_),
	.Cout(),
	.Q());
defparam syn__1409_.coord_x = 8;
defparam syn__1409_.coord_y = 6;
defparam syn__1409_.coord_z = 6;
defparam syn__1409_.mask = 16'hA2F3;
defparam syn__1409_.modeMux = 1'b0;
defparam syn__1409_.FeedbackMux = 1'b0;
defparam syn__1409_.ShiftMux = 1'b0;
defparam syn__1409_.BypassEn = 1'b0;
defparam syn__1409_.CarryEnb = 1'b1;

alta_slice syn__1410_(
	.A(vcc),
	.B(\tc1.IM [24]),
	.C(syn__1059_),
	.D(\tc1.IM [4]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1062_),
	.Cout(),
	.Q());
defparam syn__1410_.coord_x = 6;
defparam syn__1410_.coord_y = 8;
defparam syn__1410_.coord_z = 3;
defparam syn__1410_.mask = 16'h3303;
defparam syn__1410_.modeMux = 1'b0;
defparam syn__1410_.FeedbackMux = 1'b0;
defparam syn__1410_.ShiftMux = 1'b0;
defparam syn__1410_.BypassEn = 1'b0;
defparam syn__1410_.CarryEnb = 1'b1;

alta_slice syn__1411_(
	.A(\tc1.IM [24]),
	.B(\tc1.IM [2]),
	.C(\tc1.IM [1]),
	.D(\tc1.IM [0]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1063_),
	.Cout(),
	.Q());
defparam syn__1411_.coord_x = 12;
defparam syn__1411_.coord_y = 7;
defparam syn__1411_.coord_z = 2;
defparam syn__1411_.mask = 16'h0040;
defparam syn__1411_.modeMux = 1'b0;
defparam syn__1411_.FeedbackMux = 1'b0;
defparam syn__1411_.ShiftMux = 1'b0;
defparam syn__1411_.BypassEn = 1'b0;
defparam syn__1411_.CarryEnb = 1'b1;

alta_slice syn__1413_(
	.A(syn__1063_),
	.B(\tc1.PC [1]),
	.C(syn__0820_),
	.D(\tc1.PC [0]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1064_),
	.Cout(),
	.Q());
defparam syn__1413_.coord_x = 12;
defparam syn__1413_.coord_y = 8;
defparam syn__1413_.coord_z = 12;
defparam syn__1413_.mask = 16'h1114;
defparam syn__1413_.modeMux = 1'b0;
defparam syn__1413_.FeedbackMux = 1'b0;
defparam syn__1413_.ShiftMux = 1'b0;
defparam syn__1413_.BypassEn = 1'b0;
defparam syn__1413_.CarryEnb = 1'b1;

alta_slice syn__1415_(
	.A(vcc),
	.B(\tc1.PC [1]),
	.C(syn__0820_),
	.D(\tc1.PC [0]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1065_),
	.Cout(),
	.Q());
defparam syn__1415_.coord_x = 12;
defparam syn__1415_.coord_y = 8;
defparam syn__1415_.coord_z = 10;
defparam syn__1415_.mask = 16'hCCC0;
defparam syn__1415_.modeMux = 1'b0;
defparam syn__1415_.FeedbackMux = 1'b0;
defparam syn__1415_.ShiftMux = 1'b0;
defparam syn__1415_.BypassEn = 1'b0;
defparam syn__1415_.CarryEnb = 1'b1;

alta_slice syn__1417_(
	.A(syn__1067_),
	.B(\tc1.PC [3]),
	.C(syn__0820_),
	.D(\tc1.PC [0]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1066_),
	.Cout(),
	.Q());
defparam syn__1417_.coord_x = 12;
defparam syn__1417_.coord_y = 8;
defparam syn__1417_.coord_z = 2;
defparam syn__1417_.mask = 16'h9993;
defparam syn__1417_.modeMux = 1'b0;
defparam syn__1417_.FeedbackMux = 1'b0;
defparam syn__1417_.ShiftMux = 1'b0;
defparam syn__1417_.BypassEn = 1'b0;
defparam syn__1417_.CarryEnb = 1'b1;

alta_slice syn__1418_(
	.A(vcc),
	.B(vcc),
	.C(\tc1.PC [2]),
	.D(\tc1.PC [1]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1067_),
	.Cout(),
	.Q());
defparam syn__1418_.coord_x = 12;
defparam syn__1418_.coord_y = 8;
defparam syn__1418_.coord_z = 0;
defparam syn__1418_.mask = 16'hF000;
defparam syn__1418_.modeMux = 1'b0;
defparam syn__1418_.FeedbackMux = 1'b0;
defparam syn__1418_.ShiftMux = 1'b0;
defparam syn__1418_.BypassEn = 1'b0;
defparam syn__1418_.CarryEnb = 1'b1;

alta_slice syn__1420_(
	.A(vcc),
	.B(syn__1069_),
	.C(syn__0820_),
	.D(\tc1.PC [0]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1068_),
	.Cout(),
	.Q());
defparam syn__1420_.coord_x = 12;
defparam syn__1420_.coord_y = 8;
defparam syn__1420_.coord_z = 13;
defparam syn__1420_.mask = 16'hCCC0;
defparam syn__1420_.modeMux = 1'b0;
defparam syn__1420_.FeedbackMux = 1'b0;
defparam syn__1420_.ShiftMux = 1'b0;
defparam syn__1420_.BypassEn = 1'b0;
defparam syn__1420_.CarryEnb = 1'b1;

alta_slice syn__1421_(
	.A(vcc),
	.B(syn__1067_),
	.C(vcc),
	.D(\tc1.PC [3]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1069_),
	.Cout(),
	.Q());
defparam syn__1421_.coord_x = 12;
defparam syn__1421_.coord_y = 7;
defparam syn__1421_.coord_z = 15;
defparam syn__1421_.mask = 16'hCC00;
defparam syn__1421_.modeMux = 1'b0;
defparam syn__1421_.FeedbackMux = 1'b0;
defparam syn__1421_.ShiftMux = 1'b0;
defparam syn__1421_.BypassEn = 1'b0;
defparam syn__1421_.CarryEnb = 1'b1;

alta_slice syn__1423_(
	.A(\tc1.PC [5]),
	.B(syn__1071_),
	.C(syn__0820_),
	.D(\tc1.PC [0]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1070_),
	.Cout(),
	.Q());
defparam syn__1423_.coord_x = 12;
defparam syn__1423_.coord_y = 8;
defparam syn__1423_.coord_z = 3;
defparam syn__1423_.mask = 16'h9995;
defparam syn__1423_.modeMux = 1'b0;
defparam syn__1423_.FeedbackMux = 1'b0;
defparam syn__1423_.ShiftMux = 1'b0;
defparam syn__1423_.BypassEn = 1'b0;
defparam syn__1423_.CarryEnb = 1'b1;

alta_slice syn__1424_(
	.A(vcc),
	.B(vcc),
	.C(\tc1.PC [4]),
	.D(syn__1069_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1071_),
	.Cout(),
	.Q());
defparam syn__1424_.coord_x = 12;
defparam syn__1424_.coord_y = 7;
defparam syn__1424_.coord_z = 14;
defparam syn__1424_.mask = 16'hF000;
defparam syn__1424_.modeMux = 1'b0;
defparam syn__1424_.FeedbackMux = 1'b0;
defparam syn__1424_.ShiftMux = 1'b0;
defparam syn__1424_.BypassEn = 1'b0;
defparam syn__1424_.CarryEnb = 1'b1;

alta_slice syn__1426_(
	.A(syn__1073_),
	.B(\tc1.PC [6]),
	.C(syn__0820_),
	.D(\tc1.PC [0]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1072_),
	.Cout(),
	.Q());
defparam syn__1426_.coord_x = 12;
defparam syn__1426_.coord_y = 8;
defparam syn__1426_.coord_z = 7;
defparam syn__1426_.mask = 16'h9993;
defparam syn__1426_.modeMux = 1'b0;
defparam syn__1426_.FeedbackMux = 1'b0;
defparam syn__1426_.ShiftMux = 1'b0;
defparam syn__1426_.BypassEn = 1'b0;
defparam syn__1426_.CarryEnb = 1'b1;

alta_slice syn__1427_(
	.A(vcc),
	.B(vcc),
	.C(syn__1071_),
	.D(\tc1.PC [5]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1073_),
	.Cout(),
	.Q());
defparam syn__1427_.coord_x = 11;
defparam syn__1427_.coord_y = 7;
defparam syn__1427_.coord_z = 13;
defparam syn__1427_.mask = 16'hF000;
defparam syn__1427_.modeMux = 1'b0;
defparam syn__1427_.FeedbackMux = 1'b0;
defparam syn__1427_.ShiftMux = 1'b0;
defparam syn__1427_.BypassEn = 1'b0;
defparam syn__1427_.CarryEnb = 1'b1;

alta_slice syn__1429_(
	.A(syn__0212_),
	.B(syn__0222_),
	.C(\tc2.IM [3]),
	.D(syn__1075_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1074_),
	.Cout(),
	.Q());
defparam syn__1429_.coord_x = 11;
defparam syn__1429_.coord_y = 4;
defparam syn__1429_.coord_z = 7;
defparam syn__1429_.mask = 16'hC8C0;
defparam syn__1429_.modeMux = 1'b0;
defparam syn__1429_.FeedbackMux = 1'b0;
defparam syn__1429_.ShiftMux = 1'b0;
defparam syn__1429_.BypassEn = 1'b0;
defparam syn__1429_.CarryEnb = 1'b1;

alta_slice syn__1430_(
	.A(syn__0093_),
	.B(syn__0205_),
	.C(syn__1076_),
	.D(syn__0079_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1075_),
	.Cout(),
	.Q());
defparam syn__1430_.coord_x = 5;
defparam syn__1430_.coord_y = 2;
defparam syn__1430_.coord_z = 4;
defparam syn__1430_.mask = 16'h8000;
defparam syn__1430_.modeMux = 1'b0;
defparam syn__1430_.FeedbackMux = 1'b0;
defparam syn__1430_.ShiftMux = 1'b0;
defparam syn__1430_.BypassEn = 1'b0;
defparam syn__1430_.CarryEnb = 1'b1;

alta_slice syn__1431_(
	.A(syn__0078_),
	.B(vcc),
	.C(syn__0067_),
	.D(syn__1077_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1076_),
	.Cout(),
	.Q());
defparam syn__1431_.coord_x = 6;
defparam syn__1431_.coord_y = 2;
defparam syn__1431_.coord_z = 12;
defparam syn__1431_.mask = 16'hF050;
defparam syn__1431_.modeMux = 1'b0;
defparam syn__1431_.FeedbackMux = 1'b0;
defparam syn__1431_.ShiftMux = 1'b0;
defparam syn__1431_.BypassEn = 1'b0;
defparam syn__1431_.CarryEnb = 1'b1;

alta_slice syn__1432_(
	.A(\tc2.IM [9]),
	.B(syn__0062_),
	.C(syn__0066_),
	.D(syn__1078_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1077_),
	.Cout(),
	.Q());
defparam syn__1432_.coord_x = 5;
defparam syn__1432_.coord_y = 3;
defparam syn__1432_.coord_z = 6;
defparam syn__1432_.mask = 16'hC88C;
defparam syn__1432_.modeMux = 1'b0;
defparam syn__1432_.FeedbackMux = 1'b0;
defparam syn__1432_.ShiftMux = 1'b0;
defparam syn__1432_.BypassEn = 1'b0;
defparam syn__1432_.CarryEnb = 1'b1;

alta_slice syn__1433_(
	.A(syn__1079_),
	.B(syn__0059_),
	.C(syn__0060_),
	.D(syn__0061_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1078_),
	.Cout(),
	.Q());
defparam syn__1433_.coord_x = 5;
defparam syn__1433_.coord_y = 4;
defparam syn__1433_.coord_z = 11;
defparam syn__1433_.mask = 16'h0313;
defparam syn__1433_.modeMux = 1'b0;
defparam syn__1433_.FeedbackMux = 1'b0;
defparam syn__1433_.ShiftMux = 1'b0;
defparam syn__1433_.BypassEn = 1'b0;
defparam syn__1433_.CarryEnb = 1'b1;

alta_slice syn__1434_(
	.A(syn__0056_),
	.B(syn__1080_),
	.C(syn__0058_),
	.D(syn__0057_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1079_),
	.Cout(),
	.Q());
defparam syn__1434_.coord_x = 5;
defparam syn__1434_.coord_y = 4;
defparam syn__1434_.coord_z = 14;
defparam syn__1434_.mask = 16'h0115;
defparam syn__1434_.modeMux = 1'b0;
defparam syn__1434_.FeedbackMux = 1'b0;
defparam syn__1434_.ShiftMux = 1'b0;
defparam syn__1434_.BypassEn = 1'b0;
defparam syn__1434_.CarryEnb = 1'b1;

alta_slice syn__1435_(
	.A(syn__0054_),
	.B(syn__0055_),
	.C(syn__0053_),
	.D(syn__1081_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1080_),
	.Cout(),
	.Q());
defparam syn__1435_.coord_x = 5;
defparam syn__1435_.coord_y = 4;
defparam syn__1435_.coord_z = 15;
defparam syn__1435_.mask = 16'hA0B2;
defparam syn__1435_.modeMux = 1'b0;
defparam syn__1435_.FeedbackMux = 1'b0;
defparam syn__1435_.ShiftMux = 1'b0;
defparam syn__1435_.BypassEn = 1'b0;
defparam syn__1435_.CarryEnb = 1'b1;

alta_slice syn__1436_(
	.A(syn__0050_),
	.B(syn__0052_),
	.C(syn__0051_),
	.D(syn__1082_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1081_),
	.Cout(),
	.Q());
defparam syn__1436_.coord_x = 5;
defparam syn__1436_.coord_y = 4;
defparam syn__1436_.coord_z = 1;
defparam syn__1436_.mask = 16'hA0A2;
defparam syn__1436_.modeMux = 1'b0;
defparam syn__1436_.FeedbackMux = 1'b0;
defparam syn__1436_.ShiftMux = 1'b0;
defparam syn__1436_.BypassEn = 1'b0;
defparam syn__1436_.CarryEnb = 1'b1;

alta_slice syn__1437_(
	.A(syn__1083_),
	.B(syn__0048_),
	.C(syn__0049_),
	.D(syn__0047_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1082_),
	.Cout(),
	.Q());
defparam syn__1437_.coord_x = 8;
defparam syn__1437_.coord_y = 4;
defparam syn__1437_.coord_z = 0;
defparam syn__1437_.mask = 16'h00FB;
defparam syn__1437_.modeMux = 1'b0;
defparam syn__1437_.FeedbackMux = 1'b0;
defparam syn__1437_.ShiftMux = 1'b0;
defparam syn__1437_.BypassEn = 1'b0;
defparam syn__1437_.CarryEnb = 1'b1;

alta_slice syn__1438_(
	.A(syn__0046_),
	.B(syn__0045_),
	.C(syn__1084_),
	.D(syn__0044_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1083_),
	.Cout(),
	.Q());
defparam syn__1438_.coord_x = 8;
defparam syn__1438_.coord_y = 4;
defparam syn__1438_.coord_z = 10;
defparam syn__1438_.mask = 16'h00E8;
defparam syn__1438_.modeMux = 1'b0;
defparam syn__1438_.FeedbackMux = 1'b0;
defparam syn__1438_.ShiftMux = 1'b0;
defparam syn__1438_.BypassEn = 1'b0;
defparam syn__1438_.CarryEnb = 1'b1;

alta_slice syn__1439_(
	.A(syn__1085_),
	.B(syn__0041_),
	.C(syn__0042_),
	.D(syn__0043_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1084_),
	.Cout(),
	.Q());
defparam syn__1439_.coord_x = 8;
defparam syn__1439_.coord_y = 4;
defparam syn__1439_.coord_z = 4;
defparam syn__1439_.mask = 16'hC0D4;
defparam syn__1439_.modeMux = 1'b0;
defparam syn__1439_.FeedbackMux = 1'b0;
defparam syn__1439_.ShiftMux = 1'b0;
defparam syn__1439_.BypassEn = 1'b0;
defparam syn__1439_.CarryEnb = 1'b1;

alta_slice syn__1440_(
	.A(syn__0039_),
	.B(syn__0038_),
	.C(syn__1086_),
	.D(syn__0040_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1085_),
	.Cout(),
	.Q());
defparam syn__1440_.coord_x = 5;
defparam syn__1440_.coord_y = 3;
defparam syn__1440_.coord_z = 8;
defparam syn__1440_.mask = 16'h888C;
defparam syn__1440_.modeMux = 1'b0;
defparam syn__1440_.FeedbackMux = 1'b0;
defparam syn__1440_.ShiftMux = 1'b0;
defparam syn__1440_.BypassEn = 1'b0;
defparam syn__1440_.CarryEnb = 1'b1;

alta_slice syn__1441_(
	.A(syn__1087_),
	.B(syn__0035_),
	.C(syn__0036_),
	.D(syn__0037_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1086_),
	.Cout(),
	.Q());
defparam syn__1441_.coord_x = 12;
defparam syn__1441_.coord_y = 1;
defparam syn__1441_.coord_z = 11;
defparam syn__1441_.mask = 16'h3323;
defparam syn__1441_.modeMux = 1'b0;
defparam syn__1441_.FeedbackMux = 1'b0;
defparam syn__1441_.ShiftMux = 1'b0;
defparam syn__1441_.BypassEn = 1'b0;
defparam syn__1441_.CarryEnb = 1'b1;

alta_slice syn__1442_(
	.A(syn__0033_),
	.B(syn__0034_),
	.C(syn__1088_),
	.D(syn__0032_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1087_),
	.Cout(),
	.Q());
defparam syn__1442_.coord_x = 12;
defparam syn__1442_.coord_y = 1;
defparam syn__1442_.coord_z = 2;
defparam syn__1442_.mask = 16'h2302;
defparam syn__1442_.modeMux = 1'b0;
defparam syn__1442_.FeedbackMux = 1'b0;
defparam syn__1442_.ShiftMux = 1'b0;
defparam syn__1442_.BypassEn = 1'b0;
defparam syn__1442_.CarryEnb = 1'b1;

alta_slice syn__1443_(
	.A(syn__0029_),
	.B(syn__0030_),
	.C(syn__0031_),
	.D(syn__1089_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1088_),
	.Cout(),
	.Q());
defparam syn__1443_.coord_x = 12;
defparam syn__1443_.coord_y = 2;
defparam syn__1443_.coord_z = 11;
defparam syn__1443_.mask = 16'h7771;
defparam syn__1443_.modeMux = 1'b0;
defparam syn__1443_.FeedbackMux = 1'b0;
defparam syn__1443_.ShiftMux = 1'b0;
defparam syn__1443_.BypassEn = 1'b0;
defparam syn__1443_.CarryEnb = 1'b1;

alta_slice syn__1444_(
	.A(syn__0027_),
	.B(syn__0026_),
	.C(syn__0028_),
	.D(syn__1090_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1089_),
	.Cout(),
	.Q());
defparam syn__1444_.coord_x = 12;
defparam syn__1444_.coord_y = 2;
defparam syn__1444_.coord_z = 10;
defparam syn__1444_.mask = 16'h4044;
defparam syn__1444_.modeMux = 1'b0;
defparam syn__1444_.FeedbackMux = 1'b0;
defparam syn__1444_.ShiftMux = 1'b0;
defparam syn__1444_.BypassEn = 1'b0;
defparam syn__1444_.CarryEnb = 1'b1;

alta_slice syn__1445_(
	.A(syn__0023_),
	.B(syn__0024_),
	.C(syn__0025_),
	.D(syn__1091_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1090_),
	.Cout(),
	.Q());
defparam syn__1445_.coord_x = 12;
defparam syn__1445_.coord_y = 4;
defparam syn__1445_.coord_z = 15;
defparam syn__1445_.mask = 16'h888E;
defparam syn__1445_.modeMux = 1'b0;
defparam syn__1445_.FeedbackMux = 1'b0;
defparam syn__1445_.ShiftMux = 1'b0;
defparam syn__1445_.BypassEn = 1'b0;
defparam syn__1445_.CarryEnb = 1'b1;

alta_slice syn__1446_(
	.A(syn__1092_),
	.B(syn__0020_),
	.C(syn__0022_),
	.D(syn__0021_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1091_),
	.Cout(),
	.Q());
defparam syn__1446_.coord_x = 12;
defparam syn__1446_.coord_y = 4;
defparam syn__1446_.coord_z = 14;
defparam syn__1446_.mask = 16'h0113;
defparam syn__1446_.modeMux = 1'b0;
defparam syn__1446_.FeedbackMux = 1'b0;
defparam syn__1446_.ShiftMux = 1'b0;
defparam syn__1446_.BypassEn = 1'b0;
defparam syn__1446_.CarryEnb = 1'b1;

alta_slice syn__1447_(
	.A(syn__0019_),
	.B(syn__1093_),
	.C(syn__0018_),
	.D(syn__0017_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1092_),
	.Cout(),
	.Q());
defparam syn__1447_.coord_x = 9;
defparam syn__1447_.coord_y = 2;
defparam syn__1447_.coord_z = 8;
defparam syn__1447_.mask = 16'hF110;
defparam syn__1447_.modeMux = 1'b0;
defparam syn__1447_.FeedbackMux = 1'b0;
defparam syn__1447_.ShiftMux = 1'b0;
defparam syn__1447_.BypassEn = 1'b0;
defparam syn__1447_.CarryEnb = 1'b1;

alta_slice syn__1448_(
	.A(syn__0014_),
	.B(syn__0016_),
	.C(syn__0015_),
	.D(syn__1094_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1093_),
	.Cout(),
	.Q());
defparam syn__1448_.coord_x = 4;
defparam syn__1448_.coord_y = 2;
defparam syn__1448_.coord_z = 8;
defparam syn__1448_.mask = 16'hA0A2;
defparam syn__1448_.modeMux = 1'b0;
defparam syn__1448_.FeedbackMux = 1'b0;
defparam syn__1448_.ShiftMux = 1'b0;
defparam syn__1448_.BypassEn = 1'b0;
defparam syn__1448_.CarryEnb = 1'b1;

alta_slice syn__1449_(
	.A(syn__0012_),
	.B(syn__0011_),
	.C(syn__1095_),
	.D(syn__0013_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1094_),
	.Cout(),
	.Q());
defparam syn__1449_.coord_x = 4;
defparam syn__1449_.coord_y = 2;
defparam syn__1449_.coord_z = 9;
defparam syn__1449_.mask = 16'h1113;
defparam syn__1449_.modeMux = 1'b0;
defparam syn__1449_.FeedbackMux = 1'b0;
defparam syn__1449_.ShiftMux = 1'b0;
defparam syn__1449_.BypassEn = 1'b0;
defparam syn__1449_.CarryEnb = 1'b1;

alta_slice syn__1450_(
	.A(syn__0008_),
	.B(syn__1096_),
	.C(syn__0010_),
	.D(syn__0009_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1095_),
	.Cout(),
	.Q());
defparam syn__1450_.coord_x = 4;
defparam syn__1450_.coord_y = 2;
defparam syn__1450_.coord_z = 2;
defparam syn__1450_.mask = 16'h0115;
defparam syn__1450_.modeMux = 1'b0;
defparam syn__1450_.FeedbackMux = 1'b0;
defparam syn__1450_.ShiftMux = 1'b0;
defparam syn__1450_.BypassEn = 1'b0;
defparam syn__1450_.CarryEnb = 1'b1;

alta_slice syn__1451_(
	.A(syn__0005_),
	.B(syn__1097_),
	.C(syn__0007_),
	.D(syn__0006_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1096_),
	.Cout(),
	.Q());
defparam syn__1451_.coord_x = 9;
defparam syn__1451_.coord_y = 2;
defparam syn__1451_.coord_z = 4;
defparam syn__1451_.mask = 16'hAB02;
defparam syn__1451_.modeMux = 1'b0;
defparam syn__1451_.FeedbackMux = 1'b0;
defparam syn__1451_.ShiftMux = 1'b0;
defparam syn__1451_.BypassEn = 1'b0;
defparam syn__1451_.CarryEnb = 1'b1;

alta_slice syn__1452_(
	.A(syn__0003_),
	.B(syn__0004_),
	.C(syn__1098_),
	.D(syn__1099_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1097_),
	.Cout(),
	.Q());
defparam syn__1452_.coord_x = 9;
defparam syn__1452_.coord_y = 2;
defparam syn__1452_.coord_z = 15;
defparam syn__1452_.mask = 16'h088C;
defparam syn__1452_.modeMux = 1'b0;
defparam syn__1452_.FeedbackMux = 1'b0;
defparam syn__1452_.ShiftMux = 1'b0;
defparam syn__1452_.BypassEn = 1'b0;
defparam syn__1452_.CarryEnb = 1'b1;

alta_slice syn__1453_(
	.A(IOaddr2[1]),
	.B(vcc),
	.C(\tc2.IM [8]),
	.D(\tc2.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1098_),
	.Cout(),
	.Q());
defparam syn__1453_.coord_x = 9;
defparam syn__1453_.coord_y = 2;
defparam syn__1453_.coord_z = 2;
defparam syn__1453_.mask = 16'h0AF5;
defparam syn__1453_.modeMux = 1'b0;
defparam syn__1453_.FeedbackMux = 1'b0;
defparam syn__1453_.ShiftMux = 1'b0;
defparam syn__1453_.BypassEn = 1'b0;
defparam syn__1453_.CarryEnb = 1'b1;

alta_slice syn__1454_(
	.A(vcc),
	.B(IOvalue2[1]),
	.C(IOaddr2[1]),
	.D(\tc2.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__1099_),
	.Cout(),
	.Q());
defparam syn__1454_.coord_x = 9;
defparam syn__1454_.coord_y = 2;
defparam syn__1454_.coord_z = 11;
defparam syn__1454_.mask = 16'h0F33;
defparam syn__1454_.modeMux = 1'b0;
defparam syn__1454_.FeedbackMux = 1'b0;
defparam syn__1454_.ShiftMux = 1'b0;
defparam syn__1454_.BypassEn = 1'b0;
defparam syn__1454_.CarryEnb = 1'b1;

alta_slice syn__1455_(
	.A(\tc2.IM [7]),
	.B(IOaddr2[0]),
	.C(\tc2.IM [8]),
	.D(IOvalue2[0]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0003_),
	.Cout(),
	.Q());
defparam syn__1455_.coord_x = 11;
defparam syn__1455_.coord_y = 2;
defparam syn__1455_.coord_z = 1;
defparam syn__1455_.mask = 16'hC6C0;
defparam syn__1455_.modeMux = 1'b0;
defparam syn__1455_.FeedbackMux = 1'b0;
defparam syn__1455_.ShiftMux = 1'b0;
defparam syn__1455_.BypassEn = 1'b0;
defparam syn__1455_.CarryEnb = 1'b1;

alta_slice syn__1456_(
	.A(IOvalue2[2]),
	.B(\tc2.IM [7]),
	.C(IOaddr2[2]),
	.D(\tc2.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0004_),
	.Cout(),
	.Q());
defparam syn__1456_.coord_x = 9;
defparam syn__1456_.coord_y = 2;
defparam syn__1456_.coord_z = 7;
defparam syn__1456_.mask = 16'h3C96;
defparam syn__1456_.modeMux = 1'b0;
defparam syn__1456_.FeedbackMux = 1'b0;
defparam syn__1456_.ShiftMux = 1'b0;
defparam syn__1456_.BypassEn = 1'b0;
defparam syn__1456_.CarryEnb = 1'b1;

alta_slice syn__1457_(
	.A(IOaddr2[3]),
	.B(vcc),
	.C(\tc2.IM [8]),
	.D(\tc2.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0005_),
	.Cout(),
	.Q());
defparam syn__1457_.coord_x = 9;
defparam syn__1457_.coord_y = 2;
defparam syn__1457_.coord_z = 10;
defparam syn__1457_.mask = 16'h0AF5;
defparam syn__1457_.modeMux = 1'b0;
defparam syn__1457_.FeedbackMux = 1'b0;
defparam syn__1457_.ShiftMux = 1'b0;
defparam syn__1457_.BypassEn = 1'b0;
defparam syn__1457_.CarryEnb = 1'b1;

alta_slice syn__1458_(
	.A(vcc),
	.B(IOvalue2[3]),
	.C(IOaddr2[3]),
	.D(\tc2.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0006_),
	.Cout(),
	.Q());
defparam syn__1458_.coord_x = 9;
defparam syn__1458_.coord_y = 1;
defparam syn__1458_.coord_z = 9;
defparam syn__1458_.mask = 16'h0F33;
defparam syn__1458_.modeMux = 1'b0;
defparam syn__1458_.FeedbackMux = 1'b0;
defparam syn__1458_.ShiftMux = 1'b0;
defparam syn__1458_.BypassEn = 1'b0;
defparam syn__1458_.CarryEnb = 1'b1;

alta_slice syn__1459_(
	.A(IOvalue2[2]),
	.B(\tc2.IM [7]),
	.C(IOaddr2[2]),
	.D(\tc2.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0007_),
	.Cout(),
	.Q());
defparam syn__1459_.coord_x = 9;
defparam syn__1459_.coord_y = 2;
defparam syn__1459_.coord_z = 5;
defparam syn__1459_.mask = 16'hC028;
defparam syn__1459_.modeMux = 1'b0;
defparam syn__1459_.FeedbackMux = 1'b0;
defparam syn__1459_.ShiftMux = 1'b0;
defparam syn__1459_.BypassEn = 1'b0;
defparam syn__1459_.CarryEnb = 1'b1;

alta_slice syn__1460_(
	.A(\tc2.IM [8]),
	.B(IOvalue2[5]),
	.C(IOaddr2[5]),
	.D(\tc2.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0008_),
	.Cout(),
	.Q());
defparam syn__1460_.coord_x = 4;
defparam syn__1460_.coord_y = 2;
defparam syn__1460_.coord_z = 3;
defparam syn__1460_.mask = 16'h100B;
defparam syn__1460_.modeMux = 1'b0;
defparam syn__1460_.FeedbackMux = 1'b0;
defparam syn__1460_.ShiftMux = 1'b0;
defparam syn__1460_.BypassEn = 1'b0;
defparam syn__1460_.CarryEnb = 1'b1;

alta_slice syn__1461_(
	.A(vcc),
	.B(\tc2.IM [8]),
	.C(IOaddr2[4]),
	.D(\tc2.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0009_),
	.Cout(),
	.Q());
defparam syn__1461_.coord_x = 5;
defparam syn__1461_.coord_y = 2;
defparam syn__1461_.coord_z = 2;
defparam syn__1461_.mask = 16'h30CF;
defparam syn__1461_.modeMux = 1'b0;
defparam syn__1461_.FeedbackMux = 1'b0;
defparam syn__1461_.ShiftMux = 1'b0;
defparam syn__1461_.BypassEn = 1'b0;
defparam syn__1461_.CarryEnb = 1'b1;

alta_slice syn__1462_(
	.A(IOaddr2[4]),
	.B(\tc2.IM [8]),
	.C(IOvalue2[4]),
	.D(vcc),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0010_),
	.Cout(),
	.Q());
defparam syn__1462_.coord_x = 5;
defparam syn__1462_.coord_y = 2;
defparam syn__1462_.coord_z = 10;
defparam syn__1462_.mask = 16'h4747;
defparam syn__1462_.modeMux = 1'b0;
defparam syn__1462_.FeedbackMux = 1'b0;
defparam syn__1462_.ShiftMux = 1'b0;
defparam syn__1462_.BypassEn = 1'b0;
defparam syn__1462_.CarryEnb = 1'b1;

alta_slice syn__1463_(
	.A(\tc2.IM [8]),
	.B(IOvalue2[6]),
	.C(IOaddr2[6]),
	.D(\tc2.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0011_),
	.Cout(),
	.Q());
defparam syn__1463_.coord_x = 4;
defparam syn__1463_.coord_y = 2;
defparam syn__1463_.coord_z = 1;
defparam syn__1463_.mask = 16'hA440;
defparam syn__1463_.modeMux = 1'b0;
defparam syn__1463_.FeedbackMux = 1'b0;
defparam syn__1463_.ShiftMux = 1'b0;
defparam syn__1463_.BypassEn = 1'b0;
defparam syn__1463_.CarryEnb = 1'b1;

alta_slice syn__1464_(
	.A(\tc2.IM [8]),
	.B(IOvalue2[6]),
	.C(IOaddr2[6]),
	.D(\tc2.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0012_),
	.Cout(),
	.Q());
defparam syn__1464_.coord_x = 4;
defparam syn__1464_.coord_y = 2;
defparam syn__1464_.coord_z = 6;
defparam syn__1464_.mask = 16'h4BB4;
defparam syn__1464_.modeMux = 1'b0;
defparam syn__1464_.FeedbackMux = 1'b0;
defparam syn__1464_.ShiftMux = 1'b0;
defparam syn__1464_.BypassEn = 1'b0;
defparam syn__1464_.CarryEnb = 1'b1;

alta_slice syn__1465_(
	.A(\tc2.IM [8]),
	.B(IOvalue2[5]),
	.C(IOaddr2[5]),
	.D(\tc2.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0013_),
	.Cout(),
	.Q());
defparam syn__1465_.coord_x = 4;
defparam syn__1465_.coord_y = 2;
defparam syn__1465_.coord_z = 5;
defparam syn__1465_.mask = 16'hA440;
defparam syn__1465_.modeMux = 1'b0;
defparam syn__1465_.FeedbackMux = 1'b0;
defparam syn__1465_.ShiftMux = 1'b0;
defparam syn__1465_.BypassEn = 1'b0;
defparam syn__1465_.CarryEnb = 1'b1;

alta_slice syn__1466_(
	.A(\tc2.IM [7]),
	.B(\tc2.IM [8]),
	.C(IOvalue2[8]),
	.D(IOaddr2[8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0014_),
	.Cout(),
	.Q());
defparam syn__1466_.coord_x = 11;
defparam syn__1466_.coord_y = 2;
defparam syn__1466_.coord_z = 13;
defparam syn__1466_.mask = 16'h659A;
defparam syn__1466_.modeMux = 1'b0;
defparam syn__1466_.FeedbackMux = 1'b0;
defparam syn__1466_.ShiftMux = 1'b0;
defparam syn__1466_.BypassEn = 1'b0;
defparam syn__1466_.CarryEnb = 1'b1;

alta_slice syn__1467_(
	.A(\tc2.IM [8]),
	.B(IOaddr2[7]),
	.C(IOvalue2[7]),
	.D(\tc2.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0015_),
	.Cout(),
	.Q());
defparam syn__1467_.coord_x = 4;
defparam syn__1467_.coord_y = 2;
defparam syn__1467_.coord_z = 0;
defparam syn__1467_.mask = 16'h9840;
defparam syn__1467_.modeMux = 1'b0;
defparam syn__1467_.FeedbackMux = 1'b0;
defparam syn__1467_.ShiftMux = 1'b0;
defparam syn__1467_.BypassEn = 1'b0;
defparam syn__1467_.CarryEnb = 1'b1;

alta_slice syn__1468_(
	.A(\tc2.IM [8]),
	.B(IOaddr2[7]),
	.C(IOvalue2[7]),
	.D(\tc2.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0016_),
	.Cout(),
	.Q());
defparam syn__1468_.coord_x = 4;
defparam syn__1468_.coord_y = 2;
defparam syn__1468_.coord_z = 11;
defparam syn__1468_.mask = 16'h0423;
defparam syn__1468_.modeMux = 1'b0;
defparam syn__1468_.FeedbackMux = 1'b0;
defparam syn__1468_.ShiftMux = 1'b0;
defparam syn__1468_.BypassEn = 1'b0;
defparam syn__1468_.CarryEnb = 1'b1;

alta_slice syn__1469_(
	.A(vcc),
	.B(IOaddr2[9]),
	.C(\tc2.IM [7]),
	.D(\tc2.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0017_),
	.Cout(),
	.Q());
defparam syn__1469_.coord_x = 9;
defparam syn__1469_.coord_y = 1;
defparam syn__1469_.coord_z = 7;
defparam syn__1469_.mask = 16'h0FC3;
defparam syn__1469_.modeMux = 1'b0;
defparam syn__1469_.FeedbackMux = 1'b0;
defparam syn__1469_.ShiftMux = 1'b0;
defparam syn__1469_.BypassEn = 1'b0;
defparam syn__1469_.CarryEnb = 1'b1;

alta_slice syn__1470_(
	.A(vcc),
	.B(IOaddr2[9]),
	.C(IOvalue2[9]),
	.D(\tc2.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0018_),
	.Cout(),
	.Q());
defparam syn__1470_.coord_x = 9;
defparam syn__1470_.coord_y = 1;
defparam syn__1470_.coord_z = 6;
defparam syn__1470_.mask = 16'h330F;
defparam syn__1470_.modeMux = 1'b0;
defparam syn__1470_.FeedbackMux = 1'b0;
defparam syn__1470_.ShiftMux = 1'b0;
defparam syn__1470_.BypassEn = 1'b0;
defparam syn__1470_.CarryEnb = 1'b1;

alta_slice syn__1471_(
	.A(IOvalue2[8]),
	.B(IOaddr2[8]),
	.C(\tc2.IM [7]),
	.D(\tc2.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0019_),
	.Cout(),
	.Q());
defparam syn__1471_.coord_x = 11;
defparam syn__1471_.coord_y = 2;
defparam syn__1471_.coord_z = 4;
defparam syn__1471_.mask = 16'hC028;
defparam syn__1471_.modeMux = 1'b0;
defparam syn__1471_.FeedbackMux = 1'b0;
defparam syn__1471_.ShiftMux = 1'b0;
defparam syn__1471_.BypassEn = 1'b0;
defparam syn__1471_.CarryEnb = 1'b1;

alta_slice syn__1472_(
	.A(IOaddr2[11]),
	.B(IOvalue2[11]),
	.C(\tc2.IM [7]),
	.D(\tc2.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0020_),
	.Cout(),
	.Q());
defparam syn__1472_.coord_x = 12;
defparam syn__1472_.coord_y = 4;
defparam syn__1472_.coord_z = 1;
defparam syn__1472_.mask = 16'h0521;
defparam syn__1472_.modeMux = 1'b0;
defparam syn__1472_.FeedbackMux = 1'b0;
defparam syn__1472_.ShiftMux = 1'b0;
defparam syn__1472_.BypassEn = 1'b0;
defparam syn__1472_.CarryEnb = 1'b1;

alta_slice syn__1473_(
	.A(vcc),
	.B(IOaddr2[10]),
	.C(\tc2.IM [7]),
	.D(\tc2.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0021_),
	.Cout(),
	.Q());
defparam syn__1473_.coord_x = 12;
defparam syn__1473_.coord_y = 4;
defparam syn__1473_.coord_z = 3;
defparam syn__1473_.mask = 16'h0FC3;
defparam syn__1473_.modeMux = 1'b0;
defparam syn__1473_.FeedbackMux = 1'b0;
defparam syn__1473_.ShiftMux = 1'b0;
defparam syn__1473_.BypassEn = 1'b0;
defparam syn__1473_.CarryEnb = 1'b1;

alta_slice syn__1474_(
	.A(vcc),
	.B(IOaddr2[10]),
	.C(IOvalue2[10]),
	.D(\tc2.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0022_),
	.Cout(),
	.Q());
defparam syn__1474_.coord_x = 12;
defparam syn__1474_.coord_y = 4;
defparam syn__1474_.coord_z = 8;
defparam syn__1474_.mask = 16'h330F;
defparam syn__1474_.modeMux = 1'b0;
defparam syn__1474_.FeedbackMux = 1'b0;
defparam syn__1474_.ShiftMux = 1'b0;
defparam syn__1474_.BypassEn = 1'b0;
defparam syn__1474_.CarryEnb = 1'b1;

alta_slice syn__1475_(
	.A(vcc),
	.B(IOaddr2[12]),
	.C(\tc2.IM [7]),
	.D(\tc2.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0023_),
	.Cout(),
	.Q());
defparam syn__1475_.coord_x = 12;
defparam syn__1475_.coord_y = 4;
defparam syn__1475_.coord_z = 6;
defparam syn__1475_.mask = 16'h0FC3;
defparam syn__1475_.modeMux = 1'b0;
defparam syn__1475_.FeedbackMux = 1'b0;
defparam syn__1475_.ShiftMux = 1'b0;
defparam syn__1475_.BypassEn = 1'b0;
defparam syn__1475_.CarryEnb = 1'b1;

alta_slice syn__1476_(
	.A(IOvalue2[12]),
	.B(IOaddr2[12]),
	.C(vcc),
	.D(\tc2.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0024_),
	.Cout(),
	.Q());
defparam syn__1476_.coord_x = 12;
defparam syn__1476_.coord_y = 4;
defparam syn__1476_.coord_z = 9;
defparam syn__1476_.mask = 16'h3355;
defparam syn__1476_.modeMux = 1'b0;
defparam syn__1476_.FeedbackMux = 1'b0;
defparam syn__1476_.ShiftMux = 1'b0;
defparam syn__1476_.BypassEn = 1'b0;
defparam syn__1476_.CarryEnb = 1'b1;

alta_slice syn__1477_(
	.A(IOaddr2[11]),
	.B(IOvalue2[11]),
	.C(\tc2.IM [7]),
	.D(\tc2.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0025_),
	.Cout(),
	.Q());
defparam syn__1477_.coord_x = 12;
defparam syn__1477_.coord_y = 4;
defparam syn__1477_.coord_z = 10;
defparam syn__1477_.mask = 16'hA048;
defparam syn__1477_.modeMux = 1'b0;
defparam syn__1477_.FeedbackMux = 1'b0;
defparam syn__1477_.ShiftMux = 1'b0;
defparam syn__1477_.BypassEn = 1'b0;
defparam syn__1477_.CarryEnb = 1'b1;

alta_slice syn__1478_(
	.A(IOaddr2[14]),
	.B(IOvalue2[14]),
	.C(\tc2.IM [7]),
	.D(\tc2.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0026_),
	.Cout(),
	.Q());
defparam syn__1478_.coord_x = 11;
defparam syn__1478_.coord_y = 2;
defparam syn__1478_.coord_z = 3;
defparam syn__1478_.mask = 16'h5A96;
defparam syn__1478_.modeMux = 1'b0;
defparam syn__1478_.FeedbackMux = 1'b0;
defparam syn__1478_.ShiftMux = 1'b0;
defparam syn__1478_.BypassEn = 1'b0;
defparam syn__1478_.CarryEnb = 1'b1;

alta_slice syn__1479_(
	.A(\tc2.IM [8]),
	.B(\tc2.IM [7]),
	.C(IOvalue2[13]),
	.D(IOaddr2[13]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0027_),
	.Cout(),
	.Q());
defparam syn__1479_.coord_x = 12;
defparam syn__1479_.coord_y = 2;
defparam syn__1479_.coord_z = 6;
defparam syn__1479_.mask = 16'h0423;
defparam syn__1479_.modeMux = 1'b0;
defparam syn__1479_.FeedbackMux = 1'b0;
defparam syn__1479_.ShiftMux = 1'b0;
defparam syn__1479_.BypassEn = 1'b0;
defparam syn__1479_.CarryEnb = 1'b1;

alta_slice syn__1480_(
	.A(\tc2.IM [8]),
	.B(\tc2.IM [7]),
	.C(IOvalue2[13]),
	.D(IOaddr2[13]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0028_),
	.Cout(),
	.Q());
defparam syn__1480_.coord_x = 12;
defparam syn__1480_.coord_y = 2;
defparam syn__1480_.coord_z = 2;
defparam syn__1480_.mask = 16'h9840;
defparam syn__1480_.modeMux = 1'b0;
defparam syn__1480_.FeedbackMux = 1'b0;
defparam syn__1480_.ShiftMux = 1'b0;
defparam syn__1480_.BypassEn = 1'b0;
defparam syn__1480_.CarryEnb = 1'b1;

alta_slice syn__1481_(
	.A(vcc),
	.B(\tc2.IM [7]),
	.C(IOaddr2[15]),
	.D(\tc2.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0029_),
	.Cout(),
	.Q());
defparam syn__1481_.coord_x = 12;
defparam syn__1481_.coord_y = 2;
defparam syn__1481_.coord_z = 8;
defparam syn__1481_.mask = 16'h33C3;
defparam syn__1481_.modeMux = 1'b0;
defparam syn__1481_.FeedbackMux = 1'b0;
defparam syn__1481_.ShiftMux = 1'b0;
defparam syn__1481_.BypassEn = 1'b0;
defparam syn__1481_.CarryEnb = 1'b1;

alta_slice syn__1482_(
	.A(vcc),
	.B(IOvalue2[15]),
	.C(IOaddr2[15]),
	.D(\tc2.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0030_),
	.Cout(),
	.Q());
defparam syn__1482_.coord_x = 12;
defparam syn__1482_.coord_y = 2;
defparam syn__1482_.coord_z = 7;
defparam syn__1482_.mask = 16'h0F33;
defparam syn__1482_.modeMux = 1'b0;
defparam syn__1482_.FeedbackMux = 1'b0;
defparam syn__1482_.ShiftMux = 1'b0;
defparam syn__1482_.BypassEn = 1'b0;
defparam syn__1482_.CarryEnb = 1'b1;

alta_slice syn__1483_(
	.A(\tc2.IM [8]),
	.B(IOvalue2[14]),
	.C(\tc2.IM [7]),
	.D(IOaddr2[14]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0031_),
	.Cout(),
	.Q());
defparam syn__1483_.coord_x = 12;
defparam syn__1483_.coord_y = 2;
defparam syn__1483_.coord_z = 14;
defparam syn__1483_.mask = 16'hA440;
defparam syn__1483_.modeMux = 1'b0;
defparam syn__1483_.FeedbackMux = 1'b0;
defparam syn__1483_.ShiftMux = 1'b0;
defparam syn__1483_.BypassEn = 1'b0;
defparam syn__1483_.CarryEnb = 1'b1;

alta_slice syn__1484_(
	.A(vcc),
	.B(IOaddr2[16]),
	.C(\tc2.IM [7]),
	.D(\tc2.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0032_),
	.Cout(),
	.Q());
defparam syn__1484_.coord_x = 12;
defparam syn__1484_.coord_y = 1;
defparam syn__1484_.coord_z = 9;
defparam syn__1484_.mask = 16'h0FC3;
defparam syn__1484_.modeMux = 1'b0;
defparam syn__1484_.FeedbackMux = 1'b0;
defparam syn__1484_.ShiftMux = 1'b0;
defparam syn__1484_.BypassEn = 1'b0;
defparam syn__1484_.CarryEnb = 1'b1;

alta_slice syn__1485_(
	.A(vcc),
	.B(IOaddr2[16]),
	.C(IOvalue2[16]),
	.D(\tc2.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0033_),
	.Cout(),
	.Q());
defparam syn__1485_.coord_x = 12;
defparam syn__1485_.coord_y = 1;
defparam syn__1485_.coord_z = 10;
defparam syn__1485_.mask = 16'h330F;
defparam syn__1485_.modeMux = 1'b0;
defparam syn__1485_.FeedbackMux = 1'b0;
defparam syn__1485_.ShiftMux = 1'b0;
defparam syn__1485_.BypassEn = 1'b0;
defparam syn__1485_.CarryEnb = 1'b1;

alta_slice syn__1486_(
	.A(IOaddr2[17]),
	.B(IOvalue2[17]),
	.C(\tc2.IM [7]),
	.D(\tc2.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0034_),
	.Cout(),
	.Q());
defparam syn__1486_.coord_x = 12;
defparam syn__1486_.coord_y = 1;
defparam syn__1486_.coord_z = 7;
defparam syn__1486_.mask = 16'hA048;
defparam syn__1486_.modeMux = 1'b0;
defparam syn__1486_.FeedbackMux = 1'b0;
defparam syn__1486_.ShiftMux = 1'b0;
defparam syn__1486_.BypassEn = 1'b0;
defparam syn__1486_.CarryEnb = 1'b1;

alta_slice syn__1487_(
	.A(IOvalue2[18]),
	.B(\tc2.IM [7]),
	.C(\tc2.IM [8]),
	.D(IOaddr2[18]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0035_),
	.Cout(),
	.Q());
defparam syn__1487_.coord_x = 9;
defparam syn__1487_.coord_y = 3;
defparam syn__1487_.coord_z = 13;
defparam syn__1487_.mask = 16'hC208;
defparam syn__1487_.modeMux = 1'b0;
defparam syn__1487_.FeedbackMux = 1'b0;
defparam syn__1487_.ShiftMux = 1'b0;
defparam syn__1487_.BypassEn = 1'b0;
defparam syn__1487_.CarryEnb = 1'b1;

alta_slice syn__1488_(
	.A(IOaddr2[18]),
	.B(\tc2.IM [7]),
	.C(\tc2.IM [8]),
	.D(IOvalue2[18]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0036_),
	.Cout(),
	.Q());
defparam syn__1488_.coord_x = 9;
defparam syn__1488_.coord_y = 3;
defparam syn__1488_.coord_z = 9;
defparam syn__1488_.mask = 16'h6966;
defparam syn__1488_.modeMux = 1'b0;
defparam syn__1488_.FeedbackMux = 1'b0;
defparam syn__1488_.ShiftMux = 1'b0;
defparam syn__1488_.BypassEn = 1'b0;
defparam syn__1488_.CarryEnb = 1'b1;

alta_slice syn__1489_(
	.A(IOaddr2[17]),
	.B(IOvalue2[17]),
	.C(\tc2.IM [7]),
	.D(\tc2.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0037_),
	.Cout(),
	.Q());
defparam syn__1489_.coord_x = 12;
defparam syn__1489_.coord_y = 1;
defparam syn__1489_.coord_z = 13;
defparam syn__1489_.mask = 16'h0521;
defparam syn__1489_.modeMux = 1'b0;
defparam syn__1489_.FeedbackMux = 1'b0;
defparam syn__1489_.ShiftMux = 1'b0;
defparam syn__1489_.BypassEn = 1'b0;
defparam syn__1489_.CarryEnb = 1'b1;

alta_slice syn__1490_(
	.A(IOaddr2[20]),
	.B(IOvalue2[20]),
	.C(\tc2.IM [7]),
	.D(\tc2.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0038_),
	.Cout(),
	.Q());
defparam syn__1490_.coord_x = 5;
defparam syn__1490_.coord_y = 3;
defparam syn__1490_.coord_z = 9;
defparam syn__1490_.mask = 16'h5A96;
defparam syn__1490_.modeMux = 1'b0;
defparam syn__1490_.FeedbackMux = 1'b0;
defparam syn__1490_.ShiftMux = 1'b0;
defparam syn__1490_.BypassEn = 1'b0;
defparam syn__1490_.CarryEnb = 1'b1;

alta_slice syn__1491_(
	.A(IOvalue2[19]),
	.B(IOaddr2[19]),
	.C(\tc2.IM [7]),
	.D(\tc2.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0039_),
	.Cout(),
	.Q());
defparam syn__1491_.coord_x = 5;
defparam syn__1491_.coord_y = 3;
defparam syn__1491_.coord_z = 14;
defparam syn__1491_.mask = 16'hC028;
defparam syn__1491_.modeMux = 1'b0;
defparam syn__1491_.FeedbackMux = 1'b0;
defparam syn__1491_.ShiftMux = 1'b0;
defparam syn__1491_.BypassEn = 1'b0;
defparam syn__1491_.CarryEnb = 1'b1;

alta_slice syn__1492_(
	.A(IOaddr2[19]),
	.B(IOvalue2[19]),
	.C(\tc2.IM [7]),
	.D(\tc2.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0040_),
	.Cout(),
	.Q());
defparam syn__1492_.coord_x = 5;
defparam syn__1492_.coord_y = 3;
defparam syn__1492_.coord_z = 7;
defparam syn__1492_.mask = 16'h0521;
defparam syn__1492_.modeMux = 1'b0;
defparam syn__1492_.FeedbackMux = 1'b0;
defparam syn__1492_.ShiftMux = 1'b0;
defparam syn__1492_.BypassEn = 1'b0;
defparam syn__1492_.CarryEnb = 1'b1;

alta_slice syn__1493_(
	.A(vcc),
	.B(\tc2.IM [7]),
	.C(IOaddr2[21]),
	.D(\tc2.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0041_),
	.Cout(),
	.Q());
defparam syn__1493_.coord_x = 9;
defparam syn__1493_.coord_y = 4;
defparam syn__1493_.coord_z = 9;
defparam syn__1493_.mask = 16'h33C3;
defparam syn__1493_.modeMux = 1'b0;
defparam syn__1493_.FeedbackMux = 1'b0;
defparam syn__1493_.ShiftMux = 1'b0;
defparam syn__1493_.BypassEn = 1'b0;
defparam syn__1493_.CarryEnb = 1'b1;

alta_slice syn__1494_(
	.A(IOvalue2[21]),
	.B(IOaddr2[21]),
	.C(vcc),
	.D(\tc2.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0042_),
	.Cout(),
	.Q());
defparam syn__1494_.coord_x = 9;
defparam syn__1494_.coord_y = 4;
defparam syn__1494_.coord_z = 2;
defparam syn__1494_.mask = 16'h3355;
defparam syn__1494_.modeMux = 1'b0;
defparam syn__1494_.FeedbackMux = 1'b0;
defparam syn__1494_.ShiftMux = 1'b0;
defparam syn__1494_.BypassEn = 1'b0;
defparam syn__1494_.CarryEnb = 1'b1;

alta_slice syn__1495_(
	.A(IOvalue2[20]),
	.B(\tc2.IM [7]),
	.C(IOaddr2[20]),
	.D(\tc2.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0043_),
	.Cout(),
	.Q());
defparam syn__1495_.coord_x = 9;
defparam syn__1495_.coord_y = 4;
defparam syn__1495_.coord_z = 5;
defparam syn__1495_.mask = 16'hC028;
defparam syn__1495_.modeMux = 1'b0;
defparam syn__1495_.FeedbackMux = 1'b0;
defparam syn__1495_.ShiftMux = 1'b0;
defparam syn__1495_.BypassEn = 1'b0;
defparam syn__1495_.CarryEnb = 1'b1;

alta_slice syn__1496_(
	.A(IOvalue2[23]),
	.B(\tc2.IM [7]),
	.C(IOaddr2[23]),
	.D(\tc2.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0044_),
	.Cout(),
	.Q());
defparam syn__1496_.coord_x = 9;
defparam syn__1496_.coord_y = 4;
defparam syn__1496_.coord_z = 11;
defparam syn__1496_.mask = 16'hC028;
defparam syn__1496_.modeMux = 1'b0;
defparam syn__1496_.FeedbackMux = 1'b0;
defparam syn__1496_.ShiftMux = 1'b0;
defparam syn__1496_.BypassEn = 1'b0;
defparam syn__1496_.CarryEnb = 1'b1;

alta_slice syn__1497_(
	.A(IOaddr2[22]),
	.B(\tc2.IM [8]),
	.C(vcc),
	.D(\tc2.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0045_),
	.Cout(),
	.Q());
defparam syn__1497_.coord_x = 8;
defparam syn__1497_.coord_y = 4;
defparam syn__1497_.coord_z = 13;
defparam syn__1497_.mask = 16'h22DD;
defparam syn__1497_.modeMux = 1'b0;
defparam syn__1497_.FeedbackMux = 1'b0;
defparam syn__1497_.ShiftMux = 1'b0;
defparam syn__1497_.BypassEn = 1'b0;
defparam syn__1497_.CarryEnb = 1'b1;

alta_slice syn__1498_(
	.A(IOvalue2[22]),
	.B(\tc2.IM [8]),
	.C(IOaddr2[22]),
	.D(vcc),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0046_),
	.Cout(),
	.Q());
defparam syn__1498_.coord_x = 8;
defparam syn__1498_.coord_y = 4;
defparam syn__1498_.coord_z = 11;
defparam syn__1498_.mask = 16'h1D1D;
defparam syn__1498_.modeMux = 1'b0;
defparam syn__1498_.FeedbackMux = 1'b0;
defparam syn__1498_.ShiftMux = 1'b0;
defparam syn__1498_.BypassEn = 1'b0;
defparam syn__1498_.CarryEnb = 1'b1;

alta_slice syn__1499_(
	.A(IOvalue2[24]),
	.B(\tc2.IM [7]),
	.C(IOaddr2[24]),
	.D(\tc2.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0047_),
	.Cout(),
	.Q());
defparam syn__1499_.coord_x = 9;
defparam syn__1499_.coord_y = 4;
defparam syn__1499_.coord_z = 3;
defparam syn__1499_.mask = 16'hC028;
defparam syn__1499_.modeMux = 1'b0;
defparam syn__1499_.FeedbackMux = 1'b0;
defparam syn__1499_.ShiftMux = 1'b0;
defparam syn__1499_.BypassEn = 1'b0;
defparam syn__1499_.CarryEnb = 1'b1;

alta_slice syn__1500_(
	.A(IOvalue2[24]),
	.B(\tc2.IM [7]),
	.C(IOaddr2[24]),
	.D(\tc2.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0048_),
	.Cout(),
	.Q());
defparam syn__1500_.coord_x = 9;
defparam syn__1500_.coord_y = 4;
defparam syn__1500_.coord_z = 4;
defparam syn__1500_.mask = 16'h3C96;
defparam syn__1500_.modeMux = 1'b0;
defparam syn__1500_.FeedbackMux = 1'b0;
defparam syn__1500_.ShiftMux = 1'b0;
defparam syn__1500_.BypassEn = 1'b0;
defparam syn__1500_.CarryEnb = 1'b1;

alta_slice syn__1501_(
	.A(IOvalue2[23]),
	.B(\tc2.IM [7]),
	.C(IOaddr2[23]),
	.D(\tc2.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0049_),
	.Cout(),
	.Q());
defparam syn__1501_.coord_x = 9;
defparam syn__1501_.coord_y = 4;
defparam syn__1501_.coord_z = 12;
defparam syn__1501_.mask = 16'h0341;
defparam syn__1501_.modeMux = 1'b0;
defparam syn__1501_.FeedbackMux = 1'b0;
defparam syn__1501_.ShiftMux = 1'b0;
defparam syn__1501_.BypassEn = 1'b0;
defparam syn__1501_.CarryEnb = 1'b1;

alta_slice syn__1502_(
	.A(IOaddr2[26]),
	.B(IOvalue2[26]),
	.C(\tc2.IM [7]),
	.D(\tc2.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0050_),
	.Cout(),
	.Q());
defparam syn__1502_.coord_x = 5;
defparam syn__1502_.coord_y = 5;
defparam syn__1502_.coord_z = 5;
defparam syn__1502_.mask = 16'h5A96;
defparam syn__1502_.modeMux = 1'b0;
defparam syn__1502_.FeedbackMux = 1'b0;
defparam syn__1502_.ShiftMux = 1'b0;
defparam syn__1502_.BypassEn = 1'b0;
defparam syn__1502_.CarryEnb = 1'b1;

alta_slice syn__1503_(
	.A(IOvalue2[25]),
	.B(IOaddr2[25]),
	.C(\tc2.IM [7]),
	.D(\tc2.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0051_),
	.Cout(),
	.Q());
defparam syn__1503_.coord_x = 5;
defparam syn__1503_.coord_y = 4;
defparam syn__1503_.coord_z = 4;
defparam syn__1503_.mask = 16'hC028;
defparam syn__1503_.modeMux = 1'b0;
defparam syn__1503_.FeedbackMux = 1'b0;
defparam syn__1503_.ShiftMux = 1'b0;
defparam syn__1503_.BypassEn = 1'b0;
defparam syn__1503_.CarryEnb = 1'b1;

alta_slice syn__1504_(
	.A(IOaddr2[25]),
	.B(IOvalue2[25]),
	.C(\tc2.IM [7]),
	.D(\tc2.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0052_),
	.Cout(),
	.Q());
defparam syn__1504_.coord_x = 5;
defparam syn__1504_.coord_y = 4;
defparam syn__1504_.coord_z = 5;
defparam syn__1504_.mask = 16'h0521;
defparam syn__1504_.modeMux = 1'b0;
defparam syn__1504_.FeedbackMux = 1'b0;
defparam syn__1504_.ShiftMux = 1'b0;
defparam syn__1504_.BypassEn = 1'b0;
defparam syn__1504_.CarryEnb = 1'b1;

alta_slice syn__1505_(
	.A(vcc),
	.B(\tc2.IM [7]),
	.C(IOaddr2[27]),
	.D(\tc2.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0053_),
	.Cout(),
	.Q());
defparam syn__1505_.coord_x = 5;
defparam syn__1505_.coord_y = 5;
defparam syn__1505_.coord_z = 14;
defparam syn__1505_.mask = 16'h33C3;
defparam syn__1505_.modeMux = 1'b0;
defparam syn__1505_.FeedbackMux = 1'b0;
defparam syn__1505_.ShiftMux = 1'b0;
defparam syn__1505_.BypassEn = 1'b0;
defparam syn__1505_.CarryEnb = 1'b1;

alta_slice syn__1506_(
	.A(IOvalue2[27]),
	.B(IOaddr2[27]),
	.C(vcc),
	.D(\tc2.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0054_),
	.Cout(),
	.Q());
defparam syn__1506_.coord_x = 5;
defparam syn__1506_.coord_y = 5;
defparam syn__1506_.coord_z = 9;
defparam syn__1506_.mask = 16'h3355;
defparam syn__1506_.modeMux = 1'b0;
defparam syn__1506_.FeedbackMux = 1'b0;
defparam syn__1506_.ShiftMux = 1'b0;
defparam syn__1506_.BypassEn = 1'b0;
defparam syn__1506_.CarryEnb = 1'b1;

alta_slice syn__1507_(
	.A(IOvalue2[26]),
	.B(IOaddr2[26]),
	.C(\tc2.IM [7]),
	.D(\tc2.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0055_),
	.Cout(),
	.Q());
defparam syn__1507_.coord_x = 5;
defparam syn__1507_.coord_y = 5;
defparam syn__1507_.coord_z = 15;
defparam syn__1507_.mask = 16'hC028;
defparam syn__1507_.modeMux = 1'b0;
defparam syn__1507_.FeedbackMux = 1'b0;
defparam syn__1507_.ShiftMux = 1'b0;
defparam syn__1507_.BypassEn = 1'b0;
defparam syn__1507_.CarryEnb = 1'b1;

alta_slice syn__1508_(
	.A(IOaddr2[29]),
	.B(IOvalue2[29]),
	.C(\tc2.IM [7]),
	.D(\tc2.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0056_),
	.Cout(),
	.Q());
defparam syn__1508_.coord_x = 5;
defparam syn__1508_.coord_y = 5;
defparam syn__1508_.coord_z = 11;
defparam syn__1508_.mask = 16'h0521;
defparam syn__1508_.modeMux = 1'b0;
defparam syn__1508_.FeedbackMux = 1'b0;
defparam syn__1508_.ShiftMux = 1'b0;
defparam syn__1508_.BypassEn = 1'b0;
defparam syn__1508_.CarryEnb = 1'b1;

alta_slice syn__1509_(
	.A(\tc2.IM [7]),
	.B(IOaddr2[28]),
	.C(\tc2.IM [8]),
	.D(vcc),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0057_),
	.Cout(),
	.Q());
defparam syn__1509_.coord_x = 6;
defparam syn__1509_.coord_y = 4;
defparam syn__1509_.coord_z = 13;
defparam syn__1509_.mask = 16'h5959;
defparam syn__1509_.modeMux = 1'b0;
defparam syn__1509_.FeedbackMux = 1'b0;
defparam syn__1509_.ShiftMux = 1'b0;
defparam syn__1509_.BypassEn = 1'b0;
defparam syn__1509_.CarryEnb = 1'b1;

alta_slice syn__1510_(
	.A(IOvalue2[28]),
	.B(IOaddr2[28]),
	.C(\tc2.IM [8]),
	.D(vcc),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0058_),
	.Cout(),
	.Q());
defparam syn__1510_.coord_x = 6;
defparam syn__1510_.coord_y = 4;
defparam syn__1510_.coord_z = 6;
defparam syn__1510_.mask = 16'h3535;
defparam syn__1510_.modeMux = 1'b0;
defparam syn__1510_.FeedbackMux = 1'b0;
defparam syn__1510_.ShiftMux = 1'b0;
defparam syn__1510_.BypassEn = 1'b0;
defparam syn__1510_.CarryEnb = 1'b1;

alta_slice syn__1511_(
	.A(IOvalue2[30]),
	.B(IOaddr2[30]),
	.C(\tc2.IM [7]),
	.D(\tc2.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0059_),
	.Cout(),
	.Q());
defparam syn__1511_.coord_x = 5;
defparam syn__1511_.coord_y = 5;
defparam syn__1511_.coord_z = 3;
defparam syn__1511_.mask = 16'hC028;
defparam syn__1511_.modeMux = 1'b0;
defparam syn__1511_.FeedbackMux = 1'b0;
defparam syn__1511_.ShiftMux = 1'b0;
defparam syn__1511_.BypassEn = 1'b0;
defparam syn__1511_.CarryEnb = 1'b1;

alta_slice syn__1512_(
	.A(IOvalue2[30]),
	.B(\tc2.IM [7]),
	.C(IOaddr2[30]),
	.D(\tc2.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0060_),
	.Cout(),
	.Q());
defparam syn__1512_.coord_x = 5;
defparam syn__1512_.coord_y = 5;
defparam syn__1512_.coord_z = 6;
defparam syn__1512_.mask = 16'h3C96;
defparam syn__1512_.modeMux = 1'b0;
defparam syn__1512_.FeedbackMux = 1'b0;
defparam syn__1512_.ShiftMux = 1'b0;
defparam syn__1512_.BypassEn = 1'b0;
defparam syn__1512_.CarryEnb = 1'b1;

alta_slice syn__1513_(
	.A(IOvalue2[29]),
	.B(IOaddr2[29]),
	.C(\tc2.IM [7]),
	.D(\tc2.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0061_),
	.Cout(),
	.Q());
defparam syn__1513_.coord_x = 5;
defparam syn__1513_.coord_y = 4;
defparam syn__1513_.coord_z = 10;
defparam syn__1513_.mask = 16'hC028;
defparam syn__1513_.modeMux = 1'b0;
defparam syn__1513_.FeedbackMux = 1'b0;
defparam syn__1513_.ShiftMux = 1'b0;
defparam syn__1513_.BypassEn = 1'b0;
defparam syn__1513_.CarryEnb = 1'b1;

alta_slice syn__1514_(
	.A(syn__0065_),
	.B(IOaddr2[31]),
	.C(IOvalue2[31]),
	.D(syn__0063_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0062_),
	.Cout(),
	.Q());
defparam syn__1514_.coord_x = 5;
defparam syn__1514_.coord_y = 3;
defparam syn__1514_.coord_z = 1;
defparam syn__1514_.mask = 16'h00D7;
defparam syn__1514_.modeMux = 1'b0;
defparam syn__1514_.FeedbackMux = 1'b0;
defparam syn__1514_.ShiftMux = 1'b0;
defparam syn__1514_.BypassEn = 1'b0;
defparam syn__1514_.CarryEnb = 1'b1;

alta_slice syn__1515_(
	.A(IOaddr2[31]),
	.B(IOvalue2[31]),
	.C(\tc2.IM [7]),
	.D(syn__0064_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0063_),
	.Cout(),
	.Q());
defparam syn__1515_.coord_x = 6;
defparam syn__1515_.coord_y = 4;
defparam syn__1515_.coord_z = 5;
defparam syn__1515_.mask = 16'hE800;
defparam syn__1515_.modeMux = 1'b0;
defparam syn__1515_.FeedbackMux = 1'b0;
defparam syn__1515_.ShiftMux = 1'b0;
defparam syn__1515_.BypassEn = 1'b0;
defparam syn__1515_.CarryEnb = 1'b1;

alta_slice syn__1516_(
	.A(vcc),
	.B(vcc),
	.C(\tc2.IM [8]),
	.D(\tc2.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0064_),
	.Cout(),
	.Q());
defparam syn__1516_.coord_x = 6;
defparam syn__1516_.coord_y = 4;
defparam syn__1516_.coord_z = 3;
defparam syn__1516_.mask = 16'h0F00;
defparam syn__1516_.modeMux = 1'b0;
defparam syn__1516_.FeedbackMux = 1'b0;
defparam syn__1516_.ShiftMux = 1'b0;
defparam syn__1516_.BypassEn = 1'b0;
defparam syn__1516_.CarryEnb = 1'b1;

alta_slice syn__1517_(
	.A(\tc2.IM [7]),
	.B(vcc),
	.C(\tc2.IM [9]),
	.D(\tc2.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0065_),
	.Cout(),
	.Q());
defparam syn__1517_.coord_x = 5;
defparam syn__1517_.coord_y = 3;
defparam syn__1517_.coord_z = 4;
defparam syn__1517_.mask = 16'hA000;
defparam syn__1517_.modeMux = 1'b0;
defparam syn__1517_.FeedbackMux = 1'b0;
defparam syn__1517_.ShiftMux = 1'b0;
defparam syn__1517_.BypassEn = 1'b0;
defparam syn__1517_.CarryEnb = 1'b1;

alta_slice syn__1518_(
	.A(\tc2.IM [7]),
	.B(IOvalue2[31]),
	.C(\tc2.IM [8]),
	.D(IOaddr2[31]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0066_),
	.Cout(),
	.Q());
defparam syn__1518_.coord_x = 6;
defparam syn__1518_.coord_y = 6;
defparam syn__1518_.coord_z = 13;
defparam syn__1518_.mask = 16'hA659;
defparam syn__1518_.modeMux = 1'b0;
defparam syn__1518_.FeedbackMux = 1'b0;
defparam syn__1518_.ShiftMux = 1'b0;
defparam syn__1518_.BypassEn = 1'b0;
defparam syn__1518_.CarryEnb = 1'b1;

alta_slice syn__1519_(
	.A(syn__0068_),
	.B(syn__0075_),
	.C(syn__0074_),
	.D(syn__0077_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0067_),
	.Cout(),
	.Q());
defparam syn__1519_.coord_x = 7;
defparam syn__1519_.coord_y = 4;
defparam syn__1519_.coord_z = 3;
defparam syn__1519_.mask = 16'h08AA;
defparam syn__1519_.modeMux = 1'b0;
defparam syn__1519_.FeedbackMux = 1'b0;
defparam syn__1519_.ShiftMux = 1'b0;
defparam syn__1519_.BypassEn = 1'b0;
defparam syn__1519_.CarryEnb = 1'b1;

alta_slice syn__1520_(
	.A(syn__0073_),
	.B(syn__0668_),
	.C(syn__0072_),
	.D(syn__0670_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0068_),
	.Cout(),
	.Q());
defparam syn__1520_.coord_x = 7;
defparam syn__1520_.coord_y = 4;
defparam syn__1520_.coord_z = 2;
defparam syn__1520_.mask = 16'hDD0D;
defparam syn__1520_.modeMux = 1'b0;
defparam syn__1520_.FeedbackMux = 1'b0;
defparam syn__1520_.ShiftMux = 1'b0;
defparam syn__1520_.BypassEn = 1'b0;
defparam syn__1520_.CarryEnb = 1'b1;

alta_slice syn__1521_(
	.A(vcc),
	.B(syn__0045_),
	.C(syn__1084_),
	.D(syn__0046_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0069_),
	.Cout(),
	.Q());
defparam syn__1521_.coord_x = 8;
defparam syn__1521_.coord_y = 4;
defparam syn__1521_.coord_z = 8;
defparam syn__1521_.mask = 16'hFCC0;
defparam syn__1521_.modeMux = 1'b0;
defparam syn__1521_.FeedbackMux = 1'b0;
defparam syn__1521_.ShiftMux = 1'b0;
defparam syn__1521_.BypassEn = 1'b0;
defparam syn__1521_.CarryEnb = 1'b1;

alta_slice syn__1522_(
	.A(vcc),
	.B(vcc),
	.C(syn__0049_),
	.D(syn__0044_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0070_),
	.Cout(),
	.Q());
defparam syn__1522_.coord_x = 8;
defparam syn__1522_.coord_y = 4;
defparam syn__1522_.coord_z = 14;
defparam syn__1522_.mask = 16'h000F;
defparam syn__1522_.modeMux = 1'b0;
defparam syn__1522_.FeedbackMux = 1'b0;
defparam syn__1522_.ShiftMux = 1'b0;
defparam syn__1522_.BypassEn = 1'b0;
defparam syn__1522_.CarryEnb = 1'b1;

alta_slice syn__1523_(
	.A(vcc),
	.B(vcc),
	.C(syn__0015_),
	.D(syn__0016_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0071_),
	.Cout(),
	.Q());
defparam syn__1523_.coord_x = 4;
defparam syn__1523_.coord_y = 2;
defparam syn__1523_.coord_z = 14;
defparam syn__1523_.mask = 16'h000F;
defparam syn__1523_.modeMux = 1'b0;
defparam syn__1523_.FeedbackMux = 1'b0;
defparam syn__1523_.ShiftMux = 1'b0;
defparam syn__1523_.BypassEn = 1'b0;
defparam syn__1523_.CarryEnb = 1'b1;

alta_slice syn__1524_(
	.A(vcc),
	.B(vcc),
	.C(\tc2.IM [6]),
	.D(\tc2.IM [5]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0072_),
	.Cout(),
	.Q());
defparam syn__1524_.coord_x = 7;
defparam syn__1524_.coord_y = 3;
defparam syn__1524_.coord_z = 7;
defparam syn__1524_.mask = 16'hF000;
defparam syn__1524_.modeMux = 1'b0;
defparam syn__1524_.FeedbackMux = 1'b0;
defparam syn__1524_.ShiftMux = 1'b0;
defparam syn__1524_.BypassEn = 1'b0;
defparam syn__1524_.CarryEnb = 1'b1;

alta_slice syn__1525_(
	.A(vcc),
	.B(vcc),
	.C(\tc2.IM [6]),
	.D(\tc2.IM [5]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0073_),
	.Cout(),
	.Q());
defparam syn__1525_.coord_x = 7;
defparam syn__1525_.coord_y = 3;
defparam syn__1525_.coord_z = 5;
defparam syn__1525_.mask = 16'h000F;
defparam syn__1525_.modeMux = 1'b0;
defparam syn__1525_.FeedbackMux = 1'b0;
defparam syn__1525_.ShiftMux = 1'b0;
defparam syn__1525_.BypassEn = 1'b0;
defparam syn__1525_.CarryEnb = 1'b1;

alta_slice syn__1526_(
	.A(\tc2.IM [9]),
	.B(syn__0049_),
	.C(syn__0048_),
	.D(syn__1083_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0074_),
	.Cout(),
	.Q());
defparam syn__1526_.coord_x = 7;
defparam syn__1526_.coord_y = 4;
defparam syn__1526_.coord_z = 6;
defparam syn__1526_.mask = 16'h5041;
defparam syn__1526_.modeMux = 1'b0;
defparam syn__1526_.FeedbackMux = 1'b0;
defparam syn__1526_.ShiftMux = 1'b0;
defparam syn__1526_.BypassEn = 1'b0;
defparam syn__1526_.CarryEnb = 1'b1;

alta_slice syn__1527_(
	.A(IOvalue2[24]),
	.B(IOaddr2[24]),
	.C(syn__0076_),
	.D(syn__0065_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0075_),
	.Cout(),
	.Q());
defparam syn__1527_.coord_x = 7;
defparam syn__1527_.coord_y = 4;
defparam syn__1527_.coord_z = 11;
defparam syn__1527_.mask = 16'h090F;
defparam syn__1527_.modeMux = 1'b0;
defparam syn__1527_.FeedbackMux = 1'b0;
defparam syn__1527_.ShiftMux = 1'b0;
defparam syn__1527_.BypassEn = 1'b0;
defparam syn__1527_.CarryEnb = 1'b1;

alta_slice syn__1528_(
	.A(IOaddr2[24]),
	.B(IOvalue2[24]),
	.C(\tc2.IM [7]),
	.D(syn__0064_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0076_),
	.Cout(),
	.Q());
defparam syn__1528_.coord_x = 6;
defparam syn__1528_.coord_y = 4;
defparam syn__1528_.coord_z = 15;
defparam syn__1528_.mask = 16'hE800;
defparam syn__1528_.modeMux = 1'b0;
defparam syn__1528_.FeedbackMux = 1'b0;
defparam syn__1528_.ShiftMux = 1'b0;
defparam syn__1528_.BypassEn = 1'b0;
defparam syn__1528_.CarryEnb = 1'b1;

alta_slice syn__1529_(
	.A(vcc),
	.B(vcc),
	.C(\tc2.IM [6]),
	.D(\tc2.IM [5]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0077_),
	.Cout(),
	.Q());
defparam syn__1529_.coord_x = 7;
defparam syn__1529_.coord_y = 3;
defparam syn__1529_.coord_z = 13;
defparam syn__1529_.mask = 16'h0F00;
defparam syn__1529_.modeMux = 1'b0;
defparam syn__1529_.FeedbackMux = 1'b0;
defparam syn__1529_.ShiftMux = 1'b0;
defparam syn__1529_.BypassEn = 1'b0;
defparam syn__1529_.CarryEnb = 1'b1;

alta_slice syn__1530_(
	.A(vcc),
	.B(vcc),
	.C(\tc2.IM [6]),
	.D(\tc2.IM [5]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0078_),
	.Cout(),
	.Q());
defparam syn__1530_.coord_x = 7;
defparam syn__1530_.coord_y = 3;
defparam syn__1530_.coord_z = 6;
defparam syn__1530_.mask = 16'h00F0;
defparam syn__1530_.modeMux = 1'b0;
defparam syn__1530_.FeedbackMux = 1'b0;
defparam syn__1530_.ShiftMux = 1'b0;
defparam syn__1530_.BypassEn = 1'b0;
defparam syn__1530_.CarryEnb = 1'b1;

alta_slice syn__1531_(
	.A(syn__0077_),
	.B(syn__0080_),
	.C(syn__0090_),
	.D(syn__0091_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0079_),
	.Cout(),
	.Q());
defparam syn__1531_.coord_x = 6;
defparam syn__1531_.coord_y = 3;
defparam syn__1531_.coord_z = 6;
defparam syn__1531_.mask = 16'h4C44;
defparam syn__1531_.modeMux = 1'b0;
defparam syn__1531_.FeedbackMux = 1'b0;
defparam syn__1531_.ShiftMux = 1'b0;
defparam syn__1531_.BypassEn = 1'b0;
defparam syn__1531_.CarryEnb = 1'b1;

alta_slice syn__1532_(
	.A(syn__0073_),
	.B(vcc),
	.C(syn__0086_),
	.D(syn__0081_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0080_),
	.Cout(),
	.Q());
defparam syn__1532_.coord_x = 6;
defparam syn__1532_.coord_y = 3;
defparam syn__1532_.coord_z = 15;
defparam syn__1532_.mask = 16'hF050;
defparam syn__1532_.modeMux = 1'b0;
defparam syn__1532_.FeedbackMux = 1'b0;
defparam syn__1532_.ShiftMux = 1'b0;
defparam syn__1532_.BypassEn = 1'b0;
defparam syn__1532_.CarryEnb = 1'b1;

alta_slice syn__1533_(
	.A(vcc),
	.B(syn__0082_),
	.C(syn__0084_),
	.D(\tc2.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0081_),
	.Cout(),
	.Q());
defparam syn__1533_.coord_x = 6;
defparam syn__1533_.coord_y = 3;
defparam syn__1533_.coord_z = 9;
defparam syn__1533_.mask = 16'hF030;
defparam syn__1533_.modeMux = 1'b0;
defparam syn__1533_.FeedbackMux = 1'b0;
defparam syn__1533_.ShiftMux = 1'b0;
defparam syn__1533_.BypassEn = 1'b0;
defparam syn__1533_.CarryEnb = 1'b1;

alta_slice syn__1534_(
	.A(syn__1080_),
	.B(syn__0083_),
	.C(syn__0058_),
	.D(syn__0057_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0082_),
	.Cout(),
	.Q());
defparam syn__1534_.coord_x = 6;
defparam syn__1534_.coord_y = 3;
defparam syn__1534_.coord_z = 3;
defparam syn__1534_.mask = 16'hC993;
defparam syn__1534_.modeMux = 1'b0;
defparam syn__1534_.FeedbackMux = 1'b0;
defparam syn__1534_.ShiftMux = 1'b0;
defparam syn__1534_.BypassEn = 1'b0;
defparam syn__1534_.CarryEnb = 1'b1;

alta_slice syn__1535_(
	.A(syn__0056_),
	.B(vcc),
	.C(syn__0061_),
	.D(vcc),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0083_),
	.Cout(),
	.Q());
defparam syn__1535_.coord_x = 5;
defparam syn__1535_.coord_y = 4;
defparam syn__1535_.coord_z = 8;
defparam syn__1535_.mask = 16'h0505;
defparam syn__1535_.modeMux = 1'b0;
defparam syn__1535_.FeedbackMux = 1'b0;
defparam syn__1535_.ShiftMux = 1'b0;
defparam syn__1535_.BypassEn = 1'b0;
defparam syn__1535_.CarryEnb = 1'b1;

alta_slice syn__1536_(
	.A(IOvalue2[29]),
	.B(IOaddr2[29]),
	.C(syn__0085_),
	.D(syn__0065_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0084_),
	.Cout(),
	.Q());
defparam syn__1536_.coord_x = 6;
defparam syn__1536_.coord_y = 3;
defparam syn__1536_.coord_z = 10;
defparam syn__1536_.mask = 16'h090F;
defparam syn__1536_.modeMux = 1'b0;
defparam syn__1536_.FeedbackMux = 1'b0;
defparam syn__1536_.ShiftMux = 1'b0;
defparam syn__1536_.BypassEn = 1'b0;
defparam syn__1536_.CarryEnb = 1'b1;

alta_slice syn__1537_(
	.A(IOaddr2[29]),
	.B(IOvalue2[29]),
	.C(\tc2.IM [7]),
	.D(syn__0064_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0085_),
	.Cout(),
	.Q());
defparam syn__1537_.coord_x = 6;
defparam syn__1537_.coord_y = 4;
defparam syn__1537_.coord_z = 2;
defparam syn__1537_.mask = 16'hE800;
defparam syn__1537_.modeMux = 1'b0;
defparam syn__1537_.FeedbackMux = 1'b0;
defparam syn__1537_.ShiftMux = 1'b0;
defparam syn__1537_.BypassEn = 1'b0;
defparam syn__1537_.CarryEnb = 1'b1;

alta_slice syn__1538_(
	.A(syn__0672_),
	.B(syn__0674_),
	.C(\tc2.IM [6]),
	.D(\tc2.IM [5]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0086_),
	.Cout(),
	.Q());
defparam syn__1538_.coord_x = 7;
defparam syn__1538_.coord_y = 3;
defparam syn__1538_.coord_z = 10;
defparam syn__1538_.mask = 16'hAFCF;
defparam syn__1538_.modeMux = 1'b0;
defparam syn__1538_.FeedbackMux = 1'b0;
defparam syn__1538_.ShiftMux = 1'b0;
defparam syn__1538_.BypassEn = 1'b0;
defparam syn__1538_.CarryEnb = 1'b1;

alta_slice syn__1539_(
	.A(syn__0027_),
	.B(syn__1090_),
	.C(syn__0028_),
	.D(\tc2.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0087_),
	.Cout(),
	.Q());
defparam syn__1539_.coord_x = 12;
defparam syn__1539_.coord_y = 2;
defparam syn__1539_.coord_z = 4;
defparam syn__1539_.mask = 16'h0036;
defparam syn__1539_.modeMux = 1'b0;
defparam syn__1539_.FeedbackMux = 1'b0;
defparam syn__1539_.ShiftMux = 1'b0;
defparam syn__1539_.BypassEn = 1'b0;
defparam syn__1539_.CarryEnb = 1'b1;

alta_slice syn__1540_(
	.A(vcc),
	.B(syn__1096_),
	.C(syn__0010_),
	.D(syn__0009_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0088_),
	.Cout(),
	.Q());
defparam syn__1540_.coord_x = 5;
defparam syn__1540_.coord_y = 2;
defparam syn__1540_.coord_z = 3;
defparam syn__1540_.mask = 16'hFCC0;
defparam syn__1540_.modeMux = 1'b0;
defparam syn__1540_.FeedbackMux = 1'b0;
defparam syn__1540_.ShiftMux = 1'b0;
defparam syn__1540_.BypassEn = 1'b0;
defparam syn__1540_.CarryEnb = 1'b1;

alta_slice syn__1541_(
	.A(vcc),
	.B(syn__0008_),
	.C(vcc),
	.D(syn__0013_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0089_),
	.Cout(),
	.Q());
defparam syn__1541_.coord_x = 4;
defparam syn__1541_.coord_y = 2;
defparam syn__1541_.coord_z = 4;
defparam syn__1541_.mask = 16'h0033;
defparam syn__1541_.modeMux = 1'b0;
defparam syn__1541_.FeedbackMux = 1'b0;
defparam syn__1541_.ShiftMux = 1'b0;
defparam syn__1541_.BypassEn = 1'b0;
defparam syn__1541_.CarryEnb = 1'b1;

alta_slice syn__1542_(
	.A(syn__0060_),
	.B(syn__0061_),
	.C(syn__1079_),
	.D(\tc2.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0090_),
	.Cout(),
	.Q());
defparam syn__1542_.coord_x = 5;
defparam syn__1542_.coord_y = 4;
defparam syn__1542_.coord_z = 6;
defparam syn__1542_.mask = 16'h0056;
defparam syn__1542_.modeMux = 1'b0;
defparam syn__1542_.FeedbackMux = 1'b0;
defparam syn__1542_.ShiftMux = 1'b0;
defparam syn__1542_.BypassEn = 1'b0;
defparam syn__1542_.CarryEnb = 1'b1;

alta_slice syn__1543_(
	.A(IOvalue2[30]),
	.B(IOaddr2[30]),
	.C(syn__0092_),
	.D(syn__0065_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0091_),
	.Cout(),
	.Q());
defparam syn__1543_.coord_x = 6;
defparam syn__1543_.coord_y = 3;
defparam syn__1543_.coord_z = 13;
defparam syn__1543_.mask = 16'h090F;
defparam syn__1543_.modeMux = 1'b0;
defparam syn__1543_.FeedbackMux = 1'b0;
defparam syn__1543_.ShiftMux = 1'b0;
defparam syn__1543_.BypassEn = 1'b0;
defparam syn__1543_.CarryEnb = 1'b1;

alta_slice syn__1544_(
	.A(IOaddr2[30]),
	.B(IOvalue2[30]),
	.C(\tc2.IM [7]),
	.D(syn__0064_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0092_),
	.Cout(),
	.Q());
defparam syn__1544_.coord_x = 6;
defparam syn__1544_.coord_y = 4;
defparam syn__1544_.coord_z = 14;
defparam syn__1544_.mask = 16'hE800;
defparam syn__1544_.modeMux = 1'b0;
defparam syn__1544_.FeedbackMux = 1'b0;
defparam syn__1544_.ShiftMux = 1'b0;
defparam syn__1544_.BypassEn = 1'b0;
defparam syn__1544_.CarryEnb = 1'b1;

alta_slice syn__1545_(
	.A(syn__0724_),
	.B(syn__0193_),
	.C(syn__0094_),
	.D(syn__0200_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0093_),
	.Cout(),
	.Q());
defparam syn__1545_.coord_x = 5;
defparam syn__1545_.coord_y = 2;
defparam syn__1545_.coord_z = 6;
defparam syn__1545_.mask = 16'h8000;
defparam syn__1545_.modeMux = 1'b0;
defparam syn__1545_.FeedbackMux = 1'b0;
defparam syn__1545_.ShiftMux = 1'b0;
defparam syn__1545_.BypassEn = 1'b0;
defparam syn__1545_.CarryEnb = 1'b1;

alta_slice syn__1546_(
	.A(syn__0189_),
	.B(syn__0116_),
	.C(syn__0095_),
	.D(syn__0107_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0094_),
	.Cout(),
	.Q());
defparam syn__1546_.coord_x = 5;
defparam syn__1546_.coord_y = 2;
defparam syn__1546_.coord_z = 12;
defparam syn__1546_.mask = 16'h8000;
defparam syn__1546_.modeMux = 1'b0;
defparam syn__1546_.FeedbackMux = 1'b0;
defparam syn__1546_.ShiftMux = 1'b0;
defparam syn__1546_.BypassEn = 1'b0;
defparam syn__1546_.CarryEnb = 1'b1;

alta_slice syn__1547_(
	.A(syn__0077_),
	.B(syn__0097_),
	.C(syn__0102_),
	.D(syn__0676_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0095_),
	.Cout(),
	.Q());
defparam syn__1547_.coord_x = 6;
defparam syn__1547_.coord_y = 4;
defparam syn__1547_.coord_z = 12;
defparam syn__1547_.mask = 16'h3010;
defparam syn__1547_.modeMux = 1'b0;
defparam syn__1547_.FeedbackMux = 1'b0;
defparam syn__1547_.ShiftMux = 1'b0;
defparam syn__1547_.BypassEn = 1'b0;
defparam syn__1547_.CarryEnb = 1'b1;

alta_slice syn__1548_(
	.A(vcc),
	.B(vcc),
	.C(syn__0058_),
	.D(syn__0057_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0096_),
	.Cout(),
	.Q());
defparam syn__1548_.coord_x = 5;
defparam syn__1548_.coord_y = 4;
defparam syn__1548_.coord_z = 2;
defparam syn__1548_.mask = 16'h0FF0;
defparam syn__1548_.modeMux = 1'b0;
defparam syn__1548_.FeedbackMux = 1'b0;
defparam syn__1548_.ShiftMux = 1'b0;
defparam syn__1548_.BypassEn = 1'b0;
defparam syn__1548_.CarryEnb = 1'b1;

alta_slice syn__1549_(
	.A(vcc),
	.B(syn__0100_),
	.C(syn__0098_),
	.D(syn__0073_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0097_),
	.Cout(),
	.Q());
defparam syn__1549_.coord_x = 7;
defparam syn__1549_.coord_y = 2;
defparam syn__1549_.coord_z = 12;
defparam syn__1549_.mask = 16'hF300;
defparam syn__1549_.modeMux = 1'b0;
defparam syn__1549_.FeedbackMux = 1'b0;
defparam syn__1549_.ShiftMux = 1'b0;
defparam syn__1549_.BypassEn = 1'b0;
defparam syn__1549_.CarryEnb = 1'b1;

alta_slice syn__1550_(
	.A(syn__0055_),
	.B(\tc2.IM [9]),
	.C(syn__1081_),
	.D(syn__0099_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0098_),
	.Cout(),
	.Q());
defparam syn__1550_.coord_x = 5;
defparam syn__1550_.coord_y = 4;
defparam syn__1550_.coord_z = 0;
defparam syn__1550_.mask = 16'h0132;
defparam syn__1550_.modeMux = 1'b0;
defparam syn__1550_.FeedbackMux = 1'b0;
defparam syn__1550_.ShiftMux = 1'b0;
defparam syn__1550_.BypassEn = 1'b0;
defparam syn__1550_.CarryEnb = 1'b1;

alta_slice syn__1551_(
	.A(syn__0054_),
	.B(vcc),
	.C(syn__0053_),
	.D(vcc),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0099_),
	.Cout(),
	.Q());
defparam syn__1551_.coord_x = 5;
defparam syn__1551_.coord_y = 4;
defparam syn__1551_.coord_z = 9;
defparam syn__1551_.mask = 16'h5A5A;
defparam syn__1551_.modeMux = 1'b0;
defparam syn__1551_.FeedbackMux = 1'b0;
defparam syn__1551_.ShiftMux = 1'b0;
defparam syn__1551_.BypassEn = 1'b0;
defparam syn__1551_.CarryEnb = 1'b1;

alta_slice syn__1552_(
	.A(IOvalue2[27]),
	.B(IOaddr2[27]),
	.C(syn__0101_),
	.D(syn__0065_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0100_),
	.Cout(),
	.Q());
defparam syn__1552_.coord_x = 7;
defparam syn__1552_.coord_y = 4;
defparam syn__1552_.coord_z = 7;
defparam syn__1552_.mask = 16'h090F;
defparam syn__1552_.modeMux = 1'b0;
defparam syn__1552_.FeedbackMux = 1'b0;
defparam syn__1552_.ShiftMux = 1'b0;
defparam syn__1552_.BypassEn = 1'b0;
defparam syn__1552_.CarryEnb = 1'b1;

alta_slice syn__1553_(
	.A(IOaddr2[27]),
	.B(IOvalue2[27]),
	.C(\tc2.IM [7]),
	.D(syn__0064_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0101_),
	.Cout(),
	.Q());
defparam syn__1553_.coord_x = 6;
defparam syn__1553_.coord_y = 4;
defparam syn__1553_.coord_z = 7;
defparam syn__1553_.mask = 16'hE800;
defparam syn__1553_.modeMux = 1'b0;
defparam syn__1553_.FeedbackMux = 1'b0;
defparam syn__1553_.ShiftMux = 1'b0;
defparam syn__1553_.BypassEn = 1'b0;
defparam syn__1553_.CarryEnb = 1'b1;

alta_slice syn__1554_(
	.A(syn__0680_),
	.B(\tc2.IM [5]),
	.C(\tc2.IM [6]),
	.D(syn__0678_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0102_),
	.Cout(),
	.Q());
defparam syn__1554_.coord_x = 7;
defparam syn__1554_.coord_y = 3;
defparam syn__1554_.coord_z = 4;
defparam syn__1554_.mask = 16'hEF2F;
defparam syn__1554_.modeMux = 1'b0;
defparam syn__1554_.FeedbackMux = 1'b0;
defparam syn__1554_.ShiftMux = 1'b0;
defparam syn__1554_.BypassEn = 1'b0;
defparam syn__1554_.CarryEnb = 1'b1;

alta_slice syn__1555_(
	.A(vcc),
	.B(syn__1092_),
	.C(syn__0022_),
	.D(syn__0021_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0103_),
	.Cout(),
	.Q());
defparam syn__1555_.coord_x = 12;
defparam syn__1555_.coord_y = 4;
defparam syn__1555_.coord_z = 7;
defparam syn__1555_.mask = 16'hFCC0;
defparam syn__1555_.modeMux = 1'b0;
defparam syn__1555_.FeedbackMux = 1'b0;
defparam syn__1555_.ShiftMux = 1'b0;
defparam syn__1555_.BypassEn = 1'b0;
defparam syn__1555_.CarryEnb = 1'b1;

alta_slice syn__1556_(
	.A(vcc),
	.B(vcc),
	.C(syn__0025_),
	.D(syn__0020_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0104_),
	.Cout(),
	.Q());
defparam syn__1556_.coord_x = 12;
defparam syn__1556_.coord_y = 4;
defparam syn__1556_.coord_z = 5;
defparam syn__1556_.mask = 16'h000F;
defparam syn__1556_.modeMux = 1'b0;
defparam syn__1556_.FeedbackMux = 1'b0;
defparam syn__1556_.ShiftMux = 1'b0;
defparam syn__1556_.BypassEn = 1'b0;
defparam syn__1556_.CarryEnb = 1'b1;

alta_slice syn__1557_(
	.A(\tc2.IM [9]),
	.B(syn__0106_),
	.C(syn__1097_),
	.D(syn__0007_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0105_),
	.Cout(),
	.Q());
defparam syn__1557_.coord_x = 9;
defparam syn__1557_.coord_y = 2;
defparam syn__1557_.coord_z = 14;
defparam syn__1557_.mask = 16'h1114;
defparam syn__1557_.modeMux = 1'b0;
defparam syn__1557_.FeedbackMux = 1'b0;
defparam syn__1557_.ShiftMux = 1'b0;
defparam syn__1557_.BypassEn = 1'b0;
defparam syn__1557_.CarryEnb = 1'b1;

alta_slice syn__1558_(
	.A(vcc),
	.B(vcc),
	.C(syn__0005_),
	.D(syn__0006_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0106_),
	.Cout(),
	.Q());
defparam syn__1558_.coord_x = 9;
defparam syn__1558_.coord_y = 2;
defparam syn__1558_.coord_z = 3;
defparam syn__1558_.mask = 16'h0FF0;
defparam syn__1558_.modeMux = 1'b0;
defparam syn__1558_.FeedbackMux = 1'b0;
defparam syn__1558_.ShiftMux = 1'b0;
defparam syn__1558_.BypassEn = 1'b0;
defparam syn__1558_.CarryEnb = 1'b1;

alta_slice syn__1559_(
	.A(syn__0078_),
	.B(syn__0108_),
	.C(syn__0109_),
	.D(vcc),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0107_),
	.Cout(),
	.Q());
defparam syn__1559_.coord_x = 6;
defparam syn__1559_.coord_y = 2;
defparam syn__1559_.coord_z = 6;
defparam syn__1559_.mask = 16'hD0D0;
defparam syn__1559_.modeMux = 1'b0;
defparam syn__1559_.FeedbackMux = 1'b0;
defparam syn__1559_.ShiftMux = 1'b0;
defparam syn__1559_.BypassEn = 1'b0;
defparam syn__1559_.CarryEnb = 1'b1;

alta_slice syn__1560_(
	.A(vcc),
	.B(vcc),
	.C(syn__0098_),
	.D(syn__0100_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0108_),
	.Cout(),
	.Q());
defparam syn__1560_.coord_x = 7;
defparam syn__1560_.coord_y = 4;
defparam syn__1560_.coord_z = 13;
defparam syn__1560_.mask = 16'h0F00;
defparam syn__1560_.modeMux = 1'b0;
defparam syn__1560_.FeedbackMux = 1'b0;
defparam syn__1560_.ShiftMux = 1'b0;
defparam syn__1560_.BypassEn = 1'b0;
defparam syn__1560_.CarryEnb = 1'b1;

alta_slice syn__1561_(
	.A(syn__0077_),
	.B(vcc),
	.C(syn__0114_),
	.D(syn__0110_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0109_),
	.Cout(),
	.Q());
defparam syn__1561_.coord_x = 8;
defparam syn__1561_.coord_y = 2;
defparam syn__1561_.coord_z = 4;
defparam syn__1561_.mask = 16'hF050;
defparam syn__1561_.modeMux = 1'b0;
defparam syn__1561_.FeedbackMux = 1'b0;
defparam syn__1561_.ShiftMux = 1'b0;
defparam syn__1561_.BypassEn = 1'b0;
defparam syn__1561_.CarryEnb = 1'b1;

alta_slice syn__1562_(
	.A(syn__0112_),
	.B(syn__0111_),
	.C(\tc2.IM [9]),
	.D(syn__0038_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0110_),
	.Cout(),
	.Q());
defparam syn__1562_.coord_x = 5;
defparam syn__1562_.coord_y = 3;
defparam syn__1562_.coord_z = 5;
defparam syn__1562_.mask = 16'hA2A8;
defparam syn__1562_.modeMux = 1'b0;
defparam syn__1562_.FeedbackMux = 1'b0;
defparam syn__1562_.ShiftMux = 1'b0;
defparam syn__1562_.BypassEn = 1'b0;
defparam syn__1562_.CarryEnb = 1'b1;

alta_slice syn__1563_(
	.A(vcc),
	.B(syn__0039_),
	.C(syn__1086_),
	.D(syn__0040_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0111_),
	.Cout(),
	.Q());
defparam syn__1563_.coord_x = 5;
defparam syn__1563_.coord_y = 3;
defparam syn__1563_.coord_z = 15;
defparam syn__1563_.mask = 16'h3330;
defparam syn__1563_.modeMux = 1'b0;
defparam syn__1563_.FeedbackMux = 1'b0;
defparam syn__1563_.ShiftMux = 1'b0;
defparam syn__1563_.BypassEn = 1'b0;
defparam syn__1563_.CarryEnb = 1'b1;

alta_slice syn__1564_(
	.A(IOvalue2[20]),
	.B(IOaddr2[20]),
	.C(syn__0065_),
	.D(syn__0113_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0112_),
	.Cout(),
	.Q());
defparam syn__1564_.coord_x = 5;
defparam syn__1564_.coord_y = 3;
defparam syn__1564_.coord_z = 13;
defparam syn__1564_.mask = 16'h009F;
defparam syn__1564_.modeMux = 1'b0;
defparam syn__1564_.FeedbackMux = 1'b0;
defparam syn__1564_.ShiftMux = 1'b0;
defparam syn__1564_.BypassEn = 1'b0;
defparam syn__1564_.CarryEnb = 1'b1;

alta_slice syn__1565_(
	.A(IOaddr2[20]),
	.B(IOvalue2[20]),
	.C(\tc2.IM [7]),
	.D(syn__0064_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0113_),
	.Cout(),
	.Q());
defparam syn__1565_.coord_x = 6;
defparam syn__1565_.coord_y = 6;
defparam syn__1565_.coord_z = 5;
defparam syn__1565_.mask = 16'hE800;
defparam syn__1565_.modeMux = 1'b0;
defparam syn__1565_.FeedbackMux = 1'b0;
defparam syn__1565_.ShiftMux = 1'b0;
defparam syn__1565_.BypassEn = 1'b0;
defparam syn__1565_.CarryEnb = 1'b1;

alta_slice syn__1566_(
	.A(syn__0680_),
	.B(syn__0073_),
	.C(syn__0072_),
	.D(syn__0682_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0114_),
	.Cout(),
	.Q());
defparam syn__1566_.coord_x = 7;
defparam syn__1566_.coord_y = 2;
defparam syn__1566_.coord_z = 7;
defparam syn__1566_.mask = 16'hAF23;
defparam syn__1566_.modeMux = 1'b0;
defparam syn__1566_.FeedbackMux = 1'b0;
defparam syn__1566_.ShiftMux = 1'b0;
defparam syn__1566_.BypassEn = 1'b0;
defparam syn__1566_.CarryEnb = 1'b1;

alta_slice syn__1567_(
	.A(vcc),
	.B(vcc),
	.C(syn__0039_),
	.D(syn__0040_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0115_),
	.Cout(),
	.Q());
defparam syn__1567_.coord_x = 5;
defparam syn__1567_.coord_y = 3;
defparam syn__1567_.coord_z = 0;
defparam syn__1567_.mask = 16'h000F;
defparam syn__1567_.modeMux = 1'b0;
defparam syn__1567_.FeedbackMux = 1'b0;
defparam syn__1567_.ShiftMux = 1'b0;
defparam syn__1567_.BypassEn = 1'b0;
defparam syn__1567_.CarryEnb = 1'b1;

alta_slice syn__1568_(
	.A(syn__0123_),
	.B(syn__0718_),
	.C(syn__0684_),
	.D(syn__0720_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0116_),
	.Cout(),
	.Q());
defparam syn__1568_.coord_x = 11;
defparam syn__1568_.coord_y = 5;
defparam syn__1568_.coord_z = 13;
defparam syn__1568_.mask = 16'h8000;
defparam syn__1568_.modeMux = 1'b0;
defparam syn__1568_.FeedbackMux = 1'b0;
defparam syn__1568_.ShiftMux = 1'b0;
defparam syn__1568_.BypassEn = 1'b0;
defparam syn__1568_.CarryEnb = 1'b1;

alta_slice syn__1569_(
	.A(syn__0050_),
	.B(syn__0052_),
	.C(syn__0051_),
	.D(syn__1082_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0117_),
	.Cout(),
	.Q());
defparam syn__1569_.coord_x = 5;
defparam syn__1569_.coord_y = 4;
defparam syn__1569_.coord_z = 3;
defparam syn__1569_.mask = 16'h5A59;
defparam syn__1569_.modeMux = 1'b0;
defparam syn__1569_.FeedbackMux = 1'b0;
defparam syn__1569_.ShiftMux = 1'b0;
defparam syn__1569_.BypassEn = 1'b0;
defparam syn__1569_.CarryEnb = 1'b1;

alta_slice syn__1570_(
	.A(syn__0119_),
	.B(syn__0120_),
	.C(syn__0036_),
	.D(\tc2.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0118_),
	.Cout(),
	.Q());
defparam syn__1570_.coord_x = 12;
defparam syn__1570_.coord_y = 1;
defparam syn__1570_.coord_z = 14;
defparam syn__1570_.mask = 16'hCC84;
defparam syn__1570_.modeMux = 1'b0;
defparam syn__1570_.FeedbackMux = 1'b0;
defparam syn__1570_.ShiftMux = 1'b0;
defparam syn__1570_.BypassEn = 1'b0;
defparam syn__1570_.CarryEnb = 1'b1;

alta_slice syn__1571_(
	.A(vcc),
	.B(vcc),
	.C(syn__1087_),
	.D(syn__0037_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0119_),
	.Cout(),
	.Q());
defparam syn__1571_.coord_x = 12;
defparam syn__1571_.coord_y = 1;
defparam syn__1571_.coord_z = 15;
defparam syn__1571_.mask = 16'h000F;
defparam syn__1571_.modeMux = 1'b0;
defparam syn__1571_.FeedbackMux = 1'b0;
defparam syn__1571_.ShiftMux = 1'b0;
defparam syn__1571_.BypassEn = 1'b0;
defparam syn__1571_.CarryEnb = 1'b1;

alta_slice syn__1572_(
	.A(IOaddr2[18]),
	.B(syn__0065_),
	.C(IOvalue2[18]),
	.D(syn__0121_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0120_),
	.Cout(),
	.Q());
defparam syn__1572_.coord_x = 7;
defparam syn__1572_.coord_y = 4;
defparam syn__1572_.coord_z = 14;
defparam syn__1572_.mask = 16'h00B7;
defparam syn__1572_.modeMux = 1'b0;
defparam syn__1572_.FeedbackMux = 1'b0;
defparam syn__1572_.ShiftMux = 1'b0;
defparam syn__1572_.BypassEn = 1'b0;
defparam syn__1572_.CarryEnb = 1'b1;

alta_slice syn__1573_(
	.A(IOaddr2[18]),
	.B(IOvalue2[18]),
	.C(\tc2.IM [7]),
	.D(syn__0064_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0121_),
	.Cout(),
	.Q());
defparam syn__1573_.coord_x = 6;
defparam syn__1573_.coord_y = 4;
defparam syn__1573_.coord_z = 1;
defparam syn__1573_.mask = 16'hE800;
defparam syn__1573_.modeMux = 1'b0;
defparam syn__1573_.FeedbackMux = 1'b0;
defparam syn__1573_.ShiftMux = 1'b0;
defparam syn__1573_.BypassEn = 1'b0;
defparam syn__1573_.CarryEnb = 1'b1;

alta_slice syn__1574_(
	.A(vcc),
	.B(vcc),
	.C(syn__0022_),
	.D(syn__0021_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0122_),
	.Cout(),
	.Q());
defparam syn__1574_.coord_x = 12;
defparam syn__1574_.coord_y = 4;
defparam syn__1574_.coord_z = 2;
defparam syn__1574_.mask = 16'h0FF0;
defparam syn__1574_.modeMux = 1'b0;
defparam syn__1574_.FeedbackMux = 1'b0;
defparam syn__1574_.ShiftMux = 1'b0;
defparam syn__1574_.BypassEn = 1'b0;
defparam syn__1574_.CarryEnb = 1'b1;

alta_slice syn__1575_(
	.A(syn__0124_),
	.B(syn__0132_),
	.C(syn__0186_),
	.D(syn__0183_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0123_),
	.Cout(),
	.Q());
defparam syn__1575_.coord_x = 8;
defparam syn__1575_.coord_y = 4;
defparam syn__1575_.coord_z = 3;
defparam syn__1575_.mask = 16'h8000;
defparam syn__1575_.modeMux = 1'b0;
defparam syn__1575_.FeedbackMux = 1'b0;
defparam syn__1575_.ShiftMux = 1'b0;
defparam syn__1575_.BypassEn = 1'b0;
defparam syn__1575_.CarryEnb = 1'b1;

alta_slice syn__1576_(
	.A(vcc),
	.B(syn__0126_),
	.C(syn__0072_),
	.D(syn__0690_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0124_),
	.Cout(),
	.Q());
defparam syn__1576_.coord_x = 7;
defparam syn__1576_.coord_y = 4;
defparam syn__1576_.coord_z = 4;
defparam syn__1576_.mask = 16'hCC0C;
defparam syn__1576_.modeMux = 1'b0;
defparam syn__1576_.FeedbackMux = 1'b0;
defparam syn__1576_.ShiftMux = 1'b0;
defparam syn__1576_.BypassEn = 1'b0;
defparam syn__1576_.CarryEnb = 1'b1;

alta_slice syn__1577_(
	.A(vcc),
	.B(vcc),
	.C(syn__0051_),
	.D(syn__0052_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0125_),
	.Cout(),
	.Q());
defparam syn__1577_.coord_x = 5;
defparam syn__1577_.coord_y = 4;
defparam syn__1577_.coord_z = 13;
defparam syn__1577_.mask = 16'h000F;
defparam syn__1577_.modeMux = 1'b0;
defparam syn__1577_.FeedbackMux = 1'b0;
defparam syn__1577_.ShiftMux = 1'b0;
defparam syn__1577_.BypassEn = 1'b0;
defparam syn__1577_.CarryEnb = 1'b1;

alta_slice syn__1578_(
	.A(vcc),
	.B(syn__0692_),
	.C(syn__0129_),
	.D(syn__0078_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0126_),
	.Cout(),
	.Q());
defparam syn__1578_.coord_x = 6;
defparam syn__1578_.coord_y = 2;
defparam syn__1578_.coord_z = 9;
defparam syn__1578_.mask = 16'hC0F0;
defparam syn__1578_.modeMux = 1'b0;
defparam syn__1578_.FeedbackMux = 1'b0;
defparam syn__1578_.ShiftMux = 1'b0;
defparam syn__1578_.BypassEn = 1'b0;
defparam syn__1578_.CarryEnb = 1'b1;

alta_slice syn__1579_(
	.A(syn__0033_),
	.B(vcc),
	.C(syn__1088_),
	.D(syn__0032_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0127_),
	.Cout(),
	.Q());
defparam syn__1579_.coord_x = 12;
defparam syn__1579_.coord_y = 1;
defparam syn__1579_.coord_z = 3;
defparam syn__1579_.mask = 16'hAF0A;
defparam syn__1579_.modeMux = 1'b0;
defparam syn__1579_.FeedbackMux = 1'b0;
defparam syn__1579_.ShiftMux = 1'b0;
defparam syn__1579_.BypassEn = 1'b0;
defparam syn__1579_.CarryEnb = 1'b1;

alta_slice syn__1580_(
	.A(vcc),
	.B(syn__0034_),
	.C(vcc),
	.D(syn__0037_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0128_),
	.Cout(),
	.Q());
defparam syn__1580_.coord_x = 12;
defparam syn__1580_.coord_y = 1;
defparam syn__1580_.coord_z = 12;
defparam syn__1580_.mask = 16'h0033;
defparam syn__1580_.modeMux = 1'b0;
defparam syn__1580_.FeedbackMux = 1'b0;
defparam syn__1580_.ShiftMux = 1'b0;
defparam syn__1580_.BypassEn = 1'b0;
defparam syn__1580_.CarryEnb = 1'b1;

alta_slice syn__1581_(
	.A(syn__0694_),
	.B(syn__0073_),
	.C(syn__0688_),
	.D(syn__0077_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0129_),
	.Cout(),
	.Q());
defparam syn__1581_.coord_x = 7;
defparam syn__1581_.coord_y = 2;
defparam syn__1581_.coord_z = 2;
defparam syn__1581_.mask = 16'hB0BB;
defparam syn__1581_.modeMux = 1'b0;
defparam syn__1581_.FeedbackMux = 1'b0;
defparam syn__1581_.ShiftMux = 1'b0;
defparam syn__1581_.BypassEn = 1'b0;
defparam syn__1581_.CarryEnb = 1'b1;

alta_slice syn__1582_(
	.A(\tc2.IM [9]),
	.B(syn__1093_),
	.C(syn__0019_),
	.D(syn__0131_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0130_),
	.Cout(),
	.Q());
defparam syn__1582_.coord_x = 9;
defparam syn__1582_.coord_y = 2;
defparam syn__1582_.coord_z = 13;
defparam syn__1582_.mask = 16'h0154;
defparam syn__1582_.modeMux = 1'b0;
defparam syn__1582_.FeedbackMux = 1'b0;
defparam syn__1582_.ShiftMux = 1'b0;
defparam syn__1582_.BypassEn = 1'b0;
defparam syn__1582_.CarryEnb = 1'b1;

alta_slice syn__1583_(
	.A(vcc),
	.B(vcc),
	.C(syn__0018_),
	.D(syn__0017_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0131_),
	.Cout(),
	.Q());
defparam syn__1583_.coord_x = 9;
defparam syn__1583_.coord_y = 2;
defparam syn__1583_.coord_z = 9;
defparam syn__1583_.mask = 16'h0FF0;
defparam syn__1583_.modeMux = 1'b0;
defparam syn__1583_.FeedbackMux = 1'b0;
defparam syn__1583_.ShiftMux = 1'b0;
defparam syn__1583_.BypassEn = 1'b0;
defparam syn__1583_.CarryEnb = 1'b1;

alta_slice syn__1584_(
	.A(syn__0150_),
	.B(syn__0133_),
	.C(syn__0698_),
	.D(syn__0141_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0132_),
	.Cout(),
	.Q());
defparam syn__1584_.coord_x = 8;
defparam syn__1584_.coord_y = 4;
defparam syn__1584_.coord_z = 15;
defparam syn__1584_.mask = 16'h8000;
defparam syn__1584_.modeMux = 1'b0;
defparam syn__1584_.FeedbackMux = 1'b0;
defparam syn__1584_.ShiftMux = 1'b0;
defparam syn__1584_.BypassEn = 1'b0;
defparam syn__1584_.CarryEnb = 1'b1;

alta_slice syn__1585_(
	.A(syn__0074_),
	.B(syn__0134_),
	.C(syn__0072_),
	.D(syn__0075_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0133_),
	.Cout(),
	.Q());
defparam syn__1585_.coord_x = 7;
defparam syn__1585_.coord_y = 4;
defparam syn__1585_.coord_z = 12;
defparam syn__1585_.mask = 16'h4C0C;
defparam syn__1585_.modeMux = 1'b0;
defparam syn__1585_.FeedbackMux = 1'b0;
defparam syn__1585_.ShiftMux = 1'b0;
defparam syn__1585_.BypassEn = 1'b0;
defparam syn__1585_.CarryEnb = 1'b1;

alta_slice syn__1586_(
	.A(vcc),
	.B(syn__0136_),
	.C(syn__0696_),
	.D(syn__0078_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0134_),
	.Cout(),
	.Q());
defparam syn__1586_.coord_x = 8;
defparam syn__1586_.coord_y = 3;
defparam syn__1586_.coord_z = 4;
defparam syn__1586_.mask = 16'hC0CC;
defparam syn__1586_.modeMux = 1'b0;
defparam syn__1586_.FeedbackMux = 1'b0;
defparam syn__1586_.ShiftMux = 1'b0;
defparam syn__1586_.BypassEn = 1'b0;
defparam syn__1586_.CarryEnb = 1'b1;

alta_slice syn__1587_(
	.A(vcc),
	.B(vcc),
	.C(syn__0033_),
	.D(syn__0032_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0135_),
	.Cout(),
	.Q());
defparam syn__1587_.coord_x = 12;
defparam syn__1587_.coord_y = 1;
defparam syn__1587_.coord_z = 8;
defparam syn__1587_.mask = 16'h0FF0;
defparam syn__1587_.modeMux = 1'b0;
defparam syn__1587_.FeedbackMux = 1'b0;
defparam syn__1587_.ShiftMux = 1'b0;
defparam syn__1587_.BypassEn = 1'b0;
defparam syn__1587_.CarryEnb = 1'b1;

alta_slice syn__1588_(
	.A(syn__0137_),
	.B(syn__0073_),
	.C(syn__0694_),
	.D(syn__0077_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0136_),
	.Cout(),
	.Q());
defparam syn__1588_.coord_x = 7;
defparam syn__1588_.coord_y = 2;
defparam syn__1588_.coord_z = 6;
defparam syn__1588_.mask = 16'hB0BB;
defparam syn__1588_.modeMux = 1'b0;
defparam syn__1588_.FeedbackMux = 1'b0;
defparam syn__1588_.ShiftMux = 1'b0;
defparam syn__1588_.BypassEn = 1'b0;
defparam syn__1588_.CarryEnb = 1'b1;

alta_slice syn__1589_(
	.A(\tc2.IM [9]),
	.B(syn__0138_),
	.C(syn__0139_),
	.D(syn__0014_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0137_),
	.Cout(),
	.Q());
defparam syn__1589_.coord_x = 8;
defparam syn__1589_.coord_y = 2;
defparam syn__1589_.coord_z = 5;
defparam syn__1589_.mask = 16'hB0E0;
defparam syn__1589_.modeMux = 1'b0;
defparam syn__1589_.FeedbackMux = 1'b0;
defparam syn__1589_.ShiftMux = 1'b0;
defparam syn__1589_.BypassEn = 1'b0;
defparam syn__1589_.CarryEnb = 1'b1;

alta_slice syn__1590_(
	.A(syn__0015_),
	.B(vcc),
	.C(syn__0016_),
	.D(syn__1094_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0138_),
	.Cout(),
	.Q());
defparam syn__1590_.coord_x = 4;
defparam syn__1590_.coord_y = 2;
defparam syn__1590_.coord_z = 10;
defparam syn__1590_.mask = 16'h5550;
defparam syn__1590_.modeMux = 1'b0;
defparam syn__1590_.FeedbackMux = 1'b0;
defparam syn__1590_.ShiftMux = 1'b0;
defparam syn__1590_.BypassEn = 1'b0;
defparam syn__1590_.CarryEnb = 1'b1;

alta_slice syn__1591_(
	.A(syn__0065_),
	.B(syn__0140_),
	.C(IOvalue2[8]),
	.D(IOaddr2[8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0139_),
	.Cout(),
	.Q());
defparam syn__1591_.coord_x = 11;
defparam syn__1591_.coord_y = 2;
defparam syn__1591_.coord_z = 0;
defparam syn__1591_.mask = 16'h3113;
defparam syn__1591_.modeMux = 1'b0;
defparam syn__1591_.FeedbackMux = 1'b0;
defparam syn__1591_.ShiftMux = 1'b0;
defparam syn__1591_.BypassEn = 1'b0;
defparam syn__1591_.CarryEnb = 1'b1;

alta_slice syn__1592_(
	.A(IOvalue2[8]),
	.B(IOaddr2[8]),
	.C(\tc2.IM [7]),
	.D(syn__0064_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0140_),
	.Cout(),
	.Q());
defparam syn__1592_.coord_x = 11;
defparam syn__1592_.coord_y = 2;
defparam syn__1592_.coord_z = 7;
defparam syn__1592_.mask = 16'hE800;
defparam syn__1592_.modeMux = 1'b0;
defparam syn__1592_.FeedbackMux = 1'b0;
defparam syn__1592_.ShiftMux = 1'b0;
defparam syn__1592_.BypassEn = 1'b0;
defparam syn__1592_.CarryEnb = 1'b1;

alta_slice syn__1593_(
	.A(syn__0074_),
	.B(syn__0075_),
	.C(syn__0142_),
	.D(syn__0078_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0141_),
	.Cout(),
	.Q());
defparam syn__1593_.coord_x = 7;
defparam syn__1593_.coord_y = 4;
defparam syn__1593_.coord_z = 5;
defparam syn__1593_.mask = 16'h40F0;
defparam syn__1593_.modeMux = 1'b0;
defparam syn__1593_.FeedbackMux = 1'b0;
defparam syn__1593_.ShiftMux = 1'b0;
defparam syn__1593_.BypassEn = 1'b0;
defparam syn__1593_.CarryEnb = 1'b1;

alta_slice syn__1594_(
	.A(vcc),
	.B(syn__0143_),
	.C(syn__0077_),
	.D(syn__0692_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0142_),
	.Cout(),
	.Q());
defparam syn__1594_.coord_x = 8;
defparam syn__1594_.coord_y = 2;
defparam syn__1594_.coord_z = 9;
defparam syn__1594_.mask = 16'hCC0C;
defparam syn__1594_.modeMux = 1'b0;
defparam syn__1594_.FeedbackMux = 1'b0;
defparam syn__1594_.ShiftMux = 1'b0;
defparam syn__1594_.BypassEn = 1'b0;
defparam syn__1594_.CarryEnb = 1'b1;

alta_slice syn__1595_(
	.A(syn__0696_),
	.B(syn__0144_),
	.C(syn__0072_),
	.D(syn__0073_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0143_),
	.Cout(),
	.Q());
defparam syn__1595_.coord_x = 7;
defparam syn__1595_.coord_y = 2;
defparam syn__1595_.coord_z = 14;
defparam syn__1595_.mask = 16'h8ACF;
defparam syn__1595_.modeMux = 1'b0;
defparam syn__1595_.FeedbackMux = 1'b0;
defparam syn__1595_.ShiftMux = 1'b0;
defparam syn__1595_.BypassEn = 1'b0;
defparam syn__1595_.CarryEnb = 1'b1;

alta_slice syn__1596_(
	.A(\tc2.IM [9]),
	.B(syn__0145_),
	.C(syn__0147_),
	.D(syn__0003_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0144_),
	.Cout(),
	.Q());
defparam syn__1596_.coord_x = 11;
defparam syn__1596_.coord_y = 2;
defparam syn__1596_.coord_z = 5;
defparam syn__1596_.mask = 16'hCCC8;
defparam syn__1596_.modeMux = 1'b0;
defparam syn__1596_.FeedbackMux = 1'b0;
defparam syn__1596_.ShiftMux = 1'b0;
defparam syn__1596_.BypassEn = 1'b0;
defparam syn__1596_.CarryEnb = 1'b1;

alta_slice syn__1597_(
	.A(syn__0146_),
	.B(IOaddr2[0]),
	.C(syn__0065_),
	.D(IOvalue2[0]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0145_),
	.Cout(),
	.Q());
defparam syn__1597_.coord_x = 11;
defparam syn__1597_.coord_y = 2;
defparam syn__1597_.coord_z = 15;
defparam syn__1597_.mask = 16'h4515;
defparam syn__1597_.modeMux = 1'b0;
defparam syn__1597_.FeedbackMux = 1'b0;
defparam syn__1597_.ShiftMux = 1'b0;
defparam syn__1597_.BypassEn = 1'b0;
defparam syn__1597_.CarryEnb = 1'b1;

alta_slice syn__1598_(
	.A(IOvalue2[0]),
	.B(IOaddr2[0]),
	.C(\tc2.IM [7]),
	.D(syn__0064_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0146_),
	.Cout(),
	.Q());
defparam syn__1598_.coord_x = 11;
defparam syn__1598_.coord_y = 2;
defparam syn__1598_.coord_z = 14;
defparam syn__1598_.mask = 16'hE800;
defparam syn__1598_.modeMux = 1'b0;
defparam syn__1598_.FeedbackMux = 1'b0;
defparam syn__1598_.ShiftMux = 1'b0;
defparam syn__1598_.BypassEn = 1'b0;
defparam syn__1598_.CarryEnb = 1'b1;

alta_slice syn__1599_(
	.A(IOvalue2[0]),
	.B(IOaddr2[0]),
	.C(\tc2.IM [7]),
	.D(\tc2.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0147_),
	.Cout(),
	.Q());
defparam syn__1599_.coord_x = 11;
defparam syn__1599_.coord_y = 2;
defparam syn__1599_.coord_z = 6;
defparam syn__1599_.mask = 16'h0041;
defparam syn__1599_.modeMux = 1'b0;
defparam syn__1599_.FeedbackMux = 1'b0;
defparam syn__1599_.ShiftMux = 1'b0;
defparam syn__1599_.BypassEn = 1'b0;
defparam syn__1599_.CarryEnb = 1'b1;

alta_slice syn__1600_(
	.A(syn__0031_),
	.B(\tc2.IM [9]),
	.C(syn__1089_),
	.D(syn__0149_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0148_),
	.Cout(),
	.Q());
defparam syn__1600_.coord_x = 12;
defparam syn__1600_.coord_y = 2;
defparam syn__1600_.coord_z = 15;
defparam syn__1600_.mask = 16'h0132;
defparam syn__1600_.modeMux = 1'b0;
defparam syn__1600_.FeedbackMux = 1'b0;
defparam syn__1600_.ShiftMux = 1'b0;
defparam syn__1600_.BypassEn = 1'b0;
defparam syn__1600_.CarryEnb = 1'b1;

alta_slice syn__1601_(
	.A(vcc),
	.B(vcc),
	.C(syn__0029_),
	.D(syn__0030_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0149_),
	.Cout(),
	.Q());
defparam syn__1601_.coord_x = 12;
defparam syn__1601_.coord_y = 2;
defparam syn__1601_.coord_z = 5;
defparam syn__1601_.mask = 16'h0FF0;
defparam syn__1601_.modeMux = 1'b0;
defparam syn__1601_.FeedbackMux = 1'b0;
defparam syn__1601_.ShiftMux = 1'b0;
defparam syn__1601_.BypassEn = 1'b0;
defparam syn__1601_.CarryEnb = 1'b1;

alta_slice syn__1602_(
	.A(syn__0708_),
	.B(syn__0168_),
	.C(syn__0151_),
	.D(syn__0160_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0150_),
	.Cout(),
	.Q());
defparam syn__1602_.coord_x = 11;
defparam syn__1602_.coord_y = 3;
defparam syn__1602_.coord_z = 1;
defparam syn__1602_.mask = 16'h8000;
defparam syn__1602_.modeMux = 1'b0;
defparam syn__1602_.FeedbackMux = 1'b0;
defparam syn__1602_.ShiftMux = 1'b0;
defparam syn__1602_.BypassEn = 1'b0;
defparam syn__1602_.CarryEnb = 1'b1;

alta_slice syn__1603_(
	.A(syn__0153_),
	.B(vcc),
	.C(syn__0072_),
	.D(syn__0702_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0151_),
	.Cout(),
	.Q());
defparam syn__1603_.coord_x = 7;
defparam syn__1603_.coord_y = 4;
defparam syn__1603_.coord_z = 8;
defparam syn__1603_.mask = 16'hAA0A;
defparam syn__1603_.modeMux = 1'b0;
defparam syn__1603_.FeedbackMux = 1'b0;
defparam syn__1603_.ShiftMux = 1'b0;
defparam syn__1603_.BypassEn = 1'b0;
defparam syn__1603_.CarryEnb = 1'b1;

alta_slice syn__1604_(
	.A(vcc),
	.B(vcc),
	.C(syn__0045_),
	.D(syn__0046_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0152_),
	.Cout(),
	.Q());
defparam syn__1604_.coord_x = 8;
defparam syn__1604_.coord_y = 4;
defparam syn__1604_.coord_z = 12;
defparam syn__1604_.mask = 16'h0FF0;
defparam syn__1604_.modeMux = 1'b0;
defparam syn__1604_.FeedbackMux = 1'b0;
defparam syn__1604_.ShiftMux = 1'b0;
defparam syn__1604_.BypassEn = 1'b0;
defparam syn__1604_.CarryEnb = 1'b1;

alta_slice syn__1605_(
	.A(vcc),
	.B(syn__0078_),
	.C(syn__0154_),
	.D(syn__0158_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0153_),
	.Cout(),
	.Q());
defparam syn__1605_.coord_x = 6;
defparam syn__1605_.coord_y = 2;
defparam syn__1605_.coord_z = 7;
defparam syn__1605_.mask = 16'hF300;
defparam syn__1605_.modeMux = 1'b0;
defparam syn__1605_.FeedbackMux = 1'b0;
defparam syn__1605_.ShiftMux = 1'b0;
defparam syn__1605_.BypassEn = 1'b0;
defparam syn__1605_.CarryEnb = 1'b1;

alta_slice syn__1606_(
	.A(\tc2.IM [9]),
	.B(syn__0156_),
	.C(syn__0155_),
	.D(syn__0026_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0154_),
	.Cout(),
	.Q());
defparam syn__1606_.coord_x = 11;
defparam syn__1606_.coord_y = 2;
defparam syn__1606_.coord_z = 8;
defparam syn__1606_.mask = 16'hC88C;
defparam syn__1606_.modeMux = 1'b0;
defparam syn__1606_.FeedbackMux = 1'b0;
defparam syn__1606_.ShiftMux = 1'b0;
defparam syn__1606_.BypassEn = 1'b0;
defparam syn__1606_.CarryEnb = 1'b1;

alta_slice syn__1607_(
	.A(vcc),
	.B(syn__1090_),
	.C(syn__0027_),
	.D(syn__0028_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0155_),
	.Cout(),
	.Q());
defparam syn__1607_.coord_x = 12;
defparam syn__1607_.coord_y = 2;
defparam syn__1607_.coord_z = 3;
defparam syn__1607_.mask = 16'h0F03;
defparam syn__1607_.modeMux = 1'b0;
defparam syn__1607_.FeedbackMux = 1'b0;
defparam syn__1607_.ShiftMux = 1'b0;
defparam syn__1607_.BypassEn = 1'b0;
defparam syn__1607_.CarryEnb = 1'b1;

alta_slice syn__1608_(
	.A(syn__0065_),
	.B(IOvalue2[14]),
	.C(IOaddr2[14]),
	.D(syn__0157_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0156_),
	.Cout(),
	.Q());
defparam syn__1608_.coord_x = 11;
defparam syn__1608_.coord_y = 2;
defparam syn__1608_.coord_z = 9;
defparam syn__1608_.mask = 16'h00D7;
defparam syn__1608_.modeMux = 1'b0;
defparam syn__1608_.FeedbackMux = 1'b0;
defparam syn__1608_.ShiftMux = 1'b0;
defparam syn__1608_.BypassEn = 1'b0;
defparam syn__1608_.CarryEnb = 1'b1;

alta_slice syn__1609_(
	.A(IOaddr2[14]),
	.B(IOvalue2[14]),
	.C(\tc2.IM [7]),
	.D(syn__0064_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0157_),
	.Cout(),
	.Q());
defparam syn__1609_.coord_x = 11;
defparam syn__1609_.coord_y = 2;
defparam syn__1609_.coord_z = 11;
defparam syn__1609_.mask = 16'hE800;
defparam syn__1609_.modeMux = 1'b0;
defparam syn__1609_.FeedbackMux = 1'b0;
defparam syn__1609_.ShiftMux = 1'b0;
defparam syn__1609_.BypassEn = 1'b0;
defparam syn__1609_.CarryEnb = 1'b1;

alta_slice syn__1610_(
	.A(syn__0670_),
	.B(syn__0073_),
	.C(syn__0704_),
	.D(syn__0077_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0158_),
	.Cout(),
	.Q());
defparam syn__1610_.coord_x = 7;
defparam syn__1610_.coord_y = 2;
defparam syn__1610_.coord_z = 11;
defparam syn__1610_.mask = 16'hA2F3;
defparam syn__1610_.modeMux = 1'b0;
defparam syn__1610_.FeedbackMux = 1'b0;
defparam syn__1610_.ShiftMux = 1'b0;
defparam syn__1610_.BypassEn = 1'b0;
defparam syn__1610_.CarryEnb = 1'b1;

alta_slice syn__1611_(
	.A(syn__0012_),
	.B(syn__0013_),
	.C(syn__1095_),
	.D(\tc2.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0159_),
	.Cout(),
	.Q());
defparam syn__1611_.coord_x = 4;
defparam syn__1611_.coord_y = 2;
defparam syn__1611_.coord_z = 7;
defparam syn__1611_.mask = 16'h0056;
defparam syn__1611_.modeMux = 1'b0;
defparam syn__1611_.FeedbackMux = 1'b0;
defparam syn__1611_.ShiftMux = 1'b0;
defparam syn__1611_.BypassEn = 1'b0;
defparam syn__1611_.CarryEnb = 1'b1;

alta_slice syn__1612_(
	.A(vcc),
	.B(syn__0163_),
	.C(syn__0706_),
	.D(syn__0072_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0160_),
	.Cout(),
	.Q());
defparam syn__1612_.coord_x = 8;
defparam syn__1612_.coord_y = 2;
defparam syn__1612_.coord_z = 0;
defparam syn__1612_.mask = 16'hC0CC;
defparam syn__1612_.modeMux = 1'b0;
defparam syn__1612_.FeedbackMux = 1'b0;
defparam syn__1612_.ShiftMux = 1'b0;
defparam syn__1612_.BypassEn = 1'b0;
defparam syn__1612_.CarryEnb = 1'b1;

alta_slice syn__1613_(
	.A(vcc),
	.B(vcc),
	.C(syn__1085_),
	.D(syn__0043_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0161_),
	.Cout(),
	.Q());
defparam syn__1613_.coord_x = 5;
defparam syn__1613_.coord_y = 3;
defparam syn__1613_.coord_z = 3;
defparam syn__1613_.mask = 16'h000F;
defparam syn__1613_.modeMux = 1'b0;
defparam syn__1613_.FeedbackMux = 1'b0;
defparam syn__1613_.ShiftMux = 1'b0;
defparam syn__1613_.BypassEn = 1'b0;
defparam syn__1613_.CarryEnb = 1'b1;

alta_slice syn__1614_(
	.A(vcc),
	.B(vcc),
	.C(syn__0041_),
	.D(syn__0042_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0162_),
	.Cout(),
	.Q());
defparam syn__1614_.coord_x = 5;
defparam syn__1614_.coord_y = 3;
defparam syn__1614_.coord_z = 2;
defparam syn__1614_.mask = 16'h0FF0;
defparam syn__1614_.modeMux = 1'b0;
defparam syn__1614_.FeedbackMux = 1'b0;
defparam syn__1614_.ShiftMux = 1'b0;
defparam syn__1614_.BypassEn = 1'b0;
defparam syn__1614_.CarryEnb = 1'b1;

alta_slice syn__1615_(
	.A(syn__0164_),
	.B(syn__0672_),
	.C(vcc),
	.D(syn__0078_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0163_),
	.Cout(),
	.Q());
defparam syn__1615_.coord_x = 6;
defparam syn__1615_.coord_y = 2;
defparam syn__1615_.coord_z = 1;
defparam syn__1615_.mask = 16'h88AA;
defparam syn__1615_.modeMux = 1'b0;
defparam syn__1615_.FeedbackMux = 1'b0;
defparam syn__1615_.ShiftMux = 1'b0;
defparam syn__1615_.BypassEn = 1'b0;
defparam syn__1615_.CarryEnb = 1'b1;

alta_slice syn__1616_(
	.A(syn__0704_),
	.B(syn__0073_),
	.C(syn__0674_),
	.D(syn__0077_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0164_),
	.Cout(),
	.Q());
defparam syn__1616_.coord_x = 7;
defparam syn__1616_.coord_y = 2;
defparam syn__1616_.coord_z = 10;
defparam syn__1616_.mask = 16'hA2F3;
defparam syn__1616_.modeMux = 1'b0;
defparam syn__1616_.FeedbackMux = 1'b0;
defparam syn__1616_.ShiftMux = 1'b0;
defparam syn__1616_.BypassEn = 1'b0;
defparam syn__1616_.CarryEnb = 1'b1;

alta_slice syn__1617_(
	.A(vcc),
	.B(vcc),
	.C(syn__1091_),
	.D(syn__0025_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0165_),
	.Cout(),
	.Q());
defparam syn__1617_.coord_x = 12;
defparam syn__1617_.coord_y = 4;
defparam syn__1617_.coord_z = 11;
defparam syn__1617_.mask = 16'h000F;
defparam syn__1617_.modeMux = 1'b0;
defparam syn__1617_.FeedbackMux = 1'b0;
defparam syn__1617_.ShiftMux = 1'b0;
defparam syn__1617_.BypassEn = 1'b0;
defparam syn__1617_.CarryEnb = 1'b1;

alta_slice syn__1618_(
	.A(vcc),
	.B(vcc),
	.C(syn__0023_),
	.D(syn__0024_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0166_),
	.Cout(),
	.Q());
defparam syn__1618_.coord_x = 12;
defparam syn__1618_.coord_y = 4;
defparam syn__1618_.coord_z = 4;
defparam syn__1618_.mask = 16'h0FF0;
defparam syn__1618_.modeMux = 1'b0;
defparam syn__1618_.FeedbackMux = 1'b0;
defparam syn__1618_.ShiftMux = 1'b0;
defparam syn__1618_.BypassEn = 1'b0;
defparam syn__1618_.CarryEnb = 1'b1;

alta_slice syn__1619_(
	.A(syn__0009_),
	.B(vcc),
	.C(syn__0010_),
	.D(vcc),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0167_),
	.Cout(),
	.Q());
defparam syn__1619_.coord_x = 5;
defparam syn__1619_.coord_y = 2;
defparam syn__1619_.coord_z = 8;
defparam syn__1619_.mask = 16'h5A5A;
defparam syn__1619_.modeMux = 1'b0;
defparam syn__1619_.FeedbackMux = 1'b0;
defparam syn__1619_.ShiftMux = 1'b0;
defparam syn__1619_.BypassEn = 1'b0;
defparam syn__1619_.CarryEnb = 1'b1;

alta_slice syn__1620_(
	.A(syn__0172_),
	.B(syn__0180_),
	.C(syn__0169_),
	.D(syn__0176_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0168_),
	.Cout(),
	.Q());
defparam syn__1620_.coord_x = 11;
defparam syn__1620_.coord_y = 3;
defparam syn__1620_.coord_z = 13;
defparam syn__1620_.mask = 16'h8000;
defparam syn__1620_.modeMux = 1'b0;
defparam syn__1620_.FeedbackMux = 1'b0;
defparam syn__1620_.ShiftMux = 1'b0;
defparam syn__1620_.BypassEn = 1'b0;
defparam syn__1620_.CarryEnb = 1'b1;

alta_slice syn__1621_(
	.A(vcc),
	.B(syn__0170_),
	.C(syn__0072_),
	.D(syn__0682_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0169_),
	.Cout(),
	.Q());
defparam syn__1621_.coord_x = 7;
defparam syn__1621_.coord_y = 4;
defparam syn__1621_.coord_z = 9;
defparam syn__1621_.mask = 16'hCC0C;
defparam syn__1621_.modeMux = 1'b0;
defparam syn__1621_.FeedbackMux = 1'b0;
defparam syn__1621_.ShiftMux = 1'b0;
defparam syn__1621_.BypassEn = 1'b0;
defparam syn__1621_.CarryEnb = 1'b1;

alta_slice syn__1622_(
	.A(vcc),
	.B(syn__0171_),
	.C(syn__0678_),
	.D(syn__0078_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0170_),
	.Cout(),
	.Q());
defparam syn__1622_.coord_x = 8;
defparam syn__1622_.coord_y = 3;
defparam syn__1622_.coord_z = 8;
defparam syn__1622_.mask = 16'hC0CC;
defparam syn__1622_.modeMux = 1'b0;
defparam syn__1622_.FeedbackMux = 1'b0;
defparam syn__1622_.ShiftMux = 1'b0;
defparam syn__1622_.BypassEn = 1'b0;
defparam syn__1622_.CarryEnb = 1'b1;

alta_slice syn__1623_(
	.A(syn__0077_),
	.B(syn__0073_),
	.C(syn__0680_),
	.D(syn__0712_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0171_),
	.Cout(),
	.Q());
defparam syn__1623_.coord_x = 7;
defparam syn__1623_.coord_y = 2;
defparam syn__1623_.coord_z = 9;
defparam syn__1623_.mask = 16'hF351;
defparam syn__1623_.modeMux = 1'b0;
defparam syn__1623_.FeedbackMux = 1'b0;
defparam syn__1623_.ShiftMux = 1'b0;
defparam syn__1623_.BypassEn = 1'b0;
defparam syn__1623_.CarryEnb = 1'b1;

alta_slice syn__1624_(
	.A(syn__0072_),
	.B(vcc),
	.C(syn__0173_),
	.D(syn__0118_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0172_),
	.Cout(),
	.Q());
defparam syn__1624_.coord_x = 11;
defparam syn__1624_.coord_y = 3;
defparam syn__1624_.coord_z = 12;
defparam syn__1624_.mask = 16'hF050;
defparam syn__1624_.modeMux = 1'b0;
defparam syn__1624_.FeedbackMux = 1'b0;
defparam syn__1624_.ShiftMux = 1'b0;
defparam syn__1624_.BypassEn = 1'b0;
defparam syn__1624_.CarryEnb = 1'b1;

alta_slice syn__1625_(
	.A(vcc),
	.B(syn__0688_),
	.C(syn__0174_),
	.D(syn__0078_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0173_),
	.Cout(),
	.Q());
defparam syn__1625_.coord_x = 8;
defparam syn__1625_.coord_y = 3;
defparam syn__1625_.coord_z = 14;
defparam syn__1625_.mask = 16'hC0F0;
defparam syn__1625_.modeMux = 1'b0;
defparam syn__1625_.FeedbackMux = 1'b0;
defparam syn__1625_.ShiftMux = 1'b0;
defparam syn__1625_.BypassEn = 1'b0;
defparam syn__1625_.CarryEnb = 1'b1;

alta_slice syn__1626_(
	.A(syn__0714_),
	.B(syn__0073_),
	.C(syn__0680_),
	.D(syn__0077_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0174_),
	.Cout(),
	.Q());
defparam syn__1626_.coord_x = 7;
defparam syn__1626_.coord_y = 2;
defparam syn__1626_.coord_z = 8;
defparam syn__1626_.mask = 16'hB0BB;
defparam syn__1626_.modeMux = 1'b0;
defparam syn__1626_.FeedbackMux = 1'b0;
defparam syn__1626_.ShiftMux = 1'b0;
defparam syn__1626_.BypassEn = 1'b0;
defparam syn__1626_.CarryEnb = 1'b1;

alta_slice syn__1627_(
	.A(syn__0003_),
	.B(syn__1099_),
	.C(syn__1098_),
	.D(syn__0004_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0175_),
	.Cout(),
	.Q());
defparam syn__1627_.coord_x = 9;
defparam syn__1627_.coord_y = 2;
defparam syn__1627_.coord_z = 12;
defparam syn__1627_.mask = 16'hD42B;
defparam syn__1627_.modeMux = 1'b0;
defparam syn__1627_.FeedbackMux = 1'b0;
defparam syn__1627_.ShiftMux = 1'b0;
defparam syn__1627_.BypassEn = 1'b0;
defparam syn__1627_.CarryEnb = 1'b1;

alta_slice syn__1628_(
	.A(vcc),
	.B(syn__0692_),
	.C(syn__0072_),
	.D(syn__0177_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0176_),
	.Cout(),
	.Q());
defparam syn__1628_.coord_x = 8;
defparam syn__1628_.coord_y = 2;
defparam syn__1628_.coord_z = 8;
defparam syn__1628_.mask = 16'hCF00;
defparam syn__1628_.modeMux = 1'b0;
defparam syn__1628_.FeedbackMux = 1'b0;
defparam syn__1628_.ShiftMux = 1'b0;
defparam syn__1628_.BypassEn = 1'b0;
defparam syn__1628_.CarryEnb = 1'b1;

alta_slice syn__1629_(
	.A(vcc),
	.B(syn__0178_),
	.C(syn__0694_),
	.D(syn__0078_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0177_),
	.Cout(),
	.Q());
defparam syn__1629_.coord_x = 8;
defparam syn__1629_.coord_y = 3;
defparam syn__1629_.coord_z = 10;
defparam syn__1629_.mask = 16'hC0CC;
defparam syn__1629_.modeMux = 1'b0;
defparam syn__1629_.FeedbackMux = 1'b0;
defparam syn__1629_.ShiftMux = 1'b0;
defparam syn__1629_.BypassEn = 1'b0;
defparam syn__1629_.CarryEnb = 1'b1;

alta_slice syn__1630_(
	.A(syn__0714_),
	.B(syn__0073_),
	.C(syn__0716_),
	.D(syn__0077_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0178_),
	.Cout(),
	.Q());
defparam syn__1630_.coord_x = 7;
defparam syn__1630_.coord_y = 2;
defparam syn__1630_.coord_z = 4;
defparam syn__1630_.mask = 16'hA2F3;
defparam syn__1630_.modeMux = 1'b0;
defparam syn__1630_.FeedbackMux = 1'b0;
defparam syn__1630_.ShiftMux = 1'b0;
defparam syn__1630_.BypassEn = 1'b0;
defparam syn__1630_.CarryEnb = 1'b1;

alta_slice syn__1631_(
	.A(vcc),
	.B(vcc),
	.C(syn__1098_),
	.D(syn__1099_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0179_),
	.Cout(),
	.Q());
defparam syn__1631_.coord_x = 9;
defparam syn__1631_.coord_y = 2;
defparam syn__1631_.coord_z = 1;
defparam syn__1631_.mask = 16'h0FF0;
defparam syn__1631_.modeMux = 1'b0;
defparam syn__1631_.FeedbackMux = 1'b0;
defparam syn__1631_.ShiftMux = 1'b0;
defparam syn__1631_.BypassEn = 1'b0;
defparam syn__1631_.CarryEnb = 1'b1;

alta_slice syn__1632_(
	.A(syn__0696_),
	.B(vcc),
	.C(syn__0072_),
	.D(syn__0181_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0180_),
	.Cout(),
	.Q());
defparam syn__1632_.coord_x = 7;
defparam syn__1632_.coord_y = 4;
defparam syn__1632_.coord_z = 0;
defparam syn__1632_.mask = 16'hAF00;
defparam syn__1632_.modeMux = 1'b0;
defparam syn__1632_.FeedbackMux = 1'b0;
defparam syn__1632_.ShiftMux = 1'b0;
defparam syn__1632_.BypassEn = 1'b0;
defparam syn__1632_.CarryEnb = 1'b1;

alta_slice syn__1633_(
	.A(vcc),
	.B(syn__0182_),
	.C(syn__0137_),
	.D(syn__0078_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0181_),
	.Cout(),
	.Q());
defparam syn__1633_.coord_x = 8;
defparam syn__1633_.coord_y = 3;
defparam syn__1633_.coord_z = 5;
defparam syn__1633_.mask = 16'hC0CC;
defparam syn__1633_.modeMux = 1'b0;
defparam syn__1633_.FeedbackMux = 1'b0;
defparam syn__1633_.ShiftMux = 1'b0;
defparam syn__1633_.BypassEn = 1'b0;
defparam syn__1633_.CarryEnb = 1'b1;

alta_slice syn__1634_(
	.A(syn__0073_),
	.B(syn__0077_),
	.C(syn__0716_),
	.D(syn__0144_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0182_),
	.Cout(),
	.Q());
defparam syn__1634_.coord_x = 7;
defparam syn__1634_.coord_y = 2;
defparam syn__1634_.coord_z = 1;
defparam syn__1634_.mask = 16'hF351;
defparam syn__1634_.modeMux = 1'b0;
defparam syn__1634_.FeedbackMux = 1'b0;
defparam syn__1634_.ShiftMux = 1'b0;
defparam syn__1634_.BypassEn = 1'b0;
defparam syn__1634_.CarryEnb = 1'b1;

alta_slice syn__1635_(
	.A(vcc),
	.B(syn__0078_),
	.C(syn__0690_),
	.D(syn__0184_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0183_),
	.Cout(),
	.Q());
defparam syn__1635_.coord_x = 6;
defparam syn__1635_.coord_y = 2;
defparam syn__1635_.coord_z = 4;
defparam syn__1635_.mask = 16'hF300;
defparam syn__1635_.modeMux = 1'b0;
defparam syn__1635_.FeedbackMux = 1'b0;
defparam syn__1635_.ShiftMux = 1'b0;
defparam syn__1635_.BypassEn = 1'b0;
defparam syn__1635_.CarryEnb = 1'b1;

alta_slice syn__1636_(
	.A(syn__0077_),
	.B(vcc),
	.C(syn__0118_),
	.D(syn__0185_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0184_),
	.Cout(),
	.Q());
defparam syn__1636_.coord_x = 8;
defparam syn__1636_.coord_y = 2;
defparam syn__1636_.coord_z = 12;
defparam syn__1636_.mask = 16'hF500;
defparam syn__1636_.modeMux = 1'b0;
defparam syn__1636_.FeedbackMux = 1'b0;
defparam syn__1636_.ShiftMux = 1'b0;
defparam syn__1636_.BypassEn = 1'b0;
defparam syn__1636_.CarryEnb = 1'b1;

alta_slice syn__1637_(
	.A(syn__0072_),
	.B(syn__0692_),
	.C(syn__0716_),
	.D(syn__0073_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0185_),
	.Cout(),
	.Q());
defparam syn__1637_.coord_x = 7;
defparam syn__1637_.coord_y = 2;
defparam syn__1637_.coord_z = 0;
defparam syn__1637_.mask = 16'hC4F5;
defparam syn__1637_.modeMux = 1'b0;
defparam syn__1637_.FeedbackMux = 1'b0;
defparam syn__1637_.ShiftMux = 1'b0;
defparam syn__1637_.BypassEn = 1'b0;
defparam syn__1637_.CarryEnb = 1'b1;

alta_slice syn__1638_(
	.A(syn__0187_),
	.B(syn__0690_),
	.C(syn__0188_),
	.D(syn__0077_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0186_),
	.Cout(),
	.Q());
defparam syn__1638_.coord_x = 7;
defparam syn__1638_.coord_y = 4;
defparam syn__1638_.coord_z = 1;
defparam syn__1638_.mask = 16'h4050;
defparam syn__1638_.modeMux = 1'b0;
defparam syn__1638_.FeedbackMux = 1'b0;
defparam syn__1638_.ShiftMux = 1'b0;
defparam syn__1638_.BypassEn = 1'b0;
defparam syn__1638_.CarryEnb = 1'b1;

alta_slice syn__1639_(
	.A(syn__0073_),
	.B(vcc),
	.C(syn__0074_),
	.D(syn__0075_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0187_),
	.Cout(),
	.Q());
defparam syn__1639_.coord_x = 7;
defparam syn__1639_.coord_y = 4;
defparam syn__1639_.coord_z = 10;
defparam syn__1639_.mask = 16'hA0AA;
defparam syn__1639_.modeMux = 1'b0;
defparam syn__1639_.FeedbackMux = 1'b0;
defparam syn__1639_.ShiftMux = 1'b0;
defparam syn__1639_.BypassEn = 1'b0;
defparam syn__1639_.CarryEnb = 1'b1;

alta_slice syn__1640_(
	.A(syn__0144_),
	.B(\tc2.IM [5]),
	.C(\tc2.IM [6]),
	.D(syn__0137_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0188_),
	.Cout(),
	.Q());
defparam syn__1640_.coord_x = 7;
defparam syn__1640_.coord_y = 3;
defparam syn__1640_.coord_z = 15;
defparam syn__1640_.mask = 16'hEF2F;
defparam syn__1640_.modeMux = 1'b0;
defparam syn__1640_.FeedbackMux = 1'b0;
defparam syn__1640_.ShiftMux = 1'b0;
defparam syn__1640_.BypassEn = 1'b0;
defparam syn__1640_.CarryEnb = 1'b1;

alta_slice syn__1641_(
	.A(syn__0077_),
	.B(syn__0722_),
	.C(syn__0190_),
	.D(syn__0108_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0189_),
	.Cout(),
	.Q());
defparam syn__1641_.coord_x = 6;
defparam syn__1641_.coord_y = 4;
defparam syn__1641_.coord_z = 4;
defparam syn__1641_.mask = 16'hC040;
defparam syn__1641_.modeMux = 1'b0;
defparam syn__1641_.FeedbackMux = 1'b0;
defparam syn__1641_.ShiftMux = 1'b0;
defparam syn__1641_.BypassEn = 1'b0;
defparam syn__1641_.CarryEnb = 1'b1;

alta_slice syn__1642_(
	.A(syn__0098_),
	.B(syn__0191_),
	.C(syn__0072_),
	.D(syn__0100_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0190_),
	.Cout(),
	.Q());
defparam syn__1642_.coord_x = 7;
defparam syn__1642_.coord_y = 2;
defparam syn__1642_.coord_z = 13;
defparam syn__1642_.mask = 16'h4C0C;
defparam syn__1642_.modeMux = 1'b0;
defparam syn__1642_.FeedbackMux = 1'b0;
defparam syn__1642_.ShiftMux = 1'b0;
defparam syn__1642_.BypassEn = 1'b0;
defparam syn__1642_.CarryEnb = 1'b1;

alta_slice syn__1643_(
	.A(syn__0682_),
	.B(syn__0078_),
	.C(vcc),
	.D(syn__0192_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0191_),
	.Cout(),
	.Q());
defparam syn__1643_.coord_x = 6;
defparam syn__1643_.coord_y = 2;
defparam syn__1643_.coord_z = 14;
defparam syn__1643_.mask = 16'hBB00;
defparam syn__1643_.modeMux = 1'b0;
defparam syn__1643_.FeedbackMux = 1'b0;
defparam syn__1643_.ShiftMux = 1'b0;
defparam syn__1643_.BypassEn = 1'b0;
defparam syn__1643_.CarryEnb = 1'b1;

alta_slice syn__1644_(
	.A(syn__0678_),
	.B(syn__0073_),
	.C(syn__0710_),
	.D(syn__0077_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0192_),
	.Cout(),
	.Q());
defparam syn__1644_.coord_x = 7;
defparam syn__1644_.coord_y = 2;
defparam syn__1644_.coord_z = 3;
defparam syn__1644_.mask = 16'hB0BB;
defparam syn__1644_.modeMux = 1'b0;
defparam syn__1644_.FeedbackMux = 1'b0;
defparam syn__1644_.ShiftMux = 1'b0;
defparam syn__1644_.BypassEn = 1'b0;
defparam syn__1644_.CarryEnb = 1'b1;

alta_slice syn__1645_(
	.A(vcc),
	.B(vcc),
	.C(syn__0194_),
	.D(syn__0197_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0193_),
	.Cout(),
	.Q());
defparam syn__1645_.coord_x = 5;
defparam syn__1645_.coord_y = 2;
defparam syn__1645_.coord_z = 15;
defparam syn__1645_.mask = 16'hF000;
defparam syn__1645_.modeMux = 1'b0;
defparam syn__1645_.FeedbackMux = 1'b0;
defparam syn__1645_.ShiftMux = 1'b0;
defparam syn__1645_.BypassEn = 1'b0;
defparam syn__1645_.CarryEnb = 1'b1;

alta_slice syn__1646_(
	.A(vcc),
	.B(syn__0195_),
	.C(syn__0676_),
	.D(syn__0078_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0194_),
	.Cout(),
	.Q());
defparam syn__1646_.coord_x = 6;
defparam syn__1646_.coord_y = 2;
defparam syn__1646_.coord_z = 8;
defparam syn__1646_.mask = 16'hC0CC;
defparam syn__1646_.modeMux = 1'b0;
defparam syn__1646_.FeedbackMux = 1'b0;
defparam syn__1646_.ShiftMux = 1'b0;
defparam syn__1646_.BypassEn = 1'b0;
defparam syn__1646_.CarryEnb = 1'b1;

alta_slice syn__1647_(
	.A(syn__0196_),
	.B(vcc),
	.C(syn__0706_),
	.D(syn__0077_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0195_),
	.Cout(),
	.Q());
defparam syn__1647_.coord_x = 8;
defparam syn__1647_.coord_y = 2;
defparam syn__1647_.coord_z = 1;
defparam syn__1647_.mask = 16'hA0AA;
defparam syn__1647_.modeMux = 1'b0;
defparam syn__1647_.FeedbackMux = 1'b0;
defparam syn__1647_.ShiftMux = 1'b0;
defparam syn__1647_.BypassEn = 1'b0;
defparam syn__1647_.CarryEnb = 1'b1;

alta_slice syn__1648_(
	.A(syn__0712_),
	.B(syn__0110_),
	.C(syn__0073_),
	.D(syn__0072_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0196_),
	.Cout(),
	.Q());
defparam syn__1648_.coord_x = 8;
defparam syn__1648_.coord_y = 2;
defparam syn__1648_.coord_z = 10;
defparam syn__1648_.mask = 16'h8ACF;
defparam syn__1648_.modeMux = 1'b0;
defparam syn__1648_.FeedbackMux = 1'b0;
defparam syn__1648_.ShiftMux = 1'b0;
defparam syn__1648_.BypassEn = 1'b0;
defparam syn__1648_.CarryEnb = 1'b1;

alta_slice syn__1649_(
	.A(vcc),
	.B(syn__0198_),
	.C(syn__0676_),
	.D(syn__0072_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0197_),
	.Cout(),
	.Q());
defparam syn__1649_.coord_x = 8;
defparam syn__1649_.coord_y = 2;
defparam syn__1649_.coord_z = 2;
defparam syn__1649_.mask = 16'hC0CC;
defparam syn__1649_.modeMux = 1'b0;
defparam syn__1649_.FeedbackMux = 1'b0;
defparam syn__1649_.ShiftMux = 1'b0;
defparam syn__1649_.BypassEn = 1'b0;
defparam syn__1649_.CarryEnb = 1'b1;

alta_slice syn__1650_(
	.A(vcc),
	.B(syn__0199_),
	.C(syn__0110_),
	.D(syn__0078_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0198_),
	.Cout(),
	.Q());
defparam syn__1650_.coord_x = 8;
defparam syn__1650_.coord_y = 3;
defparam syn__1650_.coord_z = 2;
defparam syn__1650_.mask = 16'hC0CC;
defparam syn__1650_.modeMux = 1'b0;
defparam syn__1650_.FeedbackMux = 1'b0;
defparam syn__1650_.ShiftMux = 1'b0;
defparam syn__1650_.BypassEn = 1'b0;
defparam syn__1650_.CarryEnb = 1'b1;

alta_slice syn__1651_(
	.A(syn__0672_),
	.B(syn__0710_),
	.C(syn__0073_),
	.D(syn__0077_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0199_),
	.Cout(),
	.Q());
defparam syn__1651_.coord_x = 9;
defparam syn__1651_.coord_y = 4;
defparam syn__1651_.coord_z = 7;
defparam syn__1651_.mask = 16'h8ACF;
defparam syn__1651_.modeMux = 1'b0;
defparam syn__1651_.FeedbackMux = 1'b0;
defparam syn__1651_.ShiftMux = 1'b0;
defparam syn__1651_.BypassEn = 1'b0;
defparam syn__1651_.CarryEnb = 1'b1;

alta_slice syn__1652_(
	.A(syn__0726_),
	.B(syn__0203_),
	.C(syn__0201_),
	.D(syn__0202_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0200_),
	.Cout(),
	.Q());
defparam syn__1652_.coord_x = 5;
defparam syn__1652_.coord_y = 2;
defparam syn__1652_.coord_z = 9;
defparam syn__1652_.mask = 16'h0008;
defparam syn__1652_.modeMux = 1'b0;
defparam syn__1652_.FeedbackMux = 1'b0;
defparam syn__1652_.ShiftMux = 1'b0;
defparam syn__1652_.BypassEn = 1'b0;
defparam syn__1652_.CarryEnb = 1'b1;

alta_slice syn__1653_(
	.A(syn__0084_),
	.B(syn__0082_),
	.C(syn__0078_),
	.D(\tc2.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0201_),
	.Cout(),
	.Q());
defparam syn__1653_.coord_x = 6;
defparam syn__1653_.coord_y = 3;
defparam syn__1653_.coord_z = 7;
defparam syn__1653_.mask = 16'h50D0;
defparam syn__1653_.modeMux = 1'b0;
defparam syn__1653_.FeedbackMux = 1'b0;
defparam syn__1653_.ShiftMux = 1'b0;
defparam syn__1653_.BypassEn = 1'b0;
defparam syn__1653_.CarryEnb = 1'b1;

alta_slice syn__1654_(
	.A(syn__0077_),
	.B(syn__0082_),
	.C(syn__0084_),
	.D(\tc2.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0202_),
	.Cout(),
	.Q());
defparam syn__1654_.coord_x = 6;
defparam syn__1654_.coord_y = 3;
defparam syn__1654_.coord_z = 1;
defparam syn__1654_.mask = 16'h0A8A;
defparam syn__1654_.modeMux = 1'b0;
defparam syn__1654_.FeedbackMux = 1'b0;
defparam syn__1654_.ShiftMux = 1'b0;
defparam syn__1654_.BypassEn = 1'b0;
defparam syn__1654_.CarryEnb = 1'b1;

alta_slice syn__1655_(
	.A(vcc),
	.B(syn__0674_),
	.C(syn__0204_),
	.D(syn__0072_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0203_),
	.Cout(),
	.Q());
defparam syn__1655_.coord_x = 5;
defparam syn__1655_.coord_y = 2;
defparam syn__1655_.coord_z = 7;
defparam syn__1655_.mask = 16'hC0F0;
defparam syn__1655_.modeMux = 1'b0;
defparam syn__1655_.FeedbackMux = 1'b0;
defparam syn__1655_.ShiftMux = 1'b0;
defparam syn__1655_.BypassEn = 1'b0;
defparam syn__1655_.CarryEnb = 1'b1;

alta_slice syn__1656_(
	.A(syn__0702_),
	.B(syn__0706_),
	.C(\tc2.IM [6]),
	.D(\tc2.IM [5]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0204_),
	.Cout(),
	.Q());
defparam syn__1656_.coord_x = 7;
defparam syn__1656_.coord_y = 3;
defparam syn__1656_.coord_z = 1;
defparam syn__1656_.mask = 16'hFAFC;
defparam syn__1656_.modeMux = 1'b0;
defparam syn__1656_.FeedbackMux = 1'b0;
defparam syn__1656_.ShiftMux = 1'b0;
defparam syn__1656_.BypassEn = 1'b0;
defparam syn__1656_.CarryEnb = 1'b1;

alta_slice syn__1657_(
	.A(vcc),
	.B(syn__0206_),
	.C(vcc),
	.D(syn__0209_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0205_),
	.Cout(),
	.Q());
defparam syn__1657_.coord_x = 5;
defparam syn__1657_.coord_y = 2;
defparam syn__1657_.coord_z = 11;
defparam syn__1657_.mask = 16'hCC00;
defparam syn__1657_.modeMux = 1'b0;
defparam syn__1657_.FeedbackMux = 1'b0;
defparam syn__1657_.ShiftMux = 1'b0;
defparam syn__1657_.BypassEn = 1'b0;
defparam syn__1657_.CarryEnb = 1'b1;

alta_slice syn__1658_(
	.A(syn__0207_),
	.B(syn__0091_),
	.C(syn__0090_),
	.D(syn__0072_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0206_),
	.Cout(),
	.Q());
defparam syn__1658_.coord_x = 6;
defparam syn__1658_.coord_y = 3;
defparam syn__1658_.coord_z = 8;
defparam syn__1658_.mask = 16'h08AA;
defparam syn__1658_.modeMux = 1'b0;
defparam syn__1658_.FeedbackMux = 1'b0;
defparam syn__1658_.ShiftMux = 1'b0;
defparam syn__1658_.BypassEn = 1'b0;
defparam syn__1658_.CarryEnb = 1'b1;

alta_slice syn__1659_(
	.A(vcc),
	.B(syn__0702_),
	.C(syn__0208_),
	.D(syn__0078_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0207_),
	.Cout(),
	.Q());
defparam syn__1659_.coord_x = 6;
defparam syn__1659_.coord_y = 2;
defparam syn__1659_.coord_z = 10;
defparam syn__1659_.mask = 16'hC0F0;
defparam syn__1659_.modeMux = 1'b0;
defparam syn__1659_.FeedbackMux = 1'b0;
defparam syn__1659_.ShiftMux = 1'b0;
defparam syn__1659_.BypassEn = 1'b0;
defparam syn__1659_.CarryEnb = 1'b1;

alta_slice syn__1660_(
	.A(syn__0700_),
	.B(syn__0073_),
	.C(syn__0154_),
	.D(syn__0077_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0208_),
	.Cout(),
	.Q());
defparam syn__1660_.coord_x = 7;
defparam syn__1660_.coord_y = 2;
defparam syn__1660_.coord_z = 15;
defparam syn__1660_.mask = 16'hA2F3;
defparam syn__1660_.modeMux = 1'b0;
defparam syn__1660_.FeedbackMux = 1'b0;
defparam syn__1660_.ShiftMux = 1'b0;
defparam syn__1660_.BypassEn = 1'b0;
defparam syn__1660_.CarryEnb = 1'b1;

alta_slice syn__1661_(
	.A(syn__0090_),
	.B(syn__0091_),
	.C(syn__0210_),
	.D(syn__0078_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0209_),
	.Cout(),
	.Q());
defparam syn__1661_.coord_x = 6;
defparam syn__1661_.coord_y = 2;
defparam syn__1661_.coord_z = 2;
defparam syn__1661_.mask = 16'h40F0;
defparam syn__1661_.modeMux = 1'b0;
defparam syn__1661_.FeedbackMux = 1'b0;
defparam syn__1661_.ShiftMux = 1'b0;
defparam syn__1661_.BypassEn = 1'b0;
defparam syn__1661_.CarryEnb = 1'b1;

alta_slice syn__1662_(
	.A(syn__0077_),
	.B(vcc),
	.C(syn__0211_),
	.D(syn__0668_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0210_),
	.Cout(),
	.Q());
defparam syn__1662_.coord_x = 6;
defparam syn__1662_.coord_y = 3;
defparam syn__1662_.coord_z = 11;
defparam syn__1662_.mask = 16'hF050;
defparam syn__1662_.modeMux = 1'b0;
defparam syn__1662_.FeedbackMux = 1'b0;
defparam syn__1662_.ShiftMux = 1'b0;
defparam syn__1662_.BypassEn = 1'b0;
defparam syn__1662_.CarryEnb = 1'b1;

alta_slice syn__1663_(
	.A(syn__0704_),
	.B(syn__0702_),
	.C(syn__0073_),
	.D(syn__0072_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0211_),
	.Cout(),
	.Q());
defparam syn__1663_.coord_x = 6;
defparam syn__1663_.coord_y = 3;
defparam syn__1663_.coord_z = 14;
defparam syn__1663_.mask = 16'h8ACF;
defparam syn__1663_.modeMux = 1'b0;
defparam syn__1663_.FeedbackMux = 1'b0;
defparam syn__1663_.ShiftMux = 1'b0;
defparam syn__1663_.BypassEn = 1'b0;
defparam syn__1663_.CarryEnb = 1'b1;

alta_slice syn__1664_(
	.A(syn__0213_),
	.B(vcc),
	.C(syn__0219_),
	.D(syn__0216_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0212_),
	.Cout(),
	.Q());
defparam syn__1664_.coord_x = 11;
defparam syn__1664_.coord_y = 4;
defparam syn__1664_.coord_z = 6;
defparam syn__1664_.mask = 16'hA000;
defparam syn__1664_.modeMux = 1'b0;
defparam syn__1664_.FeedbackMux = 1'b0;
defparam syn__1664_.ShiftMux = 1'b0;
defparam syn__1664_.BypassEn = 1'b0;
defparam syn__1664_.CarryEnb = 1'b1;

alta_slice syn__1665_(
	.A(syn__0214_),
	.B(syn__0077_),
	.C(syn__0215_),
	.D(syn__1077_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0213_),
	.Cout(),
	.Q());
defparam syn__1665_.coord_x = 6;
defparam syn__1665_.coord_y = 3;
defparam syn__1665_.coord_z = 4;
defparam syn__1665_.mask = 16'h5010;
defparam syn__1665_.modeMux = 1'b0;
defparam syn__1665_.FeedbackMux = 1'b0;
defparam syn__1665_.ShiftMux = 1'b0;
defparam syn__1665_.BypassEn = 1'b0;
defparam syn__1665_.CarryEnb = 1'b1;

alta_slice syn__1666_(
	.A(syn__0073_),
	.B(vcc),
	.C(syn__0090_),
	.D(syn__0091_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0214_),
	.Cout(),
	.Q());
defparam syn__1666_.coord_x = 6;
defparam syn__1666_.coord_y = 3;
defparam syn__1666_.coord_z = 12;
defparam syn__1666_.mask = 16'hA0AA;
defparam syn__1666_.modeMux = 1'b0;
defparam syn__1666_.FeedbackMux = 1'b0;
defparam syn__1666_.ShiftMux = 1'b0;
defparam syn__1666_.BypassEn = 1'b0;
defparam syn__1666_.CarryEnb = 1'b1;

alta_slice syn__1667_(
	.A(syn__0704_),
	.B(syn__0154_),
	.C(\tc2.IM [6]),
	.D(\tc2.IM [5]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0215_),
	.Cout(),
	.Q());
defparam syn__1667_.coord_x = 7;
defparam syn__1667_.coord_y = 3;
defparam syn__1667_.coord_z = 11;
defparam syn__1667_.mask = 16'hCFAF;
defparam syn__1667_.modeMux = 1'b0;
defparam syn__1667_.FeedbackMux = 1'b0;
defparam syn__1667_.ShiftMux = 1'b0;
defparam syn__1667_.BypassEn = 1'b0;
defparam syn__1667_.CarryEnb = 1'b1;

alta_slice syn__1668_(
	.A(syn__0217_),
	.B(vcc),
	.C(syn__0073_),
	.D(syn__1077_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0216_),
	.Cout(),
	.Q());
defparam syn__1668_.coord_x = 6;
defparam syn__1668_.coord_y = 3;
defparam syn__1668_.coord_z = 0;
defparam syn__1668_.mask = 16'hAA0A;
defparam syn__1668_.modeMux = 1'b0;
defparam syn__1668_.FeedbackMux = 1'b0;
defparam syn__1668_.ShiftMux = 1'b0;
defparam syn__1668_.BypassEn = 1'b0;
defparam syn__1668_.CarryEnb = 1'b1;

alta_slice syn__1669_(
	.A(vcc),
	.B(syn__0218_),
	.C(syn__0700_),
	.D(syn__0072_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0217_),
	.Cout(),
	.Q());
defparam syn__1669_.coord_x = 6;
defparam syn__1669_.coord_y = 3;
defparam syn__1669_.coord_z = 2;
defparam syn__1669_.mask = 16'hC0CC;
defparam syn__1669_.modeMux = 1'b0;
defparam syn__1669_.FeedbackMux = 1'b0;
defparam syn__1669_.ShiftMux = 1'b0;
defparam syn__1669_.BypassEn = 1'b0;
defparam syn__1669_.CarryEnb = 1'b1;

alta_slice syn__1670_(
	.A(syn__0077_),
	.B(syn__0144_),
	.C(syn__0670_),
	.D(syn__0078_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0218_),
	.Cout(),
	.Q());
defparam syn__1670_.coord_x = 6;
defparam syn__1670_.coord_y = 2;
defparam syn__1670_.coord_z = 0;
defparam syn__1670_.mask = 16'hD0DD;
defparam syn__1670_.modeMux = 1'b0;
defparam syn__1670_.FeedbackMux = 1'b0;
defparam syn__1670_.ShiftMux = 1'b0;
defparam syn__1670_.BypassEn = 1'b0;
defparam syn__1670_.CarryEnb = 1'b1;

alta_slice syn__1671_(
	.A(vcc),
	.B(syn__1077_),
	.C(syn__0220_),
	.D(syn__0072_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0219_),
	.Cout(),
	.Q());
defparam syn__1671_.coord_x = 6;
defparam syn__1671_.coord_y = 3;
defparam syn__1671_.coord_z = 5;
defparam syn__1671_.mask = 16'hC0F0;
defparam syn__1671_.modeMux = 1'b0;
defparam syn__1671_.FeedbackMux = 1'b0;
defparam syn__1671_.ShiftMux = 1'b0;
defparam syn__1671_.BypassEn = 1'b0;
defparam syn__1671_.CarryEnb = 1'b1;

alta_slice syn__1672_(
	.A(vcc),
	.B(syn__0078_),
	.C(syn__0668_),
	.D(syn__0221_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0220_),
	.Cout(),
	.Q());
defparam syn__1672_.coord_x = 8;
defparam syn__1672_.coord_y = 3;
defparam syn__1672_.coord_z = 1;
defparam syn__1672_.mask = 16'hF300;
defparam syn__1672_.modeMux = 1'b0;
defparam syn__1672_.FeedbackMux = 1'b0;
defparam syn__1672_.ShiftMux = 1'b0;
defparam syn__1672_.BypassEn = 1'b0;
defparam syn__1672_.CarryEnb = 1'b1;

alta_slice syn__1673_(
	.A(syn__0700_),
	.B(syn__0073_),
	.C(syn__0696_),
	.D(syn__0077_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0221_),
	.Cout(),
	.Q());
defparam syn__1673_.coord_x = 7;
defparam syn__1673_.coord_y = 2;
defparam syn__1673_.coord_z = 5;
defparam syn__1673_.mask = 16'hB0BB;
defparam syn__1673_.modeMux = 1'b0;
defparam syn__1673_.FeedbackMux = 1'b0;
defparam syn__1673_.ShiftMux = 1'b0;
defparam syn__1673_.BypassEn = 1'b0;
defparam syn__1673_.CarryEnb = 1'b1;

alta_slice syn__1674_(
	.A(\tc2.IM [24]),
	.B(vcc),
	.C(\tc2.IM [4]),
	.D(syn__0216_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0222_),
	.Cout(),
	.Q());
defparam syn__1674_.coord_x = 11;
defparam syn__1674_.coord_y = 4;
defparam syn__1674_.coord_z = 15;
defparam syn__1674_.mask = 16'h5055;
defparam syn__1674_.modeMux = 1'b0;
defparam syn__1674_.FeedbackMux = 1'b0;
defparam syn__1674_.ShiftMux = 1'b0;
defparam syn__1674_.BypassEn = 1'b0;
defparam syn__1674_.CarryEnb = 1'b1;

alta_slice syn__1675_(
	.A(\tc2.IM [24]),
	.B(\tc2.IM [2]),
	.C(\tc2.IM [1]),
	.D(\tc2.IM [0]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0223_),
	.Cout(),
	.Q());
defparam syn__1675_.coord_x = 11;
defparam syn__1675_.coord_y = 3;
defparam syn__1675_.coord_z = 8;
defparam syn__1675_.mask = 16'h0040;
defparam syn__1675_.modeMux = 1'b0;
defparam syn__1675_.FeedbackMux = 1'b0;
defparam syn__1675_.ShiftMux = 1'b0;
defparam syn__1675_.BypassEn = 1'b0;
defparam syn__1675_.CarryEnb = 1'b1;

alta_slice syn__1677_(
	.A(syn__0223_),
	.B(\tc2.PC [1]),
	.C(syn__1074_),
	.D(\tc2.PC [0]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0224_),
	.Cout(),
	.Q());
defparam syn__1677_.coord_x = 12;
defparam syn__1677_.coord_y = 3;
defparam syn__1677_.coord_z = 0;
defparam syn__1677_.mask = 16'h1114;
defparam syn__1677_.modeMux = 1'b0;
defparam syn__1677_.FeedbackMux = 1'b0;
defparam syn__1677_.ShiftMux = 1'b0;
defparam syn__1677_.BypassEn = 1'b0;
defparam syn__1677_.CarryEnb = 1'b1;

alta_slice syn__1679_(
	.A(vcc),
	.B(\tc2.PC [1]),
	.C(syn__1074_),
	.D(\tc2.PC [0]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0225_),
	.Cout(),
	.Q());
defparam syn__1679_.coord_x = 12;
defparam syn__1679_.coord_y = 3;
defparam syn__1679_.coord_z = 10;
defparam syn__1679_.mask = 16'hCCC0;
defparam syn__1679_.modeMux = 1'b0;
defparam syn__1679_.FeedbackMux = 1'b0;
defparam syn__1679_.ShiftMux = 1'b0;
defparam syn__1679_.BypassEn = 1'b0;
defparam syn__1679_.CarryEnb = 1'b1;

alta_slice syn__1681_(
	.A(syn__0227_),
	.B(\tc2.PC [3]),
	.C(syn__1074_),
	.D(\tc2.PC [0]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0226_),
	.Cout(),
	.Q());
defparam syn__1681_.coord_x = 12;
defparam syn__1681_.coord_y = 3;
defparam syn__1681_.coord_z = 14;
defparam syn__1681_.mask = 16'h9993;
defparam syn__1681_.modeMux = 1'b0;
defparam syn__1681_.FeedbackMux = 1'b0;
defparam syn__1681_.ShiftMux = 1'b0;
defparam syn__1681_.BypassEn = 1'b0;
defparam syn__1681_.CarryEnb = 1'b1;

alta_slice syn__1682_(
	.A(vcc),
	.B(\tc2.PC [2]),
	.C(vcc),
	.D(\tc2.PC [1]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0227_),
	.Cout(),
	.Q());
defparam syn__1682_.coord_x = 12;
defparam syn__1682_.coord_y = 3;
defparam syn__1682_.coord_z = 12;
defparam syn__1682_.mask = 16'hCC00;
defparam syn__1682_.modeMux = 1'b0;
defparam syn__1682_.FeedbackMux = 1'b0;
defparam syn__1682_.ShiftMux = 1'b0;
defparam syn__1682_.BypassEn = 1'b0;
defparam syn__1682_.CarryEnb = 1'b1;

alta_slice syn__1684_(
	.A(vcc),
	.B(syn__0229_),
	.C(syn__1074_),
	.D(\tc2.PC [0]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0228_),
	.Cout(),
	.Q());
defparam syn__1684_.coord_x = 12;
defparam syn__1684_.coord_y = 3;
defparam syn__1684_.coord_z = 6;
defparam syn__1684_.mask = 16'hCCC0;
defparam syn__1684_.modeMux = 1'b0;
defparam syn__1684_.FeedbackMux = 1'b0;
defparam syn__1684_.ShiftMux = 1'b0;
defparam syn__1684_.BypassEn = 1'b0;
defparam syn__1684_.CarryEnb = 1'b1;

alta_slice syn__1685_(
	.A(vcc),
	.B(vcc),
	.C(syn__0227_),
	.D(\tc2.PC [3]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0229_),
	.Cout(),
	.Q());
defparam syn__1685_.coord_x = 11;
defparam syn__1685_.coord_y = 3;
defparam syn__1685_.coord_z = 6;
defparam syn__1685_.mask = 16'hF000;
defparam syn__1685_.modeMux = 1'b0;
defparam syn__1685_.FeedbackMux = 1'b0;
defparam syn__1685_.ShiftMux = 1'b0;
defparam syn__1685_.BypassEn = 1'b0;
defparam syn__1685_.CarryEnb = 1'b1;

alta_slice syn__1687_(
	.A(syn__0231_),
	.B(\tc2.PC [5]),
	.C(syn__1074_),
	.D(\tc2.PC [0]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0230_),
	.Cout(),
	.Q());
defparam syn__1687_.coord_x = 12;
defparam syn__1687_.coord_y = 3;
defparam syn__1687_.coord_z = 15;
defparam syn__1687_.mask = 16'h9993;
defparam syn__1687_.modeMux = 1'b0;
defparam syn__1687_.FeedbackMux = 1'b0;
defparam syn__1687_.ShiftMux = 1'b0;
defparam syn__1687_.BypassEn = 1'b0;
defparam syn__1687_.CarryEnb = 1'b1;

alta_slice syn__1688_(
	.A(vcc),
	.B(vcc),
	.C(syn__0229_),
	.D(\tc2.PC [4]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0231_),
	.Cout(),
	.Q());
defparam syn__1688_.coord_x = 11;
defparam syn__1688_.coord_y = 3;
defparam syn__1688_.coord_z = 14;
defparam syn__1688_.mask = 16'hF000;
defparam syn__1688_.modeMux = 1'b0;
defparam syn__1688_.FeedbackMux = 1'b0;
defparam syn__1688_.ShiftMux = 1'b0;
defparam syn__1688_.BypassEn = 1'b0;
defparam syn__1688_.CarryEnb = 1'b1;

alta_slice syn__1690_(
	.A(syn__0233_),
	.B(\tc2.PC [6]),
	.C(syn__1074_),
	.D(\tc2.PC [0]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0232_),
	.Cout(),
	.Q());
defparam syn__1690_.coord_x = 12;
defparam syn__1690_.coord_y = 3;
defparam syn__1690_.coord_z = 2;
defparam syn__1690_.mask = 16'h9993;
defparam syn__1690_.modeMux = 1'b0;
defparam syn__1690_.FeedbackMux = 1'b0;
defparam syn__1690_.ShiftMux = 1'b0;
defparam syn__1690_.BypassEn = 1'b0;
defparam syn__1690_.CarryEnb = 1'b1;

alta_slice syn__1691_(
	.A(vcc),
	.B(vcc),
	.C(\tc2.PC [5]),
	.D(syn__0231_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0233_),
	.Cout(),
	.Q());
defparam syn__1691_.coord_x = 11;
defparam syn__1691_.coord_y = 4;
defparam syn__1691_.coord_z = 9;
defparam syn__1691_.mask = 16'hF000;
defparam syn__1691_.modeMux = 1'b0;
defparam syn__1691_.FeedbackMux = 1'b0;
defparam syn__1691_.ShiftMux = 1'b0;
defparam syn__1691_.BypassEn = 1'b0;
defparam syn__1691_.CarryEnb = 1'b1;

alta_slice syn__1693_(
	.A(syn__0480_),
	.B(\tc3.IM [3]),
	.C(syn__0235_),
	.D(syn__0487_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0234_),
	.Cout(),
	.Q());
defparam syn__1693_.coord_x = 2;
defparam syn__1693_.coord_y = 7;
defparam syn__1693_.coord_z = 13;
defparam syn__1693_.mask = 16'hEC00;
defparam syn__1693_.modeMux = 1'b0;
defparam syn__1693_.FeedbackMux = 1'b0;
defparam syn__1693_.ShiftMux = 1'b0;
defparam syn__1693_.BypassEn = 1'b0;
defparam syn__1693_.CarryEnb = 1'b1;

alta_slice syn__1694_(
	.A(syn__0466_),
	.B(syn__0338_),
	.C(syn__0236_),
	.D(syn__0476_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0235_),
	.Cout(),
	.Q());
defparam syn__1694_.coord_x = 2;
defparam syn__1694_.coord_y = 6;
defparam syn__1694_.coord_z = 3;
defparam syn__1694_.mask = 16'h8000;
defparam syn__1694_.modeMux = 1'b0;
defparam syn__1694_.FeedbackMux = 1'b0;
defparam syn__1694_.ShiftMux = 1'b0;
defparam syn__1694_.BypassEn = 1'b0;
defparam syn__1694_.CarryEnb = 1'b1;

alta_slice syn__1695_(
	.A(vcc),
	.B(syn__0325_),
	.C(syn__0237_),
	.D(syn__0337_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0236_),
	.Cout(),
	.Q());
defparam syn__1695_.coord_x = 2;
defparam syn__1695_.coord_y = 6;
defparam syn__1695_.coord_z = 8;
defparam syn__1695_.mask = 16'hC0CC;
defparam syn__1695_.modeMux = 1'b0;
defparam syn__1695_.FeedbackMux = 1'b0;
defparam syn__1695_.ShiftMux = 1'b0;
defparam syn__1695_.BypassEn = 1'b0;
defparam syn__1695_.CarryEnb = 1'b1;

alta_slice syn__1696_(
	.A(syn__0238_),
	.B(syn__0320_),
	.C(syn__0324_),
	.D(\tc3.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0237_),
	.Cout(),
	.Q());
defparam syn__1696_.coord_x = 1;
defparam syn__1696_.coord_y = 3;
defparam syn__1696_.coord_z = 6;
defparam syn__1696_.mask = 16'hCC84;
defparam syn__1696_.modeMux = 1'b0;
defparam syn__1696_.FeedbackMux = 1'b0;
defparam syn__1696_.ShiftMux = 1'b0;
defparam syn__1696_.BypassEn = 1'b0;
defparam syn__1696_.CarryEnb = 1'b1;

alta_slice syn__1697_(
	.A(syn__0319_),
	.B(vcc),
	.C(syn__0318_),
	.D(syn__0239_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0238_),
	.Cout(),
	.Q());
defparam syn__1697_.coord_x = 1;
defparam syn__1697_.coord_y = 3;
defparam syn__1697_.coord_z = 14;
defparam syn__1697_.mask = 16'h0F05;
defparam syn__1697_.modeMux = 1'b0;
defparam syn__1697_.FeedbackMux = 1'b0;
defparam syn__1697_.ShiftMux = 1'b0;
defparam syn__1697_.BypassEn = 1'b0;
defparam syn__1697_.CarryEnb = 1'b1;

alta_slice syn__1698_(
	.A(syn__0317_),
	.B(syn__0316_),
	.C(syn__0315_),
	.D(syn__0240_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0239_),
	.Cout(),
	.Q());
defparam syn__1698_.coord_x = 1;
defparam syn__1698_.coord_y = 3;
defparam syn__1698_.coord_z = 15;
defparam syn__1698_.mask = 16'h0507;
defparam syn__1698_.modeMux = 1'b0;
defparam syn__1698_.FeedbackMux = 1'b0;
defparam syn__1698_.ShiftMux = 1'b0;
defparam syn__1698_.BypassEn = 1'b0;
defparam syn__1698_.CarryEnb = 1'b1;

alta_slice syn__1699_(
	.A(syn__0312_),
	.B(syn__0314_),
	.C(syn__0241_),
	.D(syn__0313_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0240_),
	.Cout(),
	.Q());
defparam syn__1699_.coord_x = 1;
defparam syn__1699_.coord_y = 4;
defparam syn__1699_.coord_z = 8;
defparam syn__1699_.mask = 16'h044C;
defparam syn__1699_.modeMux = 1'b0;
defparam syn__1699_.FeedbackMux = 1'b0;
defparam syn__1699_.ShiftMux = 1'b0;
defparam syn__1699_.BypassEn = 1'b0;
defparam syn__1699_.CarryEnb = 1'b1;

alta_slice syn__1700_(
	.A(syn__0309_),
	.B(syn__0242_),
	.C(syn__0310_),
	.D(syn__0311_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0241_),
	.Cout(),
	.Q());
defparam syn__1700_.coord_x = 1;
defparam syn__1700_.coord_y = 4;
defparam syn__1700_.coord_z = 0;
defparam syn__1700_.mask = 16'h0515;
defparam syn__1700_.modeMux = 1'b0;
defparam syn__1700_.FeedbackMux = 1'b0;
defparam syn__1700_.ShiftMux = 1'b0;
defparam syn__1700_.BypassEn = 1'b0;
defparam syn__1700_.CarryEnb = 1'b1;

alta_slice syn__1701_(
	.A(syn__0308_),
	.B(syn__0306_),
	.C(syn__0243_),
	.D(syn__0307_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0242_),
	.Cout(),
	.Q());
defparam syn__1701_.coord_x = 0;
defparam syn__1701_.coord_y = 3;
defparam syn__1701_.coord_z = 6;
defparam syn__1701_.mask = 16'h022A;
defparam syn__1701_.modeMux = 1'b0;
defparam syn__1701_.FeedbackMux = 1'b0;
defparam syn__1701_.ShiftMux = 1'b0;
defparam syn__1701_.BypassEn = 1'b0;
defparam syn__1701_.CarryEnb = 1'b1;

alta_slice syn__1702_(
	.A(syn__0303_),
	.B(syn__0244_),
	.C(syn__0305_),
	.D(syn__0304_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0243_),
	.Cout(),
	.Q());
defparam syn__1702_.coord_x = 0;
defparam syn__1702_.coord_y = 3;
defparam syn__1702_.coord_z = 12;
defparam syn__1702_.mask = 16'hAB02;
defparam syn__1702_.modeMux = 1'b0;
defparam syn__1702_.FeedbackMux = 1'b0;
defparam syn__1702_.ShiftMux = 1'b0;
defparam syn__1702_.BypassEn = 1'b0;
defparam syn__1702_.CarryEnb = 1'b1;

alta_slice syn__1703_(
	.A(syn__0245_),
	.B(syn__0300_),
	.C(syn__0301_),
	.D(syn__0302_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0244_),
	.Cout(),
	.Q());
defparam syn__1703_.coord_x = 0;
defparam syn__1703_.coord_y = 3;
defparam syn__1703_.coord_z = 1;
defparam syn__1703_.mask = 16'hC0C4;
defparam syn__1703_.modeMux = 1'b0;
defparam syn__1703_.FeedbackMux = 1'b0;
defparam syn__1703_.ShiftMux = 1'b0;
defparam syn__1703_.BypassEn = 1'b0;
defparam syn__1703_.CarryEnb = 1'b1;

alta_slice syn__1704_(
	.A(syn__0297_),
	.B(syn__0298_),
	.C(syn__0246_),
	.D(syn__0299_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0245_),
	.Cout(),
	.Q());
defparam syn__1704_.coord_x = 0;
defparam syn__1704_.coord_y = 3;
defparam syn__1704_.coord_z = 2;
defparam syn__1704_.mask = 16'h1115;
defparam syn__1704_.modeMux = 1'b0;
defparam syn__1704_.FeedbackMux = 1'b0;
defparam syn__1704_.ShiftMux = 1'b0;
defparam syn__1704_.BypassEn = 1'b0;
defparam syn__1704_.CarryEnb = 1'b1;

alta_slice syn__1705_(
	.A(syn__0247_),
	.B(syn__0294_),
	.C(syn__0296_),
	.D(syn__0295_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0246_),
	.Cout(),
	.Q());
defparam syn__1705_.coord_x = 0;
defparam syn__1705_.coord_y = 2;
defparam syn__1705_.coord_z = 1;
defparam syn__1705_.mask = 16'h0113;
defparam syn__1705_.modeMux = 1'b0;
defparam syn__1705_.FeedbackMux = 1'b0;
defparam syn__1705_.ShiftMux = 1'b0;
defparam syn__1705_.BypassEn = 1'b0;
defparam syn__1705_.CarryEnb = 1'b1;

alta_slice syn__1706_(
	.A(syn__0292_),
	.B(syn__0293_),
	.C(syn__0291_),
	.D(syn__0248_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0247_),
	.Cout(),
	.Q());
defparam syn__1706_.coord_x = 0;
defparam syn__1706_.coord_y = 2;
defparam syn__1706_.coord_z = 6;
defparam syn__1706_.mask = 16'h888E;
defparam syn__1706_.modeMux = 1'b0;
defparam syn__1706_.FeedbackMux = 1'b0;
defparam syn__1706_.ShiftMux = 1'b0;
defparam syn__1706_.BypassEn = 1'b0;
defparam syn__1706_.CarryEnb = 1'b1;

alta_slice syn__1707_(
	.A(syn__0286_),
	.B(syn__0289_),
	.C(syn__0290_),
	.D(syn__0249_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0248_),
	.Cout(),
	.Q());
defparam syn__1707_.coord_x = 1;
defparam syn__1707_.coord_y = 2;
defparam syn__1707_.coord_z = 15;
defparam syn__1707_.mask = 16'h0C04;
defparam syn__1707_.modeMux = 1'b0;
defparam syn__1707_.FeedbackMux = 1'b0;
defparam syn__1707_.ShiftMux = 1'b0;
defparam syn__1707_.BypassEn = 1'b0;
defparam syn__1707_.CarryEnb = 1'b1;

alta_slice syn__1708_(
	.A(syn__0285_),
	.B(syn__0283_),
	.C(syn__0284_),
	.D(syn__0250_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0249_),
	.Cout(),
	.Q());
defparam syn__1708_.coord_x = 1;
defparam syn__1708_.coord_y = 2;
defparam syn__1708_.coord_z = 7;
defparam syn__1708_.mask = 16'hC0C4;
defparam syn__1708_.modeMux = 1'b0;
defparam syn__1708_.FeedbackMux = 1'b0;
defparam syn__1708_.ShiftMux = 1'b0;
defparam syn__1708_.BypassEn = 1'b0;
defparam syn__1708_.CarryEnb = 1'b1;

alta_slice syn__1709_(
	.A(syn__0281_),
	.B(syn__0280_),
	.C(syn__0251_),
	.D(syn__0282_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0250_),
	.Cout(),
	.Q());
defparam syn__1709_.coord_x = 2;
defparam syn__1709_.coord_y = 2;
defparam syn__1709_.coord_z = 15;
defparam syn__1709_.mask = 16'h1113;
defparam syn__1709_.modeMux = 1'b0;
defparam syn__1709_.FeedbackMux = 1'b0;
defparam syn__1709_.ShiftMux = 1'b0;
defparam syn__1709_.BypassEn = 1'b0;
defparam syn__1709_.CarryEnb = 1'b1;

alta_slice syn__1710_(
	.A(syn__0252_),
	.B(syn__0277_),
	.C(syn__0279_),
	.D(syn__0278_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0251_),
	.Cout(),
	.Q());
defparam syn__1710_.coord_x = 4;
defparam syn__1710_.coord_y = 3;
defparam syn__1710_.coord_z = 1;
defparam syn__1710_.mask = 16'h0113;
defparam syn__1710_.modeMux = 1'b0;
defparam syn__1710_.FeedbackMux = 1'b0;
defparam syn__1710_.ShiftMux = 1'b0;
defparam syn__1710_.BypassEn = 1'b0;
defparam syn__1710_.CarryEnb = 1'b1;

alta_slice syn__1711_(
	.A(syn__0253_),
	.B(syn__0274_),
	.C(syn__0276_),
	.D(syn__0275_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0252_),
	.Cout(),
	.Q());
defparam syn__1711_.coord_x = 4;
defparam syn__1711_.coord_y = 3;
defparam syn__1711_.coord_z = 14;
defparam syn__1711_.mask = 16'hCD04;
defparam syn__1711_.modeMux = 1'b0;
defparam syn__1711_.FeedbackMux = 1'b0;
defparam syn__1711_.ShiftMux = 1'b0;
defparam syn__1711_.BypassEn = 1'b0;
defparam syn__1711_.CarryEnb = 1'b1;

alta_slice syn__1712_(
	.A(syn__0272_),
	.B(syn__0271_),
	.C(syn__0254_),
	.D(syn__0273_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0253_),
	.Cout(),
	.Q());
defparam syn__1712_.coord_x = 4;
defparam syn__1712_.coord_y = 5;
defparam syn__1712_.coord_z = 9;
defparam syn__1712_.mask = 16'h888C;
defparam syn__1712_.modeMux = 1'b0;
defparam syn__1712_.FeedbackMux = 1'b0;
defparam syn__1712_.ShiftMux = 1'b0;
defparam syn__1712_.BypassEn = 1'b0;
defparam syn__1712_.CarryEnb = 1'b1;

alta_slice syn__1713_(
	.A(syn__0268_),
	.B(syn__0270_),
	.C(syn__0255_),
	.D(syn__0269_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0254_),
	.Cout(),
	.Q());
defparam syn__1713_.coord_x = 4;
defparam syn__1713_.coord_y = 5;
defparam syn__1713_.coord_z = 0;
defparam syn__1713_.mask = 16'hAB02;
defparam syn__1713_.modeMux = 1'b0;
defparam syn__1713_.FeedbackMux = 1'b0;
defparam syn__1713_.ShiftMux = 1'b0;
defparam syn__1713_.BypassEn = 1'b0;
defparam syn__1713_.CarryEnb = 1'b1;

alta_slice syn__1714_(
	.A(syn__0265_),
	.B(syn__0267_),
	.C(syn__0256_),
	.D(syn__0266_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0255_),
	.Cout(),
	.Q());
defparam syn__1714_.coord_x = 4;
defparam syn__1714_.coord_y = 4;
defparam syn__1714_.coord_z = 7;
defparam syn__1714_.mask = 16'h0115;
defparam syn__1714_.modeMux = 1'b0;
defparam syn__1714_.FeedbackMux = 1'b0;
defparam syn__1714_.ShiftMux = 1'b0;
defparam syn__1714_.BypassEn = 1'b0;
defparam syn__1714_.CarryEnb = 1'b1;

alta_slice syn__1715_(
	.A(syn__0263_),
	.B(syn__0262_),
	.C(syn__0264_),
	.D(syn__0257_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0256_),
	.Cout(),
	.Q());
defparam syn__1715_.coord_x = 4;
defparam syn__1715_.coord_y = 4;
defparam syn__1715_.coord_z = 8;
defparam syn__1715_.mask = 16'h0313;
defparam syn__1715_.modeMux = 1'b0;
defparam syn__1715_.FeedbackMux = 1'b0;
defparam syn__1715_.ShiftMux = 1'b0;
defparam syn__1715_.BypassEn = 1'b0;
defparam syn__1715_.CarryEnb = 1'b1;

alta_slice syn__1716_(
	.A(syn__0261_),
	.B(syn__0259_),
	.C(syn__0258_),
	.D(syn__0260_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0257_),
	.Cout(),
	.Q());
defparam syn__1716_.coord_x = 5;
defparam syn__1716_.coord_y = 6;
defparam syn__1716_.coord_z = 12;
defparam syn__1716_.mask = 16'h2A02;
defparam syn__1716_.modeMux = 1'b0;
defparam syn__1716_.FeedbackMux = 1'b0;
defparam syn__1716_.ShiftMux = 1'b0;
defparam syn__1716_.BypassEn = 1'b0;
defparam syn__1716_.CarryEnb = 1'b1;

alta_slice syn__1717_(
	.A(vcc),
	.B(IOaddr3[1]),
	.C(\tc3.IM [7]),
	.D(\tc3.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0258_),
	.Cout(),
	.Q());
defparam syn__1717_.coord_x = 5;
defparam syn__1717_.coord_y = 6;
defparam syn__1717_.coord_z = 14;
defparam syn__1717_.mask = 16'h0FC3;
defparam syn__1717_.modeMux = 1'b0;
defparam syn__1717_.FeedbackMux = 1'b0;
defparam syn__1717_.ShiftMux = 1'b0;
defparam syn__1717_.BypassEn = 1'b0;
defparam syn__1717_.CarryEnb = 1'b1;

alta_slice syn__1718_(
	.A(vcc),
	.B(IOaddr3[1]),
	.C(IOvalue3[1]),
	.D(\tc3.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0259_),
	.Cout(),
	.Q());
defparam syn__1718_.coord_x = 5;
defparam syn__1718_.coord_y = 6;
defparam syn__1718_.coord_z = 3;
defparam syn__1718_.mask = 16'h330F;
defparam syn__1718_.modeMux = 1'b0;
defparam syn__1718_.FeedbackMux = 1'b0;
defparam syn__1718_.ShiftMux = 1'b0;
defparam syn__1718_.BypassEn = 1'b0;
defparam syn__1718_.CarryEnb = 1'b1;

alta_slice syn__1719_(
	.A(\tc3.IM [7]),
	.B(IOaddr3[0]),
	.C(IOvalue3[0]),
	.D(\tc3.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0260_),
	.Cout(),
	.Q());
defparam syn__1719_.coord_x = 4;
defparam syn__1719_.coord_y = 6;
defparam syn__1719_.coord_z = 11;
defparam syn__1719_.mask = 16'hCC60;
defparam syn__1719_.modeMux = 1'b0;
defparam syn__1719_.FeedbackMux = 1'b0;
defparam syn__1719_.ShiftMux = 1'b0;
defparam syn__1719_.BypassEn = 1'b0;
defparam syn__1719_.CarryEnb = 1'b1;

alta_slice syn__1720_(
	.A(IOaddr3[2]),
	.B(IOvalue3[2]),
	.C(\tc3.IM [7]),
	.D(\tc3.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0261_),
	.Cout(),
	.Q());
defparam syn__1720_.coord_x = 4;
defparam syn__1720_.coord_y = 4;
defparam syn__1720_.coord_z = 1;
defparam syn__1720_.mask = 16'h5A96;
defparam syn__1720_.modeMux = 1'b0;
defparam syn__1720_.FeedbackMux = 1'b0;
defparam syn__1720_.ShiftMux = 1'b0;
defparam syn__1720_.BypassEn = 1'b0;
defparam syn__1720_.CarryEnb = 1'b1;

alta_slice syn__1721_(
	.A(IOaddr3[3]),
	.B(IOvalue3[3]),
	.C(\tc3.IM [7]),
	.D(\tc3.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0262_),
	.Cout(),
	.Q());
defparam syn__1721_.coord_x = 4;
defparam syn__1721_.coord_y = 4;
defparam syn__1721_.coord_z = 3;
defparam syn__1721_.mask = 16'hA048;
defparam syn__1721_.modeMux = 1'b0;
defparam syn__1721_.FeedbackMux = 1'b0;
defparam syn__1721_.ShiftMux = 1'b0;
defparam syn__1721_.BypassEn = 1'b0;
defparam syn__1721_.CarryEnb = 1'b1;

alta_slice syn__1722_(
	.A(IOaddr3[2]),
	.B(IOvalue3[2]),
	.C(\tc3.IM [7]),
	.D(\tc3.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0263_),
	.Cout(),
	.Q());
defparam syn__1722_.coord_x = 4;
defparam syn__1722_.coord_y = 4;
defparam syn__1722_.coord_z = 10;
defparam syn__1722_.mask = 16'hA048;
defparam syn__1722_.modeMux = 1'b0;
defparam syn__1722_.FeedbackMux = 1'b0;
defparam syn__1722_.ShiftMux = 1'b0;
defparam syn__1722_.BypassEn = 1'b0;
defparam syn__1722_.CarryEnb = 1'b1;

alta_slice syn__1723_(
	.A(IOaddr3[3]),
	.B(IOvalue3[3]),
	.C(\tc3.IM [7]),
	.D(\tc3.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0264_),
	.Cout(),
	.Q());
defparam syn__1723_.coord_x = 4;
defparam syn__1723_.coord_y = 4;
defparam syn__1723_.coord_z = 9;
defparam syn__1723_.mask = 16'h5A96;
defparam syn__1723_.modeMux = 1'b0;
defparam syn__1723_.FeedbackMux = 1'b0;
defparam syn__1723_.ShiftMux = 1'b0;
defparam syn__1723_.BypassEn = 1'b0;
defparam syn__1723_.CarryEnb = 1'b1;

alta_slice syn__1724_(
	.A(\tc3.IM [7]),
	.B(IOaddr3[5]),
	.C(\tc3.IM [8]),
	.D(IOvalue3[5]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0265_),
	.Cout(),
	.Q());
defparam syn__1724_.coord_x = 5;
defparam syn__1724_.coord_y = 6;
defparam syn__1724_.coord_z = 9;
defparam syn__1724_.mask = 16'h1019;
defparam syn__1724_.modeMux = 1'b0;
defparam syn__1724_.FeedbackMux = 1'b0;
defparam syn__1724_.ShiftMux = 1'b0;
defparam syn__1724_.BypassEn = 1'b0;
defparam syn__1724_.CarryEnb = 1'b1;

alta_slice syn__1725_(
	.A(vcc),
	.B(IOaddr3[4]),
	.C(\tc3.IM [7]),
	.D(\tc3.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0266_),
	.Cout(),
	.Q());
defparam syn__1725_.coord_x = 4;
defparam syn__1725_.coord_y = 4;
defparam syn__1725_.coord_z = 5;
defparam syn__1725_.mask = 16'h0FC3;
defparam syn__1725_.modeMux = 1'b0;
defparam syn__1725_.FeedbackMux = 1'b0;
defparam syn__1725_.ShiftMux = 1'b0;
defparam syn__1725_.BypassEn = 1'b0;
defparam syn__1725_.CarryEnb = 1'b1;

alta_slice syn__1726_(
	.A(vcc),
	.B(IOaddr3[4]),
	.C(IOvalue3[4]),
	.D(\tc3.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0267_),
	.Cout(),
	.Q());
defparam syn__1726_.coord_x = 4;
defparam syn__1726_.coord_y = 4;
defparam syn__1726_.coord_z = 6;
defparam syn__1726_.mask = 16'h330F;
defparam syn__1726_.modeMux = 1'b0;
defparam syn__1726_.FeedbackMux = 1'b0;
defparam syn__1726_.ShiftMux = 1'b0;
defparam syn__1726_.BypassEn = 1'b0;
defparam syn__1726_.CarryEnb = 1'b1;

alta_slice syn__1727_(
	.A(vcc),
	.B(IOaddr3[6]),
	.C(\tc3.IM [7]),
	.D(\tc3.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0268_),
	.Cout(),
	.Q());
defparam syn__1727_.coord_x = 5;
defparam syn__1727_.coord_y = 6;
defparam syn__1727_.coord_z = 7;
defparam syn__1727_.mask = 16'h0FC3;
defparam syn__1727_.modeMux = 1'b0;
defparam syn__1727_.FeedbackMux = 1'b0;
defparam syn__1727_.ShiftMux = 1'b0;
defparam syn__1727_.BypassEn = 1'b0;
defparam syn__1727_.CarryEnb = 1'b1;

alta_slice syn__1728_(
	.A(vcc),
	.B(IOvalue3[6]),
	.C(IOaddr3[6]),
	.D(\tc3.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0269_),
	.Cout(),
	.Q());
defparam syn__1728_.coord_x = 4;
defparam syn__1728_.coord_y = 5;
defparam syn__1728_.coord_z = 11;
defparam syn__1728_.mask = 16'h0F33;
defparam syn__1728_.modeMux = 1'b0;
defparam syn__1728_.FeedbackMux = 1'b0;
defparam syn__1728_.ShiftMux = 1'b0;
defparam syn__1728_.BypassEn = 1'b0;
defparam syn__1728_.CarryEnb = 1'b1;

alta_slice syn__1729_(
	.A(\tc3.IM [7]),
	.B(IOaddr3[5]),
	.C(\tc3.IM [8]),
	.D(IOvalue3[5]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0270_),
	.Cout(),
	.Q());
defparam syn__1729_.coord_x = 5;
defparam syn__1729_.coord_y = 6;
defparam syn__1729_.coord_z = 5;
defparam syn__1729_.mask = 16'h8680;
defparam syn__1729_.modeMux = 1'b0;
defparam syn__1729_.FeedbackMux = 1'b0;
defparam syn__1729_.ShiftMux = 1'b0;
defparam syn__1729_.BypassEn = 1'b0;
defparam syn__1729_.CarryEnb = 1'b1;

alta_slice syn__1730_(
	.A(IOvalue3[8]),
	.B(IOaddr3[8]),
	.C(\tc3.IM [7]),
	.D(\tc3.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0271_),
	.Cout(),
	.Q());
defparam syn__1730_.coord_x = 4;
defparam syn__1730_.coord_y = 5;
defparam syn__1730_.coord_z = 8;
defparam syn__1730_.mask = 16'h3C96;
defparam syn__1730_.modeMux = 1'b0;
defparam syn__1730_.FeedbackMux = 1'b0;
defparam syn__1730_.ShiftMux = 1'b0;
defparam syn__1730_.BypassEn = 1'b0;
defparam syn__1730_.CarryEnb = 1'b1;

alta_slice syn__1731_(
	.A(IOaddr3[7]),
	.B(IOvalue3[7]),
	.C(\tc3.IM [7]),
	.D(\tc3.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0272_),
	.Cout(),
	.Q());
defparam syn__1731_.coord_x = 4;
defparam syn__1731_.coord_y = 5;
defparam syn__1731_.coord_z = 10;
defparam syn__1731_.mask = 16'hA048;
defparam syn__1731_.modeMux = 1'b0;
defparam syn__1731_.FeedbackMux = 1'b0;
defparam syn__1731_.ShiftMux = 1'b0;
defparam syn__1731_.BypassEn = 1'b0;
defparam syn__1731_.CarryEnb = 1'b1;

alta_slice syn__1732_(
	.A(IOaddr3[7]),
	.B(IOvalue3[7]),
	.C(\tc3.IM [7]),
	.D(\tc3.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0273_),
	.Cout(),
	.Q());
defparam syn__1732_.coord_x = 4;
defparam syn__1732_.coord_y = 5;
defparam syn__1732_.coord_z = 13;
defparam syn__1732_.mask = 16'h0521;
defparam syn__1732_.modeMux = 1'b0;
defparam syn__1732_.FeedbackMux = 1'b0;
defparam syn__1732_.ShiftMux = 1'b0;
defparam syn__1732_.BypassEn = 1'b0;
defparam syn__1732_.CarryEnb = 1'b1;

alta_slice syn__1733_(
	.A(vcc),
	.B(\tc3.IM [8]),
	.C(IOaddr3[9]),
	.D(\tc3.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0274_),
	.Cout(),
	.Q());
defparam syn__1733_.coord_x = 2;
defparam syn__1733_.coord_y = 3;
defparam syn__1733_.coord_z = 12;
defparam syn__1733_.mask = 16'h30CF;
defparam syn__1733_.modeMux = 1'b0;
defparam syn__1733_.FeedbackMux = 1'b0;
defparam syn__1733_.ShiftMux = 1'b0;
defparam syn__1733_.BypassEn = 1'b0;
defparam syn__1733_.CarryEnb = 1'b1;

alta_slice syn__1734_(
	.A(vcc),
	.B(\tc3.IM [8]),
	.C(IOvalue3[9]),
	.D(IOaddr3[9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0275_),
	.Cout(),
	.Q());
defparam syn__1734_.coord_x = 4;
defparam syn__1734_.coord_y = 3;
defparam syn__1734_.coord_z = 13;
defparam syn__1734_.mask = 16'h03CF;
defparam syn__1734_.modeMux = 1'b0;
defparam syn__1734_.FeedbackMux = 1'b0;
defparam syn__1734_.ShiftMux = 1'b0;
defparam syn__1734_.BypassEn = 1'b0;
defparam syn__1734_.CarryEnb = 1'b1;

alta_slice syn__1735_(
	.A(IOvalue3[8]),
	.B(IOaddr3[8]),
	.C(\tc3.IM [7]),
	.D(\tc3.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0276_),
	.Cout(),
	.Q());
defparam syn__1735_.coord_x = 4;
defparam syn__1735_.coord_y = 5;
defparam syn__1735_.coord_z = 4;
defparam syn__1735_.mask = 16'hC028;
defparam syn__1735_.modeMux = 1'b0;
defparam syn__1735_.FeedbackMux = 1'b0;
defparam syn__1735_.ShiftMux = 1'b0;
defparam syn__1735_.BypassEn = 1'b0;
defparam syn__1735_.CarryEnb = 1'b1;

alta_slice syn__1736_(
	.A(\tc3.IM [7]),
	.B(IOvalue3[11]),
	.C(IOaddr3[11]),
	.D(\tc3.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0277_),
	.Cout(),
	.Q());
defparam syn__1736_.coord_x = 4;
defparam syn__1736_.coord_y = 3;
defparam syn__1736_.coord_z = 11;
defparam syn__1736_.mask = 16'h0521;
defparam syn__1736_.modeMux = 1'b0;
defparam syn__1736_.FeedbackMux = 1'b0;
defparam syn__1736_.ShiftMux = 1'b0;
defparam syn__1736_.BypassEn = 1'b0;
defparam syn__1736_.CarryEnb = 1'b1;

alta_slice syn__1737_(
	.A(IOaddr3[10]),
	.B(\tc3.IM [8]),
	.C(\tc3.IM [7]),
	.D(vcc),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0278_),
	.Cout(),
	.Q());
defparam syn__1737_.coord_x = 4;
defparam syn__1737_.coord_y = 3;
defparam syn__1737_.coord_z = 3;
defparam syn__1737_.mask = 16'h2D2D;
defparam syn__1737_.modeMux = 1'b0;
defparam syn__1737_.FeedbackMux = 1'b0;
defparam syn__1737_.ShiftMux = 1'b0;
defparam syn__1737_.BypassEn = 1'b0;
defparam syn__1737_.CarryEnb = 1'b1;

alta_slice syn__1738_(
	.A(IOvalue3[10]),
	.B(vcc),
	.C(IOaddr3[10]),
	.D(\tc3.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0279_),
	.Cout(),
	.Q());
defparam syn__1738_.coord_x = 4;
defparam syn__1738_.coord_y = 3;
defparam syn__1738_.coord_z = 4;
defparam syn__1738_.mask = 16'h0F55;
defparam syn__1738_.modeMux = 1'b0;
defparam syn__1738_.FeedbackMux = 1'b0;
defparam syn__1738_.ShiftMux = 1'b0;
defparam syn__1738_.BypassEn = 1'b0;
defparam syn__1738_.CarryEnb = 1'b1;

alta_slice syn__1739_(
	.A(IOaddr3[12]),
	.B(IOvalue3[12]),
	.C(\tc3.IM [7]),
	.D(\tc3.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0280_),
	.Cout(),
	.Q());
defparam syn__1739_.coord_x = 2;
defparam syn__1739_.coord_y = 2;
defparam syn__1739_.coord_z = 14;
defparam syn__1739_.mask = 16'hA048;
defparam syn__1739_.modeMux = 1'b0;
defparam syn__1739_.FeedbackMux = 1'b0;
defparam syn__1739_.ShiftMux = 1'b0;
defparam syn__1739_.BypassEn = 1'b0;
defparam syn__1739_.CarryEnb = 1'b1;

alta_slice syn__1740_(
	.A(IOaddr3[12]),
	.B(IOvalue3[12]),
	.C(\tc3.IM [7]),
	.D(\tc3.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0281_),
	.Cout(),
	.Q());
defparam syn__1740_.coord_x = 2;
defparam syn__1740_.coord_y = 2;
defparam syn__1740_.coord_z = 8;
defparam syn__1740_.mask = 16'h5A96;
defparam syn__1740_.modeMux = 1'b0;
defparam syn__1740_.FeedbackMux = 1'b0;
defparam syn__1740_.ShiftMux = 1'b0;
defparam syn__1740_.BypassEn = 1'b0;
defparam syn__1740_.CarryEnb = 1'b1;

alta_slice syn__1741_(
	.A(IOaddr3[11]),
	.B(IOvalue3[11]),
	.C(\tc3.IM [7]),
	.D(\tc3.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0282_),
	.Cout(),
	.Q());
defparam syn__1741_.coord_x = 4;
defparam syn__1741_.coord_y = 3;
defparam syn__1741_.coord_z = 8;
defparam syn__1741_.mask = 16'hA048;
defparam syn__1741_.modeMux = 1'b0;
defparam syn__1741_.FeedbackMux = 1'b0;
defparam syn__1741_.ShiftMux = 1'b0;
defparam syn__1741_.BypassEn = 1'b0;
defparam syn__1741_.CarryEnb = 1'b1;

alta_slice syn__1742_(
	.A(IOaddr3[14]),
	.B(IOvalue3[14]),
	.C(\tc3.IM [7]),
	.D(\tc3.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0283_),
	.Cout(),
	.Q());
defparam syn__1742_.coord_x = 2;
defparam syn__1742_.coord_y = 2;
defparam syn__1742_.coord_z = 0;
defparam syn__1742_.mask = 16'h5A96;
defparam syn__1742_.modeMux = 1'b0;
defparam syn__1742_.FeedbackMux = 1'b0;
defparam syn__1742_.ShiftMux = 1'b0;
defparam syn__1742_.BypassEn = 1'b0;
defparam syn__1742_.CarryEnb = 1'b1;

alta_slice syn__1743_(
	.A(IOaddr3[13]),
	.B(IOvalue3[13]),
	.C(\tc3.IM [7]),
	.D(\tc3.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0284_),
	.Cout(),
	.Q());
defparam syn__1743_.coord_x = 2;
defparam syn__1743_.coord_y = 2;
defparam syn__1743_.coord_z = 10;
defparam syn__1743_.mask = 16'hA048;
defparam syn__1743_.modeMux = 1'b0;
defparam syn__1743_.FeedbackMux = 1'b0;
defparam syn__1743_.ShiftMux = 1'b0;
defparam syn__1743_.BypassEn = 1'b0;
defparam syn__1743_.CarryEnb = 1'b1;

alta_slice syn__1744_(
	.A(\tc3.IM [7]),
	.B(IOvalue3[13]),
	.C(\tc3.IM [8]),
	.D(IOaddr3[13]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0285_),
	.Cout(),
	.Q());
defparam syn__1744_.coord_x = 2;
defparam syn__1744_.coord_y = 2;
defparam syn__1744_.coord_z = 3;
defparam syn__1744_.mask = 16'h0251;
defparam syn__1744_.modeMux = 1'b0;
defparam syn__1744_.FeedbackMux = 1'b0;
defparam syn__1744_.ShiftMux = 1'b0;
defparam syn__1744_.BypassEn = 1'b0;
defparam syn__1744_.CarryEnb = 1'b1;

alta_slice syn__1745_(
	.A(vcc),
	.B(vcc),
	.C(syn__0287_),
	.D(syn__0288_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0286_),
	.Cout(),
	.Q());
defparam syn__1745_.coord_x = 1;
defparam syn__1745_.coord_y = 2;
defparam syn__1745_.coord_z = 12;
defparam syn__1745_.mask = 16'h000F;
defparam syn__1745_.modeMux = 1'b0;
defparam syn__1745_.FeedbackMux = 1'b0;
defparam syn__1745_.ShiftMux = 1'b0;
defparam syn__1745_.BypassEn = 1'b0;
defparam syn__1745_.CarryEnb = 1'b1;

alta_slice syn__1746_(
	.A(IOaddr3[14]),
	.B(IOvalue3[14]),
	.C(\tc3.IM [7]),
	.D(\tc3.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0287_),
	.Cout(),
	.Q());
defparam syn__1746_.coord_x = 1;
defparam syn__1746_.coord_y = 2;
defparam syn__1746_.coord_z = 13;
defparam syn__1746_.mask = 16'hA048;
defparam syn__1746_.modeMux = 1'b0;
defparam syn__1746_.FeedbackMux = 1'b0;
defparam syn__1746_.ShiftMux = 1'b0;
defparam syn__1746_.BypassEn = 1'b0;
defparam syn__1746_.CarryEnb = 1'b1;

alta_slice syn__1747_(
	.A(IOaddr3[15]),
	.B(IOvalue3[15]),
	.C(\tc3.IM [7]),
	.D(\tc3.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0288_),
	.Cout(),
	.Q());
defparam syn__1747_.coord_x = 1;
defparam syn__1747_.coord_y = 2;
defparam syn__1747_.coord_z = 5;
defparam syn__1747_.mask = 16'hA048;
defparam syn__1747_.modeMux = 1'b0;
defparam syn__1747_.FeedbackMux = 1'b0;
defparam syn__1747_.ShiftMux = 1'b0;
defparam syn__1747_.BypassEn = 1'b0;
defparam syn__1747_.CarryEnb = 1'b1;

alta_slice syn__1748_(
	.A(IOvalue3[16]),
	.B(\tc3.IM [8]),
	.C(\tc3.IM [7]),
	.D(IOaddr3[16]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0289_),
	.Cout(),
	.Q());
defparam syn__1748_.coord_x = 1;
defparam syn__1748_.coord_y = 2;
defparam syn__1748_.coord_z = 11;
defparam syn__1748_.mask = 16'h2DD2;
defparam syn__1748_.modeMux = 1'b0;
defparam syn__1748_.FeedbackMux = 1'b0;
defparam syn__1748_.ShiftMux = 1'b0;
defparam syn__1748_.BypassEn = 1'b0;
defparam syn__1748_.CarryEnb = 1'b1;

alta_slice syn__1749_(
	.A(IOaddr3[15]),
	.B(IOvalue3[15]),
	.C(\tc3.IM [7]),
	.D(\tc3.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0290_),
	.Cout(),
	.Q());
defparam syn__1749_.coord_x = 1;
defparam syn__1749_.coord_y = 2;
defparam syn__1749_.coord_z = 4;
defparam syn__1749_.mask = 16'h0521;
defparam syn__1749_.modeMux = 1'b0;
defparam syn__1749_.FeedbackMux = 1'b0;
defparam syn__1749_.ShiftMux = 1'b0;
defparam syn__1749_.BypassEn = 1'b0;
defparam syn__1749_.CarryEnb = 1'b1;

alta_slice syn__1750_(
	.A(IOvalue3[16]),
	.B(\tc3.IM [8]),
	.C(\tc3.IM [7]),
	.D(IOaddr3[16]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0291_),
	.Cout(),
	.Q());
defparam syn__1750_.coord_x = 1;
defparam syn__1750_.coord_y = 2;
defparam syn__1750_.coord_z = 14;
defparam syn__1750_.mask = 16'hC220;
defparam syn__1750_.modeMux = 1'b0;
defparam syn__1750_.FeedbackMux = 1'b0;
defparam syn__1750_.ShiftMux = 1'b0;
defparam syn__1750_.BypassEn = 1'b0;
defparam syn__1750_.CarryEnb = 1'b1;

alta_slice syn__1751_(
	.A(vcc),
	.B(\tc3.IM [7]),
	.C(IOaddr3[17]),
	.D(\tc3.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0292_),
	.Cout(),
	.Q());
defparam syn__1751_.coord_x = 0;
defparam syn__1751_.coord_y = 2;
defparam syn__1751_.coord_z = 12;
defparam syn__1751_.mask = 16'h33C3;
defparam syn__1751_.modeMux = 1'b0;
defparam syn__1751_.FeedbackMux = 1'b0;
defparam syn__1751_.ShiftMux = 1'b0;
defparam syn__1751_.BypassEn = 1'b0;
defparam syn__1751_.CarryEnb = 1'b1;

alta_slice syn__1752_(
	.A(IOaddr3[17]),
	.B(vcc),
	.C(IOvalue3[17]),
	.D(\tc3.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0293_),
	.Cout(),
	.Q());
defparam syn__1752_.coord_x = 0;
defparam syn__1752_.coord_y = 2;
defparam syn__1752_.coord_z = 3;
defparam syn__1752_.mask = 16'h550F;
defparam syn__1752_.modeMux = 1'b0;
defparam syn__1752_.FeedbackMux = 1'b0;
defparam syn__1752_.ShiftMux = 1'b0;
defparam syn__1752_.BypassEn = 1'b0;
defparam syn__1752_.CarryEnb = 1'b1;

alta_slice syn__1753_(
	.A(IOvalue3[19]),
	.B(\tc3.IM [7]),
	.C(IOaddr3[19]),
	.D(\tc3.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0294_),
	.Cout(),
	.Q());
defparam syn__1753_.coord_x = 6;
defparam syn__1753_.coord_y = 6;
defparam syn__1753_.coord_z = 15;
defparam syn__1753_.mask = 16'h0341;
defparam syn__1753_.modeMux = 1'b0;
defparam syn__1753_.FeedbackMux = 1'b0;
defparam syn__1753_.ShiftMux = 1'b0;
defparam syn__1753_.BypassEn = 1'b0;
defparam syn__1753_.CarryEnb = 1'b1;

alta_slice syn__1754_(
	.A(vcc),
	.B(\tc3.IM [7]),
	.C(IOaddr3[18]),
	.D(\tc3.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0295_),
	.Cout(),
	.Q());
defparam syn__1754_.coord_x = 0;
defparam syn__1754_.coord_y = 2;
defparam syn__1754_.coord_z = 5;
defparam syn__1754_.mask = 16'h33C3;
defparam syn__1754_.modeMux = 1'b0;
defparam syn__1754_.FeedbackMux = 1'b0;
defparam syn__1754_.ShiftMux = 1'b0;
defparam syn__1754_.BypassEn = 1'b0;
defparam syn__1754_.CarryEnb = 1'b1;

alta_slice syn__1755_(
	.A(IOvalue3[18]),
	.B(IOaddr3[18]),
	.C(vcc),
	.D(\tc3.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0296_),
	.Cout(),
	.Q());
defparam syn__1755_.coord_x = 0;
defparam syn__1755_.coord_y = 2;
defparam syn__1755_.coord_z = 10;
defparam syn__1755_.mask = 16'h3355;
defparam syn__1755_.modeMux = 1'b0;
defparam syn__1755_.FeedbackMux = 1'b0;
defparam syn__1755_.ShiftMux = 1'b0;
defparam syn__1755_.BypassEn = 1'b0;
defparam syn__1755_.CarryEnb = 1'b1;

alta_slice syn__1756_(
	.A(IOvalue3[20]),
	.B(IOaddr3[20]),
	.C(\tc3.IM [7]),
	.D(\tc3.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0297_),
	.Cout(),
	.Q());
defparam syn__1756_.coord_x = 0;
defparam syn__1756_.coord_y = 4;
defparam syn__1756_.coord_z = 3;
defparam syn__1756_.mask = 16'hC028;
defparam syn__1756_.modeMux = 1'b0;
defparam syn__1756_.FeedbackMux = 1'b0;
defparam syn__1756_.ShiftMux = 1'b0;
defparam syn__1756_.BypassEn = 1'b0;
defparam syn__1756_.CarryEnb = 1'b1;

alta_slice syn__1757_(
	.A(IOvalue3[20]),
	.B(\tc3.IM [8]),
	.C(IOaddr3[20]),
	.D(\tc3.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0298_),
	.Cout(),
	.Q());
defparam syn__1757_.coord_x = 2;
defparam syn__1757_.coord_y = 3;
defparam syn__1757_.coord_z = 4;
defparam syn__1757_.mask = 16'h2DD2;
defparam syn__1757_.modeMux = 1'b0;
defparam syn__1757_.FeedbackMux = 1'b0;
defparam syn__1757_.ShiftMux = 1'b0;
defparam syn__1757_.BypassEn = 1'b0;
defparam syn__1757_.CarryEnb = 1'b1;

alta_slice syn__1758_(
	.A(IOvalue3[19]),
	.B(IOaddr3[19]),
	.C(\tc3.IM [7]),
	.D(\tc3.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0299_),
	.Cout(),
	.Q());
defparam syn__1758_.coord_x = 0;
defparam syn__1758_.coord_y = 4;
defparam syn__1758_.coord_z = 2;
defparam syn__1758_.mask = 16'hC028;
defparam syn__1758_.modeMux = 1'b0;
defparam syn__1758_.FeedbackMux = 1'b0;
defparam syn__1758_.ShiftMux = 1'b0;
defparam syn__1758_.BypassEn = 1'b0;
defparam syn__1758_.CarryEnb = 1'b1;

alta_slice syn__1759_(
	.A(IOaddr3[22]),
	.B(IOvalue3[22]),
	.C(\tc3.IM [8]),
	.D(\tc3.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0300_),
	.Cout(),
	.Q());
defparam syn__1759_.coord_x = 0;
defparam syn__1759_.coord_y = 3;
defparam syn__1759_.coord_z = 5;
defparam syn__1759_.mask = 16'h59A6;
defparam syn__1759_.modeMux = 1'b0;
defparam syn__1759_.FeedbackMux = 1'b0;
defparam syn__1759_.ShiftMux = 1'b0;
defparam syn__1759_.BypassEn = 1'b0;
defparam syn__1759_.CarryEnb = 1'b1;

alta_slice syn__1760_(
	.A(IOvalue3[21]),
	.B(IOaddr3[21]),
	.C(\tc3.IM [8]),
	.D(\tc3.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0301_),
	.Cout(),
	.Q());
defparam syn__1760_.coord_x = 0;
defparam syn__1760_.coord_y = 3;
defparam syn__1760_.coord_z = 14;
defparam syn__1760_.mask = 16'hC208;
defparam syn__1760_.modeMux = 1'b0;
defparam syn__1760_.FeedbackMux = 1'b0;
defparam syn__1760_.ShiftMux = 1'b0;
defparam syn__1760_.BypassEn = 1'b0;
defparam syn__1760_.CarryEnb = 1'b1;

alta_slice syn__1761_(
	.A(IOaddr3[21]),
	.B(IOvalue3[21]),
	.C(\tc3.IM [8]),
	.D(\tc3.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0302_),
	.Cout(),
	.Q());
defparam syn__1761_.coord_x = 0;
defparam syn__1761_.coord_y = 3;
defparam syn__1761_.coord_z = 15;
defparam syn__1761_.mask = 16'h0251;
defparam syn__1761_.modeMux = 1'b0;
defparam syn__1761_.FeedbackMux = 1'b0;
defparam syn__1761_.ShiftMux = 1'b0;
defparam syn__1761_.BypassEn = 1'b0;
defparam syn__1761_.CarryEnb = 1'b1;

alta_slice syn__1762_(
	.A(vcc),
	.B(IOaddr3[23]),
	.C(\tc3.IM [8]),
	.D(\tc3.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0303_),
	.Cout(),
	.Q());
defparam syn__1762_.coord_x = 0;
defparam syn__1762_.coord_y = 3;
defparam syn__1762_.coord_z = 10;
defparam syn__1762_.mask = 16'h0CF3;
defparam syn__1762_.modeMux = 1'b0;
defparam syn__1762_.FeedbackMux = 1'b0;
defparam syn__1762_.ShiftMux = 1'b0;
defparam syn__1762_.BypassEn = 1'b0;
defparam syn__1762_.CarryEnb = 1'b1;

alta_slice syn__1763_(
	.A(IOvalue3[23]),
	.B(IOaddr3[23]),
	.C(\tc3.IM [8]),
	.D(vcc),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0304_),
	.Cout(),
	.Q());
defparam syn__1763_.coord_x = 0;
defparam syn__1763_.coord_y = 3;
defparam syn__1763_.coord_z = 11;
defparam syn__1763_.mask = 16'h3535;
defparam syn__1763_.modeMux = 1'b0;
defparam syn__1763_.FeedbackMux = 1'b0;
defparam syn__1763_.ShiftMux = 1'b0;
defparam syn__1763_.BypassEn = 1'b0;
defparam syn__1763_.CarryEnb = 1'b1;

alta_slice syn__1764_(
	.A(IOvalue3[22]),
	.B(IOaddr3[22]),
	.C(\tc3.IM [8]),
	.D(\tc3.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0305_),
	.Cout(),
	.Q());
defparam syn__1764_.coord_x = 0;
defparam syn__1764_.coord_y = 3;
defparam syn__1764_.coord_z = 13;
defparam syn__1764_.mask = 16'hC208;
defparam syn__1764_.modeMux = 1'b0;
defparam syn__1764_.FeedbackMux = 1'b0;
defparam syn__1764_.ShiftMux = 1'b0;
defparam syn__1764_.BypassEn = 1'b0;
defparam syn__1764_.CarryEnb = 1'b1;

alta_slice syn__1765_(
	.A(vcc),
	.B(IOaddr3[24]),
	.C(\tc3.IM [7]),
	.D(\tc3.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0306_),
	.Cout(),
	.Q());
defparam syn__1765_.coord_x = 1;
defparam syn__1765_.coord_y = 4;
defparam syn__1765_.coord_z = 5;
defparam syn__1765_.mask = 16'h0FC3;
defparam syn__1765_.modeMux = 1'b0;
defparam syn__1765_.FeedbackMux = 1'b0;
defparam syn__1765_.ShiftMux = 1'b0;
defparam syn__1765_.BypassEn = 1'b0;
defparam syn__1765_.CarryEnb = 1'b1;

alta_slice syn__1766_(
	.A(IOvalue3[24]),
	.B(IOaddr3[24]),
	.C(vcc),
	.D(\tc3.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0307_),
	.Cout(),
	.Q());
defparam syn__1766_.coord_x = 1;
defparam syn__1766_.coord_y = 4;
defparam syn__1766_.coord_z = 13;
defparam syn__1766_.mask = 16'h3355;
defparam syn__1766_.modeMux = 1'b0;
defparam syn__1766_.FeedbackMux = 1'b0;
defparam syn__1766_.ShiftMux = 1'b0;
defparam syn__1766_.BypassEn = 1'b0;
defparam syn__1766_.CarryEnb = 1'b1;

alta_slice syn__1767_(
	.A(IOaddr3[25]),
	.B(IOvalue3[25]),
	.C(\tc3.IM [7]),
	.D(\tc3.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0308_),
	.Cout(),
	.Q());
defparam syn__1767_.coord_x = 1;
defparam syn__1767_.coord_y = 4;
defparam syn__1767_.coord_z = 7;
defparam syn__1767_.mask = 16'h5A96;
defparam syn__1767_.modeMux = 1'b0;
defparam syn__1767_.FeedbackMux = 1'b0;
defparam syn__1767_.ShiftMux = 1'b0;
defparam syn__1767_.BypassEn = 1'b0;
defparam syn__1767_.CarryEnb = 1'b1;

alta_slice syn__1768_(
	.A(IOvalue3[26]),
	.B(IOaddr3[26]),
	.C(\tc3.IM [7]),
	.D(\tc3.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0309_),
	.Cout(),
	.Q());
defparam syn__1768_.coord_x = 0;
defparam syn__1768_.coord_y = 4;
defparam syn__1768_.coord_z = 8;
defparam syn__1768_.mask = 16'hC028;
defparam syn__1768_.modeMux = 1'b0;
defparam syn__1768_.FeedbackMux = 1'b0;
defparam syn__1768_.ShiftMux = 1'b0;
defparam syn__1768_.BypassEn = 1'b0;
defparam syn__1768_.CarryEnb = 1'b1;

alta_slice syn__1769_(
	.A(IOaddr3[26]),
	.B(IOvalue3[26]),
	.C(\tc3.IM [7]),
	.D(\tc3.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0310_),
	.Cout(),
	.Q());
defparam syn__1769_.coord_x = 0;
defparam syn__1769_.coord_y = 4;
defparam syn__1769_.coord_z = 9;
defparam syn__1769_.mask = 16'h5A96;
defparam syn__1769_.modeMux = 1'b0;
defparam syn__1769_.FeedbackMux = 1'b0;
defparam syn__1769_.ShiftMux = 1'b0;
defparam syn__1769_.BypassEn = 1'b0;
defparam syn__1769_.CarryEnb = 1'b1;

alta_slice syn__1770_(
	.A(IOvalue3[25]),
	.B(IOaddr3[25]),
	.C(\tc3.IM [7]),
	.D(\tc3.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0311_),
	.Cout(),
	.Q());
defparam syn__1770_.coord_x = 0;
defparam syn__1770_.coord_y = 4;
defparam syn__1770_.coord_z = 10;
defparam syn__1770_.mask = 16'hC028;
defparam syn__1770_.modeMux = 1'b0;
defparam syn__1770_.FeedbackMux = 1'b0;
defparam syn__1770_.ShiftMux = 1'b0;
defparam syn__1770_.BypassEn = 1'b0;
defparam syn__1770_.CarryEnb = 1'b1;

alta_slice syn__1771_(
	.A(vcc),
	.B(IOaddr3[27]),
	.C(\tc3.IM [7]),
	.D(\tc3.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0312_),
	.Cout(),
	.Q());
defparam syn__1771_.coord_x = 1;
defparam syn__1771_.coord_y = 4;
defparam syn__1771_.coord_z = 10;
defparam syn__1771_.mask = 16'h0FC3;
defparam syn__1771_.modeMux = 1'b0;
defparam syn__1771_.FeedbackMux = 1'b0;
defparam syn__1771_.ShiftMux = 1'b0;
defparam syn__1771_.BypassEn = 1'b0;
defparam syn__1771_.CarryEnb = 1'b1;

alta_slice syn__1772_(
	.A(IOvalue3[27]),
	.B(IOaddr3[27]),
	.C(vcc),
	.D(\tc3.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0313_),
	.Cout(),
	.Q());
defparam syn__1772_.coord_x = 1;
defparam syn__1772_.coord_y = 4;
defparam syn__1772_.coord_z = 9;
defparam syn__1772_.mask = 16'h3355;
defparam syn__1772_.modeMux = 1'b0;
defparam syn__1772_.FeedbackMux = 1'b0;
defparam syn__1772_.ShiftMux = 1'b0;
defparam syn__1772_.BypassEn = 1'b0;
defparam syn__1772_.CarryEnb = 1'b1;

alta_slice syn__1773_(
	.A(IOaddr3[28]),
	.B(IOvalue3[28]),
	.C(\tc3.IM [7]),
	.D(\tc3.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0314_),
	.Cout(),
	.Q());
defparam syn__1773_.coord_x = 1;
defparam syn__1773_.coord_y = 4;
defparam syn__1773_.coord_z = 15;
defparam syn__1773_.mask = 16'h5A96;
defparam syn__1773_.modeMux = 1'b0;
defparam syn__1773_.FeedbackMux = 1'b0;
defparam syn__1773_.ShiftMux = 1'b0;
defparam syn__1773_.BypassEn = 1'b0;
defparam syn__1773_.CarryEnb = 1'b1;

alta_slice syn__1774_(
	.A(IOvalue3[29]),
	.B(\tc3.IM [8]),
	.C(IOaddr3[29]),
	.D(\tc3.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0315_),
	.Cout(),
	.Q());
defparam syn__1774_.coord_x = 2;
defparam syn__1774_.coord_y = 3;
defparam syn__1774_.coord_z = 14;
defparam syn__1774_.mask = 16'hC220;
defparam syn__1774_.modeMux = 1'b0;
defparam syn__1774_.FeedbackMux = 1'b0;
defparam syn__1774_.ShiftMux = 1'b0;
defparam syn__1774_.BypassEn = 1'b0;
defparam syn__1774_.CarryEnb = 1'b1;

alta_slice syn__1775_(
	.A(IOvalue3[28]),
	.B(IOaddr3[28]),
	.C(\tc3.IM [7]),
	.D(\tc3.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0316_),
	.Cout(),
	.Q());
defparam syn__1775_.coord_x = 1;
defparam syn__1775_.coord_y = 3;
defparam syn__1775_.coord_z = 9;
defparam syn__1775_.mask = 16'hC028;
defparam syn__1775_.modeMux = 1'b0;
defparam syn__1775_.FeedbackMux = 1'b0;
defparam syn__1775_.ShiftMux = 1'b0;
defparam syn__1775_.BypassEn = 1'b0;
defparam syn__1775_.CarryEnb = 1'b1;

alta_slice syn__1776_(
	.A(IOaddr3[29]),
	.B(IOvalue3[29]),
	.C(\tc3.IM [7]),
	.D(\tc3.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0317_),
	.Cout(),
	.Q());
defparam syn__1776_.coord_x = 1;
defparam syn__1776_.coord_y = 3;
defparam syn__1776_.coord_z = 10;
defparam syn__1776_.mask = 16'h5A96;
defparam syn__1776_.modeMux = 1'b0;
defparam syn__1776_.FeedbackMux = 1'b0;
defparam syn__1776_.ShiftMux = 1'b0;
defparam syn__1776_.BypassEn = 1'b0;
defparam syn__1776_.CarryEnb = 1'b1;

alta_slice syn__1777_(
	.A(IOvalue3[30]),
	.B(\tc3.IM [8]),
	.C(IOaddr3[30]),
	.D(\tc3.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0318_),
	.Cout(),
	.Q());
defparam syn__1777_.coord_x = 2;
defparam syn__1777_.coord_y = 3;
defparam syn__1777_.coord_z = 10;
defparam syn__1777_.mask = 16'hC220;
defparam syn__1777_.modeMux = 1'b0;
defparam syn__1777_.FeedbackMux = 1'b0;
defparam syn__1777_.ShiftMux = 1'b0;
defparam syn__1777_.BypassEn = 1'b0;
defparam syn__1777_.CarryEnb = 1'b1;

alta_slice syn__1778_(
	.A(IOvalue3[30]),
	.B(\tc3.IM [8]),
	.C(IOaddr3[30]),
	.D(\tc3.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0319_),
	.Cout(),
	.Q());
defparam syn__1778_.coord_x = 2;
defparam syn__1778_.coord_y = 3;
defparam syn__1778_.coord_z = 8;
defparam syn__1778_.mask = 16'h2DD2;
defparam syn__1778_.modeMux = 1'b0;
defparam syn__1778_.FeedbackMux = 1'b0;
defparam syn__1778_.ShiftMux = 1'b0;
defparam syn__1778_.BypassEn = 1'b0;
defparam syn__1778_.CarryEnb = 1'b1;

alta_slice syn__1779_(
	.A(IOvalue3[31]),
	.B(IOaddr3[31]),
	.C(syn__0323_),
	.D(syn__0321_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0320_),
	.Cout(),
	.Q());
defparam syn__1779_.coord_x = 1;
defparam syn__1779_.coord_y = 3;
defparam syn__1779_.coord_z = 3;
defparam syn__1779_.mask = 16'h009F;
defparam syn__1779_.modeMux = 1'b0;
defparam syn__1779_.FeedbackMux = 1'b0;
defparam syn__1779_.ShiftMux = 1'b0;
defparam syn__1779_.BypassEn = 1'b0;
defparam syn__1779_.CarryEnb = 1'b1;

alta_slice syn__1780_(
	.A(IOaddr3[31]),
	.B(\tc3.IM [7]),
	.C(IOvalue3[31]),
	.D(syn__0322_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0321_),
	.Cout(),
	.Q());
defparam syn__1780_.coord_x = 2;
defparam syn__1780_.coord_y = 3;
defparam syn__1780_.coord_z = 3;
defparam syn__1780_.mask = 16'hE800;
defparam syn__1780_.modeMux = 1'b0;
defparam syn__1780_.FeedbackMux = 1'b0;
defparam syn__1780_.ShiftMux = 1'b0;
defparam syn__1780_.BypassEn = 1'b0;
defparam syn__1780_.CarryEnb = 1'b1;

alta_slice syn__1781_(
	.A(vcc),
	.B(vcc),
	.C(\tc3.IM [9]),
	.D(\tc3.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0322_),
	.Cout(),
	.Q());
defparam syn__1781_.coord_x = 2;
defparam syn__1781_.coord_y = 3;
defparam syn__1781_.coord_z = 5;
defparam syn__1781_.mask = 16'h00F0;
defparam syn__1781_.modeMux = 1'b0;
defparam syn__1781_.FeedbackMux = 1'b0;
defparam syn__1781_.ShiftMux = 1'b0;
defparam syn__1781_.BypassEn = 1'b0;
defparam syn__1781_.CarryEnb = 1'b1;

alta_slice syn__1782_(
	.A(vcc),
	.B(\tc3.IM [9]),
	.C(\tc3.IM [7]),
	.D(\tc3.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0323_),
	.Cout(),
	.Q());
defparam syn__1782_.coord_x = 1;
defparam syn__1782_.coord_y = 3;
defparam syn__1782_.coord_z = 8;
defparam syn__1782_.mask = 16'hC000;
defparam syn__1782_.modeMux = 1'b0;
defparam syn__1782_.FeedbackMux = 1'b0;
defparam syn__1782_.ShiftMux = 1'b0;
defparam syn__1782_.BypassEn = 1'b0;
defparam syn__1782_.CarryEnb = 1'b1;

alta_slice syn__1783_(
	.A(IOaddr3[31]),
	.B(IOvalue3[31]),
	.C(\tc3.IM [7]),
	.D(\tc3.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0324_),
	.Cout(),
	.Q());
defparam syn__1783_.coord_x = 0;
defparam syn__1783_.coord_y = 4;
defparam syn__1783_.coord_z = 6;
defparam syn__1783_.mask = 16'hA569;
defparam syn__1783_.modeMux = 1'b0;
defparam syn__1783_.FeedbackMux = 1'b0;
defparam syn__1783_.ShiftMux = 1'b0;
defparam syn__1783_.BypassEn = 1'b0;
defparam syn__1783_.CarryEnb = 1'b1;

alta_slice syn__1784_(
	.A(syn__0328_),
	.B(vcc),
	.C(syn__0336_),
	.D(syn__0728_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0325_),
	.Cout(),
	.Q());
defparam syn__1784_.coord_x = 1;
defparam syn__1784_.coord_y = 7;
defparam syn__1784_.coord_z = 0;
defparam syn__1784_.mask = 16'hAA0A;
defparam syn__1784_.modeMux = 1'b0;
defparam syn__1784_.FeedbackMux = 1'b0;
defparam syn__1784_.ShiftMux = 1'b0;
defparam syn__1784_.BypassEn = 1'b0;
defparam syn__1784_.CarryEnb = 1'b1;

alta_slice syn__1785_(
	.A(\tc3.IM [9]),
	.B(syn__0327_),
	.C(syn__0249_),
	.D(syn__0287_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0326_),
	.Cout(),
	.Q());
defparam syn__1785_.coord_x = 1;
defparam syn__1785_.coord_y = 2;
defparam syn__1785_.coord_z = 6;
defparam syn__1785_.mask = 16'h1114;
defparam syn__1785_.modeMux = 1'b0;
defparam syn__1785_.FeedbackMux = 1'b0;
defparam syn__1785_.ShiftMux = 1'b0;
defparam syn__1785_.BypassEn = 1'b0;
defparam syn__1785_.CarryEnb = 1'b1;

alta_slice syn__1786_(
	.A(vcc),
	.B(vcc),
	.C(syn__0290_),
	.D(syn__0288_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0327_),
	.Cout(),
	.Q());
defparam syn__1786_.coord_x = 1;
defparam syn__1786_.coord_y = 2;
defparam syn__1786_.coord_z = 9;
defparam syn__1786_.mask = 16'h000F;
defparam syn__1786_.modeMux = 1'b0;
defparam syn__1786_.FeedbackMux = 1'b0;
defparam syn__1786_.ShiftMux = 1'b0;
defparam syn__1786_.BypassEn = 1'b0;
defparam syn__1786_.CarryEnb = 1'b1;

alta_slice syn__1787_(
	.A(syn__0335_),
	.B(syn__0730_),
	.C(syn__0330_),
	.D(syn__0334_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0328_),
	.Cout(),
	.Q());
defparam syn__1787_.coord_x = 1;
defparam syn__1787_.coord_y = 6;
defparam syn__1787_.coord_z = 3;
defparam syn__1787_.mask = 16'hC4F5;
defparam syn__1787_.modeMux = 1'b0;
defparam syn__1787_.FeedbackMux = 1'b0;
defparam syn__1787_.ShiftMux = 1'b0;
defparam syn__1787_.BypassEn = 1'b0;
defparam syn__1787_.CarryEnb = 1'b1;

alta_slice syn__1788_(
	.A(vcc),
	.B(vcc),
	.C(syn__0272_),
	.D(syn__0273_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0329_),
	.Cout(),
	.Q());
defparam syn__1788_.coord_x = 4;
defparam syn__1788_.coord_y = 5;
defparam syn__1788_.coord_z = 14;
defparam syn__1788_.mask = 16'h000F;
defparam syn__1788_.modeMux = 1'b0;
defparam syn__1788_.FeedbackMux = 1'b0;
defparam syn__1788_.ShiftMux = 1'b0;
defparam syn__1788_.BypassEn = 1'b0;
defparam syn__1788_.CarryEnb = 1'b1;

alta_slice syn__1789_(
	.A(syn__0331_),
	.B(syn__0260_),
	.C(syn__0333_),
	.D(\tc3.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0330_),
	.Cout(),
	.Q());
defparam syn__1789_.coord_x = 4;
defparam syn__1789_.coord_y = 6;
defparam syn__1789_.coord_z = 5;
defparam syn__1789_.mask = 16'hAAA8;
defparam syn__1789_.modeMux = 1'b0;
defparam syn__1789_.FeedbackMux = 1'b0;
defparam syn__1789_.ShiftMux = 1'b0;
defparam syn__1789_.BypassEn = 1'b0;
defparam syn__1789_.CarryEnb = 1'b1;

alta_slice syn__1790_(
	.A(syn__0323_),
	.B(syn__0332_),
	.C(IOvalue3[0]),
	.D(IOaddr3[0]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0331_),
	.Cout(),
	.Q());
defparam syn__1790_.coord_x = 4;
defparam syn__1790_.coord_y = 6;
defparam syn__1790_.coord_z = 4;
defparam syn__1790_.mask = 16'h3113;
defparam syn__1790_.modeMux = 1'b0;
defparam syn__1790_.FeedbackMux = 1'b0;
defparam syn__1790_.ShiftMux = 1'b0;
defparam syn__1790_.BypassEn = 1'b0;
defparam syn__1790_.CarryEnb = 1'b1;

alta_slice syn__1791_(
	.A(IOvalue3[0]),
	.B(IOaddr3[0]),
	.C(\tc3.IM [7]),
	.D(syn__0322_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0332_),
	.Cout(),
	.Q());
defparam syn__1791_.coord_x = 4;
defparam syn__1791_.coord_y = 6;
defparam syn__1791_.coord_z = 3;
defparam syn__1791_.mask = 16'hE800;
defparam syn__1791_.modeMux = 1'b0;
defparam syn__1791_.FeedbackMux = 1'b0;
defparam syn__1791_.ShiftMux = 1'b0;
defparam syn__1791_.BypassEn = 1'b0;
defparam syn__1791_.CarryEnb = 1'b1;

alta_slice syn__1792_(
	.A(IOvalue3[0]),
	.B(IOaddr3[0]),
	.C(\tc3.IM [7]),
	.D(\tc3.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0333_),
	.Cout(),
	.Q());
defparam syn__1792_.coord_x = 4;
defparam syn__1792_.coord_y = 6;
defparam syn__1792_.coord_z = 10;
defparam syn__1792_.mask = 16'h0041;
defparam syn__1792_.modeMux = 1'b0;
defparam syn__1792_.FeedbackMux = 1'b0;
defparam syn__1792_.ShiftMux = 1'b0;
defparam syn__1792_.BypassEn = 1'b0;
defparam syn__1792_.CarryEnb = 1'b1;

alta_slice syn__1793_(
	.A(vcc),
	.B(vcc),
	.C(\tc3.IM [6]),
	.D(\tc3.IM [5]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0334_),
	.Cout(),
	.Q());
defparam syn__1793_.coord_x = 1;
defparam syn__1793_.coord_y = 5;
defparam syn__1793_.coord_z = 13;
defparam syn__1793_.mask = 16'h00F0;
defparam syn__1793_.modeMux = 1'b0;
defparam syn__1793_.FeedbackMux = 1'b0;
defparam syn__1793_.ShiftMux = 1'b0;
defparam syn__1793_.BypassEn = 1'b0;
defparam syn__1793_.CarryEnb = 1'b1;

alta_slice syn__1794_(
	.A(vcc),
	.B(vcc),
	.C(\tc3.IM [6]),
	.D(\tc3.IM [5]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0335_),
	.Cout(),
	.Q());
defparam syn__1794_.coord_x = 1;
defparam syn__1794_.coord_y = 5;
defparam syn__1794_.coord_z = 14;
defparam syn__1794_.mask = 16'h0F00;
defparam syn__1794_.modeMux = 1'b0;
defparam syn__1794_.FeedbackMux = 1'b0;
defparam syn__1794_.ShiftMux = 1'b0;
defparam syn__1794_.BypassEn = 1'b0;
defparam syn__1794_.CarryEnb = 1'b1;

alta_slice syn__1795_(
	.A(vcc),
	.B(vcc),
	.C(\tc3.IM [6]),
	.D(\tc3.IM [5]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0336_),
	.Cout(),
	.Q());
defparam syn__1795_.coord_x = 1;
defparam syn__1795_.coord_y = 7;
defparam syn__1795_.coord_z = 12;
defparam syn__1795_.mask = 16'hF000;
defparam syn__1795_.modeMux = 1'b0;
defparam syn__1795_.FeedbackMux = 1'b0;
defparam syn__1795_.ShiftMux = 1'b0;
defparam syn__1795_.BypassEn = 1'b0;
defparam syn__1795_.CarryEnb = 1'b1;

alta_slice syn__1796_(
	.A(vcc),
	.B(vcc),
	.C(\tc3.IM [6]),
	.D(\tc3.IM [5]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0337_),
	.Cout(),
	.Q());
defparam syn__1796_.coord_x = 1;
defparam syn__1796_.coord_y = 7;
defparam syn__1796_.coord_z = 1;
defparam syn__1796_.mask = 16'h000F;
defparam syn__1796_.modeMux = 1'b0;
defparam syn__1796_.FeedbackMux = 1'b0;
defparam syn__1796_.ShiftMux = 1'b0;
defparam syn__1796_.BypassEn = 1'b0;
defparam syn__1796_.CarryEnb = 1'b1;

alta_slice syn__1797_(
	.A(syn__0352_),
	.B(syn__0778_),
	.C(syn__0463_),
	.D(syn__0339_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0338_),
	.Cout(),
	.Q());
defparam syn__1797_.coord_x = 1;
defparam syn__1797_.coord_y = 3;
defparam syn__1797_.coord_z = 0;
defparam syn__1797_.mask = 16'h8000;
defparam syn__1797_.modeMux = 1'b0;
defparam syn__1797_.FeedbackMux = 1'b0;
defparam syn__1797_.ShiftMux = 1'b0;
defparam syn__1797_.BypassEn = 1'b0;
defparam syn__1797_.CarryEnb = 1'b1;

alta_slice syn__1798_(
	.A(vcc),
	.B(syn__0340_),
	.C(syn__0344_),
	.D(syn__0336_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0339_),
	.Cout(),
	.Q());
defparam syn__1798_.coord_x = 0;
defparam syn__1798_.coord_y = 5;
defparam syn__1798_.coord_z = 12;
defparam syn__1798_.mask = 16'hC0F0;
defparam syn__1798_.modeMux = 1'b0;
defparam syn__1798_.FeedbackMux = 1'b0;
defparam syn__1798_.ShiftMux = 1'b0;
defparam syn__1798_.BypassEn = 1'b0;
defparam syn__1798_.CarryEnb = 1'b1;

alta_slice syn__1799_(
	.A(vcc),
	.B(vcc),
	.C(syn__0341_),
	.D(syn__0342_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0340_),
	.Cout(),
	.Q());
defparam syn__1799_.coord_x = 1;
defparam syn__1799_.coord_y = 3;
defparam syn__1799_.coord_z = 12;
defparam syn__1799_.mask = 16'h0F00;
defparam syn__1799_.modeMux = 1'b0;
defparam syn__1799_.FeedbackMux = 1'b0;
defparam syn__1799_.ShiftMux = 1'b0;
defparam syn__1799_.BypassEn = 1'b0;
defparam syn__1799_.CarryEnb = 1'b1;

alta_slice syn__1800_(
	.A(syn__0316_),
	.B(syn__0240_),
	.C(syn__0317_),
	.D(\tc3.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0341_),
	.Cout(),
	.Q());
defparam syn__1800_.coord_x = 1;
defparam syn__1800_.coord_y = 3;
defparam syn__1800_.coord_z = 2;
defparam syn__1800_.mask = 16'h001E;
defparam syn__1800_.modeMux = 1'b0;
defparam syn__1800_.FeedbackMux = 1'b0;
defparam syn__1800_.ShiftMux = 1'b0;
defparam syn__1800_.BypassEn = 1'b0;
defparam syn__1800_.CarryEnb = 1'b1;

alta_slice syn__1801_(
	.A(IOvalue3[29]),
	.B(IOaddr3[29]),
	.C(syn__0323_),
	.D(syn__0343_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0342_),
	.Cout(),
	.Q());
defparam syn__1801_.coord_x = 1;
defparam syn__1801_.coord_y = 3;
defparam syn__1801_.coord_z = 1;
defparam syn__1801_.mask = 16'h009F;
defparam syn__1801_.modeMux = 1'b0;
defparam syn__1801_.FeedbackMux = 1'b0;
defparam syn__1801_.ShiftMux = 1'b0;
defparam syn__1801_.BypassEn = 1'b0;
defparam syn__1801_.CarryEnb = 1'b1;

alta_slice syn__1802_(
	.A(IOaddr3[29]),
	.B(\tc3.IM [7]),
	.C(IOvalue3[29]),
	.D(syn__0322_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0343_),
	.Cout(),
	.Q());
defparam syn__1802_.coord_x = 2;
defparam syn__1802_.coord_y = 3;
defparam syn__1802_.coord_z = 15;
defparam syn__1802_.mask = 16'hE800;
defparam syn__1802_.modeMux = 1'b0;
defparam syn__1802_.FeedbackMux = 1'b0;
defparam syn__1802_.ShiftMux = 1'b0;
defparam syn__1802_.BypassEn = 1'b0;
defparam syn__1802_.CarryEnb = 1'b1;

alta_slice syn__1803_(
	.A(vcc),
	.B(syn__0346_),
	.C(syn__0334_),
	.D(syn__0732_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0344_),
	.Cout(),
	.Q());
defparam syn__1803_.coord_x = 0;
defparam syn__1803_.coord_y = 5;
defparam syn__1803_.coord_z = 8;
defparam syn__1803_.mask = 16'hCC0C;
defparam syn__1803_.modeMux = 1'b0;
defparam syn__1803_.FeedbackMux = 1'b0;
defparam syn__1803_.ShiftMux = 1'b0;
defparam syn__1803_.BypassEn = 1'b0;
defparam syn__1803_.CarryEnb = 1'b1;

alta_slice syn__1804_(
	.A(vcc),
	.B(vcc),
	.C(syn__0301_),
	.D(syn__0302_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0345_),
	.Cout(),
	.Q());
defparam syn__1804_.coord_x = 0;
defparam syn__1804_.coord_y = 3;
defparam syn__1804_.coord_z = 4;
defparam syn__1804_.mask = 16'h000F;
defparam syn__1804_.modeMux = 1'b0;
defparam syn__1804_.FeedbackMux = 1'b0;
defparam syn__1804_.ShiftMux = 1'b0;
defparam syn__1804_.BypassEn = 1'b0;
defparam syn__1804_.CarryEnb = 1'b1;

alta_slice syn__1805_(
	.A(syn__0347_),
	.B(syn__0337_),
	.C(syn__0734_),
	.D(syn__0335_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0346_),
	.Cout(),
	.Q());
defparam syn__1805_.coord_x = 1;
defparam syn__1805_.coord_y = 5;
defparam syn__1805_.coord_z = 15;
defparam syn__1805_.mask = 16'hA2F3;
defparam syn__1805_.modeMux = 1'b0;
defparam syn__1805_.FeedbackMux = 1'b0;
defparam syn__1805_.ShiftMux = 1'b0;
defparam syn__1805_.BypassEn = 1'b0;
defparam syn__1805_.CarryEnb = 1'b1;

alta_slice syn__1806_(
	.A(syn__0349_),
	.B(syn__0348_),
	.C(syn__0283_),
	.D(\tc3.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0347_),
	.Cout(),
	.Q());
defparam syn__1806_.coord_x = 2;
defparam syn__1806_.coord_y = 2;
defparam syn__1806_.coord_z = 9;
defparam syn__1806_.mask = 16'hAA28;
defparam syn__1806_.modeMux = 1'b0;
defparam syn__1806_.FeedbackMux = 1'b0;
defparam syn__1806_.ShiftMux = 1'b0;
defparam syn__1806_.BypassEn = 1'b0;
defparam syn__1806_.CarryEnb = 1'b1;

alta_slice syn__1807_(
	.A(vcc),
	.B(syn__0250_),
	.C(syn__0284_),
	.D(syn__0285_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0348_),
	.Cout(),
	.Q());
defparam syn__1807_.coord_x = 2;
defparam syn__1807_.coord_y = 2;
defparam syn__1807_.coord_z = 5;
defparam syn__1807_.mask = 16'h0F0C;
defparam syn__1807_.modeMux = 1'b0;
defparam syn__1807_.FeedbackMux = 1'b0;
defparam syn__1807_.ShiftMux = 1'b0;
defparam syn__1807_.BypassEn = 1'b0;
defparam syn__1807_.CarryEnb = 1'b1;

alta_slice syn__1808_(
	.A(IOaddr3[14]),
	.B(syn__0323_),
	.C(syn__0350_),
	.D(IOvalue3[14]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0349_),
	.Cout(),
	.Q());
defparam syn__1808_.coord_x = 1;
defparam syn__1808_.coord_y = 2;
defparam syn__1808_.coord_z = 10;
defparam syn__1808_.mask = 16'h0B07;
defparam syn__1808_.modeMux = 1'b0;
defparam syn__1808_.FeedbackMux = 1'b0;
defparam syn__1808_.ShiftMux = 1'b0;
defparam syn__1808_.BypassEn = 1'b0;
defparam syn__1808_.CarryEnb = 1'b1;

alta_slice syn__1809_(
	.A(IOaddr3[14]),
	.B(IOvalue3[14]),
	.C(\tc3.IM [7]),
	.D(syn__0322_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0350_),
	.Cout(),
	.Q());
defparam syn__1809_.coord_x = 2;
defparam syn__1809_.coord_y = 2;
defparam syn__1809_.coord_z = 12;
defparam syn__1809_.mask = 16'hE800;
defparam syn__1809_.modeMux = 1'b0;
defparam syn__1809_.FeedbackMux = 1'b0;
defparam syn__1809_.ShiftMux = 1'b0;
defparam syn__1809_.BypassEn = 1'b0;
defparam syn__1809_.CarryEnb = 1'b1;

alta_slice syn__1810_(
	.A(vcc),
	.B(vcc),
	.C(syn__0284_),
	.D(syn__0285_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0351_),
	.Cout(),
	.Q());
defparam syn__1810_.coord_x = 2;
defparam syn__1810_.coord_y = 2;
defparam syn__1810_.coord_z = 4;
defparam syn__1810_.mask = 16'h000F;
defparam syn__1810_.modeMux = 1'b0;
defparam syn__1810_.FeedbackMux = 1'b0;
defparam syn__1810_.ShiftMux = 1'b0;
defparam syn__1810_.BypassEn = 1'b0;
defparam syn__1810_.CarryEnb = 1'b1;

alta_slice syn__1811_(
	.A(syn__0774_),
	.B(syn__0447_),
	.C(syn__0353_),
	.D(syn__0458_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0352_),
	.Cout(),
	.Q());
defparam syn__1811_.coord_x = 2;
defparam syn__1811_.coord_y = 4;
defparam syn__1811_.coord_z = 6;
defparam syn__1811_.mask = 16'h8000;
defparam syn__1811_.modeMux = 1'b0;
defparam syn__1811_.FeedbackMux = 1'b0;
defparam syn__1811_.ShiftMux = 1'b0;
defparam syn__1811_.BypassEn = 1'b0;
defparam syn__1811_.CarryEnb = 1'b1;

alta_slice syn__1812_(
	.A(syn__0375_),
	.B(syn__0440_),
	.C(syn__0354_),
	.D(syn__0365_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0353_),
	.Cout(),
	.Q());
defparam syn__1812_.coord_x = 2;
defparam syn__1812_.coord_y = 4;
defparam syn__1812_.coord_z = 10;
defparam syn__1812_.mask = 16'h8000;
defparam syn__1812_.modeMux = 1'b0;
defparam syn__1812_.FeedbackMux = 1'b0;
defparam syn__1812_.ShiftMux = 1'b0;
defparam syn__1812_.BypassEn = 1'b0;
defparam syn__1812_.CarryEnb = 1'b1;

alta_slice syn__1813_(
	.A(vcc),
	.B(syn__0334_),
	.C(syn__0356_),
	.D(syn__0736_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0354_),
	.Cout(),
	.Q());
defparam syn__1813_.coord_x = 1;
defparam syn__1813_.coord_y = 6;
defparam syn__1813_.coord_z = 6;
defparam syn__1813_.mask = 16'hF030;
defparam syn__1813_.modeMux = 1'b0;
defparam syn__1813_.FeedbackMux = 1'b0;
defparam syn__1813_.ShiftMux = 1'b0;
defparam syn__1813_.BypassEn = 1'b0;
defparam syn__1813_.CarryEnb = 1'b1;

alta_slice syn__1814_(
	.A(vcc),
	.B(vcc),
	.C(syn__0312_),
	.D(syn__0313_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0355_),
	.Cout(),
	.Q());
defparam syn__1814_.coord_x = 1;
defparam syn__1814_.coord_y = 4;
defparam syn__1814_.coord_z = 14;
defparam syn__1814_.mask = 16'h0FF0;
defparam syn__1814_.modeMux = 1'b0;
defparam syn__1814_.FeedbackMux = 1'b0;
defparam syn__1814_.ShiftMux = 1'b0;
defparam syn__1814_.BypassEn = 1'b0;
defparam syn__1814_.CarryEnb = 1'b1;

alta_slice syn__1815_(
	.A(syn__0361_),
	.B(syn__0357_),
	.C(vcc),
	.D(syn__0335_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0356_),
	.Cout(),
	.Q());
defparam syn__1815_.coord_x = 0;
defparam syn__1815_.coord_y = 6;
defparam syn__1815_.coord_z = 8;
defparam syn__1815_.mask = 16'h88AA;
defparam syn__1815_.modeMux = 1'b0;
defparam syn__1815_.FeedbackMux = 1'b0;
defparam syn__1815_.ShiftMux = 1'b0;
defparam syn__1815_.BypassEn = 1'b0;
defparam syn__1815_.CarryEnb = 1'b1;

alta_slice syn__1816_(
	.A(syn__0298_),
	.B(syn__0359_),
	.C(syn__0358_),
	.D(\tc3.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0357_),
	.Cout(),
	.Q());
defparam syn__1816_.coord_x = 1;
defparam syn__1816_.coord_y = 3;
defparam syn__1816_.coord_z = 7;
defparam syn__1816_.mask = 16'hCC48;
defparam syn__1816_.modeMux = 1'b0;
defparam syn__1816_.FeedbackMux = 1'b0;
defparam syn__1816_.ShiftMux = 1'b0;
defparam syn__1816_.BypassEn = 1'b0;
defparam syn__1816_.CarryEnb = 1'b1;

alta_slice syn__1817_(
	.A(vcc),
	.B(vcc),
	.C(syn__0246_),
	.D(syn__0299_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0358_),
	.Cout(),
	.Q());
defparam syn__1817_.coord_x = 0;
defparam syn__1817_.coord_y = 2;
defparam syn__1817_.coord_z = 0;
defparam syn__1817_.mask = 16'h000F;
defparam syn__1817_.modeMux = 1'b0;
defparam syn__1817_.FeedbackMux = 1'b0;
defparam syn__1817_.ShiftMux = 1'b0;
defparam syn__1817_.BypassEn = 1'b0;
defparam syn__1817_.CarryEnb = 1'b1;

alta_slice syn__1818_(
	.A(IOvalue3[20]),
	.B(IOaddr3[20]),
	.C(syn__0323_),
	.D(syn__0360_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0359_),
	.Cout(),
	.Q());
defparam syn__1818_.coord_x = 1;
defparam syn__1818_.coord_y = 3;
defparam syn__1818_.coord_z = 5;
defparam syn__1818_.mask = 16'h009F;
defparam syn__1818_.modeMux = 1'b0;
defparam syn__1818_.FeedbackMux = 1'b0;
defparam syn__1818_.ShiftMux = 1'b0;
defparam syn__1818_.BypassEn = 1'b0;
defparam syn__1818_.CarryEnb = 1'b1;

alta_slice syn__1819_(
	.A(IOaddr3[20]),
	.B(\tc3.IM [7]),
	.C(IOvalue3[20]),
	.D(syn__0322_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0360_),
	.Cout(),
	.Q());
defparam syn__1819_.coord_x = 2;
defparam syn__1819_.coord_y = 3;
defparam syn__1819_.coord_z = 11;
defparam syn__1819_.mask = 16'hE800;
defparam syn__1819_.modeMux = 1'b0;
defparam syn__1819_.FeedbackMux = 1'b0;
defparam syn__1819_.ShiftMux = 1'b0;
defparam syn__1819_.BypassEn = 1'b0;
defparam syn__1819_.CarryEnb = 1'b1;

alta_slice syn__1820_(
	.A(syn__0740_),
	.B(syn__0738_),
	.C(syn__0336_),
	.D(syn__0337_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0361_),
	.Cout(),
	.Q());
defparam syn__1820_.coord_x = 0;
defparam syn__1820_.coord_y = 6;
defparam syn__1820_.coord_z = 6;
defparam syn__1820_.mask = 16'h8CAF;
defparam syn__1820_.modeMux = 1'b0;
defparam syn__1820_.FeedbackMux = 1'b0;
defparam syn__1820_.ShiftMux = 1'b0;
defparam syn__1820_.BypassEn = 1'b0;
defparam syn__1820_.CarryEnb = 1'b1;

alta_slice syn__1821_(
	.A(syn__0247_),
	.B(vcc),
	.C(syn__0296_),
	.D(syn__0295_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0362_),
	.Cout(),
	.Q());
defparam syn__1821_.coord_x = 0;
defparam syn__1821_.coord_y = 2;
defparam syn__1821_.coord_z = 15;
defparam syn__1821_.mask = 16'hFAA0;
defparam syn__1821_.modeMux = 1'b0;
defparam syn__1821_.FeedbackMux = 1'b0;
defparam syn__1821_.ShiftMux = 1'b0;
defparam syn__1821_.BypassEn = 1'b0;
defparam syn__1821_.CarryEnb = 1'b1;

alta_slice syn__1822_(
	.A(vcc),
	.B(syn__0294_),
	.C(vcc),
	.D(syn__0299_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0363_),
	.Cout(),
	.Q());
defparam syn__1822_.coord_x = 0;
defparam syn__1822_.coord_y = 2;
defparam syn__1822_.coord_z = 2;
defparam syn__1822_.mask = 16'h0033;
defparam syn__1822_.modeMux = 1'b0;
defparam syn__1822_.FeedbackMux = 1'b0;
defparam syn__1822_.ShiftMux = 1'b0;
defparam syn__1822_.BypassEn = 1'b0;
defparam syn__1822_.CarryEnb = 1'b1;

alta_slice syn__1823_(
	.A(syn__0263_),
	.B(syn__0257_),
	.C(\tc3.IM [9]),
	.D(syn__0264_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0364_),
	.Cout(),
	.Q());
defparam syn__1823_.coord_x = 4;
defparam syn__1823_.coord_y = 4;
defparam syn__1823_.coord_z = 11;
defparam syn__1823_.mask = 16'h010E;
defparam syn__1823_.modeMux = 1'b0;
defparam syn__1823_.FeedbackMux = 1'b0;
defparam syn__1823_.ShiftMux = 1'b0;
defparam syn__1823_.BypassEn = 1'b0;
defparam syn__1823_.CarryEnb = 1'b1;

alta_slice syn__1824_(
	.A(vcc),
	.B(syn__0366_),
	.C(syn__0335_),
	.D(syn__0746_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0365_),
	.Cout(),
	.Q());
defparam syn__1824_.coord_x = 2;
defparam syn__1824_.coord_y = 4;
defparam syn__1824_.coord_z = 11;
defparam syn__1824_.mask = 16'hCC0C;
defparam syn__1824_.modeMux = 1'b0;
defparam syn__1824_.FeedbackMux = 1'b0;
defparam syn__1824_.ShiftMux = 1'b0;
defparam syn__1824_.BypassEn = 1'b0;
defparam syn__1824_.CarryEnb = 1'b1;

alta_slice syn__1825_(
	.A(syn__0336_),
	.B(syn__0367_),
	.C(syn__0368_),
	.D(syn__0371_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0366_),
	.Cout(),
	.Q());
defparam syn__1825_.coord_x = 0;
defparam syn__1825_.coord_y = 5;
defparam syn__1825_.coord_z = 5;
defparam syn__1825_.mask = 16'h7050;
defparam syn__1825_.modeMux = 1'b0;
defparam syn__1825_.FeedbackMux = 1'b0;
defparam syn__1825_.ShiftMux = 1'b0;
defparam syn__1825_.BypassEn = 1'b0;
defparam syn__1825_.CarryEnb = 1'b1;

alta_slice syn__1826_(
	.A(syn__0242_),
	.B(syn__0310_),
	.C(syn__0311_),
	.D(\tc3.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0367_),
	.Cout(),
	.Q());
defparam syn__1826_.coord_x = 0;
defparam syn__1826_.coord_y = 5;
defparam syn__1826_.coord_z = 15;
defparam syn__1826_.mask = 16'h0036;
defparam syn__1826_.modeMux = 1'b0;
defparam syn__1826_.FeedbackMux = 1'b0;
defparam syn__1826_.ShiftMux = 1'b0;
defparam syn__1826_.BypassEn = 1'b0;
defparam syn__1826_.CarryEnb = 1'b1;

alta_slice syn__1827_(
	.A(syn__0742_),
	.B(\tc3.IM [6]),
	.C(syn__0744_),
	.D(\tc3.IM [5]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0368_),
	.Cout(),
	.Q());
defparam syn__1827_.coord_x = 1;
defparam syn__1827_.coord_y = 5;
defparam syn__1827_.coord_z = 10;
defparam syn__1827_.mask = 16'hFFB8;
defparam syn__1827_.modeMux = 1'b0;
defparam syn__1827_.FeedbackMux = 1'b0;
defparam syn__1827_.ShiftMux = 1'b0;
defparam syn__1827_.BypassEn = 1'b0;
defparam syn__1827_.CarryEnb = 1'b1;

alta_slice syn__1828_(
	.A(vcc),
	.B(vcc),
	.C(syn__0296_),
	.D(syn__0295_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0369_),
	.Cout(),
	.Q());
defparam syn__1828_.coord_x = 0;
defparam syn__1828_.coord_y = 2;
defparam syn__1828_.coord_z = 4;
defparam syn__1828_.mask = 16'h0FF0;
defparam syn__1828_.modeMux = 1'b0;
defparam syn__1828_.FeedbackMux = 1'b0;
defparam syn__1828_.ShiftMux = 1'b0;
defparam syn__1828_.BypassEn = 1'b0;
defparam syn__1828_.CarryEnb = 1'b1;

alta_slice syn__1829_(
	.A(vcc),
	.B(vcc),
	.C(syn__0279_),
	.D(syn__0278_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0370_),
	.Cout(),
	.Q());
defparam syn__1829_.coord_x = 4;
defparam syn__1829_.coord_y = 3;
defparam syn__1829_.coord_z = 2;
defparam syn__1829_.mask = 16'h0FF0;
defparam syn__1829_.modeMux = 1'b0;
defparam syn__1829_.FeedbackMux = 1'b0;
defparam syn__1829_.ShiftMux = 1'b0;
defparam syn__1829_.BypassEn = 1'b0;
defparam syn__1829_.CarryEnb = 1'b1;

alta_slice syn__1830_(
	.A(syn__0323_),
	.B(IOaddr3[26]),
	.C(syn__0372_),
	.D(IOvalue3[26]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0371_),
	.Cout(),
	.Q());
defparam syn__1830_.coord_x = 0;
defparam syn__1830_.coord_y = 5;
defparam syn__1830_.coord_z = 3;
defparam syn__1830_.mask = 16'h0D07;
defparam syn__1830_.modeMux = 1'b0;
defparam syn__1830_.FeedbackMux = 1'b0;
defparam syn__1830_.ShiftMux = 1'b0;
defparam syn__1830_.BypassEn = 1'b0;
defparam syn__1830_.CarryEnb = 1'b1;

alta_slice syn__1831_(
	.A(IOaddr3[26]),
	.B(\tc3.IM [7]),
	.C(IOvalue3[26]),
	.D(syn__0322_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0372_),
	.Cout(),
	.Q());
defparam syn__1831_.coord_x = 2;
defparam syn__1831_.coord_y = 3;
defparam syn__1831_.coord_z = 9;
defparam syn__1831_.mask = 16'hE800;
defparam syn__1831_.modeMux = 1'b0;
defparam syn__1831_.FeedbackMux = 1'b0;
defparam syn__1831_.ShiftMux = 1'b0;
defparam syn__1831_.BypassEn = 1'b0;
defparam syn__1831_.CarryEnb = 1'b1;

alta_slice syn__1832_(
	.A(syn__0252_),
	.B(vcc),
	.C(syn__0279_),
	.D(syn__0278_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0373_),
	.Cout(),
	.Q());
defparam syn__1832_.coord_x = 4;
defparam syn__1832_.coord_y = 3;
defparam syn__1832_.coord_z = 5;
defparam syn__1832_.mask = 16'hFAA0;
defparam syn__1832_.modeMux = 1'b0;
defparam syn__1832_.FeedbackMux = 1'b0;
defparam syn__1832_.ShiftMux = 1'b0;
defparam syn__1832_.BypassEn = 1'b0;
defparam syn__1832_.CarryEnb = 1'b1;

alta_slice syn__1833_(
	.A(vcc),
	.B(vcc),
	.C(syn__0282_),
	.D(syn__0277_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0374_),
	.Cout(),
	.Q());
defparam syn__1833_.coord_x = 4;
defparam syn__1833_.coord_y = 3;
defparam syn__1833_.coord_z = 6;
defparam syn__1833_.mask = 16'h000F;
defparam syn__1833_.modeMux = 1'b0;
defparam syn__1833_.FeedbackMux = 1'b0;
defparam syn__1833_.ShiftMux = 1'b0;
defparam syn__1833_.BypassEn = 1'b0;
defparam syn__1833_.CarryEnb = 1'b1;

alta_slice syn__1834_(
	.A(syn__0770_),
	.B(syn__0772_),
	.C(syn__0376_),
	.D(syn__0384_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0375_),
	.Cout(),
	.Q());
defparam syn__1834_.coord_x = 2;
defparam syn__1834_.coord_y = 4;
defparam syn__1834_.coord_z = 8;
defparam syn__1834_.mask = 16'h8000;
defparam syn__1834_.modeMux = 1'b0;
defparam syn__1834_.FeedbackMux = 1'b0;
defparam syn__1834_.ShiftMux = 1'b0;
defparam syn__1834_.BypassEn = 1'b0;
defparam syn__1834_.CarryEnb = 1'b1;

alta_slice syn__1835_(
	.A(vcc),
	.B(syn__0378_),
	.C(syn__0748_),
	.D(syn__0336_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0376_),
	.Cout(),
	.Q());
defparam syn__1835_.coord_x = 2;
defparam syn__1835_.coord_y = 4;
defparam syn__1835_.coord_z = 14;
defparam syn__1835_.mask = 16'hC0CC;
defparam syn__1835_.modeMux = 1'b0;
defparam syn__1835_.FeedbackMux = 1'b0;
defparam syn__1835_.ShiftMux = 1'b0;
defparam syn__1835_.BypassEn = 1'b0;
defparam syn__1835_.CarryEnb = 1'b1;

alta_slice syn__1836_(
	.A(syn__0243_),
	.B(syn__0308_),
	.C(syn__0307_),
	.D(syn__0306_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0377_),
	.Cout(),
	.Q());
defparam syn__1836_.coord_x = 1;
defparam syn__1836_.coord_y = 4;
defparam syn__1836_.coord_z = 12;
defparam syn__1836_.mask = 16'hC993;
defparam syn__1836_.modeMux = 1'b0;
defparam syn__1836_.FeedbackMux = 1'b0;
defparam syn__1836_.ShiftMux = 1'b0;
defparam syn__1836_.BypassEn = 1'b0;
defparam syn__1836_.CarryEnb = 1'b1;

alta_slice syn__1837_(
	.A(vcc),
	.B(syn__0334_),
	.C(syn__0381_),
	.D(syn__0750_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0378_),
	.Cout(),
	.Q());
defparam syn__1837_.coord_x = 1;
defparam syn__1837_.coord_y = 6;
defparam syn__1837_.coord_z = 8;
defparam syn__1837_.mask = 16'hF030;
defparam syn__1837_.modeMux = 1'b0;
defparam syn__1837_.FeedbackMux = 1'b0;
defparam syn__1837_.ShiftMux = 1'b0;
defparam syn__1837_.BypassEn = 1'b0;
defparam syn__1837_.CarryEnb = 1'b1;

alta_slice syn__1838_(
	.A(vcc),
	.B(vcc),
	.C(syn__0291_),
	.D(syn__0248_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0379_),
	.Cout(),
	.Q());
defparam syn__1838_.coord_x = 0;
defparam syn__1838_.coord_y = 2;
defparam syn__1838_.coord_z = 11;
defparam syn__1838_.mask = 16'h000F;
defparam syn__1838_.modeMux = 1'b0;
defparam syn__1838_.FeedbackMux = 1'b0;
defparam syn__1838_.ShiftMux = 1'b0;
defparam syn__1838_.BypassEn = 1'b0;
defparam syn__1838_.CarryEnb = 1'b1;

alta_slice syn__1839_(
	.A(vcc),
	.B(vcc),
	.C(syn__0292_),
	.D(syn__0293_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0380_),
	.Cout(),
	.Q());
defparam syn__1839_.coord_x = 0;
defparam syn__1839_.coord_y = 2;
defparam syn__1839_.coord_z = 8;
defparam syn__1839_.mask = 16'h0FF0;
defparam syn__1839_.modeMux = 1'b0;
defparam syn__1839_.FeedbackMux = 1'b0;
defparam syn__1839_.ShiftMux = 1'b0;
defparam syn__1839_.BypassEn = 1'b0;
defparam syn__1839_.CarryEnb = 1'b1;

alta_slice syn__1840_(
	.A(syn__0752_),
	.B(syn__0337_),
	.C(syn__0744_),
	.D(syn__0335_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0381_),
	.Cout(),
	.Q());
defparam syn__1840_.coord_x = 0;
defparam syn__1840_.coord_y = 6;
defparam syn__1840_.coord_z = 9;
defparam syn__1840_.mask = 16'hB0BB;
defparam syn__1840_.modeMux = 1'b0;
defparam syn__1840_.FeedbackMux = 1'b0;
defparam syn__1840_.ShiftMux = 1'b0;
defparam syn__1840_.BypassEn = 1'b0;
defparam syn__1840_.CarryEnb = 1'b1;

alta_slice syn__1841_(
	.A(syn__0383_),
	.B(syn__0253_),
	.C(\tc3.IM [9]),
	.D(syn__0276_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0382_),
	.Cout(),
	.Q());
defparam syn__1841_.coord_x = 2;
defparam syn__1841_.coord_y = 3;
defparam syn__1841_.coord_z = 2;
defparam syn__1841_.mask = 16'h0506;
defparam syn__1841_.modeMux = 1'b0;
defparam syn__1841_.FeedbackMux = 1'b0;
defparam syn__1841_.ShiftMux = 1'b0;
defparam syn__1841_.BypassEn = 1'b0;
defparam syn__1841_.CarryEnb = 1'b1;

alta_slice syn__1842_(
	.A(vcc),
	.B(syn__0274_),
	.C(vcc),
	.D(syn__0275_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0383_),
	.Cout(),
	.Q());
defparam syn__1842_.coord_x = 4;
defparam syn__1842_.coord_y = 3;
defparam syn__1842_.coord_z = 0;
defparam syn__1842_.mask = 16'h33CC;
defparam syn__1842_.modeMux = 1'b0;
defparam syn__1842_.FeedbackMux = 1'b0;
defparam syn__1842_.ShiftMux = 1'b0;
defparam syn__1842_.BypassEn = 1'b0;
defparam syn__1842_.CarryEnb = 1'b1;

alta_slice syn__1843_(
	.A(vcc),
	.B(syn__0400_),
	.C(syn__0385_),
	.D(syn__0397_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0384_),
	.Cout(),
	.Q());
defparam syn__1843_.coord_x = 1;
defparam syn__1843_.coord_y = 6;
defparam syn__1843_.coord_z = 12;
defparam syn__1843_.mask = 16'hC000;
defparam syn__1843_.modeMux = 1'b0;
defparam syn__1843_.FeedbackMux = 1'b0;
defparam syn__1843_.ShiftMux = 1'b0;
defparam syn__1843_.BypassEn = 1'b0;
defparam syn__1843_.CarryEnb = 1'b1;

alta_slice syn__1844_(
	.A(vcc),
	.B(syn__0754_),
	.C(syn__0387_),
	.D(syn__0336_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0385_),
	.Cout(),
	.Q());
defparam syn__1844_.coord_x = 1;
defparam syn__1844_.coord_y = 6;
defparam syn__1844_.coord_z = 0;
defparam syn__1844_.mask = 16'hC0F0;
defparam syn__1844_.modeMux = 1'b0;
defparam syn__1844_.FeedbackMux = 1'b0;
defparam syn__1844_.ShiftMux = 1'b0;
defparam syn__1844_.BypassEn = 1'b0;
defparam syn__1844_.CarryEnb = 1'b1;

alta_slice syn__1845_(
	.A(vcc),
	.B(vcc),
	.C(syn__0306_),
	.D(syn__0307_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0386_),
	.Cout(),
	.Q());
defparam syn__1845_.coord_x = 1;
defparam syn__1845_.coord_y = 4;
defparam syn__1845_.coord_z = 4;
defparam syn__1845_.mask = 16'h0FF0;
defparam syn__1845_.modeMux = 1'b0;
defparam syn__1845_.FeedbackMux = 1'b0;
defparam syn__1845_.ShiftMux = 1'b0;
defparam syn__1845_.BypassEn = 1'b0;
defparam syn__1845_.CarryEnb = 1'b1;

alta_slice syn__1846_(
	.A(syn__0392_),
	.B(syn__0334_),
	.C(syn__0388_),
	.D(vcc),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0387_),
	.Cout(),
	.Q());
defparam syn__1846_.coord_x = 1;
defparam syn__1846_.coord_y = 6;
defparam syn__1846_.coord_z = 10;
defparam syn__1846_.mask = 16'hA2A2;
defparam syn__1846_.modeMux = 1'b0;
defparam syn__1846_.FeedbackMux = 1'b0;
defparam syn__1846_.ShiftMux = 1'b0;
defparam syn__1846_.BypassEn = 1'b0;
defparam syn__1846_.CarryEnb = 1'b1;

alta_slice syn__1847_(
	.A(\tc3.IM [9]),
	.B(syn__0390_),
	.C(syn__0389_),
	.D(syn__0289_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0388_),
	.Cout(),
	.Q());
defparam syn__1847_.coord_x = 1;
defparam syn__1847_.coord_y = 2;
defparam syn__1847_.coord_z = 3;
defparam syn__1847_.mask = 16'hC88C;
defparam syn__1847_.modeMux = 1'b0;
defparam syn__1847_.FeedbackMux = 1'b0;
defparam syn__1847_.ShiftMux = 1'b0;
defparam syn__1847_.BypassEn = 1'b0;
defparam syn__1847_.CarryEnb = 1'b1;

alta_slice syn__1848_(
	.A(syn__0286_),
	.B(vcc),
	.C(syn__0290_),
	.D(syn__0249_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0389_),
	.Cout(),
	.Q());
defparam syn__1848_.coord_x = 1;
defparam syn__1848_.coord_y = 2;
defparam syn__1848_.coord_z = 8;
defparam syn__1848_.mask = 16'h0F05;
defparam syn__1848_.modeMux = 1'b0;
defparam syn__1848_.FeedbackMux = 1'b0;
defparam syn__1848_.ShiftMux = 1'b0;
defparam syn__1848_.BypassEn = 1'b0;
defparam syn__1848_.CarryEnb = 1'b1;

alta_slice syn__1849_(
	.A(IOvalue3[16]),
	.B(syn__0323_),
	.C(syn__0391_),
	.D(IOaddr3[16]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0390_),
	.Cout(),
	.Q());
defparam syn__1849_.coord_x = 1;
defparam syn__1849_.coord_y = 2;
defparam syn__1849_.coord_z = 1;
defparam syn__1849_.mask = 16'h0B07;
defparam syn__1849_.modeMux = 1'b0;
defparam syn__1849_.FeedbackMux = 1'b0;
defparam syn__1849_.ShiftMux = 1'b0;
defparam syn__1849_.BypassEn = 1'b0;
defparam syn__1849_.CarryEnb = 1'b1;

alta_slice syn__1850_(
	.A(IOvalue3[16]),
	.B(syn__0322_),
	.C(\tc3.IM [7]),
	.D(IOaddr3[16]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0391_),
	.Cout(),
	.Q());
defparam syn__1850_.coord_x = 1;
defparam syn__1850_.coord_y = 2;
defparam syn__1850_.coord_z = 0;
defparam syn__1850_.mask = 16'hC880;
defparam syn__1850_.modeMux = 1'b0;
defparam syn__1850_.FeedbackMux = 1'b0;
defparam syn__1850_.ShiftMux = 1'b0;
defparam syn__1850_.BypassEn = 1'b0;
defparam syn__1850_.CarryEnb = 1'b1;

alta_slice syn__1851_(
	.A(syn__0752_),
	.B(syn__0335_),
	.C(syn__0393_),
	.D(syn__0337_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0392_),
	.Cout(),
	.Q());
defparam syn__1851_.coord_x = 0;
defparam syn__1851_.coord_y = 6;
defparam syn__1851_.coord_z = 5;
defparam syn__1851_.mask = 16'hB0BB;
defparam syn__1851_.modeMux = 1'b0;
defparam syn__1851_.FeedbackMux = 1'b0;
defparam syn__1851_.ShiftMux = 1'b0;
defparam syn__1851_.BypassEn = 1'b0;
defparam syn__1851_.CarryEnb = 1'b1;

alta_slice syn__1852_(
	.A(syn__0271_),
	.B(syn__0394_),
	.C(\tc3.IM [9]),
	.D(syn__0395_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0393_),
	.Cout(),
	.Q());
defparam syn__1852_.coord_x = 4;
defparam syn__1852_.coord_y = 5;
defparam syn__1852_.coord_z = 5;
defparam syn__1852_.mask = 16'hF600;
defparam syn__1852_.modeMux = 1'b0;
defparam syn__1852_.FeedbackMux = 1'b0;
defparam syn__1852_.ShiftMux = 1'b0;
defparam syn__1852_.BypassEn = 1'b0;
defparam syn__1852_.CarryEnb = 1'b1;

alta_slice syn__1853_(
	.A(syn__0272_),
	.B(vcc),
	.C(syn__0254_),
	.D(syn__0273_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0394_),
	.Cout(),
	.Q());
defparam syn__1853_.coord_x = 4;
defparam syn__1853_.coord_y = 5;
defparam syn__1853_.coord_z = 15;
defparam syn__1853_.mask = 16'h5550;
defparam syn__1853_.modeMux = 1'b0;
defparam syn__1853_.FeedbackMux = 1'b0;
defparam syn__1853_.ShiftMux = 1'b0;
defparam syn__1853_.BypassEn = 1'b0;
defparam syn__1853_.CarryEnb = 1'b1;

alta_slice syn__1854_(
	.A(IOvalue3[8]),
	.B(IOaddr3[8]),
	.C(syn__0323_),
	.D(syn__0396_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0395_),
	.Cout(),
	.Q());
defparam syn__1854_.coord_x = 4;
defparam syn__1854_.coord_y = 5;
defparam syn__1854_.coord_z = 3;
defparam syn__1854_.mask = 16'h009F;
defparam syn__1854_.modeMux = 1'b0;
defparam syn__1854_.FeedbackMux = 1'b0;
defparam syn__1854_.ShiftMux = 1'b0;
defparam syn__1854_.BypassEn = 1'b0;
defparam syn__1854_.CarryEnb = 1'b1;

alta_slice syn__1855_(
	.A(IOvalue3[8]),
	.B(IOaddr3[8]),
	.C(\tc3.IM [7]),
	.D(syn__0322_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0396_),
	.Cout(),
	.Q());
defparam syn__1855_.coord_x = 4;
defparam syn__1855_.coord_y = 5;
defparam syn__1855_.coord_z = 7;
defparam syn__1855_.mask = 16'hE800;
defparam syn__1855_.modeMux = 1'b0;
defparam syn__1855_.FeedbackMux = 1'b0;
defparam syn__1855_.ShiftMux = 1'b0;
defparam syn__1855_.BypassEn = 1'b0;
defparam syn__1855_.CarryEnb = 1'b1;

alta_slice syn__1856_(
	.A(vcc),
	.B(syn__0754_),
	.C(syn__0398_),
	.D(syn__0334_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0397_),
	.Cout(),
	.Q());
defparam syn__1856_.coord_x = 1;
defparam syn__1856_.coord_y = 6;
defparam syn__1856_.coord_z = 13;
defparam syn__1856_.mask = 16'hC0F0;
defparam syn__1856_.modeMux = 1'b0;
defparam syn__1856_.FeedbackMux = 1'b0;
defparam syn__1856_.ShiftMux = 1'b0;
defparam syn__1856_.BypassEn = 1'b0;
defparam syn__1856_.CarryEnb = 1'b1;

alta_slice syn__1857_(
	.A(syn__0335_),
	.B(vcc),
	.C(syn__0399_),
	.D(syn__0750_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0398_),
	.Cout(),
	.Q());
defparam syn__1857_.coord_x = 1;
defparam syn__1857_.coord_y = 6;
defparam syn__1857_.coord_z = 4;
defparam syn__1857_.mask = 16'hF050;
defparam syn__1857_.modeMux = 1'b0;
defparam syn__1857_.FeedbackMux = 1'b0;
defparam syn__1857_.ShiftMux = 1'b0;
defparam syn__1857_.BypassEn = 1'b0;
defparam syn__1857_.CarryEnb = 1'b1;

alta_slice syn__1858_(
	.A(syn__0388_),
	.B(syn__0330_),
	.C(syn__0336_),
	.D(syn__0337_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0399_),
	.Cout(),
	.Q());
defparam syn__1858_.coord_x = 1;
defparam syn__1858_.coord_y = 7;
defparam syn__1858_.coord_z = 9;
defparam syn__1858_.mask = 16'h8ACF;
defparam syn__1858_.modeMux = 1'b0;
defparam syn__1858_.FeedbackMux = 1'b0;
defparam syn__1858_.ShiftMux = 1'b0;
defparam syn__1858_.BypassEn = 1'b0;
defparam syn__1858_.CarryEnb = 1'b1;

alta_slice syn__1859_(
	.A(syn__0414_),
	.B(vcc),
	.C(syn__0401_),
	.D(syn__0408_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0400_),
	.Cout(),
	.Q());
defparam syn__1859_.coord_x = 1;
defparam syn__1859_.coord_y = 7;
defparam syn__1859_.coord_z = 2;
defparam syn__1859_.mask = 16'hA000;
defparam syn__1859_.modeMux = 1'b0;
defparam syn__1859_.FeedbackMux = 1'b0;
defparam syn__1859_.ShiftMux = 1'b0;
defparam syn__1859_.BypassEn = 1'b0;
defparam syn__1859_.CarryEnb = 1'b1;

alta_slice syn__1860_(
	.A(syn__0406_),
	.B(syn__0404_),
	.C(syn__0402_),
	.D(syn__0336_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0401_),
	.Cout(),
	.Q());
defparam syn__1860_.coord_x = 0;
defparam syn__1860_.coord_y = 7;
defparam syn__1860_.coord_z = 12;
defparam syn__1860_.mask = 16'h08CC;
defparam syn__1860_.modeMux = 1'b0;
defparam syn__1860_.FeedbackMux = 1'b0;
defparam syn__1860_.ShiftMux = 1'b0;
defparam syn__1860_.BypassEn = 1'b0;
defparam syn__1860_.CarryEnb = 1'b1;

alta_slice syn__1861_(
	.A(\tc3.IM [9]),
	.B(syn__0403_),
	.C(syn__0244_),
	.D(syn__0305_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0402_),
	.Cout(),
	.Q());
defparam syn__1861_.coord_x = 0;
defparam syn__1861_.coord_y = 3;
defparam syn__1861_.coord_z = 0;
defparam syn__1861_.mask = 16'h1114;
defparam syn__1861_.modeMux = 1'b0;
defparam syn__1861_.FeedbackMux = 1'b0;
defparam syn__1861_.ShiftMux = 1'b0;
defparam syn__1861_.BypassEn = 1'b0;
defparam syn__1861_.CarryEnb = 1'b1;

alta_slice syn__1862_(
	.A(vcc),
	.B(vcc),
	.C(syn__0303_),
	.D(syn__0304_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0403_),
	.Cout(),
	.Q());
defparam syn__1862_.coord_x = 0;
defparam syn__1862_.coord_y = 3;
defparam syn__1862_.coord_z = 7;
defparam syn__1862_.mask = 16'h0FF0;
defparam syn__1862_.modeMux = 1'b0;
defparam syn__1862_.FeedbackMux = 1'b0;
defparam syn__1862_.ShiftMux = 1'b0;
defparam syn__1862_.BypassEn = 1'b0;
defparam syn__1862_.CarryEnb = 1'b1;

alta_slice syn__1863_(
	.A(vcc),
	.B(syn__0405_),
	.C(syn__0728_),
	.D(syn__0334_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0404_),
	.Cout(),
	.Q());
defparam syn__1863_.coord_x = 0;
defparam syn__1863_.coord_y = 7;
defparam syn__1863_.coord_z = 15;
defparam syn__1863_.mask = 16'hC0CC;
defparam syn__1863_.modeMux = 1'b0;
defparam syn__1863_.FeedbackMux = 1'b0;
defparam syn__1863_.ShiftMux = 1'b0;
defparam syn__1863_.BypassEn = 1'b0;
defparam syn__1863_.CarryEnb = 1'b1;

alta_slice syn__1864_(
	.A(syn__0730_),
	.B(syn__0337_),
	.C(syn__0393_),
	.D(syn__0335_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0405_),
	.Cout(),
	.Q());
defparam syn__1864_.coord_x = 0;
defparam syn__1864_.coord_y = 6;
defparam syn__1864_.coord_z = 7;
defparam syn__1864_.mask = 16'hB0BB;
defparam syn__1864_.modeMux = 1'b0;
defparam syn__1864_.FeedbackMux = 1'b0;
defparam syn__1864_.ShiftMux = 1'b0;
defparam syn__1864_.BypassEn = 1'b0;
defparam syn__1864_.CarryEnb = 1'b1;

alta_slice syn__1865_(
	.A(IOvalue3[23]),
	.B(IOaddr3[23]),
	.C(syn__0323_),
	.D(syn__0407_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0406_),
	.Cout(),
	.Q());
defparam syn__1865_.coord_x = 1;
defparam syn__1865_.coord_y = 3;
defparam syn__1865_.coord_z = 13;
defparam syn__1865_.mask = 16'h009F;
defparam syn__1865_.modeMux = 1'b0;
defparam syn__1865_.FeedbackMux = 1'b0;
defparam syn__1865_.ShiftMux = 1'b0;
defparam syn__1865_.BypassEn = 1'b0;
defparam syn__1865_.CarryEnb = 1'b1;

alta_slice syn__1866_(
	.A(IOaddr3[23]),
	.B(syn__0322_),
	.C(IOvalue3[23]),
	.D(\tc3.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0407_),
	.Cout(),
	.Q());
defparam syn__1866_.coord_x = 2;
defparam syn__1866_.coord_y = 3;
defparam syn__1866_.coord_z = 0;
defparam syn__1866_.mask = 16'hC880;
defparam syn__1866_.modeMux = 1'b0;
defparam syn__1866_.FeedbackMux = 1'b0;
defparam syn__1866_.ShiftMux = 1'b0;
defparam syn__1866_.BypassEn = 1'b0;
defparam syn__1866_.CarryEnb = 1'b1;

alta_slice syn__1867_(
	.A(vcc),
	.B(syn__0410_),
	.C(syn__0336_),
	.D(syn__0756_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0408_),
	.Cout(),
	.Q());
defparam syn__1867_.coord_x = 1;
defparam syn__1867_.coord_y = 7;
defparam syn__1867_.coord_z = 15;
defparam syn__1867_.mask = 16'hCC0C;
defparam syn__1867_.modeMux = 1'b0;
defparam syn__1867_.FeedbackMux = 1'b0;
defparam syn__1867_.ShiftMux = 1'b0;
defparam syn__1867_.BypassEn = 1'b0;
defparam syn__1867_.CarryEnb = 1'b1;

alta_slice syn__1868_(
	.A(syn__0245_),
	.B(syn__0300_),
	.C(syn__0301_),
	.D(syn__0302_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0409_),
	.Cout(),
	.Q());
defparam syn__1868_.coord_x = 0;
defparam syn__1868_.coord_y = 3;
defparam syn__1868_.coord_z = 8;
defparam syn__1868_.mask = 16'h3C39;
defparam syn__1868_.modeMux = 1'b0;
defparam syn__1868_.FeedbackMux = 1'b0;
defparam syn__1868_.ShiftMux = 1'b0;
defparam syn__1868_.BypassEn = 1'b0;
defparam syn__1868_.CarryEnb = 1'b1;

alta_slice syn__1869_(
	.A(syn__0411_),
	.B(syn__0334_),
	.C(syn__0347_),
	.D(vcc),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0410_),
	.Cout(),
	.Q());
defparam syn__1869_.coord_x = 0;
defparam syn__1869_.coord_y = 7;
defparam syn__1869_.coord_z = 5;
defparam syn__1869_.mask = 16'hA2A2;
defparam syn__1869_.modeMux = 1'b0;
defparam syn__1869_.FeedbackMux = 1'b0;
defparam syn__1869_.ShiftMux = 1'b0;
defparam syn__1869_.BypassEn = 1'b0;
defparam syn__1869_.CarryEnb = 1'b1;

alta_slice syn__1870_(
	.A(syn__0730_),
	.B(syn__0337_),
	.C(syn__0335_),
	.D(syn__0758_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0411_),
	.Cout(),
	.Q());
defparam syn__1870_.coord_x = 0;
defparam syn__1870_.coord_y = 6;
defparam syn__1870_.coord_z = 13;
defparam syn__1870_.mask = 16'hAF23;
defparam syn__1870_.modeMux = 1'b0;
defparam syn__1870_.FeedbackMux = 1'b0;
defparam syn__1870_.ShiftMux = 1'b0;
defparam syn__1870_.BypassEn = 1'b0;
defparam syn__1870_.CarryEnb = 1'b1;

alta_slice syn__1871_(
	.A(syn__0413_),
	.B(syn__0270_),
	.C(syn__0255_),
	.D(\tc3.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0412_),
	.Cout(),
	.Q());
defparam syn__1871_.coord_x = 5;
defparam syn__1871_.coord_y = 6;
defparam syn__1871_.coord_z = 6;
defparam syn__1871_.mask = 16'h0056;
defparam syn__1871_.modeMux = 1'b0;
defparam syn__1871_.FeedbackMux = 1'b0;
defparam syn__1871_.ShiftMux = 1'b0;
defparam syn__1871_.BypassEn = 1'b0;
defparam syn__1871_.CarryEnb = 1'b1;

alta_slice syn__1872_(
	.A(syn__0268_),
	.B(vcc),
	.C(vcc),
	.D(syn__0269_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0413_),
	.Cout(),
	.Q());
defparam syn__1872_.coord_x = 4;
defparam syn__1872_.coord_y = 5;
defparam syn__1872_.coord_z = 12;
defparam syn__1872_.mask = 16'h55AA;
defparam syn__1872_.modeMux = 1'b0;
defparam syn__1872_.FeedbackMux = 1'b0;
defparam syn__1872_.ShiftMux = 1'b0;
defparam syn__1872_.BypassEn = 1'b0;
defparam syn__1872_.CarryEnb = 1'b1;

alta_slice syn__1873_(
	.A(syn__0425_),
	.B(vcc),
	.C(syn__0415_),
	.D(syn__0420_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0414_),
	.Cout(),
	.Q());
defparam syn__1873_.coord_x = 0;
defparam syn__1873_.coord_y = 8;
defparam syn__1873_.coord_z = 4;
defparam syn__1873_.mask = 16'hA000;
defparam syn__1873_.modeMux = 1'b0;
defparam syn__1873_.FeedbackMux = 1'b0;
defparam syn__1873_.ShiftMux = 1'b0;
defparam syn__1873_.BypassEn = 1'b0;
defparam syn__1873_.CarryEnb = 1'b1;

alta_slice syn__1874_(
	.A(syn__0416_),
	.B(vcc),
	.C(syn__0732_),
	.D(syn__0336_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0415_),
	.Cout(),
	.Q());
defparam syn__1874_.coord_x = 0;
defparam syn__1874_.coord_y = 8;
defparam syn__1874_.coord_z = 8;
defparam syn__1874_.mask = 16'hA0AA;
defparam syn__1874_.modeMux = 1'b0;
defparam syn__1874_.FeedbackMux = 1'b0;
defparam syn__1874_.ShiftMux = 1'b0;
defparam syn__1874_.BypassEn = 1'b0;
defparam syn__1874_.CarryEnb = 1'b1;

alta_slice syn__1875_(
	.A(syn__0734_),
	.B(vcc),
	.C(syn__0334_),
	.D(syn__0417_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0416_),
	.Cout(),
	.Q());
defparam syn__1875_.coord_x = 0;
defparam syn__1875_.coord_y = 5;
defparam syn__1875_.coord_z = 10;
defparam syn__1875_.mask = 16'hAF00;
defparam syn__1875_.modeMux = 1'b0;
defparam syn__1875_.FeedbackMux = 1'b0;
defparam syn__1875_.ShiftMux = 1'b0;
defparam syn__1875_.BypassEn = 1'b0;
defparam syn__1875_.CarryEnb = 1'b1;

alta_slice syn__1876_(
	.A(syn__0760_),
	.B(syn__0337_),
	.C(syn__0335_),
	.D(syn__0758_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0417_),
	.Cout(),
	.Q());
defparam syn__1876_.coord_x = 0;
defparam syn__1876_.coord_y = 6;
defparam syn__1876_.coord_z = 15;
defparam syn__1876_.mask = 16'hBB0B;
defparam syn__1876_.modeMux = 1'b0;
defparam syn__1876_.FeedbackMux = 1'b0;
defparam syn__1876_.ShiftMux = 1'b0;
defparam syn__1876_.BypassEn = 1'b0;
defparam syn__1876_.CarryEnb = 1'b1;

alta_slice syn__1877_(
	.A(syn__0256_),
	.B(vcc),
	.C(syn__0267_),
	.D(syn__0266_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0418_),
	.Cout(),
	.Q());
defparam syn__1877_.coord_x = 4;
defparam syn__1877_.coord_y = 4;
defparam syn__1877_.coord_z = 13;
defparam syn__1877_.mask = 16'hFAA0;
defparam syn__1877_.modeMux = 1'b0;
defparam syn__1877_.FeedbackMux = 1'b0;
defparam syn__1877_.ShiftMux = 1'b0;
defparam syn__1877_.BypassEn = 1'b0;
defparam syn__1877_.CarryEnb = 1'b1;

alta_slice syn__1878_(
	.A(vcc),
	.B(syn__0265_),
	.C(vcc),
	.D(syn__0270_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0419_),
	.Cout(),
	.Q());
defparam syn__1878_.coord_x = 5;
defparam syn__1878_.coord_y = 6;
defparam syn__1878_.coord_z = 4;
defparam syn__1878_.mask = 16'h0033;
defparam syn__1878_.modeMux = 1'b0;
defparam syn__1878_.FeedbackMux = 1'b0;
defparam syn__1878_.ShiftMux = 1'b0;
defparam syn__1878_.BypassEn = 1'b0;
defparam syn__1878_.CarryEnb = 1'b1;

alta_slice syn__1879_(
	.A(vcc),
	.B(syn__0421_),
	.C(syn__0357_),
	.D(syn__0336_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0420_),
	.Cout(),
	.Q());
defparam syn__1879_.coord_x = 0;
defparam syn__1879_.coord_y = 8;
defparam syn__1879_.coord_z = 9;
defparam syn__1879_.mask = 16'hC0CC;
defparam syn__1879_.modeMux = 1'b0;
defparam syn__1879_.FeedbackMux = 1'b0;
defparam syn__1879_.ShiftMux = 1'b0;
defparam syn__1879_.BypassEn = 1'b0;
defparam syn__1879_.CarryEnb = 1'b1;

alta_slice syn__1880_(
	.A(syn__0423_),
	.B(vcc),
	.C(syn__0334_),
	.D(syn__0762_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0421_),
	.Cout(),
	.Q());
defparam syn__1880_.coord_x = 0;
defparam syn__1880_.coord_y = 5;
defparam syn__1880_.coord_z = 11;
defparam syn__1880_.mask = 16'hAA0A;
defparam syn__1880_.modeMux = 1'b0;
defparam syn__1880_.FeedbackMux = 1'b0;
defparam syn__1880_.ShiftMux = 1'b0;
defparam syn__1880_.BypassEn = 1'b0;
defparam syn__1880_.CarryEnb = 1'b1;

alta_slice syn__1881_(
	.A(syn__0281_),
	.B(syn__0282_),
	.C(syn__0251_),
	.D(\tc3.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0422_),
	.Cout(),
	.Q());
defparam syn__1881_.coord_x = 2;
defparam syn__1881_.coord_y = 2;
defparam syn__1881_.coord_z = 6;
defparam syn__1881_.mask = 16'h0056;
defparam syn__1881_.modeMux = 1'b0;
defparam syn__1881_.FeedbackMux = 1'b0;
defparam syn__1881_.ShiftMux = 1'b0;
defparam syn__1881_.BypassEn = 1'b0;
defparam syn__1881_.CarryEnb = 1'b1;

alta_slice syn__1882_(
	.A(syn__0335_),
	.B(syn__0764_),
	.C(syn__0760_),
	.D(syn__0337_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0423_),
	.Cout(),
	.Q());
defparam syn__1882_.coord_x = 0;
defparam syn__1882_.coord_y = 6;
defparam syn__1882_.coord_z = 12;
defparam syn__1882_.mask = 16'hC4F5;
defparam syn__1882_.modeMux = 1'b0;
defparam syn__1882_.FeedbackMux = 1'b0;
defparam syn__1882_.ShiftMux = 1'b0;
defparam syn__1882_.BypassEn = 1'b0;
defparam syn__1882_.CarryEnb = 1'b1;

alta_slice syn__1883_(
	.A(vcc),
	.B(vcc),
	.C(syn__0267_),
	.D(syn__0266_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0424_),
	.Cout(),
	.Q());
defparam syn__1883_.coord_x = 4;
defparam syn__1883_.coord_y = 4;
defparam syn__1883_.coord_z = 4;
defparam syn__1883_.mask = 16'h0FF0;
defparam syn__1883_.modeMux = 1'b0;
defparam syn__1883_.FeedbackMux = 1'b0;
defparam syn__1883_.ShiftMux = 1'b0;
defparam syn__1883_.BypassEn = 1'b0;
defparam syn__1883_.CarryEnb = 1'b1;

alta_slice syn__1884_(
	.A(syn__0426_),
	.B(syn__0429_),
	.C(syn__0437_),
	.D(syn__0433_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0425_),
	.Cout(),
	.Q());
defparam syn__1884_.coord_x = 0;
defparam syn__1884_.coord_y = 8;
defparam syn__1884_.coord_z = 2;
defparam syn__1884_.mask = 16'h8000;
defparam syn__1884_.modeMux = 1'b0;
defparam syn__1884_.FeedbackMux = 1'b0;
defparam syn__1884_.ShiftMux = 1'b0;
defparam syn__1884_.BypassEn = 1'b0;
defparam syn__1884_.CarryEnb = 1'b1;

alta_slice syn__1885_(
	.A(vcc),
	.B(syn__0738_),
	.C(syn__0427_),
	.D(syn__0336_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0426_),
	.Cout(),
	.Q());
defparam syn__1885_.coord_x = 0;
defparam syn__1885_.coord_y = 8;
defparam syn__1885_.coord_z = 14;
defparam syn__1885_.mask = 16'hC0F0;
defparam syn__1885_.modeMux = 1'b0;
defparam syn__1885_.FeedbackMux = 1'b0;
defparam syn__1885_.ShiftMux = 1'b0;
defparam syn__1885_.BypassEn = 1'b0;
defparam syn__1885_.CarryEnb = 1'b1;

alta_slice syn__1886_(
	.A(vcc),
	.B(syn__0334_),
	.C(syn__0746_),
	.D(syn__0428_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0427_),
	.Cout(),
	.Q());
defparam syn__1886_.coord_x = 1;
defparam syn__1886_.coord_y = 6;
defparam syn__1886_.coord_z = 9;
defparam syn__1886_.mask = 16'hF300;
defparam syn__1886_.modeMux = 1'b0;
defparam syn__1886_.FeedbackMux = 1'b0;
defparam syn__1886_.ShiftMux = 1'b0;
defparam syn__1886_.BypassEn = 1'b0;
defparam syn__1886_.CarryEnb = 1'b1;

alta_slice syn__1887_(
	.A(syn__0335_),
	.B(syn__0764_),
	.C(syn__0740_),
	.D(syn__0337_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0428_),
	.Cout(),
	.Q());
defparam syn__1887_.coord_x = 0;
defparam syn__1887_.coord_y = 6;
defparam syn__1887_.coord_z = 2;
defparam syn__1887_.mask = 16'hD0DD;
defparam syn__1887_.modeMux = 1'b0;
defparam syn__1887_.FeedbackMux = 1'b0;
defparam syn__1887_.ShiftMux = 1'b0;
defparam syn__1887_.BypassEn = 1'b0;
defparam syn__1887_.CarryEnb = 1'b1;

alta_slice syn__1888_(
	.A(syn__0430_),
	.B(vcc),
	.C(syn__0336_),
	.D(syn__0742_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0429_),
	.Cout(),
	.Q());
defparam syn__1888_.coord_x = 1;
defparam syn__1888_.coord_y = 7;
defparam syn__1888_.coord_z = 7;
defparam syn__1888_.mask = 16'hAA0A;
defparam syn__1888_.modeMux = 1'b0;
defparam syn__1888_.FeedbackMux = 1'b0;
defparam syn__1888_.ShiftMux = 1'b0;
defparam syn__1888_.BypassEn = 1'b0;
defparam syn__1888_.CarryEnb = 1'b1;

alta_slice syn__1889_(
	.A(vcc),
	.B(syn__0431_),
	.C(syn__0744_),
	.D(syn__0334_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0430_),
	.Cout(),
	.Q());
defparam syn__1889_.coord_x = 1;
defparam syn__1889_.coord_y = 6;
defparam syn__1889_.coord_z = 5;
defparam syn__1889_.mask = 16'hC0CC;
defparam syn__1889_.modeMux = 1'b0;
defparam syn__1889_.FeedbackMux = 1'b0;
defparam syn__1889_.ShiftMux = 1'b0;
defparam syn__1889_.BypassEn = 1'b0;
defparam syn__1889_.CarryEnb = 1'b1;

alta_slice syn__1890_(
	.A(syn__0740_),
	.B(syn__0335_),
	.C(syn__0766_),
	.D(syn__0337_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0431_),
	.Cout(),
	.Q());
defparam syn__1890_.coord_x = 0;
defparam syn__1890_.coord_y = 6;
defparam syn__1890_.coord_z = 11;
defparam syn__1890_.mask = 16'hB0BB;
defparam syn__1890_.modeMux = 1'b0;
defparam syn__1890_.FeedbackMux = 1'b0;
defparam syn__1890_.ShiftMux = 1'b0;
defparam syn__1890_.BypassEn = 1'b0;
defparam syn__1890_.CarryEnb = 1'b1;

alta_slice syn__1891_(
	.A(syn__0261_),
	.B(syn__0259_),
	.C(syn__0258_),
	.D(syn__0260_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0432_),
	.Cout(),
	.Q());
defparam syn__1891_.coord_x = 5;
defparam syn__1891_.coord_y = 6;
defparam syn__1891_.coord_z = 11;
defparam syn__1891_.mask = 16'h95A9;
defparam syn__1891_.modeMux = 1'b0;
defparam syn__1891_.FeedbackMux = 1'b0;
defparam syn__1891_.ShiftMux = 1'b0;
defparam syn__1891_.BypassEn = 1'b0;
defparam syn__1891_.CarryEnb = 1'b1;

alta_slice syn__1892_(
	.A(syn__0434_),
	.B(vcc),
	.C(syn__0336_),
	.D(syn__0750_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0433_),
	.Cout(),
	.Q());
defparam syn__1892_.coord_x = 1;
defparam syn__1892_.coord_y = 7;
defparam syn__1892_.coord_z = 5;
defparam syn__1892_.mask = 16'hAA0A;
defparam syn__1892_.modeMux = 1'b0;
defparam syn__1892_.FeedbackMux = 1'b0;
defparam syn__1892_.ShiftMux = 1'b0;
defparam syn__1892_.BypassEn = 1'b0;
defparam syn__1892_.CarryEnb = 1'b1;

alta_slice syn__1893_(
	.A(syn__0752_),
	.B(vcc),
	.C(syn__0435_),
	.D(syn__0334_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0434_),
	.Cout(),
	.Q());
defparam syn__1893_.coord_x = 1;
defparam syn__1893_.coord_y = 6;
defparam syn__1893_.coord_z = 14;
defparam syn__1893_.mask = 16'hA0F0;
defparam syn__1893_.modeMux = 1'b0;
defparam syn__1893_.FeedbackMux = 1'b0;
defparam syn__1893_.ShiftMux = 1'b0;
defparam syn__1893_.BypassEn = 1'b0;
defparam syn__1893_.CarryEnb = 1'b1;

alta_slice syn__1894_(
	.A(syn__0768_),
	.B(syn__0335_),
	.C(syn__0766_),
	.D(syn__0337_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0435_),
	.Cout(),
	.Q());
defparam syn__1894_.coord_x = 0;
defparam syn__1894_.coord_y = 6;
defparam syn__1894_.coord_z = 0;
defparam syn__1894_.mask = 16'hA2F3;
defparam syn__1894_.modeMux = 1'b0;
defparam syn__1894_.FeedbackMux = 1'b0;
defparam syn__1894_.ShiftMux = 1'b0;
defparam syn__1894_.BypassEn = 1'b0;
defparam syn__1894_.CarryEnb = 1'b1;

alta_slice syn__1895_(
	.A(vcc),
	.B(vcc),
	.C(syn__0258_),
	.D(syn__0259_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0436_),
	.Cout(),
	.Q());
defparam syn__1895_.coord_x = 5;
defparam syn__1895_.coord_y = 6;
defparam syn__1895_.coord_z = 2;
defparam syn__1895_.mask = 16'h0FF0;
defparam syn__1895_.modeMux = 1'b0;
defparam syn__1895_.FeedbackMux = 1'b0;
defparam syn__1895_.ShiftMux = 1'b0;
defparam syn__1895_.BypassEn = 1'b0;
defparam syn__1895_.CarryEnb = 1'b1;

alta_slice syn__1896_(
	.A(vcc),
	.B(syn__0438_),
	.C(syn__0336_),
	.D(syn__0388_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0437_),
	.Cout(),
	.Q());
defparam syn__1896_.coord_x = 1;
defparam syn__1896_.coord_y = 7;
defparam syn__1896_.coord_z = 8;
defparam syn__1896_.mask = 16'hCC0C;
defparam syn__1896_.modeMux = 1'b0;
defparam syn__1896_.FeedbackMux = 1'b0;
defparam syn__1896_.ShiftMux = 1'b0;
defparam syn__1896_.BypassEn = 1'b0;
defparam syn__1896_.CarryEnb = 1'b1;

alta_slice syn__1897_(
	.A(vcc),
	.B(syn__0334_),
	.C(syn__0439_),
	.D(syn__0393_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0438_),
	.Cout(),
	.Q());
defparam syn__1897_.coord_x = 1;
defparam syn__1897_.coord_y = 6;
defparam syn__1897_.coord_z = 15;
defparam syn__1897_.mask = 16'hF030;
defparam syn__1897_.modeMux = 1'b0;
defparam syn__1897_.FeedbackMux = 1'b0;
defparam syn__1897_.ShiftMux = 1'b0;
defparam syn__1897_.BypassEn = 1'b0;
defparam syn__1897_.CarryEnb = 1'b1;

alta_slice syn__1898_(
	.A(syn__0768_),
	.B(syn__0335_),
	.C(syn__0330_),
	.D(syn__0337_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0439_),
	.Cout(),
	.Q());
defparam syn__1898_.coord_x = 0;
defparam syn__1898_.coord_y = 6;
defparam syn__1898_.coord_z = 1;
defparam syn__1898_.mask = 16'hB0BB;
defparam syn__1898_.modeMux = 1'b0;
defparam syn__1898_.FeedbackMux = 1'b0;
defparam syn__1898_.ShiftMux = 1'b0;
defparam syn__1898_.BypassEn = 1'b0;
defparam syn__1898_.CarryEnb = 1'b1;

alta_slice syn__1899_(
	.A(syn__0446_),
	.B(syn__0441_),
	.C(syn__0442_),
	.D(syn__0443_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0440_),
	.Cout(),
	.Q());
defparam syn__1899_.coord_x = 0;
defparam syn__1899_.coord_y = 4;
defparam syn__1899_.coord_z = 4;
defparam syn__1899_.mask = 16'h1000;
defparam syn__1899_.modeMux = 1'b0;
defparam syn__1899_.FeedbackMux = 1'b0;
defparam syn__1899_.ShiftMux = 1'b0;
defparam syn__1899_.BypassEn = 1'b0;
defparam syn__1899_.CarryEnb = 1'b1;

alta_slice syn__1900_(
	.A(vcc),
	.B(syn__0371_),
	.C(syn__0335_),
	.D(syn__0367_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0441_),
	.Cout(),
	.Q());
defparam syn__1900_.coord_x = 0;
defparam syn__1900_.coord_y = 5;
defparam syn__1900_.coord_z = 1;
defparam syn__1900_.mask = 16'hF030;
defparam syn__1900_.modeMux = 1'b0;
defparam syn__1900_.FeedbackMux = 1'b0;
defparam syn__1900_.ShiftMux = 1'b0;
defparam syn__1900_.BypassEn = 1'b0;
defparam syn__1900_.CarryEnb = 1'b1;

alta_slice syn__1901_(
	.A(syn__0752_),
	.B(\tc3.IM [6]),
	.C(syn__0748_),
	.D(\tc3.IM [5]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0442_),
	.Cout(),
	.Q());
defparam syn__1901_.coord_x = 1;
defparam syn__1901_.coord_y = 5;
defparam syn__1901_.coord_z = 12;
defparam syn__1901_.mask = 16'hBBFC;
defparam syn__1901_.modeMux = 1'b0;
defparam syn__1901_.FeedbackMux = 1'b0;
defparam syn__1901_.ShiftMux = 1'b0;
defparam syn__1901_.BypassEn = 1'b0;
defparam syn__1901_.CarryEnb = 1'b1;

alta_slice syn__1902_(
	.A(syn__0367_),
	.B(syn__0444_),
	.C(syn__0334_),
	.D(syn__0371_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0443_),
	.Cout(),
	.Q());
defparam syn__1902_.coord_x = 0;
defparam syn__1902_.coord_y = 5;
defparam syn__1902_.coord_z = 14;
defparam syn__1902_.mask = 16'h4C0C;
defparam syn__1902_.modeMux = 1'b0;
defparam syn__1902_.FeedbackMux = 1'b0;
defparam syn__1902_.ShiftMux = 1'b0;
defparam syn__1902_.BypassEn = 1'b0;
defparam syn__1902_.CarryEnb = 1'b1;

alta_slice syn__1903_(
	.A(syn__0445_),
	.B(vcc),
	.C(syn__0335_),
	.D(syn__0738_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0444_),
	.Cout(),
	.Q());
defparam syn__1903_.coord_x = 0;
defparam syn__1903_.coord_y = 5;
defparam syn__1903_.coord_z = 7;
defparam syn__1903_.mask = 16'hAA0A;
defparam syn__1903_.modeMux = 1'b0;
defparam syn__1903_.FeedbackMux = 1'b0;
defparam syn__1903_.ShiftMux = 1'b0;
defparam syn__1903_.BypassEn = 1'b0;
defparam syn__1903_.CarryEnb = 1'b1;

alta_slice syn__1904_(
	.A(syn__0766_),
	.B(syn__0742_),
	.C(syn__0336_),
	.D(syn__0337_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0445_),
	.Cout(),
	.Q());
defparam syn__1904_.coord_x = 1;
defparam syn__1904_.coord_y = 7;
defparam syn__1904_.coord_z = 4;
defparam syn__1904_.mask = 16'h8CAF;
defparam syn__1904_.modeMux = 1'b0;
defparam syn__1904_.FeedbackMux = 1'b0;
defparam syn__1904_.ShiftMux = 1'b0;
defparam syn__1904_.BypassEn = 1'b0;
defparam syn__1904_.CarryEnb = 1'b1;

alta_slice syn__1905_(
	.A(vcc),
	.B(syn__0334_),
	.C(vcc),
	.D(syn__0768_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0446_),
	.Cout(),
	.Q());
defparam syn__1905_.coord_x = 1;
defparam syn__1905_.coord_y = 6;
defparam syn__1905_.coord_z = 7;
defparam syn__1905_.mask = 16'h00CC;
defparam syn__1905_.modeMux = 1'b0;
defparam syn__1905_.FeedbackMux = 1'b0;
defparam syn__1905_.ShiftMux = 1'b0;
defparam syn__1905_.BypassEn = 1'b0;
defparam syn__1905_.CarryEnb = 1'b1;

alta_slice syn__1906_(
	.A(vcc),
	.B(vcc),
	.C(syn__0448_),
	.D(syn__0451_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0447_),
	.Cout(),
	.Q());
defparam syn__1906_.coord_x = 0;
defparam syn__1906_.coord_y = 5;
defparam syn__1906_.coord_z = 9;
defparam syn__1906_.mask = 16'hF000;
defparam syn__1906_.modeMux = 1'b0;
defparam syn__1906_.FeedbackMux = 1'b0;
defparam syn__1906_.ShiftMux = 1'b0;
defparam syn__1906_.BypassEn = 1'b0;
defparam syn__1906_.CarryEnb = 1'b1;

alta_slice syn__1907_(
	.A(syn__0449_),
	.B(syn__0450_),
	.C(syn__0335_),
	.D(syn__0736_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0448_),
	.Cout(),
	.Q());
defparam syn__1907_.coord_x = 0;
defparam syn__1907_.coord_y = 5;
defparam syn__1907_.coord_z = 6;
defparam syn__1907_.mask = 16'h4404;
defparam syn__1907_.modeMux = 1'b0;
defparam syn__1907_.FeedbackMux = 1'b0;
defparam syn__1907_.ShiftMux = 1'b0;
defparam syn__1907_.BypassEn = 1'b0;
defparam syn__1907_.CarryEnb = 1'b1;

alta_slice syn__1908_(
	.A(vcc),
	.B(syn__0367_),
	.C(syn__0337_),
	.D(syn__0371_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0449_),
	.Cout(),
	.Q());
defparam syn__1908_.coord_x = 0;
defparam syn__1908_.coord_y = 5;
defparam syn__1908_.coord_z = 2;
defparam syn__1908_.mask = 16'hC0F0;
defparam syn__1908_.modeMux = 1'b0;
defparam syn__1908_.FeedbackMux = 1'b0;
defparam syn__1908_.ShiftMux = 1'b0;
defparam syn__1908_.BypassEn = 1'b0;
defparam syn__1908_.CarryEnb = 1'b1;

alta_slice syn__1909_(
	.A(\tc3.IM [5]),
	.B(syn__0766_),
	.C(syn__0744_),
	.D(\tc3.IM [6]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0450_),
	.Cout(),
	.Q());
defparam syn__1909_.coord_x = 1;
defparam syn__1909_.coord_y = 5;
defparam syn__1909_.coord_z = 0;
defparam syn__1909_.mask = 16'hE4FF;
defparam syn__1909_.modeMux = 1'b0;
defparam syn__1909_.FeedbackMux = 1'b0;
defparam syn__1909_.ShiftMux = 1'b0;
defparam syn__1909_.BypassEn = 1'b0;
defparam syn__1909_.CarryEnb = 1'b1;

alta_slice syn__1910_(
	.A(vcc),
	.B(syn__0736_),
	.C(syn__0452_),
	.D(syn__0336_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0451_),
	.Cout(),
	.Q());
defparam syn__1910_.coord_x = 1;
defparam syn__1910_.coord_y = 6;
defparam syn__1910_.coord_z = 1;
defparam syn__1910_.mask = 16'hC0F0;
defparam syn__1910_.modeMux = 1'b0;
defparam syn__1910_.FeedbackMux = 1'b0;
defparam syn__1910_.ShiftMux = 1'b0;
defparam syn__1910_.BypassEn = 1'b0;
defparam syn__1910_.CarryEnb = 1'b1;

alta_slice syn__1911_(
	.A(vcc),
	.B(syn__0738_),
	.C(syn__0453_),
	.D(syn__0334_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0452_),
	.Cout(),
	.Q());
defparam syn__1911_.coord_x = 1;
defparam syn__1911_.coord_y = 6;
defparam syn__1911_.coord_z = 2;
defparam syn__1911_.mask = 16'hC0F0;
defparam syn__1911_.modeMux = 1'b0;
defparam syn__1911_.FeedbackMux = 1'b0;
defparam syn__1911_.ShiftMux = 1'b0;
defparam syn__1911_.BypassEn = 1'b0;
defparam syn__1911_.CarryEnb = 1'b1;

alta_slice syn__1912_(
	.A(syn__0337_),
	.B(syn__0762_),
	.C(syn__0335_),
	.D(syn__0746_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0453_),
	.Cout(),
	.Q());
defparam syn__1912_.coord_x = 0;
defparam syn__1912_.coord_y = 5;
defparam syn__1912_.coord_z = 13;
defparam syn__1912_.mask = 16'hCF45;
defparam syn__1912_.modeMux = 1'b0;
defparam syn__1912_.FeedbackMux = 1'b0;
defparam syn__1912_.ShiftMux = 1'b0;
defparam syn__1912_.BypassEn = 1'b0;
defparam syn__1912_.CarryEnb = 1'b1;

alta_slice syn__1913_(
	.A(\tc3.IM [9]),
	.B(vcc),
	.C(syn__0456_),
	.D(syn__0455_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0454_),
	.Cout(),
	.Q());
defparam syn__1913_.coord_x = 2;
defparam syn__1913_.coord_y = 4;
defparam syn__1913_.coord_z = 9;
defparam syn__1913_.mask = 16'hA0F0;
defparam syn__1913_.modeMux = 1'b0;
defparam syn__1913_.FeedbackMux = 1'b0;
defparam syn__1913_.ShiftMux = 1'b0;
defparam syn__1913_.BypassEn = 1'b0;
defparam syn__1913_.CarryEnb = 1'b1;

alta_slice syn__1914_(
	.A(syn__0314_),
	.B(syn__0313_),
	.C(syn__0312_),
	.D(syn__0241_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0455_),
	.Cout(),
	.Q());
defparam syn__1914_.coord_x = 2;
defparam syn__1914_.coord_y = 4;
defparam syn__1914_.coord_z = 15;
defparam syn__1914_.mask = 16'hA995;
defparam syn__1914_.modeMux = 1'b0;
defparam syn__1914_.FeedbackMux = 1'b0;
defparam syn__1914_.ShiftMux = 1'b0;
defparam syn__1914_.BypassEn = 1'b0;
defparam syn__1914_.CarryEnb = 1'b1;

alta_slice syn__1915_(
	.A(IOvalue3[28]),
	.B(IOaddr3[28]),
	.C(syn__0457_),
	.D(syn__0323_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0456_),
	.Cout(),
	.Q());
defparam syn__1915_.coord_x = 2;
defparam syn__1915_.coord_y = 4;
defparam syn__1915_.coord_z = 12;
defparam syn__1915_.mask = 16'h090F;
defparam syn__1915_.modeMux = 1'b0;
defparam syn__1915_.FeedbackMux = 1'b0;
defparam syn__1915_.ShiftMux = 1'b0;
defparam syn__1915_.BypassEn = 1'b0;
defparam syn__1915_.CarryEnb = 1'b1;

alta_slice syn__1916_(
	.A(IOaddr3[28]),
	.B(syn__0322_),
	.C(IOvalue3[28]),
	.D(\tc3.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0457_),
	.Cout(),
	.Q());
defparam syn__1916_.coord_x = 2;
defparam syn__1916_.coord_y = 3;
defparam syn__1916_.coord_z = 6;
defparam syn__1916_.mask = 16'hC880;
defparam syn__1916_.modeMux = 1'b0;
defparam syn__1916_.FeedbackMux = 1'b0;
defparam syn__1916_.ShiftMux = 1'b0;
defparam syn__1916_.BypassEn = 1'b0;
defparam syn__1916_.CarryEnb = 1'b1;

alta_slice syn__1917_(
	.A(syn__0459_),
	.B(syn__0460_),
	.C(syn__0776_),
	.D(syn__0461_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0458_),
	.Cout(),
	.Q());
defparam syn__1917_.coord_x = 2;
defparam syn__1917_.coord_y = 4;
defparam syn__1917_.coord_z = 13;
defparam syn__1917_.mask = 16'h1000;
defparam syn__1917_.modeMux = 1'b0;
defparam syn__1917_.FeedbackMux = 1'b0;
defparam syn__1917_.ShiftMux = 1'b0;
defparam syn__1917_.BypassEn = 1'b0;
defparam syn__1917_.CarryEnb = 1'b1;

alta_slice syn__1918_(
	.A(syn__0335_),
	.B(\tc3.IM [9]),
	.C(syn__0456_),
	.D(syn__0455_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0459_),
	.Cout(),
	.Q());
defparam syn__1918_.coord_x = 2;
defparam syn__1918_.coord_y = 4;
defparam syn__1918_.coord_z = 2;
defparam syn__1918_.mask = 16'h2A0A;
defparam syn__1918_.modeMux = 1'b0;
defparam syn__1918_.FeedbackMux = 1'b0;
defparam syn__1918_.ShiftMux = 1'b0;
defparam syn__1918_.BypassEn = 1'b0;
defparam syn__1918_.CarryEnb = 1'b1;

alta_slice syn__1919_(
	.A(syn__0456_),
	.B(syn__0455_),
	.C(\tc3.IM [9]),
	.D(syn__0334_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0460_),
	.Cout(),
	.Q());
defparam syn__1919_.coord_x = 2;
defparam syn__1919_.coord_y = 4;
defparam syn__1919_.coord_z = 1;
defparam syn__1919_.mask = 16'h5D00;
defparam syn__1919_.modeMux = 1'b0;
defparam syn__1919_.FeedbackMux = 1'b0;
defparam syn__1919_.ShiftMux = 1'b0;
defparam syn__1919_.BypassEn = 1'b0;
defparam syn__1919_.CarryEnb = 1'b1;

alta_slice syn__1920_(
	.A(syn__0462_),
	.B(vcc),
	.C(syn__0764_),
	.D(syn__0336_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0461_),
	.Cout(),
	.Q());
defparam syn__1920_.coord_x = 2;
defparam syn__1920_.coord_y = 4;
defparam syn__1920_.coord_z = 5;
defparam syn__1920_.mask = 16'hA0AA;
defparam syn__1920_.modeMux = 1'b0;
defparam syn__1920_.FeedbackMux = 1'b0;
defparam syn__1920_.ShiftMux = 1'b0;
defparam syn__1920_.BypassEn = 1'b0;
defparam syn__1920_.CarryEnb = 1'b1;

alta_slice syn__1921_(
	.A(\tc3.IM [5]),
	.B(syn__0357_),
	.C(syn__0732_),
	.D(\tc3.IM [6]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0462_),
	.Cout(),
	.Q());
defparam syn__1921_.coord_x = 2;
defparam syn__1921_.coord_y = 6;
defparam syn__1921_.coord_z = 2;
defparam syn__1921_.mask = 16'hFFE4;
defparam syn__1921_.modeMux = 1'b0;
defparam syn__1921_.FeedbackMux = 1'b0;
defparam syn__1921_.ShiftMux = 1'b0;
defparam syn__1921_.BypassEn = 1'b0;
defparam syn__1921_.CarryEnb = 1'b1;

alta_slice syn__1922_(
	.A(syn__0334_),
	.B(vcc),
	.C(syn__0464_),
	.D(syn__0340_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0463_),
	.Cout(),
	.Q());
defparam syn__1922_.coord_x = 0;
defparam syn__1922_.coord_y = 5;
defparam syn__1922_.coord_z = 4;
defparam syn__1922_.mask = 16'hF050;
defparam syn__1922_.modeMux = 1'b0;
defparam syn__1922_.FeedbackMux = 1'b0;
defparam syn__1922_.ShiftMux = 1'b0;
defparam syn__1922_.BypassEn = 1'b0;
defparam syn__1922_.CarryEnb = 1'b1;

alta_slice syn__1923_(
	.A(vcc),
	.B(syn__0335_),
	.C(syn__0465_),
	.D(syn__0756_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0464_),
	.Cout(),
	.Q());
defparam syn__1923_.coord_x = 0;
defparam syn__1923_.coord_y = 6;
defparam syn__1923_.coord_z = 10;
defparam syn__1923_.mask = 16'hF030;
defparam syn__1923_.modeMux = 1'b0;
defparam syn__1923_.FeedbackMux = 1'b0;
defparam syn__1923_.ShiftMux = 1'b0;
defparam syn__1923_.BypassEn = 1'b0;
defparam syn__1923_.CarryEnb = 1'b1;

alta_slice syn__1924_(
	.A(syn__0760_),
	.B(syn__0732_),
	.C(syn__0336_),
	.D(syn__0337_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0465_),
	.Cout(),
	.Q());
defparam syn__1924_.coord_x = 0;
defparam syn__1924_.coord_y = 6;
defparam syn__1924_.coord_z = 4;
defparam syn__1924_.mask = 16'h8CAF;
defparam syn__1924_.modeMux = 1'b0;
defparam syn__1924_.FeedbackMux = 1'b0;
defparam syn__1924_.ShiftMux = 1'b0;
defparam syn__1924_.BypassEn = 1'b0;
defparam syn__1924_.CarryEnb = 1'b1;

alta_slice syn__1925_(
	.A(vcc),
	.B(vcc),
	.C(syn__0467_),
	.D(syn__0473_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0466_),
	.Cout(),
	.Q());
defparam syn__1925_.coord_x = 1;
defparam syn__1925_.coord_y = 5;
defparam syn__1925_.coord_z = 8;
defparam syn__1925_.mask = 16'hF000;
defparam syn__1925_.modeMux = 1'b0;
defparam syn__1925_.FeedbackMux = 1'b0;
defparam syn__1925_.ShiftMux = 1'b0;
defparam syn__1925_.BypassEn = 1'b0;
defparam syn__1925_.CarryEnb = 1'b1;

alta_slice syn__1926_(
	.A(syn__0336_),
	.B(vcc),
	.C(syn__0471_),
	.D(syn__0468_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0467_),
	.Cout(),
	.Q());
defparam syn__1926_.coord_x = 0;
defparam syn__1926_.coord_y = 7;
defparam syn__1926_.coord_z = 13;
defparam syn__1926_.mask = 16'hF050;
defparam syn__1926_.modeMux = 1'b0;
defparam syn__1926_.FeedbackMux = 1'b0;
defparam syn__1926_.ShiftMux = 1'b0;
defparam syn__1926_.BypassEn = 1'b0;
defparam syn__1926_.CarryEnb = 1'b1;

alta_slice syn__1927_(
	.A(syn__0319_),
	.B(syn__0239_),
	.C(syn__0469_),
	.D(\tc3.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0468_),
	.Cout(),
	.Q());
defparam syn__1927_.coord_x = 1;
defparam syn__1927_.coord_y = 3;
defparam syn__1927_.coord_z = 4;
defparam syn__1927_.mask = 16'hF060;
defparam syn__1927_.modeMux = 1'b0;
defparam syn__1927_.FeedbackMux = 1'b0;
defparam syn__1927_.ShiftMux = 1'b0;
defparam syn__1927_.BypassEn = 1'b0;
defparam syn__1927_.CarryEnb = 1'b1;

alta_slice syn__1928_(
	.A(IOvalue3[30]),
	.B(IOaddr3[30]),
	.C(syn__0323_),
	.D(syn__0470_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0469_),
	.Cout(),
	.Q());
defparam syn__1928_.coord_x = 1;
defparam syn__1928_.coord_y = 3;
defparam syn__1928_.coord_z = 11;
defparam syn__1928_.mask = 16'h009F;
defparam syn__1928_.modeMux = 1'b0;
defparam syn__1928_.FeedbackMux = 1'b0;
defparam syn__1928_.ShiftMux = 1'b0;
defparam syn__1928_.BypassEn = 1'b0;
defparam syn__1928_.CarryEnb = 1'b1;

alta_slice syn__1929_(
	.A(IOaddr3[30]),
	.B(\tc3.IM [7]),
	.C(IOvalue3[30]),
	.D(syn__0322_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0470_),
	.Cout(),
	.Q());
defparam syn__1929_.coord_x = 2;
defparam syn__1929_.coord_y = 3;
defparam syn__1929_.coord_z = 1;
defparam syn__1929_.mask = 16'hE800;
defparam syn__1929_.modeMux = 1'b0;
defparam syn__1929_.FeedbackMux = 1'b0;
defparam syn__1929_.ShiftMux = 1'b0;
defparam syn__1929_.BypassEn = 1'b0;
defparam syn__1929_.CarryEnb = 1'b1;

alta_slice syn__1930_(
	.A(vcc),
	.B(syn__0472_),
	.C(syn__0756_),
	.D(syn__0334_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0471_),
	.Cout(),
	.Q());
defparam syn__1930_.coord_x = 0;
defparam syn__1930_.coord_y = 7;
defparam syn__1930_.coord_z = 10;
defparam syn__1930_.mask = 16'hC0CC;
defparam syn__1930_.modeMux = 1'b0;
defparam syn__1930_.FeedbackMux = 1'b0;
defparam syn__1930_.ShiftMux = 1'b0;
defparam syn__1930_.BypassEn = 1'b0;
defparam syn__1930_.CarryEnb = 1'b1;

alta_slice syn__1931_(
	.A(syn__0728_),
	.B(syn__0337_),
	.C(syn__0347_),
	.D(syn__0335_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0472_),
	.Cout(),
	.Q());
defparam syn__1931_.coord_x = 0;
defparam syn__1931_.coord_y = 7;
defparam syn__1931_.coord_z = 11;
defparam syn__1931_.mask = 16'hA2F3;
defparam syn__1931_.modeMux = 1'b0;
defparam syn__1931_.FeedbackMux = 1'b0;
defparam syn__1931_.ShiftMux = 1'b0;
defparam syn__1931_.BypassEn = 1'b0;
defparam syn__1931_.CarryEnb = 1'b1;

alta_slice syn__1932_(
	.A(syn__0474_),
	.B(syn__0475_),
	.C(syn__0335_),
	.D(syn__0468_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0473_),
	.Cout(),
	.Q());
defparam syn__1932_.coord_x = 1;
defparam syn__1932_.coord_y = 5;
defparam syn__1932_.coord_z = 1;
defparam syn__1932_.mask = 16'h4404;
defparam syn__1932_.modeMux = 1'b0;
defparam syn__1932_.FeedbackMux = 1'b0;
defparam syn__1932_.ShiftMux = 1'b0;
defparam syn__1932_.BypassEn = 1'b0;
defparam syn__1932_.CarryEnb = 1'b1;

alta_slice syn__1933_(
	.A(vcc),
	.B(syn__0337_),
	.C(syn__0341_),
	.D(syn__0342_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0474_),
	.Cout(),
	.Q());
defparam syn__1933_.coord_x = 1;
defparam syn__1933_.coord_y = 5;
defparam syn__1933_.coord_z = 2;
defparam syn__1933_.mask = 16'hC0CC;
defparam syn__1933_.modeMux = 1'b0;
defparam syn__1933_.FeedbackMux = 1'b0;
defparam syn__1933_.ShiftMux = 1'b0;
defparam syn__1933_.BypassEn = 1'b0;
defparam syn__1933_.CarryEnb = 1'b1;

alta_slice syn__1934_(
	.A(syn__0760_),
	.B(\tc3.IM [6]),
	.C(syn__0734_),
	.D(\tc3.IM [5]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0475_),
	.Cout(),
	.Q());
defparam syn__1934_.coord_x = 1;
defparam syn__1934_.coord_y = 5;
defparam syn__1934_.coord_z = 11;
defparam syn__1934_.mask = 16'hF3BB;
defparam syn__1934_.modeMux = 1'b0;
defparam syn__1934_.FeedbackMux = 1'b0;
defparam syn__1934_.ShiftMux = 1'b0;
defparam syn__1934_.BypassEn = 1'b0;
defparam syn__1934_.CarryEnb = 1'b1;

alta_slice syn__1935_(
	.A(vcc),
	.B(syn__0468_),
	.C(syn__0477_),
	.D(syn__0334_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0476_),
	.Cout(),
	.Q());
defparam syn__1935_.coord_x = 0;
defparam syn__1935_.coord_y = 7;
defparam syn__1935_.coord_z = 2;
defparam syn__1935_.mask = 16'hC0F0;
defparam syn__1935_.modeMux = 1'b0;
defparam syn__1935_.FeedbackMux = 1'b0;
defparam syn__1935_.ShiftMux = 1'b0;
defparam syn__1935_.BypassEn = 1'b0;
defparam syn__1935_.CarryEnb = 1'b1;

alta_slice syn__1936_(
	.A(vcc),
	.B(syn__0478_),
	.C(syn__0479_),
	.D(syn__0335_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0477_),
	.Cout(),
	.Q());
defparam syn__1936_.coord_x = 0;
defparam syn__1936_.coord_y = 7;
defparam syn__1936_.coord_z = 3;
defparam syn__1936_.mask = 16'hC0F0;
defparam syn__1936_.modeMux = 1'b0;
defparam syn__1936_.FeedbackMux = 1'b0;
defparam syn__1936_.ShiftMux = 1'b0;
defparam syn__1936_.BypassEn = 1'b0;
defparam syn__1936_.CarryEnb = 1'b1;

alta_slice syn__1937_(
	.A(syn__0406_),
	.B(vcc),
	.C(syn__0402_),
	.D(vcc),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0478_),
	.Cout(),
	.Q());
defparam syn__1937_.coord_x = 0;
defparam syn__1937_.coord_y = 7;
defparam syn__1937_.coord_z = 9;
defparam syn__1937_.mask = 16'h0A0A;
defparam syn__1937_.modeMux = 1'b0;
defparam syn__1937_.FeedbackMux = 1'b0;
defparam syn__1937_.ShiftMux = 1'b0;
defparam syn__1937_.BypassEn = 1'b0;
defparam syn__1937_.CarryEnb = 1'b1;

alta_slice syn__1938_(
	.A(syn__0758_),
	.B(syn__0337_),
	.C(syn__0336_),
	.D(syn__0756_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0479_),
	.Cout(),
	.Q());
defparam syn__1938_.coord_x = 0;
defparam syn__1938_.coord_y = 6;
defparam syn__1938_.coord_z = 14;
defparam syn__1938_.mask = 16'hAF23;
defparam syn__1938_.modeMux = 1'b0;
defparam syn__1938_.FeedbackMux = 1'b0;
defparam syn__1938_.ShiftMux = 1'b0;
defparam syn__1938_.BypassEn = 1'b0;
defparam syn__1938_.CarryEnb = 1'b1;

alta_slice syn__1939_(
	.A(syn__0481_),
	.B(vcc),
	.C(syn__0780_),
	.D(syn__0484_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0480_),
	.Cout(),
	.Q());
defparam syn__1939_.coord_x = 0;
defparam syn__1939_.coord_y = 7;
defparam syn__1939_.coord_z = 1;
defparam syn__1939_.mask = 16'hA000;
defparam syn__1939_.modeMux = 1'b0;
defparam syn__1939_.FeedbackMux = 1'b0;
defparam syn__1939_.ShiftMux = 1'b0;
defparam syn__1939_.BypassEn = 1'b0;
defparam syn__1939_.CarryEnb = 1'b1;

alta_slice syn__1940_(
	.A(syn__0482_),
	.B(vcc),
	.C(syn__0237_),
	.D(syn__0336_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0481_),
	.Cout(),
	.Q());
defparam syn__1940_.coord_x = 0;
defparam syn__1940_.coord_y = 7;
defparam syn__1940_.coord_z = 4;
defparam syn__1940_.mask = 16'hA0AA;
defparam syn__1940_.modeMux = 1'b0;
defparam syn__1940_.FeedbackMux = 1'b0;
defparam syn__1940_.ShiftMux = 1'b0;
defparam syn__1940_.BypassEn = 1'b0;
defparam syn__1940_.CarryEnb = 1'b1;

alta_slice syn__1941_(
	.A(vcc),
	.B(syn__0478_),
	.C(syn__0483_),
	.D(syn__0334_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0482_),
	.Cout(),
	.Q());
defparam syn__1941_.coord_x = 0;
defparam syn__1941_.coord_y = 7;
defparam syn__1941_.coord_z = 6;
defparam syn__1941_.mask = 16'hC0F0;
defparam syn__1941_.modeMux = 1'b0;
defparam syn__1941_.FeedbackMux = 1'b0;
defparam syn__1941_.ShiftMux = 1'b0;
defparam syn__1941_.BypassEn = 1'b0;
defparam syn__1941_.CarryEnb = 1'b1;

alta_slice syn__1942_(
	.A(syn__0337_),
	.B(syn__0388_),
	.C(syn__0728_),
	.D(syn__0335_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0483_),
	.Cout(),
	.Q());
defparam syn__1942_.coord_x = 0;
defparam syn__1942_.coord_y = 7;
defparam syn__1942_.coord_z = 7;
defparam syn__1942_.mask = 16'hC4F5;
defparam syn__1942_.modeMux = 1'b0;
defparam syn__1942_.FeedbackMux = 1'b0;
defparam syn__1942_.ShiftMux = 1'b0;
defparam syn__1942_.BypassEn = 1'b0;
defparam syn__1942_.CarryEnb = 1'b1;

alta_slice syn__1943_(
	.A(syn__0485_),
	.B(vcc),
	.C(syn__0237_),
	.D(syn__0334_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0484_),
	.Cout(),
	.Q());
defparam syn__1943_.coord_x = 0;
defparam syn__1943_.coord_y = 7;
defparam syn__1943_.coord_z = 0;
defparam syn__1943_.mask = 16'hA0AA;
defparam syn__1943_.modeMux = 1'b0;
defparam syn__1943_.FeedbackMux = 1'b0;
defparam syn__1943_.ShiftMux = 1'b0;
defparam syn__1943_.BypassEn = 1'b0;
defparam syn__1943_.CarryEnb = 1'b1;

alta_slice syn__1944_(
	.A(syn__0335_),
	.B(vcc),
	.C(syn__0486_),
	.D(syn__0754_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0485_),
	.Cout(),
	.Q());
defparam syn__1944_.coord_x = 0;
defparam syn__1944_.coord_y = 7;
defparam syn__1944_.coord_z = 14;
defparam syn__1944_.mask = 16'hF050;
defparam syn__1944_.modeMux = 1'b0;
defparam syn__1944_.FeedbackMux = 1'b0;
defparam syn__1944_.ShiftMux = 1'b0;
defparam syn__1944_.BypassEn = 1'b0;
defparam syn__1944_.CarryEnb = 1'b1;

alta_slice syn__1945_(
	.A(syn__0478_),
	.B(syn__0730_),
	.C(syn__0336_),
	.D(syn__0337_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0486_),
	.Cout(),
	.Q());
defparam syn__1945_.coord_x = 1;
defparam syn__1945_.coord_y = 7;
defparam syn__1945_.coord_z = 13;
defparam syn__1945_.mask = 16'h8ACF;
defparam syn__1945_.modeMux = 1'b0;
defparam syn__1945_.FeedbackMux = 1'b0;
defparam syn__1945_.ShiftMux = 1'b0;
defparam syn__1945_.BypassEn = 1'b0;
defparam syn__1945_.CarryEnb = 1'b1;

alta_slice syn__1946_(
	.A(\tc3.IM [24]),
	.B(vcc),
	.C(\tc3.IM [4]),
	.D(syn__0236_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0487_),
	.Cout(),
	.Q());
defparam syn__1946_.coord_x = 2;
defparam syn__1946_.coord_y = 6;
defparam syn__1946_.coord_z = 9;
defparam syn__1946_.mask = 16'h5055;
defparam syn__1946_.modeMux = 1'b0;
defparam syn__1946_.FeedbackMux = 1'b0;
defparam syn__1946_.ShiftMux = 1'b0;
defparam syn__1946_.BypassEn = 1'b0;
defparam syn__1946_.CarryEnb = 1'b1;

alta_slice syn__1947_(
	.A(\tc3.IM [1]),
	.B(\tc3.IM [0]),
	.C(\tc3.IM [2]),
	.D(\tc3.IM [24]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0488_),
	.Cout(),
	.Q());
defparam syn__1947_.coord_x = 2;
defparam syn__1947_.coord_y = 6;
defparam syn__1947_.coord_z = 13;
defparam syn__1947_.mask = 16'h0020;
defparam syn__1947_.modeMux = 1'b0;
defparam syn__1947_.FeedbackMux = 1'b0;
defparam syn__1947_.ShiftMux = 1'b0;
defparam syn__1947_.BypassEn = 1'b0;
defparam syn__1947_.CarryEnb = 1'b1;

alta_slice syn__1949_(
	.A(vcc),
	.B(vcc),
	.C(\tc3.PC [0]),
	.D(syn__0234_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0489_),
	.Cout(),
	.Q());
defparam syn__1949_.coord_x = 1;
defparam syn__1949_.coord_y = 8;
defparam syn__1949_.coord_z = 7;
defparam syn__1949_.mask = 16'h000F;
defparam syn__1949_.modeMux = 1'b0;
defparam syn__1949_.FeedbackMux = 1'b0;
defparam syn__1949_.ShiftMux = 1'b0;
defparam syn__1949_.BypassEn = 1'b0;
defparam syn__1949_.CarryEnb = 1'b1;

alta_slice syn__1951_(
	.A(vcc),
	.B(\tc3.PC [1]),
	.C(\tc3.PC [0]),
	.D(syn__0234_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0490_),
	.Cout(),
	.Q());
defparam syn__1951_.coord_x = 1;
defparam syn__1951_.coord_y = 8;
defparam syn__1951_.coord_z = 8;
defparam syn__1951_.mask = 16'hCCC0;
defparam syn__1951_.modeMux = 1'b0;
defparam syn__1951_.FeedbackMux = 1'b0;
defparam syn__1951_.ShiftMux = 1'b0;
defparam syn__1951_.BypassEn = 1'b0;
defparam syn__1951_.CarryEnb = 1'b1;

alta_slice syn__1953_(
	.A(\tc3.PC [2]),
	.B(\tc3.PC [1]),
	.C(\tc3.PC [0]),
	.D(syn__0234_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0491_),
	.Cout(),
	.Q());
defparam syn__1953_.coord_x = 1;
defparam syn__1953_.coord_y = 8;
defparam syn__1953_.coord_z = 4;
defparam syn__1953_.mask = 16'h8880;
defparam syn__1953_.modeMux = 1'b0;
defparam syn__1953_.FeedbackMux = 1'b0;
defparam syn__1953_.ShiftMux = 1'b0;
defparam syn__1953_.BypassEn = 1'b0;
defparam syn__1953_.CarryEnb = 1'b1;

alta_slice syn__1955_(
	.A(syn__0493_),
	.B(vcc),
	.C(\tc3.PC [0]),
	.D(syn__0234_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0492_),
	.Cout(),
	.Q());
defparam syn__1955_.coord_x = 1;
defparam syn__1955_.coord_y = 8;
defparam syn__1955_.coord_z = 12;
defparam syn__1955_.mask = 16'hAAA0;
defparam syn__1955_.modeMux = 1'b0;
defparam syn__1955_.FeedbackMux = 1'b0;
defparam syn__1955_.ShiftMux = 1'b0;
defparam syn__1955_.BypassEn = 1'b0;
defparam syn__1955_.CarryEnb = 1'b1;

alta_slice syn__1956_(
	.A(\tc3.PC [3]),
	.B(vcc),
	.C(\tc3.PC [2]),
	.D(\tc3.PC [1]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0493_),
	.Cout(),
	.Q());
defparam syn__1956_.coord_x = 1;
defparam syn__1956_.coord_y = 8;
defparam syn__1956_.coord_z = 14;
defparam syn__1956_.mask = 16'hA000;
defparam syn__1956_.modeMux = 1'b0;
defparam syn__1956_.FeedbackMux = 1'b0;
defparam syn__1956_.ShiftMux = 1'b0;
defparam syn__1956_.BypassEn = 1'b0;
defparam syn__1956_.CarryEnb = 1'b1;

alta_slice syn__1958_(
	.A(syn__0495_),
	.B(\tc3.PC [5]),
	.C(\tc3.PC [0]),
	.D(syn__0234_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0494_),
	.Cout(),
	.Q());
defparam syn__1958_.coord_x = 1;
defparam syn__1958_.coord_y = 8;
defparam syn__1958_.coord_z = 2;
defparam syn__1958_.mask = 16'h666C;
defparam syn__1958_.modeMux = 1'b0;
defparam syn__1958_.FeedbackMux = 1'b0;
defparam syn__1958_.ShiftMux = 1'b0;
defparam syn__1958_.BypassEn = 1'b0;
defparam syn__1958_.CarryEnb = 1'b1;

alta_slice syn__1959_(
	.A(vcc),
	.B(\tc3.PC [4]),
	.C(vcc),
	.D(syn__0493_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0495_),
	.Cout(),
	.Q());
defparam syn__1959_.coord_x = 0;
defparam syn__1959_.coord_y = 8;
defparam syn__1959_.coord_z = 6;
defparam syn__1959_.mask = 16'hCC00;
defparam syn__1959_.modeMux = 1'b0;
defparam syn__1959_.FeedbackMux = 1'b0;
defparam syn__1959_.ShiftMux = 1'b0;
defparam syn__1959_.BypassEn = 1'b0;
defparam syn__1959_.CarryEnb = 1'b1;

alta_slice syn__1961_(
	.A(syn__0497_),
	.B(\tc3.PC [6]),
	.C(\tc3.PC [0]),
	.D(syn__0234_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0496_),
	.Cout(),
	.Q());
defparam syn__1961_.coord_x = 1;
defparam syn__1961_.coord_y = 8;
defparam syn__1961_.coord_z = 6;
defparam syn__1961_.mask = 16'h666C;
defparam syn__1961_.modeMux = 1'b0;
defparam syn__1961_.FeedbackMux = 1'b0;
defparam syn__1961_.ShiftMux = 1'b0;
defparam syn__1961_.BypassEn = 1'b0;
defparam syn__1961_.CarryEnb = 1'b1;

alta_slice syn__1962_(
	.A(vcc),
	.B(vcc),
	.C(syn__0495_),
	.D(\tc3.PC [5]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0497_),
	.Cout(),
	.Q());
defparam syn__1962_.coord_x = 0;
defparam syn__1962_.coord_y = 8;
defparam syn__1962_.coord_z = 7;
defparam syn__1962_.mask = 16'hF000;
defparam syn__1962_.modeMux = 1'b0;
defparam syn__1962_.FeedbackMux = 1'b0;
defparam syn__1962_.ShiftMux = 1'b0;
defparam syn__1962_.BypassEn = 1'b0;
defparam syn__1962_.CarryEnb = 1'b1;

alta_slice syn__1963_(
	.A(\tc1.DM [31]),
	.B(syn__0811_),
	.C(syn__1059_),
	.D(syn__0498_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc1.WD [31]),
	.Cout(),
	.Q());
defparam syn__1963_.coord_x = 8;
defparam syn__1963_.coord_y = 7;
defparam syn__1963_.coord_z = 1;
defparam syn__1963_.mask = 16'hAE0C;
defparam syn__1963_.modeMux = 1'b0;
defparam syn__1963_.FeedbackMux = 1'b0;
defparam syn__1963_.ShiftMux = 1'b0;
defparam syn__1963_.BypassEn = 1'b0;
defparam syn__1963_.CarryEnb = 1'b1;

alta_slice syn__1964_(
	.A(\tc1.IM [24]),
	.B(\tc1.IM [2]),
	.C(\tc1.IM [1]),
	.D(\tc1.IM [0]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0498_),
	.Cout(),
	.Q());
defparam syn__1964_.coord_x = 11;
defparam syn__1964_.coord_y = 7;
defparam syn__1964_.coord_z = 0;
defparam syn__1964_.mask = 16'h0004;
defparam syn__1964_.modeMux = 1'b0;
defparam syn__1964_.FeedbackMux = 1'b0;
defparam syn__1964_.ShiftMux = 1'b0;
defparam syn__1964_.BypassEn = 1'b0;
defparam syn__1964_.CarryEnb = 1'b1;

alta_slice syn__1965_(
	.A(\tc1.DM [30]),
	.B(syn__0822_),
	.C(syn__0498_),
	.D(syn__0811_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc1.WD [30]),
	.Cout(),
	.Q());
defparam syn__1965_.coord_x = 9;
defparam syn__1965_.coord_y = 8;
defparam syn__1965_.coord_z = 5;
defparam syn__1965_.mask = 16'hB3A0;
defparam syn__1965_.modeMux = 1'b0;
defparam syn__1965_.FeedbackMux = 1'b0;
defparam syn__1965_.ShiftMux = 1'b0;
defparam syn__1965_.BypassEn = 1'b0;
defparam syn__1965_.CarryEnb = 1'b1;

alta_slice syn__1966_(
	.A(\tc1.DM [29]),
	.B(syn__0923_),
	.C(syn__0498_),
	.D(syn__0811_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc1.WD [29]),
	.Cout(),
	.Q());
defparam syn__1966_.coord_x = 9;
defparam syn__1966_.coord_y = 8;
defparam syn__1966_.coord_z = 6;
defparam syn__1966_.mask = 16'hB3A0;
defparam syn__1966_.modeMux = 1'b0;
defparam syn__1966_.FeedbackMux = 1'b0;
defparam syn__1966_.ShiftMux = 1'b0;
defparam syn__1966_.BypassEn = 1'b0;
defparam syn__1966_.CarryEnb = 1'b1;

alta_slice syn__1967_(
	.A(vcc),
	.B(\tc1.DM [28]),
	.C(syn__0498_),
	.D(syn__0499_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc1.WD [28]),
	.Cout(),
	.Q());
defparam syn__1967_.coord_x = 9;
defparam syn__1967_.coord_y = 8;
defparam syn__1967_.coord_z = 7;
defparam syn__1967_.mask = 16'hFFC0;
defparam syn__1967_.modeMux = 1'b0;
defparam syn__1967_.FeedbackMux = 1'b0;
defparam syn__1967_.ShiftMux = 1'b0;
defparam syn__1967_.BypassEn = 1'b0;
defparam syn__1967_.CarryEnb = 1'b1;

alta_slice syn__1968_(
	.A(vcc),
	.B(syn__1045_),
	.C(syn__0664_),
	.D(syn__0811_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0499_),
	.Cout(),
	.Q());
defparam syn__1968_.coord_x = 6;
defparam syn__1968_.coord_y = 8;
defparam syn__1968_.coord_z = 12;
defparam syn__1968_.mask = 16'hCF00;
defparam syn__1968_.modeMux = 1'b0;
defparam syn__1968_.FeedbackMux = 1'b0;
defparam syn__1968_.ShiftMux = 1'b0;
defparam syn__1968_.BypassEn = 1'b0;
defparam syn__1968_.CarryEnb = 1'b1;

alta_slice syn__1969_(
	.A(\tc1.DM [27]),
	.B(syn__0936_),
	.C(syn__0498_),
	.D(syn__0811_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc1.WD [27]),
	.Cout(),
	.Q());
defparam syn__1969_.coord_x = 9;
defparam syn__1969_.coord_y = 8;
defparam syn__1969_.coord_z = 11;
defparam syn__1969_.mask = 16'hB3A0;
defparam syn__1969_.modeMux = 1'b0;
defparam syn__1969_.FeedbackMux = 1'b0;
defparam syn__1969_.ShiftMux = 1'b0;
defparam syn__1969_.BypassEn = 1'b0;
defparam syn__1969_.CarryEnb = 1'b1;

alta_slice syn__1970_(
	.A(vcc),
	.B(\tc1.DM [26]),
	.C(syn__0500_),
	.D(syn__0498_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc1.WD [26]),
	.Cout(),
	.Q());
defparam syn__1970_.coord_x = 9;
defparam syn__1970_.coord_y = 7;
defparam syn__1970_.coord_z = 9;
defparam syn__1970_.mask = 16'hFCF0;
defparam syn__1970_.modeMux = 1'b0;
defparam syn__1970_.FeedbackMux = 1'b0;
defparam syn__1970_.ShiftMux = 1'b0;
defparam syn__1970_.BypassEn = 1'b0;
defparam syn__1970_.CarryEnb = 1'b1;

alta_slice syn__1971_(
	.A(syn__0811_),
	.B(syn__0922_),
	.C(syn__0660_),
	.D(syn__0950_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0500_),
	.Cout(),
	.Q());
defparam syn__1971_.coord_x = 9;
defparam syn__1971_.coord_y = 7;
defparam syn__1971_.coord_z = 6;
defparam syn__1971_.mask = 16'h0A8A;
defparam syn__1971_.modeMux = 1'b0;
defparam syn__1971_.FeedbackMux = 1'b0;
defparam syn__1971_.ShiftMux = 1'b0;
defparam syn__1971_.BypassEn = 1'b0;
defparam syn__1971_.CarryEnb = 1'b1;

alta_slice syn__1972_(
	.A(syn__0656_),
	.B(\tc1.DM [25]),
	.C(syn__0498_),
	.D(syn__0811_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc1.WD [25]),
	.Cout(),
	.Q());
defparam syn__1972_.coord_x = 4;
defparam syn__1972_.coord_y = 8;
defparam syn__1972_.coord_z = 4;
defparam syn__1972_.mask = 16'hD5C0;
defparam syn__1972_.modeMux = 1'b0;
defparam syn__1972_.FeedbackMux = 1'b0;
defparam syn__1972_.ShiftMux = 1'b0;
defparam syn__1972_.BypassEn = 1'b0;
defparam syn__1972_.CarryEnb = 1'b1;

alta_slice syn__1973_(
	.A(\tc1.DM [24]),
	.B(syn__1029_),
	.C(syn__0498_),
	.D(syn__0811_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc1.WD [24]),
	.Cout(),
	.Q());
defparam syn__1973_.coord_x = 4;
defparam syn__1973_.coord_y = 8;
defparam syn__1973_.coord_z = 1;
defparam syn__1973_.mask = 16'hB3A0;
defparam syn__1973_.modeMux = 1'b0;
defparam syn__1973_.FeedbackMux = 1'b0;
defparam syn__1973_.ShiftMux = 1'b0;
defparam syn__1973_.BypassEn = 1'b0;
defparam syn__1973_.CarryEnb = 1'b1;

alta_slice syn__1974_(
	.A(syn__0501_),
	.B(syn__0811_),
	.C(syn__1056_),
	.D(vcc),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc1.WD [23]),
	.Cout(),
	.Q());
defparam syn__1974_.coord_x = 9;
defparam syn__1974_.coord_y = 8;
defparam syn__1974_.coord_z = 13;
defparam syn__1974_.mask = 16'h5D5D;
defparam syn__1974_.modeMux = 1'b0;
defparam syn__1974_.FeedbackMux = 1'b0;
defparam syn__1974_.ShiftMux = 1'b0;
defparam syn__1974_.BypassEn = 1'b0;
defparam syn__1974_.CarryEnb = 1'b1;

alta_slice syn__1975_(
	.A(\tc1.IM [23]),
	.B(\tc1.IM [24]),
	.C(syn__0498_),
	.D(\tc1.DM [23]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0501_),
	.Cout(),
	.Q());
defparam syn__1975_.coord_x = 11;
defparam syn__1975_.coord_y = 7;
defparam syn__1975_.coord_z = 8;
defparam syn__1975_.mask = 16'h0777;
defparam syn__1975_.modeMux = 1'b0;
defparam syn__1975_.FeedbackMux = 1'b0;
defparam syn__1975_.ShiftMux = 1'b0;
defparam syn__1975_.BypassEn = 1'b0;
defparam syn__1975_.CarryEnb = 1'b1;

alta_slice syn__1976_(
	.A(syn__0502_),
	.B(vcc),
	.C(syn__1049_),
	.D(syn__0811_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc1.WD [22]),
	.Cout(),
	.Q());
defparam syn__1976_.coord_x = 11;
defparam syn__1976_.coord_y = 8;
defparam syn__1976_.coord_z = 7;
defparam syn__1976_.mask = 16'h5F55;
defparam syn__1976_.modeMux = 1'b0;
defparam syn__1976_.FeedbackMux = 1'b0;
defparam syn__1976_.ShiftMux = 1'b0;
defparam syn__1976_.BypassEn = 1'b0;
defparam syn__1976_.CarryEnb = 1'b1;

alta_slice syn__1977_(
	.A(\tc1.IM [22]),
	.B(\tc1.IM [24]),
	.C(\tc1.DM [22]),
	.D(syn__0498_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0502_),
	.Cout(),
	.Q());
defparam syn__1977_.coord_x = 11;
defparam syn__1977_.coord_y = 8;
defparam syn__1977_.coord_z = 10;
defparam syn__1977_.mask = 16'h0777;
defparam syn__1977_.modeMux = 1'b0;
defparam syn__1977_.FeedbackMux = 1'b0;
defparam syn__1977_.ShiftMux = 1'b0;
defparam syn__1977_.BypassEn = 1'b0;
defparam syn__1977_.CarryEnb = 1'b1;

alta_slice syn__1978_(
	.A(syn__0503_),
	.B(syn__1046_),
	.C(syn__1044_),
	.D(syn__0811_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc1.WD [21]),
	.Cout(),
	.Q());
defparam syn__1978_.coord_x = 6;
defparam syn__1978_.coord_y = 8;
defparam syn__1978_.coord_z = 10;
defparam syn__1978_.mask = 16'hF755;
defparam syn__1978_.modeMux = 1'b0;
defparam syn__1978_.FeedbackMux = 1'b0;
defparam syn__1978_.ShiftMux = 1'b0;
defparam syn__1978_.BypassEn = 1'b0;
defparam syn__1978_.CarryEnb = 1'b1;

alta_slice syn__1979_(
	.A(\tc1.IM [21]),
	.B(\tc1.IM [24]),
	.C(syn__0498_),
	.D(\tc1.DM [21]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0503_),
	.Cout(),
	.Q());
defparam syn__1979_.coord_x = 4;
defparam syn__1979_.coord_y = 8;
defparam syn__1979_.coord_z = 5;
defparam syn__1979_.mask = 16'h0777;
defparam syn__1979_.modeMux = 1'b0;
defparam syn__1979_.FeedbackMux = 1'b0;
defparam syn__1979_.ShiftMux = 1'b0;
defparam syn__1979_.BypassEn = 1'b0;
defparam syn__1979_.CarryEnb = 1'b1;

alta_slice syn__1980_(
	.A(syn__0504_),
	.B(vcc),
	.C(syn__1037_),
	.D(syn__0811_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc1.WD [20]),
	.Cout(),
	.Q());
defparam syn__1980_.coord_x = 11;
defparam syn__1980_.coord_y = 8;
defparam syn__1980_.coord_z = 13;
defparam syn__1980_.mask = 16'h5F55;
defparam syn__1980_.modeMux = 1'b0;
defparam syn__1980_.FeedbackMux = 1'b0;
defparam syn__1980_.ShiftMux = 1'b0;
defparam syn__1980_.BypassEn = 1'b0;
defparam syn__1980_.CarryEnb = 1'b1;

alta_slice syn__1981_(
	.A(\tc1.IM [20]),
	.B(\tc1.IM [24]),
	.C(\tc1.DM [20]),
	.D(syn__0498_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0504_),
	.Cout(),
	.Q());
defparam syn__1981_.coord_x = 11;
defparam syn__1981_.coord_y = 8;
defparam syn__1981_.coord_z = 4;
defparam syn__1981_.mask = 16'h0777;
defparam syn__1981_.modeMux = 1'b0;
defparam syn__1981_.FeedbackMux = 1'b0;
defparam syn__1981_.ShiftMux = 1'b0;
defparam syn__1981_.BypassEn = 1'b0;
defparam syn__1981_.CarryEnb = 1'b1;

alta_slice syn__1982_(
	.A(vcc),
	.B(syn__0949_),
	.C(syn__0505_),
	.D(syn__0811_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc1.WD [19]),
	.Cout(),
	.Q());
defparam syn__1982_.coord_x = 11;
defparam syn__1982_.coord_y = 8;
defparam syn__1982_.coord_z = 8;
defparam syn__1982_.mask = 16'h3F0F;
defparam syn__1982_.modeMux = 1'b0;
defparam syn__1982_.FeedbackMux = 1'b0;
defparam syn__1982_.ShiftMux = 1'b0;
defparam syn__1982_.BypassEn = 1'b0;
defparam syn__1982_.CarryEnb = 1'b1;

alta_slice syn__1983_(
	.A(\tc1.IM [19]),
	.B(\tc1.IM [24]),
	.C(\tc1.DM [19]),
	.D(syn__0498_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0505_),
	.Cout(),
	.Q());
defparam syn__1983_.coord_x = 11;
defparam syn__1983_.coord_y = 8;
defparam syn__1983_.coord_z = 9;
defparam syn__1983_.mask = 16'h0777;
defparam syn__1983_.modeMux = 1'b0;
defparam syn__1983_.FeedbackMux = 1'b0;
defparam syn__1983_.ShiftMux = 1'b0;
defparam syn__1983_.BypassEn = 1'b0;
defparam syn__1983_.CarryEnb = 1'b1;

alta_slice syn__1984_(
	.A(syn__0506_),
	.B(vcc),
	.C(syn__0658_),
	.D(syn__0811_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc1.WD [18]),
	.Cout(),
	.Q());
defparam syn__1984_.coord_x = 11;
defparam syn__1984_.coord_y = 8;
defparam syn__1984_.coord_z = 11;
defparam syn__1984_.mask = 16'h5F55;
defparam syn__1984_.modeMux = 1'b0;
defparam syn__1984_.FeedbackMux = 1'b0;
defparam syn__1984_.ShiftMux = 1'b0;
defparam syn__1984_.BypassEn = 1'b0;
defparam syn__1984_.CarryEnb = 1'b1;

alta_slice syn__1985_(
	.A(\tc1.IM [18]),
	.B(\tc1.IM [24]),
	.C(\tc1.DM [18]),
	.D(syn__0498_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0506_),
	.Cout(),
	.Q());
defparam syn__1985_.coord_x = 11;
defparam syn__1985_.coord_y = 8;
defparam syn__1985_.coord_z = 2;
defparam syn__1985_.mask = 16'h0777;
defparam syn__1985_.modeMux = 1'b0;
defparam syn__1985_.FeedbackMux = 1'b0;
defparam syn__1985_.ShiftMux = 1'b0;
defparam syn__1985_.BypassEn = 1'b0;
defparam syn__1985_.CarryEnb = 1'b1;

alta_slice syn__1986_(
	.A(syn__0811_),
	.B(vcc),
	.C(syn__1026_),
	.D(syn__0507_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc1.WD [17]),
	.Cout(),
	.Q());
defparam syn__1986_.coord_x = 7;
defparam syn__1986_.coord_y = 6;
defparam syn__1986_.coord_z = 9;
defparam syn__1986_.mask = 16'h0AFF;
defparam syn__1986_.modeMux = 1'b0;
defparam syn__1986_.FeedbackMux = 1'b0;
defparam syn__1986_.ShiftMux = 1'b0;
defparam syn__1986_.BypassEn = 1'b0;
defparam syn__1986_.CarryEnb = 1'b1;

alta_slice syn__1987_(
	.A(\tc1.DM [17]),
	.B(\tc1.IM [17]),
	.C(syn__0498_),
	.D(\tc1.IM [24]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0507_),
	.Cout(),
	.Q());
defparam syn__1987_.coord_x = 4;
defparam syn__1987_.coord_y = 8;
defparam syn__1987_.coord_z = 3;
defparam syn__1987_.mask = 16'h135F;
defparam syn__1987_.modeMux = 1'b0;
defparam syn__1987_.FeedbackMux = 1'b0;
defparam syn__1987_.ShiftMux = 1'b0;
defparam syn__1987_.BypassEn = 1'b0;
defparam syn__1987_.CarryEnb = 1'b1;

alta_slice syn__1988_(
	.A(vcc),
	.B(syn__0984_),
	.C(syn__0508_),
	.D(syn__0811_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc1.WD [16]),
	.Cout(),
	.Q());
defparam syn__1988_.coord_x = 11;
defparam syn__1988_.coord_y = 8;
defparam syn__1988_.coord_z = 15;
defparam syn__1988_.mask = 16'h3F0F;
defparam syn__1988_.modeMux = 1'b0;
defparam syn__1988_.FeedbackMux = 1'b0;
defparam syn__1988_.ShiftMux = 1'b0;
defparam syn__1988_.BypassEn = 1'b0;
defparam syn__1988_.CarryEnb = 1'b1;

alta_slice syn__1989_(
	.A(\tc1.IM [24]),
	.B(\tc1.DM [16]),
	.C(\tc1.IM [16]),
	.D(syn__0498_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0508_),
	.Cout(),
	.Q());
defparam syn__1989_.coord_x = 11;
defparam syn__1989_.coord_y = 8;
defparam syn__1989_.coord_z = 12;
defparam syn__1989_.mask = 16'h135F;
defparam syn__1989_.modeMux = 1'b0;
defparam syn__1989_.FeedbackMux = 1'b0;
defparam syn__1989_.ShiftMux = 1'b0;
defparam syn__1989_.BypassEn = 1'b0;
defparam syn__1989_.CarryEnb = 1'b1;

alta_slice syn__1990_(
	.A(syn__0509_),
	.B(vcc),
	.C(syn__0666_),
	.D(syn__0811_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc1.WD [15]),
	.Cout(),
	.Q());
defparam syn__1990_.coord_x = 5;
defparam syn__1990_.coord_y = 8;
defparam syn__1990_.coord_z = 15;
defparam syn__1990_.mask = 16'h5F55;
defparam syn__1990_.modeMux = 1'b0;
defparam syn__1990_.FeedbackMux = 1'b0;
defparam syn__1990_.ShiftMux = 1'b0;
defparam syn__1990_.BypassEn = 1'b0;
defparam syn__1990_.CarryEnb = 1'b1;

alta_slice syn__1991_(
	.A(\tc1.IM [15]),
	.B(\tc1.IM [24]),
	.C(\tc1.DM [15]),
	.D(syn__0498_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0509_),
	.Cout(),
	.Q());
defparam syn__1991_.coord_x = 5;
defparam syn__1991_.coord_y = 8;
defparam syn__1991_.coord_z = 2;
defparam syn__1991_.mask = 16'h0777;
defparam syn__1991_.modeMux = 1'b0;
defparam syn__1991_.FeedbackMux = 1'b0;
defparam syn__1991_.ShiftMux = 1'b0;
defparam syn__1991_.BypassEn = 1'b0;
defparam syn__1991_.CarryEnb = 1'b1;

alta_slice syn__1992_(
	.A(syn__0510_),
	.B(vcc),
	.C(syn__1052_),
	.D(syn__0811_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc1.WD [14]),
	.Cout(),
	.Q());
defparam syn__1992_.coord_x = 9;
defparam syn__1992_.coord_y = 8;
defparam syn__1992_.coord_z = 14;
defparam syn__1992_.mask = 16'h5F55;
defparam syn__1992_.modeMux = 1'b0;
defparam syn__1992_.FeedbackMux = 1'b0;
defparam syn__1992_.ShiftMux = 1'b0;
defparam syn__1992_.BypassEn = 1'b0;
defparam syn__1992_.CarryEnb = 1'b1;

alta_slice syn__1993_(
	.A(\tc1.IM [14]),
	.B(\tc1.DM [14]),
	.C(syn__0498_),
	.D(\tc1.IM [24]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0510_),
	.Cout(),
	.Q());
defparam syn__1993_.coord_x = 9;
defparam syn__1993_.coord_y = 8;
defparam syn__1993_.coord_z = 12;
defparam syn__1993_.mask = 16'h153F;
defparam syn__1993_.modeMux = 1'b0;
defparam syn__1993_.FeedbackMux = 1'b0;
defparam syn__1993_.ShiftMux = 1'b0;
defparam syn__1993_.BypassEn = 1'b0;
defparam syn__1993_.CarryEnb = 1'b1;

alta_slice syn__1994_(
	.A(syn__0511_),
	.B(vcc),
	.C(syn__0662_),
	.D(syn__0811_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc1.WD [13]),
	.Cout(),
	.Q());
defparam syn__1994_.coord_x = 11;
defparam syn__1994_.coord_y = 8;
defparam syn__1994_.coord_z = 5;
defparam syn__1994_.mask = 16'h5F55;
defparam syn__1994_.modeMux = 1'b0;
defparam syn__1994_.FeedbackMux = 1'b0;
defparam syn__1994_.ShiftMux = 1'b0;
defparam syn__1994_.BypassEn = 1'b0;
defparam syn__1994_.CarryEnb = 1'b1;

alta_slice syn__1995_(
	.A(\tc1.IM [24]),
	.B(\tc1.DM [13]),
	.C(\tc1.IM [13]),
	.D(syn__0498_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0511_),
	.Cout(),
	.Q());
defparam syn__1995_.coord_x = 11;
defparam syn__1995_.coord_y = 8;
defparam syn__1995_.coord_z = 14;
defparam syn__1995_.mask = 16'h135F;
defparam syn__1995_.modeMux = 1'b0;
defparam syn__1995_.FeedbackMux = 1'b0;
defparam syn__1995_.ShiftMux = 1'b0;
defparam syn__1995_.BypassEn = 1'b0;
defparam syn__1995_.CarryEnb = 1'b1;

alta_slice syn__1996_(
	.A(vcc),
	.B(syn__1040_),
	.C(syn__0512_),
	.D(syn__0811_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc1.WD [12]),
	.Cout(),
	.Q());
defparam syn__1996_.coord_x = 9;
defparam syn__1996_.coord_y = 6;
defparam syn__1996_.coord_z = 5;
defparam syn__1996_.mask = 16'h3F0F;
defparam syn__1996_.modeMux = 1'b0;
defparam syn__1996_.FeedbackMux = 1'b0;
defparam syn__1996_.ShiftMux = 1'b0;
defparam syn__1996_.BypassEn = 1'b0;
defparam syn__1996_.CarryEnb = 1'b1;

alta_slice syn__1997_(
	.A(\tc1.IM [24]),
	.B(\tc1.DM [12]),
	.C(syn__0498_),
	.D(\tc1.IM [12]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0512_),
	.Cout(),
	.Q());
defparam syn__1997_.coord_x = 4;
defparam syn__1997_.coord_y = 8;
defparam syn__1997_.coord_z = 0;
defparam syn__1997_.mask = 16'h153F;
defparam syn__1997_.modeMux = 1'b0;
defparam syn__1997_.FeedbackMux = 1'b0;
defparam syn__1997_.ShiftMux = 1'b0;
defparam syn__1997_.BypassEn = 1'b0;
defparam syn__1997_.CarryEnb = 1'b1;

alta_slice syn__1998_(
	.A(syn__0513_),
	.B(vcc),
	.C(syn__1033_),
	.D(syn__0811_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc1.WD [11]),
	.Cout(),
	.Q());
defparam syn__1998_.coord_x = 9;
defparam syn__1998_.coord_y = 8;
defparam syn__1998_.coord_z = 4;
defparam syn__1998_.mask = 16'h5F55;
defparam syn__1998_.modeMux = 1'b0;
defparam syn__1998_.FeedbackMux = 1'b0;
defparam syn__1998_.ShiftMux = 1'b0;
defparam syn__1998_.BypassEn = 1'b0;
defparam syn__1998_.CarryEnb = 1'b1;

alta_slice syn__1999_(
	.A(syn__0498_),
	.B(\tc1.IM [24]),
	.C(\tc1.DM [11]),
	.D(\tc1.IM [11]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0513_),
	.Cout(),
	.Q());
defparam syn__1999_.coord_x = 9;
defparam syn__1999_.coord_y = 8;
defparam syn__1999_.coord_z = 0;
defparam syn__1999_.mask = 16'h135F;
defparam syn__1999_.modeMux = 1'b0;
defparam syn__1999_.FeedbackMux = 1'b0;
defparam syn__1999_.ShiftMux = 1'b0;
defparam syn__1999_.BypassEn = 1'b0;
defparam syn__1999_.CarryEnb = 1'b1;

alta_slice syn__2000_(
	.A(syn__0514_),
	.B(vcc),
	.C(syn__0622_),
	.D(syn__0811_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc1.WD [10]),
	.Cout(),
	.Q());
defparam syn__2000_.coord_x = 11;
defparam syn__2000_.coord_y = 8;
defparam syn__2000_.coord_z = 3;
defparam syn__2000_.mask = 16'h5F55;
defparam syn__2000_.modeMux = 1'b0;
defparam syn__2000_.FeedbackMux = 1'b0;
defparam syn__2000_.ShiftMux = 1'b0;
defparam syn__2000_.BypassEn = 1'b0;
defparam syn__2000_.CarryEnb = 1'b1;

alta_slice syn__2001_(
	.A(\tc1.IM [24]),
	.B(\tc1.IM [10]),
	.C(\tc1.DM [10]),
	.D(syn__0498_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0514_),
	.Cout(),
	.Q());
defparam syn__2001_.coord_x = 11;
defparam syn__2001_.coord_y = 8;
defparam syn__2001_.coord_z = 6;
defparam syn__2001_.mask = 16'h0777;
defparam syn__2001_.modeMux = 1'b0;
defparam syn__2001_.FeedbackMux = 1'b0;
defparam syn__2001_.ShiftMux = 1'b0;
defparam syn__2001_.BypassEn = 1'b0;
defparam syn__2001_.CarryEnb = 1'b1;

alta_slice syn__2002_(
	.A(vcc),
	.B(syn__0515_),
	.C(syn__0965_),
	.D(syn__0811_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc1.WD [9]),
	.Cout(),
	.Q());
defparam syn__2002_.coord_x = 9;
defparam syn__2002_.coord_y = 8;
defparam syn__2002_.coord_z = 8;
defparam syn__2002_.mask = 16'h3F33;
defparam syn__2002_.modeMux = 1'b0;
defparam syn__2002_.FeedbackMux = 1'b0;
defparam syn__2002_.ShiftMux = 1'b0;
defparam syn__2002_.BypassEn = 1'b0;
defparam syn__2002_.CarryEnb = 1'b1;

alta_slice syn__2003_(
	.A(\tc1.DM [9]),
	.B(\tc1.IM [24]),
	.C(syn__0498_),
	.D(\tc1.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0515_),
	.Cout(),
	.Q());
defparam syn__2003_.coord_x = 9;
defparam syn__2003_.coord_y = 8;
defparam syn__2003_.coord_z = 9;
defparam syn__2003_.mask = 16'h135F;
defparam syn__2003_.modeMux = 1'b0;
defparam syn__2003_.FeedbackMux = 1'b0;
defparam syn__2003_.ShiftMux = 1'b0;
defparam syn__2003_.BypassEn = 1'b0;
defparam syn__2003_.CarryEnb = 1'b1;

alta_slice syn__2004_(
	.A(syn__0516_),
	.B(vcc),
	.C(syn__0973_),
	.D(syn__0811_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc1.WD [8]),
	.Cout(),
	.Q());
defparam syn__2004_.coord_x = 9;
defparam syn__2004_.coord_y = 8;
defparam syn__2004_.coord_z = 3;
defparam syn__2004_.mask = 16'h5F55;
defparam syn__2004_.modeMux = 1'b0;
defparam syn__2004_.FeedbackMux = 1'b0;
defparam syn__2004_.ShiftMux = 1'b0;
defparam syn__2004_.BypassEn = 1'b0;
defparam syn__2004_.CarryEnb = 1'b1;

alta_slice syn__2005_(
	.A(\tc1.IM [24]),
	.B(\tc1.DM [8]),
	.C(syn__0498_),
	.D(\tc1.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0516_),
	.Cout(),
	.Q());
defparam syn__2005_.coord_x = 9;
defparam syn__2005_.coord_y = 8;
defparam syn__2005_.coord_z = 10;
defparam syn__2005_.mask = 16'h153F;
defparam syn__2005_.modeMux = 1'b0;
defparam syn__2005_.FeedbackMux = 1'b0;
defparam syn__2005_.ShiftMux = 1'b0;
defparam syn__2005_.BypassEn = 1'b0;
defparam syn__2005_.CarryEnb = 1'b1;

alta_slice syn__2006_(
	.A(vcc),
	.B(syn__0517_),
	.C(syn__0636_),
	.D(syn__0811_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc1.WD [7]),
	.Cout(),
	.Q());
defparam syn__2006_.coord_x = 11;
defparam syn__2006_.coord_y = 8;
defparam syn__2006_.coord_z = 0;
defparam syn__2006_.mask = 16'h3F33;
defparam syn__2006_.modeMux = 1'b0;
defparam syn__2006_.FeedbackMux = 1'b0;
defparam syn__2006_.ShiftMux = 1'b0;
defparam syn__2006_.BypassEn = 1'b0;
defparam syn__2006_.CarryEnb = 1'b1;

alta_slice syn__2007_(
	.A(\tc1.IM [24]),
	.B(syn__0498_),
	.C(\tc1.DM [7]),
	.D(\tc1.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0517_),
	.Cout(),
	.Q());
defparam syn__2007_.coord_x = 11;
defparam syn__2007_.coord_y = 8;
defparam syn__2007_.coord_z = 1;
defparam syn__2007_.mask = 16'h153F;
defparam syn__2007_.modeMux = 1'b0;
defparam syn__2007_.FeedbackMux = 1'b0;
defparam syn__2007_.ShiftMux = 1'b0;
defparam syn__2007_.BypassEn = 1'b0;
defparam syn__2007_.CarryEnb = 1'b1;

alta_slice syn__2008_(
	.A(syn__0518_),
	.B(syn__0997_),
	.C(syn__0811_),
	.D(syn__0519_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc1.WD [6]),
	.Cout(),
	.Q());
defparam syn__2008_.coord_x = 11;
defparam syn__2008_.coord_y = 7;
defparam syn__2008_.coord_z = 3;
defparam syn__2008_.mask = 16'hBAFF;
defparam syn__2008_.modeMux = 1'b0;
defparam syn__2008_.FeedbackMux = 1'b0;
defparam syn__2008_.ShiftMux = 1'b0;
defparam syn__2008_.BypassEn = 1'b0;
defparam syn__2008_.CarryEnb = 1'b1;

alta_slice syn__2009_(
	.A(\tc1.PC [6]),
	.B(syn__1073_),
	.C(syn__1063_),
	.D(\tc1.PC [0]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0518_),
	.Cout(),
	.Q());
defparam syn__2009_.coord_x = 12;
defparam syn__2009_.coord_y = 8;
defparam syn__2009_.coord_z = 8;
defparam syn__2009_.mask = 16'h60A0;
defparam syn__2009_.modeMux = 1'b0;
defparam syn__2009_.FeedbackMux = 1'b0;
defparam syn__2009_.ShiftMux = 1'b0;
defparam syn__2009_.BypassEn = 1'b0;
defparam syn__2009_.CarryEnb = 1'b1;

alta_slice syn__2010_(
	.A(\tc1.IM [24]),
	.B(\tc1.DM [6]),
	.C(syn__0498_),
	.D(\tc1.IM [6]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0519_),
	.Cout(),
	.Q());
defparam syn__2010_.coord_x = 11;
defparam syn__2010_.coord_y = 7;
defparam syn__2010_.coord_z = 9;
defparam syn__2010_.mask = 16'h153F;
defparam syn__2010_.modeMux = 1'b0;
defparam syn__2010_.FeedbackMux = 1'b0;
defparam syn__2010_.ShiftMux = 1'b0;
defparam syn__2010_.BypassEn = 1'b0;
defparam syn__2010_.CarryEnb = 1'b1;

alta_slice syn__2011_(
	.A(syn__0520_),
	.B(vcc),
	.C(syn__1001_),
	.D(syn__0811_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc1.WD [5]),
	.Cout(),
	.Q());
defparam syn__2011_.coord_x = 12;
defparam syn__2011_.coord_y = 7;
defparam syn__2011_.coord_z = 1;
defparam syn__2011_.mask = 16'h5F55;
defparam syn__2011_.modeMux = 1'b0;
defparam syn__2011_.FeedbackMux = 1'b0;
defparam syn__2011_.ShiftMux = 1'b0;
defparam syn__2011_.BypassEn = 1'b0;
defparam syn__2011_.CarryEnb = 1'b1;

alta_slice syn__2012_(
	.A(vcc),
	.B(syn__0522_),
	.C(syn__1063_),
	.D(syn__0521_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0520_),
	.Cout(),
	.Q());
defparam syn__2012_.coord_x = 12;
defparam syn__2012_.coord_y = 7;
defparam syn__2012_.coord_z = 8;
defparam syn__2012_.mask = 16'h0CCC;
defparam syn__2012_.modeMux = 1'b0;
defparam syn__2012_.FeedbackMux = 1'b0;
defparam syn__2012_.ShiftMux = 1'b0;
defparam syn__2012_.BypassEn = 1'b0;
defparam syn__2012_.CarryEnb = 1'b1;

alta_slice syn__2013_(
	.A(\tc1.PC [5]),
	.B(syn__1071_),
	.C(vcc),
	.D(\tc1.PC [0]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0521_),
	.Cout(),
	.Q());
defparam syn__2013_.coord_x = 12;
defparam syn__2013_.coord_y = 8;
defparam syn__2013_.coord_z = 5;
defparam syn__2013_.mask = 16'h66AA;
defparam syn__2013_.modeMux = 1'b0;
defparam syn__2013_.FeedbackMux = 1'b0;
defparam syn__2013_.ShiftMux = 1'b0;
defparam syn__2013_.BypassEn = 1'b0;
defparam syn__2013_.CarryEnb = 1'b1;

alta_slice syn__2014_(
	.A(\tc1.IM [24]),
	.B(\tc1.DM [5]),
	.C(syn__0498_),
	.D(\tc1.IM [5]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0522_),
	.Cout(),
	.Q());
defparam syn__2014_.coord_x = 4;
defparam syn__2014_.coord_y = 8;
defparam syn__2014_.coord_z = 6;
defparam syn__2014_.mask = 16'h153F;
defparam syn__2014_.modeMux = 1'b0;
defparam syn__2014_.FeedbackMux = 1'b0;
defparam syn__2014_.ShiftMux = 1'b0;
defparam syn__2014_.BypassEn = 1'b0;
defparam syn__2014_.CarryEnb = 1'b1;

alta_slice syn__2015_(
	.A(syn__0811_),
	.B(syn__0525_),
	.C(syn__1006_),
	.D(syn__0523_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc1.WD [4]),
	.Cout(),
	.Q());
defparam syn__2015_.coord_x = 11;
defparam syn__2015_.coord_y = 7;
defparam syn__2015_.coord_z = 2;
defparam syn__2015_.mask = 16'hFF3B;
defparam syn__2015_.modeMux = 1'b0;
defparam syn__2015_.FeedbackMux = 1'b0;
defparam syn__2015_.ShiftMux = 1'b0;
defparam syn__2015_.BypassEn = 1'b0;
defparam syn__2015_.CarryEnb = 1'b1;

alta_slice syn__2016_(
	.A(syn__0524_),
	.B(\tc1.PC [3]),
	.C(\tc1.PC [4]),
	.D(syn__1063_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0523_),
	.Cout(),
	.Q());
defparam syn__2016_.coord_x = 12;
defparam syn__2016_.coord_y = 7;
defparam syn__2016_.coord_z = 3;
defparam syn__2016_.mask = 16'h7800;
defparam syn__2016_.modeMux = 1'b0;
defparam syn__2016_.FeedbackMux = 1'b0;
defparam syn__2016_.ShiftMux = 1'b0;
defparam syn__2016_.BypassEn = 1'b0;
defparam syn__2016_.CarryEnb = 1'b1;

alta_slice syn__2017_(
	.A(vcc),
	.B(vcc),
	.C(syn__1067_),
	.D(\tc1.PC [0]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0524_),
	.Cout(),
	.Q());
defparam syn__2017_.coord_x = 12;
defparam syn__2017_.coord_y = 8;
defparam syn__2017_.coord_z = 9;
defparam syn__2017_.mask = 16'hF000;
defparam syn__2017_.modeMux = 1'b0;
defparam syn__2017_.FeedbackMux = 1'b0;
defparam syn__2017_.ShiftMux = 1'b0;
defparam syn__2017_.BypassEn = 1'b0;
defparam syn__2017_.CarryEnb = 1'b1;

alta_slice syn__2018_(
	.A(\tc1.IM [24]),
	.B(\tc1.DM [4]),
	.C(syn__0498_),
	.D(\tc1.IM [4]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0525_),
	.Cout(),
	.Q());
defparam syn__2018_.coord_x = 11;
defparam syn__2018_.coord_y = 7;
defparam syn__2018_.coord_z = 7;
defparam syn__2018_.mask = 16'h153F;
defparam syn__2018_.modeMux = 1'b0;
defparam syn__2018_.FeedbackMux = 1'b0;
defparam syn__2018_.ShiftMux = 1'b0;
defparam syn__2018_.BypassEn = 1'b0;
defparam syn__2018_.CarryEnb = 1'b1;

alta_slice syn__2019_(
	.A(syn__1012_),
	.B(syn__0811_),
	.C(vcc),
	.D(syn__0526_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc1.WD [3]),
	.Cout(),
	.Q());
defparam syn__2019_.coord_x = 11;
defparam syn__2019_.coord_y = 7;
defparam syn__2019_.coord_z = 5;
defparam syn__2019_.mask = 16'h44FF;
defparam syn__2019_.modeMux = 1'b0;
defparam syn__2019_.FeedbackMux = 1'b0;
defparam syn__2019_.ShiftMux = 1'b0;
defparam syn__2019_.BypassEn = 1'b0;
defparam syn__2019_.CarryEnb = 1'b1;

alta_slice syn__2020_(
	.A(syn__0524_),
	.B(syn__0527_),
	.C(syn__1063_),
	.D(\tc1.PC [3]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0526_),
	.Cout(),
	.Q());
defparam syn__2020_.coord_x = 12;
defparam syn__2020_.coord_y = 7;
defparam syn__2020_.coord_z = 6;
defparam syn__2020_.mask = 16'h8C4C;
defparam syn__2020_.modeMux = 1'b0;
defparam syn__2020_.FeedbackMux = 1'b0;
defparam syn__2020_.ShiftMux = 1'b0;
defparam syn__2020_.BypassEn = 1'b0;
defparam syn__2020_.CarryEnb = 1'b1;

alta_slice syn__2021_(
	.A(\tc1.IM [24]),
	.B(\tc1.IM [3]),
	.C(\tc1.DM [3]),
	.D(syn__0498_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0527_),
	.Cout(),
	.Q());
defparam syn__2021_.coord_x = 2;
defparam syn__2021_.coord_y = 8;
defparam syn__2021_.coord_z = 9;
defparam syn__2021_.mask = 16'h0777;
defparam syn__2021_.modeMux = 1'b0;
defparam syn__2021_.FeedbackMux = 1'b0;
defparam syn__2021_.ShiftMux = 1'b0;
defparam syn__2021_.BypassEn = 1'b0;
defparam syn__2021_.CarryEnb = 1'b1;

alta_slice syn__2022_(
	.A(syn__0811_),
	.B(syn__1015_),
	.C(syn__0529_),
	.D(syn__0528_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc1.WD [2]),
	.Cout(),
	.Q());
defparam syn__2022_.coord_x = 12;
defparam syn__2022_.coord_y = 7;
defparam syn__2022_.coord_z = 0;
defparam syn__2022_.mask = 16'hFF2F;
defparam syn__2022_.modeMux = 1'b0;
defparam syn__2022_.FeedbackMux = 1'b0;
defparam syn__2022_.ShiftMux = 1'b0;
defparam syn__2022_.BypassEn = 1'b0;
defparam syn__2022_.CarryEnb = 1'b1;

alta_slice syn__2023_(
	.A(syn__1063_),
	.B(\tc1.PC [1]),
	.C(\tc1.PC [2]),
	.D(\tc1.PC [0]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0528_),
	.Cout(),
	.Q());
defparam syn__2023_.coord_x = 12;
defparam syn__2023_.coord_y = 8;
defparam syn__2023_.coord_z = 1;
defparam syn__2023_.mask = 16'h28A0;
defparam syn__2023_.modeMux = 1'b0;
defparam syn__2023_.FeedbackMux = 1'b0;
defparam syn__2023_.ShiftMux = 1'b0;
defparam syn__2023_.BypassEn = 1'b0;
defparam syn__2023_.CarryEnb = 1'b1;

alta_slice syn__2024_(
	.A(\tc1.IM [24]),
	.B(\tc1.DM [2]),
	.C(syn__0498_),
	.D(\tc1.IM [2]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0529_),
	.Cout(),
	.Q());
defparam syn__2024_.coord_x = 11;
defparam syn__2024_.coord_y = 7;
defparam syn__2024_.coord_z = 15;
defparam syn__2024_.mask = 16'h153F;
defparam syn__2024_.modeMux = 1'b0;
defparam syn__2024_.FeedbackMux = 1'b0;
defparam syn__2024_.ShiftMux = 1'b0;
defparam syn__2024_.BypassEn = 1'b0;
defparam syn__2024_.CarryEnb = 1'b1;

alta_slice syn__2025_(
	.A(syn__0530_),
	.B(vcc),
	.C(syn__1019_),
	.D(syn__0811_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc1.WD [1]),
	.Cout(),
	.Q());
defparam syn__2025_.coord_x = 9;
defparam syn__2025_.coord_y = 8;
defparam syn__2025_.coord_z = 15;
defparam syn__2025_.mask = 16'h5F55;
defparam syn__2025_.modeMux = 1'b0;
defparam syn__2025_.FeedbackMux = 1'b0;
defparam syn__2025_.ShiftMux = 1'b0;
defparam syn__2025_.BypassEn = 1'b0;
defparam syn__2025_.CarryEnb = 1'b1;

alta_slice syn__2026_(
	.A(\tc1.IM [24]),
	.B(\tc1.IM [1]),
	.C(vcc),
	.D(syn__0531_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0530_),
	.Cout(),
	.Q());
defparam syn__2026_.coord_x = 6;
defparam syn__2026_.coord_y = 8;
defparam syn__2026_.coord_z = 13;
defparam syn__2026_.mask = 16'h7700;
defparam syn__2026_.modeMux = 1'b0;
defparam syn__2026_.FeedbackMux = 1'b0;
defparam syn__2026_.ShiftMux = 1'b0;
defparam syn__2026_.BypassEn = 1'b0;
defparam syn__2026_.CarryEnb = 1'b1;

alta_slice syn__2027_(
	.A(syn__0532_),
	.B(\tc1.DM [1]),
	.C(vcc),
	.D(syn__0498_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0531_),
	.Cout(),
	.Q());
defparam syn__2027_.coord_x = 2;
defparam syn__2027_.coord_y = 8;
defparam syn__2027_.coord_z = 11;
defparam syn__2027_.mask = 16'h1155;
defparam syn__2027_.modeMux = 1'b0;
defparam syn__2027_.FeedbackMux = 1'b0;
defparam syn__2027_.ShiftMux = 1'b0;
defparam syn__2027_.BypassEn = 1'b0;
defparam syn__2027_.CarryEnb = 1'b1;

alta_slice syn__2028_(
	.A(vcc),
	.B(\tc1.PC [1]),
	.C(syn__1063_),
	.D(\tc1.PC [0]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0532_),
	.Cout(),
	.Q());
defparam syn__2028_.coord_x = 12;
defparam syn__2028_.coord_y = 8;
defparam syn__2028_.coord_z = 14;
defparam syn__2028_.mask = 16'h30C0;
defparam syn__2028_.modeMux = 1'b0;
defparam syn__2028_.FeedbackMux = 1'b0;
defparam syn__2028_.ShiftMux = 1'b0;
defparam syn__2028_.BypassEn = 1'b0;
defparam syn__2028_.CarryEnb = 1'b1;

alta_slice syn__2029_(
	.A(syn__0533_),
	.B(vcc),
	.C(syn__1023_),
	.D(syn__0811_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc1.WD [0]),
	.Cout(),
	.Q());
defparam syn__2029_.coord_x = 9;
defparam syn__2029_.coord_y = 8;
defparam syn__2029_.coord_z = 1;
defparam syn__2029_.mask = 16'h5F55;
defparam syn__2029_.modeMux = 1'b0;
defparam syn__2029_.FeedbackMux = 1'b0;
defparam syn__2029_.ShiftMux = 1'b0;
defparam syn__2029_.BypassEn = 1'b0;
defparam syn__2029_.CarryEnb = 1'b1;

alta_slice syn__2030_(
	.A(vcc),
	.B(\tc1.DM [0]),
	.C(syn__0498_),
	.D(syn__0534_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0533_),
	.Cout(),
	.Q());
defparam syn__2030_.coord_x = 9;
defparam syn__2030_.coord_y = 8;
defparam syn__2030_.coord_z = 2;
defparam syn__2030_.mask = 16'h3F00;
defparam syn__2030_.modeMux = 1'b0;
defparam syn__2030_.FeedbackMux = 1'b0;
defparam syn__2030_.ShiftMux = 1'b0;
defparam syn__2030_.BypassEn = 1'b0;
defparam syn__2030_.CarryEnb = 1'b1;

alta_slice syn__2031_(
	.A(syn__1063_),
	.B(\tc1.IM [24]),
	.C(\tc1.IM [0]),
	.D(\tc1.PC [0]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0534_),
	.Cout(),
	.Q());
defparam syn__2031_.coord_x = 12;
defparam syn__2031_.coord_y = 8;
defparam syn__2031_.coord_z = 4;
defparam syn__2031_.mask = 16'h3F15;
defparam syn__2031_.modeMux = 1'b0;
defparam syn__2031_.FeedbackMux = 1'b0;
defparam syn__2031_.ShiftMux = 1'b0;
defparam syn__2031_.BypassEn = 1'b0;
defparam syn__2031_.CarryEnb = 1'b1;

alta_slice syn__2032_(
	.A(\tc1.IM [0]),
	.B(\tc1.IM [1]),
	.C(vcc),
	.D(syn__0811_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc1.WriteDM ),
	.Cout(),
	.Q());
defparam syn__2032_.coord_x = 6;
defparam syn__2032_.coord_y = 8;
defparam syn__2032_.coord_z = 9;
defparam syn__2032_.mask = 16'h4400;
defparam syn__2032_.modeMux = 1'b0;
defparam syn__2032_.FeedbackMux = 1'b0;
defparam syn__2032_.ShiftMux = 1'b0;
defparam syn__2032_.BypassEn = 1'b0;
defparam syn__2032_.CarryEnb = 1'b1;

alta_slice syn__2033_(
	.A(\tc1.IM [1]),
	.B(vcc),
	.C(syn__0811_),
	.D(\tc1.IM [0]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc1.WriteIM ),
	.Cout(),
	.Q());
defparam syn__2033_.coord_x = 11;
defparam syn__2033_.coord_y = 7;
defparam syn__2033_.coord_z = 14;
defparam syn__2033_.mask = 16'h5000;
defparam syn__2033_.modeMux = 1'b0;
defparam syn__2033_.FeedbackMux = 1'b0;
defparam syn__2033_.ShiftMux = 1'b0;
defparam syn__2033_.BypassEn = 1'b0;
defparam syn__2033_.CarryEnb = 1'b1;

alta_slice syn__2034_(
	.A(\tc2.DM [31]),
	.B(syn__0216_),
	.C(syn__0535_),
	.D(syn__0798_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc2.WD [31]),
	.Cout(),
	.Q());
defparam syn__2034_.coord_x = 11;
defparam syn__2034_.coord_y = 4;
defparam syn__2034_.coord_z = 1;
defparam syn__2034_.mask = 16'hB3A0;
defparam syn__2034_.modeMux = 1'b0;
defparam syn__2034_.FeedbackMux = 1'b0;
defparam syn__2034_.ShiftMux = 1'b0;
defparam syn__2034_.BypassEn = 1'b0;
defparam syn__2034_.CarryEnb = 1'b1;

alta_slice syn__2035_(
	.A(\tc2.IM [24]),
	.B(\tc2.IM [2]),
	.C(\tc2.IM [1]),
	.D(\tc2.IM [0]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0535_),
	.Cout(),
	.Q());
defparam syn__2035_.coord_x = 11;
defparam syn__2035_.coord_y = 4;
defparam syn__2035_.coord_z = 0;
defparam syn__2035_.mask = 16'h0004;
defparam syn__2035_.modeMux = 1'b0;
defparam syn__2035_.FeedbackMux = 1'b0;
defparam syn__2035_.ShiftMux = 1'b0;
defparam syn__2035_.BypassEn = 1'b0;
defparam syn__2035_.CarryEnb = 1'b1;

alta_slice syn__2036_(
	.A(syn__0213_),
	.B(\tc2.DM [30]),
	.C(syn__0535_),
	.D(syn__0798_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc2.WD [30]),
	.Cout(),
	.Q());
defparam syn__2036_.coord_x = 11;
defparam syn__2036_.coord_y = 4;
defparam syn__2036_.coord_z = 4;
defparam syn__2036_.mask = 16'hD5C0;
defparam syn__2036_.modeMux = 1'b0;
defparam syn__2036_.FeedbackMux = 1'b0;
defparam syn__2036_.ShiftMux = 1'b0;
defparam syn__2036_.BypassEn = 1'b0;
defparam syn__2036_.CarryEnb = 1'b1;

alta_slice syn__2037_(
	.A(syn__0535_),
	.B(\tc2.DM [29]),
	.C(syn__0079_),
	.D(syn__0798_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc2.WD [29]),
	.Cout(),
	.Q());
defparam syn__2037_.coord_x = 6;
defparam syn__2037_.coord_y = 6;
defparam syn__2037_.coord_z = 8;
defparam syn__2037_.mask = 16'h8F88;
defparam syn__2037_.modeMux = 1'b0;
defparam syn__2037_.FeedbackMux = 1'b0;
defparam syn__2037_.ShiftMux = 1'b0;
defparam syn__2037_.BypassEn = 1'b0;
defparam syn__2037_.CarryEnb = 1'b1;

alta_slice syn__2038_(
	.A(vcc),
	.B(\tc2.DM [28]),
	.C(syn__0535_),
	.D(syn__0536_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc2.WD [28]),
	.Cout(),
	.Q());
defparam syn__2038_.coord_x = 6;
defparam syn__2038_.coord_y = 6;
defparam syn__2038_.coord_z = 9;
defparam syn__2038_.mask = 16'hFFC0;
defparam syn__2038_.modeMux = 1'b0;
defparam syn__2038_.FeedbackMux = 1'b0;
defparam syn__2038_.ShiftMux = 1'b0;
defparam syn__2038_.BypassEn = 1'b0;
defparam syn__2038_.CarryEnb = 1'b1;

alta_slice syn__2039_(
	.A(vcc),
	.B(syn__0202_),
	.C(syn__0726_),
	.D(syn__0798_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0536_),
	.Cout(),
	.Q());
defparam syn__2039_.coord_x = 5;
defparam syn__2039_.coord_y = 2;
defparam syn__2039_.coord_z = 13;
defparam syn__2039_.mask = 16'hCF00;
defparam syn__2039_.modeMux = 1'b0;
defparam syn__2039_.FeedbackMux = 1'b0;
defparam syn__2039_.ShiftMux = 1'b0;
defparam syn__2039_.BypassEn = 1'b0;
defparam syn__2039_.CarryEnb = 1'b1;

alta_slice syn__2040_(
	.A(syn__0535_),
	.B(\tc2.DM [27]),
	.C(syn__0798_),
	.D(syn__0095_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc2.WD [27]),
	.Cout(),
	.Q());
defparam syn__2040_.coord_x = 6;
defparam syn__2040_.coord_y = 6;
defparam syn__2040_.coord_z = 7;
defparam syn__2040_.mask = 16'h88F8;
defparam syn__2040_.modeMux = 1'b0;
defparam syn__2040_.FeedbackMux = 1'b0;
defparam syn__2040_.ShiftMux = 1'b0;
defparam syn__2040_.BypassEn = 1'b0;
defparam syn__2040_.CarryEnb = 1'b1;

alta_slice syn__2041_(
	.A(vcc),
	.B(\tc2.DM [26]),
	.C(syn__0535_),
	.D(syn__0537_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc2.WD [26]),
	.Cout(),
	.Q());
defparam syn__2041_.coord_x = 6;
defparam syn__2041_.coord_y = 6;
defparam syn__2041_.coord_z = 4;
defparam syn__2041_.mask = 16'hFFC0;
defparam syn__2041_.modeMux = 1'b0;
defparam syn__2041_.FeedbackMux = 1'b0;
defparam syn__2041_.ShiftMux = 1'b0;
defparam syn__2041_.BypassEn = 1'b0;
defparam syn__2041_.CarryEnb = 1'b1;

alta_slice syn__2042_(
	.A(syn__0077_),
	.B(syn__0722_),
	.C(syn__0798_),
	.D(syn__0108_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0537_),
	.Cout(),
	.Q());
defparam syn__2042_.coord_x = 6;
defparam syn__2042_.coord_y = 4;
defparam syn__2042_.coord_z = 0;
defparam syn__2042_.mask = 16'h30B0;
defparam syn__2042_.modeMux = 1'b0;
defparam syn__2042_.FeedbackMux = 1'b0;
defparam syn__2042_.ShiftMux = 1'b0;
defparam syn__2042_.BypassEn = 1'b0;
defparam syn__2042_.CarryEnb = 1'b1;

alta_slice syn__2043_(
	.A(syn__0535_),
	.B(\tc2.DM [25]),
	.C(syn__0798_),
	.D(syn__0720_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc2.WD [25]),
	.Cout(),
	.Q());
defparam syn__2043_.coord_x = 6;
defparam syn__2043_.coord_y = 6;
defparam syn__2043_.coord_z = 11;
defparam syn__2043_.mask = 16'h88F8;
defparam syn__2043_.modeMux = 1'b0;
defparam syn__2043_.FeedbackMux = 1'b0;
defparam syn__2043_.ShiftMux = 1'b0;
defparam syn__2043_.BypassEn = 1'b0;
defparam syn__2043_.CarryEnb = 1'b1;

alta_slice syn__2044_(
	.A(syn__0535_),
	.B(syn__0186_),
	.C(syn__0798_),
	.D(\tc2.DM [24]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc2.WD [24]),
	.Cout(),
	.Q());
defparam syn__2044_.coord_x = 6;
defparam syn__2044_.coord_y = 6;
defparam syn__2044_.coord_z = 3;
defparam syn__2044_.mask = 16'hBA30;
defparam syn__2044_.modeMux = 1'b0;
defparam syn__2044_.FeedbackMux = 1'b0;
defparam syn__2044_.ShiftMux = 1'b0;
defparam syn__2044_.BypassEn = 1'b0;
defparam syn__2044_.CarryEnb = 1'b1;

alta_slice syn__2045_(
	.A(vcc),
	.B(syn__1076_),
	.C(syn__0538_),
	.D(syn__0798_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc2.WD [23]),
	.Cout(),
	.Q());
defparam syn__2045_.coord_x = 11;
defparam syn__2045_.coord_y = 1;
defparam syn__2045_.coord_z = 6;
defparam syn__2045_.mask = 16'h3F0F;
defparam syn__2045_.modeMux = 1'b0;
defparam syn__2045_.FeedbackMux = 1'b0;
defparam syn__2045_.ShiftMux = 1'b0;
defparam syn__2045_.BypassEn = 1'b0;
defparam syn__2045_.CarryEnb = 1'b1;

alta_slice syn__2046_(
	.A(\tc2.IM [23]),
	.B(\tc2.IM [24]),
	.C(\tc2.DM [23]),
	.D(syn__0535_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0538_),
	.Cout(),
	.Q());
defparam syn__2046_.coord_x = 11;
defparam syn__2046_.coord_y = 1;
defparam syn__2046_.coord_z = 8;
defparam syn__2046_.mask = 16'h0777;
defparam syn__2046_.modeMux = 1'b0;
defparam syn__2046_.FeedbackMux = 1'b0;
defparam syn__2046_.ShiftMux = 1'b0;
defparam syn__2046_.BypassEn = 1'b0;
defparam syn__2046_.CarryEnb = 1'b1;

alta_slice syn__2047_(
	.A(vcc),
	.B(syn__0539_),
	.C(syn__0209_),
	.D(syn__0798_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc2.WD [22]),
	.Cout(),
	.Q());
defparam syn__2047_.coord_x = 9;
defparam syn__2047_.coord_y = 3;
defparam syn__2047_.coord_z = 10;
defparam syn__2047_.mask = 16'h3F33;
defparam syn__2047_.modeMux = 1'b0;
defparam syn__2047_.FeedbackMux = 1'b0;
defparam syn__2047_.ShiftMux = 1'b0;
defparam syn__2047_.BypassEn = 1'b0;
defparam syn__2047_.CarryEnb = 1'b1;

alta_slice syn__2048_(
	.A(\tc2.IM [22]),
	.B(\tc2.IM [24]),
	.C(\tc2.DM [22]),
	.D(syn__0535_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0539_),
	.Cout(),
	.Q());
defparam syn__2048_.coord_x = 9;
defparam syn__2048_.coord_y = 3;
defparam syn__2048_.coord_z = 11;
defparam syn__2048_.mask = 16'h0777;
defparam syn__2048_.modeMux = 1'b0;
defparam syn__2048_.FeedbackMux = 1'b0;
defparam syn__2048_.ShiftMux = 1'b0;
defparam syn__2048_.BypassEn = 1'b0;
defparam syn__2048_.CarryEnb = 1'b1;

alta_slice syn__2049_(
	.A(syn__0540_),
	.B(syn__0203_),
	.C(syn__0798_),
	.D(syn__0201_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc2.WD [21]),
	.Cout(),
	.Q());
defparam syn__2049_.coord_x = 5;
defparam syn__2049_.coord_y = 2;
defparam syn__2049_.coord_z = 14;
defparam syn__2049_.mask = 16'hF575;
defparam syn__2049_.modeMux = 1'b0;
defparam syn__2049_.FeedbackMux = 1'b0;
defparam syn__2049_.ShiftMux = 1'b0;
defparam syn__2049_.BypassEn = 1'b0;
defparam syn__2049_.CarryEnb = 1'b1;

alta_slice syn__2050_(
	.A(\tc2.IM [21]),
	.B(\tc2.IM [24]),
	.C(syn__0535_),
	.D(\tc2.DM [21]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0540_),
	.Cout(),
	.Q());
defparam syn__2050_.coord_x = 6;
defparam syn__2050_.coord_y = 6;
defparam syn__2050_.coord_z = 12;
defparam syn__2050_.mask = 16'h0777;
defparam syn__2050_.modeMux = 1'b0;
defparam syn__2050_.FeedbackMux = 1'b0;
defparam syn__2050_.ShiftMux = 1'b0;
defparam syn__2050_.BypassEn = 1'b0;
defparam syn__2050_.CarryEnb = 1'b1;

alta_slice syn__2051_(
	.A(vcc),
	.B(syn__0194_),
	.C(syn__0541_),
	.D(syn__0798_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc2.WD [20]),
	.Cout(),
	.Q());
defparam syn__2051_.coord_x = 9;
defparam syn__2051_.coord_y = 3;
defparam syn__2051_.coord_z = 3;
defparam syn__2051_.mask = 16'h3F0F;
defparam syn__2051_.modeMux = 1'b0;
defparam syn__2051_.FeedbackMux = 1'b0;
defparam syn__2051_.ShiftMux = 1'b0;
defparam syn__2051_.BypassEn = 1'b0;
defparam syn__2051_.CarryEnb = 1'b1;

alta_slice syn__2052_(
	.A(\tc2.IM [20]),
	.B(\tc2.IM [24]),
	.C(\tc2.DM [20]),
	.D(syn__0535_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0541_),
	.Cout(),
	.Q());
defparam syn__2052_.coord_x = 9;
defparam syn__2052_.coord_y = 3;
defparam syn__2052_.coord_z = 0;
defparam syn__2052_.mask = 16'h0777;
defparam syn__2052_.modeMux = 1'b0;
defparam syn__2052_.FeedbackMux = 1'b0;
defparam syn__2052_.ShiftMux = 1'b0;
defparam syn__2052_.BypassEn = 1'b0;
defparam syn__2052_.CarryEnb = 1'b1;

alta_slice syn__2053_(
	.A(syn__0542_),
	.B(vcc),
	.C(syn__0107_),
	.D(syn__0798_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc2.WD [19]),
	.Cout(),
	.Q());
defparam syn__2053_.coord_x = 9;
defparam syn__2053_.coord_y = 3;
defparam syn__2053_.coord_z = 14;
defparam syn__2053_.mask = 16'h5F55;
defparam syn__2053_.modeMux = 1'b0;
defparam syn__2053_.FeedbackMux = 1'b0;
defparam syn__2053_.ShiftMux = 1'b0;
defparam syn__2053_.BypassEn = 1'b0;
defparam syn__2053_.CarryEnb = 1'b1;

alta_slice syn__2054_(
	.A(\tc2.IM [19]),
	.B(\tc2.IM [24]),
	.C(\tc2.DM [19]),
	.D(syn__0535_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0542_),
	.Cout(),
	.Q());
defparam syn__2054_.coord_x = 9;
defparam syn__2054_.coord_y = 3;
defparam syn__2054_.coord_z = 8;
defparam syn__2054_.mask = 16'h0777;
defparam syn__2054_.modeMux = 1'b0;
defparam syn__2054_.FeedbackMux = 1'b0;
defparam syn__2054_.ShiftMux = 1'b0;
defparam syn__2054_.BypassEn = 1'b0;
defparam syn__2054_.CarryEnb = 1'b1;

alta_slice syn__2055_(
	.A(vcc),
	.B(syn__0718_),
	.C(syn__0543_),
	.D(syn__0798_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc2.WD [18]),
	.Cout(),
	.Q());
defparam syn__2055_.coord_x = 11;
defparam syn__2055_.coord_y = 1;
defparam syn__2055_.coord_z = 7;
defparam syn__2055_.mask = 16'h3F0F;
defparam syn__2055_.modeMux = 1'b0;
defparam syn__2055_.FeedbackMux = 1'b0;
defparam syn__2055_.ShiftMux = 1'b0;
defparam syn__2055_.BypassEn = 1'b0;
defparam syn__2055_.CarryEnb = 1'b1;

alta_slice syn__2056_(
	.A(\tc2.IM [18]),
	.B(\tc2.IM [24]),
	.C(\tc2.DM [18]),
	.D(syn__0535_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0543_),
	.Cout(),
	.Q());
defparam syn__2056_.coord_x = 11;
defparam syn__2056_.coord_y = 1;
defparam syn__2056_.coord_z = 10;
defparam syn__2056_.mask = 16'h0777;
defparam syn__2056_.modeMux = 1'b0;
defparam syn__2056_.FeedbackMux = 1'b0;
defparam syn__2056_.ShiftMux = 1'b0;
defparam syn__2056_.BypassEn = 1'b0;
defparam syn__2056_.CarryEnb = 1'b1;

alta_slice syn__2057_(
	.A(vcc),
	.B(syn__0183_),
	.C(syn__0544_),
	.D(syn__0798_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc2.WD [17]),
	.Cout(),
	.Q());
defparam syn__2057_.coord_x = 9;
defparam syn__2057_.coord_y = 3;
defparam syn__2057_.coord_z = 1;
defparam syn__2057_.mask = 16'h3F0F;
defparam syn__2057_.modeMux = 1'b0;
defparam syn__2057_.FeedbackMux = 1'b0;
defparam syn__2057_.ShiftMux = 1'b0;
defparam syn__2057_.BypassEn = 1'b0;
defparam syn__2057_.CarryEnb = 1'b1;

alta_slice syn__2058_(
	.A(\tc2.DM [17]),
	.B(\tc2.IM [24]),
	.C(\tc2.IM [17]),
	.D(syn__0535_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0544_),
	.Cout(),
	.Q());
defparam syn__2058_.coord_x = 9;
defparam syn__2058_.coord_y = 3;
defparam syn__2058_.coord_z = 2;
defparam syn__2058_.mask = 16'h153F;
defparam syn__2058_.modeMux = 1'b0;
defparam syn__2058_.FeedbackMux = 1'b0;
defparam syn__2058_.ShiftMux = 1'b0;
defparam syn__2058_.BypassEn = 1'b0;
defparam syn__2058_.CarryEnb = 1'b1;

alta_slice syn__2059_(
	.A(vcc),
	.B(syn__0545_),
	.C(syn__0141_),
	.D(syn__0798_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc2.WD [16]),
	.Cout(),
	.Q());
defparam syn__2059_.coord_x = 9;
defparam syn__2059_.coord_y = 4;
defparam syn__2059_.coord_z = 0;
defparam syn__2059_.mask = 16'h3F33;
defparam syn__2059_.modeMux = 1'b0;
defparam syn__2059_.FeedbackMux = 1'b0;
defparam syn__2059_.ShiftMux = 1'b0;
defparam syn__2059_.BypassEn = 1'b0;
defparam syn__2059_.CarryEnb = 1'b1;

alta_slice syn__2060_(
	.A(\tc2.IM [24]),
	.B(syn__0535_),
	.C(\tc2.DM [16]),
	.D(\tc2.IM [16]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0545_),
	.Cout(),
	.Q());
defparam syn__2060_.coord_x = 9;
defparam syn__2060_.coord_y = 4;
defparam syn__2060_.coord_z = 1;
defparam syn__2060_.mask = 16'h153F;
defparam syn__2060_.modeMux = 1'b0;
defparam syn__2060_.FeedbackMux = 1'b0;
defparam syn__2060_.ShiftMux = 1'b0;
defparam syn__2060_.BypassEn = 1'b0;
defparam syn__2060_.CarryEnb = 1'b1;

alta_slice syn__2061_(
	.A(vcc),
	.B(syn__0546_),
	.C(syn__0219_),
	.D(syn__0798_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc2.WD [15]),
	.Cout(),
	.Q());
defparam syn__2061_.coord_x = 11;
defparam syn__2061_.coord_y = 4;
defparam syn__2061_.coord_z = 2;
defparam syn__2061_.mask = 16'h3F33;
defparam syn__2061_.modeMux = 1'b0;
defparam syn__2061_.FeedbackMux = 1'b0;
defparam syn__2061_.ShiftMux = 1'b0;
defparam syn__2061_.BypassEn = 1'b0;
defparam syn__2061_.CarryEnb = 1'b1;

alta_slice syn__2062_(
	.A(\tc2.IM [24]),
	.B(\tc2.IM [15]),
	.C(syn__0535_),
	.D(\tc2.DM [15]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0546_),
	.Cout(),
	.Q());
defparam syn__2062_.coord_x = 11;
defparam syn__2062_.coord_y = 4;
defparam syn__2062_.coord_z = 3;
defparam syn__2062_.mask = 16'h0777;
defparam syn__2062_.modeMux = 1'b0;
defparam syn__2062_.FeedbackMux = 1'b0;
defparam syn__2062_.ShiftMux = 1'b0;
defparam syn__2062_.BypassEn = 1'b0;
defparam syn__2062_.CarryEnb = 1'b1;

alta_slice syn__2063_(
	.A(vcc),
	.B(syn__0547_),
	.C(syn__0206_),
	.D(syn__0798_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc2.WD [14]),
	.Cout(),
	.Q());
defparam syn__2063_.coord_x = 11;
defparam syn__2063_.coord_y = 1;
defparam syn__2063_.coord_z = 3;
defparam syn__2063_.mask = 16'h3F33;
defparam syn__2063_.modeMux = 1'b0;
defparam syn__2063_.FeedbackMux = 1'b0;
defparam syn__2063_.ShiftMux = 1'b0;
defparam syn__2063_.BypassEn = 1'b0;
defparam syn__2063_.CarryEnb = 1'b1;

alta_slice syn__2064_(
	.A(\tc2.IM [24]),
	.B(\tc2.DM [14]),
	.C(\tc2.IM [14]),
	.D(syn__0535_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0547_),
	.Cout(),
	.Q());
defparam syn__2064_.coord_x = 11;
defparam syn__2064_.coord_y = 1;
defparam syn__2064_.coord_z = 2;
defparam syn__2064_.mask = 16'h135F;
defparam syn__2064_.modeMux = 1'b0;
defparam syn__2064_.FeedbackMux = 1'b0;
defparam syn__2064_.ShiftMux = 1'b0;
defparam syn__2064_.BypassEn = 1'b0;
defparam syn__2064_.CarryEnb = 1'b1;

alta_slice syn__2065_(
	.A(vcc),
	.B(syn__0548_),
	.C(syn__0724_),
	.D(syn__0798_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc2.WD [13]),
	.Cout(),
	.Q());
defparam syn__2065_.coord_x = 9;
defparam syn__2065_.coord_y = 3;
defparam syn__2065_.coord_z = 4;
defparam syn__2065_.mask = 16'h3F33;
defparam syn__2065_.modeMux = 1'b0;
defparam syn__2065_.FeedbackMux = 1'b0;
defparam syn__2065_.ShiftMux = 1'b0;
defparam syn__2065_.BypassEn = 1'b0;
defparam syn__2065_.CarryEnb = 1'b1;

alta_slice syn__2066_(
	.A(\tc2.IM [13]),
	.B(syn__0535_),
	.C(\tc2.IM [24]),
	.D(\tc2.DM [13]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0548_),
	.Cout(),
	.Q());
defparam syn__2066_.coord_x = 9;
defparam syn__2066_.coord_y = 3;
defparam syn__2066_.coord_z = 5;
defparam syn__2066_.mask = 16'h135F;
defparam syn__2066_.modeMux = 1'b0;
defparam syn__2066_.FeedbackMux = 1'b0;
defparam syn__2066_.ShiftMux = 1'b0;
defparam syn__2066_.BypassEn = 1'b0;
defparam syn__2066_.CarryEnb = 1'b1;

alta_slice syn__2067_(
	.A(vcc),
	.B(syn__0549_),
	.C(syn__0197_),
	.D(syn__0798_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc2.WD [12]),
	.Cout(),
	.Q());
defparam syn__2067_.coord_x = 11;
defparam syn__2067_.coord_y = 1;
defparam syn__2067_.coord_z = 15;
defparam syn__2067_.mask = 16'h3F33;
defparam syn__2067_.modeMux = 1'b0;
defparam syn__2067_.FeedbackMux = 1'b0;
defparam syn__2067_.ShiftMux = 1'b0;
defparam syn__2067_.BypassEn = 1'b0;
defparam syn__2067_.CarryEnb = 1'b1;

alta_slice syn__2068_(
	.A(\tc2.IM [24]),
	.B(\tc2.IM [12]),
	.C(\tc2.DM [12]),
	.D(syn__0535_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0549_),
	.Cout(),
	.Q());
defparam syn__2068_.coord_x = 11;
defparam syn__2068_.coord_y = 1;
defparam syn__2068_.coord_z = 14;
defparam syn__2068_.mask = 16'h0777;
defparam syn__2068_.modeMux = 1'b0;
defparam syn__2068_.FeedbackMux = 1'b0;
defparam syn__2068_.ShiftMux = 1'b0;
defparam syn__2068_.BypassEn = 1'b0;
defparam syn__2068_.CarryEnb = 1'b1;

alta_slice syn__2069_(
	.A(syn__0190_),
	.B(vcc),
	.C(syn__0798_),
	.D(syn__0550_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc2.WD [11]),
	.Cout(),
	.Q());
defparam syn__2069_.coord_x = 6;
defparam syn__2069_.coord_y = 4;
defparam syn__2069_.coord_z = 10;
defparam syn__2069_.mask = 16'h50FF;
defparam syn__2069_.modeMux = 1'b0;
defparam syn__2069_.FeedbackMux = 1'b0;
defparam syn__2069_.ShiftMux = 1'b0;
defparam syn__2069_.BypassEn = 1'b0;
defparam syn__2069_.CarryEnb = 1'b1;

alta_slice syn__2070_(
	.A(syn__0535_),
	.B(\tc2.DM [11]),
	.C(\tc2.IM [24]),
	.D(\tc2.IM [11]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0550_),
	.Cout(),
	.Q());
defparam syn__2070_.coord_x = 6;
defparam syn__2070_.coord_y = 4;
defparam syn__2070_.coord_z = 11;
defparam syn__2070_.mask = 16'h0777;
defparam syn__2070_.modeMux = 1'b0;
defparam syn__2070_.FeedbackMux = 1'b0;
defparam syn__2070_.ShiftMux = 1'b0;
defparam syn__2070_.BypassEn = 1'b0;
defparam syn__2070_.CarryEnb = 1'b1;

alta_slice syn__2071_(
	.A(vcc),
	.B(syn__0684_),
	.C(syn__0551_),
	.D(syn__0798_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc2.WD [10]),
	.Cout(),
	.Q());
defparam syn__2071_.coord_x = 11;
defparam syn__2071_.coord_y = 1;
defparam syn__2071_.coord_z = 0;
defparam syn__2071_.mask = 16'h3F0F;
defparam syn__2071_.modeMux = 1'b0;
defparam syn__2071_.FeedbackMux = 1'b0;
defparam syn__2071_.ShiftMux = 1'b0;
defparam syn__2071_.BypassEn = 1'b0;
defparam syn__2071_.CarryEnb = 1'b1;

alta_slice syn__2072_(
	.A(\tc2.IM [10]),
	.B(syn__0535_),
	.C(\tc2.IM [24]),
	.D(\tc2.DM [10]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0551_),
	.Cout(),
	.Q());
defparam syn__2072_.coord_x = 11;
defparam syn__2072_.coord_y = 1;
defparam syn__2072_.coord_z = 1;
defparam syn__2072_.mask = 16'h135F;
defparam syn__2072_.modeMux = 1'b0;
defparam syn__2072_.FeedbackMux = 1'b0;
defparam syn__2072_.ShiftMux = 1'b0;
defparam syn__2072_.BypassEn = 1'b0;
defparam syn__2072_.CarryEnb = 1'b1;

alta_slice syn__2073_(
	.A(vcc),
	.B(syn__0124_),
	.C(syn__0552_),
	.D(syn__0798_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc2.WD [9]),
	.Cout(),
	.Q());
defparam syn__2073_.coord_x = 9;
defparam syn__2073_.coord_y = 4;
defparam syn__2073_.coord_z = 15;
defparam syn__2073_.mask = 16'h3F0F;
defparam syn__2073_.modeMux = 1'b0;
defparam syn__2073_.FeedbackMux = 1'b0;
defparam syn__2073_.ShiftMux = 1'b0;
defparam syn__2073_.BypassEn = 1'b0;
defparam syn__2073_.CarryEnb = 1'b1;

alta_slice syn__2074_(
	.A(\tc2.DM [9]),
	.B(syn__0535_),
	.C(\tc2.IM [24]),
	.D(\tc2.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0552_),
	.Cout(),
	.Q());
defparam syn__2074_.coord_x = 9;
defparam syn__2074_.coord_y = 4;
defparam syn__2074_.coord_z = 6;
defparam syn__2074_.mask = 16'h0777;
defparam syn__2074_.modeMux = 1'b0;
defparam syn__2074_.FeedbackMux = 1'b0;
defparam syn__2074_.ShiftMux = 1'b0;
defparam syn__2074_.BypassEn = 1'b0;
defparam syn__2074_.CarryEnb = 1'b1;

alta_slice syn__2075_(
	.A(syn__0553_),
	.B(vcc),
	.C(syn__0133_),
	.D(syn__0798_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc2.WD [8]),
	.Cout(),
	.Q());
defparam syn__2075_.coord_x = 9;
defparam syn__2075_.coord_y = 3;
defparam syn__2075_.coord_z = 15;
defparam syn__2075_.mask = 16'h5F55;
defparam syn__2075_.modeMux = 1'b0;
defparam syn__2075_.FeedbackMux = 1'b0;
defparam syn__2075_.ShiftMux = 1'b0;
defparam syn__2075_.BypassEn = 1'b0;
defparam syn__2075_.CarryEnb = 1'b1;

alta_slice syn__2076_(
	.A(\tc2.IM [8]),
	.B(\tc2.IM [24]),
	.C(\tc2.DM [8]),
	.D(syn__0535_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0553_),
	.Cout(),
	.Q());
defparam syn__2076_.coord_x = 9;
defparam syn__2076_.coord_y = 3;
defparam syn__2076_.coord_z = 12;
defparam syn__2076_.mask = 16'h0777;
defparam syn__2076_.modeMux = 1'b0;
defparam syn__2076_.FeedbackMux = 1'b0;
defparam syn__2076_.ShiftMux = 1'b0;
defparam syn__2076_.BypassEn = 1'b0;
defparam syn__2076_.CarryEnb = 1'b1;

alta_slice syn__2077_(
	.A(vcc),
	.B(syn__0554_),
	.C(syn__0698_),
	.D(syn__0798_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc2.WD [7]),
	.Cout(),
	.Q());
defparam syn__2077_.coord_x = 9;
defparam syn__2077_.coord_y = 3;
defparam syn__2077_.coord_z = 6;
defparam syn__2077_.mask = 16'h3F33;
defparam syn__2077_.modeMux = 1'b0;
defparam syn__2077_.FeedbackMux = 1'b0;
defparam syn__2077_.ShiftMux = 1'b0;
defparam syn__2077_.BypassEn = 1'b0;
defparam syn__2077_.CarryEnb = 1'b1;

alta_slice syn__2078_(
	.A(syn__0535_),
	.B(\tc2.IM [7]),
	.C(\tc2.IM [24]),
	.D(\tc2.DM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0554_),
	.Cout(),
	.Q());
defparam syn__2078_.coord_x = 9;
defparam syn__2078_.coord_y = 3;
defparam syn__2078_.coord_z = 7;
defparam syn__2078_.mask = 16'h153F;
defparam syn__2078_.modeMux = 1'b0;
defparam syn__2078_.FeedbackMux = 1'b0;
defparam syn__2078_.ShiftMux = 1'b0;
defparam syn__2078_.BypassEn = 1'b0;
defparam syn__2078_.CarryEnb = 1'b1;

alta_slice syn__2079_(
	.A(syn__0555_),
	.B(syn__0798_),
	.C(syn__0151_),
	.D(syn__0556_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc2.WD [6]),
	.Cout(),
	.Q());
defparam syn__2079_.coord_x = 11;
defparam syn__2079_.coord_y = 1;
defparam syn__2079_.coord_z = 4;
defparam syn__2079_.mask = 16'hAEFF;
defparam syn__2079_.modeMux = 1'b0;
defparam syn__2079_.FeedbackMux = 1'b0;
defparam syn__2079_.ShiftMux = 1'b0;
defparam syn__2079_.BypassEn = 1'b0;
defparam syn__2079_.CarryEnb = 1'b1;

alta_slice syn__2080_(
	.A(syn__0223_),
	.B(\tc2.PC [0]),
	.C(syn__0233_),
	.D(\tc2.PC [6]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0555_),
	.Cout(),
	.Q());
defparam syn__2080_.coord_x = 12;
defparam syn__2080_.coord_y = 3;
defparam syn__2080_.coord_z = 1;
defparam syn__2080_.mask = 16'h2A80;
defparam syn__2080_.modeMux = 1'b0;
defparam syn__2080_.FeedbackMux = 1'b0;
defparam syn__2080_.ShiftMux = 1'b0;
defparam syn__2080_.BypassEn = 1'b0;
defparam syn__2080_.CarryEnb = 1'b1;

alta_slice syn__2081_(
	.A(\tc2.IM [24]),
	.B(\tc2.DM [6]),
	.C(\tc2.IM [6]),
	.D(syn__0535_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0556_),
	.Cout(),
	.Q());
defparam syn__2081_.coord_x = 11;
defparam syn__2081_.coord_y = 1;
defparam syn__2081_.coord_z = 9;
defparam syn__2081_.mask = 16'h135F;
defparam syn__2081_.modeMux = 1'b0;
defparam syn__2081_.FeedbackMux = 1'b0;
defparam syn__2081_.ShiftMux = 1'b0;
defparam syn__2081_.BypassEn = 1'b0;
defparam syn__2081_.CarryEnb = 1'b1;

alta_slice syn__2082_(
	.A(syn__0557_),
	.B(syn__0558_),
	.C(syn__0160_),
	.D(syn__0798_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc2.WD [5]),
	.Cout(),
	.Q());
defparam syn__2082_.coord_x = 11;
defparam syn__2082_.coord_y = 1;
defparam syn__2082_.coord_z = 5;
defparam syn__2082_.mask = 16'hBFBB;
defparam syn__2082_.modeMux = 1'b0;
defparam syn__2082_.FeedbackMux = 1'b0;
defparam syn__2082_.ShiftMux = 1'b0;
defparam syn__2082_.BypassEn = 1'b0;
defparam syn__2082_.CarryEnb = 1'b1;

alta_slice syn__2083_(
	.A(syn__0231_),
	.B(syn__0223_),
	.C(\tc2.PC [5]),
	.D(\tc2.PC [0]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0557_),
	.Cout(),
	.Q());
defparam syn__2083_.coord_x = 12;
defparam syn__2083_.coord_y = 3;
defparam syn__2083_.coord_z = 4;
defparam syn__2083_.mask = 16'h48C0;
defparam syn__2083_.modeMux = 1'b0;
defparam syn__2083_.FeedbackMux = 1'b0;
defparam syn__2083_.ShiftMux = 1'b0;
defparam syn__2083_.BypassEn = 1'b0;
defparam syn__2083_.CarryEnb = 1'b1;

alta_slice syn__2084_(
	.A(\tc2.IM [24]),
	.B(\tc2.DM [5]),
	.C(\tc2.IM [5]),
	.D(syn__0535_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0558_),
	.Cout(),
	.Q());
defparam syn__2084_.coord_x = 11;
defparam syn__2084_.coord_y = 1;
defparam syn__2084_.coord_z = 13;
defparam syn__2084_.mask = 16'h135F;
defparam syn__2084_.modeMux = 1'b0;
defparam syn__2084_.FeedbackMux = 1'b0;
defparam syn__2084_.ShiftMux = 1'b0;
defparam syn__2084_.BypassEn = 1'b0;
defparam syn__2084_.CarryEnb = 1'b1;

alta_slice syn__2085_(
	.A(syn__0559_),
	.B(syn__0561_),
	.C(syn__0708_),
	.D(syn__0798_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc2.WD [4]),
	.Cout(),
	.Q());
defparam syn__2085_.coord_x = 11;
defparam syn__2085_.coord_y = 3;
defparam syn__2085_.coord_z = 3;
defparam syn__2085_.mask = 16'hBFBB;
defparam syn__2085_.modeMux = 1'b0;
defparam syn__2085_.FeedbackMux = 1'b0;
defparam syn__2085_.ShiftMux = 1'b0;
defparam syn__2085_.BypassEn = 1'b0;
defparam syn__2085_.CarryEnb = 1'b1;

alta_slice syn__2086_(
	.A(\tc2.PC [4]),
	.B(\tc2.PC [3]),
	.C(syn__0223_),
	.D(syn__0560_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0559_),
	.Cout(),
	.Q());
defparam syn__2086_.coord_x = 11;
defparam syn__2086_.coord_y = 3;
defparam syn__2086_.coord_z = 10;
defparam syn__2086_.mask = 16'h60A0;
defparam syn__2086_.modeMux = 1'b0;
defparam syn__2086_.FeedbackMux = 1'b0;
defparam syn__2086_.ShiftMux = 1'b0;
defparam syn__2086_.BypassEn = 1'b0;
defparam syn__2086_.CarryEnb = 1'b1;

alta_slice syn__2087_(
	.A(vcc),
	.B(vcc),
	.C(syn__0227_),
	.D(\tc2.PC [0]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0560_),
	.Cout(),
	.Q());
defparam syn__2087_.coord_x = 12;
defparam syn__2087_.coord_y = 3;
defparam syn__2087_.coord_z = 3;
defparam syn__2087_.mask = 16'hF000;
defparam syn__2087_.modeMux = 1'b0;
defparam syn__2087_.FeedbackMux = 1'b0;
defparam syn__2087_.ShiftMux = 1'b0;
defparam syn__2087_.BypassEn = 1'b0;
defparam syn__2087_.CarryEnb = 1'b1;

alta_slice syn__2088_(
	.A(\tc2.DM [4]),
	.B(\tc2.IM [24]),
	.C(syn__0535_),
	.D(\tc2.IM [4]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0561_),
	.Cout(),
	.Q());
defparam syn__2088_.coord_x = 11;
defparam syn__2088_.coord_y = 4;
defparam syn__2088_.coord_z = 14;
defparam syn__2088_.mask = 16'h135F;
defparam syn__2088_.modeMux = 1'b0;
defparam syn__2088_.FeedbackMux = 1'b0;
defparam syn__2088_.ShiftMux = 1'b0;
defparam syn__2088_.BypassEn = 1'b0;
defparam syn__2088_.CarryEnb = 1'b1;

alta_slice syn__2089_(
	.A(syn__0562_),
	.B(vcc),
	.C(syn__0169_),
	.D(syn__0798_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc2.WD [3]),
	.Cout(),
	.Q());
defparam syn__2089_.coord_x = 11;
defparam syn__2089_.coord_y = 3;
defparam syn__2089_.coord_z = 0;
defparam syn__2089_.mask = 16'h5F55;
defparam syn__2089_.modeMux = 1'b0;
defparam syn__2089_.FeedbackMux = 1'b0;
defparam syn__2089_.ShiftMux = 1'b0;
defparam syn__2089_.BypassEn = 1'b0;
defparam syn__2089_.CarryEnb = 1'b1;

alta_slice syn__2090_(
	.A(syn__0223_),
	.B(syn__0563_),
	.C(\tc2.PC [3]),
	.D(syn__0560_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0562_),
	.Cout(),
	.Q());
defparam syn__2090_.coord_x = 11;
defparam syn__2090_.coord_y = 3;
defparam syn__2090_.coord_z = 4;
defparam syn__2090_.mask = 16'hC44C;
defparam syn__2090_.modeMux = 1'b0;
defparam syn__2090_.FeedbackMux = 1'b0;
defparam syn__2090_.ShiftMux = 1'b0;
defparam syn__2090_.BypassEn = 1'b0;
defparam syn__2090_.CarryEnb = 1'b1;

alta_slice syn__2091_(
	.A(\tc2.IM [3]),
	.B(\tc2.IM [24]),
	.C(syn__0535_),
	.D(\tc2.DM [3]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0563_),
	.Cout(),
	.Q());
defparam syn__2091_.coord_x = 11;
defparam syn__2091_.coord_y = 4;
defparam syn__2091_.coord_z = 8;
defparam syn__2091_.mask = 16'h0777;
defparam syn__2091_.modeMux = 1'b0;
defparam syn__2091_.FeedbackMux = 1'b0;
defparam syn__2091_.ShiftMux = 1'b0;
defparam syn__2091_.BypassEn = 1'b0;
defparam syn__2091_.CarryEnb = 1'b1;

alta_slice syn__2092_(
	.A(syn__0535_),
	.B(vcc),
	.C(\tc2.DM [2]),
	.D(syn__0564_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc2.WD [2]),
	.Cout(),
	.Q());
defparam syn__2092_.coord_x = 6;
defparam syn__2092_.coord_y = 6;
defparam syn__2092_.coord_z = 14;
defparam syn__2092_.mask = 16'hA0FF;
defparam syn__2092_.modeMux = 1'b0;
defparam syn__2092_.FeedbackMux = 1'b0;
defparam syn__2092_.ShiftMux = 1'b0;
defparam syn__2092_.BypassEn = 1'b0;
defparam syn__2092_.CarryEnb = 1'b1;

alta_slice syn__2093_(
	.A(\tc2.IM [24]),
	.B(syn__0565_),
	.C(syn__0172_),
	.D(\tc2.IM [2]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0564_),
	.Cout(),
	.Q());
defparam syn__2093_.coord_x = 11;
defparam syn__2093_.coord_y = 3;
defparam syn__2093_.coord_z = 7;
defparam syn__2093_.mask = 16'h1132;
defparam syn__2093_.modeMux = 1'b0;
defparam syn__2093_.FeedbackMux = 1'b0;
defparam syn__2093_.ShiftMux = 1'b0;
defparam syn__2093_.BypassEn = 1'b0;
defparam syn__2093_.CarryEnb = 1'b1;

alta_slice syn__2094_(
	.A(\tc2.PC [2]),
	.B(\tc2.PC [0]),
	.C(syn__0223_),
	.D(\tc2.PC [1]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0565_),
	.Cout(),
	.Q());
defparam syn__2094_.coord_x = 12;
defparam syn__2094_.coord_y = 3;
defparam syn__2094_.coord_z = 13;
defparam syn__2094_.mask = 16'h60A0;
defparam syn__2094_.modeMux = 1'b0;
defparam syn__2094_.FeedbackMux = 1'b0;
defparam syn__2094_.ShiftMux = 1'b0;
defparam syn__2094_.BypassEn = 1'b0;
defparam syn__2094_.CarryEnb = 1'b1;

alta_slice syn__2095_(
	.A(syn__0566_),
	.B(syn__0567_),
	.C(syn__0176_),
	.D(syn__0798_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc2.WD [1]),
	.Cout(),
	.Q());
defparam syn__2095_.coord_x = 11;
defparam syn__2095_.coord_y = 4;
defparam syn__2095_.coord_z = 12;
defparam syn__2095_.mask = 16'hBFBB;
defparam syn__2095_.modeMux = 1'b0;
defparam syn__2095_.FeedbackMux = 1'b0;
defparam syn__2095_.ShiftMux = 1'b0;
defparam syn__2095_.BypassEn = 1'b0;
defparam syn__2095_.CarryEnb = 1'b1;

alta_slice syn__2096_(
	.A(vcc),
	.B(\tc2.PC [1]),
	.C(syn__0223_),
	.D(\tc2.PC [0]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0566_),
	.Cout(),
	.Q());
defparam syn__2096_.coord_x = 12;
defparam syn__2096_.coord_y = 3;
defparam syn__2096_.coord_z = 8;
defparam syn__2096_.mask = 16'h30C0;
defparam syn__2096_.modeMux = 1'b0;
defparam syn__2096_.FeedbackMux = 1'b0;
defparam syn__2096_.ShiftMux = 1'b0;
defparam syn__2096_.BypassEn = 1'b0;
defparam syn__2096_.CarryEnb = 1'b1;

alta_slice syn__2097_(
	.A(\tc2.IM [1]),
	.B(\tc2.IM [24]),
	.C(syn__0535_),
	.D(\tc2.DM [1]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0567_),
	.Cout(),
	.Q());
defparam syn__2097_.coord_x = 11;
defparam syn__2097_.coord_y = 4;
defparam syn__2097_.coord_z = 11;
defparam syn__2097_.mask = 16'h0777;
defparam syn__2097_.modeMux = 1'b0;
defparam syn__2097_.FeedbackMux = 1'b0;
defparam syn__2097_.ShiftMux = 1'b0;
defparam syn__2097_.BypassEn = 1'b0;
defparam syn__2097_.CarryEnb = 1'b1;

alta_slice syn__2098_(
	.A(syn__0180_),
	.B(vcc),
	.C(syn__0568_),
	.D(syn__0798_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc2.WD [0]),
	.Cout(),
	.Q());
defparam syn__2098_.coord_x = 11;
defparam syn__2098_.coord_y = 1;
defparam syn__2098_.coord_z = 11;
defparam syn__2098_.mask = 16'h5F0F;
defparam syn__2098_.modeMux = 1'b0;
defparam syn__2098_.FeedbackMux = 1'b0;
defparam syn__2098_.ShiftMux = 1'b0;
defparam syn__2098_.BypassEn = 1'b0;
defparam syn__2098_.CarryEnb = 1'b1;

alta_slice syn__2099_(
	.A(\tc2.DM [0]),
	.B(syn__0535_),
	.C(vcc),
	.D(syn__0569_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0568_),
	.Cout(),
	.Q());
defparam syn__2099_.coord_x = 11;
defparam syn__2099_.coord_y = 1;
defparam syn__2099_.coord_z = 12;
defparam syn__2099_.mask = 16'h7700;
defparam syn__2099_.modeMux = 1'b0;
defparam syn__2099_.FeedbackMux = 1'b0;
defparam syn__2099_.ShiftMux = 1'b0;
defparam syn__2099_.BypassEn = 1'b0;
defparam syn__2099_.CarryEnb = 1'b1;

alta_slice syn__2100_(
	.A(\tc2.IM [24]),
	.B(syn__0223_),
	.C(\tc2.IM [0]),
	.D(\tc2.PC [0]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0569_),
	.Cout(),
	.Q());
defparam syn__2100_.coord_x = 12;
defparam syn__2100_.coord_y = 3;
defparam syn__2100_.coord_z = 9;
defparam syn__2100_.mask = 16'h5F13;
defparam syn__2100_.modeMux = 1'b0;
defparam syn__2100_.FeedbackMux = 1'b0;
defparam syn__2100_.ShiftMux = 1'b0;
defparam syn__2100_.BypassEn = 1'b0;
defparam syn__2100_.CarryEnb = 1'b1;

alta_slice syn__2101_(
	.A(vcc),
	.B(\tc2.IM [0]),
	.C(\tc2.IM [1]),
	.D(syn__0798_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc2.WriteDM ),
	.Cout(),
	.Q());
defparam syn__2101_.coord_x = 11;
defparam syn__2101_.coord_y = 4;
defparam syn__2101_.coord_z = 10;
defparam syn__2101_.mask = 16'h3000;
defparam syn__2101_.modeMux = 1'b0;
defparam syn__2101_.FeedbackMux = 1'b0;
defparam syn__2101_.ShiftMux = 1'b0;
defparam syn__2101_.BypassEn = 1'b0;
defparam syn__2101_.CarryEnb = 1'b1;

alta_slice syn__2102_(
	.A(vcc),
	.B(\tc2.IM [0]),
	.C(\tc2.IM [1]),
	.D(syn__0798_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc2.WriteIM ),
	.Cout(),
	.Q());
defparam syn__2102_.coord_x = 11;
defparam syn__2102_.coord_y = 4;
defparam syn__2102_.coord_z = 5;
defparam syn__2102_.mask = 16'h0C00;
defparam syn__2102_.modeMux = 1'b0;
defparam syn__2102_.FeedbackMux = 1'b0;
defparam syn__2102_.ShiftMux = 1'b0;
defparam syn__2102_.BypassEn = 1'b0;
defparam syn__2102_.CarryEnb = 1'b1;

alta_slice syn__2103_(
	.A(syn__0236_),
	.B(\tc3.DM [31]),
	.C(syn__0787_),
	.D(syn__0570_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc3.WD [31]),
	.Cout(),
	.Q());
defparam syn__2103_.coord_x = 2;
defparam syn__2103_.coord_y = 6;
defparam syn__2103_.coord_z = 11;
defparam syn__2103_.mask = 16'hDC50;
defparam syn__2103_.modeMux = 1'b0;
defparam syn__2103_.FeedbackMux = 1'b0;
defparam syn__2103_.ShiftMux = 1'b0;
defparam syn__2103_.BypassEn = 1'b0;
defparam syn__2103_.CarryEnb = 1'b1;

alta_slice syn__2104_(
	.A(\tc3.IM [24]),
	.B(\tc3.IM [1]),
	.C(\tc3.IM [2]),
	.D(\tc3.IM [0]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0570_),
	.Cout(),
	.Q());
defparam syn__2104_.coord_x = 2;
defparam syn__2104_.coord_y = 6;
defparam syn__2104_.coord_z = 4;
defparam syn__2104_.mask = 16'h0010;
defparam syn__2104_.modeMux = 1'b0;
defparam syn__2104_.FeedbackMux = 1'b0;
defparam syn__2104_.ShiftMux = 1'b0;
defparam syn__2104_.BypassEn = 1'b0;
defparam syn__2104_.CarryEnb = 1'b1;

alta_slice syn__2105_(
	.A(syn__0570_),
	.B(\tc3.DM [30]),
	.C(syn__0780_),
	.D(syn__0787_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc3.WD [30]),
	.Cout(),
	.Q());
defparam syn__2105_.coord_x = 2;
defparam syn__2105_.coord_y = 8;
defparam syn__2105_.coord_z = 8;
defparam syn__2105_.mask = 16'h8F88;
defparam syn__2105_.modeMux = 1'b0;
defparam syn__2105_.FeedbackMux = 1'b0;
defparam syn__2105_.ShiftMux = 1'b0;
defparam syn__2105_.BypassEn = 1'b0;
defparam syn__2105_.CarryEnb = 1'b1;

alta_slice syn__2106_(
	.A(\tc3.DM [29]),
	.B(syn__0473_),
	.C(syn__0570_),
	.D(syn__0787_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc3.WD [29]),
	.Cout(),
	.Q());
defparam syn__2106_.coord_x = 2;
defparam syn__2106_.coord_y = 8;
defparam syn__2106_.coord_z = 7;
defparam syn__2106_.mask = 16'hB3A0;
defparam syn__2106_.modeMux = 1'b0;
defparam syn__2106_.FeedbackMux = 1'b0;
defparam syn__2106_.ShiftMux = 1'b0;
defparam syn__2106_.BypassEn = 1'b0;
defparam syn__2106_.CarryEnb = 1'b1;

alta_slice syn__2107_(
	.A(\tc3.DM [28]),
	.B(syn__0778_),
	.C(syn__0570_),
	.D(syn__0787_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc3.WD [28]),
	.Cout(),
	.Q());
defparam syn__2107_.coord_x = 2;
defparam syn__2107_.coord_y = 8;
defparam syn__2107_.coord_z = 6;
defparam syn__2107_.mask = 16'hB3A0;
defparam syn__2107_.modeMux = 1'b0;
defparam syn__2107_.FeedbackMux = 1'b0;
defparam syn__2107_.ShiftMux = 1'b0;
defparam syn__2107_.BypassEn = 1'b0;
defparam syn__2107_.CarryEnb = 1'b1;

alta_slice syn__2108_(
	.A(vcc),
	.B(\tc3.DM [27]),
	.C(syn__0570_),
	.D(syn__0571_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc3.WD [27]),
	.Cout(),
	.Q());
defparam syn__2108_.coord_x = 2;
defparam syn__2108_.coord_y = 8;
defparam syn__2108_.coord_z = 10;
defparam syn__2108_.mask = 16'hFFC0;
defparam syn__2108_.modeMux = 1'b0;
defparam syn__2108_.FeedbackMux = 1'b0;
defparam syn__2108_.ShiftMux = 1'b0;
defparam syn__2108_.BypassEn = 1'b0;
defparam syn__2108_.CarryEnb = 1'b1;

alta_slice syn__2109_(
	.A(vcc),
	.B(syn__0459_),
	.C(syn__0776_),
	.D(syn__0787_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0571_),
	.Cout(),
	.Q());
defparam syn__2109_.coord_x = 2;
defparam syn__2109_.coord_y = 4;
defparam syn__2109_.coord_z = 3;
defparam syn__2109_.mask = 16'hCF00;
defparam syn__2109_.modeMux = 1'b0;
defparam syn__2109_.FeedbackMux = 1'b0;
defparam syn__2109_.ShiftMux = 1'b0;
defparam syn__2109_.BypassEn = 1'b0;
defparam syn__2109_.CarryEnb = 1'b1;

alta_slice syn__2110_(
	.A(\tc3.DM [26]),
	.B(syn__0570_),
	.C(syn__0448_),
	.D(syn__0787_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc3.WD [26]),
	.Cout(),
	.Q());
defparam syn__2110_.coord_x = 0;
defparam syn__2110_.coord_y = 5;
defparam syn__2110_.coord_z = 0;
defparam syn__2110_.mask = 16'h8F88;
defparam syn__2110_.modeMux = 1'b0;
defparam syn__2110_.FeedbackMux = 1'b0;
defparam syn__2110_.ShiftMux = 1'b0;
defparam syn__2110_.BypassEn = 1'b0;
defparam syn__2110_.CarryEnb = 1'b1;

alta_slice syn__2111_(
	.A(vcc),
	.B(\tc3.DM [25]),
	.C(syn__0570_),
	.D(syn__0572_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc3.WD [25]),
	.Cout(),
	.Q());
defparam syn__2111_.coord_x = 2;
defparam syn__2111_.coord_y = 8;
defparam syn__2111_.coord_z = 15;
defparam syn__2111_.mask = 16'hFFC0;
defparam syn__2111_.modeMux = 1'b0;
defparam syn__2111_.FeedbackMux = 1'b0;
defparam syn__2111_.ShiftMux = 1'b0;
defparam syn__2111_.BypassEn = 1'b0;
defparam syn__2111_.CarryEnb = 1'b1;

alta_slice syn__2112_(
	.A(syn__0442_),
	.B(syn__0441_),
	.C(syn__0446_),
	.D(syn__0787_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0572_),
	.Cout(),
	.Q());
defparam syn__2112_.coord_x = 2;
defparam syn__2112_.coord_y = 8;
defparam syn__2112_.coord_z = 14;
defparam syn__2112_.mask = 16'hFD00;
defparam syn__2112_.modeMux = 1'b0;
defparam syn__2112_.FeedbackMux = 1'b0;
defparam syn__2112_.ShiftMux = 1'b0;
defparam syn__2112_.BypassEn = 1'b0;
defparam syn__2112_.CarryEnb = 1'b1;

alta_slice syn__2113_(
	.A(\tc3.DM [24]),
	.B(syn__0772_),
	.C(syn__0570_),
	.D(syn__0787_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc3.WD [24]),
	.Cout(),
	.Q());
defparam syn__2113_.coord_x = 2;
defparam syn__2113_.coord_y = 5;
defparam syn__2113_.coord_z = 7;
defparam syn__2113_.mask = 16'hB3A0;
defparam syn__2113_.modeMux = 1'b0;
defparam syn__2113_.FeedbackMux = 1'b0;
defparam syn__2113_.ShiftMux = 1'b0;
defparam syn__2113_.BypassEn = 1'b0;
defparam syn__2113_.CarryEnb = 1'b1;

alta_slice syn__2114_(
	.A(syn__0573_),
	.B(vcc),
	.C(syn__0484_),
	.D(syn__0787_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc3.WD [23]),
	.Cout(),
	.Q());
defparam syn__2114_.coord_x = 2;
defparam syn__2114_.coord_y = 7;
defparam syn__2114_.coord_z = 11;
defparam syn__2114_.mask = 16'h5F55;
defparam syn__2114_.modeMux = 1'b0;
defparam syn__2114_.FeedbackMux = 1'b0;
defparam syn__2114_.ShiftMux = 1'b0;
defparam syn__2114_.BypassEn = 1'b0;
defparam syn__2114_.CarryEnb = 1'b1;

alta_slice syn__2115_(
	.A(\tc3.IM [23]),
	.B(\tc3.IM [24]),
	.C(syn__0570_),
	.D(\tc3.DM [23]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0573_),
	.Cout(),
	.Q());
defparam syn__2115_.coord_x = 2;
defparam syn__2115_.coord_y = 7;
defparam syn__2115_.coord_z = 2;
defparam syn__2115_.mask = 16'h0777;
defparam syn__2115_.modeMux = 1'b0;
defparam syn__2115_.FeedbackMux = 1'b0;
defparam syn__2115_.ShiftMux = 1'b0;
defparam syn__2115_.BypassEn = 1'b0;
defparam syn__2115_.CarryEnb = 1'b1;

alta_slice syn__2116_(
	.A(vcc),
	.B(syn__0574_),
	.C(syn__0476_),
	.D(syn__0787_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc3.WD [22]),
	.Cout(),
	.Q());
defparam syn__2116_.coord_x = 2;
defparam syn__2116_.coord_y = 7;
defparam syn__2116_.coord_z = 9;
defparam syn__2116_.mask = 16'h3F33;
defparam syn__2116_.modeMux = 1'b0;
defparam syn__2116_.FeedbackMux = 1'b0;
defparam syn__2116_.ShiftMux = 1'b0;
defparam syn__2116_.BypassEn = 1'b0;
defparam syn__2116_.CarryEnb = 1'b1;

alta_slice syn__2117_(
	.A(\tc3.IM [22]),
	.B(\tc3.IM [24]),
	.C(syn__0570_),
	.D(\tc3.DM [22]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0574_),
	.Cout(),
	.Q());
defparam syn__2117_.coord_x = 2;
defparam syn__2117_.coord_y = 7;
defparam syn__2117_.coord_z = 8;
defparam syn__2117_.mask = 16'h0777;
defparam syn__2117_.modeMux = 1'b0;
defparam syn__2117_.FeedbackMux = 1'b0;
defparam syn__2117_.ShiftMux = 1'b0;
defparam syn__2117_.BypassEn = 1'b0;
defparam syn__2117_.CarryEnb = 1'b1;

alta_slice syn__2118_(
	.A(vcc),
	.B(syn__0575_),
	.C(syn__0463_),
	.D(syn__0787_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc3.WD [21]),
	.Cout(),
	.Q());
defparam syn__2118_.coord_x = 2;
defparam syn__2118_.coord_y = 8;
defparam syn__2118_.coord_z = 12;
defparam syn__2118_.mask = 16'h3F33;
defparam syn__2118_.modeMux = 1'b0;
defparam syn__2118_.FeedbackMux = 1'b0;
defparam syn__2118_.ShiftMux = 1'b0;
defparam syn__2118_.BypassEn = 1'b0;
defparam syn__2118_.CarryEnb = 1'b1;

alta_slice syn__2119_(
	.A(\tc3.IM [21]),
	.B(\tc3.IM [24]),
	.C(syn__0570_),
	.D(\tc3.DM [21]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0575_),
	.Cout(),
	.Q());
defparam syn__2119_.coord_x = 2;
defparam syn__2119_.coord_y = 8;
defparam syn__2119_.coord_z = 13;
defparam syn__2119_.mask = 16'h0777;
defparam syn__2119_.modeMux = 1'b0;
defparam syn__2119_.FeedbackMux = 1'b0;
defparam syn__2119_.ShiftMux = 1'b0;
defparam syn__2119_.BypassEn = 1'b0;
defparam syn__2119_.CarryEnb = 1'b1;

alta_slice syn__2120_(
	.A(syn__0787_),
	.B(syn__0461_),
	.C(syn__0460_),
	.D(syn__0576_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc3.WD [20]),
	.Cout(),
	.Q());
defparam syn__2120_.coord_x = 2;
defparam syn__2120_.coord_y = 4;
defparam syn__2120_.coord_z = 0;
defparam syn__2120_.mask = 16'hA2FF;
defparam syn__2120_.modeMux = 1'b0;
defparam syn__2120_.FeedbackMux = 1'b0;
defparam syn__2120_.ShiftMux = 1'b0;
defparam syn__2120_.BypassEn = 1'b0;
defparam syn__2120_.CarryEnb = 1'b1;

alta_slice syn__2121_(
	.A(\tc3.IM [20]),
	.B(\tc3.IM [24]),
	.C(syn__0570_),
	.D(\tc3.DM [20]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0576_),
	.Cout(),
	.Q());
defparam syn__2121_.coord_x = 2;
defparam syn__2121_.coord_y = 4;
defparam syn__2121_.coord_z = 7;
defparam syn__2121_.mask = 16'h0777;
defparam syn__2121_.modeMux = 1'b0;
defparam syn__2121_.FeedbackMux = 1'b0;
defparam syn__2121_.ShiftMux = 1'b0;
defparam syn__2121_.BypassEn = 1'b0;
defparam syn__2121_.CarryEnb = 1'b1;

alta_slice syn__2122_(
	.A(syn__0577_),
	.B(vcc),
	.C(syn__0354_),
	.D(syn__0787_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc3.WD [19]),
	.Cout(),
	.Q());
defparam syn__2122_.coord_x = 2;
defparam syn__2122_.coord_y = 5;
defparam syn__2122_.coord_z = 2;
defparam syn__2122_.mask = 16'h5F55;
defparam syn__2122_.modeMux = 1'b0;
defparam syn__2122_.FeedbackMux = 1'b0;
defparam syn__2122_.ShiftMux = 1'b0;
defparam syn__2122_.BypassEn = 1'b0;
defparam syn__2122_.CarryEnb = 1'b1;

alta_slice syn__2123_(
	.A(\tc3.IM [19]),
	.B(\tc3.IM [24]),
	.C(syn__0570_),
	.D(\tc3.DM [19]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0577_),
	.Cout(),
	.Q());
defparam syn__2123_.coord_x = 2;
defparam syn__2123_.coord_y = 5;
defparam syn__2123_.coord_z = 10;
defparam syn__2123_.mask = 16'h0777;
defparam syn__2123_.modeMux = 1'b0;
defparam syn__2123_.FeedbackMux = 1'b0;
defparam syn__2123_.ShiftMux = 1'b0;
defparam syn__2123_.BypassEn = 1'b0;
defparam syn__2123_.CarryEnb = 1'b1;

alta_slice syn__2124_(
	.A(syn__0578_),
	.B(vcc),
	.C(syn__0443_),
	.D(syn__0787_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc3.WD [18]),
	.Cout(),
	.Q());
defparam syn__2124_.coord_x = 2;
defparam syn__2124_.coord_y = 5;
defparam syn__2124_.coord_z = 13;
defparam syn__2124_.mask = 16'h5F55;
defparam syn__2124_.modeMux = 1'b0;
defparam syn__2124_.FeedbackMux = 1'b0;
defparam syn__2124_.ShiftMux = 1'b0;
defparam syn__2124_.BypassEn = 1'b0;
defparam syn__2124_.CarryEnb = 1'b1;

alta_slice syn__2125_(
	.A(\tc3.IM [18]),
	.B(\tc3.IM [24]),
	.C(syn__0570_),
	.D(\tc3.DM [18]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0578_),
	.Cout(),
	.Q());
defparam syn__2125_.coord_x = 2;
defparam syn__2125_.coord_y = 5;
defparam syn__2125_.coord_z = 0;
defparam syn__2125_.mask = 16'h0777;
defparam syn__2125_.modeMux = 1'b0;
defparam syn__2125_.FeedbackMux = 1'b0;
defparam syn__2125_.ShiftMux = 1'b0;
defparam syn__2125_.BypassEn = 1'b0;
defparam syn__2125_.CarryEnb = 1'b1;

alta_slice syn__2126_(
	.A(vcc),
	.B(syn__0770_),
	.C(syn__0579_),
	.D(syn__0787_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc3.WD [17]),
	.Cout(),
	.Q());
defparam syn__2126_.coord_x = 2;
defparam syn__2126_.coord_y = 8;
defparam syn__2126_.coord_z = 3;
defparam syn__2126_.mask = 16'h3F0F;
defparam syn__2126_.modeMux = 1'b0;
defparam syn__2126_.FeedbackMux = 1'b0;
defparam syn__2126_.ShiftMux = 1'b0;
defparam syn__2126_.BypassEn = 1'b0;
defparam syn__2126_.CarryEnb = 1'b1;

alta_slice syn__2127_(
	.A(\tc3.DM [17]),
	.B(\tc3.IM [24]),
	.C(syn__0570_),
	.D(\tc3.IM [17]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0579_),
	.Cout(),
	.Q());
defparam syn__2127_.coord_x = 2;
defparam syn__2127_.coord_y = 8;
defparam syn__2127_.coord_z = 4;
defparam syn__2127_.mask = 16'h135F;
defparam syn__2127_.modeMux = 1'b0;
defparam syn__2127_.FeedbackMux = 1'b0;
defparam syn__2127_.ShiftMux = 1'b0;
defparam syn__2127_.BypassEn = 1'b0;
defparam syn__2127_.CarryEnb = 1'b1;

alta_slice syn__2128_(
	.A(vcc),
	.B(syn__0397_),
	.C(syn__0580_),
	.D(syn__0787_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc3.WD [16]),
	.Cout(),
	.Q());
defparam syn__2128_.coord_x = 2;
defparam syn__2128_.coord_y = 5;
defparam syn__2128_.coord_z = 4;
defparam syn__2128_.mask = 16'h3F0F;
defparam syn__2128_.modeMux = 1'b0;
defparam syn__2128_.FeedbackMux = 1'b0;
defparam syn__2128_.ShiftMux = 1'b0;
defparam syn__2128_.BypassEn = 1'b0;
defparam syn__2128_.CarryEnb = 1'b1;

alta_slice syn__2129_(
	.A(\tc3.IM [24]),
	.B(\tc3.DM [16]),
	.C(syn__0570_),
	.D(\tc3.IM [16]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0580_),
	.Cout(),
	.Q());
defparam syn__2129_.coord_x = 2;
defparam syn__2129_.coord_y = 5;
defparam syn__2129_.coord_z = 5;
defparam syn__2129_.mask = 16'h153F;
defparam syn__2129_.modeMux = 1'b0;
defparam syn__2129_.FeedbackMux = 1'b0;
defparam syn__2129_.ShiftMux = 1'b0;
defparam syn__2129_.BypassEn = 1'b0;
defparam syn__2129_.CarryEnb = 1'b1;

alta_slice syn__2130_(
	.A(vcc),
	.B(syn__0581_),
	.C(syn__0481_),
	.D(syn__0787_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc3.WD [15]),
	.Cout(),
	.Q());
defparam syn__2130_.coord_x = 2;
defparam syn__2130_.coord_y = 7;
defparam syn__2130_.coord_z = 6;
defparam syn__2130_.mask = 16'h3F33;
defparam syn__2130_.modeMux = 1'b0;
defparam syn__2130_.FeedbackMux = 1'b0;
defparam syn__2130_.ShiftMux = 1'b0;
defparam syn__2130_.BypassEn = 1'b0;
defparam syn__2130_.CarryEnb = 1'b1;

alta_slice syn__2131_(
	.A(syn__0570_),
	.B(\tc3.IM [15]),
	.C(\tc3.IM [24]),
	.D(\tc3.DM [15]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0581_),
	.Cout(),
	.Q());
defparam syn__2131_.coord_x = 2;
defparam syn__2131_.coord_y = 7;
defparam syn__2131_.coord_z = 7;
defparam syn__2131_.mask = 16'h153F;
defparam syn__2131_.modeMux = 1'b0;
defparam syn__2131_.FeedbackMux = 1'b0;
defparam syn__2131_.ShiftMux = 1'b0;
defparam syn__2131_.BypassEn = 1'b0;
defparam syn__2131_.CarryEnb = 1'b1;

alta_slice syn__2132_(
	.A(vcc),
	.B(syn__0582_),
	.C(syn__0467_),
	.D(syn__0787_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc3.WD [14]),
	.Cout(),
	.Q());
defparam syn__2132_.coord_x = 2;
defparam syn__2132_.coord_y = 8;
defparam syn__2132_.coord_z = 0;
defparam syn__2132_.mask = 16'h3F33;
defparam syn__2132_.modeMux = 1'b0;
defparam syn__2132_.FeedbackMux = 1'b0;
defparam syn__2132_.ShiftMux = 1'b0;
defparam syn__2132_.BypassEn = 1'b0;
defparam syn__2132_.CarryEnb = 1'b1;

alta_slice syn__2133_(
	.A(syn__0570_),
	.B(\tc3.IM [14]),
	.C(\tc3.IM [24]),
	.D(\tc3.DM [14]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0582_),
	.Cout(),
	.Q());
defparam syn__2133_.coord_x = 2;
defparam syn__2133_.coord_y = 8;
defparam syn__2133_.coord_z = 1;
defparam syn__2133_.mask = 16'h153F;
defparam syn__2133_.modeMux = 1'b0;
defparam syn__2133_.FeedbackMux = 1'b0;
defparam syn__2133_.ShiftMux = 1'b0;
defparam syn__2133_.BypassEn = 1'b0;
defparam syn__2133_.CarryEnb = 1'b1;

alta_slice syn__2134_(
	.A(syn__0583_),
	.B(vcc),
	.C(syn__0339_),
	.D(syn__0787_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc3.WD [13]),
	.Cout(),
	.Q());
defparam syn__2134_.coord_x = 2;
defparam syn__2134_.coord_y = 5;
defparam syn__2134_.coord_z = 9;
defparam syn__2134_.mask = 16'h5F55;
defparam syn__2134_.modeMux = 1'b0;
defparam syn__2134_.FeedbackMux = 1'b0;
defparam syn__2134_.ShiftMux = 1'b0;
defparam syn__2134_.BypassEn = 1'b0;
defparam syn__2134_.CarryEnb = 1'b1;

alta_slice syn__2135_(
	.A(\tc3.IM [24]),
	.B(\tc3.IM [13]),
	.C(syn__0570_),
	.D(\tc3.DM [13]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0583_),
	.Cout(),
	.Q());
defparam syn__2135_.coord_x = 2;
defparam syn__2135_.coord_y = 5;
defparam syn__2135_.coord_z = 12;
defparam syn__2135_.mask = 16'h0777;
defparam syn__2135_.modeMux = 1'b0;
defparam syn__2135_.FeedbackMux = 1'b0;
defparam syn__2135_.ShiftMux = 1'b0;
defparam syn__2135_.BypassEn = 1'b0;
defparam syn__2135_.CarryEnb = 1'b1;

alta_slice syn__2136_(
	.A(syn__0584_),
	.B(vcc),
	.C(syn__0774_),
	.D(syn__0787_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc3.WD [12]),
	.Cout(),
	.Q());
defparam syn__2136_.coord_x = 2;
defparam syn__2136_.coord_y = 8;
defparam syn__2136_.coord_z = 5;
defparam syn__2136_.mask = 16'h5F55;
defparam syn__2136_.modeMux = 1'b0;
defparam syn__2136_.FeedbackMux = 1'b0;
defparam syn__2136_.ShiftMux = 1'b0;
defparam syn__2136_.BypassEn = 1'b0;
defparam syn__2136_.CarryEnb = 1'b1;

alta_slice syn__2137_(
	.A(syn__0570_),
	.B(\tc3.IM [24]),
	.C(\tc3.DM [12]),
	.D(\tc3.IM [12]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0584_),
	.Cout(),
	.Q());
defparam syn__2137_.coord_x = 2;
defparam syn__2137_.coord_y = 8;
defparam syn__2137_.coord_z = 2;
defparam syn__2137_.mask = 16'h135F;
defparam syn__2137_.modeMux = 1'b0;
defparam syn__2137_.FeedbackMux = 1'b0;
defparam syn__2137_.ShiftMux = 1'b0;
defparam syn__2137_.BypassEn = 1'b0;
defparam syn__2137_.CarryEnb = 1'b1;

alta_slice syn__2138_(
	.A(syn__0585_),
	.B(vcc),
	.C(syn__0451_),
	.D(syn__0787_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc3.WD [11]),
	.Cout(),
	.Q());
defparam syn__2138_.coord_x = 2;
defparam syn__2138_.coord_y = 5;
defparam syn__2138_.coord_z = 1;
defparam syn__2138_.mask = 16'h5F55;
defparam syn__2138_.modeMux = 1'b0;
defparam syn__2138_.FeedbackMux = 1'b0;
defparam syn__2138_.ShiftMux = 1'b0;
defparam syn__2138_.BypassEn = 1'b0;
defparam syn__2138_.CarryEnb = 1'b1;

alta_slice syn__2139_(
	.A(syn__0570_),
	.B(\tc3.IM [24]),
	.C(\tc3.DM [11]),
	.D(\tc3.IM [11]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0585_),
	.Cout(),
	.Q());
defparam syn__2139_.coord_x = 2;
defparam syn__2139_.coord_y = 5;
defparam syn__2139_.coord_z = 6;
defparam syn__2139_.mask = 16'h135F;
defparam syn__2139_.modeMux = 1'b0;
defparam syn__2139_.FeedbackMux = 1'b0;
defparam syn__2139_.ShiftMux = 1'b0;
defparam syn__2139_.BypassEn = 1'b0;
defparam syn__2139_.CarryEnb = 1'b1;

alta_slice syn__2140_(
	.A(syn__0586_),
	.B(vcc),
	.C(syn__0365_),
	.D(syn__0787_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc3.WD [10]),
	.Cout(),
	.Q());
defparam syn__2140_.coord_x = 2;
defparam syn__2140_.coord_y = 5;
defparam syn__2140_.coord_z = 3;
defparam syn__2140_.mask = 16'h5F55;
defparam syn__2140_.modeMux = 1'b0;
defparam syn__2140_.FeedbackMux = 1'b0;
defparam syn__2140_.ShiftMux = 1'b0;
defparam syn__2140_.BypassEn = 1'b0;
defparam syn__2140_.CarryEnb = 1'b1;

alta_slice syn__2141_(
	.A(syn__0570_),
	.B(\tc3.IM [10]),
	.C(\tc3.IM [24]),
	.D(\tc3.DM [10]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0586_),
	.Cout(),
	.Q());
defparam syn__2141_.coord_x = 2;
defparam syn__2141_.coord_y = 5;
defparam syn__2141_.coord_z = 8;
defparam syn__2141_.mask = 16'h153F;
defparam syn__2141_.modeMux = 1'b0;
defparam syn__2141_.FeedbackMux = 1'b0;
defparam syn__2141_.ShiftMux = 1'b0;
defparam syn__2141_.BypassEn = 1'b0;
defparam syn__2141_.CarryEnb = 1'b1;

alta_slice syn__2142_(
	.A(vcc),
	.B(syn__0587_),
	.C(syn__0376_),
	.D(syn__0787_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc3.WD [9]),
	.Cout(),
	.Q());
defparam syn__2142_.coord_x = 2;
defparam syn__2142_.coord_y = 4;
defparam syn__2142_.coord_z = 4;
defparam syn__2142_.mask = 16'h3F33;
defparam syn__2142_.modeMux = 1'b0;
defparam syn__2142_.FeedbackMux = 1'b0;
defparam syn__2142_.ShiftMux = 1'b0;
defparam syn__2142_.BypassEn = 1'b0;
defparam syn__2142_.CarryEnb = 1'b1;

alta_slice syn__2143_(
	.A(\tc3.IM [24]),
	.B(\tc3.DM [9]),
	.C(syn__0570_),
	.D(\tc3.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0587_),
	.Cout(),
	.Q());
defparam syn__2143_.coord_x = 2;
defparam syn__2143_.coord_y = 5;
defparam syn__2143_.coord_z = 11;
defparam syn__2143_.mask = 16'h153F;
defparam syn__2143_.modeMux = 1'b0;
defparam syn__2143_.FeedbackMux = 1'b0;
defparam syn__2143_.ShiftMux = 1'b0;
defparam syn__2143_.BypassEn = 1'b0;
defparam syn__2143_.CarryEnb = 1'b1;

alta_slice syn__2144_(
	.A(vcc),
	.B(syn__0588_),
	.C(syn__0385_),
	.D(syn__0787_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc3.WD [8]),
	.Cout(),
	.Q());
defparam syn__2144_.coord_x = 2;
defparam syn__2144_.coord_y = 5;
defparam syn__2144_.coord_z = 15;
defparam syn__2144_.mask = 16'h3F33;
defparam syn__2144_.modeMux = 1'b0;
defparam syn__2144_.FeedbackMux = 1'b0;
defparam syn__2144_.ShiftMux = 1'b0;
defparam syn__2144_.BypassEn = 1'b0;
defparam syn__2144_.CarryEnb = 1'b1;

alta_slice syn__2145_(
	.A(\tc3.IM [8]),
	.B(\tc3.IM [24]),
	.C(\tc3.DM [8]),
	.D(syn__0570_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0588_),
	.Cout(),
	.Q());
defparam syn__2145_.coord_x = 2;
defparam syn__2145_.coord_y = 5;
defparam syn__2145_.coord_z = 14;
defparam syn__2145_.mask = 16'h0777;
defparam syn__2145_.modeMux = 1'b0;
defparam syn__2145_.FeedbackMux = 1'b0;
defparam syn__2145_.ShiftMux = 1'b0;
defparam syn__2145_.BypassEn = 1'b0;
defparam syn__2145_.CarryEnb = 1'b1;

alta_slice syn__2146_(
	.A(vcc),
	.B(syn__0401_),
	.C(syn__0589_),
	.D(syn__0787_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc3.WD [7]),
	.Cout(),
	.Q());
defparam syn__2146_.coord_x = 2;
defparam syn__2146_.coord_y = 7;
defparam syn__2146_.coord_z = 3;
defparam syn__2146_.mask = 16'h3F0F;
defparam syn__2146_.modeMux = 1'b0;
defparam syn__2146_.FeedbackMux = 1'b0;
defparam syn__2146_.ShiftMux = 1'b0;
defparam syn__2146_.BypassEn = 1'b0;
defparam syn__2146_.CarryEnb = 1'b1;

alta_slice syn__2147_(
	.A(syn__0570_),
	.B(\tc3.IM [24]),
	.C(\tc3.IM [7]),
	.D(\tc3.DM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0589_),
	.Cout(),
	.Q());
defparam syn__2147_.coord_x = 2;
defparam syn__2147_.coord_y = 7;
defparam syn__2147_.coord_z = 14;
defparam syn__2147_.mask = 16'h153F;
defparam syn__2147_.modeMux = 1'b0;
defparam syn__2147_.FeedbackMux = 1'b0;
defparam syn__2147_.ShiftMux = 1'b0;
defparam syn__2147_.BypassEn = 1'b0;
defparam syn__2147_.CarryEnb = 1'b1;

alta_slice syn__2148_(
	.A(syn__0590_),
	.B(syn__0408_),
	.C(syn__0591_),
	.D(syn__0787_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc3.WD [6]),
	.Cout(),
	.Q());
defparam syn__2148_.coord_x = 1;
defparam syn__2148_.coord_y = 7;
defparam syn__2148_.coord_z = 3;
defparam syn__2148_.mask = 16'hBFAF;
defparam syn__2148_.modeMux = 1'b0;
defparam syn__2148_.FeedbackMux = 1'b0;
defparam syn__2148_.ShiftMux = 1'b0;
defparam syn__2148_.BypassEn = 1'b0;
defparam syn__2148_.CarryEnb = 1'b1;

alta_slice syn__2149_(
	.A(syn__0497_),
	.B(\tc3.PC [6]),
	.C(\tc3.PC [0]),
	.D(syn__0488_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0590_),
	.Cout(),
	.Q());
defparam syn__2149_.coord_x = 1;
defparam syn__2149_.coord_y = 8;
defparam syn__2149_.coord_z = 3;
defparam syn__2149_.mask = 16'h6C00;
defparam syn__2149_.modeMux = 1'b0;
defparam syn__2149_.FeedbackMux = 1'b0;
defparam syn__2149_.ShiftMux = 1'b0;
defparam syn__2149_.BypassEn = 1'b0;
defparam syn__2149_.CarryEnb = 1'b1;

alta_slice syn__2150_(
	.A(\tc3.IM [24]),
	.B(\tc3.DM [6]),
	.C(syn__0570_),
	.D(\tc3.IM [6]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0591_),
	.Cout(),
	.Q());
defparam syn__2150_.coord_x = 4;
defparam syn__2150_.coord_y = 8;
defparam syn__2150_.coord_z = 2;
defparam syn__2150_.mask = 16'h153F;
defparam syn__2150_.modeMux = 1'b0;
defparam syn__2150_.FeedbackMux = 1'b0;
defparam syn__2150_.ShiftMux = 1'b0;
defparam syn__2150_.BypassEn = 1'b0;
defparam syn__2150_.CarryEnb = 1'b1;

alta_slice syn__2151_(
	.A(syn__0592_),
	.B(vcc),
	.C(syn__0415_),
	.D(syn__0787_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc3.WD [5]),
	.Cout(),
	.Q());
defparam syn__2151_.coord_x = 0;
defparam syn__2151_.coord_y = 8;
defparam syn__2151_.coord_z = 5;
defparam syn__2151_.mask = 16'h5F55;
defparam syn__2151_.modeMux = 1'b0;
defparam syn__2151_.FeedbackMux = 1'b0;
defparam syn__2151_.ShiftMux = 1'b0;
defparam syn__2151_.BypassEn = 1'b0;
defparam syn__2151_.CarryEnb = 1'b1;

alta_slice syn__2152_(
	.A(vcc),
	.B(syn__0593_),
	.C(syn__0594_),
	.D(syn__0488_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0592_),
	.Cout(),
	.Q());
defparam syn__2152_.coord_x = 0;
defparam syn__2152_.coord_y = 8;
defparam syn__2152_.coord_z = 10;
defparam syn__2152_.mask = 16'h30F0;
defparam syn__2152_.modeMux = 1'b0;
defparam syn__2152_.FeedbackMux = 1'b0;
defparam syn__2152_.ShiftMux = 1'b0;
defparam syn__2152_.BypassEn = 1'b0;
defparam syn__2152_.CarryEnb = 1'b1;

alta_slice syn__2153_(
	.A(vcc),
	.B(\tc3.PC [5]),
	.C(syn__0495_),
	.D(\tc3.PC [0]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0593_),
	.Cout(),
	.Q());
defparam syn__2153_.coord_x = 1;
defparam syn__2153_.coord_y = 8;
defparam syn__2153_.coord_z = 1;
defparam syn__2153_.mask = 16'h3CCC;
defparam syn__2153_.modeMux = 1'b0;
defparam syn__2153_.FeedbackMux = 1'b0;
defparam syn__2153_.ShiftMux = 1'b0;
defparam syn__2153_.BypassEn = 1'b0;
defparam syn__2153_.CarryEnb = 1'b1;

alta_slice syn__2154_(
	.A(\tc3.IM [24]),
	.B(\tc3.IM [5]),
	.C(\tc3.DM [5]),
	.D(syn__0570_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0594_),
	.Cout(),
	.Q());
defparam syn__2154_.coord_x = 1;
defparam syn__2154_.coord_y = 5;
defparam syn__2154_.coord_z = 7;
defparam syn__2154_.mask = 16'h0777;
defparam syn__2154_.modeMux = 1'b0;
defparam syn__2154_.FeedbackMux = 1'b0;
defparam syn__2154_.ShiftMux = 1'b0;
defparam syn__2154_.BypassEn = 1'b0;
defparam syn__2154_.CarryEnb = 1'b1;

alta_slice syn__2155_(
	.A(syn__0595_),
	.B(syn__0420_),
	.C(syn__0597_),
	.D(syn__0787_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc3.WD [4]),
	.Cout(),
	.Q());
defparam syn__2155_.coord_x = 0;
defparam syn__2155_.coord_y = 8;
defparam syn__2155_.coord_z = 11;
defparam syn__2155_.mask = 16'hBFAF;
defparam syn__2155_.modeMux = 1'b0;
defparam syn__2155_.FeedbackMux = 1'b0;
defparam syn__2155_.ShiftMux = 1'b0;
defparam syn__2155_.BypassEn = 1'b0;
defparam syn__2155_.CarryEnb = 1'b1;

alta_slice syn__2156_(
	.A(\tc3.PC [4]),
	.B(\tc3.PC [3]),
	.C(syn__0596_),
	.D(syn__0488_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0595_),
	.Cout(),
	.Q());
defparam syn__2156_.coord_x = 0;
defparam syn__2156_.coord_y = 8;
defparam syn__2156_.coord_z = 0;
defparam syn__2156_.mask = 16'h6A00;
defparam syn__2156_.modeMux = 1'b0;
defparam syn__2156_.FeedbackMux = 1'b0;
defparam syn__2156_.ShiftMux = 1'b0;
defparam syn__2156_.BypassEn = 1'b0;
defparam syn__2156_.CarryEnb = 1'b1;

alta_slice syn__2157_(
	.A(vcc),
	.B(\tc3.PC [2]),
	.C(\tc3.PC [0]),
	.D(\tc3.PC [1]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0596_),
	.Cout(),
	.Q());
defparam syn__2157_.coord_x = 1;
defparam syn__2157_.coord_y = 8;
defparam syn__2157_.coord_z = 11;
defparam syn__2157_.mask = 16'hC000;
defparam syn__2157_.modeMux = 1'b0;
defparam syn__2157_.FeedbackMux = 1'b0;
defparam syn__2157_.ShiftMux = 1'b0;
defparam syn__2157_.BypassEn = 1'b0;
defparam syn__2157_.CarryEnb = 1'b1;

alta_slice syn__2158_(
	.A(syn__0570_),
	.B(\tc3.IM [4]),
	.C(\tc3.IM [24]),
	.D(\tc3.DM [4]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0597_),
	.Cout(),
	.Q());
defparam syn__2158_.coord_x = 4;
defparam syn__2158_.coord_y = 8;
defparam syn__2158_.coord_z = 11;
defparam syn__2158_.mask = 16'h153F;
defparam syn__2158_.modeMux = 1'b0;
defparam syn__2158_.FeedbackMux = 1'b0;
defparam syn__2158_.ShiftMux = 1'b0;
defparam syn__2158_.BypassEn = 1'b0;
defparam syn__2158_.CarryEnb = 1'b1;

alta_slice syn__2159_(
	.A(vcc),
	.B(syn__0598_),
	.C(syn__0426_),
	.D(syn__0787_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc3.WD [3]),
	.Cout(),
	.Q());
defparam syn__2159_.coord_x = 0;
defparam syn__2159_.coord_y = 8;
defparam syn__2159_.coord_z = 12;
defparam syn__2159_.mask = 16'h3F33;
defparam syn__2159_.modeMux = 1'b0;
defparam syn__2159_.FeedbackMux = 1'b0;
defparam syn__2159_.ShiftMux = 1'b0;
defparam syn__2159_.BypassEn = 1'b0;
defparam syn__2159_.CarryEnb = 1'b1;

alta_slice syn__2160_(
	.A(syn__0599_),
	.B(\tc3.PC [3]),
	.C(syn__0596_),
	.D(syn__0488_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0598_),
	.Cout(),
	.Q());
defparam syn__2160_.coord_x = 0;
defparam syn__2160_.coord_y = 8;
defparam syn__2160_.coord_z = 13;
defparam syn__2160_.mask = 16'h82AA;
defparam syn__2160_.modeMux = 1'b0;
defparam syn__2160_.FeedbackMux = 1'b0;
defparam syn__2160_.ShiftMux = 1'b0;
defparam syn__2160_.BypassEn = 1'b0;
defparam syn__2160_.CarryEnb = 1'b1;

alta_slice syn__2161_(
	.A(syn__0570_),
	.B(\tc3.IM [24]),
	.C(\tc3.DM [3]),
	.D(\tc3.IM [3]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0599_),
	.Cout(),
	.Q());
defparam syn__2161_.coord_x = 2;
defparam syn__2161_.coord_y = 7;
defparam syn__2161_.coord_z = 4;
defparam syn__2161_.mask = 16'h135F;
defparam syn__2161_.modeMux = 1'b0;
defparam syn__2161_.FeedbackMux = 1'b0;
defparam syn__2161_.ShiftMux = 1'b0;
defparam syn__2161_.BypassEn = 1'b0;
defparam syn__2161_.CarryEnb = 1'b1;

alta_slice syn__2162_(
	.A(syn__0600_),
	.B(vcc),
	.C(syn__0570_),
	.D(\tc3.DM [2]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc3.WD [2]),
	.Cout(),
	.Q());
defparam syn__2162_.coord_x = 2;
defparam syn__2162_.coord_y = 7;
defparam syn__2162_.coord_z = 15;
defparam syn__2162_.mask = 16'hF555;
defparam syn__2162_.modeMux = 1'b0;
defparam syn__2162_.FeedbackMux = 1'b0;
defparam syn__2162_.ShiftMux = 1'b0;
defparam syn__2162_.BypassEn = 1'b0;
defparam syn__2162_.CarryEnb = 1'b1;

alta_slice syn__2163_(
	.A(\tc3.IM [24]),
	.B(syn__0429_),
	.C(syn__0601_),
	.D(\tc3.IM [2]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0600_),
	.Cout(),
	.Q());
defparam syn__2163_.coord_x = 2;
defparam syn__2163_.coord_y = 7;
defparam syn__2163_.coord_z = 12;
defparam syn__2163_.mask = 16'h050E;
defparam syn__2163_.modeMux = 1'b0;
defparam syn__2163_.FeedbackMux = 1'b0;
defparam syn__2163_.ShiftMux = 1'b0;
defparam syn__2163_.BypassEn = 1'b0;
defparam syn__2163_.CarryEnb = 1'b1;

alta_slice syn__2164_(
	.A(\tc3.PC [2]),
	.B(\tc3.PC [1]),
	.C(\tc3.PC [0]),
	.D(syn__0488_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0601_),
	.Cout(),
	.Q());
defparam syn__2164_.coord_x = 1;
defparam syn__2164_.coord_y = 8;
defparam syn__2164_.coord_z = 5;
defparam syn__2164_.mask = 16'h6A00;
defparam syn__2164_.modeMux = 1'b0;
defparam syn__2164_.FeedbackMux = 1'b0;
defparam syn__2164_.ShiftMux = 1'b0;
defparam syn__2164_.BypassEn = 1'b0;
defparam syn__2164_.CarryEnb = 1'b1;

alta_slice syn__2165_(
	.A(vcc),
	.B(syn__0602_),
	.C(syn__0433_),
	.D(syn__0787_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc3.WD [1]),
	.Cout(),
	.Q());
defparam syn__2165_.coord_x = 2;
defparam syn__2165_.coord_y = 7;
defparam syn__2165_.coord_z = 5;
defparam syn__2165_.mask = 16'h3F33;
defparam syn__2165_.modeMux = 1'b0;
defparam syn__2165_.FeedbackMux = 1'b0;
defparam syn__2165_.ShiftMux = 1'b0;
defparam syn__2165_.BypassEn = 1'b0;
defparam syn__2165_.CarryEnb = 1'b1;

alta_slice syn__2166_(
	.A(\tc3.IM [1]),
	.B(\tc3.IM [24]),
	.C(vcc),
	.D(syn__0603_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0602_),
	.Cout(),
	.Q());
defparam syn__2166_.coord_x = 2;
defparam syn__2166_.coord_y = 6;
defparam syn__2166_.coord_z = 7;
defparam syn__2166_.mask = 16'h7700;
defparam syn__2166_.modeMux = 1'b0;
defparam syn__2166_.FeedbackMux = 1'b0;
defparam syn__2166_.ShiftMux = 1'b0;
defparam syn__2166_.BypassEn = 1'b0;
defparam syn__2166_.CarryEnb = 1'b1;

alta_slice syn__2167_(
	.A(syn__0570_),
	.B(vcc),
	.C(\tc3.DM [1]),
	.D(syn__0604_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0603_),
	.Cout(),
	.Q());
defparam syn__2167_.coord_x = 4;
defparam syn__2167_.coord_y = 8;
defparam syn__2167_.coord_z = 8;
defparam syn__2167_.mask = 16'h005F;
defparam syn__2167_.modeMux = 1'b0;
defparam syn__2167_.FeedbackMux = 1'b0;
defparam syn__2167_.ShiftMux = 1'b0;
defparam syn__2167_.BypassEn = 1'b0;
defparam syn__2167_.CarryEnb = 1'b1;

alta_slice syn__2168_(
	.A(vcc),
	.B(\tc3.PC [1]),
	.C(\tc3.PC [0]),
	.D(syn__0488_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0604_),
	.Cout(),
	.Q());
defparam syn__2168_.coord_x = 1;
defparam syn__2168_.coord_y = 8;
defparam syn__2168_.coord_z = 15;
defparam syn__2168_.mask = 16'h3C00;
defparam syn__2168_.modeMux = 1'b0;
defparam syn__2168_.FeedbackMux = 1'b0;
defparam syn__2168_.ShiftMux = 1'b0;
defparam syn__2168_.BypassEn = 1'b0;
defparam syn__2168_.CarryEnb = 1'b1;

alta_slice syn__2169_(
	.A(syn__0605_),
	.B(vcc),
	.C(syn__0437_),
	.D(syn__0787_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc3.WD [0]),
	.Cout(),
	.Q());
defparam syn__2169_.coord_x = 2;
defparam syn__2169_.coord_y = 7;
defparam syn__2169_.coord_z = 0;
defparam syn__2169_.mask = 16'h5F55;
defparam syn__2169_.modeMux = 1'b0;
defparam syn__2169_.FeedbackMux = 1'b0;
defparam syn__2169_.ShiftMux = 1'b0;
defparam syn__2169_.BypassEn = 1'b0;
defparam syn__2169_.CarryEnb = 1'b1;

alta_slice syn__2170_(
	.A(syn__0570_),
	.B(vcc),
	.C(syn__0606_),
	.D(\tc3.DM [0]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0605_),
	.Cout(),
	.Q());
defparam syn__2170_.coord_x = 2;
defparam syn__2170_.coord_y = 7;
defparam syn__2170_.coord_z = 10;
defparam syn__2170_.mask = 16'h50F0;
defparam syn__2170_.modeMux = 1'b0;
defparam syn__2170_.FeedbackMux = 1'b0;
defparam syn__2170_.ShiftMux = 1'b0;
defparam syn__2170_.BypassEn = 1'b0;
defparam syn__2170_.CarryEnb = 1'b1;

alta_slice syn__2171_(
	.A(\tc3.IM [24]),
	.B(\tc3.IM [0]),
	.C(\tc3.PC [0]),
	.D(syn__0488_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0606_),
	.Cout(),
	.Q());
defparam syn__2171_.coord_x = 1;
defparam syn__2171_.coord_y = 8;
defparam syn__2171_.coord_z = 13;
defparam syn__2171_.mask = 16'h7077;
defparam syn__2171_.modeMux = 1'b0;
defparam syn__2171_.FeedbackMux = 1'b0;
defparam syn__2171_.ShiftMux = 1'b0;
defparam syn__2171_.BypassEn = 1'b0;
defparam syn__2171_.CarryEnb = 1'b1;

alta_slice syn__2172_(
	.A(vcc),
	.B(\tc3.IM [1]),
	.C(syn__0787_),
	.D(\tc3.IM [0]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc3.WriteDM ),
	.Cout(),
	.Q());
defparam syn__2172_.coord_x = 2;
defparam syn__2172_.coord_y = 6;
defparam syn__2172_.coord_z = 14;
defparam syn__2172_.mask = 16'h00C0;
defparam syn__2172_.modeMux = 1'b0;
defparam syn__2172_.FeedbackMux = 1'b0;
defparam syn__2172_.ShiftMux = 1'b0;
defparam syn__2172_.BypassEn = 1'b0;
defparam syn__2172_.CarryEnb = 1'b1;

alta_slice syn__2173_(
	.A(\tc3.IM [1]),
	.B(vcc),
	.C(syn__0787_),
	.D(\tc3.IM [0]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc3.WriteIM ),
	.Cout(),
	.Q());
defparam syn__2173_.coord_x = 2;
defparam syn__2173_.coord_y = 6;
defparam syn__2173_.coord_z = 15;
defparam syn__2173_.mask = 16'h5000;
defparam syn__2173_.modeMux = 1'b0;
defparam syn__2173_.FeedbackMux = 1'b0;
defparam syn__2173_.ShiftMux = 1'b0;
defparam syn__2173_.BypassEn = 1'b0;
defparam syn__2173_.CarryEnb = 1'b1;

alta_slice syn__2174_(
	.A(\tc1.IM [7]),
	.B(IOvalue1[6]),
	.C(\tc1.IM [8]),
	.D(IOaddr1[6]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0607_),
	.Cout(),
	.Q());
defparam syn__2174_.coord_x = 12;
defparam syn__2174_.coord_y = 5;
defparam syn__2174_.coord_z = 12;
defparam syn__2174_.mask = 16'h2E88;
defparam syn__2174_.modeMux = 1'b0;
defparam syn__2174_.FeedbackMux = 1'b0;
defparam syn__2174_.ShiftMux = 1'b0;
defparam syn__2174_.BypassEn = 1'b0;
defparam syn__2174_.CarryEnb = 1'b1;

alta_slice syn__2175_(
	.A(vcc),
	.B(syn__0607_),
	.C(syn__0920_),
	.D(\tc1.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0608_),
	.Cout(),
	.Q());
defparam syn__2175_.coord_x = 11;
defparam syn__2175_.coord_y = 7;
defparam syn__2175_.coord_z = 6;
defparam syn__2175_.mask = 16'h030F;
defparam syn__2175_.modeMux = 1'b0;
defparam syn__2175_.FeedbackMux = 1'b0;
defparam syn__2175_.ShiftMux = 1'b0;
defparam syn__2175_.BypassEn = 1'b0;
defparam syn__2175_.CarryEnb = 1'b1;

alta_slice syn__2176_(
	.A(IOaddr1[13]),
	.B(IOvalue1[13]),
	.C(\tc1.IM [7]),
	.D(\tc1.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0609_),
	.Cout(),
	.Q());
defparam syn__2176_.coord_x = 7;
defparam syn__2176_.coord_y = 5;
defparam syn__2176_.coord_z = 0;
defparam syn__2176_.mask = 16'h9F17;
defparam syn__2176_.modeMux = 1'b0;
defparam syn__2176_.FeedbackMux = 1'b0;
defparam syn__2176_.ShiftMux = 1'b0;
defparam syn__2176_.BypassEn = 1'b0;
defparam syn__2176_.CarryEnb = 1'b1;

alta_slice syn__2177_(
	.A(syn__0609_),
	.B(syn__0836_),
	.C(syn__0931_),
	.D(\tc1.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0610_),
	.Cout(),
	.Q());
defparam syn__2177_.coord_x = 7;
defparam syn__2177_.coord_y = 5;
defparam syn__2177_.coord_z = 7;
defparam syn__2177_.mask = 16'hAA3C;
defparam syn__2177_.modeMux = 1'b0;
defparam syn__2177_.FeedbackMux = 1'b0;
defparam syn__2177_.ShiftMux = 1'b0;
defparam syn__2177_.BypassEn = 1'b0;
defparam syn__2177_.CarryEnb = 1'b1;

alta_slice syn__2178_(
	.A(IOaddr1[5]),
	.B(\tc1.IM [8]),
	.C(\tc1.IM [7]),
	.D(IOvalue1[5]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0611_),
	.Cout(),
	.Q());
defparam syn__2178_.coord_x = 12;
defparam syn__2178_.coord_y = 6;
defparam syn__2178_.coord_z = 12;
defparam syn__2178_.mask = 16'h8D5F;
defparam syn__2178_.modeMux = 1'b0;
defparam syn__2178_.FeedbackMux = 1'b0;
defparam syn__2178_.ShiftMux = 1'b0;
defparam syn__2178_.BypassEn = 1'b0;
defparam syn__2178_.CarryEnb = 1'b1;

alta_slice syn__2179_(
	.A(syn__0611_),
	.B(syn__0932_),
	.C(syn__0933_),
	.D(\tc1.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0612_),
	.Cout(),
	.Q());
defparam syn__2179_.coord_x = 12;
defparam syn__2179_.coord_y = 6;
defparam syn__2179_.coord_z = 13;
defparam syn__2179_.mask = 16'hAA3C;
defparam syn__2179_.modeMux = 1'b0;
defparam syn__2179_.FeedbackMux = 1'b0;
defparam syn__2179_.ShiftMux = 1'b0;
defparam syn__2179_.BypassEn = 1'b0;
defparam syn__2179_.CarryEnb = 1'b1;

alta_slice syn__2180_(
	.A(IOvalue1[28]),
	.B(IOaddr1[28]),
	.C(\tc1.IM [7]),
	.D(\tc1.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0613_),
	.Cout(),
	.Q());
defparam syn__2180_.coord_x = 5;
defparam syn__2180_.coord_y = 5;
defparam syn__2180_.coord_z = 2;
defparam syn__2180_.mask = 16'h9F17;
defparam syn__2180_.modeMux = 1'b0;
defparam syn__2180_.FeedbackMux = 1'b0;
defparam syn__2180_.ShiftMux = 1'b0;
defparam syn__2180_.BypassEn = 1'b0;
defparam syn__2180_.CarryEnb = 1'b1;

alta_slice syn__2181_(
	.A(syn__0937_),
	.B(syn__0613_),
	.C(syn__0826_),
	.D(\tc1.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0614_),
	.Cout(),
	.Q());
defparam syn__2181_.coord_x = 5;
defparam syn__2181_.coord_y = 7;
defparam syn__2181_.coord_z = 5;
defparam syn__2181_.mask = 16'hCC5A;
defparam syn__2181_.modeMux = 1'b0;
defparam syn__2181_.FeedbackMux = 1'b0;
defparam syn__2181_.ShiftMux = 1'b0;
defparam syn__2181_.BypassEn = 1'b0;
defparam syn__2181_.CarryEnb = 1'b1;

alta_slice syn__2182_(
	.A(IOvalue1[3]),
	.B(\tc1.IM [7]),
	.C(IOaddr1[3]),
	.D(\tc1.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0615_),
	.Cout(),
	.Q());
defparam syn__2182_.coord_x = 11;
defparam syn__2182_.coord_y = 6;
defparam syn__2182_.coord_z = 12;
defparam syn__2182_.mask = 16'h48E8;
defparam syn__2182_.modeMux = 1'b0;
defparam syn__2182_.FeedbackMux = 1'b0;
defparam syn__2182_.ShiftMux = 1'b0;
defparam syn__2182_.BypassEn = 1'b0;
defparam syn__2182_.CarryEnb = 1'b1;

alta_slice syn__2183_(
	.A(vcc),
	.B(syn__0615_),
	.C(\tc1.IM [9]),
	.D(syn__0948_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0616_),
	.Cout(),
	.Q());
defparam syn__2183_.coord_x = 9;
defparam syn__2183_.coord_y = 6;
defparam syn__2183_.coord_z = 6;
defparam syn__2183_.mask = 16'h003F;
defparam syn__2183_.modeMux = 1'b0;
defparam syn__2183_.FeedbackMux = 1'b0;
defparam syn__2183_.ShiftMux = 1'b0;
defparam syn__2183_.BypassEn = 1'b0;
defparam syn__2183_.CarryEnb = 1'b1;

alta_slice syn__2184_(
	.A(IOvalue1[20]),
	.B(IOaddr1[20]),
	.C(\tc1.IM [7]),
	.D(\tc1.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0617_),
	.Cout(),
	.Q());
defparam syn__2184_.coord_x = 5;
defparam syn__2184_.coord_y = 5;
defparam syn__2184_.coord_z = 0;
defparam syn__2184_.mask = 16'h9F17;
defparam syn__2184_.modeMux = 1'b0;
defparam syn__2184_.FeedbackMux = 1'b0;
defparam syn__2184_.ShiftMux = 1'b0;
defparam syn__2184_.BypassEn = 1'b0;
defparam syn__2184_.CarryEnb = 1'b1;

alta_slice syn__2185_(
	.A(syn__0617_),
	.B(vcc),
	.C(syn__0952_),
	.D(\tc1.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0618_),
	.Cout(),
	.Q());
defparam syn__2185_.coord_x = 6;
defparam syn__2185_.coord_y = 7;
defparam syn__2185_.coord_z = 5;
defparam syn__2185_.mask = 16'hAA0F;
defparam syn__2185_.modeMux = 1'b0;
defparam syn__2185_.FeedbackMux = 1'b0;
defparam syn__2185_.ShiftMux = 1'b0;
defparam syn__2185_.BypassEn = 1'b0;
defparam syn__2185_.CarryEnb = 1'b1;

alta_slice syn__2186_(
	.A(IOvalue1[19]),
	.B(IOaddr1[19]),
	.C(\tc1.IM [7]),
	.D(\tc1.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0619_),
	.Cout(),
	.Q());
defparam syn__2186_.coord_x = 5;
defparam syn__2186_.coord_y = 5;
defparam syn__2186_.coord_z = 12;
defparam syn__2186_.mask = 16'h9F17;
defparam syn__2186_.modeMux = 1'b0;
defparam syn__2186_.FeedbackMux = 1'b0;
defparam syn__2186_.ShiftMux = 1'b0;
defparam syn__2186_.BypassEn = 1'b0;
defparam syn__2186_.CarryEnb = 1'b1;

alta_slice syn__2187_(
	.A(syn__0832_),
	.B(syn__0619_),
	.C(syn__0954_),
	.D(\tc1.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0620_),
	.Cout(),
	.Q());
defparam syn__2187_.coord_x = 6;
defparam syn__2187_.coord_y = 7;
defparam syn__2187_.coord_z = 12;
defparam syn__2187_.mask = 16'hCC5A;
defparam syn__2187_.modeMux = 1'b0;
defparam syn__2187_.FeedbackMux = 1'b0;
defparam syn__2187_.ShiftMux = 1'b0;
defparam syn__2187_.BypassEn = 1'b0;
defparam syn__2187_.CarryEnb = 1'b1;

alta_slice syn__2188_(
	.A(syn__0959_),
	.B(syn__0626_),
	.C(\tc1.IM [6]),
	.D(\tc1.IM [5]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0621_),
	.Cout(),
	.Q());
defparam syn__2188_.coord_x = 8;
defparam syn__2188_.coord_y = 7;
defparam syn__2188_.coord_z = 10;
defparam syn__2188_.mask = 16'hF0AC;
defparam syn__2188_.modeMux = 1'b0;
defparam syn__2188_.FeedbackMux = 1'b0;
defparam syn__2188_.ShiftMux = 1'b0;
defparam syn__2188_.BypassEn = 1'b0;
defparam syn__2188_.CarryEnb = 1'b1;

alta_slice syn__2189_(
	.A(syn__0621_),
	.B(syn__0624_),
	.C(syn__0944_),
	.D(\tc1.IM [5]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0622_),
	.Cout(),
	.Q());
defparam syn__2189_.coord_x = 9;
defparam syn__2189_.coord_y = 7;
defparam syn__2189_.coord_z = 4;
defparam syn__2189_.mask = 16'hD8AA;
defparam syn__2189_.modeMux = 1'b0;
defparam syn__2189_.FeedbackMux = 1'b0;
defparam syn__2189_.ShiftMux = 1'b0;
defparam syn__2189_.BypassEn = 1'b0;
defparam syn__2189_.CarryEnb = 1'b1;

alta_slice syn__2190_(
	.A(IOaddr1[26]),
	.B(IOvalue1[26]),
	.C(\tc1.IM [8]),
	.D(\tc1.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0623_),
	.Cout(),
	.Q());
defparam syn__2190_.coord_x = 11;
defparam syn__2190_.coord_y = 7;
defparam syn__2190_.coord_z = 11;
defparam syn__2190_.mask = 16'h91F7;
defparam syn__2190_.modeMux = 1'b0;
defparam syn__2190_.FeedbackMux = 1'b0;
defparam syn__2190_.ShiftMux = 1'b0;
defparam syn__2190_.BypassEn = 1'b0;
defparam syn__2190_.CarryEnb = 1'b1;

alta_slice syn__2191_(
	.A(vcc),
	.B(syn__0623_),
	.C(syn__0958_),
	.D(\tc1.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0624_),
	.Cout(),
	.Q());
defparam syn__2191_.coord_x = 11;
defparam syn__2191_.coord_y = 7;
defparam syn__2191_.coord_z = 1;
defparam syn__2191_.mask = 16'hCC0F;
defparam syn__2191_.modeMux = 1'b0;
defparam syn__2191_.FeedbackMux = 1'b0;
defparam syn__2191_.ShiftMux = 1'b0;
defparam syn__2191_.BypassEn = 1'b0;
defparam syn__2191_.CarryEnb = 1'b1;

alta_slice syn__2192_(
	.A(IOvalue1[10]),
	.B(\tc1.IM [7]),
	.C(IOaddr1[10]),
	.D(\tc1.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0625_),
	.Cout(),
	.Q());
defparam syn__2192_.coord_x = 7;
defparam syn__2192_.coord_y = 5;
defparam syn__2192_.coord_z = 5;
defparam syn__2192_.mask = 16'hB717;
defparam syn__2192_.modeMux = 1'b0;
defparam syn__2192_.FeedbackMux = 1'b0;
defparam syn__2192_.ShiftMux = 1'b0;
defparam syn__2192_.BypassEn = 1'b0;
defparam syn__2192_.CarryEnb = 1'b1;

alta_slice syn__2193_(
	.A(\tc1.IM [9]),
	.B(syn__0625_),
	.C(syn__0963_),
	.D(syn__0838_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0626_),
	.Cout(),
	.Q());
defparam syn__2193_.coord_x = 9;
defparam syn__2193_.coord_y = 7;
defparam syn__2193_.coord_z = 1;
defparam syn__2193_.mask = 16'h8DD8;
defparam syn__2193_.modeMux = 1'b0;
defparam syn__2193_.FeedbackMux = 1'b0;
defparam syn__2193_.ShiftMux = 1'b0;
defparam syn__2193_.BypassEn = 1'b0;
defparam syn__2193_.CarryEnb = 1'b1;

alta_slice syn__2194_(
	.A(IOaddr1[25]),
	.B(IOvalue1[25]),
	.C(\tc1.IM [8]),
	.D(\tc1.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0627_),
	.Cout(),
	.Q());
defparam syn__2194_.coord_x = 6;
defparam syn__2194_.coord_y = 6;
defparam syn__2194_.coord_z = 2;
defparam syn__2194_.mask = 16'h91F7;
defparam syn__2194_.modeMux = 1'b0;
defparam syn__2194_.FeedbackMux = 1'b0;
defparam syn__2194_.ShiftMux = 1'b0;
defparam syn__2194_.BypassEn = 1'b0;
defparam syn__2194_.CarryEnb = 1'b1;

alta_slice syn__2195_(
	.A(syn__0627_),
	.B(syn__0828_),
	.C(syn__0966_),
	.D(\tc1.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0628_),
	.Cout(),
	.Q());
defparam syn__2195_.coord_x = 7;
defparam syn__2195_.coord_y = 6;
defparam syn__2195_.coord_z = 11;
defparam syn__2195_.mask = 16'hAA3C;
defparam syn__2195_.modeMux = 1'b0;
defparam syn__2195_.FeedbackMux = 1'b0;
defparam syn__2195_.ShiftMux = 1'b0;
defparam syn__2195_.BypassEn = 1'b0;
defparam syn__2195_.CarryEnb = 1'b1;

alta_slice syn__2196_(
	.A(IOaddr1[17]),
	.B(\tc1.IM [7]),
	.C(IOvalue1[17]),
	.D(\tc1.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0629_),
	.Cout(),
	.Q());
defparam syn__2196_.coord_x = 6;
defparam syn__2196_.coord_y = 5;
defparam syn__2196_.coord_z = 10;
defparam syn__2196_.mask = 16'hB717;
defparam syn__2196_.modeMux = 1'b0;
defparam syn__2196_.FeedbackMux = 1'b0;
defparam syn__2196_.ShiftMux = 1'b0;
defparam syn__2196_.BypassEn = 1'b0;
defparam syn__2196_.CarryEnb = 1'b1;

alta_slice syn__2197_(
	.A(syn__0629_),
	.B(\tc1.IM [9]),
	.C(syn__0969_),
	.D(syn__0968_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0630_),
	.Cout(),
	.Q());
defparam syn__2197_.coord_x = 6;
defparam syn__2197_.coord_y = 5;
defparam syn__2197_.coord_z = 6;
defparam syn__2197_.mask = 16'h8BB8;
defparam syn__2197_.modeMux = 1'b0;
defparam syn__2197_.FeedbackMux = 1'b0;
defparam syn__2197_.ShiftMux = 1'b0;
defparam syn__2197_.BypassEn = 1'b0;
defparam syn__2197_.CarryEnb = 1'b1;

alta_slice syn__2198_(
	.A(IOvalue1[9]),
	.B(\tc1.IM [7]),
	.C(IOaddr1[9]),
	.D(\tc1.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0631_),
	.Cout(),
	.Q());
defparam syn__2198_.coord_x = 12;
defparam syn__2198_.coord_y = 5;
defparam syn__2198_.coord_z = 0;
defparam syn__2198_.mask = 16'h48E8;
defparam syn__2198_.modeMux = 1'b0;
defparam syn__2198_.FeedbackMux = 1'b0;
defparam syn__2198_.ShiftMux = 1'b0;
defparam syn__2198_.BypassEn = 1'b0;
defparam syn__2198_.CarryEnb = 1'b1;

alta_slice syn__2199_(
	.A(vcc),
	.B(syn__0631_),
	.C(syn__0971_),
	.D(\tc1.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0632_),
	.Cout(),
	.Q());
defparam syn__2199_.coord_x = 8;
defparam syn__2199_.coord_y = 6;
defparam syn__2199_.coord_z = 12;
defparam syn__2199_.mask = 16'h030F;
defparam syn__2199_.modeMux = 1'b0;
defparam syn__2199_.FeedbackMux = 1'b0;
defparam syn__2199_.ShiftMux = 1'b0;
defparam syn__2199_.BypassEn = 1'b0;
defparam syn__2199_.CarryEnb = 1'b1;

alta_slice syn__2200_(
	.A(IOvalue1[16]),
	.B(\tc1.IM [7]),
	.C(IOaddr1[16]),
	.D(\tc1.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0633_),
	.Cout(),
	.Q());
defparam syn__2200_.coord_x = 6;
defparam syn__2200_.coord_y = 5;
defparam syn__2200_.coord_z = 4;
defparam syn__2200_.mask = 16'hB717;
defparam syn__2200_.modeMux = 1'b0;
defparam syn__2200_.FeedbackMux = 1'b0;
defparam syn__2200_.ShiftMux = 1'b0;
defparam syn__2200_.BypassEn = 1'b0;
defparam syn__2200_.CarryEnb = 1'b1;

alta_slice syn__2201_(
	.A(syn__0633_),
	.B(syn__0834_),
	.C(syn__0976_),
	.D(\tc1.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0634_),
	.Cout(),
	.Q());
defparam syn__2201_.coord_x = 6;
defparam syn__2201_.coord_y = 5;
defparam syn__2201_.coord_z = 12;
defparam syn__2201_.mask = 16'hAAC3;
defparam syn__2201_.modeMux = 1'b0;
defparam syn__2201_.FeedbackMux = 1'b0;
defparam syn__2201_.ShiftMux = 1'b0;
defparam syn__2201_.BypassEn = 1'b0;
defparam syn__2201_.CarryEnb = 1'b1;

alta_slice syn__2202_(
	.A(syn__0640_),
	.B(syn__0642_),
	.C(\tc1.IM [6]),
	.D(\tc1.IM [5]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0635_),
	.Cout(),
	.Q());
defparam syn__2202_.coord_x = 8;
defparam syn__2202_.coord_y = 7;
defparam syn__2202_.coord_z = 8;
defparam syn__2202_.mask = 16'hF0AC;
defparam syn__2202_.modeMux = 1'b0;
defparam syn__2202_.FeedbackMux = 1'b0;
defparam syn__2202_.ShiftMux = 1'b0;
defparam syn__2202_.BypassEn = 1'b0;
defparam syn__2202_.CarryEnb = 1'b1;

alta_slice syn__2203_(
	.A(syn__0635_),
	.B(syn__0638_),
	.C(syn__0978_),
	.D(\tc1.IM [5]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0636_),
	.Cout(),
	.Q());
defparam syn__2203_.coord_x = 8;
defparam syn__2203_.coord_y = 6;
defparam syn__2203_.coord_z = 2;
defparam syn__2203_.mask = 16'hD8AA;
defparam syn__2203_.modeMux = 1'b0;
defparam syn__2203_.FeedbackMux = 1'b0;
defparam syn__2203_.ShiftMux = 1'b0;
defparam syn__2203_.BypassEn = 1'b0;
defparam syn__2203_.CarryEnb = 1'b1;

alta_slice syn__2204_(
	.A(IOvalue1[23]),
	.B(IOaddr1[23]),
	.C(\tc1.IM [7]),
	.D(\tc1.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0637_),
	.Cout(),
	.Q());
defparam syn__2204_.coord_x = 7;
defparam syn__2204_.coord_y = 7;
defparam syn__2204_.coord_z = 8;
defparam syn__2204_.mask = 16'h9F17;
defparam syn__2204_.modeMux = 1'b0;
defparam syn__2204_.FeedbackMux = 1'b0;
defparam syn__2204_.ShiftMux = 1'b0;
defparam syn__2204_.BypassEn = 1'b0;
defparam syn__2204_.CarryEnb = 1'b1;

alta_slice syn__2205_(
	.A(syn__0992_),
	.B(syn__0991_),
	.C(syn__0637_),
	.D(\tc1.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0638_),
	.Cout(),
	.Q());
defparam syn__2205_.coord_x = 7;
defparam syn__2205_.coord_y = 7;
defparam syn__2205_.coord_z = 13;
defparam syn__2205_.mask = 16'hF066;
defparam syn__2205_.modeMux = 1'b0;
defparam syn__2205_.FeedbackMux = 1'b0;
defparam syn__2205_.ShiftMux = 1'b0;
defparam syn__2205_.BypassEn = 1'b0;
defparam syn__2205_.CarryEnb = 1'b1;

alta_slice syn__2206_(
	.A(IOaddr1[15]),
	.B(IOvalue1[15]),
	.C(\tc1.IM [7]),
	.D(\tc1.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0639_),
	.Cout(),
	.Q());
defparam syn__2206_.coord_x = 12;
defparam syn__2206_.coord_y = 5;
defparam syn__2206_.coord_z = 11;
defparam syn__2206_.mask = 16'h60E8;
defparam syn__2206_.modeMux = 1'b0;
defparam syn__2206_.FeedbackMux = 1'b0;
defparam syn__2206_.ShiftMux = 1'b0;
defparam syn__2206_.BypassEn = 1'b0;
defparam syn__2206_.CarryEnb = 1'b1;

alta_slice syn__2207_(
	.A(vcc),
	.B(syn__0639_),
	.C(syn__0993_),
	.D(\tc1.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0640_),
	.Cout(),
	.Q());
defparam syn__2207_.coord_x = 12;
defparam syn__2207_.coord_y = 5;
defparam syn__2207_.coord_z = 14;
defparam syn__2207_.mask = 16'h030F;
defparam syn__2207_.modeMux = 1'b0;
defparam syn__2207_.FeedbackMux = 1'b0;
defparam syn__2207_.ShiftMux = 1'b0;
defparam syn__2207_.BypassEn = 1'b0;
defparam syn__2207_.CarryEnb = 1'b1;

alta_slice syn__2208_(
	.A(\tc1.IM [8]),
	.B(IOvalue1[7]),
	.C(\tc1.IM [7]),
	.D(IOaddr1[7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0641_),
	.Cout(),
	.Q());
defparam syn__2208_.coord_x = 12;
defparam syn__2208_.coord_y = 5;
defparam syn__2208_.coord_z = 7;
defparam syn__2208_.mask = 16'h8B3F;
defparam syn__2208_.modeMux = 1'b0;
defparam syn__2208_.FeedbackMux = 1'b0;
defparam syn__2208_.ShiftMux = 1'b0;
defparam syn__2208_.BypassEn = 1'b0;
defparam syn__2208_.CarryEnb = 1'b1;

alta_slice syn__2209_(
	.A(syn__0995_),
	.B(syn__0641_),
	.C(syn__0840_),
	.D(\tc1.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0642_),
	.Cout(),
	.Q());
defparam syn__2209_.coord_x = 11;
defparam syn__2209_.coord_y = 7;
defparam syn__2209_.coord_z = 12;
defparam syn__2209_.mask = 16'hCC5A;
defparam syn__2209_.modeMux = 1'b0;
defparam syn__2209_.FeedbackMux = 1'b0;
defparam syn__2209_.ShiftMux = 1'b0;
defparam syn__2209_.BypassEn = 1'b0;
defparam syn__2209_.CarryEnb = 1'b1;

alta_slice syn__2210_(
	.A(IOaddr1[22]),
	.B(IOvalue1[22]),
	.C(\tc1.IM [8]),
	.D(\tc1.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0643_),
	.Cout(),
	.Q());
defparam syn__2210_.coord_x = 6;
defparam syn__2210_.coord_y = 6;
defparam syn__2210_.coord_z = 10;
defparam syn__2210_.mask = 16'h91F7;
defparam syn__2210_.modeMux = 1'b0;
defparam syn__2210_.FeedbackMux = 1'b0;
defparam syn__2210_.ShiftMux = 1'b0;
defparam syn__2210_.BypassEn = 1'b0;
defparam syn__2210_.CarryEnb = 1'b1;

alta_slice syn__2211_(
	.A(syn__0643_),
	.B(syn__0998_),
	.C(syn__0830_),
	.D(\tc1.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0644_),
	.Cout(),
	.Q());
defparam syn__2211_.coord_x = 7;
defparam syn__2211_.coord_y = 6;
defparam syn__2211_.coord_z = 5;
defparam syn__2211_.mask = 16'hAA3C;
defparam syn__2211_.modeMux = 1'b0;
defparam syn__2211_.FeedbackMux = 1'b0;
defparam syn__2211_.ShiftMux = 1'b0;
defparam syn__2211_.BypassEn = 1'b0;
defparam syn__2211_.CarryEnb = 1'b1;

alta_slice syn__2212_(
	.A(IOvalue1[21]),
	.B(IOaddr1[21]),
	.C(\tc1.IM [7]),
	.D(\tc1.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0645_),
	.Cout(),
	.Q());
defparam syn__2212_.coord_x = 5;
defparam syn__2212_.coord_y = 5;
defparam syn__2212_.coord_z = 1;
defparam syn__2212_.mask = 16'h9F17;
defparam syn__2212_.modeMux = 1'b0;
defparam syn__2212_.FeedbackMux = 1'b0;
defparam syn__2212_.ShiftMux = 1'b0;
defparam syn__2212_.BypassEn = 1'b0;
defparam syn__2212_.CarryEnb = 1'b1;

alta_slice syn__2213_(
	.A(syn__1003_),
	.B(syn__1002_),
	.C(syn__0645_),
	.D(\tc1.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0646_),
	.Cout(),
	.Q());
defparam syn__2213_.coord_x = 6;
defparam syn__2213_.coord_y = 7;
defparam syn__2213_.coord_z = 1;
defparam syn__2213_.mask = 16'hF066;
defparam syn__2213_.modeMux = 1'b0;
defparam syn__2213_.FeedbackMux = 1'b0;
defparam syn__2213_.ShiftMux = 1'b0;
defparam syn__2213_.BypassEn = 1'b0;
defparam syn__2213_.CarryEnb = 1'b1;

alta_slice syn__2214_(
	.A(IOaddr1[12]),
	.B(IOvalue1[12]),
	.C(\tc1.IM [7]),
	.D(\tc1.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0647_),
	.Cout(),
	.Q());
defparam syn__2214_.coord_x = 7;
defparam syn__2214_.coord_y = 7;
defparam syn__2214_.coord_z = 11;
defparam syn__2214_.mask = 16'h60E8;
defparam syn__2214_.modeMux = 1'b0;
defparam syn__2214_.FeedbackMux = 1'b0;
defparam syn__2214_.ShiftMux = 1'b0;
defparam syn__2214_.BypassEn = 1'b0;
defparam syn__2214_.CarryEnb = 1'b1;

alta_slice syn__2215_(
	.A(vcc),
	.B(syn__0647_),
	.C(syn__1008_),
	.D(\tc1.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0648_),
	.Cout(),
	.Q());
defparam syn__2215_.coord_x = 7;
defparam syn__2215_.coord_y = 7;
defparam syn__2215_.coord_z = 6;
defparam syn__2215_.mask = 16'h030F;
defparam syn__2215_.modeMux = 1'b0;
defparam syn__2215_.FeedbackMux = 1'b0;
defparam syn__2215_.ShiftMux = 1'b0;
defparam syn__2215_.BypassEn = 1'b0;
defparam syn__2215_.CarryEnb = 1'b1;

alta_slice syn__2216_(
	.A(IOaddr1[4]),
	.B(\tc1.IM [8]),
	.C(\tc1.IM [7]),
	.D(IOvalue1[4]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0649_),
	.Cout(),
	.Q());
defparam syn__2216_.coord_x = 12;
defparam syn__2216_.coord_y = 6;
defparam syn__2216_.coord_z = 8;
defparam syn__2216_.mask = 16'h8D5F;
defparam syn__2216_.modeMux = 1'b0;
defparam syn__2216_.FeedbackMux = 1'b0;
defparam syn__2216_.ShiftMux = 1'b0;
defparam syn__2216_.BypassEn = 1'b0;
defparam syn__2216_.CarryEnb = 1'b1;

alta_slice syn__2217_(
	.A(syn__0649_),
	.B(syn__0842_),
	.C(syn__1010_),
	.D(\tc1.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0650_),
	.Cout(),
	.Q());
defparam syn__2217_.coord_x = 12;
defparam syn__2217_.coord_y = 6;
defparam syn__2217_.coord_z = 1;
defparam syn__2217_.mask = 16'hAA3C;
defparam syn__2217_.modeMux = 1'b0;
defparam syn__2217_.FeedbackMux = 1'b0;
defparam syn__2217_.ShiftMux = 1'b0;
defparam syn__2217_.BypassEn = 1'b0;
defparam syn__2217_.CarryEnb = 1'b1;

alta_slice syn__2218_(
	.A(IOvalue1[2]),
	.B(\tc1.IM [7]),
	.C(IOaddr1[2]),
	.D(\tc1.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0651_),
	.Cout(),
	.Q());
defparam syn__2218_.coord_x = 11;
defparam syn__2218_.coord_y = 6;
defparam syn__2218_.coord_z = 8;
defparam syn__2218_.mask = 16'hB717;
defparam syn__2218_.modeMux = 1'b0;
defparam syn__2218_.FeedbackMux = 1'b0;
defparam syn__2218_.ShiftMux = 1'b0;
defparam syn__2218_.BypassEn = 1'b0;
defparam syn__2218_.CarryEnb = 1'b1;

alta_slice syn__2219_(
	.A(\tc1.IM [9]),
	.B(vcc),
	.C(syn__1018_),
	.D(syn__0651_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0652_),
	.Cout(),
	.Q());
defparam syn__2219_.coord_x = 9;
defparam syn__2219_.coord_y = 7;
defparam syn__2219_.coord_z = 12;
defparam syn__2219_.mask = 16'hAF05;
defparam syn__2219_.modeMux = 1'b0;
defparam syn__2219_.FeedbackMux = 1'b0;
defparam syn__2219_.ShiftMux = 1'b0;
defparam syn__2219_.BypassEn = 1'b0;
defparam syn__2219_.CarryEnb = 1'b1;

alta_slice syn__2220_(
	.A(\tc1.IM [7]),
	.B(IOvalue1[1]),
	.C(IOaddr1[1]),
	.D(\tc1.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0653_),
	.Cout(),
	.Q());
defparam syn__2220_.coord_x = 11;
defparam syn__2220_.coord_y = 6;
defparam syn__2220_.coord_z = 6;
defparam syn__2220_.mask = 16'hD717;
defparam syn__2220_.modeMux = 1'b0;
defparam syn__2220_.FeedbackMux = 1'b0;
defparam syn__2220_.ShiftMux = 1'b0;
defparam syn__2220_.BypassEn = 1'b0;
defparam syn__2220_.CarryEnb = 1'b1;

alta_slice syn__2221_(
	.A(syn__0653_),
	.B(syn__0846_),
	.C(syn__1022_),
	.D(\tc1.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0654_),
	.Cout(),
	.Q());
defparam syn__2221_.coord_x = 11;
defparam syn__2221_.coord_y = 6;
defparam syn__2221_.coord_z = 1;
defparam syn__2221_.mask = 16'hAAC3;
defparam syn__2221_.modeMux = 1'b0;
defparam syn__2221_.FeedbackMux = 1'b0;
defparam syn__2221_.ShiftMux = 1'b0;
defparam syn__2221_.BypassEn = 1'b0;
defparam syn__2221_.CarryEnb = 1'b1;

alta_slice syn__2222_(
	.A(syn__0654_),
	.B(syn__0628_),
	.C(\tc1.IM [6]),
	.D(\tc1.IM [5]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0655_),
	.Cout(),
	.Q());
defparam syn__2222_.coord_x = 8;
defparam syn__2222_.coord_y = 6;
defparam syn__2222_.coord_z = 7;
defparam syn__2222_.mask = 16'hF0AC;
defparam syn__2222_.modeMux = 1'b0;
defparam syn__2222_.FeedbackMux = 1'b0;
defparam syn__2222_.ShiftMux = 1'b0;
defparam syn__2222_.BypassEn = 1'b0;
defparam syn__2222_.CarryEnb = 1'b1;

alta_slice syn__2223_(
	.A(syn__0624_),
	.B(\tc1.IM [5]),
	.C(syn__0632_),
	.D(syn__0655_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0656_),
	.Cout(),
	.Q());
defparam syn__2223_.coord_x = 8;
defparam syn__2223_.coord_y = 6;
defparam syn__2223_.coord_z = 13;
defparam syn__2223_.mask = 16'hF388;
defparam syn__2223_.modeMux = 1'b0;
defparam syn__2223_.FeedbackMux = 1'b0;
defparam syn__2223_.ShiftMux = 1'b0;
defparam syn__2223_.BypassEn = 1'b0;
defparam syn__2223_.CarryEnb = 1'b1;

alta_slice syn__2224_(
	.A(syn__0652_),
	.B(syn__0620_),
	.C(\tc1.IM [6]),
	.D(\tc1.IM [5]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0657_),
	.Cout(),
	.Q());
defparam syn__2224_.coord_x = 8;
defparam syn__2224_.coord_y = 7;
defparam syn__2224_.coord_z = 11;
defparam syn__2224_.mask = 16'hACF0;
defparam syn__2224_.modeMux = 1'b0;
defparam syn__2224_.FeedbackMux = 1'b0;
defparam syn__2224_.ShiftMux = 1'b0;
defparam syn__2224_.BypassEn = 1'b0;
defparam syn__2224_.CarryEnb = 1'b1;

alta_slice syn__2225_(
	.A(\tc1.IM [5]),
	.B(syn__0657_),
	.C(syn__0959_),
	.D(syn__0624_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0658_),
	.Cout(),
	.Q());
defparam syn__2225_.coord_x = 9;
defparam syn__2225_.coord_y = 7;
defparam syn__2225_.coord_z = 5;
defparam syn__2225_.mask = 16'hDC98;
defparam syn__2225_.modeMux = 1'b0;
defparam syn__2225_.FeedbackMux = 1'b0;
defparam syn__2225_.ShiftMux = 1'b0;
defparam syn__2225_.BypassEn = 1'b0;
defparam syn__2225_.CarryEnb = 1'b1;

alta_slice syn__2226_(
	.A(\tc1.IM [5]),
	.B(vcc),
	.C(syn__0652_),
	.D(syn__0626_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0659_),
	.Cout(),
	.Q());
defparam syn__2226_.coord_x = 9;
defparam syn__2226_.coord_y = 7;
defparam syn__2226_.coord_z = 11;
defparam syn__2226_.mask = 16'hFA50;
defparam syn__2226_.modeMux = 1'b0;
defparam syn__2226_.FeedbackMux = 1'b0;
defparam syn__2226_.ShiftMux = 1'b0;
defparam syn__2226_.BypassEn = 1'b0;
defparam syn__2226_.CarryEnb = 1'b1;

alta_slice syn__2227_(
	.A(syn__0624_),
	.B(\tc1.IM [5]),
	.C(\tc1.IM [6]),
	.D(syn__0659_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0660_),
	.Cout(),
	.Q());
defparam syn__2227_.coord_x = 8;
defparam syn__2227_.coord_y = 7;
defparam syn__2227_.coord_z = 2;
defparam syn__2227_.mask = 16'hFE0E;
defparam syn__2227_.modeMux = 1'b0;
defparam syn__2227_.FeedbackMux = 1'b0;
defparam syn__2227_.ShiftMux = 1'b0;
defparam syn__2227_.BypassEn = 1'b0;
defparam syn__2227_.CarryEnb = 1'b1;

alta_slice syn__2228_(
	.A(\tc1.IM [5]),
	.B(syn__0610_),
	.C(\tc1.IM [6]),
	.D(syn__0646_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0661_),
	.Cout(),
	.Q());
defparam syn__2228_.coord_x = 8;
defparam syn__2228_.coord_y = 7;
defparam syn__2228_.coord_z = 15;
defparam syn__2228_.mask = 16'hF4A4;
defparam syn__2228_.modeMux = 1'b0;
defparam syn__2228_.FeedbackMux = 1'b0;
defparam syn__2228_.ShiftMux = 1'b0;
defparam syn__2228_.BypassEn = 1'b0;
defparam syn__2228_.CarryEnb = 1'b1;

alta_slice syn__2229_(
	.A(syn__0925_),
	.B(\tc1.IM [5]),
	.C(syn__0916_),
	.D(syn__0661_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0662_),
	.Cout(),
	.Q());
defparam syn__2229_.coord_x = 8;
defparam syn__2229_.coord_y = 7;
defparam syn__2229_.coord_z = 9;
defparam syn__2229_.mask = 16'hBBC0;
defparam syn__2229_.modeMux = 1'b0;
defparam syn__2229_.FeedbackMux = 1'b0;
defparam syn__2229_.ShiftMux = 1'b0;
defparam syn__2229_.BypassEn = 1'b0;
defparam syn__2229_.CarryEnb = 1'b1;

alta_slice syn__2230_(
	.A(vcc),
	.B(syn__0650_),
	.C(syn__0648_),
	.D(\tc1.IM [5]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0663_),
	.Cout(),
	.Q());
defparam syn__2230_.coord_x = 8;
defparam syn__2230_.coord_y = 7;
defparam syn__2230_.coord_z = 7;
defparam syn__2230_.mask = 16'hF0CC;
defparam syn__2230_.modeMux = 1'b0;
defparam syn__2230_.FeedbackMux = 1'b0;
defparam syn__2230_.ShiftMux = 1'b0;
defparam syn__2230_.BypassEn = 1'b0;
defparam syn__2230_.CarryEnb = 1'b1;

alta_slice syn__2231_(
	.A(syn__0663_),
	.B(syn__0614_),
	.C(\tc1.IM [6]),
	.D(\tc1.IM [5]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0664_),
	.Cout(),
	.Q());
defparam syn__2231_.coord_x = 8;
defparam syn__2231_.coord_y = 7;
defparam syn__2231_.coord_z = 6;
defparam syn__2231_.mask = 16'hAFAC;
defparam syn__2231_.modeMux = 1'b0;
defparam syn__2231_.FeedbackMux = 1'b0;
defparam syn__2231_.ShiftMux = 1'b0;
defparam syn__2231_.BypassEn = 1'b0;
defparam syn__2231_.CarryEnb = 1'b1;

alta_slice syn__2232_(
	.A(syn__0640_),
	.B(syn__0638_),
	.C(\tc1.IM [6]),
	.D(\tc1.IM [5]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0665_),
	.Cout(),
	.Q());
defparam syn__2232_.coord_x = 8;
defparam syn__2232_.coord_y = 7;
defparam syn__2232_.coord_z = 4;
defparam syn__2232_.mask = 16'hF0CA;
defparam syn__2232_.modeMux = 1'b0;
defparam syn__2232_.FeedbackMux = 1'b0;
defparam syn__2232_.ShiftMux = 1'b0;
defparam syn__2232_.BypassEn = 1'b0;
defparam syn__2232_.CarryEnb = 1'b1;

alta_slice syn__2233_(
	.A(syn__0665_),
	.B(syn__0823_),
	.C(syn__0634_),
	.D(\tc1.IM [5]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0666_),
	.Cout(),
	.Q());
defparam syn__2233_.coord_x = 7;
defparam syn__2233_.coord_y = 8;
defparam syn__2233_.coord_z = 0;
defparam syn__2233_.mask = 16'hD8AA;
defparam syn__2233_.modeMux = 1'b0;
defparam syn__2233_.FeedbackMux = 1'b0;
defparam syn__2233_.ShiftMux = 1'b0;
defparam syn__2233_.BypassEn = 1'b0;
defparam syn__2233_.CarryEnb = 1'b1;

alta_slice syn__2234_(
	.A(IOvalue2[23]),
	.B(\tc2.IM [7]),
	.C(IOaddr2[23]),
	.D(\tc2.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0667_),
	.Cout(),
	.Q());
defparam syn__2234_.coord_x = 9;
defparam syn__2234_.coord_y = 4;
defparam syn__2234_.coord_z = 14;
defparam syn__2234_.mask = 16'hB717;
defparam syn__2234_.modeMux = 1'b0;
defparam syn__2234_.FeedbackMux = 1'b0;
defparam syn__2234_.ShiftMux = 1'b0;
defparam syn__2234_.BypassEn = 1'b0;
defparam syn__2234_.CarryEnb = 1'b1;

alta_slice syn__2235_(
	.A(syn__0070_),
	.B(\tc2.IM [9]),
	.C(syn__0667_),
	.D(syn__0069_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0668_),
	.Cout(),
	.Q());
defparam syn__2235_.coord_x = 8;
defparam syn__2235_.coord_y = 4;
defparam syn__2235_.coord_z = 9;
defparam syn__2235_.mask = 16'hD1E2;
defparam syn__2235_.modeMux = 1'b0;
defparam syn__2235_.FeedbackMux = 1'b0;
defparam syn__2235_.ShiftMux = 1'b0;
defparam syn__2235_.BypassEn = 1'b0;
defparam syn__2235_.CarryEnb = 1'b1;

alta_slice syn__2236_(
	.A(\tc2.IM [8]),
	.B(IOaddr2[7]),
	.C(IOvalue2[7]),
	.D(\tc2.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0669_),
	.Cout(),
	.Q());
defparam syn__2236_.coord_x = 4;
defparam syn__2236_.coord_y = 2;
defparam syn__2236_.coord_z = 12;
defparam syn__2236_.mask = 16'h83BF;
defparam syn__2236_.modeMux = 1'b0;
defparam syn__2236_.FeedbackMux = 1'b0;
defparam syn__2236_.ShiftMux = 1'b0;
defparam syn__2236_.BypassEn = 1'b0;
defparam syn__2236_.CarryEnb = 1'b1;

alta_slice syn__2237_(
	.A(syn__0669_),
	.B(syn__1094_),
	.C(syn__0071_),
	.D(\tc2.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0670_),
	.Cout(),
	.Q());
defparam syn__2237_.coord_x = 4;
defparam syn__2237_.coord_y = 2;
defparam syn__2237_.coord_z = 13;
defparam syn__2237_.mask = 16'hAA3C;
defparam syn__2237_.modeMux = 1'b0;
defparam syn__2237_.FeedbackMux = 1'b0;
defparam syn__2237_.ShiftMux = 1'b0;
defparam syn__2237_.BypassEn = 1'b0;
defparam syn__2237_.CarryEnb = 1'b1;

alta_slice syn__2238_(
	.A(\tc2.IM [8]),
	.B(\tc2.IM [7]),
	.C(IOvalue2[13]),
	.D(IOaddr2[13]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0671_),
	.Cout(),
	.Q());
defparam syn__2238_.coord_x = 12;
defparam syn__2238_.coord_y = 2;
defparam syn__2238_.coord_z = 13;
defparam syn__2238_.mask = 16'h5CC0;
defparam syn__2238_.modeMux = 1'b0;
defparam syn__2238_.FeedbackMux = 1'b0;
defparam syn__2238_.ShiftMux = 1'b0;
defparam syn__2238_.BypassEn = 1'b0;
defparam syn__2238_.CarryEnb = 1'b1;

alta_slice syn__2239_(
	.A(vcc),
	.B(syn__0671_),
	.C(syn__0087_),
	.D(\tc2.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0672_),
	.Cout(),
	.Q());
defparam syn__2239_.coord_x = 12;
defparam syn__2239_.coord_y = 2;
defparam syn__2239_.coord_z = 0;
defparam syn__2239_.mask = 16'h030F;
defparam syn__2239_.modeMux = 1'b0;
defparam syn__2239_.FeedbackMux = 1'b0;
defparam syn__2239_.ShiftMux = 1'b0;
defparam syn__2239_.BypassEn = 1'b0;
defparam syn__2239_.CarryEnb = 1'b1;

alta_slice syn__2240_(
	.A(\tc2.IM [8]),
	.B(IOvalue2[5]),
	.C(IOaddr2[5]),
	.D(\tc2.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0673_),
	.Cout(),
	.Q());
defparam syn__2240_.coord_x = 4;
defparam syn__2240_.coord_y = 2;
defparam syn__2240_.coord_z = 15;
defparam syn__2240_.mask = 16'h83BF;
defparam syn__2240_.modeMux = 1'b0;
defparam syn__2240_.FeedbackMux = 1'b0;
defparam syn__2240_.ShiftMux = 1'b0;
defparam syn__2240_.BypassEn = 1'b0;
defparam syn__2240_.CarryEnb = 1'b1;

alta_slice syn__2241_(
	.A(syn__0088_),
	.B(syn__0089_),
	.C(syn__0673_),
	.D(\tc2.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0674_),
	.Cout(),
	.Q());
defparam syn__2241_.coord_x = 5;
defparam syn__2241_.coord_y = 2;
defparam syn__2241_.coord_z = 5;
defparam syn__2241_.mask = 16'hF066;
defparam syn__2241_.modeMux = 1'b0;
defparam syn__2241_.FeedbackMux = 1'b0;
defparam syn__2241_.ShiftMux = 1'b0;
defparam syn__2241_.BypassEn = 1'b0;
defparam syn__2241_.CarryEnb = 1'b1;

alta_slice syn__2242_(
	.A(IOvalue2[28]),
	.B(\tc2.IM [7]),
	.C(IOaddr2[28]),
	.D(\tc2.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0675_),
	.Cout(),
	.Q());
defparam syn__2242_.coord_x = 5;
defparam syn__2242_.coord_y = 5;
defparam syn__2242_.coord_z = 4;
defparam syn__2242_.mask = 16'hB717;
defparam syn__2242_.modeMux = 1'b0;
defparam syn__2242_.FeedbackMux = 1'b0;
defparam syn__2242_.ShiftMux = 1'b0;
defparam syn__2242_.BypassEn = 1'b0;
defparam syn__2242_.CarryEnb = 1'b1;

alta_slice syn__2243_(
	.A(syn__0096_),
	.B(syn__1080_),
	.C(syn__0675_),
	.D(\tc2.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0676_),
	.Cout(),
	.Q());
defparam syn__2243_.coord_x = 5;
defparam syn__2243_.coord_y = 4;
defparam syn__2243_.coord_z = 7;
defparam syn__2243_.mask = 16'hF066;
defparam syn__2243_.modeMux = 1'b0;
defparam syn__2243_.FeedbackMux = 1'b0;
defparam syn__2243_.ShiftMux = 1'b0;
defparam syn__2243_.BypassEn = 1'b0;
defparam syn__2243_.CarryEnb = 1'b1;

alta_slice syn__2244_(
	.A(\tc2.IM [8]),
	.B(\tc2.IM [7]),
	.C(IOaddr2[11]),
	.D(IOvalue2[11]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0677_),
	.Cout(),
	.Q());
defparam syn__2244_.coord_x = 11;
defparam syn__2244_.coord_y = 5;
defparam syn__2244_.coord_z = 0;
defparam syn__2244_.mask = 16'hA33F;
defparam syn__2244_.modeMux = 1'b0;
defparam syn__2244_.FeedbackMux = 1'b0;
defparam syn__2244_.ShiftMux = 1'b0;
defparam syn__2244_.BypassEn = 1'b0;
defparam syn__2244_.CarryEnb = 1'b1;

alta_slice syn__2245_(
	.A(syn__0103_),
	.B(syn__0104_),
	.C(syn__0677_),
	.D(\tc2.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0678_),
	.Cout(),
	.Q());
defparam syn__2245_.coord_x = 11;
defparam syn__2245_.coord_y = 5;
defparam syn__2245_.coord_z = 2;
defparam syn__2245_.mask = 16'hF066;
defparam syn__2245_.modeMux = 1'b0;
defparam syn__2245_.FeedbackMux = 1'b0;
defparam syn__2245_.ShiftMux = 1'b0;
defparam syn__2245_.BypassEn = 1'b0;
defparam syn__2245_.CarryEnb = 1'b1;

alta_slice syn__2246_(
	.A(IOaddr2[3]),
	.B(\tc2.IM [8]),
	.C(\tc2.IM [7]),
	.D(IOvalue2[3]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0679_),
	.Cout(),
	.Q());
defparam syn__2246_.coord_x = 9;
defparam syn__2246_.coord_y = 1;
defparam syn__2246_.coord_z = 0;
defparam syn__2246_.mask = 16'h72A0;
defparam syn__2246_.modeMux = 1'b0;
defparam syn__2246_.FeedbackMux = 1'b0;
defparam syn__2246_.ShiftMux = 1'b0;
defparam syn__2246_.BypassEn = 1'b0;
defparam syn__2246_.CarryEnb = 1'b1;

alta_slice syn__2247_(
	.A(\tc2.IM [9]),
	.B(vcc),
	.C(syn__0105_),
	.D(syn__0679_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0680_),
	.Cout(),
	.Q());
defparam syn__2247_.coord_x = 9;
defparam syn__2247_.coord_y = 2;
defparam syn__2247_.coord_z = 0;
defparam syn__2247_.mask = 16'h050F;
defparam syn__2247_.modeMux = 1'b0;
defparam syn__2247_.FeedbackMux = 1'b0;
defparam syn__2247_.ShiftMux = 1'b0;
defparam syn__2247_.BypassEn = 1'b0;
defparam syn__2247_.CarryEnb = 1'b1;

alta_slice syn__2248_(
	.A(\tc2.IM [7]),
	.B(IOaddr2[19]),
	.C(\tc2.IM [8]),
	.D(IOvalue2[19]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0681_),
	.Cout(),
	.Q());
defparam syn__2248_.coord_x = 6;
defparam syn__2248_.coord_y = 6;
defparam syn__2248_.coord_z = 6;
defparam syn__2248_.mask = 16'hD177;
defparam syn__2248_.modeMux = 1'b0;
defparam syn__2248_.FeedbackMux = 1'b0;
defparam syn__2248_.ShiftMux = 1'b0;
defparam syn__2248_.BypassEn = 1'b0;
defparam syn__2248_.CarryEnb = 1'b1;

alta_slice syn__2249_(
	.A(syn__0115_),
	.B(\tc2.IM [9]),
	.C(syn__1086_),
	.D(syn__0681_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0682_),
	.Cout(),
	.Q());
defparam syn__2249_.coord_x = 5;
defparam syn__2249_.coord_y = 3;
defparam syn__2249_.coord_z = 12;
defparam syn__2249_.mask = 16'hDE12;
defparam syn__2249_.modeMux = 1'b0;
defparam syn__2249_.FeedbackMux = 1'b0;
defparam syn__2249_.ShiftMux = 1'b0;
defparam syn__2249_.BypassEn = 1'b0;
defparam syn__2249_.CarryEnb = 1'b1;

alta_slice syn__2250_(
	.A(\tc2.IM [6]),
	.B(syn__0688_),
	.C(syn__0118_),
	.D(\tc2.IM [5]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0683_),
	.Cout(),
	.Q());
defparam syn__2250_.coord_x = 7;
defparam syn__2250_.coord_y = 3;
defparam syn__2250_.coord_z = 2;
defparam syn__2250_.mask = 16'hAAE4;
defparam syn__2250_.modeMux = 1'b0;
defparam syn__2250_.FeedbackMux = 1'b0;
defparam syn__2250_.ShiftMux = 1'b0;
defparam syn__2250_.BypassEn = 1'b0;
defparam syn__2250_.CarryEnb = 1'b1;

alta_slice syn__2251_(
	.A(syn__0683_),
	.B(syn__0686_),
	.C(syn__0678_),
	.D(\tc2.IM [5]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0684_),
	.Cout(),
	.Q());
defparam syn__2251_.coord_x = 8;
defparam syn__2251_.coord_y = 3;
defparam syn__2251_.coord_z = 6;
defparam syn__2251_.mask = 16'hD8AA;
defparam syn__2251_.modeMux = 1'b0;
defparam syn__2251_.FeedbackMux = 1'b0;
defparam syn__2251_.ShiftMux = 1'b0;
defparam syn__2251_.BypassEn = 1'b0;
defparam syn__2251_.CarryEnb = 1'b1;

alta_slice syn__2252_(
	.A(IOvalue2[26]),
	.B(\tc2.IM [7]),
	.C(IOaddr2[26]),
	.D(\tc2.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0685_),
	.Cout(),
	.Q());
defparam syn__2252_.coord_x = 9;
defparam syn__2252_.coord_y = 4;
defparam syn__2252_.coord_z = 8;
defparam syn__2252_.mask = 16'hB717;
defparam syn__2252_.modeMux = 1'b0;
defparam syn__2252_.FeedbackMux = 1'b0;
defparam syn__2252_.ShiftMux = 1'b0;
defparam syn__2252_.BypassEn = 1'b0;
defparam syn__2252_.CarryEnb = 1'b1;

alta_slice syn__2253_(
	.A(syn__0685_),
	.B(vcc),
	.C(\tc2.IM [9]),
	.D(syn__0117_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0686_),
	.Cout(),
	.Q());
defparam syn__2253_.coord_x = 8;
defparam syn__2253_.coord_y = 3;
defparam syn__2253_.coord_z = 13;
defparam syn__2253_.mask = 16'hA0AF;
defparam syn__2253_.modeMux = 1'b0;
defparam syn__2253_.FeedbackMux = 1'b0;
defparam syn__2253_.ShiftMux = 1'b0;
defparam syn__2253_.BypassEn = 1'b0;
defparam syn__2253_.CarryEnb = 1'b1;

alta_slice syn__2254_(
	.A(\tc2.IM [8]),
	.B(\tc2.IM [7]),
	.C(IOvalue2[10]),
	.D(IOaddr2[10]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0687_),
	.Cout(),
	.Q());
defparam syn__2254_.coord_x = 11;
defparam syn__2254_.coord_y = 5;
defparam syn__2254_.coord_z = 12;
defparam syn__2254_.mask = 16'hA33F;
defparam syn__2254_.modeMux = 1'b0;
defparam syn__2254_.FeedbackMux = 1'b0;
defparam syn__2254_.ShiftMux = 1'b0;
defparam syn__2254_.BypassEn = 1'b0;
defparam syn__2254_.CarryEnb = 1'b1;

alta_slice syn__2255_(
	.A(syn__0122_),
	.B(syn__1092_),
	.C(syn__0687_),
	.D(\tc2.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0688_),
	.Cout(),
	.Q());
defparam syn__2255_.coord_x = 12;
defparam syn__2255_.coord_y = 4;
defparam syn__2255_.coord_z = 0;
defparam syn__2255_.mask = 16'hF066;
defparam syn__2255_.modeMux = 1'b0;
defparam syn__2255_.FeedbackMux = 1'b0;
defparam syn__2255_.ShiftMux = 1'b0;
defparam syn__2255_.BypassEn = 1'b0;
defparam syn__2255_.CarryEnb = 1'b1;

alta_slice syn__2256_(
	.A(IOvalue2[25]),
	.B(IOaddr2[25]),
	.C(\tc2.IM [7]),
	.D(\tc2.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0689_),
	.Cout(),
	.Q());
defparam syn__2256_.coord_x = 5;
defparam syn__2256_.coord_y = 5;
defparam syn__2256_.coord_z = 7;
defparam syn__2256_.mask = 16'h9F17;
defparam syn__2256_.modeMux = 1'b0;
defparam syn__2256_.FeedbackMux = 1'b0;
defparam syn__2256_.ShiftMux = 1'b0;
defparam syn__2256_.BypassEn = 1'b0;
defparam syn__2256_.CarryEnb = 1'b1;

alta_slice syn__2257_(
	.A(syn__0689_),
	.B(syn__1082_),
	.C(syn__0125_),
	.D(\tc2.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0690_),
	.Cout(),
	.Q());
defparam syn__2257_.coord_x = 5;
defparam syn__2257_.coord_y = 4;
defparam syn__2257_.coord_z = 12;
defparam syn__2257_.mask = 16'hAA3C;
defparam syn__2257_.modeMux = 1'b0;
defparam syn__2257_.FeedbackMux = 1'b0;
defparam syn__2257_.ShiftMux = 1'b0;
defparam syn__2257_.BypassEn = 1'b0;
defparam syn__2257_.CarryEnb = 1'b1;

alta_slice syn__2258_(
	.A(IOaddr2[17]),
	.B(IOvalue2[17]),
	.C(\tc2.IM [7]),
	.D(\tc2.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0691_),
	.Cout(),
	.Q());
defparam syn__2258_.coord_x = 12;
defparam syn__2258_.coord_y = 1;
defparam syn__2258_.coord_z = 4;
defparam syn__2258_.mask = 16'h9F17;
defparam syn__2258_.modeMux = 1'b0;
defparam syn__2258_.FeedbackMux = 1'b0;
defparam syn__2258_.ShiftMux = 1'b0;
defparam syn__2258_.BypassEn = 1'b0;
defparam syn__2258_.CarryEnb = 1'b1;

alta_slice syn__2259_(
	.A(syn__0128_),
	.B(syn__0127_),
	.C(syn__0691_),
	.D(\tc2.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0692_),
	.Cout(),
	.Q());
defparam syn__2259_.coord_x = 12;
defparam syn__2259_.coord_y = 1;
defparam syn__2259_.coord_z = 5;
defparam syn__2259_.mask = 16'hF066;
defparam syn__2259_.modeMux = 1'b0;
defparam syn__2259_.FeedbackMux = 1'b0;
defparam syn__2259_.ShiftMux = 1'b0;
defparam syn__2259_.BypassEn = 1'b0;
defparam syn__2259_.CarryEnb = 1'b1;

alta_slice syn__2260_(
	.A(IOvalue2[9]),
	.B(IOaddr2[9]),
	.C(\tc2.IM [7]),
	.D(\tc2.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0693_),
	.Cout(),
	.Q());
defparam syn__2260_.coord_x = 9;
defparam syn__2260_.coord_y = 1;
defparam syn__2260_.coord_z = 14;
defparam syn__2260_.mask = 16'h60E8;
defparam syn__2260_.modeMux = 1'b0;
defparam syn__2260_.FeedbackMux = 1'b0;
defparam syn__2260_.ShiftMux = 1'b0;
defparam syn__2260_.BypassEn = 1'b0;
defparam syn__2260_.CarryEnb = 1'b1;

alta_slice syn__2261_(
	.A(vcc),
	.B(syn__0130_),
	.C(syn__0693_),
	.D(\tc2.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0694_),
	.Cout(),
	.Q());
defparam syn__2261_.coord_x = 9;
defparam syn__2261_.coord_y = 4;
defparam syn__2261_.coord_z = 13;
defparam syn__2261_.mask = 16'h0333;
defparam syn__2261_.modeMux = 1'b0;
defparam syn__2261_.FeedbackMux = 1'b0;
defparam syn__2261_.ShiftMux = 1'b0;
defparam syn__2261_.BypassEn = 1'b0;
defparam syn__2261_.CarryEnb = 1'b1;

alta_slice syn__2262_(
	.A(IOvalue2[16]),
	.B(IOaddr2[16]),
	.C(\tc2.IM [7]),
	.D(\tc2.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0695_),
	.Cout(),
	.Q());
defparam syn__2262_.coord_x = 12;
defparam syn__2262_.coord_y = 1;
defparam syn__2262_.coord_z = 6;
defparam syn__2262_.mask = 16'h9F17;
defparam syn__2262_.modeMux = 1'b0;
defparam syn__2262_.FeedbackMux = 1'b0;
defparam syn__2262_.ShiftMux = 1'b0;
defparam syn__2262_.BypassEn = 1'b0;
defparam syn__2262_.CarryEnb = 1'b1;

alta_slice syn__2263_(
	.A(syn__0135_),
	.B(syn__1088_),
	.C(syn__0695_),
	.D(\tc2.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0696_),
	.Cout(),
	.Q());
defparam syn__2263_.coord_x = 12;
defparam syn__2263_.coord_y = 1;
defparam syn__2263_.coord_z = 1;
defparam syn__2263_.mask = 16'hF099;
defparam syn__2263_.modeMux = 1'b0;
defparam syn__2263_.FeedbackMux = 1'b0;
defparam syn__2263_.ShiftMux = 1'b0;
defparam syn__2263_.BypassEn = 1'b0;
defparam syn__2263_.CarryEnb = 1'b1;

alta_slice syn__2264_(
	.A(syn__0700_),
	.B(syn__0670_),
	.C(\tc2.IM [6]),
	.D(\tc2.IM [5]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0697_),
	.Cout(),
	.Q());
defparam syn__2264_.coord_x = 7;
defparam syn__2264_.coord_y = 3;
defparam syn__2264_.coord_z = 12;
defparam syn__2264_.mask = 16'hF0AC;
defparam syn__2264_.modeMux = 1'b0;
defparam syn__2264_.FeedbackMux = 1'b0;
defparam syn__2264_.ShiftMux = 1'b0;
defparam syn__2264_.BypassEn = 1'b0;
defparam syn__2264_.CarryEnb = 1'b1;

alta_slice syn__2265_(
	.A(syn__0697_),
	.B(syn__0668_),
	.C(\tc2.IM [5]),
	.D(syn__0137_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0698_),
	.Cout(),
	.Q());
defparam syn__2265_.coord_x = 8;
defparam syn__2265_.coord_y = 4;
defparam syn__2265_.coord_z = 2;
defparam syn__2265_.mask = 16'hDA8A;
defparam syn__2265_.modeMux = 1'b0;
defparam syn__2265_.FeedbackMux = 1'b0;
defparam syn__2265_.ShiftMux = 1'b0;
defparam syn__2265_.BypassEn = 1'b0;
defparam syn__2265_.CarryEnb = 1'b1;

alta_slice syn__2266_(
	.A(\tc2.IM [8]),
	.B(IOvalue2[15]),
	.C(\tc2.IM [7]),
	.D(IOaddr2[15]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0699_),
	.Cout(),
	.Q());
defparam syn__2266_.coord_x = 12;
defparam syn__2266_.coord_y = 2;
defparam syn__2266_.coord_z = 1;
defparam syn__2266_.mask = 16'h74C0;
defparam syn__2266_.modeMux = 1'b0;
defparam syn__2266_.FeedbackMux = 1'b0;
defparam syn__2266_.ShiftMux = 1'b0;
defparam syn__2266_.BypassEn = 1'b0;
defparam syn__2266_.CarryEnb = 1'b1;

alta_slice syn__2267_(
	.A(vcc),
	.B(syn__0148_),
	.C(\tc2.IM [9]),
	.D(syn__0699_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0700_),
	.Cout(),
	.Q());
defparam syn__2267_.coord_x = 12;
defparam syn__2267_.coord_y = 2;
defparam syn__2267_.coord_z = 12;
defparam syn__2267_.mask = 16'h0333;
defparam syn__2267_.modeMux = 1'b0;
defparam syn__2267_.FeedbackMux = 1'b0;
defparam syn__2267_.ShiftMux = 1'b0;
defparam syn__2267_.BypassEn = 1'b0;
defparam syn__2267_.CarryEnb = 1'b1;

alta_slice syn__2268_(
	.A(IOvalue2[22]),
	.B(\tc2.IM [7]),
	.C(IOaddr2[22]),
	.D(\tc2.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0701_),
	.Cout(),
	.Q());
defparam syn__2268_.coord_x = 9;
defparam syn__2268_.coord_y = 4;
defparam syn__2268_.coord_z = 10;
defparam syn__2268_.mask = 16'hB717;
defparam syn__2268_.modeMux = 1'b0;
defparam syn__2268_.FeedbackMux = 1'b0;
defparam syn__2268_.ShiftMux = 1'b0;
defparam syn__2268_.BypassEn = 1'b0;
defparam syn__2268_.CarryEnb = 1'b1;

alta_slice syn__2269_(
	.A(syn__0152_),
	.B(\tc2.IM [9]),
	.C(syn__0701_),
	.D(syn__1084_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0702_),
	.Cout(),
	.Q());
defparam syn__2269_.coord_x = 8;
defparam syn__2269_.coord_y = 4;
defparam syn__2269_.coord_z = 5;
defparam syn__2269_.mask = 16'hD1E2;
defparam syn__2269_.modeMux = 1'b0;
defparam syn__2269_.FeedbackMux = 1'b0;
defparam syn__2269_.ShiftMux = 1'b0;
defparam syn__2269_.BypassEn = 1'b0;
defparam syn__2269_.CarryEnb = 1'b1;

alta_slice syn__2270_(
	.A(\tc2.IM [7]),
	.B(IOvalue2[6]),
	.C(\tc2.IM [8]),
	.D(IOaddr2[6]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0703_),
	.Cout(),
	.Q());
defparam syn__2270_.coord_x = 6;
defparam syn__2270_.coord_y = 4;
defparam syn__2270_.coord_z = 8;
defparam syn__2270_.mask = 16'h2E88;
defparam syn__2270_.modeMux = 1'b0;
defparam syn__2270_.FeedbackMux = 1'b0;
defparam syn__2270_.ShiftMux = 1'b0;
defparam syn__2270_.BypassEn = 1'b0;
defparam syn__2270_.CarryEnb = 1'b1;

alta_slice syn__2271_(
	.A(vcc),
	.B(\tc2.IM [9]),
	.C(syn__0703_),
	.D(syn__0159_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0704_),
	.Cout(),
	.Q());
defparam syn__2271_.coord_x = 6;
defparam syn__2271_.coord_y = 4;
defparam syn__2271_.coord_z = 9;
defparam syn__2271_.mask = 16'h003F;
defparam syn__2271_.modeMux = 1'b0;
defparam syn__2271_.FeedbackMux = 1'b0;
defparam syn__2271_.ShiftMux = 1'b0;
defparam syn__2271_.BypassEn = 1'b0;
defparam syn__2271_.CarryEnb = 1'b1;

alta_slice syn__2272_(
	.A(IOvalue2[21]),
	.B(IOaddr2[21]),
	.C(\tc2.IM [7]),
	.D(\tc2.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0705_),
	.Cout(),
	.Q());
defparam syn__2272_.coord_x = 5;
defparam syn__2272_.coord_y = 3;
defparam syn__2272_.coord_z = 11;
defparam syn__2272_.mask = 16'h9F17;
defparam syn__2272_.modeMux = 1'b0;
defparam syn__2272_.FeedbackMux = 1'b0;
defparam syn__2272_.ShiftMux = 1'b0;
defparam syn__2272_.BypassEn = 1'b0;
defparam syn__2272_.CarryEnb = 1'b1;

alta_slice syn__2273_(
	.A(\tc2.IM [9]),
	.B(syn__0705_),
	.C(syn__0162_),
	.D(syn__0161_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0706_),
	.Cout(),
	.Q());
defparam syn__2273_.coord_x = 5;
defparam syn__2273_.coord_y = 3;
defparam syn__2273_.coord_z = 10;
defparam syn__2273_.mask = 16'h8DD8;
defparam syn__2273_.modeMux = 1'b0;
defparam syn__2273_.FeedbackMux = 1'b0;
defparam syn__2273_.ShiftMux = 1'b0;
defparam syn__2273_.BypassEn = 1'b0;
defparam syn__2273_.CarryEnb = 1'b1;

alta_slice syn__2274_(
	.A(syn__0712_),
	.B(syn__0710_),
	.C(\tc2.IM [6]),
	.D(\tc2.IM [5]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0707_),
	.Cout(),
	.Q());
defparam syn__2274_.coord_x = 7;
defparam syn__2274_.coord_y = 3;
defparam syn__2274_.coord_z = 8;
defparam syn__2274_.mask = 16'hF0CA;
defparam syn__2274_.modeMux = 1'b0;
defparam syn__2274_.FeedbackMux = 1'b0;
defparam syn__2274_.ShiftMux = 1'b0;
defparam syn__2274_.BypassEn = 1'b0;
defparam syn__2274_.CarryEnb = 1'b1;

alta_slice syn__2275_(
	.A(syn__0707_),
	.B(syn__0110_),
	.C(syn__0674_),
	.D(\tc2.IM [5]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0708_),
	.Cout(),
	.Q());
defparam syn__2275_.coord_x = 11;
defparam syn__2275_.coord_y = 3;
defparam syn__2275_.coord_z = 2;
defparam syn__2275_.mask = 16'hD8AA;
defparam syn__2275_.modeMux = 1'b0;
defparam syn__2275_.FeedbackMux = 1'b0;
defparam syn__2275_.ShiftMux = 1'b0;
defparam syn__2275_.BypassEn = 1'b0;
defparam syn__2275_.CarryEnb = 1'b1;

alta_slice syn__2276_(
	.A(IOvalue2[12]),
	.B(IOaddr2[12]),
	.C(\tc2.IM [7]),
	.D(\tc2.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0709_),
	.Cout(),
	.Q());
defparam syn__2276_.coord_x = 12;
defparam syn__2276_.coord_y = 4;
defparam syn__2276_.coord_z = 12;
defparam syn__2276_.mask = 16'h9F17;
defparam syn__2276_.modeMux = 1'b0;
defparam syn__2276_.FeedbackMux = 1'b0;
defparam syn__2276_.ShiftMux = 1'b0;
defparam syn__2276_.BypassEn = 1'b0;
defparam syn__2276_.CarryEnb = 1'b1;

alta_slice syn__2277_(
	.A(syn__0709_),
	.B(syn__0165_),
	.C(syn__0166_),
	.D(\tc2.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0710_),
	.Cout(),
	.Q());
defparam syn__2277_.coord_x = 12;
defparam syn__2277_.coord_y = 4;
defparam syn__2277_.coord_z = 13;
defparam syn__2277_.mask = 16'hAA3C;
defparam syn__2277_.modeMux = 1'b0;
defparam syn__2277_.FeedbackMux = 1'b0;
defparam syn__2277_.ShiftMux = 1'b0;
defparam syn__2277_.BypassEn = 1'b0;
defparam syn__2277_.CarryEnb = 1'b1;

alta_slice syn__2278_(
	.A(\tc2.IM [8]),
	.B(\tc2.IM [7]),
	.C(IOaddr2[4]),
	.D(IOvalue2[4]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0711_),
	.Cout(),
	.Q());
defparam syn__2278_.coord_x = 5;
defparam syn__2278_.coord_y = 2;
defparam syn__2278_.coord_z = 0;
defparam syn__2278_.mask = 16'hA33F;
defparam syn__2278_.modeMux = 1'b0;
defparam syn__2278_.FeedbackMux = 1'b0;
defparam syn__2278_.ShiftMux = 1'b0;
defparam syn__2278_.BypassEn = 1'b0;
defparam syn__2278_.CarryEnb = 1'b1;

alta_slice syn__2279_(
	.A(syn__0167_),
	.B(syn__1096_),
	.C(syn__0711_),
	.D(\tc2.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0712_),
	.Cout(),
	.Q());
defparam syn__2279_.coord_x = 5;
defparam syn__2279_.coord_y = 2;
defparam syn__2279_.coord_z = 1;
defparam syn__2279_.mask = 16'hF066;
defparam syn__2279_.modeMux = 1'b0;
defparam syn__2279_.FeedbackMux = 1'b0;
defparam syn__2279_.ShiftMux = 1'b0;
defparam syn__2279_.BypassEn = 1'b0;
defparam syn__2279_.CarryEnb = 1'b1;

alta_slice syn__2280_(
	.A(IOaddr2[2]),
	.B(\tc2.IM [7]),
	.C(IOvalue2[2]),
	.D(\tc2.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0713_),
	.Cout(),
	.Q());
defparam syn__2280_.coord_x = 9;
defparam syn__2280_.coord_y = 2;
defparam syn__2280_.coord_z = 6;
defparam syn__2280_.mask = 16'hB717;
defparam syn__2280_.modeMux = 1'b0;
defparam syn__2280_.FeedbackMux = 1'b0;
defparam syn__2280_.ShiftMux = 1'b0;
defparam syn__2280_.BypassEn = 1'b0;
defparam syn__2280_.CarryEnb = 1'b1;

alta_slice syn__2281_(
	.A(\tc2.IM [9]),
	.B(syn__0713_),
	.C(vcc),
	.D(syn__0175_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0714_),
	.Cout(),
	.Q());
defparam syn__2281_.coord_x = 8;
defparam syn__2281_.coord_y = 4;
defparam syn__2281_.coord_z = 6;
defparam syn__2281_.mask = 16'h88DD;
defparam syn__2281_.modeMux = 1'b0;
defparam syn__2281_.FeedbackMux = 1'b0;
defparam syn__2281_.ShiftMux = 1'b0;
defparam syn__2281_.BypassEn = 1'b0;
defparam syn__2281_.CarryEnb = 1'b1;

alta_slice syn__2282_(
	.A(IOaddr2[1]),
	.B(\tc2.IM [8]),
	.C(\tc2.IM [7]),
	.D(IOvalue2[1]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0715_),
	.Cout(),
	.Q());
defparam syn__2282_.coord_x = 11;
defparam syn__2282_.coord_y = 2;
defparam syn__2282_.coord_z = 10;
defparam syn__2282_.mask = 16'h8D5F;
defparam syn__2282_.modeMux = 1'b0;
defparam syn__2282_.FeedbackMux = 1'b0;
defparam syn__2282_.ShiftMux = 1'b0;
defparam syn__2282_.BypassEn = 1'b0;
defparam syn__2282_.CarryEnb = 1'b1;

alta_slice syn__2283_(
	.A(\tc2.IM [9]),
	.B(syn__0179_),
	.C(syn__0715_),
	.D(syn__0003_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0716_),
	.Cout(),
	.Q());
defparam syn__2283_.coord_x = 11;
defparam syn__2283_.coord_y = 2;
defparam syn__2283_.coord_z = 12;
defparam syn__2283_.mask = 16'hE4B1;
defparam syn__2283_.modeMux = 1'b0;
defparam syn__2283_.FeedbackMux = 1'b0;
defparam syn__2283_.ShiftMux = 1'b0;
defparam syn__2283_.BypassEn = 1'b0;
defparam syn__2283_.CarryEnb = 1'b1;

alta_slice syn__2284_(
	.A(syn__0714_),
	.B(syn__0682_),
	.C(\tc2.IM [6]),
	.D(\tc2.IM [5]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0717_),
	.Cout(),
	.Q());
defparam syn__2284_.coord_x = 7;
defparam syn__2284_.coord_y = 3;
defparam syn__2284_.coord_z = 14;
defparam syn__2284_.mask = 16'hACF0;
defparam syn__2284_.modeMux = 1'b0;
defparam syn__2284_.FeedbackMux = 1'b0;
defparam syn__2284_.ShiftMux = 1'b0;
defparam syn__2284_.BypassEn = 1'b0;
defparam syn__2284_.CarryEnb = 1'b1;

alta_slice syn__2285_(
	.A(syn__0717_),
	.B(syn__0686_),
	.C(syn__0118_),
	.D(\tc2.IM [5]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0718_),
	.Cout(),
	.Q());
defparam syn__2285_.coord_x = 8;
defparam syn__2285_.coord_y = 3;
defparam syn__2285_.coord_z = 0;
defparam syn__2285_.mask = 16'hAAD8;
defparam syn__2285_.modeMux = 1'b0;
defparam syn__2285_.FeedbackMux = 1'b0;
defparam syn__2285_.ShiftMux = 1'b0;
defparam syn__2285_.BypassEn = 1'b0;
defparam syn__2285_.CarryEnb = 1'b1;

alta_slice syn__2286_(
	.A(\tc2.IM [6]),
	.B(\tc2.IM [5]),
	.C(syn__0690_),
	.D(syn__0716_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0719_),
	.Cout(),
	.Q());
defparam syn__2286_.coord_x = 7;
defparam syn__2286_.coord_y = 3;
defparam syn__2286_.coord_z = 3;
defparam syn__2286_.mask = 16'hBA98;
defparam syn__2286_.modeMux = 1'b0;
defparam syn__2286_.FeedbackMux = 1'b0;
defparam syn__2286_.ShiftMux = 1'b0;
defparam syn__2286_.BypassEn = 1'b0;
defparam syn__2286_.CarryEnb = 1'b1;

alta_slice syn__2287_(
	.A(syn__0719_),
	.B(syn__0686_),
	.C(syn__0694_),
	.D(\tc2.IM [5]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0720_),
	.Cout(),
	.Q());
defparam syn__2287_.coord_x = 8;
defparam syn__2287_.coord_y = 3;
defparam syn__2287_.coord_z = 12;
defparam syn__2287_.mask = 16'hE4AA;
defparam syn__2287_.modeMux = 1'b0;
defparam syn__2287_.FeedbackMux = 1'b0;
defparam syn__2287_.ShiftMux = 1'b0;
defparam syn__2287_.BypassEn = 1'b0;
defparam syn__2287_.CarryEnb = 1'b1;

alta_slice syn__2288_(
	.A(syn__0714_),
	.B(vcc),
	.C(\tc2.IM [5]),
	.D(syn__0688_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0721_),
	.Cout(),
	.Q());
defparam syn__2288_.coord_x = 8;
defparam syn__2288_.coord_y = 4;
defparam syn__2288_.coord_z = 1;
defparam syn__2288_.mask = 16'hFA0A;
defparam syn__2288_.modeMux = 1'b0;
defparam syn__2288_.FeedbackMux = 1'b0;
defparam syn__2288_.ShiftMux = 1'b0;
defparam syn__2288_.BypassEn = 1'b0;
defparam syn__2288_.CarryEnb = 1'b1;

alta_slice syn__2289_(
	.A(syn__0721_),
	.B(syn__0686_),
	.C(\tc2.IM [6]),
	.D(\tc2.IM [5]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0722_),
	.Cout(),
	.Q());
defparam syn__2289_.coord_x = 7;
defparam syn__2289_.coord_y = 3;
defparam syn__2289_.coord_z = 9;
defparam syn__2289_.mask = 16'hAFAC;
defparam syn__2289_.modeMux = 1'b0;
defparam syn__2289_.FeedbackMux = 1'b0;
defparam syn__2289_.ShiftMux = 1'b0;
defparam syn__2289_.BypassEn = 1'b0;
defparam syn__2289_.CarryEnb = 1'b1;

alta_slice syn__2290_(
	.A(syn__0672_),
	.B(syn__0706_),
	.C(\tc2.IM [6]),
	.D(\tc2.IM [5]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0723_),
	.Cout(),
	.Q());
defparam syn__2290_.coord_x = 7;
defparam syn__2290_.coord_y = 3;
defparam syn__2290_.coord_z = 0;
defparam syn__2290_.mask = 16'hF0CA;
defparam syn__2290_.modeMux = 1'b0;
defparam syn__2290_.FeedbackMux = 1'b0;
defparam syn__2290_.ShiftMux = 1'b0;
defparam syn__2290_.BypassEn = 1'b0;
defparam syn__2290_.CarryEnb = 1'b1;

alta_slice syn__2291_(
	.A(\tc2.IM [5]),
	.B(syn__0081_),
	.C(syn__0723_),
	.D(syn__0154_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0724_),
	.Cout(),
	.Q());
defparam syn__2291_.coord_x = 8;
defparam syn__2291_.coord_y = 4;
defparam syn__2291_.coord_z = 7;
defparam syn__2291_.mask = 16'hDAD0;
defparam syn__2291_.modeMux = 1'b0;
defparam syn__2291_.FeedbackMux = 1'b0;
defparam syn__2291_.ShiftMux = 1'b0;
defparam syn__2291_.BypassEn = 1'b0;
defparam syn__2291_.CarryEnb = 1'b1;

alta_slice syn__2292_(
	.A(syn__0712_),
	.B(vcc),
	.C(\tc2.IM [5]),
	.D(syn__0710_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0725_),
	.Cout(),
	.Q());
defparam syn__2292_.coord_x = 8;
defparam syn__2292_.coord_y = 2;
defparam syn__2292_.coord_z = 6;
defparam syn__2292_.mask = 16'hFA0A;
defparam syn__2292_.modeMux = 1'b0;
defparam syn__2292_.FeedbackMux = 1'b0;
defparam syn__2292_.ShiftMux = 1'b0;
defparam syn__2292_.BypassEn = 1'b0;
defparam syn__2292_.CarryEnb = 1'b1;

alta_slice syn__2293_(
	.A(syn__0725_),
	.B(syn__0676_),
	.C(\tc2.IM [6]),
	.D(\tc2.IM [5]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0726_),
	.Cout(),
	.Q());
defparam syn__2293_.coord_x = 8;
defparam syn__2293_.coord_y = 3;
defparam syn__2293_.coord_z = 3;
defparam syn__2293_.mask = 16'hAFAC;
defparam syn__2293_.modeMux = 1'b0;
defparam syn__2293_.FeedbackMux = 1'b0;
defparam syn__2293_.ShiftMux = 1'b0;
defparam syn__2293_.BypassEn = 1'b0;
defparam syn__2293_.CarryEnb = 1'b1;

alta_slice syn__2294_(
	.A(IOaddr3[15]),
	.B(IOvalue3[15]),
	.C(\tc3.IM [7]),
	.D(\tc3.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0727_),
	.Cout(),
	.Q());
defparam syn__2294_.coord_x = 1;
defparam syn__2294_.coord_y = 4;
defparam syn__2294_.coord_z = 2;
defparam syn__2294_.mask = 16'h60E8;
defparam syn__2294_.modeMux = 1'b0;
defparam syn__2294_.FeedbackMux = 1'b0;
defparam syn__2294_.ShiftMux = 1'b0;
defparam syn__2294_.BypassEn = 1'b0;
defparam syn__2294_.CarryEnb = 1'b1;

alta_slice syn__2295_(
	.A(vcc),
	.B(syn__0727_),
	.C(syn__0326_),
	.D(\tc3.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0728_),
	.Cout(),
	.Q());
defparam syn__2295_.coord_x = 1;
defparam syn__2295_.coord_y = 4;
defparam syn__2295_.coord_z = 3;
defparam syn__2295_.mask = 16'h030F;
defparam syn__2295_.modeMux = 1'b0;
defparam syn__2295_.FeedbackMux = 1'b0;
defparam syn__2295_.ShiftMux = 1'b0;
defparam syn__2295_.BypassEn = 1'b0;
defparam syn__2295_.CarryEnb = 1'b1;

alta_slice syn__2296_(
	.A(IOaddr3[7]),
	.B(IOvalue3[7]),
	.C(\tc3.IM [7]),
	.D(\tc3.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0729_),
	.Cout(),
	.Q());
defparam syn__2296_.coord_x = 4;
defparam syn__2296_.coord_y = 5;
defparam syn__2296_.coord_z = 2;
defparam syn__2296_.mask = 16'h9F17;
defparam syn__2296_.modeMux = 1'b0;
defparam syn__2296_.FeedbackMux = 1'b0;
defparam syn__2296_.ShiftMux = 1'b0;
defparam syn__2296_.BypassEn = 1'b0;
defparam syn__2296_.CarryEnb = 1'b1;

alta_slice syn__2297_(
	.A(syn__0729_),
	.B(syn__0254_),
	.C(syn__0329_),
	.D(\tc3.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0730_),
	.Cout(),
	.Q());
defparam syn__2297_.coord_x = 4;
defparam syn__2297_.coord_y = 5;
defparam syn__2297_.coord_z = 1;
defparam syn__2297_.mask = 16'hAA3C;
defparam syn__2297_.modeMux = 1'b0;
defparam syn__2297_.FeedbackMux = 1'b0;
defparam syn__2297_.ShiftMux = 1'b0;
defparam syn__2297_.BypassEn = 1'b0;
defparam syn__2297_.CarryEnb = 1'b1;

alta_slice syn__2298_(
	.A(IOvalue3[21]),
	.B(IOaddr3[21]),
	.C(\tc3.IM [7]),
	.D(\tc3.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0731_),
	.Cout(),
	.Q());
defparam syn__2298_.coord_x = 0;
defparam syn__2298_.coord_y = 4;
defparam syn__2298_.coord_z = 5;
defparam syn__2298_.mask = 16'h9F17;
defparam syn__2298_.modeMux = 1'b0;
defparam syn__2298_.FeedbackMux = 1'b0;
defparam syn__2298_.ShiftMux = 1'b0;
defparam syn__2298_.BypassEn = 1'b0;
defparam syn__2298_.CarryEnb = 1'b1;

alta_slice syn__2299_(
	.A(syn__0345_),
	.B(\tc3.IM [9]),
	.C(syn__0731_),
	.D(syn__0245_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0732_),
	.Cout(),
	.Q());
defparam syn__2299_.coord_x = 0;
defparam syn__2299_.coord_y = 3;
defparam syn__2299_.coord_z = 3;
defparam syn__2299_.mask = 16'hD1E2;
defparam syn__2299_.modeMux = 1'b0;
defparam syn__2299_.FeedbackMux = 1'b0;
defparam syn__2299_.ShiftMux = 1'b0;
defparam syn__2299_.BypassEn = 1'b0;
defparam syn__2299_.CarryEnb = 1'b1;

alta_slice syn__2300_(
	.A(IOaddr3[13]),
	.B(IOvalue3[13]),
	.C(\tc3.IM [7]),
	.D(\tc3.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0733_),
	.Cout(),
	.Q());
defparam syn__2300_.coord_x = 2;
defparam syn__2300_.coord_y = 2;
defparam syn__2300_.coord_z = 2;
defparam syn__2300_.mask = 16'h9F17;
defparam syn__2300_.modeMux = 1'b0;
defparam syn__2300_.FeedbackMux = 1'b0;
defparam syn__2300_.ShiftMux = 1'b0;
defparam syn__2300_.BypassEn = 1'b0;
defparam syn__2300_.CarryEnb = 1'b1;

alta_slice syn__2301_(
	.A(syn__0351_),
	.B(syn__0250_),
	.C(syn__0733_),
	.D(\tc3.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0734_),
	.Cout(),
	.Q());
defparam syn__2301_.coord_x = 2;
defparam syn__2301_.coord_y = 2;
defparam syn__2301_.coord_z = 13;
defparam syn__2301_.mask = 16'hF066;
defparam syn__2301_.modeMux = 1'b0;
defparam syn__2301_.FeedbackMux = 1'b0;
defparam syn__2301_.ShiftMux = 1'b0;
defparam syn__2301_.BypassEn = 1'b0;
defparam syn__2301_.CarryEnb = 1'b1;

alta_slice syn__2302_(
	.A(IOvalue3[27]),
	.B(IOaddr3[27]),
	.C(\tc3.IM [7]),
	.D(\tc3.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0735_),
	.Cout(),
	.Q());
defparam syn__2302_.coord_x = 0;
defparam syn__2302_.coord_y = 4;
defparam syn__2302_.coord_z = 11;
defparam syn__2302_.mask = 16'h9F17;
defparam syn__2302_.modeMux = 1'b0;
defparam syn__2302_.FeedbackMux = 1'b0;
defparam syn__2302_.ShiftMux = 1'b0;
defparam syn__2302_.BypassEn = 1'b0;
defparam syn__2302_.CarryEnb = 1'b1;

alta_slice syn__2303_(
	.A(syn__0355_),
	.B(syn__0735_),
	.C(syn__0241_),
	.D(\tc3.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0736_),
	.Cout(),
	.Q());
defparam syn__2303_.coord_x = 1;
defparam syn__2303_.coord_y = 4;
defparam syn__2303_.coord_z = 1;
defparam syn__2303_.mask = 16'hCC5A;
defparam syn__2303_.modeMux = 1'b0;
defparam syn__2303_.FeedbackMux = 1'b0;
defparam syn__2303_.ShiftMux = 1'b0;
defparam syn__2303_.BypassEn = 1'b0;
defparam syn__2303_.CarryEnb = 1'b1;

alta_slice syn__2304_(
	.A(IOvalue3[19]),
	.B(IOaddr3[19]),
	.C(\tc3.IM [7]),
	.D(\tc3.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0737_),
	.Cout(),
	.Q());
defparam syn__2304_.coord_x = 0;
defparam syn__2304_.coord_y = 4;
defparam syn__2304_.coord_z = 14;
defparam syn__2304_.mask = 16'h9F17;
defparam syn__2304_.modeMux = 1'b0;
defparam syn__2304_.FeedbackMux = 1'b0;
defparam syn__2304_.ShiftMux = 1'b0;
defparam syn__2304_.BypassEn = 1'b0;
defparam syn__2304_.CarryEnb = 1'b1;

alta_slice syn__2305_(
	.A(syn__0363_),
	.B(syn__0362_),
	.C(syn__0737_),
	.D(\tc3.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0738_),
	.Cout(),
	.Q());
defparam syn__2305_.coord_x = 0;
defparam syn__2305_.coord_y = 2;
defparam syn__2305_.coord_z = 9;
defparam syn__2305_.mask = 16'hF066;
defparam syn__2305_.modeMux = 1'b0;
defparam syn__2305_.FeedbackMux = 1'b0;
defparam syn__2305_.ShiftMux = 1'b0;
defparam syn__2305_.BypassEn = 1'b0;
defparam syn__2305_.CarryEnb = 1'b1;

alta_slice syn__2306_(
	.A(IOaddr3[3]),
	.B(IOvalue3[3]),
	.C(\tc3.IM [7]),
	.D(\tc3.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0739_),
	.Cout(),
	.Q());
defparam syn__2306_.coord_x = 4;
defparam syn__2306_.coord_y = 4;
defparam syn__2306_.coord_z = 2;
defparam syn__2306_.mask = 16'h60E8;
defparam syn__2306_.modeMux = 1'b0;
defparam syn__2306_.FeedbackMux = 1'b0;
defparam syn__2306_.ShiftMux = 1'b0;
defparam syn__2306_.BypassEn = 1'b0;
defparam syn__2306_.CarryEnb = 1'b1;

alta_slice syn__2307_(
	.A(vcc),
	.B(syn__0364_),
	.C(syn__0739_),
	.D(\tc3.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0740_),
	.Cout(),
	.Q());
defparam syn__2307_.coord_x = 0;
defparam syn__2307_.coord_y = 4;
defparam syn__2307_.coord_z = 0;
defparam syn__2307_.mask = 16'h0333;
defparam syn__2307_.modeMux = 1'b0;
defparam syn__2307_.FeedbackMux = 1'b0;
defparam syn__2307_.ShiftMux = 1'b0;
defparam syn__2307_.BypassEn = 1'b0;
defparam syn__2307_.CarryEnb = 1'b1;

alta_slice syn__2308_(
	.A(IOvalue3[18]),
	.B(IOaddr3[18]),
	.C(\tc3.IM [7]),
	.D(\tc3.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0741_),
	.Cout(),
	.Q());
defparam syn__2308_.coord_x = 0;
defparam syn__2308_.coord_y = 4;
defparam syn__2308_.coord_z = 7;
defparam syn__2308_.mask = 16'h9F17;
defparam syn__2308_.modeMux = 1'b0;
defparam syn__2308_.FeedbackMux = 1'b0;
defparam syn__2308_.ShiftMux = 1'b0;
defparam syn__2308_.BypassEn = 1'b0;
defparam syn__2308_.CarryEnb = 1'b1;

alta_slice syn__2309_(
	.A(syn__0369_),
	.B(syn__0741_),
	.C(syn__0247_),
	.D(\tc3.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0742_),
	.Cout(),
	.Q());
defparam syn__2309_.coord_x = 0;
defparam syn__2309_.coord_y = 2;
defparam syn__2309_.coord_z = 7;
defparam syn__2309_.mask = 16'hCC5A;
defparam syn__2309_.modeMux = 1'b0;
defparam syn__2309_.FeedbackMux = 1'b0;
defparam syn__2309_.ShiftMux = 1'b0;
defparam syn__2309_.BypassEn = 1'b0;
defparam syn__2309_.CarryEnb = 1'b1;

alta_slice syn__2310_(
	.A(IOaddr3[10]),
	.B(IOvalue3[10]),
	.C(\tc3.IM [7]),
	.D(\tc3.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0743_),
	.Cout(),
	.Q());
defparam syn__2310_.coord_x = 4;
defparam syn__2310_.coord_y = 3;
defparam syn__2310_.coord_z = 10;
defparam syn__2310_.mask = 16'h9F17;
defparam syn__2310_.modeMux = 1'b0;
defparam syn__2310_.FeedbackMux = 1'b0;
defparam syn__2310_.ShiftMux = 1'b0;
defparam syn__2310_.BypassEn = 1'b0;
defparam syn__2310_.CarryEnb = 1'b1;

alta_slice syn__2311_(
	.A(syn__0743_),
	.B(syn__0252_),
	.C(syn__0370_),
	.D(\tc3.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0744_),
	.Cout(),
	.Q());
defparam syn__2311_.coord_x = 4;
defparam syn__2311_.coord_y = 3;
defparam syn__2311_.coord_z = 15;
defparam syn__2311_.mask = 16'hAA3C;
defparam syn__2311_.modeMux = 1'b0;
defparam syn__2311_.FeedbackMux = 1'b0;
defparam syn__2311_.ShiftMux = 1'b0;
defparam syn__2311_.BypassEn = 1'b0;
defparam syn__2311_.CarryEnb = 1'b1;

alta_slice syn__2312_(
	.A(IOaddr3[11]),
	.B(\tc3.IM [8]),
	.C(\tc3.IM [7]),
	.D(IOvalue3[11]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0745_),
	.Cout(),
	.Q());
defparam syn__2312_.coord_x = 4;
defparam syn__2312_.coord_y = 3;
defparam syn__2312_.coord_z = 12;
defparam syn__2312_.mask = 16'h8D5F;
defparam syn__2312_.modeMux = 1'b0;
defparam syn__2312_.FeedbackMux = 1'b0;
defparam syn__2312_.ShiftMux = 1'b0;
defparam syn__2312_.BypassEn = 1'b0;
defparam syn__2312_.CarryEnb = 1'b1;

alta_slice syn__2313_(
	.A(syn__0374_),
	.B(syn__0373_),
	.C(syn__0745_),
	.D(\tc3.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0746_),
	.Cout(),
	.Q());
defparam syn__2313_.coord_x = 4;
defparam syn__2313_.coord_y = 3;
defparam syn__2313_.coord_z = 9;
defparam syn__2313_.mask = 16'hF066;
defparam syn__2313_.modeMux = 1'b0;
defparam syn__2313_.FeedbackMux = 1'b0;
defparam syn__2313_.ShiftMux = 1'b0;
defparam syn__2313_.BypassEn = 1'b0;
defparam syn__2313_.CarryEnb = 1'b1;

alta_slice syn__2314_(
	.A(IOvalue3[25]),
	.B(IOaddr3[25]),
	.C(\tc3.IM [7]),
	.D(\tc3.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0747_),
	.Cout(),
	.Q());
defparam syn__2314_.coord_x = 0;
defparam syn__2314_.coord_y = 4;
defparam syn__2314_.coord_z = 12;
defparam syn__2314_.mask = 16'h9F17;
defparam syn__2314_.modeMux = 1'b0;
defparam syn__2314_.FeedbackMux = 1'b0;
defparam syn__2314_.ShiftMux = 1'b0;
defparam syn__2314_.BypassEn = 1'b0;
defparam syn__2314_.CarryEnb = 1'b1;

alta_slice syn__2315_(
	.A(syn__0377_),
	.B(vcc),
	.C(syn__0747_),
	.D(\tc3.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0748_),
	.Cout(),
	.Q());
defparam syn__2315_.coord_x = 1;
defparam syn__2315_.coord_y = 4;
defparam syn__2315_.coord_z = 11;
defparam syn__2315_.mask = 16'hF055;
defparam syn__2315_.modeMux = 1'b0;
defparam syn__2315_.FeedbackMux = 1'b0;
defparam syn__2315_.ShiftMux = 1'b0;
defparam syn__2315_.BypassEn = 1'b0;
defparam syn__2315_.CarryEnb = 1'b1;

alta_slice syn__2316_(
	.A(IOvalue3[17]),
	.B(\tc3.IM [7]),
	.C(IOaddr3[17]),
	.D(\tc3.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0749_),
	.Cout(),
	.Q());
defparam syn__2316_.coord_x = 0;
defparam syn__2316_.coord_y = 2;
defparam syn__2316_.coord_z = 14;
defparam syn__2316_.mask = 16'hB717;
defparam syn__2316_.modeMux = 1'b0;
defparam syn__2316_.FeedbackMux = 1'b0;
defparam syn__2316_.ShiftMux = 1'b0;
defparam syn__2316_.BypassEn = 1'b0;
defparam syn__2316_.CarryEnb = 1'b1;

alta_slice syn__2317_(
	.A(syn__0380_),
	.B(syn__0379_),
	.C(syn__0749_),
	.D(\tc3.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0750_),
	.Cout(),
	.Q());
defparam syn__2317_.coord_x = 0;
defparam syn__2317_.coord_y = 2;
defparam syn__2317_.coord_z = 13;
defparam syn__2317_.mask = 16'hF066;
defparam syn__2317_.modeMux = 1'b0;
defparam syn__2317_.FeedbackMux = 1'b0;
defparam syn__2317_.ShiftMux = 1'b0;
defparam syn__2317_.BypassEn = 1'b0;
defparam syn__2317_.CarryEnb = 1'b1;

alta_slice syn__2318_(
	.A(IOaddr3[9]),
	.B(\tc3.IM [7]),
	.C(IOvalue3[9]),
	.D(\tc3.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0751_),
	.Cout(),
	.Q());
defparam syn__2318_.coord_x = 2;
defparam syn__2318_.coord_y = 3;
defparam syn__2318_.coord_z = 7;
defparam syn__2318_.mask = 16'h48E8;
defparam syn__2318_.modeMux = 1'b0;
defparam syn__2318_.FeedbackMux = 1'b0;
defparam syn__2318_.ShiftMux = 1'b0;
defparam syn__2318_.BypassEn = 1'b0;
defparam syn__2318_.CarryEnb = 1'b1;

alta_slice syn__2319_(
	.A(syn__0382_),
	.B(vcc),
	.C(\tc3.IM [9]),
	.D(syn__0751_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0752_),
	.Cout(),
	.Q());
defparam syn__2319_.coord_x = 2;
defparam syn__2319_.coord_y = 3;
defparam syn__2319_.coord_z = 13;
defparam syn__2319_.mask = 16'h0555;
defparam syn__2319_.modeMux = 1'b0;
defparam syn__2319_.FeedbackMux = 1'b0;
defparam syn__2319_.ShiftMux = 1'b0;
defparam syn__2319_.BypassEn = 1'b0;
defparam syn__2319_.CarryEnb = 1'b1;

alta_slice syn__2320_(
	.A(IOvalue3[24]),
	.B(IOaddr3[24]),
	.C(\tc3.IM [7]),
	.D(\tc3.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0753_),
	.Cout(),
	.Q());
defparam syn__2320_.coord_x = 0;
defparam syn__2320_.coord_y = 4;
defparam syn__2320_.coord_z = 1;
defparam syn__2320_.mask = 16'h9F17;
defparam syn__2320_.modeMux = 1'b0;
defparam syn__2320_.FeedbackMux = 1'b0;
defparam syn__2320_.ShiftMux = 1'b0;
defparam syn__2320_.BypassEn = 1'b0;
defparam syn__2320_.CarryEnb = 1'b1;

alta_slice syn__2321_(
	.A(syn__0386_),
	.B(syn__0753_),
	.C(syn__0243_),
	.D(\tc3.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0754_),
	.Cout(),
	.Q());
defparam syn__2321_.coord_x = 1;
defparam syn__2321_.coord_y = 4;
defparam syn__2321_.coord_z = 6;
defparam syn__2321_.mask = 16'hCC5A;
defparam syn__2321_.modeMux = 1'b0;
defparam syn__2321_.FeedbackMux = 1'b0;
defparam syn__2321_.ShiftMux = 1'b0;
defparam syn__2321_.BypassEn = 1'b0;
defparam syn__2321_.CarryEnb = 1'b1;

alta_slice syn__2322_(
	.A(IOvalue3[22]),
	.B(IOaddr3[22]),
	.C(\tc3.IM [7]),
	.D(\tc3.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0755_),
	.Cout(),
	.Q());
defparam syn__2322_.coord_x = 0;
defparam syn__2322_.coord_y = 4;
defparam syn__2322_.coord_z = 15;
defparam syn__2322_.mask = 16'h9F17;
defparam syn__2322_.modeMux = 1'b0;
defparam syn__2322_.FeedbackMux = 1'b0;
defparam syn__2322_.ShiftMux = 1'b0;
defparam syn__2322_.BypassEn = 1'b0;
defparam syn__2322_.CarryEnb = 1'b1;

alta_slice syn__2323_(
	.A(vcc),
	.B(\tc3.IM [9]),
	.C(syn__0409_),
	.D(syn__0755_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0756_),
	.Cout(),
	.Q());
defparam syn__2323_.coord_x = 0;
defparam syn__2323_.coord_y = 3;
defparam syn__2323_.coord_z = 9;
defparam syn__2323_.mask = 16'hCF03;
defparam syn__2323_.modeMux = 1'b0;
defparam syn__2323_.FeedbackMux = 1'b0;
defparam syn__2323_.ShiftMux = 1'b0;
defparam syn__2323_.BypassEn = 1'b0;
defparam syn__2323_.CarryEnb = 1'b1;

alta_slice syn__2324_(
	.A(IOvalue3[6]),
	.B(IOaddr3[6]),
	.C(\tc3.IM [7]),
	.D(\tc3.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0757_),
	.Cout(),
	.Q());
defparam syn__2324_.coord_x = 5;
defparam syn__2324_.coord_y = 6;
defparam syn__2324_.coord_z = 15;
defparam syn__2324_.mask = 16'h60E8;
defparam syn__2324_.modeMux = 1'b0;
defparam syn__2324_.FeedbackMux = 1'b0;
defparam syn__2324_.ShiftMux = 1'b0;
defparam syn__2324_.BypassEn = 1'b0;
defparam syn__2324_.CarryEnb = 1'b1;

alta_slice syn__2325_(
	.A(vcc),
	.B(syn__0757_),
	.C(syn__0412_),
	.D(\tc3.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0758_),
	.Cout(),
	.Q());
defparam syn__2325_.coord_x = 5;
defparam syn__2325_.coord_y = 6;
defparam syn__2325_.coord_z = 1;
defparam syn__2325_.mask = 16'h030F;
defparam syn__2325_.modeMux = 1'b0;
defparam syn__2325_.FeedbackMux = 1'b0;
defparam syn__2325_.ShiftMux = 1'b0;
defparam syn__2325_.BypassEn = 1'b0;
defparam syn__2325_.CarryEnb = 1'b1;

alta_slice syn__2326_(
	.A(IOvalue3[5]),
	.B(IOaddr3[5]),
	.C(\tc3.IM [7]),
	.D(\tc3.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0759_),
	.Cout(),
	.Q());
defparam syn__2326_.coord_x = 5;
defparam syn__2326_.coord_y = 6;
defparam syn__2326_.coord_z = 10;
defparam syn__2326_.mask = 16'h9F17;
defparam syn__2326_.modeMux = 1'b0;
defparam syn__2326_.FeedbackMux = 1'b0;
defparam syn__2326_.ShiftMux = 1'b0;
defparam syn__2326_.BypassEn = 1'b0;
defparam syn__2326_.CarryEnb = 1'b1;

alta_slice syn__2327_(
	.A(syn__0419_),
	.B(syn__0418_),
	.C(syn__0759_),
	.D(\tc3.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0760_),
	.Cout(),
	.Q());
defparam syn__2327_.coord_x = 5;
defparam syn__2327_.coord_y = 6;
defparam syn__2327_.coord_z = 8;
defparam syn__2327_.mask = 16'hF066;
defparam syn__2327_.modeMux = 1'b0;
defparam syn__2327_.FeedbackMux = 1'b0;
defparam syn__2327_.ShiftMux = 1'b0;
defparam syn__2327_.BypassEn = 1'b0;
defparam syn__2327_.CarryEnb = 1'b1;

alta_slice syn__2328_(
	.A(\tc3.IM [7]),
	.B(IOvalue3[12]),
	.C(IOaddr3[12]),
	.D(\tc3.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0761_),
	.Cout(),
	.Q());
defparam syn__2328_.coord_x = 2;
defparam syn__2328_.coord_y = 2;
defparam syn__2328_.coord_z = 11;
defparam syn__2328_.mask = 16'h28E8;
defparam syn__2328_.modeMux = 1'b0;
defparam syn__2328_.FeedbackMux = 1'b0;
defparam syn__2328_.ShiftMux = 1'b0;
defparam syn__2328_.BypassEn = 1'b0;
defparam syn__2328_.CarryEnb = 1'b1;

alta_slice syn__2329_(
	.A(vcc),
	.B(syn__0761_),
	.C(syn__0422_),
	.D(\tc3.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0762_),
	.Cout(),
	.Q());
defparam syn__2329_.coord_x = 2;
defparam syn__2329_.coord_y = 2;
defparam syn__2329_.coord_z = 7;
defparam syn__2329_.mask = 16'h030F;
defparam syn__2329_.modeMux = 1'b0;
defparam syn__2329_.FeedbackMux = 1'b0;
defparam syn__2329_.ShiftMux = 1'b0;
defparam syn__2329_.BypassEn = 1'b0;
defparam syn__2329_.CarryEnb = 1'b1;

alta_slice syn__2330_(
	.A(IOvalue3[4]),
	.B(IOaddr3[4]),
	.C(\tc3.IM [7]),
	.D(\tc3.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0763_),
	.Cout(),
	.Q());
defparam syn__2330_.coord_x = 4;
defparam syn__2330_.coord_y = 4;
defparam syn__2330_.coord_z = 14;
defparam syn__2330_.mask = 16'h9F17;
defparam syn__2330_.modeMux = 1'b0;
defparam syn__2330_.FeedbackMux = 1'b0;
defparam syn__2330_.ShiftMux = 1'b0;
defparam syn__2330_.BypassEn = 1'b0;
defparam syn__2330_.CarryEnb = 1'b1;

alta_slice syn__2331_(
	.A(syn__0424_),
	.B(syn__0256_),
	.C(syn__0763_),
	.D(\tc3.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0764_),
	.Cout(),
	.Q());
defparam syn__2331_.coord_x = 4;
defparam syn__2331_.coord_y = 4;
defparam syn__2331_.coord_z = 12;
defparam syn__2331_.mask = 16'hF066;
defparam syn__2331_.modeMux = 1'b0;
defparam syn__2331_.FeedbackMux = 1'b0;
defparam syn__2331_.ShiftMux = 1'b0;
defparam syn__2331_.BypassEn = 1'b0;
defparam syn__2331_.CarryEnb = 1'b1;

alta_slice syn__2332_(
	.A(IOaddr3[2]),
	.B(IOvalue3[2]),
	.C(\tc3.IM [7]),
	.D(\tc3.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0765_),
	.Cout(),
	.Q());
defparam syn__2332_.coord_x = 4;
defparam syn__2332_.coord_y = 4;
defparam syn__2332_.coord_z = 0;
defparam syn__2332_.mask = 16'h9F17;
defparam syn__2332_.modeMux = 1'b0;
defparam syn__2332_.FeedbackMux = 1'b0;
defparam syn__2332_.ShiftMux = 1'b0;
defparam syn__2332_.BypassEn = 1'b0;
defparam syn__2332_.CarryEnb = 1'b1;

alta_slice syn__2333_(
	.A(syn__0432_),
	.B(vcc),
	.C(syn__0765_),
	.D(\tc3.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0766_),
	.Cout(),
	.Q());
defparam syn__2333_.coord_x = 0;
defparam syn__2333_.coord_y = 4;
defparam syn__2333_.coord_z = 13;
defparam syn__2333_.mask = 16'hF055;
defparam syn__2333_.modeMux = 1'b0;
defparam syn__2333_.FeedbackMux = 1'b0;
defparam syn__2333_.ShiftMux = 1'b0;
defparam syn__2333_.BypassEn = 1'b0;
defparam syn__2333_.CarryEnb = 1'b1;

alta_slice syn__2334_(
	.A(IOvalue3[1]),
	.B(IOaddr3[1]),
	.C(\tc3.IM [7]),
	.D(\tc3.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0767_),
	.Cout(),
	.Q());
defparam syn__2334_.coord_x = 5;
defparam syn__2334_.coord_y = 6;
defparam syn__2334_.coord_z = 0;
defparam syn__2334_.mask = 16'h9F17;
defparam syn__2334_.modeMux = 1'b0;
defparam syn__2334_.FeedbackMux = 1'b0;
defparam syn__2334_.ShiftMux = 1'b0;
defparam syn__2334_.BypassEn = 1'b0;
defparam syn__2334_.CarryEnb = 1'b1;

alta_slice syn__2335_(
	.A(syn__0436_),
	.B(syn__0260_),
	.C(syn__0767_),
	.D(\tc3.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0768_),
	.Cout(),
	.Q());
defparam syn__2335_.coord_x = 5;
defparam syn__2335_.coord_y = 6;
defparam syn__2335_.coord_z = 13;
defparam syn__2335_.mask = 16'hF099;
defparam syn__2335_.modeMux = 1'b0;
defparam syn__2335_.FeedbackMux = 1'b0;
defparam syn__2335_.ShiftMux = 1'b0;
defparam syn__2335_.BypassEn = 1'b0;
defparam syn__2335_.CarryEnb = 1'b1;

alta_slice syn__2336_(
	.A(syn__0768_),
	.B(\tc3.IM [6]),
	.C(syn__0742_),
	.D(\tc3.IM [5]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0769_),
	.Cout(),
	.Q());
defparam syn__2336_.coord_x = 1;
defparam syn__2336_.coord_y = 5;
defparam syn__2336_.coord_z = 3;
defparam syn__2336_.mask = 16'hB8CC;
defparam syn__2336_.modeMux = 1'b0;
defparam syn__2336_.FeedbackMux = 1'b0;
defparam syn__2336_.ShiftMux = 1'b0;
defparam syn__2336_.BypassEn = 1'b0;
defparam syn__2336_.CarryEnb = 1'b1;

alta_slice syn__2337_(
	.A(syn__0748_),
	.B(\tc3.IM [5]),
	.C(syn__0750_),
	.D(syn__0769_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0770_),
	.Cout(),
	.Q());
defparam syn__2337_.coord_x = 1;
defparam syn__2337_.coord_y = 5;
defparam syn__2337_.coord_z = 4;
defparam syn__2337_.mask = 16'hEE30;
defparam syn__2337_.modeMux = 1'b0;
defparam syn__2337_.FeedbackMux = 1'b0;
defparam syn__2337_.ShiftMux = 1'b0;
defparam syn__2337_.BypassEn = 1'b0;
defparam syn__2337_.CarryEnb = 1'b1;

alta_slice syn__2338_(
	.A(\tc3.IM [5]),
	.B(syn__0330_),
	.C(syn__0754_),
	.D(\tc3.IM [6]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0771_),
	.Cout(),
	.Q());
defparam syn__2338_.coord_x = 2;
defparam syn__2338_.coord_y = 6;
defparam syn__2338_.coord_z = 12;
defparam syn__2338_.mask = 16'hEE50;
defparam syn__2338_.modeMux = 1'b0;
defparam syn__2338_.FeedbackMux = 1'b0;
defparam syn__2338_.ShiftMux = 1'b0;
defparam syn__2338_.BypassEn = 1'b0;
defparam syn__2338_.CarryEnb = 1'b1;

alta_slice syn__2339_(
	.A(syn__0393_),
	.B(syn__0748_),
	.C(\tc3.IM [5]),
	.D(syn__0771_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0772_),
	.Cout(),
	.Q());
defparam syn__2339_.coord_x = 1;
defparam syn__2339_.coord_y = 5;
defparam syn__2339_.coord_z = 5;
defparam syn__2339_.mask = 16'hAFC0;
defparam syn__2339_.modeMux = 1'b0;
defparam syn__2339_.FeedbackMux = 1'b0;
defparam syn__2339_.ShiftMux = 1'b0;
defparam syn__2339_.BypassEn = 1'b0;
defparam syn__2339_.CarryEnb = 1'b1;

alta_slice syn__2340_(
	.A(\tc3.IM [5]),
	.B(syn__0357_),
	.C(syn__0762_),
	.D(\tc3.IM [6]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0773_),
	.Cout(),
	.Q());
defparam syn__2340_.coord_x = 2;
defparam syn__2340_.coord_y = 6;
defparam syn__2340_.coord_z = 0;
defparam syn__2340_.mask = 16'hEE50;
defparam syn__2340_.modeMux = 1'b0;
defparam syn__2340_.FeedbackMux = 1'b0;
defparam syn__2340_.ShiftMux = 1'b0;
defparam syn__2340_.BypassEn = 1'b0;
defparam syn__2340_.CarryEnb = 1'b1;

alta_slice syn__2341_(
	.A(syn__0734_),
	.B(\tc3.IM [5]),
	.C(syn__0773_),
	.D(syn__0454_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0774_),
	.Cout(),
	.Q());
defparam syn__2341_.coord_x = 1;
defparam syn__2341_.coord_y = 5;
defparam syn__2341_.coord_z = 9;
defparam syn__2341_.mask = 16'hF838;
defparam syn__2341_.modeMux = 1'b0;
defparam syn__2341_.FeedbackMux = 1'b0;
defparam syn__2341_.ShiftMux = 1'b0;
defparam syn__2341_.BypassEn = 1'b0;
defparam syn__2341_.CarryEnb = 1'b1;

alta_slice syn__2342_(
	.A(\tc3.IM [5]),
	.B(vcc),
	.C(syn__0740_),
	.D(syn__0746_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0775_),
	.Cout(),
	.Q());
defparam syn__2342_.coord_x = 2;
defparam syn__2342_.coord_y = 6;
defparam syn__2342_.coord_z = 6;
defparam syn__2342_.mask = 16'hFA50;
defparam syn__2342_.modeMux = 1'b0;
defparam syn__2342_.FeedbackMux = 1'b0;
defparam syn__2342_.ShiftMux = 1'b0;
defparam syn__2342_.BypassEn = 1'b0;
defparam syn__2342_.CarryEnb = 1'b1;

alta_slice syn__2343_(
	.A(syn__0775_),
	.B(\tc3.IM [5]),
	.C(syn__0736_),
	.D(\tc3.IM [6]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0776_),
	.Cout(),
	.Q());
defparam syn__2343_.coord_x = 2;
defparam syn__2343_.coord_y = 6;
defparam syn__2343_.coord_z = 10;
defparam syn__2343_.mask = 16'hAAFC;
defparam syn__2343_.modeMux = 1'b0;
defparam syn__2343_.FeedbackMux = 1'b0;
defparam syn__2343_.ShiftMux = 1'b0;
defparam syn__2343_.BypassEn = 1'b0;
defparam syn__2343_.CarryEnb = 1'b1;

alta_slice syn__2344_(
	.A(\tc3.IM [5]),
	.B(syn__0454_),
	.C(syn__0764_),
	.D(\tc3.IM [6]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0777_),
	.Cout(),
	.Q());
defparam syn__2344_.coord_x = 2;
defparam syn__2344_.coord_y = 6;
defparam syn__2344_.coord_z = 1;
defparam syn__2344_.mask = 16'hFA44;
defparam syn__2344_.modeMux = 1'b0;
defparam syn__2344_.FeedbackMux = 1'b0;
defparam syn__2344_.ShiftMux = 1'b0;
defparam syn__2344_.BypassEn = 1'b0;
defparam syn__2344_.CarryEnb = 1'b1;

alta_slice syn__2345_(
	.A(syn__0762_),
	.B(syn__0777_),
	.C(syn__0340_),
	.D(\tc3.IM [5]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0778_),
	.Cout(),
	.Q());
defparam syn__2345_.coord_x = 1;
defparam syn__2345_.coord_y = 5;
defparam syn__2345_.coord_z = 6;
defparam syn__2345_.mask = 16'hB8CC;
defparam syn__2345_.modeMux = 1'b0;
defparam syn__2345_.FeedbackMux = 1'b0;
defparam syn__2345_.ShiftMux = 1'b0;
defparam syn__2345_.BypassEn = 1'b0;
defparam syn__2345_.CarryEnb = 1'b1;

alta_slice syn__2346_(
	.A(\tc3.IM [5]),
	.B(syn__0468_),
	.C(syn__0758_),
	.D(\tc3.IM [6]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0779_),
	.Cout(),
	.Q());
defparam syn__2346_.coord_x = 2;
defparam syn__2346_.coord_y = 6;
defparam syn__2346_.coord_z = 5;
defparam syn__2346_.mask = 16'hFA44;
defparam syn__2346_.modeMux = 1'b0;
defparam syn__2346_.FeedbackMux = 1'b0;
defparam syn__2346_.ShiftMux = 1'b0;
defparam syn__2346_.BypassEn = 1'b0;
defparam syn__2346_.CarryEnb = 1'b1;

alta_slice syn__2347_(
	.A(\tc3.IM [5]),
	.B(syn__0347_),
	.C(syn__0237_),
	.D(syn__0779_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0780_),
	.Cout(),
	.Q());
defparam syn__2347_.coord_x = 0;
defparam syn__2347_.coord_y = 7;
defparam syn__2347_.coord_z = 8;
defparam syn__2347_.mask = 16'hDDA0;
defparam syn__2347_.modeMux = 1'b0;
defparam syn__2347_.FeedbackMux = 1'b0;
defparam syn__2347_.ShiftMux = 1'b0;
defparam syn__2347_.BypassEn = 1'b0;
defparam syn__2347_.CarryEnb = 1'b1;

alta_rio syn__2348_(
	.padio(bank0[0]),
	.datain(syn__1100_[0]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__2348_.coord_x = 2;
defparam syn__2348_.coord_y = 9;
defparam syn__2348_.coord_z = 0;
defparam syn__2348_.IN_ASYNC_MODE = 1'b0;
defparam syn__2348_.IN_SYNC_MODE = 1'b0;
defparam syn__2348_.IN_POWERUP = 1'b0;
defparam syn__2348_.OUT_REG_MODE = 1'b0;
defparam syn__2348_.OUT_ASYNC_MODE = 1'b0;
defparam syn__2348_.OUT_SYNC_MODE = 1'b0;
defparam syn__2348_.OUT_POWERUP = 1'b0;
defparam syn__2348_.OE_REG_MODE = 1'b0;
defparam syn__2348_.OE_ASYNC_MODE = 1'b0;
defparam syn__2348_.OE_SYNC_MODE = 1'b0;
defparam syn__2348_.OE_POWERUP = 1'b0;
defparam syn__2348_.CFG_TRI_INPUT = 1'b0;
defparam syn__2348_.CFG_PULL_UP = 1'b0;
defparam syn__2348_.CFG_SLR = 1'b0;
defparam syn__2348_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__2348_.CFG_PDRCTRL = 4'b0010;
defparam syn__2348_.CFG_KEEP = 2'b00;
defparam syn__2348_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__2348_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__2348_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__2348_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__2348_.DPCLK_DELAY = 4'b0000;
defparam syn__2348_.OUT_DELAY = 1'b0;
defparam syn__2348_.IN_DATA_DELAY = 3'b000;
defparam syn__2348_.IN_REG_DELAY = 3'b000;

alta_rio syn__2349_(
	.padio(bank0[1]),
	.datain(syn__1100_[1]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__2349_.coord_x = 1;
defparam syn__2349_.coord_y = 9;
defparam syn__2349_.coord_z = 3;
defparam syn__2349_.IN_ASYNC_MODE = 1'b0;
defparam syn__2349_.IN_SYNC_MODE = 1'b0;
defparam syn__2349_.IN_POWERUP = 1'b0;
defparam syn__2349_.OUT_REG_MODE = 1'b0;
defparam syn__2349_.OUT_ASYNC_MODE = 1'b0;
defparam syn__2349_.OUT_SYNC_MODE = 1'b0;
defparam syn__2349_.OUT_POWERUP = 1'b0;
defparam syn__2349_.OE_REG_MODE = 1'b0;
defparam syn__2349_.OE_ASYNC_MODE = 1'b0;
defparam syn__2349_.OE_SYNC_MODE = 1'b0;
defparam syn__2349_.OE_POWERUP = 1'b0;
defparam syn__2349_.CFG_TRI_INPUT = 1'b0;
defparam syn__2349_.CFG_PULL_UP = 1'b0;
defparam syn__2349_.CFG_SLR = 1'b0;
defparam syn__2349_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__2349_.CFG_PDRCTRL = 4'b0010;
defparam syn__2349_.CFG_KEEP = 2'b00;
defparam syn__2349_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__2349_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__2349_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__2349_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__2349_.DPCLK_DELAY = 4'b0000;
defparam syn__2349_.OUT_DELAY = 1'b0;
defparam syn__2349_.IN_DATA_DELAY = 3'b000;
defparam syn__2349_.IN_REG_DELAY = 3'b000;

alta_rio syn__2350_(
	.padio(bank0[2]),
	.datain(syn__1100_[2]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__2350_.coord_x = 0;
defparam syn__2350_.coord_y = 9;
defparam syn__2350_.coord_z = 2;
defparam syn__2350_.IN_ASYNC_MODE = 1'b0;
defparam syn__2350_.IN_SYNC_MODE = 1'b0;
defparam syn__2350_.IN_POWERUP = 1'b0;
defparam syn__2350_.OUT_REG_MODE = 1'b0;
defparam syn__2350_.OUT_ASYNC_MODE = 1'b0;
defparam syn__2350_.OUT_SYNC_MODE = 1'b0;
defparam syn__2350_.OUT_POWERUP = 1'b0;
defparam syn__2350_.OE_REG_MODE = 1'b0;
defparam syn__2350_.OE_ASYNC_MODE = 1'b0;
defparam syn__2350_.OE_SYNC_MODE = 1'b0;
defparam syn__2350_.OE_POWERUP = 1'b0;
defparam syn__2350_.CFG_TRI_INPUT = 1'b0;
defparam syn__2350_.CFG_PULL_UP = 1'b0;
defparam syn__2350_.CFG_SLR = 1'b0;
defparam syn__2350_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__2350_.CFG_PDRCTRL = 4'b0010;
defparam syn__2350_.CFG_KEEP = 2'b00;
defparam syn__2350_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__2350_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__2350_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__2350_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__2350_.DPCLK_DELAY = 4'b0000;
defparam syn__2350_.OUT_DELAY = 1'b0;
defparam syn__2350_.IN_DATA_DELAY = 3'b000;
defparam syn__2350_.IN_REG_DELAY = 3'b000;

alta_rio syn__2351_(
	.padio(bank0[3]),
	.datain(syn__1100_[3]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__2351_.coord_x = 0;
defparam syn__2351_.coord_y = 9;
defparam syn__2351_.coord_z = 0;
defparam syn__2351_.IN_ASYNC_MODE = 1'b0;
defparam syn__2351_.IN_SYNC_MODE = 1'b0;
defparam syn__2351_.IN_POWERUP = 1'b0;
defparam syn__2351_.OUT_REG_MODE = 1'b0;
defparam syn__2351_.OUT_ASYNC_MODE = 1'b0;
defparam syn__2351_.OUT_SYNC_MODE = 1'b0;
defparam syn__2351_.OUT_POWERUP = 1'b0;
defparam syn__2351_.OE_REG_MODE = 1'b0;
defparam syn__2351_.OE_ASYNC_MODE = 1'b0;
defparam syn__2351_.OE_SYNC_MODE = 1'b0;
defparam syn__2351_.OE_POWERUP = 1'b0;
defparam syn__2351_.CFG_TRI_INPUT = 1'b0;
defparam syn__2351_.CFG_PULL_UP = 1'b0;
defparam syn__2351_.CFG_SLR = 1'b0;
defparam syn__2351_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__2351_.CFG_PDRCTRL = 4'b0010;
defparam syn__2351_.CFG_KEEP = 2'b00;
defparam syn__2351_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__2351_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__2351_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__2351_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__2351_.DPCLK_DELAY = 4'b0000;
defparam syn__2351_.OUT_DELAY = 1'b0;
defparam syn__2351_.IN_DATA_DELAY = 3'b000;
defparam syn__2351_.IN_REG_DELAY = 3'b000;

alta_rio syn__2352_(
	.padio(bank0[4]),
	.datain(syn__1100_[4]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__2352_.coord_x = 1;
defparam syn__2352_.coord_y = 9;
defparam syn__2352_.coord_z = 1;
defparam syn__2352_.IN_ASYNC_MODE = 1'b0;
defparam syn__2352_.IN_SYNC_MODE = 1'b0;
defparam syn__2352_.IN_POWERUP = 1'b0;
defparam syn__2352_.OUT_REG_MODE = 1'b0;
defparam syn__2352_.OUT_ASYNC_MODE = 1'b0;
defparam syn__2352_.OUT_SYNC_MODE = 1'b0;
defparam syn__2352_.OUT_POWERUP = 1'b0;
defparam syn__2352_.OE_REG_MODE = 1'b0;
defparam syn__2352_.OE_ASYNC_MODE = 1'b0;
defparam syn__2352_.OE_SYNC_MODE = 1'b0;
defparam syn__2352_.OE_POWERUP = 1'b0;
defparam syn__2352_.CFG_TRI_INPUT = 1'b0;
defparam syn__2352_.CFG_PULL_UP = 1'b0;
defparam syn__2352_.CFG_SLR = 1'b0;
defparam syn__2352_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__2352_.CFG_PDRCTRL = 4'b0010;
defparam syn__2352_.CFG_KEEP = 2'b00;
defparam syn__2352_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__2352_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__2352_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__2352_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__2352_.DPCLK_DELAY = 4'b0000;
defparam syn__2352_.OUT_DELAY = 1'b0;
defparam syn__2352_.IN_DATA_DELAY = 3'b000;
defparam syn__2352_.IN_REG_DELAY = 3'b000;

alta_rio syn__2353_(
	.padio(bank0[5]),
	.datain(syn__1100_[5]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__2353_.coord_x = 6;
defparam syn__2353_.coord_y = 9;
defparam syn__2353_.coord_z = 2;
defparam syn__2353_.IN_ASYNC_MODE = 1'b0;
defparam syn__2353_.IN_SYNC_MODE = 1'b0;
defparam syn__2353_.IN_POWERUP = 1'b0;
defparam syn__2353_.OUT_REG_MODE = 1'b0;
defparam syn__2353_.OUT_ASYNC_MODE = 1'b0;
defparam syn__2353_.OUT_SYNC_MODE = 1'b0;
defparam syn__2353_.OUT_POWERUP = 1'b0;
defparam syn__2353_.OE_REG_MODE = 1'b0;
defparam syn__2353_.OE_ASYNC_MODE = 1'b0;
defparam syn__2353_.OE_SYNC_MODE = 1'b0;
defparam syn__2353_.OE_POWERUP = 1'b0;
defparam syn__2353_.CFG_TRI_INPUT = 1'b0;
defparam syn__2353_.CFG_PULL_UP = 1'b0;
defparam syn__2353_.CFG_SLR = 1'b0;
defparam syn__2353_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__2353_.CFG_PDRCTRL = 4'b0010;
defparam syn__2353_.CFG_KEEP = 2'b00;
defparam syn__2353_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__2353_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__2353_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__2353_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__2353_.DPCLK_DELAY = 4'b0000;
defparam syn__2353_.OUT_DELAY = 1'b0;
defparam syn__2353_.IN_DATA_DELAY = 3'b000;
defparam syn__2353_.IN_REG_DELAY = 3'b000;

alta_rio syn__2354_(
	.padio(bank0[6]),
	.datain(syn__1100_[6]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__2354_.coord_x = 2;
defparam syn__2354_.coord_y = 1;
defparam syn__2354_.coord_z = 0;
defparam syn__2354_.IN_ASYNC_MODE = 1'b0;
defparam syn__2354_.IN_SYNC_MODE = 1'b0;
defparam syn__2354_.IN_POWERUP = 1'b0;
defparam syn__2354_.OUT_REG_MODE = 1'b0;
defparam syn__2354_.OUT_ASYNC_MODE = 1'b0;
defparam syn__2354_.OUT_SYNC_MODE = 1'b0;
defparam syn__2354_.OUT_POWERUP = 1'b0;
defparam syn__2354_.OE_REG_MODE = 1'b0;
defparam syn__2354_.OE_ASYNC_MODE = 1'b0;
defparam syn__2354_.OE_SYNC_MODE = 1'b0;
defparam syn__2354_.OE_POWERUP = 1'b0;
defparam syn__2354_.CFG_TRI_INPUT = 1'b0;
defparam syn__2354_.CFG_PULL_UP = 1'b0;
defparam syn__2354_.CFG_SLR = 1'b0;
defparam syn__2354_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__2354_.CFG_PDRCTRL = 4'b0010;
defparam syn__2354_.CFG_KEEP = 2'b00;
defparam syn__2354_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__2354_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__2354_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__2354_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__2354_.DPCLK_DELAY = 4'b0000;
defparam syn__2354_.OUT_DELAY = 1'b0;
defparam syn__2354_.IN_DATA_DELAY = 3'b000;
defparam syn__2354_.IN_REG_DELAY = 3'b000;

alta_rio syn__2355_(
	.padio(bank0[7]),
	.datain(syn__1100_[7]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__2355_.coord_x = 2;
defparam syn__2355_.coord_y = 1;
defparam syn__2355_.coord_z = 2;
defparam syn__2355_.IN_ASYNC_MODE = 1'b0;
defparam syn__2355_.IN_SYNC_MODE = 1'b0;
defparam syn__2355_.IN_POWERUP = 1'b0;
defparam syn__2355_.OUT_REG_MODE = 1'b0;
defparam syn__2355_.OUT_ASYNC_MODE = 1'b0;
defparam syn__2355_.OUT_SYNC_MODE = 1'b0;
defparam syn__2355_.OUT_POWERUP = 1'b0;
defparam syn__2355_.OE_REG_MODE = 1'b0;
defparam syn__2355_.OE_ASYNC_MODE = 1'b0;
defparam syn__2355_.OE_SYNC_MODE = 1'b0;
defparam syn__2355_.OE_POWERUP = 1'b0;
defparam syn__2355_.CFG_TRI_INPUT = 1'b0;
defparam syn__2355_.CFG_PULL_UP = 1'b0;
defparam syn__2355_.CFG_SLR = 1'b0;
defparam syn__2355_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__2355_.CFG_PDRCTRL = 4'b0010;
defparam syn__2355_.CFG_KEEP = 2'b00;
defparam syn__2355_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__2355_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__2355_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__2355_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__2355_.DPCLK_DELAY = 4'b0000;
defparam syn__2355_.OUT_DELAY = 1'b0;
defparam syn__2355_.IN_DATA_DELAY = 3'b000;
defparam syn__2355_.IN_REG_DELAY = 3'b000;

alta_rio syn__2356_(
	.padio(bank1[0]),
	.datain(syn__1101_[0]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__2356_.coord_x = 4;
defparam syn__2356_.coord_y = 1;
defparam syn__2356_.coord_z = 0;
defparam syn__2356_.IN_ASYNC_MODE = 1'b0;
defparam syn__2356_.IN_SYNC_MODE = 1'b0;
defparam syn__2356_.IN_POWERUP = 1'b0;
defparam syn__2356_.OUT_REG_MODE = 1'b0;
defparam syn__2356_.OUT_ASYNC_MODE = 1'b0;
defparam syn__2356_.OUT_SYNC_MODE = 1'b0;
defparam syn__2356_.OUT_POWERUP = 1'b0;
defparam syn__2356_.OE_REG_MODE = 1'b0;
defparam syn__2356_.OE_ASYNC_MODE = 1'b0;
defparam syn__2356_.OE_SYNC_MODE = 1'b0;
defparam syn__2356_.OE_POWERUP = 1'b0;
defparam syn__2356_.CFG_TRI_INPUT = 1'b0;
defparam syn__2356_.CFG_PULL_UP = 1'b0;
defparam syn__2356_.CFG_SLR = 1'b0;
defparam syn__2356_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__2356_.CFG_PDRCTRL = 4'b0010;
defparam syn__2356_.CFG_KEEP = 2'b00;
defparam syn__2356_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__2356_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__2356_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__2356_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__2356_.DPCLK_DELAY = 4'b0000;
defparam syn__2356_.OUT_DELAY = 1'b0;
defparam syn__2356_.IN_DATA_DELAY = 3'b000;
defparam syn__2356_.IN_REG_DELAY = 3'b000;

alta_rio syn__2357_(
	.padio(bank1[1]),
	.datain(syn__1101_[1]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__2357_.coord_x = 4;
defparam syn__2357_.coord_y = 1;
defparam syn__2357_.coord_z = 2;
defparam syn__2357_.IN_ASYNC_MODE = 1'b0;
defparam syn__2357_.IN_SYNC_MODE = 1'b0;
defparam syn__2357_.IN_POWERUP = 1'b0;
defparam syn__2357_.OUT_REG_MODE = 1'b0;
defparam syn__2357_.OUT_ASYNC_MODE = 1'b0;
defparam syn__2357_.OUT_SYNC_MODE = 1'b0;
defparam syn__2357_.OUT_POWERUP = 1'b0;
defparam syn__2357_.OE_REG_MODE = 1'b0;
defparam syn__2357_.OE_ASYNC_MODE = 1'b0;
defparam syn__2357_.OE_SYNC_MODE = 1'b0;
defparam syn__2357_.OE_POWERUP = 1'b0;
defparam syn__2357_.CFG_TRI_INPUT = 1'b0;
defparam syn__2357_.CFG_PULL_UP = 1'b0;
defparam syn__2357_.CFG_SLR = 1'b0;
defparam syn__2357_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__2357_.CFG_PDRCTRL = 4'b0010;
defparam syn__2357_.CFG_KEEP = 2'b00;
defparam syn__2357_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__2357_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__2357_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__2357_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__2357_.DPCLK_DELAY = 4'b0000;
defparam syn__2357_.OUT_DELAY = 1'b0;
defparam syn__2357_.IN_DATA_DELAY = 3'b000;
defparam syn__2357_.IN_REG_DELAY = 3'b000;

alta_rio syn__2358_(
	.padio(bank1[2]),
	.datain(syn__1101_[2]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__2358_.coord_x = 5;
defparam syn__2358_.coord_y = 1;
defparam syn__2358_.coord_z = 0;
defparam syn__2358_.IN_ASYNC_MODE = 1'b0;
defparam syn__2358_.IN_SYNC_MODE = 1'b0;
defparam syn__2358_.IN_POWERUP = 1'b0;
defparam syn__2358_.OUT_REG_MODE = 1'b0;
defparam syn__2358_.OUT_ASYNC_MODE = 1'b0;
defparam syn__2358_.OUT_SYNC_MODE = 1'b0;
defparam syn__2358_.OUT_POWERUP = 1'b0;
defparam syn__2358_.OE_REG_MODE = 1'b0;
defparam syn__2358_.OE_ASYNC_MODE = 1'b0;
defparam syn__2358_.OE_SYNC_MODE = 1'b0;
defparam syn__2358_.OE_POWERUP = 1'b0;
defparam syn__2358_.CFG_TRI_INPUT = 1'b0;
defparam syn__2358_.CFG_PULL_UP = 1'b0;
defparam syn__2358_.CFG_SLR = 1'b0;
defparam syn__2358_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__2358_.CFG_PDRCTRL = 4'b0010;
defparam syn__2358_.CFG_KEEP = 2'b00;
defparam syn__2358_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__2358_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__2358_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__2358_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__2358_.DPCLK_DELAY = 4'b0000;
defparam syn__2358_.OUT_DELAY = 1'b0;
defparam syn__2358_.IN_DATA_DELAY = 3'b000;
defparam syn__2358_.IN_REG_DELAY = 3'b000;

alta_rio syn__2359_(
	.padio(bank1[3]),
	.datain(syn__1101_[3]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__2359_.coord_x = 5;
defparam syn__2359_.coord_y = 1;
defparam syn__2359_.coord_z = 1;
defparam syn__2359_.IN_ASYNC_MODE = 1'b0;
defparam syn__2359_.IN_SYNC_MODE = 1'b0;
defparam syn__2359_.IN_POWERUP = 1'b0;
defparam syn__2359_.OUT_REG_MODE = 1'b0;
defparam syn__2359_.OUT_ASYNC_MODE = 1'b0;
defparam syn__2359_.OUT_SYNC_MODE = 1'b0;
defparam syn__2359_.OUT_POWERUP = 1'b0;
defparam syn__2359_.OE_REG_MODE = 1'b0;
defparam syn__2359_.OE_ASYNC_MODE = 1'b0;
defparam syn__2359_.OE_SYNC_MODE = 1'b0;
defparam syn__2359_.OE_POWERUP = 1'b0;
defparam syn__2359_.CFG_TRI_INPUT = 1'b0;
defparam syn__2359_.CFG_PULL_UP = 1'b0;
defparam syn__2359_.CFG_SLR = 1'b0;
defparam syn__2359_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__2359_.CFG_PDRCTRL = 4'b0010;
defparam syn__2359_.CFG_KEEP = 2'b00;
defparam syn__2359_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__2359_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__2359_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__2359_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__2359_.DPCLK_DELAY = 4'b0000;
defparam syn__2359_.OUT_DELAY = 1'b0;
defparam syn__2359_.IN_DATA_DELAY = 3'b000;
defparam syn__2359_.IN_REG_DELAY = 3'b000;

alta_rio syn__2360_(
	.padio(bank1[4]),
	.datain(syn__1101_[4]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__2360_.coord_x = 5;
defparam syn__2360_.coord_y = 1;
defparam syn__2360_.coord_z = 2;
defparam syn__2360_.IN_ASYNC_MODE = 1'b0;
defparam syn__2360_.IN_SYNC_MODE = 1'b0;
defparam syn__2360_.IN_POWERUP = 1'b0;
defparam syn__2360_.OUT_REG_MODE = 1'b0;
defparam syn__2360_.OUT_ASYNC_MODE = 1'b0;
defparam syn__2360_.OUT_SYNC_MODE = 1'b0;
defparam syn__2360_.OUT_POWERUP = 1'b0;
defparam syn__2360_.OE_REG_MODE = 1'b0;
defparam syn__2360_.OE_ASYNC_MODE = 1'b0;
defparam syn__2360_.OE_SYNC_MODE = 1'b0;
defparam syn__2360_.OE_POWERUP = 1'b0;
defparam syn__2360_.CFG_TRI_INPUT = 1'b0;
defparam syn__2360_.CFG_PULL_UP = 1'b0;
defparam syn__2360_.CFG_SLR = 1'b0;
defparam syn__2360_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__2360_.CFG_PDRCTRL = 4'b0010;
defparam syn__2360_.CFG_KEEP = 2'b00;
defparam syn__2360_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__2360_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__2360_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__2360_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__2360_.DPCLK_DELAY = 4'b0000;
defparam syn__2360_.OUT_DELAY = 1'b0;
defparam syn__2360_.IN_DATA_DELAY = 3'b000;
defparam syn__2360_.IN_REG_DELAY = 3'b000;

alta_rio syn__2361_(
	.padio(bank1[5]),
	.datain(syn__1101_[5]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__2361_.coord_x = 5;
defparam syn__2361_.coord_y = 1;
defparam syn__2361_.coord_z = 3;
defparam syn__2361_.IN_ASYNC_MODE = 1'b0;
defparam syn__2361_.IN_SYNC_MODE = 1'b0;
defparam syn__2361_.IN_POWERUP = 1'b0;
defparam syn__2361_.OUT_REG_MODE = 1'b0;
defparam syn__2361_.OUT_ASYNC_MODE = 1'b0;
defparam syn__2361_.OUT_SYNC_MODE = 1'b0;
defparam syn__2361_.OUT_POWERUP = 1'b0;
defparam syn__2361_.OE_REG_MODE = 1'b0;
defparam syn__2361_.OE_ASYNC_MODE = 1'b0;
defparam syn__2361_.OE_SYNC_MODE = 1'b0;
defparam syn__2361_.OE_POWERUP = 1'b0;
defparam syn__2361_.CFG_TRI_INPUT = 1'b0;
defparam syn__2361_.CFG_PULL_UP = 1'b0;
defparam syn__2361_.CFG_SLR = 1'b0;
defparam syn__2361_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__2361_.CFG_PDRCTRL = 4'b0010;
defparam syn__2361_.CFG_KEEP = 2'b00;
defparam syn__2361_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__2361_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__2361_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__2361_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__2361_.DPCLK_DELAY = 4'b0000;
defparam syn__2361_.OUT_DELAY = 1'b0;
defparam syn__2361_.IN_DATA_DELAY = 3'b000;
defparam syn__2361_.IN_REG_DELAY = 3'b000;

alta_rio syn__2362_(
	.padio(bank1[6]),
	.datain(syn__1101_[6]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__2362_.coord_x = 6;
defparam syn__2362_.coord_y = 1;
defparam syn__2362_.coord_z = 0;
defparam syn__2362_.IN_ASYNC_MODE = 1'b0;
defparam syn__2362_.IN_SYNC_MODE = 1'b0;
defparam syn__2362_.IN_POWERUP = 1'b0;
defparam syn__2362_.OUT_REG_MODE = 1'b0;
defparam syn__2362_.OUT_ASYNC_MODE = 1'b0;
defparam syn__2362_.OUT_SYNC_MODE = 1'b0;
defparam syn__2362_.OUT_POWERUP = 1'b0;
defparam syn__2362_.OE_REG_MODE = 1'b0;
defparam syn__2362_.OE_ASYNC_MODE = 1'b0;
defparam syn__2362_.OE_SYNC_MODE = 1'b0;
defparam syn__2362_.OE_POWERUP = 1'b0;
defparam syn__2362_.CFG_TRI_INPUT = 1'b0;
defparam syn__2362_.CFG_PULL_UP = 1'b0;
defparam syn__2362_.CFG_SLR = 1'b0;
defparam syn__2362_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__2362_.CFG_PDRCTRL = 4'b0010;
defparam syn__2362_.CFG_KEEP = 2'b00;
defparam syn__2362_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__2362_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__2362_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__2362_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__2362_.DPCLK_DELAY = 4'b0000;
defparam syn__2362_.OUT_DELAY = 1'b0;
defparam syn__2362_.IN_DATA_DELAY = 3'b000;
defparam syn__2362_.IN_REG_DELAY = 3'b000;

alta_rio syn__2363_(
	.padio(bank1[7]),
	.datain(syn__1101_[7]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__2363_.coord_x = 6;
defparam syn__2363_.coord_y = 1;
defparam syn__2363_.coord_z = 1;
defparam syn__2363_.IN_ASYNC_MODE = 1'b0;
defparam syn__2363_.IN_SYNC_MODE = 1'b0;
defparam syn__2363_.IN_POWERUP = 1'b0;
defparam syn__2363_.OUT_REG_MODE = 1'b0;
defparam syn__2363_.OUT_ASYNC_MODE = 1'b0;
defparam syn__2363_.OUT_SYNC_MODE = 1'b0;
defparam syn__2363_.OUT_POWERUP = 1'b0;
defparam syn__2363_.OE_REG_MODE = 1'b0;
defparam syn__2363_.OE_ASYNC_MODE = 1'b0;
defparam syn__2363_.OE_SYNC_MODE = 1'b0;
defparam syn__2363_.OE_POWERUP = 1'b0;
defparam syn__2363_.CFG_TRI_INPUT = 1'b0;
defparam syn__2363_.CFG_PULL_UP = 1'b0;
defparam syn__2363_.CFG_SLR = 1'b0;
defparam syn__2363_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__2363_.CFG_PDRCTRL = 4'b0010;
defparam syn__2363_.CFG_KEEP = 2'b00;
defparam syn__2363_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__2363_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__2363_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__2363_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__2363_.DPCLK_DELAY = 4'b0000;
defparam syn__2363_.OUT_DELAY = 1'b0;
defparam syn__2363_.IN_DATA_DELAY = 3'b000;
defparam syn__2363_.IN_REG_DELAY = 3'b000;

alta_rio syn__2364_(
	.padio(bank2[0]),
	.datain(syn__1102_[0]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__2364_.coord_x = 6;
defparam syn__2364_.coord_y = 1;
defparam syn__2364_.coord_z = 2;
defparam syn__2364_.IN_ASYNC_MODE = 1'b0;
defparam syn__2364_.IN_SYNC_MODE = 1'b0;
defparam syn__2364_.IN_POWERUP = 1'b0;
defparam syn__2364_.OUT_REG_MODE = 1'b0;
defparam syn__2364_.OUT_ASYNC_MODE = 1'b0;
defparam syn__2364_.OUT_SYNC_MODE = 1'b0;
defparam syn__2364_.OUT_POWERUP = 1'b0;
defparam syn__2364_.OE_REG_MODE = 1'b0;
defparam syn__2364_.OE_ASYNC_MODE = 1'b0;
defparam syn__2364_.OE_SYNC_MODE = 1'b0;
defparam syn__2364_.OE_POWERUP = 1'b0;
defparam syn__2364_.CFG_TRI_INPUT = 1'b0;
defparam syn__2364_.CFG_PULL_UP = 1'b0;
defparam syn__2364_.CFG_SLR = 1'b0;
defparam syn__2364_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__2364_.CFG_PDRCTRL = 4'b0010;
defparam syn__2364_.CFG_KEEP = 2'b00;
defparam syn__2364_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__2364_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__2364_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__2364_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__2364_.DPCLK_DELAY = 4'b0000;
defparam syn__2364_.OUT_DELAY = 1'b0;
defparam syn__2364_.IN_DATA_DELAY = 3'b000;
defparam syn__2364_.IN_REG_DELAY = 3'b000;

alta_rio syn__2365_(
	.padio(bank2[1]),
	.datain(syn__1102_[1]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__2365_.coord_x = 6;
defparam syn__2365_.coord_y = 1;
defparam syn__2365_.coord_z = 3;
defparam syn__2365_.IN_ASYNC_MODE = 1'b0;
defparam syn__2365_.IN_SYNC_MODE = 1'b0;
defparam syn__2365_.IN_POWERUP = 1'b0;
defparam syn__2365_.OUT_REG_MODE = 1'b0;
defparam syn__2365_.OUT_ASYNC_MODE = 1'b0;
defparam syn__2365_.OUT_SYNC_MODE = 1'b0;
defparam syn__2365_.OUT_POWERUP = 1'b0;
defparam syn__2365_.OE_REG_MODE = 1'b0;
defparam syn__2365_.OE_ASYNC_MODE = 1'b0;
defparam syn__2365_.OE_SYNC_MODE = 1'b0;
defparam syn__2365_.OE_POWERUP = 1'b0;
defparam syn__2365_.CFG_TRI_INPUT = 1'b0;
defparam syn__2365_.CFG_PULL_UP = 1'b0;
defparam syn__2365_.CFG_SLR = 1'b0;
defparam syn__2365_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__2365_.CFG_PDRCTRL = 4'b0010;
defparam syn__2365_.CFG_KEEP = 2'b00;
defparam syn__2365_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__2365_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__2365_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__2365_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__2365_.DPCLK_DELAY = 4'b0000;
defparam syn__2365_.OUT_DELAY = 1'b0;
defparam syn__2365_.IN_DATA_DELAY = 3'b000;
defparam syn__2365_.IN_REG_DELAY = 3'b000;

alta_rio syn__2366_(
	.padio(bank2[2]),
	.datain(syn__1102_[2]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__2366_.coord_x = 9;
defparam syn__2366_.coord_y = 0;
defparam syn__2366_.coord_z = 1;
defparam syn__2366_.IN_ASYNC_MODE = 1'b0;
defparam syn__2366_.IN_SYNC_MODE = 1'b0;
defparam syn__2366_.IN_POWERUP = 1'b0;
defparam syn__2366_.OUT_REG_MODE = 1'b0;
defparam syn__2366_.OUT_ASYNC_MODE = 1'b0;
defparam syn__2366_.OUT_SYNC_MODE = 1'b0;
defparam syn__2366_.OUT_POWERUP = 1'b0;
defparam syn__2366_.OE_REG_MODE = 1'b0;
defparam syn__2366_.OE_ASYNC_MODE = 1'b0;
defparam syn__2366_.OE_SYNC_MODE = 1'b0;
defparam syn__2366_.OE_POWERUP = 1'b0;
defparam syn__2366_.CFG_TRI_INPUT = 1'b0;
defparam syn__2366_.CFG_PULL_UP = 1'b0;
defparam syn__2366_.CFG_SLR = 1'b0;
defparam syn__2366_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__2366_.CFG_PDRCTRL = 4'b0010;
defparam syn__2366_.CFG_KEEP = 2'b00;
defparam syn__2366_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__2366_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__2366_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__2366_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__2366_.DPCLK_DELAY = 4'b0000;
defparam syn__2366_.OUT_DELAY = 1'b0;
defparam syn__2366_.IN_DATA_DELAY = 3'b000;
defparam syn__2366_.IN_REG_DELAY = 3'b000;

alta_rio syn__2367_(
	.padio(bank2[3]),
	.datain(syn__1102_[3]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__2367_.coord_x = 9;
defparam syn__2367_.coord_y = 0;
defparam syn__2367_.coord_z = 3;
defparam syn__2367_.IN_ASYNC_MODE = 1'b0;
defparam syn__2367_.IN_SYNC_MODE = 1'b0;
defparam syn__2367_.IN_POWERUP = 1'b0;
defparam syn__2367_.OUT_REG_MODE = 1'b0;
defparam syn__2367_.OUT_ASYNC_MODE = 1'b0;
defparam syn__2367_.OUT_SYNC_MODE = 1'b0;
defparam syn__2367_.OUT_POWERUP = 1'b0;
defparam syn__2367_.OE_REG_MODE = 1'b0;
defparam syn__2367_.OE_ASYNC_MODE = 1'b0;
defparam syn__2367_.OE_SYNC_MODE = 1'b0;
defparam syn__2367_.OE_POWERUP = 1'b0;
defparam syn__2367_.CFG_TRI_INPUT = 1'b0;
defparam syn__2367_.CFG_PULL_UP = 1'b0;
defparam syn__2367_.CFG_SLR = 1'b0;
defparam syn__2367_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__2367_.CFG_PDRCTRL = 4'b0010;
defparam syn__2367_.CFG_KEEP = 2'b00;
defparam syn__2367_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__2367_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__2367_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__2367_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__2367_.DPCLK_DELAY = 4'b0000;
defparam syn__2367_.OUT_DELAY = 1'b0;
defparam syn__2367_.IN_DATA_DELAY = 3'b000;
defparam syn__2367_.IN_REG_DELAY = 3'b000;

alta_rio syn__2368_(
	.padio(bank2[4]),
	.datain(syn__1102_[4]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__2368_.coord_x = 8;
defparam syn__2368_.coord_y = 9;
defparam syn__2368_.coord_z = 0;
defparam syn__2368_.IN_ASYNC_MODE = 1'b0;
defparam syn__2368_.IN_SYNC_MODE = 1'b0;
defparam syn__2368_.IN_POWERUP = 1'b0;
defparam syn__2368_.OUT_REG_MODE = 1'b0;
defparam syn__2368_.OUT_ASYNC_MODE = 1'b0;
defparam syn__2368_.OUT_SYNC_MODE = 1'b0;
defparam syn__2368_.OUT_POWERUP = 1'b0;
defparam syn__2368_.OE_REG_MODE = 1'b0;
defparam syn__2368_.OE_ASYNC_MODE = 1'b0;
defparam syn__2368_.OE_SYNC_MODE = 1'b0;
defparam syn__2368_.OE_POWERUP = 1'b0;
defparam syn__2368_.CFG_TRI_INPUT = 1'b0;
defparam syn__2368_.CFG_PULL_UP = 1'b0;
defparam syn__2368_.CFG_SLR = 1'b0;
defparam syn__2368_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__2368_.CFG_PDRCTRL = 4'b0010;
defparam syn__2368_.CFG_KEEP = 2'b00;
defparam syn__2368_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__2368_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__2368_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__2368_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__2368_.DPCLK_DELAY = 4'b0000;
defparam syn__2368_.OUT_DELAY = 1'b0;
defparam syn__2368_.IN_DATA_DELAY = 3'b000;
defparam syn__2368_.IN_REG_DELAY = 3'b000;

alta_rio syn__2369_(
	.padio(bank2[5]),
	.datain(syn__1102_[5]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__2369_.coord_x = 11;
defparam syn__2369_.coord_y = 9;
defparam syn__2369_.coord_z = 1;
defparam syn__2369_.IN_ASYNC_MODE = 1'b0;
defparam syn__2369_.IN_SYNC_MODE = 1'b0;
defparam syn__2369_.IN_POWERUP = 1'b0;
defparam syn__2369_.OUT_REG_MODE = 1'b0;
defparam syn__2369_.OUT_ASYNC_MODE = 1'b0;
defparam syn__2369_.OUT_SYNC_MODE = 1'b0;
defparam syn__2369_.OUT_POWERUP = 1'b0;
defparam syn__2369_.OE_REG_MODE = 1'b0;
defparam syn__2369_.OE_ASYNC_MODE = 1'b0;
defparam syn__2369_.OE_SYNC_MODE = 1'b0;
defparam syn__2369_.OE_POWERUP = 1'b0;
defparam syn__2369_.CFG_TRI_INPUT = 1'b0;
defparam syn__2369_.CFG_PULL_UP = 1'b0;
defparam syn__2369_.CFG_SLR = 1'b0;
defparam syn__2369_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__2369_.CFG_PDRCTRL = 4'b0010;
defparam syn__2369_.CFG_KEEP = 2'b00;
defparam syn__2369_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__2369_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__2369_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__2369_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__2369_.DPCLK_DELAY = 4'b0000;
defparam syn__2369_.OUT_DELAY = 1'b0;
defparam syn__2369_.IN_DATA_DELAY = 3'b000;
defparam syn__2369_.IN_REG_DELAY = 3'b000;

alta_rio syn__2370_(
	.padio(bank2[6]),
	.datain(syn__1102_[6]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__2370_.coord_x = 9;
defparam syn__2370_.coord_y = 9;
defparam syn__2370_.coord_z = 3;
defparam syn__2370_.IN_ASYNC_MODE = 1'b0;
defparam syn__2370_.IN_SYNC_MODE = 1'b0;
defparam syn__2370_.IN_POWERUP = 1'b0;
defparam syn__2370_.OUT_REG_MODE = 1'b0;
defparam syn__2370_.OUT_ASYNC_MODE = 1'b0;
defparam syn__2370_.OUT_SYNC_MODE = 1'b0;
defparam syn__2370_.OUT_POWERUP = 1'b0;
defparam syn__2370_.OE_REG_MODE = 1'b0;
defparam syn__2370_.OE_ASYNC_MODE = 1'b0;
defparam syn__2370_.OE_SYNC_MODE = 1'b0;
defparam syn__2370_.OE_POWERUP = 1'b0;
defparam syn__2370_.CFG_TRI_INPUT = 1'b0;
defparam syn__2370_.CFG_PULL_UP = 1'b0;
defparam syn__2370_.CFG_SLR = 1'b0;
defparam syn__2370_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__2370_.CFG_PDRCTRL = 4'b0010;
defparam syn__2370_.CFG_KEEP = 2'b00;
defparam syn__2370_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__2370_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__2370_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__2370_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__2370_.DPCLK_DELAY = 4'b0000;
defparam syn__2370_.OUT_DELAY = 1'b0;
defparam syn__2370_.IN_DATA_DELAY = 3'b000;
defparam syn__2370_.IN_REG_DELAY = 3'b000;

alta_rio syn__2371_(
	.padio(bank2[7]),
	.datain(syn__1102_[7]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__2371_.coord_x = 9;
defparam syn__2371_.coord_y = 9;
defparam syn__2371_.coord_z = 1;
defparam syn__2371_.IN_ASYNC_MODE = 1'b0;
defparam syn__2371_.IN_SYNC_MODE = 1'b0;
defparam syn__2371_.IN_POWERUP = 1'b0;
defparam syn__2371_.OUT_REG_MODE = 1'b0;
defparam syn__2371_.OUT_ASYNC_MODE = 1'b0;
defparam syn__2371_.OUT_SYNC_MODE = 1'b0;
defparam syn__2371_.OUT_POWERUP = 1'b0;
defparam syn__2371_.OE_REG_MODE = 1'b0;
defparam syn__2371_.OE_ASYNC_MODE = 1'b0;
defparam syn__2371_.OE_SYNC_MODE = 1'b0;
defparam syn__2371_.OE_POWERUP = 1'b0;
defparam syn__2371_.CFG_TRI_INPUT = 1'b0;
defparam syn__2371_.CFG_PULL_UP = 1'b0;
defparam syn__2371_.CFG_SLR = 1'b0;
defparam syn__2371_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__2371_.CFG_PDRCTRL = 4'b0010;
defparam syn__2371_.CFG_KEEP = 2'b00;
defparam syn__2371_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__2371_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__2371_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__2371_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__2371_.DPCLK_DELAY = 4'b0000;
defparam syn__2371_.OUT_DELAY = 1'b0;
defparam syn__2371_.IN_DATA_DELAY = 3'b000;
defparam syn__2371_.IN_REG_DELAY = 3'b000;

alta_rio syn__2372_(
	.padio(bank3[0]),
	.datain(gnd),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__2372_.coord_x = 8;
defparam syn__2372_.coord_y = 9;
defparam syn__2372_.coord_z = 3;
defparam syn__2372_.IN_ASYNC_MODE = 1'b0;
defparam syn__2372_.IN_SYNC_MODE = 1'b0;
defparam syn__2372_.IN_POWERUP = 1'b0;
defparam syn__2372_.OUT_REG_MODE = 1'b0;
defparam syn__2372_.OUT_ASYNC_MODE = 1'b0;
defparam syn__2372_.OUT_SYNC_MODE = 1'b0;
defparam syn__2372_.OUT_POWERUP = 1'b0;
defparam syn__2372_.OE_REG_MODE = 1'b0;
defparam syn__2372_.OE_ASYNC_MODE = 1'b0;
defparam syn__2372_.OE_SYNC_MODE = 1'b0;
defparam syn__2372_.OE_POWERUP = 1'b0;
defparam syn__2372_.CFG_TRI_INPUT = 1'b0;
defparam syn__2372_.CFG_PULL_UP = 1'b0;
defparam syn__2372_.CFG_SLR = 1'b0;
defparam syn__2372_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__2372_.CFG_PDRCTRL = 4'b0010;
defparam syn__2372_.CFG_KEEP = 2'b00;
defparam syn__2372_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__2372_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__2372_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__2372_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__2372_.DPCLK_DELAY = 4'b0000;
defparam syn__2372_.OUT_DELAY = 1'b0;
defparam syn__2372_.IN_DATA_DELAY = 3'b000;
defparam syn__2372_.IN_REG_DELAY = 3'b000;

alta_rio syn__2373_(
	.padio(bank3[1]),
	.datain(gnd),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__2373_.coord_x = 7;
defparam syn__2373_.coord_y = 9;
defparam syn__2373_.coord_z = 3;
defparam syn__2373_.IN_ASYNC_MODE = 1'b0;
defparam syn__2373_.IN_SYNC_MODE = 1'b0;
defparam syn__2373_.IN_POWERUP = 1'b0;
defparam syn__2373_.OUT_REG_MODE = 1'b0;
defparam syn__2373_.OUT_ASYNC_MODE = 1'b0;
defparam syn__2373_.OUT_SYNC_MODE = 1'b0;
defparam syn__2373_.OUT_POWERUP = 1'b0;
defparam syn__2373_.OE_REG_MODE = 1'b0;
defparam syn__2373_.OE_ASYNC_MODE = 1'b0;
defparam syn__2373_.OE_SYNC_MODE = 1'b0;
defparam syn__2373_.OE_POWERUP = 1'b0;
defparam syn__2373_.CFG_TRI_INPUT = 1'b0;
defparam syn__2373_.CFG_PULL_UP = 1'b0;
defparam syn__2373_.CFG_SLR = 1'b0;
defparam syn__2373_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__2373_.CFG_PDRCTRL = 4'b0010;
defparam syn__2373_.CFG_KEEP = 2'b00;
defparam syn__2373_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__2373_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__2373_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__2373_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__2373_.DPCLK_DELAY = 4'b0000;
defparam syn__2373_.OUT_DELAY = 1'b0;
defparam syn__2373_.IN_DATA_DELAY = 3'b000;
defparam syn__2373_.IN_REG_DELAY = 3'b000;

alta_rio syn__2374_(
	.padio(bank3[2]),
	.datain(gnd),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__2374_.coord_x = 7;
defparam syn__2374_.coord_y = 9;
defparam syn__2374_.coord_z = 0;
defparam syn__2374_.IN_ASYNC_MODE = 1'b0;
defparam syn__2374_.IN_SYNC_MODE = 1'b0;
defparam syn__2374_.IN_POWERUP = 1'b0;
defparam syn__2374_.OUT_REG_MODE = 1'b0;
defparam syn__2374_.OUT_ASYNC_MODE = 1'b0;
defparam syn__2374_.OUT_SYNC_MODE = 1'b0;
defparam syn__2374_.OUT_POWERUP = 1'b0;
defparam syn__2374_.OE_REG_MODE = 1'b0;
defparam syn__2374_.OE_ASYNC_MODE = 1'b0;
defparam syn__2374_.OE_SYNC_MODE = 1'b0;
defparam syn__2374_.OE_POWERUP = 1'b0;
defparam syn__2374_.CFG_TRI_INPUT = 1'b0;
defparam syn__2374_.CFG_PULL_UP = 1'b0;
defparam syn__2374_.CFG_SLR = 1'b0;
defparam syn__2374_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__2374_.CFG_PDRCTRL = 4'b0010;
defparam syn__2374_.CFG_KEEP = 2'b00;
defparam syn__2374_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__2374_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__2374_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__2374_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__2374_.DPCLK_DELAY = 4'b0000;
defparam syn__2374_.OUT_DELAY = 1'b0;
defparam syn__2374_.IN_DATA_DELAY = 3'b000;
defparam syn__2374_.IN_REG_DELAY = 3'b000;

alta_rio syn__2375_(
	.padio(bank3[3]),
	.datain(gnd),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__2375_.coord_x = 6;
defparam syn__2375_.coord_y = 9;
defparam syn__2375_.coord_z = 0;
defparam syn__2375_.IN_ASYNC_MODE = 1'b0;
defparam syn__2375_.IN_SYNC_MODE = 1'b0;
defparam syn__2375_.IN_POWERUP = 1'b0;
defparam syn__2375_.OUT_REG_MODE = 1'b0;
defparam syn__2375_.OUT_ASYNC_MODE = 1'b0;
defparam syn__2375_.OUT_SYNC_MODE = 1'b0;
defparam syn__2375_.OUT_POWERUP = 1'b0;
defparam syn__2375_.OE_REG_MODE = 1'b0;
defparam syn__2375_.OE_ASYNC_MODE = 1'b0;
defparam syn__2375_.OE_SYNC_MODE = 1'b0;
defparam syn__2375_.OE_POWERUP = 1'b0;
defparam syn__2375_.CFG_TRI_INPUT = 1'b0;
defparam syn__2375_.CFG_PULL_UP = 1'b0;
defparam syn__2375_.CFG_SLR = 1'b0;
defparam syn__2375_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__2375_.CFG_PDRCTRL = 4'b0010;
defparam syn__2375_.CFG_KEEP = 2'b00;
defparam syn__2375_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__2375_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__2375_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__2375_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__2375_.DPCLK_DELAY = 4'b0000;
defparam syn__2375_.OUT_DELAY = 1'b0;
defparam syn__2375_.IN_DATA_DELAY = 3'b000;
defparam syn__2375_.IN_REG_DELAY = 3'b000;

alta_rio syn__2376_(
	.padio(bank3[4]),
	.datain(gnd),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__2376_.coord_x = 5;
defparam syn__2376_.coord_y = 9;
defparam syn__2376_.coord_z = 3;
defparam syn__2376_.IN_ASYNC_MODE = 1'b0;
defparam syn__2376_.IN_SYNC_MODE = 1'b0;
defparam syn__2376_.IN_POWERUP = 1'b0;
defparam syn__2376_.OUT_REG_MODE = 1'b0;
defparam syn__2376_.OUT_ASYNC_MODE = 1'b0;
defparam syn__2376_.OUT_SYNC_MODE = 1'b0;
defparam syn__2376_.OUT_POWERUP = 1'b0;
defparam syn__2376_.OE_REG_MODE = 1'b0;
defparam syn__2376_.OE_ASYNC_MODE = 1'b0;
defparam syn__2376_.OE_SYNC_MODE = 1'b0;
defparam syn__2376_.OE_POWERUP = 1'b0;
defparam syn__2376_.CFG_TRI_INPUT = 1'b0;
defparam syn__2376_.CFG_PULL_UP = 1'b0;
defparam syn__2376_.CFG_SLR = 1'b0;
defparam syn__2376_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__2376_.CFG_PDRCTRL = 4'b0010;
defparam syn__2376_.CFG_KEEP = 2'b00;
defparam syn__2376_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__2376_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__2376_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__2376_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__2376_.DPCLK_DELAY = 4'b0000;
defparam syn__2376_.OUT_DELAY = 1'b0;
defparam syn__2376_.IN_DATA_DELAY = 3'b000;
defparam syn__2376_.IN_REG_DELAY = 3'b000;

alta_rio syn__2377_(
	.padio(bank3[5]),
	.datain(gnd),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__2377_.coord_x = 5;
defparam syn__2377_.coord_y = 9;
defparam syn__2377_.coord_z = 2;
defparam syn__2377_.IN_ASYNC_MODE = 1'b0;
defparam syn__2377_.IN_SYNC_MODE = 1'b0;
defparam syn__2377_.IN_POWERUP = 1'b0;
defparam syn__2377_.OUT_REG_MODE = 1'b0;
defparam syn__2377_.OUT_ASYNC_MODE = 1'b0;
defparam syn__2377_.OUT_SYNC_MODE = 1'b0;
defparam syn__2377_.OUT_POWERUP = 1'b0;
defparam syn__2377_.OE_REG_MODE = 1'b0;
defparam syn__2377_.OE_ASYNC_MODE = 1'b0;
defparam syn__2377_.OE_SYNC_MODE = 1'b0;
defparam syn__2377_.OE_POWERUP = 1'b0;
defparam syn__2377_.CFG_TRI_INPUT = 1'b0;
defparam syn__2377_.CFG_PULL_UP = 1'b0;
defparam syn__2377_.CFG_SLR = 1'b0;
defparam syn__2377_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__2377_.CFG_PDRCTRL = 4'b0010;
defparam syn__2377_.CFG_KEEP = 2'b00;
defparam syn__2377_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__2377_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__2377_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__2377_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__2377_.DPCLK_DELAY = 4'b0000;
defparam syn__2377_.OUT_DELAY = 1'b0;
defparam syn__2377_.IN_DATA_DELAY = 3'b000;
defparam syn__2377_.IN_REG_DELAY = 3'b000;

alta_rio syn__2378_(
	.padio(bank3[6]),
	.datain(gnd),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__2378_.coord_x = 5;
defparam syn__2378_.coord_y = 9;
defparam syn__2378_.coord_z = 1;
defparam syn__2378_.IN_ASYNC_MODE = 1'b0;
defparam syn__2378_.IN_SYNC_MODE = 1'b0;
defparam syn__2378_.IN_POWERUP = 1'b0;
defparam syn__2378_.OUT_REG_MODE = 1'b0;
defparam syn__2378_.OUT_ASYNC_MODE = 1'b0;
defparam syn__2378_.OUT_SYNC_MODE = 1'b0;
defparam syn__2378_.OUT_POWERUP = 1'b0;
defparam syn__2378_.OE_REG_MODE = 1'b0;
defparam syn__2378_.OE_ASYNC_MODE = 1'b0;
defparam syn__2378_.OE_SYNC_MODE = 1'b0;
defparam syn__2378_.OE_POWERUP = 1'b0;
defparam syn__2378_.CFG_TRI_INPUT = 1'b0;
defparam syn__2378_.CFG_PULL_UP = 1'b0;
defparam syn__2378_.CFG_SLR = 1'b0;
defparam syn__2378_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__2378_.CFG_PDRCTRL = 4'b0010;
defparam syn__2378_.CFG_KEEP = 2'b00;
defparam syn__2378_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__2378_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__2378_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__2378_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__2378_.DPCLK_DELAY = 4'b0000;
defparam syn__2378_.OUT_DELAY = 1'b0;
defparam syn__2378_.IN_DATA_DELAY = 3'b000;
defparam syn__2378_.IN_REG_DELAY = 3'b000;

alta_rio syn__2379_(
	.padio(bank3[7]),
	.datain(gnd),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__2379_.coord_x = 5;
defparam syn__2379_.coord_y = 9;
defparam syn__2379_.coord_z = 0;
defparam syn__2379_.IN_ASYNC_MODE = 1'b0;
defparam syn__2379_.IN_SYNC_MODE = 1'b0;
defparam syn__2379_.IN_POWERUP = 1'b0;
defparam syn__2379_.OUT_REG_MODE = 1'b0;
defparam syn__2379_.OUT_ASYNC_MODE = 1'b0;
defparam syn__2379_.OUT_SYNC_MODE = 1'b0;
defparam syn__2379_.OUT_POWERUP = 1'b0;
defparam syn__2379_.OE_REG_MODE = 1'b0;
defparam syn__2379_.OE_ASYNC_MODE = 1'b0;
defparam syn__2379_.OE_SYNC_MODE = 1'b0;
defparam syn__2379_.OE_POWERUP = 1'b0;
defparam syn__2379_.CFG_TRI_INPUT = 1'b0;
defparam syn__2379_.CFG_PULL_UP = 1'b0;
defparam syn__2379_.CFG_SLR = 1'b0;
defparam syn__2379_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__2379_.CFG_PDRCTRL = 4'b0010;
defparam syn__2379_.CFG_KEEP = 2'b00;
defparam syn__2379_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__2379_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__2379_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__2379_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__2379_.DPCLK_DELAY = 4'b0000;
defparam syn__2379_.OUT_DELAY = 1'b0;
defparam syn__2379_.IN_DATA_DELAY = 3'b000;
defparam syn__2379_.IN_REG_DELAY = 3'b000;

alta_rio syn__2380_(
	.padio(clk),
	.datain(gnd),
	.oe(gnd),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(syn__1103_),
	.regout());
defparam syn__2380_.coord_x = 4;
defparam syn__2380_.coord_y = 9;
defparam syn__2380_.coord_z = 0;
defparam syn__2380_.IN_ASYNC_MODE = 1'b0;
defparam syn__2380_.IN_SYNC_MODE = 1'b0;
defparam syn__2380_.IN_POWERUP = 1'b0;
defparam syn__2380_.OUT_REG_MODE = 1'b0;
defparam syn__2380_.OUT_ASYNC_MODE = 1'b0;
defparam syn__2380_.OUT_SYNC_MODE = 1'b0;
defparam syn__2380_.OUT_POWERUP = 1'b0;
defparam syn__2380_.OE_REG_MODE = 1'b0;
defparam syn__2380_.OE_ASYNC_MODE = 1'b0;
defparam syn__2380_.OE_SYNC_MODE = 1'b0;
defparam syn__2380_.OE_POWERUP = 1'b0;
defparam syn__2380_.CFG_TRI_INPUT = 1'b0;
defparam syn__2380_.CFG_PULL_UP = 1'b0;
defparam syn__2380_.CFG_SLR = 1'b0;
defparam syn__2380_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__2380_.CFG_PDRCTRL = 4'b0010;
defparam syn__2380_.CFG_KEEP = 2'b00;
defparam syn__2380_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__2380_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__2380_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__2380_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__2380_.DPCLK_DELAY = 4'b0000;
defparam syn__2380_.OUT_DELAY = 1'b0;
defparam syn__2380_.IN_DATA_DELAY = 3'b000;
defparam syn__2380_.IN_REG_DELAY = 3'b000;

alta_slice syn__2381_(
	.A(IOvalue1[0]),
	.B(vcc),
	.C(vcc),
	.D(syn__0807_),
	.Cin(),
	.Qin(syn__1100_[0]),
	.Clk(syn__1103__X1012_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1012_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0000_[0]),
	.Cout(),
	.Q(syn__1100_[0]));
defparam syn__2381_.coord_x = 9;
defparam syn__2381_.coord_y = 5;
defparam syn__2381_.coord_z = 3;
defparam syn__2381_.mask = 16'hAAF0;
defparam syn__2381_.modeMux = 1'b0;
defparam syn__2381_.FeedbackMux = 1'b1;
defparam syn__2381_.ShiftMux = 1'b0;
defparam syn__2381_.BypassEn = 1'b0;
defparam syn__2381_.CarryEnb = 1'b1;

alta_slice syn__2382_(
	.A(vcc),
	.B(IOvalue1[1]),
	.C(vcc),
	.D(syn__0807_),
	.Cin(),
	.Qin(syn__1100_[1]),
	.Clk(syn__1103__X1012_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1012_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0000_[1]),
	.Cout(),
	.Q(syn__1100_[1]));
defparam syn__2382_.coord_x = 9;
defparam syn__2382_.coord_y = 5;
defparam syn__2382_.coord_z = 9;
defparam syn__2382_.mask = 16'hCCF0;
defparam syn__2382_.modeMux = 1'b0;
defparam syn__2382_.FeedbackMux = 1'b1;
defparam syn__2382_.ShiftMux = 1'b0;
defparam syn__2382_.BypassEn = 1'b0;
defparam syn__2382_.CarryEnb = 1'b1;

alta_slice syn__2383_(
	.A(vcc),
	.B(IOvalue1[2]),
	.C(vcc),
	.D(syn__0807_),
	.Cin(),
	.Qin(syn__1100_[2]),
	.Clk(syn__1103__X1012_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1012_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0000_[2]),
	.Cout(),
	.Q(syn__1100_[2]));
defparam syn__2383_.coord_x = 9;
defparam syn__2383_.coord_y = 5;
defparam syn__2383_.coord_z = 4;
defparam syn__2383_.mask = 16'hCCF0;
defparam syn__2383_.modeMux = 1'b0;
defparam syn__2383_.FeedbackMux = 1'b1;
defparam syn__2383_.ShiftMux = 1'b0;
defparam syn__2383_.BypassEn = 1'b0;
defparam syn__2383_.CarryEnb = 1'b1;

alta_slice syn__2384_(
	.A(vcc),
	.B(syn__0807_),
	.C(vcc),
	.D(IOvalue1[3]),
	.Cin(),
	.Qin(syn__1100_[3]),
	.Clk(syn__1103__X1012_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1012_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0000_[3]),
	.Cout(),
	.Q(syn__1100_[3]));
defparam syn__2384_.coord_x = 9;
defparam syn__2384_.coord_y = 5;
defparam syn__2384_.coord_z = 5;
defparam syn__2384_.mask = 16'hFC30;
defparam syn__2384_.modeMux = 1'b0;
defparam syn__2384_.FeedbackMux = 1'b1;
defparam syn__2384_.ShiftMux = 1'b0;
defparam syn__2384_.BypassEn = 1'b0;
defparam syn__2384_.CarryEnb = 1'b1;

alta_slice syn__2385_(
	.A(vcc),
	.B(syn__0807_),
	.C(vcc),
	.D(IOvalue1[4]),
	.Cin(),
	.Qin(syn__1100_[4]),
	.Clk(syn__1103__X1012_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1012_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0000_[4]),
	.Cout(),
	.Q(syn__1100_[4]));
defparam syn__2385_.coord_x = 9;
defparam syn__2385_.coord_y = 5;
defparam syn__2385_.coord_z = 14;
defparam syn__2385_.mask = 16'hFC30;
defparam syn__2385_.modeMux = 1'b0;
defparam syn__2385_.FeedbackMux = 1'b1;
defparam syn__2385_.ShiftMux = 1'b0;
defparam syn__2385_.BypassEn = 1'b0;
defparam syn__2385_.CarryEnb = 1'b1;

alta_slice syn__2386_(
	.A(vcc),
	.B(syn__0807_),
	.C(vcc),
	.D(IOvalue1[5]),
	.Cin(),
	.Qin(syn__1100_[5]),
	.Clk(syn__1103__X1012_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1012_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0000_[5]),
	.Cout(),
	.Q(syn__1100_[5]));
defparam syn__2386_.coord_x = 9;
defparam syn__2386_.coord_y = 5;
defparam syn__2386_.coord_z = 6;
defparam syn__2386_.mask = 16'hFC30;
defparam syn__2386_.modeMux = 1'b0;
defparam syn__2386_.FeedbackMux = 1'b1;
defparam syn__2386_.ShiftMux = 1'b0;
defparam syn__2386_.BypassEn = 1'b0;
defparam syn__2386_.CarryEnb = 1'b1;

alta_slice syn__2387_(
	.A(vcc),
	.B(syn__0807_),
	.C(vcc),
	.D(IOvalue1[6]),
	.Cin(),
	.Qin(syn__1100_[6]),
	.Clk(syn__1103__X1012_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1012_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0000_[6]),
	.Cout(),
	.Q(syn__1100_[6]));
defparam syn__2387_.coord_x = 9;
defparam syn__2387_.coord_y = 5;
defparam syn__2387_.coord_z = 12;
defparam syn__2387_.mask = 16'hFC30;
defparam syn__2387_.modeMux = 1'b0;
defparam syn__2387_.FeedbackMux = 1'b1;
defparam syn__2387_.ShiftMux = 1'b0;
defparam syn__2387_.BypassEn = 1'b0;
defparam syn__2387_.CarryEnb = 1'b1;

alta_slice syn__2388_(
	.A(vcc),
	.B(IOvalue1[7]),
	.C(vcc),
	.D(syn__0807_),
	.Cin(),
	.Qin(syn__1100_[7]),
	.Clk(syn__1103__X1012_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1012_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0000_[7]),
	.Cout(),
	.Q(syn__1100_[7]));
defparam syn__2388_.coord_x = 9;
defparam syn__2388_.coord_y = 5;
defparam syn__2388_.coord_z = 2;
defparam syn__2388_.mask = 16'hCCF0;
defparam syn__2388_.modeMux = 1'b0;
defparam syn__2388_.FeedbackMux = 1'b1;
defparam syn__2388_.ShiftMux = 1'b0;
defparam syn__2388_.BypassEn = 1'b0;
defparam syn__2388_.CarryEnb = 1'b1;

alta_slice syn__2389_(
	.A(IOvalue2[0]),
	.B(vcc),
	.C(vcc),
	.D(syn__0794_),
	.Cin(),
	.Qin(syn__1101_[0]),
	.Clk(syn__1103__X1011_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1011_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0001_[0]),
	.Cout(),
	.Q(syn__1101_[0]));
defparam syn__2389_.coord_x = 9;
defparam syn__2389_.coord_y = 1;
defparam syn__2389_.coord_z = 10;
defparam syn__2389_.mask = 16'hAAF0;
defparam syn__2389_.modeMux = 1'b0;
defparam syn__2389_.FeedbackMux = 1'b1;
defparam syn__2389_.ShiftMux = 1'b0;
defparam syn__2389_.BypassEn = 1'b0;
defparam syn__2389_.CarryEnb = 1'b1;

alta_slice syn__2390_(
	.A(vcc),
	.B(IOvalue2[1]),
	.C(vcc),
	.D(syn__0794_),
	.Cin(),
	.Qin(syn__1101_[1]),
	.Clk(syn__1103__X1011_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1011_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0001_[1]),
	.Cout(),
	.Q(syn__1101_[1]));
defparam syn__2390_.coord_x = 9;
defparam syn__2390_.coord_y = 1;
defparam syn__2390_.coord_z = 4;
defparam syn__2390_.mask = 16'hCCF0;
defparam syn__2390_.modeMux = 1'b0;
defparam syn__2390_.FeedbackMux = 1'b1;
defparam syn__2390_.ShiftMux = 1'b0;
defparam syn__2390_.BypassEn = 1'b0;
defparam syn__2390_.CarryEnb = 1'b1;

alta_slice syn__2391_(
	.A(vcc),
	.B(syn__0794_),
	.C(vcc),
	.D(IOvalue2[2]),
	.Cin(),
	.Qin(syn__1101_[2]),
	.Clk(syn__1103__X1011_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1011_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0001_[2]),
	.Cout(),
	.Q(syn__1101_[2]));
defparam syn__2391_.coord_x = 9;
defparam syn__2391_.coord_y = 1;
defparam syn__2391_.coord_z = 5;
defparam syn__2391_.mask = 16'hFC30;
defparam syn__2391_.modeMux = 1'b0;
defparam syn__2391_.FeedbackMux = 1'b1;
defparam syn__2391_.ShiftMux = 1'b0;
defparam syn__2391_.BypassEn = 1'b0;
defparam syn__2391_.CarryEnb = 1'b1;

alta_slice syn__2392_(
	.A(vcc),
	.B(IOvalue2[3]),
	.C(vcc),
	.D(syn__0794_),
	.Cin(),
	.Qin(syn__1101_[3]),
	.Clk(syn__1103__X1011_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1011_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0001_[3]),
	.Cout(),
	.Q(syn__1101_[3]));
defparam syn__2392_.coord_x = 9;
defparam syn__2392_.coord_y = 1;
defparam syn__2392_.coord_z = 15;
defparam syn__2392_.mask = 16'hCCF0;
defparam syn__2392_.modeMux = 1'b0;
defparam syn__2392_.FeedbackMux = 1'b1;
defparam syn__2392_.ShiftMux = 1'b0;
defparam syn__2392_.BypassEn = 1'b0;
defparam syn__2392_.CarryEnb = 1'b1;

alta_slice syn__2393_(
	.A(vcc),
	.B(IOvalue2[4]),
	.C(vcc),
	.D(syn__0794_),
	.Cin(),
	.Qin(syn__1101_[4]),
	.Clk(syn__1103__X1011_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1011_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0001_[4]),
	.Cout(),
	.Q(syn__1101_[4]));
defparam syn__2393_.coord_x = 9;
defparam syn__2393_.coord_y = 1;
defparam syn__2393_.coord_z = 11;
defparam syn__2393_.mask = 16'hCCF0;
defparam syn__2393_.modeMux = 1'b0;
defparam syn__2393_.FeedbackMux = 1'b1;
defparam syn__2393_.ShiftMux = 1'b0;
defparam syn__2393_.BypassEn = 1'b0;
defparam syn__2393_.CarryEnb = 1'b1;

alta_slice syn__2394_(
	.A(vcc),
	.B(syn__0794_),
	.C(vcc),
	.D(IOvalue2[5]),
	.Cin(),
	.Qin(syn__1101_[5]),
	.Clk(syn__1103__X1011_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1011_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0001_[5]),
	.Cout(),
	.Q(syn__1101_[5]));
defparam syn__2394_.coord_x = 9;
defparam syn__2394_.coord_y = 1;
defparam syn__2394_.coord_z = 1;
defparam syn__2394_.mask = 16'hFC30;
defparam syn__2394_.modeMux = 1'b0;
defparam syn__2394_.FeedbackMux = 1'b1;
defparam syn__2394_.ShiftMux = 1'b0;
defparam syn__2394_.BypassEn = 1'b0;
defparam syn__2394_.CarryEnb = 1'b1;

alta_slice syn__2395_(
	.A(vcc),
	.B(syn__0794_),
	.C(vcc),
	.D(IOvalue2[6]),
	.Cin(),
	.Qin(syn__1101_[6]),
	.Clk(syn__1103__X1011_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1011_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0001_[6]),
	.Cout(),
	.Q(syn__1101_[6]));
defparam syn__2395_.coord_x = 9;
defparam syn__2395_.coord_y = 1;
defparam syn__2395_.coord_z = 13;
defparam syn__2395_.mask = 16'hFC30;
defparam syn__2395_.modeMux = 1'b0;
defparam syn__2395_.FeedbackMux = 1'b1;
defparam syn__2395_.ShiftMux = 1'b0;
defparam syn__2395_.BypassEn = 1'b0;
defparam syn__2395_.CarryEnb = 1'b1;

alta_slice syn__2396_(
	.A(IOvalue2[7]),
	.B(vcc),
	.C(vcc),
	.D(syn__0794_),
	.Cin(),
	.Qin(syn__1101_[7]),
	.Clk(syn__1103__X1011_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1011_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0001_[7]),
	.Cout(),
	.Q(syn__1101_[7]));
defparam syn__2396_.coord_x = 9;
defparam syn__2396_.coord_y = 1;
defparam syn__2396_.coord_z = 12;
defparam syn__2396_.mask = 16'hAAF0;
defparam syn__2396_.modeMux = 1'b0;
defparam syn__2396_.FeedbackMux = 1'b1;
defparam syn__2396_.ShiftMux = 1'b0;
defparam syn__2396_.BypassEn = 1'b0;
defparam syn__2396_.CarryEnb = 1'b1;

alta_slice syn__2397_(
	.A(IOvalue3[0]),
	.B(vcc),
	.C(vcc),
	.D(syn__0781_),
	.Cin(),
	.Qin(syn__1102_[0]),
	.Clk(syn__1103__X1009_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1009_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0002_[0]),
	.Cout(),
	.Q(syn__1102_[0]));
defparam syn__2397_.coord_x = 4;
defparam syn__2397_.coord_y = 6;
defparam syn__2397_.coord_z = 12;
defparam syn__2397_.mask = 16'hAAF0;
defparam syn__2397_.modeMux = 1'b0;
defparam syn__2397_.FeedbackMux = 1'b1;
defparam syn__2397_.ShiftMux = 1'b0;
defparam syn__2397_.BypassEn = 1'b0;
defparam syn__2397_.CarryEnb = 1'b1;

alta_slice syn__2398_(
	.A(vcc),
	.B(syn__0781_),
	.C(vcc),
	.D(IOvalue3[1]),
	.Cin(),
	.Qin(syn__1102_[1]),
	.Clk(syn__1103__X1009_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1009_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0002_[1]),
	.Cout(),
	.Q(syn__1102_[1]));
defparam syn__2398_.coord_x = 4;
defparam syn__2398_.coord_y = 6;
defparam syn__2398_.coord_z = 14;
defparam syn__2398_.mask = 16'hFC30;
defparam syn__2398_.modeMux = 1'b0;
defparam syn__2398_.FeedbackMux = 1'b1;
defparam syn__2398_.ShiftMux = 1'b0;
defparam syn__2398_.BypassEn = 1'b0;
defparam syn__2398_.CarryEnb = 1'b1;

alta_slice syn__2399_(
	.A(IOvalue3[2]),
	.B(vcc),
	.C(vcc),
	.D(syn__0781_),
	.Cin(),
	.Qin(syn__1102_[2]),
	.Clk(syn__1103__X1009_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1009_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0002_[2]),
	.Cout(),
	.Q(syn__1102_[2]));
defparam syn__2399_.coord_x = 4;
defparam syn__2399_.coord_y = 6;
defparam syn__2399_.coord_z = 15;
defparam syn__2399_.mask = 16'hAAF0;
defparam syn__2399_.modeMux = 1'b0;
defparam syn__2399_.FeedbackMux = 1'b1;
defparam syn__2399_.ShiftMux = 1'b0;
defparam syn__2399_.BypassEn = 1'b0;
defparam syn__2399_.CarryEnb = 1'b1;

alta_slice syn__2400_(
	.A(vcc),
	.B(syn__0781_),
	.C(vcc),
	.D(IOvalue3[3]),
	.Cin(),
	.Qin(syn__1102_[3]),
	.Clk(syn__1103__X1009_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1009_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0002_[3]),
	.Cout(),
	.Q(syn__1102_[3]));
defparam syn__2400_.coord_x = 4;
defparam syn__2400_.coord_y = 6;
defparam syn__2400_.coord_z = 6;
defparam syn__2400_.mask = 16'hFC30;
defparam syn__2400_.modeMux = 1'b0;
defparam syn__2400_.FeedbackMux = 1'b1;
defparam syn__2400_.ShiftMux = 1'b0;
defparam syn__2400_.BypassEn = 1'b0;
defparam syn__2400_.CarryEnb = 1'b1;

alta_slice syn__2401_(
	.A(vcc),
	.B(IOvalue3[4]),
	.C(vcc),
	.D(syn__0781_),
	.Cin(),
	.Qin(syn__1102_[4]),
	.Clk(syn__1103__X1009_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1009_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0002_[4]),
	.Cout(),
	.Q(syn__1102_[4]));
defparam syn__2401_.coord_x = 4;
defparam syn__2401_.coord_y = 6;
defparam syn__2401_.coord_z = 7;
defparam syn__2401_.mask = 16'hCCF0;
defparam syn__2401_.modeMux = 1'b0;
defparam syn__2401_.FeedbackMux = 1'b1;
defparam syn__2401_.ShiftMux = 1'b0;
defparam syn__2401_.BypassEn = 1'b0;
defparam syn__2401_.CarryEnb = 1'b1;

alta_slice syn__2402_(
	.A(vcc),
	.B(syn__0781_),
	.C(vcc),
	.D(IOvalue3[5]),
	.Cin(),
	.Qin(syn__1102_[5]),
	.Clk(syn__1103__X1009_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1009_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0002_[5]),
	.Cout(),
	.Q(syn__1102_[5]));
defparam syn__2402_.coord_x = 4;
defparam syn__2402_.coord_y = 6;
defparam syn__2402_.coord_z = 13;
defparam syn__2402_.mask = 16'hFC30;
defparam syn__2402_.modeMux = 1'b0;
defparam syn__2402_.FeedbackMux = 1'b1;
defparam syn__2402_.ShiftMux = 1'b0;
defparam syn__2402_.BypassEn = 1'b0;
defparam syn__2402_.CarryEnb = 1'b1;

alta_slice syn__2403_(
	.A(vcc),
	.B(IOvalue3[6]),
	.C(vcc),
	.D(syn__0781_),
	.Cin(),
	.Qin(syn__1102_[6]),
	.Clk(syn__1103__X1009_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1009_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0002_[6]),
	.Cout(),
	.Q(syn__1102_[6]));
defparam syn__2403_.coord_x = 4;
defparam syn__2403_.coord_y = 6;
defparam syn__2403_.coord_z = 1;
defparam syn__2403_.mask = 16'hCCF0;
defparam syn__2403_.modeMux = 1'b0;
defparam syn__2403_.FeedbackMux = 1'b1;
defparam syn__2403_.ShiftMux = 1'b0;
defparam syn__2403_.BypassEn = 1'b0;
defparam syn__2403_.CarryEnb = 1'b1;

alta_slice syn__2404_(
	.A(vcc),
	.B(syn__0781_),
	.C(vcc),
	.D(IOvalue3[7]),
	.Cin(),
	.Qin(syn__1102_[7]),
	.Clk(syn__1103__X1009_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1009_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__0002_[7]),
	.Cout(),
	.Q(syn__1102_[7]));
defparam syn__2404_.coord_x = 4;
defparam syn__2404_.coord_y = 6;
defparam syn__2404_.coord_z = 0;
defparam syn__2404_.mask = 16'hFC30;
defparam syn__2404_.modeMux = 1'b0;
defparam syn__2404_.FeedbackMux = 1'b1;
defparam syn__2404_.ShiftMux = 1'b0;
defparam syn__2404_.BypassEn = 1'b0;
defparam syn__2404_.CarryEnb = 1'b1;

alta_slice syn__2405_(
	.A(syn__0820_),
	.B(syn__1063_),
	.C(vcc),
	.D(syn__1023_),
	.Cin(),
	.Qin(\tc1.PC [0]),
	.Clk(syn__1103__X1000_Y1002_SIG_VCC),
	.AsyncReset(AsyncReset_X1000_Y1002_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc1.PCmux [0]),
	.Cout(),
	.Q(\tc1.PC [0]));
defparam syn__2405_.coord_x = 12;
defparam syn__2405_.coord_y = 8;
defparam syn__2405_.coord_z = 15;
defparam syn__2405_.mask = 16'h21ED;
defparam syn__2405_.modeMux = 1'b0;
defparam syn__2405_.FeedbackMux = 1'b1;
defparam syn__2405_.ShiftMux = 1'b0;
defparam syn__2405_.BypassEn = 1'b0;
defparam syn__2405_.CarryEnb = 1'b1;

alta_slice syn__2406_(
	.A(vcc),
	.B(syn__1063_),
	.C(syn__1064_),
	.D(syn__1019_),
	.Cin(),
	.Qin(\tc1.PC [1]),
	.Clk(syn__1103__X1000_Y1002_SIG_VCC),
	.AsyncReset(AsyncReset_X1000_Y1002_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc1.PCmux [1]),
	.Cout(),
	.Q(\tc1.PC [1]));
defparam syn__2406_.coord_x = 12;
defparam syn__2406_.coord_y = 8;
defparam syn__2406_.coord_z = 11;
defparam syn__2406_.mask = 16'hF0FC;
defparam syn__2406_.modeMux = 1'b0;
defparam syn__2406_.FeedbackMux = 1'b0;
defparam syn__2406_.ShiftMux = 1'b0;
defparam syn__2406_.BypassEn = 1'b0;
defparam syn__2406_.CarryEnb = 1'b1;

alta_slice syn__2407_(
	.A(syn__1063_),
	.B(syn__1015_),
	.C(vcc),
	.D(syn__1065_),
	.Cin(),
	.Qin(\tc1.PC [2]),
	.Clk(syn__1103__X1001_Y1002_SIG_VCC),
	.AsyncReset(AsyncReset_X1001_Y1002_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc1.PCmux [2]),
	.Cout(),
	.Q(\tc1.PC [2]));
defparam syn__2407_.coord_x = 12;
defparam syn__2407_.coord_y = 7;
defparam syn__2407_.coord_z = 4;
defparam syn__2407_.mask = 16'h2772;
defparam syn__2407_.modeMux = 1'b0;
defparam syn__2407_.FeedbackMux = 1'b1;
defparam syn__2407_.ShiftMux = 1'b0;
defparam syn__2407_.BypassEn = 1'b0;
defparam syn__2407_.CarryEnb = 1'b1;

alta_slice syn__2408_(
	.A(syn__1066_),
	.B(vcc),
	.C(syn__1063_),
	.D(syn__1012_),
	.Cin(),
	.Qin(\tc1.PC [3]),
	.Clk(syn__1103__X1001_Y1002_SIG_VCC),
	.AsyncReset(AsyncReset_X1001_Y1002_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc1.PCmux [3]),
	.Cout(),
	.Q(\tc1.PC [3]));
defparam syn__2408_.coord_x = 12;
defparam syn__2408_.coord_y = 7;
defparam syn__2408_.coord_z = 7;
defparam syn__2408_.mask = 16'h05F5;
defparam syn__2408_.modeMux = 1'b0;
defparam syn__2408_.FeedbackMux = 1'b0;
defparam syn__2408_.ShiftMux = 1'b0;
defparam syn__2408_.BypassEn = 1'b0;
defparam syn__2408_.CarryEnb = 1'b1;

alta_slice syn__2409_(
	.A(syn__1063_),
	.B(syn__1068_),
	.C(vcc),
	.D(syn__1006_),
	.Cin(),
	.Qin(\tc1.PC [4]),
	.Clk(syn__1103__X1001_Y1002_SIG_VCC),
	.AsyncReset(AsyncReset_X1001_Y1002_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc1.PCmux [4]),
	.Cout(),
	.Q(\tc1.PC [4]));
defparam syn__2409_.coord_x = 12;
defparam syn__2409_.coord_y = 7;
defparam syn__2409_.coord_z = 12;
defparam syn__2409_.mask = 16'h14BE;
defparam syn__2409_.modeMux = 1'b0;
defparam syn__2409_.FeedbackMux = 1'b1;
defparam syn__2409_.ShiftMux = 1'b0;
defparam syn__2409_.BypassEn = 1'b0;
defparam syn__2409_.CarryEnb = 1'b1;

alta_slice syn__2410_(
	.A(syn__1001_),
	.B(syn__1070_),
	.C(syn__1063_),
	.D(vcc),
	.Cin(),
	.Qin(\tc1.PC [5]),
	.Clk(syn__1103__X1001_Y1002_SIG_VCC),
	.AsyncReset(AsyncReset_X1001_Y1002_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc1.PCmux [5]),
	.Cout(),
	.Q(\tc1.PC [5]));
defparam syn__2410_.coord_x = 12;
defparam syn__2410_.coord_y = 7;
defparam syn__2410_.coord_z = 9;
defparam syn__2410_.mask = 16'h5353;
defparam syn__2410_.modeMux = 1'b0;
defparam syn__2410_.FeedbackMux = 1'b0;
defparam syn__2410_.ShiftMux = 1'b0;
defparam syn__2410_.BypassEn = 1'b0;
defparam syn__2410_.CarryEnb = 1'b1;

alta_slice syn__2411_(
	.A(vcc),
	.B(syn__1063_),
	.C(syn__1072_),
	.D(syn__0997_),
	.Cin(),
	.Qin(\tc1.PC [6]),
	.Clk(syn__1103__X1000_Y1002_SIG_VCC),
	.AsyncReset(AsyncReset_X1000_Y1002_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc1.PCmux [6]),
	.Cout(),
	.Q(\tc1.PC [6]));
defparam syn__2411_.coord_x = 12;
defparam syn__2411_.coord_y = 8;
defparam syn__2411_.coord_z = 6;
defparam syn__2411_.mask = 16'h03CF;
defparam syn__2411_.modeMux = 1'b0;
defparam syn__2411_.FeedbackMux = 1'b0;
defparam syn__2411_.ShiftMux = 1'b0;
defparam syn__2411_.BypassEn = 1'b0;
defparam syn__2411_.CarryEnb = 1'b1;

alta_slice syn__2412_(
	.A(syn__1074_),
	.B(syn__0223_),
	.C(vcc),
	.D(syn__0180_),
	.Cin(),
	.Qin(\tc2.PC [0]),
	.Clk(syn__1103__X1002_Y1002_SIG_VCC),
	.AsyncReset(AsyncReset_X1002_Y1002_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc2.PCmux [0]),
	.Cout(),
	.Q(\tc2.PC [0]));
defparam syn__2412_.coord_x = 12;
defparam syn__2412_.coord_y = 3;
defparam syn__2412_.coord_z = 7;
defparam syn__2412_.mask = 16'h21ED;
defparam syn__2412_.modeMux = 1'b0;
defparam syn__2412_.FeedbackMux = 1'b1;
defparam syn__2412_.ShiftMux = 1'b0;
defparam syn__2412_.BypassEn = 1'b0;
defparam syn__2412_.CarryEnb = 1'b1;

alta_slice syn__2413_(
	.A(vcc),
	.B(syn__0223_),
	.C(syn__0224_),
	.D(syn__0176_),
	.Cin(),
	.Qin(\tc2.PC [1]),
	.Clk(syn__1103__X1002_Y1002_SIG_VCC),
	.AsyncReset(AsyncReset_X1002_Y1002_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc2.PCmux [1]),
	.Cout(),
	.Q(\tc2.PC [1]));
defparam syn__2413_.coord_x = 12;
defparam syn__2413_.coord_y = 3;
defparam syn__2413_.coord_z = 11;
defparam syn__2413_.mask = 16'hF0FC;
defparam syn__2413_.modeMux = 1'b0;
defparam syn__2413_.FeedbackMux = 1'b0;
defparam syn__2413_.ShiftMux = 1'b0;
defparam syn__2413_.BypassEn = 1'b0;
defparam syn__2413_.CarryEnb = 1'b1;

alta_slice syn__2414_(
	.A(syn__0172_),
	.B(syn__0225_),
	.C(vcc),
	.D(syn__0223_),
	.Cin(),
	.Qin(\tc2.PC [2]),
	.Clk(syn__1103__X1004_Y1002_SIG_VCC),
	.AsyncReset(AsyncReset_X1004_Y1002_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc2.PCmux [2]),
	.Cout(),
	.Q(\tc2.PC [2]));
defparam syn__2414_.coord_x = 11;
defparam syn__2414_.coord_y = 3;
defparam syn__2414_.coord_z = 9;
defparam syn__2414_.mask = 16'h553C;
defparam syn__2414_.modeMux = 1'b0;
defparam syn__2414_.FeedbackMux = 1'b1;
defparam syn__2414_.ShiftMux = 1'b0;
defparam syn__2414_.BypassEn = 1'b0;
defparam syn__2414_.CarryEnb = 1'b1;

alta_slice syn__2415_(
	.A(syn__0169_),
	.B(vcc),
	.C(syn__0223_),
	.D(syn__0226_),
	.Cin(),
	.Qin(\tc2.PC [3]),
	.Clk(syn__1103__X1004_Y1002_SIG_VCC),
	.AsyncReset(AsyncReset_X1004_Y1002_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc2.PCmux [3]),
	.Cout(),
	.Q(\tc2.PC [3]));
defparam syn__2415_.coord_x = 11;
defparam syn__2415_.coord_y = 3;
defparam syn__2415_.coord_z = 5;
defparam syn__2415_.mask = 16'h505F;
defparam syn__2415_.modeMux = 1'b0;
defparam syn__2415_.FeedbackMux = 1'b0;
defparam syn__2415_.ShiftMux = 1'b0;
defparam syn__2415_.BypassEn = 1'b0;
defparam syn__2415_.CarryEnb = 1'b1;

alta_slice syn__2416_(
	.A(syn__0708_),
	.B(syn__0223_),
	.C(vcc),
	.D(syn__0228_),
	.Cin(),
	.Qin(\tc2.PC [4]),
	.Clk(syn__1103__X1004_Y1002_SIG_VCC),
	.AsyncReset(AsyncReset_X1004_Y1002_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc2.PCmux [4]),
	.Cout(),
	.Q(\tc2.PC [4]));
defparam syn__2416_.coord_x = 11;
defparam syn__2416_.coord_y = 3;
defparam syn__2416_.coord_z = 11;
defparam syn__2416_.mask = 16'h4774;
defparam syn__2416_.modeMux = 1'b0;
defparam syn__2416_.FeedbackMux = 1'b1;
defparam syn__2416_.ShiftMux = 1'b0;
defparam syn__2416_.BypassEn = 1'b0;
defparam syn__2416_.CarryEnb = 1'b1;

alta_slice syn__2417_(
	.A(vcc),
	.B(syn__0230_),
	.C(syn__0223_),
	.D(syn__0160_),
	.Cin(),
	.Qin(\tc2.PC [5]),
	.Clk(syn__1103__X1002_Y1002_SIG_VCC),
	.AsyncReset(AsyncReset_X1002_Y1002_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc2.PCmux [5]),
	.Cout(),
	.Q(\tc2.PC [5]));
defparam syn__2417_.coord_x = 12;
defparam syn__2417_.coord_y = 3;
defparam syn__2417_.coord_z = 5;
defparam syn__2417_.mask = 16'h03F3;
defparam syn__2417_.modeMux = 1'b0;
defparam syn__2417_.FeedbackMux = 1'b0;
defparam syn__2417_.ShiftMux = 1'b0;
defparam syn__2417_.BypassEn = 1'b0;
defparam syn__2417_.CarryEnb = 1'b1;

alta_slice syn__2418_(
	.A(syn__0151_),
	.B(vcc),
	.C(syn__0223_),
	.D(syn__0232_),
	.Cin(),
	.Qin(\tc2.PC [6]),
	.Clk(syn__1103__X1004_Y1002_SIG_VCC),
	.AsyncReset(AsyncReset_X1004_Y1002_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc2.PCmux [6]),
	.Cout(),
	.Q(\tc2.PC [6]));
defparam syn__2418_.coord_x = 11;
defparam syn__2418_.coord_y = 3;
defparam syn__2418_.coord_z = 15;
defparam syn__2418_.mask = 16'h505F;
defparam syn__2418_.modeMux = 1'b0;
defparam syn__2418_.FeedbackMux = 1'b0;
defparam syn__2418_.ShiftMux = 1'b0;
defparam syn__2418_.BypassEn = 1'b0;
defparam syn__2418_.CarryEnb = 1'b1;

alta_slice syn__2419_(
	.A(syn__0488_),
	.B(syn__0234_),
	.C(vcc),
	.D(syn__0437_),
	.Cin(),
	.Qin(\tc3.PC [0]),
	.Clk(syn__1103__X1005_Y1002_SIG_VCC),
	.AsyncReset(AsyncReset_X1005_Y1002_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc3.PCmux [0]),
	.Cout(),
	.Q(\tc3.PC [0]));
defparam syn__2419_.coord_x = 1;
defparam syn__2419_.coord_y = 8;
defparam syn__2419_.coord_z = 0;
defparam syn__2419_.mask = 16'h41EB;
defparam syn__2419_.modeMux = 1'b0;
defparam syn__2419_.FeedbackMux = 1'b1;
defparam syn__2419_.ShiftMux = 1'b0;
defparam syn__2419_.BypassEn = 1'b0;
defparam syn__2419_.CarryEnb = 1'b1;

alta_slice syn__2420_(
	.A(syn__0433_),
	.B(syn__0488_),
	.C(vcc),
	.D(syn__0489_),
	.Cin(),
	.Qin(\tc3.PC [1]),
	.Clk(syn__1103__X1005_Y1002_SIG_VCC),
	.AsyncReset(AsyncReset_X1005_Y1002_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc3.PCmux [1]),
	.Cout(),
	.Q(\tc3.PC [1]));
defparam syn__2420_.coord_x = 1;
defparam syn__2420_.coord_y = 8;
defparam syn__2420_.coord_z = 9;
defparam syn__2420_.mask = 16'h7447;
defparam syn__2420_.modeMux = 1'b0;
defparam syn__2420_.FeedbackMux = 1'b1;
defparam syn__2420_.ShiftMux = 1'b0;
defparam syn__2420_.BypassEn = 1'b0;
defparam syn__2420_.CarryEnb = 1'b1;

alta_slice syn__2421_(
	.A(syn__0490_),
	.B(syn__0429_),
	.C(vcc),
	.D(syn__0488_),
	.Cin(),
	.Qin(\tc3.PC [2]),
	.Clk(syn__1103__X1005_Y1002_SIG_VCC),
	.AsyncReset(AsyncReset_X1005_Y1002_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc3.PCmux [2]),
	.Cout(),
	.Q(\tc3.PC [2]));
defparam syn__2421_.coord_x = 1;
defparam syn__2421_.coord_y = 8;
defparam syn__2421_.coord_z = 10;
defparam syn__2421_.mask = 16'h335A;
defparam syn__2421_.modeMux = 1'b0;
defparam syn__2421_.FeedbackMux = 1'b1;
defparam syn__2421_.ShiftMux = 1'b0;
defparam syn__2421_.BypassEn = 1'b0;
defparam syn__2421_.CarryEnb = 1'b1;

alta_slice syn__2422_(
	.A(syn__0426_),
	.B(syn__0491_),
	.C(vcc),
	.D(syn__0488_),
	.Cin(),
	.Qin(\tc3.PC [3]),
	.Clk(syn__1103__X1006_Y1002_SIG_VCC),
	.AsyncReset(AsyncReset_X1006_Y1002_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc3.PCmux [3]),
	.Cout(),
	.Q(\tc3.PC [3]));
defparam syn__2422_.coord_x = 0;
defparam syn__2422_.coord_y = 8;
defparam syn__2422_.coord_z = 3;
defparam syn__2422_.mask = 16'h553C;
defparam syn__2422_.modeMux = 1'b0;
defparam syn__2422_.FeedbackMux = 1'b1;
defparam syn__2422_.ShiftMux = 1'b0;
defparam syn__2422_.BypassEn = 1'b0;
defparam syn__2422_.CarryEnb = 1'b1;

alta_slice syn__2423_(
	.A(syn__0492_),
	.B(syn__0420_),
	.C(vcc),
	.D(syn__0488_),
	.Cin(),
	.Qin(\tc3.PC [4]),
	.Clk(syn__1103__X1006_Y1002_SIG_VCC),
	.AsyncReset(AsyncReset_X1006_Y1002_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc3.PCmux [4]),
	.Cout(),
	.Q(\tc3.PC [4]));
defparam syn__2423_.coord_x = 0;
defparam syn__2423_.coord_y = 8;
defparam syn__2423_.coord_z = 1;
defparam syn__2423_.mask = 16'h335A;
defparam syn__2423_.modeMux = 1'b0;
defparam syn__2423_.FeedbackMux = 1'b1;
defparam syn__2423_.ShiftMux = 1'b0;
defparam syn__2423_.BypassEn = 1'b0;
defparam syn__2423_.CarryEnb = 1'b1;

alta_slice syn__2424_(
	.A(vcc),
	.B(syn__0494_),
	.C(syn__0415_),
	.D(syn__0488_),
	.Cin(),
	.Qin(\tc3.PC [5]),
	.Clk(syn__1103__X1006_Y1002_SIG_VCC),
	.AsyncReset(AsyncReset_X1006_Y1002_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc3.PCmux [5]),
	.Cout(),
	.Q(\tc3.PC [5]));
defparam syn__2424_.coord_x = 0;
defparam syn__2424_.coord_y = 8;
defparam syn__2424_.coord_z = 15;
defparam syn__2424_.mask = 16'h0FCC;
defparam syn__2424_.modeMux = 1'b0;
defparam syn__2424_.FeedbackMux = 1'b0;
defparam syn__2424_.ShiftMux = 1'b0;
defparam syn__2424_.BypassEn = 1'b0;
defparam syn__2424_.CarryEnb = 1'b1;

alta_slice syn__2425_(
	.A(syn__0496_),
	.B(syn__0488_),
	.C(vcc),
	.D(syn__0408_),
	.Cin(),
	.Qin(\tc3.PC [6]),
	.Clk(syn__1103__X1008_Y1002_SIG_VCC),
	.AsyncReset(AsyncReset_X1008_Y1002_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc3.PCmux [6]),
	.Cout(),
	.Q(\tc3.PC [6]));
defparam syn__2425_.coord_x = 1;
defparam syn__2425_.coord_y = 7;
defparam syn__2425_.coord_z = 14;
defparam syn__2425_.mask = 16'h22EE;
defparam syn__2425_.modeMux = 1'b0;
defparam syn__2425_.FeedbackMux = 1'b0;
defparam syn__2425_.ShiftMux = 1'b0;
defparam syn__2425_.BypassEn = 1'b0;
defparam syn__2425_.CarryEnb = 1'b1;

alta_bram \tc1.dm.ram_inst (
	.DataInA({IOvalue1[17], IOvalue1[16], IOvalue1[15], IOvalue1[14], IOvalue1[13], IOvalue1[12], IOvalue1[11], IOvalue1[10], IOvalue1[9], IOvalue1[8], IOvalue1[7], IOvalue1[6], IOvalue1[5], IOvalue1[4], IOvalue1[3], IOvalue1[2], IOvalue1[1], IOvalue1[0]}),
	.DataInB({1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz}),
	.AddressA({1'bz, 1'bz, 1'bz, 1'bz, 1'bz, IOaddr1[6], IOaddr1[5], IOaddr1[4], IOaddr1[3], IOaddr1[2], IOaddr1[1], IOaddr1[0]}),
	.AddressB({1'bz, 1'bz, 1'bz, 1'bz, 1'bz, IOaddr1[6], IOaddr1[5], IOaddr1[4], IOaddr1[3], IOaddr1[2], IOaddr1[1], IOaddr1[0]}),
	.DataOutA({\tc1.dm.douta [17], \tc1.dm.douta [16], \tc1.dm.douta [15], \tc1.dm.douta [14], \tc1.dm.douta [13], \tc1.dm.douta [12], \tc1.dm.douta [11], \tc1.dm.douta [10], \tc1.dm.douta [9], \tc1.dm.douta [8], \tc1.dm.douta [7], \tc1.dm.douta [6], \tc1.dm.douta [5], \tc1.dm.douta [4], \tc1.dm.douta [3], \tc1.dm.douta [2], \tc1.dm.douta [1], \tc1.dm.douta [0]}),
	.DataOutB({\tc1.DM [17], \tc1.DM [16], \tc1.DM [15], \tc1.DM [14], \tc1.DM [13], \tc1.DM [12], \tc1.DM [11], \tc1.DM [10], \tc1.DM [9], \tc1.DM [8], \tc1.DM [7], \tc1.DM [6], \tc1.DM [5], \tc1.DM [4], \tc1.DM [3], \tc1.DM [2], \tc1.DM [1], \tc1.DM [0]}),
	.Clk0(syn__1103_),
	.ClkEn0(vcc),
	.AsyncReset0(gnd),
	.Clk1(!syn__1103_),
	.ClkEn1(vcc),
	.AsyncReset1(gnd),
	.WeRenA(\tc1.WriteDM ),
	.WeRenB(gnd));
defparam \tc1.dm.ram_inst .coord_x = 10;
defparam \tc1.dm.ram_inst .coord_y = 8;
defparam \tc1.dm.ram_inst .coord_z = 0;
defparam \tc1.dm.ram_inst .CLKMODE = 1'b0;
defparam \tc1.dm.ram_inst .PORTA_WIDTH = 4'b0000;
defparam \tc1.dm.ram_inst .PORTB_WIDTH = 4'b0000;
defparam \tc1.dm.ram_inst .PORTA_WRITEMODE = 1'b0;
defparam \tc1.dm.ram_inst .PORTB_WRITEMODE = 1'b0;
defparam \tc1.dm.ram_inst .PORTA_WRITETHRU = 1'b0;
defparam \tc1.dm.ram_inst .PORTB_WRITETHRU = 1'b0;
defparam \tc1.dm.ram_inst .PORTA_OUTREG = 1'b0;
defparam \tc1.dm.ram_inst .PORTB_OUTREG = 1'b0;
defparam \tc1.dm.ram_inst .PORTB_READONLY = 1'b1;
defparam \tc1.dm.ram_inst .INIT_VAL = 4608'h000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;

alta_bram \tc1.im.ram_inst (
	.DataInA({IOvalue1[17], IOvalue1[16], IOvalue1[15], IOvalue1[14], IOvalue1[13], IOvalue1[12], IOvalue1[11], IOvalue1[10], IOvalue1[9], IOvalue1[8], IOvalue1[7], IOvalue1[6], IOvalue1[5], IOvalue1[4], IOvalue1[3], IOvalue1[2], IOvalue1[1], IOvalue1[0]}),
	.DataInB({1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz}),
	.AddressA({1'bz, 1'bz, 1'bz, 1'bz, 1'bz, IOaddr1[6], IOaddr1[5], IOaddr1[4], IOaddr1[3], IOaddr1[2], IOaddr1[1], IOaddr1[0]}),
	.AddressB({1'bz, 1'bz, 1'bz, 1'bz, 1'bz, \tc1.PCmux [6], \tc1.PCmux [5], \tc1.PCmux [4], \tc1.PCmux [3], \tc1.PCmux [2], \tc1.PCmux [1], \tc1.PCmux [0]}),
	.DataOutA({\tc1.im.douta [17], \tc1.im.douta [16], \tc1.im.douta [15], \tc1.im.douta [14], \tc1.im.douta [13], \tc1.im.douta [12], \tc1.im.douta [11], \tc1.im.douta [10], \tc1.im.douta [9], \tc1.im.douta [8], \tc1.im.douta [7], \tc1.im.douta [6], \tc1.im.douta [5], \tc1.im.douta [4], \tc1.im.douta [3], \tc1.im.douta [2], \tc1.im.douta [1], \tc1.im.douta [0]}),
	.DataOutB({\tc1.IM [17], \tc1.IM [16], \tc1.IM [15], \tc1.IM [14], \tc1.IM [13], \tc1.IM [12], \tc1.IM [11], \tc1.IM [10], \tc1.IM [9], \tc1.IM [8], \tc1.IM [7], \tc1.IM [6], \tc1.IM [5], \tc1.IM [4], \tc1.IM [3], \tc1.IM [2], \tc1.IM [1], \tc1.IM [0]}),
	.Clk0(syn__1103_),
	.ClkEn0(vcc),
	.AsyncReset0(gnd),
	.Clk1(syn__1103_),
	.ClkEn1(vcc),
	.AsyncReset1(gnd),
	.WeRenA(\tc1.WriteIM ),
	.WeRenB(gnd));
defparam \tc1.im.ram_inst .coord_x = 10;
defparam \tc1.im.ram_inst .coord_y = 7;
defparam \tc1.im.ram_inst .coord_z = 0;
defparam \tc1.im.ram_inst .CLKMODE = 1'b0;
defparam \tc1.im.ram_inst .PORTA_WIDTH = 4'b0000;
defparam \tc1.im.ram_inst .PORTB_WIDTH = 4'b0000;
defparam \tc1.im.ram_inst .PORTA_WRITEMODE = 1'b0;
defparam \tc1.im.ram_inst .PORTB_WRITEMODE = 1'b0;
defparam \tc1.im.ram_inst .PORTA_WRITETHRU = 1'b0;
defparam \tc1.im.ram_inst .PORTB_WRITETHRU = 1'b0;
defparam \tc1.im.ram_inst .PORTA_OUTREG = 1'b0;
defparam \tc1.im.ram_inst .PORTB_OUTREG = 1'b0;
defparam \tc1.im.ram_inst .PORTB_READONLY = 1'b1;
defparam \tc1.im.ram_inst .INIT_VAL = 4608'h0000000000000000070003FF090000030200050004000460040008200400082004000820040008200E040C030A001006000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;

alta_bram \tc1.rfA.ram_inst (
	.DataInA({\tc1.WD [17], \tc1.WD [16], \tc1.WD [15], \tc1.WD [14], \tc1.WD [13], \tc1.WD [12], \tc1.WD [11], \tc1.WD [10], \tc1.WD [9], \tc1.WD [8], \tc1.WD [7], \tc1.WD [6], \tc1.WD [5], \tc1.WD [4], \tc1.WD [3], \tc1.WD [2], \tc1.WD [1], \tc1.WD [0]}),
	.DataInB({1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz}),
	.AddressA({1'bz, 1'bz, 1'bz, 1'bz, 1'bz, \tc1.IM [31], \tc1.IM [30], \tc1.IM [29], \tc1.IM [28], \tc1.IM [27], \tc1.IM [26], \tc1.IM [25]}),
	.AddressB({1'bz, 1'bz, 1'bz, 1'bz, 1'bz, \tc1.IM [23], \tc1.IM [22], \tc1.IM [21], \tc1.IM [20], \tc1.IM [19], \tc1.IM [18], \tc1.IM [17]}),
	.DataOutA({\tc1.rfA.douta [17], \tc1.rfA.douta [16], \tc1.rfA.douta [15], \tc1.rfA.douta [14], \tc1.rfA.douta [13], \tc1.rfA.douta [12], \tc1.rfA.douta [11], \tc1.rfA.douta [10], \tc1.rfA.douta [9], \tc1.rfA.douta [8], \tc1.rfA.douta [7], \tc1.rfA.douta [6], \tc1.rfA.douta [5], \tc1.rfA.douta [4], \tc1.rfA.douta [3], \tc1.rfA.douta [2], \tc1.rfA.douta [1], \tc1.rfA.douta [0]}),
	.DataOutB({IOvalue1[17], IOvalue1[16], IOvalue1[15], IOvalue1[14], IOvalue1[13], IOvalue1[12], IOvalue1[11], IOvalue1[10], IOvalue1[9], IOvalue1[8], IOvalue1[7], IOvalue1[6], IOvalue1[5], IOvalue1[4], IOvalue1[3], IOvalue1[2], IOvalue1[1], IOvalue1[0]}),
	.Clk0(syn__1103_),
	.ClkEn0(vcc),
	.AsyncReset0(gnd),
	.Clk1(!syn__1103_),
	.ClkEn1(vcc),
	.AsyncReset1(gnd),
	.WeRenA(vcc),
	.WeRenB(gnd));
defparam \tc1.rfA.ram_inst .coord_x = 10;
defparam \tc1.rfA.ram_inst .coord_y = 6;
defparam \tc1.rfA.ram_inst .coord_z = 0;
defparam \tc1.rfA.ram_inst .CLKMODE = 1'b0;
defparam \tc1.rfA.ram_inst .PORTA_WIDTH = 4'b0000;
defparam \tc1.rfA.ram_inst .PORTB_WIDTH = 4'b0000;
defparam \tc1.rfA.ram_inst .PORTA_WRITEMODE = 1'b0;
defparam \tc1.rfA.ram_inst .PORTB_WRITEMODE = 1'b0;
defparam \tc1.rfA.ram_inst .PORTA_WRITETHRU = 1'b0;
defparam \tc1.rfA.ram_inst .PORTB_WRITETHRU = 1'b0;
defparam \tc1.rfA.ram_inst .PORTA_OUTREG = 1'b0;
defparam \tc1.rfA.ram_inst .PORTB_OUTREG = 1'b0;
defparam \tc1.rfA.ram_inst .PORTB_READONLY = 1'b1;
defparam \tc1.rfA.ram_inst .INIT_VAL = 4608'h000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;

alta_bram \tc1.rfB.ram_inst (
	.DataInA({\tc1.WD [17], \tc1.WD [16], \tc1.WD [15], \tc1.WD [14], \tc1.WD [13], \tc1.WD [12], \tc1.WD [11], \tc1.WD [10], \tc1.WD [9], \tc1.WD [8], \tc1.WD [7], \tc1.WD [6], \tc1.WD [5], \tc1.WD [4], \tc1.WD [3], \tc1.WD [2], \tc1.WD [1], \tc1.WD [0]}),
	.DataInB({1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz}),
	.AddressA({1'bz, 1'bz, 1'bz, 1'bz, 1'bz, \tc1.IM [31], \tc1.IM [30], \tc1.IM [29], \tc1.IM [28], \tc1.IM [27], \tc1.IM [26], \tc1.IM [25]}),
	.AddressB({1'bz, 1'bz, 1'bz, 1'bz, 1'bz, \tc1.IM [16], \tc1.IM [15], \tc1.IM [14], \tc1.IM [13], \tc1.IM [12], \tc1.IM [11], \tc1.IM [10]}),
	.DataOutA({\tc1.rfB.douta [17], \tc1.rfB.douta [16], \tc1.rfB.douta [15], \tc1.rfB.douta [14], \tc1.rfB.douta [13], \tc1.rfB.douta [12], \tc1.rfB.douta [11], \tc1.rfB.douta [10], \tc1.rfB.douta [9], \tc1.rfB.douta [8], \tc1.rfB.douta [7], \tc1.rfB.douta [6], \tc1.rfB.douta [5], \tc1.rfB.douta [4], \tc1.rfB.douta [3], \tc1.rfB.douta [2], \tc1.rfB.douta [1], \tc1.rfB.douta [0]}),
	.DataOutB({IOaddr1[17], IOaddr1[16], IOaddr1[15], IOaddr1[14], IOaddr1[13], IOaddr1[12], IOaddr1[11], IOaddr1[10], IOaddr1[9], IOaddr1[8], IOaddr1[7], IOaddr1[6], IOaddr1[5], IOaddr1[4], IOaddr1[3], IOaddr1[2], IOaddr1[1], IOaddr1[0]}),
	.Clk0(syn__1103_),
	.ClkEn0(vcc),
	.AsyncReset0(gnd),
	.Clk1(!syn__1103_),
	.ClkEn1(vcc),
	.AsyncReset1(gnd),
	.WeRenA(vcc),
	.WeRenB(gnd));
defparam \tc1.rfB.ram_inst .coord_x = 10;
defparam \tc1.rfB.ram_inst .coord_y = 5;
defparam \tc1.rfB.ram_inst .coord_z = 0;
defparam \tc1.rfB.ram_inst .CLKMODE = 1'b0;
defparam \tc1.rfB.ram_inst .PORTA_WIDTH = 4'b0000;
defparam \tc1.rfB.ram_inst .PORTB_WIDTH = 4'b0000;
defparam \tc1.rfB.ram_inst .PORTA_WRITEMODE = 1'b0;
defparam \tc1.rfB.ram_inst .PORTB_WRITEMODE = 1'b0;
defparam \tc1.rfB.ram_inst .PORTA_WRITETHRU = 1'b0;
defparam \tc1.rfB.ram_inst .PORTB_WRITETHRU = 1'b0;
defparam \tc1.rfB.ram_inst .PORTA_OUTREG = 1'b0;
defparam \tc1.rfB.ram_inst .PORTB_OUTREG = 1'b0;
defparam \tc1.rfB.ram_inst .PORTB_READONLY = 1'b1;
defparam \tc1.rfB.ram_inst .INIT_VAL = 4608'h000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;

alta_bram \tc2.dm.ram_inst (
	.DataInA({IOvalue2[17], IOvalue2[16], IOvalue2[15], IOvalue2[14], IOvalue2[13], IOvalue2[12], IOvalue2[11], IOvalue2[10], IOvalue2[9], IOvalue2[8], IOvalue2[7], IOvalue2[6], IOvalue2[5], IOvalue2[4], IOvalue2[3], IOvalue2[2], IOvalue2[1], IOvalue2[0]}),
	.DataInB({1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz}),
	.AddressA({1'bz, 1'bz, 1'bz, 1'bz, 1'bz, IOaddr2[6], IOaddr2[5], IOaddr2[4], IOaddr2[3], IOaddr2[2], IOaddr2[1], IOaddr2[0]}),
	.AddressB({1'bz, 1'bz, 1'bz, 1'bz, 1'bz, IOaddr2[6], IOaddr2[5], IOaddr2[4], IOaddr2[3], IOaddr2[2], IOaddr2[1], IOaddr2[0]}),
	.DataOutA({\tc2.dm.douta [17], \tc2.dm.douta [16], \tc2.dm.douta [15], \tc2.dm.douta [14], \tc2.dm.douta [13], \tc2.dm.douta [12], \tc2.dm.douta [11], \tc2.dm.douta [10], \tc2.dm.douta [9], \tc2.dm.douta [8], \tc2.dm.douta [7], \tc2.dm.douta [6], \tc2.dm.douta [5], \tc2.dm.douta [4], \tc2.dm.douta [3], \tc2.dm.douta [2], \tc2.dm.douta [1], \tc2.dm.douta [0]}),
	.DataOutB({\tc2.DM [17], \tc2.DM [16], \tc2.DM [15], \tc2.DM [14], \tc2.DM [13], \tc2.DM [12], \tc2.DM [11], \tc2.DM [10], \tc2.DM [9], \tc2.DM [8], \tc2.DM [7], \tc2.DM [6], \tc2.DM [5], \tc2.DM [4], \tc2.DM [3], \tc2.DM [2], \tc2.DM [1], \tc2.DM [0]}),
	.Clk0(syn__1103_),
	.ClkEn0(vcc),
	.AsyncReset0(gnd),
	.Clk1(!syn__1103_),
	.ClkEn1(vcc),
	.AsyncReset1(gnd),
	.WeRenA(\tc2.WriteDM ),
	.WeRenB(gnd));
defparam \tc2.dm.ram_inst .coord_x = 10;
defparam \tc2.dm.ram_inst .coord_y = 4;
defparam \tc2.dm.ram_inst .coord_z = 0;
defparam \tc2.dm.ram_inst .CLKMODE = 1'b0;
defparam \tc2.dm.ram_inst .PORTA_WIDTH = 4'b0000;
defparam \tc2.dm.ram_inst .PORTB_WIDTH = 4'b0000;
defparam \tc2.dm.ram_inst .PORTA_WRITEMODE = 1'b0;
defparam \tc2.dm.ram_inst .PORTB_WRITEMODE = 1'b0;
defparam \tc2.dm.ram_inst .PORTA_WRITETHRU = 1'b0;
defparam \tc2.dm.ram_inst .PORTB_WRITETHRU = 1'b0;
defparam \tc2.dm.ram_inst .PORTA_OUTREG = 1'b0;
defparam \tc2.dm.ram_inst .PORTB_OUTREG = 1'b0;
defparam \tc2.dm.ram_inst .PORTB_READONLY = 1'b1;
defparam \tc2.dm.ram_inst .INIT_VAL = 4608'h000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;

alta_bram \tc2.im.ram_inst (
	.DataInA({IOvalue2[17], IOvalue2[16], IOvalue2[15], IOvalue2[14], IOvalue2[13], IOvalue2[12], IOvalue2[11], IOvalue2[10], IOvalue2[9], IOvalue2[8], IOvalue2[7], IOvalue2[6], IOvalue2[5], IOvalue2[4], IOvalue2[3], IOvalue2[2], IOvalue2[1], IOvalue2[0]}),
	.DataInB({1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz}),
	.AddressA({1'bz, 1'bz, 1'bz, 1'bz, 1'bz, IOaddr2[6], IOaddr2[5], IOaddr2[4], IOaddr2[3], IOaddr2[2], IOaddr2[1], IOaddr2[0]}),
	.AddressB({1'bz, 1'bz, 1'bz, 1'bz, 1'bz, \tc2.PCmux [6], \tc2.PCmux [5], \tc2.PCmux [4], \tc2.PCmux [3], \tc2.PCmux [2], \tc2.PCmux [1], \tc2.PCmux [0]}),
	.DataOutA({\tc2.im.douta [17], \tc2.im.douta [16], \tc2.im.douta [15], \tc2.im.douta [14], \tc2.im.douta [13], \tc2.im.douta [12], \tc2.im.douta [11], \tc2.im.douta [10], \tc2.im.douta [9], \tc2.im.douta [8], \tc2.im.douta [7], \tc2.im.douta [6], \tc2.im.douta [5], \tc2.im.douta [4], \tc2.im.douta [3], \tc2.im.douta [2], \tc2.im.douta [1], \tc2.im.douta [0]}),
	.DataOutB({\tc2.IM [17], \tc2.IM [16], \tc2.IM [15], \tc2.IM [14], \tc2.IM [13], \tc2.IM [12], \tc2.IM [11], \tc2.IM [10], \tc2.IM [9], \tc2.IM [8], \tc2.IM [7], \tc2.IM [6], \tc2.IM [5], \tc2.IM [4], \tc2.IM [3], \tc2.IM [2], \tc2.IM [1], \tc2.IM [0]}),
	.Clk0(syn__1103_),
	.ClkEn0(vcc),
	.AsyncReset0(gnd),
	.Clk1(syn__1103_),
	.ClkEn1(vcc),
	.AsyncReset1(gnd),
	.WeRenA(\tc2.WriteIM ),
	.WeRenB(gnd));
defparam \tc2.im.ram_inst .coord_x = 10;
defparam \tc2.im.ram_inst .coord_y = 3;
defparam \tc2.im.ram_inst .coord_z = 0;
defparam \tc2.im.ram_inst .CLKMODE = 1'b0;
defparam \tc2.im.ram_inst .PORTA_WIDTH = 4'b0000;
defparam \tc2.im.ram_inst .PORTB_WIDTH = 4'b0000;
defparam \tc2.im.ram_inst .PORTA_WRITEMODE = 1'b0;
defparam \tc2.im.ram_inst .PORTB_WRITEMODE = 1'b0;
defparam \tc2.im.ram_inst .PORTA_WRITETHRU = 1'b0;
defparam \tc2.im.ram_inst .PORTB_WRITETHRU = 1'b0;
defparam \tc2.im.ram_inst .PORTA_OUTREG = 1'b0;
defparam \tc2.im.ram_inst .PORTB_OUTREG = 1'b0;
defparam \tc2.im.ram_inst .PORTB_READONLY = 1'b1;
defparam \tc2.im.ram_inst .INIT_VAL = 4608'h0000000000000000070003FF090000030200050004000460040008200400082004000820040008200E040C030A001006000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;

alta_bram \tc2.rfA.ram_inst (
	.DataInA({\tc2.WD [17], \tc2.WD [16], \tc2.WD [15], \tc2.WD [14], \tc2.WD [13], \tc2.WD [12], \tc2.WD [11], \tc2.WD [10], \tc2.WD [9], \tc2.WD [8], \tc2.WD [7], \tc2.WD [6], \tc2.WD [5], \tc2.WD [4], \tc2.WD [3], \tc2.WD [2], \tc2.WD [1], \tc2.WD [0]}),
	.DataInB({1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz}),
	.AddressA({1'bz, 1'bz, 1'bz, 1'bz, 1'bz, \tc2.IM [31], \tc2.IM [30], \tc2.IM [29], \tc2.IM [28], \tc2.IM [27], \tc2.IM [26], \tc2.IM [25]}),
	.AddressB({1'bz, 1'bz, 1'bz, 1'bz, 1'bz, \tc2.IM [23], \tc2.IM [22], \tc2.IM [21], \tc2.IM [20], \tc2.IM [19], \tc2.IM [18], \tc2.IM [17]}),
	.DataOutA({\tc2.rfA.douta [17], \tc2.rfA.douta [16], \tc2.rfA.douta [15], \tc2.rfA.douta [14], \tc2.rfA.douta [13], \tc2.rfA.douta [12], \tc2.rfA.douta [11], \tc2.rfA.douta [10], \tc2.rfA.douta [9], \tc2.rfA.douta [8], \tc2.rfA.douta [7], \tc2.rfA.douta [6], \tc2.rfA.douta [5], \tc2.rfA.douta [4], \tc2.rfA.douta [3], \tc2.rfA.douta [2], \tc2.rfA.douta [1], \tc2.rfA.douta [0]}),
	.DataOutB({IOvalue2[17], IOvalue2[16], IOvalue2[15], IOvalue2[14], IOvalue2[13], IOvalue2[12], IOvalue2[11], IOvalue2[10], IOvalue2[9], IOvalue2[8], IOvalue2[7], IOvalue2[6], IOvalue2[5], IOvalue2[4], IOvalue2[3], IOvalue2[2], IOvalue2[1], IOvalue2[0]}),
	.Clk0(syn__1103_),
	.ClkEn0(vcc),
	.AsyncReset0(gnd),
	.Clk1(!syn__1103_),
	.ClkEn1(vcc),
	.AsyncReset1(gnd),
	.WeRenA(vcc),
	.WeRenB(gnd));
defparam \tc2.rfA.ram_inst .coord_x = 10;
defparam \tc2.rfA.ram_inst .coord_y = 1;
defparam \tc2.rfA.ram_inst .coord_z = 0;
defparam \tc2.rfA.ram_inst .CLKMODE = 1'b0;
defparam \tc2.rfA.ram_inst .PORTA_WIDTH = 4'b0000;
defparam \tc2.rfA.ram_inst .PORTB_WIDTH = 4'b0000;
defparam \tc2.rfA.ram_inst .PORTA_WRITEMODE = 1'b0;
defparam \tc2.rfA.ram_inst .PORTB_WRITEMODE = 1'b0;
defparam \tc2.rfA.ram_inst .PORTA_WRITETHRU = 1'b0;
defparam \tc2.rfA.ram_inst .PORTB_WRITETHRU = 1'b0;
defparam \tc2.rfA.ram_inst .PORTA_OUTREG = 1'b0;
defparam \tc2.rfA.ram_inst .PORTB_OUTREG = 1'b0;
defparam \tc2.rfA.ram_inst .PORTB_READONLY = 1'b1;
defparam \tc2.rfA.ram_inst .INIT_VAL = 4608'h000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;

alta_bram \tc2.rfB.ram_inst (
	.DataInA({\tc2.WD [17], \tc2.WD [16], \tc2.WD [15], \tc2.WD [14], \tc2.WD [13], \tc2.WD [12], \tc2.WD [11], \tc2.WD [10], \tc2.WD [9], \tc2.WD [8], \tc2.WD [7], \tc2.WD [6], \tc2.WD [5], \tc2.WD [4], \tc2.WD [3], \tc2.WD [2], \tc2.WD [1], \tc2.WD [0]}),
	.DataInB({1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz}),
	.AddressA({1'bz, 1'bz, 1'bz, 1'bz, 1'bz, \tc2.IM [31], \tc2.IM [30], \tc2.IM [29], \tc2.IM [28], \tc2.IM [27], \tc2.IM [26], \tc2.IM [25]}),
	.AddressB({1'bz, 1'bz, 1'bz, 1'bz, 1'bz, \tc2.IM [16], \tc2.IM [15], \tc2.IM [14], \tc2.IM [13], \tc2.IM [12], \tc2.IM [11], \tc2.IM [10]}),
	.DataOutA({\tc2.rfB.douta [17], \tc2.rfB.douta [16], \tc2.rfB.douta [15], \tc2.rfB.douta [14], \tc2.rfB.douta [13], \tc2.rfB.douta [12], \tc2.rfB.douta [11], \tc2.rfB.douta [10], \tc2.rfB.douta [9], \tc2.rfB.douta [8], \tc2.rfB.douta [7], \tc2.rfB.douta [6], \tc2.rfB.douta [5], \tc2.rfB.douta [4], \tc2.rfB.douta [3], \tc2.rfB.douta [2], \tc2.rfB.douta [1], \tc2.rfB.douta [0]}),
	.DataOutB({IOaddr2[17], IOaddr2[16], IOaddr2[15], IOaddr2[14], IOaddr2[13], IOaddr2[12], IOaddr2[11], IOaddr2[10], IOaddr2[9], IOaddr2[8], IOaddr2[7], IOaddr2[6], IOaddr2[5], IOaddr2[4], IOaddr2[3], IOaddr2[2], IOaddr2[1], IOaddr2[0]}),
	.Clk0(syn__1103_),
	.ClkEn0(vcc),
	.AsyncReset0(gnd),
	.Clk1(!syn__1103_),
	.ClkEn1(vcc),
	.AsyncReset1(gnd),
	.WeRenA(vcc),
	.WeRenB(gnd));
defparam \tc2.rfB.ram_inst .coord_x = 10;
defparam \tc2.rfB.ram_inst .coord_y = 2;
defparam \tc2.rfB.ram_inst .coord_z = 0;
defparam \tc2.rfB.ram_inst .CLKMODE = 1'b0;
defparam \tc2.rfB.ram_inst .PORTA_WIDTH = 4'b0000;
defparam \tc2.rfB.ram_inst .PORTB_WIDTH = 4'b0000;
defparam \tc2.rfB.ram_inst .PORTA_WRITEMODE = 1'b0;
defparam \tc2.rfB.ram_inst .PORTB_WRITEMODE = 1'b0;
defparam \tc2.rfB.ram_inst .PORTA_WRITETHRU = 1'b0;
defparam \tc2.rfB.ram_inst .PORTB_WRITETHRU = 1'b0;
defparam \tc2.rfB.ram_inst .PORTA_OUTREG = 1'b0;
defparam \tc2.rfB.ram_inst .PORTB_OUTREG = 1'b0;
defparam \tc2.rfB.ram_inst .PORTB_READONLY = 1'b1;
defparam \tc2.rfB.ram_inst .INIT_VAL = 4608'h000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;

alta_bram \tc3.dm.ram_inst (
	.DataInA({IOvalue3[17], IOvalue3[16], IOvalue3[15], IOvalue3[14], IOvalue3[13], IOvalue3[12], IOvalue3[11], IOvalue3[10], IOvalue3[9], IOvalue3[8], IOvalue3[7], IOvalue3[6], IOvalue3[5], IOvalue3[4], IOvalue3[3], IOvalue3[2], IOvalue3[1], IOvalue3[0]}),
	.DataInB({1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz}),
	.AddressA({1'bz, 1'bz, 1'bz, 1'bz, 1'bz, IOaddr3[6], IOaddr3[5], IOaddr3[4], IOaddr3[3], IOaddr3[2], IOaddr3[1], IOaddr3[0]}),
	.AddressB({1'bz, 1'bz, 1'bz, 1'bz, 1'bz, IOaddr3[6], IOaddr3[5], IOaddr3[4], IOaddr3[3], IOaddr3[2], IOaddr3[1], IOaddr3[0]}),
	.DataOutA({\tc3.dm.douta [17], \tc3.dm.douta [16], \tc3.dm.douta [15], \tc3.dm.douta [14], \tc3.dm.douta [13], \tc3.dm.douta [12], \tc3.dm.douta [11], \tc3.dm.douta [10], \tc3.dm.douta [9], \tc3.dm.douta [8], \tc3.dm.douta [7], \tc3.dm.douta [6], \tc3.dm.douta [5], \tc3.dm.douta [4], \tc3.dm.douta [3], \tc3.dm.douta [2], \tc3.dm.douta [1], \tc3.dm.douta [0]}),
	.DataOutB({\tc3.DM [17], \tc3.DM [16], \tc3.DM [15], \tc3.DM [14], \tc3.DM [13], \tc3.DM [12], \tc3.DM [11], \tc3.DM [10], \tc3.DM [9], \tc3.DM [8], \tc3.DM [7], \tc3.DM [6], \tc3.DM [5], \tc3.DM [4], \tc3.DM [3], \tc3.DM [2], \tc3.DM [1], \tc3.DM [0]}),
	.Clk0(syn__1103_),
	.ClkEn0(vcc),
	.AsyncReset0(gnd),
	.Clk1(!syn__1103_),
	.ClkEn1(vcc),
	.AsyncReset1(gnd),
	.WeRenA(\tc3.WriteDM ),
	.WeRenB(gnd));
defparam \tc3.dm.ram_inst .coord_x = 3;
defparam \tc3.dm.ram_inst .coord_y = 7;
defparam \tc3.dm.ram_inst .coord_z = 0;
defparam \tc3.dm.ram_inst .CLKMODE = 1'b0;
defparam \tc3.dm.ram_inst .PORTA_WIDTH = 4'b0000;
defparam \tc3.dm.ram_inst .PORTB_WIDTH = 4'b0000;
defparam \tc3.dm.ram_inst .PORTA_WRITEMODE = 1'b0;
defparam \tc3.dm.ram_inst .PORTB_WRITEMODE = 1'b0;
defparam \tc3.dm.ram_inst .PORTA_WRITETHRU = 1'b0;
defparam \tc3.dm.ram_inst .PORTB_WRITETHRU = 1'b0;
defparam \tc3.dm.ram_inst .PORTA_OUTREG = 1'b0;
defparam \tc3.dm.ram_inst .PORTB_OUTREG = 1'b0;
defparam \tc3.dm.ram_inst .PORTB_READONLY = 1'b1;
defparam \tc3.dm.ram_inst .INIT_VAL = 4608'h000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;

alta_bram \tc3.im.ram_inst (
	.DataInA({IOvalue3[17], IOvalue3[16], IOvalue3[15], IOvalue3[14], IOvalue3[13], IOvalue3[12], IOvalue3[11], IOvalue3[10], IOvalue3[9], IOvalue3[8], IOvalue3[7], IOvalue3[6], IOvalue3[5], IOvalue3[4], IOvalue3[3], IOvalue3[2], IOvalue3[1], IOvalue3[0]}),
	.DataInB({1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz}),
	.AddressA({1'bz, 1'bz, 1'bz, 1'bz, 1'bz, IOaddr3[6], IOaddr3[5], IOaddr3[4], IOaddr3[3], IOaddr3[2], IOaddr3[1], IOaddr3[0]}),
	.AddressB({1'bz, 1'bz, 1'bz, 1'bz, 1'bz, \tc3.PCmux [6], \tc3.PCmux [5], \tc3.PCmux [4], \tc3.PCmux [3], \tc3.PCmux [2], \tc3.PCmux [1], \tc3.PCmux [0]}),
	.DataOutA({\tc3.im.douta [17], \tc3.im.douta [16], \tc3.im.douta [15], \tc3.im.douta [14], \tc3.im.douta [13], \tc3.im.douta [12], \tc3.im.douta [11], \tc3.im.douta [10], \tc3.im.douta [9], \tc3.im.douta [8], \tc3.im.douta [7], \tc3.im.douta [6], \tc3.im.douta [5], \tc3.im.douta [4], \tc3.im.douta [3], \tc3.im.douta [2], \tc3.im.douta [1], \tc3.im.douta [0]}),
	.DataOutB({\tc3.IM [17], \tc3.IM [16], \tc3.IM [15], \tc3.IM [14], \tc3.IM [13], \tc3.IM [12], \tc3.IM [11], \tc3.IM [10], \tc3.IM [9], \tc3.IM [8], \tc3.IM [7], \tc3.IM [6], \tc3.IM [5], \tc3.IM [4], \tc3.IM [3], \tc3.IM [2], \tc3.IM [1], \tc3.IM [0]}),
	.Clk0(syn__1103_),
	.ClkEn0(vcc),
	.AsyncReset0(gnd),
	.Clk1(syn__1103_),
	.ClkEn1(vcc),
	.AsyncReset1(gnd),
	.WeRenA(\tc3.WriteIM ),
	.WeRenB(gnd));
defparam \tc3.im.ram_inst .coord_x = 3;
defparam \tc3.im.ram_inst .coord_y = 8;
defparam \tc3.im.ram_inst .coord_z = 0;
defparam \tc3.im.ram_inst .CLKMODE = 1'b0;
defparam \tc3.im.ram_inst .PORTA_WIDTH = 4'b0000;
defparam \tc3.im.ram_inst .PORTB_WIDTH = 4'b0000;
defparam \tc3.im.ram_inst .PORTA_WRITEMODE = 1'b0;
defparam \tc3.im.ram_inst .PORTB_WRITEMODE = 1'b0;
defparam \tc3.im.ram_inst .PORTA_WRITETHRU = 1'b0;
defparam \tc3.im.ram_inst .PORTB_WRITETHRU = 1'b0;
defparam \tc3.im.ram_inst .PORTA_OUTREG = 1'b0;
defparam \tc3.im.ram_inst .PORTB_OUTREG = 1'b0;
defparam \tc3.im.ram_inst .PORTB_READONLY = 1'b1;
defparam \tc3.im.ram_inst .INIT_VAL = 4608'h0000000000000000070003FF090000030200050004000460040008200400082004000820040008200E040C030A001006000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;

alta_bram \tc3.rfA.ram_inst (
	.DataInA({\tc3.WD [17], \tc3.WD [16], \tc3.WD [15], \tc3.WD [14], \tc3.WD [13], \tc3.WD [12], \tc3.WD [11], \tc3.WD [10], \tc3.WD [9], \tc3.WD [8], \tc3.WD [7], \tc3.WD [6], \tc3.WD [5], \tc3.WD [4], \tc3.WD [3], \tc3.WD [2], \tc3.WD [1], \tc3.WD [0]}),
	.DataInB({1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz}),
	.AddressA({1'bz, 1'bz, 1'bz, 1'bz, 1'bz, \tc3.IM [31], \tc3.IM [30], \tc3.IM [29], \tc3.IM [28], \tc3.IM [27], \tc3.IM [26], \tc3.IM [25]}),
	.AddressB({1'bz, 1'bz, 1'bz, 1'bz, 1'bz, \tc3.IM [23], \tc3.IM [22], \tc3.IM [21], \tc3.IM [20], \tc3.IM [19], \tc3.IM [18], \tc3.IM [17]}),
	.DataOutA({\tc3.rfA.douta [17], \tc3.rfA.douta [16], \tc3.rfA.douta [15], \tc3.rfA.douta [14], \tc3.rfA.douta [13], \tc3.rfA.douta [12], \tc3.rfA.douta [11], \tc3.rfA.douta [10], \tc3.rfA.douta [9], \tc3.rfA.douta [8], \tc3.rfA.douta [7], \tc3.rfA.douta [6], \tc3.rfA.douta [5], \tc3.rfA.douta [4], \tc3.rfA.douta [3], \tc3.rfA.douta [2], \tc3.rfA.douta [1], \tc3.rfA.douta [0]}),
	.DataOutB({IOvalue3[17], IOvalue3[16], IOvalue3[15], IOvalue3[14], IOvalue3[13], IOvalue3[12], IOvalue3[11], IOvalue3[10], IOvalue3[9], IOvalue3[8], IOvalue3[7], IOvalue3[6], IOvalue3[5], IOvalue3[4], IOvalue3[3], IOvalue3[2], IOvalue3[1], IOvalue3[0]}),
	.Clk0(syn__1103_),
	.ClkEn0(vcc),
	.AsyncReset0(gnd),
	.Clk1(!syn__1103_),
	.ClkEn1(vcc),
	.AsyncReset1(gnd),
	.WeRenA(vcc),
	.WeRenB(gnd));
defparam \tc3.rfA.ram_inst .coord_x = 3;
defparam \tc3.rfA.ram_inst .coord_y = 6;
defparam \tc3.rfA.ram_inst .coord_z = 0;
defparam \tc3.rfA.ram_inst .CLKMODE = 1'b0;
defparam \tc3.rfA.ram_inst .PORTA_WIDTH = 4'b0000;
defparam \tc3.rfA.ram_inst .PORTB_WIDTH = 4'b0000;
defparam \tc3.rfA.ram_inst .PORTA_WRITEMODE = 1'b0;
defparam \tc3.rfA.ram_inst .PORTB_WRITEMODE = 1'b0;
defparam \tc3.rfA.ram_inst .PORTA_WRITETHRU = 1'b0;
defparam \tc3.rfA.ram_inst .PORTB_WRITETHRU = 1'b0;
defparam \tc3.rfA.ram_inst .PORTA_OUTREG = 1'b0;
defparam \tc3.rfA.ram_inst .PORTB_OUTREG = 1'b0;
defparam \tc3.rfA.ram_inst .PORTB_READONLY = 1'b1;
defparam \tc3.rfA.ram_inst .INIT_VAL = 4608'h000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;

alta_bram \tc3.rfB.ram_inst (
	.DataInA({\tc3.WD [17], \tc3.WD [16], \tc3.WD [15], \tc3.WD [14], \tc3.WD [13], \tc3.WD [12], \tc3.WD [11], \tc3.WD [10], \tc3.WD [9], \tc3.WD [8], \tc3.WD [7], \tc3.WD [6], \tc3.WD [5], \tc3.WD [4], \tc3.WD [3], \tc3.WD [2], \tc3.WD [1], \tc3.WD [0]}),
	.DataInB({1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz, 1'bz}),
	.AddressA({1'bz, 1'bz, 1'bz, 1'bz, 1'bz, \tc3.IM [31], \tc3.IM [30], \tc3.IM [29], \tc3.IM [28], \tc3.IM [27], \tc3.IM [26], \tc3.IM [25]}),
	.AddressB({1'bz, 1'bz, 1'bz, 1'bz, 1'bz, \tc3.IM [16], \tc3.IM [15], \tc3.IM [14], \tc3.IM [13], \tc3.IM [12], \tc3.IM [11], \tc3.IM [10]}),
	.DataOutA({\tc3.rfB.douta [17], \tc3.rfB.douta [16], \tc3.rfB.douta [15], \tc3.rfB.douta [14], \tc3.rfB.douta [13], \tc3.rfB.douta [12], \tc3.rfB.douta [11], \tc3.rfB.douta [10], \tc3.rfB.douta [9], \tc3.rfB.douta [8], \tc3.rfB.douta [7], \tc3.rfB.douta [6], \tc3.rfB.douta [5], \tc3.rfB.douta [4], \tc3.rfB.douta [3], \tc3.rfB.douta [2], \tc3.rfB.douta [1], \tc3.rfB.douta [0]}),
	.DataOutB({IOaddr3[17], IOaddr3[16], IOaddr3[15], IOaddr3[14], IOaddr3[13], IOaddr3[12], IOaddr3[11], IOaddr3[10], IOaddr3[9], IOaddr3[8], IOaddr3[7], IOaddr3[6], IOaddr3[5], IOaddr3[4], IOaddr3[3], IOaddr3[2], IOaddr3[1], IOaddr3[0]}),
	.Clk0(syn__1103_),
	.ClkEn0(vcc),
	.AsyncReset0(gnd),
	.Clk1(!syn__1103_),
	.ClkEn1(vcc),
	.AsyncReset1(gnd),
	.WeRenA(vcc),
	.WeRenB(gnd));
defparam \tc3.rfB.ram_inst .coord_x = 3;
defparam \tc3.rfB.ram_inst .coord_y = 5;
defparam \tc3.rfB.ram_inst .coord_z = 0;
defparam \tc3.rfB.ram_inst .CLKMODE = 1'b0;
defparam \tc3.rfB.ram_inst .PORTA_WIDTH = 4'b0000;
defparam \tc3.rfB.ram_inst .PORTB_WIDTH = 4'b0000;
defparam \tc3.rfB.ram_inst .PORTA_WRITEMODE = 1'b0;
defparam \tc3.rfB.ram_inst .PORTB_WRITEMODE = 1'b0;
defparam \tc3.rfB.ram_inst .PORTA_WRITETHRU = 1'b0;
defparam \tc3.rfB.ram_inst .PORTB_WRITETHRU = 1'b0;
defparam \tc3.rfB.ram_inst .PORTA_OUTREG = 1'b0;
defparam \tc3.rfB.ram_inst .PORTB_OUTREG = 1'b0;
defparam \tc3.rfB.ram_inst .PORTB_READONLY = 1'b1;
defparam \tc3.rfB.ram_inst .INIT_VAL = 4608'h000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;

endmodule
