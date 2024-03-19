`timescale 1 ps/ 1 ps

module Blinky(
	clk,
	leds);
input	clk;
output	[7:0] leds;

//wire	gnd;
//wire	vcc;
wire	AsyncReset_X1009_Y1001_GND;
wire	AsyncReset_X1011_Y1001_GND;
wire	AsyncReset_X1012_Y1001_GND;
wire	[25:0] counter;
//wire	counter[0];
wire	\counter[0]_inv ;
//wire	counter[10];
//wire	counter[11];
//wire	counter[12];
//wire	counter[13];
//wire	counter[14];
//wire	counter[15];
//wire	counter[16];
//wire	counter[17];
//wire	counter[18];
//wire	counter[19];
//wire	counter[1];
//wire	counter[20];
//wire	counter[21];
//wire	counter[22];
//wire	counter[23];
//wire	counter[24];
//wire	counter[25];
//wire	counter[2];
//wire	counter[3];
//wire	counter[4];
//wire	counter[5];
//wire	counter[6];
//wire	counter[7];
//wire	counter[8];
//wire	counter[9];
wire	[25:0] syn__00_;
//wire	syn__00_[0];
//wire	syn__00_[10];
//wire	syn__00_[11];
//wire	syn__00_[12];
//wire	syn__00_[13];
//wire	syn__00_[14];
//wire	syn__00_[15];
//wire	syn__00_[16];
//wire	syn__00_[17];
//wire	syn__00_[18];
//wire	syn__00_[19];
//wire	syn__00_[1];
//wire	syn__00_[20];
//wire	syn__00_[21];
//wire	syn__00_[22];
//wire	syn__00_[23];
//wire	syn__00_[24];
//wire	syn__00_[25];
//wire	syn__00_[2];
//wire	syn__00_[3];
//wire	syn__00_[4];
//wire	syn__00_[5];
//wire	syn__00_[6];
//wire	syn__00_[7];
//wire	syn__00_[8];
//wire	syn__00_[9];
wire	syn__01_;
wire	syn__02_;
wire	syn__03_;
wire	syn__04_;
wire	syn__05_;
wire	syn__06_;
wire	syn__07_;
wire	syn__08_;
wire	syn__09_;
wire	syn__09__X1009_Y1001_SIG_VCC;
wire	syn__09__X1011_Y1001_SIG_VCC;
wire	syn__09__X1012_Y1001_SIG_VCC;
wire	[7:0] syn__10_;
//wire	syn__10_[0];
//wire	syn__10_[1];
//wire	syn__10_[2];
//wire	syn__10_[3];
//wire	syn__10_[4];
//wire	syn__10_[5];
//wire	syn__10_[6];
//wire	syn__10_[7];

assign vcc = 1'b1;
assign gnd = 1'b0;

alta_asyncctrl asyncreset_ctrl_X1009_Y1001_N0(
	.Din(),
	.Dout(AsyncReset_X1009_Y1001_GND));
defparam asyncreset_ctrl_X1009_Y1001_N0.coord_x = 1;
defparam asyncreset_ctrl_X1009_Y1001_N0.coord_y = 7;
defparam asyncreset_ctrl_X1009_Y1001_N0.coord_z = 0;
defparam asyncreset_ctrl_X1009_Y1001_N0.AsyncCtrlMux = 2'b00;

alta_asyncctrl asyncreset_ctrl_X1011_Y1001_N0(
	.Din(),
	.Dout(AsyncReset_X1011_Y1001_GND));
defparam asyncreset_ctrl_X1011_Y1001_N0.coord_x = 1;
defparam asyncreset_ctrl_X1011_Y1001_N0.coord_y = 8;
defparam asyncreset_ctrl_X1011_Y1001_N0.coord_z = 0;
defparam asyncreset_ctrl_X1011_Y1001_N0.AsyncCtrlMux = 2'b00;

alta_asyncctrl asyncreset_ctrl_X1012_Y1001_N0(
	.Din(),
	.Dout(AsyncReset_X1012_Y1001_GND));
defparam asyncreset_ctrl_X1012_Y1001_N0.coord_x = 2;
defparam asyncreset_ctrl_X1012_Y1001_N0.coord_y = 7;
defparam asyncreset_ctrl_X1012_Y1001_N0.coord_z = 0;
defparam asyncreset_ctrl_X1012_Y1001_N0.AsyncCtrlMux = 2'b00;

alta_clkenctrl clken_ctrl_X1009_Y1001_N0(
	.ClkIn(syn__09_),
	.ClkEn(),
	.ClkOut(syn__09__X1009_Y1001_SIG_VCC));
defparam clken_ctrl_X1009_Y1001_N0.coord_x = 1;
defparam clken_ctrl_X1009_Y1001_N0.coord_y = 7;
defparam clken_ctrl_X1009_Y1001_N0.coord_z = 0;
defparam clken_ctrl_X1009_Y1001_N0.ClkMux = 2'b10;
defparam clken_ctrl_X1009_Y1001_N0.ClkEnMux = 2'b01;

alta_clkenctrl clken_ctrl_X1011_Y1001_N0(
	.ClkIn(syn__09_),
	.ClkEn(),
	.ClkOut(syn__09__X1011_Y1001_SIG_VCC));
defparam clken_ctrl_X1011_Y1001_N0.coord_x = 1;
defparam clken_ctrl_X1011_Y1001_N0.coord_y = 8;
defparam clken_ctrl_X1011_Y1001_N0.coord_z = 0;
defparam clken_ctrl_X1011_Y1001_N0.ClkMux = 2'b10;
defparam clken_ctrl_X1011_Y1001_N0.ClkEnMux = 2'b01;

alta_clkenctrl clken_ctrl_X1012_Y1001_N0(
	.ClkIn(syn__09_),
	.ClkEn(),
	.ClkOut(syn__09__X1012_Y1001_SIG_VCC));
defparam clken_ctrl_X1012_Y1001_N0.coord_x = 2;
defparam clken_ctrl_X1012_Y1001_N0.coord_y = 7;
defparam clken_ctrl_X1012_Y1001_N0.coord_z = 0;
defparam clken_ctrl_X1012_Y1001_N0.ClkMux = 2'b10;
defparam clken_ctrl_X1012_Y1001_N0.ClkEnMux = 2'b01;

alta_slice syn__15_(
	.A(counter[2]),
	.B(counter[3]),
	.C(counter[1]),
	.D(counter[0]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__01_),
	.Cout(),
	.Q());
defparam syn__15_.coord_x = 1;
defparam syn__15_.coord_y = 7;
defparam syn__15_.coord_z = 4;
defparam syn__15_.mask = 16'h8000;
defparam syn__15_.modeMux = 1'b0;
defparam syn__15_.FeedbackMux = 1'b0;
defparam syn__15_.ShiftMux = 1'b0;
defparam syn__15_.BypassEn = 1'b0;
defparam syn__15_.CarryEnb = 1'b1;

alta_slice syn__19_(
	.A(counter[5]),
	.B(counter[6]),
	.C(syn__01_),
	.D(counter[4]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__02_),
	.Cout(),
	.Q());
defparam syn__19_.coord_x = 1;
defparam syn__19_.coord_y = 7;
defparam syn__19_.coord_z = 0;
defparam syn__19_.mask = 16'h8000;
defparam syn__19_.modeMux = 1'b0;
defparam syn__19_.FeedbackMux = 1'b0;
defparam syn__19_.ShiftMux = 1'b0;
defparam syn__19_.BypassEn = 1'b0;
defparam syn__19_.CarryEnb = 1'b1;

alta_slice syn__23_(
	.A(counter[8]),
	.B(counter[9]),
	.C(syn__02_),
	.D(counter[7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__03_),
	.Cout(),
	.Q());
defparam syn__23_.coord_x = 1;
defparam syn__23_.coord_y = 7;
defparam syn__23_.coord_z = 12;
defparam syn__23_.mask = 16'h8000;
defparam syn__23_.modeMux = 1'b0;
defparam syn__23_.FeedbackMux = 1'b0;
defparam syn__23_.ShiftMux = 1'b0;
defparam syn__23_.BypassEn = 1'b0;
defparam syn__23_.CarryEnb = 1'b1;

alta_slice syn__27_(
	.A(counter[11]),
	.B(counter[10]),
	.C(syn__03_),
	.D(counter[12]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__04_),
	.Cout(),
	.Q());
defparam syn__27_.coord_x = 1;
defparam syn__27_.coord_y = 7;
defparam syn__27_.coord_z = 10;
defparam syn__27_.mask = 16'h8000;
defparam syn__27_.modeMux = 1'b0;
defparam syn__27_.FeedbackMux = 1'b0;
defparam syn__27_.ShiftMux = 1'b0;
defparam syn__27_.BypassEn = 1'b0;
defparam syn__27_.CarryEnb = 1'b1;

alta_slice syn__31_(
	.A(syn__04_),
	.B(counter[15]),
	.C(counter[14]),
	.D(counter[13]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__05_),
	.Cout(),
	.Q());
defparam syn__31_.coord_x = 1;
defparam syn__31_.coord_y = 8;
defparam syn__31_.coord_z = 4;
defparam syn__31_.mask = 16'h8000;
defparam syn__31_.modeMux = 1'b0;
defparam syn__31_.FeedbackMux = 1'b0;
defparam syn__31_.ShiftMux = 1'b0;
defparam syn__31_.BypassEn = 1'b0;
defparam syn__31_.CarryEnb = 1'b1;

alta_slice syn__35_(
	.A(counter[17]),
	.B(syn__10_[0]),
	.C(syn__05_),
	.D(counter[16]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__06_),
	.Cout(),
	.Q());
defparam syn__35_.coord_x = 1;
defparam syn__35_.coord_y = 8;
defparam syn__35_.coord_z = 6;
defparam syn__35_.mask = 16'h8000;
defparam syn__35_.modeMux = 1'b0;
defparam syn__35_.FeedbackMux = 1'b0;
defparam syn__35_.ShiftMux = 1'b0;
defparam syn__35_.BypassEn = 1'b0;
defparam syn__35_.CarryEnb = 1'b1;

alta_slice syn__39_(
	.A(syn__10_[2]),
	.B(syn__10_[3]),
	.C(syn__06_),
	.D(syn__10_[1]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__07_),
	.Cout(),
	.Q());
defparam syn__39_.coord_x = 1;
defparam syn__39_.coord_y = 8;
defparam syn__39_.coord_z = 2;
defparam syn__39_.mask = 16'h8000;
defparam syn__39_.modeMux = 1'b0;
defparam syn__39_.FeedbackMux = 1'b0;
defparam syn__39_.ShiftMux = 1'b0;
defparam syn__39_.BypassEn = 1'b0;
defparam syn__39_.CarryEnb = 1'b1;

alta_slice syn__43_(
	.A(syn__10_[5]),
	.B(syn__10_[6]),
	.C(syn__07_),
	.D(syn__10_[4]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__08_),
	.Cout(),
	.Q());
defparam syn__43_.coord_x = 1;
defparam syn__43_.coord_y = 8;
defparam syn__43_.coord_z = 12;
defparam syn__43_.mask = 16'h8000;
defparam syn__43_.modeMux = 1'b0;
defparam syn__43_.FeedbackMux = 1'b0;
defparam syn__43_.ShiftMux = 1'b0;
defparam syn__43_.BypassEn = 1'b0;
defparam syn__43_.CarryEnb = 1'b1;

alta_rio syn__44_(
	.padio(clk),
	.datain(gnd),
	.oe(gnd),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(syn__09_),
	.regout());
defparam syn__44_.coord_x = 4;
defparam syn__44_.coord_y = 9;
defparam syn__44_.coord_z = 0;
defparam syn__44_.IN_ASYNC_MODE = 1'b0;
defparam syn__44_.IN_SYNC_MODE = 1'b0;
defparam syn__44_.IN_POWERUP = 1'b0;
defparam syn__44_.OUT_REG_MODE = 1'b0;
defparam syn__44_.OUT_ASYNC_MODE = 1'b0;
defparam syn__44_.OUT_SYNC_MODE = 1'b0;
defparam syn__44_.OUT_POWERUP = 1'b0;
defparam syn__44_.OE_REG_MODE = 1'b0;
defparam syn__44_.OE_ASYNC_MODE = 1'b0;
defparam syn__44_.OE_SYNC_MODE = 1'b0;
defparam syn__44_.OE_POWERUP = 1'b0;
defparam syn__44_.CFG_TRI_INPUT = 1'b0;
defparam syn__44_.CFG_PULL_UP = 1'b0;
defparam syn__44_.CFG_SLR = 1'b0;
defparam syn__44_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__44_.CFG_PDRCTRL = 4'b0010;
defparam syn__44_.CFG_KEEP = 2'b00;
defparam syn__44_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__44_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__44_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__44_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__44_.DPCLK_DELAY = 4'b0000;
defparam syn__44_.OUT_DELAY = 1'b0;
defparam syn__44_.IN_DATA_DELAY = 3'b000;
defparam syn__44_.IN_REG_DELAY = 3'b000;

alta_rio syn__45_(
	.padio(leds[0]),
	.datain(syn__10_[0]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__45_.coord_x = 2;
defparam syn__45_.coord_y = 9;
defparam syn__45_.coord_z = 0;
defparam syn__45_.IN_ASYNC_MODE = 1'b0;
defparam syn__45_.IN_SYNC_MODE = 1'b0;
defparam syn__45_.IN_POWERUP = 1'b0;
defparam syn__45_.OUT_REG_MODE = 1'b0;
defparam syn__45_.OUT_ASYNC_MODE = 1'b0;
defparam syn__45_.OUT_SYNC_MODE = 1'b0;
defparam syn__45_.OUT_POWERUP = 1'b0;
defparam syn__45_.OE_REG_MODE = 1'b0;
defparam syn__45_.OE_ASYNC_MODE = 1'b0;
defparam syn__45_.OE_SYNC_MODE = 1'b0;
defparam syn__45_.OE_POWERUP = 1'b0;
defparam syn__45_.CFG_TRI_INPUT = 1'b0;
defparam syn__45_.CFG_PULL_UP = 1'b0;
defparam syn__45_.CFG_SLR = 1'b0;
defparam syn__45_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__45_.CFG_PDRCTRL = 4'b0010;
defparam syn__45_.CFG_KEEP = 2'b00;
defparam syn__45_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__45_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__45_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__45_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__45_.DPCLK_DELAY = 4'b0000;
defparam syn__45_.OUT_DELAY = 1'b0;
defparam syn__45_.IN_DATA_DELAY = 3'b000;
defparam syn__45_.IN_REG_DELAY = 3'b000;

alta_rio syn__46_(
	.padio(leds[1]),
	.datain(syn__10_[1]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__46_.coord_x = 1;
defparam syn__46_.coord_y = 9;
defparam syn__46_.coord_z = 3;
defparam syn__46_.IN_ASYNC_MODE = 1'b0;
defparam syn__46_.IN_SYNC_MODE = 1'b0;
defparam syn__46_.IN_POWERUP = 1'b0;
defparam syn__46_.OUT_REG_MODE = 1'b0;
defparam syn__46_.OUT_ASYNC_MODE = 1'b0;
defparam syn__46_.OUT_SYNC_MODE = 1'b0;
defparam syn__46_.OUT_POWERUP = 1'b0;
defparam syn__46_.OE_REG_MODE = 1'b0;
defparam syn__46_.OE_ASYNC_MODE = 1'b0;
defparam syn__46_.OE_SYNC_MODE = 1'b0;
defparam syn__46_.OE_POWERUP = 1'b0;
defparam syn__46_.CFG_TRI_INPUT = 1'b0;
defparam syn__46_.CFG_PULL_UP = 1'b0;
defparam syn__46_.CFG_SLR = 1'b0;
defparam syn__46_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__46_.CFG_PDRCTRL = 4'b0010;
defparam syn__46_.CFG_KEEP = 2'b00;
defparam syn__46_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__46_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__46_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__46_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__46_.DPCLK_DELAY = 4'b0000;
defparam syn__46_.OUT_DELAY = 1'b0;
defparam syn__46_.IN_DATA_DELAY = 3'b000;
defparam syn__46_.IN_REG_DELAY = 3'b000;

alta_rio syn__47_(
	.padio(leds[2]),
	.datain(syn__10_[2]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__47_.coord_x = 0;
defparam syn__47_.coord_y = 9;
defparam syn__47_.coord_z = 2;
defparam syn__47_.IN_ASYNC_MODE = 1'b0;
defparam syn__47_.IN_SYNC_MODE = 1'b0;
defparam syn__47_.IN_POWERUP = 1'b0;
defparam syn__47_.OUT_REG_MODE = 1'b0;
defparam syn__47_.OUT_ASYNC_MODE = 1'b0;
defparam syn__47_.OUT_SYNC_MODE = 1'b0;
defparam syn__47_.OUT_POWERUP = 1'b0;
defparam syn__47_.OE_REG_MODE = 1'b0;
defparam syn__47_.OE_ASYNC_MODE = 1'b0;
defparam syn__47_.OE_SYNC_MODE = 1'b0;
defparam syn__47_.OE_POWERUP = 1'b0;
defparam syn__47_.CFG_TRI_INPUT = 1'b0;
defparam syn__47_.CFG_PULL_UP = 1'b0;
defparam syn__47_.CFG_SLR = 1'b0;
defparam syn__47_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__47_.CFG_PDRCTRL = 4'b0010;
defparam syn__47_.CFG_KEEP = 2'b00;
defparam syn__47_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__47_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__47_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__47_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__47_.DPCLK_DELAY = 4'b0000;
defparam syn__47_.OUT_DELAY = 1'b0;
defparam syn__47_.IN_DATA_DELAY = 3'b000;
defparam syn__47_.IN_REG_DELAY = 3'b000;

alta_rio syn__48_(
	.padio(leds[3]),
	.datain(syn__10_[3]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__48_.coord_x = 0;
defparam syn__48_.coord_y = 9;
defparam syn__48_.coord_z = 0;
defparam syn__48_.IN_ASYNC_MODE = 1'b0;
defparam syn__48_.IN_SYNC_MODE = 1'b0;
defparam syn__48_.IN_POWERUP = 1'b0;
defparam syn__48_.OUT_REG_MODE = 1'b0;
defparam syn__48_.OUT_ASYNC_MODE = 1'b0;
defparam syn__48_.OUT_SYNC_MODE = 1'b0;
defparam syn__48_.OUT_POWERUP = 1'b0;
defparam syn__48_.OE_REG_MODE = 1'b0;
defparam syn__48_.OE_ASYNC_MODE = 1'b0;
defparam syn__48_.OE_SYNC_MODE = 1'b0;
defparam syn__48_.OE_POWERUP = 1'b0;
defparam syn__48_.CFG_TRI_INPUT = 1'b0;
defparam syn__48_.CFG_PULL_UP = 1'b0;
defparam syn__48_.CFG_SLR = 1'b0;
defparam syn__48_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__48_.CFG_PDRCTRL = 4'b0010;
defparam syn__48_.CFG_KEEP = 2'b00;
defparam syn__48_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__48_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__48_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__48_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__48_.DPCLK_DELAY = 4'b0000;
defparam syn__48_.OUT_DELAY = 1'b0;
defparam syn__48_.IN_DATA_DELAY = 3'b000;
defparam syn__48_.IN_REG_DELAY = 3'b000;

alta_rio syn__49_(
	.padio(leds[4]),
	.datain(syn__10_[4]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__49_.coord_x = 1;
defparam syn__49_.coord_y = 9;
defparam syn__49_.coord_z = 1;
defparam syn__49_.IN_ASYNC_MODE = 1'b0;
defparam syn__49_.IN_SYNC_MODE = 1'b0;
defparam syn__49_.IN_POWERUP = 1'b0;
defparam syn__49_.OUT_REG_MODE = 1'b0;
defparam syn__49_.OUT_ASYNC_MODE = 1'b0;
defparam syn__49_.OUT_SYNC_MODE = 1'b0;
defparam syn__49_.OUT_POWERUP = 1'b0;
defparam syn__49_.OE_REG_MODE = 1'b0;
defparam syn__49_.OE_ASYNC_MODE = 1'b0;
defparam syn__49_.OE_SYNC_MODE = 1'b0;
defparam syn__49_.OE_POWERUP = 1'b0;
defparam syn__49_.CFG_TRI_INPUT = 1'b0;
defparam syn__49_.CFG_PULL_UP = 1'b0;
defparam syn__49_.CFG_SLR = 1'b0;
defparam syn__49_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__49_.CFG_PDRCTRL = 4'b0010;
defparam syn__49_.CFG_KEEP = 2'b00;
defparam syn__49_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__49_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__49_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__49_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__49_.DPCLK_DELAY = 4'b0000;
defparam syn__49_.OUT_DELAY = 1'b0;
defparam syn__49_.IN_DATA_DELAY = 3'b000;
defparam syn__49_.IN_REG_DELAY = 3'b000;

alta_rio syn__50_(
	.padio(leds[5]),
	.datain(syn__10_[5]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__50_.coord_x = 6;
defparam syn__50_.coord_y = 9;
defparam syn__50_.coord_z = 2;
defparam syn__50_.IN_ASYNC_MODE = 1'b0;
defparam syn__50_.IN_SYNC_MODE = 1'b0;
defparam syn__50_.IN_POWERUP = 1'b0;
defparam syn__50_.OUT_REG_MODE = 1'b0;
defparam syn__50_.OUT_ASYNC_MODE = 1'b0;
defparam syn__50_.OUT_SYNC_MODE = 1'b0;
defparam syn__50_.OUT_POWERUP = 1'b0;
defparam syn__50_.OE_REG_MODE = 1'b0;
defparam syn__50_.OE_ASYNC_MODE = 1'b0;
defparam syn__50_.OE_SYNC_MODE = 1'b0;
defparam syn__50_.OE_POWERUP = 1'b0;
defparam syn__50_.CFG_TRI_INPUT = 1'b0;
defparam syn__50_.CFG_PULL_UP = 1'b0;
defparam syn__50_.CFG_SLR = 1'b0;
defparam syn__50_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__50_.CFG_PDRCTRL = 4'b0010;
defparam syn__50_.CFG_KEEP = 2'b00;
defparam syn__50_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__50_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__50_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__50_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__50_.DPCLK_DELAY = 4'b0000;
defparam syn__50_.OUT_DELAY = 1'b0;
defparam syn__50_.IN_DATA_DELAY = 3'b000;
defparam syn__50_.IN_REG_DELAY = 3'b000;

alta_rio syn__51_(
	.padio(leds[6]),
	.datain(syn__10_[6]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__51_.coord_x = 7;
defparam syn__51_.coord_y = 1;
defparam syn__51_.coord_z = 0;
defparam syn__51_.IN_ASYNC_MODE = 1'b0;
defparam syn__51_.IN_SYNC_MODE = 1'b0;
defparam syn__51_.IN_POWERUP = 1'b0;
defparam syn__51_.OUT_REG_MODE = 1'b0;
defparam syn__51_.OUT_ASYNC_MODE = 1'b0;
defparam syn__51_.OUT_SYNC_MODE = 1'b0;
defparam syn__51_.OUT_POWERUP = 1'b0;
defparam syn__51_.OE_REG_MODE = 1'b0;
defparam syn__51_.OE_ASYNC_MODE = 1'b0;
defparam syn__51_.OE_SYNC_MODE = 1'b0;
defparam syn__51_.OE_POWERUP = 1'b0;
defparam syn__51_.CFG_TRI_INPUT = 1'b0;
defparam syn__51_.CFG_PULL_UP = 1'b0;
defparam syn__51_.CFG_SLR = 1'b0;
defparam syn__51_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__51_.CFG_PDRCTRL = 4'b0010;
defparam syn__51_.CFG_KEEP = 2'b00;
defparam syn__51_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__51_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__51_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__51_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__51_.DPCLK_DELAY = 4'b0000;
defparam syn__51_.OUT_DELAY = 1'b0;
defparam syn__51_.IN_DATA_DELAY = 3'b000;
defparam syn__51_.IN_REG_DELAY = 3'b000;

alta_rio syn__52_(
	.padio(leds[7]),
	.datain(syn__10_[7]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__52_.coord_x = 2;
defparam syn__52_.coord_y = 1;
defparam syn__52_.coord_z = 0;
defparam syn__52_.IN_ASYNC_MODE = 1'b0;
defparam syn__52_.IN_SYNC_MODE = 1'b0;
defparam syn__52_.IN_POWERUP = 1'b0;
defparam syn__52_.OUT_REG_MODE = 1'b0;
defparam syn__52_.OUT_ASYNC_MODE = 1'b0;
defparam syn__52_.OUT_SYNC_MODE = 1'b0;
defparam syn__52_.OUT_POWERUP = 1'b0;
defparam syn__52_.OE_REG_MODE = 1'b0;
defparam syn__52_.OE_ASYNC_MODE = 1'b0;
defparam syn__52_.OE_SYNC_MODE = 1'b0;
defparam syn__52_.OE_POWERUP = 1'b0;
defparam syn__52_.CFG_TRI_INPUT = 1'b0;
defparam syn__52_.CFG_PULL_UP = 1'b0;
defparam syn__52_.CFG_SLR = 1'b0;
defparam syn__52_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__52_.CFG_PDRCTRL = 4'b0010;
defparam syn__52_.CFG_KEEP = 2'b00;
defparam syn__52_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__52_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__52_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__52_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__52_.DPCLK_DELAY = 4'b0000;
defparam syn__52_.OUT_DELAY = 1'b0;
defparam syn__52_.IN_DATA_DELAY = 3'b000;
defparam syn__52_.IN_REG_DELAY = 3'b000;

alta_slice syn__53_(
	.A(),
	.B(),
	.C(vcc),
	.D(),
	.Cin(),
	.Qin(counter[0]),
	.Clk(syn__09__X1009_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1009_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\counter[0]_inv ),
	.Cout(),
	.Q(counter[0]));
defparam syn__53_.coord_x = 1;
defparam syn__53_.coord_y = 7;
defparam syn__53_.coord_z = 11;
defparam syn__53_.mask = 16'h0F0F;
defparam syn__53_.modeMux = 1'b0;
defparam syn__53_.FeedbackMux = 1'b1;
defparam syn__53_.ShiftMux = 1'b0;
defparam syn__53_.BypassEn = 1'b0;
defparam syn__53_.CarryEnb = 1'b1;

alta_slice syn__54_(
	.A(vcc),
	.B(vcc),
	.C(vcc),
	.D(counter[0]),
	.Cin(),
	.Qin(counter[1]),
	.Clk(syn__09__X1009_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1009_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__00_[1]),
	.Cout(),
	.Q(counter[1]));
defparam syn__54_.coord_x = 1;
defparam syn__54_.coord_y = 7;
defparam syn__54_.coord_z = 8;
defparam syn__54_.mask = 16'h0FF0;
defparam syn__54_.modeMux = 1'b0;
defparam syn__54_.FeedbackMux = 1'b1;
defparam syn__54_.ShiftMux = 1'b0;
defparam syn__54_.BypassEn = 1'b0;
defparam syn__54_.CarryEnb = 1'b1;

alta_slice syn__55_(
	.A(counter[1]),
	.B(vcc),
	.C(vcc),
	.D(counter[0]),
	.Cin(),
	.Qin(counter[2]),
	.Clk(syn__09__X1009_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1009_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__00_[2]),
	.Cout(),
	.Q(counter[2]));
defparam syn__55_.coord_x = 1;
defparam syn__55_.coord_y = 7;
defparam syn__55_.coord_z = 2;
defparam syn__55_.mask = 16'h5AF0;
defparam syn__55_.modeMux = 1'b0;
defparam syn__55_.FeedbackMux = 1'b1;
defparam syn__55_.ShiftMux = 1'b0;
defparam syn__55_.BypassEn = 1'b0;
defparam syn__55_.CarryEnb = 1'b1;

alta_slice syn__56_(
	.A(counter[1]),
	.B(counter[2]),
	.C(vcc),
	.D(counter[0]),
	.Cin(),
	.Qin(counter[3]),
	.Clk(syn__09__X1009_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1009_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__00_[3]),
	.Cout(),
	.Q(counter[3]));
defparam syn__56_.coord_x = 1;
defparam syn__56_.coord_y = 7;
defparam syn__56_.coord_z = 3;
defparam syn__56_.mask = 16'h78F0;
defparam syn__56_.modeMux = 1'b0;
defparam syn__56_.FeedbackMux = 1'b1;
defparam syn__56_.ShiftMux = 1'b0;
defparam syn__56_.BypassEn = 1'b0;
defparam syn__56_.CarryEnb = 1'b1;

alta_slice syn__57_(
	.A(vcc),
	.B(vcc),
	.C(vcc),
	.D(syn__01_),
	.Cin(),
	.Qin(counter[4]),
	.Clk(syn__09__X1009_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1009_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__00_[4]),
	.Cout(),
	.Q(counter[4]));
defparam syn__57_.coord_x = 1;
defparam syn__57_.coord_y = 7;
defparam syn__57_.coord_z = 5;
defparam syn__57_.mask = 16'h0FF0;
defparam syn__57_.modeMux = 1'b0;
defparam syn__57_.FeedbackMux = 1'b1;
defparam syn__57_.ShiftMux = 1'b0;
defparam syn__57_.BypassEn = 1'b0;
defparam syn__57_.CarryEnb = 1'b1;

alta_slice syn__58_(
	.A(syn__01_),
	.B(vcc),
	.C(vcc),
	.D(counter[4]),
	.Cin(),
	.Qin(counter[5]),
	.Clk(syn__09__X1009_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1009_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__00_[5]),
	.Cout(),
	.Q(counter[5]));
defparam syn__58_.coord_x = 1;
defparam syn__58_.coord_y = 7;
defparam syn__58_.coord_z = 1;
defparam syn__58_.mask = 16'h5AF0;
defparam syn__58_.modeMux = 1'b0;
defparam syn__58_.FeedbackMux = 1'b1;
defparam syn__58_.ShiftMux = 1'b0;
defparam syn__58_.BypassEn = 1'b0;
defparam syn__58_.CarryEnb = 1'b1;

alta_slice syn__59_(
	.A(syn__01_),
	.B(counter[5]),
	.C(vcc),
	.D(counter[4]),
	.Cin(),
	.Qin(counter[6]),
	.Clk(syn__09__X1009_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1009_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__00_[6]),
	.Cout(),
	.Q(counter[6]));
defparam syn__59_.coord_x = 1;
defparam syn__59_.coord_y = 7;
defparam syn__59_.coord_z = 13;
defparam syn__59_.mask = 16'h78F0;
defparam syn__59_.modeMux = 1'b0;
defparam syn__59_.FeedbackMux = 1'b1;
defparam syn__59_.ShiftMux = 1'b0;
defparam syn__59_.BypassEn = 1'b0;
defparam syn__59_.CarryEnb = 1'b1;

alta_slice syn__60_(
	.A(syn__02_),
	.B(vcc),
	.C(vcc),
	.D(vcc),
	.Cin(),
	.Qin(counter[7]),
	.Clk(syn__09__X1009_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1009_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__00_[7]),
	.Cout(),
	.Q(counter[7]));
defparam syn__60_.coord_x = 1;
defparam syn__60_.coord_y = 7;
defparam syn__60_.coord_z = 9;
defparam syn__60_.mask = 16'h5A5A;
defparam syn__60_.modeMux = 1'b0;
defparam syn__60_.FeedbackMux = 1'b1;
defparam syn__60_.ShiftMux = 1'b0;
defparam syn__60_.BypassEn = 1'b0;
defparam syn__60_.CarryEnb = 1'b1;

alta_slice syn__61_(
	.A(syn__02_),
	.B(vcc),
	.C(vcc),
	.D(counter[7]),
	.Cin(),
	.Qin(counter[8]),
	.Clk(syn__09__X1009_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1009_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__00_[8]),
	.Cout(),
	.Q(counter[8]));
defparam syn__61_.coord_x = 1;
defparam syn__61_.coord_y = 7;
defparam syn__61_.coord_z = 6;
defparam syn__61_.mask = 16'h5AF0;
defparam syn__61_.modeMux = 1'b0;
defparam syn__61_.FeedbackMux = 1'b1;
defparam syn__61_.ShiftMux = 1'b0;
defparam syn__61_.BypassEn = 1'b0;
defparam syn__61_.CarryEnb = 1'b1;

alta_slice syn__62_(
	.A(syn__02_),
	.B(counter[8]),
	.C(vcc),
	.D(counter[7]),
	.Cin(),
	.Qin(counter[9]),
	.Clk(syn__09__X1009_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1009_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__00_[9]),
	.Cout(),
	.Q(counter[9]));
defparam syn__62_.coord_x = 1;
defparam syn__62_.coord_y = 7;
defparam syn__62_.coord_z = 7;
defparam syn__62_.mask = 16'h78F0;
defparam syn__62_.modeMux = 1'b0;
defparam syn__62_.FeedbackMux = 1'b1;
defparam syn__62_.ShiftMux = 1'b0;
defparam syn__62_.BypassEn = 1'b0;
defparam syn__62_.CarryEnb = 1'b1;

alta_slice syn__63_(
	.A(vcc),
	.B(vcc),
	.C(vcc),
	.D(syn__03_),
	.Cin(),
	.Qin(counter[10]),
	.Clk(syn__09__X1012_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1012_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__00_[10]),
	.Cout(),
	.Q(counter[10]));
defparam syn__63_.coord_x = 2;
defparam syn__63_.coord_y = 7;
defparam syn__63_.coord_z = 0;
defparam syn__63_.mask = 16'h0FF0;
defparam syn__63_.modeMux = 1'b0;
defparam syn__63_.FeedbackMux = 1'b1;
defparam syn__63_.ShiftMux = 1'b0;
defparam syn__63_.BypassEn = 1'b0;
defparam syn__63_.CarryEnb = 1'b1;

alta_slice syn__64_(
	.A(syn__03_),
	.B(counter[10]),
	.C(vcc),
	.D(vcc),
	.Cin(),
	.Qin(counter[11]),
	.Clk(syn__09__X1009_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1009_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__00_[11]),
	.Cout(),
	.Q(counter[11]));
defparam syn__64_.coord_x = 1;
defparam syn__64_.coord_y = 7;
defparam syn__64_.coord_z = 14;
defparam syn__64_.mask = 16'h7878;
defparam syn__64_.modeMux = 1'b0;
defparam syn__64_.FeedbackMux = 1'b1;
defparam syn__64_.ShiftMux = 1'b0;
defparam syn__64_.BypassEn = 1'b0;
defparam syn__64_.CarryEnb = 1'b1;

alta_slice syn__65_(
	.A(syn__03_),
	.B(counter[11]),
	.C(vcc),
	.D(counter[10]),
	.Cin(),
	.Qin(counter[12]),
	.Clk(syn__09__X1009_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1009_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__00_[12]),
	.Cout(),
	.Q(counter[12]));
defparam syn__65_.coord_x = 1;
defparam syn__65_.coord_y = 7;
defparam syn__65_.coord_z = 15;
defparam syn__65_.mask = 16'h78F0;
defparam syn__65_.modeMux = 1'b0;
defparam syn__65_.FeedbackMux = 1'b1;
defparam syn__65_.ShiftMux = 1'b0;
defparam syn__65_.BypassEn = 1'b0;
defparam syn__65_.CarryEnb = 1'b1;

alta_slice syn__66_(
	.A(syn__04_),
	.B(vcc),
	.C(vcc),
	.D(vcc),
	.Cin(),
	.Qin(counter[13]),
	.Clk(syn__09__X1011_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1011_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__00_[13]),
	.Cout(),
	.Q(counter[13]));
defparam syn__66_.coord_x = 1;
defparam syn__66_.coord_y = 8;
defparam syn__66_.coord_z = 7;
defparam syn__66_.mask = 16'h5A5A;
defparam syn__66_.modeMux = 1'b0;
defparam syn__66_.FeedbackMux = 1'b1;
defparam syn__66_.ShiftMux = 1'b0;
defparam syn__66_.BypassEn = 1'b0;
defparam syn__66_.CarryEnb = 1'b1;

alta_slice syn__67_(
	.A(syn__04_),
	.B(vcc),
	.C(vcc),
	.D(counter[13]),
	.Cin(),
	.Qin(counter[14]),
	.Clk(syn__09__X1011_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1011_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__00_[14]),
	.Cout(),
	.Q(counter[14]));
defparam syn__67_.coord_x = 1;
defparam syn__67_.coord_y = 8;
defparam syn__67_.coord_z = 10;
defparam syn__67_.mask = 16'h5AF0;
defparam syn__67_.modeMux = 1'b0;
defparam syn__67_.FeedbackMux = 1'b1;
defparam syn__67_.ShiftMux = 1'b0;
defparam syn__67_.BypassEn = 1'b0;
defparam syn__67_.CarryEnb = 1'b1;

alta_slice syn__68_(
	.A(syn__04_),
	.B(counter[14]),
	.C(vcc),
	.D(counter[13]),
	.Cin(),
	.Qin(counter[15]),
	.Clk(syn__09__X1011_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1011_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__00_[15]),
	.Cout(),
	.Q(counter[15]));
defparam syn__68_.coord_x = 1;
defparam syn__68_.coord_y = 8;
defparam syn__68_.coord_z = 11;
defparam syn__68_.mask = 16'h78F0;
defparam syn__68_.modeMux = 1'b0;
defparam syn__68_.FeedbackMux = 1'b1;
defparam syn__68_.ShiftMux = 1'b0;
defparam syn__68_.BypassEn = 1'b0;
defparam syn__68_.CarryEnb = 1'b1;

alta_slice syn__69_(
	.A(vcc),
	.B(vcc),
	.C(vcc),
	.D(syn__05_),
	.Cin(),
	.Qin(counter[16]),
	.Clk(syn__09__X1011_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1011_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__00_[16]),
	.Cout(),
	.Q(counter[16]));
defparam syn__69_.coord_x = 1;
defparam syn__69_.coord_y = 8;
defparam syn__69_.coord_z = 5;
defparam syn__69_.mask = 16'h0FF0;
defparam syn__69_.modeMux = 1'b0;
defparam syn__69_.FeedbackMux = 1'b1;
defparam syn__69_.ShiftMux = 1'b0;
defparam syn__69_.BypassEn = 1'b0;
defparam syn__69_.CarryEnb = 1'b1;

alta_slice syn__70_(
	.A(syn__05_),
	.B(vcc),
	.C(vcc),
	.D(counter[16]),
	.Cin(),
	.Qin(counter[17]),
	.Clk(syn__09__X1011_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1011_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__00_[17]),
	.Cout(),
	.Q(counter[17]));
defparam syn__70_.coord_x = 1;
defparam syn__70_.coord_y = 8;
defparam syn__70_.coord_z = 14;
defparam syn__70_.mask = 16'h5AF0;
defparam syn__70_.modeMux = 1'b0;
defparam syn__70_.FeedbackMux = 1'b1;
defparam syn__70_.ShiftMux = 1'b0;
defparam syn__70_.BypassEn = 1'b0;
defparam syn__70_.CarryEnb = 1'b1;

alta_slice syn__71_(
	.A(syn__05_),
	.B(counter[17]),
	.C(vcc),
	.D(counter[16]),
	.Cin(),
	.Qin(syn__10_[0]),
	.Clk(syn__09__X1011_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1011_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__00_[18]),
	.Cout(),
	.Q(syn__10_[0]));
defparam syn__71_.coord_x = 1;
defparam syn__71_.coord_y = 8;
defparam syn__71_.coord_z = 15;
defparam syn__71_.mask = 16'h78F0;
defparam syn__71_.modeMux = 1'b0;
defparam syn__71_.FeedbackMux = 1'b1;
defparam syn__71_.ShiftMux = 1'b0;
defparam syn__71_.BypassEn = 1'b0;
defparam syn__71_.CarryEnb = 1'b1;

alta_slice syn__72_(
	.A(syn__06_),
	.B(vcc),
	.C(vcc),
	.D(vcc),
	.Cin(),
	.Qin(syn__10_[1]),
	.Clk(syn__09__X1011_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1011_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__00_[19]),
	.Cout(),
	.Q(syn__10_[1]));
defparam syn__72_.coord_x = 1;
defparam syn__72_.coord_y = 8;
defparam syn__72_.coord_z = 3;
defparam syn__72_.mask = 16'h5A5A;
defparam syn__72_.modeMux = 1'b0;
defparam syn__72_.FeedbackMux = 1'b1;
defparam syn__72_.ShiftMux = 1'b0;
defparam syn__72_.BypassEn = 1'b0;
defparam syn__72_.CarryEnb = 1'b1;

alta_slice syn__73_(
	.A(syn__06_),
	.B(vcc),
	.C(vcc),
	.D(syn__10_[1]),
	.Cin(),
	.Qin(syn__10_[2]),
	.Clk(syn__09__X1011_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1011_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__00_[20]),
	.Cout(),
	.Q(syn__10_[2]));
defparam syn__73_.coord_x = 1;
defparam syn__73_.coord_y = 8;
defparam syn__73_.coord_z = 0;
defparam syn__73_.mask = 16'h5AF0;
defparam syn__73_.modeMux = 1'b0;
defparam syn__73_.FeedbackMux = 1'b1;
defparam syn__73_.ShiftMux = 1'b0;
defparam syn__73_.BypassEn = 1'b0;
defparam syn__73_.CarryEnb = 1'b1;

alta_slice syn__74_(
	.A(syn__06_),
	.B(syn__10_[2]),
	.C(vcc),
	.D(syn__10_[1]),
	.Cin(),
	.Qin(syn__10_[3]),
	.Clk(syn__09__X1011_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1011_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__00_[21]),
	.Cout(),
	.Q(syn__10_[3]));
defparam syn__74_.coord_x = 1;
defparam syn__74_.coord_y = 8;
defparam syn__74_.coord_z = 1;
defparam syn__74_.mask = 16'h78F0;
defparam syn__74_.modeMux = 1'b0;
defparam syn__74_.FeedbackMux = 1'b1;
defparam syn__74_.ShiftMux = 1'b0;
defparam syn__74_.BypassEn = 1'b0;
defparam syn__74_.CarryEnb = 1'b1;

alta_slice syn__75_(
	.A(syn__07_),
	.B(vcc),
	.C(vcc),
	.D(vcc),
	.Cin(),
	.Qin(syn__10_[4]),
	.Clk(syn__09__X1011_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1011_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__00_[22]),
	.Cout(),
	.Q(syn__10_[4]));
defparam syn__75_.coord_x = 1;
defparam syn__75_.coord_y = 8;
defparam syn__75_.coord_z = 13;
defparam syn__75_.mask = 16'h5A5A;
defparam syn__75_.modeMux = 1'b0;
defparam syn__75_.FeedbackMux = 1'b1;
defparam syn__75_.ShiftMux = 1'b0;
defparam syn__75_.BypassEn = 1'b0;
defparam syn__75_.CarryEnb = 1'b1;

alta_slice syn__76_(
	.A(syn__07_),
	.B(vcc),
	.C(vcc),
	.D(syn__10_[4]),
	.Cin(),
	.Qin(syn__10_[5]),
	.Clk(syn__09__X1011_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1011_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__00_[23]),
	.Cout(),
	.Q(syn__10_[5]));
defparam syn__76_.coord_x = 1;
defparam syn__76_.coord_y = 8;
defparam syn__76_.coord_z = 8;
defparam syn__76_.mask = 16'h5AF0;
defparam syn__76_.modeMux = 1'b0;
defparam syn__76_.FeedbackMux = 1'b1;
defparam syn__76_.ShiftMux = 1'b0;
defparam syn__76_.BypassEn = 1'b0;
defparam syn__76_.CarryEnb = 1'b1;

alta_slice syn__77_(
	.A(syn__07_),
	.B(syn__10_[5]),
	.C(vcc),
	.D(syn__10_[4]),
	.Cin(),
	.Qin(syn__10_[6]),
	.Clk(syn__09__X1011_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1011_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__00_[24]),
	.Cout(),
	.Q(syn__10_[6]));
defparam syn__77_.coord_x = 1;
defparam syn__77_.coord_y = 8;
defparam syn__77_.coord_z = 9;
defparam syn__77_.mask = 16'h78F0;
defparam syn__77_.modeMux = 1'b0;
defparam syn__77_.FeedbackMux = 1'b1;
defparam syn__77_.ShiftMux = 1'b0;
defparam syn__77_.BypassEn = 1'b0;
defparam syn__77_.CarryEnb = 1'b1;

alta_slice syn__78_(
	.A(vcc),
	.B(vcc),
	.C(vcc),
	.D(syn__08_),
	.Cin(),
	.Qin(syn__10_[7]),
	.Clk(syn__09__X1012_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1012_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__00_[25]),
	.Cout(),
	.Q(syn__10_[7]));
defparam syn__78_.coord_x = 2;
defparam syn__78_.coord_y = 7;
defparam syn__78_.coord_z = 10;
defparam syn__78_.mask = 16'h0FF0;
defparam syn__78_.modeMux = 1'b0;
defparam syn__78_.FeedbackMux = 1'b1;
defparam syn__78_.ShiftMux = 1'b0;
defparam syn__78_.BypassEn = 1'b0;
defparam syn__78_.CarryEnb = 1'b1;

endmodule
