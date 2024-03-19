////////////////////////////////////////////////////////////////////////////////
//
// Filename: 	wbubus.v
//
// Project:	CMod S6 System on a Chip, ZipCPU demonstration project
//
// Purpose:	This is a test of the Verilog obfuscator routine I put together.
//		The actual code for wbubus.v can be found in the XuLA2-LX25
//	SoC project.
//
// Creator:	Dan Gisselquist, Ph.D.
//		Gisselquist Technology, LLC
//
////////////////////////////////////////////////////////////////////////////////
//
// Copyright (C) 2015-2017, Gisselquist Technology, LLC
//
// This program is free software (firmware): you can redistribute it and/or
// modify it under the terms of  the GNU General Public License as published
// by the Free Software Foundation, either version 3 of the License, or (at
// your option) any later version.
//
// This program is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTIBILITY or
// FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
// for more details.
//
// You should have received a copy of the GNU General Public License along
// with this program.  (It's in the $(ROOT)/doc directory.  Run make with no
// target there if the PDF file isn't present.)  If not, see
// <http://www.gnu.org/licenses/> for a copy.
//
// License:	GPL, v3, as defined and found on www.gnu.org,
//		http://www.gnu.org/licenses/gpl.html
//
//
////////////////////////////////////////////////////////////////////////////////
//
//
module wbubus(i_clk,i_rx_stb,i_rx_data,o_wb_cyc,o_wb_stb,o_wb_we,o_wb_addr,
o_wb_data,i_wb_ack,i_wb_stall,i_wb_err,i_wb_data,i_interrupt,o_tx_stb,o_tx_data
,i_tx_busy,o_dbg);parameter LGWATCHDOG=12;input i_clk;input i_rx_stb;input[7:0
]i_rx_data;output wire o_wb_cyc,o_wb_stb,o_wb_we;output wire[31:0]o_wb_addr,
o_wb_data;input i_wb_ack,i_wb_stall,i_wb_err;input[31:0]i_wb_data;input
i_interrupt;output wire o_tx_stb;output wire[7:0]o_tx_data;input i_tx_busy;
output wire o_dbg;reg geVMD2;wire heVMD2;wire[35:0]ieVMD2;jeVMD2 keVMD2(i_clk,
i_rx_stb,i_rx_data,heVMD2,ieVMD2);wire leVMD2,meVMD2,neVMD2,oeVMD2;wire[35:0]
peVMD2,qeVMD2;wire reVMD2,seVMD2;assign meVMD2=(~leVMD2)&&(reVMD2);assign
oeVMD2=geVMD2;teVMD2#(36,6)ueVMD2(i_clk,oeVMD2,heVMD2,ieVMD2,meVMD2,peVMD2,
reVMD2,seVMD2);veVMD2 weVMD2(i_clk,geVMD2,meVMD2,peVMD2,leVMD2,o_wb_cyc,
o_wb_stb,o_wb_we,o_wb_addr,o_wb_data,i_wb_ack,i_wb_stall,i_wb_err,i_wb_data,
neVMD2,qeVMD2);wire xeVMD2;yeVMD2 zeVMD2(i_clk,oeVMD2,neVMD2,qeVMD2,o_wb_cyc,
i_interrupt,neVMD2,o_tx_stb,o_tx_data,i_tx_busy,xeVMD2);reg[(LGWATCHDOG-1):0]
AeVMD2;initial geVMD2=1'd0;initial AeVMD2=0;always@(posedge i_clk)if((~o_wb_cyc
)||(i_wb_ack))begin AeVMD2<=0;geVMD2<=1'd0;end else if(&AeVMD2)begin geVMD2<=
1'd1;AeVMD2<=0;end else begin AeVMD2<=AeVMD2+{{(LGWATCHDOG-1){1'd0}},1'd1};
geVMD2<=1'd0;end assign o_dbg=oeVMD2;endmodule module BeVMD2(i_clk,CeVMD2,
DeVMD2,EeVMD2,FeVMD2);input i_clk,CeVMD2;input[35:0]DeVMD2;output reg EeVMD2;
output reg[35:0]FeVMD2;wire GeVMD2=(DeVMD2[35:33]==3'd3);reg[7:0]HeVMD2;initial
HeVMD2=8'd0;always@(posedge i_clk)if((CeVMD2)&&(GeVMD2))HeVMD2<=HeVMD2+8'd1;reg
[31:0]IeVMD2[0:255];always@(posedge i_clk)if(CeVMD2)IeVMD2[HeVMD2]<={DeVMD2[32
:31],DeVMD2[29:0]};reg[35:0]JeVMD2;always@(posedge i_clk)if(CeVMD2)JeVMD2<=
DeVMD2;reg[7:0]KeVMD2;always@(posedge i_clk)KeVMD2=HeVMD2-{JeVMD2[32:31],JeVMD2
[29:24]};reg[24:0]LeVMD2;always@(posedge i_clk)case(JeVMD2[32:30])3'd0:LeVMD2
<={19'd0,JeVMD2[29:24]};3'd2:LeVMD2<={13'd0,JeVMD2[29:18]};3'd4:LeVMD2<={7'd0,
JeVMD2[29:12]};3'd6:LeVMD2<={1'd0,JeVMD2[29:6]};3'd1:LeVMD2<={{(19){JeVMD2[29]
}},JeVMD2[29:24]};3'd3:LeVMD2<={{(13){JeVMD2[29]}},JeVMD2[29:18]};3'd5:LeVMD2
<={{(7){JeVMD2[29]}},JeVMD2[29:12]};3'd7:LeVMD2<={{(1){JeVMD2[29]}},JeVMD2[29:6
]};endcase wire[31:0]MeVMD2;assign MeVMD2={{(7){LeVMD2[24]}},LeVMD2};reg[9:0]
NeVMD2;always@(posedge i_clk)if(~JeVMD2[34])NeVMD2<=10'd1+{6'd0,JeVMD2[33:31]}
;else NeVMD2<=10'd9+{1'd0,JeVMD2[33:31],JeVMD2[29:24]};reg[31:0]OeVMD2;always@
(posedge i_clk)OeVMD2<=IeVMD2[KeVMD2];reg[2:0]PeVMD2;initial PeVMD2=0;always@(
posedge i_clk)PeVMD2<={PeVMD2[1:0],CeVMD2};always@(posedge i_clk)EeVMD2<=PeVMD2
[2];always@(posedge i_clk)if(JeVMD2[35:30]==6'd46)FeVMD2<=JeVMD2;else casez(
JeVMD2[35:30])6'b001??0:FeVMD2<={4'd0,MeVMD2[31:0]};6'b001??1:FeVMD2<={3'd1,
MeVMD2[31:30],1'd1,MeVMD2[29:0]};6'b010???:FeVMD2<={3'd3,OeVMD2[31:30],JeVMD2[
30],OeVMD2[29:0]};6'b10????:FeVMD2<={5'd24,JeVMD2[30],20'd0,NeVMD2};6'b11????:
FeVMD2<={5'd24,JeVMD2[30],20'd0,NeVMD2};default:FeVMD2<=JeVMD2;endcase
endmodule module teVMD2(i_clk,QeVMD2,ReVMD2,SeVMD2,TeVMD2,UeVMD2,VeVMD2,WeVMD2
);parameter BW=66,LGFLEN=10;input i_clk,QeVMD2;input ReVMD2;input[(BW-1):0]
SeVMD2;input TeVMD2;output reg[(BW-1):0]UeVMD2;output reg VeVMD2;output wire
WeVMD2;localparam XeVMD2=(1<<LGFLEN);reg[(BW-1):0]YeVMD2[0:(XeVMD2-1)];reg[(
LGFLEN-1):0]ZeVMD2,afVMD2;reg bfVMD2;initial bfVMD2=1'd0;always@(posedge i_clk
)if(QeVMD2)bfVMD2<=1'd0;else if(TeVMD2)bfVMD2<=(bfVMD2)&&(ReVMD2);else if(
ReVMD2)bfVMD2<=(ZeVMD2+2==afVMD2);else if(ZeVMD2+1==afVMD2)bfVMD2<=1'd1;initial
ZeVMD2=0;always@(posedge i_clk)if(QeVMD2)ZeVMD2<={(LGFLEN){1'd0}};else if(
ReVMD2)begin if((TeVMD2)||(~bfVMD2))ZeVMD2<=ZeVMD2+{{(LGFLEN-1){1'd0}},1'd1};
end always@(posedge i_clk)if(ReVMD2)YeVMD2[ZeVMD2]<=SeVMD2;reg cfVMD2;initial
cfVMD2=1'd0;always@(posedge i_clk)if(QeVMD2)cfVMD2<=1'd0;else if(ReVMD2)cfVMD2
<=(cfVMD2)&&(TeVMD2);else if(TeVMD2)cfVMD2<=(afVMD2+1==ZeVMD2);else cfVMD2<=(
afVMD2==ZeVMD2);initial afVMD2=0;always@(posedge i_clk)if(QeVMD2)afVMD2<={(
LGFLEN){1'd0}};else if(TeVMD2)begin if((ReVMD2)||(~cfVMD2))afVMD2<=afVMD2+{{(
LGFLEN-1){1'd0}},1'd1};end always@(posedge i_clk)UeVMD2<=YeVMD2[(TeVMD2)?(
afVMD2+{{(LGFLEN-1){1'd0}},1'd1}):(afVMD2)];wire[(LGFLEN-1):0]dfVMD2;assign
dfVMD2=ZeVMD2+{{(LGFLEN-1){1'd0}},1'd1};assign WeVMD2=((ReVMD2)&&(bfVMD2)&&(~
TeVMD2))||((TeVMD2)&&(cfVMD2)&&(~ReVMD2));wire[(LGFLEN-1):0]efVMD2;assign
efVMD2=afVMD2+{{(LGFLEN-1){1'd0}},1'd1};always@(posedge i_clk)if(QeVMD2)VeVMD2
<=1'd0;else VeVMD2<=(~TeVMD2)&&(ZeVMD2!=afVMD2)||(TeVMD2)&&(ZeVMD2!=efVMD2);
endmodule module yeVMD2(i_clk,QeVMD2,CeVMD2,ffVMD2,gfVMD2,hfVMD2,ifVMD2,EeVMD2
,jfVMD2,i_tx_busy,kfVMD2);input i_clk,QeVMD2;input CeVMD2;input[35:0]ffVMD2;
input gfVMD2,hfVMD2,ifVMD2;output wire EeVMD2;output wire[7:0]jfVMD2;input
i_tx_busy;output wire kfVMD2;wire lfVMD2,mfVMD2,nfVMD2,ofVMD2;wire[35:0]pfVMD2
;wire qfVMD2,rfVMD2,sfVMD2,tfVMD2,ufVMD2,vfVMD2,wfVMD2,xfVMD2;wire[35:0]yfVMD2
,zfVMD2;wire[6:0]AfVMD2,BfVMD2;assign lfVMD2=(nfVMD2)&&(~rfVMD2);teVMD2#(36,10
)CfVMD2(i_clk,QeVMD2,CeVMD2,ffVMD2,lfVMD2,pfVMD2,nfVMD2,ofVMD2);assign kfVMD2=
ofVMD2;DfVMD2 EfVMD2(i_clk,lfVMD2,pfVMD2,gfVMD2,ifVMD2,hfVMD2,qfVMD2,yfVMD2,
rfVMD2,wfVMD2);assign wfVMD2=sfVMD2;FfVMD2 GfVMD2(i_clk,qfVMD2,yfVMD2,sfVMD2,
zfVMD2,mfVMD2);HfVMD2 IfVMD2(i_clk,sfVMD2,zfVMD2,vfVMD2,tfVMD2,AfVMD2,mfVMD2);
JfVMD2 KfVMD2(i_clk,tfVMD2,AfVMD2,ufVMD2,BfVMD2,(gfVMD2||ifVMD2||nfVMD2||rfVMD2
),xfVMD2,vfVMD2);LfVMD2 MfVMD2(i_clk,ufVMD2,BfVMD2,EeVMD2,jfVMD2,xfVMD2,
i_tx_busy);endmodule module NfVMD2(i_clk,CeVMD2,OfVMD2,EeVMD2,PfVMD2,QfVMD2);
input i_clk,CeVMD2;input[7:0]OfVMD2;output reg EeVMD2,PfVMD2;output reg[5:0]
QfVMD2;always@(posedge i_clk)EeVMD2<=CeVMD2;always@(posedge i_clk)begin PfVMD2
<=1'd1;QfVMD2<=6'd0;if((OfVMD2>=8'd48)&&(OfVMD2<=8'd57))QfVMD2<={2'd0,OfVMD2[3
:0]};else if((OfVMD2>=8'd65)&&(OfVMD2<=8'd90))QfVMD2<=(OfVMD2[5:0]-6'd1+6'd10)
;else if((OfVMD2>=8'd97)&&(OfVMD2<=8'd122))QfVMD2<=(OfVMD2[5:0]+6'd3);else if(
OfVMD2==8'd64)QfVMD2<=6'd62;else if(OfVMD2==8'd37)QfVMD2<=6'd63;else PfVMD2<=
1'd0;end endmodule module JfVMD2(i_clk,CeVMD2,RfVMD2,EeVMD2,SfVMD2,ifVMD2,
i_tx_busy,TfVMD2);input i_clk,CeVMD2;input[6:0]RfVMD2;output reg EeVMD2;output
reg[6:0]SfVMD2;input ifVMD2;input i_tx_busy;output wire TfVMD2;reg UfVMD2,
VfVMD2;initial UfVMD2=1'd1;initial VfVMD2=1'd1;always@(posedge i_clk)if((~
i_tx_busy)&&(EeVMD2))UfVMD2<=(SfVMD2[6]);always@(posedge i_clk)if((CeVMD2)&&(~
TfVMD2))VfVMD2<=(RfVMD2[6]);reg[6:0]WfVMD2;initial WfVMD2=7'd0;always@(posedge
i_clk)if((~i_tx_busy)&&(EeVMD2))begin if(SfVMD2[6])WfVMD2<=0;else WfVMD2<=
WfVMD2+7'd1;end reg XfVMD2;initial XfVMD2=1'd0;always@(posedge i_clk)XfVMD2<=(
WfVMD2>7'd72);initial EeVMD2=1'd0;always@(posedge i_clk)if((CeVMD2)&&(~TfVMD2)
)begin EeVMD2<=(XfVMD2)||(~RfVMD2[6]);SfVMD2<=RfVMD2;end else if(~TfVMD2)begin
EeVMD2<=(~i_tx_busy)&&(~ifVMD2)&&(~UfVMD2)&&(VfVMD2);SfVMD2<=7'd64;end else if
(~i_tx_busy)EeVMD2<=1'd0;reg YfVMD2;initial YfVMD2=1'd0;always@(posedge i_clk)
YfVMD2<=(EeVMD2);assign TfVMD2=(YfVMD2)||(EeVMD2);endmodule module HfVMD2(i_clk
,CeVMD2,DeVMD2,i_tx_busy,EeVMD2,SfVMD2,TfVMD2);input i_clk,CeVMD2;input[35:0]
DeVMD2;input i_tx_busy;output reg EeVMD2;output reg[6:0]SfVMD2;output reg
TfVMD2;wire[2:0]ZfVMD2;assign ZfVMD2=(DeVMD2[35:33]==3'd0)?3'd1:(DeVMD2[35:32]
==4'd2)?3'd6:(DeVMD2[35:32]==4'd3)?(3'd2+{1'd0,DeVMD2[31:30]}):(DeVMD2[35:34]
==2'd1)?3'd2:(DeVMD2[35:34]==2'd2)?3'd1:3'd6;reg agVMD2;reg[2:0]bgVMD2;reg[29:0
]JeVMD2;initial EeVMD2=1'd0;initial TfVMD2=1'd0;initial agVMD2=1'd0;always@(
posedge i_clk)if((CeVMD2)&&(~TfVMD2))begin bgVMD2<=ZfVMD2-3'd1;JeVMD2<=DeVMD2[
29:0];EeVMD2<=1'd1;SfVMD2<={1'd0,DeVMD2[35:30]};TfVMD2<=1'd1;agVMD2<=1'd1;end
else if((EeVMD2)&&(i_tx_busy))begin TfVMD2<=1'd1;agVMD2<=1'd1;end else if(
EeVMD2)EeVMD2<=1'd0;else if(bgVMD2>0)begin EeVMD2<=1'd1;SfVMD2<={1'd0,JeVMD2[29
:24]};JeVMD2[29:6]<=JeVMD2[23:0];bgVMD2<=bgVMD2-3'd1;TfVMD2<=1'd1;agVMD2<=1'd1
;end else if(~SfVMD2[6])begin EeVMD2<=1'd1;SfVMD2<=7'd64;TfVMD2<=1'd1;agVMD2<=
1'd1;end else begin agVMD2<=1'd0;TfVMD2<=(agVMD2);end endmodule module DfVMD2(
i_clk,CeVMD2,ffVMD2,cgVMD2,dgVMD2,hfVMD2,EeVMD2,egVMD2,TfVMD2,i_tx_busy);input
i_clk;input CeVMD2;input[35:0]ffVMD2;input cgVMD2,dgVMD2,hfVMD2;output reg
EeVMD2;output reg[35:0]egVMD2;output reg TfVMD2;input i_tx_busy;reg fgVMD2,
ggVMD2;initial fgVMD2=1'd0;always@(posedge i_clk)if((EeVMD2)&&(~i_tx_busy)&&(
egVMD2[35:30]==6'd4))fgVMD2<=hfVMD2;else fgVMD2<=(fgVMD2)||(hfVMD2);wire hgVMD2
;reg igVMD2;reg[35:0]jgVMD2;initial jgVMD2=36'd0;always@(posedge i_clk)if((
CeVMD2)||(EeVMD2))jgVMD2<=36'd0;else if(~jgVMD2[35])jgVMD2<=jgVMD2+36'd43;
initial igVMD2=1'd0;always@(posedge i_clk)if((EeVMD2)&&(~i_tx_busy)&&(egVMD2[35
:31]==5'd0))igVMD2<=1'd1;else if(~jgVMD2[35])igVMD2<=1'd0;assign hgVMD2=(~
igVMD2)&&(jgVMD2[35]);initial EeVMD2=1'd0;initial TfVMD2=1'd0;always@(posedge
i_clk)if((EeVMD2)&&(i_tx_busy))begin TfVMD2<=1'd1;end else if(EeVMD2)begin
EeVMD2<=1'd0;TfVMD2<=1'd1;end else if(TfVMD2)TfVMD2<=1'd0;else if(CeVMD2)begin
egVMD2<=ffVMD2;EeVMD2<=1'd1;TfVMD2<=1'd1;end else if((fgVMD2)&&(~ggVMD2))begin
EeVMD2<=1'd1;egVMD2<={6'd4,30'd0};TfVMD2<=1'd1;end else if(hgVMD2)begin EeVMD2
<=1'd1;TfVMD2<=1'd1;if(cgVMD2)egVMD2<={6'd1,30'd0};else egVMD2<={6'd0,30'd0};
end initial ggVMD2=1'd0;always@(posedge i_clk)if((fgVMD2)&&((~EeVMD2)&&(~TfVMD2
)&&(~CeVMD2)))ggVMD2<=1'd1;else if(~hfVMD2)ggVMD2<=1'd0;endmodule module kgVMD2
(i_clk,CeVMD2,lgVMD2,mgVMD2,EeVMD2,egVMD2);input i_clk,CeVMD2,lgVMD2;input[5:0
]mgVMD2;output reg EeVMD2;output reg[35:0]egVMD2;reg[2:0]bgVMD2,ngVMD2;reg[1:0
]ogVMD2;wire pgVMD2;assign pgVMD2=((bgVMD2==ngVMD2)&&(ngVMD2!=0))||((CeVMD2)&&
(~lgVMD2)&&(ogVMD2==2'd1));initial bgVMD2=3'd0;always@(posedge i_clk)if((CeVMD2
)&&(~lgVMD2))bgVMD2<=0;else if(pgVMD2)bgVMD2<=(CeVMD2)?3'd1:3'd0;else if(CeVMD2
)bgVMD2<=bgVMD2+3'd1;reg[35:0]qgVMD2;always@(posedge i_clk)if(pgVMD2)qgVMD2[35
:30]<=mgVMD2;else if(CeVMD2)case(bgVMD2)3'd0:qgVMD2[35:30]<=mgVMD2;3'd1:qgVMD2
[29:24]<=mgVMD2;3'd2:qgVMD2[23:18]<=mgVMD2;3'd3:qgVMD2[17:12]<=mgVMD2;3'd4:
qgVMD2[11:6]<=mgVMD2;3'd5:qgVMD2[5:0]<=mgVMD2;default:begin end endcase always
@(posedge i_clk)if(EeVMD2)ogVMD2<=egVMD2[35:34];always@(posedge i_clk)if((
CeVMD2)&&(~lgVMD2)&&(ogVMD2==2'd1))egVMD2[35:30]<=6'd46;else egVMD2<=qgVMD2;
initial ngVMD2=3'd0;always@(posedge i_clk)if((CeVMD2)&&(~lgVMD2))ngVMD2<=0;else
if((CeVMD2)&&((ngVMD2==0)||(pgVMD2)))begin if(mgVMD2[5:4]==2'd3)ngVMD2<=3'd2;
else if(mgVMD2[5:4]==2'd2)ngVMD2<=3'd1;else if(mgVMD2[5:3]==3'd2)ngVMD2<=3'd2;
else if(mgVMD2[5:3]==3'd1)ngVMD2<=3'd2+{1'd0,mgVMD2[2:1]};else ngVMD2<=3'd6;end
else if(pgVMD2)ngVMD2<=0;always@(posedge i_clk)EeVMD2<=pgVMD2;endmodule module
FfVMD2(i_clk,CeVMD2,ffVMD2,EeVMD2,rgVMD2,dgVMD2);parameter DW=32,CW=36,TBITS=10
;input i_clk,CeVMD2;input[(CW-1):0]ffVMD2;output wire EeVMD2;output wire[(CW-1
):0]rgVMD2;input dgVMD2;reg sgVMD2;reg[35:0]tgVMD2;wire[31:0]MeVMD2;assign
MeVMD2=ffVMD2[31:0];always@(posedge i_clk)if((CeVMD2)&&(~sgVMD2))begin if(
ffVMD2[35:32]!=4'd2)begin tgVMD2<=ffVMD2;end else if(MeVMD2[31:6]==26'd0)tgVMD2
<={6'd12,MeVMD2[5:0],24'd0};else if(MeVMD2[31:12]==20'd0)tgVMD2<={6'd13,MeVMD2
[11:0],18'd0};else if(MeVMD2[31:18]==14'd0)tgVMD2<={6'd14,MeVMD2[17:0],12'd0};
else if(MeVMD2[31:24]==8'd0)tgVMD2<={6'd15,MeVMD2[23:0],6'd0};else begin tgVMD2
<=ffVMD2;end end initial sgVMD2=1'd0;always@(posedge i_clk)if((CeVMD2)&&(~
sgVMD2))sgVMD2<=CeVMD2;else if(~dgVMD2)sgVMD2<=1'd0;wire ugVMD2;assign ugVMD2=
(sgVMD2)&&(~dgVMD2);reg PeVMD2;always@(posedge i_clk)PeVMD2<=sgVMD2;wire[35:0]
JeVMD2;assign JeVMD2=tgVMD2;reg[(TBITS-1):0]vgVMD2;reg wgVMD2;always@(posedge
i_clk)if(ugVMD2)begin if(rgVMD2[35:33]==3'd1)vgVMD2<=0;else if(rgVMD2[35:33]==
3'd7)vgVMD2<=vgVMD2+{{(TBITS-1){1'd0}},1'd1};end always@(posedge i_clk)if((
ugVMD2)&&(rgVMD2[35:33]==3'd1))wgVMD2<=1'd0;else if(vgVMD2==10'd1023)wgVMD2<=
1'd1;reg[31:0]IeVMD2[0:((1<<TBITS)-1)];always@(posedge i_clk)IeVMD2[vgVMD2]<={
JeVMD2[32:31],JeVMD2[29:0]};reg xgVMD2,ygVMD2;reg[(TBITS-1):0]zgVMD2;reg[(TBITS
-1):0]AgVMD2;initial zgVMD2=0;initial xgVMD2=0;always@(posedge i_clk)begin
ygVMD2<=((AgVMD2-vgVMD2)=={{(TBITS-1){1'd0}},1'd1});if((ugVMD2)||(~sgVMD2))
begin zgVMD2<=vgVMD2+{(TBITS){1'd1}};AgVMD2=vgVMD2+{{(TBITS-1){1'd1}},1'd0};
xgVMD2<=1'd0;end else if((~xgVMD2)&&(~BgVMD2)&&((~AgVMD2[TBITS-1])||(wgVMD2)))
begin zgVMD2<=AgVMD2;AgVMD2=AgVMD2-{{(TBITS-1){1'd0}},1'd1};xgVMD2<=ygVMD2;end
end reg[1:0]CgVMD2;reg DgVMD2,EgVMD2;reg[(DW-1):0]OeVMD2;reg[(TBITS-1):0]FgVMD2
,GgVMD2,HgVMD2;always@(posedge i_clk)begin OeVMD2<=IeVMD2[zgVMD2];FgVMD2<=
zgVMD2;DgVMD2<=(OeVMD2=={JeVMD2[32:31],JeVMD2[29:0]});GgVMD2<=FgVMD2;HgVMD2<=
vgVMD2-FgVMD2;EgVMD2<=({1'd0,FgVMD2}<{wgVMD2,vgVMD2})&&(FgVMD2!=vgVMD2);end
always@(posedge i_clk)if((ugVMD2)||(~sgVMD2))CgVMD2<=0;else CgVMD2<={CgVMD2[0]
,1'd1};reg BgVMD2;reg[(TBITS-1):0]IgVMD2;always@(posedge i_clk)if((ugVMD2)||(~
sgVMD2)||(~PeVMD2))BgVMD2<=1'd0;else if(~BgVMD2)begin BgVMD2<=(EgVMD2)&&(DgVMD2
)&&(JeVMD2[35:33]==3'd7)&&(CgVMD2==2'd3);end reg JgVMD2,KgVMD2,LgVMD2;always@(
posedge i_clk)if(~BgVMD2)begin IgVMD2<=HgVMD2;LgVMD2<=(HgVMD2<10'd1313);JgVMD2
<=(HgVMD2==10'd1);KgVMD2<=(HgVMD2<10'd10);end wire[(TBITS-1):0]MgVMD2;wire[9:0
]NgVMD2;wire[2:0]OgVMD2;assign MgVMD2=IgVMD2;assign OgVMD2=IgVMD2[2:0]-3'd2;
assign NgVMD2=IgVMD2-10'd10;reg[(CW-1):0]PgVMD2;always@(posedge i_clk)begin if
((~sgVMD2)||(~PeVMD2)||(ugVMD2))begin PgVMD2<=JeVMD2;end else if((BgVMD2)&&(
LgVMD2))begin PgVMD2<=JeVMD2;if(JgVMD2)PgVMD2[35:30]<={5'd3,JeVMD2[30]};else if
(KgVMD2)PgVMD2[35:30]<={2'd2,OgVMD2,JeVMD2[30]};else PgVMD2[35:24]<={2'd1,
NgVMD2[8:6],JeVMD2[30],NgVMD2[5:0]};end else PgVMD2<=JeVMD2;end assign EeVMD2=
sgVMD2;assign rgVMD2=(PeVMD2)?(PgVMD2):(tgVMD2);endmodule module veVMD2(i_clk,
QeVMD2,CeVMD2,ffVMD2,TfVMD2,o_wb_cyc,o_wb_stb,o_wb_we,o_wb_addr,o_wb_data,
i_wb_ack,i_wb_stall,i_wb_err,i_wb_data,EeVMD2,egVMD2);input i_clk,QeVMD2;input
CeVMD2;input[35:0]ffVMD2;output wire TfVMD2;output reg o_wb_cyc;output reg
o_wb_stb;output reg o_wb_we;output reg[31:0]o_wb_addr,o_wb_data;input i_wb_ack
,i_wb_stall,i_wb_err;input[31:0]i_wb_data;output reg EeVMD2;output reg[35:0]
egVMD2;wire QgVMD2,RgVMD2,SgVMD2,TgVMD2;assign QgVMD2=(CeVMD2)&&(~TfVMD2);
assign SgVMD2=(QgVMD2)&&(ffVMD2[35:34]==2'd1);assign RgVMD2=(QgVMD2)&&(ffVMD2[
35:30]==6'd46);wire[31:0]UgVMD2;assign UgVMD2={ffVMD2[32:31],ffVMD2[29:0]};
assign TgVMD2=((QgVMD2)&&(ffVMD2[35:33]!=3'd3)&&(ffVMD2[35:30]!=6'd46));reg[2:0
]VgVMD2;reg[9:0]WgVMD2,bgVMD2;reg XgVMD2,YgVMD2,ZgVMD2,ahVMD2,bhVMD2;reg chVMD2
;initial YgVMD2=1'd1;initial VgVMD2=3'd0;initial EeVMD2=1'd0;always@(posedge
i_clk)if(QeVMD2)begin VgVMD2<=3'd0;EeVMD2<=1'd1;egVMD2<={6'd3,i_wb_data[29:0]}
;o_wb_cyc<=1'd0;o_wb_stb<=1'd0;end else case(VgVMD2)3'd0:begin o_wb_cyc<=1'd0;
o_wb_stb<=1'd0;EeVMD2<=1'd0;XgVMD2<=ffVMD2[30];o_wb_we<=(~ffVMD2[35]);egVMD2<=
{4'd2,o_wb_addr};o_wb_we<=(ffVMD2[35:34]!=2'd3);o_wb_data<=UgVMD2;if(CeVMD2)
begin casez(ffVMD2[35:32])4'd0:begin o_wb_addr<=ffVMD2[31:0];end 4'b001?:begin
o_wb_addr<=o_wb_addr+{ffVMD2[32:31],ffVMD2[29:0]};end 4'b01??:begin VgVMD2<=
3'd2;o_wb_cyc<=1'd1;o_wb_stb<=1'd1;end 4'b11??:begin if(YgVMD2)EeVMD2<=1'd1;
VgVMD2<=3'd1;o_wb_cyc<=1'd1;o_wb_stb<=1'd1;end default:;endcase end end 3'd1:
begin o_wb_cyc<=1'd1;o_wb_stb<=1'd1;if(i_wb_err)VgVMD2<=3'd0;EeVMD2<=(i_wb_err
)||(i_wb_ack);if(i_wb_err)egVMD2<={6'd5,i_wb_data[29:0]};else egVMD2<={3'd7,
i_wb_data[31:30],XgVMD2,i_wb_data[29:0]};if((XgVMD2)&&(~i_wb_stall))o_wb_addr
<=o_wb_addr+32'd1;if(~i_wb_stall)begin if((chVMD2)||(ZgVMD2))begin VgVMD2<=3'd3
;o_wb_stb<=1'd0;end end end 3'd2:begin o_wb_cyc<=1'd1;o_wb_stb<=1'd1;if(
i_wb_err)egVMD2<={6'd5,i_wb_data[29:0]};else egVMD2<={6'd2,i_wb_data[29:0]};if
((XgVMD2)&&(~i_wb_stall))o_wb_addr<=o_wb_addr+32'd1;EeVMD2<=(i_wb_err)||(~
i_wb_stall);if(i_wb_err)begin VgVMD2<=3'd5;o_wb_cyc<=1'd0;o_wb_stb<=1'd0;end
else if(~i_wb_stall)begin VgVMD2<=3'd4;o_wb_stb<=1'd0;end end 3'd3:begin
o_wb_cyc<=1'd1;o_wb_stb<=1'd0;if(i_wb_err)egVMD2<={6'd5,i_wb_data[29:0]};else
egVMD2<={3'd7,i_wb_data[31:30],XgVMD2,i_wb_data[29:0]};EeVMD2<=(((i_wb_ack)&&(
~o_wb_we))||(i_wb_err));if(((ahVMD2)&&(i_wb_ack))||(bhVMD2)||(i_wb_err))begin
o_wb_cyc<=1'd0;VgVMD2<=3'd0;end end 3'd4:begin egVMD2<={6'd5,i_wb_data[29:0]};
EeVMD2<=(i_wb_err)||(TgVMD2);o_wb_data<=UgVMD2;o_wb_cyc<=1'd1;o_wb_stb<=1'd0;if
(TgVMD2)begin o_wb_cyc<=1'd0;VgVMD2<=3'd0;end else if(i_wb_err)begin o_wb_cyc
<=1'd0;VgVMD2<=3'd5;end else if(SgVMD2)begin VgVMD2<=3'd2;o_wb_stb<=1'd1;end
else if(RgVMD2)VgVMD2<=3'd3;end 3'd5:begin o_wb_cyc<=1'd0;o_wb_stb<=1'd0;egVMD2
<={6'd5,i_wb_data[29:0]};EeVMD2<=(TgVMD2);if((RgVMD2)||(TgVMD2))VgVMD2<=3'd0;
end default:begin EeVMD2<=1'd1;egVMD2<={6'd3,i_wb_data[29:0]};VgVMD2<=3'd0;
o_wb_cyc<=1'd0;o_wb_stb<=1'd0;end endcase assign TfVMD2=(VgVMD2!=3'd0)&&(VgVMD2
!=3'd4)&&(VgVMD2!=3'd5);always@(posedge i_clk)if(QeVMD2)YgVMD2<=1'd1;else if((
~o_wb_cyc)&&(CeVMD2)&&(~ffVMD2[35]))YgVMD2<=1'd1;else if(o_wb_cyc)YgVMD2<=1'd0
;always@(posedge i_clk)if(~o_wb_cyc)WgVMD2<=10'd0;else if((o_wb_stb)&&(~
i_wb_stall)&&(~i_wb_ack))WgVMD2<=WgVMD2+10'd1;else if(((~o_wb_stb)||(i_wb_stall
))&&(i_wb_ack))WgVMD2<=WgVMD2-10'd1;always@(posedge i_clk)ahVMD2<=(~o_wb_stb)
&&(WgVMD2==10'd1)||(o_wb_stb)&&(WgVMD2==10'd0);always@(posedge i_clk)bhVMD2<=(
~o_wb_stb)&&(WgVMD2==10'd0);always@(posedge i_clk)if(~o_wb_stb)bgVMD2<=ffVMD2[9
:0];else if((o_wb_stb)&&(~i_wb_stall)&&(|bgVMD2))bgVMD2<=bgVMD2-10'd1;always@(
posedge i_clk)begin chVMD2<=(~o_wb_cyc)&&(ffVMD2[9:0]==10'd1);ZgVMD2<=(o_wb_stb
)&&(bgVMD2[9:2]==8'd0)&&((~bgVMD2[1])||((~bgVMD2[0])&&(~i_wb_stall)));end
endmodule module jeVMD2(i_clk,CeVMD2,OfVMD2,EeVMD2,egVMD2);input i_clk,CeVMD2;
input[7:0]OfVMD2;output wire EeVMD2;output wire[35:0]egVMD2;wire dhVMD2,ehVMD2
;wire[5:0]fhVMD2;NfVMD2 ghVMD2(i_clk,CeVMD2,OfVMD2,dhVMD2,ehVMD2,fhVMD2);wire
qfVMD2;wire[35:0]hhVMD2;kgVMD2 ihVMD2(i_clk,dhVMD2,ehVMD2,fhVMD2,qfVMD2,hhVMD2
);BeVMD2 jhVMD2(i_clk,qfVMD2,hhVMD2,EeVMD2,egVMD2);endmodule module LfVMD2(
i_clk,CeVMD2,khVMD2,EeVMD2,jfVMD2,TfVMD2,dgVMD2);input i_clk;input CeVMD2;input
[6:0]khVMD2;output reg EeVMD2;output reg[7:0]jfVMD2;output wire TfVMD2;input
dgVMD2;initial jfVMD2=8'd0;always@(posedge i_clk)if((CeVMD2)&&(~TfVMD2))begin
if(khVMD2[6])jfVMD2<=8'd10;else if(khVMD2[5:0]<=6'd9)jfVMD2<=8'd48+{4'd0,khVMD2
[3:0]};else if(khVMD2[5:0]<=6'd35)jfVMD2<=8'd65+{2'd0,khVMD2[5:0]}-8'd10;else
if(khVMD2[5:0]<=6'd61)jfVMD2<=8'd97+{2'd0,khVMD2[5:0]}-8'd36;else if(khVMD2[5:0
]==6'd62)jfVMD2<=8'd64;else jfVMD2<=8'd37;end always@(posedge i_clk)if((EeVMD2
)&&(~dgVMD2))EeVMD2<=1'd0;else if((CeVMD2)&&(~EeVMD2))EeVMD2<=1'd1;assign
TfVMD2=EeVMD2;endmodule
