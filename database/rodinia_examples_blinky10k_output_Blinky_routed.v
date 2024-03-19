`timescale 1 ps/ 1 ps

module Blinky(
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
wire	AsyncReset_X1001_Y1001_GND;
wire	AsyncReset_X1002_Y1001_GND;
wire	AsyncReset_X1003_Y1001_GND;
wire	[31:0] syn__000_;
//wire	syn__000_[0];
//wire	syn__000_[10];
//wire	syn__000_[11];
//wire	syn__000_[12];
//wire	syn__000_[13];
//wire	syn__000_[14];
//wire	syn__000_[15];
//wire	syn__000_[16];
//wire	syn__000_[17];
//wire	syn__000_[18];
//wire	syn__000_[19];
//wire	syn__000_[1];
//wire	syn__000_[20];
//wire	syn__000_[21];
//wire	syn__000_[22];
//wire	syn__000_[23];
//wire	syn__000_[24];
//wire	syn__000_[25];
//wire	syn__000_[26];
//wire	syn__000_[27];
//wire	syn__000_[28];
//wire	syn__000_[29];
//wire	syn__000_[2];
//wire	syn__000_[30];
//wire	syn__000_[31];
//wire	syn__000_[3];
//wire	syn__000_[4];
//wire	syn__000_[5];
//wire	syn__000_[6];
//wire	syn__000_[7];
//wire	syn__000_[8];
//wire	syn__000_[9];
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
wire	[7:0] syn__011_;
//wire	syn__011_[0];
wire	\syn__011_[0]_inv ;
//wire	syn__011_[1];
//wire	syn__011_[2];
//wire	syn__011_[3];
//wire	syn__011_[4];
//wire	syn__011_[5];
//wire	syn__011_[6];
//wire	syn__011_[7];
wire	[7:0] syn__012_;
//wire	syn__012_[0];
//wire	syn__012_[1];
//wire	syn__012_[2];
//wire	syn__012_[3];
//wire	syn__012_[4];
//wire	syn__012_[5];
//wire	syn__012_[6];
//wire	syn__012_[7];
wire	[7:0] syn__013_;
//wire	syn__013_[0];
//wire	syn__013_[1];
//wire	syn__013_[2];
//wire	syn__013_[3];
//wire	syn__013_[4];
//wire	syn__013_[5];
//wire	syn__013_[6];
//wire	syn__013_[7];
wire	[7:0] syn__014_;
//wire	syn__014_[0];
//wire	syn__014_[1];
//wire	syn__014_[2];
//wire	syn__014_[3];
//wire	syn__014_[4];
//wire	syn__014_[5];
//wire	syn__014_[6];
//wire	syn__014_[7];
wire	syn__015_;
wire	syn__015__X1001_Y1001_SIG_VCC;
wire	syn__015__X1002_Y1001_SIG_VCC;
wire	syn__015__X1003_Y1001_SIG_VCC;

assign vcc = 1'b1;
assign gnd = 1'b0;

alta_asyncctrl asyncreset_ctrl_X1001_Y1001_N0(
	.Din(),
	.Dout(AsyncReset_X1001_Y1001_GND));
defparam asyncreset_ctrl_X1001_Y1001_N0.coord_x = 1;
defparam asyncreset_ctrl_X1001_Y1001_N0.coord_y = 11;
defparam asyncreset_ctrl_X1001_Y1001_N0.coord_z = 0;
defparam asyncreset_ctrl_X1001_Y1001_N0.AsyncCtrlMux = 2'b00;

alta_asyncctrl asyncreset_ctrl_X1002_Y1001_N0(
	.Din(),
	.Dout(AsyncReset_X1002_Y1001_GND));
defparam asyncreset_ctrl_X1002_Y1001_N0.coord_x = 1;
defparam asyncreset_ctrl_X1002_Y1001_N0.coord_y = 3;
defparam asyncreset_ctrl_X1002_Y1001_N0.coord_z = 0;
defparam asyncreset_ctrl_X1002_Y1001_N0.AsyncCtrlMux = 2'b00;

alta_asyncctrl asyncreset_ctrl_X1003_Y1001_N0(
	.Din(),
	.Dout(AsyncReset_X1003_Y1001_GND));
defparam asyncreset_ctrl_X1003_Y1001_N0.coord_x = 1;
defparam asyncreset_ctrl_X1003_Y1001_N0.coord_y = 1;
defparam asyncreset_ctrl_X1003_Y1001_N0.coord_z = 0;
defparam asyncreset_ctrl_X1003_Y1001_N0.AsyncCtrlMux = 2'b00;

alta_clkenctrl clken_ctrl_X1001_Y1001_N0(
	.ClkIn(syn__015_),
	.ClkEn(),
	.ClkOut(syn__015__X1001_Y1001_SIG_VCC));
defparam clken_ctrl_X1001_Y1001_N0.coord_x = 1;
defparam clken_ctrl_X1001_Y1001_N0.coord_y = 11;
defparam clken_ctrl_X1001_Y1001_N0.coord_z = 0;
defparam clken_ctrl_X1001_Y1001_N0.ClkMux = 2'b10;
defparam clken_ctrl_X1001_Y1001_N0.ClkEnMux = 2'b01;

alta_clkenctrl clken_ctrl_X1002_Y1001_N0(
	.ClkIn(syn__015_),
	.ClkEn(),
	.ClkOut(syn__015__X1002_Y1001_SIG_VCC));
defparam clken_ctrl_X1002_Y1001_N0.coord_x = 1;
defparam clken_ctrl_X1002_Y1001_N0.coord_y = 3;
defparam clken_ctrl_X1002_Y1001_N0.coord_z = 0;
defparam clken_ctrl_X1002_Y1001_N0.ClkMux = 2'b10;
defparam clken_ctrl_X1002_Y1001_N0.ClkEnMux = 2'b01;

alta_clkenctrl clken_ctrl_X1003_Y1001_N0(
	.ClkIn(syn__015_),
	.ClkEn(),
	.ClkOut(syn__015__X1003_Y1001_SIG_VCC));
defparam clken_ctrl_X1003_Y1001_N0.coord_x = 1;
defparam clken_ctrl_X1003_Y1001_N0.coord_y = 1;
defparam clken_ctrl_X1003_Y1001_N0.coord_z = 0;
defparam clken_ctrl_X1003_Y1001_N0.ClkMux = 2'b10;
defparam clken_ctrl_X1003_Y1001_N0.ClkEnMux = 2'b01;

alta_slice syn__020_(
	.A(syn__011_[2]),
	.B(syn__011_[3]),
	.C(syn__011_[1]),
	.D(syn__011_[0]),
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
defparam syn__020_.coord_x = 1;
defparam syn__020_.coord_y = 11;
defparam syn__020_.coord_z = 4;
defparam syn__020_.mask = 16'h8000;
defparam syn__020_.modeMux = 1'b0;
defparam syn__020_.FeedbackMux = 1'b0;
defparam syn__020_.ShiftMux = 1'b0;
defparam syn__020_.BypassEn = 1'b0;
defparam syn__020_.CarryEnb = 1'b1;

alta_slice syn__024_(
	.A(syn__011_[5]),
	.B(syn__011_[6]),
	.C(syn__003_),
	.D(syn__011_[4]),
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
defparam syn__024_.coord_x = 1;
defparam syn__024_.coord_y = 11;
defparam syn__024_.coord_z = 8;
defparam syn__024_.mask = 16'h8000;
defparam syn__024_.modeMux = 1'b0;
defparam syn__024_.FeedbackMux = 1'b0;
defparam syn__024_.ShiftMux = 1'b0;
defparam syn__024_.BypassEn = 1'b0;
defparam syn__024_.CarryEnb = 1'b1;

alta_slice syn__028_(
	.A(syn__012_[0]),
	.B(syn__012_[1]),
	.C(syn__004_),
	.D(syn__011_[7]),
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
defparam syn__028_.coord_x = 1;
defparam syn__028_.coord_y = 11;
defparam syn__028_.coord_z = 14;
defparam syn__028_.mask = 16'h8000;
defparam syn__028_.modeMux = 1'b0;
defparam syn__028_.FeedbackMux = 1'b0;
defparam syn__028_.ShiftMux = 1'b0;
defparam syn__028_.BypassEn = 1'b0;
defparam syn__028_.CarryEnb = 1'b1;

alta_slice syn__032_(
	.A(syn__012_[3]),
	.B(syn__012_[4]),
	.C(syn__005_),
	.D(syn__012_[2]),
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
defparam syn__032_.coord_x = 1;
defparam syn__032_.coord_y = 11;
defparam syn__032_.coord_z = 5;
defparam syn__032_.mask = 16'h8000;
defparam syn__032_.modeMux = 1'b0;
defparam syn__032_.FeedbackMux = 1'b0;
defparam syn__032_.ShiftMux = 1'b0;
defparam syn__032_.BypassEn = 1'b0;
defparam syn__032_.CarryEnb = 1'b1;

alta_slice syn__036_(
	.A(syn__012_[6]),
	.B(syn__012_[7]),
	.C(syn__006_),
	.D(syn__012_[5]),
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
defparam syn__036_.coord_x = 1;
defparam syn__036_.coord_y = 3;
defparam syn__036_.coord_z = 4;
defparam syn__036_.mask = 16'h8000;
defparam syn__036_.modeMux = 1'b0;
defparam syn__036_.FeedbackMux = 1'b0;
defparam syn__036_.ShiftMux = 1'b0;
defparam syn__036_.BypassEn = 1'b0;
defparam syn__036_.CarryEnb = 1'b1;

alta_slice syn__040_(
	.A(syn__013_[1]),
	.B(syn__013_[2]),
	.C(syn__007_),
	.D(syn__013_[0]),
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
defparam syn__040_.coord_x = 1;
defparam syn__040_.coord_y = 3;
defparam syn__040_.coord_z = 2;
defparam syn__040_.mask = 16'h8000;
defparam syn__040_.modeMux = 1'b0;
defparam syn__040_.FeedbackMux = 1'b0;
defparam syn__040_.ShiftMux = 1'b0;
defparam syn__040_.BypassEn = 1'b0;
defparam syn__040_.CarryEnb = 1'b1;

alta_slice syn__044_(
	.A(syn__013_[4]),
	.B(syn__013_[5]),
	.C(syn__008_),
	.D(syn__013_[3]),
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
defparam syn__044_.coord_x = 1;
defparam syn__044_.coord_y = 3;
defparam syn__044_.coord_z = 0;
defparam syn__044_.mask = 16'h8000;
defparam syn__044_.modeMux = 1'b0;
defparam syn__044_.FeedbackMux = 1'b0;
defparam syn__044_.ShiftMux = 1'b0;
defparam syn__044_.BypassEn = 1'b0;
defparam syn__044_.CarryEnb = 1'b1;

alta_slice syn__048_(
	.A(syn__013_[7]),
	.B(syn__014_[0]),
	.C(syn__009_),
	.D(syn__013_[6]),
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
defparam syn__048_.coord_x = 1;
defparam syn__048_.coord_y = 3;
defparam syn__048_.coord_z = 8;
defparam syn__048_.mask = 16'h8000;
defparam syn__048_.modeMux = 1'b0;
defparam syn__048_.FeedbackMux = 1'b0;
defparam syn__048_.ShiftMux = 1'b0;
defparam syn__048_.BypassEn = 1'b0;
defparam syn__048_.CarryEnb = 1'b1;

alta_slice syn__052_(
	.A(syn__014_[2]),
	.B(syn__014_[1]),
	.C(syn__010_),
	.D(syn__014_[3]),
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
defparam syn__052_.coord_x = 1;
defparam syn__052_.coord_y = 1;
defparam syn__052_.coord_z = 8;
defparam syn__052_.mask = 16'h8000;
defparam syn__052_.modeMux = 1'b0;
defparam syn__052_.FeedbackMux = 1'b0;
defparam syn__052_.ShiftMux = 1'b0;
defparam syn__052_.BypassEn = 1'b0;
defparam syn__052_.CarryEnb = 1'b1;

alta_slice syn__056_(
	.A(syn__014_[5]),
	.B(syn__014_[6]),
	.C(syn__001_),
	.D(syn__014_[4]),
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
defparam syn__056_.coord_x = 1;
defparam syn__056_.coord_y = 1;
defparam syn__056_.coord_z = 4;
defparam syn__056_.mask = 16'h8000;
defparam syn__056_.modeMux = 1'b0;
defparam syn__056_.FeedbackMux = 1'b0;
defparam syn__056_.ShiftMux = 1'b0;
defparam syn__056_.BypassEn = 1'b0;
defparam syn__056_.CarryEnb = 1'b1;

alta_rio syn__057_(
	.padio(bank0[0]),
	.datain(syn__011_[0]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__057_.coord_x = 0;
defparam syn__057_.coord_y = 15;
defparam syn__057_.coord_z = 0;
defparam syn__057_.IN_ASYNC_MODE = 1'b0;
defparam syn__057_.IN_SYNC_MODE = 1'b0;
defparam syn__057_.IN_POWERUP = 1'b0;
defparam syn__057_.OUT_REG_MODE = 1'b0;
defparam syn__057_.OUT_ASYNC_MODE = 1'b0;
defparam syn__057_.OUT_SYNC_MODE = 1'b0;
defparam syn__057_.OUT_POWERUP = 1'b0;
defparam syn__057_.OE_REG_MODE = 1'b0;
defparam syn__057_.OE_ASYNC_MODE = 1'b0;
defparam syn__057_.OE_SYNC_MODE = 1'b0;
defparam syn__057_.OE_POWERUP = 1'b0;
defparam syn__057_.CFG_TRI_INPUT = 1'b0;
defparam syn__057_.CFG_PULL_UP = 1'b0;
defparam syn__057_.CFG_SLR = 1'b0;
defparam syn__057_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__057_.CFG_PDRCTRL = 4'b0010;
defparam syn__057_.CFG_KEEP = 2'b00;
defparam syn__057_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__057_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__057_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__057_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__057_.DPCLK_DELAY = 4'b0000;
defparam syn__057_.OUT_DELAY = 1'b0;
defparam syn__057_.IN_DATA_DELAY = 3'b000;
defparam syn__057_.IN_REG_DELAY = 3'b000;

alta_rio syn__058_(
	.padio(bank0[1]),
	.datain(syn__011_[1]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__058_.coord_x = 0;
defparam syn__058_.coord_y = 15;
defparam syn__058_.coord_z = 1;
defparam syn__058_.IN_ASYNC_MODE = 1'b0;
defparam syn__058_.IN_SYNC_MODE = 1'b0;
defparam syn__058_.IN_POWERUP = 1'b0;
defparam syn__058_.OUT_REG_MODE = 1'b0;
defparam syn__058_.OUT_ASYNC_MODE = 1'b0;
defparam syn__058_.OUT_SYNC_MODE = 1'b0;
defparam syn__058_.OUT_POWERUP = 1'b0;
defparam syn__058_.OE_REG_MODE = 1'b0;
defparam syn__058_.OE_ASYNC_MODE = 1'b0;
defparam syn__058_.OE_SYNC_MODE = 1'b0;
defparam syn__058_.OE_POWERUP = 1'b0;
defparam syn__058_.CFG_TRI_INPUT = 1'b0;
defparam syn__058_.CFG_PULL_UP = 1'b0;
defparam syn__058_.CFG_SLR = 1'b0;
defparam syn__058_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__058_.CFG_PDRCTRL = 4'b0010;
defparam syn__058_.CFG_KEEP = 2'b00;
defparam syn__058_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__058_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__058_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__058_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__058_.DPCLK_DELAY = 4'b0000;
defparam syn__058_.OUT_DELAY = 1'b0;
defparam syn__058_.IN_DATA_DELAY = 3'b000;
defparam syn__058_.IN_REG_DELAY = 3'b000;

alta_rio syn__059_(
	.padio(bank0[2]),
	.datain(syn__011_[2]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__059_.coord_x = 0;
defparam syn__059_.coord_y = 15;
defparam syn__059_.coord_z = 2;
defparam syn__059_.IN_ASYNC_MODE = 1'b0;
defparam syn__059_.IN_SYNC_MODE = 1'b0;
defparam syn__059_.IN_POWERUP = 1'b0;
defparam syn__059_.OUT_REG_MODE = 1'b0;
defparam syn__059_.OUT_ASYNC_MODE = 1'b0;
defparam syn__059_.OUT_SYNC_MODE = 1'b0;
defparam syn__059_.OUT_POWERUP = 1'b0;
defparam syn__059_.OE_REG_MODE = 1'b0;
defparam syn__059_.OE_ASYNC_MODE = 1'b0;
defparam syn__059_.OE_SYNC_MODE = 1'b0;
defparam syn__059_.OE_POWERUP = 1'b0;
defparam syn__059_.CFG_TRI_INPUT = 1'b0;
defparam syn__059_.CFG_PULL_UP = 1'b0;
defparam syn__059_.CFG_SLR = 1'b0;
defparam syn__059_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__059_.CFG_PDRCTRL = 4'b0010;
defparam syn__059_.CFG_KEEP = 2'b00;
defparam syn__059_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__059_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__059_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__059_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__059_.DPCLK_DELAY = 4'b0000;
defparam syn__059_.OUT_DELAY = 1'b0;
defparam syn__059_.IN_DATA_DELAY = 3'b000;
defparam syn__059_.IN_REG_DELAY = 3'b000;

alta_rio syn__060_(
	.padio(bank0[3]),
	.datain(syn__011_[3]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__060_.coord_x = 0;
defparam syn__060_.coord_y = 15;
defparam syn__060_.coord_z = 3;
defparam syn__060_.IN_ASYNC_MODE = 1'b0;
defparam syn__060_.IN_SYNC_MODE = 1'b0;
defparam syn__060_.IN_POWERUP = 1'b0;
defparam syn__060_.OUT_REG_MODE = 1'b0;
defparam syn__060_.OUT_ASYNC_MODE = 1'b0;
defparam syn__060_.OUT_SYNC_MODE = 1'b0;
defparam syn__060_.OUT_POWERUP = 1'b0;
defparam syn__060_.OE_REG_MODE = 1'b0;
defparam syn__060_.OE_ASYNC_MODE = 1'b0;
defparam syn__060_.OE_SYNC_MODE = 1'b0;
defparam syn__060_.OE_POWERUP = 1'b0;
defparam syn__060_.CFG_TRI_INPUT = 1'b0;
defparam syn__060_.CFG_PULL_UP = 1'b0;
defparam syn__060_.CFG_SLR = 1'b0;
defparam syn__060_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__060_.CFG_PDRCTRL = 4'b0010;
defparam syn__060_.CFG_KEEP = 2'b00;
defparam syn__060_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__060_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__060_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__060_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__060_.DPCLK_DELAY = 4'b0000;
defparam syn__060_.OUT_DELAY = 1'b0;
defparam syn__060_.IN_DATA_DELAY = 3'b000;
defparam syn__060_.IN_REG_DELAY = 3'b000;

alta_rio syn__061_(
	.padio(bank0[4]),
	.datain(syn__011_[4]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__061_.coord_x = 11;
defparam syn__061_.coord_y = 0;
defparam syn__061_.coord_z = 1;
defparam syn__061_.IN_ASYNC_MODE = 1'b0;
defparam syn__061_.IN_SYNC_MODE = 1'b0;
defparam syn__061_.IN_POWERUP = 1'b0;
defparam syn__061_.OUT_REG_MODE = 1'b0;
defparam syn__061_.OUT_ASYNC_MODE = 1'b0;
defparam syn__061_.OUT_SYNC_MODE = 1'b0;
defparam syn__061_.OUT_POWERUP = 1'b0;
defparam syn__061_.OE_REG_MODE = 1'b0;
defparam syn__061_.OE_ASYNC_MODE = 1'b0;
defparam syn__061_.OE_SYNC_MODE = 1'b0;
defparam syn__061_.OE_POWERUP = 1'b0;
defparam syn__061_.CFG_TRI_INPUT = 1'b0;
defparam syn__061_.CFG_PULL_UP = 1'b0;
defparam syn__061_.CFG_SLR = 1'b0;
defparam syn__061_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__061_.CFG_PDRCTRL = 4'b0010;
defparam syn__061_.CFG_KEEP = 2'b00;
defparam syn__061_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__061_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__061_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__061_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__061_.DPCLK_DELAY = 4'b0000;
defparam syn__061_.OUT_DELAY = 1'b0;
defparam syn__061_.IN_DATA_DELAY = 3'b000;
defparam syn__061_.IN_REG_DELAY = 3'b000;

alta_rio syn__062_(
	.padio(bank0[5]),
	.datain(syn__011_[5]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__062_.coord_x = 0;
defparam syn__062_.coord_y = 14;
defparam syn__062_.coord_z = 1;
defparam syn__062_.IN_ASYNC_MODE = 1'b0;
defparam syn__062_.IN_SYNC_MODE = 1'b0;
defparam syn__062_.IN_POWERUP = 1'b0;
defparam syn__062_.OUT_REG_MODE = 1'b0;
defparam syn__062_.OUT_ASYNC_MODE = 1'b0;
defparam syn__062_.OUT_SYNC_MODE = 1'b0;
defparam syn__062_.OUT_POWERUP = 1'b0;
defparam syn__062_.OE_REG_MODE = 1'b0;
defparam syn__062_.OE_ASYNC_MODE = 1'b0;
defparam syn__062_.OE_SYNC_MODE = 1'b0;
defparam syn__062_.OE_POWERUP = 1'b0;
defparam syn__062_.CFG_TRI_INPUT = 1'b0;
defparam syn__062_.CFG_PULL_UP = 1'b0;
defparam syn__062_.CFG_SLR = 1'b0;
defparam syn__062_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__062_.CFG_PDRCTRL = 4'b0010;
defparam syn__062_.CFG_KEEP = 2'b00;
defparam syn__062_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__062_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__062_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__062_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__062_.DPCLK_DELAY = 4'b0000;
defparam syn__062_.OUT_DELAY = 1'b0;
defparam syn__062_.IN_DATA_DELAY = 3'b000;
defparam syn__062_.IN_REG_DELAY = 3'b000;

alta_rio syn__063_(
	.padio(bank0[6]),
	.datain(syn__011_[6]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__063_.coord_x = 11;
defparam syn__063_.coord_y = 0;
defparam syn__063_.coord_z = 0;
defparam syn__063_.IN_ASYNC_MODE = 1'b0;
defparam syn__063_.IN_SYNC_MODE = 1'b0;
defparam syn__063_.IN_POWERUP = 1'b0;
defparam syn__063_.OUT_REG_MODE = 1'b0;
defparam syn__063_.OUT_ASYNC_MODE = 1'b0;
defparam syn__063_.OUT_SYNC_MODE = 1'b0;
defparam syn__063_.OUT_POWERUP = 1'b0;
defparam syn__063_.OE_REG_MODE = 1'b0;
defparam syn__063_.OE_ASYNC_MODE = 1'b0;
defparam syn__063_.OE_SYNC_MODE = 1'b0;
defparam syn__063_.OE_POWERUP = 1'b0;
defparam syn__063_.CFG_TRI_INPUT = 1'b0;
defparam syn__063_.CFG_PULL_UP = 1'b0;
defparam syn__063_.CFG_SLR = 1'b0;
defparam syn__063_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__063_.CFG_PDRCTRL = 4'b0010;
defparam syn__063_.CFG_KEEP = 2'b00;
defparam syn__063_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__063_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__063_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__063_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__063_.DPCLK_DELAY = 4'b0000;
defparam syn__063_.OUT_DELAY = 1'b0;
defparam syn__063_.IN_DATA_DELAY = 3'b000;
defparam syn__063_.IN_REG_DELAY = 3'b000;

alta_rio syn__064_(
	.padio(bank0[7]),
	.datain(syn__011_[7]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__064_.coord_x = 11;
defparam syn__064_.coord_y = 0;
defparam syn__064_.coord_z = 2;
defparam syn__064_.IN_ASYNC_MODE = 1'b0;
defparam syn__064_.IN_SYNC_MODE = 1'b0;
defparam syn__064_.IN_POWERUP = 1'b0;
defparam syn__064_.OUT_REG_MODE = 1'b0;
defparam syn__064_.OUT_ASYNC_MODE = 1'b0;
defparam syn__064_.OUT_SYNC_MODE = 1'b0;
defparam syn__064_.OUT_POWERUP = 1'b0;
defparam syn__064_.OE_REG_MODE = 1'b0;
defparam syn__064_.OE_ASYNC_MODE = 1'b0;
defparam syn__064_.OE_SYNC_MODE = 1'b0;
defparam syn__064_.OE_POWERUP = 1'b0;
defparam syn__064_.CFG_TRI_INPUT = 1'b0;
defparam syn__064_.CFG_PULL_UP = 1'b0;
defparam syn__064_.CFG_SLR = 1'b0;
defparam syn__064_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__064_.CFG_PDRCTRL = 4'b0010;
defparam syn__064_.CFG_KEEP = 2'b00;
defparam syn__064_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__064_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__064_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__064_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__064_.DPCLK_DELAY = 4'b0000;
defparam syn__064_.OUT_DELAY = 1'b0;
defparam syn__064_.IN_DATA_DELAY = 3'b000;
defparam syn__064_.IN_REG_DELAY = 3'b000;

alta_rio syn__065_(
	.padio(bank1[0]),
	.datain(syn__012_[0]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__065_.coord_x = 0;
defparam syn__065_.coord_y = 13;
defparam syn__065_.coord_z = 5;
defparam syn__065_.IN_ASYNC_MODE = 1'b0;
defparam syn__065_.IN_SYNC_MODE = 1'b0;
defparam syn__065_.IN_POWERUP = 1'b0;
defparam syn__065_.OUT_REG_MODE = 1'b0;
defparam syn__065_.OUT_ASYNC_MODE = 1'b0;
defparam syn__065_.OUT_SYNC_MODE = 1'b0;
defparam syn__065_.OUT_POWERUP = 1'b0;
defparam syn__065_.OE_REG_MODE = 1'b0;
defparam syn__065_.OE_ASYNC_MODE = 1'b0;
defparam syn__065_.OE_SYNC_MODE = 1'b0;
defparam syn__065_.OE_POWERUP = 1'b0;
defparam syn__065_.CFG_TRI_INPUT = 1'b0;
defparam syn__065_.CFG_PULL_UP = 1'b0;
defparam syn__065_.CFG_SLR = 1'b0;
defparam syn__065_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__065_.CFG_PDRCTRL = 4'b0010;
defparam syn__065_.CFG_KEEP = 2'b00;
defparam syn__065_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__065_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__065_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__065_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__065_.DPCLK_DELAY = 4'b0000;
defparam syn__065_.OUT_DELAY = 1'b0;
defparam syn__065_.IN_DATA_DELAY = 3'b000;
defparam syn__065_.IN_REG_DELAY = 3'b000;

alta_rio syn__066_(
	.padio(bank1[1]),
	.datain(syn__012_[1]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__066_.coord_x = 0;
defparam syn__066_.coord_y = 13;
defparam syn__066_.coord_z = 4;
defparam syn__066_.IN_ASYNC_MODE = 1'b0;
defparam syn__066_.IN_SYNC_MODE = 1'b0;
defparam syn__066_.IN_POWERUP = 1'b0;
defparam syn__066_.OUT_REG_MODE = 1'b0;
defparam syn__066_.OUT_ASYNC_MODE = 1'b0;
defparam syn__066_.OUT_SYNC_MODE = 1'b0;
defparam syn__066_.OUT_POWERUP = 1'b0;
defparam syn__066_.OE_REG_MODE = 1'b0;
defparam syn__066_.OE_ASYNC_MODE = 1'b0;
defparam syn__066_.OE_SYNC_MODE = 1'b0;
defparam syn__066_.OE_POWERUP = 1'b0;
defparam syn__066_.CFG_TRI_INPUT = 1'b0;
defparam syn__066_.CFG_PULL_UP = 1'b0;
defparam syn__066_.CFG_SLR = 1'b0;
defparam syn__066_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__066_.CFG_PDRCTRL = 4'b0010;
defparam syn__066_.CFG_KEEP = 2'b00;
defparam syn__066_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__066_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__066_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__066_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__066_.DPCLK_DELAY = 4'b0000;
defparam syn__066_.OUT_DELAY = 1'b0;
defparam syn__066_.IN_DATA_DELAY = 3'b000;
defparam syn__066_.IN_REG_DELAY = 3'b000;

alta_rio syn__067_(
	.padio(bank1[2]),
	.datain(syn__012_[2]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__067_.coord_x = 0;
defparam syn__067_.coord_y = 12;
defparam syn__067_.coord_z = 3;
defparam syn__067_.IN_ASYNC_MODE = 1'b0;
defparam syn__067_.IN_SYNC_MODE = 1'b0;
defparam syn__067_.IN_POWERUP = 1'b0;
defparam syn__067_.OUT_REG_MODE = 1'b0;
defparam syn__067_.OUT_ASYNC_MODE = 1'b0;
defparam syn__067_.OUT_SYNC_MODE = 1'b0;
defparam syn__067_.OUT_POWERUP = 1'b0;
defparam syn__067_.OE_REG_MODE = 1'b0;
defparam syn__067_.OE_ASYNC_MODE = 1'b0;
defparam syn__067_.OE_SYNC_MODE = 1'b0;
defparam syn__067_.OE_POWERUP = 1'b0;
defparam syn__067_.CFG_TRI_INPUT = 1'b0;
defparam syn__067_.CFG_PULL_UP = 1'b0;
defparam syn__067_.CFG_SLR = 1'b0;
defparam syn__067_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__067_.CFG_PDRCTRL = 4'b0010;
defparam syn__067_.CFG_KEEP = 2'b00;
defparam syn__067_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__067_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__067_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__067_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__067_.DPCLK_DELAY = 4'b0000;
defparam syn__067_.OUT_DELAY = 1'b0;
defparam syn__067_.IN_DATA_DELAY = 3'b000;
defparam syn__067_.IN_REG_DELAY = 3'b000;

alta_rio syn__068_(
	.padio(bank1[3]),
	.datain(syn__012_[3]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__068_.coord_x = 0;
defparam syn__068_.coord_y = 12;
defparam syn__068_.coord_z = 4;
defparam syn__068_.IN_ASYNC_MODE = 1'b0;
defparam syn__068_.IN_SYNC_MODE = 1'b0;
defparam syn__068_.IN_POWERUP = 1'b0;
defparam syn__068_.OUT_REG_MODE = 1'b0;
defparam syn__068_.OUT_ASYNC_MODE = 1'b0;
defparam syn__068_.OUT_SYNC_MODE = 1'b0;
defparam syn__068_.OUT_POWERUP = 1'b0;
defparam syn__068_.OE_REG_MODE = 1'b0;
defparam syn__068_.OE_ASYNC_MODE = 1'b0;
defparam syn__068_.OE_SYNC_MODE = 1'b0;
defparam syn__068_.OE_POWERUP = 1'b0;
defparam syn__068_.CFG_TRI_INPUT = 1'b0;
defparam syn__068_.CFG_PULL_UP = 1'b0;
defparam syn__068_.CFG_SLR = 1'b0;
defparam syn__068_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__068_.CFG_PDRCTRL = 4'b0010;
defparam syn__068_.CFG_KEEP = 2'b00;
defparam syn__068_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__068_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__068_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__068_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__068_.DPCLK_DELAY = 4'b0000;
defparam syn__068_.OUT_DELAY = 1'b0;
defparam syn__068_.IN_DATA_DELAY = 3'b000;
defparam syn__068_.IN_REG_DELAY = 3'b000;

alta_rio syn__069_(
	.padio(bank1[4]),
	.datain(syn__012_[4]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__069_.coord_x = 13;
defparam syn__069_.coord_y = 0;
defparam syn__069_.coord_z = 1;
defparam syn__069_.IN_ASYNC_MODE = 1'b0;
defparam syn__069_.IN_SYNC_MODE = 1'b0;
defparam syn__069_.IN_POWERUP = 1'b0;
defparam syn__069_.OUT_REG_MODE = 1'b0;
defparam syn__069_.OUT_ASYNC_MODE = 1'b0;
defparam syn__069_.OUT_SYNC_MODE = 1'b0;
defparam syn__069_.OUT_POWERUP = 1'b0;
defparam syn__069_.OE_REG_MODE = 1'b0;
defparam syn__069_.OE_ASYNC_MODE = 1'b0;
defparam syn__069_.OE_SYNC_MODE = 1'b0;
defparam syn__069_.OE_POWERUP = 1'b0;
defparam syn__069_.CFG_TRI_INPUT = 1'b0;
defparam syn__069_.CFG_PULL_UP = 1'b0;
defparam syn__069_.CFG_SLR = 1'b0;
defparam syn__069_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__069_.CFG_PDRCTRL = 4'b0010;
defparam syn__069_.CFG_KEEP = 2'b00;
defparam syn__069_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__069_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__069_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__069_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__069_.DPCLK_DELAY = 4'b0000;
defparam syn__069_.OUT_DELAY = 1'b0;
defparam syn__069_.IN_DATA_DELAY = 3'b000;
defparam syn__069_.IN_REG_DELAY = 3'b000;

alta_rio syn__070_(
	.padio(bank1[5]),
	.datain(syn__012_[5]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__070_.coord_x = 13;
defparam syn__070_.coord_y = 0;
defparam syn__070_.coord_z = 0;
defparam syn__070_.IN_ASYNC_MODE = 1'b0;
defparam syn__070_.IN_SYNC_MODE = 1'b0;
defparam syn__070_.IN_POWERUP = 1'b0;
defparam syn__070_.OUT_REG_MODE = 1'b0;
defparam syn__070_.OUT_ASYNC_MODE = 1'b0;
defparam syn__070_.OUT_SYNC_MODE = 1'b0;
defparam syn__070_.OUT_POWERUP = 1'b0;
defparam syn__070_.OE_REG_MODE = 1'b0;
defparam syn__070_.OE_ASYNC_MODE = 1'b0;
defparam syn__070_.OE_SYNC_MODE = 1'b0;
defparam syn__070_.OE_POWERUP = 1'b0;
defparam syn__070_.CFG_TRI_INPUT = 1'b0;
defparam syn__070_.CFG_PULL_UP = 1'b0;
defparam syn__070_.CFG_SLR = 1'b0;
defparam syn__070_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__070_.CFG_PDRCTRL = 4'b0010;
defparam syn__070_.CFG_KEEP = 2'b00;
defparam syn__070_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__070_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__070_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__070_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__070_.DPCLK_DELAY = 4'b0000;
defparam syn__070_.OUT_DELAY = 1'b0;
defparam syn__070_.IN_DATA_DELAY = 3'b000;
defparam syn__070_.IN_REG_DELAY = 3'b000;

alta_rio syn__071_(
	.padio(bank1[6]),
	.datain(syn__012_[6]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__071_.coord_x = 13;
defparam syn__071_.coord_y = 0;
defparam syn__071_.coord_z = 3;
defparam syn__071_.IN_ASYNC_MODE = 1'b0;
defparam syn__071_.IN_SYNC_MODE = 1'b0;
defparam syn__071_.IN_POWERUP = 1'b0;
defparam syn__071_.OUT_REG_MODE = 1'b0;
defparam syn__071_.OUT_ASYNC_MODE = 1'b0;
defparam syn__071_.OUT_SYNC_MODE = 1'b0;
defparam syn__071_.OUT_POWERUP = 1'b0;
defparam syn__071_.OE_REG_MODE = 1'b0;
defparam syn__071_.OE_ASYNC_MODE = 1'b0;
defparam syn__071_.OE_SYNC_MODE = 1'b0;
defparam syn__071_.OE_POWERUP = 1'b0;
defparam syn__071_.CFG_TRI_INPUT = 1'b0;
defparam syn__071_.CFG_PULL_UP = 1'b0;
defparam syn__071_.CFG_SLR = 1'b0;
defparam syn__071_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__071_.CFG_PDRCTRL = 4'b0010;
defparam syn__071_.CFG_KEEP = 2'b00;
defparam syn__071_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__071_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__071_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__071_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__071_.DPCLK_DELAY = 4'b0000;
defparam syn__071_.OUT_DELAY = 1'b0;
defparam syn__071_.IN_DATA_DELAY = 3'b000;
defparam syn__071_.IN_REG_DELAY = 3'b000;

alta_rio syn__072_(
	.padio(bank1[7]),
	.datain(syn__012_[7]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__072_.coord_x = 0;
defparam syn__072_.coord_y = 9;
defparam syn__072_.coord_z = 1;
defparam syn__072_.IN_ASYNC_MODE = 1'b0;
defparam syn__072_.IN_SYNC_MODE = 1'b0;
defparam syn__072_.IN_POWERUP = 1'b0;
defparam syn__072_.OUT_REG_MODE = 1'b0;
defparam syn__072_.OUT_ASYNC_MODE = 1'b0;
defparam syn__072_.OUT_SYNC_MODE = 1'b0;
defparam syn__072_.OUT_POWERUP = 1'b0;
defparam syn__072_.OE_REG_MODE = 1'b0;
defparam syn__072_.OE_ASYNC_MODE = 1'b0;
defparam syn__072_.OE_SYNC_MODE = 1'b0;
defparam syn__072_.OE_POWERUP = 1'b0;
defparam syn__072_.CFG_TRI_INPUT = 1'b0;
defparam syn__072_.CFG_PULL_UP = 1'b0;
defparam syn__072_.CFG_SLR = 1'b0;
defparam syn__072_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__072_.CFG_PDRCTRL = 4'b0010;
defparam syn__072_.CFG_KEEP = 2'b00;
defparam syn__072_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__072_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__072_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__072_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__072_.DPCLK_DELAY = 4'b0000;
defparam syn__072_.OUT_DELAY = 1'b0;
defparam syn__072_.IN_DATA_DELAY = 3'b000;
defparam syn__072_.IN_REG_DELAY = 3'b000;

alta_rio syn__073_(
	.padio(bank2[0]),
	.datain(syn__013_[0]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__073_.coord_x = 0;
defparam syn__073_.coord_y = 3;
defparam syn__073_.coord_z = 0;
defparam syn__073_.IN_ASYNC_MODE = 1'b0;
defparam syn__073_.IN_SYNC_MODE = 1'b0;
defparam syn__073_.IN_POWERUP = 1'b0;
defparam syn__073_.OUT_REG_MODE = 1'b0;
defparam syn__073_.OUT_ASYNC_MODE = 1'b0;
defparam syn__073_.OUT_SYNC_MODE = 1'b0;
defparam syn__073_.OUT_POWERUP = 1'b0;
defparam syn__073_.OE_REG_MODE = 1'b0;
defparam syn__073_.OE_ASYNC_MODE = 1'b0;
defparam syn__073_.OE_SYNC_MODE = 1'b0;
defparam syn__073_.OE_POWERUP = 1'b0;
defparam syn__073_.CFG_TRI_INPUT = 1'b0;
defparam syn__073_.CFG_PULL_UP = 1'b0;
defparam syn__073_.CFG_SLR = 1'b0;
defparam syn__073_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__073_.CFG_PDRCTRL = 4'b0010;
defparam syn__073_.CFG_KEEP = 2'b00;
defparam syn__073_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__073_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__073_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__073_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__073_.DPCLK_DELAY = 4'b0000;
defparam syn__073_.OUT_DELAY = 1'b0;
defparam syn__073_.IN_DATA_DELAY = 3'b000;
defparam syn__073_.IN_REG_DELAY = 3'b000;

alta_rio syn__074_(
	.padio(bank2[1]),
	.datain(syn__013_[1]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__074_.coord_x = 0;
defparam syn__074_.coord_y = 3;
defparam syn__074_.coord_z = 2;
defparam syn__074_.IN_ASYNC_MODE = 1'b0;
defparam syn__074_.IN_SYNC_MODE = 1'b0;
defparam syn__074_.IN_POWERUP = 1'b0;
defparam syn__074_.OUT_REG_MODE = 1'b0;
defparam syn__074_.OUT_ASYNC_MODE = 1'b0;
defparam syn__074_.OUT_SYNC_MODE = 1'b0;
defparam syn__074_.OUT_POWERUP = 1'b0;
defparam syn__074_.OE_REG_MODE = 1'b0;
defparam syn__074_.OE_ASYNC_MODE = 1'b0;
defparam syn__074_.OE_SYNC_MODE = 1'b0;
defparam syn__074_.OE_POWERUP = 1'b0;
defparam syn__074_.CFG_TRI_INPUT = 1'b0;
defparam syn__074_.CFG_PULL_UP = 1'b0;
defparam syn__074_.CFG_SLR = 1'b0;
defparam syn__074_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__074_.CFG_PDRCTRL = 4'b0010;
defparam syn__074_.CFG_KEEP = 2'b00;
defparam syn__074_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__074_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__074_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__074_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__074_.DPCLK_DELAY = 4'b0000;
defparam syn__074_.OUT_DELAY = 1'b0;
defparam syn__074_.IN_DATA_DELAY = 3'b000;
defparam syn__074_.IN_REG_DELAY = 3'b000;

alta_rio syn__075_(
	.padio(bank2[2]),
	.datain(syn__013_[2]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__075_.coord_x = 0;
defparam syn__075_.coord_y = 3;
defparam syn__075_.coord_z = 1;
defparam syn__075_.IN_ASYNC_MODE = 1'b0;
defparam syn__075_.IN_SYNC_MODE = 1'b0;
defparam syn__075_.IN_POWERUP = 1'b0;
defparam syn__075_.OUT_REG_MODE = 1'b0;
defparam syn__075_.OUT_ASYNC_MODE = 1'b0;
defparam syn__075_.OUT_SYNC_MODE = 1'b0;
defparam syn__075_.OUT_POWERUP = 1'b0;
defparam syn__075_.OE_REG_MODE = 1'b0;
defparam syn__075_.OE_ASYNC_MODE = 1'b0;
defparam syn__075_.OE_SYNC_MODE = 1'b0;
defparam syn__075_.OE_POWERUP = 1'b0;
defparam syn__075_.CFG_TRI_INPUT = 1'b0;
defparam syn__075_.CFG_PULL_UP = 1'b0;
defparam syn__075_.CFG_SLR = 1'b0;
defparam syn__075_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__075_.CFG_PDRCTRL = 4'b0010;
defparam syn__075_.CFG_KEEP = 2'b00;
defparam syn__075_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__075_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__075_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__075_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__075_.DPCLK_DELAY = 4'b0000;
defparam syn__075_.OUT_DELAY = 1'b0;
defparam syn__075_.IN_DATA_DELAY = 3'b000;
defparam syn__075_.IN_REG_DELAY = 3'b000;

alta_rio syn__076_(
	.padio(bank2[3]),
	.datain(syn__013_[3]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__076_.coord_x = 0;
defparam syn__076_.coord_y = 3;
defparam syn__076_.coord_z = 4;
defparam syn__076_.IN_ASYNC_MODE = 1'b0;
defparam syn__076_.IN_SYNC_MODE = 1'b0;
defparam syn__076_.IN_POWERUP = 1'b0;
defparam syn__076_.OUT_REG_MODE = 1'b0;
defparam syn__076_.OUT_ASYNC_MODE = 1'b0;
defparam syn__076_.OUT_SYNC_MODE = 1'b0;
defparam syn__076_.OUT_POWERUP = 1'b0;
defparam syn__076_.OE_REG_MODE = 1'b0;
defparam syn__076_.OE_ASYNC_MODE = 1'b0;
defparam syn__076_.OE_SYNC_MODE = 1'b0;
defparam syn__076_.OE_POWERUP = 1'b0;
defparam syn__076_.CFG_TRI_INPUT = 1'b0;
defparam syn__076_.CFG_PULL_UP = 1'b0;
defparam syn__076_.CFG_SLR = 1'b0;
defparam syn__076_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__076_.CFG_PDRCTRL = 4'b0010;
defparam syn__076_.CFG_KEEP = 2'b00;
defparam syn__076_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__076_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__076_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__076_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__076_.DPCLK_DELAY = 4'b0000;
defparam syn__076_.OUT_DELAY = 1'b0;
defparam syn__076_.IN_DATA_DELAY = 3'b000;
defparam syn__076_.IN_REG_DELAY = 3'b000;

alta_rio syn__077_(
	.padio(bank2[4]),
	.datain(syn__013_[4]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__077_.coord_x = 0;
defparam syn__077_.coord_y = 3;
defparam syn__077_.coord_z = 5;
defparam syn__077_.IN_ASYNC_MODE = 1'b0;
defparam syn__077_.IN_SYNC_MODE = 1'b0;
defparam syn__077_.IN_POWERUP = 1'b0;
defparam syn__077_.OUT_REG_MODE = 1'b0;
defparam syn__077_.OUT_ASYNC_MODE = 1'b0;
defparam syn__077_.OUT_SYNC_MODE = 1'b0;
defparam syn__077_.OUT_POWERUP = 1'b0;
defparam syn__077_.OE_REG_MODE = 1'b0;
defparam syn__077_.OE_ASYNC_MODE = 1'b0;
defparam syn__077_.OE_SYNC_MODE = 1'b0;
defparam syn__077_.OE_POWERUP = 1'b0;
defparam syn__077_.CFG_TRI_INPUT = 1'b0;
defparam syn__077_.CFG_PULL_UP = 1'b0;
defparam syn__077_.CFG_SLR = 1'b0;
defparam syn__077_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__077_.CFG_PDRCTRL = 4'b0010;
defparam syn__077_.CFG_KEEP = 2'b00;
defparam syn__077_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__077_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__077_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__077_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__077_.DPCLK_DELAY = 4'b0000;
defparam syn__077_.OUT_DELAY = 1'b0;
defparam syn__077_.IN_DATA_DELAY = 3'b000;
defparam syn__077_.IN_REG_DELAY = 3'b000;

alta_rio syn__078_(
	.padio(bank2[5]),
	.datain(syn__013_[5]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__078_.coord_x = 38;
defparam syn__078_.coord_y = 0;
defparam syn__078_.coord_z = 3;
defparam syn__078_.IN_ASYNC_MODE = 1'b0;
defparam syn__078_.IN_SYNC_MODE = 1'b0;
defparam syn__078_.IN_POWERUP = 1'b0;
defparam syn__078_.OUT_REG_MODE = 1'b0;
defparam syn__078_.OUT_ASYNC_MODE = 1'b0;
defparam syn__078_.OUT_SYNC_MODE = 1'b0;
defparam syn__078_.OUT_POWERUP = 1'b0;
defparam syn__078_.OE_REG_MODE = 1'b0;
defparam syn__078_.OE_ASYNC_MODE = 1'b0;
defparam syn__078_.OE_SYNC_MODE = 1'b0;
defparam syn__078_.OE_POWERUP = 1'b0;
defparam syn__078_.CFG_TRI_INPUT = 1'b0;
defparam syn__078_.CFG_PULL_UP = 1'b0;
defparam syn__078_.CFG_SLR = 1'b0;
defparam syn__078_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__078_.CFG_PDRCTRL = 4'b0010;
defparam syn__078_.CFG_KEEP = 2'b00;
defparam syn__078_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__078_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__078_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__078_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__078_.DPCLK_DELAY = 4'b0000;
defparam syn__078_.OUT_DELAY = 1'b0;
defparam syn__078_.IN_DATA_DELAY = 3'b000;
defparam syn__078_.IN_REG_DELAY = 3'b000;

alta_rio syn__079_(
	.padio(bank2[6]),
	.datain(syn__013_[6]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__079_.coord_x = 38;
defparam syn__079_.coord_y = 0;
defparam syn__079_.coord_z = 2;
defparam syn__079_.IN_ASYNC_MODE = 1'b0;
defparam syn__079_.IN_SYNC_MODE = 1'b0;
defparam syn__079_.IN_POWERUP = 1'b0;
defparam syn__079_.OUT_REG_MODE = 1'b0;
defparam syn__079_.OUT_ASYNC_MODE = 1'b0;
defparam syn__079_.OUT_SYNC_MODE = 1'b0;
defparam syn__079_.OUT_POWERUP = 1'b0;
defparam syn__079_.OE_REG_MODE = 1'b0;
defparam syn__079_.OE_ASYNC_MODE = 1'b0;
defparam syn__079_.OE_SYNC_MODE = 1'b0;
defparam syn__079_.OE_POWERUP = 1'b0;
defparam syn__079_.CFG_TRI_INPUT = 1'b0;
defparam syn__079_.CFG_PULL_UP = 1'b0;
defparam syn__079_.CFG_SLR = 1'b0;
defparam syn__079_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__079_.CFG_PDRCTRL = 4'b0010;
defparam syn__079_.CFG_KEEP = 2'b00;
defparam syn__079_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__079_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__079_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__079_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__079_.DPCLK_DELAY = 4'b0000;
defparam syn__079_.OUT_DELAY = 1'b0;
defparam syn__079_.IN_DATA_DELAY = 3'b000;
defparam syn__079_.IN_REG_DELAY = 3'b000;

alta_rio syn__080_(
	.padio(bank2[7]),
	.datain(syn__013_[7]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__080_.coord_x = 40;
defparam syn__080_.coord_y = 2;
defparam syn__080_.coord_z = 1;
defparam syn__080_.IN_ASYNC_MODE = 1'b0;
defparam syn__080_.IN_SYNC_MODE = 1'b0;
defparam syn__080_.IN_POWERUP = 1'b0;
defparam syn__080_.OUT_REG_MODE = 1'b0;
defparam syn__080_.OUT_ASYNC_MODE = 1'b0;
defparam syn__080_.OUT_SYNC_MODE = 1'b0;
defparam syn__080_.OUT_POWERUP = 1'b0;
defparam syn__080_.OE_REG_MODE = 1'b0;
defparam syn__080_.OE_ASYNC_MODE = 1'b0;
defparam syn__080_.OE_SYNC_MODE = 1'b0;
defparam syn__080_.OE_POWERUP = 1'b0;
defparam syn__080_.CFG_TRI_INPUT = 1'b0;
defparam syn__080_.CFG_PULL_UP = 1'b0;
defparam syn__080_.CFG_SLR = 1'b0;
defparam syn__080_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__080_.CFG_PDRCTRL = 4'b0010;
defparam syn__080_.CFG_KEEP = 2'b00;
defparam syn__080_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__080_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__080_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__080_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__080_.DPCLK_DELAY = 4'b0000;
defparam syn__080_.OUT_DELAY = 1'b0;
defparam syn__080_.IN_DATA_DELAY = 3'b000;
defparam syn__080_.IN_REG_DELAY = 3'b000;

alta_rio syn__081_(
	.padio(bank3[0]),
	.datain(syn__014_[0]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__081_.coord_x = 0;
defparam syn__081_.coord_y = 2;
defparam syn__081_.coord_z = 2;
defparam syn__081_.IN_ASYNC_MODE = 1'b0;
defparam syn__081_.IN_SYNC_MODE = 1'b0;
defparam syn__081_.IN_POWERUP = 1'b0;
defparam syn__081_.OUT_REG_MODE = 1'b0;
defparam syn__081_.OUT_ASYNC_MODE = 1'b0;
defparam syn__081_.OUT_SYNC_MODE = 1'b0;
defparam syn__081_.OUT_POWERUP = 1'b0;
defparam syn__081_.OE_REG_MODE = 1'b0;
defparam syn__081_.OE_ASYNC_MODE = 1'b0;
defparam syn__081_.OE_SYNC_MODE = 1'b0;
defparam syn__081_.OE_POWERUP = 1'b0;
defparam syn__081_.CFG_TRI_INPUT = 1'b0;
defparam syn__081_.CFG_PULL_UP = 1'b0;
defparam syn__081_.CFG_SLR = 1'b0;
defparam syn__081_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__081_.CFG_PDRCTRL = 4'b0010;
defparam syn__081_.CFG_KEEP = 2'b00;
defparam syn__081_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__081_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__081_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__081_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__081_.DPCLK_DELAY = 4'b0000;
defparam syn__081_.OUT_DELAY = 1'b0;
defparam syn__081_.IN_DATA_DELAY = 3'b000;
defparam syn__081_.IN_REG_DELAY = 3'b000;

alta_rio syn__082_(
	.padio(bank3[1]),
	.datain(syn__014_[1]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__082_.coord_x = 1;
defparam syn__082_.coord_y = 0;
defparam syn__082_.coord_z = 1;
defparam syn__082_.IN_ASYNC_MODE = 1'b0;
defparam syn__082_.IN_SYNC_MODE = 1'b0;
defparam syn__082_.IN_POWERUP = 1'b0;
defparam syn__082_.OUT_REG_MODE = 1'b0;
defparam syn__082_.OUT_ASYNC_MODE = 1'b0;
defparam syn__082_.OUT_SYNC_MODE = 1'b0;
defparam syn__082_.OUT_POWERUP = 1'b0;
defparam syn__082_.OE_REG_MODE = 1'b0;
defparam syn__082_.OE_ASYNC_MODE = 1'b0;
defparam syn__082_.OE_SYNC_MODE = 1'b0;
defparam syn__082_.OE_POWERUP = 1'b0;
defparam syn__082_.CFG_TRI_INPUT = 1'b0;
defparam syn__082_.CFG_PULL_UP = 1'b0;
defparam syn__082_.CFG_SLR = 1'b0;
defparam syn__082_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__082_.CFG_PDRCTRL = 4'b0010;
defparam syn__082_.CFG_KEEP = 2'b00;
defparam syn__082_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__082_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__082_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__082_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__082_.DPCLK_DELAY = 4'b0000;
defparam syn__082_.OUT_DELAY = 1'b0;
defparam syn__082_.IN_DATA_DELAY = 3'b000;
defparam syn__082_.IN_REG_DELAY = 3'b000;

alta_rio syn__083_(
	.padio(bank3[2]),
	.datain(syn__014_[2]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__083_.coord_x = 1;
defparam syn__083_.coord_y = 0;
defparam syn__083_.coord_z = 0;
defparam syn__083_.IN_ASYNC_MODE = 1'b0;
defparam syn__083_.IN_SYNC_MODE = 1'b0;
defparam syn__083_.IN_POWERUP = 1'b0;
defparam syn__083_.OUT_REG_MODE = 1'b0;
defparam syn__083_.OUT_ASYNC_MODE = 1'b0;
defparam syn__083_.OUT_SYNC_MODE = 1'b0;
defparam syn__083_.OUT_POWERUP = 1'b0;
defparam syn__083_.OE_REG_MODE = 1'b0;
defparam syn__083_.OE_ASYNC_MODE = 1'b0;
defparam syn__083_.OE_SYNC_MODE = 1'b0;
defparam syn__083_.OE_POWERUP = 1'b0;
defparam syn__083_.CFG_TRI_INPUT = 1'b0;
defparam syn__083_.CFG_PULL_UP = 1'b0;
defparam syn__083_.CFG_SLR = 1'b0;
defparam syn__083_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__083_.CFG_PDRCTRL = 4'b0010;
defparam syn__083_.CFG_KEEP = 2'b00;
defparam syn__083_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__083_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__083_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__083_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__083_.DPCLK_DELAY = 4'b0000;
defparam syn__083_.OUT_DELAY = 1'b0;
defparam syn__083_.IN_DATA_DELAY = 3'b000;
defparam syn__083_.IN_REG_DELAY = 3'b000;

alta_rio syn__084_(
	.padio(bank3[3]),
	.datain(syn__014_[3]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__084_.coord_x = 1;
defparam syn__084_.coord_y = 0;
defparam syn__084_.coord_z = 3;
defparam syn__084_.IN_ASYNC_MODE = 1'b0;
defparam syn__084_.IN_SYNC_MODE = 1'b0;
defparam syn__084_.IN_POWERUP = 1'b0;
defparam syn__084_.OUT_REG_MODE = 1'b0;
defparam syn__084_.OUT_ASYNC_MODE = 1'b0;
defparam syn__084_.OUT_SYNC_MODE = 1'b0;
defparam syn__084_.OUT_POWERUP = 1'b0;
defparam syn__084_.OE_REG_MODE = 1'b0;
defparam syn__084_.OE_ASYNC_MODE = 1'b0;
defparam syn__084_.OE_SYNC_MODE = 1'b0;
defparam syn__084_.OE_POWERUP = 1'b0;
defparam syn__084_.CFG_TRI_INPUT = 1'b0;
defparam syn__084_.CFG_PULL_UP = 1'b0;
defparam syn__084_.CFG_SLR = 1'b0;
defparam syn__084_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__084_.CFG_PDRCTRL = 4'b0010;
defparam syn__084_.CFG_KEEP = 2'b00;
defparam syn__084_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__084_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__084_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__084_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__084_.DPCLK_DELAY = 4'b0000;
defparam syn__084_.OUT_DELAY = 1'b0;
defparam syn__084_.IN_DATA_DELAY = 3'b000;
defparam syn__084_.IN_REG_DELAY = 3'b000;

alta_rio syn__085_(
	.padio(bank3[4]),
	.datain(syn__014_[4]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__085_.coord_x = 1;
defparam syn__085_.coord_y = 0;
defparam syn__085_.coord_z = 2;
defparam syn__085_.IN_ASYNC_MODE = 1'b0;
defparam syn__085_.IN_SYNC_MODE = 1'b0;
defparam syn__085_.IN_POWERUP = 1'b0;
defparam syn__085_.OUT_REG_MODE = 1'b0;
defparam syn__085_.OUT_ASYNC_MODE = 1'b0;
defparam syn__085_.OUT_SYNC_MODE = 1'b0;
defparam syn__085_.OUT_POWERUP = 1'b0;
defparam syn__085_.OE_REG_MODE = 1'b0;
defparam syn__085_.OE_ASYNC_MODE = 1'b0;
defparam syn__085_.OE_SYNC_MODE = 1'b0;
defparam syn__085_.OE_POWERUP = 1'b0;
defparam syn__085_.CFG_TRI_INPUT = 1'b0;
defparam syn__085_.CFG_PULL_UP = 1'b0;
defparam syn__085_.CFG_SLR = 1'b0;
defparam syn__085_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__085_.CFG_PDRCTRL = 4'b0010;
defparam syn__085_.CFG_KEEP = 2'b00;
defparam syn__085_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__085_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__085_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__085_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__085_.DPCLK_DELAY = 4'b0000;
defparam syn__085_.OUT_DELAY = 1'b0;
defparam syn__085_.IN_DATA_DELAY = 3'b000;
defparam syn__085_.IN_REG_DELAY = 3'b000;

alta_rio syn__086_(
	.padio(bank3[5]),
	.datain(syn__014_[5]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__086_.coord_x = 9;
defparam syn__086_.coord_y = 0;
defparam syn__086_.coord_z = 1;
defparam syn__086_.IN_ASYNC_MODE = 1'b0;
defparam syn__086_.IN_SYNC_MODE = 1'b0;
defparam syn__086_.IN_POWERUP = 1'b0;
defparam syn__086_.OUT_REG_MODE = 1'b0;
defparam syn__086_.OUT_ASYNC_MODE = 1'b0;
defparam syn__086_.OUT_SYNC_MODE = 1'b0;
defparam syn__086_.OUT_POWERUP = 1'b0;
defparam syn__086_.OE_REG_MODE = 1'b0;
defparam syn__086_.OE_ASYNC_MODE = 1'b0;
defparam syn__086_.OE_SYNC_MODE = 1'b0;
defparam syn__086_.OE_POWERUP = 1'b0;
defparam syn__086_.CFG_TRI_INPUT = 1'b0;
defparam syn__086_.CFG_PULL_UP = 1'b0;
defparam syn__086_.CFG_SLR = 1'b0;
defparam syn__086_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__086_.CFG_PDRCTRL = 4'b0010;
defparam syn__086_.CFG_KEEP = 2'b00;
defparam syn__086_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__086_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__086_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__086_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__086_.DPCLK_DELAY = 4'b0000;
defparam syn__086_.OUT_DELAY = 1'b0;
defparam syn__086_.IN_DATA_DELAY = 3'b000;
defparam syn__086_.IN_REG_DELAY = 3'b000;

alta_rio syn__087_(
	.padio(bank3[6]),
	.datain(syn__014_[6]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__087_.coord_x = 9;
defparam syn__087_.coord_y = 0;
defparam syn__087_.coord_z = 0;
defparam syn__087_.IN_ASYNC_MODE = 1'b0;
defparam syn__087_.IN_SYNC_MODE = 1'b0;
defparam syn__087_.IN_POWERUP = 1'b0;
defparam syn__087_.OUT_REG_MODE = 1'b0;
defparam syn__087_.OUT_ASYNC_MODE = 1'b0;
defparam syn__087_.OUT_SYNC_MODE = 1'b0;
defparam syn__087_.OUT_POWERUP = 1'b0;
defparam syn__087_.OE_REG_MODE = 1'b0;
defparam syn__087_.OE_ASYNC_MODE = 1'b0;
defparam syn__087_.OE_SYNC_MODE = 1'b0;
defparam syn__087_.OE_POWERUP = 1'b0;
defparam syn__087_.CFG_TRI_INPUT = 1'b0;
defparam syn__087_.CFG_PULL_UP = 1'b0;
defparam syn__087_.CFG_SLR = 1'b0;
defparam syn__087_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__087_.CFG_PDRCTRL = 4'b0010;
defparam syn__087_.CFG_KEEP = 2'b00;
defparam syn__087_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__087_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__087_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__087_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__087_.DPCLK_DELAY = 4'b0000;
defparam syn__087_.OUT_DELAY = 1'b0;
defparam syn__087_.IN_DATA_DELAY = 3'b000;
defparam syn__087_.IN_REG_DELAY = 3'b000;

alta_rio syn__088_(
	.padio(bank3[7]),
	.datain(syn__014_[7]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam syn__088_.coord_x = 9;
defparam syn__088_.coord_y = 0;
defparam syn__088_.coord_z = 3;
defparam syn__088_.IN_ASYNC_MODE = 1'b0;
defparam syn__088_.IN_SYNC_MODE = 1'b0;
defparam syn__088_.IN_POWERUP = 1'b0;
defparam syn__088_.OUT_REG_MODE = 1'b0;
defparam syn__088_.OUT_ASYNC_MODE = 1'b0;
defparam syn__088_.OUT_SYNC_MODE = 1'b0;
defparam syn__088_.OUT_POWERUP = 1'b0;
defparam syn__088_.OE_REG_MODE = 1'b0;
defparam syn__088_.OE_ASYNC_MODE = 1'b0;
defparam syn__088_.OE_SYNC_MODE = 1'b0;
defparam syn__088_.OE_POWERUP = 1'b0;
defparam syn__088_.CFG_TRI_INPUT = 1'b0;
defparam syn__088_.CFG_PULL_UP = 1'b0;
defparam syn__088_.CFG_SLR = 1'b0;
defparam syn__088_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__088_.CFG_PDRCTRL = 4'b0010;
defparam syn__088_.CFG_KEEP = 2'b00;
defparam syn__088_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__088_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__088_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__088_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__088_.DPCLK_DELAY = 4'b0000;
defparam syn__088_.OUT_DELAY = 1'b0;
defparam syn__088_.IN_DATA_DELAY = 3'b000;
defparam syn__088_.IN_REG_DELAY = 3'b000;

alta_rio syn__089_(
	.padio(clk),
	.datain(gnd),
	.oe(gnd),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(syn__015_),
	.regout());
defparam syn__089_.coord_x = 40;
defparam syn__089_.coord_y = 12;
defparam syn__089_.coord_z = 2;
defparam syn__089_.IN_ASYNC_MODE = 1'b0;
defparam syn__089_.IN_SYNC_MODE = 1'b0;
defparam syn__089_.IN_POWERUP = 1'b0;
defparam syn__089_.OUT_REG_MODE = 1'b0;
defparam syn__089_.OUT_ASYNC_MODE = 1'b0;
defparam syn__089_.OUT_SYNC_MODE = 1'b0;
defparam syn__089_.OUT_POWERUP = 1'b0;
defparam syn__089_.OE_REG_MODE = 1'b0;
defparam syn__089_.OE_ASYNC_MODE = 1'b0;
defparam syn__089_.OE_SYNC_MODE = 1'b0;
defparam syn__089_.OE_POWERUP = 1'b0;
defparam syn__089_.CFG_TRI_INPUT = 1'b0;
defparam syn__089_.CFG_PULL_UP = 1'b0;
defparam syn__089_.CFG_SLR = 1'b0;
defparam syn__089_.CFG_OPEN_DRAIN = 1'b0;
defparam syn__089_.CFG_PDRCTRL = 4'b0010;
defparam syn__089_.CFG_KEEP = 2'b00;
defparam syn__089_.CFG_LVDS_OUT_EN = 1'b0;
defparam syn__089_.CFG_LVDS_SEL_CUA = 2'b00;
defparam syn__089_.CFG_LVDS_IREF = 10'b0110000000;
defparam syn__089_.CFG_LVDS_IN_EN = 1'b0;
defparam syn__089_.DPCLK_DELAY = 4'b0000;
defparam syn__089_.OUT_DELAY = 1'b0;
defparam syn__089_.IN_DATA_DELAY = 3'b000;
defparam syn__089_.IN_REG_DELAY = 3'b000;

alta_slice syn__090_(
	.A(),
	.B(),
	.C(vcc),
	.D(),
	.Cin(),
	.Qin(syn__011_[0]),
	.Clk(syn__015__X1003_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1003_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\syn__011_[0]_inv ),
	.Cout(),
	.Q(syn__011_[0]));
defparam syn__090_.coord_x = 1;
defparam syn__090_.coord_y = 1;
defparam syn__090_.coord_z = 2;
defparam syn__090_.mask = 16'h0F0F;
defparam syn__090_.modeMux = 1'b0;
defparam syn__090_.FeedbackMux = 1'b1;
defparam syn__090_.ShiftMux = 1'b0;
defparam syn__090_.BypassEn = 1'b0;
defparam syn__090_.CarryEnb = 1'b1;

alta_slice syn__091_(
	.A(vcc),
	.B(vcc),
	.C(vcc),
	.D(syn__011_[0]),
	.Cin(),
	.Qin(syn__011_[1]),
	.Clk(syn__015__X1001_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1001_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__000_[1]),
	.Cout(),
	.Q(syn__011_[1]));
defparam syn__091_.coord_x = 1;
defparam syn__091_.coord_y = 11;
defparam syn__091_.coord_z = 0;
defparam syn__091_.mask = 16'h0FF0;
defparam syn__091_.modeMux = 1'b0;
defparam syn__091_.FeedbackMux = 1'b1;
defparam syn__091_.ShiftMux = 1'b0;
defparam syn__091_.BypassEn = 1'b0;
defparam syn__091_.CarryEnb = 1'b1;

alta_slice syn__092_(
	.A(syn__011_[1]),
	.B(vcc),
	.C(vcc),
	.D(syn__011_[0]),
	.Cin(),
	.Qin(syn__011_[2]),
	.Clk(syn__015__X1001_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1001_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__000_[2]),
	.Cout(),
	.Q(syn__011_[2]));
defparam syn__092_.coord_x = 1;
defparam syn__092_.coord_y = 11;
defparam syn__092_.coord_z = 10;
defparam syn__092_.mask = 16'h5AF0;
defparam syn__092_.modeMux = 1'b0;
defparam syn__092_.FeedbackMux = 1'b1;
defparam syn__092_.ShiftMux = 1'b0;
defparam syn__092_.BypassEn = 1'b0;
defparam syn__092_.CarryEnb = 1'b1;

alta_slice syn__093_(
	.A(syn__011_[1]),
	.B(syn__011_[2]),
	.C(vcc),
	.D(syn__011_[0]),
	.Cin(),
	.Qin(syn__011_[3]),
	.Clk(syn__015__X1001_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1001_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__000_[3]),
	.Cout(),
	.Q(syn__011_[3]));
defparam syn__093_.coord_x = 1;
defparam syn__093_.coord_y = 11;
defparam syn__093_.coord_z = 11;
defparam syn__093_.mask = 16'h78F0;
defparam syn__093_.modeMux = 1'b0;
defparam syn__093_.FeedbackMux = 1'b1;
defparam syn__093_.ShiftMux = 1'b0;
defparam syn__093_.BypassEn = 1'b0;
defparam syn__093_.CarryEnb = 1'b1;

alta_slice syn__094_(
	.A(syn__003_),
	.B(vcc),
	.C(vcc),
	.D(vcc),
	.Cin(),
	.Qin(syn__011_[4]),
	.Clk(syn__015__X1001_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1001_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__000_[4]),
	.Cout(),
	.Q(syn__011_[4]));
defparam syn__094_.coord_x = 1;
defparam syn__094_.coord_y = 11;
defparam syn__094_.coord_z = 9;
defparam syn__094_.mask = 16'h5A5A;
defparam syn__094_.modeMux = 1'b0;
defparam syn__094_.FeedbackMux = 1'b1;
defparam syn__094_.ShiftMux = 1'b0;
defparam syn__094_.BypassEn = 1'b0;
defparam syn__094_.CarryEnb = 1'b1;

alta_slice syn__095_(
	.A(syn__003_),
	.B(vcc),
	.C(vcc),
	.D(syn__011_[4]),
	.Cin(),
	.Qin(syn__011_[5]),
	.Clk(syn__015__X1001_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1001_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__000_[5]),
	.Cout(),
	.Q(syn__011_[5]));
defparam syn__095_.coord_x = 1;
defparam syn__095_.coord_y = 11;
defparam syn__095_.coord_z = 6;
defparam syn__095_.mask = 16'h5AF0;
defparam syn__095_.modeMux = 1'b0;
defparam syn__095_.FeedbackMux = 1'b1;
defparam syn__095_.ShiftMux = 1'b0;
defparam syn__095_.BypassEn = 1'b0;
defparam syn__095_.CarryEnb = 1'b1;

alta_slice syn__096_(
	.A(syn__003_),
	.B(syn__011_[5]),
	.C(vcc),
	.D(syn__011_[4]),
	.Cin(),
	.Qin(syn__011_[6]),
	.Clk(syn__015__X1001_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1001_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__000_[6]),
	.Cout(),
	.Q(syn__011_[6]));
defparam syn__096_.coord_x = 1;
defparam syn__096_.coord_y = 11;
defparam syn__096_.coord_z = 7;
defparam syn__096_.mask = 16'h78F0;
defparam syn__096_.modeMux = 1'b0;
defparam syn__096_.FeedbackMux = 1'b1;
defparam syn__096_.ShiftMux = 1'b0;
defparam syn__096_.BypassEn = 1'b0;
defparam syn__096_.CarryEnb = 1'b1;

alta_slice syn__097_(
	.A(syn__004_),
	.B(vcc),
	.C(vcc),
	.D(vcc),
	.Cin(),
	.Qin(syn__011_[7]),
	.Clk(syn__015__X1001_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1001_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__000_[7]),
	.Cout(),
	.Q(syn__011_[7]));
defparam syn__097_.coord_x = 1;
defparam syn__097_.coord_y = 11;
defparam syn__097_.coord_z = 15;
defparam syn__097_.mask = 16'h5A5A;
defparam syn__097_.modeMux = 1'b0;
defparam syn__097_.FeedbackMux = 1'b1;
defparam syn__097_.ShiftMux = 1'b0;
defparam syn__097_.BypassEn = 1'b0;
defparam syn__097_.CarryEnb = 1'b1;

alta_slice syn__098_(
	.A(syn__004_),
	.B(vcc),
	.C(vcc),
	.D(syn__011_[7]),
	.Cin(),
	.Qin(syn__012_[0]),
	.Clk(syn__015__X1001_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1001_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__000_[8]),
	.Cout(),
	.Q(syn__012_[0]));
defparam syn__098_.coord_x = 1;
defparam syn__098_.coord_y = 11;
defparam syn__098_.coord_z = 12;
defparam syn__098_.mask = 16'h5AF0;
defparam syn__098_.modeMux = 1'b0;
defparam syn__098_.FeedbackMux = 1'b1;
defparam syn__098_.ShiftMux = 1'b0;
defparam syn__098_.BypassEn = 1'b0;
defparam syn__098_.CarryEnb = 1'b1;

alta_slice syn__099_(
	.A(syn__004_),
	.B(syn__012_[0]),
	.C(vcc),
	.D(syn__011_[7]),
	.Cin(),
	.Qin(syn__012_[1]),
	.Clk(syn__015__X1001_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1001_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__000_[9]),
	.Cout(),
	.Q(syn__012_[1]));
defparam syn__099_.coord_x = 1;
defparam syn__099_.coord_y = 11;
defparam syn__099_.coord_z = 13;
defparam syn__099_.mask = 16'h78F0;
defparam syn__099_.modeMux = 1'b0;
defparam syn__099_.FeedbackMux = 1'b1;
defparam syn__099_.ShiftMux = 1'b0;
defparam syn__099_.BypassEn = 1'b0;
defparam syn__099_.CarryEnb = 1'b1;

alta_slice syn__100_(
	.A(syn__005_),
	.B(vcc),
	.C(vcc),
	.D(vcc),
	.Cin(),
	.Qin(syn__012_[2]),
	.Clk(syn__015__X1001_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1001_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__000_[10]),
	.Cout(),
	.Q(syn__012_[2]));
defparam syn__100_.coord_x = 1;
defparam syn__100_.coord_y = 11;
defparam syn__100_.coord_z = 1;
defparam syn__100_.mask = 16'h5A5A;
defparam syn__100_.modeMux = 1'b0;
defparam syn__100_.FeedbackMux = 1'b1;
defparam syn__100_.ShiftMux = 1'b0;
defparam syn__100_.BypassEn = 1'b0;
defparam syn__100_.CarryEnb = 1'b1;

alta_slice syn__101_(
	.A(syn__005_),
	.B(vcc),
	.C(vcc),
	.D(syn__012_[2]),
	.Cin(),
	.Qin(syn__012_[3]),
	.Clk(syn__015__X1001_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1001_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__000_[11]),
	.Cout(),
	.Q(syn__012_[3]));
defparam syn__101_.coord_x = 1;
defparam syn__101_.coord_y = 11;
defparam syn__101_.coord_z = 2;
defparam syn__101_.mask = 16'h5AF0;
defparam syn__101_.modeMux = 1'b0;
defparam syn__101_.FeedbackMux = 1'b1;
defparam syn__101_.ShiftMux = 1'b0;
defparam syn__101_.BypassEn = 1'b0;
defparam syn__101_.CarryEnb = 1'b1;

alta_slice syn__102_(
	.A(syn__005_),
	.B(syn__012_[3]),
	.C(vcc),
	.D(syn__012_[2]),
	.Cin(),
	.Qin(syn__012_[4]),
	.Clk(syn__015__X1001_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1001_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__000_[12]),
	.Cout(),
	.Q(syn__012_[4]));
defparam syn__102_.coord_x = 1;
defparam syn__102_.coord_y = 11;
defparam syn__102_.coord_z = 3;
defparam syn__102_.mask = 16'h78F0;
defparam syn__102_.modeMux = 1'b0;
defparam syn__102_.FeedbackMux = 1'b1;
defparam syn__102_.ShiftMux = 1'b0;
defparam syn__102_.BypassEn = 1'b0;
defparam syn__102_.CarryEnb = 1'b1;

alta_slice syn__103_(
	.A(syn__006_),
	.B(vcc),
	.C(vcc),
	.D(vcc),
	.Cin(),
	.Qin(syn__012_[5]),
	.Clk(syn__015__X1002_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1002_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__000_[13]),
	.Cout(),
	.Q(syn__012_[5]));
defparam syn__103_.coord_x = 1;
defparam syn__103_.coord_y = 3;
defparam syn__103_.coord_z = 1;
defparam syn__103_.mask = 16'h5A5A;
defparam syn__103_.modeMux = 1'b0;
defparam syn__103_.FeedbackMux = 1'b1;
defparam syn__103_.ShiftMux = 1'b0;
defparam syn__103_.BypassEn = 1'b0;
defparam syn__103_.CarryEnb = 1'b1;

alta_slice syn__104_(
	.A(vcc),
	.B(syn__012_[5]),
	.C(vcc),
	.D(syn__006_),
	.Cin(),
	.Qin(syn__012_[6]),
	.Clk(syn__015__X1002_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1002_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__000_[14]),
	.Cout(),
	.Q(syn__012_[6]));
defparam syn__104_.coord_x = 1;
defparam syn__104_.coord_y = 3;
defparam syn__104_.coord_z = 14;
defparam syn__104_.mask = 16'h3CF0;
defparam syn__104_.modeMux = 1'b0;
defparam syn__104_.FeedbackMux = 1'b1;
defparam syn__104_.ShiftMux = 1'b0;
defparam syn__104_.BypassEn = 1'b0;
defparam syn__104_.CarryEnb = 1'b1;

alta_slice syn__105_(
	.A(syn__006_),
	.B(syn__012_[6]),
	.C(vcc),
	.D(syn__012_[5]),
	.Cin(),
	.Qin(syn__012_[7]),
	.Clk(syn__015__X1002_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1002_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__000_[15]),
	.Cout(),
	.Q(syn__012_[7]));
defparam syn__105_.coord_x = 1;
defparam syn__105_.coord_y = 3;
defparam syn__105_.coord_z = 15;
defparam syn__105_.mask = 16'h78F0;
defparam syn__105_.modeMux = 1'b0;
defparam syn__105_.FeedbackMux = 1'b1;
defparam syn__105_.ShiftMux = 1'b0;
defparam syn__105_.BypassEn = 1'b0;
defparam syn__105_.CarryEnb = 1'b1;

alta_slice syn__106_(
	.A(vcc),
	.B(vcc),
	.C(vcc),
	.D(syn__007_),
	.Cin(),
	.Qin(syn__013_[0]),
	.Clk(syn__015__X1002_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1002_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__000_[16]),
	.Cout(),
	.Q(syn__013_[0]));
defparam syn__106_.coord_x = 1;
defparam syn__106_.coord_y = 3;
defparam syn__106_.coord_z = 5;
defparam syn__106_.mask = 16'h0FF0;
defparam syn__106_.modeMux = 1'b0;
defparam syn__106_.FeedbackMux = 1'b1;
defparam syn__106_.ShiftMux = 1'b0;
defparam syn__106_.BypassEn = 1'b0;
defparam syn__106_.CarryEnb = 1'b1;

alta_slice syn__107_(
	.A(syn__007_),
	.B(vcc),
	.C(vcc),
	.D(syn__013_[0]),
	.Cin(),
	.Qin(syn__013_[1]),
	.Clk(syn__015__X1002_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1002_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__000_[17]),
	.Cout(),
	.Q(syn__013_[1]));
defparam syn__107_.coord_x = 1;
defparam syn__107_.coord_y = 3;
defparam syn__107_.coord_z = 12;
defparam syn__107_.mask = 16'h5AF0;
defparam syn__107_.modeMux = 1'b0;
defparam syn__107_.FeedbackMux = 1'b1;
defparam syn__107_.ShiftMux = 1'b0;
defparam syn__107_.BypassEn = 1'b0;
defparam syn__107_.CarryEnb = 1'b1;

alta_slice syn__108_(
	.A(syn__007_),
	.B(syn__013_[1]),
	.C(vcc),
	.D(syn__013_[0]),
	.Cin(),
	.Qin(syn__013_[2]),
	.Clk(syn__015__X1002_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1002_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__000_[18]),
	.Cout(),
	.Q(syn__013_[2]));
defparam syn__108_.coord_x = 1;
defparam syn__108_.coord_y = 3;
defparam syn__108_.coord_z = 13;
defparam syn__108_.mask = 16'h78F0;
defparam syn__108_.modeMux = 1'b0;
defparam syn__108_.FeedbackMux = 1'b1;
defparam syn__108_.ShiftMux = 1'b0;
defparam syn__108_.BypassEn = 1'b0;
defparam syn__108_.CarryEnb = 1'b1;

alta_slice syn__109_(
	.A(vcc),
	.B(vcc),
	.C(vcc),
	.D(syn__008_),
	.Cin(),
	.Qin(syn__013_[3]),
	.Clk(syn__015__X1002_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1002_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__000_[19]),
	.Cout(),
	.Q(syn__013_[3]));
defparam syn__109_.coord_x = 1;
defparam syn__109_.coord_y = 3;
defparam syn__109_.coord_z = 3;
defparam syn__109_.mask = 16'h0FF0;
defparam syn__109_.modeMux = 1'b0;
defparam syn__109_.FeedbackMux = 1'b1;
defparam syn__109_.ShiftMux = 1'b0;
defparam syn__109_.BypassEn = 1'b0;
defparam syn__109_.CarryEnb = 1'b1;

alta_slice syn__110_(
	.A(syn__008_),
	.B(vcc),
	.C(vcc),
	.D(syn__013_[3]),
	.Cin(),
	.Qin(syn__013_[4]),
	.Clk(syn__015__X1002_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1002_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__000_[20]),
	.Cout(),
	.Q(syn__013_[4]));
defparam syn__110_.coord_x = 1;
defparam syn__110_.coord_y = 3;
defparam syn__110_.coord_z = 10;
defparam syn__110_.mask = 16'h5AF0;
defparam syn__110_.modeMux = 1'b0;
defparam syn__110_.FeedbackMux = 1'b1;
defparam syn__110_.ShiftMux = 1'b0;
defparam syn__110_.BypassEn = 1'b0;
defparam syn__110_.CarryEnb = 1'b1;

alta_slice syn__111_(
	.A(syn__008_),
	.B(syn__013_[4]),
	.C(vcc),
	.D(syn__013_[3]),
	.Cin(),
	.Qin(syn__013_[5]),
	.Clk(syn__015__X1002_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1002_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__000_[21]),
	.Cout(),
	.Q(syn__013_[5]));
defparam syn__111_.coord_x = 1;
defparam syn__111_.coord_y = 3;
defparam syn__111_.coord_z = 11;
defparam syn__111_.mask = 16'h78F0;
defparam syn__111_.modeMux = 1'b0;
defparam syn__111_.FeedbackMux = 1'b1;
defparam syn__111_.ShiftMux = 1'b0;
defparam syn__111_.BypassEn = 1'b0;
defparam syn__111_.CarryEnb = 1'b1;

alta_slice syn__112_(
	.A(syn__009_),
	.B(vcc),
	.C(vcc),
	.D(vcc),
	.Cin(),
	.Qin(syn__013_[6]),
	.Clk(syn__015__X1002_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1002_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__000_[22]),
	.Cout(),
	.Q(syn__013_[6]));
defparam syn__112_.coord_x = 1;
defparam syn__112_.coord_y = 3;
defparam syn__112_.coord_z = 9;
defparam syn__112_.mask = 16'h5A5A;
defparam syn__112_.modeMux = 1'b0;
defparam syn__112_.FeedbackMux = 1'b1;
defparam syn__112_.ShiftMux = 1'b0;
defparam syn__112_.BypassEn = 1'b0;
defparam syn__112_.CarryEnb = 1'b1;

alta_slice syn__113_(
	.A(syn__009_),
	.B(vcc),
	.C(vcc),
	.D(syn__013_[6]),
	.Cin(),
	.Qin(syn__013_[7]),
	.Clk(syn__015__X1002_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1002_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__000_[23]),
	.Cout(),
	.Q(syn__013_[7]));
defparam syn__113_.coord_x = 1;
defparam syn__113_.coord_y = 3;
defparam syn__113_.coord_z = 6;
defparam syn__113_.mask = 16'h5AF0;
defparam syn__113_.modeMux = 1'b0;
defparam syn__113_.FeedbackMux = 1'b1;
defparam syn__113_.ShiftMux = 1'b0;
defparam syn__113_.BypassEn = 1'b0;
defparam syn__113_.CarryEnb = 1'b1;

alta_slice syn__114_(
	.A(syn__009_),
	.B(syn__013_[7]),
	.C(vcc),
	.D(syn__013_[6]),
	.Cin(),
	.Qin(syn__014_[0]),
	.Clk(syn__015__X1002_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1002_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__000_[24]),
	.Cout(),
	.Q(syn__014_[0]));
defparam syn__114_.coord_x = 1;
defparam syn__114_.coord_y = 3;
defparam syn__114_.coord_z = 7;
defparam syn__114_.mask = 16'h78F0;
defparam syn__114_.modeMux = 1'b0;
defparam syn__114_.FeedbackMux = 1'b1;
defparam syn__114_.ShiftMux = 1'b0;
defparam syn__114_.BypassEn = 1'b0;
defparam syn__114_.CarryEnb = 1'b1;

alta_slice syn__115_(
	.A(syn__010_),
	.B(vcc),
	.C(vcc),
	.D(vcc),
	.Cin(),
	.Qin(syn__014_[1]),
	.Clk(syn__015__X1003_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1003_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__000_[25]),
	.Cout(),
	.Q(syn__014_[1]));
defparam syn__115_.coord_x = 1;
defparam syn__115_.coord_y = 1;
defparam syn__115_.coord_z = 7;
defparam syn__115_.mask = 16'h5A5A;
defparam syn__115_.modeMux = 1'b0;
defparam syn__115_.FeedbackMux = 1'b1;
defparam syn__115_.ShiftMux = 1'b0;
defparam syn__115_.BypassEn = 1'b0;
defparam syn__115_.CarryEnb = 1'b1;

alta_slice syn__116_(
	.A(syn__010_),
	.B(vcc),
	.C(vcc),
	.D(syn__014_[1]),
	.Cin(),
	.Qin(syn__014_[2]),
	.Clk(syn__015__X1003_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1003_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__000_[26]),
	.Cout(),
	.Q(syn__014_[2]));
defparam syn__116_.coord_x = 1;
defparam syn__116_.coord_y = 1;
defparam syn__116_.coord_z = 9;
defparam syn__116_.mask = 16'h5AF0;
defparam syn__116_.modeMux = 1'b0;
defparam syn__116_.FeedbackMux = 1'b1;
defparam syn__116_.ShiftMux = 1'b0;
defparam syn__116_.BypassEn = 1'b0;
defparam syn__116_.CarryEnb = 1'b1;

alta_slice syn__117_(
	.A(syn__010_),
	.B(syn__014_[2]),
	.C(vcc),
	.D(syn__014_[1]),
	.Cin(),
	.Qin(syn__014_[3]),
	.Clk(syn__015__X1003_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1003_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__000_[27]),
	.Cout(),
	.Q(syn__014_[3]));
defparam syn__117_.coord_x = 1;
defparam syn__117_.coord_y = 1;
defparam syn__117_.coord_z = 15;
defparam syn__117_.mask = 16'h78F0;
defparam syn__117_.modeMux = 1'b0;
defparam syn__117_.FeedbackMux = 1'b1;
defparam syn__117_.ShiftMux = 1'b0;
defparam syn__117_.BypassEn = 1'b0;
defparam syn__117_.CarryEnb = 1'b1;

alta_slice syn__118_(
	.A(syn__001_),
	.B(vcc),
	.C(vcc),
	.D(vcc),
	.Cin(),
	.Qin(syn__014_[4]),
	.Clk(syn__015__X1003_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1003_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__000_[28]),
	.Cout(),
	.Q(syn__014_[4]));
defparam syn__118_.coord_x = 1;
defparam syn__118_.coord_y = 1;
defparam syn__118_.coord_z = 3;
defparam syn__118_.mask = 16'h5A5A;
defparam syn__118_.modeMux = 1'b0;
defparam syn__118_.FeedbackMux = 1'b1;
defparam syn__118_.ShiftMux = 1'b0;
defparam syn__118_.BypassEn = 1'b0;
defparam syn__118_.CarryEnb = 1'b1;

alta_slice syn__119_(
	.A(syn__001_),
	.B(vcc),
	.C(vcc),
	.D(syn__014_[4]),
	.Cin(),
	.Qin(syn__014_[5]),
	.Clk(syn__015__X1003_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1003_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__000_[29]),
	.Cout(),
	.Q(syn__014_[5]));
defparam syn__119_.coord_x = 1;
defparam syn__119_.coord_y = 1;
defparam syn__119_.coord_z = 5;
defparam syn__119_.mask = 16'h5AF0;
defparam syn__119_.modeMux = 1'b0;
defparam syn__119_.FeedbackMux = 1'b1;
defparam syn__119_.ShiftMux = 1'b0;
defparam syn__119_.BypassEn = 1'b0;
defparam syn__119_.CarryEnb = 1'b1;

alta_slice syn__120_(
	.A(syn__001_),
	.B(syn__014_[5]),
	.C(vcc),
	.D(syn__014_[4]),
	.Cin(),
	.Qin(syn__014_[6]),
	.Clk(syn__015__X1003_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1003_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__000_[30]),
	.Cout(),
	.Q(syn__014_[6]));
defparam syn__120_.coord_x = 1;
defparam syn__120_.coord_y = 1;
defparam syn__120_.coord_z = 1;
defparam syn__120_.mask = 16'h78F0;
defparam syn__120_.modeMux = 1'b0;
defparam syn__120_.FeedbackMux = 1'b1;
defparam syn__120_.ShiftMux = 1'b0;
defparam syn__120_.BypassEn = 1'b0;
defparam syn__120_.CarryEnb = 1'b1;

alta_slice syn__121_(
	.A(syn__002_),
	.B(vcc),
	.C(vcc),
	.D(vcc),
	.Cin(),
	.Qin(syn__014_[7]),
	.Clk(syn__015__X1003_Y1001_SIG_VCC),
	.AsyncReset(AsyncReset_X1003_Y1001_GND),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(syn__000_[31]),
	.Cout(),
	.Q(syn__014_[7]));
defparam syn__121_.coord_x = 1;
defparam syn__121_.coord_y = 1;
defparam syn__121_.coord_z = 6;
defparam syn__121_.mask = 16'h5A5A;
defparam syn__121_.modeMux = 1'b0;
defparam syn__121_.FeedbackMux = 1'b1;
defparam syn__121_.ShiftMux = 1'b0;
defparam syn__121_.BypassEn = 1'b0;
defparam syn__121_.CarryEnb = 1'b1;

endmodule
