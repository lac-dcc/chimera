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
wire	AsyncReset_X1009_Y1001_GND;
wire	AsyncReset_X1011_Y1001_GND;
wire	AsyncReset_X1012_Y1001_GND;
wire	[31:0] IOaddr;
//wire	IOaddr[0];
//wire	IOaddr[10];
//wire	IOaddr[11];
//wire	IOaddr[12];
//wire	IOaddr[13];
//wire	IOaddr[14];
//wire	IOaddr[15];
//wire	IOaddr[16];
//wire	IOaddr[17];
//wire	IOaddr[18];
//wire	IOaddr[19];
//wire	IOaddr[1];
//wire	IOaddr[20];
//wire	IOaddr[21];
//wire	IOaddr[22];
//wire	IOaddr[23];
//wire	IOaddr[24];
//wire	IOaddr[25];
//wire	IOaddr[26];
//wire	IOaddr[27];
//wire	IOaddr[28];
//wire	IOaddr[29];
//wire	IOaddr[2];
//wire	IOaddr[30];
//wire	IOaddr[31];
//wire	IOaddr[3];
//wire	IOaddr[4];
//wire	IOaddr[5];
//wire	IOaddr[6];
//wire	IOaddr[7];
//wire	IOaddr[8];
//wire	IOaddr[9];
wire	[31:0] IOvalue;
//wire	IOvalue[0];
//wire	IOvalue[10];
//wire	IOvalue[11];
//wire	IOvalue[12];
//wire	IOvalue[13];
//wire	IOvalue[14];
//wire	IOvalue[15];
//wire	IOvalue[16];
//wire	IOvalue[17];
//wire	IOvalue[18];
//wire	IOvalue[19];
//wire	IOvalue[1];
//wire	IOvalue[20];
//wire	IOvalue[21];
//wire	IOvalue[22];
//wire	IOvalue[23];
//wire	IOvalue[24];
//wire	IOvalue[25];
//wire	IOvalue[26];
//wire	IOvalue[27];
//wire	IOvalue[28];
//wire	IOvalue[29];
//wire	IOvalue[2];
//wire	IOvalue[30];
//wire	IOvalue[31];
//wire	IOvalue[3];
//wire	IOvalue[4];
//wire	IOvalue[5];
//wire	IOvalue[6];
//wire	IOvalue[7];
//wire	IOvalue[8];
//wire	IOvalue[9];
wire	SyncLoad_X1000_Y1002_VCC;
wire	SyncLoad_X1009_Y1001_VCC;
wire	SyncLoad_X1011_Y1001_VCC;
wire	SyncReset_X1000_Y1002_GND;
wire	SyncReset_X1009_Y1001_GND;
wire	SyncReset_X1011_Y1001_GND;
wire	\gnd~I_int ;
wire	[7:0] syn__000_;
//wire	syn__000_[0];
//wire	syn__000_[1];
//wire	syn__000_[2];
//wire	syn__000_[3];
//wire	syn__000_[4];
//wire	syn__000_[5];
//wire	syn__000_[6];
//wire	syn__000_[7];
wire	syn__001_;
wire	syn__002_;
wire	syn__003_;
wire	syn__004_;
wire	syn__005_;
wire	syn__006_;
wire	syn__007_;
wire	syn__008_;
wire	syn__009_;
wire	syn__010_;
wire	syn__011_;
wire	syn__012_;
wire	syn__013_;
wire	syn__014_;
wire	syn__015_;
wire	syn__016_;
wire	syn__017_;
wire	syn__018_;
wire	syn__019_;
wire	syn__020_;
wire	syn__021_;
wire	syn__022_;
wire	syn__023_;
wire	syn__024_;
wire	syn__025_;
wire	syn__026_;
wire	syn__027_;
wire	syn__028_;
wire	syn__029_;
wire	syn__030_;
wire	syn__031_;
wire	syn__032_;
wire	syn__033_;
wire	syn__034_;
wire	syn__035_;
wire	syn__036_;
wire	syn__037_;
wire	syn__038_;
wire	syn__039_;
wire	syn__040_;
wire	syn__041_;
wire	syn__042_;
wire	syn__043_;
wire	syn__044_;
wire	syn__045_;
wire	syn__046_;
wire	syn__047_;
wire	syn__048_;
wire	syn__049_;
wire	syn__050_;
wire	syn__051_;
wire	syn__052_;
wire	syn__053_;
wire	syn__054_;
wire	syn__055_;
wire	syn__056_;
wire	syn__057_;
wire	syn__058_;
wire	syn__059_;
wire	syn__060_;
wire	syn__061_;
wire	syn__062_;
wire	syn__063_;
wire	syn__064_;
wire	syn__065_;
wire	syn__066_;
wire	syn__067_;
wire	syn__068_;
wire	syn__069_;
wire	syn__070_;
wire	syn__071_;
wire	syn__072_;
wire	syn__073_;
wire	syn__074_;
wire	syn__075_;
wire	syn__076_;
wire	syn__077_;
wire	syn__078_;
wire	syn__079_;
wire	syn__080_;
wire	syn__081_;
wire	syn__082_;
wire	syn__083_;
wire	syn__084_;
wire	syn__085_;
wire	syn__086_;
wire	syn__087_;
wire	syn__088_;
wire	syn__089_;
wire	syn__090_;
wire	syn__091_;
wire	syn__092_;
wire	syn__093_;
wire	syn__094_;
wire	syn__095_;
wire	syn__096_;
wire	syn__097_;
wire	syn__098_;
wire	syn__099_;
wire	syn__100_;
wire	syn__101_;
wire	syn__102_;
wire	syn__103_;
wire	syn__104_;
wire	syn__105_;
wire	syn__106_;
wire	syn__107_;
wire	syn__108_;
wire	syn__109_;
wire	syn__110_;
wire	syn__111_;
wire	syn__112_;
wire	syn__113_;
wire	syn__114_;
wire	syn__115_;
wire	syn__116_;
wire	syn__117_;
wire	syn__118_;
wire	syn__119_;
wire	syn__120_;
wire	syn__121_;
wire	syn__122_;
wire	syn__123_;
wire	syn__124_;
wire	syn__125_;
wire	syn__126_;
wire	syn__127_;
wire	syn__128_;
wire	syn__129_;
wire	syn__130_;
wire	syn__131_;
wire	syn__132_;
wire	syn__133_;
wire	syn__134_;
wire	syn__135_;
wire	syn__136_;
wire	syn__137_;
wire	syn__138_;
wire	syn__139_;
wire	syn__140_;
wire	syn__141_;
wire	syn__142_;
wire	syn__143_;
wire	syn__144_;
wire	syn__145_;
wire	syn__146_;
wire	syn__147_;
wire	syn__148_;
wire	syn__149_;
wire	syn__150_;
wire	syn__151_;
wire	syn__152_;
wire	syn__153_;
wire	syn__154_;
wire	syn__155_;
wire	syn__156_;
wire	syn__157_;
wire	syn__158_;
wire	syn__159_;
wire	syn__160_;
wire	syn__161_;
wire	syn__162_;
wire	syn__163_;
wire	syn__164_;
wire	syn__165_;
wire	syn__166_;
wire	syn__167_;
wire	syn__168_;
wire	syn__169_;
wire	syn__170_;
wire	syn__171_;
wire	syn__172_;
wire	syn__173_;
wire	syn__174_;
wire	syn__175_;
wire	syn__176_;
wire	syn__177_;
wire	syn__178_;
wire	syn__179_;
wire	syn__180_;
wire	syn__181_;
wire	syn__182_;
wire	syn__183_;
wire	syn__184_;
wire	syn__185_;
wire	syn__186_;
wire	syn__187_;
wire	syn__188_;
wire	syn__189_;
wire	syn__190_;
wire	syn__191_;
wire	syn__192_;
wire	syn__193_;
wire	syn__194_;
wire	syn__195_;
wire	syn__196_;
wire	syn__197_;
wire	syn__198_;
wire	syn__199_;
wire	syn__200_;
wire	syn__201_;
wire	syn__202_;
wire	syn__203_;
wire	syn__204_;
wire	syn__205_;
wire	syn__206_;
wire	syn__207_;
wire	syn__208_;
wire	syn__209_;
wire	syn__210_;
wire	syn__211_;
wire	syn__212_;
wire	syn__213_;
wire	syn__214_;
wire	syn__215_;
wire	syn__216_;
wire	syn__217_;
wire	syn__218_;
wire	syn__219_;
wire	syn__220_;
wire	syn__221_;
wire	syn__222_;
wire	syn__223_;
wire	syn__224_;
wire	syn__225_;
wire	syn__226_;
wire	syn__227_;
wire	syn__228_;
wire	syn__229_;
wire	syn__230_;
wire	syn__231_;
wire	syn__232_;
wire	syn__233_;
wire	syn__234_;
wire	syn__235_;
wire	syn__236_;
wire	syn__237_;
wire	syn__238_;
wire	syn__239_;
wire	syn__240_;
wire	syn__241_;
wire	syn__242_;
wire	syn__243_;
wire	syn__244_;
wire	syn__245_;
wire	syn__246_;
wire	syn__247_;
wire	syn__248_;
wire	syn__249_;
wire	syn__250_;
wire	syn__251_;
wire	syn__252_;
wire	syn__253_;
wire	syn__254_;
wire	syn__255_;
wire	syn__256_;
wire	syn__257_;
wire	syn__258_;
wire	syn__259_;
wire	syn__260_;
wire	syn__261_;
wire	syn__262_;
wire	syn__263_;
wire	syn__264_;
wire	syn__265_;
wire	syn__266_;
wire	syn__267_;
wire	syn__268_;
wire	syn__269_;
wire	syn__270_;
wire	syn__271_;
wire	syn__272_;
wire	syn__273_;
wire	syn__274_;
wire	syn__275_;
wire	syn__276_;
wire	syn__277_;
wire	syn__278_;
wire	syn__279_;
wire	syn__280_;
wire	syn__281_;
wire	syn__282_;
wire	syn__283_;
wire	syn__284_;
wire	syn__285_;
wire	syn__286_;
wire	syn__287_;
wire	syn__288_;
wire	syn__289_;
wire	syn__290_;
wire	syn__291_;
wire	syn__292_;
wire	syn__293_;
wire	syn__294_;
wire	syn__295_;
wire	syn__296_;
wire	syn__297_;
wire	syn__298_;
wire	syn__299_;
wire	syn__300_;
wire	syn__301_;
wire	syn__302_;
wire	syn__303_;
wire	syn__304_;
wire	syn__305_;
wire	syn__306_;
wire	syn__307_;
wire	syn__308_;
wire	syn__309_;
wire	syn__310_;
wire	syn__311_;
wire	syn__312_;
wire	syn__313_;
wire	syn__314_;
wire	syn__315_;
wire	syn__316_;
wire	syn__317_;
wire	syn__318_;
wire	syn__319_;
wire	syn__320_;
wire	syn__321_;
wire	syn__322_;
wire	syn__323_;
wire	syn__324_;
wire	syn__325_;
wire	syn__326_;
wire	syn__327_;
wire	syn__328_;
wire	syn__329_;
wire	syn__330_;
wire	syn__331_;
wire	syn__332_;
wire	syn__333_;
wire	syn__334_;
wire	syn__335_;
wire	syn__336_;
wire	syn__337_;
wire	syn__338_;
wire	syn__339_;
wire	syn__340_;
wire	syn__341_;
wire	syn__342_;
wire	syn__343_;
wire	syn__344_;
wire	syn__345_;
wire	syn__346_;
wire	syn__347_;
wire	syn__348_;
wire	syn__349_;
wire	syn__350_;
wire	syn__351_;
wire	syn__352_;
wire	syn__353_;
wire	syn__354_;
wire	syn__355_;
wire	syn__356_;
wire	syn__357_;
wire	syn__358_;
wire	syn__359_;
wire	syn__360_;
wire	syn__361_;
wire	syn__362_;
wire	syn__363_;
wire	syn__364_;
wire	syn__365_;
wire	syn__366_;
wire	syn__367_;
wire	[7:0] syn__368_;
//wire	syn__368_[0];
//wire	syn__368_[1];
//wire	syn__368_[2];
//wire	syn__368_[3];
//wire	syn__368_[4];
//wire	syn__368_[5];
//wire	syn__368_[6];
//wire	syn__368_[7];
wire	[7:0] syn__369_;
//wire	syn__369_[0];
//wire	syn__369_[1];
//wire	syn__369_[2];
//wire	syn__369_[3];
//wire	syn__369_[4];
//wire	syn__369_[5];
//wire	syn__369_[6];
//wire	syn__369_[7];
wire	syn__370_;
wire	syn__370__X1000_Y1002_SIG_VCC;
wire	syn__370__X1009_Y1001_SIG_VCC;
wire	syn__370__X1011_Y1001_SIG_VCC;
wire	syn__370__X1012_Y1001_SIG_VCC;
wire	[31:0] \tc.DM ;
//wire	\tc.DM [0];
//wire	\tc.DM [10];
//wire	\tc.DM [11];
//wire	\tc.DM [12];
//wire	\tc.DM [13];
//wire	\tc.DM [14];
//wire	\tc.DM [15];
//wire	\tc.DM [16];
//wire	\tc.DM [17];
//wire	\tc.DM [18];
//wire	\tc.DM [19];
//wire	\tc.DM [1];
//wire	\tc.DM [20];
//wire	\tc.DM [21];
//wire	\tc.DM [22];
//wire	\tc.DM [23];
//wire	\tc.DM [24];
//wire	\tc.DM [25];
//wire	\tc.DM [26];
//wire	\tc.DM [27];
//wire	\tc.DM [28];
//wire	\tc.DM [29];
//wire	\tc.DM [2];
//wire	\tc.DM [30];
//wire	\tc.DM [31];
//wire	\tc.DM [3];
//wire	\tc.DM [4];
//wire	\tc.DM [5];
//wire	\tc.DM [6];
//wire	\tc.DM [7];
//wire	\tc.DM [8];
//wire	\tc.DM [9];
wire	[31:0] \tc.IM ;
//wire	\tc.IM [0];
//wire	\tc.IM [10];
//wire	\tc.IM [11];
//wire	\tc.IM [12];
//wire	\tc.IM [13];
//wire	\tc.IM [14];
//wire	\tc.IM [15];
//wire	\tc.IM [16];
//wire	\tc.IM [17];
//wire	\tc.IM [18];
//wire	\tc.IM [19];
//wire	\tc.IM [1];
//wire	\tc.IM [20];
//wire	\tc.IM [21];
//wire	\tc.IM [22];
//wire	\tc.IM [23];
//wire	\tc.IM [24];
//wire	\tc.IM [25];
//wire	\tc.IM [26];
//wire	\tc.IM [27];
//wire	\tc.IM [28];
//wire	\tc.IM [29];
//wire	\tc.IM [2];
//wire	\tc.IM [30];
//wire	\tc.IM [31];
//wire	\tc.IM [3];
//wire	\tc.IM [4];
//wire	\tc.IM [5];
//wire	\tc.IM [6];
//wire	\tc.IM [7];
//wire	\tc.IM [8];
//wire	\tc.IM [9];
wire	[6:0] \tc.PC ;
//wire	\tc.PC [0];
//wire	\tc.PC [1];
//wire	\tc.PC [2];
//wire	\tc.PC [3];
//wire	\tc.PC [4];
//wire	\tc.PC [5];
//wire	\tc.PC [6];
wire	[6:0] \tc.PCmux ;
//wire	\tc.PCmux [0];
//wire	\tc.PCmux [1];
//wire	\tc.PCmux [2];
//wire	\tc.PCmux [3];
//wire	\tc.PCmux [4];
//wire	\tc.PCmux [5];
//wire	\tc.PCmux [6];
wire	[31:0] \tc.WD ;
//wire	\tc.WD [0];
//wire	\tc.WD [10];
//wire	\tc.WD [11];
//wire	\tc.WD [12];
//wire	\tc.WD [13];
//wire	\tc.WD [14];
//wire	\tc.WD [15];
//wire	\tc.WD [16];
//wire	\tc.WD [17];
//wire	\tc.WD [18];
//wire	\tc.WD [19];
//wire	\tc.WD [1];
//wire	\tc.WD [20];
//wire	\tc.WD [21];
//wire	\tc.WD [22];
//wire	\tc.WD [23];
//wire	\tc.WD [24];
//wire	\tc.WD [25];
//wire	\tc.WD [26];
//wire	\tc.WD [27];
//wire	\tc.WD [28];
//wire	\tc.WD [29];
//wire	\tc.WD [2];
//wire	\tc.WD [30];
//wire	\tc.WD [31];
//wire	\tc.WD [3];
//wire	\tc.WD [4];
//wire	\tc.WD [5];
//wire	\tc.WD [6];
//wire	\tc.WD [7];
//wire	\tc.WD [8];
//wire	\tc.WD [9];
wire	\tc.WriteDM ;
wire	[6:0] \tc.im.addr ;
//wire	\tc.im.addr [0];
//wire	\tc.im.addr [1];
//wire	\tc.im.addr [2];
//wire	\tc.im.addr [3];
//wire	\tc.im.addr [4];
//wire	\tc.im.addr [5];
//wire	\tc.im.addr [6];
wire	[6:0] \tc.rfA.addr ;
//wire	\tc.rfA.addr [0];
//wire	\tc.rfA.addr [1];
//wire	\tc.rfA.addr [2];
//wire	\tc.rfA.addr [3];
//wire	\tc.rfA.addr [4];
//wire	\tc.rfA.addr [5];
//wire	\tc.rfA.addr [6];
wire	[6:0] \tc.rfB.addr ;
//wire	\tc.rfB.addr [0];
//wire	\tc.rfB.addr [1];
//wire	\tc.rfB.addr [2];
//wire	\tc.rfB.addr [3];
//wire	\tc.rfB.addr [4];
//wire	\tc.rfB.addr [5];
//wire	\tc.rfB.addr [6];

assign vcc = 1'b1;
assign gnd = 1'b0;

alta_asyncctrl asyncreset_ctrl_X1000_Y1002_N0(
	.Din(),
	.Dout(AsyncReset_X1000_Y1002_GND));
defparam asyncreset_ctrl_X1000_Y1002_N0.coord_x = 5;
defparam asyncreset_ctrl_X1000_Y1002_N0.coord_y = 2;
defparam asyncreset_ctrl_X1000_Y1002_N0.coord_z = 0;
defparam asyncreset_ctrl_X1000_Y1002_N0.AsyncCtrlMux = 2'b00;

alta_asyncctrl asyncreset_ctrl_X1009_Y1001_N0(
	.Din(),
	.Dout(AsyncReset_X1009_Y1001_GND));
defparam asyncreset_ctrl_X1009_Y1001_N0.coord_x = 5;
defparam asyncreset_ctrl_X1009_Y1001_N0.coord_y = 5;
defparam asyncreset_ctrl_X1009_Y1001_N0.coord_z = 0;
defparam asyncreset_ctrl_X1009_Y1001_N0.AsyncCtrlMux = 2'b00;

alta_asyncctrl asyncreset_ctrl_X1011_Y1001_N0(
	.Din(),
	.Dout(AsyncReset_X1011_Y1001_GND));
defparam asyncreset_ctrl_X1011_Y1001_N0.coord_x = 0;
defparam asyncreset_ctrl_X1011_Y1001_N0.coord_y = 3;
defparam asyncreset_ctrl_X1011_Y1001_N0.coord_z = 0;
defparam asyncreset_ctrl_X1011_Y1001_N0.AsyncCtrlMux = 2'b00;

alta_asyncctrl asyncreset_ctrl_X1012_Y1001_N0(
	.Din(),
	.Dout(AsyncReset_X1012_Y1001_GND));
defparam asyncreset_ctrl_X1012_Y1001_N0.coord_x = 1;
defparam asyncreset_ctrl_X1012_Y1001_N0.coord_y = 3;
defparam asyncreset_ctrl_X1012_Y1001_N0.coord_z = 0;
defparam asyncreset_ctrl_X1012_Y1001_N0.AsyncCtrlMux = 2'b00;

alta_clkenctrl clken_ctrl_X1000_Y1002_N0(
	.ClkIn(syn__370_),
	.ClkEn(),
	.ClkOut(syn__370__X1000_Y1002_SIG_VCC));
defparam clken_ctrl_X1000_Y1002_N0.coord_x = 5;
defparam clken_ctrl_X1000_Y1002_N0.coord_y = 2;
defparam clken_ctrl_X1000_Y1002_N0.coord_z = 0;
defparam clken_ctrl_X1000_Y1002_N0.ClkMux = 2'b10;
defparam clken_ctrl_X1000_Y1002_N0.ClkEnMux = 2'b01;

alta_clkenctrl clken_ctrl_X1009_Y1001_N0(
	.ClkIn(syn__370_),
	.ClkEn(),
	.ClkOut(syn__370__X1009_Y1001_SIG_VCC));
defparam clken_ctrl_X1009_Y1001_N0.coord_x = 5;
defparam clken_ctrl_X1009_Y1001_N0.coord_y = 5;
defparam clken_ctrl_X1009_Y1001_N0.coord_z = 0;
defparam clken_ctrl_X1009_Y1001_N0.ClkMux = 2'b10;
defparam clken_ctrl_X1009_Y1001_N0.ClkEnMux = 2'b01;

alta_clkenctrl clken_ctrl_X1011_Y1001_N0(
	.ClkIn(syn__370_),
	.ClkEn(),
	.ClkOut(syn__370__X1011_Y1001_SIG_VCC));
defparam clken_ctrl_X1011_Y1001_N0.coord_x = 0;
defparam clken_ctrl_X1011_Y1001_N0.coord_y = 3;
defparam clken_ctrl_X1011_Y1001_N0.coord_z = 0;
defparam clken_ctrl_X1011_Y1001_N0.ClkMux = 2'b10;
defparam clken_ctrl_X1011_Y1001_N0.ClkEnMux = 2'b01;

alta_clkenctrl clken_ctrl_X1012_Y1001_N0(
	.ClkIn(syn__370_),
	.ClkEn(),
	.ClkOut(syn__370__X1012_Y1001_SIG_VCC));
defparam clken_ctrl_X1012_Y1001_N0.coord_x = 1;
defparam clken_ctrl_X1012_Y1001_N0.coord_y = 3;
defparam clken_ctrl_X1012_Y1001_N0.coord_z = 0;
defparam clken_ctrl_X1012_Y1001_N0.ClkMux = 2'b10;
defparam clken_ctrl_X1012_Y1001_N0.ClkEnMux = 2'b01;

alta_slice \gnd~I (
	.A(vcc),
	.B(vcc),
	.C(vcc),
	.D(vcc),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\gnd~I_int ),
	.Cout(),
	.Q());
defparam \gnd~I .coord_x = 4;
defparam \gnd~I .coord_y = 3;
defparam \gnd~I .coord_z = 10;
defparam \gnd~I .mask = 16'h0000;
defparam \gnd~I .modeMux = 1'b0;
defparam \gnd~I .FeedbackMux = 1'b0;
defparam \gnd~I .ShiftMux = 1'b0;
defparam \gnd~I .BypassEn = 1'b0;
defparam \gnd~I .CarryEnb = 1'b1;

alta_slice syn__372_(
	.A(syn__012_),
	.B(syn__002_),
	.C(syn__011_),
	.D(syn__013_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__001_),
	.Cout(),
	.Q());
defparam syn__372_.coord_x = 5;
defparam syn__372_.coord_y = 5;
defparam syn__372_.coord_z = 8;
defparam syn__372_.mask = 16'h8000;
defparam syn__372_.modeMux = 1'b0;
defparam syn__372_.FeedbackMux = 1'b0;
defparam syn__372_.ShiftMux = 1'b0;
defparam syn__372_.BypassEn = 1'b0;
defparam syn__372_.CarryEnb = 1'b1;

alta_slice syn__373_(
	.A(syn__009_),
	.B(syn__006_),
	.C(syn__003_),
	.D(syn__010_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__002_),
	.Cout(),
	.Q());
defparam syn__373_.coord_x = 6;
defparam syn__373_.coord_y = 6;
defparam syn__373_.coord_z = 9;
defparam syn__373_.mask = 16'h8000;
defparam syn__373_.modeMux = 1'b0;
defparam syn__373_.FeedbackMux = 1'b0;
defparam syn__373_.ShiftMux = 1'b0;
defparam syn__373_.BypassEn = 1'b0;
defparam syn__373_.CarryEnb = 1'b1;

alta_slice syn__374_(
	.A(IOaddr[11]),
	.B(syn__004_),
	.C(IOaddr[10]),
	.D(syn__005_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__003_),
	.Cout(),
	.Q());
defparam syn__374_.coord_x = 4;
defparam syn__374_.coord_y = 6;
defparam syn__374_.coord_z = 12;
defparam syn__374_.mask = 16'h0400;
defparam syn__374_.modeMux = 1'b0;
defparam syn__374_.FeedbackMux = 1'b0;
defparam syn__374_.ShiftMux = 1'b0;
defparam syn__374_.BypassEn = 1'b0;
defparam syn__374_.CarryEnb = 1'b1;

alta_slice syn__375_(
	.A(IOaddr[14]),
	.B(IOaddr[12]),
	.C(IOaddr[13]),
	.D(IOaddr[15]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__004_),
	.Cout(),
	.Q());
defparam syn__375_.coord_x = 5;
defparam syn__375_.coord_y = 6;
defparam syn__375_.coord_z = 14;
defparam syn__375_.mask = 16'h0001;
defparam syn__375_.modeMux = 1'b0;
defparam syn__375_.FeedbackMux = 1'b0;
defparam syn__375_.ShiftMux = 1'b0;
defparam syn__375_.BypassEn = 1'b0;
defparam syn__375_.CarryEnb = 1'b1;

alta_slice syn__376_(
	.A(vcc),
	.B(vcc),
	.C(\tc.IM [2]),
	.D(\tc.IM [24]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__005_),
	.Cout(),
	.Q());
defparam syn__376_.coord_x = 2;
defparam syn__376_.coord_y = 6;
defparam syn__376_.coord_z = 1;
defparam syn__376_.mask = 16'h000F;
defparam syn__376_.modeMux = 1'b0;
defparam syn__376_.FeedbackMux = 1'b0;
defparam syn__376_.ShiftMux = 1'b0;
defparam syn__376_.BypassEn = 1'b0;
defparam syn__376_.CarryEnb = 1'b1;

alta_slice syn__377_(
	.A(vcc),
	.B(vcc),
	.C(syn__007_),
	.D(syn__008_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__006_),
	.Cout(),
	.Q());
defparam syn__377_.coord_x = 6;
defparam syn__377_.coord_y = 6;
defparam syn__377_.coord_z = 8;
defparam syn__377_.mask = 16'hF000;
defparam syn__377_.modeMux = 1'b0;
defparam syn__377_.FeedbackMux = 1'b0;
defparam syn__377_.ShiftMux = 1'b0;
defparam syn__377_.BypassEn = 1'b0;
defparam syn__377_.CarryEnb = 1'b1;

alta_slice syn__378_(
	.A(IOaddr[29]),
	.B(IOaddr[31]),
	.C(IOaddr[28]),
	.D(IOaddr[30]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__007_),
	.Cout(),
	.Q());
defparam syn__378_.coord_x = 6;
defparam syn__378_.coord_y = 7;
defparam syn__378_.coord_z = 2;
defparam syn__378_.mask = 16'h0001;
defparam syn__378_.modeMux = 1'b0;
defparam syn__378_.FeedbackMux = 1'b0;
defparam syn__378_.ShiftMux = 1'b0;
defparam syn__378_.BypassEn = 1'b0;
defparam syn__378_.CarryEnb = 1'b1;

alta_slice syn__379_(
	.A(IOaddr[26]),
	.B(IOaddr[25]),
	.C(IOaddr[27]),
	.D(IOaddr[24]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__008_),
	.Cout(),
	.Q());
defparam syn__379_.coord_x = 5;
defparam syn__379_.coord_y = 7;
defparam syn__379_.coord_z = 6;
defparam syn__379_.mask = 16'h0001;
defparam syn__379_.modeMux = 1'b0;
defparam syn__379_.FeedbackMux = 1'b0;
defparam syn__379_.ShiftMux = 1'b0;
defparam syn__379_.BypassEn = 1'b0;
defparam syn__379_.CarryEnb = 1'b1;

alta_slice syn__380_(
	.A(IOaddr[16]),
	.B(IOaddr[19]),
	.C(IOaddr[17]),
	.D(IOaddr[18]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__009_),
	.Cout(),
	.Q());
defparam syn__380_.coord_x = 7;
defparam syn__380_.coord_y = 8;
defparam syn__380_.coord_z = 8;
defparam syn__380_.mask = 16'h0001;
defparam syn__380_.modeMux = 1'b0;
defparam syn__380_.FeedbackMux = 1'b0;
defparam syn__380_.ShiftMux = 1'b0;
defparam syn__380_.BypassEn = 1'b0;
defparam syn__380_.CarryEnb = 1'b1;

alta_slice syn__381_(
	.A(IOaddr[20]),
	.B(IOaddr[22]),
	.C(IOaddr[21]),
	.D(IOaddr[23]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__010_),
	.Cout(),
	.Q());
defparam syn__381_.coord_x = 6;
defparam syn__381_.coord_y = 5;
defparam syn__381_.coord_z = 14;
defparam syn__381_.mask = 16'h0001;
defparam syn__381_.modeMux = 1'b0;
defparam syn__381_.FeedbackMux = 1'b0;
defparam syn__381_.ShiftMux = 1'b0;
defparam syn__381_.BypassEn = 1'b0;
defparam syn__381_.CarryEnb = 1'b1;

alta_slice syn__382_(
	.A(IOaddr[7]),
	.B(IOaddr[9]),
	.C(IOaddr[8]),
	.D(IOaddr[6]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__011_),
	.Cout(),
	.Q());
defparam syn__382_.coord_x = 5;
defparam syn__382_.coord_y = 8;
defparam syn__382_.coord_z = 1;
defparam syn__382_.mask = 16'h8000;
defparam syn__382_.modeMux = 1'b0;
defparam syn__382_.FeedbackMux = 1'b0;
defparam syn__382_.ShiftMux = 1'b0;
defparam syn__382_.BypassEn = 1'b0;
defparam syn__382_.CarryEnb = 1'b1;

alta_slice syn__383_(
	.A(IOaddr[5]),
	.B(IOaddr[4]),
	.C(IOaddr[2]),
	.D(IOaddr[3]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__012_),
	.Cout(),
	.Q());
defparam syn__383_.coord_x = 4;
defparam syn__383_.coord_y = 5;
defparam syn__383_.coord_z = 9;
defparam syn__383_.mask = 16'h8000;
defparam syn__383_.modeMux = 1'b0;
defparam syn__383_.FeedbackMux = 1'b0;
defparam syn__383_.ShiftMux = 1'b0;
defparam syn__383_.BypassEn = 1'b0;
defparam syn__383_.CarryEnb = 1'b1;

alta_slice syn__384_(
	.A(\tc.IM [1]),
	.B(\tc.IM [0]),
	.C(IOaddr[1]),
	.D(IOaddr[0]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__013_),
	.Cout(),
	.Q());
defparam syn__384_.coord_x = 5;
defparam syn__384_.coord_y = 5;
defparam syn__384_.coord_z = 3;
defparam syn__384_.mask = 16'h8000;
defparam syn__384_.modeMux = 1'b0;
defparam syn__384_.FeedbackMux = 1'b0;
defparam syn__384_.ShiftMux = 1'b0;
defparam syn__384_.BypassEn = 1'b0;
defparam syn__384_.CarryEnb = 1'b1;

alta_slice syn__392_(
	.A(\tc.PC [0]),
	.B(syn__208_),
	.C(syn__014_),
	.D(syn__265_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc.PCmux [0]),
	.Cout(),
	.Q());
defparam syn__392_.coord_x = 0;
defparam syn__392_.coord_y = 3;
defparam syn__392_.coord_z = 11;
defparam syn__392_.mask = 16'h33A5;
defparam syn__392_.modeMux = 1'b0;
defparam syn__392_.FeedbackMux = 1'b0;
defparam syn__392_.ShiftMux = 1'b0;
defparam syn__392_.BypassEn = 1'b0;
defparam syn__392_.CarryEnb = 1'b1;

alta_slice syn__393_(
	.A(\tc.IM [3]),
	.B(syn__264_),
	.C(syn__254_),
	.D(syn__015_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__014_),
	.Cout(),
	.Q());
defparam syn__393_.coord_x = 0;
defparam syn__393_.coord_y = 3;
defparam syn__393_.coord_z = 10;
defparam syn__393_.mask = 16'hC888;
defparam syn__393_.modeMux = 1'b0;
defparam syn__393_.FeedbackMux = 1'b0;
defparam syn__393_.ShiftMux = 1'b0;
defparam syn__393_.BypassEn = 1'b0;
defparam syn__393_.CarryEnb = 1'b1;

alta_slice syn__394_(
	.A(syn__247_),
	.B(syn__241_),
	.C(syn__313_),
	.D(syn__113_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__015_),
	.Cout(),
	.Q());
defparam syn__394_.coord_x = 4;
defparam syn__394_.coord_y = 4;
defparam syn__394_.coord_z = 9;
defparam syn__394_.mask = 16'h8000;
defparam syn__394_.modeMux = 1'b0;
defparam syn__394_.FeedbackMux = 1'b0;
defparam syn__394_.ShiftMux = 1'b0;
defparam syn__394_.BypassEn = 1'b0;
defparam syn__394_.CarryEnb = 1'b1;

alta_slice syn__395_(
	.A(syn__017_),
	.B(syn__102_),
	.C(syn__098_),
	.D(\tc.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__016_),
	.Cout(),
	.Q());
defparam syn__395_.coord_x = 4;
defparam syn__395_.coord_y = 4;
defparam syn__395_.coord_z = 5;
defparam syn__395_.mask = 16'hF090;
defparam syn__395_.modeMux = 1'b0;
defparam syn__395_.FeedbackMux = 1'b0;
defparam syn__395_.ShiftMux = 1'b0;
defparam syn__395_.BypassEn = 1'b0;
defparam syn__395_.CarryEnb = 1'b1;

alta_slice syn__396_(
	.A(syn__018_),
	.B(syn__095_),
	.C(syn__096_),
	.D(syn__097_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__017_),
	.Cout(),
	.Q());
defparam syn__396_.coord_x = 6;
defparam syn__396_.coord_y = 7;
defparam syn__396_.coord_z = 13;
defparam syn__396_.mask = 16'h0313;
defparam syn__396_.modeMux = 1'b0;
defparam syn__396_.FeedbackMux = 1'b0;
defparam syn__396_.ShiftMux = 1'b0;
defparam syn__396_.BypassEn = 1'b0;
defparam syn__396_.CarryEnb = 1'b1;

alta_slice syn__397_(
	.A(syn__094_),
	.B(syn__092_),
	.C(syn__093_),
	.D(syn__019_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__018_),
	.Cout(),
	.Q());
defparam syn__397_.coord_x = 6;
defparam syn__397_.coord_y = 7;
defparam syn__397_.coord_z = 8;
defparam syn__397_.mask = 16'h0113;
defparam syn__397_.modeMux = 1'b0;
defparam syn__397_.FeedbackMux = 1'b0;
defparam syn__397_.ShiftMux = 1'b0;
defparam syn__397_.BypassEn = 1'b0;
defparam syn__397_.CarryEnb = 1'b1;

alta_slice syn__398_(
	.A(syn__020_),
	.B(syn__089_),
	.C(syn__091_),
	.D(syn__090_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__019_),
	.Cout(),
	.Q());
defparam syn__398_.coord_x = 5;
defparam syn__398_.coord_y = 7;
defparam syn__398_.coord_z = 1;
defparam syn__398_.mask = 16'hCD04;
defparam syn__398_.modeMux = 1'b0;
defparam syn__398_.FeedbackMux = 1'b0;
defparam syn__398_.ShiftMux = 1'b0;
defparam syn__398_.BypassEn = 1'b0;
defparam syn__398_.CarryEnb = 1'b1;

alta_slice syn__399_(
	.A(syn__021_),
	.B(syn__086_),
	.C(syn__087_),
	.D(syn__088_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__020_),
	.Cout(),
	.Q());
defparam syn__399_.coord_x = 5;
defparam syn__399_.coord_y = 7;
defparam syn__399_.coord_z = 0;
defparam syn__399_.mask = 16'hC0C4;
defparam syn__399_.modeMux = 1'b0;
defparam syn__399_.FeedbackMux = 1'b0;
defparam syn__399_.ShiftMux = 1'b0;
defparam syn__399_.BypassEn = 1'b0;
defparam syn__399_.CarryEnb = 1'b1;

alta_slice syn__400_(
	.A(syn__083_),
	.B(syn__022_),
	.C(syn__084_),
	.D(syn__085_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__021_),
	.Cout(),
	.Q());
defparam syn__400_.coord_x = 4;
defparam syn__400_.coord_y = 7;
defparam syn__400_.coord_z = 11;
defparam syn__400_.mask = 16'h0515;
defparam syn__400_.modeMux = 1'b0;
defparam syn__400_.FeedbackMux = 1'b0;
defparam syn__400_.ShiftMux = 1'b0;
defparam syn__400_.BypassEn = 1'b0;
defparam syn__400_.CarryEnb = 1'b1;

alta_slice syn__401_(
	.A(syn__082_),
	.B(syn__080_),
	.C(syn__023_),
	.D(syn__081_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__022_),
	.Cout(),
	.Q());
defparam syn__401_.coord_x = 6;
defparam syn__401_.coord_y = 5;
defparam syn__401_.coord_z = 6;
defparam syn__401_.mask = 16'h0113;
defparam syn__401_.modeMux = 1'b0;
defparam syn__401_.FeedbackMux = 1'b0;
defparam syn__401_.ShiftMux = 1'b0;
defparam syn__401_.BypassEn = 1'b0;
defparam syn__401_.CarryEnb = 1'b1;

alta_slice syn__402_(
	.A(syn__077_),
	.B(syn__079_),
	.C(syn__024_),
	.D(syn__078_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__023_),
	.Cout(),
	.Q());
defparam syn__402_.coord_x = 6;
defparam syn__402_.coord_y = 5;
defparam syn__402_.coord_z = 4;
defparam syn__402_.mask = 16'hAB02;
defparam syn__402_.modeMux = 1'b0;
defparam syn__402_.FeedbackMux = 1'b0;
defparam syn__402_.ShiftMux = 1'b0;
defparam syn__402_.BypassEn = 1'b0;
defparam syn__402_.CarryEnb = 1'b1;

alta_slice syn__403_(
	.A(syn__075_),
	.B(syn__074_),
	.C(syn__076_),
	.D(syn__025_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__024_),
	.Cout(),
	.Q());
defparam syn__403_.coord_x = 6;
defparam syn__403_.coord_y = 6;
defparam syn__403_.coord_z = 0;
defparam syn__403_.mask = 16'h888C;
defparam syn__403_.modeMux = 1'b0;
defparam syn__403_.FeedbackMux = 1'b0;
defparam syn__403_.ShiftMux = 1'b0;
defparam syn__403_.BypassEn = 1'b0;
defparam syn__403_.CarryEnb = 1'b1;

alta_slice syn__404_(
	.A(syn__026_),
	.B(syn__071_),
	.C(syn__072_),
	.D(syn__073_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__025_),
	.Cout(),
	.Q());
defparam syn__404_.coord_x = 7;
defparam syn__404_.coord_y = 8;
defparam syn__404_.coord_z = 6;
defparam syn__404_.mask = 16'h0313;
defparam syn__404_.modeMux = 1'b0;
defparam syn__404_.FeedbackMux = 1'b0;
defparam syn__404_.ShiftMux = 1'b0;
defparam syn__404_.BypassEn = 1'b0;
defparam syn__404_.CarryEnb = 1'b1;

alta_slice syn__405_(
	.A(syn__069_),
	.B(syn__070_),
	.C(syn__027_),
	.D(syn__068_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__026_),
	.Cout(),
	.Q());
defparam syn__405_.coord_x = 7;
defparam syn__405_.coord_y = 8;
defparam syn__405_.coord_z = 14;
defparam syn__405_.mask = 16'h044C;
defparam syn__405_.modeMux = 1'b0;
defparam syn__405_.FeedbackMux = 1'b0;
defparam syn__405_.ShiftMux = 1'b0;
defparam syn__405_.BypassEn = 1'b0;
defparam syn__405_.CarryEnb = 1'b1;

alta_slice syn__406_(
	.A(syn__028_),
	.B(syn__067_),
	.C(syn__065_),
	.D(syn__066_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__027_),
	.Cout(),
	.Q());
defparam syn__406_.coord_x = 5;
defparam syn__406_.coord_y = 6;
defparam syn__406_.coord_z = 4;
defparam syn__406_.mask = 16'hF110;
defparam syn__406_.modeMux = 1'b0;
defparam syn__406_.FeedbackMux = 1'b0;
defparam syn__406_.ShiftMux = 1'b0;
defparam syn__406_.BypassEn = 1'b0;
defparam syn__406_.CarryEnb = 1'b1;

alta_slice syn__407_(
	.A(syn__062_),
	.B(syn__029_),
	.C(syn__063_),
	.D(syn__064_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__028_),
	.Cout(),
	.Q());
defparam syn__407_.coord_x = 5;
defparam syn__407_.coord_y = 6;
defparam syn__407_.coord_z = 8;
defparam syn__407_.mask = 16'hA0A2;
defparam syn__407_.modeMux = 1'b0;
defparam syn__407_.FeedbackMux = 1'b0;
defparam syn__407_.ShiftMux = 1'b0;
defparam syn__407_.BypassEn = 1'b0;
defparam syn__407_.CarryEnb = 1'b1;

alta_slice syn__408_(
	.A(syn__059_),
	.B(syn__030_),
	.C(syn__060_),
	.D(syn__061_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__029_),
	.Cout(),
	.Q());
defparam syn__408_.coord_x = 5;
defparam syn__408_.coord_y = 6;
defparam syn__408_.coord_z = 9;
defparam syn__408_.mask = 16'h0515;
defparam syn__408_.modeMux = 1'b0;
defparam syn__408_.FeedbackMux = 1'b0;
defparam syn__408_.ShiftMux = 1'b0;
defparam syn__408_.BypassEn = 1'b0;
defparam syn__408_.CarryEnb = 1'b1;

alta_slice syn__409_(
	.A(syn__057_),
	.B(syn__058_),
	.C(syn__031_),
	.D(syn__056_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__030_),
	.Cout(),
	.Q());
defparam syn__409_.coord_x = 4;
defparam syn__409_.coord_y = 6;
defparam syn__409_.coord_z = 14;
defparam syn__409_.mask = 16'h0017;
defparam syn__409_.modeMux = 1'b0;
defparam syn__409_.FeedbackMux = 1'b0;
defparam syn__409_.ShiftMux = 1'b0;
defparam syn__409_.BypassEn = 1'b0;
defparam syn__409_.CarryEnb = 1'b1;

alta_slice syn__410_(
	.A(syn__032_),
	.B(syn__054_),
	.C(syn__053_),
	.D(syn__055_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__031_),
	.Cout(),
	.Q());
defparam syn__410_.coord_x = 5;
defparam syn__410_.coord_y = 8;
defparam syn__410_.coord_z = 13;
defparam syn__410_.mask = 16'hC0D4;
defparam syn__410_.modeMux = 1'b0;
defparam syn__410_.FeedbackMux = 1'b0;
defparam syn__410_.ShiftMux = 1'b0;
defparam syn__410_.BypassEn = 1'b0;
defparam syn__410_.CarryEnb = 1'b1;

alta_slice syn__411_(
	.A(syn__051_),
	.B(syn__050_),
	.C(syn__033_),
	.D(syn__052_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__032_),
	.Cout(),
	.Q());
defparam syn__411_.coord_x = 5;
defparam syn__411_.coord_y = 8;
defparam syn__411_.coord_z = 9;
defparam syn__411_.mask = 16'h888C;
defparam syn__411_.modeMux = 1'b0;
defparam syn__411_.FeedbackMux = 1'b0;
defparam syn__411_.ShiftMux = 1'b0;
defparam syn__411_.BypassEn = 1'b0;
defparam syn__411_.CarryEnb = 1'b1;

alta_slice syn__412_(
	.A(syn__047_),
	.B(syn__034_),
	.C(syn__049_),
	.D(syn__048_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__033_),
	.Cout(),
	.Q());
defparam syn__412_.coord_x = 4;
defparam syn__412_.coord_y = 8;
defparam syn__412_.coord_z = 13;
defparam syn__412_.mask = 16'hAB02;
defparam syn__412_.modeMux = 1'b0;
defparam syn__412_.FeedbackMux = 1'b0;
defparam syn__412_.ShiftMux = 1'b0;
defparam syn__412_.BypassEn = 1'b0;
defparam syn__412_.CarryEnb = 1'b1;

alta_slice syn__413_(
	.A(syn__035_),
	.B(syn__044_),
	.C(syn__046_),
	.D(syn__045_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__034_),
	.Cout(),
	.Q());
defparam syn__413_.coord_x = 4;
defparam syn__413_.coord_y = 8;
defparam syn__413_.coord_z = 12;
defparam syn__413_.mask = 16'h0113;
defparam syn__413_.modeMux = 1'b0;
defparam syn__413_.FeedbackMux = 1'b0;
defparam syn__413_.ShiftMux = 1'b0;
defparam syn__413_.BypassEn = 1'b0;
defparam syn__413_.CarryEnb = 1'b1;

alta_slice syn__414_(
	.A(syn__042_),
	.B(syn__041_),
	.C(syn__036_),
	.D(syn__043_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__035_),
	.Cout(),
	.Q());
defparam syn__414_.coord_x = 4;
defparam syn__414_.coord_y = 5;
defparam syn__414_.coord_z = 14;
defparam syn__414_.mask = 16'h0133;
defparam syn__414_.modeMux = 1'b0;
defparam syn__414_.FeedbackMux = 1'b0;
defparam syn__414_.ShiftMux = 1'b0;
defparam syn__414_.BypassEn = 1'b0;
defparam syn__414_.CarryEnb = 1'b1;

alta_slice syn__415_(
	.A(syn__039_),
	.B(syn__040_),
	.C(syn__037_),
	.D(syn__038_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__036_),
	.Cout(),
	.Q());
defparam syn__415_.coord_x = 4;
defparam syn__415_.coord_y = 5;
defparam syn__415_.coord_z = 4;
defparam syn__415_.mask = 16'h088C;
defparam syn__415_.modeMux = 1'b0;
defparam syn__415_.FeedbackMux = 1'b0;
defparam syn__415_.ShiftMux = 1'b0;
defparam syn__415_.BypassEn = 1'b0;
defparam syn__415_.CarryEnb = 1'b1;

alta_slice syn__416_(
	.A(IOaddr[1]),
	.B(vcc),
	.C(\tc.IM [8]),
	.D(\tc.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__037_),
	.Cout(),
	.Q());
defparam syn__416_.coord_x = 4;
defparam syn__416_.coord_y = 5;
defparam syn__416_.coord_z = 8;
defparam syn__416_.mask = 16'h0AF5;
defparam syn__416_.modeMux = 1'b0;
defparam syn__416_.FeedbackMux = 1'b0;
defparam syn__416_.ShiftMux = 1'b0;
defparam syn__416_.BypassEn = 1'b0;
defparam syn__416_.CarryEnb = 1'b1;

alta_slice syn__417_(
	.A(IOaddr[1]),
	.B(vcc),
	.C(\tc.IM [8]),
	.D(IOvalue[1]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__038_),
	.Cout(),
	.Q());
defparam syn__417_.coord_x = 4;
defparam syn__417_.coord_y = 5;
defparam syn__417_.coord_z = 13;
defparam syn__417_.mask = 16'h505F;
defparam syn__417_.modeMux = 1'b0;
defparam syn__417_.FeedbackMux = 1'b0;
defparam syn__417_.ShiftMux = 1'b0;
defparam syn__417_.BypassEn = 1'b0;
defparam syn__417_.CarryEnb = 1'b1;

alta_slice syn__418_(
	.A(IOvalue[0]),
	.B(IOaddr[0]),
	.C(\tc.IM [8]),
	.D(\tc.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__039_),
	.Cout(),
	.Q());
defparam syn__418_.coord_x = 5;
defparam syn__418_.coord_y = 5;
defparam syn__418_.coord_z = 7;
defparam syn__418_.mask = 16'hC2C8;
defparam syn__418_.modeMux = 1'b0;
defparam syn__418_.FeedbackMux = 1'b0;
defparam syn__418_.ShiftMux = 1'b0;
defparam syn__418_.BypassEn = 1'b0;
defparam syn__418_.CarryEnb = 1'b1;

alta_slice syn__419_(
	.A(IOaddr[2]),
	.B(IOvalue[2]),
	.C(\tc.IM [8]),
	.D(\tc.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__040_),
	.Cout(),
	.Q());
defparam syn__419_.coord_x = 4;
defparam syn__419_.coord_y = 5;
defparam syn__419_.coord_z = 1;
defparam syn__419_.mask = 16'h59A6;
defparam syn__419_.modeMux = 1'b0;
defparam syn__419_.FeedbackMux = 1'b0;
defparam syn__419_.ShiftMux = 1'b0;
defparam syn__419_.BypassEn = 1'b0;
defparam syn__419_.CarryEnb = 1'b1;

alta_slice syn__420_(
	.A(IOaddr[3]),
	.B(IOvalue[3]),
	.C(\tc.IM [8]),
	.D(\tc.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__041_),
	.Cout(),
	.Q());
defparam syn__420_.coord_x = 4;
defparam syn__420_.coord_y = 5;
defparam syn__420_.coord_z = 3;
defparam syn__420_.mask = 16'hA408;
defparam syn__420_.modeMux = 1'b0;
defparam syn__420_.FeedbackMux = 1'b0;
defparam syn__420_.ShiftMux = 1'b0;
defparam syn__420_.BypassEn = 1'b0;
defparam syn__420_.CarryEnb = 1'b1;

alta_slice syn__421_(
	.A(IOaddr[2]),
	.B(IOvalue[2]),
	.C(\tc.IM [8]),
	.D(\tc.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__042_),
	.Cout(),
	.Q());
defparam syn__421_.coord_x = 4;
defparam syn__421_.coord_y = 5;
defparam syn__421_.coord_z = 6;
defparam syn__421_.mask = 16'hA408;
defparam syn__421_.modeMux = 1'b0;
defparam syn__421_.FeedbackMux = 1'b0;
defparam syn__421_.ShiftMux = 1'b0;
defparam syn__421_.BypassEn = 1'b0;
defparam syn__421_.CarryEnb = 1'b1;

alta_slice syn__422_(
	.A(IOaddr[3]),
	.B(IOvalue[3]),
	.C(\tc.IM [8]),
	.D(\tc.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__043_),
	.Cout(),
	.Q());
defparam syn__422_.coord_x = 4;
defparam syn__422_.coord_y = 5;
defparam syn__422_.coord_z = 15;
defparam syn__422_.mask = 16'h59A6;
defparam syn__422_.modeMux = 1'b0;
defparam syn__422_.FeedbackMux = 1'b0;
defparam syn__422_.ShiftMux = 1'b0;
defparam syn__422_.BypassEn = 1'b0;
defparam syn__422_.CarryEnb = 1'b1;

alta_slice syn__423_(
	.A(IOvalue[5]),
	.B(IOaddr[5]),
	.C(\tc.IM [8]),
	.D(\tc.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__044_),
	.Cout(),
	.Q());
defparam syn__423_.coord_x = 4;
defparam syn__423_.coord_y = 8;
defparam syn__423_.coord_z = 7;
defparam syn__423_.mask = 16'h0431;
defparam syn__423_.modeMux = 1'b0;
defparam syn__423_.FeedbackMux = 1'b0;
defparam syn__423_.ShiftMux = 1'b0;
defparam syn__423_.BypassEn = 1'b0;
defparam syn__423_.CarryEnb = 1'b1;

alta_slice syn__424_(
	.A(vcc),
	.B(IOaddr[4]),
	.C(\tc.IM [8]),
	.D(\tc.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__045_),
	.Cout(),
	.Q());
defparam syn__424_.coord_x = 4;
defparam syn__424_.coord_y = 8;
defparam syn__424_.coord_z = 11;
defparam syn__424_.mask = 16'h0CF3;
defparam syn__424_.modeMux = 1'b0;
defparam syn__424_.FeedbackMux = 1'b0;
defparam syn__424_.ShiftMux = 1'b0;
defparam syn__424_.BypassEn = 1'b0;
defparam syn__424_.CarryEnb = 1'b1;

alta_slice syn__425_(
	.A(vcc),
	.B(IOvalue[4]),
	.C(\tc.IM [8]),
	.D(IOaddr[4]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__046_),
	.Cout(),
	.Q());
defparam syn__425_.coord_x = 4;
defparam syn__425_.coord_y = 8;
defparam syn__425_.coord_z = 14;
defparam syn__425_.mask = 16'h03F3;
defparam syn__425_.modeMux = 1'b0;
defparam syn__425_.FeedbackMux = 1'b0;
defparam syn__425_.ShiftMux = 1'b0;
defparam syn__425_.BypassEn = 1'b0;
defparam syn__425_.CarryEnb = 1'b1;

alta_slice syn__426_(
	.A(vcc),
	.B(\tc.IM [8]),
	.C(IOaddr[6]),
	.D(\tc.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__047_),
	.Cout(),
	.Q());
defparam syn__426_.coord_x = 4;
defparam syn__426_.coord_y = 7;
defparam syn__426_.coord_z = 5;
defparam syn__426_.mask = 16'h30CF;
defparam syn__426_.modeMux = 1'b0;
defparam syn__426_.FeedbackMux = 1'b0;
defparam syn__426_.ShiftMux = 1'b0;
defparam syn__426_.BypassEn = 1'b0;
defparam syn__426_.CarryEnb = 1'b1;

alta_slice syn__427_(
	.A(IOvalue[6]),
	.B(vcc),
	.C(\tc.IM [8]),
	.D(IOaddr[6]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__048_),
	.Cout(),
	.Q());
defparam syn__427_.coord_x = 4;
defparam syn__427_.coord_y = 8;
defparam syn__427_.coord_z = 5;
defparam syn__427_.mask = 16'h05F5;
defparam syn__427_.modeMux = 1'b0;
defparam syn__427_.FeedbackMux = 1'b0;
defparam syn__427_.ShiftMux = 1'b0;
defparam syn__427_.BypassEn = 1'b0;
defparam syn__427_.CarryEnb = 1'b1;

alta_slice syn__428_(
	.A(IOvalue[5]),
	.B(IOaddr[5]),
	.C(\tc.IM [8]),
	.D(\tc.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__049_),
	.Cout(),
	.Q());
defparam syn__428_.coord_x = 4;
defparam syn__428_.coord_y = 8;
defparam syn__428_.coord_z = 8;
defparam syn__428_.mask = 16'hC208;
defparam syn__428_.modeMux = 1'b0;
defparam syn__428_.FeedbackMux = 1'b0;
defparam syn__428_.ShiftMux = 1'b0;
defparam syn__428_.BypassEn = 1'b0;
defparam syn__428_.CarryEnb = 1'b1;

alta_slice syn__429_(
	.A(IOvalue[8]),
	.B(\tc.IM [8]),
	.C(IOaddr[8]),
	.D(\tc.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__050_),
	.Cout(),
	.Q());
defparam syn__429_.coord_x = 5;
defparam syn__429_.coord_y = 8;
defparam syn__429_.coord_z = 7;
defparam syn__429_.mask = 16'h2DD2;
defparam syn__429_.modeMux = 1'b0;
defparam syn__429_.FeedbackMux = 1'b0;
defparam syn__429_.ShiftMux = 1'b0;
defparam syn__429_.BypassEn = 1'b0;
defparam syn__429_.CarryEnb = 1'b1;

alta_slice syn__430_(
	.A(IOaddr[7]),
	.B(\tc.IM [8]),
	.C(IOvalue[7]),
	.D(\tc.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__051_),
	.Cout(),
	.Q());
defparam syn__430_.coord_x = 5;
defparam syn__430_.coord_y = 8;
defparam syn__430_.coord_z = 10;
defparam syn__430_.mask = 16'h9820;
defparam syn__430_.modeMux = 1'b0;
defparam syn__430_.FeedbackMux = 1'b0;
defparam syn__430_.ShiftMux = 1'b0;
defparam syn__430_.BypassEn = 1'b0;
defparam syn__430_.CarryEnb = 1'b1;

alta_slice syn__431_(
	.A(IOaddr[7]),
	.B(\tc.IM [8]),
	.C(IOvalue[7]),
	.D(\tc.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__052_),
	.Cout(),
	.Q());
defparam syn__431_.coord_x = 5;
defparam syn__431_.coord_y = 8;
defparam syn__431_.coord_z = 15;
defparam syn__431_.mask = 16'h0245;
defparam syn__431_.modeMux = 1'b0;
defparam syn__431_.FeedbackMux = 1'b0;
defparam syn__431_.ShiftMux = 1'b0;
defparam syn__431_.BypassEn = 1'b0;
defparam syn__431_.CarryEnb = 1'b1;

alta_slice syn__432_(
	.A(vcc),
	.B(\tc.IM [8]),
	.C(IOaddr[9]),
	.D(\tc.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__053_),
	.Cout(),
	.Q());
defparam syn__432_.coord_x = 5;
defparam syn__432_.coord_y = 8;
defparam syn__432_.coord_z = 2;
defparam syn__432_.mask = 16'h30CF;
defparam syn__432_.modeMux = 1'b0;
defparam syn__432_.FeedbackMux = 1'b0;
defparam syn__432_.ShiftMux = 1'b0;
defparam syn__432_.BypassEn = 1'b0;
defparam syn__432_.CarryEnb = 1'b1;

alta_slice syn__433_(
	.A(vcc),
	.B(IOaddr[9]),
	.C(IOvalue[9]),
	.D(\tc.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__054_),
	.Cout(),
	.Q());
defparam syn__433_.coord_x = 5;
defparam syn__433_.coord_y = 8;
defparam syn__433_.coord_z = 5;
defparam syn__433_.mask = 16'h330F;
defparam syn__433_.modeMux = 1'b0;
defparam syn__433_.FeedbackMux = 1'b0;
defparam syn__433_.ShiftMux = 1'b0;
defparam syn__433_.BypassEn = 1'b0;
defparam syn__433_.CarryEnb = 1'b1;

alta_slice syn__434_(
	.A(IOvalue[8]),
	.B(\tc.IM [8]),
	.C(IOaddr[8]),
	.D(\tc.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__055_),
	.Cout(),
	.Q());
defparam syn__434_.coord_x = 5;
defparam syn__434_.coord_y = 8;
defparam syn__434_.coord_z = 11;
defparam syn__434_.mask = 16'hC220;
defparam syn__434_.modeMux = 1'b0;
defparam syn__434_.FeedbackMux = 1'b0;
defparam syn__434_.ShiftMux = 1'b0;
defparam syn__434_.BypassEn = 1'b0;
defparam syn__434_.CarryEnb = 1'b1;

alta_slice syn__435_(
	.A(IOaddr[11]),
	.B(IOvalue[11]),
	.C(\tc.IM [8]),
	.D(\tc.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__056_),
	.Cout(),
	.Q());
defparam syn__435_.coord_x = 4;
defparam syn__435_.coord_y = 6;
defparam syn__435_.coord_z = 11;
defparam syn__435_.mask = 16'h0251;
defparam syn__435_.modeMux = 1'b0;
defparam syn__435_.FeedbackMux = 1'b0;
defparam syn__435_.ShiftMux = 1'b0;
defparam syn__435_.BypassEn = 1'b0;
defparam syn__435_.CarryEnb = 1'b1;

alta_slice syn__436_(
	.A(IOaddr[10]),
	.B(vcc),
	.C(\tc.IM [8]),
	.D(\tc.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__057_),
	.Cout(),
	.Q());
defparam syn__436_.coord_x = 4;
defparam syn__436_.coord_y = 6;
defparam syn__436_.coord_z = 5;
defparam syn__436_.mask = 16'h0AF5;
defparam syn__436_.modeMux = 1'b0;
defparam syn__436_.FeedbackMux = 1'b0;
defparam syn__436_.ShiftMux = 1'b0;
defparam syn__436_.BypassEn = 1'b0;
defparam syn__436_.CarryEnb = 1'b1;

alta_slice syn__437_(
	.A(IOaddr[10]),
	.B(vcc),
	.C(\tc.IM [8]),
	.D(IOvalue[10]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__058_),
	.Cout(),
	.Q());
defparam syn__437_.coord_x = 4;
defparam syn__437_.coord_y = 6;
defparam syn__437_.coord_z = 15;
defparam syn__437_.mask = 16'h505F;
defparam syn__437_.modeMux = 1'b0;
defparam syn__437_.FeedbackMux = 1'b0;
defparam syn__437_.ShiftMux = 1'b0;
defparam syn__437_.BypassEn = 1'b0;
defparam syn__437_.CarryEnb = 1'b1;

alta_slice syn__438_(
	.A(\tc.IM [8]),
	.B(IOaddr[12]),
	.C(IOvalue[12]),
	.D(\tc.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__059_),
	.Cout(),
	.Q());
defparam syn__438_.coord_x = 4;
defparam syn__438_.coord_y = 7;
defparam syn__438_.coord_z = 9;
defparam syn__438_.mask = 16'h9840;
defparam syn__438_.modeMux = 1'b0;
defparam syn__438_.FeedbackMux = 1'b0;
defparam syn__438_.ShiftMux = 1'b0;
defparam syn__438_.BypassEn = 1'b0;
defparam syn__438_.CarryEnb = 1'b1;

alta_slice syn__439_(
	.A(\tc.IM [8]),
	.B(IOvalue[12]),
	.C(IOaddr[12]),
	.D(\tc.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__060_),
	.Cout(),
	.Q());
defparam syn__439_.coord_x = 4;
defparam syn__439_.coord_y = 3;
defparam syn__439_.coord_z = 9;
defparam syn__439_.mask = 16'h4BB4;
defparam syn__439_.modeMux = 1'b0;
defparam syn__439_.FeedbackMux = 1'b0;
defparam syn__439_.ShiftMux = 1'b0;
defparam syn__439_.BypassEn = 1'b0;
defparam syn__439_.CarryEnb = 1'b1;

alta_slice syn__440_(
	.A(IOaddr[11]),
	.B(IOvalue[11]),
	.C(\tc.IM [8]),
	.D(\tc.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__061_),
	.Cout(),
	.Q());
defparam syn__440_.coord_x = 4;
defparam syn__440_.coord_y = 6;
defparam syn__440_.coord_z = 1;
defparam syn__440_.mask = 16'hA408;
defparam syn__440_.modeMux = 1'b0;
defparam syn__440_.FeedbackMux = 1'b0;
defparam syn__440_.ShiftMux = 1'b0;
defparam syn__440_.BypassEn = 1'b0;
defparam syn__440_.CarryEnb = 1'b1;

alta_slice syn__441_(
	.A(IOvalue[14]),
	.B(IOaddr[14]),
	.C(\tc.IM [8]),
	.D(\tc.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__062_),
	.Cout(),
	.Q());
defparam syn__441_.coord_x = 4;
defparam syn__441_.coord_y = 3;
defparam syn__441_.coord_z = 13;
defparam syn__441_.mask = 16'h39C6;
defparam syn__441_.modeMux = 1'b0;
defparam syn__441_.FeedbackMux = 1'b0;
defparam syn__441_.ShiftMux = 1'b0;
defparam syn__441_.BypassEn = 1'b0;
defparam syn__441_.CarryEnb = 1'b1;

alta_slice syn__442_(
	.A(\tc.IM [7]),
	.B(IOvalue[13]),
	.C(IOaddr[13]),
	.D(\tc.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__063_),
	.Cout(),
	.Q());
defparam syn__442_.coord_x = 5;
defparam syn__442_.coord_y = 6;
defparam syn__442_.coord_z = 6;
defparam syn__442_.mask = 16'hA048;
defparam syn__442_.modeMux = 1'b0;
defparam syn__442_.FeedbackMux = 1'b0;
defparam syn__442_.ShiftMux = 1'b0;
defparam syn__442_.BypassEn = 1'b0;
defparam syn__442_.CarryEnb = 1'b1;

alta_slice syn__443_(
	.A(IOaddr[13]),
	.B(\tc.IM [8]),
	.C(\tc.IM [7]),
	.D(IOvalue[13]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__064_),
	.Cout(),
	.Q());
defparam syn__443_.coord_x = 5;
defparam syn__443_.coord_y = 6;
defparam syn__443_.coord_z = 3;
defparam syn__443_.mask = 16'h0425;
defparam syn__443_.modeMux = 1'b0;
defparam syn__443_.FeedbackMux = 1'b0;
defparam syn__443_.ShiftMux = 1'b0;
defparam syn__443_.BypassEn = 1'b0;
defparam syn__443_.CarryEnb = 1'b1;

alta_slice syn__444_(
	.A(vcc),
	.B(\tc.IM [8]),
	.C(\tc.IM [7]),
	.D(IOaddr[15]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__065_),
	.Cout(),
	.Q());
defparam syn__444_.coord_x = 5;
defparam syn__444_.coord_y = 6;
defparam syn__444_.coord_z = 2;
defparam syn__444_.mask = 16'h3C0F;
defparam syn__444_.modeMux = 1'b0;
defparam syn__444_.FeedbackMux = 1'b0;
defparam syn__444_.ShiftMux = 1'b0;
defparam syn__444_.BypassEn = 1'b0;
defparam syn__444_.CarryEnb = 1'b1;

alta_slice syn__445_(
	.A(\tc.IM [8]),
	.B(IOaddr[15]),
	.C(vcc),
	.D(IOvalue[15]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__066_),
	.Cout(),
	.Q());
defparam syn__445_.coord_x = 5;
defparam syn__445_.coord_y = 6;
defparam syn__445_.coord_z = 5;
defparam syn__445_.mask = 16'h2277;
defparam syn__445_.modeMux = 1'b0;
defparam syn__445_.FeedbackMux = 1'b0;
defparam syn__445_.ShiftMux = 1'b0;
defparam syn__445_.BypassEn = 1'b0;
defparam syn__445_.CarryEnb = 1'b1;

alta_slice syn__446_(
	.A(IOaddr[14]),
	.B(\tc.IM [8]),
	.C(\tc.IM [7]),
	.D(IOvalue[14]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__067_),
	.Cout(),
	.Q());
defparam syn__446_.coord_x = 5;
defparam syn__446_.coord_y = 6;
defparam syn__446_.coord_z = 10;
defparam syn__446_.mask = 16'h9280;
defparam syn__446_.modeMux = 1'b0;
defparam syn__446_.FeedbackMux = 1'b0;
defparam syn__446_.ShiftMux = 1'b0;
defparam syn__446_.BypassEn = 1'b0;
defparam syn__446_.CarryEnb = 1'b1;

alta_slice syn__447_(
	.A(IOaddr[16]),
	.B(vcc),
	.C(\tc.IM [7]),
	.D(\tc.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__068_),
	.Cout(),
	.Q());
defparam syn__447_.coord_x = 7;
defparam syn__447_.coord_y = 8;
defparam syn__447_.coord_z = 11;
defparam syn__447_.mask = 16'h0FA5;
defparam syn__447_.modeMux = 1'b0;
defparam syn__447_.FeedbackMux = 1'b0;
defparam syn__447_.ShiftMux = 1'b0;
defparam syn__447_.BypassEn = 1'b0;
defparam syn__447_.CarryEnb = 1'b1;

alta_slice syn__448_(
	.A(vcc),
	.B(IOvalue[16]),
	.C(IOaddr[16]),
	.D(\tc.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__069_),
	.Cout(),
	.Q());
defparam syn__448_.coord_x = 7;
defparam syn__448_.coord_y = 8;
defparam syn__448_.coord_z = 4;
defparam syn__448_.mask = 16'h0F33;
defparam syn__448_.modeMux = 1'b0;
defparam syn__448_.FeedbackMux = 1'b0;
defparam syn__448_.ShiftMux = 1'b0;
defparam syn__448_.BypassEn = 1'b0;
defparam syn__448_.CarryEnb = 1'b1;

alta_slice syn__449_(
	.A(IOaddr[17]),
	.B(\tc.IM [8]),
	.C(\tc.IM [7]),
	.D(IOvalue[17]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__070_),
	.Cout(),
	.Q());
defparam syn__449_.coord_x = 7;
defparam syn__449_.coord_y = 8;
defparam syn__449_.coord_z = 1;
defparam syn__449_.mask = 16'h695A;
defparam syn__449_.modeMux = 1'b0;
defparam syn__449_.FeedbackMux = 1'b0;
defparam syn__449_.ShiftMux = 1'b0;
defparam syn__449_.BypassEn = 1'b0;
defparam syn__449_.CarryEnb = 1'b1;

alta_slice syn__450_(
	.A(IOvalue[18]),
	.B(IOaddr[18]),
	.C(\tc.IM [7]),
	.D(\tc.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__071_),
	.Cout(),
	.Q());
defparam syn__450_.coord_x = 7;
defparam syn__450_.coord_y = 8;
defparam syn__450_.coord_z = 15;
defparam syn__450_.mask = 16'hC028;
defparam syn__450_.modeMux = 1'b0;
defparam syn__450_.FeedbackMux = 1'b0;
defparam syn__450_.ShiftMux = 1'b0;
defparam syn__450_.BypassEn = 1'b0;
defparam syn__450_.CarryEnb = 1'b1;

alta_slice syn__451_(
	.A(\tc.IM [7]),
	.B(IOaddr[18]),
	.C(IOvalue[18]),
	.D(\tc.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__072_),
	.Cout(),
	.Q());
defparam syn__451_.coord_x = 7;
defparam syn__451_.coord_y = 8;
defparam syn__451_.coord_z = 10;
defparam syn__451_.mask = 16'h6696;
defparam syn__451_.modeMux = 1'b0;
defparam syn__451_.FeedbackMux = 1'b0;
defparam syn__451_.ShiftMux = 1'b0;
defparam syn__451_.BypassEn = 1'b0;
defparam syn__451_.CarryEnb = 1'b1;

alta_slice syn__452_(
	.A(\tc.IM [7]),
	.B(\tc.IM [8]),
	.C(IOaddr[17]),
	.D(IOvalue[17]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__073_),
	.Cout(),
	.Q());
defparam syn__452_.coord_x = 7;
defparam syn__452_.coord_y = 8;
defparam syn__452_.coord_z = 3;
defparam syn__452_.mask = 16'h9280;
defparam syn__452_.modeMux = 1'b0;
defparam syn__452_.FeedbackMux = 1'b0;
defparam syn__452_.ShiftMux = 1'b0;
defparam syn__452_.BypassEn = 1'b0;
defparam syn__452_.CarryEnb = 1'b1;

alta_slice syn__453_(
	.A(\tc.IM [8]),
	.B(IOaddr[20]),
	.C(IOvalue[20]),
	.D(\tc.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__074_),
	.Cout(),
	.Q());
defparam syn__453_.coord_x = 6;
defparam syn__453_.coord_y = 6;
defparam syn__453_.coord_z = 11;
defparam syn__453_.mask = 16'h639C;
defparam syn__453_.modeMux = 1'b0;
defparam syn__453_.FeedbackMux = 1'b0;
defparam syn__453_.ShiftMux = 1'b0;
defparam syn__453_.BypassEn = 1'b0;
defparam syn__453_.CarryEnb = 1'b1;

alta_slice syn__454_(
	.A(IOvalue[19]),
	.B(IOaddr[19]),
	.C(\tc.IM [8]),
	.D(\tc.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__075_),
	.Cout(),
	.Q());
defparam syn__454_.coord_x = 6;
defparam syn__454_.coord_y = 6;
defparam syn__454_.coord_z = 10;
defparam syn__454_.mask = 16'hC208;
defparam syn__454_.modeMux = 1'b0;
defparam syn__454_.FeedbackMux = 1'b0;
defparam syn__454_.ShiftMux = 1'b0;
defparam syn__454_.BypassEn = 1'b0;
defparam syn__454_.CarryEnb = 1'b1;

alta_slice syn__455_(
	.A(IOvalue[19]),
	.B(IOaddr[19]),
	.C(\tc.IM [8]),
	.D(\tc.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__076_),
	.Cout(),
	.Q());
defparam syn__455_.coord_x = 6;
defparam syn__455_.coord_y = 6;
defparam syn__455_.coord_z = 1;
defparam syn__455_.mask = 16'h0431;
defparam syn__455_.modeMux = 1'b0;
defparam syn__455_.FeedbackMux = 1'b0;
defparam syn__455_.ShiftMux = 1'b0;
defparam syn__455_.BypassEn = 1'b0;
defparam syn__455_.CarryEnb = 1'b1;

alta_slice syn__456_(
	.A(IOaddr[21]),
	.B(vcc),
	.C(\tc.IM [8]),
	.D(\tc.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__077_),
	.Cout(),
	.Q());
defparam syn__456_.coord_x = 6;
defparam syn__456_.coord_y = 5;
defparam syn__456_.coord_z = 10;
defparam syn__456_.mask = 16'h0AF5;
defparam syn__456_.modeMux = 1'b0;
defparam syn__456_.FeedbackMux = 1'b0;
defparam syn__456_.ShiftMux = 1'b0;
defparam syn__456_.BypassEn = 1'b0;
defparam syn__456_.CarryEnb = 1'b1;

alta_slice syn__457_(
	.A(IOaddr[21]),
	.B(vcc),
	.C(\tc.IM [8]),
	.D(IOvalue[21]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__078_),
	.Cout(),
	.Q());
defparam syn__457_.coord_x = 6;
defparam syn__457_.coord_y = 5;
defparam syn__457_.coord_z = 11;
defparam syn__457_.mask = 16'h505F;
defparam syn__457_.modeMux = 1'b0;
defparam syn__457_.FeedbackMux = 1'b0;
defparam syn__457_.ShiftMux = 1'b0;
defparam syn__457_.BypassEn = 1'b0;
defparam syn__457_.CarryEnb = 1'b1;

alta_slice syn__458_(
	.A(IOaddr[20]),
	.B(IOvalue[20]),
	.C(\tc.IM [8]),
	.D(\tc.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__079_),
	.Cout(),
	.Q());
defparam syn__458_.coord_x = 6;
defparam syn__458_.coord_y = 5;
defparam syn__458_.coord_z = 5;
defparam syn__458_.mask = 16'hA408;
defparam syn__458_.modeMux = 1'b0;
defparam syn__458_.FeedbackMux = 1'b0;
defparam syn__458_.ShiftMux = 1'b0;
defparam syn__458_.BypassEn = 1'b0;
defparam syn__458_.CarryEnb = 1'b1;

alta_slice syn__459_(
	.A(IOvalue[23]),
	.B(\tc.IM [7]),
	.C(\tc.IM [8]),
	.D(IOaddr[23]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__080_),
	.Cout(),
	.Q());
defparam syn__459_.coord_x = 6;
defparam syn__459_.coord_y = 5;
defparam syn__459_.coord_z = 9;
defparam syn__459_.mask = 16'h0431;
defparam syn__459_.modeMux = 1'b0;
defparam syn__459_.FeedbackMux = 1'b0;
defparam syn__459_.ShiftMux = 1'b0;
defparam syn__459_.BypassEn = 1'b0;
defparam syn__459_.CarryEnb = 1'b1;

alta_slice syn__460_(
	.A(vcc),
	.B(IOaddr[22]),
	.C(\tc.IM [8]),
	.D(\tc.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__081_),
	.Cout(),
	.Q());
defparam syn__460_.coord_x = 6;
defparam syn__460_.coord_y = 5;
defparam syn__460_.coord_z = 1;
defparam syn__460_.mask = 16'h0CF3;
defparam syn__460_.modeMux = 1'b0;
defparam syn__460_.FeedbackMux = 1'b0;
defparam syn__460_.ShiftMux = 1'b0;
defparam syn__460_.BypassEn = 1'b0;
defparam syn__460_.CarryEnb = 1'b1;

alta_slice syn__461_(
	.A(vcc),
	.B(IOvalue[22]),
	.C(\tc.IM [8]),
	.D(IOaddr[22]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__082_),
	.Cout(),
	.Q());
defparam syn__461_.coord_x = 6;
defparam syn__461_.coord_y = 5;
defparam syn__461_.coord_z = 7;
defparam syn__461_.mask = 16'h03F3;
defparam syn__461_.modeMux = 1'b0;
defparam syn__461_.FeedbackMux = 1'b0;
defparam syn__461_.ShiftMux = 1'b0;
defparam syn__461_.BypassEn = 1'b0;
defparam syn__461_.CarryEnb = 1'b1;

alta_slice syn__462_(
	.A(\tc.IM [8]),
	.B(IOaddr[24]),
	.C(\tc.IM [7]),
	.D(IOvalue[24]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__083_),
	.Cout(),
	.Q());
defparam syn__462_.coord_x = 5;
defparam syn__462_.coord_y = 7;
defparam syn__462_.coord_z = 10;
defparam syn__462_.mask = 16'h9480;
defparam syn__462_.modeMux = 1'b0;
defparam syn__462_.FeedbackMux = 1'b0;
defparam syn__462_.ShiftMux = 1'b0;
defparam syn__462_.BypassEn = 1'b0;
defparam syn__462_.CarryEnb = 1'b1;

alta_slice syn__463_(
	.A(\tc.IM [8]),
	.B(IOaddr[24]),
	.C(\tc.IM [7]),
	.D(IOvalue[24]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__084_),
	.Cout(),
	.Q());
defparam syn__463_.coord_x = 5;
defparam syn__463_.coord_y = 7;
defparam syn__463_.coord_z = 8;
defparam syn__463_.mask = 16'h693C;
defparam syn__463_.modeMux = 1'b0;
defparam syn__463_.FeedbackMux = 1'b0;
defparam syn__463_.ShiftMux = 1'b0;
defparam syn__463_.BypassEn = 1'b0;
defparam syn__463_.CarryEnb = 1'b1;

alta_slice syn__464_(
	.A(IOvalue[23]),
	.B(\tc.IM [7]),
	.C(\tc.IM [8]),
	.D(IOaddr[23]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__085_),
	.Cout(),
	.Q());
defparam syn__464_.coord_x = 6;
defparam syn__464_.coord_y = 5;
defparam syn__464_.coord_z = 12;
defparam syn__464_.mask = 16'hC208;
defparam syn__464_.modeMux = 1'b0;
defparam syn__464_.FeedbackMux = 1'b0;
defparam syn__464_.ShiftMux = 1'b0;
defparam syn__464_.BypassEn = 1'b0;
defparam syn__464_.CarryEnb = 1'b1;

alta_slice syn__465_(
	.A(\tc.IM [8]),
	.B(IOvalue[26]),
	.C(IOaddr[26]),
	.D(\tc.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__086_),
	.Cout(),
	.Q());
defparam syn__465_.coord_x = 5;
defparam syn__465_.coord_y = 7;
defparam syn__465_.coord_z = 3;
defparam syn__465_.mask = 16'h4BB4;
defparam syn__465_.modeMux = 1'b0;
defparam syn__465_.FeedbackMux = 1'b0;
defparam syn__465_.ShiftMux = 1'b0;
defparam syn__465_.BypassEn = 1'b0;
defparam syn__465_.CarryEnb = 1'b1;

alta_slice syn__466_(
	.A(\tc.IM [8]),
	.B(IOvalue[25]),
	.C(\tc.IM [7]),
	.D(IOaddr[25]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__087_),
	.Cout(),
	.Q());
defparam syn__466_.coord_x = 5;
defparam syn__466_.coord_y = 7;
defparam syn__466_.coord_z = 14;
defparam syn__466_.mask = 16'hA440;
defparam syn__466_.modeMux = 1'b0;
defparam syn__466_.FeedbackMux = 1'b0;
defparam syn__466_.ShiftMux = 1'b0;
defparam syn__466_.BypassEn = 1'b0;
defparam syn__466_.CarryEnb = 1'b1;

alta_slice syn__467_(
	.A(\tc.IM [8]),
	.B(IOvalue[25]),
	.C(IOaddr[25]),
	.D(\tc.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__088_),
	.Cout(),
	.Q());
defparam syn__467_.coord_x = 5;
defparam syn__467_.coord_y = 7;
defparam syn__467_.coord_z = 9;
defparam syn__467_.mask = 16'h100B;
defparam syn__467_.modeMux = 1'b0;
defparam syn__467_.FeedbackMux = 1'b0;
defparam syn__467_.ShiftMux = 1'b0;
defparam syn__467_.BypassEn = 1'b0;
defparam syn__467_.CarryEnb = 1'b1;

alta_slice syn__468_(
	.A(vcc),
	.B(\tc.IM [8]),
	.C(IOaddr[27]),
	.D(\tc.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__089_),
	.Cout(),
	.Q());
defparam syn__468_.coord_x = 4;
defparam syn__468_.coord_y = 7;
defparam syn__468_.coord_z = 2;
defparam syn__468_.mask = 16'h30CF;
defparam syn__468_.modeMux = 1'b0;
defparam syn__468_.FeedbackMux = 1'b0;
defparam syn__468_.ShiftMux = 1'b0;
defparam syn__468_.BypassEn = 1'b0;
defparam syn__468_.CarryEnb = 1'b1;

alta_slice syn__469_(
	.A(IOaddr[27]),
	.B(vcc),
	.C(\tc.IM [8]),
	.D(IOvalue[27]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__090_),
	.Cout(),
	.Q());
defparam syn__469_.coord_x = 5;
defparam syn__469_.coord_y = 7;
defparam syn__469_.coord_z = 15;
defparam syn__469_.mask = 16'h505F;
defparam syn__469_.modeMux = 1'b0;
defparam syn__469_.FeedbackMux = 1'b0;
defparam syn__469_.ShiftMux = 1'b0;
defparam syn__469_.BypassEn = 1'b0;
defparam syn__469_.CarryEnb = 1'b1;

alta_slice syn__470_(
	.A(\tc.IM [8]),
	.B(\tc.IM [7]),
	.C(IOaddr[26]),
	.D(IOvalue[26]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__091_),
	.Cout(),
	.Q());
defparam syn__470_.coord_x = 5;
defparam syn__470_.coord_y = 7;
defparam syn__470_.coord_z = 12;
defparam syn__470_.mask = 16'h9480;
defparam syn__470_.modeMux = 1'b0;
defparam syn__470_.FeedbackMux = 1'b0;
defparam syn__470_.ShiftMux = 1'b0;
defparam syn__470_.BypassEn = 1'b0;
defparam syn__470_.CarryEnb = 1'b1;

alta_slice syn__471_(
	.A(IOvalue[29]),
	.B(\tc.IM [8]),
	.C(IOaddr[29]),
	.D(\tc.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__092_),
	.Cout(),
	.Q());
defparam syn__471_.coord_x = 6;
defparam syn__471_.coord_y = 7;
defparam syn__471_.coord_z = 9;
defparam syn__471_.mask = 16'h100D;
defparam syn__471_.modeMux = 1'b0;
defparam syn__471_.FeedbackMux = 1'b0;
defparam syn__471_.ShiftMux = 1'b0;
defparam syn__471_.BypassEn = 1'b0;
defparam syn__471_.CarryEnb = 1'b1;

alta_slice syn__472_(
	.A(\tc.IM [8]),
	.B(IOaddr[28]),
	.C(vcc),
	.D(\tc.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__093_),
	.Cout(),
	.Q());
defparam syn__472_.coord_x = 4;
defparam syn__472_.coord_y = 7;
defparam syn__472_.coord_z = 4;
defparam syn__472_.mask = 16'h44BB;
defparam syn__472_.modeMux = 1'b0;
defparam syn__472_.FeedbackMux = 1'b0;
defparam syn__472_.ShiftMux = 1'b0;
defparam syn__472_.BypassEn = 1'b0;
defparam syn__472_.CarryEnb = 1'b1;

alta_slice syn__473_(
	.A(vcc),
	.B(\tc.IM [8]),
	.C(IOaddr[28]),
	.D(IOvalue[28]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__094_),
	.Cout(),
	.Q());
defparam syn__473_.coord_x = 6;
defparam syn__473_.coord_y = 7;
defparam syn__473_.coord_z = 14;
defparam syn__473_.mask = 16'h0C3F;
defparam syn__473_.modeMux = 1'b0;
defparam syn__473_.FeedbackMux = 1'b0;
defparam syn__473_.ShiftMux = 1'b0;
defparam syn__473_.BypassEn = 1'b0;
defparam syn__473_.CarryEnb = 1'b1;

alta_slice syn__474_(
	.A(IOaddr[30]),
	.B(IOvalue[30]),
	.C(\tc.IM [8]),
	.D(\tc.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__095_),
	.Cout(),
	.Q());
defparam syn__474_.coord_x = 6;
defparam syn__474_.coord_y = 7;
defparam syn__474_.coord_z = 11;
defparam syn__474_.mask = 16'hA408;
defparam syn__474_.modeMux = 1'b0;
defparam syn__474_.FeedbackMux = 1'b0;
defparam syn__474_.ShiftMux = 1'b0;
defparam syn__474_.BypassEn = 1'b0;
defparam syn__474_.CarryEnb = 1'b1;

alta_slice syn__475_(
	.A(IOaddr[30]),
	.B(IOvalue[30]),
	.C(\tc.IM [8]),
	.D(\tc.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__096_),
	.Cout(),
	.Q());
defparam syn__475_.coord_x = 6;
defparam syn__475_.coord_y = 7;
defparam syn__475_.coord_z = 4;
defparam syn__475_.mask = 16'h59A6;
defparam syn__475_.modeMux = 1'b0;
defparam syn__475_.FeedbackMux = 1'b0;
defparam syn__475_.ShiftMux = 1'b0;
defparam syn__475_.BypassEn = 1'b0;
defparam syn__475_.CarryEnb = 1'b1;

alta_slice syn__476_(
	.A(IOvalue[29]),
	.B(\tc.IM [7]),
	.C(IOaddr[29]),
	.D(\tc.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__097_),
	.Cout(),
	.Q());
defparam syn__476_.coord_x = 6;
defparam syn__476_.coord_y = 7;
defparam syn__476_.coord_z = 7;
defparam syn__476_.mask = 16'hC028;
defparam syn__476_.modeMux = 1'b0;
defparam syn__476_.FeedbackMux = 1'b0;
defparam syn__476_.ShiftMux = 1'b0;
defparam syn__476_.BypassEn = 1'b0;
defparam syn__476_.CarryEnb = 1'b1;

alta_slice syn__477_(
	.A(syn__099_),
	.B(IOaddr[31]),
	.C(IOvalue[31]),
	.D(syn__101_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__098_),
	.Cout(),
	.Q());
defparam syn__477_.coord_x = 6;
defparam syn__477_.coord_y = 8;
defparam syn__477_.coord_z = 0;
defparam syn__477_.mask = 16'h4155;
defparam syn__477_.modeMux = 1'b0;
defparam syn__477_.FeedbackMux = 1'b0;
defparam syn__477_.ShiftMux = 1'b0;
defparam syn__477_.BypassEn = 1'b0;
defparam syn__477_.CarryEnb = 1'b1;

alta_slice syn__478_(
	.A(IOvalue[31]),
	.B(IOaddr[31]),
	.C(syn__100_),
	.D(\tc.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__099_),
	.Cout(),
	.Q());
defparam syn__478_.coord_x = 6;
defparam syn__478_.coord_y = 8;
defparam syn__478_.coord_z = 1;
defparam syn__478_.mask = 16'hE080;
defparam syn__478_.modeMux = 1'b0;
defparam syn__478_.FeedbackMux = 1'b0;
defparam syn__478_.ShiftMux = 1'b0;
defparam syn__478_.BypassEn = 1'b0;
defparam syn__478_.CarryEnb = 1'b1;

alta_slice syn__479_(
	.A(\tc.IM [8]),
	.B(vcc),
	.C(vcc),
	.D(\tc.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__100_),
	.Cout(),
	.Q());
defparam syn__479_.coord_x = 4;
defparam syn__479_.coord_y = 7;
defparam syn__479_.coord_z = 0;
defparam syn__479_.mask = 16'h5500;
defparam syn__479_.modeMux = 1'b0;
defparam syn__479_.FeedbackMux = 1'b0;
defparam syn__479_.ShiftMux = 1'b0;
defparam syn__479_.BypassEn = 1'b0;
defparam syn__479_.CarryEnb = 1'b1;

alta_slice syn__480_(
	.A(\tc.IM [8]),
	.B(\tc.IM [9]),
	.C(vcc),
	.D(\tc.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__101_),
	.Cout(),
	.Q());
defparam syn__480_.coord_x = 4;
defparam syn__480_.coord_y = 7;
defparam syn__480_.coord_z = 13;
defparam syn__480_.mask = 16'h8800;
defparam syn__480_.modeMux = 1'b0;
defparam syn__480_.FeedbackMux = 1'b0;
defparam syn__480_.ShiftMux = 1'b0;
defparam syn__480_.BypassEn = 1'b0;
defparam syn__480_.CarryEnb = 1'b1;

alta_slice syn__481_(
	.A(IOvalue[31]),
	.B(IOaddr[31]),
	.C(\tc.IM [8]),
	.D(\tc.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__102_),
	.Cout(),
	.Q());
defparam syn__481_.coord_x = 4;
defparam syn__481_.coord_y = 4;
defparam syn__481_.coord_z = 4;
defparam syn__481_.mask = 16'hC639;
defparam syn__481_.modeMux = 1'b0;
defparam syn__481_.FeedbackMux = 1'b0;
defparam syn__481_.ShiftMux = 1'b0;
defparam syn__481_.BypassEn = 1'b0;
defparam syn__481_.CarryEnb = 1'b1;

alta_slice syn__482_(
	.A(vcc),
	.B(syn__104_),
	.C(syn__106_),
	.D(\tc.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__103_),
	.Cout(),
	.Q());
defparam syn__482_.coord_x = 6;
defparam syn__482_.coord_y = 4;
defparam syn__482_.coord_z = 6;
defparam syn__482_.mask = 16'hF030;
defparam syn__482_.modeMux = 1'b0;
defparam syn__482_.FeedbackMux = 1'b0;
defparam syn__482_.ShiftMux = 1'b0;
defparam syn__482_.BypassEn = 1'b0;
defparam syn__482_.CarryEnb = 1'b1;

alta_slice syn__483_(
	.A(syn__082_),
	.B(syn__081_),
	.C(syn__023_),
	.D(syn__105_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__104_),
	.Cout(),
	.Q());
defparam syn__483_.coord_x = 6;
defparam syn__483_.coord_y = 5;
defparam syn__483_.coord_z = 8;
defparam syn__483_.mask = 16'hE817;
defparam syn__483_.modeMux = 1'b0;
defparam syn__483_.FeedbackMux = 1'b0;
defparam syn__483_.ShiftMux = 1'b0;
defparam syn__483_.BypassEn = 1'b0;
defparam syn__483_.CarryEnb = 1'b1;

alta_slice syn__484_(
	.A(vcc),
	.B(vcc),
	.C(syn__085_),
	.D(syn__080_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__105_),
	.Cout(),
	.Q());
defparam syn__484_.coord_x = 6;
defparam syn__484_.coord_y = 5;
defparam syn__484_.coord_z = 15;
defparam syn__484_.mask = 16'h000F;
defparam syn__484_.modeMux = 1'b0;
defparam syn__484_.FeedbackMux = 1'b0;
defparam syn__484_.ShiftMux = 1'b0;
defparam syn__484_.BypassEn = 1'b0;
defparam syn__484_.CarryEnb = 1'b1;

alta_slice syn__485_(
	.A(syn__107_),
	.B(IOaddr[23]),
	.C(IOvalue[23]),
	.D(syn__101_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__106_),
	.Cout(),
	.Q());
defparam syn__485_.coord_x = 6;
defparam syn__485_.coord_y = 8;
defparam syn__485_.coord_z = 15;
defparam syn__485_.mask = 16'h4155;
defparam syn__485_.modeMux = 1'b0;
defparam syn__485_.FeedbackMux = 1'b0;
defparam syn__485_.ShiftMux = 1'b0;
defparam syn__485_.BypassEn = 1'b0;
defparam syn__485_.CarryEnb = 1'b1;

alta_slice syn__486_(
	.A(IOvalue[23]),
	.B(IOaddr[23]),
	.C(syn__100_),
	.D(\tc.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__107_),
	.Cout(),
	.Q());
defparam syn__486_.coord_x = 6;
defparam syn__486_.coord_y = 8;
defparam syn__486_.coord_z = 14;
defparam syn__486_.mask = 16'hE080;
defparam syn__486_.modeMux = 1'b0;
defparam syn__486_.FeedbackMux = 1'b0;
defparam syn__486_.ShiftMux = 1'b0;
defparam syn__486_.BypassEn = 1'b0;
defparam syn__486_.CarryEnb = 1'b1;

alta_slice syn__487_(
	.A(vcc),
	.B(vcc),
	.C(syn__069_),
	.D(syn__068_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__108_),
	.Cout(),
	.Q());
defparam syn__487_.coord_x = 7;
defparam syn__487_.coord_y = 8;
defparam syn__487_.coord_z = 5;
defparam syn__487_.mask = 16'h0FF0;
defparam syn__487_.modeMux = 1'b0;
defparam syn__487_.FeedbackMux = 1'b0;
defparam syn__487_.ShiftMux = 1'b0;
defparam syn__487_.BypassEn = 1'b0;
defparam syn__487_.CarryEnb = 1'b1;

alta_slice syn__488_(
	.A(syn__067_),
	.B(syn__110_),
	.C(syn__028_),
	.D(\tc.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__109_),
	.Cout(),
	.Q());
defparam syn__488_.coord_x = 5;
defparam syn__488_.coord_y = 6;
defparam syn__488_.coord_z = 11;
defparam syn__488_.mask = 16'h0036;
defparam syn__488_.modeMux = 1'b0;
defparam syn__488_.FeedbackMux = 1'b0;
defparam syn__488_.ShiftMux = 1'b0;
defparam syn__488_.BypassEn = 1'b0;
defparam syn__488_.CarryEnb = 1'b1;

alta_slice syn__489_(
	.A(vcc),
	.B(vcc),
	.C(syn__065_),
	.D(syn__066_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__110_),
	.Cout(),
	.Q());
defparam syn__489_.coord_x = 5;
defparam syn__489_.coord_y = 6;
defparam syn__489_.coord_z = 1;
defparam syn__489_.mask = 16'h0FF0;
defparam syn__489_.modeMux = 1'b0;
defparam syn__489_.FeedbackMux = 1'b0;
defparam syn__489_.ShiftMux = 1'b0;
defparam syn__489_.BypassEn = 1'b0;
defparam syn__489_.CarryEnb = 1'b1;

alta_slice syn__490_(
	.A(vcc),
	.B(vcc),
	.C(\tc.IM [6]),
	.D(\tc.IM [5]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__111_),
	.Cout(),
	.Q());
defparam syn__490_.coord_x = 5;
defparam syn__490_.coord_y = 3;
defparam syn__490_.coord_z = 6;
defparam syn__490_.mask = 16'h00F0;
defparam syn__490_.modeMux = 1'b0;
defparam syn__490_.FeedbackMux = 1'b0;
defparam syn__490_.ShiftMux = 1'b0;
defparam syn__490_.BypassEn = 1'b0;
defparam syn__490_.CarryEnb = 1'b1;

alta_slice syn__491_(
	.A(vcc),
	.B(vcc),
	.C(\tc.IM [6]),
	.D(\tc.IM [5]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__112_),
	.Cout(),
	.Q());
defparam syn__491_.coord_x = 5;
defparam syn__491_.coord_y = 3;
defparam syn__491_.coord_z = 5;
defparam syn__491_.mask = 16'hF000;
defparam syn__491_.modeMux = 1'b0;
defparam syn__491_.FeedbackMux = 1'b0;
defparam syn__491_.ShiftMux = 1'b0;
defparam syn__491_.BypassEn = 1'b0;
defparam syn__491_.CarryEnb = 1'b1;

alta_slice syn__492_(
	.A(syn__114_),
	.B(syn__223_),
	.C(syn__236_),
	.D(syn__365_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__113_),
	.Cout(),
	.Q());
defparam syn__492_.coord_x = 2;
defparam syn__492_.coord_y = 3;
defparam syn__492_.coord_z = 4;
defparam syn__492_.mask = 16'h8000;
defparam syn__492_.modeMux = 1'b0;
defparam syn__492_.FeedbackMux = 1'b0;
defparam syn__492_.ShiftMux = 1'b0;
defparam syn__492_.BypassEn = 1'b0;
defparam syn__492_.CarryEnb = 1'b1;

alta_slice syn__493_(
	.A(syn__134_),
	.B(syn__128_),
	.C(syn__115_),
	.D(syn__219_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__114_),
	.Cout(),
	.Q());
defparam syn__493_.coord_x = 6;
defparam syn__493_.coord_y = 3;
defparam syn__493_.coord_z = 4;
defparam syn__493_.mask = 16'h8000;
defparam syn__493_.modeMux = 1'b0;
defparam syn__493_.FeedbackMux = 1'b0;
defparam syn__493_.ShiftMux = 1'b0;
defparam syn__493_.BypassEn = 1'b0;
defparam syn__493_.CarryEnb = 1'b1;

alta_slice syn__494_(
	.A(syn__117_),
	.B(syn__319_),
	.C(syn__123_),
	.D(syn__127_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__115_),
	.Cout(),
	.Q());
defparam syn__494_.coord_x = 6;
defparam syn__494_.coord_y = 3;
defparam syn__494_.coord_z = 10;
defparam syn__494_.mask = 16'h4050;
defparam syn__494_.modeMux = 1'b0;
defparam syn__494_.FeedbackMux = 1'b0;
defparam syn__494_.ShiftMux = 1'b0;
defparam syn__494_.BypassEn = 1'b0;
defparam syn__494_.CarryEnb = 1'b1;

alta_slice syn__495_(
	.A(vcc),
	.B(vcc),
	.C(syn__093_),
	.D(syn__094_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__116_),
	.Cout(),
	.Q());
defparam syn__495_.coord_x = 6;
defparam syn__495_.coord_y = 7;
defparam syn__495_.coord_z = 15;
defparam syn__495_.mask = 16'h0FF0;
defparam syn__495_.modeMux = 1'b0;
defparam syn__495_.FeedbackMux = 1'b0;
defparam syn__495_.ShiftMux = 1'b0;
defparam syn__495_.BypassEn = 1'b0;
defparam syn__495_.CarryEnb = 1'b1;

alta_slice syn__496_(
	.A(vcc),
	.B(syn__118_),
	.C(syn__122_),
	.D(syn__120_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__117_),
	.Cout(),
	.Q());
defparam syn__496_.coord_x = 6;
defparam syn__496_.coord_y = 3;
defparam syn__496_.coord_z = 8;
defparam syn__496_.mask = 16'hC0F0;
defparam syn__496_.modeMux = 1'b0;
defparam syn__496_.FeedbackMux = 1'b0;
defparam syn__496_.ShiftMux = 1'b0;
defparam syn__496_.BypassEn = 1'b0;
defparam syn__496_.CarryEnb = 1'b1;

alta_slice syn__497_(
	.A(syn__020_),
	.B(syn__119_),
	.C(syn__091_),
	.D(\tc.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__118_),
	.Cout(),
	.Q());
defparam syn__497_.coord_x = 5;
defparam syn__497_.coord_y = 7;
defparam syn__497_.coord_z = 13;
defparam syn__497_.mask = 16'h0036;
defparam syn__497_.modeMux = 1'b0;
defparam syn__497_.FeedbackMux = 1'b0;
defparam syn__497_.ShiftMux = 1'b0;
defparam syn__497_.BypassEn = 1'b0;
defparam syn__497_.CarryEnb = 1'b1;

alta_slice syn__498_(
	.A(vcc),
	.B(syn__089_),
	.C(vcc),
	.D(syn__090_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__119_),
	.Cout(),
	.Q());
defparam syn__498_.coord_x = 5;
defparam syn__498_.coord_y = 7;
defparam syn__498_.coord_z = 11;
defparam syn__498_.mask = 16'h33CC;
defparam syn__498_.modeMux = 1'b0;
defparam syn__498_.FeedbackMux = 1'b0;
defparam syn__498_.ShiftMux = 1'b0;
defparam syn__498_.BypassEn = 1'b0;
defparam syn__498_.CarryEnb = 1'b1;

alta_slice syn__499_(
	.A(syn__121_),
	.B(IOvalue[27]),
	.C(IOaddr[27]),
	.D(syn__101_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__120_),
	.Cout(),
	.Q());
defparam syn__499_.coord_x = 6;
defparam syn__499_.coord_y = 8;
defparam syn__499_.coord_z = 4;
defparam syn__499_.mask = 16'h4155;
defparam syn__499_.modeMux = 1'b0;
defparam syn__499_.FeedbackMux = 1'b0;
defparam syn__499_.ShiftMux = 1'b0;
defparam syn__499_.BypassEn = 1'b0;
defparam syn__499_.CarryEnb = 1'b1;

alta_slice syn__500_(
	.A(IOaddr[27]),
	.B(IOvalue[27]),
	.C(syn__100_),
	.D(\tc.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__121_),
	.Cout(),
	.Q());
defparam syn__500_.coord_x = 6;
defparam syn__500_.coord_y = 8;
defparam syn__500_.coord_z = 5;
defparam syn__500_.mask = 16'hE080;
defparam syn__500_.modeMux = 1'b0;
defparam syn__500_.FeedbackMux = 1'b0;
defparam syn__500_.ShiftMux = 1'b0;
defparam syn__500_.BypassEn = 1'b0;
defparam syn__500_.CarryEnb = 1'b1;

alta_slice syn__501_(
	.A(vcc),
	.B(vcc),
	.C(\tc.IM [6]),
	.D(\tc.IM [5]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__122_),
	.Cout(),
	.Q());
defparam syn__501_.coord_x = 4;
defparam syn__501_.coord_y = 4;
defparam syn__501_.coord_z = 13;
defparam syn__501_.mask = 16'h000F;
defparam syn__501_.modeMux = 1'b0;
defparam syn__501_.FeedbackMux = 1'b0;
defparam syn__501_.ShiftMux = 1'b0;
defparam syn__501_.BypassEn = 1'b0;
defparam syn__501_.CarryEnb = 1'b1;

alta_slice syn__502_(
	.A(syn__323_),
	.B(\tc.IM [6]),
	.C(syn__321_),
	.D(\tc.IM [5]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__123_),
	.Cout(),
	.Q());
defparam syn__502_.coord_x = 5;
defparam syn__502_.coord_y = 3;
defparam syn__502_.coord_z = 10;
defparam syn__502_.mask = 16'hF3BB;
defparam syn__502_.modeMux = 1'b0;
defparam syn__502_.FeedbackMux = 1'b0;
defparam syn__502_.ShiftMux = 1'b0;
defparam syn__502_.BypassEn = 1'b0;
defparam syn__502_.CarryEnb = 1'b1;

alta_slice syn__503_(
	.A(syn__057_),
	.B(vcc),
	.C(syn__031_),
	.D(syn__058_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__124_),
	.Cout(),
	.Q());
defparam syn__503_.coord_x = 4;
defparam syn__503_.coord_y = 6;
defparam syn__503_.coord_z = 2;
defparam syn__503_.mask = 16'hFAA0;
defparam syn__503_.modeMux = 1'b0;
defparam syn__503_.FeedbackMux = 1'b0;
defparam syn__503_.ShiftMux = 1'b0;
defparam syn__503_.BypassEn = 1'b0;
defparam syn__503_.CarryEnb = 1'b1;

alta_slice syn__504_(
	.A(vcc),
	.B(syn__056_),
	.C(vcc),
	.D(syn__061_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__125_),
	.Cout(),
	.Q());
defparam syn__504_.coord_x = 4;
defparam syn__504_.coord_y = 6;
defparam syn__504_.coord_z = 0;
defparam syn__504_.mask = 16'h0033;
defparam syn__504_.modeMux = 1'b0;
defparam syn__504_.FeedbackMux = 1'b0;
defparam syn__504_.ShiftMux = 1'b0;
defparam syn__504_.BypassEn = 1'b0;
defparam syn__504_.CarryEnb = 1'b1;

alta_slice syn__505_(
	.A(syn__042_),
	.B(\tc.IM [9]),
	.C(syn__036_),
	.D(syn__043_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__126_),
	.Cout(),
	.Q());
defparam syn__505_.coord_x = 4;
defparam syn__505_.coord_y = 5;
defparam syn__505_.coord_z = 7;
defparam syn__505_.mask = 16'h0132;
defparam syn__505_.modeMux = 1'b0;
defparam syn__505_.FeedbackMux = 1'b0;
defparam syn__505_.ShiftMux = 1'b0;
defparam syn__505_.BypassEn = 1'b0;
defparam syn__505_.CarryEnb = 1'b1;

alta_slice syn__506_(
	.A(vcc),
	.B(vcc),
	.C(\tc.IM [6]),
	.D(\tc.IM [5]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__127_),
	.Cout(),
	.Q());
defparam syn__506_.coord_x = 5;
defparam syn__506_.coord_y = 3;
defparam syn__506_.coord_z = 13;
defparam syn__506_.mask = 16'h0F00;
defparam syn__506_.modeMux = 1'b0;
defparam syn__506_.FeedbackMux = 1'b0;
defparam syn__506_.ShiftMux = 1'b0;
defparam syn__506_.BypassEn = 1'b0;
defparam syn__506_.CarryEnb = 1'b1;

alta_slice syn__507_(
	.A(syn__111_),
	.B(vcc),
	.C(syn__129_),
	.D(syn__130_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__128_),
	.Cout(),
	.Q());
defparam syn__507_.coord_x = 7;
defparam syn__507_.coord_y = 3;
defparam syn__507_.coord_z = 7;
defparam syn__507_.mask = 16'hF500;
defparam syn__507_.modeMux = 1'b0;
defparam syn__507_.FeedbackMux = 1'b0;
defparam syn__507_.ShiftMux = 1'b0;
defparam syn__507_.BypassEn = 1'b0;
defparam syn__507_.CarryEnb = 1'b1;

alta_slice syn__508_(
	.A(vcc),
	.B(syn__118_),
	.C(vcc),
	.D(syn__120_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__129_),
	.Cout(),
	.Q());
defparam syn__508_.coord_x = 6;
defparam syn__508_.coord_y = 3;
defparam syn__508_.coord_z = 12;
defparam syn__508_.mask = 16'h3300;
defparam syn__508_.modeMux = 1'b0;
defparam syn__508_.FeedbackMux = 1'b0;
defparam syn__508_.ShiftMux = 1'b0;
defparam syn__508_.BypassEn = 1'b0;
defparam syn__508_.CarryEnb = 1'b1;

alta_slice syn__509_(
	.A(syn__132_),
	.B(vcc),
	.C(syn__325_),
	.D(syn__127_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__130_),
	.Cout(),
	.Q());
defparam syn__509_.coord_x = 5;
defparam syn__509_.coord_y = 2;
defparam syn__509_.coord_z = 1;
defparam syn__509_.mask = 16'hA0AA;
defparam syn__509_.modeMux = 1'b0;
defparam syn__509_.FeedbackMux = 1'b0;
defparam syn__509_.ShiftMux = 1'b0;
defparam syn__509_.BypassEn = 1'b0;
defparam syn__509_.CarryEnb = 1'b1;

alta_slice syn__510_(
	.A(syn__025_),
	.B(syn__074_),
	.C(syn__075_),
	.D(syn__076_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__131_),
	.Cout(),
	.Q());
defparam syn__510_.coord_x = 6;
defparam syn__510_.coord_y = 6;
defparam syn__510_.coord_z = 2;
defparam syn__510_.mask = 16'h3C39;
defparam syn__510_.modeMux = 1'b0;
defparam syn__510_.FeedbackMux = 1'b0;
defparam syn__510_.ShiftMux = 1'b0;
defparam syn__510_.BypassEn = 1'b0;
defparam syn__510_.CarryEnb = 1'b1;

alta_slice syn__511_(
	.A(syn__323_),
	.B(syn__327_),
	.C(syn__112_),
	.D(syn__122_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__132_),
	.Cout(),
	.Q());
defparam syn__511_.coord_x = 5;
defparam syn__511_.coord_y = 2;
defparam syn__511_.coord_z = 10;
defparam syn__511_.mask = 16'h8CAF;
defparam syn__511_.modeMux = 1'b0;
defparam syn__511_.FeedbackMux = 1'b0;
defparam syn__511_.ShiftMux = 1'b0;
defparam syn__511_.BypassEn = 1'b0;
defparam syn__511_.CarryEnb = 1'b1;

alta_slice syn__512_(
	.A(vcc),
	.B(vcc),
	.C(syn__075_),
	.D(syn__076_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__133_),
	.Cout(),
	.Q());
defparam syn__512_.coord_x = 6;
defparam syn__512_.coord_y = 6;
defparam syn__512_.coord_z = 15;
defparam syn__512_.mask = 16'h000F;
defparam syn__512_.modeMux = 1'b0;
defparam syn__512_.FeedbackMux = 1'b0;
defparam syn__512_.ShiftMux = 1'b0;
defparam syn__512_.BypassEn = 1'b0;
defparam syn__512_.CarryEnb = 1'b1;

alta_slice syn__513_(
	.A(syn__329_),
	.B(syn__141_),
	.C(syn__359_),
	.D(syn__361_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__134_),
	.Cout(),
	.Q());
defparam syn__513_.coord_x = 4;
defparam syn__513_.coord_y = 3;
defparam syn__513_.coord_z = 5;
defparam syn__513_.mask = 16'h8000;
defparam syn__513_.modeMux = 1'b0;
defparam syn__513_.FeedbackMux = 1'b0;
defparam syn__513_.ShiftMux = 1'b0;
defparam syn__513_.BypassEn = 1'b0;
defparam syn__513_.CarryEnb = 1'b1;

alta_slice syn__514_(
	.A(syn__021_),
	.B(syn__086_),
	.C(syn__087_),
	.D(syn__088_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__135_),
	.Cout(),
	.Q());
defparam syn__514_.coord_x = 5;
defparam syn__514_.coord_y = 7;
defparam syn__514_.coord_z = 5;
defparam syn__514_.mask = 16'h3C39;
defparam syn__514_.modeMux = 1'b0;
defparam syn__514_.FeedbackMux = 1'b0;
defparam syn__514_.ShiftMux = 1'b0;
defparam syn__514_.BypassEn = 1'b0;
defparam syn__514_.CarryEnb = 1'b1;

alta_slice syn__515_(
	.A(syn__138_),
	.B(\tc.IM [9]),
	.C(syn__072_),
	.D(syn__137_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__136_),
	.Cout(),
	.Q());
defparam syn__515_.coord_x = 7;
defparam syn__515_.coord_y = 8;
defparam syn__515_.coord_z = 9;
defparam syn__515_.mask = 16'h8AA8;
defparam syn__515_.modeMux = 1'b0;
defparam syn__515_.FeedbackMux = 1'b0;
defparam syn__515_.ShiftMux = 1'b0;
defparam syn__515_.BypassEn = 1'b0;
defparam syn__515_.CarryEnb = 1'b1;

alta_slice syn__516_(
	.A(vcc),
	.B(vcc),
	.C(syn__026_),
	.D(syn__073_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__137_),
	.Cout(),
	.Q());
defparam syn__516_.coord_x = 7;
defparam syn__516_.coord_y = 8;
defparam syn__516_.coord_z = 7;
defparam syn__516_.mask = 16'h000F;
defparam syn__516_.modeMux = 1'b0;
defparam syn__516_.FeedbackMux = 1'b0;
defparam syn__516_.ShiftMux = 1'b0;
defparam syn__516_.BypassEn = 1'b0;
defparam syn__516_.CarryEnb = 1'b1;

alta_slice syn__517_(
	.A(IOvalue[18]),
	.B(syn__139_),
	.C(IOaddr[18]),
	.D(syn__101_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__138_),
	.Cout(),
	.Q());
defparam syn__517_.coord_x = 6;
defparam syn__517_.coord_y = 8;
defparam syn__517_.coord_z = 6;
defparam syn__517_.mask = 16'h2133;
defparam syn__517_.modeMux = 1'b0;
defparam syn__517_.FeedbackMux = 1'b0;
defparam syn__517_.ShiftMux = 1'b0;
defparam syn__517_.BypassEn = 1'b0;
defparam syn__517_.CarryEnb = 1'b1;

alta_slice syn__518_(
	.A(IOaddr[18]),
	.B(syn__100_),
	.C(IOvalue[18]),
	.D(\tc.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__139_),
	.Cout(),
	.Q());
defparam syn__518_.coord_x = 6;
defparam syn__518_.coord_y = 8;
defparam syn__518_.coord_z = 13;
defparam syn__518_.mask = 16'hC880;
defparam syn__518_.modeMux = 1'b0;
defparam syn__518_.FeedbackMux = 1'b0;
defparam syn__518_.ShiftMux = 1'b0;
defparam syn__518_.BypassEn = 1'b0;
defparam syn__518_.CarryEnb = 1'b1;

alta_slice syn__519_(
	.A(vcc),
	.B(vcc),
	.C(syn__057_),
	.D(syn__058_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__140_),
	.Cout(),
	.Q());
defparam syn__519_.coord_x = 4;
defparam syn__519_.coord_y = 6;
defparam syn__519_.coord_z = 4;
defparam syn__519_.mask = 16'h0FF0;
defparam syn__519_.modeMux = 1'b0;
defparam syn__519_.FeedbackMux = 1'b0;
defparam syn__519_.ShiftMux = 1'b0;
defparam syn__519_.BypassEn = 1'b0;
defparam syn__519_.CarryEnb = 1'b1;

alta_slice syn__520_(
	.A(syn__213_),
	.B(syn__216_),
	.C(syn__142_),
	.D(syn__152_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__141_),
	.Cout(),
	.Q());
defparam syn__520_.coord_x = 2;
defparam syn__520_.coord_y = 3;
defparam syn__520_.coord_z = 0;
defparam syn__520_.mask = 16'h8000;
defparam syn__520_.modeMux = 1'b0;
defparam syn__520_.FeedbackMux = 1'b0;
defparam syn__520_.ShiftMux = 1'b0;
defparam syn__520_.BypassEn = 1'b0;
defparam syn__520_.CarryEnb = 1'b1;

alta_slice syn__521_(
	.A(syn__144_),
	.B(vcc),
	.C(syn__335_),
	.D(syn__112_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__142_),
	.Cout(),
	.Q());
defparam syn__521_.coord_x = 7;
defparam syn__521_.coord_y = 3;
defparam syn__521_.coord_z = 13;
defparam syn__521_.mask = 16'hA0AA;
defparam syn__521_.modeMux = 1'b0;
defparam syn__521_.FeedbackMux = 1'b0;
defparam syn__521_.ShiftMux = 1'b0;
defparam syn__521_.BypassEn = 1'b0;
defparam syn__521_.CarryEnb = 1'b1;

alta_slice syn__522_(
	.A(vcc),
	.B(vcc),
	.C(syn__087_),
	.D(syn__088_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__143_),
	.Cout(),
	.Q());
defparam syn__522_.coord_x = 5;
defparam syn__522_.coord_y = 7;
defparam syn__522_.coord_z = 2;
defparam syn__522_.mask = 16'h000F;
defparam syn__522_.modeMux = 1'b0;
defparam syn__522_.FeedbackMux = 1'b0;
defparam syn__522_.ShiftMux = 1'b0;
defparam syn__522_.BypassEn = 1'b0;
defparam syn__522_.CarryEnb = 1'b1;

alta_slice syn__523_(
	.A(syn__111_),
	.B(vcc),
	.C(syn__149_),
	.D(syn__145_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__144_),
	.Cout(),
	.Q());
defparam syn__523_.coord_x = 7;
defparam syn__523_.coord_y = 3;
defparam syn__523_.coord_z = 4;
defparam syn__523_.mask = 16'hF050;
defparam syn__523_.modeMux = 1'b0;
defparam syn__523_.FeedbackMux = 1'b0;
defparam syn__523_.ShiftMux = 1'b0;
defparam syn__523_.BypassEn = 1'b0;
defparam syn__523_.CarryEnb = 1'b1;

alta_slice syn__524_(
	.A(\tc.IM [9]),
	.B(syn__146_),
	.C(syn__147_),
	.D(syn__070_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__145_),
	.Cout(),
	.Q());
defparam syn__524_.coord_x = 7;
defparam syn__524_.coord_y = 8;
defparam syn__524_.coord_z = 0;
defparam syn__524_.mask = 16'hB0E0;
defparam syn__524_.modeMux = 1'b0;
defparam syn__524_.FeedbackMux = 1'b0;
defparam syn__524_.ShiftMux = 1'b0;
defparam syn__524_.BypassEn = 1'b0;
defparam syn__524_.CarryEnb = 1'b1;

alta_slice syn__525_(
	.A(syn__069_),
	.B(vcc),
	.C(syn__027_),
	.D(syn__068_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__146_),
	.Cout(),
	.Q());
defparam syn__525_.coord_x = 7;
defparam syn__525_.coord_y = 8;
defparam syn__525_.coord_z = 13;
defparam syn__525_.mask = 16'hFAA0;
defparam syn__525_.modeMux = 1'b0;
defparam syn__525_.FeedbackMux = 1'b0;
defparam syn__525_.ShiftMux = 1'b0;
defparam syn__525_.BypassEn = 1'b0;
defparam syn__525_.CarryEnb = 1'b1;

alta_slice syn__526_(
	.A(IOaddr[17]),
	.B(syn__101_),
	.C(IOvalue[17]),
	.D(syn__148_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__147_),
	.Cout(),
	.Q());
defparam syn__526_.coord_x = 6;
defparam syn__526_.coord_y = 8;
defparam syn__526_.coord_z = 8;
defparam syn__526_.mask = 16'h00B7;
defparam syn__526_.modeMux = 1'b0;
defparam syn__526_.FeedbackMux = 1'b0;
defparam syn__526_.ShiftMux = 1'b0;
defparam syn__526_.BypassEn = 1'b0;
defparam syn__526_.CarryEnb = 1'b1;

alta_slice syn__527_(
	.A(IOaddr[17]),
	.B(IOvalue[17]),
	.C(syn__100_),
	.D(\tc.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__148_),
	.Cout(),
	.Q());
defparam syn__527_.coord_x = 6;
defparam syn__527_.coord_y = 8;
defparam syn__527_.coord_z = 11;
defparam syn__527_.mask = 16'hE080;
defparam syn__527_.modeMux = 1'b0;
defparam syn__527_.FeedbackMux = 1'b0;
defparam syn__527_.ShiftMux = 1'b0;
defparam syn__527_.BypassEn = 1'b0;
defparam syn__527_.CarryEnb = 1'b1;

alta_slice syn__528_(
	.A(syn__127_),
	.B(syn__337_),
	.C(syn__333_),
	.D(syn__122_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__149_),
	.Cout(),
	.Q());
defparam syn__528_.coord_x = 5;
defparam syn__528_.coord_y = 2;
defparam syn__528_.coord_z = 2;
defparam syn__528_.mask = 16'hC4F5;
defparam syn__528_.modeMux = 1'b0;
defparam syn__528_.FeedbackMux = 1'b0;
defparam syn__528_.ShiftMux = 1'b0;
defparam syn__528_.BypassEn = 1'b0;
defparam syn__528_.CarryEnb = 1'b1;

alta_slice syn__529_(
	.A(\tc.IM [9]),
	.B(syn__151_),
	.C(syn__032_),
	.D(syn__055_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__150_),
	.Cout(),
	.Q());
defparam syn__529_.coord_x = 5;
defparam syn__529_.coord_y = 8;
defparam syn__529_.coord_z = 8;
defparam syn__529_.mask = 16'h1114;
defparam syn__529_.modeMux = 1'b0;
defparam syn__529_.FeedbackMux = 1'b0;
defparam syn__529_.ShiftMux = 1'b0;
defparam syn__529_.BypassEn = 1'b0;
defparam syn__529_.CarryEnb = 1'b1;

alta_slice syn__530_(
	.A(vcc),
	.B(vcc),
	.C(syn__053_),
	.D(syn__054_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__151_),
	.Cout(),
	.Q());
defparam syn__530_.coord_x = 5;
defparam syn__530_.coord_y = 8;
defparam syn__530_.coord_z = 3;
defparam syn__530_.mask = 16'h0FF0;
defparam syn__530_.modeMux = 1'b0;
defparam syn__530_.FeedbackMux = 1'b0;
defparam syn__530_.ShiftMux = 1'b0;
defparam syn__530_.BypassEn = 1'b0;
defparam syn__530_.CarryEnb = 1'b1;

alta_slice syn__531_(
	.A(syn__170_),
	.B(vcc),
	.C(syn__153_),
	.D(syn__163_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__152_),
	.Cout(),
	.Q());
defparam syn__531_.coord_x = 2;
defparam syn__531_.coord_y = 3;
defparam syn__531_.coord_z = 7;
defparam syn__531_.mask = 16'hA000;
defparam syn__531_.modeMux = 1'b0;
defparam syn__531_.FeedbackMux = 1'b0;
defparam syn__531_.ShiftMux = 1'b0;
defparam syn__531_.BypassEn = 1'b0;
defparam syn__531_.CarryEnb = 1'b1;

alta_slice syn__532_(
	.A(syn__154_),
	.B(syn__155_),
	.C(syn__161_),
	.D(syn__112_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__153_),
	.Cout(),
	.Q());
defparam syn__532_.coord_x = 7;
defparam syn__532_.coord_y = 3;
defparam syn__532_.coord_z = 0;
defparam syn__532_.mask = 16'h40CC;
defparam syn__532_.modeMux = 1'b0;
defparam syn__532_.FeedbackMux = 1'b0;
defparam syn__532_.ShiftMux = 1'b0;
defparam syn__532_.BypassEn = 1'b0;
defparam syn__532_.CarryEnb = 1'b1;

alta_slice syn__533_(
	.A(syn__022_),
	.B(syn__085_),
	.C(syn__084_),
	.D(\tc.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__154_),
	.Cout(),
	.Q());
defparam syn__533_.coord_x = 7;
defparam syn__533_.coord_y = 3;
defparam syn__533_.coord_z = 14;
defparam syn__533_.mask = 16'h001E;
defparam syn__533_.modeMux = 1'b0;
defparam syn__533_.FeedbackMux = 1'b0;
defparam syn__533_.ShiftMux = 1'b0;
defparam syn__533_.BypassEn = 1'b0;
defparam syn__533_.CarryEnb = 1'b1;

alta_slice syn__534_(
	.A(vcc),
	.B(syn__315_),
	.C(syn__111_),
	.D(syn__156_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__155_),
	.Cout(),
	.Q());
defparam syn__534_.coord_x = 7;
defparam syn__534_.coord_y = 3;
defparam syn__534_.coord_z = 5;
defparam syn__534_.mask = 16'hCF00;
defparam syn__534_.modeMux = 1'b0;
defparam syn__534_.FeedbackMux = 1'b0;
defparam syn__534_.ShiftMux = 1'b0;
defparam syn__534_.BypassEn = 1'b0;
defparam syn__534_.CarryEnb = 1'b1;

alta_slice syn__535_(
	.A(syn__157_),
	.B(syn__337_),
	.C(syn__122_),
	.D(syn__127_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__156_),
	.Cout(),
	.Q());
defparam syn__535_.coord_x = 5;
defparam syn__535_.coord_y = 2;
defparam syn__535_.coord_z = 12;
defparam syn__535_.mask = 16'h8CAF;
defparam syn__535_.modeMux = 1'b0;
defparam syn__535_.FeedbackMux = 1'b0;
defparam syn__535_.ShiftMux = 1'b0;
defparam syn__535_.BypassEn = 1'b0;
defparam syn__535_.CarryEnb = 1'b1;

alta_slice syn__536_(
	.A(syn__158_),
	.B(syn__159_),
	.C(syn__050_),
	.D(\tc.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__157_),
	.Cout(),
	.Q());
defparam syn__536_.coord_x = 6;
defparam syn__536_.coord_y = 6;
defparam syn__536_.coord_z = 6;
defparam syn__536_.mask = 16'hCC48;
defparam syn__536_.modeMux = 1'b0;
defparam syn__536_.FeedbackMux = 1'b0;
defparam syn__536_.ShiftMux = 1'b0;
defparam syn__536_.BypassEn = 1'b0;
defparam syn__536_.CarryEnb = 1'b1;

alta_slice syn__537_(
	.A(syn__051_),
	.B(vcc),
	.C(syn__033_),
	.D(syn__052_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__158_),
	.Cout(),
	.Q());
defparam syn__537_.coord_x = 5;
defparam syn__537_.coord_y = 8;
defparam syn__537_.coord_z = 14;
defparam syn__537_.mask = 16'h5550;
defparam syn__537_.modeMux = 1'b0;
defparam syn__537_.FeedbackMux = 1'b0;
defparam syn__537_.ShiftMux = 1'b0;
defparam syn__537_.BypassEn = 1'b0;
defparam syn__537_.CarryEnb = 1'b1;

alta_slice syn__538_(
	.A(syn__160_),
	.B(IOvalue[8]),
	.C(IOaddr[8]),
	.D(syn__101_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__159_),
	.Cout(),
	.Q());
defparam syn__538_.coord_x = 6;
defparam syn__538_.coord_y = 8;
defparam syn__538_.coord_z = 3;
defparam syn__538_.mask = 16'h4155;
defparam syn__538_.modeMux = 1'b0;
defparam syn__538_.FeedbackMux = 1'b0;
defparam syn__538_.ShiftMux = 1'b0;
defparam syn__538_.BypassEn = 1'b0;
defparam syn__538_.CarryEnb = 1'b1;

alta_slice syn__539_(
	.A(IOaddr[8]),
	.B(IOvalue[8]),
	.C(syn__100_),
	.D(\tc.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__160_),
	.Cout(),
	.Q());
defparam syn__539_.coord_x = 6;
defparam syn__539_.coord_y = 8;
defparam syn__539_.coord_z = 2;
defparam syn__539_.mask = 16'hE080;
defparam syn__539_.modeMux = 1'b0;
defparam syn__539_.FeedbackMux = 1'b0;
defparam syn__539_.ShiftMux = 1'b0;
defparam syn__539_.BypassEn = 1'b0;
defparam syn__539_.CarryEnb = 1'b1;

alta_slice syn__540_(
	.A(IOvalue[24]),
	.B(IOaddr[24]),
	.C(syn__101_),
	.D(syn__162_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__161_),
	.Cout(),
	.Q());
defparam syn__540_.coord_x = 5;
defparam syn__540_.coord_y = 7;
defparam syn__540_.coord_z = 4;
defparam syn__540_.mask = 16'h009F;
defparam syn__540_.modeMux = 1'b0;
defparam syn__540_.FeedbackMux = 1'b0;
defparam syn__540_.ShiftMux = 1'b0;
defparam syn__540_.BypassEn = 1'b0;
defparam syn__540_.CarryEnb = 1'b1;

alta_slice syn__541_(
	.A(IOvalue[24]),
	.B(\tc.IM [7]),
	.C(syn__100_),
	.D(IOaddr[24]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__162_),
	.Cout(),
	.Q());
defparam syn__541_.coord_x = 5;
defparam syn__541_.coord_y = 7;
defparam syn__541_.coord_z = 7;
defparam syn__541_.mask = 16'hE080;
defparam syn__541_.modeMux = 1'b0;
defparam syn__541_.FeedbackMux = 1'b0;
defparam syn__541_.ShiftMux = 1'b0;
defparam syn__541_.BypassEn = 1'b0;
defparam syn__541_.CarryEnb = 1'b1;

alta_slice syn__542_(
	.A(syn__154_),
	.B(syn__111_),
	.C(syn__161_),
	.D(syn__164_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__163_),
	.Cout(),
	.Q());
defparam syn__542_.coord_x = 7;
defparam syn__542_.coord_y = 3;
defparam syn__542_.coord_z = 9;
defparam syn__542_.mask = 16'h7300;
defparam syn__542_.modeMux = 1'b0;
defparam syn__542_.FeedbackMux = 1'b0;
defparam syn__542_.ShiftMux = 1'b0;
defparam syn__542_.BypassEn = 1'b0;
defparam syn__542_.CarryEnb = 1'b1;

alta_slice syn__543_(
	.A(vcc),
	.B(syn__145_),
	.C(syn__165_),
	.D(syn__127_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__164_),
	.Cout(),
	.Q());
defparam syn__543_.coord_x = 7;
defparam syn__543_.coord_y = 3;
defparam syn__543_.coord_z = 15;
defparam syn__543_.mask = 16'hC0F0;
defparam syn__543_.modeMux = 1'b0;
defparam syn__543_.FeedbackMux = 1'b0;
defparam syn__543_.ShiftMux = 1'b0;
defparam syn__543_.BypassEn = 1'b0;
defparam syn__543_.CarryEnb = 1'b1;

alta_slice syn__544_(
	.A(syn__166_),
	.B(syn__315_),
	.C(syn__122_),
	.D(syn__112_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__165_),
	.Cout(),
	.Q());
defparam syn__544_.coord_x = 5;
defparam syn__544_.coord_y = 4;
defparam syn__544_.coord_z = 5;
defparam syn__544_.mask = 16'h8ACF;
defparam syn__544_.modeMux = 1'b0;
defparam syn__544_.FeedbackMux = 1'b0;
defparam syn__544_.ShiftMux = 1'b0;
defparam syn__544_.BypassEn = 1'b0;
defparam syn__544_.CarryEnb = 1'b1;

alta_slice syn__545_(
	.A(\tc.IM [9]),
	.B(syn__167_),
	.C(syn__169_),
	.D(syn__039_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__166_),
	.Cout(),
	.Q());
defparam syn__545_.coord_x = 5;
defparam syn__545_.coord_y = 5;
defparam syn__545_.coord_z = 15;
defparam syn__545_.mask = 16'hCCC8;
defparam syn__545_.modeMux = 1'b0;
defparam syn__545_.FeedbackMux = 1'b0;
defparam syn__545_.ShiftMux = 1'b0;
defparam syn__545_.BypassEn = 1'b0;
defparam syn__545_.CarryEnb = 1'b1;

alta_slice syn__546_(
	.A(syn__168_),
	.B(IOaddr[0]),
	.C(IOvalue[0]),
	.D(syn__101_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__167_),
	.Cout(),
	.Q());
defparam syn__546_.coord_x = 5;
defparam syn__546_.coord_y = 5;
defparam syn__546_.coord_z = 11;
defparam syn__546_.mask = 16'h4155;
defparam syn__546_.modeMux = 1'b0;
defparam syn__546_.FeedbackMux = 1'b0;
defparam syn__546_.ShiftMux = 1'b0;
defparam syn__546_.BypassEn = 1'b0;
defparam syn__546_.CarryEnb = 1'b1;

alta_slice syn__547_(
	.A(IOvalue[0]),
	.B(IOaddr[0]),
	.C(syn__100_),
	.D(\tc.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__168_),
	.Cout(),
	.Q());
defparam syn__547_.coord_x = 5;
defparam syn__547_.coord_y = 5;
defparam syn__547_.coord_z = 10;
defparam syn__547_.mask = 16'hE080;
defparam syn__547_.modeMux = 1'b0;
defparam syn__547_.FeedbackMux = 1'b0;
defparam syn__547_.ShiftMux = 1'b0;
defparam syn__547_.BypassEn = 1'b0;
defparam syn__547_.CarryEnb = 1'b1;

alta_slice syn__548_(
	.A(IOvalue[0]),
	.B(IOaddr[0]),
	.C(\tc.IM [8]),
	.D(\tc.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__169_),
	.Cout(),
	.Q());
defparam syn__548_.coord_x = 5;
defparam syn__548_.coord_y = 5;
defparam syn__548_.coord_z = 0;
defparam syn__548_.mask = 16'h0401;
defparam syn__548_.modeMux = 1'b0;
defparam syn__548_.FeedbackMux = 1'b0;
defparam syn__548_.ShiftMux = 1'b0;
defparam syn__548_.BypassEn = 1'b0;
defparam syn__548_.CarryEnb = 1'b1;

alta_slice syn__549_(
	.A(syn__172_),
	.B(syn__183_),
	.C(syn__171_),
	.D(syn__211_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__170_),
	.Cout(),
	.Q());
defparam syn__549_.coord_x = 6;
defparam syn__549_.coord_y = 4;
defparam syn__549_.coord_z = 12;
defparam syn__549_.mask = 16'h0800;
defparam syn__549_.modeMux = 1'b0;
defparam syn__549_.FeedbackMux = 1'b0;
defparam syn__549_.ShiftMux = 1'b0;
defparam syn__549_.BypassEn = 1'b0;
defparam syn__549_.CarryEnb = 1'b1;

alta_slice syn__550_(
	.A(syn__106_),
	.B(syn__104_),
	.C(syn__112_),
	.D(\tc.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__171_),
	.Cout(),
	.Q());
defparam syn__550_.coord_x = 6;
defparam syn__550_.coord_y = 4;
defparam syn__550_.coord_z = 2;
defparam syn__550_.mask = 16'h50D0;
defparam syn__550_.modeMux = 1'b0;
defparam syn__550_.FeedbackMux = 1'b0;
defparam syn__550_.ShiftMux = 1'b0;
defparam syn__550_.BypassEn = 1'b0;
defparam syn__550_.CarryEnb = 1'b1;

alta_slice syn__551_(
	.A(vcc),
	.B(syn__339_),
	.C(syn__174_),
	.D(syn__112_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__172_),
	.Cout(),
	.Q());
defparam syn__551_.coord_x = 5;
defparam syn__551_.coord_y = 4;
defparam syn__551_.coord_z = 3;
defparam syn__551_.mask = 16'hC0F0;
defparam syn__551_.modeMux = 1'b0;
defparam syn__551_.FeedbackMux = 1'b0;
defparam syn__551_.ShiftMux = 1'b0;
defparam syn__551_.BypassEn = 1'b0;
defparam syn__551_.CarryEnb = 1'b1;

alta_slice syn__552_(
	.A(vcc),
	.B(vcc),
	.C(syn__081_),
	.D(syn__082_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__173_),
	.Cout(),
	.Q());
defparam syn__552_.coord_x = 6;
defparam syn__552_.coord_y = 5;
defparam syn__552_.coord_z = 0;
defparam syn__552_.mask = 16'h0FF0;
defparam syn__552_.modeMux = 1'b0;
defparam syn__552_.FeedbackMux = 1'b0;
defparam syn__552_.ShiftMux = 1'b0;
defparam syn__552_.BypassEn = 1'b0;
defparam syn__552_.CarryEnb = 1'b1;

alta_slice syn__553_(
	.A(vcc),
	.B(syn__175_),
	.C(syn__111_),
	.D(syn__179_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__174_),
	.Cout(),
	.Q());
defparam syn__553_.coord_x = 6;
defparam syn__553_.coord_y = 4;
defparam syn__553_.coord_z = 14;
defparam syn__553_.mask = 16'hCF00;
defparam syn__553_.modeMux = 1'b0;
defparam syn__553_.FeedbackMux = 1'b0;
defparam syn__553_.ShiftMux = 1'b0;
defparam syn__553_.BypassEn = 1'b0;
defparam syn__553_.CarryEnb = 1'b1;

alta_slice syn__554_(
	.A(syn__176_),
	.B(syn__177_),
	.C(syn__062_),
	.D(\tc.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__175_),
	.Cout(),
	.Q());
defparam syn__554_.coord_x = 6;
defparam syn__554_.coord_y = 6;
defparam syn__554_.coord_z = 7;
defparam syn__554_.mask = 16'hCC48;
defparam syn__554_.modeMux = 1'b0;
defparam syn__554_.FeedbackMux = 1'b0;
defparam syn__554_.ShiftMux = 1'b0;
defparam syn__554_.BypassEn = 1'b0;
defparam syn__554_.CarryEnb = 1'b1;

alta_slice syn__555_(
	.A(vcc),
	.B(syn__029_),
	.C(syn__063_),
	.D(syn__064_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__176_),
	.Cout(),
	.Q());
defparam syn__555_.coord_x = 5;
defparam syn__555_.coord_y = 6;
defparam syn__555_.coord_z = 15;
defparam syn__555_.mask = 16'h0F0C;
defparam syn__555_.modeMux = 1'b0;
defparam syn__555_.FeedbackMux = 1'b0;
defparam syn__555_.ShiftMux = 1'b0;
defparam syn__555_.BypassEn = 1'b0;
defparam syn__555_.CarryEnb = 1'b1;

alta_slice syn__556_(
	.A(IOaddr[14]),
	.B(syn__101_),
	.C(IOvalue[14]),
	.D(syn__178_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__177_),
	.Cout(),
	.Q());
defparam syn__556_.coord_x = 6;
defparam syn__556_.coord_y = 8;
defparam syn__556_.coord_z = 12;
defparam syn__556_.mask = 16'h00B7;
defparam syn__556_.modeMux = 1'b0;
defparam syn__556_.FeedbackMux = 1'b0;
defparam syn__556_.ShiftMux = 1'b0;
defparam syn__556_.BypassEn = 1'b0;
defparam syn__556_.CarryEnb = 1'b1;

alta_slice syn__557_(
	.A(IOaddr[14]),
	.B(IOvalue[14]),
	.C(syn__100_),
	.D(\tc.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__178_),
	.Cout(),
	.Q());
defparam syn__557_.coord_x = 6;
defparam syn__557_.coord_y = 8;
defparam syn__557_.coord_z = 9;
defparam syn__557_.mask = 16'hE080;
defparam syn__557_.modeMux = 1'b0;
defparam syn__557_.FeedbackMux = 1'b0;
defparam syn__557_.ShiftMux = 1'b0;
defparam syn__557_.BypassEn = 1'b0;
defparam syn__557_.CarryEnb = 1'b1;

alta_slice syn__558_(
	.A(syn__341_),
	.B(syn__343_),
	.C(syn__122_),
	.D(syn__127_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__179_),
	.Cout(),
	.Q());
defparam syn__558_.coord_x = 5;
defparam syn__558_.coord_y = 2;
defparam syn__558_.coord_z = 15;
defparam syn__558_.mask = 16'h8CAF;
defparam syn__558_.modeMux = 1'b0;
defparam syn__558_.FeedbackMux = 1'b0;
defparam syn__558_.ShiftMux = 1'b0;
defparam syn__558_.BypassEn = 1'b0;
defparam syn__558_.CarryEnb = 1'b1;

alta_slice syn__559_(
	.A(syn__034_),
	.B(syn__181_),
	.C(syn__049_),
	.D(\tc.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__180_),
	.Cout(),
	.Q());
defparam syn__559_.coord_x = 4;
defparam syn__559_.coord_y = 8;
defparam syn__559_.coord_z = 9;
defparam syn__559_.mask = 16'h0036;
defparam syn__559_.modeMux = 1'b0;
defparam syn__559_.FeedbackMux = 1'b0;
defparam syn__559_.ShiftMux = 1'b0;
defparam syn__559_.BypassEn = 1'b0;
defparam syn__559_.CarryEnb = 1'b1;

alta_slice syn__560_(
	.A(vcc),
	.B(vcc),
	.C(syn__047_),
	.D(syn__048_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__181_),
	.Cout(),
	.Q());
defparam syn__560_.coord_x = 4;
defparam syn__560_.coord_y = 8;
defparam syn__560_.coord_z = 15;
defparam syn__560_.mask = 16'h0FF0;
defparam syn__560_.modeMux = 1'b0;
defparam syn__560_.FeedbackMux = 1'b0;
defparam syn__560_.ShiftMux = 1'b0;
defparam syn__560_.BypassEn = 1'b0;
defparam syn__560_.CarryEnb = 1'b1;

alta_slice syn__561_(
	.A(vcc),
	.B(vcc),
	.C(syn__051_),
	.D(syn__052_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__182_),
	.Cout(),
	.Q());
defparam syn__561_.coord_x = 5;
defparam syn__561_.coord_y = 8;
defparam syn__561_.coord_z = 4;
defparam syn__561_.mask = 16'h000F;
defparam syn__561_.modeMux = 1'b0;
defparam syn__561_.FeedbackMux = 1'b0;
defparam syn__561_.ShiftMux = 1'b0;
defparam syn__561_.BypassEn = 1'b0;
defparam syn__561_.CarryEnb = 1'b1;

alta_slice syn__562_(
	.A(syn__184_),
	.B(vcc),
	.C(syn__199_),
	.D(syn__194_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__183_),
	.Cout(),
	.Q());
defparam syn__562_.coord_x = 1;
defparam syn__562_.coord_y = 3;
defparam syn__562_.coord_z = 5;
defparam syn__562_.mask = 16'hA000;
defparam syn__562_.modeMux = 1'b0;
defparam syn__562_.FeedbackMux = 1'b0;
defparam syn__562_.ShiftMux = 1'b0;
defparam syn__562_.BypassEn = 1'b0;
defparam syn__562_.CarryEnb = 1'b1;

alta_slice syn__563_(
	.A(syn__187_),
	.B(syn__192_),
	.C(syn__185_),
	.D(syn__112_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__184_),
	.Cout(),
	.Q());
defparam syn__563_.coord_x = 6;
defparam syn__563_.coord_y = 3;
defparam syn__563_.coord_z = 14;
defparam syn__563_.mask = 16'h08AA;
defparam syn__563_.modeMux = 1'b0;
defparam syn__563_.FeedbackMux = 1'b0;
defparam syn__563_.ShiftMux = 1'b0;
defparam syn__563_.BypassEn = 1'b0;
defparam syn__563_.CarryEnb = 1'b1;

alta_slice syn__564_(
	.A(syn__186_),
	.B(syn__079_),
	.C(syn__024_),
	.D(\tc.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__185_),
	.Cout(),
	.Q());
defparam syn__564_.coord_x = 6;
defparam syn__564_.coord_y = 5;
defparam syn__564_.coord_z = 2;
defparam syn__564_.mask = 16'h0056;
defparam syn__564_.modeMux = 1'b0;
defparam syn__564_.FeedbackMux = 1'b0;
defparam syn__564_.ShiftMux = 1'b0;
defparam syn__564_.BypassEn = 1'b0;
defparam syn__564_.CarryEnb = 1'b1;

alta_slice syn__565_(
	.A(vcc),
	.B(vcc),
	.C(syn__077_),
	.D(syn__078_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__186_),
	.Cout(),
	.Q());
defparam syn__565_.coord_x = 6;
defparam syn__565_.coord_y = 5;
defparam syn__565_.coord_z = 3;
defparam syn__565_.mask = 16'h0FF0;
defparam syn__565_.modeMux = 1'b0;
defparam syn__565_.FeedbackMux = 1'b0;
defparam syn__565_.ShiftMux = 1'b0;
defparam syn__565_.BypassEn = 1'b0;
defparam syn__565_.CarryEnb = 1'b1;

alta_slice syn__566_(
	.A(syn__111_),
	.B(syn__345_),
	.C(syn__189_),
	.D(vcc),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__187_),
	.Cout(),
	.Q());
defparam syn__566_.coord_x = 7;
defparam syn__566_.coord_y = 3;
defparam syn__566_.coord_z = 6;
defparam syn__566_.mask = 16'hD0D0;
defparam syn__566_.modeMux = 1'b0;
defparam syn__566_.FeedbackMux = 1'b0;
defparam syn__566_.ShiftMux = 1'b0;
defparam syn__566_.BypassEn = 1'b0;
defparam syn__566_.CarryEnb = 1'b1;

alta_slice syn__567_(
	.A(vcc),
	.B(vcc),
	.C(syn__063_),
	.D(syn__064_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__188_),
	.Cout(),
	.Q());
defparam syn__567_.coord_x = 5;
defparam syn__567_.coord_y = 6;
defparam syn__567_.coord_z = 0;
defparam syn__567_.mask = 16'h000F;
defparam syn__567_.modeMux = 1'b0;
defparam syn__567_.FeedbackMux = 1'b0;
defparam syn__567_.ShiftMux = 1'b0;
defparam syn__567_.BypassEn = 1'b0;
defparam syn__567_.CarryEnb = 1'b1;

alta_slice syn__568_(
	.A(syn__341_),
	.B(syn__347_),
	.C(syn__122_),
	.D(syn__127_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__189_),
	.Cout(),
	.Q());
defparam syn__568_.coord_x = 5;
defparam syn__568_.coord_y = 2;
defparam syn__568_.coord_z = 3;
defparam syn__568_.mask = 16'h8ACF;
defparam syn__568_.modeMux = 1'b0;
defparam syn__568_.FeedbackMux = 1'b0;
defparam syn__568_.ShiftMux = 1'b0;
defparam syn__568_.BypassEn = 1'b0;
defparam syn__568_.CarryEnb = 1'b1;

alta_slice syn__569_(
	.A(syn__035_),
	.B(vcc),
	.C(syn__046_),
	.D(syn__045_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__190_),
	.Cout(),
	.Q());
defparam syn__569_.coord_x = 4;
defparam syn__569_.coord_y = 8;
defparam syn__569_.coord_z = 3;
defparam syn__569_.mask = 16'hFAA0;
defparam syn__569_.modeMux = 1'b0;
defparam syn__569_.FeedbackMux = 1'b0;
defparam syn__569_.ShiftMux = 1'b0;
defparam syn__569_.BypassEn = 1'b0;
defparam syn__569_.CarryEnb = 1'b1;

alta_slice syn__570_(
	.A(vcc),
	.B(vcc),
	.C(syn__049_),
	.D(syn__044_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__191_),
	.Cout(),
	.Q());
defparam syn__570_.coord_x = 4;
defparam syn__570_.coord_y = 8;
defparam syn__570_.coord_z = 4;
defparam syn__570_.mask = 16'h000F;
defparam syn__570_.modeMux = 1'b0;
defparam syn__570_.FeedbackMux = 1'b0;
defparam syn__570_.ShiftMux = 1'b0;
defparam syn__570_.BypassEn = 1'b0;
defparam syn__570_.CarryEnb = 1'b1;

alta_slice syn__571_(
	.A(IOvalue[21]),
	.B(IOaddr[21]),
	.C(syn__101_),
	.D(syn__193_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__192_),
	.Cout(),
	.Q());
defparam syn__571_.coord_x = 6;
defparam syn__571_.coord_y = 8;
defparam syn__571_.coord_z = 10;
defparam syn__571_.mask = 16'h009F;
defparam syn__571_.modeMux = 1'b0;
defparam syn__571_.FeedbackMux = 1'b0;
defparam syn__571_.ShiftMux = 1'b0;
defparam syn__571_.BypassEn = 1'b0;
defparam syn__571_.CarryEnb = 1'b1;

alta_slice syn__572_(
	.A(IOaddr[21]),
	.B(IOvalue[21]),
	.C(syn__100_),
	.D(\tc.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__193_),
	.Cout(),
	.Q());
defparam syn__572_.coord_x = 6;
defparam syn__572_.coord_y = 8;
defparam syn__572_.coord_z = 7;
defparam syn__572_.mask = 16'hE080;
defparam syn__572_.modeMux = 1'b0;
defparam syn__572_.FeedbackMux = 1'b0;
defparam syn__572_.ShiftMux = 1'b0;
defparam syn__572_.BypassEn = 1'b0;
defparam syn__572_.CarryEnb = 1'b1;

alta_slice syn__573_(
	.A(vcc),
	.B(syn__325_),
	.C(syn__112_),
	.D(syn__195_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__194_),
	.Cout(),
	.Q());
defparam syn__573_.coord_x = 6;
defparam syn__573_.coord_y = 4;
defparam syn__573_.coord_z = 1;
defparam syn__573_.mask = 16'hCF00;
defparam syn__573_.modeMux = 1'b0;
defparam syn__573_.FeedbackMux = 1'b0;
defparam syn__573_.ShiftMux = 1'b0;
defparam syn__573_.BypassEn = 1'b0;
defparam syn__573_.CarryEnb = 1'b1;

alta_slice syn__574_(
	.A(syn__197_),
	.B(syn__349_),
	.C(syn__111_),
	.D(vcc),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__195_),
	.Cout(),
	.Q());
defparam syn__574_.coord_x = 4;
defparam syn__574_.coord_y = 3;
defparam syn__574_.coord_z = 7;
defparam syn__574_.mask = 16'h8A8A;
defparam syn__574_.modeMux = 1'b0;
defparam syn__574_.FeedbackMux = 1'b0;
defparam syn__574_.ShiftMux = 1'b0;
defparam syn__574_.BypassEn = 1'b0;
defparam syn__574_.CarryEnb = 1'b1;

alta_slice syn__575_(
	.A(syn__030_),
	.B(syn__061_),
	.C(syn__060_),
	.D(\tc.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__196_),
	.Cout(),
	.Q());
defparam syn__575_.coord_x = 4;
defparam syn__575_.coord_y = 6;
defparam syn__575_.coord_z = 8;
defparam syn__575_.mask = 16'h001E;
defparam syn__575_.modeMux = 1'b0;
defparam syn__575_.FeedbackMux = 1'b0;
defparam syn__575_.ShiftMux = 1'b0;
defparam syn__575_.BypassEn = 1'b0;
defparam syn__575_.CarryEnb = 1'b1;

alta_slice syn__576_(
	.A(syn__347_),
	.B(syn__122_),
	.C(syn__351_),
	.D(syn__127_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__197_),
	.Cout(),
	.Q());
defparam syn__576_.coord_x = 5;
defparam syn__576_.coord_y = 2;
defparam syn__576_.coord_z = 5;
defparam syn__576_.mask = 16'hA2F3;
defparam syn__576_.modeMux = 1'b0;
defparam syn__576_.FeedbackMux = 1'b0;
defparam syn__576_.ShiftMux = 1'b0;
defparam syn__576_.BypassEn = 1'b0;
defparam syn__576_.CarryEnb = 1'b1;

alta_slice syn__577_(
	.A(vcc),
	.B(vcc),
	.C(syn__046_),
	.D(syn__045_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__198_),
	.Cout(),
	.Q());
defparam syn__577_.coord_x = 4;
defparam syn__577_.coord_y = 8;
defparam syn__577_.coord_z = 10;
defparam syn__577_.mask = 16'h0FF0;
defparam syn__577_.modeMux = 1'b0;
defparam syn__577_.FeedbackMux = 1'b0;
defparam syn__577_.ShiftMux = 1'b0;
defparam syn__577_.BypassEn = 1'b0;
defparam syn__577_.CarryEnb = 1'b1;

alta_slice syn__578_(
	.A(syn__200_),
	.B(syn__208_),
	.C(syn__203_),
	.D(syn__355_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__199_),
	.Cout(),
	.Q());
defparam syn__578_.coord_x = 1;
defparam syn__578_.coord_y = 3;
defparam syn__578_.coord_z = 0;
defparam syn__578_.mask = 16'h8000;
defparam syn__578_.modeMux = 1'b0;
defparam syn__578_.FeedbackMux = 1'b0;
defparam syn__578_.ShiftMux = 1'b0;
defparam syn__578_.BypassEn = 1'b0;
defparam syn__578_.CarryEnb = 1'b1;

alta_slice syn__579_(
	.A(syn__201_),
	.B(vcc),
	.C(syn__327_),
	.D(syn__112_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__200_),
	.Cout(),
	.Q());
defparam syn__579_.coord_x = 1;
defparam syn__579_.coord_y = 3;
defparam syn__579_.coord_z = 4;
defparam syn__579_.mask = 16'hA0AA;
defparam syn__579_.modeMux = 1'b0;
defparam syn__579_.FeedbackMux = 1'b0;
defparam syn__579_.ShiftMux = 1'b0;
defparam syn__579_.BypassEn = 1'b0;
defparam syn__579_.CarryEnb = 1'b1;

alta_slice syn__580_(
	.A(vcc),
	.B(syn__202_),
	.C(syn__111_),
	.D(syn__321_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__201_),
	.Cout(),
	.Q());
defparam syn__580_.coord_x = 4;
defparam syn__580_.coord_y = 3;
defparam syn__580_.coord_z = 4;
defparam syn__580_.mask = 16'hCC0C;
defparam syn__580_.modeMux = 1'b0;
defparam syn__580_.FeedbackMux = 1'b0;
defparam syn__580_.ShiftMux = 1'b0;
defparam syn__580_.BypassEn = 1'b0;
defparam syn__580_.CarryEnb = 1'b1;

alta_slice syn__581_(
	.A(syn__323_),
	.B(syn__122_),
	.C(syn__351_),
	.D(syn__127_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__202_),
	.Cout(),
	.Q());
defparam syn__581_.coord_x = 5;
defparam syn__581_.coord_y = 2;
defparam syn__581_.coord_z = 7;
defparam syn__581_.mask = 16'hB0BB;
defparam syn__581_.modeMux = 1'b0;
defparam syn__581_.FeedbackMux = 1'b0;
defparam syn__581_.ShiftMux = 1'b0;
defparam syn__581_.BypassEn = 1'b0;
defparam syn__581_.CarryEnb = 1'b1;

alta_slice syn__582_(
	.A(vcc),
	.B(syn__136_),
	.C(syn__204_),
	.D(syn__112_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__203_),
	.Cout(),
	.Q());
defparam syn__582_.coord_x = 1;
defparam syn__582_.coord_y = 3;
defparam syn__582_.coord_z = 2;
defparam syn__582_.mask = 16'hC0F0;
defparam syn__582_.modeMux = 1'b0;
defparam syn__582_.FeedbackMux = 1'b0;
defparam syn__582_.ShiftMux = 1'b0;
defparam syn__582_.BypassEn = 1'b0;
defparam syn__582_.CarryEnb = 1'b1;

alta_slice syn__583_(
	.A(vcc),
	.B(syn__333_),
	.C(syn__111_),
	.D(syn__205_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__204_),
	.Cout(),
	.Q());
defparam syn__583_.coord_x = 4;
defparam syn__583_.coord_y = 3;
defparam syn__583_.coord_z = 12;
defparam syn__583_.mask = 16'hCF00;
defparam syn__583_.modeMux = 1'b0;
defparam syn__583_.FeedbackMux = 1'b0;
defparam syn__583_.ShiftMux = 1'b0;
defparam syn__583_.BypassEn = 1'b0;
defparam syn__583_.CarryEnb = 1'b1;

alta_slice syn__584_(
	.A(syn__353_),
	.B(syn__122_),
	.C(syn__323_),
	.D(syn__127_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__205_),
	.Cout(),
	.Q());
defparam syn__584_.coord_x = 5;
defparam syn__584_.coord_y = 2;
defparam syn__584_.coord_z = 6;
defparam syn__584_.mask = 16'hB0BB;
defparam syn__584_.modeMux = 1'b0;
defparam syn__584_.FeedbackMux = 1'b0;
defparam syn__584_.ShiftMux = 1'b0;
defparam syn__584_.BypassEn = 1'b0;
defparam syn__584_.CarryEnb = 1'b1;

alta_slice syn__585_(
	.A(syn__039_),
	.B(syn__038_),
	.C(syn__037_),
	.D(syn__040_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__206_),
	.Cout(),
	.Q());
defparam syn__585_.coord_x = 4;
defparam syn__585_.coord_y = 5;
defparam syn__585_.coord_z = 10;
defparam syn__585_.mask = 16'hD42B;
defparam syn__585_.modeMux = 1'b0;
defparam syn__585_.FeedbackMux = 1'b0;
defparam syn__585_.ShiftMux = 1'b0;
defparam syn__585_.BypassEn = 1'b0;
defparam syn__585_.CarryEnb = 1'b1;

alta_slice syn__586_(
	.A(vcc),
	.B(vcc),
	.C(syn__037_),
	.D(syn__038_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__207_),
	.Cout(),
	.Q());
defparam syn__586_.coord_x = 4;
defparam syn__586_.coord_y = 5;
defparam syn__586_.coord_z = 12;
defparam syn__586_.mask = 16'h0FF0;
defparam syn__586_.modeMux = 1'b0;
defparam syn__586_.FeedbackMux = 1'b0;
defparam syn__586_.ShiftMux = 1'b0;
defparam syn__586_.BypassEn = 1'b0;
defparam syn__586_.CarryEnb = 1'b1;

alta_slice syn__587_(
	.A(vcc),
	.B(syn__112_),
	.C(syn__209_),
	.D(syn__315_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__208_),
	.Cout(),
	.Q());
defparam syn__587_.coord_x = 5;
defparam syn__587_.coord_y = 4;
defparam syn__587_.coord_z = 7;
defparam syn__587_.mask = 16'hF030;
defparam syn__587_.modeMux = 1'b0;
defparam syn__587_.FeedbackMux = 1'b0;
defparam syn__587_.ShiftMux = 1'b0;
defparam syn__587_.BypassEn = 1'b0;
defparam syn__587_.CarryEnb = 1'b1;

alta_slice syn__588_(
	.A(vcc),
	.B(syn__210_),
	.C(syn__157_),
	.D(syn__111_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__209_),
	.Cout(),
	.Q());
defparam syn__588_.coord_x = 6;
defparam syn__588_.coord_y = 3;
defparam syn__588_.coord_z = 9;
defparam syn__588_.mask = 16'hC0CC;
defparam syn__588_.modeMux = 1'b0;
defparam syn__588_.FeedbackMux = 1'b0;
defparam syn__588_.ShiftMux = 1'b0;
defparam syn__588_.BypassEn = 1'b0;
defparam syn__588_.CarryEnb = 1'b1;

alta_slice syn__589_(
	.A(syn__122_),
	.B(syn__166_),
	.C(syn__357_),
	.D(syn__127_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__210_),
	.Cout(),
	.Q());
defparam syn__589_.coord_x = 5;
defparam syn__589_.coord_y = 2;
defparam syn__589_.coord_z = 0;
defparam syn__589_.mask = 16'hD0DD;
defparam syn__589_.modeMux = 1'b0;
defparam syn__589_.FeedbackMux = 1'b0;
defparam syn__589_.ShiftMux = 1'b0;
defparam syn__589_.BypassEn = 1'b0;
defparam syn__589_.CarryEnb = 1'b1;

alta_slice syn__590_(
	.A(syn__157_),
	.B(vcc),
	.C(syn__127_),
	.D(syn__212_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__211_),
	.Cout(),
	.Q());
defparam syn__590_.coord_x = 5;
defparam syn__590_.coord_y = 2;
defparam syn__590_.coord_z = 4;
defparam syn__590_.mask = 16'hAF00;
defparam syn__590_.modeMux = 1'b0;
defparam syn__590_.FeedbackMux = 1'b0;
defparam syn__590_.ShiftMux = 1'b0;
defparam syn__590_.BypassEn = 1'b0;
defparam syn__590_.CarryEnb = 1'b1;

alta_slice syn__591_(
	.A(syn__317_),
	.B(\tc.IM [6]),
	.C(syn__343_),
	.D(\tc.IM [5]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__212_),
	.Cout(),
	.Q());
defparam syn__591_.coord_x = 5;
defparam syn__591_.coord_y = 3;
defparam syn__591_.coord_z = 8;
defparam syn__591_.mask = 16'hFFB8;
defparam syn__591_.modeMux = 1'b0;
defparam syn__591_.FeedbackMux = 1'b0;
defparam syn__591_.ShiftMux = 1'b0;
defparam syn__591_.BypassEn = 1'b0;
defparam syn__591_.CarryEnb = 1'b1;

alta_slice syn__592_(
	.A(syn__214_),
	.B(vcc),
	.C(syn__335_),
	.D(syn__111_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__213_),
	.Cout(),
	.Q());
defparam syn__592_.coord_x = 7;
defparam syn__592_.coord_y = 3;
defparam syn__592_.coord_z = 11;
defparam syn__592_.mask = 16'hA0AA;
defparam syn__592_.modeMux = 1'b0;
defparam syn__592_.FeedbackMux = 1'b0;
defparam syn__592_.ShiftMux = 1'b0;
defparam syn__592_.BypassEn = 1'b0;
defparam syn__592_.CarryEnb = 1'b1;

alta_slice syn__593_(
	.A(syn__215_),
	.B(vcc),
	.C(syn__136_),
	.D(syn__127_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__214_),
	.Cout(),
	.Q());
defparam syn__593_.coord_x = 7;
defparam syn__593_.coord_y = 3;
defparam syn__593_.coord_z = 12;
defparam syn__593_.mask = 16'hA0AA;
defparam syn__593_.modeMux = 1'b0;
defparam syn__593_.FeedbackMux = 1'b0;
defparam syn__593_.ShiftMux = 1'b0;
defparam syn__593_.BypassEn = 1'b0;
defparam syn__593_.CarryEnb = 1'b1;

alta_slice syn__594_(
	.A(syn__122_),
	.B(syn__145_),
	.C(syn__357_),
	.D(syn__112_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__215_),
	.Cout(),
	.Q());
defparam syn__594_.coord_x = 5;
defparam syn__594_.coord_y = 4;
defparam syn__594_.coord_z = 13;
defparam syn__594_.mask = 16'hD0DD;
defparam syn__594_.modeMux = 1'b0;
defparam syn__594_.FeedbackMux = 1'b0;
defparam syn__594_.ShiftMux = 1'b0;
defparam syn__594_.BypassEn = 1'b0;
defparam syn__594_.CarryEnb = 1'b1;

alta_slice syn__595_(
	.A(syn__217_),
	.B(syn__218_),
	.C(syn__335_),
	.D(syn__127_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__216_),
	.Cout(),
	.Q());
defparam syn__595_.coord_x = 7;
defparam syn__595_.coord_y = 3;
defparam syn__595_.coord_z = 1;
defparam syn__595_.mask = 16'h4044;
defparam syn__595_.modeMux = 1'b0;
defparam syn__595_.FeedbackMux = 1'b0;
defparam syn__595_.ShiftMux = 1'b0;
defparam syn__595_.BypassEn = 1'b0;
defparam syn__595_.CarryEnb = 1'b1;

alta_slice syn__596_(
	.A(syn__154_),
	.B(vcc),
	.C(syn__161_),
	.D(syn__122_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__217_),
	.Cout(),
	.Q());
defparam syn__596_.coord_x = 7;
defparam syn__596_.coord_y = 3;
defparam syn__596_.coord_z = 2;
defparam syn__596_.mask = 16'hAF00;
defparam syn__596_.modeMux = 1'b0;
defparam syn__596_.FeedbackMux = 1'b0;
defparam syn__596_.ShiftMux = 1'b0;
defparam syn__596_.BypassEn = 1'b0;
defparam syn__596_.CarryEnb = 1'b1;

alta_slice syn__597_(
	.A(syn__157_),
	.B(syn__166_),
	.C(\tc.IM [6]),
	.D(\tc.IM [5]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__218_),
	.Cout(),
	.Q());
defparam syn__597_.coord_x = 5;
defparam syn__597_.coord_y = 3;
defparam syn__597_.coord_z = 4;
defparam syn__597_.mask = 16'hAFCF;
defparam syn__597_.modeMux = 1'b0;
defparam syn__597_.FeedbackMux = 1'b0;
defparam syn__597_.ShiftMux = 1'b0;
defparam syn__597_.BypassEn = 1'b0;
defparam syn__597_.CarryEnb = 1'b1;

alta_slice syn__598_(
	.A(syn__220_),
	.B(syn__363_),
	.C(syn__129_),
	.D(syn__127_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__219_),
	.Cout(),
	.Q());
defparam syn__598_.coord_x = 6;
defparam syn__598_.coord_y = 3;
defparam syn__598_.coord_z = 13;
defparam syn__598_.mask = 16'h8088;
defparam syn__598_.modeMux = 1'b0;
defparam syn__598_.FeedbackMux = 1'b0;
defparam syn__598_.ShiftMux = 1'b0;
defparam syn__598_.BypassEn = 1'b0;
defparam syn__598_.CarryEnb = 1'b1;

alta_slice syn__599_(
	.A(syn__112_),
	.B(syn__118_),
	.C(syn__221_),
	.D(syn__120_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__220_),
	.Cout(),
	.Q());
defparam syn__599_.coord_x = 6;
defparam syn__599_.coord_y = 3;
defparam syn__599_.coord_z = 0;
defparam syn__599_.mask = 16'h7050;
defparam syn__599_.modeMux = 1'b0;
defparam syn__599_.FeedbackMux = 1'b0;
defparam syn__599_.ShiftMux = 1'b0;
defparam syn__599_.BypassEn = 1'b0;
defparam syn__599_.CarryEnb = 1'b1;

alta_slice syn__600_(
	.A(syn__111_),
	.B(vcc),
	.C(syn__222_),
	.D(syn__327_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__221_),
	.Cout(),
	.Q());
defparam syn__600_.coord_x = 7;
defparam syn__600_.coord_y = 3;
defparam syn__600_.coord_z = 10;
defparam syn__600_.mask = 16'hF050;
defparam syn__600_.modeMux = 1'b0;
defparam syn__600_.FeedbackMux = 1'b0;
defparam syn__600_.ShiftMux = 1'b0;
defparam syn__600_.BypassEn = 1'b0;
defparam syn__600_.CarryEnb = 1'b1;

alta_slice syn__601_(
	.A(syn__321_),
	.B(syn__122_),
	.C(syn__349_),
	.D(syn__127_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__222_),
	.Cout(),
	.Q());
defparam syn__601_.coord_x = 5;
defparam syn__601_.coord_y = 2;
defparam syn__601_.coord_z = 8;
defparam syn__601_.mask = 16'hB0BB;
defparam syn__601_.modeMux = 1'b0;
defparam syn__601_.FeedbackMux = 1'b0;
defparam syn__601_.ShiftMux = 1'b0;
defparam syn__601_.BypassEn = 1'b0;
defparam syn__601_.CarryEnb = 1'b1;

alta_slice syn__602_(
	.A(vcc),
	.B(vcc),
	.C(syn__224_),
	.D(syn__228_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__223_),
	.Cout(),
	.Q());
defparam syn__602_.coord_x = 2;
defparam syn__602_.coord_y = 5;
defparam syn__602_.coord_z = 12;
defparam syn__602_.mask = 16'hF000;
defparam syn__602_.modeMux = 1'b0;
defparam syn__602_.FeedbackMux = 1'b0;
defparam syn__602_.ShiftMux = 1'b0;
defparam syn__602_.BypassEn = 1'b0;
defparam syn__602_.CarryEnb = 1'b1;

alta_slice syn__603_(
	.A(vcc),
	.B(syn__319_),
	.C(syn__225_),
	.D(syn__111_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__224_),
	.Cout(),
	.Q());
defparam syn__603_.coord_x = 6;
defparam syn__603_.coord_y = 3;
defparam syn__603_.coord_z = 6;
defparam syn__603_.mask = 16'hC0F0;
defparam syn__603_.modeMux = 1'b0;
defparam syn__603_.FeedbackMux = 1'b0;
defparam syn__603_.ShiftMux = 1'b0;
defparam syn__603_.BypassEn = 1'b0;
defparam syn__603_.CarryEnb = 1'b1;

alta_slice syn__604_(
	.A(vcc),
	.B(syn__127_),
	.C(syn__227_),
	.D(syn__226_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__225_),
	.Cout(),
	.Q());
defparam syn__604_.coord_x = 6;
defparam syn__604_.coord_y = 3;
defparam syn__604_.coord_z = 7;
defparam syn__604_.mask = 16'hF030;
defparam syn__604_.modeMux = 1'b0;
defparam syn__604_.FeedbackMux = 1'b0;
defparam syn__604_.ShiftMux = 1'b0;
defparam syn__604_.BypassEn = 1'b0;
defparam syn__604_.CarryEnb = 1'b1;

alta_slice syn__605_(
	.A(vcc),
	.B(vcc),
	.C(syn__185_),
	.D(syn__192_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__226_),
	.Cout(),
	.Q());
defparam syn__605_.coord_x = 6;
defparam syn__605_.coord_y = 3;
defparam syn__605_.coord_z = 3;
defparam syn__605_.mask = 16'h0F00;
defparam syn__605_.modeMux = 1'b0;
defparam syn__605_.FeedbackMux = 1'b0;
defparam syn__605_.ShiftMux = 1'b0;
defparam syn__605_.BypassEn = 1'b0;
defparam syn__605_.CarryEnb = 1'b1;

alta_slice syn__606_(
	.A(syn__325_),
	.B(syn__351_),
	.C(syn__112_),
	.D(syn__122_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__227_),
	.Cout(),
	.Q());
defparam syn__606_.coord_x = 5;
defparam syn__606_.coord_y = 2;
defparam syn__606_.coord_z = 9;
defparam syn__606_.mask = 16'h8ACF;
defparam syn__606_.modeMux = 1'b0;
defparam syn__606_.FeedbackMux = 1'b0;
defparam syn__606_.ShiftMux = 1'b0;
defparam syn__606_.BypassEn = 1'b0;
defparam syn__606_.CarryEnb = 1'b1;

alta_slice syn__607_(
	.A(vcc),
	.B(syn__319_),
	.C(syn__229_),
	.D(syn__112_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__228_),
	.Cout(),
	.Q());
defparam syn__607_.coord_x = 6;
defparam syn__607_.coord_y = 3;
defparam syn__607_.coord_z = 5;
defparam syn__607_.mask = 16'hC0F0;
defparam syn__607_.modeMux = 1'b0;
defparam syn__607_.FeedbackMux = 1'b0;
defparam syn__607_.ShiftMux = 1'b0;
defparam syn__607_.BypassEn = 1'b0;
defparam syn__607_.CarryEnb = 1'b1;

alta_slice syn__609_(
	.A(syn__345_),
	.B(syn__122_),
	.C(syn__349_),
	.D(syn__127_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__230_),
	.Cout(),
	.Q());
defparam syn__609_.coord_x = 5;
defparam syn__609_.coord_y = 2;
defparam syn__609_.coord_z = 11;
defparam syn__609_.mask = 16'hA2F3;
defparam syn__609_.modeMux = 1'b0;
defparam syn__609_.FeedbackMux = 1'b0;
defparam syn__609_.ShiftMux = 1'b0;
defparam syn__609_.BypassEn = 1'b0;
defparam syn__609_.CarryEnb = 1'b1;

alta_slice syn__610_(
	.A(vcc),
	.B(syn__232_),
	.C(syn__234_),
	.D(\tc.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__231_),
	.Cout(),
	.Q());
defparam syn__610_.coord_x = 6;
defparam syn__610_.coord_y = 4;
defparam syn__610_.coord_z = 5;
defparam syn__610_.mask = 16'hF030;
defparam syn__610_.modeMux = 1'b0;
defparam syn__610_.FeedbackMux = 1'b0;
defparam syn__610_.ShiftMux = 1'b0;
defparam syn__610_.BypassEn = 1'b0;
defparam syn__610_.CarryEnb = 1'b1;

alta_slice syn__611_(
	.A(syn__233_),
	.B(syn__093_),
	.C(syn__094_),
	.D(syn__019_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__232_),
	.Cout(),
	.Q());
defparam syn__611_.coord_x = 6;
defparam syn__611_.coord_y = 7;
defparam syn__611_.coord_z = 10;
defparam syn__611_.mask = 16'hA995;
defparam syn__611_.modeMux = 1'b0;
defparam syn__611_.FeedbackMux = 1'b0;
defparam syn__611_.ShiftMux = 1'b0;
defparam syn__611_.BypassEn = 1'b0;
defparam syn__611_.CarryEnb = 1'b1;

alta_slice syn__612_(
	.A(vcc),
	.B(syn__092_),
	.C(vcc),
	.D(syn__097_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__233_),
	.Cout(),
	.Q());
defparam syn__612_.coord_x = 6;
defparam syn__612_.coord_y = 7;
defparam syn__612_.coord_z = 6;
defparam syn__612_.mask = 16'h0033;
defparam syn__612_.modeMux = 1'b0;
defparam syn__612_.FeedbackMux = 1'b0;
defparam syn__612_.ShiftMux = 1'b0;
defparam syn__612_.BypassEn = 1'b0;
defparam syn__612_.CarryEnb = 1'b1;

alta_slice syn__613_(
	.A(IOaddr[29]),
	.B(syn__101_),
	.C(IOvalue[29]),
	.D(syn__235_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__234_),
	.Cout(),
	.Q());
defparam syn__613_.coord_x = 6;
defparam syn__613_.coord_y = 7;
defparam syn__613_.coord_z = 0;
defparam syn__613_.mask = 16'h00B7;
defparam syn__613_.modeMux = 1'b0;
defparam syn__613_.FeedbackMux = 1'b0;
defparam syn__613_.ShiftMux = 1'b0;
defparam syn__613_.BypassEn = 1'b0;
defparam syn__613_.CarryEnb = 1'b1;

alta_slice syn__614_(
	.A(IOvalue[29]),
	.B(syn__100_),
	.C(IOaddr[29]),
	.D(\tc.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__235_),
	.Cout(),
	.Q());
defparam syn__614_.coord_x = 6;
defparam syn__614_.coord_y = 7;
defparam syn__614_.coord_z = 3;
defparam syn__614_.mask = 16'hC880;
defparam syn__614_.modeMux = 1'b0;
defparam syn__614_.FeedbackMux = 1'b0;
defparam syn__614_.ShiftMux = 1'b0;
defparam syn__614_.BypassEn = 1'b0;
defparam syn__614_.CarryEnb = 1'b1;

alta_slice syn__615_(
	.A(syn__237_),
	.B(syn__238_),
	.C(syn__367_),
	.D(syn__239_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__236_),
	.Cout(),
	.Q());
defparam syn__615_.coord_x = 6;
defparam syn__615_.coord_y = 4;
defparam syn__615_.coord_z = 8;
defparam syn__615_.mask = 16'h1000;
defparam syn__615_.modeMux = 1'b0;
defparam syn__615_.FeedbackMux = 1'b0;
defparam syn__615_.ShiftMux = 1'b0;
defparam syn__615_.BypassEn = 1'b0;
defparam syn__615_.CarryEnb = 1'b1;

alta_slice syn__616_(
	.A(syn__111_),
	.B(syn__232_),
	.C(syn__234_),
	.D(\tc.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__237_),
	.Cout(),
	.Q());
defparam syn__616_.coord_x = 6;
defparam syn__616_.coord_y = 4;
defparam syn__616_.coord_z = 10;
defparam syn__616_.mask = 16'h0A8A;
defparam syn__616_.modeMux = 1'b0;
defparam syn__616_.FeedbackMux = 1'b0;
defparam syn__616_.ShiftMux = 1'b0;
defparam syn__616_.BypassEn = 1'b0;
defparam syn__616_.CarryEnb = 1'b1;

alta_slice syn__617_(
	.A(syn__234_),
	.B(syn__232_),
	.C(syn__127_),
	.D(\tc.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__238_),
	.Cout(),
	.Q());
defparam syn__617_.coord_x = 6;
defparam syn__617_.coord_y = 4;
defparam syn__617_.coord_z = 15;
defparam syn__617_.mask = 16'h50D0;
defparam syn__617_.modeMux = 1'b0;
defparam syn__617_.FeedbackMux = 1'b0;
defparam syn__617_.ShiftMux = 1'b0;
defparam syn__617_.BypassEn = 1'b0;
defparam syn__617_.CarryEnb = 1'b1;

alta_slice syn__618_(
	.A(vcc),
	.B(syn__112_),
	.C(syn__240_),
	.D(syn__347_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__239_),
	.Cout(),
	.Q());
defparam syn__618_.coord_x = 5;
defparam syn__618_.coord_y = 4;
defparam syn__618_.coord_z = 1;
defparam syn__618_.mask = 16'hF030;
defparam syn__618_.modeMux = 1'b0;
defparam syn__618_.FeedbackMux = 1'b0;
defparam syn__618_.ShiftMux = 1'b0;
defparam syn__618_.BypassEn = 1'b0;
defparam syn__618_.CarryEnb = 1'b1;

alta_slice syn__619_(
	.A(\tc.IM [6]),
	.B(syn__339_),
	.C(syn__226_),
	.D(\tc.IM [5]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__240_),
	.Cout(),
	.Q());
defparam syn__619_.coord_x = 5;
defparam syn__619_.coord_y = 4;
defparam syn__619_.coord_z = 0;
defparam syn__619_.mask = 16'hEEFA;
defparam syn__619_.modeMux = 1'b0;
defparam syn__619_.FeedbackMux = 1'b0;
defparam syn__619_.ShiftMux = 1'b0;
defparam syn__619_.BypassEn = 1'b0;
defparam syn__619_.CarryEnb = 1'b1;

alta_slice syn__620_(
	.A(syn__244_),
	.B(syn__242_),
	.C(syn__245_),
	.D(syn__127_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__241_),
	.Cout(),
	.Q());
defparam syn__620_.coord_x = 5;
defparam syn__620_.coord_y = 4;
defparam syn__620_.coord_z = 4;
defparam syn__620_.mask = 16'h40CC;
defparam syn__620_.modeMux = 1'b0;
defparam syn__620_.FeedbackMux = 1'b0;
defparam syn__620_.ShiftMux = 1'b0;
defparam syn__620_.BypassEn = 1'b0;
defparam syn__620_.CarryEnb = 1'b1;

alta_slice syn__621_(
	.A(vcc),
	.B(syn__231_),
	.C(syn__243_),
	.D(syn__122_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__242_),
	.Cout(),
	.Q());
defparam syn__621_.coord_x = 6;
defparam syn__621_.coord_y = 4;
defparam syn__621_.coord_z = 7;
defparam syn__621_.mask = 16'hC0F0;
defparam syn__621_.modeMux = 1'b0;
defparam syn__621_.FeedbackMux = 1'b0;
defparam syn__621_.ShiftMux = 1'b0;
defparam syn__621_.BypassEn = 1'b0;
defparam syn__621_.CarryEnb = 1'b1;

alta_slice syn__622_(
	.A(\tc.IM [5]),
	.B(syn__347_),
	.C(syn__345_),
	.D(\tc.IM [6]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__243_),
	.Cout(),
	.Q());
defparam syn__622_.coord_x = 5;
defparam syn__622_.coord_y = 3;
defparam syn__622_.coord_z = 9;
defparam syn__622_.mask = 16'hE4FF;
defparam syn__622_.modeMux = 1'b0;
defparam syn__622_.FeedbackMux = 1'b0;
defparam syn__622_.ShiftMux = 1'b0;
defparam syn__622_.BypassEn = 1'b0;
defparam syn__622_.CarryEnb = 1'b1;

alta_slice syn__623_(
	.A(syn__018_),
	.B(syn__097_),
	.C(syn__096_),
	.D(\tc.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__244_),
	.Cout(),
	.Q());
defparam syn__623_.coord_x = 6;
defparam syn__623_.coord_y = 7;
defparam syn__623_.coord_z = 5;
defparam syn__623_.mask = 16'h001E;
defparam syn__623_.modeMux = 1'b0;
defparam syn__623_.FeedbackMux = 1'b0;
defparam syn__623_.ShiftMux = 1'b0;
defparam syn__623_.BypassEn = 1'b0;
defparam syn__623_.CarryEnb = 1'b1;

alta_slice syn__624_(
	.A(syn__101_),
	.B(syn__246_),
	.C(IOaddr[30]),
	.D(IOvalue[30]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__245_),
	.Cout(),
	.Q());
defparam syn__624_.coord_x = 6;
defparam syn__624_.coord_y = 7;
defparam syn__624_.coord_z = 12;
defparam syn__624_.mask = 16'h3113;
defparam syn__624_.modeMux = 1'b0;
defparam syn__624_.FeedbackMux = 1'b0;
defparam syn__624_.ShiftMux = 1'b0;
defparam syn__624_.BypassEn = 1'b0;
defparam syn__624_.CarryEnb = 1'b1;

alta_slice syn__625_(
	.A(IOaddr[30]),
	.B(IOvalue[30]),
	.C(syn__100_),
	.D(\tc.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__246_),
	.Cout(),
	.Q());
defparam syn__625_.coord_x = 6;
defparam syn__625_.coord_y = 7;
defparam syn__625_.coord_z = 1;
defparam syn__625_.mask = 16'hE080;
defparam syn__625_.modeMux = 1'b0;
defparam syn__625_.FeedbackMux = 1'b0;
defparam syn__625_.ShiftMux = 1'b0;
defparam syn__625_.BypassEn = 1'b0;
defparam syn__625_.CarryEnb = 1'b1;

alta_slice syn__626_(
	.A(syn__248_),
	.B(vcc),
	.C(vcc),
	.D(syn__251_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__247_),
	.Cout(),
	.Q());
defparam syn__626_.coord_x = 4;
defparam syn__626_.coord_y = 4;
defparam syn__626_.coord_z = 8;
defparam syn__626_.mask = 16'hAA00;
defparam syn__626_.modeMux = 1'b0;
defparam syn__626_.FeedbackMux = 1'b0;
defparam syn__626_.ShiftMux = 1'b0;
defparam syn__626_.BypassEn = 1'b0;
defparam syn__626_.CarryEnb = 1'b1;

alta_slice syn__627_(
	.A(syn__244_),
	.B(syn__249_),
	.C(syn__245_),
	.D(syn__111_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__248_),
	.Cout(),
	.Q());
defparam syn__627_.coord_x = 5;
defparam syn__627_.coord_y = 4;
defparam syn__627_.coord_z = 6;
defparam syn__627_.mask = 16'h40CC;
defparam syn__627_.modeMux = 1'b0;
defparam syn__627_.FeedbackMux = 1'b0;
defparam syn__627_.ShiftMux = 1'b0;
defparam syn__627_.BypassEn = 1'b0;
defparam syn__627_.CarryEnb = 1'b1;

alta_slice syn__628_(
	.A(syn__250_),
	.B(vcc),
	.C(syn__103_),
	.D(syn__127_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__249_),
	.Cout(),
	.Q());
defparam syn__628_.coord_x = 5;
defparam syn__628_.coord_y = 4;
defparam syn__628_.coord_z = 9;
defparam syn__628_.mask = 16'hA0AA;
defparam syn__628_.modeMux = 1'b0;
defparam syn__628_.FeedbackMux = 1'b0;
defparam syn__628_.ShiftMux = 1'b0;
defparam syn__628_.BypassEn = 1'b0;
defparam syn__628_.CarryEnb = 1'b1;

alta_slice syn__629_(
	.A(syn__341_),
	.B(syn__339_),
	.C(syn__122_),
	.D(syn__112_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__250_),
	.Cout(),
	.Q());
defparam syn__629_.coord_x = 5;
defparam syn__629_.coord_y = 4;
defparam syn__629_.coord_z = 14;
defparam syn__629_.mask = 16'h8ACF;
defparam syn__629_.modeMux = 1'b0;
defparam syn__629_.FeedbackMux = 1'b0;
defparam syn__629_.ShiftMux = 1'b0;
defparam syn__629_.BypassEn = 1'b0;
defparam syn__629_.CarryEnb = 1'b1;

alta_slice syn__630_(
	.A(syn__244_),
	.B(syn__112_),
	.C(syn__245_),
	.D(syn__252_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__251_),
	.Cout(),
	.Q());
defparam syn__630_.coord_x = 5;
defparam syn__630_.coord_y = 4;
defparam syn__630_.coord_z = 2;
defparam syn__630_.mask = 16'h7300;
defparam syn__630_.modeMux = 1'b0;
defparam syn__630_.FeedbackMux = 1'b0;
defparam syn__630_.ShiftMux = 1'b0;
defparam syn__630_.BypassEn = 1'b0;
defparam syn__630_.CarryEnb = 1'b1;

alta_slice syn__631_(
	.A(vcc),
	.B(syn__339_),
	.C(syn__253_),
	.D(syn__111_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__252_),
	.Cout(),
	.Q());
defparam syn__631_.coord_x = 5;
defparam syn__631_.coord_y = 4;
defparam syn__631_.coord_z = 11;
defparam syn__631_.mask = 16'hC0F0;
defparam syn__631_.modeMux = 1'b0;
defparam syn__631_.FeedbackMux = 1'b0;
defparam syn__631_.ShiftMux = 1'b0;
defparam syn__631_.BypassEn = 1'b0;
defparam syn__631_.CarryEnb = 1'b1;

alta_slice syn__632_(
	.A(syn__175_),
	.B(syn__122_),
	.C(syn__127_),
	.D(syn__317_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__253_),
	.Cout(),
	.Q());
defparam syn__632_.coord_x = 5;
defparam syn__632_.coord_y = 2;
defparam syn__632_.coord_z = 14;
defparam syn__632_.mask = 16'hBB0B;
defparam syn__632_.modeMux = 1'b0;
defparam syn__632_.FeedbackMux = 1'b0;
defparam syn__632_.ShiftMux = 1'b0;
defparam syn__632_.BypassEn = 1'b0;
defparam syn__632_.CarryEnb = 1'b1;

alta_slice syn__633_(
	.A(syn__258_),
	.B(vcc),
	.C(syn__255_),
	.D(syn__261_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__254_),
	.Cout(),
	.Q());
defparam syn__633_.coord_x = 4;
defparam syn__633_.coord_y = 4;
defparam syn__633_.coord_z = 1;
defparam syn__633_.mask = 16'hA000;
defparam syn__633_.modeMux = 1'b0;
defparam syn__633_.FeedbackMux = 1'b0;
defparam syn__633_.ShiftMux = 1'b0;
defparam syn__633_.BypassEn = 1'b0;
defparam syn__633_.CarryEnb = 1'b1;

alta_slice syn__634_(
	.A(syn__257_),
	.B(syn__016_),
	.C(syn__256_),
	.D(syn__127_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__255_),
	.Cout(),
	.Q());
defparam syn__634_.coord_x = 4;
defparam syn__634_.coord_y = 4;
defparam syn__634_.coord_z = 6;
defparam syn__634_.mask = 16'h080A;
defparam syn__634_.modeMux = 1'b0;
defparam syn__634_.FeedbackMux = 1'b0;
defparam syn__634_.ShiftMux = 1'b0;
defparam syn__634_.BypassEn = 1'b0;
defparam syn__634_.CarryEnb = 1'b1;

alta_slice syn__635_(
	.A(vcc),
	.B(syn__244_),
	.C(syn__122_),
	.D(syn__245_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__256_),
	.Cout(),
	.Q());
defparam syn__635_.coord_x = 5;
defparam syn__635_.coord_y = 4;
defparam syn__635_.coord_z = 12;
defparam syn__635_.mask = 16'hC0F0;
defparam syn__635_.modeMux = 1'b0;
defparam syn__635_.FeedbackMux = 1'b0;
defparam syn__635_.ShiftMux = 1'b0;
defparam syn__635_.BypassEn = 1'b0;
defparam syn__635_.CarryEnb = 1'b1;

alta_slice syn__636_(
	.A(\tc.IM [6]),
	.B(syn__341_),
	.C(syn__175_),
	.D(\tc.IM [5]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__257_),
	.Cout(),
	.Q());
defparam syn__636_.coord_x = 5;
defparam syn__636_.coord_y = 3;
defparam syn__636_.coord_z = 0;
defparam syn__636_.mask = 16'hF5DD;
defparam syn__636_.modeMux = 1'b0;
defparam syn__636_.FeedbackMux = 1'b0;
defparam syn__636_.ShiftMux = 1'b0;
defparam syn__636_.BypassEn = 1'b0;
defparam syn__636_.CarryEnb = 1'b1;

alta_slice syn__637_(
	.A(vcc),
	.B(syn__259_),
	.C(syn__016_),
	.D(syn__122_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__258_),
	.Cout(),
	.Q());
defparam syn__637_.coord_x = 6;
defparam syn__637_.coord_y = 4;
defparam syn__637_.coord_z = 13;
defparam syn__637_.mask = 16'hC0CC;
defparam syn__637_.modeMux = 1'b0;
defparam syn__637_.FeedbackMux = 1'b0;
defparam syn__637_.ShiftMux = 1'b0;
defparam syn__637_.BypassEn = 1'b0;
defparam syn__637_.CarryEnb = 1'b1;

alta_slice syn__638_(
	.A(vcc),
	.B(syn__112_),
	.C(syn__260_),
	.D(syn__317_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__259_),
	.Cout(),
	.Q());
defparam syn__638_.coord_x = 5;
defparam syn__638_.coord_y = 4;
defparam syn__638_.coord_z = 8;
defparam syn__638_.mask = 16'hF030;
defparam syn__638_.modeMux = 1'b0;
defparam syn__638_.FeedbackMux = 1'b0;
defparam syn__638_.ShiftMux = 1'b0;
defparam syn__638_.BypassEn = 1'b0;
defparam syn__638_.CarryEnb = 1'b1;

alta_slice syn__639_(
	.A(syn__166_),
	.B(syn__111_),
	.C(syn__343_),
	.D(syn__127_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__260_),
	.Cout(),
	.Q());
defparam syn__639_.coord_x = 5;
defparam syn__639_.coord_y = 4;
defparam syn__639_.coord_z = 10;
defparam syn__639_.mask = 16'hA2F3;
defparam syn__639_.modeMux = 1'b0;
defparam syn__639_.FeedbackMux = 1'b0;
defparam syn__639_.ShiftMux = 1'b0;
defparam syn__639_.BypassEn = 1'b0;
defparam syn__639_.CarryEnb = 1'b1;

alta_slice syn__640_(
	.A(syn__111_),
	.B(vcc),
	.C(syn__262_),
	.D(syn__016_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__261_),
	.Cout(),
	.Q());
defparam syn__640_.coord_x = 7;
defparam syn__640_.coord_y = 3;
defparam syn__640_.coord_z = 3;
defparam syn__640_.mask = 16'hF050;
defparam syn__640_.modeMux = 1'b0;
defparam syn__640_.FeedbackMux = 1'b0;
defparam syn__640_.ShiftMux = 1'b0;
defparam syn__640_.BypassEn = 1'b0;
defparam syn__640_.CarryEnb = 1'b1;

alta_slice syn__641_(
	.A(syn__154_),
	.B(syn__263_),
	.C(syn__161_),
	.D(syn__127_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__262_),
	.Cout(),
	.Q());
defparam syn__641_.coord_x = 7;
defparam syn__641_.coord_y = 3;
defparam syn__641_.coord_z = 8;
defparam syn__641_.mask = 16'h40CC;
defparam syn__641_.modeMux = 1'b0;
defparam syn__641_.FeedbackMux = 1'b0;
defparam syn__641_.ShiftMux = 1'b0;
defparam syn__641_.BypassEn = 1'b0;
defparam syn__641_.CarryEnb = 1'b1;

alta_slice syn__642_(
	.A(syn__103_),
	.B(syn__343_),
	.C(syn__112_),
	.D(syn__122_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__263_),
	.Cout(),
	.Q());
defparam syn__642_.coord_x = 6;
defparam syn__642_.coord_y = 4;
defparam syn__642_.coord_z = 4;
defparam syn__642_.mask = 16'h8ACF;
defparam syn__642_.modeMux = 1'b0;
defparam syn__642_.FeedbackMux = 1'b0;
defparam syn__642_.ShiftMux = 1'b0;
defparam syn__642_.BypassEn = 1'b0;
defparam syn__642_.CarryEnb = 1'b1;

alta_slice syn__643_(
	.A(vcc),
	.B(\tc.IM [24]),
	.C(\tc.IM [4]),
	.D(syn__258_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__264_),
	.Cout(),
	.Q());
defparam syn__643_.coord_x = 2;
defparam syn__643_.coord_y = 6;
defparam syn__643_.coord_z = 5;
defparam syn__643_.mask = 16'h3033;
defparam syn__643_.modeMux = 1'b0;
defparam syn__643_.FeedbackMux = 1'b0;
defparam syn__643_.ShiftMux = 1'b0;
defparam syn__643_.BypassEn = 1'b0;
defparam syn__643_.CarryEnb = 1'b1;

alta_slice syn__644_(
	.A(\tc.IM [2]),
	.B(\tc.IM [1]),
	.C(\tc.IM [0]),
	.D(\tc.IM [24]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__265_),
	.Cout(),
	.Q());
defparam syn__644_.coord_x = 1;
defparam syn__644_.coord_y = 3;
defparam syn__644_.coord_z = 14;
defparam syn__644_.mask = 16'h0008;
defparam syn__644_.modeMux = 1'b0;
defparam syn__644_.FeedbackMux = 1'b0;
defparam syn__644_.ShiftMux = 1'b0;
defparam syn__644_.BypassEn = 1'b0;
defparam syn__644_.CarryEnb = 1'b1;

alta_slice syn__647_(
	.A(syn__203_),
	.B(\tc.PC [2]),
	.C(syn__265_),
	.D(syn__267_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc.PCmux [2]),
	.Cout(),
	.Q());
defparam syn__647_.coord_x = 1;
defparam syn__647_.coord_y = 3;
defparam syn__647_.coord_z = 7;
defparam syn__647_.mask = 16'h535C;
defparam syn__647_.modeMux = 1'b0;
defparam syn__647_.FeedbackMux = 1'b0;
defparam syn__647_.ShiftMux = 1'b0;
defparam syn__647_.BypassEn = 1'b0;
defparam syn__647_.CarryEnb = 1'b1;

alta_slice syn__649_(
	.A(syn__200_),
	.B(vcc),
	.C(syn__265_),
	.D(syn__268_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc.PCmux [3]),
	.Cout(),
	.Q());
defparam syn__649_.coord_x = 1;
defparam syn__649_.coord_y = 3;
defparam syn__649_.coord_z = 3;
defparam syn__649_.mask = 16'h505F;
defparam syn__649_.modeMux = 1'b0;
defparam syn__649_.FeedbackMux = 1'b0;
defparam syn__649_.ShiftMux = 1'b0;
defparam syn__649_.BypassEn = 1'b0;
defparam syn__649_.CarryEnb = 1'b1;

alta_slice syn__654_(
	.A(vcc),
	.B(vcc),
	.C(syn__269_),
	.D(\tc.PC [3]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__271_),
	.Cout(),
	.Q());
defparam syn__654_.coord_x = 1;
defparam syn__654_.coord_y = 3;
defparam syn__654_.coord_z = 10;
defparam syn__654_.mask = 16'hF000;
defparam syn__654_.modeMux = 1'b0;
defparam syn__654_.FeedbackMux = 1'b0;
defparam syn__654_.ShiftMux = 1'b0;
defparam syn__654_.BypassEn = 1'b0;
defparam syn__654_.CarryEnb = 1'b1;

alta_slice syn__655_(
	.A(syn__184_),
	.B(vcc),
	.C(syn__265_),
	.D(syn__272_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc.PCmux [5]),
	.Cout(),
	.Q());
defparam syn__655_.coord_x = 1;
defparam syn__655_.coord_y = 3;
defparam syn__655_.coord_z = 11;
defparam syn__655_.mask = 16'h505F;
defparam syn__655_.modeMux = 1'b0;
defparam syn__655_.FeedbackMux = 1'b0;
defparam syn__655_.ShiftMux = 1'b0;
defparam syn__655_.BypassEn = 1'b0;
defparam syn__655_.CarryEnb = 1'b1;

alta_slice syn__656_(
	.A(\tc.PC [0]),
	.B(\tc.PC [5]),
	.C(syn__014_),
	.D(syn__273_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__272_),
	.Cout(),
	.Q());
defparam syn__656_.coord_x = 0;
defparam syn__656_.coord_y = 3;
defparam syn__656_.coord_z = 8;
defparam syn__656_.mask = 16'hC933;
defparam syn__656_.modeMux = 1'b0;
defparam syn__656_.FeedbackMux = 1'b0;
defparam syn__656_.ShiftMux = 1'b0;
defparam syn__656_.BypassEn = 1'b0;
defparam syn__656_.CarryEnb = 1'b1;

alta_slice syn__657_(
	.A(vcc),
	.B(vcc),
	.C(syn__271_),
	.D(\tc.PC [4]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__273_),
	.Cout(),
	.Q());
defparam syn__657_.coord_x = 1;
defparam syn__657_.coord_y = 3;
defparam syn__657_.coord_z = 13;
defparam syn__657_.mask = 16'hF000;
defparam syn__657_.modeMux = 1'b0;
defparam syn__657_.FeedbackMux = 1'b0;
defparam syn__657_.ShiftMux = 1'b0;
defparam syn__657_.BypassEn = 1'b0;
defparam syn__657_.CarryEnb = 1'b1;

alta_slice syn__658_(
	.A(vcc),
	.B(syn__274_),
	.C(syn__265_),
	.D(syn__172_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc.PCmux [6]),
	.Cout(),
	.Q());
defparam syn__658_.coord_x = 1;
defparam syn__658_.coord_y = 3;
defparam syn__658_.coord_z = 8;
defparam syn__658_.mask = 16'h03F3;
defparam syn__658_.modeMux = 1'b0;
defparam syn__658_.FeedbackMux = 1'b0;
defparam syn__658_.ShiftMux = 1'b0;
defparam syn__658_.BypassEn = 1'b0;
defparam syn__658_.CarryEnb = 1'b1;

alta_slice syn__659_(
	.A(\tc.PC [0]),
	.B(syn__275_),
	.C(syn__014_),
	.D(\tc.PC [6]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__274_),
	.Cout(),
	.Q());
defparam syn__659_.coord_x = 0;
defparam syn__659_.coord_y = 3;
defparam syn__659_.coord_z = 7;
defparam syn__659_.mask = 16'hC837;
defparam syn__659_.modeMux = 1'b0;
defparam syn__659_.FeedbackMux = 1'b0;
defparam syn__659_.ShiftMux = 1'b0;
defparam syn__659_.BypassEn = 1'b0;
defparam syn__659_.CarryEnb = 1'b1;

alta_slice syn__660_(
	.A(vcc),
	.B(vcc),
	.C(syn__273_),
	.D(\tc.PC [5]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__275_),
	.Cout(),
	.Q());
defparam syn__660_.coord_x = 2;
defparam syn__660_.coord_y = 3;
defparam syn__660_.coord_z = 5;
defparam syn__660_.mask = 16'hF000;
defparam syn__660_.modeMux = 1'b0;
defparam syn__660_.FeedbackMux = 1'b0;
defparam syn__660_.ShiftMux = 1'b0;
defparam syn__660_.BypassEn = 1'b0;
defparam syn__660_.CarryEnb = 1'b1;

alta_slice syn__661_(
	.A(vcc),
	.B(\tc.IM [17]),
	.C(\tc.IM [25]),
	.D(syn__370_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc.rfA.addr [0]),
	.Cout(),
	.Q());
defparam syn__661_.coord_x = 2;
defparam syn__661_.coord_y = 8;
defparam syn__661_.coord_z = 3;
defparam syn__661_.mask = 16'hF0CC;
defparam syn__661_.modeMux = 1'b0;
defparam syn__661_.FeedbackMux = 1'b0;
defparam syn__661_.ShiftMux = 1'b0;
defparam syn__661_.BypassEn = 1'b0;
defparam syn__661_.CarryEnb = 1'b1;

alta_slice syn__662_(
	.A(vcc),
	.B(\tc.IM [26]),
	.C(\tc.IM [18]),
	.D(syn__370_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc.rfA.addr [1]),
	.Cout(),
	.Q());
defparam syn__662_.coord_x = 2;
defparam syn__662_.coord_y = 8;
defparam syn__662_.coord_z = 5;
defparam syn__662_.mask = 16'hCCF0;
defparam syn__662_.modeMux = 1'b0;
defparam syn__662_.FeedbackMux = 1'b0;
defparam syn__662_.ShiftMux = 1'b0;
defparam syn__662_.BypassEn = 1'b0;
defparam syn__662_.CarryEnb = 1'b1;

alta_slice syn__663_(
	.A(vcc),
	.B(\tc.IM [19]),
	.C(\tc.IM [27]),
	.D(syn__370_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc.rfA.addr [2]),
	.Cout(),
	.Q());
defparam syn__663_.coord_x = 2;
defparam syn__663_.coord_y = 8;
defparam syn__663_.coord_z = 1;
defparam syn__663_.mask = 16'hF0CC;
defparam syn__663_.modeMux = 1'b0;
defparam syn__663_.FeedbackMux = 1'b0;
defparam syn__663_.ShiftMux = 1'b0;
defparam syn__663_.BypassEn = 1'b0;
defparam syn__663_.CarryEnb = 1'b1;

alta_slice syn__664_(
	.A(\tc.IM [20]),
	.B(syn__370_),
	.C(vcc),
	.D(\tc.IM [28]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc.rfA.addr [3]),
	.Cout(),
	.Q());
defparam syn__664_.coord_x = 2;
defparam syn__664_.coord_y = 8;
defparam syn__664_.coord_z = 14;
defparam syn__664_.mask = 16'hEE22;
defparam syn__664_.modeMux = 1'b0;
defparam syn__664_.FeedbackMux = 1'b0;
defparam syn__664_.ShiftMux = 1'b0;
defparam syn__664_.BypassEn = 1'b0;
defparam syn__664_.CarryEnb = 1'b1;

alta_slice syn__665_(
	.A(vcc),
	.B(\tc.IM [29]),
	.C(\tc.IM [21]),
	.D(syn__370_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc.rfA.addr [4]),
	.Cout(),
	.Q());
defparam syn__665_.coord_x = 2;
defparam syn__665_.coord_y = 8;
defparam syn__665_.coord_z = 0;
defparam syn__665_.mask = 16'hCCF0;
defparam syn__665_.modeMux = 1'b0;
defparam syn__665_.FeedbackMux = 1'b0;
defparam syn__665_.ShiftMux = 1'b0;
defparam syn__665_.BypassEn = 1'b0;
defparam syn__665_.CarryEnb = 1'b1;

alta_slice syn__666_(
	.A(\tc.IM [22]),
	.B(vcc),
	.C(\tc.IM [30]),
	.D(syn__370_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc.rfA.addr [5]),
	.Cout(),
	.Q());
defparam syn__666_.coord_x = 2;
defparam syn__666_.coord_y = 8;
defparam syn__666_.coord_z = 4;
defparam syn__666_.mask = 16'hF0AA;
defparam syn__666_.modeMux = 1'b0;
defparam syn__666_.FeedbackMux = 1'b0;
defparam syn__666_.ShiftMux = 1'b0;
defparam syn__666_.BypassEn = 1'b0;
defparam syn__666_.CarryEnb = 1'b1;

alta_slice syn__667_(
	.A(\tc.IM [31]),
	.B(vcc),
	.C(\tc.IM [23]),
	.D(syn__370_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc.rfA.addr [6]),
	.Cout(),
	.Q());
defparam syn__667_.coord_x = 2;
defparam syn__667_.coord_y = 8;
defparam syn__667_.coord_z = 2;
defparam syn__667_.mask = 16'hAAF0;
defparam syn__667_.modeMux = 1'b0;
defparam syn__667_.FeedbackMux = 1'b0;
defparam syn__667_.ShiftMux = 1'b0;
defparam syn__667_.BypassEn = 1'b0;
defparam syn__667_.CarryEnb = 1'b1;

alta_slice syn__669_(
	.A(vcc),
	.B(\tc.PCmux [1]),
	.C(IOaddr[1]),
	.D(syn__370_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc.im.addr [1]),
	.Cout(),
	.Q());
defparam syn__669_.coord_x = 4;
defparam syn__669_.coord_y = 4;
defparam syn__669_.coord_z = 0;
defparam syn__669_.mask = 16'hF0CC;
defparam syn__669_.modeMux = 1'b0;
defparam syn__669_.FeedbackMux = 1'b0;
defparam syn__669_.ShiftMux = 1'b0;
defparam syn__669_.BypassEn = 1'b0;
defparam syn__669_.CarryEnb = 1'b1;

alta_slice syn__670_(
	.A(vcc),
	.B(\tc.PCmux [2]),
	.C(IOaddr[2]),
	.D(syn__370_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc.im.addr [2]),
	.Cout(),
	.Q());
defparam syn__670_.coord_x = 4;
defparam syn__670_.coord_y = 5;
defparam syn__670_.coord_z = 5;
defparam syn__670_.mask = 16'hF0CC;
defparam syn__670_.modeMux = 1'b0;
defparam syn__670_.FeedbackMux = 1'b0;
defparam syn__670_.ShiftMux = 1'b0;
defparam syn__670_.BypassEn = 1'b0;
defparam syn__670_.CarryEnb = 1'b1;

alta_slice syn__671_(
	.A(vcc),
	.B(IOaddr[3]),
	.C(\tc.PCmux [3]),
	.D(syn__370_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc.im.addr [3]),
	.Cout(),
	.Q());
defparam syn__671_.coord_x = 4;
defparam syn__671_.coord_y = 5;
defparam syn__671_.coord_z = 2;
defparam syn__671_.mask = 16'hCCF0;
defparam syn__671_.modeMux = 1'b0;
defparam syn__671_.FeedbackMux = 1'b0;
defparam syn__671_.ShiftMux = 1'b0;
defparam syn__671_.BypassEn = 1'b0;
defparam syn__671_.CarryEnb = 1'b1;

alta_slice syn__672_(
	.A(vcc),
	.B(syn__370_),
	.C(\tc.PCmux [4]),
	.D(IOaddr[4]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc.im.addr [4]),
	.Cout(),
	.Q());
defparam syn__672_.coord_x = 2;
defparam syn__672_.coord_y = 7;
defparam syn__672_.coord_z = 0;
defparam syn__672_.mask = 16'hFC30;
defparam syn__672_.modeMux = 1'b0;
defparam syn__672_.FeedbackMux = 1'b0;
defparam syn__672_.ShiftMux = 1'b0;
defparam syn__672_.BypassEn = 1'b0;
defparam syn__672_.CarryEnb = 1'b1;

alta_slice syn__673_(
	.A(vcc),
	.B(\tc.PCmux [5]),
	.C(IOaddr[5]),
	.D(syn__370_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc.im.addr [5]),
	.Cout(),
	.Q());
defparam syn__673_.coord_x = 4;
defparam syn__673_.coord_y = 7;
defparam syn__673_.coord_z = 15;
defparam syn__673_.mask = 16'hF0CC;
defparam syn__673_.modeMux = 1'b0;
defparam syn__673_.FeedbackMux = 1'b0;
defparam syn__673_.ShiftMux = 1'b0;
defparam syn__673_.BypassEn = 1'b0;
defparam syn__673_.CarryEnb = 1'b1;

alta_slice syn__674_(
	.A(IOaddr[6]),
	.B(vcc),
	.C(\tc.PCmux [6]),
	.D(syn__370_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc.im.addr [6]),
	.Cout(),
	.Q());
defparam syn__674_.coord_x = 4;
defparam syn__674_.coord_y = 7;
defparam syn__674_.coord_z = 14;
defparam syn__674_.mask = 16'hAAF0;
defparam syn__674_.modeMux = 1'b0;
defparam syn__674_.FeedbackMux = 1'b0;
defparam syn__674_.ShiftMux = 1'b0;
defparam syn__674_.BypassEn = 1'b0;
defparam syn__674_.CarryEnb = 1'b1;

alta_slice syn__675_(
	.A(vcc),
	.B(\tc.IM [10]),
	.C(\tc.IM [25]),
	.D(syn__370_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc.rfB.addr [0]),
	.Cout(),
	.Q());
defparam syn__675_.coord_x = 2;
defparam syn__675_.coord_y = 8;
defparam syn__675_.coord_z = 9;
defparam syn__675_.mask = 16'hF0CC;
defparam syn__675_.modeMux = 1'b0;
defparam syn__675_.FeedbackMux = 1'b0;
defparam syn__675_.ShiftMux = 1'b0;
defparam syn__675_.BypassEn = 1'b0;
defparam syn__675_.CarryEnb = 1'b1;

alta_slice syn__676_(
	.A(vcc),
	.B(\tc.IM [26]),
	.C(\tc.IM [11]),
	.D(syn__370_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc.rfB.addr [1]),
	.Cout(),
	.Q());
defparam syn__676_.coord_x = 2;
defparam syn__676_.coord_y = 8;
defparam syn__676_.coord_z = 8;
defparam syn__676_.mask = 16'hCCF0;
defparam syn__676_.modeMux = 1'b0;
defparam syn__676_.FeedbackMux = 1'b0;
defparam syn__676_.ShiftMux = 1'b0;
defparam syn__676_.BypassEn = 1'b0;
defparam syn__676_.CarryEnb = 1'b1;

alta_slice syn__677_(
	.A(vcc),
	.B(\tc.IM [12]),
	.C(\tc.IM [27]),
	.D(syn__370_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc.rfB.addr [2]),
	.Cout(),
	.Q());
defparam syn__677_.coord_x = 2;
defparam syn__677_.coord_y = 8;
defparam syn__677_.coord_z = 13;
defparam syn__677_.mask = 16'hF0CC;
defparam syn__677_.modeMux = 1'b0;
defparam syn__677_.FeedbackMux = 1'b0;
defparam syn__677_.ShiftMux = 1'b0;
defparam syn__677_.BypassEn = 1'b0;
defparam syn__677_.CarryEnb = 1'b1;

alta_slice syn__678_(
	.A(\tc.IM [28]),
	.B(vcc),
	.C(\tc.IM [13]),
	.D(syn__370_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc.rfB.addr [3]),
	.Cout(),
	.Q());
defparam syn__678_.coord_x = 2;
defparam syn__678_.coord_y = 8;
defparam syn__678_.coord_z = 7;
defparam syn__678_.mask = 16'hAAF0;
defparam syn__678_.modeMux = 1'b0;
defparam syn__678_.FeedbackMux = 1'b0;
defparam syn__678_.ShiftMux = 1'b0;
defparam syn__678_.BypassEn = 1'b0;
defparam syn__678_.CarryEnb = 1'b1;

alta_slice syn__679_(
	.A(vcc),
	.B(\tc.IM [29]),
	.C(\tc.IM [14]),
	.D(syn__370_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc.rfB.addr [4]),
	.Cout(),
	.Q());
defparam syn__679_.coord_x = 2;
defparam syn__679_.coord_y = 8;
defparam syn__679_.coord_z = 6;
defparam syn__679_.mask = 16'hCCF0;
defparam syn__679_.modeMux = 1'b0;
defparam syn__679_.FeedbackMux = 1'b0;
defparam syn__679_.ShiftMux = 1'b0;
defparam syn__679_.BypassEn = 1'b0;
defparam syn__679_.CarryEnb = 1'b1;

alta_slice syn__680_(
	.A(vcc),
	.B(\tc.IM [15]),
	.C(\tc.IM [30]),
	.D(syn__370_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc.rfB.addr [5]),
	.Cout(),
	.Q());
defparam syn__680_.coord_x = 2;
defparam syn__680_.coord_y = 8;
defparam syn__680_.coord_z = 12;
defparam syn__680_.mask = 16'hF0CC;
defparam syn__680_.modeMux = 1'b0;
defparam syn__680_.FeedbackMux = 1'b0;
defparam syn__680_.ShiftMux = 1'b0;
defparam syn__680_.BypassEn = 1'b0;
defparam syn__680_.CarryEnb = 1'b1;

alta_slice syn__681_(
	.A(\tc.IM [31]),
	.B(vcc),
	.C(\tc.IM [16]),
	.D(syn__370_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc.rfB.addr [6]),
	.Cout(),
	.Q());
defparam syn__681_.coord_x = 2;
defparam syn__681_.coord_y = 8;
defparam syn__681_.coord_z = 10;
defparam syn__681_.mask = 16'hAAF0;
defparam syn__681_.modeMux = 1'b0;
defparam syn__681_.FeedbackMux = 1'b0;
defparam syn__681_.ShiftMux = 1'b0;
defparam syn__681_.BypassEn = 1'b0;
defparam syn__681_.CarryEnb = 1'b1;

alta_slice syn__682_(
	.A(syn__005_),
	.B(syn__276_),
	.C(syn__258_),
	.D(\tc.DM [31]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc.WD [31]),
	.Cout(),
	.Q());
defparam syn__682_.coord_x = 1;
defparam syn__682_.coord_y = 6;
defparam syn__682_.coord_z = 10;
defparam syn__682_.mask = 16'hCE0A;
defparam syn__682_.modeMux = 1'b0;
defparam syn__682_.FeedbackMux = 1'b0;
defparam syn__682_.ShiftMux = 1'b0;
defparam syn__682_.BypassEn = 1'b0;
defparam syn__682_.CarryEnb = 1'b1;

alta_slice syn__683_(
	.A(\tc.IM [2]),
	.B(\tc.IM [1]),
	.C(\tc.IM [0]),
	.D(\tc.IM [24]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__276_),
	.Cout(),
	.Q());
defparam syn__683_.coord_x = 1;
defparam syn__683_.coord_y = 3;
defparam syn__683_.coord_z = 6;
defparam syn__683_.mask = 16'h0002;
defparam syn__683_.modeMux = 1'b0;
defparam syn__683_.FeedbackMux = 1'b0;
defparam syn__683_.ShiftMux = 1'b0;
defparam syn__683_.BypassEn = 1'b0;
defparam syn__683_.CarryEnb = 1'b1;

alta_slice syn__684_(
	.A(syn__255_),
	.B(\tc.DM [30]),
	.C(syn__276_),
	.D(syn__005_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc.WD [30]),
	.Cout(),
	.Q());
defparam syn__684_.coord_x = 4;
defparam syn__684_.coord_y = 4;
defparam syn__684_.coord_z = 2;
defparam syn__684_.mask = 16'hD5C0;
defparam syn__684_.modeMux = 1'b0;
defparam syn__684_.FeedbackMux = 1'b0;
defparam syn__684_.ShiftMux = 1'b0;
defparam syn__684_.BypassEn = 1'b0;
defparam syn__684_.CarryEnb = 1'b1;

alta_slice syn__685_(
	.A(\tc.DM [29]),
	.B(syn__241_),
	.C(syn__276_),
	.D(syn__005_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc.WD [29]),
	.Cout(),
	.Q());
defparam syn__685_.coord_x = 2;
defparam syn__685_.coord_y = 7;
defparam syn__685_.coord_z = 14;
defparam syn__685_.mask = 16'hB3A0;
defparam syn__685_.modeMux = 1'b0;
defparam syn__685_.FeedbackMux = 1'b0;
defparam syn__685_.ShiftMux = 1'b0;
defparam syn__685_.BypassEn = 1'b0;
defparam syn__685_.CarryEnb = 1'b1;

alta_slice syn__686_(
	.A(vcc),
	.B(syn__277_),
	.C(\tc.DM [28]),
	.D(syn__276_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc.WD [28]),
	.Cout(),
	.Q());
defparam syn__686_.coord_x = 2;
defparam syn__686_.coord_y = 3;
defparam syn__686_.coord_z = 11;
defparam syn__686_.mask = 16'hFCCC;
defparam syn__686_.modeMux = 1'b0;
defparam syn__686_.FeedbackMux = 1'b0;
defparam syn__686_.ShiftMux = 1'b0;
defparam syn__686_.BypassEn = 1'b0;
defparam syn__686_.CarryEnb = 1'b1;

alta_slice syn__687_(
	.A(vcc),
	.B(syn__238_),
	.C(syn__367_),
	.D(syn__005_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__277_),
	.Cout(),
	.Q());
defparam syn__687_.coord_x = 6;
defparam syn__687_.coord_y = 4;
defparam syn__687_.coord_z = 0;
defparam syn__687_.mask = 16'hCF00;
defparam syn__687_.modeMux = 1'b0;
defparam syn__687_.FeedbackMux = 1'b0;
defparam syn__687_.ShiftMux = 1'b0;
defparam syn__687_.BypassEn = 1'b0;
defparam syn__687_.CarryEnb = 1'b1;

alta_slice syn__688_(
	.A(\tc.DM [27]),
	.B(syn__276_),
	.C(syn__115_),
	.D(syn__005_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc.WD [27]),
	.Cout(),
	.Q());
defparam syn__688_.coord_x = 6;
defparam syn__688_.coord_y = 3;
defparam syn__688_.coord_z = 11;
defparam syn__688_.mask = 16'h8F88;
defparam syn__688_.modeMux = 1'b0;
defparam syn__688_.FeedbackMux = 1'b0;
defparam syn__688_.ShiftMux = 1'b0;
defparam syn__688_.BypassEn = 1'b0;
defparam syn__688_.CarryEnb = 1'b1;

alta_slice syn__689_(
	.A(\tc.DM [26]),
	.B(vcc),
	.C(syn__278_),
	.D(syn__276_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc.WD [26]),
	.Cout(),
	.Q());
defparam syn__689_.coord_x = 2;
defparam syn__689_.coord_y = 8;
defparam syn__689_.coord_z = 15;
defparam syn__689_.mask = 16'hFAF0;
defparam syn__689_.modeMux = 1'b0;
defparam syn__689_.FeedbackMux = 1'b0;
defparam syn__689_.ShiftMux = 1'b0;
defparam syn__689_.BypassEn = 1'b0;
defparam syn__689_.CarryEnb = 1'b1;

alta_slice syn__690_(
	.A(syn__005_),
	.B(syn__127_),
	.C(syn__129_),
	.D(syn__363_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__278_),
	.Cout(),
	.Q());
defparam syn__690_.coord_x = 6;
defparam syn__690_.coord_y = 3;
defparam syn__690_.coord_z = 1;
defparam syn__690_.mask = 16'h08AA;
defparam syn__690_.modeMux = 1'b0;
defparam syn__690_.FeedbackMux = 1'b0;
defparam syn__690_.ShiftMux = 1'b0;
defparam syn__690_.BypassEn = 1'b0;
defparam syn__690_.CarryEnb = 1'b1;

alta_slice syn__691_(
	.A(syn__276_),
	.B(syn__359_),
	.C(\tc.DM [25]),
	.D(syn__005_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc.WD [25]),
	.Cout(),
	.Q());
defparam syn__691_.coord_x = 2;
defparam syn__691_.coord_y = 7;
defparam syn__691_.coord_z = 2;
defparam syn__691_.mask = 16'hB3A0;
defparam syn__691_.modeMux = 1'b0;
defparam syn__691_.FeedbackMux = 1'b0;
defparam syn__691_.ShiftMux = 1'b0;
defparam syn__691_.BypassEn = 1'b0;
defparam syn__691_.CarryEnb = 1'b1;

alta_slice syn__692_(
	.A(\tc.DM [24]),
	.B(syn__276_),
	.C(syn__216_),
	.D(syn__005_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc.WD [24]),
	.Cout(),
	.Q());
defparam syn__692_.coord_x = 2;
defparam syn__692_.coord_y = 3;
defparam syn__692_.coord_z = 13;
defparam syn__692_.mask = 16'h8F88;
defparam syn__692_.modeMux = 1'b0;
defparam syn__692_.FeedbackMux = 1'b0;
defparam syn__692_.ShiftMux = 1'b0;
defparam syn__692_.BypassEn = 1'b0;
defparam syn__692_.CarryEnb = 1'b1;

alta_slice syn__693_(
	.A(vcc),
	.B(syn__261_),
	.C(syn__279_),
	.D(syn__005_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc.WD [23]),
	.Cout(),
	.Q());
defparam syn__693_.coord_x = 2;
defparam syn__693_.coord_y = 6;
defparam syn__693_.coord_z = 3;
defparam syn__693_.mask = 16'h3F0F;
defparam syn__693_.modeMux = 1'b0;
defparam syn__693_.FeedbackMux = 1'b0;
defparam syn__693_.ShiftMux = 1'b0;
defparam syn__693_.BypassEn = 1'b0;
defparam syn__693_.CarryEnb = 1'b1;

alta_slice syn__694_(
	.A(\tc.DM [23]),
	.B(\tc.IM [24]),
	.C(\tc.IM [23]),
	.D(syn__276_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__279_),
	.Cout(),
	.Q());
defparam syn__694_.coord_x = 2;
defparam syn__694_.coord_y = 6;
defparam syn__694_.coord_z = 10;
defparam syn__694_.mask = 16'h153F;
defparam syn__694_.modeMux = 1'b0;
defparam syn__694_.FeedbackMux = 1'b0;
defparam syn__694_.ShiftMux = 1'b0;
defparam syn__694_.BypassEn = 1'b0;
defparam syn__694_.CarryEnb = 1'b1;

alta_slice syn__695_(
	.A(vcc),
	.B(syn__280_),
	.C(syn__248_),
	.D(syn__005_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc.WD [22]),
	.Cout(),
	.Q());
defparam syn__695_.coord_x = 2;
defparam syn__695_.coord_y = 7;
defparam syn__695_.coord_z = 15;
defparam syn__695_.mask = 16'h3F33;
defparam syn__695_.modeMux = 1'b0;
defparam syn__695_.FeedbackMux = 1'b0;
defparam syn__695_.ShiftMux = 1'b0;
defparam syn__695_.BypassEn = 1'b0;
defparam syn__695_.CarryEnb = 1'b1;

alta_slice syn__696_(
	.A(\tc.IM [22]),
	.B(syn__276_),
	.C(\tc.DM [22]),
	.D(\tc.IM [24]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__280_),
	.Cout(),
	.Q());
defparam syn__696_.coord_x = 2;
defparam syn__696_.coord_y = 6;
defparam syn__696_.coord_z = 12;
defparam syn__696_.mask = 16'h153F;
defparam syn__696_.modeMux = 1'b0;
defparam syn__696_.FeedbackMux = 1'b0;
defparam syn__696_.ShiftMux = 1'b0;
defparam syn__696_.BypassEn = 1'b0;
defparam syn__696_.CarryEnb = 1'b1;

alta_slice syn__697_(
	.A(syn__237_),
	.B(syn__239_),
	.C(syn__281_),
	.D(syn__005_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc.WD [21]),
	.Cout(),
	.Q());
defparam syn__697_.coord_x = 6;
defparam syn__697_.coord_y = 4;
defparam syn__697_.coord_z = 11;
defparam syn__697_.mask = 16'hBF0F;
defparam syn__697_.modeMux = 1'b0;
defparam syn__697_.FeedbackMux = 1'b0;
defparam syn__697_.ShiftMux = 1'b0;
defparam syn__697_.BypassEn = 1'b0;
defparam syn__697_.CarryEnb = 1'b1;

alta_slice syn__698_(
	.A(\tc.IM [21]),
	.B(\tc.IM [24]),
	.C(syn__276_),
	.D(\tc.DM [21]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__281_),
	.Cout(),
	.Q());
defparam syn__698_.coord_x = 2;
defparam syn__698_.coord_y = 6;
defparam syn__698_.coord_z = 9;
defparam syn__698_.mask = 16'h0777;
defparam syn__698_.modeMux = 1'b0;
defparam syn__698_.FeedbackMux = 1'b0;
defparam syn__698_.ShiftMux = 1'b0;
defparam syn__698_.BypassEn = 1'b0;
defparam syn__698_.CarryEnb = 1'b1;

alta_slice syn__699_(
	.A(vcc),
	.B(syn__005_),
	.C(syn__282_),
	.D(syn__224_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc.WD [20]),
	.Cout(),
	.Q());
defparam syn__699_.coord_x = 2;
defparam syn__699_.coord_y = 7;
defparam syn__699_.coord_z = 11;
defparam syn__699_.mask = 16'h0FCF;
defparam syn__699_.modeMux = 1'b0;
defparam syn__699_.FeedbackMux = 1'b0;
defparam syn__699_.ShiftMux = 1'b0;
defparam syn__699_.BypassEn = 1'b0;
defparam syn__699_.CarryEnb = 1'b1;

alta_slice syn__700_(
	.A(\tc.IM [20]),
	.B(syn__276_),
	.C(\tc.DM [20]),
	.D(\tc.IM [24]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__282_),
	.Cout(),
	.Q());
defparam syn__700_.coord_x = 2;
defparam syn__700_.coord_y = 6;
defparam syn__700_.coord_z = 7;
defparam syn__700_.mask = 16'h153F;
defparam syn__700_.modeMux = 1'b0;
defparam syn__700_.FeedbackMux = 1'b0;
defparam syn__700_.ShiftMux = 1'b0;
defparam syn__700_.BypassEn = 1'b0;
defparam syn__700_.CarryEnb = 1'b1;

alta_slice syn__701_(
	.A(syn__283_),
	.B(vcc),
	.C(syn__128_),
	.D(syn__005_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc.WD [19]),
	.Cout(),
	.Q());
defparam syn__701_.coord_x = 2;
defparam syn__701_.coord_y = 7;
defparam syn__701_.coord_z = 6;
defparam syn__701_.mask = 16'h5F55;
defparam syn__701_.modeMux = 1'b0;
defparam syn__701_.FeedbackMux = 1'b0;
defparam syn__701_.ShiftMux = 1'b0;
defparam syn__701_.BypassEn = 1'b0;
defparam syn__701_.CarryEnb = 1'b1;

alta_slice syn__702_(
	.A(\tc.IM [19]),
	.B(\tc.IM [24]),
	.C(\tc.DM [19]),
	.D(syn__276_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__283_),
	.Cout(),
	.Q());
defparam syn__702_.coord_x = 2;
defparam syn__702_.coord_y = 6;
defparam syn__702_.coord_z = 4;
defparam syn__702_.mask = 16'h0777;
defparam syn__702_.modeMux = 1'b0;
defparam syn__702_.FeedbackMux = 1'b0;
defparam syn__702_.ShiftMux = 1'b0;
defparam syn__702_.BypassEn = 1'b0;
defparam syn__702_.CarryEnb = 1'b1;

alta_slice syn__703_(
	.A(vcc),
	.B(syn__361_),
	.C(syn__284_),
	.D(syn__005_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc.WD [18]),
	.Cout(),
	.Q());
defparam syn__703_.coord_x = 2;
defparam syn__703_.coord_y = 7;
defparam syn__703_.coord_z = 3;
defparam syn__703_.mask = 16'h3F0F;
defparam syn__703_.modeMux = 1'b0;
defparam syn__703_.FeedbackMux = 1'b0;
defparam syn__703_.ShiftMux = 1'b0;
defparam syn__703_.BypassEn = 1'b0;
defparam syn__703_.CarryEnb = 1'b1;

alta_slice syn__704_(
	.A(syn__276_),
	.B(\tc.IM [24]),
	.C(\tc.DM [18]),
	.D(\tc.IM [18]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__284_),
	.Cout(),
	.Q());
defparam syn__704_.coord_x = 2;
defparam syn__704_.coord_y = 6;
defparam syn__704_.coord_z = 0;
defparam syn__704_.mask = 16'h135F;
defparam syn__704_.modeMux = 1'b0;
defparam syn__704_.FeedbackMux = 1'b0;
defparam syn__704_.ShiftMux = 1'b0;
defparam syn__704_.BypassEn = 1'b0;
defparam syn__704_.CarryEnb = 1'b1;

alta_slice syn__705_(
	.A(syn__213_),
	.B(vcc),
	.C(syn__285_),
	.D(syn__005_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc.WD [17]),
	.Cout(),
	.Q());
defparam syn__705_.coord_x = 2;
defparam syn__705_.coord_y = 3;
defparam syn__705_.coord_z = 1;
defparam syn__705_.mask = 16'h5F0F;
defparam syn__705_.modeMux = 1'b0;
defparam syn__705_.FeedbackMux = 1'b0;
defparam syn__705_.ShiftMux = 1'b0;
defparam syn__705_.BypassEn = 1'b0;
defparam syn__705_.CarryEnb = 1'b1;

alta_slice syn__706_(
	.A(\tc.DM [17]),
	.B(\tc.IM [24]),
	.C(\tc.IM [17]),
	.D(syn__276_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__285_),
	.Cout(),
	.Q());
defparam syn__706_.coord_x = 2;
defparam syn__706_.coord_y = 6;
defparam syn__706_.coord_z = 14;
defparam syn__706_.mask = 16'h153F;
defparam syn__706_.modeMux = 1'b0;
defparam syn__706_.FeedbackMux = 1'b0;
defparam syn__706_.ShiftMux = 1'b0;
defparam syn__706_.BypassEn = 1'b0;
defparam syn__706_.CarryEnb = 1'b1;

alta_slice syn__707_(
	.A(vcc),
	.B(syn__005_),
	.C(syn__286_),
	.D(syn__163_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc.WD [16]),
	.Cout(),
	.Q());
defparam syn__707_.coord_x = 2;
defparam syn__707_.coord_y = 3;
defparam syn__707_.coord_z = 3;
defparam syn__707_.mask = 16'h0FCF;
defparam syn__707_.modeMux = 1'b0;
defparam syn__707_.FeedbackMux = 1'b0;
defparam syn__707_.ShiftMux = 1'b0;
defparam syn__707_.BypassEn = 1'b0;
defparam syn__707_.CarryEnb = 1'b1;

alta_slice syn__708_(
	.A(\tc.IM [16]),
	.B(syn__276_),
	.C(\tc.DM [16]),
	.D(\tc.IM [24]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__286_),
	.Cout(),
	.Q());
defparam syn__708_.coord_x = 2;
defparam syn__708_.coord_y = 6;
defparam syn__708_.coord_z = 6;
defparam syn__708_.mask = 16'h153F;
defparam syn__708_.modeMux = 1'b0;
defparam syn__708_.FeedbackMux = 1'b0;
defparam syn__708_.ShiftMux = 1'b0;
defparam syn__708_.BypassEn = 1'b0;
defparam syn__708_.CarryEnb = 1'b1;

alta_slice syn__709_(
	.A(vcc),
	.B(syn__287_),
	.C(syn__313_),
	.D(syn__005_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc.WD [15]),
	.Cout(),
	.Q());
defparam syn__709_.coord_x = 4;
defparam syn__709_.coord_y = 4;
defparam syn__709_.coord_z = 3;
defparam syn__709_.mask = 16'h3F33;
defparam syn__709_.modeMux = 1'b0;
defparam syn__709_.FeedbackMux = 1'b0;
defparam syn__709_.ShiftMux = 1'b0;
defparam syn__709_.BypassEn = 1'b0;
defparam syn__709_.CarryEnb = 1'b1;

alta_slice syn__710_(
	.A(\tc.IM [24]),
	.B(\tc.IM [15]),
	.C(\tc.DM [15]),
	.D(syn__276_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__287_),
	.Cout(),
	.Q());
defparam syn__710_.coord_x = 2;
defparam syn__710_.coord_y = 5;
defparam syn__710_.coord_z = 1;
defparam syn__710_.mask = 16'h0777;
defparam syn__710_.modeMux = 1'b0;
defparam syn__710_.FeedbackMux = 1'b0;
defparam syn__710_.ShiftMux = 1'b0;
defparam syn__710_.BypassEn = 1'b0;
defparam syn__710_.CarryEnb = 1'b1;

alta_slice syn__711_(
	.A(syn__288_),
	.B(vcc),
	.C(syn__251_),
	.D(syn__005_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc.WD [14]),
	.Cout(),
	.Q());
defparam syn__711_.coord_x = 2;
defparam syn__711_.coord_y = 5;
defparam syn__711_.coord_z = 5;
defparam syn__711_.mask = 16'h5F55;
defparam syn__711_.modeMux = 1'b0;
defparam syn__711_.FeedbackMux = 1'b0;
defparam syn__711_.ShiftMux = 1'b0;
defparam syn__711_.BypassEn = 1'b0;
defparam syn__711_.CarryEnb = 1'b1;

alta_slice syn__712_(
	.A(\tc.DM [14]),
	.B(\tc.IM [14]),
	.C(\tc.IM [24]),
	.D(syn__276_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__288_),
	.Cout(),
	.Q());
defparam syn__712_.coord_x = 2;
defparam syn__712_.coord_y = 5;
defparam syn__712_.coord_z = 0;
defparam syn__712_.mask = 16'h153F;
defparam syn__712_.modeMux = 1'b0;
defparam syn__712_.FeedbackMux = 1'b0;
defparam syn__712_.ShiftMux = 1'b0;
defparam syn__712_.BypassEn = 1'b0;
defparam syn__712_.CarryEnb = 1'b1;

alta_slice syn__713_(
	.A(syn__289_),
	.B(vcc),
	.C(syn__365_),
	.D(syn__005_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc.WD [13]),
	.Cout(),
	.Q());
defparam syn__713_.coord_x = 2;
defparam syn__713_.coord_y = 5;
defparam syn__713_.coord_z = 2;
defparam syn__713_.mask = 16'h5F55;
defparam syn__713_.modeMux = 1'b0;
defparam syn__713_.FeedbackMux = 1'b0;
defparam syn__713_.ShiftMux = 1'b0;
defparam syn__713_.BypassEn = 1'b0;
defparam syn__713_.CarryEnb = 1'b1;

alta_slice syn__714_(
	.A(\tc.IM [13]),
	.B(\tc.DM [13]),
	.C(\tc.IM [24]),
	.D(syn__276_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__289_),
	.Cout(),
	.Q());
defparam syn__714_.coord_x = 2;
defparam syn__714_.coord_y = 5;
defparam syn__714_.coord_z = 10;
defparam syn__714_.mask = 16'h135F;
defparam syn__714_.modeMux = 1'b0;
defparam syn__714_.FeedbackMux = 1'b0;
defparam syn__714_.ShiftMux = 1'b0;
defparam syn__714_.BypassEn = 1'b0;
defparam syn__714_.CarryEnb = 1'b1;

alta_slice syn__715_(
	.A(vcc),
	.B(syn__228_),
	.C(syn__290_),
	.D(syn__005_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc.WD [12]),
	.Cout(),
	.Q());
defparam syn__715_.coord_x = 2;
defparam syn__715_.coord_y = 5;
defparam syn__715_.coord_z = 3;
defparam syn__715_.mask = 16'h3F0F;
defparam syn__715_.modeMux = 1'b0;
defparam syn__715_.FeedbackMux = 1'b0;
defparam syn__715_.ShiftMux = 1'b0;
defparam syn__715_.BypassEn = 1'b0;
defparam syn__715_.CarryEnb = 1'b1;

alta_slice syn__716_(
	.A(\tc.IM [12]),
	.B(\tc.DM [12]),
	.C(\tc.IM [24]),
	.D(syn__276_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__290_),
	.Cout(),
	.Q());
defparam syn__716_.coord_x = 2;
defparam syn__716_.coord_y = 5;
defparam syn__716_.coord_z = 6;
defparam syn__716_.mask = 16'h135F;
defparam syn__716_.modeMux = 1'b0;
defparam syn__716_.FeedbackMux = 1'b0;
defparam syn__716_.ShiftMux = 1'b0;
defparam syn__716_.BypassEn = 1'b0;
defparam syn__716_.CarryEnb = 1'b1;

alta_slice syn__717_(
	.A(vcc),
	.B(syn__291_),
	.C(syn__220_),
	.D(syn__005_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc.WD [11]),
	.Cout(),
	.Q());
defparam syn__717_.coord_x = 6;
defparam syn__717_.coord_y = 3;
defparam syn__717_.coord_z = 2;
defparam syn__717_.mask = 16'h3F33;
defparam syn__717_.modeMux = 1'b0;
defparam syn__717_.FeedbackMux = 1'b0;
defparam syn__717_.ShiftMux = 1'b0;
defparam syn__717_.BypassEn = 1'b0;
defparam syn__717_.CarryEnb = 1'b1;

alta_slice syn__718_(
	.A(\tc.IM [24]),
	.B(\tc.IM [11]),
	.C(\tc.DM [11]),
	.D(syn__276_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__291_),
	.Cout(),
	.Q());
defparam syn__718_.coord_x = 2;
defparam syn__718_.coord_y = 5;
defparam syn__718_.coord_z = 7;
defparam syn__718_.mask = 16'h0777;
defparam syn__718_.modeMux = 1'b0;
defparam syn__718_.FeedbackMux = 1'b0;
defparam syn__718_.ShiftMux = 1'b0;
defparam syn__718_.BypassEn = 1'b0;
defparam syn__718_.CarryEnb = 1'b1;

alta_slice syn__719_(
	.A(vcc),
	.B(syn__329_),
	.C(syn__292_),
	.D(syn__005_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc.WD [10]),
	.Cout(),
	.Q());
defparam syn__719_.coord_x = 2;
defparam syn__719_.coord_y = 7;
defparam syn__719_.coord_z = 8;
defparam syn__719_.mask = 16'h3F0F;
defparam syn__719_.modeMux = 1'b0;
defparam syn__719_.FeedbackMux = 1'b0;
defparam syn__719_.ShiftMux = 1'b0;
defparam syn__719_.BypassEn = 1'b0;
defparam syn__719_.CarryEnb = 1'b1;

alta_slice syn__720_(
	.A(\tc.IM [24]),
	.B(\tc.IM [10]),
	.C(\tc.DM [10]),
	.D(syn__276_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__292_),
	.Cout(),
	.Q());
defparam syn__720_.coord_x = 2;
defparam syn__720_.coord_y = 5;
defparam syn__720_.coord_z = 13;
defparam syn__720_.mask = 16'h0777;
defparam syn__720_.modeMux = 1'b0;
defparam syn__720_.FeedbackMux = 1'b0;
defparam syn__720_.ShiftMux = 1'b0;
defparam syn__720_.BypassEn = 1'b0;
defparam syn__720_.CarryEnb = 1'b1;

alta_slice syn__721_(
	.A(vcc),
	.B(syn__293_),
	.C(syn__142_),
	.D(syn__005_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc.WD [9]),
	.Cout(),
	.Q());
defparam syn__721_.coord_x = 2;
defparam syn__721_.coord_y = 3;
defparam syn__721_.coord_z = 2;
defparam syn__721_.mask = 16'h3F33;
defparam syn__721_.modeMux = 1'b0;
defparam syn__721_.FeedbackMux = 1'b0;
defparam syn__721_.ShiftMux = 1'b0;
defparam syn__721_.BypassEn = 1'b0;
defparam syn__721_.CarryEnb = 1'b1;

alta_slice syn__722_(
	.A(\tc.DM [9]),
	.B(syn__276_),
	.C(\tc.IM [24]),
	.D(\tc.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__293_),
	.Cout(),
	.Q());
defparam syn__722_.coord_x = 2;
defparam syn__722_.coord_y = 5;
defparam syn__722_.coord_z = 14;
defparam syn__722_.mask = 16'h0777;
defparam syn__722_.modeMux = 1'b0;
defparam syn__722_.FeedbackMux = 1'b0;
defparam syn__722_.ShiftMux = 1'b0;
defparam syn__722_.BypassEn = 1'b0;
defparam syn__722_.CarryEnb = 1'b1;

alta_slice syn__723_(
	.A(vcc),
	.B(syn__153_),
	.C(syn__294_),
	.D(syn__005_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc.WD [8]),
	.Cout(),
	.Q());
defparam syn__723_.coord_x = 2;
defparam syn__723_.coord_y = 3;
defparam syn__723_.coord_z = 14;
defparam syn__723_.mask = 16'h3F0F;
defparam syn__723_.modeMux = 1'b0;
defparam syn__723_.FeedbackMux = 1'b0;
defparam syn__723_.ShiftMux = 1'b0;
defparam syn__723_.BypassEn = 1'b0;
defparam syn__723_.CarryEnb = 1'b1;

alta_slice syn__724_(
	.A(\tc.IM [24]),
	.B(\tc.DM [8]),
	.C(\tc.IM [8]),
	.D(syn__276_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__294_),
	.Cout(),
	.Q());
defparam syn__724_.coord_x = 2;
defparam syn__724_.coord_y = 3;
defparam syn__724_.coord_z = 6;
defparam syn__724_.mask = 16'h135F;
defparam syn__724_.modeMux = 1'b0;
defparam syn__724_.FeedbackMux = 1'b0;
defparam syn__724_.ShiftMux = 1'b0;
defparam syn__724_.BypassEn = 1'b0;
defparam syn__724_.CarryEnb = 1'b1;

alta_slice syn__725_(
	.A(syn__171_),
	.B(syn__211_),
	.C(syn__005_),
	.D(syn__295_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc.WD [7]),
	.Cout(),
	.Q());
defparam syn__725_.coord_x = 6;
defparam syn__725_.coord_y = 4;
defparam syn__725_.coord_z = 3;
defparam syn__725_.mask = 16'hB0FF;
defparam syn__725_.modeMux = 1'b0;
defparam syn__725_.FeedbackMux = 1'b0;
defparam syn__725_.ShiftMux = 1'b0;
defparam syn__725_.BypassEn = 1'b0;
defparam syn__725_.CarryEnb = 1'b1;

alta_slice syn__726_(
	.A(\tc.IM [7]),
	.B(syn__276_),
	.C(\tc.DM [7]),
	.D(\tc.IM [24]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__295_),
	.Cout(),
	.Q());
defparam syn__726_.coord_x = 2;
defparam syn__726_.coord_y = 5;
defparam syn__726_.coord_z = 8;
defparam syn__726_.mask = 16'h153F;
defparam syn__726_.modeMux = 1'b0;
defparam syn__726_.FeedbackMux = 1'b0;
defparam syn__726_.ShiftMux = 1'b0;
defparam syn__726_.BypassEn = 1'b0;
defparam syn__726_.CarryEnb = 1'b1;

alta_slice syn__727_(
	.A(syn__297_),
	.B(syn__296_),
	.C(syn__172_),
	.D(syn__005_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc.WD [6]),
	.Cout(),
	.Q());
defparam syn__727_.coord_x = 2;
defparam syn__727_.coord_y = 7;
defparam syn__727_.coord_z = 4;
defparam syn__727_.mask = 16'hDFDD;
defparam syn__727_.modeMux = 1'b0;
defparam syn__727_.FeedbackMux = 1'b0;
defparam syn__727_.ShiftMux = 1'b0;
defparam syn__727_.BypassEn = 1'b0;
defparam syn__727_.CarryEnb = 1'b1;

alta_slice syn__729_(
	.A(\tc.IM [24]),
	.B(\tc.DM [6]),
	.C(\tc.IM [6]),
	.D(syn__276_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__297_),
	.Cout(),
	.Q());
defparam syn__729_.coord_x = 2;
defparam syn__729_.coord_y = 5;
defparam syn__729_.coord_z = 11;
defparam syn__729_.mask = 16'h135F;
defparam syn__729_.modeMux = 1'b0;
defparam syn__729_.FeedbackMux = 1'b0;
defparam syn__729_.ShiftMux = 1'b0;
defparam syn__729_.BypassEn = 1'b0;
defparam syn__729_.CarryEnb = 1'b1;

alta_slice syn__730_(
	.A(syn__299_),
	.B(syn__184_),
	.C(syn__298_),
	.D(syn__005_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc.WD [5]),
	.Cout(),
	.Q());
defparam syn__730_.coord_x = 2;
defparam syn__730_.coord_y = 7;
defparam syn__730_.coord_z = 5;
defparam syn__730_.mask = 16'hF7F5;
defparam syn__730_.modeMux = 1'b0;
defparam syn__730_.FeedbackMux = 1'b0;
defparam syn__730_.ShiftMux = 1'b0;
defparam syn__730_.BypassEn = 1'b0;
defparam syn__730_.CarryEnb = 1'b1;

alta_slice syn__732_(
	.A(\tc.IM [24]),
	.B(\tc.IM [5]),
	.C(\tc.DM [5]),
	.D(syn__276_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__299_),
	.Cout(),
	.Q());
defparam syn__732_.coord_x = 2;
defparam syn__732_.coord_y = 5;
defparam syn__732_.coord_z = 9;
defparam syn__732_.mask = 16'h0777;
defparam syn__732_.modeMux = 1'b0;
defparam syn__732_.FeedbackMux = 1'b0;
defparam syn__732_.ShiftMux = 1'b0;
defparam syn__732_.BypassEn = 1'b0;
defparam syn__732_.CarryEnb = 1'b1;

alta_slice syn__733_(
	.A(syn__005_),
	.B(syn__300_),
	.C(syn__302_),
	.D(syn__194_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc.WD [4]),
	.Cout(),
	.Q());
defparam syn__733_.coord_x = 1;
defparam syn__733_.coord_y = 6;
defparam syn__733_.coord_z = 2;
defparam syn__733_.mask = 16'hCFEF;
defparam syn__733_.modeMux = 1'b0;
defparam syn__733_.FeedbackMux = 1'b0;
defparam syn__733_.ShiftMux = 1'b0;
defparam syn__733_.BypassEn = 1'b0;
defparam syn__733_.CarryEnb = 1'b1;

alta_slice syn__734_(
	.A(syn__301_),
	.B(\tc.PC [3]),
	.C(\tc.PC [4]),
	.D(syn__265_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__300_),
	.Cout(),
	.Q());
defparam syn__734_.coord_x = 1;
defparam syn__734_.coord_y = 3;
defparam syn__734_.coord_z = 15;
defparam syn__734_.mask = 16'h7800;
defparam syn__734_.modeMux = 1'b0;
defparam syn__734_.FeedbackMux = 1'b0;
defparam syn__734_.ShiftMux = 1'b0;
defparam syn__734_.BypassEn = 1'b0;
defparam syn__734_.CarryEnb = 1'b1;

alta_slice syn__736_(
	.A(\tc.DM [4]),
	.B(\tc.IM [24]),
	.C(\tc.IM [4]),
	.D(syn__276_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__302_),
	.Cout(),
	.Q());
defparam syn__736_.coord_x = 2;
defparam syn__736_.coord_y = 6;
defparam syn__736_.coord_z = 2;
defparam syn__736_.mask = 16'h153F;
defparam syn__736_.modeMux = 1'b0;
defparam syn__736_.FeedbackMux = 1'b0;
defparam syn__736_.ShiftMux = 1'b0;
defparam syn__736_.BypassEn = 1'b0;
defparam syn__736_.CarryEnb = 1'b1;

alta_slice syn__737_(
	.A(vcc),
	.B(syn__303_),
	.C(syn__200_),
	.D(syn__005_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc.WD [3]),
	.Cout(),
	.Q());
defparam syn__737_.coord_x = 2;
defparam syn__737_.coord_y = 7;
defparam syn__737_.coord_z = 1;
defparam syn__737_.mask = 16'h3F33;
defparam syn__737_.modeMux = 1'b0;
defparam syn__737_.FeedbackMux = 1'b0;
defparam syn__737_.ShiftMux = 1'b0;
defparam syn__737_.BypassEn = 1'b0;
defparam syn__737_.CarryEnb = 1'b1;

alta_slice syn__738_(
	.A(syn__301_),
	.B(syn__304_),
	.C(syn__265_),
	.D(\tc.PC [3]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__303_),
	.Cout(),
	.Q());
defparam syn__738_.coord_x = 1;
defparam syn__738_.coord_y = 3;
defparam syn__738_.coord_z = 9;
defparam syn__738_.mask = 16'h8C4C;
defparam syn__738_.modeMux = 1'b0;
defparam syn__738_.FeedbackMux = 1'b0;
defparam syn__738_.ShiftMux = 1'b0;
defparam syn__738_.BypassEn = 1'b0;
defparam syn__738_.CarryEnb = 1'b1;

alta_slice syn__739_(
	.A(\tc.IM [3]),
	.B(\tc.DM [3]),
	.C(\tc.IM [24]),
	.D(syn__276_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__304_),
	.Cout(),
	.Q());
defparam syn__739_.coord_x = 2;
defparam syn__739_.coord_y = 5;
defparam syn__739_.coord_z = 4;
defparam syn__739_.mask = 16'h135F;
defparam syn__739_.modeMux = 1'b0;
defparam syn__739_.FeedbackMux = 1'b0;
defparam syn__739_.ShiftMux = 1'b0;
defparam syn__739_.BypassEn = 1'b0;
defparam syn__739_.CarryEnb = 1'b1;

alta_slice syn__740_(
	.A(vcc),
	.B(syn__305_),
	.C(\tc.DM [2]),
	.D(syn__276_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc.WD [2]),
	.Cout(),
	.Q());
defparam syn__740_.coord_x = 2;
defparam syn__740_.coord_y = 3;
defparam syn__740_.coord_z = 15;
defparam syn__740_.mask = 16'hF333;
defparam syn__740_.modeMux = 1'b0;
defparam syn__740_.FeedbackMux = 1'b0;
defparam syn__740_.ShiftMux = 1'b0;
defparam syn__740_.BypassEn = 1'b0;
defparam syn__740_.CarryEnb = 1'b1;

alta_slice syn__741_(
	.A(\tc.IM [2]),
	.B(syn__306_),
	.C(syn__203_),
	.D(\tc.IM [24]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__305_),
	.Cout(),
	.Q());
defparam syn__741_.coord_x = 1;
defparam syn__741_.coord_y = 3;
defparam syn__741_.coord_z = 1;
defparam syn__741_.mask = 16'h1132;
defparam syn__741_.modeMux = 1'b0;
defparam syn__741_.FeedbackMux = 1'b0;
defparam syn__741_.ShiftMux = 1'b0;
defparam syn__741_.BypassEn = 1'b0;
defparam syn__741_.CarryEnb = 1'b1;

alta_slice syn__743_(
	.A(syn__307_),
	.B(vcc),
	.C(syn__355_),
	.D(syn__005_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc.WD [1]),
	.Cout(),
	.Q());
defparam syn__743_.coord_x = 1;
defparam syn__743_.coord_y = 6;
defparam syn__743_.coord_z = 1;
defparam syn__743_.mask = 16'h5F55;
defparam syn__743_.modeMux = 1'b0;
defparam syn__743_.FeedbackMux = 1'b0;
defparam syn__743_.ShiftMux = 1'b0;
defparam syn__743_.BypassEn = 1'b0;
defparam syn__743_.CarryEnb = 1'b1;

alta_slice syn__744_(
	.A(vcc),
	.B(\tc.IM [1]),
	.C(syn__308_),
	.D(\tc.IM [24]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__307_),
	.Cout(),
	.Q());
defparam syn__744_.coord_x = 2;
defparam syn__744_.coord_y = 6;
defparam syn__744_.coord_z = 13;
defparam syn__744_.mask = 16'h30F0;
defparam syn__744_.modeMux = 1'b0;
defparam syn__744_.FeedbackMux = 1'b0;
defparam syn__744_.ShiftMux = 1'b0;
defparam syn__744_.BypassEn = 1'b0;
defparam syn__744_.CarryEnb = 1'b1;

alta_slice syn__745_(
	.A(vcc),
	.B(\tc.DM [1]),
	.C(syn__309_),
	.D(syn__276_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__308_),
	.Cout(),
	.Q());
defparam syn__745_.coord_x = 2;
defparam syn__745_.coord_y = 6;
defparam syn__745_.coord_z = 8;
defparam syn__745_.mask = 16'h030F;
defparam syn__745_.modeMux = 1'b0;
defparam syn__745_.FeedbackMux = 1'b0;
defparam syn__745_.ShiftMux = 1'b0;
defparam syn__745_.BypassEn = 1'b0;
defparam syn__745_.CarryEnb = 1'b1;

alta_slice syn__746_(
	.A(\tc.PC [0]),
	.B(\tc.PC [1]),
	.C(vcc),
	.D(syn__265_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__309_),
	.Cout(),
	.Q());
defparam syn__746_.coord_x = 0;
defparam syn__746_.coord_y = 3;
defparam syn__746_.coord_z = 13;
defparam syn__746_.mask = 16'h6600;
defparam syn__746_.modeMux = 1'b0;
defparam syn__746_.FeedbackMux = 1'b0;
defparam syn__746_.ShiftMux = 1'b0;
defparam syn__746_.BypassEn = 1'b0;
defparam syn__746_.CarryEnb = 1'b1;

alta_slice syn__747_(
	.A(vcc),
	.B(syn__208_),
	.C(syn__310_),
	.D(syn__005_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc.WD [0]),
	.Cout(),
	.Q());
defparam syn__747_.coord_x = 2;
defparam syn__747_.coord_y = 3;
defparam syn__747_.coord_z = 12;
defparam syn__747_.mask = 16'h3F0F;
defparam syn__747_.modeMux = 1'b0;
defparam syn__747_.FeedbackMux = 1'b0;
defparam syn__747_.ShiftMux = 1'b0;
defparam syn__747_.BypassEn = 1'b0;
defparam syn__747_.CarryEnb = 1'b1;

alta_slice syn__748_(
	.A(\tc.DM [0]),
	.B(syn__311_),
	.C(vcc),
	.D(syn__276_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__310_),
	.Cout(),
	.Q());
defparam syn__748_.coord_x = 2;
defparam syn__748_.coord_y = 3;
defparam syn__748_.coord_z = 8;
defparam syn__748_.mask = 16'h44CC;
defparam syn__748_.modeMux = 1'b0;
defparam syn__748_.FeedbackMux = 1'b0;
defparam syn__748_.ShiftMux = 1'b0;
defparam syn__748_.BypassEn = 1'b0;
defparam syn__748_.CarryEnb = 1'b1;

alta_slice syn__749_(
	.A(\tc.PC [0]),
	.B(\tc.IM [0]),
	.C(syn__265_),
	.D(\tc.IM [24]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__311_),
	.Cout(),
	.Q());
defparam syn__749_.coord_x = 0;
defparam syn__749_.coord_y = 3;
defparam syn__749_.coord_z = 4;
defparam syn__749_.mask = 16'h23AF;
defparam syn__749_.modeMux = 1'b0;
defparam syn__749_.FeedbackMux = 1'b0;
defparam syn__749_.ShiftMux = 1'b0;
defparam syn__749_.BypassEn = 1'b0;
defparam syn__749_.CarryEnb = 1'b1;

alta_slice syn__750_(
	.A(\tc.IM [0]),
	.B(syn__005_),
	.C(vcc),
	.D(\tc.IM [1]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc.WriteDM ),
	.Cout(),
	.Q());
defparam syn__750_.coord_x = 1;
defparam syn__750_.coord_y = 6;
defparam syn__750_.coord_z = 11;
defparam syn__750_.mask = 16'h4400;
defparam syn__750_.modeMux = 1'b0;
defparam syn__750_.FeedbackMux = 1'b0;
defparam syn__750_.ShiftMux = 1'b0;
defparam syn__750_.BypassEn = 1'b0;
defparam syn__750_.CarryEnb = 1'b1;

alta_slice syn__751_(
	.A(syn__103_),
	.B(\tc.IM [6]),
	.C(syn__317_),
	.D(\tc.IM [5]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__312_),
	.Cout(),
	.Q());
defparam syn__751_.coord_x = 5;
defparam syn__751_.coord_y = 3;
defparam syn__751_.coord_z = 12;
defparam syn__751_.mask = 16'hCCB8;
defparam syn__751_.modeMux = 1'b0;
defparam syn__751_.FeedbackMux = 1'b0;
defparam syn__751_.ShiftMux = 1'b0;
defparam syn__751_.BypassEn = 1'b0;
defparam syn__751_.CarryEnb = 1'b1;

alta_slice syn__752_(
	.A(syn__312_),
	.B(syn__016_),
	.C(syn__315_),
	.D(\tc.IM [5]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__313_),
	.Cout(),
	.Q());
defparam syn__752_.coord_x = 4;
defparam syn__752_.coord_y = 4;
defparam syn__752_.coord_z = 12;
defparam syn__752_.mask = 16'hD8AA;
defparam syn__752_.modeMux = 1'b0;
defparam syn__752_.FeedbackMux = 1'b0;
defparam syn__752_.ShiftMux = 1'b0;
defparam syn__752_.BypassEn = 1'b0;
defparam syn__752_.CarryEnb = 1'b1;

alta_slice syn__753_(
	.A(IOaddr[16]),
	.B(IOvalue[16]),
	.C(\tc.IM [7]),
	.D(\tc.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__314_),
	.Cout(),
	.Q());
defparam syn__753_.coord_x = 7;
defparam syn__753_.coord_y = 8;
defparam syn__753_.coord_z = 2;
defparam syn__753_.mask = 16'h9F17;
defparam syn__753_.modeMux = 1'b0;
defparam syn__753_.FeedbackMux = 1'b0;
defparam syn__753_.ShiftMux = 1'b0;
defparam syn__753_.BypassEn = 1'b0;
defparam syn__753_.CarryEnb = 1'b1;

alta_slice syn__754_(
	.A(syn__314_),
	.B(\tc.IM [9]),
	.C(syn__027_),
	.D(syn__108_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__315_),
	.Cout(),
	.Q());
defparam syn__754_.coord_x = 7;
defparam syn__754_.coord_y = 8;
defparam syn__754_.coord_z = 12;
defparam syn__754_.mask = 16'h8BB8;
defparam syn__754_.modeMux = 1'b0;
defparam syn__754_.FeedbackMux = 1'b0;
defparam syn__754_.ShiftMux = 1'b0;
defparam syn__754_.BypassEn = 1'b0;
defparam syn__754_.CarryEnb = 1'b1;

alta_slice syn__755_(
	.A(\tc.IM [8]),
	.B(IOvalue[15]),
	.C(\tc.IM [7]),
	.D(IOaddr[15]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__316_),
	.Cout(),
	.Q());
defparam syn__755_.coord_x = 5;
defparam syn__755_.coord_y = 6;
defparam syn__755_.coord_z = 7;
defparam syn__755_.mask = 16'h74C0;
defparam syn__755_.modeMux = 1'b0;
defparam syn__755_.FeedbackMux = 1'b0;
defparam syn__755_.ShiftMux = 1'b0;
defparam syn__755_.BypassEn = 1'b0;
defparam syn__755_.CarryEnb = 1'b1;

alta_slice syn__756_(
	.A(syn__316_),
	.B(\tc.IM [9]),
	.C(syn__109_),
	.D(vcc),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__317_),
	.Cout(),
	.Q());
defparam syn__756_.coord_x = 4;
defparam syn__756_.coord_y = 7;
defparam syn__756_.coord_z = 12;
defparam syn__756_.mask = 16'h0707;
defparam syn__756_.modeMux = 1'b0;
defparam syn__756_.FeedbackMux = 1'b0;
defparam syn__756_.ShiftMux = 1'b0;
defparam syn__756_.BypassEn = 1'b0;
defparam syn__756_.CarryEnb = 1'b1;

alta_slice syn__757_(
	.A(\tc.IM [8]),
	.B(IOvalue[28]),
	.C(\tc.IM [7]),
	.D(IOaddr[28]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__318_),
	.Cout(),
	.Q());
defparam syn__757_.coord_x = 4;
defparam syn__757_.coord_y = 7;
defparam syn__757_.coord_z = 8;
defparam syn__757_.mask = 16'h8B3F;
defparam syn__757_.modeMux = 1'b0;
defparam syn__757_.FeedbackMux = 1'b0;
defparam syn__757_.ShiftMux = 1'b0;
defparam syn__757_.BypassEn = 1'b0;
defparam syn__757_.CarryEnb = 1'b1;

alta_slice syn__758_(
	.A(syn__019_),
	.B(syn__318_),
	.C(syn__116_),
	.D(\tc.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__319_),
	.Cout(),
	.Q());
defparam syn__758_.coord_x = 6;
defparam syn__758_.coord_y = 3;
defparam syn__758_.coord_z = 15;
defparam syn__758_.mask = 16'hCC5A;
defparam syn__758_.modeMux = 1'b0;
defparam syn__758_.FeedbackMux = 1'b0;
defparam syn__758_.ShiftMux = 1'b0;
defparam syn__758_.BypassEn = 1'b0;
defparam syn__758_.CarryEnb = 1'b1;

alta_slice syn__759_(
	.A(IOaddr[11]),
	.B(IOvalue[11]),
	.C(\tc.IM [8]),
	.D(\tc.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__320_),
	.Cout(),
	.Q());
defparam syn__759_.coord_x = 4;
defparam syn__759_.coord_y = 6;
defparam syn__759_.coord_z = 10;
defparam syn__759_.mask = 16'h91F7;
defparam syn__759_.modeMux = 1'b0;
defparam syn__759_.FeedbackMux = 1'b0;
defparam syn__759_.ShiftMux = 1'b0;
defparam syn__759_.BypassEn = 1'b0;
defparam syn__759_.CarryEnb = 1'b1;

alta_slice syn__760_(
	.A(syn__125_),
	.B(syn__124_),
	.C(syn__320_),
	.D(\tc.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__321_),
	.Cout(),
	.Q());
defparam syn__760_.coord_x = 4;
defparam syn__760_.coord_y = 6;
defparam syn__760_.coord_z = 3;
defparam syn__760_.mask = 16'hF066;
defparam syn__760_.modeMux = 1'b0;
defparam syn__760_.FeedbackMux = 1'b0;
defparam syn__760_.ShiftMux = 1'b0;
defparam syn__760_.BypassEn = 1'b0;
defparam syn__760_.CarryEnb = 1'b1;

alta_slice syn__761_(
	.A(IOaddr[3]),
	.B(IOvalue[3]),
	.C(\tc.IM [8]),
	.D(\tc.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__322_),
	.Cout(),
	.Q());
defparam syn__761_.coord_x = 4;
defparam syn__761_.coord_y = 5;
defparam syn__761_.coord_z = 0;
defparam syn__761_.mask = 16'h6E08;
defparam syn__761_.modeMux = 1'b0;
defparam syn__761_.FeedbackMux = 1'b0;
defparam syn__761_.ShiftMux = 1'b0;
defparam syn__761_.BypassEn = 1'b0;
defparam syn__761_.CarryEnb = 1'b1;

alta_slice syn__762_(
	.A(syn__126_),
	.B(\tc.IM [9]),
	.C(syn__322_),
	.D(vcc),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__323_),
	.Cout(),
	.Q());
defparam syn__762_.coord_x = 6;
defparam syn__762_.coord_y = 6;
defparam syn__762_.coord_z = 13;
defparam syn__762_.mask = 16'h1515;
defparam syn__762_.modeMux = 1'b0;
defparam syn__762_.FeedbackMux = 1'b0;
defparam syn__762_.ShiftMux = 1'b0;
defparam syn__762_.BypassEn = 1'b0;
defparam syn__762_.CarryEnb = 1'b1;

alta_slice syn__763_(
	.A(\tc.IM [8]),
	.B(IOaddr[20]),
	.C(IOvalue[20]),
	.D(\tc.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__324_),
	.Cout(),
	.Q());
defparam syn__763_.coord_x = 6;
defparam syn__763_.coord_y = 6;
defparam syn__763_.coord_z = 3;
defparam syn__763_.mask = 16'h83BF;
defparam syn__763_.modeMux = 1'b0;
defparam syn__763_.FeedbackMux = 1'b0;
defparam syn__763_.ShiftMux = 1'b0;
defparam syn__763_.BypassEn = 1'b0;
defparam syn__763_.CarryEnb = 1'b1;

alta_slice syn__764_(
	.A(vcc),
	.B(syn__324_),
	.C(syn__131_),
	.D(\tc.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__325_),
	.Cout(),
	.Q());
defparam syn__764_.coord_x = 6;
defparam syn__764_.coord_y = 6;
defparam syn__764_.coord_z = 5;
defparam syn__764_.mask = 16'hCC0F;
defparam syn__764_.modeMux = 1'b0;
defparam syn__764_.FeedbackMux = 1'b0;
defparam syn__764_.ShiftMux = 1'b0;
defparam syn__764_.BypassEn = 1'b0;
defparam syn__764_.CarryEnb = 1'b1;

alta_slice syn__765_(
	.A(IOvalue[19]),
	.B(IOaddr[19]),
	.C(\tc.IM [8]),
	.D(\tc.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__326_),
	.Cout(),
	.Q());
defparam syn__765_.coord_x = 6;
defparam syn__765_.coord_y = 6;
defparam syn__765_.coord_z = 4;
defparam syn__765_.mask = 16'h91F7;
defparam syn__765_.modeMux = 1'b0;
defparam syn__765_.FeedbackMux = 1'b0;
defparam syn__765_.ShiftMux = 1'b0;
defparam syn__765_.BypassEn = 1'b0;
defparam syn__765_.CarryEnb = 1'b1;

alta_slice syn__766_(
	.A(syn__133_),
	.B(syn__025_),
	.C(syn__326_),
	.D(\tc.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__327_),
	.Cout(),
	.Q());
defparam syn__766_.coord_x = 6;
defparam syn__766_.coord_y = 6;
defparam syn__766_.coord_z = 14;
defparam syn__766_.mask = 16'hF066;
defparam syn__766_.modeMux = 1'b0;
defparam syn__766_.FeedbackMux = 1'b0;
defparam syn__766_.ShiftMux = 1'b0;
defparam syn__766_.BypassEn = 1'b0;
defparam syn__766_.CarryEnb = 1'b1;

alta_slice syn__767_(
	.A(syn__333_),
	.B(\tc.IM [6]),
	.C(syn__136_),
	.D(\tc.IM [5]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__328_),
	.Cout(),
	.Q());
defparam syn__767_.coord_x = 5;
defparam syn__767_.coord_y = 3;
defparam syn__767_.coord_z = 2;
defparam syn__767_.mask = 16'hCCE2;
defparam syn__767_.modeMux = 1'b0;
defparam syn__767_.FeedbackMux = 1'b0;
defparam syn__767_.ShiftMux = 1'b0;
defparam syn__767_.BypassEn = 1'b0;
defparam syn__767_.CarryEnb = 1'b1;

alta_slice syn__768_(
	.A(\tc.IM [5]),
	.B(syn__331_),
	.C(syn__328_),
	.D(syn__321_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__329_),
	.Cout(),
	.Q());
defparam syn__768_.coord_x = 4;
defparam syn__768_.coord_y = 3;
defparam syn__768_.coord_z = 8;
defparam syn__768_.mask = 16'hDAD0;
defparam syn__768_.modeMux = 1'b0;
defparam syn__768_.FeedbackMux = 1'b0;
defparam syn__768_.ShiftMux = 1'b0;
defparam syn__768_.BypassEn = 1'b0;
defparam syn__768_.CarryEnb = 1'b1;

alta_slice syn__769_(
	.A(IOaddr[26]),
	.B(\tc.IM [8]),
	.C(IOvalue[26]),
	.D(\tc.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__330_),
	.Cout(),
	.Q());
defparam syn__769_.coord_x = 4;
defparam syn__769_.coord_y = 7;
defparam syn__769_.coord_z = 6;
defparam syn__769_.mask = 16'h85DF;
defparam syn__769_.modeMux = 1'b0;
defparam syn__769_.FeedbackMux = 1'b0;
defparam syn__769_.ShiftMux = 1'b0;
defparam syn__769_.BypassEn = 1'b0;
defparam syn__769_.CarryEnb = 1'b1;

alta_slice syn__770_(
	.A(syn__135_),
	.B(syn__330_),
	.C(\tc.IM [9]),
	.D(vcc),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__331_),
	.Cout(),
	.Q());
defparam syn__770_.coord_x = 4;
defparam syn__770_.coord_y = 3;
defparam syn__770_.coord_z = 1;
defparam syn__770_.mask = 16'hC5C5;
defparam syn__770_.modeMux = 1'b0;
defparam syn__770_.FeedbackMux = 1'b0;
defparam syn__770_.ShiftMux = 1'b0;
defparam syn__770_.BypassEn = 1'b0;
defparam syn__770_.CarryEnb = 1'b1;

alta_slice syn__771_(
	.A(IOaddr[10]),
	.B(IOvalue[10]),
	.C(\tc.IM [8]),
	.D(\tc.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__332_),
	.Cout(),
	.Q());
defparam syn__771_.coord_x = 4;
defparam syn__771_.coord_y = 6;
defparam syn__771_.coord_z = 7;
defparam syn__771_.mask = 16'h91F7;
defparam syn__771_.modeMux = 1'b0;
defparam syn__771_.FeedbackMux = 1'b0;
defparam syn__771_.ShiftMux = 1'b0;
defparam syn__771_.BypassEn = 1'b0;
defparam syn__771_.CarryEnb = 1'b1;

alta_slice syn__772_(
	.A(syn__140_),
	.B(syn__332_),
	.C(syn__031_),
	.D(\tc.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__333_),
	.Cout(),
	.Q());
defparam syn__772_.coord_x = 4;
defparam syn__772_.coord_y = 6;
defparam syn__772_.coord_z = 6;
defparam syn__772_.mask = 16'hCC5A;
defparam syn__772_.modeMux = 1'b0;
defparam syn__772_.FeedbackMux = 1'b0;
defparam syn__772_.ShiftMux = 1'b0;
defparam syn__772_.BypassEn = 1'b0;
defparam syn__772_.CarryEnb = 1'b1;

alta_slice syn__773_(
	.A(IOaddr[25]),
	.B(\tc.IM [8]),
	.C(IOvalue[25]),
	.D(\tc.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__334_),
	.Cout(),
	.Q());
defparam syn__773_.coord_x = 4;
defparam syn__773_.coord_y = 7;
defparam syn__773_.coord_z = 10;
defparam syn__773_.mask = 16'h85DF;
defparam syn__773_.modeMux = 1'b0;
defparam syn__773_.FeedbackMux = 1'b0;
defparam syn__773_.ShiftMux = 1'b0;
defparam syn__773_.BypassEn = 1'b0;
defparam syn__773_.CarryEnb = 1'b1;

alta_slice syn__774_(
	.A(syn__334_),
	.B(syn__021_),
	.C(syn__143_),
	.D(\tc.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__335_),
	.Cout(),
	.Q());
defparam syn__774_.coord_x = 4;
defparam syn__774_.coord_y = 7;
defparam syn__774_.coord_z = 1;
defparam syn__774_.mask = 16'hAA3C;
defparam syn__774_.modeMux = 1'b0;
defparam syn__774_.FeedbackMux = 1'b0;
defparam syn__774_.ShiftMux = 1'b0;
defparam syn__774_.BypassEn = 1'b0;
defparam syn__774_.CarryEnb = 1'b1;

alta_slice syn__775_(
	.A(IOaddr[9]),
	.B(\tc.IM [7]),
	.C(IOvalue[9]),
	.D(\tc.IM [8]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__336_),
	.Cout(),
	.Q());
defparam syn__775_.coord_x = 5;
defparam syn__775_.coord_y = 8;
defparam syn__775_.coord_z = 6;
defparam syn__775_.mask = 16'h48E8;
defparam syn__775_.modeMux = 1'b0;
defparam syn__775_.FeedbackMux = 1'b0;
defparam syn__775_.ShiftMux = 1'b0;
defparam syn__775_.BypassEn = 1'b0;
defparam syn__775_.CarryEnb = 1'b1;

alta_slice syn__776_(
	.A(vcc),
	.B(syn__150_),
	.C(syn__336_),
	.D(\tc.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__337_),
	.Cout(),
	.Q());
defparam syn__776_.coord_x = 6;
defparam syn__776_.coord_y = 6;
defparam syn__776_.coord_z = 12;
defparam syn__776_.mask = 16'h0333;
defparam syn__776_.modeMux = 1'b0;
defparam syn__776_.FeedbackMux = 1'b0;
defparam syn__776_.ShiftMux = 1'b0;
defparam syn__776_.BypassEn = 1'b0;
defparam syn__776_.CarryEnb = 1'b1;

alta_slice syn__777_(
	.A(\tc.IM [7]),
	.B(IOvalue[22]),
	.C(\tc.IM [8]),
	.D(IOaddr[22]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__338_),
	.Cout(),
	.Q());
defparam syn__777_.coord_x = 6;
defparam syn__777_.coord_y = 5;
defparam syn__777_.coord_z = 13;
defparam syn__777_.mask = 16'hD177;
defparam syn__777_.modeMux = 1'b0;
defparam syn__777_.FeedbackMux = 1'b0;
defparam syn__777_.ShiftMux = 1'b0;
defparam syn__777_.BypassEn = 1'b0;
defparam syn__777_.CarryEnb = 1'b1;

alta_slice syn__778_(
	.A(\tc.IM [9]),
	.B(syn__173_),
	.C(syn__023_),
	.D(syn__338_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__339_),
	.Cout(),
	.Q());
defparam syn__778_.coord_x = 5;
defparam syn__778_.coord_y = 4;
defparam syn__778_.coord_z = 15;
defparam syn__778_.mask = 16'hBE14;
defparam syn__778_.modeMux = 1'b0;
defparam syn__778_.FeedbackMux = 1'b0;
defparam syn__778_.ShiftMux = 1'b0;
defparam syn__778_.BypassEn = 1'b0;
defparam syn__778_.CarryEnb = 1'b1;

alta_slice syn__779_(
	.A(\tc.IM [8]),
	.B(IOaddr[6]),
	.C(IOvalue[6]),
	.D(\tc.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__340_),
	.Cout(),
	.Q());
defparam syn__779_.coord_x = 4;
defparam syn__779_.coord_y = 7;
defparam syn__779_.coord_z = 3;
defparam syn__779_.mask = 16'h7C40;
defparam syn__779_.modeMux = 1'b0;
defparam syn__779_.FeedbackMux = 1'b0;
defparam syn__779_.ShiftMux = 1'b0;
defparam syn__779_.BypassEn = 1'b0;
defparam syn__779_.CarryEnb = 1'b1;

alta_slice syn__780_(
	.A(vcc),
	.B(syn__340_),
	.C(syn__180_),
	.D(\tc.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__341_),
	.Cout(),
	.Q());
defparam syn__780_.coord_x = 4;
defparam syn__780_.coord_y = 7;
defparam syn__780_.coord_z = 7;
defparam syn__780_.mask = 16'h030F;
defparam syn__780_.modeMux = 1'b0;
defparam syn__780_.FeedbackMux = 1'b0;
defparam syn__780_.ShiftMux = 1'b0;
defparam syn__780_.BypassEn = 1'b0;
defparam syn__780_.CarryEnb = 1'b1;

alta_slice syn__781_(
	.A(IOaddr[7]),
	.B(\tc.IM [8]),
	.C(IOvalue[7]),
	.D(\tc.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__342_),
	.Cout(),
	.Q());
defparam syn__781_.coord_x = 5;
defparam syn__781_.coord_y = 8;
defparam syn__781_.coord_z = 0;
defparam syn__781_.mask = 16'h85DF;
defparam syn__781_.modeMux = 1'b0;
defparam syn__781_.FeedbackMux = 1'b0;
defparam syn__781_.ShiftMux = 1'b0;
defparam syn__781_.BypassEn = 1'b0;
defparam syn__781_.CarryEnb = 1'b1;

alta_slice syn__782_(
	.A(syn__182_),
	.B(syn__033_),
	.C(syn__342_),
	.D(\tc.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__343_),
	.Cout(),
	.Q());
defparam syn__782_.coord_x = 5;
defparam syn__782_.coord_y = 8;
defparam syn__782_.coord_z = 12;
defparam syn__782_.mask = 16'hF066;
defparam syn__782_.modeMux = 1'b0;
defparam syn__782_.FeedbackMux = 1'b0;
defparam syn__782_.ShiftMux = 1'b0;
defparam syn__782_.BypassEn = 1'b0;
defparam syn__782_.CarryEnb = 1'b1;

alta_slice syn__783_(
	.A(IOaddr[13]),
	.B(\tc.IM [7]),
	.C(\tc.IM [8]),
	.D(IOvalue[13]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__344_),
	.Cout(),
	.Q());
defparam syn__783_.coord_x = 5;
defparam syn__783_.coord_y = 6;
defparam syn__783_.coord_z = 13;
defparam syn__783_.mask = 16'hB177;
defparam syn__783_.modeMux = 1'b0;
defparam syn__783_.FeedbackMux = 1'b0;
defparam syn__783_.ShiftMux = 1'b0;
defparam syn__783_.BypassEn = 1'b0;
defparam syn__783_.CarryEnb = 1'b1;

alta_slice syn__784_(
	.A(syn__188_),
	.B(syn__029_),
	.C(syn__344_),
	.D(\tc.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__345_),
	.Cout(),
	.Q());
defparam syn__784_.coord_x = 5;
defparam syn__784_.coord_y = 6;
defparam syn__784_.coord_z = 12;
defparam syn__784_.mask = 16'hF066;
defparam syn__784_.modeMux = 1'b0;
defparam syn__784_.FeedbackMux = 1'b0;
defparam syn__784_.ShiftMux = 1'b0;
defparam syn__784_.BypassEn = 1'b0;
defparam syn__784_.CarryEnb = 1'b1;

alta_slice syn__785_(
	.A(IOvalue[5]),
	.B(IOaddr[5]),
	.C(\tc.IM [8]),
	.D(\tc.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__346_),
	.Cout(),
	.Q());
defparam syn__785_.coord_x = 4;
defparam syn__785_.coord_y = 8;
defparam syn__785_.coord_z = 6;
defparam syn__785_.mask = 16'h91F7;
defparam syn__785_.modeMux = 1'b0;
defparam syn__785_.FeedbackMux = 1'b0;
defparam syn__785_.ShiftMux = 1'b0;
defparam syn__785_.BypassEn = 1'b0;
defparam syn__785_.CarryEnb = 1'b1;

alta_slice syn__786_(
	.A(syn__346_),
	.B(syn__190_),
	.C(syn__191_),
	.D(\tc.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__347_),
	.Cout(),
	.Q());
defparam syn__786_.coord_x = 4;
defparam syn__786_.coord_y = 8;
defparam syn__786_.coord_z = 0;
defparam syn__786_.mask = 16'hAA3C;
defparam syn__786_.modeMux = 1'b0;
defparam syn__786_.FeedbackMux = 1'b0;
defparam syn__786_.ShiftMux = 1'b0;
defparam syn__786_.BypassEn = 1'b0;
defparam syn__786_.CarryEnb = 1'b1;

alta_slice syn__787_(
	.A(IOvalue[12]),
	.B(IOaddr[12]),
	.C(\tc.IM [8]),
	.D(\tc.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__348_),
	.Cout(),
	.Q());
defparam syn__787_.coord_x = 4;
defparam syn__787_.coord_y = 6;
defparam syn__787_.coord_z = 13;
defparam syn__787_.mask = 16'h6E08;
defparam syn__787_.modeMux = 1'b0;
defparam syn__787_.FeedbackMux = 1'b0;
defparam syn__787_.ShiftMux = 1'b0;
defparam syn__787_.BypassEn = 1'b0;
defparam syn__787_.CarryEnb = 1'b1;

alta_slice syn__788_(
	.A(vcc),
	.B(syn__348_),
	.C(syn__196_),
	.D(\tc.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__349_),
	.Cout(),
	.Q());
defparam syn__788_.coord_x = 4;
defparam syn__788_.coord_y = 6;
defparam syn__788_.coord_z = 9;
defparam syn__788_.mask = 16'h030F;
defparam syn__788_.modeMux = 1'b0;
defparam syn__788_.FeedbackMux = 1'b0;
defparam syn__788_.ShiftMux = 1'b0;
defparam syn__788_.BypassEn = 1'b0;
defparam syn__788_.CarryEnb = 1'b1;

alta_slice syn__789_(
	.A(IOvalue[4]),
	.B(IOaddr[4]),
	.C(\tc.IM [8]),
	.D(\tc.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__350_),
	.Cout(),
	.Q());
defparam syn__789_.coord_x = 4;
defparam syn__789_.coord_y = 8;
defparam syn__789_.coord_z = 2;
defparam syn__789_.mask = 16'h91F7;
defparam syn__789_.modeMux = 1'b0;
defparam syn__789_.FeedbackMux = 1'b0;
defparam syn__789_.ShiftMux = 1'b0;
defparam syn__789_.BypassEn = 1'b0;
defparam syn__789_.CarryEnb = 1'b1;

alta_slice syn__790_(
	.A(syn__350_),
	.B(syn__035_),
	.C(syn__198_),
	.D(\tc.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__351_),
	.Cout(),
	.Q());
defparam syn__790_.coord_x = 4;
defparam syn__790_.coord_y = 8;
defparam syn__790_.coord_z = 1;
defparam syn__790_.mask = 16'hAA3C;
defparam syn__790_.modeMux = 1'b0;
defparam syn__790_.FeedbackMux = 1'b0;
defparam syn__790_.ShiftMux = 1'b0;
defparam syn__790_.BypassEn = 1'b0;
defparam syn__790_.CarryEnb = 1'b1;

alta_slice syn__791_(
	.A(IOaddr[2]),
	.B(IOvalue[2]),
	.C(\tc.IM [8]),
	.D(\tc.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__352_),
	.Cout(),
	.Q());
defparam syn__791_.coord_x = 4;
defparam syn__791_.coord_y = 5;
defparam syn__791_.coord_z = 11;
defparam syn__791_.mask = 16'h91F7;
defparam syn__791_.modeMux = 1'b0;
defparam syn__791_.FeedbackMux = 1'b0;
defparam syn__791_.ShiftMux = 1'b0;
defparam syn__791_.BypassEn = 1'b0;
defparam syn__791_.CarryEnb = 1'b1;

alta_slice syn__792_(
	.A(\tc.IM [9]),
	.B(vcc),
	.C(syn__206_),
	.D(syn__352_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__353_),
	.Cout(),
	.Q());
defparam syn__792_.coord_x = 4;
defparam syn__792_.coord_y = 3;
defparam syn__792_.coord_z = 6;
defparam syn__792_.mask = 16'hAF05;
defparam syn__792_.modeMux = 1'b0;
defparam syn__792_.FeedbackMux = 1'b0;
defparam syn__792_.ShiftMux = 1'b0;
defparam syn__792_.BypassEn = 1'b0;
defparam syn__792_.CarryEnb = 1'b1;

alta_slice syn__793_(
	.A(syn__337_),
	.B(syn__357_),
	.C(\tc.IM [6]),
	.D(\tc.IM [5]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__354_),
	.Cout(),
	.Q());
defparam syn__793_.coord_x = 5;
defparam syn__793_.coord_y = 3;
defparam syn__793_.coord_z = 14;
defparam syn__793_.mask = 16'hF0AC;
defparam syn__793_.modeMux = 1'b0;
defparam syn__793_.FeedbackMux = 1'b0;
defparam syn__793_.ShiftMux = 1'b0;
defparam syn__793_.BypassEn = 1'b0;
defparam syn__793_.CarryEnb = 1'b1;

alta_slice syn__794_(
	.A(syn__145_),
	.B(\tc.IM [5]),
	.C(syn__353_),
	.D(syn__354_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__355_),
	.Cout(),
	.Q());
defparam syn__794_.coord_x = 4;
defparam syn__794_.coord_y = 3;
defparam syn__794_.coord_z = 3;
defparam syn__794_.mask = 16'hBBC0;
defparam syn__794_.modeMux = 1'b0;
defparam syn__794_.FeedbackMux = 1'b0;
defparam syn__794_.ShiftMux = 1'b0;
defparam syn__794_.BypassEn = 1'b0;
defparam syn__794_.CarryEnb = 1'b1;

alta_slice syn__795_(
	.A(IOaddr[1]),
	.B(IOvalue[1]),
	.C(\tc.IM [8]),
	.D(\tc.IM [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__356_),
	.Cout(),
	.Q());
defparam syn__795_.coord_x = 4;
defparam syn__795_.coord_y = 4;
defparam syn__795_.coord_z = 11;
defparam syn__795_.mask = 16'h91F7;
defparam syn__795_.modeMux = 1'b0;
defparam syn__795_.FeedbackMux = 1'b0;
defparam syn__795_.ShiftMux = 1'b0;
defparam syn__795_.BypassEn = 1'b0;
defparam syn__795_.CarryEnb = 1'b1;

alta_slice syn__796_(
	.A(syn__356_),
	.B(syn__207_),
	.C(syn__039_),
	.D(\tc.IM [9]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__357_),
	.Cout(),
	.Q());
defparam syn__796_.coord_x = 4;
defparam syn__796_.coord_y = 4;
defparam syn__796_.coord_z = 10;
defparam syn__796_.mask = 16'hAAC3;
defparam syn__796_.modeMux = 1'b0;
defparam syn__796_.FeedbackMux = 1'b0;
defparam syn__796_.ShiftMux = 1'b0;
defparam syn__796_.BypassEn = 1'b0;
defparam syn__796_.CarryEnb = 1'b1;

alta_slice syn__797_(
	.A(syn__335_),
	.B(\tc.IM [5]),
	.C(\tc.IM [6]),
	.D(syn__357_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__358_),
	.Cout(),
	.Q());
defparam syn__797_.coord_x = 5;
defparam syn__797_.coord_y = 3;
defparam syn__797_.coord_z = 11;
defparam syn__797_.mask = 16'hF2C2;
defparam syn__797_.modeMux = 1'b0;
defparam syn__797_.FeedbackMux = 1'b0;
defparam syn__797_.ShiftMux = 1'b0;
defparam syn__797_.BypassEn = 1'b0;
defparam syn__797_.CarryEnb = 1'b1;

alta_slice syn__798_(
	.A(syn__331_),
	.B(\tc.IM [5]),
	.C(syn__337_),
	.D(syn__358_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__359_),
	.Cout(),
	.Q());
defparam syn__798_.coord_x = 4;
defparam syn__798_.coord_y = 3;
defparam syn__798_.coord_z = 0;
defparam syn__798_.mask = 16'hF388;
defparam syn__798_.modeMux = 1'b0;
defparam syn__798_.FeedbackMux = 1'b0;
defparam syn__798_.ShiftMux = 1'b0;
defparam syn__798_.BypassEn = 1'b0;
defparam syn__798_.CarryEnb = 1'b1;

alta_slice syn__799_(
	.A(\tc.IM [5]),
	.B(syn__353_),
	.C(syn__327_),
	.D(\tc.IM [6]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__360_),
	.Cout(),
	.Q());
defparam syn__799_.coord_x = 5;
defparam syn__799_.coord_y = 3;
defparam syn__799_.coord_z = 3;
defparam syn__799_.mask = 16'hDDA0;
defparam syn__799_.modeMux = 1'b0;
defparam syn__799_.FeedbackMux = 1'b0;
defparam syn__799_.ShiftMux = 1'b0;
defparam syn__799_.BypassEn = 1'b0;
defparam syn__799_.CarryEnb = 1'b1;

alta_slice syn__800_(
	.A(syn__360_),
	.B(syn__331_),
	.C(syn__136_),
	.D(\tc.IM [5]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__361_),
	.Cout(),
	.Q());
defparam syn__800_.coord_x = 4;
defparam syn__800_.coord_y = 3;
defparam syn__800_.coord_z = 11;
defparam syn__800_.mask = 16'hAAD8;
defparam syn__800_.modeMux = 1'b0;
defparam syn__800_.FeedbackMux = 1'b0;
defparam syn__800_.ShiftMux = 1'b0;
defparam syn__800_.BypassEn = 1'b0;
defparam syn__800_.CarryEnb = 1'b1;

alta_slice syn__801_(
	.A(vcc),
	.B(syn__333_),
	.C(syn__353_),
	.D(\tc.IM [5]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__362_),
	.Cout(),
	.Q());
defparam syn__801_.coord_x = 4;
defparam syn__801_.coord_y = 3;
defparam syn__801_.coord_z = 2;
defparam syn__801_.mask = 16'hCCF0;
defparam syn__801_.modeMux = 1'b0;
defparam syn__801_.FeedbackMux = 1'b0;
defparam syn__801_.ShiftMux = 1'b0;
defparam syn__801_.BypassEn = 1'b0;
defparam syn__801_.CarryEnb = 1'b1;

alta_slice syn__802_(
	.A(syn__362_),
	.B(\tc.IM [6]),
	.C(syn__331_),
	.D(\tc.IM [5]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__363_),
	.Cout(),
	.Q());
defparam syn__802_.coord_x = 5;
defparam syn__802_.coord_y = 3;
defparam syn__802_.coord_z = 15;
defparam syn__802_.mask = 16'hBBB8;
defparam syn__802_.modeMux = 1'b0;
defparam syn__802_.FeedbackMux = 1'b0;
defparam syn__802_.ShiftMux = 1'b0;
defparam syn__802_.BypassEn = 1'b0;
defparam syn__802_.CarryEnb = 1'b1;

alta_slice syn__803_(
	.A(syn__226_),
	.B(\tc.IM [6]),
	.C(syn__345_),
	.D(\tc.IM [5]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__364_),
	.Cout(),
	.Q());
defparam syn__803_.coord_x = 5;
defparam syn__803_.coord_y = 3;
defparam syn__803_.coord_z = 1;
defparam syn__803_.mask = 16'hCCB8;
defparam syn__803_.modeMux = 1'b0;
defparam syn__803_.FeedbackMux = 1'b0;
defparam syn__803_.ShiftMux = 1'b0;
defparam syn__803_.BypassEn = 1'b0;
defparam syn__803_.CarryEnb = 1'b1;

alta_slice syn__804_(
	.A(syn__175_),
	.B(\tc.IM [5]),
	.C(syn__364_),
	.D(syn__231_),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__365_),
	.Cout(),
	.Q());
defparam syn__804_.coord_x = 6;
defparam syn__804_.coord_y = 4;
defparam syn__804_.coord_z = 9;
defparam syn__804_.mask = 16'hF838;
defparam syn__804_.modeMux = 1'b0;
defparam syn__804_.FeedbackMux = 1'b0;
defparam syn__804_.ShiftMux = 1'b0;
defparam syn__804_.BypassEn = 1'b0;
defparam syn__804_.CarryEnb = 1'b1;

alta_slice syn__805_(
	.A(vcc),
	.B(syn__349_),
	.C(syn__351_),
	.D(\tc.IM [5]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__366_),
	.Cout(),
	.Q());
defparam syn__805_.coord_x = 4;
defparam syn__805_.coord_y = 3;
defparam syn__805_.coord_z = 15;
defparam syn__805_.mask = 16'hCCF0;
defparam syn__805_.modeMux = 1'b0;
defparam syn__805_.FeedbackMux = 1'b0;
defparam syn__805_.ShiftMux = 1'b0;
defparam syn__805_.BypassEn = 1'b0;
defparam syn__805_.CarryEnb = 1'b1;

alta_slice syn__806_(
	.A(syn__366_),
	.B(\tc.IM [5]),
	.C(syn__319_),
	.D(\tc.IM [6]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__367_),
	.Cout(),
	.Q());
defparam syn__806_.coord_x = 5;
defparam syn__806_.coord_y = 3;
defparam syn__806_.coord_z = 7;
defparam syn__806_.mask = 16'hAAFC;
defparam syn__806_.modeMux = 1'b0;
defparam syn__806_.FeedbackMux = 1'b0;
defparam syn__806_.ShiftMux = 1'b0;
defparam syn__806_.BypassEn = 1'b0;
defparam syn__806_.CarryEnb = 1'b1;

alta_rio syn__807_(
	.padio(bank0[0]),
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
defparam syn__807_.coord_x = 2;
defparam syn__807_.coord_y = 9;
defparam syn__807_.coord_z = 0;
defparam syn__807_.IN_ASYNC_MODE = 1'b0;
defparam syn__807_.IN_SYNC_MODE = 1'b0;
defparam syn__807_.IN_POWERUP = 1'b0;
defparam syn__807_.OUT_REG_MODE = 1'b0;
defparam syn__807_.OUT_ASYNC_MODE = 1'b0;
defparam syn__807_.OUT_SYNC_MODE = 1'b0;
defparam syn__807_.OUT_POWERUP = 1'b0;
defparam syn__807_.OE_REG_MODE = 1'b0;
defparam syn__807_.OE_ASYNC_MODE = 1'b0;
defparam syn__807_.OE_SYNC_MODE = 1'b0;
defparam syn__807_.OE_POWERUP = 1'b0;
defparam syn__807_.CFG_TRI_INPUT = 1'b0;
defparam syn__807_.CFG_PULL_UP = 1'b0;
defparam syn__807_.CFG_SLR = 1'b0;
defparam syn__807_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__807_.CFG_PDRCTRL = 4'b0010;
defparam syn__807_.CFG_KEEP = 2'b00;
defparam syn__807_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__807_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__807_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__807_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__807_.DPCLK_DELAY = 4'b0000;
defparam syn__807_.OUT_DELAY = 1'b0;
defparam syn__807_.IN_DATA_DELAY = 3'b000;
defparam syn__807_.IN_REG_DELAY = 3'b000;

alta_rio syn__808_(
	.padio(bank0[1]),
	.datain(syn__368_[1]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__808_.coord_x = 1;
defparam syn__808_.coord_y = 9;
defparam syn__808_.coord_z = 3;
defparam syn__808_.IN_ASYNC_MODE = 1'b0;
defparam syn__808_.IN_SYNC_MODE = 1'b0;
defparam syn__808_.IN_POWERUP = 1'b0;
defparam syn__808_.OUT_REG_MODE = 1'b0;
defparam syn__808_.OUT_ASYNC_MODE = 1'b0;
defparam syn__808_.OUT_SYNC_MODE = 1'b0;
defparam syn__808_.OUT_POWERUP = 1'b0;
defparam syn__808_.OE_REG_MODE = 1'b0;
defparam syn__808_.OE_ASYNC_MODE = 1'b0;
defparam syn__808_.OE_SYNC_MODE = 1'b0;
defparam syn__808_.OE_POWERUP = 1'b0;
defparam syn__808_.CFG_TRI_INPUT = 1'b0;
defparam syn__808_.CFG_PULL_UP = 1'b0;
defparam syn__808_.CFG_SLR = 1'b0;
defparam syn__808_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__808_.CFG_PDRCTRL = 4'b0010;
defparam syn__808_.CFG_KEEP = 2'b00;
defparam syn__808_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__808_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__808_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__808_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__808_.DPCLK_DELAY = 4'b0000;
defparam syn__808_.OUT_DELAY = 1'b0;
defparam syn__808_.IN_DATA_DELAY = 3'b000;
defparam syn__808_.IN_REG_DELAY = 3'b000;

alta_rio syn__809_(
	.padio(bank0[2]),
	.datain(syn__368_[2]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__809_.coord_x = 0;
defparam syn__809_.coord_y = 9;
defparam syn__809_.coord_z = 2;
defparam syn__809_.IN_ASYNC_MODE = 1'b0;
defparam syn__809_.IN_SYNC_MODE = 1'b0;
defparam syn__809_.IN_POWERUP = 1'b0;
defparam syn__809_.OUT_REG_MODE = 1'b0;
defparam syn__809_.OUT_ASYNC_MODE = 1'b0;
defparam syn__809_.OUT_SYNC_MODE = 1'b0;
defparam syn__809_.OUT_POWERUP = 1'b0;
defparam syn__809_.OE_REG_MODE = 1'b0;
defparam syn__809_.OE_ASYNC_MODE = 1'b0;
defparam syn__809_.OE_SYNC_MODE = 1'b0;
defparam syn__809_.OE_POWERUP = 1'b0;
defparam syn__809_.CFG_TRI_INPUT = 1'b0;
defparam syn__809_.CFG_PULL_UP = 1'b0;
defparam syn__809_.CFG_SLR = 1'b0;
defparam syn__809_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__809_.CFG_PDRCTRL = 4'b0010;
defparam syn__809_.CFG_KEEP = 2'b00;
defparam syn__809_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__809_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__809_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__809_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__809_.DPCLK_DELAY = 4'b0000;
defparam syn__809_.OUT_DELAY = 1'b0;
defparam syn__809_.IN_DATA_DELAY = 3'b000;
defparam syn__809_.IN_REG_DELAY = 3'b000;

alta_rio syn__810_(
	.padio(bank0[3]),
	.datain(syn__368_[3]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__810_.coord_x = 0;
defparam syn__810_.coord_y = 9;
defparam syn__810_.coord_z = 0;
defparam syn__810_.IN_ASYNC_MODE = 1'b0;
defparam syn__810_.IN_SYNC_MODE = 1'b0;
defparam syn__810_.IN_POWERUP = 1'b0;
defparam syn__810_.OUT_REG_MODE = 1'b0;
defparam syn__810_.OUT_ASYNC_MODE = 1'b0;
defparam syn__810_.OUT_SYNC_MODE = 1'b0;
defparam syn__810_.OUT_POWERUP = 1'b0;
defparam syn__810_.OE_REG_MODE = 1'b0;
defparam syn__810_.OE_ASYNC_MODE = 1'b0;
defparam syn__810_.OE_SYNC_MODE = 1'b0;
defparam syn__810_.OE_POWERUP = 1'b0;
defparam syn__810_.CFG_TRI_INPUT = 1'b0;
defparam syn__810_.CFG_PULL_UP = 1'b0;
defparam syn__810_.CFG_SLR = 1'b0;
defparam syn__810_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__810_.CFG_PDRCTRL = 4'b0010;
defparam syn__810_.CFG_KEEP = 2'b00;
defparam syn__810_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__810_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__810_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__810_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__810_.DPCLK_DELAY = 4'b0000;
defparam syn__810_.OUT_DELAY = 1'b0;
defparam syn__810_.IN_DATA_DELAY = 3'b000;
defparam syn__810_.IN_REG_DELAY = 3'b000;

alta_rio syn__811_(
	.padio(bank0[4]),
	.datain(syn__368_[4]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__811_.coord_x = 1;
defparam syn__811_.coord_y = 9;
defparam syn__811_.coord_z = 1;
defparam syn__811_.IN_ASYNC_MODE = 1'b0;
defparam syn__811_.IN_SYNC_MODE = 1'b0;
defparam syn__811_.IN_POWERUP = 1'b0;
defparam syn__811_.OUT_REG_MODE = 1'b0;
defparam syn__811_.OUT_ASYNC_MODE = 1'b0;
defparam syn__811_.OUT_SYNC_MODE = 1'b0;
defparam syn__811_.OUT_POWERUP = 1'b0;
defparam syn__811_.OE_REG_MODE = 1'b0;
defparam syn__811_.OE_ASYNC_MODE = 1'b0;
defparam syn__811_.OE_SYNC_MODE = 1'b0;
defparam syn__811_.OE_POWERUP = 1'b0;
defparam syn__811_.CFG_TRI_INPUT = 1'b0;
defparam syn__811_.CFG_PULL_UP = 1'b0;
defparam syn__811_.CFG_SLR = 1'b0;
defparam syn__811_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__811_.CFG_PDRCTRL = 4'b0010;
defparam syn__811_.CFG_KEEP = 2'b00;
defparam syn__811_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__811_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__811_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__811_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__811_.DPCLK_DELAY = 4'b0000;
defparam syn__811_.OUT_DELAY = 1'b0;
defparam syn__811_.IN_DATA_DELAY = 3'b000;
defparam syn__811_.IN_REG_DELAY = 3'b000;

alta_rio syn__812_(
	.padio(bank0[5]),
	.datain(syn__368_[5]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__812_.coord_x = 6;
defparam syn__812_.coord_y = 9;
defparam syn__812_.coord_z = 2;
defparam syn__812_.IN_ASYNC_MODE = 1'b0;
defparam syn__812_.IN_SYNC_MODE = 1'b0;
defparam syn__812_.IN_POWERUP = 1'b0;
defparam syn__812_.OUT_REG_MODE = 1'b0;
defparam syn__812_.OUT_ASYNC_MODE = 1'b0;
defparam syn__812_.OUT_SYNC_MODE = 1'b0;
defparam syn__812_.OUT_POWERUP = 1'b0;
defparam syn__812_.OE_REG_MODE = 1'b0;
defparam syn__812_.OE_ASYNC_MODE = 1'b0;
defparam syn__812_.OE_SYNC_MODE = 1'b0;
defparam syn__812_.OE_POWERUP = 1'b0;
defparam syn__812_.CFG_TRI_INPUT = 1'b0;
defparam syn__812_.CFG_PULL_UP = 1'b0;
defparam syn__812_.CFG_SLR = 1'b0;
defparam syn__812_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__812_.CFG_PDRCTRL = 4'b0010;
defparam syn__812_.CFG_KEEP = 2'b00;
defparam syn__812_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__812_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__812_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__812_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__812_.DPCLK_DELAY = 4'b0000;
defparam syn__812_.OUT_DELAY = 1'b0;
defparam syn__812_.IN_DATA_DELAY = 3'b000;
defparam syn__812_.IN_REG_DELAY = 3'b000;

alta_rio syn__813_(
	.padio(bank0[6]),
	.datain(syn__368_[6]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__813_.coord_x = 7;
defparam syn__813_.coord_y = 1;
defparam syn__813_.coord_z = 0;
defparam syn__813_.IN_ASYNC_MODE = 1'b0;
defparam syn__813_.IN_SYNC_MODE = 1'b0;
defparam syn__813_.IN_POWERUP = 1'b0;
defparam syn__813_.OUT_REG_MODE = 1'b0;
defparam syn__813_.OUT_ASYNC_MODE = 1'b0;
defparam syn__813_.OUT_SYNC_MODE = 1'b0;
defparam syn__813_.OUT_POWERUP = 1'b0;
defparam syn__813_.OE_REG_MODE = 1'b0;
defparam syn__813_.OE_ASYNC_MODE = 1'b0;
defparam syn__813_.OE_SYNC_MODE = 1'b0;
defparam syn__813_.OE_POWERUP = 1'b0;
defparam syn__813_.CFG_TRI_INPUT = 1'b0;
defparam syn__813_.CFG_PULL_UP = 1'b0;
defparam syn__813_.CFG_SLR = 1'b0;
defparam syn__813_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__813_.CFG_PDRCTRL = 4'b0010;
defparam syn__813_.CFG_KEEP = 2'b00;
defparam syn__813_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__813_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__813_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__813_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__813_.DPCLK_DELAY = 4'b0000;
defparam syn__813_.OUT_DELAY = 1'b0;
defparam syn__813_.IN_DATA_DELAY = 3'b000;
defparam syn__813_.IN_REG_DELAY = 3'b000;

alta_rio syn__814_(
	.padio(bank0[7]),
	.datain(vcc),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__814_.coord_x = 2;
defparam syn__814_.coord_y = 1;
defparam syn__814_.coord_z = 0;
defparam syn__814_.IN_ASYNC_MODE = 1'b0;
defparam syn__814_.IN_SYNC_MODE = 1'b0;
defparam syn__814_.IN_POWERUP = 1'b0;
defparam syn__814_.OUT_REG_MODE = 1'b0;
defparam syn__814_.OUT_ASYNC_MODE = 1'b0;
defparam syn__814_.OUT_SYNC_MODE = 1'b0;
defparam syn__814_.OUT_POWERUP = 1'b0;
defparam syn__814_.OE_REG_MODE = 1'b0;
defparam syn__814_.OE_ASYNC_MODE = 1'b0;
defparam syn__814_.OE_SYNC_MODE = 1'b0;
defparam syn__814_.OE_POWERUP = 1'b0;
defparam syn__814_.CFG_TRI_INPUT = 1'b0;
defparam syn__814_.CFG_PULL_UP = 1'b0;
defparam syn__814_.CFG_SLR = 1'b0;
defparam syn__814_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__814_.CFG_PDRCTRL = 4'b0010;
defparam syn__814_.CFG_KEEP = 2'b00;
defparam syn__814_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__814_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__814_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__814_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__814_.DPCLK_DELAY = 4'b0000;
defparam syn__814_.OUT_DELAY = 1'b0;
defparam syn__814_.IN_DATA_DELAY = 3'b000;
defparam syn__814_.IN_REG_DELAY = 3'b000;

alta_rio syn__815_(
	.padio(bank1[0]),
	.datain(syn__369_[0]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__815_.coord_x = 4;
defparam syn__815_.coord_y = 1;
defparam syn__815_.coord_z = 0;
defparam syn__815_.IN_ASYNC_MODE = 1'b0;
defparam syn__815_.IN_SYNC_MODE = 1'b0;
defparam syn__815_.IN_POWERUP = 1'b0;
defparam syn__815_.OUT_REG_MODE = 1'b0;
defparam syn__815_.OUT_ASYNC_MODE = 1'b0;
defparam syn__815_.OUT_SYNC_MODE = 1'b0;
defparam syn__815_.OUT_POWERUP = 1'b0;
defparam syn__815_.OE_REG_MODE = 1'b0;
defparam syn__815_.OE_ASYNC_MODE = 1'b0;
defparam syn__815_.OE_SYNC_MODE = 1'b0;
defparam syn__815_.OE_POWERUP = 1'b0;
defparam syn__815_.CFG_TRI_INPUT = 1'b0;
defparam syn__815_.CFG_PULL_UP = 1'b0;
defparam syn__815_.CFG_SLR = 1'b0;
defparam syn__815_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__815_.CFG_PDRCTRL = 4'b0010;
defparam syn__815_.CFG_KEEP = 2'b00;
defparam syn__815_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__815_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__815_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__815_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__815_.DPCLK_DELAY = 4'b0000;
defparam syn__815_.OUT_DELAY = 1'b0;
defparam syn__815_.IN_DATA_DELAY = 3'b000;
defparam syn__815_.IN_REG_DELAY = 3'b000;

alta_rio syn__816_(
	.padio(bank1[1]),
	.datain(syn__369_[1]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__816_.coord_x = 4;
defparam syn__816_.coord_y = 1;
defparam syn__816_.coord_z = 2;
defparam syn__816_.IN_ASYNC_MODE = 1'b0;
defparam syn__816_.IN_SYNC_MODE = 1'b0;
defparam syn__816_.IN_POWERUP = 1'b0;
defparam syn__816_.OUT_REG_MODE = 1'b0;
defparam syn__816_.OUT_ASYNC_MODE = 1'b0;
defparam syn__816_.OUT_SYNC_MODE = 1'b0;
defparam syn__816_.OUT_POWERUP = 1'b0;
defparam syn__816_.OE_REG_MODE = 1'b0;
defparam syn__816_.OE_ASYNC_MODE = 1'b0;
defparam syn__816_.OE_SYNC_MODE = 1'b0;
defparam syn__816_.OE_POWERUP = 1'b0;
defparam syn__816_.CFG_TRI_INPUT = 1'b0;
defparam syn__816_.CFG_PULL_UP = 1'b0;
defparam syn__816_.CFG_SLR = 1'b0;
defparam syn__816_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__816_.CFG_PDRCTRL = 4'b0010;
defparam syn__816_.CFG_KEEP = 2'b00;
defparam syn__816_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__816_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__816_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__816_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__816_.DPCLK_DELAY = 4'b0000;
defparam syn__816_.OUT_DELAY = 1'b0;
defparam syn__816_.IN_DATA_DELAY = 3'b000;
defparam syn__816_.IN_REG_DELAY = 3'b000;

alta_rio syn__817_(
	.padio(bank1[2]),
	.datain(syn__369_[2]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__817_.coord_x = 5;
defparam syn__817_.coord_y = 1;
defparam syn__817_.coord_z = 0;
defparam syn__817_.IN_ASYNC_MODE = 1'b0;
defparam syn__817_.IN_SYNC_MODE = 1'b0;
defparam syn__817_.IN_POWERUP = 1'b0;
defparam syn__817_.OUT_REG_MODE = 1'b0;
defparam syn__817_.OUT_ASYNC_MODE = 1'b0;
defparam syn__817_.OUT_SYNC_MODE = 1'b0;
defparam syn__817_.OUT_POWERUP = 1'b0;
defparam syn__817_.OE_REG_MODE = 1'b0;
defparam syn__817_.OE_ASYNC_MODE = 1'b0;
defparam syn__817_.OE_SYNC_MODE = 1'b0;
defparam syn__817_.OE_POWERUP = 1'b0;
defparam syn__817_.CFG_TRI_INPUT = 1'b0;
defparam syn__817_.CFG_PULL_UP = 1'b0;
defparam syn__817_.CFG_SLR = 1'b0;
defparam syn__817_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__817_.CFG_PDRCTRL = 4'b0010;
defparam syn__817_.CFG_KEEP = 2'b00;
defparam syn__817_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__817_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__817_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__817_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__817_.DPCLK_DELAY = 4'b0000;
defparam syn__817_.OUT_DELAY = 1'b0;
defparam syn__817_.IN_DATA_DELAY = 3'b000;
defparam syn__817_.IN_REG_DELAY = 3'b000;

alta_rio syn__818_(
	.padio(bank1[3]),
	.datain(syn__369_[3]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__818_.coord_x = 5;
defparam syn__818_.coord_y = 1;
defparam syn__818_.coord_z = 1;
defparam syn__818_.IN_ASYNC_MODE = 1'b0;
defparam syn__818_.IN_SYNC_MODE = 1'b0;
defparam syn__818_.IN_POWERUP = 1'b0;
defparam syn__818_.OUT_REG_MODE = 1'b0;
defparam syn__818_.OUT_ASYNC_MODE = 1'b0;
defparam syn__818_.OUT_SYNC_MODE = 1'b0;
defparam syn__818_.OUT_POWERUP = 1'b0;
defparam syn__818_.OE_REG_MODE = 1'b0;
defparam syn__818_.OE_ASYNC_MODE = 1'b0;
defparam syn__818_.OE_SYNC_MODE = 1'b0;
defparam syn__818_.OE_POWERUP = 1'b0;
defparam syn__818_.CFG_TRI_INPUT = 1'b0;
defparam syn__818_.CFG_PULL_UP = 1'b0;
defparam syn__818_.CFG_SLR = 1'b0;
defparam syn__818_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__818_.CFG_PDRCTRL = 4'b0010;
defparam syn__818_.CFG_KEEP = 2'b00;
defparam syn__818_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__818_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__818_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__818_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__818_.DPCLK_DELAY = 4'b0000;
defparam syn__818_.OUT_DELAY = 1'b0;
defparam syn__818_.IN_DATA_DELAY = 3'b000;
defparam syn__818_.IN_REG_DELAY = 3'b000;

alta_rio syn__819_(
	.padio(bank1[4]),
	.datain(syn__369_[4]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__819_.coord_x = 5;
defparam syn__819_.coord_y = 1;
defparam syn__819_.coord_z = 2;
defparam syn__819_.IN_ASYNC_MODE = 1'b0;
defparam syn__819_.IN_SYNC_MODE = 1'b0;
defparam syn__819_.IN_POWERUP = 1'b0;
defparam syn__819_.OUT_REG_MODE = 1'b0;
defparam syn__819_.OUT_ASYNC_MODE = 1'b0;
defparam syn__819_.OUT_SYNC_MODE = 1'b0;
defparam syn__819_.OUT_POWERUP = 1'b0;
defparam syn__819_.OE_REG_MODE = 1'b0;
defparam syn__819_.OE_ASYNC_MODE = 1'b0;
defparam syn__819_.OE_SYNC_MODE = 1'b0;
defparam syn__819_.OE_POWERUP = 1'b0;
defparam syn__819_.CFG_TRI_INPUT = 1'b0;
defparam syn__819_.CFG_PULL_UP = 1'b0;
defparam syn__819_.CFG_SLR = 1'b0;
defparam syn__819_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__819_.CFG_PDRCTRL = 4'b0010;
defparam syn__819_.CFG_KEEP = 2'b00;
defparam syn__819_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__819_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__819_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__819_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__819_.DPCLK_DELAY = 4'b0000;
defparam syn__819_.OUT_DELAY = 1'b0;
defparam syn__819_.IN_DATA_DELAY = 3'b000;
defparam syn__819_.IN_REG_DELAY = 3'b000;

alta_rio syn__820_(
	.padio(bank1[5]),
	.datain(syn__369_[5]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__820_.coord_x = 5;
defparam syn__820_.coord_y = 1;
defparam syn__820_.coord_z = 3;
defparam syn__820_.IN_ASYNC_MODE = 1'b0;
defparam syn__820_.IN_SYNC_MODE = 1'b0;
defparam syn__820_.IN_POWERUP = 1'b0;
defparam syn__820_.OUT_REG_MODE = 1'b0;
defparam syn__820_.OUT_ASYNC_MODE = 1'b0;
defparam syn__820_.OUT_SYNC_MODE = 1'b0;
defparam syn__820_.OUT_POWERUP = 1'b0;
defparam syn__820_.OE_REG_MODE = 1'b0;
defparam syn__820_.OE_ASYNC_MODE = 1'b0;
defparam syn__820_.OE_SYNC_MODE = 1'b0;
defparam syn__820_.OE_POWERUP = 1'b0;
defparam syn__820_.CFG_TRI_INPUT = 1'b0;
defparam syn__820_.CFG_PULL_UP = 1'b0;
defparam syn__820_.CFG_SLR = 1'b0;
defparam syn__820_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__820_.CFG_PDRCTRL = 4'b0010;
defparam syn__820_.CFG_KEEP = 2'b00;
defparam syn__820_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__820_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__820_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__820_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__820_.DPCLK_DELAY = 4'b0000;
defparam syn__820_.OUT_DELAY = 1'b0;
defparam syn__820_.IN_DATA_DELAY = 3'b000;
defparam syn__820_.IN_REG_DELAY = 3'b000;

alta_rio syn__821_(
	.padio(bank1[6]),
	.datain(syn__369_[6]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__821_.coord_x = 6;
defparam syn__821_.coord_y = 1;
defparam syn__821_.coord_z = 0;
defparam syn__821_.IN_ASYNC_MODE = 1'b0;
defparam syn__821_.IN_SYNC_MODE = 1'b0;
defparam syn__821_.IN_POWERUP = 1'b0;
defparam syn__821_.OUT_REG_MODE = 1'b0;
defparam syn__821_.OUT_ASYNC_MODE = 1'b0;
defparam syn__821_.OUT_SYNC_MODE = 1'b0;
defparam syn__821_.OUT_POWERUP = 1'b0;
defparam syn__821_.OE_REG_MODE = 1'b0;
defparam syn__821_.OE_ASYNC_MODE = 1'b0;
defparam syn__821_.OE_SYNC_MODE = 1'b0;
defparam syn__821_.OE_POWERUP = 1'b0;
defparam syn__821_.CFG_TRI_INPUT = 1'b0;
defparam syn__821_.CFG_PULL_UP = 1'b0;
defparam syn__821_.CFG_SLR = 1'b0;
defparam syn__821_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__821_.CFG_PDRCTRL = 4'b0010;
defparam syn__821_.CFG_KEEP = 2'b00;
defparam syn__821_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__821_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__821_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__821_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__821_.DPCLK_DELAY = 4'b0000;
defparam syn__821_.OUT_DELAY = 1'b0;
defparam syn__821_.IN_DATA_DELAY = 3'b000;
defparam syn__821_.IN_REG_DELAY = 3'b000;

alta_rio syn__822_(
	.padio(bank1[7]),
	.datain(syn__369_[7]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__822_.coord_x = 6;
defparam syn__822_.coord_y = 1;
defparam syn__822_.coord_z = 1;
defparam syn__822_.IN_ASYNC_MODE = 1'b0;
defparam syn__822_.IN_SYNC_MODE = 1'b0;
defparam syn__822_.IN_POWERUP = 1'b0;
defparam syn__822_.OUT_REG_MODE = 1'b0;
defparam syn__822_.OUT_ASYNC_MODE = 1'b0;
defparam syn__822_.OUT_SYNC_MODE = 1'b0;
defparam syn__822_.OUT_POWERUP = 1'b0;
defparam syn__822_.OE_REG_MODE = 1'b0;
defparam syn__822_.OE_ASYNC_MODE = 1'b0;
defparam syn__822_.OE_SYNC_MODE = 1'b0;
defparam syn__822_.OE_POWERUP = 1'b0;
defparam syn__822_.CFG_TRI_INPUT = 1'b0;
defparam syn__822_.CFG_PULL_UP = 1'b0;
defparam syn__822_.CFG_SLR = 1'b0;
defparam syn__822_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__822_.CFG_PDRCTRL = 4'b0010;
defparam syn__822_.CFG_KEEP = 2'b00;
defparam syn__822_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__822_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__822_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__822_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__822_.DPCLK_DELAY = 4'b0000;
defparam syn__822_.OUT_DELAY = 1'b0;
defparam syn__822_.IN_DATA_DELAY = 3'b000;
defparam syn__822_.IN_REG_DELAY = 3'b000;

alta_rio syn__823_(
	.padio(bank2[0]),
	.datain(syn__369_[0]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__823_.coord_x = 6;
defparam syn__823_.coord_y = 1;
defparam syn__823_.coord_z = 2;
defparam syn__823_.IN_ASYNC_MODE = 1'b0;
defparam syn__823_.IN_SYNC_MODE = 1'b0;
defparam syn__823_.IN_POWERUP = 1'b0;
defparam syn__823_.OUT_REG_MODE = 1'b0;
defparam syn__823_.OUT_ASYNC_MODE = 1'b0;
defparam syn__823_.OUT_SYNC_MODE = 1'b0;
defparam syn__823_.OUT_POWERUP = 1'b0;
defparam syn__823_.OE_REG_MODE = 1'b0;
defparam syn__823_.OE_ASYNC_MODE = 1'b0;
defparam syn__823_.OE_SYNC_MODE = 1'b0;
defparam syn__823_.OE_POWERUP = 1'b0;
defparam syn__823_.CFG_TRI_INPUT = 1'b0;
defparam syn__823_.CFG_PULL_UP = 1'b0;
defparam syn__823_.CFG_SLR = 1'b0;
defparam syn__823_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__823_.CFG_PDRCTRL = 4'b0010;
defparam syn__823_.CFG_KEEP = 2'b00;
defparam syn__823_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__823_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__823_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__823_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__823_.DPCLK_DELAY = 4'b0000;
defparam syn__823_.OUT_DELAY = 1'b0;
defparam syn__823_.IN_DATA_DELAY = 3'b000;
defparam syn__823_.IN_REG_DELAY = 3'b000;

alta_rio syn__824_(
	.padio(bank2[1]),
	.datain(syn__369_[1]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__824_.coord_x = 6;
defparam syn__824_.coord_y = 1;
defparam syn__824_.coord_z = 3;
defparam syn__824_.IN_ASYNC_MODE = 1'b0;
defparam syn__824_.IN_SYNC_MODE = 1'b0;
defparam syn__824_.IN_POWERUP = 1'b0;
defparam syn__824_.OUT_REG_MODE = 1'b0;
defparam syn__824_.OUT_ASYNC_MODE = 1'b0;
defparam syn__824_.OUT_SYNC_MODE = 1'b0;
defparam syn__824_.OUT_POWERUP = 1'b0;
defparam syn__824_.OE_REG_MODE = 1'b0;
defparam syn__824_.OE_ASYNC_MODE = 1'b0;
defparam syn__824_.OE_SYNC_MODE = 1'b0;
defparam syn__824_.OE_POWERUP = 1'b0;
defparam syn__824_.CFG_TRI_INPUT = 1'b0;
defparam syn__824_.CFG_PULL_UP = 1'b0;
defparam syn__824_.CFG_SLR = 1'b0;
defparam syn__824_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__824_.CFG_PDRCTRL = 4'b0010;
defparam syn__824_.CFG_KEEP = 2'b00;
defparam syn__824_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__824_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__824_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__824_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__824_.DPCLK_DELAY = 4'b0000;
defparam syn__824_.OUT_DELAY = 1'b0;
defparam syn__824_.IN_DATA_DELAY = 3'b000;
defparam syn__824_.IN_REG_DELAY = 3'b000;

alta_rio syn__825_(
	.padio(bank2[2]),
	.datain(syn__369_[2]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__825_.coord_x = 9;
defparam syn__825_.coord_y = 0;
defparam syn__825_.coord_z = 1;
defparam syn__825_.IN_ASYNC_MODE = 1'b0;
defparam syn__825_.IN_SYNC_MODE = 1'b0;
defparam syn__825_.IN_POWERUP = 1'b0;
defparam syn__825_.OUT_REG_MODE = 1'b0;
defparam syn__825_.OUT_ASYNC_MODE = 1'b0;
defparam syn__825_.OUT_SYNC_MODE = 1'b0;
defparam syn__825_.OUT_POWERUP = 1'b0;
defparam syn__825_.OE_REG_MODE = 1'b0;
defparam syn__825_.OE_ASYNC_MODE = 1'b0;
defparam syn__825_.OE_SYNC_MODE = 1'b0;
defparam syn__825_.OE_POWERUP = 1'b0;
defparam syn__825_.CFG_TRI_INPUT = 1'b0;
defparam syn__825_.CFG_PULL_UP = 1'b0;
defparam syn__825_.CFG_SLR = 1'b0;
defparam syn__825_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__825_.CFG_PDRCTRL = 4'b0010;
defparam syn__825_.CFG_KEEP = 2'b00;
defparam syn__825_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__825_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__825_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__825_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__825_.DPCLK_DELAY = 4'b0000;
defparam syn__825_.OUT_DELAY = 1'b0;
defparam syn__825_.IN_DATA_DELAY = 3'b000;
defparam syn__825_.IN_REG_DELAY = 3'b000;

alta_rio syn__826_(
	.padio(bank2[3]),
	.datain(syn__369_[3]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__826_.coord_x = 9;
defparam syn__826_.coord_y = 0;
defparam syn__826_.coord_z = 3;
defparam syn__826_.IN_ASYNC_MODE = 1'b0;
defparam syn__826_.IN_SYNC_MODE = 1'b0;
defparam syn__826_.IN_POWERUP = 1'b0;
defparam syn__826_.OUT_REG_MODE = 1'b0;
defparam syn__826_.OUT_ASYNC_MODE = 1'b0;
defparam syn__826_.OUT_SYNC_MODE = 1'b0;
defparam syn__826_.OUT_POWERUP = 1'b0;
defparam syn__826_.OE_REG_MODE = 1'b0;
defparam syn__826_.OE_ASYNC_MODE = 1'b0;
defparam syn__826_.OE_SYNC_MODE = 1'b0;
defparam syn__826_.OE_POWERUP = 1'b0;
defparam syn__826_.CFG_TRI_INPUT = 1'b0;
defparam syn__826_.CFG_PULL_UP = 1'b0;
defparam syn__826_.CFG_SLR = 1'b0;
defparam syn__826_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__826_.CFG_PDRCTRL = 4'b0010;
defparam syn__826_.CFG_KEEP = 2'b00;
defparam syn__826_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__826_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__826_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__826_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__826_.DPCLK_DELAY = 4'b0000;
defparam syn__826_.OUT_DELAY = 1'b0;
defparam syn__826_.IN_DATA_DELAY = 3'b000;
defparam syn__826_.IN_REG_DELAY = 3'b000;

alta_rio syn__827_(
	.padio(bank2[4]),
	.datain(syn__369_[4]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__827_.coord_x = 8;
defparam syn__827_.coord_y = 9;
defparam syn__827_.coord_z = 0;
defparam syn__827_.IN_ASYNC_MODE = 1'b0;
defparam syn__827_.IN_SYNC_MODE = 1'b0;
defparam syn__827_.IN_POWERUP = 1'b0;
defparam syn__827_.OUT_REG_MODE = 1'b0;
defparam syn__827_.OUT_ASYNC_MODE = 1'b0;
defparam syn__827_.OUT_SYNC_MODE = 1'b0;
defparam syn__827_.OUT_POWERUP = 1'b0;
defparam syn__827_.OE_REG_MODE = 1'b0;
defparam syn__827_.OE_ASYNC_MODE = 1'b0;
defparam syn__827_.OE_SYNC_MODE = 1'b0;
defparam syn__827_.OE_POWERUP = 1'b0;
defparam syn__827_.CFG_TRI_INPUT = 1'b0;
defparam syn__827_.CFG_PULL_UP = 1'b0;
defparam syn__827_.CFG_SLR = 1'b0;
defparam syn__827_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__827_.CFG_PDRCTRL = 4'b0010;
defparam syn__827_.CFG_KEEP = 2'b00;
defparam syn__827_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__827_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__827_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__827_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__827_.DPCLK_DELAY = 4'b0000;
defparam syn__827_.OUT_DELAY = 1'b0;
defparam syn__827_.IN_DATA_DELAY = 3'b000;
defparam syn__827_.IN_REG_DELAY = 3'b000;

alta_rio syn__828_(
	.padio(bank2[5]),
	.datain(syn__369_[5]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__828_.coord_x = 11;
defparam syn__828_.coord_y = 9;
defparam syn__828_.coord_z = 1;
defparam syn__828_.IN_ASYNC_MODE = 1'b0;
defparam syn__828_.IN_SYNC_MODE = 1'b0;
defparam syn__828_.IN_POWERUP = 1'b0;
defparam syn__828_.OUT_REG_MODE = 1'b0;
defparam syn__828_.OUT_ASYNC_MODE = 1'b0;
defparam syn__828_.OUT_SYNC_MODE = 1'b0;
defparam syn__828_.OUT_POWERUP = 1'b0;
defparam syn__828_.OE_REG_MODE = 1'b0;
defparam syn__828_.OE_ASYNC_MODE = 1'b0;
defparam syn__828_.OE_SYNC_MODE = 1'b0;
defparam syn__828_.OE_POWERUP = 1'b0;
defparam syn__828_.CFG_TRI_INPUT = 1'b0;
defparam syn__828_.CFG_PULL_UP = 1'b0;
defparam syn__828_.CFG_SLR = 1'b0;
defparam syn__828_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__828_.CFG_PDRCTRL = 4'b0010;
defparam syn__828_.CFG_KEEP = 2'b00;
defparam syn__828_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__828_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__828_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__828_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__828_.DPCLK_DELAY = 4'b0000;
defparam syn__828_.OUT_DELAY = 1'b0;
defparam syn__828_.IN_DATA_DELAY = 3'b000;
defparam syn__828_.IN_REG_DELAY = 3'b000;

alta_rio syn__829_(
	.padio(bank2[6]),
	.datain(syn__369_[6]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__829_.coord_x = 9;
defparam syn__829_.coord_y = 9;
defparam syn__829_.coord_z = 3;
defparam syn__829_.IN_ASYNC_MODE = 1'b0;
defparam syn__829_.IN_SYNC_MODE = 1'b0;
defparam syn__829_.IN_POWERUP = 1'b0;
defparam syn__829_.OUT_REG_MODE = 1'b0;
defparam syn__829_.OUT_ASYNC_MODE = 1'b0;
defparam syn__829_.OUT_SYNC_MODE = 1'b0;
defparam syn__829_.OUT_POWERUP = 1'b0;
defparam syn__829_.OE_REG_MODE = 1'b0;
defparam syn__829_.OE_ASYNC_MODE = 1'b0;
defparam syn__829_.OE_SYNC_MODE = 1'b0;
defparam syn__829_.OE_POWERUP = 1'b0;
defparam syn__829_.CFG_TRI_INPUT = 1'b0;
defparam syn__829_.CFG_PULL_UP = 1'b0;
defparam syn__829_.CFG_SLR = 1'b0;
defparam syn__829_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__829_.CFG_PDRCTRL = 4'b0010;
defparam syn__829_.CFG_KEEP = 2'b00;
defparam syn__829_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__829_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__829_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__829_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__829_.DPCLK_DELAY = 4'b0000;
defparam syn__829_.OUT_DELAY = 1'b0;
defparam syn__829_.IN_DATA_DELAY = 3'b000;
defparam syn__829_.IN_REG_DELAY = 3'b000;

alta_rio syn__830_(
	.padio(bank2[7]),
	.datain(syn__369_[7]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__830_.coord_x = 9;
defparam syn__830_.coord_y = 9;
defparam syn__830_.coord_z = 1;
defparam syn__830_.IN_ASYNC_MODE = 1'b0;
defparam syn__830_.IN_SYNC_MODE = 1'b0;
defparam syn__830_.IN_POWERUP = 1'b0;
defparam syn__830_.OUT_REG_MODE = 1'b0;
defparam syn__830_.OUT_ASYNC_MODE = 1'b0;
defparam syn__830_.OUT_SYNC_MODE = 1'b0;
defparam syn__830_.OUT_POWERUP = 1'b0;
defparam syn__830_.OE_REG_MODE = 1'b0;
defparam syn__830_.OE_ASYNC_MODE = 1'b0;
defparam syn__830_.OE_SYNC_MODE = 1'b0;
defparam syn__830_.OE_POWERUP = 1'b0;
defparam syn__830_.CFG_TRI_INPUT = 1'b0;
defparam syn__830_.CFG_PULL_UP = 1'b0;
defparam syn__830_.CFG_SLR = 1'b0;
defparam syn__830_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__830_.CFG_PDRCTRL = 4'b0010;
defparam syn__830_.CFG_KEEP = 2'b00;
defparam syn__830_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__830_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__830_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__830_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__830_.DPCLK_DELAY = 4'b0000;
defparam syn__830_.OUT_DELAY = 1'b0;
defparam syn__830_.IN_DATA_DELAY = 3'b000;
defparam syn__830_.IN_REG_DELAY = 3'b000;

alta_rio syn__831_(
	.padio(bank3[0]),
	.datain(syn__369_[0]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__831_.coord_x = 8;
defparam syn__831_.coord_y = 9;
defparam syn__831_.coord_z = 3;
defparam syn__831_.IN_ASYNC_MODE = 1'b0;
defparam syn__831_.IN_SYNC_MODE = 1'b0;
defparam syn__831_.IN_POWERUP = 1'b0;
defparam syn__831_.OUT_REG_MODE = 1'b0;
defparam syn__831_.OUT_ASYNC_MODE = 1'b0;
defparam syn__831_.OUT_SYNC_MODE = 1'b0;
defparam syn__831_.OUT_POWERUP = 1'b0;
defparam syn__831_.OE_REG_MODE = 1'b0;
defparam syn__831_.OE_ASYNC_MODE = 1'b0;
defparam syn__831_.OE_SYNC_MODE = 1'b0;
defparam syn__831_.OE_POWERUP = 1'b0;
defparam syn__831_.CFG_TRI_INPUT = 1'b0;
defparam syn__831_.CFG_PULL_UP = 1'b0;
defparam syn__831_.CFG_SLR = 1'b0;
defparam syn__831_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__831_.CFG_PDRCTRL = 4'b0010;
defparam syn__831_.CFG_KEEP = 2'b00;
defparam syn__831_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__831_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__831_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__831_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__831_.DPCLK_DELAY = 4'b0000;
defparam syn__831_.OUT_DELAY = 1'b0;
defparam syn__831_.IN_DATA_DELAY = 3'b000;
defparam syn__831_.IN_REG_DELAY = 3'b000;

alta_rio syn__832_(
	.padio(bank3[1]),
	.datain(syn__369_[1]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__832_.coord_x = 7;
defparam syn__832_.coord_y = 9;
defparam syn__832_.coord_z = 3;
defparam syn__832_.IN_ASYNC_MODE = 1'b0;
defparam syn__832_.IN_SYNC_MODE = 1'b0;
defparam syn__832_.IN_POWERUP = 1'b0;
defparam syn__832_.OUT_REG_MODE = 1'b0;
defparam syn__832_.OUT_ASYNC_MODE = 1'b0;
defparam syn__832_.OUT_SYNC_MODE = 1'b0;
defparam syn__832_.OUT_POWERUP = 1'b0;
defparam syn__832_.OE_REG_MODE = 1'b0;
defparam syn__832_.OE_ASYNC_MODE = 1'b0;
defparam syn__832_.OE_SYNC_MODE = 1'b0;
defparam syn__832_.OE_POWERUP = 1'b0;
defparam syn__832_.CFG_TRI_INPUT = 1'b0;
defparam syn__832_.CFG_PULL_UP = 1'b0;
defparam syn__832_.CFG_SLR = 1'b0;
defparam syn__832_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__832_.CFG_PDRCTRL = 4'b0010;
defparam syn__832_.CFG_KEEP = 2'b00;
defparam syn__832_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__832_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__832_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__832_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__832_.DPCLK_DELAY = 4'b0000;
defparam syn__832_.OUT_DELAY = 1'b0;
defparam syn__832_.IN_DATA_DELAY = 3'b000;
defparam syn__832_.IN_REG_DELAY = 3'b000;

alta_rio syn__833_(
	.padio(bank3[2]),
	.datain(syn__369_[2]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__833_.coord_x = 7;
defparam syn__833_.coord_y = 9;
defparam syn__833_.coord_z = 0;
defparam syn__833_.IN_ASYNC_MODE = 1'b0;
defparam syn__833_.IN_SYNC_MODE = 1'b0;
defparam syn__833_.IN_POWERUP = 1'b0;
defparam syn__833_.OUT_REG_MODE = 1'b0;
defparam syn__833_.OUT_ASYNC_MODE = 1'b0;
defparam syn__833_.OUT_SYNC_MODE = 1'b0;
defparam syn__833_.OUT_POWERUP = 1'b0;
defparam syn__833_.OE_REG_MODE = 1'b0;
defparam syn__833_.OE_ASYNC_MODE = 1'b0;
defparam syn__833_.OE_SYNC_MODE = 1'b0;
defparam syn__833_.OE_POWERUP = 1'b0;
defparam syn__833_.CFG_TRI_INPUT = 1'b0;
defparam syn__833_.CFG_PULL_UP = 1'b0;
defparam syn__833_.CFG_SLR = 1'b0;
defparam syn__833_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__833_.CFG_PDRCTRL = 4'b0010;
defparam syn__833_.CFG_KEEP = 2'b00;
defparam syn__833_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__833_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__833_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__833_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__833_.DPCLK_DELAY = 4'b0000;
defparam syn__833_.OUT_DELAY = 1'b0;
defparam syn__833_.IN_DATA_DELAY = 3'b000;
defparam syn__833_.IN_REG_DELAY = 3'b000;

alta_rio syn__834_(
	.padio(bank3[3]),
	.datain(syn__369_[3]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__834_.coord_x = 6;
defparam syn__834_.coord_y = 9;
defparam syn__834_.coord_z = 0;
defparam syn__834_.IN_ASYNC_MODE = 1'b0;
defparam syn__834_.IN_SYNC_MODE = 1'b0;
defparam syn__834_.IN_POWERUP = 1'b0;
defparam syn__834_.OUT_REG_MODE = 1'b0;
defparam syn__834_.OUT_ASYNC_MODE = 1'b0;
defparam syn__834_.OUT_SYNC_MODE = 1'b0;
defparam syn__834_.OUT_POWERUP = 1'b0;
defparam syn__834_.OE_REG_MODE = 1'b0;
defparam syn__834_.OE_ASYNC_MODE = 1'b0;
defparam syn__834_.OE_SYNC_MODE = 1'b0;
defparam syn__834_.OE_POWERUP = 1'b0;
defparam syn__834_.CFG_TRI_INPUT = 1'b0;
defparam syn__834_.CFG_PULL_UP = 1'b0;
defparam syn__834_.CFG_SLR = 1'b0;
defparam syn__834_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__834_.CFG_PDRCTRL = 4'b0010;
defparam syn__834_.CFG_KEEP = 2'b00;
defparam syn__834_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__834_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__834_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__834_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__834_.DPCLK_DELAY = 4'b0000;
defparam syn__834_.OUT_DELAY = 1'b0;
defparam syn__834_.IN_DATA_DELAY = 3'b000;
defparam syn__834_.IN_REG_DELAY = 3'b000;

alta_rio syn__835_(
	.padio(bank3[4]),
	.datain(syn__369_[4]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__835_.coord_x = 5;
defparam syn__835_.coord_y = 9;
defparam syn__835_.coord_z = 3;
defparam syn__835_.IN_ASYNC_MODE = 1'b0;
defparam syn__835_.IN_SYNC_MODE = 1'b0;
defparam syn__835_.IN_POWERUP = 1'b0;
defparam syn__835_.OUT_REG_MODE = 1'b0;
defparam syn__835_.OUT_ASYNC_MODE = 1'b0;
defparam syn__835_.OUT_SYNC_MODE = 1'b0;
defparam syn__835_.OUT_POWERUP = 1'b0;
defparam syn__835_.OE_REG_MODE = 1'b0;
defparam syn__835_.OE_ASYNC_MODE = 1'b0;
defparam syn__835_.OE_SYNC_MODE = 1'b0;
defparam syn__835_.OE_POWERUP = 1'b0;
defparam syn__835_.CFG_TRI_INPUT = 1'b0;
defparam syn__835_.CFG_PULL_UP = 1'b0;
defparam syn__835_.CFG_SLR = 1'b0;
defparam syn__835_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__835_.CFG_PDRCTRL = 4'b0010;
defparam syn__835_.CFG_KEEP = 2'b00;
defparam syn__835_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__835_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__835_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__835_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__835_.DPCLK_DELAY = 4'b0000;
defparam syn__835_.OUT_DELAY = 1'b0;
defparam syn__835_.IN_DATA_DELAY = 3'b000;
defparam syn__835_.IN_REG_DELAY = 3'b000;

alta_rio syn__836_(
	.padio(bank3[5]),
	.datain(syn__369_[5]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__836_.coord_x = 5;
defparam syn__836_.coord_y = 9;
defparam syn__836_.coord_z = 2;
defparam syn__836_.IN_ASYNC_MODE = 1'b0;
defparam syn__836_.IN_SYNC_MODE = 1'b0;
defparam syn__836_.IN_POWERUP = 1'b0;
defparam syn__836_.OUT_REG_MODE = 1'b0;
defparam syn__836_.OUT_ASYNC_MODE = 1'b0;
defparam syn__836_.OUT_SYNC_MODE = 1'b0;
defparam syn__836_.OUT_POWERUP = 1'b0;
defparam syn__836_.OE_REG_MODE = 1'b0;
defparam syn__836_.OE_ASYNC_MODE = 1'b0;
defparam syn__836_.OE_SYNC_MODE = 1'b0;
defparam syn__836_.OE_POWERUP = 1'b0;
defparam syn__836_.CFG_TRI_INPUT = 1'b0;
defparam syn__836_.CFG_PULL_UP = 1'b0;
defparam syn__836_.CFG_SLR = 1'b0;
defparam syn__836_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__836_.CFG_PDRCTRL = 4'b0010;
defparam syn__836_.CFG_KEEP = 2'b00;
defparam syn__836_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__836_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__836_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__836_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__836_.DPCLK_DELAY = 4'b0000;
defparam syn__836_.OUT_DELAY = 1'b0;
defparam syn__836_.IN_DATA_DELAY = 3'b000;
defparam syn__836_.IN_REG_DELAY = 3'b000;

alta_rio syn__837_(
	.padio(bank3[6]),
	.datain(syn__369_[6]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__837_.coord_x = 5;
defparam syn__837_.coord_y = 9;
defparam syn__837_.coord_z = 1;
defparam syn__837_.IN_ASYNC_MODE = 1'b0;
defparam syn__837_.IN_SYNC_MODE = 1'b0;
defparam syn__837_.IN_POWERUP = 1'b0;
defparam syn__837_.OUT_REG_MODE = 1'b0;
defparam syn__837_.OUT_ASYNC_MODE = 1'b0;
defparam syn__837_.OUT_SYNC_MODE = 1'b0;
defparam syn__837_.OUT_POWERUP = 1'b0;
defparam syn__837_.OE_REG_MODE = 1'b0;
defparam syn__837_.OE_ASYNC_MODE = 1'b0;
defparam syn__837_.OE_SYNC_MODE = 1'b0;
defparam syn__837_.OE_POWERUP = 1'b0;
defparam syn__837_.CFG_TRI_INPUT = 1'b0;
defparam syn__837_.CFG_PULL_UP = 1'b0;
defparam syn__837_.CFG_SLR = 1'b0;
defparam syn__837_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__837_.CFG_PDRCTRL = 4'b0010;
defparam syn__837_.CFG_KEEP = 2'b00;
defparam syn__837_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__837_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__837_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__837_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__837_.DPCLK_DELAY = 4'b0000;
defparam syn__837_.OUT_DELAY = 1'b0;
defparam syn__837_.IN_DATA_DELAY = 3'b000;
defparam syn__837_.IN_REG_DELAY = 3'b000;

alta_rio syn__838_(
	.padio(bank3[7]),
	.datain(syn__369_[7]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__838_.coord_x = 5;
defparam syn__838_.coord_y = 9;
defparam syn__838_.coord_z = 0;
defparam syn__838_.IN_ASYNC_MODE = 1'b0;
defparam syn__838_.IN_SYNC_MODE = 1'b0;
defparam syn__838_.IN_POWERUP = 1'b0;
defparam syn__838_.OUT_REG_MODE = 1'b0;
defparam syn__838_.OUT_ASYNC_MODE = 1'b0;
defparam syn__838_.OUT_SYNC_MODE = 1'b0;
defparam syn__838_.OUT_POWERUP = 1'b0;
defparam syn__838_.OE_REG_MODE = 1'b0;
defparam syn__838_.OE_ASYNC_MODE = 1'b0;
defparam syn__838_.OE_SYNC_MODE = 1'b0;
defparam syn__838_.OE_POWERUP = 1'b0;
defparam syn__838_.CFG_TRI_INPUT = 1'b0;
defparam syn__838_.CFG_PULL_UP = 1'b0;
defparam syn__838_.CFG_SLR = 1'b0;
defparam syn__838_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__838_.CFG_PDRCTRL = 4'b0010;
defparam syn__838_.CFG_KEEP = 2'b00;
defparam syn__838_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__838_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__838_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__838_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__838_.DPCLK_DELAY = 4'b0000;
defparam syn__838_.OUT_DELAY = 1'b0;
defparam syn__838_.IN_DATA_DELAY = 3'b000;
defparam syn__838_.IN_REG_DELAY = 3'b000;

alta_rio syn__839_(
	.padio(clk),
	.datain(gnd),
	.oe(gnd),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(syn__370_),
	.regout());
defparam syn__839_.coord_x = 4;
defparam syn__839_.coord_y = 9;
defparam syn__839_.coord_z = 0;
defparam syn__839_.IN_ASYNC_MODE = 1'b0;
defparam syn__839_.IN_SYNC_MODE = 1'b0;
defparam syn__839_.IN_POWERUP = 1'b0;
defparam syn__839_.OUT_REG_MODE = 1'b0;
defparam syn__839_.OUT_ASYNC_MODE = 1'b0;
defparam syn__839_.OUT_SYNC_MODE = 1'b0;
defparam syn__839_.OUT_POWERUP = 1'b0;
defparam syn__839_.OE_REG_MODE = 1'b0;
defparam syn__839_.OE_ASYNC_MODE = 1'b0;
defparam syn__839_.OE_SYNC_MODE = 1'b0;
defparam syn__839_.OE_POWERUP = 1'b0;
defparam syn__839_.CFG_TRI_INPUT = 1'b0;
defparam syn__839_.CFG_PULL_UP = 1'b0;
defparam syn__839_.CFG_SLR = 1'b0;
defparam syn__839_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__839_.CFG_PDRCTRL = 4'b0010;
defparam syn__839_.CFG_KEEP = 2'b00;
defparam syn__839_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__839_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__839_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__839_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__839_.DPCLK_DELAY = 4'b0000;
defparam syn__839_.OUT_DELAY = 1'b0;
defparam syn__839_.IN_DATA_DELAY = 3'b000;
defparam syn__839_.IN_REG_DELAY = 3'b000;

alta_slice syn__840_(
	.A(vcc),
	.B(IOvalue[0]),
	.C(vcc),
	.D(syn__001_),
	.Cin(),
	.Qin(syn__369_[0]),
	.Clk(syn__370__X1009_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1009_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__000_[0]),
	.Cout(),
	.Q(syn__369_[0]));
defparam syn__840_.coord_x = 5;
defparam syn__840_.coord_y = 5;
defparam syn__840_.coord_z = 6;
defparam syn__840_.mask = 16'hCCF0;
defparam syn__840_.modeMux = 1'b0;
defparam syn__840_.FeedbackMux = 1'b1;
defparam syn__840_.ShiftMux = 1'b0;
defparam syn__840_.BypassEn = 1'b0;
defparam syn__840_.CarryEnb = 1'b1;

alta_slice syn__841_(
	.A(vcc),
	.B(IOvalue[1]),
	.C(vcc),
	.D(syn__001_),
	.Cin(),
	.Qin(syn__369_[1]),
	.Clk(syn__370__X1009_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1009_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__000_[1]),
	.Cout(),
	.Q(syn__369_[1]));
defparam syn__841_.coord_x = 5;
defparam syn__841_.coord_y = 5;
defparam syn__841_.coord_z = 2;
defparam syn__841_.mask = 16'hCCF0;
defparam syn__841_.modeMux = 1'b0;
defparam syn__841_.FeedbackMux = 1'b1;
defparam syn__841_.ShiftMux = 1'b0;
defparam syn__841_.BypassEn = 1'b0;
defparam syn__841_.CarryEnb = 1'b1;

alta_slice syn__842_(
	.A(IOvalue[2]),
	.B(vcc),
	.C(vcc),
	.D(syn__001_),
	.Cin(),
	.Qin(syn__369_[2]),
	.Clk(syn__370__X1009_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1009_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__000_[2]),
	.Cout(),
	.Q(syn__369_[2]));
defparam syn__842_.coord_x = 5;
defparam syn__842_.coord_y = 5;
defparam syn__842_.coord_z = 4;
defparam syn__842_.mask = 16'hAAF0;
defparam syn__842_.modeMux = 1'b0;
defparam syn__842_.FeedbackMux = 1'b1;
defparam syn__842_.ShiftMux = 1'b0;
defparam syn__842_.BypassEn = 1'b0;
defparam syn__842_.CarryEnb = 1'b1;

alta_slice syn__843_(
	.A(vcc),
	.B(IOvalue[3]),
	.C(vcc),
	.D(syn__001_),
	.Cin(),
	.Qin(syn__369_[3]),
	.Clk(syn__370__X1009_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1009_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__000_[3]),
	.Cout(),
	.Q(syn__369_[3]));
defparam syn__843_.coord_x = 5;
defparam syn__843_.coord_y = 5;
defparam syn__843_.coord_z = 12;
defparam syn__843_.mask = 16'hCCF0;
defparam syn__843_.modeMux = 1'b0;
defparam syn__843_.FeedbackMux = 1'b1;
defparam syn__843_.ShiftMux = 1'b0;
defparam syn__843_.BypassEn = 1'b0;
defparam syn__843_.CarryEnb = 1'b1;

alta_slice syn__844_(
	.A(vcc),
	.B(IOvalue[4]),
	.C(vcc),
	.D(syn__001_),
	.Cin(),
	.Qin(syn__369_[4]),
	.Clk(syn__370__X1009_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1009_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__000_[4]),
	.Cout(),
	.Q(syn__369_[4]));
defparam syn__844_.coord_x = 5;
defparam syn__844_.coord_y = 5;
defparam syn__844_.coord_z = 9;
defparam syn__844_.mask = 16'hCCF0;
defparam syn__844_.modeMux = 1'b0;
defparam syn__844_.FeedbackMux = 1'b1;
defparam syn__844_.ShiftMux = 1'b0;
defparam syn__844_.BypassEn = 1'b0;
defparam syn__844_.CarryEnb = 1'b1;

alta_slice syn__845_(
	.A(vcc),
	.B(syn__001_),
	.C(vcc),
	.D(IOvalue[5]),
	.Cin(),
	.Qin(syn__369_[5]),
	.Clk(syn__370__X1009_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1009_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__000_[5]),
	.Cout(),
	.Q(syn__369_[5]));
defparam syn__845_.coord_x = 5;
defparam syn__845_.coord_y = 5;
defparam syn__845_.coord_z = 13;
defparam syn__845_.mask = 16'hFC30;
defparam syn__845_.modeMux = 1'b0;
defparam syn__845_.FeedbackMux = 1'b1;
defparam syn__845_.ShiftMux = 1'b0;
defparam syn__845_.BypassEn = 1'b0;
defparam syn__845_.CarryEnb = 1'b1;

alta_slice syn__846_(
	.A(vcc),
	.B(IOvalue[6]),
	.C(vcc),
	.D(syn__001_),
	.Cin(),
	.Qin(syn__369_[6]),
	.Clk(syn__370__X1009_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1009_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__000_[6]),
	.Cout(),
	.Q(syn__369_[6]));
defparam syn__846_.coord_x = 5;
defparam syn__846_.coord_y = 5;
defparam syn__846_.coord_z = 1;
defparam syn__846_.mask = 16'hCCF0;
defparam syn__846_.modeMux = 1'b0;
defparam syn__846_.FeedbackMux = 1'b1;
defparam syn__846_.ShiftMux = 1'b0;
defparam syn__846_.BypassEn = 1'b0;
defparam syn__846_.CarryEnb = 1'b1;

alta_slice syn__847_(
	.A(vcc),
	.B(syn__001_),
	.C(vcc),
	.D(IOvalue[7]),
	.Cin(),
	.Qin(syn__369_[7]),
	.Clk(syn__370__X1009_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1009_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__000_[7]),
	.Cout(),
	.Q(syn__369_[7]));
defparam syn__847_.coord_x = 5;
defparam syn__847_.coord_y = 5;
defparam syn__847_.coord_z = 5;
defparam syn__847_.mask = 16'hFC30;
defparam syn__847_.modeMux = 1'b0;
defparam syn__847_.FeedbackMux = 1'b1;
defparam syn__847_.ShiftMux = 1'b0;
defparam syn__847_.BypassEn = 1'b0;
defparam syn__847_.CarryEnb = 1'b1;

alta_slice syn__848_(
	.A(\tc.PC [2]),
	.B(vcc),
	.C(\tc.PC [0]),
	.D(\tc.PC [1]),
	.Cin(),
	.Qin(syn__368_[1]),
	.Clk(syn__370__X1011_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1011_Y1001_GND),
	.SyncReset(SyncReset_X1011_Y1001_GND),
	.ShiftData(),
	.SyncLoad(SyncLoad_X1011_Y1001_VCC),
	.LutOut(syn__269_),
	.Cout(),
	.Q(syn__368_[1]));
defparam syn__848_.coord_x = 0;
defparam syn__848_.coord_y = 3;
defparam syn__848_.coord_z = 0;
defparam syn__848_.mask = 16'hAA00;
defparam syn__848_.modeMux = 1'b0;
defparam syn__848_.FeedbackMux = 1'b0;
defparam syn__848_.ShiftMux = 1'b0;
defparam syn__848_.BypassEn = 1'b1;
defparam syn__848_.CarryEnb = 1'b1;

alta_slice syn__849_(
	.A(syn__014_),
	.B(vcc),
	.C(\tc.PC [1]),
	.D(\tc.PC [0]),
	.Cin(),
	.Qin(syn__368_[2]),
	.Clk(syn__370__X1011_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1011_Y1001_GND),
	.SyncReset(SyncReset_X1011_Y1001_GND),
	.ShiftData(),
	.SyncLoad(SyncLoad_X1011_Y1001_VCC),
	.LutOut(syn__266_),
	.Cout(),
	.Q(syn__368_[2]));
defparam syn__849_.coord_x = 0;
defparam syn__849_.coord_y = 3;
defparam syn__849_.coord_z = 14;
defparam syn__849_.mask = 16'h0055;
defparam syn__849_.modeMux = 1'b0;
defparam syn__849_.FeedbackMux = 1'b0;
defparam syn__849_.ShiftMux = 1'b0;
defparam syn__849_.BypassEn = 1'b1;
defparam syn__849_.CarryEnb = 1'b1;

alta_slice syn__850_(
	.A(syn__269_),
	.B(\tc.PC [0]),
	.C(\tc.PC [2]),
	.D(vcc),
	.Cin(),
	.Qin(syn__368_[3]),
	.Clk(syn__370__X1011_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1011_Y1001_GND),
	.SyncReset(SyncReset_X1011_Y1001_GND),
	.ShiftData(),
	.SyncLoad(SyncLoad_X1011_Y1001_VCC),
	.LutOut(syn__301_),
	.Cout(),
	.Q(syn__368_[3]));
defparam syn__850_.coord_x = 0;
defparam syn__850_.coord_y = 3;
defparam syn__850_.coord_z = 5;
defparam syn__850_.mask = 16'h8888;
defparam syn__850_.modeMux = 1'b0;
defparam syn__850_.FeedbackMux = 1'b0;
defparam syn__850_.ShiftMux = 1'b0;
defparam syn__850_.BypassEn = 1'b1;
defparam syn__850_.CarryEnb = 1'b1;

alta_slice syn__851_(
	.A(syn__014_),
	.B(\tc.PC [0]),
	.C(\tc.PC [3]),
	.D(syn__269_),
	.Cin(),
	.Qin(syn__368_[4]),
	.Clk(syn__370__X1011_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1011_Y1001_GND),
	.SyncReset(SyncReset_X1011_Y1001_GND),
	.ShiftData(),
	.SyncLoad(SyncLoad_X1011_Y1001_VCC),
	.LutOut(syn__268_),
	.Cout(),
	.Q(syn__368_[4]));
defparam syn__851_.coord_x = 0;
defparam syn__851_.coord_y = 3;
defparam syn__851_.coord_z = 1;
defparam syn__851_.mask = 16'hE10F;
defparam syn__851_.modeMux = 1'b0;
defparam syn__851_.FeedbackMux = 1'b0;
defparam syn__851_.ShiftMux = 1'b0;
defparam syn__851_.BypassEn = 1'b1;
defparam syn__851_.CarryEnb = 1'b1;

alta_slice syn__852_(
	.A(syn__325_),
	.B(syn__230_),
	.C(\tc.PC [4]),
	.D(syn__111_),
	.Cin(),
	.Qin(syn__368_[5]),
	.Clk(syn__370__X1000_Y1002_SIG_VCC),
	.AsyncReset(AsyncReset_X1000_Y1002_GND),
	.SyncReset(SyncReset_X1000_Y1002_GND),
	.ShiftData(),
	.SyncLoad(SyncLoad_X1000_Y1002_VCC),
	.LutOut(syn__229_),
	.Cout(),
	.Q(syn__368_[5]));
defparam syn__852_.coord_x = 5;
defparam syn__852_.coord_y = 2;
defparam syn__852_.coord_z = 13;
defparam syn__852_.mask = 16'h88CC;
defparam syn__852_.modeMux = 1'b0;
defparam syn__852_.FeedbackMux = 1'b0;
defparam syn__852_.ShiftMux = 1'b0;
defparam syn__852_.BypassEn = 1'b1;
defparam syn__852_.CarryEnb = 1'b1;

alta_slice syn__853_(
	.A(syn__014_),
	.B(syn__271_),
	.C(\tc.PC [5]),
	.D(\tc.PC [0]),
	.Cin(),
	.Qin(syn__368_[6]),
	.Clk(syn__370__X1011_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1011_Y1001_GND),
	.SyncReset(SyncReset_X1011_Y1001_GND),
	.ShiftData(),
	.SyncLoad(SyncLoad_X1011_Y1001_VCC),
	.LutOut(syn__270_),
	.Cout(),
	.Q(syn__368_[6]));
defparam syn__853_.coord_x = 0;
defparam syn__853_.coord_y = 3;
defparam syn__853_.coord_z = 2;
defparam syn__853_.mask = 16'hCC88;
defparam syn__853_.modeMux = 1'b0;
defparam syn__853_.FeedbackMux = 1'b0;
defparam syn__853_.ShiftMux = 1'b0;
defparam syn__853_.BypassEn = 1'b1;
defparam syn__853_.CarryEnb = 1'b1;

alta_slice syn__854_(
	.A(IOaddr[0]),
	.B(vcc),
	.C(\tc.PCmux [0]),
	.D(syn__370_),
	.Cin(),
	.Qin(\tc.PC [0]),
	.Clk(syn__370__X1009_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1009_Y1001_GND),
	.SyncReset(SyncReset_X1009_Y1001_GND),
	.ShiftData(),
	.SyncLoad(SyncLoad_X1009_Y1001_VCC),
	.LutOut(\tc.im.addr [0]),
	.Cout(),
	.Q(\tc.PC [0]));
defparam syn__854_.coord_x = 5;
defparam syn__854_.coord_y = 5;
defparam syn__854_.coord_z = 14;
defparam syn__854_.mask = 16'hAAF0;
defparam syn__854_.modeMux = 1'b0;
defparam syn__854_.FeedbackMux = 1'b0;
defparam syn__854_.ShiftMux = 1'b0;
defparam syn__854_.BypassEn = 1'b1;
defparam syn__854_.CarryEnb = 1'b1;

alta_slice syn__855_(
	.A(syn__266_),
	.B(syn__355_),
	.C(vcc),
	.D(syn__265_),
	.Cin(),
	.Qin(\tc.PC [1]),
	.Clk(syn__370__X1011_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1011_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc.PCmux [1]),
	.Cout(),
	.Q(\tc.PC [1]));
defparam syn__855_.coord_x = 0;
defparam syn__855_.coord_y = 3;
defparam syn__855_.coord_z = 15;
defparam syn__855_.mask = 16'h33A5;
defparam syn__855_.modeMux = 1'b0;
defparam syn__855_.FeedbackMux = 1'b1;
defparam syn__855_.ShiftMux = 1'b0;
defparam syn__855_.BypassEn = 1'b0;
defparam syn__855_.CarryEnb = 1'b1;

alta_slice syn__856_(
	.A(\tc.PC [0]),
	.B(syn__265_),
	.C(\tc.PCmux [2]),
	.D(\tc.PC [1]),
	.Cin(),
	.Qin(\tc.PC [2]),
	.Clk(syn__370__X1011_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1011_Y1001_GND),
	.SyncReset(SyncReset_X1011_Y1001_GND),
	.ShiftData(),
	.SyncLoad(SyncLoad_X1011_Y1001_VCC),
	.LutOut(syn__306_),
	.Cout(),
	.Q(\tc.PC [2]));
defparam syn__856_.coord_x = 0;
defparam syn__856_.coord_y = 3;
defparam syn__856_.coord_z = 12;
defparam syn__856_.mask = 16'h48C0;
defparam syn__856_.modeMux = 1'b0;
defparam syn__856_.FeedbackMux = 1'b1;
defparam syn__856_.ShiftMux = 1'b0;
defparam syn__856_.BypassEn = 1'b1;
defparam syn__856_.CarryEnb = 1'b1;

alta_slice syn__857_(
	.A(syn__014_),
	.B(\tc.PC [1]),
	.C(\tc.PCmux [3]),
	.D(\tc.PC [0]),
	.Cin(),
	.Qin(\tc.PC [3]),
	.Clk(syn__370__X1011_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1011_Y1001_GND),
	.SyncReset(SyncReset_X1011_Y1001_GND),
	.ShiftData(),
	.SyncLoad(SyncLoad_X1011_Y1001_VCC),
	.LutOut(syn__267_),
	.Cout(),
	.Q(\tc.PC [3]));
defparam syn__857_.coord_x = 0;
defparam syn__857_.coord_y = 3;
defparam syn__857_.coord_z = 6;
defparam syn__857_.mask = 16'hCC88;
defparam syn__857_.modeMux = 1'b0;
defparam syn__857_.FeedbackMux = 1'b0;
defparam syn__857_.ShiftMux = 1'b0;
defparam syn__857_.BypassEn = 1'b1;
defparam syn__857_.CarryEnb = 1'b1;

alta_slice syn__858_(
	.A(syn__265_),
	.B(syn__270_),
	.C(vcc),
	.D(syn__194_),
	.Cin(),
	.Qin(\tc.PC [4]),
	.Clk(syn__370__X1012_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1012_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\tc.PCmux [4]),
	.Cout(),
	.Q(\tc.PC [4]));
defparam syn__858_.coord_x = 1;
defparam syn__858_.coord_y = 3;
defparam syn__858_.coord_z = 12;
defparam syn__858_.mask = 16'h14BE;
defparam syn__858_.modeMux = 1'b0;
defparam syn__858_.FeedbackMux = 1'b1;
defparam syn__858_.ShiftMux = 1'b0;
defparam syn__858_.BypassEn = 1'b0;
defparam syn__858_.CarryEnb = 1'b1;

alta_slice syn__859_(
	.A(\tc.PC [0]),
	.B(syn__273_),
	.C(\tc.PCmux [5]),
	.D(syn__265_),
	.Cin(),
	.Qin(\tc.PC [5]),
	.Clk(syn__370__X1011_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1011_Y1001_GND),
	.SyncReset(SyncReset_X1011_Y1001_GND),
	.ShiftData(),
	.SyncLoad(SyncLoad_X1011_Y1001_VCC),
	.LutOut(syn__298_),
	.Cout(),
	.Q(\tc.PC [5]));
defparam syn__859_.coord_x = 0;
defparam syn__859_.coord_y = 3;
defparam syn__859_.coord_z = 3;
defparam syn__859_.mask = 16'h7800;
defparam syn__859_.modeMux = 1'b0;
defparam syn__859_.FeedbackMux = 1'b1;
defparam syn__859_.ShiftMux = 1'b0;
defparam syn__859_.BypassEn = 1'b1;
defparam syn__859_.CarryEnb = 1'b1;

alta_slice syn__860_(
	.A(\tc.PC [0]),
	.B(syn__275_),
	.C(\tc.PCmux [6]),
	.D(syn__265_),
	.Cin(),
	.Qin(\tc.PC [6]),
	.Clk(syn__370__X1011_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1011_Y1001_GND),
	.SyncReset(SyncReset_X1011_Y1001_GND),
	.ShiftData(),
	.SyncLoad(SyncLoad_X1011_Y1001_VCC),
	.LutOut(syn__296_),
	.Cout(),
	.Q(\tc.PC [6]));
defparam syn__860_.coord_x = 0;
defparam syn__860_.coord_y = 3;
defparam syn__860_.coord_z = 9;
defparam syn__860_.mask = 16'h7800;
defparam syn__860_.modeMux = 1'b0;
defparam syn__860_.FeedbackMux = 1'b1;
defparam syn__860_.ShiftMux = 1'b0;
defparam syn__860_.BypassEn = 1'b1;
defparam syn__860_.CarryEnb = 1'b1;

alta_syncctrl syncload_ctrl_X1000_Y1002(
	.Din(),
	.Dout(SyncLoad_X1000_Y1002_VCC));
defparam syncload_ctrl_X1000_Y1002.coord_x = 5;
defparam syncload_ctrl_X1000_Y1002.coord_y = 2;
defparam syncload_ctrl_X1000_Y1002.coord_z = 1;
defparam syncload_ctrl_X1000_Y1002.SyncCtrlMux = 2'b01;

alta_syncctrl syncload_ctrl_X1009_Y1001(
	.Din(),
	.Dout(SyncLoad_X1009_Y1001_VCC));
defparam syncload_ctrl_X1009_Y1001.coord_x = 5;
defparam syncload_ctrl_X1009_Y1001.coord_y = 5;
defparam syncload_ctrl_X1009_Y1001.coord_z = 1;
defparam syncload_ctrl_X1009_Y1001.SyncCtrlMux = 2'b01;

alta_syncctrl syncload_ctrl_X1011_Y1001(
	.Din(),
	.Dout(SyncLoad_X1011_Y1001_VCC));
defparam syncload_ctrl_X1011_Y1001.coord_x = 0;
defparam syncload_ctrl_X1011_Y1001.coord_y = 3;
defparam syncload_ctrl_X1011_Y1001.coord_z = 1;
defparam syncload_ctrl_X1011_Y1001.SyncCtrlMux = 2'b01;

alta_syncctrl syncreset_ctrl_X1000_Y1002(
	.Din(),
	.Dout(SyncReset_X1000_Y1002_GND));
defparam syncreset_ctrl_X1000_Y1002.coord_x = 5;
defparam syncreset_ctrl_X1000_Y1002.coord_y = 2;
defparam syncreset_ctrl_X1000_Y1002.coord_z = 0;
defparam syncreset_ctrl_X1000_Y1002.SyncCtrlMux = 2'b00;

alta_syncctrl syncreset_ctrl_X1009_Y1001(
	.Din(),
	.Dout(SyncReset_X1009_Y1001_GND));
defparam syncreset_ctrl_X1009_Y1001.coord_x = 5;
defparam syncreset_ctrl_X1009_Y1001.coord_y = 5;
defparam syncreset_ctrl_X1009_Y1001.coord_z = 0;
defparam syncreset_ctrl_X1009_Y1001.SyncCtrlMux = 2'b00;

alta_syncctrl syncreset_ctrl_X1011_Y1001(
	.Din(),
	.Dout(SyncReset_X1011_Y1001_GND));
defparam syncreset_ctrl_X1011_Y1001.coord_x = 0;
defparam syncreset_ctrl_X1011_Y1001.coord_y = 3;
defparam syncreset_ctrl_X1011_Y1001.coord_z = 0;
defparam syncreset_ctrl_X1011_Y1001.SyncCtrlMux = 2'b00;

alta_bram \tc.dm.ram_inst (
	.DataInA({\gnd~I_int , \gnd~I_int , IOvalue[15], IOvalue[14], IOvalue[13], IOvalue[12], IOvalue[11], IOvalue[10], IOvalue[9], IOvalue[8], IOvalue[7], IOvalue[6], IOvalue[5], IOvalue[4], IOvalue[3], IOvalue[2], IOvalue[1], IOvalue[0]}),
	.DataInB({\gnd~I_int , \gnd~I_int , IOvalue[31], IOvalue[30], IOvalue[29], IOvalue[28], IOvalue[27], IOvalue[26], IOvalue[25], IOvalue[24], IOvalue[23], IOvalue[22], IOvalue[21], IOvalue[20], IOvalue[19], IOvalue[18], IOvalue[17], IOvalue[16]}),
	.AddressA({\gnd~I_int , \gnd~I_int , \gnd~I_int , \gnd~I_int , IOaddr[6], IOaddr[5], IOaddr[4], IOaddr[3], IOaddr[2], IOaddr[1], IOaddr[0], \gnd~I_int }),
	.AddressB({\gnd~I_int , \gnd~I_int , \gnd~I_int , \gnd~I_int , IOaddr[6], IOaddr[5], IOaddr[4], IOaddr[3], IOaddr[2], IOaddr[1], IOaddr[0], vcc}),
	.DataOutA({, , \tc.DM [15], \tc.DM [14], \tc.DM [13], \tc.DM [12], \tc.DM [11], \tc.DM [10], \tc.DM [9], \tc.DM [8], \tc.DM [7], \tc.DM [6], \tc.DM [5], \tc.DM [4], \tc.DM [3], \tc.DM [2], \tc.DM [1], \tc.DM [0]}),
	.DataOutB({, , \tc.DM [31], \tc.DM [30], \tc.DM [29], \tc.DM [28], \tc.DM [27], \tc.DM [26], \tc.DM [25], \tc.DM [24], \tc.DM [23], \tc.DM [22], \tc.DM [21], \tc.DM [20], \tc.DM [19], \tc.DM [18], \tc.DM [17], \tc.DM [16]}),
	.Clk0(syn__370_),
	.ClkEn0(vcc),
	.AsyncReset0(gnd),
	.Clk1(syn__370_),
	.ClkEn1(vcc),
	.AsyncReset1(gnd),
	.WeRenA(\tc.WriteDM ),
	.WeRenB(\tc.WriteDM ));
defparam \tc.dm.ram_inst .coord_x = 3;
defparam \tc.dm.ram_inst .coord_y = 5;
defparam \tc.dm.ram_inst .coord_z = 0;
defparam \tc.dm.ram_inst .CLKMODE = 1'b0;
defparam \tc.dm.ram_inst .PORTA_WIDTH = 4'b0000;
defparam \tc.dm.ram_inst .PORTB_WIDTH = 4'b0000;
defparam \tc.dm.ram_inst .PORTA_WRITEMODE = 1'b0;
defparam \tc.dm.ram_inst .PORTB_WRITEMODE = 1'b0;
defparam \tc.dm.ram_inst .PORTA_WRITETHRU = 1'b0;
defparam \tc.dm.ram_inst .PORTB_WRITETHRU = 1'b0;
defparam \tc.dm.ram_inst .PORTA_OUTREG = 1'b0;
defparam \tc.dm.ram_inst .PORTB_OUTREG = 1'b0;
defparam \tc.dm.ram_inst .PORTB_READONLY = 1'b0;
defparam \tc.dm.ram_inst .INIT_VAL = 4608'h000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;

alta_bram \tc.im.ram_inst (
	.DataInA({\gnd~I_int , \gnd~I_int , IOvalue[15], IOvalue[14], IOvalue[13], IOvalue[12], IOvalue[11], IOvalue[10], IOvalue[9], IOvalue[8], IOvalue[7], IOvalue[6], IOvalue[5], IOvalue[4], IOvalue[3], IOvalue[2], IOvalue[1], IOvalue[0]}),
	.DataInB({\gnd~I_int , \gnd~I_int , IOvalue[31], IOvalue[30], IOvalue[29], IOvalue[28], IOvalue[27], IOvalue[26], IOvalue[25], IOvalue[24], IOvalue[23], IOvalue[22], IOvalue[21], IOvalue[20], IOvalue[19], IOvalue[18], IOvalue[17], IOvalue[16]}),
	.AddressA({\gnd~I_int , \gnd~I_int , \gnd~I_int , \gnd~I_int , \tc.im.addr [6], \tc.im.addr [5], \tc.im.addr [4], \tc.im.addr [3], \tc.im.addr [2], \tc.im.addr [1], \tc.im.addr [0], \gnd~I_int }),
	.AddressB({\gnd~I_int , \gnd~I_int , \gnd~I_int , \gnd~I_int , \tc.im.addr [6], \tc.im.addr [5], \tc.im.addr [4], \tc.im.addr [3], \tc.im.addr [2], \tc.im.addr [1], \tc.im.addr [0], vcc}),
	.DataOutA({, , \tc.IM [15], \tc.IM [14], \tc.IM [13], \tc.IM [12], \tc.IM [11], \tc.IM [10], \tc.IM [9], \tc.IM [8], \tc.IM [7], \tc.IM [6], \tc.IM [5], \tc.IM [4], \tc.IM [3], \tc.IM [2], \tc.IM [1], \tc.IM [0]}),
	.DataOutB({, , \tc.IM [31], \tc.IM [30], \tc.IM [29], \tc.IM [28], \tc.IM [27], \tc.IM [26], \tc.IM [25], \tc.IM [24], \tc.IM [23], \tc.IM [22], \tc.IM [21], \tc.IM [20], \tc.IM [19], \tc.IM [18], \tc.IM [17], \tc.IM [16]}),
	.Clk0(syn__370_),
	.ClkEn0(vcc),
	.AsyncReset0(gnd),
	.Clk1(syn__370_),
	.ClkEn1(vcc),
	.AsyncReset1(gnd),
	.WeRenA(gnd),
	.WeRenB(gnd));
defparam \tc.im.ram_inst .coord_x = 3;
defparam \tc.im.ram_inst .coord_y = 6;
defparam \tc.im.ram_inst .coord_z = 0;
defparam \tc.im.ram_inst .CLKMODE = 1'b0;
defparam \tc.im.ram_inst .PORTA_WIDTH = 4'b0000;
defparam \tc.im.ram_inst .PORTB_WIDTH = 4'b0000;
defparam \tc.im.ram_inst .PORTA_WRITEMODE = 1'b0;
defparam \tc.im.ram_inst .PORTB_WRITEMODE = 1'b0;
defparam \tc.im.ram_inst .PORTA_WRITETHRU = 1'b0;
defparam \tc.im.ram_inst .PORTB_WRITETHRU = 1'b0;
defparam \tc.im.ram_inst .PORTA_OUTREG = 1'b0;
defparam \tc.im.ram_inst .PORTB_OUTREG = 1'b0;
defparam \tc.im.ram_inst .PORTB_READONLY = 1'b0;
defparam \tc.im.ram_inst .INIT_VAL = 4608'h0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000A0010060E040C0304000820040008200400082004000820040004600200050009000003070003FF0000000000000000;

alta_bram \tc.rfA.ram_inst (
	.DataInA({\gnd~I_int , \gnd~I_int , \tc.WD [15], \tc.WD [14], \tc.WD [13], \tc.WD [12], \tc.WD [11], \tc.WD [10], \tc.WD [9], \tc.WD [8], \tc.WD [7], \tc.WD [6], \tc.WD [5], \tc.WD [4], \tc.WD [3], \tc.WD [2], \tc.WD [1], \tc.WD [0]}),
	.DataInB({\gnd~I_int , \gnd~I_int , \tc.WD [31], \tc.WD [30], \tc.WD [29], \tc.WD [28], \tc.WD [27], \tc.WD [26], \tc.WD [25], \tc.WD [24], \tc.WD [23], \tc.WD [22], \tc.WD [21], \tc.WD [20], \tc.WD [19], \tc.WD [18], \tc.WD [17], \tc.WD [16]}),
	.AddressA({\gnd~I_int , \gnd~I_int , \gnd~I_int , \gnd~I_int , \tc.rfA.addr [6], \tc.rfA.addr [5], \tc.rfA.addr [4], \tc.rfA.addr [3], \tc.rfA.addr [2], \tc.rfA.addr [1], \tc.rfA.addr [0], \gnd~I_int }),
	.AddressB({\gnd~I_int , \gnd~I_int , \gnd~I_int , \gnd~I_int , \tc.rfA.addr [6], \tc.rfA.addr [5], \tc.rfA.addr [4], \tc.rfA.addr [3], \tc.rfA.addr [2], \tc.rfA.addr [1], \tc.rfA.addr [0], vcc}),
	.DataOutA({, , IOvalue[15], IOvalue[14], IOvalue[13], IOvalue[12], IOvalue[11], IOvalue[10], IOvalue[9], IOvalue[8], IOvalue[7], IOvalue[6], IOvalue[5], IOvalue[4], IOvalue[3], IOvalue[2], IOvalue[1], IOvalue[0]}),
	.DataOutB({, , IOvalue[31], IOvalue[30], IOvalue[29], IOvalue[28], IOvalue[27], IOvalue[26], IOvalue[25], IOvalue[24], IOvalue[23], IOvalue[22], IOvalue[21], IOvalue[20], IOvalue[19], IOvalue[18], IOvalue[17], IOvalue[16]}),
	.Clk0(syn__370_),
	.ClkEn0(vcc),
	.AsyncReset0(gnd),
	.Clk1(syn__370_),
	.ClkEn1(vcc),
	.AsyncReset1(gnd),
	.WeRenA(vcc),
	.WeRenB(vcc));
defparam \tc.rfA.ram_inst .coord_x = 3;
defparam \tc.rfA.ram_inst .coord_y = 7;
defparam \tc.rfA.ram_inst .coord_z = 0;
defparam \tc.rfA.ram_inst .CLKMODE = 1'b0;
defparam \tc.rfA.ram_inst .PORTA_WIDTH = 4'b0000;
defparam \tc.rfA.ram_inst .PORTB_WIDTH = 4'b0000;
defparam \tc.rfA.ram_inst .PORTA_WRITEMODE = 1'b0;
defparam \tc.rfA.ram_inst .PORTB_WRITEMODE = 1'b0;
defparam \tc.rfA.ram_inst .PORTA_WRITETHRU = 1'b0;
defparam \tc.rfA.ram_inst .PORTB_WRITETHRU = 1'b0;
defparam \tc.rfA.ram_inst .PORTA_OUTREG = 1'b0;
defparam \tc.rfA.ram_inst .PORTB_OUTREG = 1'b0;
defparam \tc.rfA.ram_inst .PORTB_READONLY = 1'b0;
defparam \tc.rfA.ram_inst .INIT_VAL = 4608'h000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;

alta_bram \tc.rfB.ram_inst (
	.DataInA({\gnd~I_int , \gnd~I_int , \tc.WD [15], \tc.WD [14], \tc.WD [13], \tc.WD [12], \tc.WD [11], \tc.WD [10], \tc.WD [9], \tc.WD [8], \tc.WD [7], \tc.WD [6], \tc.WD [5], \tc.WD [4], \tc.WD [3], \tc.WD [2], \tc.WD [1], \tc.WD [0]}),
	.DataInB({\gnd~I_int , \gnd~I_int , \tc.WD [31], \tc.WD [30], \tc.WD [29], \tc.WD [28], \tc.WD [27], \tc.WD [26], \tc.WD [25], \tc.WD [24], \tc.WD [23], \tc.WD [22], \tc.WD [21], \tc.WD [20], \tc.WD [19], \tc.WD [18], \tc.WD [17], \tc.WD [16]}),
	.AddressA({\gnd~I_int , \gnd~I_int , \gnd~I_int , \gnd~I_int , \tc.rfB.addr [6], \tc.rfB.addr [5], \tc.rfB.addr [4], \tc.rfB.addr [3], \tc.rfB.addr [2], \tc.rfB.addr [1], \tc.rfB.addr [0], \gnd~I_int }),
	.AddressB({\gnd~I_int , \gnd~I_int , \gnd~I_int , \gnd~I_int , \tc.rfB.addr [6], \tc.rfB.addr [5], \tc.rfB.addr [4], \tc.rfB.addr [3], \tc.rfB.addr [2], \tc.rfB.addr [1], \tc.rfB.addr [0], vcc}),
	.DataOutA({, , IOaddr[15], IOaddr[14], IOaddr[13], IOaddr[12], IOaddr[11], IOaddr[10], IOaddr[9], IOaddr[8], IOaddr[7], IOaddr[6], IOaddr[5], IOaddr[4], IOaddr[3], IOaddr[2], IOaddr[1], IOaddr[0]}),
	.DataOutB({, , IOaddr[31], IOaddr[30], IOaddr[29], IOaddr[28], IOaddr[27], IOaddr[26], IOaddr[25], IOaddr[24], IOaddr[23], IOaddr[22], IOaddr[21], IOaddr[20], IOaddr[19], IOaddr[18], IOaddr[17], IOaddr[16]}),
	.Clk0(syn__370_),
	.ClkEn0(vcc),
	.AsyncReset0(gnd),
	.Clk1(syn__370_),
	.ClkEn1(vcc),
	.AsyncReset1(gnd),
	.WeRenA(vcc),
	.WeRenB(vcc));
defparam \tc.rfB.ram_inst .coord_x = 3;
defparam \tc.rfB.ram_inst .coord_y = 8;
defparam \tc.rfB.ram_inst .coord_z = 0;
defparam \tc.rfB.ram_inst .CLKMODE = 1'b0;
defparam \tc.rfB.ram_inst .PORTA_WIDTH = 4'b0000;
defparam \tc.rfB.ram_inst .PORTB_WIDTH = 4'b0000;
defparam \tc.rfB.ram_inst .PORTA_WRITEMODE = 1'b0;
defparam \tc.rfB.ram_inst .PORTB_WRITEMODE = 1'b0;
defparam \tc.rfB.ram_inst .PORTA_WRITETHRU = 1'b0;
defparam \tc.rfB.ram_inst .PORTB_WRITETHRU = 1'b0;
defparam \tc.rfB.ram_inst .PORTA_OUTREG = 1'b0;
defparam \tc.rfB.ram_inst .PORTB_OUTREG = 1'b0;
defparam \tc.rfB.ram_inst .PORTB_READONLY = 1'b0;
defparam \tc.rfB.ram_inst .INIT_VAL = 4608'h000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;

endmodule
