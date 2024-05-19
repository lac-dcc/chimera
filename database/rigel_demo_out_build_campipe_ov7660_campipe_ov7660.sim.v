// This program was cloned from: https://github.com/jameshegarty/rigel
// License: MIT License

module incif_1uint32_CEtable__0x07d3ba40(input CLK, input CE, input [32:0] process_input, output [31:0] process_output);
parameter INSTANCE_NAME="INST";
  wire [31:0] unnamedcast7797USEDMULTIPLEcast;assign unnamedcast7797USEDMULTIPLEcast = (process_input[31:0]); 
  assign process_output = (((process_input[32]))?({(unnamedcast7797USEDMULTIPLEcast+(32'd1))}):(unnamedcast7797USEDMULTIPLEcast));
  // function: process pure=true delay=0
endmodule

module RegBy_incif_1uint32_CEtable__0x07d3ba40_CEtrue_initnil(input CLK, input set_valid, input CE, input [31:0] set_inp, input setby_valid, input setby_inp, output [31:0] SETBY_OUTPUT, output [31:0] GET_OUTPUT);
parameter INSTANCE_NAME="INST";
  reg [31:0] R;
  wire [31:0] regby_inner_process_output;
  always @(posedge CLK) begin if(set_valid===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'R' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if(setby_valid===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'R' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if((({4'b0,set_valid})+({4'b0,setby_valid})) > 5'd1) begin $display("error, function 'set' on instance 'R' in module '%s' has multiple valid bits active in same cycle!",INSTANCE_NAME);$finish(); end end
  wire [32:0] unnamedcallArbitrate7829USEDMULTIPLEcallArbitrate;assign unnamedcallArbitrate7829USEDMULTIPLEcallArbitrate = {(set_valid||setby_valid),((set_valid)?(set_inp):(regby_inner_process_output))}; 
    always @ (posedge CLK) begin if ((unnamedcallArbitrate7829USEDMULTIPLEcallArbitrate[32]) && CE) begin R <= (unnamedcallArbitrate7829USEDMULTIPLEcallArbitrate[31:0]); end end
  assign SETBY_OUTPUT = regby_inner_process_output;
  assign GET_OUTPUT = R;
  // function: set pure=false ONLY WIRE
  // function: setby pure=false ONLY WIRE
  // function: get pure=true ONLY WIRE
  incif_1uint32_CEtable__0x07d3ba40 #(.INSTANCE_NAME({INSTANCE_NAME,"_regby_inner"})) regby_inner(.CLK(CLK), .CE(CE), .process_input({setby_inp,R}), .process_output(regby_inner_process_output));
endmodule

module Underflow_A_null_null__count153600_cycles1874016_toosoon156168_UStrue(input CLK, input ready_downstream, output ready, input reset, input process_input, output process_output);
parameter INSTANCE_NAME="INST";
parameter OUTPUT_COUNT=0;
parameter INPUT_COUNT=0;
  wire [31:0] cycleCount_GET_OUTPUT;
  wire unnamedbinop8301USEDMULTIPLEbinop;assign unnamedbinop8301USEDMULTIPLEbinop = {((cycleCount_GET_OUTPUT)>((32'd1874016)))}; 
  assign ready = {(ready_downstream||unnamedbinop8301USEDMULTIPLEbinop)};
  wire unnamedbinop8303USEDMULTIPLEbinop;assign unnamedbinop8303USEDMULTIPLEbinop = {({(ready_downstream||reset)}||unnamedbinop8301USEDMULTIPLEbinop)}; 
  wire [31:0] outputCount_GET_OUTPUT;
  wire [31:0] unnamedcast8314USEDMULTIPLEcast;assign unnamedcast8314USEDMULTIPLEcast = (32'd153600); 
  wire unnamedcast8295USEDMULTIPLEcast;assign unnamedcast8295USEDMULTIPLEcast = process_input; 
  wire unnamedunary8320USEDMULTIPLEunary;assign unnamedunary8320USEDMULTIPLEunary = {(~reset)}; 
  wire unnamedbinop8330USEDMULTIPLEbinop;assign unnamedbinop8330USEDMULTIPLEbinop = {({(cycleCount_GET_OUTPUT==(32'd156168))}&&{((outputCount_GET_OUTPUT)>=(unnamedcast8314USEDMULTIPLEcast))})}; 
  wire [31:0] outputCount_SETBY_OUTPUT;
  wire [31:0] cycleCount_SETBY_OUTPUT;
  always @(posedge CLK) begin if({(~unnamedbinop8330USEDMULTIPLEbinop)} == 1'b0 && unnamedunary8320USEDMULTIPLEunary==1'b1 && unnamedbinop8303USEDMULTIPLEbinop==1'b1) begin $display("%s: pipeline completed eariler than expected",INSTANCE_NAME); end end
  assign process_output = {{({({({(unnamedbinop8301USEDMULTIPLEbinop&&{((outputCount_GET_OUTPUT)<(unnamedcast8314USEDMULTIPLEcast))})}||{({(~unnamedbinop8301USEDMULTIPLEbinop)}&&unnamedcast8295USEDMULTIPLEcast)})}&&unnamedunary8320USEDMULTIPLEunary)}||unnamedbinop8330USEDMULTIPLEbinop)}};
  // function: ready pure=true ONLY WIRE
  // function: reset pure=false ONLY WIRE
  // function: process pure=false ONLY WIRE
  RegBy_incif_1uint32_CEtable__0x07d3ba40_CEtrue_initnil #(.INSTANCE_NAME({INSTANCE_NAME,"_outputCount"})) outputCount(.CLK(CLK), .set_valid(reset), .CE(unnamedbinop8303USEDMULTIPLEbinop), .set_inp((32'd0)), .setby_valid(unnamedunary8320USEDMULTIPLEunary), .setby_inp({(ready_downstream&&{(unnamedcast8295USEDMULTIPLEcast||unnamedbinop8301USEDMULTIPLEbinop)})}), .SETBY_OUTPUT(outputCount_SETBY_OUTPUT), .GET_OUTPUT(outputCount_GET_OUTPUT));
  RegBy_incif_1uint32_CEtable__0x07d3ba40_CEtrue_initnil #(.INSTANCE_NAME({INSTANCE_NAME,"_cycleCount"})) cycleCount(.CLK(CLK), .set_valid(reset), .CE((1'd1)), .set_inp((32'd0)), .setby_valid(unnamedunary8320USEDMULTIPLEunary), .setby_inp((1'd1)), .SETBY_OUTPUT(cycleCount_SETBY_OUTPUT), .GET_OUTPUT(cycleCount_GET_OUTPUT));
endmodule

module ShiftRegister_0_CEtrue_TY1(input CLK, input CE, input sr_input, output pushPop_out);
parameter INSTANCE_NAME="INST";
  assign pushPop_out = sr_input;
  // function: pushPop pure=true delay=0
  // function: reset pure=true delay=0
endmodule

module index__null_null__0(input CLK, input process_CE);
parameter INSTANCE_NAME="INST";
  // function: process pure=true delay=0
endmodule

module MakeHandshake_index__null_null__0(input CLK, input ready_downstream, output ready, input reset, input process_input, output process_output);
parameter INSTANCE_NAME="INST";
parameter OUTPUT_COUNT=0;
parameter INPUT_COUNT=0;
  assign ready = ready_downstream;
  wire unnamedbinop7895USEDMULTIPLEbinop;assign unnamedbinop7895USEDMULTIPLEbinop = {(ready_downstream||reset)}; 
  wire unnamedcast7903USEDMULTIPLEcast;assign unnamedcast7903USEDMULTIPLEcast = process_input; 
  wire validBitDelay_index__null_null__0_pushPop_out;
  always @(posedge CLK) begin if({(~{(unnamedcast7903USEDMULTIPLEcast===1'bx)})} == 1'b0 && (1'd1)==1'b1) begin $display("%s: MakeHandshake: input valid bit should not be X!",INSTANCE_NAME); end end
  assign process_output = {validBitDelay_index__null_null__0_pushPop_out};
  // function: ready pure=true ONLY WIRE
  // function: reset pure=true ONLY WIRE
  // function: process pure=false ONLY WIRE
  ShiftRegister_0_CEtrue_TY1 #(.INSTANCE_NAME({INSTANCE_NAME,"_validBitDelay_index__null_null__0"})) validBitDelay_index__null_null__0(.CLK(CLK), .CE(unnamedbinop7895USEDMULTIPLEbinop), .sr_input(unnamedcast7903USEDMULTIPLEcast), .pushPop_out(validBitDelay_index__null_null__0_pushPop_out));
  index__null_null__0 #(.INSTANCE_NAME({INSTANCE_NAME,"_inner"})) inner(.CLK(CLK), .process_CE(unnamedbinop7895USEDMULTIPLEbinop));
endmodule

module ShiftRegister_1_CEtrue_TY1(input CLK, input pushPop_valid, input CE, input sr_input, output pushPop_out, input reset);
parameter INSTANCE_NAME="INST";
always @(posedge CLK) begin if(pushPop_valid===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'pushPop'", INSTANCE_NAME);  end end
always @(posedge CLK) begin if(reset===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'reset'", INSTANCE_NAME);  end end
  reg SR1;
  always @(posedge CLK) begin if(pushPop_valid===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR1' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if(reset===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR1' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if((({4'b0,pushPop_valid})+({4'b0,reset})) > 5'd1) begin $display("error, function 'set' on instance 'SR1' in module '%s' has multiple valid bits active in same cycle!",INSTANCE_NAME);$finish(); end end
  wire [1:0] unnamedcallArbitrate362USEDMULTIPLEcallArbitrate;assign unnamedcallArbitrate362USEDMULTIPLEcallArbitrate = {(pushPop_valid||reset),((pushPop_valid)?(sr_input):((1'd0)))}; 
    always @ (posedge CLK) begin if ((unnamedcallArbitrate362USEDMULTIPLEcallArbitrate[1]) && CE) begin SR1 <= (unnamedcallArbitrate362USEDMULTIPLEcallArbitrate[0]); end end
  assign pushPop_out = SR1;
  // function: pushPop pure=false delay=0
  // function: reset pure=false delay=0
endmodule

module freadSeq____ov7660_raw_dup(input CLK, input process_valid, input CE, output [63:0] process_output, input reset);
parameter INSTANCE_NAME="INST";
always @(posedge CLK) begin if(process_valid===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'process'", INSTANCE_NAME);  end end
always @(posedge CLK) begin if(reset===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'reset'", INSTANCE_NAME);  end end
  reg [63:0] freadfile_out;
  assign process_output = freadfile_out;
  // function: process pure=false delay=1
  // function: reset pure=false delay=0
  integer freadfile_file,r;
  initial begin freadfile_file = $fopen("../ov7660.raw.dup","r"); end
  always @ (posedge CLK) begin 
  if (process_valid && CE) begin freadfile_out[7:0] <= $fgetc(freadfile_file); freadfile_out[15:8] <= $fgetc(freadfile_file); freadfile_out[23:16] <= $fgetc(freadfile_file); freadfile_out[31:24] <= $fgetc(freadfile_file); freadfile_out[39:32] <= $fgetc(freadfile_file); freadfile_out[47:40] <= $fgetc(freadfile_file); freadfile_out[55:48] <= $fgetc(freadfile_file); freadfile_out[63:56] <= $fgetc(freadfile_file);  end 
    if (reset) begin r=$fseek(freadfile_file,0,0); end  end

endmodule

module MakeHandshake_freadSeq____ov7660_raw_dup(input CLK, input ready_downstream, output ready, input reset, input process_input, output [64:0] process_output);
parameter INSTANCE_NAME="INST";
parameter OUTPUT_COUNT=0;
parameter INPUT_COUNT=0;
  assign ready = ready_downstream;
  wire unnamedbinop8359USEDMULTIPLEbinop;assign unnamedbinop8359USEDMULTIPLEbinop = {(ready_downstream||reset)}; 
  wire unnamedcast8367USEDMULTIPLEcast;assign unnamedcast8367USEDMULTIPLEcast = process_input; 
  wire [63:0] inner_process_output;
  wire validBitDelay_freadSeq____ov7660_raw_dup_pushPop_out;
  always @(posedge CLK) begin if({(~{(unnamedcast8367USEDMULTIPLEcast===1'bx)})} == 1'b0 && (1'd1)==1'b1) begin $display("%s: MakeHandshake: input valid bit should not be X!",INSTANCE_NAME); end end
  assign process_output = {validBitDelay_freadSeq____ov7660_raw_dup_pushPop_out,inner_process_output};
  // function: ready pure=true ONLY WIRE
  // function: reset pure=false ONLY WIRE
  // function: process pure=false ONLY WIRE
  ShiftRegister_1_CEtrue_TY1 #(.INSTANCE_NAME({INSTANCE_NAME,"_validBitDelay_freadSeq____ov7660_raw_dup"})) validBitDelay_freadSeq____ov7660_raw_dup(.CLK(CLK), .pushPop_valid({(~reset)}), .CE(unnamedbinop8359USEDMULTIPLEbinop), .sr_input(unnamedcast8367USEDMULTIPLEcast), .pushPop_out(validBitDelay_freadSeq____ov7660_raw_dup_pushPop_out), .reset(reset));
  freadSeq____ov7660_raw_dup #(.INSTANCE_NAME({INSTANCE_NAME,"_inner"})) inner(.CLK(CLK), .process_valid(unnamedcast8367USEDMULTIPLEcast), .CE(unnamedbinop8359USEDMULTIPLEbinop), .process_output(inner_process_output), .reset(reset));
endmodule

module sumwrap_uint16_to1(input CLK, input CE, input [31:0] process_input, output [15:0] process_output);
parameter INSTANCE_NAME="INST";
  wire [15:0] unnamedcast7518USEDMULTIPLEcast;assign unnamedcast7518USEDMULTIPLEcast = (process_input[15:0]); 
  assign process_output = (({(unnamedcast7518USEDMULTIPLEcast==(16'd1))})?((16'd0)):({(unnamedcast7518USEDMULTIPLEcast+(process_input[31:16]))}));
  // function: process pure=true delay=0
endmodule

module RegBy_sumwrap_uint16_to1_CEtrue_initnil(input CLK, input set_valid, input CE, input [15:0] set_inp, input setby_valid, input [15:0] setby_inp, output [15:0] SETBY_OUTPUT, output [15:0] GET_OUTPUT);
parameter INSTANCE_NAME="INST";
  reg [15:0] R;
  wire [15:0] regby_inner_process_output;
  always @(posedge CLK) begin if(set_valid===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'R' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if(setby_valid===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'R' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if((({4'b0,set_valid})+({4'b0,setby_valid})) > 5'd1) begin $display("error, function 'set' on instance 'R' in module '%s' has multiple valid bits active in same cycle!",INSTANCE_NAME);$finish(); end end
  wire [16:0] unnamedcallArbitrate7558USEDMULTIPLEcallArbitrate;assign unnamedcallArbitrate7558USEDMULTIPLEcallArbitrate = {(set_valid||setby_valid),((set_valid)?(set_inp):(regby_inner_process_output))}; 
    always @ (posedge CLK) begin if ((unnamedcallArbitrate7558USEDMULTIPLEcallArbitrate[16]) && CE) begin R <= (unnamedcallArbitrate7558USEDMULTIPLEcallArbitrate[15:0]); end end
  assign SETBY_OUTPUT = regby_inner_process_output;
  assign GET_OUTPUT = R;
  // function: set pure=false ONLY WIRE
  // function: setby pure=false ONLY WIRE
  // function: get pure=true ONLY WIRE
  sumwrap_uint16_to1 #(.INSTANCE_NAME({INSTANCE_NAME,"_regby_inner"})) regby_inner(.CLK(CLK), .CE(CE), .process_input({setby_inp,R}), .process_output(regby_inner_process_output));
endmodule

module ChangeRate_uint8_2_1__from4_to2_H1(input CLK, output ready, input reset, input CE, input process_valid, input [63:0] process_input, output [32:0] process_output);
parameter INSTANCE_NAME="INST";
always @(posedge CLK) begin if(reset===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'reset'", INSTANCE_NAME);  end end
always @(posedge CLK) begin if(process_valid===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'process'", INSTANCE_NAME);  end end
  wire [15:0] phase_GET_OUTPUT;
  wire unnamedbinop7569_readingUSEDMULTIPLEbinop;assign unnamedbinop7569_readingUSEDMULTIPLEbinop = {(phase_GET_OUTPUT==(16'd0))}; 
  assign ready = unnamedbinop7569_readingUSEDMULTIPLEbinop;
  reg [31:0] SR_2;
  wire [31:0] unnamedselect7579USEDMULTIPLEselect;assign unnamedselect7579USEDMULTIPLEselect = ((unnamedbinop7569_readingUSEDMULTIPLEbinop)?(({process_input[31:0]})):(SR_2)); 
  reg [31:0] unnamedselect7579_delay1_validunnamednull0_CECE;  always @ (posedge CLK) begin if (CE) begin unnamedselect7579_delay1_validunnamednull0_CECE <= unnamedselect7579USEDMULTIPLEselect; end end
  reg [31:0] SR_1;  always @ (posedge CLK) begin if (process_valid && CE) begin SR_1 <= unnamedselect7579USEDMULTIPLEselect; end end
    always @ (posedge CLK) begin if (process_valid && CE) begin SR_2 <= ((unnamedbinop7569_readingUSEDMULTIPLEbinop)?(({process_input[63:32]})):(SR_1)); end end
  wire [15:0] phase_SETBY_OUTPUT;
  assign process_output = {(1'd1),unnamedselect7579_delay1_validunnamednull0_CECE};
  // function: ready pure=true delay=0
  // function: reset pure=false delay=0
  // function: process pure=false delay=1
  RegBy_sumwrap_uint16_to1_CEtrue_initnil #(.INSTANCE_NAME({INSTANCE_NAME,"_phase"})) phase(.CLK(CLK), .set_valid(reset), .CE(CE), .set_inp((16'd0)), .setby_valid(process_valid), .setby_inp((16'd1)), .SETBY_OUTPUT(phase_SETBY_OUTPUT), .GET_OUTPUT(phase_GET_OUTPUT));
endmodule

module WaitOnInput_ChangeRate_uint8_2_1__from4_to2_H1(input CLK, output ready, input reset, input CE, input process_valid, input [64:0] process_input, output [32:0] process_output);
parameter INSTANCE_NAME="INST";
always @(posedge CLK) begin if(reset===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'reset'", INSTANCE_NAME);  end end
always @(posedge CLK) begin if(process_valid===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'process'", INSTANCE_NAME);  end end
  wire WaitOnInput_inner_ready;
  assign ready = WaitOnInput_inner_ready;
  wire unnamedbinop7657USEDMULTIPLEbinop;assign unnamedbinop7657USEDMULTIPLEbinop = {({({(~WaitOnInput_inner_ready)}||(process_input[64]))}&&process_valid)}; 
  wire [32:0] WaitOnInput_inner_process_output;
  reg unnamedbinop7657_delay1_validunnamednull0_CECE;  always @ (posedge CLK) begin if (CE) begin unnamedbinop7657_delay1_validunnamednull0_CECE <= unnamedbinop7657USEDMULTIPLEbinop; end end
  assign process_output = {{((WaitOnInput_inner_process_output[32])&&unnamedbinop7657_delay1_validunnamednull0_CECE)},(WaitOnInput_inner_process_output[31:0])};
  // function: ready pure=true delay=0
  // function: reset pure=false delay=0
  // function: process pure=false delay=1
  ChangeRate_uint8_2_1__from4_to2_H1 #(.INSTANCE_NAME({INSTANCE_NAME,"_WaitOnInput_inner"})) WaitOnInput_inner(.CLK(CLK), .ready(WaitOnInput_inner_ready), .reset(reset), .CE(CE), .process_valid(unnamedbinop7657USEDMULTIPLEbinop), .process_input((process_input[63:0])), .process_output(WaitOnInput_inner_process_output));
endmodule

module LiftHandshake_WaitOnInput_ChangeRate_uint8_2_1__from4_to2_H1(input CLK, input ready_downstream, output ready, input reset, input [64:0] process_input, output [32:0] process_output);
parameter INSTANCE_NAME="INST";
parameter OUTPUT_COUNT=0;
parameter INPUT_COUNT=0;
  wire inner_WaitOnInput_ChangeRate_uint8_2_1__from4_to2_H1_ready;
  assign ready = {(inner_WaitOnInput_ChangeRate_uint8_2_1__from4_to2_H1_ready&&ready_downstream)};
  wire unnamedbinop7692USEDMULTIPLEbinop;assign unnamedbinop7692USEDMULTIPLEbinop = {(reset||ready_downstream)}; 
  wire unnamedunary7693USEDMULTIPLEunary;assign unnamedunary7693USEDMULTIPLEunary = {(~reset)}; 
  wire [32:0] inner_WaitOnInput_ChangeRate_uint8_2_1__from4_to2_H1_process_output;
  wire validBitDelay_WaitOnInput_ChangeRate_uint8_2_1__from4_to2_H1_pushPop_out;
  wire [32:0] unnamedtuple7703USEDMULTIPLEtuple;assign unnamedtuple7703USEDMULTIPLEtuple = {{((inner_WaitOnInput_ChangeRate_uint8_2_1__from4_to2_H1_process_output[32])&&validBitDelay_WaitOnInput_ChangeRate_uint8_2_1__from4_to2_H1_pushPop_out)},(inner_WaitOnInput_ChangeRate_uint8_2_1__from4_to2_H1_process_output[31:0])}; 
  always @(posedge CLK) begin if({(~{((unnamedtuple7703USEDMULTIPLEtuple[32])===1'bx)})} == 1'b0 && (1'd1)==1'b1) begin $display("%s: LiftHandshake: output valid bit should not be X!",INSTANCE_NAME); end end
  always @(posedge CLK) begin if({(~{((process_input[64])===1'bx)})} == 1'b0 && (1'd1)==1'b1) begin $display("%s: LiftHandshake: input valid bit should not be X!",INSTANCE_NAME); end end
  assign process_output = unnamedtuple7703USEDMULTIPLEtuple;
  // function: ready pure=true ONLY WIRE
  // function: reset pure=false ONLY WIRE
  // function: process pure=false ONLY WIRE
  WaitOnInput_ChangeRate_uint8_2_1__from4_to2_H1 #(.INSTANCE_NAME({INSTANCE_NAME,"_inner_WaitOnInput_ChangeRate_uint8_2_1__from4_to2_H1"})) inner_WaitOnInput_ChangeRate_uint8_2_1__from4_to2_H1(.CLK(CLK), .ready(inner_WaitOnInput_ChangeRate_uint8_2_1__from4_to2_H1_ready), .reset(reset), .CE(unnamedbinop7692USEDMULTIPLEbinop), .process_valid(unnamedunary7693USEDMULTIPLEunary), .process_input(process_input), .process_output(inner_WaitOnInput_ChangeRate_uint8_2_1__from4_to2_H1_process_output));
  ShiftRegister_1_CEtrue_TY1 #(.INSTANCE_NAME({INSTANCE_NAME,"_validBitDelay_WaitOnInput_ChangeRate_uint8_2_1__from4_to2_H1"})) validBitDelay_WaitOnInput_ChangeRate_uint8_2_1__from4_to2_H1(.CLK(CLK), .pushPop_valid(unnamedunary7693USEDMULTIPLEunary), .CE(unnamedbinop7692USEDMULTIPLEbinop), .sr_input((1'd1)), .pushPop_out(validBitDelay_WaitOnInput_ChangeRate_uint8_2_1__from4_to2_H1_pushPop_out), .reset(reset));
endmodule

module slice_typeuint8_2_1__xl0_xh0_yl0_yh0(input CLK, input process_CE, input [15:0] inp, output [7:0] process_output);
parameter INSTANCE_NAME="INST";
  assign process_output = ({inp[7:0]});
  // function: process pure=true delay=0
endmodule

module map_slice_typeuint8_2_1__xl0_xh0_yl0_yh0_W2_H1(input CLK, input process_CE, input [31:0] process_input, output [15:0] process_output);
parameter INSTANCE_NAME="INST";
  wire [7:0] inner0_0_process_output;
  wire [7:0] inner1_0_process_output;
  assign process_output = {inner1_0_process_output,inner0_0_process_output};
  // function: process pure=true delay=0
  slice_typeuint8_2_1__xl0_xh0_yl0_yh0 #(.INSTANCE_NAME({INSTANCE_NAME,"_inner0_0"})) inner0_0(.CLK(CLK), .process_CE(process_CE), .inp(({process_input[15:0]})), .process_output(inner0_0_process_output));
  slice_typeuint8_2_1__xl0_xh0_yl0_yh0 #(.INSTANCE_NAME({INSTANCE_NAME,"_inner1_0"})) inner1_0(.CLK(CLK), .process_CE(process_CE), .inp(({process_input[31:16]})), .process_output(inner1_0_process_output));
endmodule

module MakeHandshake_map_slice_typeuint8_2_1__xl0_xh0_yl0_yh0_W2_H1(input CLK, input ready_downstream, output ready, input reset, input [32:0] process_input, output [16:0] process_output);
parameter INSTANCE_NAME="INST";
parameter OUTPUT_COUNT=0;
parameter INPUT_COUNT=0;
  assign ready = ready_downstream;
  wire unnamedbinop7761USEDMULTIPLEbinop;assign unnamedbinop7761USEDMULTIPLEbinop = {(ready_downstream||reset)}; 
  wire unnamedcast7769USEDMULTIPLEcast;assign unnamedcast7769USEDMULTIPLEcast = (process_input[32]); 
  wire [15:0] inner_process_output;
  wire validBitDelay_map_slice_typeuint8_2_1__xl0_xh0_yl0_yh0_W2_H1_pushPop_out;
  always @(posedge CLK) begin if({(~{(unnamedcast7769USEDMULTIPLEcast===1'bx)})} == 1'b0 && (1'd1)==1'b1) begin $display("%s: MakeHandshake: input valid bit should not be X!",INSTANCE_NAME); end end
  assign process_output = {validBitDelay_map_slice_typeuint8_2_1__xl0_xh0_yl0_yh0_W2_H1_pushPop_out,inner_process_output};
  // function: ready pure=true ONLY WIRE
  // function: reset pure=true ONLY WIRE
  // function: process pure=false ONLY WIRE
  ShiftRegister_0_CEtrue_TY1 #(.INSTANCE_NAME({INSTANCE_NAME,"_validBitDelay_map_slice_typeuint8_2_1__xl0_xh0_yl0_yh0_W2_H1"})) validBitDelay_map_slice_typeuint8_2_1__xl0_xh0_yl0_yh0_W2_H1(.CLK(CLK), .CE(unnamedbinop7761USEDMULTIPLEbinop), .sr_input(unnamedcast7769USEDMULTIPLEcast), .pushPop_out(validBitDelay_map_slice_typeuint8_2_1__xl0_xh0_yl0_yh0_W2_H1_pushPop_out));
  map_slice_typeuint8_2_1__xl0_xh0_yl0_yh0_W2_H1 #(.INSTANCE_NAME({INSTANCE_NAME,"_inner"})) inner(.CLK(CLK), .process_CE(unnamedbinop7761USEDMULTIPLEbinop), .process_input((process_input[31:0])), .process_output(inner_process_output));
endmodule

module incif_wrapuint8_127_incnil(input CLK, input CE, input [8:0] process_input, output [7:0] process_output);
parameter INSTANCE_NAME="INST";
  wire [7:0] unnamedcast394USEDMULTIPLEcast;assign unnamedcast394USEDMULTIPLEcast = (process_input[7:0]); 
  assign process_output = (((process_input[8]))?((({(unnamedcast394USEDMULTIPLEcast==(8'd127))})?((8'd0)):({(unnamedcast394USEDMULTIPLEcast+(8'd1))}))):(unnamedcast394USEDMULTIPLEcast));
  // function: process pure=true delay=0
endmodule

module RegBy_incif_wrapuint8_127_incnil_CEtrue_initnil(input CLK, input set_valid, input CE, input [7:0] set_inp, input setby_valid, input setby_inp, output [7:0] SETBY_OUTPUT, output [7:0] GET_OUTPUT);
parameter INSTANCE_NAME="INST";
  reg [7:0] R;
  wire [7:0] regby_inner_process_output;
  always @(posedge CLK) begin if(set_valid===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'R' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if(setby_valid===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'R' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if((({4'b0,set_valid})+({4'b0,setby_valid})) > 5'd1) begin $display("error, function 'set' on instance 'R' in module '%s' has multiple valid bits active in same cycle!",INSTANCE_NAME);$finish(); end end
  wire [8:0] unnamedcallArbitrate445USEDMULTIPLEcallArbitrate;assign unnamedcallArbitrate445USEDMULTIPLEcallArbitrate = {(set_valid||setby_valid),((set_valid)?(set_inp):(regby_inner_process_output))}; 
    always @ (posedge CLK) begin if ((unnamedcallArbitrate445USEDMULTIPLEcallArbitrate[8]) && CE) begin R <= (unnamedcallArbitrate445USEDMULTIPLEcallArbitrate[7:0]); end end
  assign SETBY_OUTPUT = regby_inner_process_output;
  assign GET_OUTPUT = R;
  // function: set pure=false ONLY WIRE
  // function: setby pure=false ONLY WIRE
  // function: get pure=true ONLY WIRE
  incif_wrapuint8_127_incnil #(.INSTANCE_NAME({INSTANCE_NAME,"_regby_inner"})) regby_inner(.CLK(CLK), .CE(CE), .process_input({setby_inp,R}), .process_output(regby_inner_process_output));
endmodule

module fifo_uint8_2_1__128(input CLK, input popFront_valid, input CE_pop, output [15:0] popFront, output [7:0] size, input pushBackReset_valid, input CE_push, output ready, input pushBack_valid, input [15:0] pushBack_input, input popFrontReset_valid, output hasData);
parameter INSTANCE_NAME="INST";
always @(posedge CLK) begin if(popFront_valid===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'popFront'", INSTANCE_NAME);  end end
always @(posedge CLK) begin if(pushBackReset_valid===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'pushBackReset'", INSTANCE_NAME);  end end
always @(posedge CLK) begin if(pushBack_valid===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'pushBack'", INSTANCE_NAME);  end end
always @(posedge CLK) begin if(popFrontReset_valid===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'popFrontReset'", INSTANCE_NAME);  end end
  wire [7:0] readAddr_GET_OUTPUT;
  wire [6:0] unnamedcast561USEDMULTIPLEcast;assign unnamedcast561USEDMULTIPLEcast = readAddr_GET_OUTPUT[6:0]; 
  wire fifo1_READ_OUTPUT;
  wire fifo2_READ_OUTPUT;
  wire fifo3_READ_OUTPUT;
  wire fifo4_READ_OUTPUT;
  wire fifo5_READ_OUTPUT;
  wire fifo6_READ_OUTPUT;
  wire fifo7_READ_OUTPUT;
  wire fifo8_READ_OUTPUT;
  wire fifo9_READ_OUTPUT;
  wire fifo10_READ_OUTPUT;
  wire fifo11_READ_OUTPUT;
  wire fifo12_READ_OUTPUT;
  wire fifo13_READ_OUTPUT;
  wire fifo14_READ_OUTPUT;
  wire fifo15_READ_OUTPUT;
  wire fifo16_READ_OUTPUT;
  wire [7:0] writeAddr_GET_OUTPUT;
  wire unnamedunary468USEDMULTIPLEunary;assign unnamedunary468USEDMULTIPLEunary = {(~{(writeAddr_GET_OUTPUT==readAddr_GET_OUTPUT)})}; 
  always @(posedge CLK) begin if(unnamedunary468USEDMULTIPLEunary == 1'b0 && popFront_valid==1'b1 && CE_pop==1'b1) begin $display("%s: attempting to pop from an empty fifo",INSTANCE_NAME);$finish();  end end
  wire [7:0] readAddr_SETBY_OUTPUT;
  assign popFront = {fifo16_READ_OUTPUT,fifo15_READ_OUTPUT,fifo14_READ_OUTPUT,fifo13_READ_OUTPUT,fifo12_READ_OUTPUT,fifo11_READ_OUTPUT,fifo10_READ_OUTPUT,fifo9_READ_OUTPUT,fifo8_READ_OUTPUT,fifo7_READ_OUTPUT,fifo6_READ_OUTPUT,fifo5_READ_OUTPUT,fifo4_READ_OUTPUT,fifo3_READ_OUTPUT,fifo2_READ_OUTPUT,fifo1_READ_OUTPUT};
  wire [7:0] unnamedselect459USEDMULTIPLEselect;assign unnamedselect459USEDMULTIPLEselect = (({((writeAddr_GET_OUTPUT)<(readAddr_GET_OUTPUT))})?({({((8'd128)-readAddr_GET_OUTPUT)}+writeAddr_GET_OUTPUT)}):({(writeAddr_GET_OUTPUT-readAddr_GET_OUTPUT)})); 
  assign size = unnamedselect459USEDMULTIPLEselect;
  reg readyReg;
    always @ (posedge CLK) begin readyReg <= {((unnamedselect459USEDMULTIPLEselect)<((8'd125)))}; end
  assign ready = readyReg;
  always @(posedge CLK) begin if({((unnamedselect459USEDMULTIPLEselect)<((8'd126)))} == 1'b0 && pushBack_valid==1'b1 && CE_push==1'b1) begin $display("%s: attempting to push to a full fifo",INSTANCE_NAME);$finish();  end end
  wire [7:0] writeAddr_SETBY_OUTPUT;
  wire [6:0] unnamedcast476USEDMULTIPLEcast;assign unnamedcast476USEDMULTIPLEcast = writeAddr_GET_OUTPUT[6:0]; 
  assign hasData = unnamedunary468USEDMULTIPLEunary;
  // function: popFront pure=false delay=0
  // function: size pure=true delay=0
  // function: pushBackReset pure=false delay=0
  // function: ready pure=true delay=0
  // function: pushBack pure=false delay=0
  // function: popFrontReset pure=false delay=0
  // function: hasData pure=true delay=0
  RegBy_incif_wrapuint8_127_incnil_CEtrue_initnil #(.INSTANCE_NAME({INSTANCE_NAME,"_writeAddr"})) writeAddr(.CLK(CLK), .set_valid(pushBackReset_valid), .CE(CE_push), .set_inp((8'd0)), .setby_valid(pushBack_valid), .setby_inp((1'd1)), .SETBY_OUTPUT(writeAddr_SETBY_OUTPUT), .GET_OUTPUT(writeAddr_GET_OUTPUT));
  RegBy_incif_wrapuint8_127_incnil_CEtrue_initnil #(.INSTANCE_NAME({INSTANCE_NAME,"_readAddr"})) readAddr(.CLK(CLK), .set_valid(popFrontReset_valid), .CE(CE_pop), .set_inp((8'd0)), .setby_valid(popFront_valid), .setby_inp((1'd1)), .SETBY_OUTPUT(readAddr_SETBY_OUTPUT), .GET_OUTPUT(readAddr_GET_OUTPUT));
  wire [7:0] fifo1_writeInput = {pushBack_input[0:0],unnamedcast476USEDMULTIPLEcast};
wire fifo1_writeOut;
RAM128X1D fifo1  (
  .WCLK(CLK),
  .D(fifo1_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo1_writeOut),
  .DPO(fifo1_READ_OUTPUT),
  .A(fifo1_writeInput[6:0]),
  .DPRA(unnamedcast561USEDMULTIPLEcast));

  wire [7:0] fifo2_writeInput = {pushBack_input[1:1],unnamedcast476USEDMULTIPLEcast};
wire fifo2_writeOut;
RAM128X1D fifo2  (
  .WCLK(CLK),
  .D(fifo2_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo2_writeOut),
  .DPO(fifo2_READ_OUTPUT),
  .A(fifo2_writeInput[6:0]),
  .DPRA(unnamedcast561USEDMULTIPLEcast));

  wire [7:0] fifo3_writeInput = {pushBack_input[2:2],unnamedcast476USEDMULTIPLEcast};
wire fifo3_writeOut;
RAM128X1D fifo3  (
  .WCLK(CLK),
  .D(fifo3_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo3_writeOut),
  .DPO(fifo3_READ_OUTPUT),
  .A(fifo3_writeInput[6:0]),
  .DPRA(unnamedcast561USEDMULTIPLEcast));

  wire [7:0] fifo4_writeInput = {pushBack_input[3:3],unnamedcast476USEDMULTIPLEcast};
wire fifo4_writeOut;
RAM128X1D fifo4  (
  .WCLK(CLK),
  .D(fifo4_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo4_writeOut),
  .DPO(fifo4_READ_OUTPUT),
  .A(fifo4_writeInput[6:0]),
  .DPRA(unnamedcast561USEDMULTIPLEcast));

  wire [7:0] fifo5_writeInput = {pushBack_input[4:4],unnamedcast476USEDMULTIPLEcast};
wire fifo5_writeOut;
RAM128X1D fifo5  (
  .WCLK(CLK),
  .D(fifo5_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo5_writeOut),
  .DPO(fifo5_READ_OUTPUT),
  .A(fifo5_writeInput[6:0]),
  .DPRA(unnamedcast561USEDMULTIPLEcast));

  wire [7:0] fifo6_writeInput = {pushBack_input[5:5],unnamedcast476USEDMULTIPLEcast};
wire fifo6_writeOut;
RAM128X1D fifo6  (
  .WCLK(CLK),
  .D(fifo6_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo6_writeOut),
  .DPO(fifo6_READ_OUTPUT),
  .A(fifo6_writeInput[6:0]),
  .DPRA(unnamedcast561USEDMULTIPLEcast));

  wire [7:0] fifo7_writeInput = {pushBack_input[6:6],unnamedcast476USEDMULTIPLEcast};
wire fifo7_writeOut;
RAM128X1D fifo7  (
  .WCLK(CLK),
  .D(fifo7_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo7_writeOut),
  .DPO(fifo7_READ_OUTPUT),
  .A(fifo7_writeInput[6:0]),
  .DPRA(unnamedcast561USEDMULTIPLEcast));

  wire [7:0] fifo8_writeInput = {pushBack_input[7:7],unnamedcast476USEDMULTIPLEcast};
wire fifo8_writeOut;
RAM128X1D fifo8  (
  .WCLK(CLK),
  .D(fifo8_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo8_writeOut),
  .DPO(fifo8_READ_OUTPUT),
  .A(fifo8_writeInput[6:0]),
  .DPRA(unnamedcast561USEDMULTIPLEcast));

  wire [7:0] fifo9_writeInput = {pushBack_input[8:8],unnamedcast476USEDMULTIPLEcast};
wire fifo9_writeOut;
RAM128X1D fifo9  (
  .WCLK(CLK),
  .D(fifo9_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo9_writeOut),
  .DPO(fifo9_READ_OUTPUT),
  .A(fifo9_writeInput[6:0]),
  .DPRA(unnamedcast561USEDMULTIPLEcast));

  wire [7:0] fifo10_writeInput = {pushBack_input[9:9],unnamedcast476USEDMULTIPLEcast};
wire fifo10_writeOut;
RAM128X1D fifo10  (
  .WCLK(CLK),
  .D(fifo10_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo10_writeOut),
  .DPO(fifo10_READ_OUTPUT),
  .A(fifo10_writeInput[6:0]),
  .DPRA(unnamedcast561USEDMULTIPLEcast));

  wire [7:0] fifo11_writeInput = {pushBack_input[10:10],unnamedcast476USEDMULTIPLEcast};
wire fifo11_writeOut;
RAM128X1D fifo11  (
  .WCLK(CLK),
  .D(fifo11_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo11_writeOut),
  .DPO(fifo11_READ_OUTPUT),
  .A(fifo11_writeInput[6:0]),
  .DPRA(unnamedcast561USEDMULTIPLEcast));

  wire [7:0] fifo12_writeInput = {pushBack_input[11:11],unnamedcast476USEDMULTIPLEcast};
wire fifo12_writeOut;
RAM128X1D fifo12  (
  .WCLK(CLK),
  .D(fifo12_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo12_writeOut),
  .DPO(fifo12_READ_OUTPUT),
  .A(fifo12_writeInput[6:0]),
  .DPRA(unnamedcast561USEDMULTIPLEcast));

  wire [7:0] fifo13_writeInput = {pushBack_input[12:12],unnamedcast476USEDMULTIPLEcast};
wire fifo13_writeOut;
RAM128X1D fifo13  (
  .WCLK(CLK),
  .D(fifo13_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo13_writeOut),
  .DPO(fifo13_READ_OUTPUT),
  .A(fifo13_writeInput[6:0]),
  .DPRA(unnamedcast561USEDMULTIPLEcast));

  wire [7:0] fifo14_writeInput = {pushBack_input[13:13],unnamedcast476USEDMULTIPLEcast};
wire fifo14_writeOut;
RAM128X1D fifo14  (
  .WCLK(CLK),
  .D(fifo14_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo14_writeOut),
  .DPO(fifo14_READ_OUTPUT),
  .A(fifo14_writeInput[6:0]),
  .DPRA(unnamedcast561USEDMULTIPLEcast));

  wire [7:0] fifo15_writeInput = {pushBack_input[14:14],unnamedcast476USEDMULTIPLEcast};
wire fifo15_writeOut;
RAM128X1D fifo15  (
  .WCLK(CLK),
  .D(fifo15_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo15_writeOut),
  .DPO(fifo15_READ_OUTPUT),
  .A(fifo15_writeInput[6:0]),
  .DPRA(unnamedcast561USEDMULTIPLEcast));

  wire [7:0] fifo16_writeInput = {pushBack_input[15:15],unnamedcast476USEDMULTIPLEcast};
wire fifo16_writeOut;
RAM128X1D fifo16  (
  .WCLK(CLK),
  .D(fifo16_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo16_writeOut),
  .DPO(fifo16_READ_OUTPUT),
  .A(fifo16_writeInput[6:0]),
  .DPRA(unnamedcast561USEDMULTIPLEcast));

endmodule

module fifo_SIZE128_uint8_2_1__Wnil_Hnil_Tnil_BYTES256(input CLK, input load_valid, input load_CE, output [16:0] load_output, input store_reset_valid, input store_CE, output store_ready, input load_reset_valid, input store_valid, input [15:0] store_input);
parameter INSTANCE_NAME="INST";
always @(posedge CLK) begin if(load_valid===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'load'", INSTANCE_NAME);  end end
always @(posedge CLK) begin if(store_reset_valid===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'store_reset'", INSTANCE_NAME);  end end
always @(posedge CLK) begin if(load_reset_valid===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'load_reset'", INSTANCE_NAME);  end end
always @(posedge CLK) begin if(store_valid===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'store'", INSTANCE_NAME);  end end
  wire FIFO_hasData;
  wire [15:0] FIFO_popFront;
  assign load_output = {FIFO_hasData,FIFO_popFront};
  wire FIFO_ready;
  assign store_ready = FIFO_ready;
  // function: load pure=false delay=0
  // function: store_reset pure=false delay=0
  // function: store_ready pure=true delay=0
  // function: load_reset pure=false delay=0
  // function: store pure=false delay=0
  fifo_uint8_2_1__128 #(.INSTANCE_NAME({INSTANCE_NAME,"_FIFO"})) FIFO(.CLK(CLK), .popFront_valid({(FIFO_hasData&&load_valid)}), .CE_pop(load_CE), .popFront(FIFO_popFront), .size(FIFO_size), .pushBackReset_valid(store_reset_valid), .CE_push(store_CE), .ready(FIFO_ready), .pushBack_valid(store_valid), .pushBack_input(store_input), .popFrontReset_valid(load_reset_valid), .hasData(FIFO_hasData));
endmodule

module LiftDecimate_fifo_SIZE128_uint8_2_1__Wnil_Hnil_Tnil_BYTES256(input CLK, input load_valid, input load_CE, input load_input, output [16:0] load_output, input store_reset_valid, input store_CE, output store_ready, output load_ready, input load_reset, input store_valid, input [15:0] store_input);
parameter INSTANCE_NAME="INST";
always @(posedge CLK) begin if(load_valid===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'load'", INSTANCE_NAME);  end end
always @(posedge CLK) begin if(store_reset_valid===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'store_reset'", INSTANCE_NAME);  end end
always @(posedge CLK) begin if(load_reset===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'load_reset'", INSTANCE_NAME);  end end
always @(posedge CLK) begin if(store_valid===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'store'", INSTANCE_NAME);  end end
  wire unnamedcast940USEDMULTIPLEcast;assign unnamedcast940USEDMULTIPLEcast = load_input; 
  wire [16:0] LiftDecimate_load_output;
  reg [15:0] unnamedcast943_delay1_validunnamednull0_CEload_CE;  always @ (posedge CLK) begin if (load_CE) begin unnamedcast943_delay1_validunnamednull0_CEload_CE <= (LiftDecimate_load_output[15:0]); end end
  reg unnamedbinop948_delay1_validunnamednull0_CEload_CE;  always @ (posedge CLK) begin if (load_CE) begin unnamedbinop948_delay1_validunnamednull0_CEload_CE <= {((LiftDecimate_load_output[16])&&unnamedcast940USEDMULTIPLEcast)}; end end
  assign load_output = {unnamedbinop948_delay1_validunnamednull0_CEload_CE,unnamedcast943_delay1_validunnamednull0_CEload_CE};
  wire LiftDecimate_store_ready;
  assign store_ready = LiftDecimate_store_ready;
  assign load_ready = (1'd1);
  // function: load pure=false delay=1
  // function: store_reset pure=false delay=0
  // function: store_ready pure=true delay=0
  // function: load_ready pure=true delay=0
  // function: load_reset pure=false delay=0
  // function: store pure=false delay=0
  fifo_SIZE128_uint8_2_1__Wnil_Hnil_Tnil_BYTES256 #(.INSTANCE_NAME({INSTANCE_NAME,"_LiftDecimate"})) LiftDecimate(.CLK(CLK), .load_valid({(unnamedcast940USEDMULTIPLEcast&&load_valid)}), .load_CE(load_CE), .load_output(LiftDecimate_load_output), .store_reset_valid(store_reset_valid), .store_CE(store_CE), .store_ready(LiftDecimate_store_ready), .load_reset_valid(load_reset), .store_valid(store_valid), .store_input(store_input));
endmodule

module RunIffReady_LiftDecimate_fifo_SIZE128_uint8_2_1__Wnil_Hnil_Tnil_BYTES256(input CLK, input load_valid, input load_CE, input load_input, output [16:0] load_output, input store_reset, input CE, output store_ready, output load_ready, input load_reset, input store_valid, input [16:0] store_input, output store_output);
parameter INSTANCE_NAME="INST";
always @(posedge CLK) begin if(load_valid===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'load'", INSTANCE_NAME);  end end
always @(posedge CLK) begin if(store_reset===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'store_reset'", INSTANCE_NAME);  end end
always @(posedge CLK) begin if(load_reset===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'load_reset'", INSTANCE_NAME);  end end
always @(posedge CLK) begin if(store_valid===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'store'", INSTANCE_NAME);  end end
  wire [16:0] RunIffReady_load_output;
  assign load_output = RunIffReady_load_output;
  wire RunIffReady_store_ready;
  assign store_ready = RunIffReady_store_ready;
  wire RunIffReady_load_ready;
  assign load_ready = RunIffReady_load_ready;
  wire unnamedbinop1019USEDMULTIPLEbinop;assign unnamedbinop1019USEDMULTIPLEbinop = {({(RunIffReady_store_ready&&(store_input[16]))}&&store_valid)}; 
  assign store_output = {unnamedbinop1019USEDMULTIPLEbinop};
  // function: load pure=false delay=1
  // function: store_reset pure=false delay=0
  // function: store_ready pure=true delay=0
  // function: load_ready pure=true delay=0
  // function: load_reset pure=false delay=0
  // function: store pure=false delay=0
  LiftDecimate_fifo_SIZE128_uint8_2_1__Wnil_Hnil_Tnil_BYTES256 #(.INSTANCE_NAME({INSTANCE_NAME,"_RunIffReady"})) RunIffReady(.CLK(CLK), .load_valid(load_valid), .load_CE(load_CE), .load_input(load_input), .load_output(RunIffReady_load_output), .store_reset_valid(store_reset), .store_CE(CE), .store_ready(RunIffReady_store_ready), .load_ready(RunIffReady_load_ready), .load_reset(load_reset), .store_valid(unnamedbinop1019USEDMULTIPLEbinop), .store_input((store_input[15:0])));
endmodule

module LiftHandshake_RunIffReady_LiftDecimate_fifo_SIZE128_uint8_2_1__Wnil_Hnil_Tnil_BYTES256(input CLK, input load_input, output [16:0] load_output, input store_reset, input store_ready_downstream, output store_ready, input load_ready_downstream, output load_ready, input load_reset, input [16:0] store_input, output store_output);
parameter INSTANCE_NAME="INST";
parameter OUTPUT_COUNT=0;
parameter INPUT_COUNT=0;
  wire unnamedunary1056USEDMULTIPLEunary;assign unnamedunary1056USEDMULTIPLEunary = {(~load_reset)}; 
  wire unnamedbinop1055USEDMULTIPLEbinop;assign unnamedbinop1055USEDMULTIPLEbinop = {(load_reset||load_ready_downstream)}; 
  wire [16:0] inner_RunIffReady_LiftDecimate_fifo_SIZE128_uint8_2_1__Wnil_Hnil_Tnil_BYTES256_load_output;
  wire load_validBitDelay_RunIffReady_LiftDecimate_fifo_SIZE128_uint8_2_1__Wnil_Hnil_Tnil_BYTES256_pushPop_out;
  wire [16:0] unnamedtuple1066USEDMULTIPLEtuple;assign unnamedtuple1066USEDMULTIPLEtuple = {{((inner_RunIffReady_LiftDecimate_fifo_SIZE128_uint8_2_1__Wnil_Hnil_Tnil_BYTES256_load_output[16])&&load_validBitDelay_RunIffReady_LiftDecimate_fifo_SIZE128_uint8_2_1__Wnil_Hnil_Tnil_BYTES256_pushPop_out)},(inner_RunIffReady_LiftDecimate_fifo_SIZE128_uint8_2_1__Wnil_Hnil_Tnil_BYTES256_load_output[15:0])}; 
  always @(posedge CLK) begin if({(~{((unnamedtuple1066USEDMULTIPLEtuple[16])===1'bx)})} == 1'b0 && (1'd1)==1'b1) begin $display("%s: LiftHandshake: output valid bit should not be X!",INSTANCE_NAME); end end
  always @(posedge CLK) begin if({(~{(load_input===1'bx)})} == 1'b0 && (1'd1)==1'b1) begin $display("%s: LiftHandshake: input valid bit should not be X!",INSTANCE_NAME); end end
  assign load_output = unnamedtuple1066USEDMULTIPLEtuple;
  wire unnamedbinop1084USEDMULTIPLEbinop;assign unnamedbinop1084USEDMULTIPLEbinop = {(store_reset||store_ready_downstream)}; 
  wire inner_RunIffReady_LiftDecimate_fifo_SIZE128_uint8_2_1__Wnil_Hnil_Tnil_BYTES256_store_ready;
  assign store_ready = {(inner_RunIffReady_LiftDecimate_fifo_SIZE128_uint8_2_1__Wnil_Hnil_Tnil_BYTES256_store_ready&&store_ready_downstream)};
  wire inner_RunIffReady_LiftDecimate_fifo_SIZE128_uint8_2_1__Wnil_Hnil_Tnil_BYTES256_load_ready;
  assign load_ready = {(inner_RunIffReady_LiftDecimate_fifo_SIZE128_uint8_2_1__Wnil_Hnil_Tnil_BYTES256_load_ready&&load_ready_downstream)};
  wire unnamedunary1085USEDMULTIPLEunary;assign unnamedunary1085USEDMULTIPLEunary = {(~store_reset)}; 
  wire [0:0] inner_RunIffReady_LiftDecimate_fifo_SIZE128_uint8_2_1__Wnil_Hnil_Tnil_BYTES256_store_output;
  wire store_validBitDelay_RunIffReady_LiftDecimate_fifo_SIZE128_uint8_2_1__Wnil_Hnil_Tnil_BYTES256_pushPop_out;
  wire [0:0] unnamedtuple1099USEDMULTIPLEtuple;assign unnamedtuple1099USEDMULTIPLEtuple = {{(inner_RunIffReady_LiftDecimate_fifo_SIZE128_uint8_2_1__Wnil_Hnil_Tnil_BYTES256_store_output&&store_validBitDelay_RunIffReady_LiftDecimate_fifo_SIZE128_uint8_2_1__Wnil_Hnil_Tnil_BYTES256_pushPop_out)}}; 
  always @(posedge CLK) begin if({(~{(unnamedtuple1099USEDMULTIPLEtuple===1'bx)})} == 1'b0 && (1'd1)==1'b1) begin $display("%s: LiftHandshake: output valid bit should not be X!",INSTANCE_NAME); end end
  always @(posedge CLK) begin if({(~{((store_input[16])===1'bx)})} == 1'b0 && (1'd1)==1'b1) begin $display("%s: LiftHandshake: input valid bit should not be X!",INSTANCE_NAME); end end
  assign store_output = unnamedtuple1099USEDMULTIPLEtuple;
  // function: load pure=false ONLY WIRE
  // function: store_reset pure=false ONLY WIRE
  // function: store_ready pure=true ONLY WIRE
  // function: load_ready pure=true ONLY WIRE
  // function: load_reset pure=false ONLY WIRE
  // function: store pure=false ONLY WIRE
  RunIffReady_LiftDecimate_fifo_SIZE128_uint8_2_1__Wnil_Hnil_Tnil_BYTES256 #(.INSTANCE_NAME({INSTANCE_NAME,"_inner_RunIffReady_LiftDecimate_fifo_SIZE128_uint8_2_1__Wnil_Hnil_Tnil_BYTES256"})) inner_RunIffReady_LiftDecimate_fifo_SIZE128_uint8_2_1__Wnil_Hnil_Tnil_BYTES256(.CLK(CLK), .load_valid(unnamedunary1056USEDMULTIPLEunary), .load_CE(unnamedbinop1055USEDMULTIPLEbinop), .load_input(load_input), .load_output(inner_RunIffReady_LiftDecimate_fifo_SIZE128_uint8_2_1__Wnil_Hnil_Tnil_BYTES256_load_output), .store_reset(store_reset), .CE(unnamedbinop1084USEDMULTIPLEbinop), .store_ready(inner_RunIffReady_LiftDecimate_fifo_SIZE128_uint8_2_1__Wnil_Hnil_Tnil_BYTES256_store_ready), .load_ready(inner_RunIffReady_LiftDecimate_fifo_SIZE128_uint8_2_1__Wnil_Hnil_Tnil_BYTES256_load_ready), .load_reset(load_reset), .store_valid(unnamedunary1085USEDMULTIPLEunary), .store_input(store_input), .store_output(inner_RunIffReady_LiftDecimate_fifo_SIZE128_uint8_2_1__Wnil_Hnil_Tnil_BYTES256_store_output));
  ShiftRegister_1_CEtrue_TY1 #(.INSTANCE_NAME({INSTANCE_NAME,"_load_validBitDelay_RunIffReady_LiftDecimate_fifo_SIZE128_uint8_2_1__Wnil_Hnil_Tnil_BYTES256"})) load_validBitDelay_RunIffReady_LiftDecimate_fifo_SIZE128_uint8_2_1__Wnil_Hnil_Tnil_BYTES256(.CLK(CLK), .pushPop_valid(unnamedunary1056USEDMULTIPLEunary), .CE(unnamedbinop1055USEDMULTIPLEbinop), .sr_input((1'd1)), .pushPop_out(load_validBitDelay_RunIffReady_LiftDecimate_fifo_SIZE128_uint8_2_1__Wnil_Hnil_Tnil_BYTES256_pushPop_out), .reset(load_reset));
  ShiftRegister_0_CEtrue_TY1 #(.INSTANCE_NAME({INSTANCE_NAME,"_store_validBitDelay_RunIffReady_LiftDecimate_fifo_SIZE128_uint8_2_1__Wnil_Hnil_Tnil_BYTES256"})) store_validBitDelay_RunIffReady_LiftDecimate_fifo_SIZE128_uint8_2_1__Wnil_Hnil_Tnil_BYTES256(.CLK(CLK), .CE(unnamedbinop1084USEDMULTIPLEbinop), .sr_input((1'd1)), .pushPop_out(store_validBitDelay_RunIffReady_LiftDecimate_fifo_SIZE128_uint8_2_1__Wnil_Hnil_Tnil_BYTES256_pushPop_out));
endmodule

module fifo_uint8_4_1__2_1__128(input CLK, input popFront_valid, input CE_pop, output [63:0] popFront, output [7:0] size, input pushBackReset_valid, input CE_push, output ready, input pushBack_valid, input [63:0] pushBack_input, input popFrontReset_valid, output hasData);
parameter INSTANCE_NAME="INST";
always @(posedge CLK) begin if(popFront_valid===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'popFront'", INSTANCE_NAME);  end end
always @(posedge CLK) begin if(pushBackReset_valid===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'pushBackReset'", INSTANCE_NAME);  end end
always @(posedge CLK) begin if(pushBack_valid===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'pushBack'", INSTANCE_NAME);  end end
always @(posedge CLK) begin if(popFrontReset_valid===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'popFrontReset'", INSTANCE_NAME);  end end
  wire [7:0] readAddr_GET_OUTPUT;
  wire [6:0] unnamedcast6180USEDMULTIPLEcast;assign unnamedcast6180USEDMULTIPLEcast = readAddr_GET_OUTPUT[6:0]; 
  wire fifo1_READ_OUTPUT;
  wire fifo2_READ_OUTPUT;
  wire fifo3_READ_OUTPUT;
  wire fifo4_READ_OUTPUT;
  wire fifo5_READ_OUTPUT;
  wire fifo6_READ_OUTPUT;
  wire fifo7_READ_OUTPUT;
  wire fifo8_READ_OUTPUT;
  wire fifo9_READ_OUTPUT;
  wire fifo10_READ_OUTPUT;
  wire fifo11_READ_OUTPUT;
  wire fifo12_READ_OUTPUT;
  wire fifo13_READ_OUTPUT;
  wire fifo14_READ_OUTPUT;
  wire fifo15_READ_OUTPUT;
  wire fifo16_READ_OUTPUT;
  wire fifo17_READ_OUTPUT;
  wire fifo18_READ_OUTPUT;
  wire fifo19_READ_OUTPUT;
  wire fifo20_READ_OUTPUT;
  wire fifo21_READ_OUTPUT;
  wire fifo22_READ_OUTPUT;
  wire fifo23_READ_OUTPUT;
  wire fifo24_READ_OUTPUT;
  wire fifo25_READ_OUTPUT;
  wire fifo26_READ_OUTPUT;
  wire fifo27_READ_OUTPUT;
  wire fifo28_READ_OUTPUT;
  wire fifo29_READ_OUTPUT;
  wire fifo30_READ_OUTPUT;
  wire fifo31_READ_OUTPUT;
  wire fifo32_READ_OUTPUT;
  wire fifo33_READ_OUTPUT;
  wire fifo34_READ_OUTPUT;
  wire fifo35_READ_OUTPUT;
  wire fifo36_READ_OUTPUT;
  wire fifo37_READ_OUTPUT;
  wire fifo38_READ_OUTPUT;
  wire fifo39_READ_OUTPUT;
  wire fifo40_READ_OUTPUT;
  wire fifo41_READ_OUTPUT;
  wire fifo42_READ_OUTPUT;
  wire fifo43_READ_OUTPUT;
  wire fifo44_READ_OUTPUT;
  wire fifo45_READ_OUTPUT;
  wire fifo46_READ_OUTPUT;
  wire fifo47_READ_OUTPUT;
  wire fifo48_READ_OUTPUT;
  wire fifo49_READ_OUTPUT;
  wire fifo50_READ_OUTPUT;
  wire fifo51_READ_OUTPUT;
  wire fifo52_READ_OUTPUT;
  wire fifo53_READ_OUTPUT;
  wire fifo54_READ_OUTPUT;
  wire fifo55_READ_OUTPUT;
  wire fifo56_READ_OUTPUT;
  wire fifo57_READ_OUTPUT;
  wire fifo58_READ_OUTPUT;
  wire fifo59_READ_OUTPUT;
  wire fifo60_READ_OUTPUT;
  wire fifo61_READ_OUTPUT;
  wire fifo62_READ_OUTPUT;
  wire fifo63_READ_OUTPUT;
  wire fifo64_READ_OUTPUT;
  wire [7:0] writeAddr_GET_OUTPUT;
  wire unnamedunary5847USEDMULTIPLEunary;assign unnamedunary5847USEDMULTIPLEunary = {(~{(writeAddr_GET_OUTPUT==readAddr_GET_OUTPUT)})}; 
  always @(posedge CLK) begin if(unnamedunary5847USEDMULTIPLEunary == 1'b0 && popFront_valid==1'b1 && CE_pop==1'b1) begin $display("%s: attempting to pop from an empty fifo",INSTANCE_NAME);$finish();  end end
  wire [7:0] readAddr_SETBY_OUTPUT;
  assign popFront = {fifo64_READ_OUTPUT,fifo63_READ_OUTPUT,fifo62_READ_OUTPUT,fifo61_READ_OUTPUT,fifo60_READ_OUTPUT,fifo59_READ_OUTPUT,fifo58_READ_OUTPUT,fifo57_READ_OUTPUT,fifo56_READ_OUTPUT,fifo55_READ_OUTPUT,fifo54_READ_OUTPUT,fifo53_READ_OUTPUT,fifo52_READ_OUTPUT,fifo51_READ_OUTPUT,fifo50_READ_OUTPUT,fifo49_READ_OUTPUT,fifo48_READ_OUTPUT,fifo47_READ_OUTPUT,fifo46_READ_OUTPUT,fifo45_READ_OUTPUT,fifo44_READ_OUTPUT,fifo43_READ_OUTPUT,fifo42_READ_OUTPUT,fifo41_READ_OUTPUT,fifo40_READ_OUTPUT,fifo39_READ_OUTPUT,fifo38_READ_OUTPUT,fifo37_READ_OUTPUT,fifo36_READ_OUTPUT,fifo35_READ_OUTPUT,fifo34_READ_OUTPUT,fifo33_READ_OUTPUT,fifo32_READ_OUTPUT,fifo31_READ_OUTPUT,fifo30_READ_OUTPUT,fifo29_READ_OUTPUT,fifo28_READ_OUTPUT,fifo27_READ_OUTPUT,fifo26_READ_OUTPUT,fifo25_READ_OUTPUT,fifo24_READ_OUTPUT,fifo23_READ_OUTPUT,fifo22_READ_OUTPUT,fifo21_READ_OUTPUT,fifo20_READ_OUTPUT,fifo19_READ_OUTPUT,fifo18_READ_OUTPUT,fifo17_READ_OUTPUT,fifo16_READ_OUTPUT,fifo15_READ_OUTPUT,fifo14_READ_OUTPUT,fifo13_READ_OUTPUT,fifo12_READ_OUTPUT,fifo11_READ_OUTPUT,fifo10_READ_OUTPUT,fifo9_READ_OUTPUT,fifo8_READ_OUTPUT,fifo7_READ_OUTPUT,fifo6_READ_OUTPUT,fifo5_READ_OUTPUT,fifo4_READ_OUTPUT,fifo3_READ_OUTPUT,fifo2_READ_OUTPUT,fifo1_READ_OUTPUT};
  wire [7:0] unnamedselect5838USEDMULTIPLEselect;assign unnamedselect5838USEDMULTIPLEselect = (({((writeAddr_GET_OUTPUT)<(readAddr_GET_OUTPUT))})?({({((8'd128)-readAddr_GET_OUTPUT)}+writeAddr_GET_OUTPUT)}):({(writeAddr_GET_OUTPUT-readAddr_GET_OUTPUT)})); 
  assign size = unnamedselect5838USEDMULTIPLEselect;
  reg readyReg;
    always @ (posedge CLK) begin readyReg <= {((unnamedselect5838USEDMULTIPLEselect)<((8'd125)))}; end
  assign ready = readyReg;
  always @(posedge CLK) begin if({((unnamedselect5838USEDMULTIPLEselect)<((8'd126)))} == 1'b0 && pushBack_valid==1'b1 && CE_push==1'b1) begin $display("%s: attempting to push to a full fifo",INSTANCE_NAME);$finish();  end end
  wire [7:0] writeAddr_SETBY_OUTPUT;
  wire [6:0] unnamedcast5855USEDMULTIPLEcast;assign unnamedcast5855USEDMULTIPLEcast = writeAddr_GET_OUTPUT[6:0]; 
  assign hasData = unnamedunary5847USEDMULTIPLEunary;
  // function: popFront pure=false delay=0
  // function: size pure=true delay=0
  // function: pushBackReset pure=false delay=0
  // function: ready pure=true delay=0
  // function: pushBack pure=false delay=0
  // function: popFrontReset pure=false delay=0
  // function: hasData pure=true delay=0
  RegBy_incif_wrapuint8_127_incnil_CEtrue_initnil #(.INSTANCE_NAME({INSTANCE_NAME,"_writeAddr"})) writeAddr(.CLK(CLK), .set_valid(pushBackReset_valid), .CE(CE_push), .set_inp((8'd0)), .setby_valid(pushBack_valid), .setby_inp((1'd1)), .SETBY_OUTPUT(writeAddr_SETBY_OUTPUT), .GET_OUTPUT(writeAddr_GET_OUTPUT));
  RegBy_incif_wrapuint8_127_incnil_CEtrue_initnil #(.INSTANCE_NAME({INSTANCE_NAME,"_readAddr"})) readAddr(.CLK(CLK), .set_valid(popFrontReset_valid), .CE(CE_pop), .set_inp((8'd0)), .setby_valid(popFront_valid), .setby_inp((1'd1)), .SETBY_OUTPUT(readAddr_SETBY_OUTPUT), .GET_OUTPUT(readAddr_GET_OUTPUT));
  wire [7:0] fifo1_writeInput = {pushBack_input[0:0],unnamedcast5855USEDMULTIPLEcast};
wire fifo1_writeOut;
RAM128X1D fifo1  (
  .WCLK(CLK),
  .D(fifo1_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo1_writeOut),
  .DPO(fifo1_READ_OUTPUT),
  .A(fifo1_writeInput[6:0]),
  .DPRA(unnamedcast6180USEDMULTIPLEcast));

  wire [7:0] fifo2_writeInput = {pushBack_input[1:1],unnamedcast5855USEDMULTIPLEcast};
wire fifo2_writeOut;
RAM128X1D fifo2  (
  .WCLK(CLK),
  .D(fifo2_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo2_writeOut),
  .DPO(fifo2_READ_OUTPUT),
  .A(fifo2_writeInput[6:0]),
  .DPRA(unnamedcast6180USEDMULTIPLEcast));

  wire [7:0] fifo3_writeInput = {pushBack_input[2:2],unnamedcast5855USEDMULTIPLEcast};
wire fifo3_writeOut;
RAM128X1D fifo3  (
  .WCLK(CLK),
  .D(fifo3_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo3_writeOut),
  .DPO(fifo3_READ_OUTPUT),
  .A(fifo3_writeInput[6:0]),
  .DPRA(unnamedcast6180USEDMULTIPLEcast));

  wire [7:0] fifo4_writeInput = {pushBack_input[3:3],unnamedcast5855USEDMULTIPLEcast};
wire fifo4_writeOut;
RAM128X1D fifo4  (
  .WCLK(CLK),
  .D(fifo4_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo4_writeOut),
  .DPO(fifo4_READ_OUTPUT),
  .A(fifo4_writeInput[6:0]),
  .DPRA(unnamedcast6180USEDMULTIPLEcast));

  wire [7:0] fifo5_writeInput = {pushBack_input[4:4],unnamedcast5855USEDMULTIPLEcast};
wire fifo5_writeOut;
RAM128X1D fifo5  (
  .WCLK(CLK),
  .D(fifo5_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo5_writeOut),
  .DPO(fifo5_READ_OUTPUT),
  .A(fifo5_writeInput[6:0]),
  .DPRA(unnamedcast6180USEDMULTIPLEcast));

  wire [7:0] fifo6_writeInput = {pushBack_input[5:5],unnamedcast5855USEDMULTIPLEcast};
wire fifo6_writeOut;
RAM128X1D fifo6  (
  .WCLK(CLK),
  .D(fifo6_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo6_writeOut),
  .DPO(fifo6_READ_OUTPUT),
  .A(fifo6_writeInput[6:0]),
  .DPRA(unnamedcast6180USEDMULTIPLEcast));

  wire [7:0] fifo7_writeInput = {pushBack_input[6:6],unnamedcast5855USEDMULTIPLEcast};
wire fifo7_writeOut;
RAM128X1D fifo7  (
  .WCLK(CLK),
  .D(fifo7_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo7_writeOut),
  .DPO(fifo7_READ_OUTPUT),
  .A(fifo7_writeInput[6:0]),
  .DPRA(unnamedcast6180USEDMULTIPLEcast));

  wire [7:0] fifo8_writeInput = {pushBack_input[7:7],unnamedcast5855USEDMULTIPLEcast};
wire fifo8_writeOut;
RAM128X1D fifo8  (
  .WCLK(CLK),
  .D(fifo8_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo8_writeOut),
  .DPO(fifo8_READ_OUTPUT),
  .A(fifo8_writeInput[6:0]),
  .DPRA(unnamedcast6180USEDMULTIPLEcast));

  wire [7:0] fifo9_writeInput = {pushBack_input[8:8],unnamedcast5855USEDMULTIPLEcast};
wire fifo9_writeOut;
RAM128X1D fifo9  (
  .WCLK(CLK),
  .D(fifo9_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo9_writeOut),
  .DPO(fifo9_READ_OUTPUT),
  .A(fifo9_writeInput[6:0]),
  .DPRA(unnamedcast6180USEDMULTIPLEcast));

  wire [7:0] fifo10_writeInput = {pushBack_input[9:9],unnamedcast5855USEDMULTIPLEcast};
wire fifo10_writeOut;
RAM128X1D fifo10  (
  .WCLK(CLK),
  .D(fifo10_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo10_writeOut),
  .DPO(fifo10_READ_OUTPUT),
  .A(fifo10_writeInput[6:0]),
  .DPRA(unnamedcast6180USEDMULTIPLEcast));

  wire [7:0] fifo11_writeInput = {pushBack_input[10:10],unnamedcast5855USEDMULTIPLEcast};
wire fifo11_writeOut;
RAM128X1D fifo11  (
  .WCLK(CLK),
  .D(fifo11_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo11_writeOut),
  .DPO(fifo11_READ_OUTPUT),
  .A(fifo11_writeInput[6:0]),
  .DPRA(unnamedcast6180USEDMULTIPLEcast));

  wire [7:0] fifo12_writeInput = {pushBack_input[11:11],unnamedcast5855USEDMULTIPLEcast};
wire fifo12_writeOut;
RAM128X1D fifo12  (
  .WCLK(CLK),
  .D(fifo12_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo12_writeOut),
  .DPO(fifo12_READ_OUTPUT),
  .A(fifo12_writeInput[6:0]),
  .DPRA(unnamedcast6180USEDMULTIPLEcast));

  wire [7:0] fifo13_writeInput = {pushBack_input[12:12],unnamedcast5855USEDMULTIPLEcast};
wire fifo13_writeOut;
RAM128X1D fifo13  (
  .WCLK(CLK),
  .D(fifo13_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo13_writeOut),
  .DPO(fifo13_READ_OUTPUT),
  .A(fifo13_writeInput[6:0]),
  .DPRA(unnamedcast6180USEDMULTIPLEcast));

  wire [7:0] fifo14_writeInput = {pushBack_input[13:13],unnamedcast5855USEDMULTIPLEcast};
wire fifo14_writeOut;
RAM128X1D fifo14  (
  .WCLK(CLK),
  .D(fifo14_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo14_writeOut),
  .DPO(fifo14_READ_OUTPUT),
  .A(fifo14_writeInput[6:0]),
  .DPRA(unnamedcast6180USEDMULTIPLEcast));

  wire [7:0] fifo15_writeInput = {pushBack_input[14:14],unnamedcast5855USEDMULTIPLEcast};
wire fifo15_writeOut;
RAM128X1D fifo15  (
  .WCLK(CLK),
  .D(fifo15_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo15_writeOut),
  .DPO(fifo15_READ_OUTPUT),
  .A(fifo15_writeInput[6:0]),
  .DPRA(unnamedcast6180USEDMULTIPLEcast));

  wire [7:0] fifo16_writeInput = {pushBack_input[15:15],unnamedcast5855USEDMULTIPLEcast};
wire fifo16_writeOut;
RAM128X1D fifo16  (
  .WCLK(CLK),
  .D(fifo16_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo16_writeOut),
  .DPO(fifo16_READ_OUTPUT),
  .A(fifo16_writeInput[6:0]),
  .DPRA(unnamedcast6180USEDMULTIPLEcast));

  wire [7:0] fifo17_writeInput = {pushBack_input[16:16],unnamedcast5855USEDMULTIPLEcast};
wire fifo17_writeOut;
RAM128X1D fifo17  (
  .WCLK(CLK),
  .D(fifo17_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo17_writeOut),
  .DPO(fifo17_READ_OUTPUT),
  .A(fifo17_writeInput[6:0]),
  .DPRA(unnamedcast6180USEDMULTIPLEcast));

  wire [7:0] fifo18_writeInput = {pushBack_input[17:17],unnamedcast5855USEDMULTIPLEcast};
wire fifo18_writeOut;
RAM128X1D fifo18  (
  .WCLK(CLK),
  .D(fifo18_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo18_writeOut),
  .DPO(fifo18_READ_OUTPUT),
  .A(fifo18_writeInput[6:0]),
  .DPRA(unnamedcast6180USEDMULTIPLEcast));

  wire [7:0] fifo19_writeInput = {pushBack_input[18:18],unnamedcast5855USEDMULTIPLEcast};
wire fifo19_writeOut;
RAM128X1D fifo19  (
  .WCLK(CLK),
  .D(fifo19_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo19_writeOut),
  .DPO(fifo19_READ_OUTPUT),
  .A(fifo19_writeInput[6:0]),
  .DPRA(unnamedcast6180USEDMULTIPLEcast));

  wire [7:0] fifo20_writeInput = {pushBack_input[19:19],unnamedcast5855USEDMULTIPLEcast};
wire fifo20_writeOut;
RAM128X1D fifo20  (
  .WCLK(CLK),
  .D(fifo20_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo20_writeOut),
  .DPO(fifo20_READ_OUTPUT),
  .A(fifo20_writeInput[6:0]),
  .DPRA(unnamedcast6180USEDMULTIPLEcast));

  wire [7:0] fifo21_writeInput = {pushBack_input[20:20],unnamedcast5855USEDMULTIPLEcast};
wire fifo21_writeOut;
RAM128X1D fifo21  (
  .WCLK(CLK),
  .D(fifo21_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo21_writeOut),
  .DPO(fifo21_READ_OUTPUT),
  .A(fifo21_writeInput[6:0]),
  .DPRA(unnamedcast6180USEDMULTIPLEcast));

  wire [7:0] fifo22_writeInput = {pushBack_input[21:21],unnamedcast5855USEDMULTIPLEcast};
wire fifo22_writeOut;
RAM128X1D fifo22  (
  .WCLK(CLK),
  .D(fifo22_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo22_writeOut),
  .DPO(fifo22_READ_OUTPUT),
  .A(fifo22_writeInput[6:0]),
  .DPRA(unnamedcast6180USEDMULTIPLEcast));

  wire [7:0] fifo23_writeInput = {pushBack_input[22:22],unnamedcast5855USEDMULTIPLEcast};
wire fifo23_writeOut;
RAM128X1D fifo23  (
  .WCLK(CLK),
  .D(fifo23_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo23_writeOut),
  .DPO(fifo23_READ_OUTPUT),
  .A(fifo23_writeInput[6:0]),
  .DPRA(unnamedcast6180USEDMULTIPLEcast));

  wire [7:0] fifo24_writeInput = {pushBack_input[23:23],unnamedcast5855USEDMULTIPLEcast};
wire fifo24_writeOut;
RAM128X1D fifo24  (
  .WCLK(CLK),
  .D(fifo24_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo24_writeOut),
  .DPO(fifo24_READ_OUTPUT),
  .A(fifo24_writeInput[6:0]),
  .DPRA(unnamedcast6180USEDMULTIPLEcast));

  wire [7:0] fifo25_writeInput = {pushBack_input[24:24],unnamedcast5855USEDMULTIPLEcast};
wire fifo25_writeOut;
RAM128X1D fifo25  (
  .WCLK(CLK),
  .D(fifo25_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo25_writeOut),
  .DPO(fifo25_READ_OUTPUT),
  .A(fifo25_writeInput[6:0]),
  .DPRA(unnamedcast6180USEDMULTIPLEcast));

  wire [7:0] fifo26_writeInput = {pushBack_input[25:25],unnamedcast5855USEDMULTIPLEcast};
wire fifo26_writeOut;
RAM128X1D fifo26  (
  .WCLK(CLK),
  .D(fifo26_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo26_writeOut),
  .DPO(fifo26_READ_OUTPUT),
  .A(fifo26_writeInput[6:0]),
  .DPRA(unnamedcast6180USEDMULTIPLEcast));

  wire [7:0] fifo27_writeInput = {pushBack_input[26:26],unnamedcast5855USEDMULTIPLEcast};
wire fifo27_writeOut;
RAM128X1D fifo27  (
  .WCLK(CLK),
  .D(fifo27_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo27_writeOut),
  .DPO(fifo27_READ_OUTPUT),
  .A(fifo27_writeInput[6:0]),
  .DPRA(unnamedcast6180USEDMULTIPLEcast));

  wire [7:0] fifo28_writeInput = {pushBack_input[27:27],unnamedcast5855USEDMULTIPLEcast};
wire fifo28_writeOut;
RAM128X1D fifo28  (
  .WCLK(CLK),
  .D(fifo28_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo28_writeOut),
  .DPO(fifo28_READ_OUTPUT),
  .A(fifo28_writeInput[6:0]),
  .DPRA(unnamedcast6180USEDMULTIPLEcast));

  wire [7:0] fifo29_writeInput = {pushBack_input[28:28],unnamedcast5855USEDMULTIPLEcast};
wire fifo29_writeOut;
RAM128X1D fifo29  (
  .WCLK(CLK),
  .D(fifo29_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo29_writeOut),
  .DPO(fifo29_READ_OUTPUT),
  .A(fifo29_writeInput[6:0]),
  .DPRA(unnamedcast6180USEDMULTIPLEcast));

  wire [7:0] fifo30_writeInput = {pushBack_input[29:29],unnamedcast5855USEDMULTIPLEcast};
wire fifo30_writeOut;
RAM128X1D fifo30  (
  .WCLK(CLK),
  .D(fifo30_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo30_writeOut),
  .DPO(fifo30_READ_OUTPUT),
  .A(fifo30_writeInput[6:0]),
  .DPRA(unnamedcast6180USEDMULTIPLEcast));

  wire [7:0] fifo31_writeInput = {pushBack_input[30:30],unnamedcast5855USEDMULTIPLEcast};
wire fifo31_writeOut;
RAM128X1D fifo31  (
  .WCLK(CLK),
  .D(fifo31_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo31_writeOut),
  .DPO(fifo31_READ_OUTPUT),
  .A(fifo31_writeInput[6:0]),
  .DPRA(unnamedcast6180USEDMULTIPLEcast));

  wire [7:0] fifo32_writeInput = {pushBack_input[31:31],unnamedcast5855USEDMULTIPLEcast};
wire fifo32_writeOut;
RAM128X1D fifo32  (
  .WCLK(CLK),
  .D(fifo32_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo32_writeOut),
  .DPO(fifo32_READ_OUTPUT),
  .A(fifo32_writeInput[6:0]),
  .DPRA(unnamedcast6180USEDMULTIPLEcast));

  wire [7:0] fifo33_writeInput = {pushBack_input[32:32],unnamedcast5855USEDMULTIPLEcast};
wire fifo33_writeOut;
RAM128X1D fifo33  (
  .WCLK(CLK),
  .D(fifo33_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo33_writeOut),
  .DPO(fifo33_READ_OUTPUT),
  .A(fifo33_writeInput[6:0]),
  .DPRA(unnamedcast6180USEDMULTIPLEcast));

  wire [7:0] fifo34_writeInput = {pushBack_input[33:33],unnamedcast5855USEDMULTIPLEcast};
wire fifo34_writeOut;
RAM128X1D fifo34  (
  .WCLK(CLK),
  .D(fifo34_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo34_writeOut),
  .DPO(fifo34_READ_OUTPUT),
  .A(fifo34_writeInput[6:0]),
  .DPRA(unnamedcast6180USEDMULTIPLEcast));

  wire [7:0] fifo35_writeInput = {pushBack_input[34:34],unnamedcast5855USEDMULTIPLEcast};
wire fifo35_writeOut;
RAM128X1D fifo35  (
  .WCLK(CLK),
  .D(fifo35_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo35_writeOut),
  .DPO(fifo35_READ_OUTPUT),
  .A(fifo35_writeInput[6:0]),
  .DPRA(unnamedcast6180USEDMULTIPLEcast));

  wire [7:0] fifo36_writeInput = {pushBack_input[35:35],unnamedcast5855USEDMULTIPLEcast};
wire fifo36_writeOut;
RAM128X1D fifo36  (
  .WCLK(CLK),
  .D(fifo36_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo36_writeOut),
  .DPO(fifo36_READ_OUTPUT),
  .A(fifo36_writeInput[6:0]),
  .DPRA(unnamedcast6180USEDMULTIPLEcast));

  wire [7:0] fifo37_writeInput = {pushBack_input[36:36],unnamedcast5855USEDMULTIPLEcast};
wire fifo37_writeOut;
RAM128X1D fifo37  (
  .WCLK(CLK),
  .D(fifo37_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo37_writeOut),
  .DPO(fifo37_READ_OUTPUT),
  .A(fifo37_writeInput[6:0]),
  .DPRA(unnamedcast6180USEDMULTIPLEcast));

  wire [7:0] fifo38_writeInput = {pushBack_input[37:37],unnamedcast5855USEDMULTIPLEcast};
wire fifo38_writeOut;
RAM128X1D fifo38  (
  .WCLK(CLK),
  .D(fifo38_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo38_writeOut),
  .DPO(fifo38_READ_OUTPUT),
  .A(fifo38_writeInput[6:0]),
  .DPRA(unnamedcast6180USEDMULTIPLEcast));

  wire [7:0] fifo39_writeInput = {pushBack_input[38:38],unnamedcast5855USEDMULTIPLEcast};
wire fifo39_writeOut;
RAM128X1D fifo39  (
  .WCLK(CLK),
  .D(fifo39_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo39_writeOut),
  .DPO(fifo39_READ_OUTPUT),
  .A(fifo39_writeInput[6:0]),
  .DPRA(unnamedcast6180USEDMULTIPLEcast));

  wire [7:0] fifo40_writeInput = {pushBack_input[39:39],unnamedcast5855USEDMULTIPLEcast};
wire fifo40_writeOut;
RAM128X1D fifo40  (
  .WCLK(CLK),
  .D(fifo40_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo40_writeOut),
  .DPO(fifo40_READ_OUTPUT),
  .A(fifo40_writeInput[6:0]),
  .DPRA(unnamedcast6180USEDMULTIPLEcast));

  wire [7:0] fifo41_writeInput = {pushBack_input[40:40],unnamedcast5855USEDMULTIPLEcast};
wire fifo41_writeOut;
RAM128X1D fifo41  (
  .WCLK(CLK),
  .D(fifo41_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo41_writeOut),
  .DPO(fifo41_READ_OUTPUT),
  .A(fifo41_writeInput[6:0]),
  .DPRA(unnamedcast6180USEDMULTIPLEcast));

  wire [7:0] fifo42_writeInput = {pushBack_input[41:41],unnamedcast5855USEDMULTIPLEcast};
wire fifo42_writeOut;
RAM128X1D fifo42  (
  .WCLK(CLK),
  .D(fifo42_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo42_writeOut),
  .DPO(fifo42_READ_OUTPUT),
  .A(fifo42_writeInput[6:0]),
  .DPRA(unnamedcast6180USEDMULTIPLEcast));

  wire [7:0] fifo43_writeInput = {pushBack_input[42:42],unnamedcast5855USEDMULTIPLEcast};
wire fifo43_writeOut;
RAM128X1D fifo43  (
  .WCLK(CLK),
  .D(fifo43_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo43_writeOut),
  .DPO(fifo43_READ_OUTPUT),
  .A(fifo43_writeInput[6:0]),
  .DPRA(unnamedcast6180USEDMULTIPLEcast));

  wire [7:0] fifo44_writeInput = {pushBack_input[43:43],unnamedcast5855USEDMULTIPLEcast};
wire fifo44_writeOut;
RAM128X1D fifo44  (
  .WCLK(CLK),
  .D(fifo44_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo44_writeOut),
  .DPO(fifo44_READ_OUTPUT),
  .A(fifo44_writeInput[6:0]),
  .DPRA(unnamedcast6180USEDMULTIPLEcast));

  wire [7:0] fifo45_writeInput = {pushBack_input[44:44],unnamedcast5855USEDMULTIPLEcast};
wire fifo45_writeOut;
RAM128X1D fifo45  (
  .WCLK(CLK),
  .D(fifo45_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo45_writeOut),
  .DPO(fifo45_READ_OUTPUT),
  .A(fifo45_writeInput[6:0]),
  .DPRA(unnamedcast6180USEDMULTIPLEcast));

  wire [7:0] fifo46_writeInput = {pushBack_input[45:45],unnamedcast5855USEDMULTIPLEcast};
wire fifo46_writeOut;
RAM128X1D fifo46  (
  .WCLK(CLK),
  .D(fifo46_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo46_writeOut),
  .DPO(fifo46_READ_OUTPUT),
  .A(fifo46_writeInput[6:0]),
  .DPRA(unnamedcast6180USEDMULTIPLEcast));

  wire [7:0] fifo47_writeInput = {pushBack_input[46:46],unnamedcast5855USEDMULTIPLEcast};
wire fifo47_writeOut;
RAM128X1D fifo47  (
  .WCLK(CLK),
  .D(fifo47_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo47_writeOut),
  .DPO(fifo47_READ_OUTPUT),
  .A(fifo47_writeInput[6:0]),
  .DPRA(unnamedcast6180USEDMULTIPLEcast));

  wire [7:0] fifo48_writeInput = {pushBack_input[47:47],unnamedcast5855USEDMULTIPLEcast};
wire fifo48_writeOut;
RAM128X1D fifo48  (
  .WCLK(CLK),
  .D(fifo48_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo48_writeOut),
  .DPO(fifo48_READ_OUTPUT),
  .A(fifo48_writeInput[6:0]),
  .DPRA(unnamedcast6180USEDMULTIPLEcast));

  wire [7:0] fifo49_writeInput = {pushBack_input[48:48],unnamedcast5855USEDMULTIPLEcast};
wire fifo49_writeOut;
RAM128X1D fifo49  (
  .WCLK(CLK),
  .D(fifo49_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo49_writeOut),
  .DPO(fifo49_READ_OUTPUT),
  .A(fifo49_writeInput[6:0]),
  .DPRA(unnamedcast6180USEDMULTIPLEcast));

  wire [7:0] fifo50_writeInput = {pushBack_input[49:49],unnamedcast5855USEDMULTIPLEcast};
wire fifo50_writeOut;
RAM128X1D fifo50  (
  .WCLK(CLK),
  .D(fifo50_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo50_writeOut),
  .DPO(fifo50_READ_OUTPUT),
  .A(fifo50_writeInput[6:0]),
  .DPRA(unnamedcast6180USEDMULTIPLEcast));

  wire [7:0] fifo51_writeInput = {pushBack_input[50:50],unnamedcast5855USEDMULTIPLEcast};
wire fifo51_writeOut;
RAM128X1D fifo51  (
  .WCLK(CLK),
  .D(fifo51_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo51_writeOut),
  .DPO(fifo51_READ_OUTPUT),
  .A(fifo51_writeInput[6:0]),
  .DPRA(unnamedcast6180USEDMULTIPLEcast));

  wire [7:0] fifo52_writeInput = {pushBack_input[51:51],unnamedcast5855USEDMULTIPLEcast};
wire fifo52_writeOut;
RAM128X1D fifo52  (
  .WCLK(CLK),
  .D(fifo52_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo52_writeOut),
  .DPO(fifo52_READ_OUTPUT),
  .A(fifo52_writeInput[6:0]),
  .DPRA(unnamedcast6180USEDMULTIPLEcast));

  wire [7:0] fifo53_writeInput = {pushBack_input[52:52],unnamedcast5855USEDMULTIPLEcast};
wire fifo53_writeOut;
RAM128X1D fifo53  (
  .WCLK(CLK),
  .D(fifo53_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo53_writeOut),
  .DPO(fifo53_READ_OUTPUT),
  .A(fifo53_writeInput[6:0]),
  .DPRA(unnamedcast6180USEDMULTIPLEcast));

  wire [7:0] fifo54_writeInput = {pushBack_input[53:53],unnamedcast5855USEDMULTIPLEcast};
wire fifo54_writeOut;
RAM128X1D fifo54  (
  .WCLK(CLK),
  .D(fifo54_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo54_writeOut),
  .DPO(fifo54_READ_OUTPUT),
  .A(fifo54_writeInput[6:0]),
  .DPRA(unnamedcast6180USEDMULTIPLEcast));

  wire [7:0] fifo55_writeInput = {pushBack_input[54:54],unnamedcast5855USEDMULTIPLEcast};
wire fifo55_writeOut;
RAM128X1D fifo55  (
  .WCLK(CLK),
  .D(fifo55_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo55_writeOut),
  .DPO(fifo55_READ_OUTPUT),
  .A(fifo55_writeInput[6:0]),
  .DPRA(unnamedcast6180USEDMULTIPLEcast));

  wire [7:0] fifo56_writeInput = {pushBack_input[55:55],unnamedcast5855USEDMULTIPLEcast};
wire fifo56_writeOut;
RAM128X1D fifo56  (
  .WCLK(CLK),
  .D(fifo56_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo56_writeOut),
  .DPO(fifo56_READ_OUTPUT),
  .A(fifo56_writeInput[6:0]),
  .DPRA(unnamedcast6180USEDMULTIPLEcast));

  wire [7:0] fifo57_writeInput = {pushBack_input[56:56],unnamedcast5855USEDMULTIPLEcast};
wire fifo57_writeOut;
RAM128X1D fifo57  (
  .WCLK(CLK),
  .D(fifo57_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo57_writeOut),
  .DPO(fifo57_READ_OUTPUT),
  .A(fifo57_writeInput[6:0]),
  .DPRA(unnamedcast6180USEDMULTIPLEcast));

  wire [7:0] fifo58_writeInput = {pushBack_input[57:57],unnamedcast5855USEDMULTIPLEcast};
wire fifo58_writeOut;
RAM128X1D fifo58  (
  .WCLK(CLK),
  .D(fifo58_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo58_writeOut),
  .DPO(fifo58_READ_OUTPUT),
  .A(fifo58_writeInput[6:0]),
  .DPRA(unnamedcast6180USEDMULTIPLEcast));

  wire [7:0] fifo59_writeInput = {pushBack_input[58:58],unnamedcast5855USEDMULTIPLEcast};
wire fifo59_writeOut;
RAM128X1D fifo59  (
  .WCLK(CLK),
  .D(fifo59_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo59_writeOut),
  .DPO(fifo59_READ_OUTPUT),
  .A(fifo59_writeInput[6:0]),
  .DPRA(unnamedcast6180USEDMULTIPLEcast));

  wire [7:0] fifo60_writeInput = {pushBack_input[59:59],unnamedcast5855USEDMULTIPLEcast};
wire fifo60_writeOut;
RAM128X1D fifo60  (
  .WCLK(CLK),
  .D(fifo60_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo60_writeOut),
  .DPO(fifo60_READ_OUTPUT),
  .A(fifo60_writeInput[6:0]),
  .DPRA(unnamedcast6180USEDMULTIPLEcast));

  wire [7:0] fifo61_writeInput = {pushBack_input[60:60],unnamedcast5855USEDMULTIPLEcast};
wire fifo61_writeOut;
RAM128X1D fifo61  (
  .WCLK(CLK),
  .D(fifo61_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo61_writeOut),
  .DPO(fifo61_READ_OUTPUT),
  .A(fifo61_writeInput[6:0]),
  .DPRA(unnamedcast6180USEDMULTIPLEcast));

  wire [7:0] fifo62_writeInput = {pushBack_input[61:61],unnamedcast5855USEDMULTIPLEcast};
wire fifo62_writeOut;
RAM128X1D fifo62  (
  .WCLK(CLK),
  .D(fifo62_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo62_writeOut),
  .DPO(fifo62_READ_OUTPUT),
  .A(fifo62_writeInput[6:0]),
  .DPRA(unnamedcast6180USEDMULTIPLEcast));

  wire [7:0] fifo63_writeInput = {pushBack_input[62:62],unnamedcast5855USEDMULTIPLEcast};
wire fifo63_writeOut;
RAM128X1D fifo63  (
  .WCLK(CLK),
  .D(fifo63_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo63_writeOut),
  .DPO(fifo63_READ_OUTPUT),
  .A(fifo63_writeInput[6:0]),
  .DPRA(unnamedcast6180USEDMULTIPLEcast));

  wire [7:0] fifo64_writeInput = {pushBack_input[63:63],unnamedcast5855USEDMULTIPLEcast};
wire fifo64_writeOut;
RAM128X1D fifo64  (
  .WCLK(CLK),
  .D(fifo64_writeInput[7]),
  .WE(pushBack_valid && CE_push),
  .SPO(fifo64_writeOut),
  .DPO(fifo64_READ_OUTPUT),
  .A(fifo64_writeInput[6:0]),
  .DPRA(unnamedcast6180USEDMULTIPLEcast));

endmodule

module fifo_SIZE128_uint8_4_1__2_1__Wnil_Hnil_Tnil_BYTES1024(input CLK, input load_valid, input load_CE, output [64:0] load_output, input store_reset_valid, input store_CE, output store_ready, input load_reset_valid, input store_valid, input [63:0] store_input);
parameter INSTANCE_NAME="INST";
always @(posedge CLK) begin if(load_valid===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'load'", INSTANCE_NAME);  end end
always @(posedge CLK) begin if(store_reset_valid===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'store_reset'", INSTANCE_NAME);  end end
always @(posedge CLK) begin if(load_reset_valid===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'load_reset'", INSTANCE_NAME);  end end
always @(posedge CLK) begin if(store_valid===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'store'", INSTANCE_NAME);  end end
  wire FIFO_hasData;
  wire [63:0] FIFO_popFront;
  assign load_output = {FIFO_hasData,FIFO_popFront};
  wire FIFO_ready;
  assign store_ready = FIFO_ready;
  // function: load pure=false delay=0
  // function: store_reset pure=false delay=0
  // function: store_ready pure=true delay=0
  // function: load_reset pure=false delay=0
  // function: store pure=false delay=0
  fifo_uint8_4_1__2_1__128 #(.INSTANCE_NAME({INSTANCE_NAME,"_FIFO"})) FIFO(.CLK(CLK), .popFront_valid({(FIFO_hasData&&load_valid)}), .CE_pop(load_CE), .popFront(FIFO_popFront), .size(FIFO_size), .pushBackReset_valid(store_reset_valid), .CE_push(store_CE), .ready(FIFO_ready), .pushBack_valid(store_valid), .pushBack_input(store_input), .popFrontReset_valid(load_reset_valid), .hasData(FIFO_hasData));
endmodule

module LiftDecimate_fifo_SIZE128_uint8_4_1__2_1__Wnil_Hnil_Tnil_BYTES1024(input CLK, input load_valid, input load_CE, input load_input, output [64:0] load_output, input store_reset_valid, input store_CE, output store_ready, output load_ready, input load_reset, input store_valid, input [63:0] store_input);
parameter INSTANCE_NAME="INST";
always @(posedge CLK) begin if(load_valid===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'load'", INSTANCE_NAME);  end end
always @(posedge CLK) begin if(store_reset_valid===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'store_reset'", INSTANCE_NAME);  end end
always @(posedge CLK) begin if(load_reset===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'load_reset'", INSTANCE_NAME);  end end
always @(posedge CLK) begin if(store_valid===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'store'", INSTANCE_NAME);  end end
  wire unnamedcast7279USEDMULTIPLEcast;assign unnamedcast7279USEDMULTIPLEcast = load_input; 
  wire [64:0] LiftDecimate_load_output;
  reg [63:0] unnamedcast7282_delay1_validunnamednull0_CEload_CE;  always @ (posedge CLK) begin if (load_CE) begin unnamedcast7282_delay1_validunnamednull0_CEload_CE <= (LiftDecimate_load_output[63:0]); end end
  reg unnamedbinop7287_delay1_validunnamednull0_CEload_CE;  always @ (posedge CLK) begin if (load_CE) begin unnamedbinop7287_delay1_validunnamednull0_CEload_CE <= {((LiftDecimate_load_output[64])&&unnamedcast7279USEDMULTIPLEcast)}; end end
  assign load_output = {unnamedbinop7287_delay1_validunnamednull0_CEload_CE,unnamedcast7282_delay1_validunnamednull0_CEload_CE};
  wire LiftDecimate_store_ready;
  assign store_ready = LiftDecimate_store_ready;
  assign load_ready = (1'd1);
  // function: load pure=false delay=1
  // function: store_reset pure=false delay=0
  // function: store_ready pure=true delay=0
  // function: load_ready pure=true delay=0
  // function: load_reset pure=false delay=0
  // function: store pure=false delay=0
  fifo_SIZE128_uint8_4_1__2_1__Wnil_Hnil_Tnil_BYTES1024 #(.INSTANCE_NAME({INSTANCE_NAME,"_LiftDecimate"})) LiftDecimate(.CLK(CLK), .load_valid({(unnamedcast7279USEDMULTIPLEcast&&load_valid)}), .load_CE(load_CE), .load_output(LiftDecimate_load_output), .store_reset_valid(store_reset_valid), .store_CE(store_CE), .store_ready(LiftDecimate_store_ready), .load_reset_valid(load_reset), .store_valid(store_valid), .store_input(store_input));
endmodule

module RunIffReady_LiftDecimate_fifo_SIZE128_uint8_4_1__2_1__Wnil_Hnil_Tnil_BYTES1024(input CLK, input load_valid, input load_CE, input load_input, output [64:0] load_output, input store_reset, input CE, output store_ready, output load_ready, input load_reset, input store_valid, input [64:0] store_input, output store_output);
parameter INSTANCE_NAME="INST";
always @(posedge CLK) begin if(load_valid===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'load'", INSTANCE_NAME);  end end
always @(posedge CLK) begin if(store_reset===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'store_reset'", INSTANCE_NAME);  end end
always @(posedge CLK) begin if(load_reset===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'load_reset'", INSTANCE_NAME);  end end
always @(posedge CLK) begin if(store_valid===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'store'", INSTANCE_NAME);  end end
  wire [64:0] RunIffReady_load_output;
  assign load_output = RunIffReady_load_output;
  wire RunIffReady_store_ready;
  assign store_ready = RunIffReady_store_ready;
  wire RunIffReady_load_ready;
  assign load_ready = RunIffReady_load_ready;
  wire unnamedbinop7358USEDMULTIPLEbinop;assign unnamedbinop7358USEDMULTIPLEbinop = {({(RunIffReady_store_ready&&(store_input[64]))}&&store_valid)}; 
  assign store_output = {unnamedbinop7358USEDMULTIPLEbinop};
  // function: load pure=false delay=1
  // function: store_reset pure=false delay=0
  // function: store_ready pure=true delay=0
  // function: load_ready pure=true delay=0
  // function: load_reset pure=false delay=0
  // function: store pure=false delay=0
  LiftDecimate_fifo_SIZE128_uint8_4_1__2_1__Wnil_Hnil_Tnil_BYTES1024 #(.INSTANCE_NAME({INSTANCE_NAME,"_RunIffReady"})) RunIffReady(.CLK(CLK), .load_valid(load_valid), .load_CE(load_CE), .load_input(load_input), .load_output(RunIffReady_load_output), .store_reset_valid(store_reset), .store_CE(CE), .store_ready(RunIffReady_store_ready), .load_ready(RunIffReady_load_ready), .load_reset(load_reset), .store_valid(unnamedbinop7358USEDMULTIPLEbinop), .store_input((store_input[63:0])));
endmodule

module LiftHandshake_RunIffReady_LiftDecimate_fifo_SIZE128_uint8_4_1__2_1__Wnil_Hnil_Tnil_BYTES1024(input CLK, input load_input, output [64:0] load_output, input store_reset, input store_ready_downstream, output store_ready, input load_ready_downstream, output load_ready, input load_reset, input [64:0] store_input, output store_output);
parameter INSTANCE_NAME="INST";
parameter OUTPUT_COUNT=0;
parameter INPUT_COUNT=0;
  wire unnamedunary7395USEDMULTIPLEunary;assign unnamedunary7395USEDMULTIPLEunary = {(~load_reset)}; 
  wire unnamedbinop7394USEDMULTIPLEbinop;assign unnamedbinop7394USEDMULTIPLEbinop = {(load_reset||load_ready_downstream)}; 
  wire [64:0] inner_RunIffReady_LiftDecimate_fifo_SIZE128_uint8_4_1__2_1__Wnil_Hnil_Tnil_BYTES1024_load_output;
  wire load_validBitDelay_RunIffReady_LiftDecimate_fifo_SIZE128_uint8_4_1__2_1__Wnil_Hnil_Tnil_BYTES1024_pushPop_out;
  wire [64:0] unnamedtuple7405USEDMULTIPLEtuple;assign unnamedtuple7405USEDMULTIPLEtuple = {{((inner_RunIffReady_LiftDecimate_fifo_SIZE128_uint8_4_1__2_1__Wnil_Hnil_Tnil_BYTES1024_load_output[64])&&load_validBitDelay_RunIffReady_LiftDecimate_fifo_SIZE128_uint8_4_1__2_1__Wnil_Hnil_Tnil_BYTES1024_pushPop_out)},(inner_RunIffReady_LiftDecimate_fifo_SIZE128_uint8_4_1__2_1__Wnil_Hnil_Tnil_BYTES1024_load_output[63:0])}; 
  always @(posedge CLK) begin if({(~{((unnamedtuple7405USEDMULTIPLEtuple[64])===1'bx)})} == 1'b0 && (1'd1)==1'b1) begin $display("%s: LiftHandshake: output valid bit should not be X!",INSTANCE_NAME); end end
  always @(posedge CLK) begin if({(~{(load_input===1'bx)})} == 1'b0 && (1'd1)==1'b1) begin $display("%s: LiftHandshake: input valid bit should not be X!",INSTANCE_NAME); end end
  assign load_output = unnamedtuple7405USEDMULTIPLEtuple;
  wire unnamedbinop7423USEDMULTIPLEbinop;assign unnamedbinop7423USEDMULTIPLEbinop = {(store_reset||store_ready_downstream)}; 
  wire inner_RunIffReady_LiftDecimate_fifo_SIZE128_uint8_4_1__2_1__Wnil_Hnil_Tnil_BYTES1024_store_ready;
  assign store_ready = {(inner_RunIffReady_LiftDecimate_fifo_SIZE128_uint8_4_1__2_1__Wnil_Hnil_Tnil_BYTES1024_store_ready&&store_ready_downstream)};
  wire inner_RunIffReady_LiftDecimate_fifo_SIZE128_uint8_4_1__2_1__Wnil_Hnil_Tnil_BYTES1024_load_ready;
  assign load_ready = {(inner_RunIffReady_LiftDecimate_fifo_SIZE128_uint8_4_1__2_1__Wnil_Hnil_Tnil_BYTES1024_load_ready&&load_ready_downstream)};
  wire unnamedunary7424USEDMULTIPLEunary;assign unnamedunary7424USEDMULTIPLEunary = {(~store_reset)}; 
  wire [0:0] inner_RunIffReady_LiftDecimate_fifo_SIZE128_uint8_4_1__2_1__Wnil_Hnil_Tnil_BYTES1024_store_output;
  wire store_validBitDelay_RunIffReady_LiftDecimate_fifo_SIZE128_uint8_4_1__2_1__Wnil_Hnil_Tnil_BYTES1024_pushPop_out;
  wire [0:0] unnamedtuple7434USEDMULTIPLEtuple;assign unnamedtuple7434USEDMULTIPLEtuple = {{(inner_RunIffReady_LiftDecimate_fifo_SIZE128_uint8_4_1__2_1__Wnil_Hnil_Tnil_BYTES1024_store_output&&store_validBitDelay_RunIffReady_LiftDecimate_fifo_SIZE128_uint8_4_1__2_1__Wnil_Hnil_Tnil_BYTES1024_pushPop_out)}}; 
  always @(posedge CLK) begin if({(~{(unnamedtuple7434USEDMULTIPLEtuple===1'bx)})} == 1'b0 && (1'd1)==1'b1) begin $display("%s: LiftHandshake: output valid bit should not be X!",INSTANCE_NAME); end end
  always @(posedge CLK) begin if({(~{((store_input[64])===1'bx)})} == 1'b0 && (1'd1)==1'b1) begin $display("%s: LiftHandshake: input valid bit should not be X!",INSTANCE_NAME); end end
  assign store_output = unnamedtuple7434USEDMULTIPLEtuple;
  // function: load pure=false ONLY WIRE
  // function: store_reset pure=false ONLY WIRE
  // function: store_ready pure=true ONLY WIRE
  // function: load_ready pure=true ONLY WIRE
  // function: load_reset pure=false ONLY WIRE
  // function: store pure=false ONLY WIRE
  RunIffReady_LiftDecimate_fifo_SIZE128_uint8_4_1__2_1__Wnil_Hnil_Tnil_BYTES1024 #(.INSTANCE_NAME({INSTANCE_NAME,"_inner_RunIffReady_LiftDecimate_fifo_SIZE128_uint8_4_1__2_1__Wnil_Hnil_Tnil_BYTES1024"})) inner_RunIffReady_LiftDecimate_fifo_SIZE128_uint8_4_1__2_1__Wnil_Hnil_Tnil_BYTES1024(.CLK(CLK), .load_valid(unnamedunary7395USEDMULTIPLEunary), .load_CE(unnamedbinop7394USEDMULTIPLEbinop), .load_input(load_input), .load_output(inner_RunIffReady_LiftDecimate_fifo_SIZE128_uint8_4_1__2_1__Wnil_Hnil_Tnil_BYTES1024_load_output), .store_reset(store_reset), .CE(unnamedbinop7423USEDMULTIPLEbinop), .store_ready(inner_RunIffReady_LiftDecimate_fifo_SIZE128_uint8_4_1__2_1__Wnil_Hnil_Tnil_BYTES1024_store_ready), .load_ready(inner_RunIffReady_LiftDecimate_fifo_SIZE128_uint8_4_1__2_1__Wnil_Hnil_Tnil_BYTES1024_load_ready), .load_reset(load_reset), .store_valid(unnamedunary7424USEDMULTIPLEunary), .store_input(store_input), .store_output(inner_RunIffReady_LiftDecimate_fifo_SIZE128_uint8_4_1__2_1__Wnil_Hnil_Tnil_BYTES1024_store_output));
  ShiftRegister_1_CEtrue_TY1 #(.INSTANCE_NAME({INSTANCE_NAME,"_load_validBitDelay_RunIffReady_LiftDecimate_fifo_SIZE128_uint8_4_1__2_1__Wnil_Hnil_Tnil_BYTES1024"})) load_validBitDelay_RunIffReady_LiftDecimate_fifo_SIZE128_uint8_4_1__2_1__Wnil_Hnil_Tnil_BYTES1024(.CLK(CLK), .pushPop_valid(unnamedunary7395USEDMULTIPLEunary), .CE(unnamedbinop7394USEDMULTIPLEbinop), .sr_input((1'd1)), .pushPop_out(load_validBitDelay_RunIffReady_LiftDecimate_fifo_SIZE128_uint8_4_1__2_1__Wnil_Hnil_Tnil_BYTES1024_pushPop_out), .reset(load_reset));
  ShiftRegister_0_CEtrue_TY1 #(.INSTANCE_NAME({INSTANCE_NAME,"_store_validBitDelay_RunIffReady_LiftDecimate_fifo_SIZE128_uint8_4_1__2_1__Wnil_Hnil_Tnil_BYTES1024"})) store_validBitDelay_RunIffReady_LiftDecimate_fifo_SIZE128_uint8_4_1__2_1__Wnil_Hnil_Tnil_BYTES1024(.CLK(CLK), .CE(unnamedbinop7423USEDMULTIPLEbinop), .sr_input((1'd1)), .pushPop_out(store_validBitDelay_RunIffReady_LiftDecimate_fifo_SIZE128_uint8_4_1__2_1__Wnil_Hnil_Tnil_BYTES1024_pushPop_out));
endmodule

module incif_wrapuint32_646_inc2(input CLK, input CE, input [32:0] process_input, output [31:0] process_output);
parameter INSTANCE_NAME="INST";
  wire [31:0] unnamedcast61USEDMULTIPLEcast;assign unnamedcast61USEDMULTIPLEcast = (process_input[31:0]); 
  assign process_output = (((process_input[32]))?((({(unnamedcast61USEDMULTIPLEcast==(32'd646))})?((32'd0)):({(unnamedcast61USEDMULTIPLEcast+(32'd2))}))):(unnamedcast61USEDMULTIPLEcast));
  // function: process pure=true delay=0
endmodule

module RegBy_incif_wrapuint32_646_inc2_CEtrue_init0(input CLK, input set_valid, input CE, input [31:0] set_inp, input setby_valid, input setby_inp, output [31:0] SETBY_OUTPUT, output [31:0] GET_OUTPUT);
parameter INSTANCE_NAME="INST";
  reg [31:0] R = 32'd0;
  wire [31:0] regby_inner_process_output;
  always @(posedge CLK) begin if(set_valid===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'R' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if(setby_valid===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'R' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if((({4'b0,set_valid})+({4'b0,setby_valid})) > 5'd1) begin $display("error, function 'set' on instance 'R' in module '%s' has multiple valid bits active in same cycle!",INSTANCE_NAME);$finish(); end end
  wire [32:0] unnamedcallArbitrate112USEDMULTIPLEcallArbitrate;assign unnamedcallArbitrate112USEDMULTIPLEcallArbitrate = {(set_valid||setby_valid),((set_valid)?(set_inp):(regby_inner_process_output))}; 
    always @ (posedge CLK) begin if ((unnamedcallArbitrate112USEDMULTIPLEcallArbitrate[32]) && CE) begin R <= (unnamedcallArbitrate112USEDMULTIPLEcallArbitrate[31:0]); end end
  assign SETBY_OUTPUT = regby_inner_process_output;
  assign GET_OUTPUT = R;
  // function: set pure=false ONLY WIRE
  // function: setby pure=false ONLY WIRE
  // function: get pure=true ONLY WIRE
  incif_wrapuint32_646_inc2 #(.INSTANCE_NAME({INSTANCE_NAME,"_regby_inner"})) regby_inner(.CLK(CLK), .CE(CE), .process_input({setby_inp,R}), .process_output(regby_inner_process_output));
endmodule

module incif_wrapuint16_481_incnil(input CLK, input CE, input [16:0] process_input, output [15:0] process_output);
parameter INSTANCE_NAME="INST";
  wire [15:0] unnamedcast119USEDMULTIPLEcast;assign unnamedcast119USEDMULTIPLEcast = (process_input[15:0]); 
  assign process_output = (((process_input[16]))?((({(unnamedcast119USEDMULTIPLEcast==(16'd481))})?((16'd0)):({(unnamedcast119USEDMULTIPLEcast+(16'd1))}))):(unnamedcast119USEDMULTIPLEcast));
  // function: process pure=true delay=0
endmodule

module RegBy_incif_wrapuint16_481_incnil_CEtrue_init0(input CLK, input set_valid, input CE, input [15:0] set_inp, input setby_valid, input setby_inp, output [15:0] SETBY_OUTPUT, output [15:0] GET_OUTPUT);
parameter INSTANCE_NAME="INST";
  reg [15:0] R = 16'd0;
  wire [15:0] regby_inner_process_output;
  always @(posedge CLK) begin if(set_valid===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'R' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if(setby_valid===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'R' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if((({4'b0,set_valid})+({4'b0,setby_valid})) > 5'd1) begin $display("error, function 'set' on instance 'R' in module '%s' has multiple valid bits active in same cycle!",INSTANCE_NAME);$finish(); end end
  wire [16:0] unnamedcallArbitrate170USEDMULTIPLEcallArbitrate;assign unnamedcallArbitrate170USEDMULTIPLEcallArbitrate = {(set_valid||setby_valid),((set_valid)?(set_inp):(regby_inner_process_output))}; 
    always @ (posedge CLK) begin if ((unnamedcallArbitrate170USEDMULTIPLEcallArbitrate[16]) && CE) begin R <= (unnamedcallArbitrate170USEDMULTIPLEcallArbitrate[15:0]); end end
  assign SETBY_OUTPUT = regby_inner_process_output;
  assign GET_OUTPUT = R;
  // function: set pure=false ONLY WIRE
  // function: setby pure=false ONLY WIRE
  // function: get pure=true ONLY WIRE
  incif_wrapuint16_481_incnil #(.INSTANCE_NAME({INSTANCE_NAME,"_regby_inner"})) regby_inner(.CLK(CLK), .CE(CE), .process_input({setby_inp,R}), .process_output(regby_inner_process_output));
endmodule

module PadSeq_uint8_W640_H480_L4_R4_B1_Top1_T22(input CLK, output ready, input reset, input CE, input process_valid, input [15:0] process_input, output [16:0] process_output);
parameter INSTANCE_NAME="INST";
always @(posedge CLK) begin if(reset===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'reset'", INSTANCE_NAME);  end end
always @(posedge CLK) begin if(process_valid===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'process'", INSTANCE_NAME);  end end
  wire [31:0] posX_padSeq_GET_OUTPUT;
  wire [15:0] posY_padSeq_GET_OUTPUT;
  wire unnamedbinop194USEDMULTIPLEbinop;assign unnamedbinop194USEDMULTIPLEbinop = {({({((posX_padSeq_GET_OUTPUT)>=((32'd4)))}&&{((posX_padSeq_GET_OUTPUT)<((32'd644)))})}&&{({((posY_padSeq_GET_OUTPUT)>=((16'd1)))}&&{((posY_padSeq_GET_OUTPUT)<((16'd481)))})})}; 
  assign ready = unnamedbinop194USEDMULTIPLEbinop;
  reg [15:0] unnamedselect206_delay1_validunnamednull0_CECE;  always @ (posedge CLK) begin if (CE) begin unnamedselect206_delay1_validunnamednull0_CECE <= ((unnamedbinop194USEDMULTIPLEbinop)?(process_input):({(8'd0),(8'd0)})); end end
  wire [15:0] posY_padSeq_SETBY_OUTPUT;
  wire [31:0] posX_padSeq_SETBY_OUTPUT;
  assign process_output = {(1'd1),unnamedselect206_delay1_validunnamednull0_CECE};
  // function: ready pure=true delay=0
  // function: reset pure=false delay=0
  // function: process pure=false delay=1
  RegBy_incif_wrapuint32_646_inc2_CEtrue_init0 #(.INSTANCE_NAME({INSTANCE_NAME,"_posX_padSeq"})) posX_padSeq(.CLK(CLK), .set_valid(reset), .CE(CE), .set_inp((32'd0)), .setby_valid(process_valid), .setby_inp((1'd1)), .SETBY_OUTPUT(posX_padSeq_SETBY_OUTPUT), .GET_OUTPUT(posX_padSeq_GET_OUTPUT));
  RegBy_incif_wrapuint16_481_incnil_CEtrue_init0 #(.INSTANCE_NAME({INSTANCE_NAME,"_posY_padSeq"})) posY_padSeq(.CLK(CLK), .set_valid(reset), .CE(CE), .set_inp((16'd0)), .setby_valid(process_valid), .setby_inp({(posX_padSeq_GET_OUTPUT==(32'd646))}), .SETBY_OUTPUT(posY_padSeq_SETBY_OUTPUT), .GET_OUTPUT(posY_padSeq_GET_OUTPUT));
endmodule

module WaitOnInput_PadSeq_uint8_W640_H480_L4_R4_B1_Top1_T22(input CLK, output ready, input reset, input CE, input process_valid, input [16:0] process_input, output [16:0] process_output);
parameter INSTANCE_NAME="INST";
always @(posedge CLK) begin if(reset===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'reset'", INSTANCE_NAME);  end end
always @(posedge CLK) begin if(process_valid===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'process'", INSTANCE_NAME);  end end
  wire WaitOnInput_inner_ready;
  assign ready = WaitOnInput_inner_ready;
  wire unnamedbinop308USEDMULTIPLEbinop;assign unnamedbinop308USEDMULTIPLEbinop = {({({(~WaitOnInput_inner_ready)}||(process_input[16]))}&&process_valid)}; 
  wire [16:0] WaitOnInput_inner_process_output;
  reg unnamedbinop308_delay1_validunnamednull0_CECE;  always @ (posedge CLK) begin if (CE) begin unnamedbinop308_delay1_validunnamednull0_CECE <= unnamedbinop308USEDMULTIPLEbinop; end end
  assign process_output = {{((WaitOnInput_inner_process_output[16])&&unnamedbinop308_delay1_validunnamednull0_CECE)},(WaitOnInput_inner_process_output[15:0])};
  // function: ready pure=true delay=0
  // function: reset pure=false delay=0
  // function: process pure=false delay=1
  PadSeq_uint8_W640_H480_L4_R4_B1_Top1_T22 #(.INSTANCE_NAME({INSTANCE_NAME,"_WaitOnInput_inner"})) WaitOnInput_inner(.CLK(CLK), .ready(WaitOnInput_inner_ready), .reset(reset), .CE(CE), .process_valid(unnamedbinop308USEDMULTIPLEbinop), .process_input((process_input[15:0])), .process_output(WaitOnInput_inner_process_output));
endmodule

module LiftHandshake_WaitOnInput_PadSeq_uint8_W640_H480_L4_R4_B1_Top1_T22(input CLK, input ready_downstream, output ready, input reset, input [16:0] process_input, output [16:0] process_output);
parameter INSTANCE_NAME="INST";
parameter OUTPUT_COUNT=0;
parameter INPUT_COUNT=0;
  wire inner_WaitOnInput_PadSeq_uint8_W640_H480_L4_R4_B1_Top1_T22_ready;
  assign ready = {(inner_WaitOnInput_PadSeq_uint8_W640_H480_L4_R4_B1_Top1_T22_ready&&ready_downstream)};
  wire unnamedbinop343USEDMULTIPLEbinop;assign unnamedbinop343USEDMULTIPLEbinop = {(reset||ready_downstream)}; 
  wire unnamedunary344USEDMULTIPLEunary;assign unnamedunary344USEDMULTIPLEunary = {(~reset)}; 
  wire [16:0] inner_WaitOnInput_PadSeq_uint8_W640_H480_L4_R4_B1_Top1_T22_process_output;
  wire validBitDelay_WaitOnInput_PadSeq_uint8_W640_H480_L4_R4_B1_Top1_T22_pushPop_out;
  wire [16:0] unnamedtuple376USEDMULTIPLEtuple;assign unnamedtuple376USEDMULTIPLEtuple = {{((inner_WaitOnInput_PadSeq_uint8_W640_H480_L4_R4_B1_Top1_T22_process_output[16])&&validBitDelay_WaitOnInput_PadSeq_uint8_W640_H480_L4_R4_B1_Top1_T22_pushPop_out)},(inner_WaitOnInput_PadSeq_uint8_W640_H480_L4_R4_B1_Top1_T22_process_output[15:0])}; 
  always @(posedge CLK) begin if({(~{((unnamedtuple376USEDMULTIPLEtuple[16])===1'bx)})} == 1'b0 && (1'd1)==1'b1) begin $display("%s: LiftHandshake: output valid bit should not be X!",INSTANCE_NAME); end end
  always @(posedge CLK) begin if({(~{((process_input[16])===1'bx)})} == 1'b0 && (1'd1)==1'b1) begin $display("%s: LiftHandshake: input valid bit should not be X!",INSTANCE_NAME); end end
  assign process_output = unnamedtuple376USEDMULTIPLEtuple;
  // function: ready pure=true ONLY WIRE
  // function: reset pure=false ONLY WIRE
  // function: process pure=false ONLY WIRE
  WaitOnInput_PadSeq_uint8_W640_H480_L4_R4_B1_Top1_T22 #(.INSTANCE_NAME({INSTANCE_NAME,"_inner_WaitOnInput_PadSeq_uint8_W640_H480_L4_R4_B1_Top1_T22"})) inner_WaitOnInput_PadSeq_uint8_W640_H480_L4_R4_B1_Top1_T22(.CLK(CLK), .ready(inner_WaitOnInput_PadSeq_uint8_W640_H480_L4_R4_B1_Top1_T22_ready), .reset(reset), .CE(unnamedbinop343USEDMULTIPLEbinop), .process_valid(unnamedunary344USEDMULTIPLEunary), .process_input(process_input), .process_output(inner_WaitOnInput_PadSeq_uint8_W640_H480_L4_R4_B1_Top1_T22_process_output));
  ShiftRegister_1_CEtrue_TY1 #(.INSTANCE_NAME({INSTANCE_NAME,"_validBitDelay_WaitOnInput_PadSeq_uint8_W640_H480_L4_R4_B1_Top1_T22"})) validBitDelay_WaitOnInput_PadSeq_uint8_W640_H480_L4_R4_B1_Top1_T22(.CLK(CLK), .pushPop_valid(unnamedunary344USEDMULTIPLEunary), .CE(unnamedbinop343USEDMULTIPLEbinop), .sr_input((1'd1)), .pushPop_out(validBitDelay_WaitOnInput_PadSeq_uint8_W640_H480_L4_R4_B1_Top1_T22_pushPop_out), .reset(reset));
endmodule

module ShiftRegister_32_CEtrue_TY1(input CLK, input pushPop_valid, input CE, input sr_input, output pushPop_out, input reset);
parameter INSTANCE_NAME="INST";
always @(posedge CLK) begin if(pushPop_valid===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'pushPop'", INSTANCE_NAME);  end end
always @(posedge CLK) begin if(reset===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'reset'", INSTANCE_NAME);  end end
  reg SR32;
  always @(posedge CLK) begin if(pushPop_valid===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR1' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if(reset===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR1' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if((({4'b0,pushPop_valid})+({4'b0,reset})) > 5'd1) begin $display("error, function 'set' on instance 'SR1' in module '%s' has multiple valid bits active in same cycle!",INSTANCE_NAME);$finish(); end end
  wire [1:0] unnamedcallArbitrate5284USEDMULTIPLEcallArbitrate;assign unnamedcallArbitrate5284USEDMULTIPLEcallArbitrate = {(pushPop_valid||reset),((pushPop_valid)?(sr_input):((1'd0)))}; 
  reg SR1;  always @ (posedge CLK) begin if ((unnamedcallArbitrate5284USEDMULTIPLEcallArbitrate[1]) && CE) begin SR1 <= (unnamedcallArbitrate5284USEDMULTIPLEcallArbitrate[0]); end end
  always @(posedge CLK) begin if(pushPop_valid===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR2' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if(reset===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR2' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if((({4'b0,pushPop_valid})+({4'b0,reset})) > 5'd1) begin $display("error, function 'set' on instance 'SR2' in module '%s' has multiple valid bits active in same cycle!",INSTANCE_NAME);$finish(); end end
  wire [1:0] unnamedcallArbitrate5290USEDMULTIPLEcallArbitrate;assign unnamedcallArbitrate5290USEDMULTIPLEcallArbitrate = {(pushPop_valid||reset),((pushPop_valid)?(SR1):((1'd0)))}; 
  reg SR2;  always @ (posedge CLK) begin if ((unnamedcallArbitrate5290USEDMULTIPLEcallArbitrate[1]) && CE) begin SR2 <= (unnamedcallArbitrate5290USEDMULTIPLEcallArbitrate[0]); end end
  always @(posedge CLK) begin if(pushPop_valid===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR3' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if(reset===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR3' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if((({4'b0,pushPop_valid})+({4'b0,reset})) > 5'd1) begin $display("error, function 'set' on instance 'SR3' in module '%s' has multiple valid bits active in same cycle!",INSTANCE_NAME);$finish(); end end
  wire [1:0] unnamedcallArbitrate5296USEDMULTIPLEcallArbitrate;assign unnamedcallArbitrate5296USEDMULTIPLEcallArbitrate = {(pushPop_valid||reset),((pushPop_valid)?(SR2):((1'd0)))}; 
  reg SR3;  always @ (posedge CLK) begin if ((unnamedcallArbitrate5296USEDMULTIPLEcallArbitrate[1]) && CE) begin SR3 <= (unnamedcallArbitrate5296USEDMULTIPLEcallArbitrate[0]); end end
  always @(posedge CLK) begin if(pushPop_valid===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR4' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if(reset===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR4' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if((({4'b0,pushPop_valid})+({4'b0,reset})) > 5'd1) begin $display("error, function 'set' on instance 'SR4' in module '%s' has multiple valid bits active in same cycle!",INSTANCE_NAME);$finish(); end end
  wire [1:0] unnamedcallArbitrate5302USEDMULTIPLEcallArbitrate;assign unnamedcallArbitrate5302USEDMULTIPLEcallArbitrate = {(pushPop_valid||reset),((pushPop_valid)?(SR3):((1'd0)))}; 
  reg SR4;  always @ (posedge CLK) begin if ((unnamedcallArbitrate5302USEDMULTIPLEcallArbitrate[1]) && CE) begin SR4 <= (unnamedcallArbitrate5302USEDMULTIPLEcallArbitrate[0]); end end
  always @(posedge CLK) begin if(pushPop_valid===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR5' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if(reset===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR5' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if((({4'b0,pushPop_valid})+({4'b0,reset})) > 5'd1) begin $display("error, function 'set' on instance 'SR5' in module '%s' has multiple valid bits active in same cycle!",INSTANCE_NAME);$finish(); end end
  wire [1:0] unnamedcallArbitrate5308USEDMULTIPLEcallArbitrate;assign unnamedcallArbitrate5308USEDMULTIPLEcallArbitrate = {(pushPop_valid||reset),((pushPop_valid)?(SR4):((1'd0)))}; 
  reg SR5;  always @ (posedge CLK) begin if ((unnamedcallArbitrate5308USEDMULTIPLEcallArbitrate[1]) && CE) begin SR5 <= (unnamedcallArbitrate5308USEDMULTIPLEcallArbitrate[0]); end end
  always @(posedge CLK) begin if(pushPop_valid===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR6' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if(reset===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR6' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if((({4'b0,pushPop_valid})+({4'b0,reset})) > 5'd1) begin $display("error, function 'set' on instance 'SR6' in module '%s' has multiple valid bits active in same cycle!",INSTANCE_NAME);$finish(); end end
  wire [1:0] unnamedcallArbitrate5314USEDMULTIPLEcallArbitrate;assign unnamedcallArbitrate5314USEDMULTIPLEcallArbitrate = {(pushPop_valid||reset),((pushPop_valid)?(SR5):((1'd0)))}; 
  reg SR6;  always @ (posedge CLK) begin if ((unnamedcallArbitrate5314USEDMULTIPLEcallArbitrate[1]) && CE) begin SR6 <= (unnamedcallArbitrate5314USEDMULTIPLEcallArbitrate[0]); end end
  always @(posedge CLK) begin if(pushPop_valid===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR7' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if(reset===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR7' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if((({4'b0,pushPop_valid})+({4'b0,reset})) > 5'd1) begin $display("error, function 'set' on instance 'SR7' in module '%s' has multiple valid bits active in same cycle!",INSTANCE_NAME);$finish(); end end
  wire [1:0] unnamedcallArbitrate5320USEDMULTIPLEcallArbitrate;assign unnamedcallArbitrate5320USEDMULTIPLEcallArbitrate = {(pushPop_valid||reset),((pushPop_valid)?(SR6):((1'd0)))}; 
  reg SR7;  always @ (posedge CLK) begin if ((unnamedcallArbitrate5320USEDMULTIPLEcallArbitrate[1]) && CE) begin SR7 <= (unnamedcallArbitrate5320USEDMULTIPLEcallArbitrate[0]); end end
  always @(posedge CLK) begin if(pushPop_valid===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR8' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if(reset===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR8' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if((({4'b0,pushPop_valid})+({4'b0,reset})) > 5'd1) begin $display("error, function 'set' on instance 'SR8' in module '%s' has multiple valid bits active in same cycle!",INSTANCE_NAME);$finish(); end end
  wire [1:0] unnamedcallArbitrate5326USEDMULTIPLEcallArbitrate;assign unnamedcallArbitrate5326USEDMULTIPLEcallArbitrate = {(pushPop_valid||reset),((pushPop_valid)?(SR7):((1'd0)))}; 
  reg SR8;  always @ (posedge CLK) begin if ((unnamedcallArbitrate5326USEDMULTIPLEcallArbitrate[1]) && CE) begin SR8 <= (unnamedcallArbitrate5326USEDMULTIPLEcallArbitrate[0]); end end
  always @(posedge CLK) begin if(pushPop_valid===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR9' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if(reset===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR9' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if((({4'b0,pushPop_valid})+({4'b0,reset})) > 5'd1) begin $display("error, function 'set' on instance 'SR9' in module '%s' has multiple valid bits active in same cycle!",INSTANCE_NAME);$finish(); end end
  wire [1:0] unnamedcallArbitrate5332USEDMULTIPLEcallArbitrate;assign unnamedcallArbitrate5332USEDMULTIPLEcallArbitrate = {(pushPop_valid||reset),((pushPop_valid)?(SR8):((1'd0)))}; 
  reg SR9;  always @ (posedge CLK) begin if ((unnamedcallArbitrate5332USEDMULTIPLEcallArbitrate[1]) && CE) begin SR9 <= (unnamedcallArbitrate5332USEDMULTIPLEcallArbitrate[0]); end end
  always @(posedge CLK) begin if(pushPop_valid===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR10' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if(reset===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR10' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if((({4'b0,pushPop_valid})+({4'b0,reset})) > 5'd1) begin $display("error, function 'set' on instance 'SR10' in module '%s' has multiple valid bits active in same cycle!",INSTANCE_NAME);$finish(); end end
  wire [1:0] unnamedcallArbitrate5338USEDMULTIPLEcallArbitrate;assign unnamedcallArbitrate5338USEDMULTIPLEcallArbitrate = {(pushPop_valid||reset),((pushPop_valid)?(SR9):((1'd0)))}; 
  reg SR10;  always @ (posedge CLK) begin if ((unnamedcallArbitrate5338USEDMULTIPLEcallArbitrate[1]) && CE) begin SR10 <= (unnamedcallArbitrate5338USEDMULTIPLEcallArbitrate[0]); end end
  always @(posedge CLK) begin if(pushPop_valid===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR11' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if(reset===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR11' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if((({4'b0,pushPop_valid})+({4'b0,reset})) > 5'd1) begin $display("error, function 'set' on instance 'SR11' in module '%s' has multiple valid bits active in same cycle!",INSTANCE_NAME);$finish(); end end
  wire [1:0] unnamedcallArbitrate5344USEDMULTIPLEcallArbitrate;assign unnamedcallArbitrate5344USEDMULTIPLEcallArbitrate = {(pushPop_valid||reset),((pushPop_valid)?(SR10):((1'd0)))}; 
  reg SR11;  always @ (posedge CLK) begin if ((unnamedcallArbitrate5344USEDMULTIPLEcallArbitrate[1]) && CE) begin SR11 <= (unnamedcallArbitrate5344USEDMULTIPLEcallArbitrate[0]); end end
  always @(posedge CLK) begin if(pushPop_valid===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR12' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if(reset===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR12' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if((({4'b0,pushPop_valid})+({4'b0,reset})) > 5'd1) begin $display("error, function 'set' on instance 'SR12' in module '%s' has multiple valid bits active in same cycle!",INSTANCE_NAME);$finish(); end end
  wire [1:0] unnamedcallArbitrate5350USEDMULTIPLEcallArbitrate;assign unnamedcallArbitrate5350USEDMULTIPLEcallArbitrate = {(pushPop_valid||reset),((pushPop_valid)?(SR11):((1'd0)))}; 
  reg SR12;  always @ (posedge CLK) begin if ((unnamedcallArbitrate5350USEDMULTIPLEcallArbitrate[1]) && CE) begin SR12 <= (unnamedcallArbitrate5350USEDMULTIPLEcallArbitrate[0]); end end
  always @(posedge CLK) begin if(pushPop_valid===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR13' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if(reset===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR13' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if((({4'b0,pushPop_valid})+({4'b0,reset})) > 5'd1) begin $display("error, function 'set' on instance 'SR13' in module '%s' has multiple valid bits active in same cycle!",INSTANCE_NAME);$finish(); end end
  wire [1:0] unnamedcallArbitrate5356USEDMULTIPLEcallArbitrate;assign unnamedcallArbitrate5356USEDMULTIPLEcallArbitrate = {(pushPop_valid||reset),((pushPop_valid)?(SR12):((1'd0)))}; 
  reg SR13;  always @ (posedge CLK) begin if ((unnamedcallArbitrate5356USEDMULTIPLEcallArbitrate[1]) && CE) begin SR13 <= (unnamedcallArbitrate5356USEDMULTIPLEcallArbitrate[0]); end end
  always @(posedge CLK) begin if(pushPop_valid===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR14' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if(reset===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR14' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if((({4'b0,pushPop_valid})+({4'b0,reset})) > 5'd1) begin $display("error, function 'set' on instance 'SR14' in module '%s' has multiple valid bits active in same cycle!",INSTANCE_NAME);$finish(); end end
  wire [1:0] unnamedcallArbitrate5362USEDMULTIPLEcallArbitrate;assign unnamedcallArbitrate5362USEDMULTIPLEcallArbitrate = {(pushPop_valid||reset),((pushPop_valid)?(SR13):((1'd0)))}; 
  reg SR14;  always @ (posedge CLK) begin if ((unnamedcallArbitrate5362USEDMULTIPLEcallArbitrate[1]) && CE) begin SR14 <= (unnamedcallArbitrate5362USEDMULTIPLEcallArbitrate[0]); end end
  always @(posedge CLK) begin if(pushPop_valid===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR15' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if(reset===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR15' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if((({4'b0,pushPop_valid})+({4'b0,reset})) > 5'd1) begin $display("error, function 'set' on instance 'SR15' in module '%s' has multiple valid bits active in same cycle!",INSTANCE_NAME);$finish(); end end
  wire [1:0] unnamedcallArbitrate5368USEDMULTIPLEcallArbitrate;assign unnamedcallArbitrate5368USEDMULTIPLEcallArbitrate = {(pushPop_valid||reset),((pushPop_valid)?(SR14):((1'd0)))}; 
  reg SR15;  always @ (posedge CLK) begin if ((unnamedcallArbitrate5368USEDMULTIPLEcallArbitrate[1]) && CE) begin SR15 <= (unnamedcallArbitrate5368USEDMULTIPLEcallArbitrate[0]); end end
  always @(posedge CLK) begin if(pushPop_valid===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR16' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if(reset===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR16' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if((({4'b0,pushPop_valid})+({4'b0,reset})) > 5'd1) begin $display("error, function 'set' on instance 'SR16' in module '%s' has multiple valid bits active in same cycle!",INSTANCE_NAME);$finish(); end end
  wire [1:0] unnamedcallArbitrate5374USEDMULTIPLEcallArbitrate;assign unnamedcallArbitrate5374USEDMULTIPLEcallArbitrate = {(pushPop_valid||reset),((pushPop_valid)?(SR15):((1'd0)))}; 
  reg SR16;  always @ (posedge CLK) begin if ((unnamedcallArbitrate5374USEDMULTIPLEcallArbitrate[1]) && CE) begin SR16 <= (unnamedcallArbitrate5374USEDMULTIPLEcallArbitrate[0]); end end
  always @(posedge CLK) begin if(pushPop_valid===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR17' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if(reset===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR17' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if((({4'b0,pushPop_valid})+({4'b0,reset})) > 5'd1) begin $display("error, function 'set' on instance 'SR17' in module '%s' has multiple valid bits active in same cycle!",INSTANCE_NAME);$finish(); end end
  wire [1:0] unnamedcallArbitrate5380USEDMULTIPLEcallArbitrate;assign unnamedcallArbitrate5380USEDMULTIPLEcallArbitrate = {(pushPop_valid||reset),((pushPop_valid)?(SR16):((1'd0)))}; 
  reg SR17;  always @ (posedge CLK) begin if ((unnamedcallArbitrate5380USEDMULTIPLEcallArbitrate[1]) && CE) begin SR17 <= (unnamedcallArbitrate5380USEDMULTIPLEcallArbitrate[0]); end end
  always @(posedge CLK) begin if(pushPop_valid===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR18' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if(reset===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR18' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if((({4'b0,pushPop_valid})+({4'b0,reset})) > 5'd1) begin $display("error, function 'set' on instance 'SR18' in module '%s' has multiple valid bits active in same cycle!",INSTANCE_NAME);$finish(); end end
  wire [1:0] unnamedcallArbitrate5386USEDMULTIPLEcallArbitrate;assign unnamedcallArbitrate5386USEDMULTIPLEcallArbitrate = {(pushPop_valid||reset),((pushPop_valid)?(SR17):((1'd0)))}; 
  reg SR18;  always @ (posedge CLK) begin if ((unnamedcallArbitrate5386USEDMULTIPLEcallArbitrate[1]) && CE) begin SR18 <= (unnamedcallArbitrate5386USEDMULTIPLEcallArbitrate[0]); end end
  always @(posedge CLK) begin if(pushPop_valid===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR19' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if(reset===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR19' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if((({4'b0,pushPop_valid})+({4'b0,reset})) > 5'd1) begin $display("error, function 'set' on instance 'SR19' in module '%s' has multiple valid bits active in same cycle!",INSTANCE_NAME);$finish(); end end
  wire [1:0] unnamedcallArbitrate5392USEDMULTIPLEcallArbitrate;assign unnamedcallArbitrate5392USEDMULTIPLEcallArbitrate = {(pushPop_valid||reset),((pushPop_valid)?(SR18):((1'd0)))}; 
  reg SR19;  always @ (posedge CLK) begin if ((unnamedcallArbitrate5392USEDMULTIPLEcallArbitrate[1]) && CE) begin SR19 <= (unnamedcallArbitrate5392USEDMULTIPLEcallArbitrate[0]); end end
  always @(posedge CLK) begin if(pushPop_valid===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR20' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if(reset===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR20' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if((({4'b0,pushPop_valid})+({4'b0,reset})) > 5'd1) begin $display("error, function 'set' on instance 'SR20' in module '%s' has multiple valid bits active in same cycle!",INSTANCE_NAME);$finish(); end end
  wire [1:0] unnamedcallArbitrate5398USEDMULTIPLEcallArbitrate;assign unnamedcallArbitrate5398USEDMULTIPLEcallArbitrate = {(pushPop_valid||reset),((pushPop_valid)?(SR19):((1'd0)))}; 
  reg SR20;  always @ (posedge CLK) begin if ((unnamedcallArbitrate5398USEDMULTIPLEcallArbitrate[1]) && CE) begin SR20 <= (unnamedcallArbitrate5398USEDMULTIPLEcallArbitrate[0]); end end
  always @(posedge CLK) begin if(pushPop_valid===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR21' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if(reset===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR21' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if((({4'b0,pushPop_valid})+({4'b0,reset})) > 5'd1) begin $display("error, function 'set' on instance 'SR21' in module '%s' has multiple valid bits active in same cycle!",INSTANCE_NAME);$finish(); end end
  wire [1:0] unnamedcallArbitrate5404USEDMULTIPLEcallArbitrate;assign unnamedcallArbitrate5404USEDMULTIPLEcallArbitrate = {(pushPop_valid||reset),((pushPop_valid)?(SR20):((1'd0)))}; 
  reg SR21;  always @ (posedge CLK) begin if ((unnamedcallArbitrate5404USEDMULTIPLEcallArbitrate[1]) && CE) begin SR21 <= (unnamedcallArbitrate5404USEDMULTIPLEcallArbitrate[0]); end end
  always @(posedge CLK) begin if(pushPop_valid===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR22' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if(reset===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR22' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if((({4'b0,pushPop_valid})+({4'b0,reset})) > 5'd1) begin $display("error, function 'set' on instance 'SR22' in module '%s' has multiple valid bits active in same cycle!",INSTANCE_NAME);$finish(); end end
  wire [1:0] unnamedcallArbitrate5410USEDMULTIPLEcallArbitrate;assign unnamedcallArbitrate5410USEDMULTIPLEcallArbitrate = {(pushPop_valid||reset),((pushPop_valid)?(SR21):((1'd0)))}; 
  reg SR22;  always @ (posedge CLK) begin if ((unnamedcallArbitrate5410USEDMULTIPLEcallArbitrate[1]) && CE) begin SR22 <= (unnamedcallArbitrate5410USEDMULTIPLEcallArbitrate[0]); end end
  always @(posedge CLK) begin if(pushPop_valid===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR23' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if(reset===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR23' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if((({4'b0,pushPop_valid})+({4'b0,reset})) > 5'd1) begin $display("error, function 'set' on instance 'SR23' in module '%s' has multiple valid bits active in same cycle!",INSTANCE_NAME);$finish(); end end
  wire [1:0] unnamedcallArbitrate5416USEDMULTIPLEcallArbitrate;assign unnamedcallArbitrate5416USEDMULTIPLEcallArbitrate = {(pushPop_valid||reset),((pushPop_valid)?(SR22):((1'd0)))}; 
  reg SR23;  always @ (posedge CLK) begin if ((unnamedcallArbitrate5416USEDMULTIPLEcallArbitrate[1]) && CE) begin SR23 <= (unnamedcallArbitrate5416USEDMULTIPLEcallArbitrate[0]); end end
  always @(posedge CLK) begin if(pushPop_valid===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR24' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if(reset===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR24' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if((({4'b0,pushPop_valid})+({4'b0,reset})) > 5'd1) begin $display("error, function 'set' on instance 'SR24' in module '%s' has multiple valid bits active in same cycle!",INSTANCE_NAME);$finish(); end end
  wire [1:0] unnamedcallArbitrate5422USEDMULTIPLEcallArbitrate;assign unnamedcallArbitrate5422USEDMULTIPLEcallArbitrate = {(pushPop_valid||reset),((pushPop_valid)?(SR23):((1'd0)))}; 
  reg SR24;  always @ (posedge CLK) begin if ((unnamedcallArbitrate5422USEDMULTIPLEcallArbitrate[1]) && CE) begin SR24 <= (unnamedcallArbitrate5422USEDMULTIPLEcallArbitrate[0]); end end
  always @(posedge CLK) begin if(pushPop_valid===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR25' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if(reset===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR25' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if((({4'b0,pushPop_valid})+({4'b0,reset})) > 5'd1) begin $display("error, function 'set' on instance 'SR25' in module '%s' has multiple valid bits active in same cycle!",INSTANCE_NAME);$finish(); end end
  wire [1:0] unnamedcallArbitrate5428USEDMULTIPLEcallArbitrate;assign unnamedcallArbitrate5428USEDMULTIPLEcallArbitrate = {(pushPop_valid||reset),((pushPop_valid)?(SR24):((1'd0)))}; 
  reg SR25;  always @ (posedge CLK) begin if ((unnamedcallArbitrate5428USEDMULTIPLEcallArbitrate[1]) && CE) begin SR25 <= (unnamedcallArbitrate5428USEDMULTIPLEcallArbitrate[0]); end end
  always @(posedge CLK) begin if(pushPop_valid===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR26' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if(reset===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR26' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if((({4'b0,pushPop_valid})+({4'b0,reset})) > 5'd1) begin $display("error, function 'set' on instance 'SR26' in module '%s' has multiple valid bits active in same cycle!",INSTANCE_NAME);$finish(); end end
  wire [1:0] unnamedcallArbitrate5434USEDMULTIPLEcallArbitrate;assign unnamedcallArbitrate5434USEDMULTIPLEcallArbitrate = {(pushPop_valid||reset),((pushPop_valid)?(SR25):((1'd0)))}; 
  reg SR26;  always @ (posedge CLK) begin if ((unnamedcallArbitrate5434USEDMULTIPLEcallArbitrate[1]) && CE) begin SR26 <= (unnamedcallArbitrate5434USEDMULTIPLEcallArbitrate[0]); end end
  always @(posedge CLK) begin if(pushPop_valid===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR27' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if(reset===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR27' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if((({4'b0,pushPop_valid})+({4'b0,reset})) > 5'd1) begin $display("error, function 'set' on instance 'SR27' in module '%s' has multiple valid bits active in same cycle!",INSTANCE_NAME);$finish(); end end
  wire [1:0] unnamedcallArbitrate5440USEDMULTIPLEcallArbitrate;assign unnamedcallArbitrate5440USEDMULTIPLEcallArbitrate = {(pushPop_valid||reset),((pushPop_valid)?(SR26):((1'd0)))}; 
  reg SR27;  always @ (posedge CLK) begin if ((unnamedcallArbitrate5440USEDMULTIPLEcallArbitrate[1]) && CE) begin SR27 <= (unnamedcallArbitrate5440USEDMULTIPLEcallArbitrate[0]); end end
  always @(posedge CLK) begin if(pushPop_valid===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR28' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if(reset===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR28' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if((({4'b0,pushPop_valid})+({4'b0,reset})) > 5'd1) begin $display("error, function 'set' on instance 'SR28' in module '%s' has multiple valid bits active in same cycle!",INSTANCE_NAME);$finish(); end end
  wire [1:0] unnamedcallArbitrate5446USEDMULTIPLEcallArbitrate;assign unnamedcallArbitrate5446USEDMULTIPLEcallArbitrate = {(pushPop_valid||reset),((pushPop_valid)?(SR27):((1'd0)))}; 
  reg SR28;  always @ (posedge CLK) begin if ((unnamedcallArbitrate5446USEDMULTIPLEcallArbitrate[1]) && CE) begin SR28 <= (unnamedcallArbitrate5446USEDMULTIPLEcallArbitrate[0]); end end
  always @(posedge CLK) begin if(pushPop_valid===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR29' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if(reset===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR29' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if((({4'b0,pushPop_valid})+({4'b0,reset})) > 5'd1) begin $display("error, function 'set' on instance 'SR29' in module '%s' has multiple valid bits active in same cycle!",INSTANCE_NAME);$finish(); end end
  wire [1:0] unnamedcallArbitrate5452USEDMULTIPLEcallArbitrate;assign unnamedcallArbitrate5452USEDMULTIPLEcallArbitrate = {(pushPop_valid||reset),((pushPop_valid)?(SR28):((1'd0)))}; 
  reg SR29;  always @ (posedge CLK) begin if ((unnamedcallArbitrate5452USEDMULTIPLEcallArbitrate[1]) && CE) begin SR29 <= (unnamedcallArbitrate5452USEDMULTIPLEcallArbitrate[0]); end end
  always @(posedge CLK) begin if(pushPop_valid===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR30' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if(reset===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR30' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if((({4'b0,pushPop_valid})+({4'b0,reset})) > 5'd1) begin $display("error, function 'set' on instance 'SR30' in module '%s' has multiple valid bits active in same cycle!",INSTANCE_NAME);$finish(); end end
  wire [1:0] unnamedcallArbitrate5458USEDMULTIPLEcallArbitrate;assign unnamedcallArbitrate5458USEDMULTIPLEcallArbitrate = {(pushPop_valid||reset),((pushPop_valid)?(SR29):((1'd0)))}; 
  reg SR30;  always @ (posedge CLK) begin if ((unnamedcallArbitrate5458USEDMULTIPLEcallArbitrate[1]) && CE) begin SR30 <= (unnamedcallArbitrate5458USEDMULTIPLEcallArbitrate[0]); end end
  always @(posedge CLK) begin if(pushPop_valid===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR31' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if(reset===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR31' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if((({4'b0,pushPop_valid})+({4'b0,reset})) > 5'd1) begin $display("error, function 'set' on instance 'SR31' in module '%s' has multiple valid bits active in same cycle!",INSTANCE_NAME);$finish(); end end
  wire [1:0] unnamedcallArbitrate5464USEDMULTIPLEcallArbitrate;assign unnamedcallArbitrate5464USEDMULTIPLEcallArbitrate = {(pushPop_valid||reset),((pushPop_valid)?(SR30):((1'd0)))}; 
  reg SR31;  always @ (posedge CLK) begin if ((unnamedcallArbitrate5464USEDMULTIPLEcallArbitrate[1]) && CE) begin SR31 <= (unnamedcallArbitrate5464USEDMULTIPLEcallArbitrate[0]); end end
  always @(posedge CLK) begin if(pushPop_valid===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR32' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if(reset===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR32' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if((({4'b0,pushPop_valid})+({4'b0,reset})) > 5'd1) begin $display("error, function 'set' on instance 'SR32' in module '%s' has multiple valid bits active in same cycle!",INSTANCE_NAME);$finish(); end end
  wire [1:0] unnamedcallArbitrate5470USEDMULTIPLEcallArbitrate;assign unnamedcallArbitrate5470USEDMULTIPLEcallArbitrate = {(pushPop_valid||reset),((pushPop_valid)?(SR31):((1'd0)))}; 
    always @ (posedge CLK) begin if ((unnamedcallArbitrate5470USEDMULTIPLEcallArbitrate[1]) && CE) begin SR32 <= (unnamedcallArbitrate5470USEDMULTIPLEcallArbitrate[0]); end end
  assign pushPop_out = SR32;
  // function: pushPop pure=false delay=0
  // function: reset pure=false delay=0
endmodule

module blackLevel(input CLK, input process_CE, input [7:0] blInput, output [7:0] process_output);
parameter INSTANCE_NAME="INST";
  wire [8:0] unnamedcast1116;assign unnamedcast1116 = {1'b0,blInput};  // wire for int size extend (cast)
  wire [8:0] unnamedcast1118;assign unnamedcast1118 = {1'b0,(8'd90)};  // wire for int size extend (cast)
  wire [9:0] unnamedcast1119;assign unnamedcast1119 = { {1{unnamedcast1116[8]}},unnamedcast1116[8:0]}; // wire for $signed
  wire [9:0] unnamedcast1120;assign unnamedcast1120 = { {1{unnamedcast1118[8]}},unnamedcast1118[8:0]}; // wire for $signed
  reg [9:0] unnamedbinop1121_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedbinop1121_delay1_validunnamednull0_CEprocess_CE <= {($signed(unnamedcast1119)-$signed(unnamedcast1120))}; end end
  wire [8:0] unnamedcast1123;assign unnamedcast1123 = {1'b0,(8'd197)};  // wire for int size extend (cast)
  reg [18:0] unnamedcast1125_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast1125_delay1_validunnamednull0_CEprocess_CE <= { {10{unnamedcast1123[8]}},unnamedcast1123[8:0]}; end end
  wire [18:0] unnamedcast1124;assign unnamedcast1124 = { {9{unnamedbinop1121_delay1_validunnamednull0_CEprocess_CE[9]}},unnamedbinop1121_delay1_validunnamednull0_CEprocess_CE[9:0]}; // wire for $signed
  reg [18:0] unnamedbinop1126_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedbinop1126_delay1_validunnamednull0_CEprocess_CE <= {($signed(unnamedcast1124)*$signed(unnamedcast1125_delay1_validunnamednull0_CEprocess_CE))}; end end
  reg [18:0] unnamedunary1127_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedunary1127_delay1_validunnamednull0_CEprocess_CE <= {((unnamedbinop1126_delay1_validunnamednull0_CEprocess_CE[18])?(-unnamedbinop1126_delay1_validunnamednull0_CEprocess_CE):(unnamedbinop1126_delay1_validunnamednull0_CEprocess_CE))}; end end
  reg [18:0] unnamedcast1130_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast1130_delay1_validunnamednull0_CEprocess_CE <= (19'd7); end end
  reg [18:0] unnamedcast1130_delay2_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast1130_delay2_validunnamednull0_CEprocess_CE <= unnamedcast1130_delay1_validunnamednull0_CEprocess_CE; end end
  reg [18:0] unnamedcast1130_delay3_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast1130_delay3_validunnamednull0_CEprocess_CE <= unnamedcast1130_delay2_validunnamednull0_CEprocess_CE; end end
  reg [18:0] unnamedbinop1131_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedbinop1131_delay1_validunnamednull0_CEprocess_CE <= {(unnamedunary1127_delay1_validunnamednull0_CEprocess_CE>>>unnamedcast1130_delay3_validunnamednull0_CEprocess_CE)}; end end
  wire [11:0] unnamedcast1132USEDMULTIPLEcast;assign unnamedcast1132USEDMULTIPLEcast = unnamedbinop1131_delay1_validunnamednull0_CEprocess_CE[11:0]; 
  reg [11:0] unnamedcast1134_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast1134_delay1_validunnamednull0_CEprocess_CE <= {4'b0,(8'd255)}; end end
  reg [11:0] unnamedcast1134_delay2_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast1134_delay2_validunnamednull0_CEprocess_CE <= unnamedcast1134_delay1_validunnamednull0_CEprocess_CE; end end
  reg [11:0] unnamedcast1134_delay3_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast1134_delay3_validunnamednull0_CEprocess_CE <= unnamedcast1134_delay2_validunnamednull0_CEprocess_CE; end end
  reg [11:0] unnamedcast1134_delay4_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast1134_delay4_validunnamednull0_CEprocess_CE <= unnamedcast1134_delay3_validunnamednull0_CEprocess_CE; end end
  reg unnamedbinop1135_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedbinop1135_delay1_validunnamednull0_CEprocess_CE <= {((unnamedcast1132USEDMULTIPLEcast)>(unnamedcast1134_delay4_validunnamednull0_CEprocess_CE))}; end end
  reg [11:0] unnamedcast1137_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast1137_delay1_validunnamednull0_CEprocess_CE <= (12'd255); end end
  reg [11:0] unnamedcast1137_delay2_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast1137_delay2_validunnamednull0_CEprocess_CE <= unnamedcast1137_delay1_validunnamednull0_CEprocess_CE; end end
  reg [11:0] unnamedcast1137_delay3_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast1137_delay3_validunnamednull0_CEprocess_CE <= unnamedcast1137_delay2_validunnamednull0_CEprocess_CE; end end
  reg [11:0] unnamedcast1137_delay4_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast1137_delay4_validunnamednull0_CEprocess_CE <= unnamedcast1137_delay3_validunnamednull0_CEprocess_CE; end end
  reg [11:0] unnamedcast1137_delay5_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast1137_delay5_validunnamednull0_CEprocess_CE <= unnamedcast1137_delay4_validunnamednull0_CEprocess_CE; end end
  reg [11:0] unnamedcast1132_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast1132_delay1_validunnamednull0_CEprocess_CE <= unnamedcast1132USEDMULTIPLEcast; end end
  reg [11:0] unnamedselect1138_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedselect1138_delay1_validunnamednull0_CEprocess_CE <= ((unnamedbinop1135_delay1_validunnamednull0_CEprocess_CE)?(unnamedcast1137_delay5_validunnamednull0_CEprocess_CE):(unnamedcast1132_delay1_validunnamednull0_CEprocess_CE)); end end
  assign process_output = unnamedselect1138_delay1_validunnamednull0_CEprocess_CE[7:0];
  // function: process pure=true delay=6
endmodule

module map_blackLevel_W2_H1(input CLK, input process_CE, input [15:0] process_input, output [15:0] process_output);
parameter INSTANCE_NAME="INST";
  wire [7:0] inner0_0_process_output;
  wire [7:0] inner1_0_process_output;
  assign process_output = {inner1_0_process_output,inner0_0_process_output};
  // function: process pure=true delay=6
  blackLevel #(.INSTANCE_NAME({INSTANCE_NAME,"_inner0_0"})) inner0_0(.CLK(CLK), .process_CE(process_CE), .blInput(({process_input[7:0]})), .process_output(inner0_0_process_output));
  blackLevel #(.INSTANCE_NAME({INSTANCE_NAME,"_inner1_0"})) inner1_0(.CLK(CLK), .process_CE(process_CE), .blInput(({process_input[15:8]})), .process_output(inner1_0_process_output));
endmodule

module incif_wrapuint16_323_incnil(input CLK, input CE, input [16:0] process_input, output [15:0] process_output);
parameter INSTANCE_NAME="INST";
  wire [15:0] unnamedcast3810USEDMULTIPLEcast;assign unnamedcast3810USEDMULTIPLEcast = (process_input[15:0]); 
  assign process_output = (((process_input[16]))?((({(unnamedcast3810USEDMULTIPLEcast==(16'd323))})?((16'd0)):({(unnamedcast3810USEDMULTIPLEcast+(16'd1))}))):(unnamedcast3810USEDMULTIPLEcast));
  // function: process pure=true delay=0
endmodule

module RegBy_incif_wrapuint16_323_incnil_CEtrue_initnil(input CLK, input set_valid, input CE, input [15:0] set_inp, input setby_valid, input setby_inp, output [15:0] SETBY_OUTPUT, output [15:0] GET_OUTPUT);
parameter INSTANCE_NAME="INST";
  reg [15:0] R;
  wire [15:0] regby_inner_process_output;
  always @(posedge CLK) begin if(set_valid===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'R' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if(setby_valid===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'R' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if((({4'b0,set_valid})+({4'b0,setby_valid})) > 5'd1) begin $display("error, function 'set' on instance 'R' in module '%s' has multiple valid bits active in same cycle!",INSTANCE_NAME);$finish(); end end
  wire [16:0] unnamedcallArbitrate3861USEDMULTIPLEcallArbitrate;assign unnamedcallArbitrate3861USEDMULTIPLEcallArbitrate = {(set_valid||setby_valid),((set_valid)?(set_inp):(regby_inner_process_output))}; 
    always @ (posedge CLK) begin if ((unnamedcallArbitrate3861USEDMULTIPLEcallArbitrate[16]) && CE) begin R <= (unnamedcallArbitrate3861USEDMULTIPLEcallArbitrate[15:0]); end end
  assign SETBY_OUTPUT = regby_inner_process_output;
  assign GET_OUTPUT = R;
  // function: set pure=false ONLY WIRE
  // function: setby pure=false ONLY WIRE
  // function: get pure=true ONLY WIRE
  incif_wrapuint16_323_incnil #(.INSTANCE_NAME({INSTANCE_NAME,"_regby_inner"})) regby_inner(.CLK(CLK), .CE(CE), .process_input({setby_inp,R}), .process_output(regby_inner_process_output));
endmodule

module bramSDP_WAROtrue_size1024_bw2_obwnil_CEtrue_initnil(input CLK, input writeAndReturnOriginal_valid, input writeAndReturnOriginal_CE, input [24:0] inp, output [15:0] WARO_OUT);
parameter INSTANCE_NAME="INST";
always @(posedge CLK) begin if(writeAndReturnOriginal_valid===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'writeAndReturnOriginal'", INSTANCE_NAME);  end end
  wire [15:0] unnamedcast3870;assign unnamedcast3870 = (inp[24:9]);  // wire for bitslice
  wire [15:0] bram_0_SET_AND_RETURN_ORIG_OUTPUT;
  assign WARO_OUT = {bram_0_SET_AND_RETURN_ORIG_OUTPUT};
  // function: writeAndReturnOriginal pure=false delay=1
  reg [15:0] bram_0_DI_B;
reg [9:0] bram_0_addr_B;
wire [15:0] bram_0_DO_B;
wire [25:0] bram_0_INPUT;
assign bram_0_INPUT = {unnamedcast3870[15:0],{1'b0,(inp[8:0])}};
RAMB16_S18_S18 #(.WRITE_MODE_A("READ_FIRST"),.WRITE_MODE_B("READ_FIRST")) bram_0 (
.DIPA(2'b0),
.DIPB(2'b0),
.DIA(bram_0_INPUT[25:10]),
.DIB(bram_0_DI_B),
.DOA(bram_0_SET_AND_RETURN_ORIG_OUTPUT),
.DOB(bram_0_DO_B),
.ADDRA(bram_0_INPUT[9:0]),
.ADDRB(bram_0_addr_B),
.WEA(writeAndReturnOriginal_valid),
.WEB(1'd0),
.ENA(writeAndReturnOriginal_CE),
.ENB(writeAndReturnOriginal_CE),
.CLKA(CLK),
.CLKB(CLK),
.SSRA(1'b0),
.SSRB(1'b0)
);


endmodule

module linebuffer_w648_h482_T2_ymin_2_Auint8(input CLK, input process_valid, input CE, input [15:0] process_input, output [47:0] process_output, input reset);
parameter INSTANCE_NAME="INST";
always @(posedge CLK) begin if(process_valid===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'process'", INSTANCE_NAME);  end end
always @(posedge CLK) begin if(reset===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'reset'", INSTANCE_NAME);  end end
  wire [15:0] addr_GET_OUTPUT;
  wire [8:0] unnamedcast3912USEDMULTIPLEcast;assign unnamedcast3912USEDMULTIPLEcast = addr_GET_OUTPUT[8:0]; 
  reg [8:0] unnamedcast3912_delay1_validunnamednull0_CECE;  always @ (posedge CLK) begin if (CE) begin unnamedcast3912_delay1_validunnamednull0_CECE <= unnamedcast3912USEDMULTIPLEcast; end end
  wire [15:0] lb_m0_WARO_OUT;
  wire [15:0] unnamedcast3904USEDMULTIPLEcast;assign unnamedcast3904USEDMULTIPLEcast = lb_m0_WARO_OUT[15:0]; 
  reg process_valid_delay1_validunnamednull0_CECE;  always @ (posedge CLK) begin if (CE) begin process_valid_delay1_validunnamednull0_CECE <= process_valid; end end
  wire [15:0] lb_m1_WARO_OUT;
  wire [15:0] unnamedcast3916USEDMULTIPLEcast;assign unnamedcast3916USEDMULTIPLEcast = lb_m1_WARO_OUT[15:0]; 
  reg [7:0] unnamedcast3906_delay1_validunnamednull0_CECE;  always @ (posedge CLK) begin if (CE) begin unnamedcast3906_delay1_validunnamednull0_CECE <= ({unnamedcast3904USEDMULTIPLEcast[7:0]}); end end
  reg [7:0] unnamedcast3908_delay1_validunnamednull0_CECE;  always @ (posedge CLK) begin if (CE) begin unnamedcast3908_delay1_validunnamednull0_CECE <= ({unnamedcast3904USEDMULTIPLEcast[15:8]}); end end
  reg [7:0] unnamedcast3878_delay1_validunnamednull0_CECE;  always @ (posedge CLK) begin if (CE) begin unnamedcast3878_delay1_validunnamednull0_CECE <= ({process_input[7:0]}); end end
  reg [7:0] unnamedcast3878_delay2_validunnamednull0_CECE;  always @ (posedge CLK) begin if (CE) begin unnamedcast3878_delay2_validunnamednull0_CECE <= unnamedcast3878_delay1_validunnamednull0_CECE; end end
  reg [7:0] unnamedcast3880_delay1_validunnamednull0_CECE;  always @ (posedge CLK) begin if (CE) begin unnamedcast3880_delay1_validunnamednull0_CECE <= ({process_input[15:8]}); end end
  reg [7:0] unnamedcast3880_delay2_validunnamednull0_CECE;  always @ (posedge CLK) begin if (CE) begin unnamedcast3880_delay2_validunnamednull0_CECE <= unnamedcast3880_delay1_validunnamednull0_CECE; end end
  wire [15:0] addr_SETBY_OUTPUT;
  assign process_output = {unnamedcast3880_delay2_validunnamednull0_CECE,unnamedcast3878_delay2_validunnamednull0_CECE,unnamedcast3908_delay1_validunnamednull0_CECE,unnamedcast3906_delay1_validunnamednull0_CECE,({unnamedcast3916USEDMULTIPLEcast[15:8]}),({unnamedcast3916USEDMULTIPLEcast[7:0]})};
  // function: process pure=false delay=2
  // function: reset pure=false delay=0
  RegBy_incif_wrapuint16_323_incnil_CEtrue_initnil #(.INSTANCE_NAME({INSTANCE_NAME,"_addr"})) addr(.CLK(CLK), .set_valid(reset), .CE(CE), .set_inp((16'd0)), .setby_valid(process_valid), .setby_inp((1'd1)), .SETBY_OUTPUT(addr_SETBY_OUTPUT), .GET_OUTPUT(addr_GET_OUTPUT));
  bramSDP_WAROtrue_size1024_bw2_obwnil_CEtrue_initnil #(.INSTANCE_NAME({INSTANCE_NAME,"_lb_m0"})) lb_m0(.CLK(CLK), .writeAndReturnOriginal_valid(process_valid), .writeAndReturnOriginal_CE(CE), .inp({process_input,unnamedcast3912USEDMULTIPLEcast}), .WARO_OUT(lb_m0_WARO_OUT));
  bramSDP_WAROtrue_size1024_bw2_obwnil_CEtrue_initnil #(.INSTANCE_NAME({INSTANCE_NAME,"_lb_m1"})) lb_m1(.CLK(CLK), .writeAndReturnOriginal_valid(process_valid_delay1_validunnamednull0_CECE), .writeAndReturnOriginal_CE(CE), .inp({unnamedcast3904USEDMULTIPLEcast,unnamedcast3912_delay1_validunnamednull0_CECE}), .WARO_OUT(lb_m1_WARO_OUT));
endmodule

module SSR_W7_H3_T2_Auint8(input CLK, input process_valid, input process_CE, input [47:0] inp, output [191:0] process_output);
parameter INSTANCE_NAME="INST";
always @(posedge CLK) begin if(process_valid===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'process'", INSTANCE_NAME);  end end
  reg [7:0] SR_x0_y0;
  reg [7:0] SR_x1_y0;
  reg [7:0] SR_x2_y0;
  reg [7:0] SR_x3_y0;
  reg [7:0] SR_x4_y0;
  reg [7:0] SR_x5_y0;
  wire [7:0] unnamedcast3738USEDMULTIPLEcast;assign unnamedcast3738USEDMULTIPLEcast = ({inp[7:0]}); 
  wire [7:0] unnamedcast3736USEDMULTIPLEcast;assign unnamedcast3736USEDMULTIPLEcast = ({inp[15:8]}); 
  reg [7:0] SR_x0_y1;
  reg [7:0] SR_x1_y1;
  reg [7:0] SR_x2_y1;
  reg [7:0] SR_x3_y1;
  reg [7:0] SR_x4_y1;
  reg [7:0] SR_x5_y1;
  wire [7:0] unnamedcast3762USEDMULTIPLEcast;assign unnamedcast3762USEDMULTIPLEcast = ({inp[23:16]}); 
  wire [7:0] unnamedcast3760USEDMULTIPLEcast;assign unnamedcast3760USEDMULTIPLEcast = ({inp[31:24]}); 
  reg [7:0] SR_x0_y2;
  reg [7:0] SR_x1_y2;
  reg [7:0] SR_x2_y2;
  reg [7:0] SR_x3_y2;
  reg [7:0] SR_x4_y2;
  reg [7:0] SR_x5_y2;
  wire [7:0] unnamedcast3786USEDMULTIPLEcast;assign unnamedcast3786USEDMULTIPLEcast = ({inp[39:32]}); 
  wire [7:0] unnamedcast3784USEDMULTIPLEcast;assign unnamedcast3784USEDMULTIPLEcast = ({inp[47:40]}); 
    always @ (posedge CLK) begin if (process_valid && process_CE) begin SR_x5_y0 <= unnamedcast3736USEDMULTIPLEcast; end end
    always @ (posedge CLK) begin if (process_valid && process_CE) begin SR_x4_y0 <= unnamedcast3738USEDMULTIPLEcast; end end
    always @ (posedge CLK) begin if (process_valid && process_CE) begin SR_x3_y0 <= SR_x5_y0; end end
    always @ (posedge CLK) begin if (process_valid && process_CE) begin SR_x2_y0 <= SR_x4_y0; end end
    always @ (posedge CLK) begin if (process_valid && process_CE) begin SR_x1_y0 <= SR_x3_y0; end end
    always @ (posedge CLK) begin if (process_valid && process_CE) begin SR_x0_y0 <= SR_x2_y0; end end
    always @ (posedge CLK) begin if (process_valid && process_CE) begin SR_x5_y1 <= unnamedcast3760USEDMULTIPLEcast; end end
    always @ (posedge CLK) begin if (process_valid && process_CE) begin SR_x4_y1 <= unnamedcast3762USEDMULTIPLEcast; end end
    always @ (posedge CLK) begin if (process_valid && process_CE) begin SR_x3_y1 <= SR_x5_y1; end end
    always @ (posedge CLK) begin if (process_valid && process_CE) begin SR_x2_y1 <= SR_x4_y1; end end
    always @ (posedge CLK) begin if (process_valid && process_CE) begin SR_x1_y1 <= SR_x3_y1; end end
    always @ (posedge CLK) begin if (process_valid && process_CE) begin SR_x0_y1 <= SR_x2_y1; end end
    always @ (posedge CLK) begin if (process_valid && process_CE) begin SR_x5_y2 <= unnamedcast3784USEDMULTIPLEcast; end end
    always @ (posedge CLK) begin if (process_valid && process_CE) begin SR_x4_y2 <= unnamedcast3786USEDMULTIPLEcast; end end
    always @ (posedge CLK) begin if (process_valid && process_CE) begin SR_x3_y2 <= SR_x5_y2; end end
    always @ (posedge CLK) begin if (process_valid && process_CE) begin SR_x2_y2 <= SR_x4_y2; end end
    always @ (posedge CLK) begin if (process_valid && process_CE) begin SR_x1_y2 <= SR_x3_y2; end end
    always @ (posedge CLK) begin if (process_valid && process_CE) begin SR_x0_y2 <= SR_x2_y2; end end
  assign process_output = {unnamedcast3784USEDMULTIPLEcast,unnamedcast3786USEDMULTIPLEcast,SR_x5_y2,SR_x4_y2,SR_x3_y2,SR_x2_y2,SR_x1_y2,SR_x0_y2,unnamedcast3760USEDMULTIPLEcast,unnamedcast3762USEDMULTIPLEcast,SR_x5_y1,SR_x4_y1,SR_x3_y1,SR_x2_y1,SR_x1_y1,SR_x0_y1,unnamedcast3736USEDMULTIPLEcast,unnamedcast3738USEDMULTIPLEcast,SR_x5_y0,SR_x4_y0,SR_x3_y0,SR_x2_y0,SR_x1_y0,SR_x0_y0};
  // function: process pure=false delay=0
  // function: reset pure=true delay=0
endmodule

module stencilLinebuffer_Auint8_w648_h482_xmin6_ymin2(input CLK, input process_valid, input CE, input [15:0] process_input, output [191:0] process_output, input reset);
parameter INSTANCE_NAME="INST";
always @(posedge CLK) begin if(process_valid===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'process'", INSTANCE_NAME);  end end
always @(posedge CLK) begin if(reset===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'reset'", INSTANCE_NAME);  end end
  wire [47:0] stencilLinebuffer_Auint8_w648_h482_xmin6_ymin2_g_process_output;
  reg process_valid_delay1_validunnamednull0_CECE;  always @ (posedge CLK) begin if (CE) begin process_valid_delay1_validunnamednull0_CECE <= process_valid; end end
  reg process_valid_delay2_validunnamednull0_CECE;  always @ (posedge CLK) begin if (CE) begin process_valid_delay2_validunnamednull0_CECE <= process_valid_delay1_validunnamednull0_CECE; end end
  wire [191:0] stencilLinebuffer_Auint8_w648_h482_xmin6_ymin2_f_process_output;
  assign process_output = stencilLinebuffer_Auint8_w648_h482_xmin6_ymin2_f_process_output;
  // function: process pure=false delay=2
  // function: reset pure=false delay=0
  linebuffer_w648_h482_T2_ymin_2_Auint8 #(.INSTANCE_NAME({INSTANCE_NAME,"_stencilLinebuffer_Auint8_w648_h482_xmin6_ymin2_g"})) stencilLinebuffer_Auint8_w648_h482_xmin6_ymin2_g(.CLK(CLK), .process_valid(process_valid), .CE(CE), .process_input(process_input), .process_output(stencilLinebuffer_Auint8_w648_h482_xmin6_ymin2_g_process_output), .reset(reset));
  SSR_W7_H3_T2_Auint8 #(.INSTANCE_NAME({INSTANCE_NAME,"_stencilLinebuffer_Auint8_w648_h482_xmin6_ymin2_f"})) stencilLinebuffer_Auint8_w648_h482_xmin6_ymin2_f(.CLK(CLK), .process_valid(process_valid_delay2_validunnamednull0_CECE), .process_CE(CE), .inp(stencilLinebuffer_Auint8_w648_h482_xmin6_ymin2_g_process_output), .process_output(stencilLinebuffer_Auint8_w648_h482_xmin6_ymin2_f_process_output));
endmodule

module unpackStencil_uint8_W7_H3_T2(input CLK, input process_CE, input [191:0] inp, output [335:0] process_output);
parameter INSTANCE_NAME="INST";
  wire [7:0] unnamedcast4148USEDMULTIPLEcast;assign unnamedcast4148USEDMULTIPLEcast = ({inp[15:8]}); 
  wire [7:0] unnamedcast4150USEDMULTIPLEcast;assign unnamedcast4150USEDMULTIPLEcast = ({inp[23:16]}); 
  wire [7:0] unnamedcast4152USEDMULTIPLEcast;assign unnamedcast4152USEDMULTIPLEcast = ({inp[31:24]}); 
  wire [7:0] unnamedcast4154USEDMULTIPLEcast;assign unnamedcast4154USEDMULTIPLEcast = ({inp[39:32]}); 
  wire [7:0] unnamedcast4156USEDMULTIPLEcast;assign unnamedcast4156USEDMULTIPLEcast = ({inp[47:40]}); 
  wire [7:0] unnamedcast4158USEDMULTIPLEcast;assign unnamedcast4158USEDMULTIPLEcast = ({inp[55:48]}); 
  wire [7:0] unnamedcast4162USEDMULTIPLEcast;assign unnamedcast4162USEDMULTIPLEcast = ({inp[79:72]}); 
  wire [7:0] unnamedcast4164USEDMULTIPLEcast;assign unnamedcast4164USEDMULTIPLEcast = ({inp[87:80]}); 
  wire [7:0] unnamedcast4166USEDMULTIPLEcast;assign unnamedcast4166USEDMULTIPLEcast = ({inp[95:88]}); 
  wire [7:0] unnamedcast4168USEDMULTIPLEcast;assign unnamedcast4168USEDMULTIPLEcast = ({inp[103:96]}); 
  wire [7:0] unnamedcast4170USEDMULTIPLEcast;assign unnamedcast4170USEDMULTIPLEcast = ({inp[111:104]}); 
  wire [7:0] unnamedcast4172USEDMULTIPLEcast;assign unnamedcast4172USEDMULTIPLEcast = ({inp[119:112]}); 
  wire [7:0] unnamedcast4176USEDMULTIPLEcast;assign unnamedcast4176USEDMULTIPLEcast = ({inp[143:136]}); 
  wire [7:0] unnamedcast4178USEDMULTIPLEcast;assign unnamedcast4178USEDMULTIPLEcast = ({inp[151:144]}); 
  wire [7:0] unnamedcast4180USEDMULTIPLEcast;assign unnamedcast4180USEDMULTIPLEcast = ({inp[159:152]}); 
  wire [7:0] unnamedcast4182USEDMULTIPLEcast;assign unnamedcast4182USEDMULTIPLEcast = ({inp[167:160]}); 
  wire [7:0] unnamedcast4184USEDMULTIPLEcast;assign unnamedcast4184USEDMULTIPLEcast = ({inp[175:168]}); 
  wire [7:0] unnamedcast4186USEDMULTIPLEcast;assign unnamedcast4186USEDMULTIPLEcast = ({inp[183:176]}); 
  assign process_output = {{({inp[191:184]}),unnamedcast4186USEDMULTIPLEcast,unnamedcast4184USEDMULTIPLEcast,unnamedcast4182USEDMULTIPLEcast,unnamedcast4180USEDMULTIPLEcast,unnamedcast4178USEDMULTIPLEcast,unnamedcast4176USEDMULTIPLEcast,({inp[127:120]}),unnamedcast4172USEDMULTIPLEcast,unnamedcast4170USEDMULTIPLEcast,unnamedcast4168USEDMULTIPLEcast,unnamedcast4166USEDMULTIPLEcast,unnamedcast4164USEDMULTIPLEcast,unnamedcast4162USEDMULTIPLEcast,({inp[63:56]}),unnamedcast4158USEDMULTIPLEcast,unnamedcast4156USEDMULTIPLEcast,unnamedcast4154USEDMULTIPLEcast,unnamedcast4152USEDMULTIPLEcast,unnamedcast4150USEDMULTIPLEcast,unnamedcast4148USEDMULTIPLEcast},{unnamedcast4186USEDMULTIPLEcast,unnamedcast4184USEDMULTIPLEcast,unnamedcast4182USEDMULTIPLEcast,unnamedcast4180USEDMULTIPLEcast,unnamedcast4178USEDMULTIPLEcast,unnamedcast4176USEDMULTIPLEcast,({inp[135:128]}),unnamedcast4172USEDMULTIPLEcast,unnamedcast4170USEDMULTIPLEcast,unnamedcast4168USEDMULTIPLEcast,unnamedcast4166USEDMULTIPLEcast,unnamedcast4164USEDMULTIPLEcast,unnamedcast4162USEDMULTIPLEcast,({inp[71:64]}),unnamedcast4158USEDMULTIPLEcast,unnamedcast4156USEDMULTIPLEcast,unnamedcast4154USEDMULTIPLEcast,unnamedcast4152USEDMULTIPLEcast,unnamedcast4150USEDMULTIPLEcast,unnamedcast4148USEDMULTIPLEcast,({inp[7:0]})}};
  // function: process pure=true delay=0
endmodule

module incif_wrapuint16_646_inc2(input CLK, input CE, input [16:0] process_input, output [15:0] process_output);
parameter INSTANCE_NAME="INST";
  wire [15:0] unnamedcast3597USEDMULTIPLEcast;assign unnamedcast3597USEDMULTIPLEcast = (process_input[15:0]); 
  assign process_output = (((process_input[16]))?((({(unnamedcast3597USEDMULTIPLEcast==(16'd646))})?((16'd0)):({(unnamedcast3597USEDMULTIPLEcast+(16'd2))}))):(unnamedcast3597USEDMULTIPLEcast));
  // function: process pure=true delay=0
endmodule

module RegBy_incif_wrapuint16_646_inc2_CEtrue_init0(input CLK, input set_valid, input CE, input [15:0] set_inp, input setby_valid, input setby_inp, output [15:0] SETBY_OUTPUT, output [15:0] GET_OUTPUT);
parameter INSTANCE_NAME="INST";
  reg [15:0] R = 16'd0;
  wire [15:0] regby_inner_process_output;
  always @(posedge CLK) begin if(set_valid===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'R' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if(setby_valid===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'R' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if((({4'b0,set_valid})+({4'b0,setby_valid})) > 5'd1) begin $display("error, function 'set' on instance 'R' in module '%s' has multiple valid bits active in same cycle!",INSTANCE_NAME);$finish(); end end
  wire [16:0] unnamedcallArbitrate3648USEDMULTIPLEcallArbitrate;assign unnamedcallArbitrate3648USEDMULTIPLEcallArbitrate = {(set_valid||setby_valid),((set_valid)?(set_inp):(regby_inner_process_output))}; 
    always @ (posedge CLK) begin if ((unnamedcallArbitrate3648USEDMULTIPLEcallArbitrate[16]) && CE) begin R <= (unnamedcallArbitrate3648USEDMULTIPLEcallArbitrate[15:0]); end end
  assign SETBY_OUTPUT = regby_inner_process_output;
  assign GET_OUTPUT = R;
  // function: set pure=false ONLY WIRE
  // function: setby pure=false ONLY WIRE
  // function: get pure=true ONLY WIRE
  incif_wrapuint16_646_inc2 #(.INSTANCE_NAME({INSTANCE_NAME,"_regby_inner"})) regby_inner(.CLK(CLK), .CE(CE), .process_input({setby_inp,R}), .process_output(regby_inner_process_output));
endmodule

module PosSeq_W648_H482_T2(input CLK, input process_valid, input CE, output [63:0] process_output, input reset);
parameter INSTANCE_NAME="INST";
always @(posedge CLK) begin if(process_valid===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'process'", INSTANCE_NAME);  end end
always @(posedge CLK) begin if(reset===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'reset'", INSTANCE_NAME);  end end
  wire [15:0] posX_posSeq_GET_OUTPUT;
  wire [15:0] posY_posSeq_GET_OUTPUT;
  reg [31:0] unnamedtuple3660_delay1_validunnamednull0_CECE;  always @ (posedge CLK) begin if (CE) begin unnamedtuple3660_delay1_validunnamednull0_CECE <= {posY_posSeq_GET_OUTPUT,posX_posSeq_GET_OUTPUT}; end end
  reg [15:0] unnamedbinop3664_delay1_validunnamednull0_CECE;  always @ (posedge CLK) begin if (CE) begin unnamedbinop3664_delay1_validunnamednull0_CECE <= {(posX_posSeq_GET_OUTPUT+(16'd1))}; end end
  reg [15:0] unnamedcall3659_delay1_validunnamednull0_CECE;  always @ (posedge CLK) begin if (CE) begin unnamedcall3659_delay1_validunnamednull0_CECE <= posY_posSeq_GET_OUTPUT; end end
  wire [15:0] posX_posSeq_SETBY_OUTPUT;
  wire [15:0] posY_posSeq_SETBY_OUTPUT;
  assign process_output = {{unnamedcall3659_delay1_validunnamednull0_CECE,unnamedbinop3664_delay1_validunnamednull0_CECE},unnamedtuple3660_delay1_validunnamednull0_CECE};
  // function: process pure=false delay=1
  // function: reset pure=false delay=0
  RegBy_incif_wrapuint16_646_inc2_CEtrue_init0 #(.INSTANCE_NAME({INSTANCE_NAME,"_posX_posSeq"})) posX_posSeq(.CLK(CLK), .set_valid(reset), .CE(CE), .set_inp((16'd0)), .setby_valid(process_valid), .setby_inp((1'd1)), .SETBY_OUTPUT(posX_posSeq_SETBY_OUTPUT), .GET_OUTPUT(posX_posSeq_GET_OUTPUT));
  RegBy_incif_wrapuint16_481_incnil_CEtrue_init0 #(.INSTANCE_NAME({INSTANCE_NAME,"_posY_posSeq"})) posY_posSeq(.CLK(CLK), .set_valid(reset), .CE(CE), .set_inp((16'd0)), .setby_valid(process_valid), .setby_inp({(posX_posSeq_GET_OUTPUT==(16'd646))}), .SETBY_OUTPUT(posY_posSeq_SETBY_OUTPUT), .GET_OUTPUT(posY_posSeq_GET_OUTPUT));
endmodule

module packTupleArrays_table__0x068d2a78(input CLK, input process_CE, input [399:0] process_input, output [399:0] process_output);
parameter INSTANCE_NAME="INST";
  wire [63:0] unnamedcast3515USEDMULTIPLEcast;assign unnamedcast3515USEDMULTIPLEcast = (process_input[63:0]); 
  wire [335:0] unnamedcast3519USEDMULTIPLEcast;assign unnamedcast3519USEDMULTIPLEcast = (process_input[399:64]); 
  assign process_output = {{({unnamedcast3519USEDMULTIPLEcast[335:168]}),({unnamedcast3515USEDMULTIPLEcast[63:32]})},{({unnamedcast3519USEDMULTIPLEcast[167:0]}),({unnamedcast3515USEDMULTIPLEcast[31:0]})}};
  // function: process pure=true delay=0
endmodule

module index___uint16_uint16__uint8_7_3___1(input CLK, input process_CE, input [199:0] inp, output [167:0] process_output);
parameter INSTANCE_NAME="INST";
  assign process_output = (inp[199:32]);
  // function: process pure=true delay=0
endmodule

module index___uint16_uint16__uint8_7_3___0(input CLK, input process_CE, input [199:0] inp, output [31:0] process_output);
parameter INSTANCE_NAME="INST";
  assign process_output = (inp[31:0]);
  // function: process pure=true delay=0
endmodule

module kern1(input CLK, input process_CE, input [31:0] ksi, output [167:0] process_output);
parameter INSTANCE_NAME="INST";
  wire [15:0] unnamedcast1214USEDMULTIPLEcast;assign unnamedcast1214USEDMULTIPLEcast = (16'd1); 
  reg [15:0] unnamedbinop1215_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedbinop1215_delay1_validunnamednull0_CEprocess_CE <= {((ksi[15:0])+unnamedcast1214USEDMULTIPLEcast)}; end end
  reg [15:0] unnamedcast1214_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast1214_delay1_validunnamednull0_CEprocess_CE <= unnamedcast1214USEDMULTIPLEcast; end end
  reg [15:0] unnamedbinop1218_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedbinop1218_delay1_validunnamednull0_CEprocess_CE <= {(unnamedbinop1215_delay1_validunnamednull0_CEprocess_CE&unnamedcast1214_delay1_validunnamednull0_CEprocess_CE)}; end end
  reg [15:0] unnamedbinop1218_delay2_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedbinop1218_delay2_validunnamednull0_CEprocess_CE <= unnamedbinop1218_delay1_validunnamednull0_CEprocess_CE; end end
  reg [15:0] unnamedbinop1224_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedbinop1224_delay1_validunnamednull0_CEprocess_CE <= {((ksi[31:16])+unnamedcast1214USEDMULTIPLEcast)}; end end
  reg [15:0] unnamedbinop1227_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedbinop1227_delay1_validunnamednull0_CEprocess_CE <= {(unnamedbinop1224_delay1_validunnamednull0_CEprocess_CE&unnamedcast1214_delay1_validunnamednull0_CEprocess_CE)}; end end
  reg [15:0] unnamedcast1229_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast1229_delay1_validunnamednull0_CEprocess_CE <= (16'd2); end end
  reg [15:0] unnamedcast1229_delay2_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast1229_delay2_validunnamednull0_CEprocess_CE <= unnamedcast1229_delay1_validunnamednull0_CEprocess_CE; end end
  reg [15:0] unnamedbinop1230_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedbinop1230_delay1_validunnamednull0_CEprocess_CE <= {(unnamedbinop1227_delay1_validunnamednull0_CEprocess_CE*unnamedcast1229_delay2_validunnamednull0_CEprocess_CE)}; end end
  reg [15:0] unnamedbinop1231_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedbinop1231_delay1_validunnamednull0_CEprocess_CE <= {(unnamedbinop1218_delay2_validunnamednull0_CEprocess_CE+unnamedbinop1230_delay1_validunnamednull0_CEprocess_CE)}; end end
  reg [15:0] unnamedcast1237_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast1237_delay1_validunnamednull0_CEprocess_CE <= (16'd0); end end
  reg [15:0] unnamedcast1237_delay2_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast1237_delay2_validunnamednull0_CEprocess_CE <= unnamedcast1237_delay1_validunnamednull0_CEprocess_CE; end end
  reg [15:0] unnamedcast1237_delay3_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast1237_delay3_validunnamednull0_CEprocess_CE <= unnamedcast1237_delay2_validunnamednull0_CEprocess_CE; end end
  reg [15:0] unnamedcast1237_delay4_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast1237_delay4_validunnamednull0_CEprocess_CE <= unnamedcast1237_delay3_validunnamednull0_CEprocess_CE; end end
  reg unnamedbinop1238_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedbinop1238_delay1_validunnamednull0_CEprocess_CE <= {(unnamedbinop1231_delay1_validunnamednull0_CEprocess_CE==unnamedcast1237_delay4_validunnamednull0_CEprocess_CE)}; end end
  wire [168:0] unnamedtuple1239USEDMULTIPLEtuple;assign unnamedtuple1239USEDMULTIPLEtuple = {unnamedbinop1238_delay1_validunnamednull0_CEprocess_CE,({8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd2, 8'd0, 8'd2, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0})}; 
  reg [15:0] unnamedcast1214_delay2_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast1214_delay2_validunnamednull0_CEprocess_CE <= unnamedcast1214_delay1_validunnamednull0_CEprocess_CE; end end
  reg [15:0] unnamedcast1214_delay3_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast1214_delay3_validunnamednull0_CEprocess_CE <= unnamedcast1214_delay2_validunnamednull0_CEprocess_CE; end end
  reg [15:0] unnamedcast1214_delay4_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast1214_delay4_validunnamednull0_CEprocess_CE <= unnamedcast1214_delay3_validunnamednull0_CEprocess_CE; end end
  reg unnamedbinop1242_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedbinop1242_delay1_validunnamednull0_CEprocess_CE <= {(unnamedbinop1231_delay1_validunnamednull0_CEprocess_CE==unnamedcast1214_delay4_validunnamednull0_CEprocess_CE)}; end end
  reg [168:0] unnamedselect1254_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedselect1254_delay1_validunnamednull0_CEprocess_CE <= (((unnamedtuple1239USEDMULTIPLEtuple[168]))?(unnamedtuple1239USEDMULTIPLEtuple):({unnamedbinop1242_delay1_validunnamednull0_CEprocess_CE,({8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd4, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0})})); end end
  reg [15:0] unnamedcast1229_delay3_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast1229_delay3_validunnamednull0_CEprocess_CE <= unnamedcast1229_delay2_validunnamednull0_CEprocess_CE; end end
  reg [15:0] unnamedcast1229_delay4_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast1229_delay4_validunnamednull0_CEprocess_CE <= unnamedcast1229_delay3_validunnamednull0_CEprocess_CE; end end
  reg unnamedbinop1246_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedbinop1246_delay1_validunnamednull0_CEprocess_CE <= {(unnamedbinop1231_delay1_validunnamednull0_CEprocess_CE==unnamedcast1229_delay4_validunnamednull0_CEprocess_CE)}; end end
  wire [168:0] unnamedtuple1247USEDMULTIPLEtuple;assign unnamedtuple1247USEDMULTIPLEtuple = {unnamedbinop1246_delay1_validunnamednull0_CEprocess_CE,({8'd0, 8'd0, 8'd0, 8'd0, 8'd1, 8'd0, 8'd1, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd1, 8'd0, 8'd1})}; 
  reg [15:0] unnamedcast1249_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast1249_delay1_validunnamednull0_CEprocess_CE <= (16'd3); end end
  reg [15:0] unnamedcast1249_delay2_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast1249_delay2_validunnamednull0_CEprocess_CE <= unnamedcast1249_delay1_validunnamednull0_CEprocess_CE; end end
  reg [15:0] unnamedcast1249_delay3_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast1249_delay3_validunnamednull0_CEprocess_CE <= unnamedcast1249_delay2_validunnamednull0_CEprocess_CE; end end
  reg [15:0] unnamedcast1249_delay4_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast1249_delay4_validunnamednull0_CEprocess_CE <= unnamedcast1249_delay3_validunnamednull0_CEprocess_CE; end end
  reg unnamedbinop1250_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedbinop1250_delay1_validunnamednull0_CEprocess_CE <= {(unnamedbinop1231_delay1_validunnamednull0_CEprocess_CE==unnamedcast1249_delay4_validunnamednull0_CEprocess_CE)}; end end
  reg [168:0] unnamedselect1257_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedselect1257_delay1_validunnamednull0_CEprocess_CE <= (((unnamedtuple1247USEDMULTIPLEtuple[168]))?(unnamedtuple1247USEDMULTIPLEtuple):({unnamedbinop1250_delay1_validunnamednull0_CEprocess_CE,({8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd2, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd2, 8'd0})})); end end
  reg [168:0] unnamedselect1260_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedselect1260_delay1_validunnamednull0_CEprocess_CE <= (((unnamedselect1254_delay1_validunnamednull0_CEprocess_CE[168]))?(unnamedselect1254_delay1_validunnamednull0_CEprocess_CE):(unnamedselect1257_delay1_validunnamednull0_CEprocess_CE)); end end
  assign process_output = (unnamedselect1260_delay1_validunnamednull0_CEprocess_CE[167:0]);
  // function: process pure=true delay=7
endmodule

module packTupleArrays_table__0x060ff220(input CLK, input process_CE, input [335:0] process_input, output [335:0] process_output);
parameter INSTANCE_NAME="INST";
  wire [167:0] unnamedcast1357USEDMULTIPLEcast;assign unnamedcast1357USEDMULTIPLEcast = (process_input[167:0]); 
  wire [167:0] unnamedcast1361USEDMULTIPLEcast;assign unnamedcast1361USEDMULTIPLEcast = (process_input[335:168]); 
  assign process_output = {{({unnamedcast1361USEDMULTIPLEcast[167:160]}),({unnamedcast1357USEDMULTIPLEcast[167:160]})},{({unnamedcast1361USEDMULTIPLEcast[159:152]}),({unnamedcast1357USEDMULTIPLEcast[159:152]})},{({unnamedcast1361USEDMULTIPLEcast[151:144]}),({unnamedcast1357USEDMULTIPLEcast[151:144]})},{({unnamedcast1361USEDMULTIPLEcast[143:136]}),({unnamedcast1357USEDMULTIPLEcast[143:136]})},{({unnamedcast1361USEDMULTIPLEcast[135:128]}),({unnamedcast1357USEDMULTIPLEcast[135:128]})},{({unnamedcast1361USEDMULTIPLEcast[127:120]}),({unnamedcast1357USEDMULTIPLEcast[127:120]})},{({unnamedcast1361USEDMULTIPLEcast[119:112]}),({unnamedcast1357USEDMULTIPLEcast[119:112]})},{({unnamedcast1361USEDMULTIPLEcast[111:104]}),({unnamedcast1357USEDMULTIPLEcast[111:104]})},{({unnamedcast1361USEDMULTIPLEcast[103:96]}),({unnamedcast1357USEDMULTIPLEcast[103:96]})},{({unnamedcast1361USEDMULTIPLEcast[95:88]}),({unnamedcast1357USEDMULTIPLEcast[95:88]})},{({unnamedcast1361USEDMULTIPLEcast[87:80]}),({unnamedcast1357USEDMULTIPLEcast[87:80]})},{({unnamedcast1361USEDMULTIPLEcast[79:72]}),({unnamedcast1357USEDMULTIPLEcast[79:72]})},{({unnamedcast1361USEDMULTIPLEcast[71:64]}),({unnamedcast1357USEDMULTIPLEcast[71:64]})},{({unnamedcast1361USEDMULTIPLEcast[63:56]}),({unnamedcast1357USEDMULTIPLEcast[63:56]})},{({unnamedcast1361USEDMULTIPLEcast[55:48]}),({unnamedcast1357USEDMULTIPLEcast[55:48]})},{({unnamedcast1361USEDMULTIPLEcast[47:40]}),({unnamedcast1357USEDMULTIPLEcast[47:40]})},{({unnamedcast1361USEDMULTIPLEcast[39:32]}),({unnamedcast1357USEDMULTIPLEcast[39:32]})},{({unnamedcast1361USEDMULTIPLEcast[31:24]}),({unnamedcast1357USEDMULTIPLEcast[31:24]})},{({unnamedcast1361USEDMULTIPLEcast[23:16]}),({unnamedcast1357USEDMULTIPLEcast[23:16]})},{({unnamedcast1361USEDMULTIPLEcast[15:8]}),({unnamedcast1357USEDMULTIPLEcast[15:8]})},{({unnamedcast1361USEDMULTIPLEcast[7:0]}),({unnamedcast1357USEDMULTIPLEcast[7:0]})}};
  // function: process pure=true delay=0
endmodule

module partial_mult_Auint8_Buint8(input CLK, input process_CE, input [15:0] inp, output [15:0] process_output);
parameter INSTANCE_NAME="INST";
  reg [15:0] unnamedbinop1553_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedbinop1553_delay1_validunnamednull0_CEprocess_CE <= {({8'b0,(inp[7:0])}*{8'b0,(inp[15:8])})}; end end
  assign process_output = unnamedbinop1553_delay1_validunnamednull0_CEprocess_CE;
  // function: process pure=true delay=1
endmodule

module map_partial_mult_Auint8_Buint8_W7_H3(input CLK, input process_CE, input [335:0] process_input, output [335:0] process_output);
parameter INSTANCE_NAME="INST";
  wire [15:0] inner0_0_process_output;
  wire [15:0] inner1_0_process_output;
  wire [15:0] inner2_0_process_output;
  wire [15:0] inner3_0_process_output;
  wire [15:0] inner4_0_process_output;
  wire [15:0] inner5_0_process_output;
  wire [15:0] inner6_0_process_output;
  wire [15:0] inner0_1_process_output;
  wire [15:0] inner1_1_process_output;
  wire [15:0] inner2_1_process_output;
  wire [15:0] inner3_1_process_output;
  wire [15:0] inner4_1_process_output;
  wire [15:0] inner5_1_process_output;
  wire [15:0] inner6_1_process_output;
  wire [15:0] inner0_2_process_output;
  wire [15:0] inner1_2_process_output;
  wire [15:0] inner2_2_process_output;
  wire [15:0] inner3_2_process_output;
  wire [15:0] inner4_2_process_output;
  wire [15:0] inner5_2_process_output;
  wire [15:0] inner6_2_process_output;
  assign process_output = {inner6_2_process_output,inner5_2_process_output,inner4_2_process_output,inner3_2_process_output,inner2_2_process_output,inner1_2_process_output,inner0_2_process_output,inner6_1_process_output,inner5_1_process_output,inner4_1_process_output,inner3_1_process_output,inner2_1_process_output,inner1_1_process_output,inner0_1_process_output,inner6_0_process_output,inner5_0_process_output,inner4_0_process_output,inner3_0_process_output,inner2_0_process_output,inner1_0_process_output,inner0_0_process_output};
  // function: process pure=true delay=1
  partial_mult_Auint8_Buint8 #(.INSTANCE_NAME({INSTANCE_NAME,"_inner0_0"})) inner0_0(.CLK(CLK), .process_CE(process_CE), .inp(({process_input[15:0]})), .process_output(inner0_0_process_output));
  partial_mult_Auint8_Buint8 #(.INSTANCE_NAME({INSTANCE_NAME,"_inner1_0"})) inner1_0(.CLK(CLK), .process_CE(process_CE), .inp(({process_input[31:16]})), .process_output(inner1_0_process_output));
  partial_mult_Auint8_Buint8 #(.INSTANCE_NAME({INSTANCE_NAME,"_inner2_0"})) inner2_0(.CLK(CLK), .process_CE(process_CE), .inp(({process_input[47:32]})), .process_output(inner2_0_process_output));
  partial_mult_Auint8_Buint8 #(.INSTANCE_NAME({INSTANCE_NAME,"_inner3_0"})) inner3_0(.CLK(CLK), .process_CE(process_CE), .inp(({process_input[63:48]})), .process_output(inner3_0_process_output));
  partial_mult_Auint8_Buint8 #(.INSTANCE_NAME({INSTANCE_NAME,"_inner4_0"})) inner4_0(.CLK(CLK), .process_CE(process_CE), .inp(({process_input[79:64]})), .process_output(inner4_0_process_output));
  partial_mult_Auint8_Buint8 #(.INSTANCE_NAME({INSTANCE_NAME,"_inner5_0"})) inner5_0(.CLK(CLK), .process_CE(process_CE), .inp(({process_input[95:80]})), .process_output(inner5_0_process_output));
  partial_mult_Auint8_Buint8 #(.INSTANCE_NAME({INSTANCE_NAME,"_inner6_0"})) inner6_0(.CLK(CLK), .process_CE(process_CE), .inp(({process_input[111:96]})), .process_output(inner6_0_process_output));
  partial_mult_Auint8_Buint8 #(.INSTANCE_NAME({INSTANCE_NAME,"_inner0_1"})) inner0_1(.CLK(CLK), .process_CE(process_CE), .inp(({process_input[127:112]})), .process_output(inner0_1_process_output));
  partial_mult_Auint8_Buint8 #(.INSTANCE_NAME({INSTANCE_NAME,"_inner1_1"})) inner1_1(.CLK(CLK), .process_CE(process_CE), .inp(({process_input[143:128]})), .process_output(inner1_1_process_output));
  partial_mult_Auint8_Buint8 #(.INSTANCE_NAME({INSTANCE_NAME,"_inner2_1"})) inner2_1(.CLK(CLK), .process_CE(process_CE), .inp(({process_input[159:144]})), .process_output(inner2_1_process_output));
  partial_mult_Auint8_Buint8 #(.INSTANCE_NAME({INSTANCE_NAME,"_inner3_1"})) inner3_1(.CLK(CLK), .process_CE(process_CE), .inp(({process_input[175:160]})), .process_output(inner3_1_process_output));
  partial_mult_Auint8_Buint8 #(.INSTANCE_NAME({INSTANCE_NAME,"_inner4_1"})) inner4_1(.CLK(CLK), .process_CE(process_CE), .inp(({process_input[191:176]})), .process_output(inner4_1_process_output));
  partial_mult_Auint8_Buint8 #(.INSTANCE_NAME({INSTANCE_NAME,"_inner5_1"})) inner5_1(.CLK(CLK), .process_CE(process_CE), .inp(({process_input[207:192]})), .process_output(inner5_1_process_output));
  partial_mult_Auint8_Buint8 #(.INSTANCE_NAME({INSTANCE_NAME,"_inner6_1"})) inner6_1(.CLK(CLK), .process_CE(process_CE), .inp(({process_input[223:208]})), .process_output(inner6_1_process_output));
  partial_mult_Auint8_Buint8 #(.INSTANCE_NAME({INSTANCE_NAME,"_inner0_2"})) inner0_2(.CLK(CLK), .process_CE(process_CE), .inp(({process_input[239:224]})), .process_output(inner0_2_process_output));
  partial_mult_Auint8_Buint8 #(.INSTANCE_NAME({INSTANCE_NAME,"_inner1_2"})) inner1_2(.CLK(CLK), .process_CE(process_CE), .inp(({process_input[255:240]})), .process_output(inner1_2_process_output));
  partial_mult_Auint8_Buint8 #(.INSTANCE_NAME({INSTANCE_NAME,"_inner2_2"})) inner2_2(.CLK(CLK), .process_CE(process_CE), .inp(({process_input[271:256]})), .process_output(inner2_2_process_output));
  partial_mult_Auint8_Buint8 #(.INSTANCE_NAME({INSTANCE_NAME,"_inner3_2"})) inner3_2(.CLK(CLK), .process_CE(process_CE), .inp(({process_input[287:272]})), .process_output(inner3_2_process_output));
  partial_mult_Auint8_Buint8 #(.INSTANCE_NAME({INSTANCE_NAME,"_inner4_2"})) inner4_2(.CLK(CLK), .process_CE(process_CE), .inp(({process_input[303:288]})), .process_output(inner4_2_process_output));
  partial_mult_Auint8_Buint8 #(.INSTANCE_NAME({INSTANCE_NAME,"_inner5_2"})) inner5_2(.CLK(CLK), .process_CE(process_CE), .inp(({process_input[319:304]})), .process_output(inner5_2_process_output));
  partial_mult_Auint8_Buint8 #(.INSTANCE_NAME({INSTANCE_NAME,"_inner6_2"})) inner6_2(.CLK(CLK), .process_CE(process_CE), .inp(({process_input[335:320]})), .process_output(inner6_2_process_output));
endmodule

module sum_asyncfalse(input CLK, input process_CE, input [31:0] inp, output [15:0] process_output);
parameter INSTANCE_NAME="INST";
  reg [15:0] unnamedbinop1637_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedbinop1637_delay1_validunnamednull0_CEprocess_CE <= {((inp[15:0])+(inp[31:16]))}; end end
  assign process_output = unnamedbinop1637_delay1_validunnamednull0_CEprocess_CE;
  // function: process pure=true delay=1
endmodule

module reduce_sum_asyncfalse_W7_H3(input CLK, input process_CE, input [335:0] process_input, output [15:0] process_output);
parameter INSTANCE_NAME="INST";
  wire [15:0] inner0_process_output;
  wire [15:0] inner1_process_output;
  wire [15:0] inner10_process_output;
  wire [15:0] inner2_process_output;
  wire [15:0] inner3_process_output;
  wire [15:0] inner11_process_output;
  wire [15:0] inner15_process_output;
  wire [15:0] inner4_process_output;
  wire [15:0] inner5_process_output;
  wire [15:0] inner12_process_output;
  wire [15:0] inner6_process_output;
  wire [15:0] inner7_process_output;
  wire [15:0] inner13_process_output;
  wire [15:0] inner16_process_output;
  wire [15:0] inner18_process_output;
  wire [15:0] inner8_process_output;
  wire [15:0] inner9_process_output;
  wire [15:0] inner14_process_output;
  reg [15:0] unnamedcast1691_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast1691_delay1_validunnamednull0_CEprocess_CE <= ({process_input[335:320]}); end end
  reg [15:0] unnamedcast1691_delay2_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast1691_delay2_validunnamednull0_CEprocess_CE <= unnamedcast1691_delay1_validunnamednull0_CEprocess_CE; end end
  wire [15:0] inner17_process_output;
  reg [15:0] unnamedcall1727_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcall1727_delay1_validunnamednull0_CEprocess_CE <= inner17_process_output; end end
  wire [15:0] inner19_process_output;
  assign process_output = inner19_process_output;
  // function: process pure=true delay=5
  sum_asyncfalse #(.INSTANCE_NAME({INSTANCE_NAME,"_inner0"})) inner0(.CLK(CLK), .process_CE(process_CE), .inp({({process_input[31:16]}),({process_input[15:0]})}), .process_output(inner0_process_output));
  sum_asyncfalse #(.INSTANCE_NAME({INSTANCE_NAME,"_inner1"})) inner1(.CLK(CLK), .process_CE(process_CE), .inp({({process_input[63:48]}),({process_input[47:32]})}), .process_output(inner1_process_output));
  sum_asyncfalse #(.INSTANCE_NAME({INSTANCE_NAME,"_inner2"})) inner2(.CLK(CLK), .process_CE(process_CE), .inp({({process_input[95:80]}),({process_input[79:64]})}), .process_output(inner2_process_output));
  sum_asyncfalse #(.INSTANCE_NAME({INSTANCE_NAME,"_inner3"})) inner3(.CLK(CLK), .process_CE(process_CE), .inp({({process_input[127:112]}),({process_input[111:96]})}), .process_output(inner3_process_output));
  sum_asyncfalse #(.INSTANCE_NAME({INSTANCE_NAME,"_inner4"})) inner4(.CLK(CLK), .process_CE(process_CE), .inp({({process_input[159:144]}),({process_input[143:128]})}), .process_output(inner4_process_output));
  sum_asyncfalse #(.INSTANCE_NAME({INSTANCE_NAME,"_inner5"})) inner5(.CLK(CLK), .process_CE(process_CE), .inp({({process_input[191:176]}),({process_input[175:160]})}), .process_output(inner5_process_output));
  sum_asyncfalse #(.INSTANCE_NAME({INSTANCE_NAME,"_inner6"})) inner6(.CLK(CLK), .process_CE(process_CE), .inp({({process_input[223:208]}),({process_input[207:192]})}), .process_output(inner6_process_output));
  sum_asyncfalse #(.INSTANCE_NAME({INSTANCE_NAME,"_inner7"})) inner7(.CLK(CLK), .process_CE(process_CE), .inp({({process_input[255:240]}),({process_input[239:224]})}), .process_output(inner7_process_output));
  sum_asyncfalse #(.INSTANCE_NAME({INSTANCE_NAME,"_inner8"})) inner8(.CLK(CLK), .process_CE(process_CE), .inp({({process_input[287:272]}),({process_input[271:256]})}), .process_output(inner8_process_output));
  sum_asyncfalse #(.INSTANCE_NAME({INSTANCE_NAME,"_inner9"})) inner9(.CLK(CLK), .process_CE(process_CE), .inp({({process_input[319:304]}),({process_input[303:288]})}), .process_output(inner9_process_output));
  sum_asyncfalse #(.INSTANCE_NAME({INSTANCE_NAME,"_inner10"})) inner10(.CLK(CLK), .process_CE(process_CE), .inp({inner1_process_output,inner0_process_output}), .process_output(inner10_process_output));
  sum_asyncfalse #(.INSTANCE_NAME({INSTANCE_NAME,"_inner11"})) inner11(.CLK(CLK), .process_CE(process_CE), .inp({inner3_process_output,inner2_process_output}), .process_output(inner11_process_output));
  sum_asyncfalse #(.INSTANCE_NAME({INSTANCE_NAME,"_inner12"})) inner12(.CLK(CLK), .process_CE(process_CE), .inp({inner5_process_output,inner4_process_output}), .process_output(inner12_process_output));
  sum_asyncfalse #(.INSTANCE_NAME({INSTANCE_NAME,"_inner13"})) inner13(.CLK(CLK), .process_CE(process_CE), .inp({inner7_process_output,inner6_process_output}), .process_output(inner13_process_output));
  sum_asyncfalse #(.INSTANCE_NAME({INSTANCE_NAME,"_inner14"})) inner14(.CLK(CLK), .process_CE(process_CE), .inp({inner9_process_output,inner8_process_output}), .process_output(inner14_process_output));
  sum_asyncfalse #(.INSTANCE_NAME({INSTANCE_NAME,"_inner15"})) inner15(.CLK(CLK), .process_CE(process_CE), .inp({inner11_process_output,inner10_process_output}), .process_output(inner15_process_output));
  sum_asyncfalse #(.INSTANCE_NAME({INSTANCE_NAME,"_inner16"})) inner16(.CLK(CLK), .process_CE(process_CE), .inp({inner13_process_output,inner12_process_output}), .process_output(inner16_process_output));
  sum_asyncfalse #(.INSTANCE_NAME({INSTANCE_NAME,"_inner17"})) inner17(.CLK(CLK), .process_CE(process_CE), .inp({unnamedcast1691_delay2_validunnamednull0_CEprocess_CE,inner14_process_output}), .process_output(inner17_process_output));
  sum_asyncfalse #(.INSTANCE_NAME({INSTANCE_NAME,"_inner18"})) inner18(.CLK(CLK), .process_CE(process_CE), .inp({inner16_process_output,inner15_process_output}), .process_output(inner18_process_output));
  sum_asyncfalse #(.INSTANCE_NAME({INSTANCE_NAME,"_inner19"})) inner19(.CLK(CLK), .process_CE(process_CE), .inp({unnamedcall1727_delay1_validunnamednull0_CEprocess_CE,inner18_process_output}), .process_output(inner19_process_output));
endmodule

module touint8(input CLK, input process_CE, input [15:0] inp, output [7:0] process_output);
parameter INSTANCE_NAME="INST";
  reg [15:0] unnamedbinop1734_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedbinop1734_delay1_validunnamednull0_CEprocess_CE <= {(inp>>>(16'd2))}; end end
  reg [15:0] unnamedcast1736_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast1736_delay1_validunnamednull0_CEprocess_CE <= (16'd255); end end
  reg unnamedbinop1737_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedbinop1737_delay1_validunnamednull0_CEprocess_CE <= {((unnamedbinop1734_delay1_validunnamednull0_CEprocess_CE)>(unnamedcast1736_delay1_validunnamednull0_CEprocess_CE))}; end end
  reg [7:0] unnamedcast1740_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast1740_delay1_validunnamednull0_CEprocess_CE <= (8'd255); end end
  reg [7:0] unnamedcast1740_delay2_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast1740_delay2_validunnamednull0_CEprocess_CE <= unnamedcast1740_delay1_validunnamednull0_CEprocess_CE; end end
  reg [7:0] unnamedcast1739_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast1739_delay1_validunnamednull0_CEprocess_CE <= unnamedbinop1734_delay1_validunnamednull0_CEprocess_CE[7:0]; end end
  reg [7:0] unnamedselect1741_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedselect1741_delay1_validunnamednull0_CEprocess_CE <= ((unnamedbinop1737_delay1_validunnamednull0_CEprocess_CE)?(unnamedcast1740_delay2_validunnamednull0_CEprocess_CE):(unnamedcast1739_delay1_validunnamednull0_CEprocess_CE)); end end
  assign process_output = unnamedselect1741_delay1_validunnamednull0_CEprocess_CE;
  // function: process pure=true delay=3
endmodule

module kern2(input CLK, input process_CE, input [31:0] ksi, output [167:0] process_output);
parameter INSTANCE_NAME="INST";
  wire [15:0] unnamedcast1767USEDMULTIPLEcast;assign unnamedcast1767USEDMULTIPLEcast = (16'd1); 
  reg [15:0] unnamedbinop1768_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedbinop1768_delay1_validunnamednull0_CEprocess_CE <= {((ksi[15:0])+unnamedcast1767USEDMULTIPLEcast)}; end end
  reg [15:0] unnamedcast1767_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast1767_delay1_validunnamednull0_CEprocess_CE <= unnamedcast1767USEDMULTIPLEcast; end end
  reg [15:0] unnamedbinop1771_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedbinop1771_delay1_validunnamednull0_CEprocess_CE <= {(unnamedbinop1768_delay1_validunnamednull0_CEprocess_CE&unnamedcast1767_delay1_validunnamednull0_CEprocess_CE)}; end end
  reg [15:0] unnamedbinop1771_delay2_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedbinop1771_delay2_validunnamednull0_CEprocess_CE <= unnamedbinop1771_delay1_validunnamednull0_CEprocess_CE; end end
  reg [15:0] unnamedbinop1777_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedbinop1777_delay1_validunnamednull0_CEprocess_CE <= {((ksi[31:16])+unnamedcast1767USEDMULTIPLEcast)}; end end
  reg [15:0] unnamedbinop1780_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedbinop1780_delay1_validunnamednull0_CEprocess_CE <= {(unnamedbinop1777_delay1_validunnamednull0_CEprocess_CE&unnamedcast1767_delay1_validunnamednull0_CEprocess_CE)}; end end
  reg [15:0] unnamedcast1782_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast1782_delay1_validunnamednull0_CEprocess_CE <= (16'd2); end end
  reg [15:0] unnamedcast1782_delay2_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast1782_delay2_validunnamednull0_CEprocess_CE <= unnamedcast1782_delay1_validunnamednull0_CEprocess_CE; end end
  reg [15:0] unnamedbinop1783_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedbinop1783_delay1_validunnamednull0_CEprocess_CE <= {(unnamedbinop1780_delay1_validunnamednull0_CEprocess_CE*unnamedcast1782_delay2_validunnamednull0_CEprocess_CE)}; end end
  reg [15:0] unnamedbinop1784_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedbinop1784_delay1_validunnamednull0_CEprocess_CE <= {(unnamedbinop1771_delay2_validunnamednull0_CEprocess_CE+unnamedbinop1783_delay1_validunnamednull0_CEprocess_CE)}; end end
  reg [15:0] unnamedcast1790_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast1790_delay1_validunnamednull0_CEprocess_CE <= (16'd0); end end
  reg [15:0] unnamedcast1790_delay2_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast1790_delay2_validunnamednull0_CEprocess_CE <= unnamedcast1790_delay1_validunnamednull0_CEprocess_CE; end end
  reg [15:0] unnamedcast1790_delay3_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast1790_delay3_validunnamednull0_CEprocess_CE <= unnamedcast1790_delay2_validunnamednull0_CEprocess_CE; end end
  reg [15:0] unnamedcast1790_delay4_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast1790_delay4_validunnamednull0_CEprocess_CE <= unnamedcast1790_delay3_validunnamednull0_CEprocess_CE; end end
  reg unnamedbinop1791_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedbinop1791_delay1_validunnamednull0_CEprocess_CE <= {(unnamedbinop1784_delay1_validunnamednull0_CEprocess_CE==unnamedcast1790_delay4_validunnamednull0_CEprocess_CE)}; end end
  wire [168:0] unnamedtuple1792USEDMULTIPLEtuple;assign unnamedtuple1792USEDMULTIPLEtuple = {unnamedbinop1791_delay1_validunnamednull0_CEprocess_CE,({8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd4, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0})}; 
  reg [15:0] unnamedcast1767_delay2_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast1767_delay2_validunnamednull0_CEprocess_CE <= unnamedcast1767_delay1_validunnamednull0_CEprocess_CE; end end
  reg [15:0] unnamedcast1767_delay3_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast1767_delay3_validunnamednull0_CEprocess_CE <= unnamedcast1767_delay2_validunnamednull0_CEprocess_CE; end end
  reg [15:0] unnamedcast1767_delay4_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast1767_delay4_validunnamednull0_CEprocess_CE <= unnamedcast1767_delay3_validunnamednull0_CEprocess_CE; end end
  reg unnamedbinop1795_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedbinop1795_delay1_validunnamednull0_CEprocess_CE <= {(unnamedbinop1784_delay1_validunnamednull0_CEprocess_CE==unnamedcast1767_delay4_validunnamednull0_CEprocess_CE)}; end end
  reg [168:0] unnamedselect1807_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedselect1807_delay1_validunnamednull0_CEprocess_CE <= (((unnamedtuple1792USEDMULTIPLEtuple[168]))?(unnamedtuple1792USEDMULTIPLEtuple):({unnamedbinop1795_delay1_validunnamednull0_CEprocess_CE,({8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd2, 8'd0, 8'd2, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0})})); end end
  reg [15:0] unnamedcast1782_delay3_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast1782_delay3_validunnamednull0_CEprocess_CE <= unnamedcast1782_delay2_validunnamednull0_CEprocess_CE; end end
  reg [15:0] unnamedcast1782_delay4_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast1782_delay4_validunnamednull0_CEprocess_CE <= unnamedcast1782_delay3_validunnamednull0_CEprocess_CE; end end
  reg unnamedbinop1799_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedbinop1799_delay1_validunnamednull0_CEprocess_CE <= {(unnamedbinop1784_delay1_validunnamednull0_CEprocess_CE==unnamedcast1782_delay4_validunnamednull0_CEprocess_CE)}; end end
  wire [168:0] unnamedtuple1800USEDMULTIPLEtuple;assign unnamedtuple1800USEDMULTIPLEtuple = {unnamedbinop1799_delay1_validunnamednull0_CEprocess_CE,({8'd0, 8'd0, 8'd0, 8'd2, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd2, 8'd0, 8'd0, 8'd0})}; 
  reg [15:0] unnamedcast1802_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast1802_delay1_validunnamednull0_CEprocess_CE <= (16'd3); end end
  reg [15:0] unnamedcast1802_delay2_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast1802_delay2_validunnamednull0_CEprocess_CE <= unnamedcast1802_delay1_validunnamednull0_CEprocess_CE; end end
  reg [15:0] unnamedcast1802_delay3_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast1802_delay3_validunnamednull0_CEprocess_CE <= unnamedcast1802_delay2_validunnamednull0_CEprocess_CE; end end
  reg [15:0] unnamedcast1802_delay4_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast1802_delay4_validunnamednull0_CEprocess_CE <= unnamedcast1802_delay3_validunnamednull0_CEprocess_CE; end end
  reg unnamedbinop1803_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedbinop1803_delay1_validunnamednull0_CEprocess_CE <= {(unnamedbinop1784_delay1_validunnamednull0_CEprocess_CE==unnamedcast1802_delay4_validunnamednull0_CEprocess_CE)}; end end
  reg [168:0] unnamedselect1810_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedselect1810_delay1_validunnamednull0_CEprocess_CE <= (((unnamedtuple1800USEDMULTIPLEtuple[168]))?(unnamedtuple1800USEDMULTIPLEtuple):({unnamedbinop1803_delay1_validunnamednull0_CEprocess_CE,({8'd0, 8'd0, 8'd1, 8'd0, 8'd1, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd1, 8'd0, 8'd1, 8'd0, 8'd0})})); end end
  reg [168:0] unnamedselect1813_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedselect1813_delay1_validunnamednull0_CEprocess_CE <= (((unnamedselect1807_delay1_validunnamednull0_CEprocess_CE[168]))?(unnamedselect1807_delay1_validunnamednull0_CEprocess_CE):(unnamedselect1810_delay1_validunnamednull0_CEprocess_CE)); end end
  assign process_output = (unnamedselect1813_delay1_validunnamednull0_CEprocess_CE[167:0]);
  // function: process pure=true delay=7
endmodule

module packTupleArrays_table__0x05765258(input CLK, input process_CE, input [335:0] process_input, output [335:0] process_output);
parameter INSTANCE_NAME="INST";
  wire [167:0] unnamedcast1910USEDMULTIPLEcast;assign unnamedcast1910USEDMULTIPLEcast = (process_input[167:0]); 
  wire [167:0] unnamedcast1914USEDMULTIPLEcast;assign unnamedcast1914USEDMULTIPLEcast = (process_input[335:168]); 
  assign process_output = {{({unnamedcast1914USEDMULTIPLEcast[167:160]}),({unnamedcast1910USEDMULTIPLEcast[167:160]})},{({unnamedcast1914USEDMULTIPLEcast[159:152]}),({unnamedcast1910USEDMULTIPLEcast[159:152]})},{({unnamedcast1914USEDMULTIPLEcast[151:144]}),({unnamedcast1910USEDMULTIPLEcast[151:144]})},{({unnamedcast1914USEDMULTIPLEcast[143:136]}),({unnamedcast1910USEDMULTIPLEcast[143:136]})},{({unnamedcast1914USEDMULTIPLEcast[135:128]}),({unnamedcast1910USEDMULTIPLEcast[135:128]})},{({unnamedcast1914USEDMULTIPLEcast[127:120]}),({unnamedcast1910USEDMULTIPLEcast[127:120]})},{({unnamedcast1914USEDMULTIPLEcast[119:112]}),({unnamedcast1910USEDMULTIPLEcast[119:112]})},{({unnamedcast1914USEDMULTIPLEcast[111:104]}),({unnamedcast1910USEDMULTIPLEcast[111:104]})},{({unnamedcast1914USEDMULTIPLEcast[103:96]}),({unnamedcast1910USEDMULTIPLEcast[103:96]})},{({unnamedcast1914USEDMULTIPLEcast[95:88]}),({unnamedcast1910USEDMULTIPLEcast[95:88]})},{({unnamedcast1914USEDMULTIPLEcast[87:80]}),({unnamedcast1910USEDMULTIPLEcast[87:80]})},{({unnamedcast1914USEDMULTIPLEcast[79:72]}),({unnamedcast1910USEDMULTIPLEcast[79:72]})},{({unnamedcast1914USEDMULTIPLEcast[71:64]}),({unnamedcast1910USEDMULTIPLEcast[71:64]})},{({unnamedcast1914USEDMULTIPLEcast[63:56]}),({unnamedcast1910USEDMULTIPLEcast[63:56]})},{({unnamedcast1914USEDMULTIPLEcast[55:48]}),({unnamedcast1910USEDMULTIPLEcast[55:48]})},{({unnamedcast1914USEDMULTIPLEcast[47:40]}),({unnamedcast1910USEDMULTIPLEcast[47:40]})},{({unnamedcast1914USEDMULTIPLEcast[39:32]}),({unnamedcast1910USEDMULTIPLEcast[39:32]})},{({unnamedcast1914USEDMULTIPLEcast[31:24]}),({unnamedcast1910USEDMULTIPLEcast[31:24]})},{({unnamedcast1914USEDMULTIPLEcast[23:16]}),({unnamedcast1910USEDMULTIPLEcast[23:16]})},{({unnamedcast1914USEDMULTIPLEcast[15:8]}),({unnamedcast1910USEDMULTIPLEcast[15:8]})},{({unnamedcast1914USEDMULTIPLEcast[7:0]}),({unnamedcast1910USEDMULTIPLEcast[7:0]})}};
  // function: process pure=true delay=0
endmodule

module kern3(input CLK, input process_CE, input [31:0] ksi, output [167:0] process_output);
parameter INSTANCE_NAME="INST";
  wire [15:0] unnamedcast2104USEDMULTIPLEcast;assign unnamedcast2104USEDMULTIPLEcast = (16'd1); 
  reg [15:0] unnamedbinop2105_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedbinop2105_delay1_validunnamednull0_CEprocess_CE <= {((ksi[15:0])+unnamedcast2104USEDMULTIPLEcast)}; end end
  reg [15:0] unnamedcast2104_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast2104_delay1_validunnamednull0_CEprocess_CE <= unnamedcast2104USEDMULTIPLEcast; end end
  reg [15:0] unnamedbinop2108_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedbinop2108_delay1_validunnamednull0_CEprocess_CE <= {(unnamedbinop2105_delay1_validunnamednull0_CEprocess_CE&unnamedcast2104_delay1_validunnamednull0_CEprocess_CE)}; end end
  reg [15:0] unnamedbinop2108_delay2_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedbinop2108_delay2_validunnamednull0_CEprocess_CE <= unnamedbinop2108_delay1_validunnamednull0_CEprocess_CE; end end
  reg [15:0] unnamedbinop2114_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedbinop2114_delay1_validunnamednull0_CEprocess_CE <= {((ksi[31:16])+unnamedcast2104USEDMULTIPLEcast)}; end end
  reg [15:0] unnamedbinop2117_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedbinop2117_delay1_validunnamednull0_CEprocess_CE <= {(unnamedbinop2114_delay1_validunnamednull0_CEprocess_CE&unnamedcast2104_delay1_validunnamednull0_CEprocess_CE)}; end end
  reg [15:0] unnamedcast2119_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast2119_delay1_validunnamednull0_CEprocess_CE <= (16'd2); end end
  reg [15:0] unnamedcast2119_delay2_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast2119_delay2_validunnamednull0_CEprocess_CE <= unnamedcast2119_delay1_validunnamednull0_CEprocess_CE; end end
  reg [15:0] unnamedbinop2120_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedbinop2120_delay1_validunnamednull0_CEprocess_CE <= {(unnamedbinop2117_delay1_validunnamednull0_CEprocess_CE*unnamedcast2119_delay2_validunnamednull0_CEprocess_CE)}; end end
  reg [15:0] unnamedbinop2121_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedbinop2121_delay1_validunnamednull0_CEprocess_CE <= {(unnamedbinop2108_delay2_validunnamednull0_CEprocess_CE+unnamedbinop2120_delay1_validunnamednull0_CEprocess_CE)}; end end
  reg [15:0] unnamedcast2127_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast2127_delay1_validunnamednull0_CEprocess_CE <= (16'd0); end end
  reg [15:0] unnamedcast2127_delay2_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast2127_delay2_validunnamednull0_CEprocess_CE <= unnamedcast2127_delay1_validunnamednull0_CEprocess_CE; end end
  reg [15:0] unnamedcast2127_delay3_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast2127_delay3_validunnamednull0_CEprocess_CE <= unnamedcast2127_delay2_validunnamednull0_CEprocess_CE; end end
  reg [15:0] unnamedcast2127_delay4_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast2127_delay4_validunnamednull0_CEprocess_CE <= unnamedcast2127_delay3_validunnamednull0_CEprocess_CE; end end
  reg unnamedbinop2128_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedbinop2128_delay1_validunnamednull0_CEprocess_CE <= {(unnamedbinop2121_delay1_validunnamednull0_CEprocess_CE==unnamedcast2127_delay4_validunnamednull0_CEprocess_CE)}; end end
  wire [168:0] unnamedtuple2129USEDMULTIPLEtuple;assign unnamedtuple2129USEDMULTIPLEtuple = {unnamedbinop2128_delay1_validunnamednull0_CEprocess_CE,({8'd0, 8'd0, 8'd0, 8'd2, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd2, 8'd0, 8'd0, 8'd0})}; 
  reg [15:0] unnamedcast2104_delay2_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast2104_delay2_validunnamednull0_CEprocess_CE <= unnamedcast2104_delay1_validunnamednull0_CEprocess_CE; end end
  reg [15:0] unnamedcast2104_delay3_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast2104_delay3_validunnamednull0_CEprocess_CE <= unnamedcast2104_delay2_validunnamednull0_CEprocess_CE; end end
  reg [15:0] unnamedcast2104_delay4_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast2104_delay4_validunnamednull0_CEprocess_CE <= unnamedcast2104_delay3_validunnamednull0_CEprocess_CE; end end
  reg unnamedbinop2132_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedbinop2132_delay1_validunnamednull0_CEprocess_CE <= {(unnamedbinop2121_delay1_validunnamednull0_CEprocess_CE==unnamedcast2104_delay4_validunnamednull0_CEprocess_CE)}; end end
  reg [168:0] unnamedselect2144_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedselect2144_delay1_validunnamednull0_CEprocess_CE <= (((unnamedtuple2129USEDMULTIPLEtuple[168]))?(unnamedtuple2129USEDMULTIPLEtuple):({unnamedbinop2132_delay1_validunnamednull0_CEprocess_CE,({8'd0, 8'd0, 8'd1, 8'd0, 8'd1, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd1, 8'd0, 8'd1, 8'd0, 8'd0})})); end end
  reg [15:0] unnamedcast2119_delay3_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast2119_delay3_validunnamednull0_CEprocess_CE <= unnamedcast2119_delay2_validunnamednull0_CEprocess_CE; end end
  reg [15:0] unnamedcast2119_delay4_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast2119_delay4_validunnamednull0_CEprocess_CE <= unnamedcast2119_delay3_validunnamednull0_CEprocess_CE; end end
  reg unnamedbinop2136_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedbinop2136_delay1_validunnamednull0_CEprocess_CE <= {(unnamedbinop2121_delay1_validunnamednull0_CEprocess_CE==unnamedcast2119_delay4_validunnamednull0_CEprocess_CE)}; end end
  wire [168:0] unnamedtuple2137USEDMULTIPLEtuple;assign unnamedtuple2137USEDMULTIPLEtuple = {unnamedbinop2136_delay1_validunnamednull0_CEprocess_CE,({8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd4, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0})}; 
  reg [15:0] unnamedcast2139_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast2139_delay1_validunnamednull0_CEprocess_CE <= (16'd3); end end
  reg [15:0] unnamedcast2139_delay2_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast2139_delay2_validunnamednull0_CEprocess_CE <= unnamedcast2139_delay1_validunnamednull0_CEprocess_CE; end end
  reg [15:0] unnamedcast2139_delay3_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast2139_delay3_validunnamednull0_CEprocess_CE <= unnamedcast2139_delay2_validunnamednull0_CEprocess_CE; end end
  reg [15:0] unnamedcast2139_delay4_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast2139_delay4_validunnamednull0_CEprocess_CE <= unnamedcast2139_delay3_validunnamednull0_CEprocess_CE; end end
  reg unnamedbinop2140_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedbinop2140_delay1_validunnamednull0_CEprocess_CE <= {(unnamedbinop2121_delay1_validunnamednull0_CEprocess_CE==unnamedcast2139_delay4_validunnamednull0_CEprocess_CE)}; end end
  reg [168:0] unnamedselect2147_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedselect2147_delay1_validunnamednull0_CEprocess_CE <= (((unnamedtuple2137USEDMULTIPLEtuple[168]))?(unnamedtuple2137USEDMULTIPLEtuple):({unnamedbinop2140_delay1_validunnamednull0_CEprocess_CE,({8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd2, 8'd0, 8'd2, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0})})); end end
  reg [168:0] unnamedselect2150_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedselect2150_delay1_validunnamednull0_CEprocess_CE <= (((unnamedselect2144_delay1_validunnamednull0_CEprocess_CE[168]))?(unnamedselect2144_delay1_validunnamednull0_CEprocess_CE):(unnamedselect2147_delay1_validunnamednull0_CEprocess_CE)); end end
  assign process_output = (unnamedselect2150_delay1_validunnamednull0_CEprocess_CE[167:0]);
  // function: process pure=true delay=7
endmodule

module packTupleArrays_table__0x0521c798(input CLK, input process_CE, input [335:0] process_input, output [335:0] process_output);
parameter INSTANCE_NAME="INST";
  wire [167:0] unnamedcast2247USEDMULTIPLEcast;assign unnamedcast2247USEDMULTIPLEcast = (process_input[167:0]); 
  wire [167:0] unnamedcast2251USEDMULTIPLEcast;assign unnamedcast2251USEDMULTIPLEcast = (process_input[335:168]); 
  assign process_output = {{({unnamedcast2251USEDMULTIPLEcast[167:160]}),({unnamedcast2247USEDMULTIPLEcast[167:160]})},{({unnamedcast2251USEDMULTIPLEcast[159:152]}),({unnamedcast2247USEDMULTIPLEcast[159:152]})},{({unnamedcast2251USEDMULTIPLEcast[151:144]}),({unnamedcast2247USEDMULTIPLEcast[151:144]})},{({unnamedcast2251USEDMULTIPLEcast[143:136]}),({unnamedcast2247USEDMULTIPLEcast[143:136]})},{({unnamedcast2251USEDMULTIPLEcast[135:128]}),({unnamedcast2247USEDMULTIPLEcast[135:128]})},{({unnamedcast2251USEDMULTIPLEcast[127:120]}),({unnamedcast2247USEDMULTIPLEcast[127:120]})},{({unnamedcast2251USEDMULTIPLEcast[119:112]}),({unnamedcast2247USEDMULTIPLEcast[119:112]})},{({unnamedcast2251USEDMULTIPLEcast[111:104]}),({unnamedcast2247USEDMULTIPLEcast[111:104]})},{({unnamedcast2251USEDMULTIPLEcast[103:96]}),({unnamedcast2247USEDMULTIPLEcast[103:96]})},{({unnamedcast2251USEDMULTIPLEcast[95:88]}),({unnamedcast2247USEDMULTIPLEcast[95:88]})},{({unnamedcast2251USEDMULTIPLEcast[87:80]}),({unnamedcast2247USEDMULTIPLEcast[87:80]})},{({unnamedcast2251USEDMULTIPLEcast[79:72]}),({unnamedcast2247USEDMULTIPLEcast[79:72]})},{({unnamedcast2251USEDMULTIPLEcast[71:64]}),({unnamedcast2247USEDMULTIPLEcast[71:64]})},{({unnamedcast2251USEDMULTIPLEcast[63:56]}),({unnamedcast2247USEDMULTIPLEcast[63:56]})},{({unnamedcast2251USEDMULTIPLEcast[55:48]}),({unnamedcast2247USEDMULTIPLEcast[55:48]})},{({unnamedcast2251USEDMULTIPLEcast[47:40]}),({unnamedcast2247USEDMULTIPLEcast[47:40]})},{({unnamedcast2251USEDMULTIPLEcast[39:32]}),({unnamedcast2247USEDMULTIPLEcast[39:32]})},{({unnamedcast2251USEDMULTIPLEcast[31:24]}),({unnamedcast2247USEDMULTIPLEcast[31:24]})},{({unnamedcast2251USEDMULTIPLEcast[23:16]}),({unnamedcast2247USEDMULTIPLEcast[23:16]})},{({unnamedcast2251USEDMULTIPLEcast[15:8]}),({unnamedcast2247USEDMULTIPLEcast[15:8]})},{({unnamedcast2251USEDMULTIPLEcast[7:0]}),({unnamedcast2247USEDMULTIPLEcast[7:0]})}};
  // function: process pure=true delay=0
endmodule

module dem(input CLK, input CE, input [199:0] process_input, output [23:0] process_output);
parameter INSTANCE_NAME="INST";
  wire [167:0] dat_process_output;
  reg [167:0] unnamedcall2437_delay1_validunnamednull0_CECE;  always @ (posedge CLK) begin if (CE) begin unnamedcall2437_delay1_validunnamednull0_CECE <= dat_process_output; end end
  reg [167:0] unnamedcall2437_delay2_validunnamednull0_CECE;  always @ (posedge CLK) begin if (CE) begin unnamedcall2437_delay2_validunnamednull0_CECE <= unnamedcall2437_delay1_validunnamednull0_CECE; end end
  reg [167:0] unnamedcall2437_delay3_validunnamednull0_CECE;  always @ (posedge CLK) begin if (CE) begin unnamedcall2437_delay3_validunnamednull0_CECE <= unnamedcall2437_delay2_validunnamednull0_CECE; end end
  reg [167:0] unnamedcall2437_delay4_validunnamednull0_CECE;  always @ (posedge CLK) begin if (CE) begin unnamedcall2437_delay4_validunnamednull0_CECE <= unnamedcall2437_delay3_validunnamednull0_CECE; end end
  reg [167:0] unnamedcall2437_delay5_validunnamednull0_CECE;  always @ (posedge CLK) begin if (CE) begin unnamedcall2437_delay5_validunnamednull0_CECE <= unnamedcall2437_delay4_validunnamednull0_CECE; end end
  reg [167:0] unnamedcall2437_delay6_validunnamednull0_CECE;  always @ (posedge CLK) begin if (CE) begin unnamedcall2437_delay6_validunnamednull0_CECE <= unnamedcall2437_delay5_validunnamednull0_CECE; end end
  reg [167:0] unnamedcall2437_delay7_validunnamednull0_CECE;  always @ (posedge CLK) begin if (CE) begin unnamedcall2437_delay7_validunnamednull0_CECE <= unnamedcall2437_delay6_validunnamednull0_CECE; end end
  wire [31:0] xy_process_output;
  wire [167:0] k1_process_output;
  wire [335:0] packedtup1_process_output;
  wire [335:0] partialll1_process_output;
  wire [15:0] sum1_process_output;
  wire [7:0] touint81_process_output;
  wire [167:0] k2_process_output;
  wire [335:0] packedtup2_process_output;
  wire [335:0] partialll2_process_output;
  wire [15:0] sum2_process_output;
  wire [7:0] touint82_process_output;
  wire [167:0] k3_process_output;
  wire [335:0] packedtup3_process_output;
  wire [335:0] partialll3_process_output;
  wire [15:0] sum3_process_output;
  wire [7:0] touint83_process_output;
  assign process_output = {touint83_process_output,touint82_process_output,touint81_process_output};
  // function: process pure=true delay=16
  // function: reset pure=true delay=0
  index___uint16_uint16__uint8_7_3___1 #(.INSTANCE_NAME({INSTANCE_NAME,"_dat"})) dat(.CLK(CLK), .process_CE(CE), .inp(process_input), .process_output(dat_process_output));
  index___uint16_uint16__uint8_7_3___0 #(.INSTANCE_NAME({INSTANCE_NAME,"_xy"})) xy(.CLK(CLK), .process_CE(CE), .inp(process_input), .process_output(xy_process_output));
  kern1 #(.INSTANCE_NAME({INSTANCE_NAME,"_k1"})) k1(.CLK(CLK), .process_CE(CE), .ksi(xy_process_output), .process_output(k1_process_output));
  packTupleArrays_table__0x060ff220 #(.INSTANCE_NAME({INSTANCE_NAME,"_packedtup1"})) packedtup1(.CLK(CLK), .process_CE(CE), .process_input({k1_process_output,unnamedcall2437_delay7_validunnamednull0_CECE}), .process_output(packedtup1_process_output));
  map_partial_mult_Auint8_Buint8_W7_H3 #(.INSTANCE_NAME({INSTANCE_NAME,"_partialll1"})) partialll1(.CLK(CLK), .process_CE(CE), .process_input(packedtup1_process_output), .process_output(partialll1_process_output));
  reduce_sum_asyncfalse_W7_H3 #(.INSTANCE_NAME({INSTANCE_NAME,"_sum1"})) sum1(.CLK(CLK), .process_CE(CE), .process_input(partialll1_process_output), .process_output(sum1_process_output));
  touint8 #(.INSTANCE_NAME({INSTANCE_NAME,"_touint81"})) touint81(.CLK(CLK), .process_CE(CE), .inp(sum1_process_output), .process_output(touint81_process_output));
  kern2 #(.INSTANCE_NAME({INSTANCE_NAME,"_k2"})) k2(.CLK(CLK), .process_CE(CE), .ksi(xy_process_output), .process_output(k2_process_output));
  packTupleArrays_table__0x05765258 #(.INSTANCE_NAME({INSTANCE_NAME,"_packedtup2"})) packedtup2(.CLK(CLK), .process_CE(CE), .process_input({k2_process_output,unnamedcall2437_delay7_validunnamednull0_CECE}), .process_output(packedtup2_process_output));
  map_partial_mult_Auint8_Buint8_W7_H3 #(.INSTANCE_NAME({INSTANCE_NAME,"_partialll2"})) partialll2(.CLK(CLK), .process_CE(CE), .process_input(packedtup2_process_output), .process_output(partialll2_process_output));
  reduce_sum_asyncfalse_W7_H3 #(.INSTANCE_NAME({INSTANCE_NAME,"_sum2"})) sum2(.CLK(CLK), .process_CE(CE), .process_input(partialll2_process_output), .process_output(sum2_process_output));
  touint8 #(.INSTANCE_NAME({INSTANCE_NAME,"_touint82"})) touint82(.CLK(CLK), .process_CE(CE), .inp(sum2_process_output), .process_output(touint82_process_output));
  kern3 #(.INSTANCE_NAME({INSTANCE_NAME,"_k3"})) k3(.CLK(CLK), .process_CE(CE), .ksi(xy_process_output), .process_output(k3_process_output));
  packTupleArrays_table__0x0521c798 #(.INSTANCE_NAME({INSTANCE_NAME,"_packedtup3"})) packedtup3(.CLK(CLK), .process_CE(CE), .process_input({k3_process_output,unnamedcall2437_delay7_validunnamednull0_CECE}), .process_output(packedtup3_process_output));
  map_partial_mult_Auint8_Buint8_W7_H3 #(.INSTANCE_NAME({INSTANCE_NAME,"_partialll3"})) partialll3(.CLK(CLK), .process_CE(CE), .process_input(packedtup3_process_output), .process_output(partialll3_process_output));
  reduce_sum_asyncfalse_W7_H3 #(.INSTANCE_NAME({INSTANCE_NAME,"_sum3"})) sum3(.CLK(CLK), .process_CE(CE), .process_input(partialll3_process_output), .process_output(sum3_process_output));
  touint8 #(.INSTANCE_NAME({INSTANCE_NAME,"_touint83"})) touint83(.CLK(CLK), .process_CE(CE), .inp(sum3_process_output), .process_output(touint83_process_output));
endmodule

module map_dem_W2_H1(input CLK, input process_CE, input [399:0] process_input, output [47:0] process_output);
parameter INSTANCE_NAME="INST";
  wire [23:0] inner0_0_process_output;
  wire [23:0] inner1_0_process_output;
  assign process_output = {inner1_0_process_output,inner0_0_process_output};
  // function: process pure=true delay=16
  dem #(.INSTANCE_NAME({INSTANCE_NAME,"_inner0_0"})) inner0_0(.CLK(CLK), .CE(process_CE), .process_input(({process_input[199:0]})), .process_output(inner0_0_process_output));
  dem #(.INSTANCE_NAME({INSTANCE_NAME,"_inner1_0"})) inner1_0(.CLK(CLK), .CE(process_CE), .process_input(({process_input[399:200]})), .process_output(inner1_0_process_output));
endmodule

module liftXYSeqPointwise_lambda(input CLK, input CE, input [399:0] process_input, output [47:0] process_output);
parameter INSTANCE_NAME="INST";
  wire [399:0] unp_process_output;
  wire [47:0] f_process_output;
  assign process_output = f_process_output;
  // function: process pure=true delay=16
  // function: reset pure=true delay=0
  packTupleArrays_table__0x068d2a78 #(.INSTANCE_NAME({INSTANCE_NAME,"_unp"})) unp(.CLK(CLK), .process_CE(CE), .process_input(process_input), .process_output(unp_process_output));
  map_dem_W2_H1 #(.INSTANCE_NAME({INSTANCE_NAME,"_f"})) f(.CLK(CLK), .process_CE(CE), .process_input(unp_process_output), .process_output(f_process_output));
endmodule

module liftXYSeq_lambda(input CLK, input process_valid, input CE, input [335:0] process_input, output [47:0] process_output, input reset);
parameter INSTANCE_NAME="INST";
always @(posedge CLK) begin if(process_valid===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'process'", INSTANCE_NAME);  end end
always @(posedge CLK) begin if(reset===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'reset'", INSTANCE_NAME);  end end
  wire [63:0] p_process_output;
  reg [335:0] process_input_delay1_validunnamednull0_CECE;  always @ (posedge CLK) begin if (CE) begin process_input_delay1_validunnamednull0_CECE <= process_input; end end
  wire [47:0] m_process_output;
  assign process_output = m_process_output;
  // function: process pure=false delay=17
  // function: reset pure=false delay=0
  PosSeq_W648_H482_T2 #(.INSTANCE_NAME({INSTANCE_NAME,"_p"})) p(.CLK(CLK), .process_valid(process_valid), .CE(CE), .process_output(p_process_output), .reset(reset));
  liftXYSeqPointwise_lambda #(.INSTANCE_NAME({INSTANCE_NAME,"_m"})) m(.CLK(CLK), .CE(CE), .process_input({process_input_delay1_validunnamednull0_CECE,p_process_output}), .process_output(m_process_output));
endmodule

module demtop(input CLK, input process_valid, input CE, input [15:0] process_input, output [47:0] process_output, input reset);
parameter INSTANCE_NAME="INST";
always @(posedge CLK) begin if(process_valid===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'process'", INSTANCE_NAME);  end end
always @(posedge CLK) begin if(reset===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'reset'", INSTANCE_NAME);  end end
  wire [191:0] st_process_output;
  wire [335:0] convstencils_process_output;
  reg process_valid_delay1_validunnamednull0_CECE;  always @ (posedge CLK) begin if (CE) begin process_valid_delay1_validunnamednull0_CECE <= process_valid; end end
  reg process_valid_delay2_validunnamednull0_CECE;  always @ (posedge CLK) begin if (CE) begin process_valid_delay2_validunnamednull0_CECE <= process_valid_delay1_validunnamednull0_CECE; end end
  wire [47:0] dem_process_output;
  assign process_output = dem_process_output;
  // function: process pure=false delay=19
  // function: reset pure=false delay=0
  stencilLinebuffer_Auint8_w648_h482_xmin6_ymin2 #(.INSTANCE_NAME({INSTANCE_NAME,"_st"})) st(.CLK(CLK), .process_valid(process_valid), .CE(CE), .process_input(process_input), .process_output(st_process_output), .reset(reset));
  unpackStencil_uint8_W7_H3_T2 #(.INSTANCE_NAME({INSTANCE_NAME,"_convstencils"})) convstencils(.CLK(CLK), .process_CE(CE), .inp(st_process_output), .process_output(convstencils_process_output));
  liftXYSeq_lambda #(.INSTANCE_NAME({INSTANCE_NAME,"_dem"})) dem(.CLK(CLK), .process_valid(process_valid_delay2_validunnamednull0_CECE), .CE(CE), .process_input(convstencils_process_output), .process_output(dem_process_output), .reset(reset));
endmodule

module ccm(input CLK, input process_CE, input [23:0] ccminp, output [23:0] process_output);
parameter INSTANCE_NAME="INST";
  wire [15:0] unnamedcast4399USEDMULTIPLEcast;assign unnamedcast4399USEDMULTIPLEcast = {8'b0,(8'd185)}; 
  wire [15:0] unnamedcast4400USEDMULTIPLEcast;assign unnamedcast4400USEDMULTIPLEcast = {8'b0,({ccminp[7:0]})}; 
  reg [15:0] unnamedbinop4401_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedbinop4401_delay1_validunnamednull0_CEprocess_CE <= {(unnamedcast4399USEDMULTIPLEcast*unnamedcast4400USEDMULTIPLEcast)}; end end
  wire [15:0] unnamedcast4405USEDMULTIPLEcast;assign unnamedcast4405USEDMULTIPLEcast = {8'b0,(8'd0)}; 
  wire [15:0] unnamedcast4406USEDMULTIPLEcast;assign unnamedcast4406USEDMULTIPLEcast = {8'b0,({ccminp[15:8]})}; 
  reg [15:0] unnamedbinop4407_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedbinop4407_delay1_validunnamednull0_CEprocess_CE <= {(unnamedcast4405USEDMULTIPLEcast*unnamedcast4406USEDMULTIPLEcast)}; end end
  wire [16:0] unnamedcast4409USEDMULTIPLEcast;assign unnamedcast4409USEDMULTIPLEcast = {1'b0,unnamedbinop4407_delay1_validunnamednull0_CEprocess_CE}; 
  reg [16:0] unnamedbinop4410_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedbinop4410_delay1_validunnamednull0_CEprocess_CE <= {({1'b0,unnamedbinop4401_delay1_validunnamednull0_CEprocess_CE}+unnamedcast4409USEDMULTIPLEcast)}; end end
  wire [15:0] unnamedcast4415USEDMULTIPLEcast;assign unnamedcast4415USEDMULTIPLEcast = {8'b0,({ccminp[23:16]})}; 
  reg [15:0] unnamedbinop4416_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedbinop4416_delay1_validunnamednull0_CEprocess_CE <= {(unnamedcast4405USEDMULTIPLEcast*unnamedcast4415USEDMULTIPLEcast)}; end end
  reg [17:0] unnamedcast4418_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast4418_delay1_validunnamednull0_CEprocess_CE <= {2'b0,unnamedbinop4416_delay1_validunnamednull0_CEprocess_CE}; end end
  reg [17:0] unnamedbinop4419_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedbinop4419_delay1_validunnamednull0_CEprocess_CE <= {({1'b0,unnamedbinop4410_delay1_validunnamednull0_CEprocess_CE}+unnamedcast4418_delay1_validunnamednull0_CEprocess_CE)}; end end
  reg [17:0] unnamedcast4421_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast4421_delay1_validunnamednull0_CEprocess_CE <= (18'd7); end end
  reg [17:0] unnamedcast4421_delay2_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast4421_delay2_validunnamednull0_CEprocess_CE <= unnamedcast4421_delay1_validunnamednull0_CEprocess_CE; end end
  reg [17:0] unnamedcast4421_delay3_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast4421_delay3_validunnamednull0_CEprocess_CE <= unnamedcast4421_delay2_validunnamednull0_CEprocess_CE; end end
  reg [17:0] unnamedbinop4422_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedbinop4422_delay1_validunnamednull0_CEprocess_CE <= {(unnamedbinop4419_delay1_validunnamednull0_CEprocess_CE>>>unnamedcast4421_delay3_validunnamednull0_CEprocess_CE)}; end end
  wire [10:0] unnamedcast4423USEDMULTIPLEcast;assign unnamedcast4423USEDMULTIPLEcast = unnamedbinop4422_delay1_validunnamednull0_CEprocess_CE[10:0]; 
  reg [10:0] unnamedcast4425_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast4425_delay1_validunnamednull0_CEprocess_CE <= {3'b0,(8'd255)}; end end
  reg [10:0] unnamedcast4425_delay2_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast4425_delay2_validunnamednull0_CEprocess_CE <= unnamedcast4425_delay1_validunnamednull0_CEprocess_CE; end end
  reg [10:0] unnamedcast4425_delay3_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast4425_delay3_validunnamednull0_CEprocess_CE <= unnamedcast4425_delay2_validunnamednull0_CEprocess_CE; end end
  reg [10:0] unnamedcast4425_delay4_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast4425_delay4_validunnamednull0_CEprocess_CE <= unnamedcast4425_delay3_validunnamednull0_CEprocess_CE; end end
  reg unnamedbinop4426_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedbinop4426_delay1_validunnamednull0_CEprocess_CE <= {((unnamedcast4423USEDMULTIPLEcast)>(unnamedcast4425_delay4_validunnamednull0_CEprocess_CE))}; end end
  reg [10:0] unnamedcast4428_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast4428_delay1_validunnamednull0_CEprocess_CE <= (11'd255); end end
  reg [10:0] unnamedcast4428_delay2_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast4428_delay2_validunnamednull0_CEprocess_CE <= unnamedcast4428_delay1_validunnamednull0_CEprocess_CE; end end
  reg [10:0] unnamedcast4428_delay3_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast4428_delay3_validunnamednull0_CEprocess_CE <= unnamedcast4428_delay2_validunnamednull0_CEprocess_CE; end end
  reg [10:0] unnamedcast4428_delay4_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast4428_delay4_validunnamednull0_CEprocess_CE <= unnamedcast4428_delay3_validunnamednull0_CEprocess_CE; end end
  reg [10:0] unnamedcast4428_delay5_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast4428_delay5_validunnamednull0_CEprocess_CE <= unnamedcast4428_delay4_validunnamednull0_CEprocess_CE; end end
  reg [10:0] unnamedcast4423_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast4423_delay1_validunnamednull0_CEprocess_CE <= unnamedcast4423USEDMULTIPLEcast; end end
  reg [10:0] unnamedselect4429_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedselect4429_delay1_validunnamednull0_CEprocess_CE <= ((unnamedbinop4426_delay1_validunnamednull0_CEprocess_CE)?(unnamedcast4428_delay5_validunnamednull0_CEprocess_CE):(unnamedcast4423_delay1_validunnamednull0_CEprocess_CE)); end end
  reg [15:0] unnamedbinop4436_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedbinop4436_delay1_validunnamednull0_CEprocess_CE <= {(unnamedcast4405USEDMULTIPLEcast*unnamedcast4400USEDMULTIPLEcast)}; end end
  wire [16:0] unnamedcast4443USEDMULTIPLEcast;assign unnamedcast4443USEDMULTIPLEcast = {1'b0,unnamedbinop4436_delay1_validunnamednull0_CEprocess_CE}; 
  reg [15:0] unnamedbinop4442_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedbinop4442_delay1_validunnamednull0_CEprocess_CE <= {({8'b0,(8'd145)}*unnamedcast4406USEDMULTIPLEcast)}; end end
  reg [16:0] unnamedbinop4445_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedbinop4445_delay1_validunnamednull0_CEprocess_CE <= {(unnamedcast4443USEDMULTIPLEcast+{1'b0,unnamedbinop4442_delay1_validunnamednull0_CEprocess_CE})}; end end
  reg [17:0] unnamedbinop4454_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedbinop4454_delay1_validunnamednull0_CEprocess_CE <= {({1'b0,unnamedbinop4445_delay1_validunnamednull0_CEprocess_CE}+unnamedcast4418_delay1_validunnamednull0_CEprocess_CE)}; end end
  reg [17:0] unnamedbinop4457_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedbinop4457_delay1_validunnamednull0_CEprocess_CE <= {(unnamedbinop4454_delay1_validunnamednull0_CEprocess_CE>>>unnamedcast4421_delay3_validunnamednull0_CEprocess_CE)}; end end
  wire [10:0] unnamedcast4458USEDMULTIPLEcast;assign unnamedcast4458USEDMULTIPLEcast = unnamedbinop4457_delay1_validunnamednull0_CEprocess_CE[10:0]; 
  reg unnamedbinop4461_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedbinop4461_delay1_validunnamednull0_CEprocess_CE <= {((unnamedcast4458USEDMULTIPLEcast)>(unnamedcast4425_delay4_validunnamednull0_CEprocess_CE))}; end end
  reg [10:0] unnamedcast4458_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast4458_delay1_validunnamednull0_CEprocess_CE <= unnamedcast4458USEDMULTIPLEcast; end end
  reg [10:0] unnamedselect4464_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedselect4464_delay1_validunnamednull0_CEprocess_CE <= ((unnamedbinop4461_delay1_validunnamednull0_CEprocess_CE)?(unnamedcast4428_delay5_validunnamednull0_CEprocess_CE):(unnamedcast4458_delay1_validunnamednull0_CEprocess_CE)); end end
  reg [16:0] unnamedbinop4480_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedbinop4480_delay1_validunnamednull0_CEprocess_CE <= {(unnamedcast4443USEDMULTIPLEcast+unnamedcast4409USEDMULTIPLEcast)}; end end
  reg [15:0] unnamedbinop4486_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedbinop4486_delay1_validunnamednull0_CEprocess_CE <= {(unnamedcast4399USEDMULTIPLEcast*unnamedcast4415USEDMULTIPLEcast)}; end end
  reg [17:0] unnamedcast4488_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast4488_delay1_validunnamednull0_CEprocess_CE <= {2'b0,unnamedbinop4486_delay1_validunnamednull0_CEprocess_CE}; end end
  reg [17:0] unnamedbinop4489_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedbinop4489_delay1_validunnamednull0_CEprocess_CE <= {({1'b0,unnamedbinop4480_delay1_validunnamednull0_CEprocess_CE}+unnamedcast4488_delay1_validunnamednull0_CEprocess_CE)}; end end
  reg [17:0] unnamedbinop4492_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedbinop4492_delay1_validunnamednull0_CEprocess_CE <= {(unnamedbinop4489_delay1_validunnamednull0_CEprocess_CE>>>unnamedcast4421_delay3_validunnamednull0_CEprocess_CE)}; end end
  wire [10:0] unnamedcast4493USEDMULTIPLEcast;assign unnamedcast4493USEDMULTIPLEcast = unnamedbinop4492_delay1_validunnamednull0_CEprocess_CE[10:0]; 
  reg unnamedbinop4496_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedbinop4496_delay1_validunnamednull0_CEprocess_CE <= {((unnamedcast4493USEDMULTIPLEcast)>(unnamedcast4425_delay4_validunnamednull0_CEprocess_CE))}; end end
  reg [10:0] unnamedcast4493_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast4493_delay1_validunnamednull0_CEprocess_CE <= unnamedcast4493USEDMULTIPLEcast; end end
  reg [10:0] unnamedselect4499_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedselect4499_delay1_validunnamednull0_CEprocess_CE <= ((unnamedbinop4496_delay1_validunnamednull0_CEprocess_CE)?(unnamedcast4428_delay5_validunnamednull0_CEprocess_CE):(unnamedcast4493_delay1_validunnamednull0_CEprocess_CE)); end end
  assign process_output = {unnamedselect4499_delay1_validunnamednull0_CEprocess_CE[7:0],unnamedselect4464_delay1_validunnamednull0_CEprocess_CE[7:0],unnamedselect4429_delay1_validunnamednull0_CEprocess_CE[7:0]};
  // function: process pure=true delay=6
endmodule

module map_ccm_W2_H1(input CLK, input process_CE, input [47:0] process_input, output [47:0] process_output);
parameter INSTANCE_NAME="INST";
  wire [23:0] inner0_0_process_output;
  wire [23:0] inner1_0_process_output;
  assign process_output = {inner1_0_process_output,inner0_0_process_output};
  // function: process pure=true delay=6
  ccm #(.INSTANCE_NAME({INSTANCE_NAME,"_inner0_0"})) inner0_0(.CLK(CLK), .process_CE(process_CE), .ccminp(({process_input[23:0]})), .process_output(inner0_0_process_output));
  ccm #(.INSTANCE_NAME({INSTANCE_NAME,"_inner1_0"})) inner1_0(.CLK(CLK), .process_CE(process_CE), .ccminp(({process_input[47:24]})), .process_output(inner1_0_process_output));
endmodule

module bramSDP_WAROtrue_size256_bw1_obw1_CEtrue_inittable__0x06931c00(input CLK, input read_CE, input [7:0] inpRead, output [7:0] READ_OUT, input writeAndReturnOriginal_valid, input writeAndReturnOriginal_CE, input [15:0] inp, output [7:0] WARO_OUT);
parameter INSTANCE_NAME="INST";
always @(posedge CLK) begin if(writeAndReturnOriginal_valid===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'writeAndReturnOriginal'", INSTANCE_NAME);  end end
  wire [7:0] bram_0_READ_OUTPUT;
  assign READ_OUT = {bram_0_READ_OUTPUT};
  wire [7:0] unnamedcast4673;assign unnamedcast4673 = (inp[15:8]);  // wire for bitslice
  wire [7:0] bram_0_SET_AND_RETURN_ORIG_OUTPUT;
  assign WARO_OUT = {bram_0_SET_AND_RETURN_ORIG_OUTPUT};
  // function: read pure=true delay=1
  // function: writeAndReturnOriginal pure=false delay=1
  reg [7:0] bram_0_DI_B;
reg [10:0] bram_0_addr_B;
wire [7:0] bram_0_DO_B;
wire [18:0] bram_0_INPUT;
assign bram_0_INPUT = {unnamedcast4673[7:0],{3'b0,(inp[7:0])}};
RAMB16_S9_S9 #(.WRITE_MODE_A("READ_FIRST"),.WRITE_MODE_B("READ_FIRST"),.INIT_00(256'h2c2a29282726242322211f1e1d1b1a191816151312110f0e0c0b090706040200),.INIT_01(256'h4f4e4d4c4b4a4948474544434241403f3e3d3c3a3938373635343331302f2e2d),.INIT_02(256'h6f6f6e6d6c6b6a696867666564636261605f5e5c5b5a59585756555453525150),.INIT_03(256'h8e8d8c8b8a89898887868584838281807f7e7d7c7b7a79787776757473727170),.INIT_04(256'hacabaaa9a8a7a6a5a4a3a2a2a1a09f9e9d9c9b9a99989797969594939291908f),.INIT_05(256'hc8c7c6c5c4c4c3c2c1c0bfbebdbcbcbbbab9b8b7b6b5b4b4b3b2b1b0afaeadac),.INIT_06(256'he4e3e2e1e0dfdededddcdbdad9d8d8d7d6d5d4d3d2d1d1d0cfcecdcccbcbcac9),.INIT_07(256'hfffefdfcfbfaf9f9f8f7f6f5f4f4f3f2f1f0efefeeedecebeae9e9e8e7e6e5e4),.INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),.INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),.INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),.INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),.INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),.INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),.INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),.INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),.INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),.INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),.INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),.INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),.INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),.INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),.INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),.INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),.INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),.INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),.INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),.INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),.INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),.INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),.INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),.INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),.INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),.INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),.INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),.INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),.INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),.INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),.INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),.INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),.INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),.INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),.INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),.INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),.INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),.INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),.INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),.INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),.INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),.INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),.INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),.INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),.INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),.INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),.INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),.INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),.INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),.INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),.INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),.INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),.INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),.INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),.INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),.INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000)) bram_0 (
.DIPA(1'b0),
.DIPB(1'b0),
.DIA(bram_0_INPUT[18:11]),
.DIB(bram_0_DI_B),
.DOA(bram_0_SET_AND_RETURN_ORIG_OUTPUT),
.DOB(bram_0_READ_OUTPUT),
.ADDRA(bram_0_INPUT[10:0]),
.ADDRB({3'b0,inpRead}),
.WEA(writeAndReturnOriginal_valid),
.WEB(1'd0),
.ENA(writeAndReturnOriginal_CE),
.ENB(read_CE),
.CLKA(CLK),
.CLKB(CLK),
.SSRA(1'b0),
.SSRB(1'b0)
);


endmodule

module LUT(input CLK, input process_valid, input process_CE, input [7:0] process_input, output [7:0] process_output);
parameter INSTANCE_NAME="INST";
always @(posedge CLK) begin if(process_valid===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'process'", INSTANCE_NAME);  end end
  wire [7:0] LUT_READ_OUT;
  wire [7:0] LUT_WARO_OUT;
  assign process_output = LUT_READ_OUT;
  // function: process pure=false delay=1
  bramSDP_WAROtrue_size256_bw1_obw1_CEtrue_inittable__0x06931c00 #(.INSTANCE_NAME({INSTANCE_NAME,"_LUT"})) LUT(.CLK(CLK), .read_CE(process_CE), .inpRead(process_input), .READ_OUT(LUT_READ_OUT), .writeAndReturnOriginal_valid({((1'd0)&&process_valid)}), .writeAndReturnOriginal_CE(process_CE), .inp({(8'd0),process_input}), .WARO_OUT(LUT_WARO_OUT));
endmodule

module map_LUT_W3_H1(input CLK, input process_valid, input process_CE, input [23:0] process_input, output [23:0] process_output);
parameter INSTANCE_NAME="INST";
always @(posedge CLK) begin if(process_valid===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'process'", INSTANCE_NAME);  end end
  wire [7:0] inner0_0_process_output;
  wire [7:0] inner1_0_process_output;
  wire [7:0] inner2_0_process_output;
  assign process_output = {inner2_0_process_output,inner1_0_process_output,inner0_0_process_output};
  // function: process pure=false delay=1
  LUT #(.INSTANCE_NAME({INSTANCE_NAME,"_inner0_0"})) inner0_0(.CLK(CLK), .process_valid(process_valid), .process_CE(process_CE), .process_input(({process_input[7:0]})), .process_output(inner0_0_process_output));
  LUT #(.INSTANCE_NAME({INSTANCE_NAME,"_inner1_0"})) inner1_0(.CLK(CLK), .process_valid(process_valid), .process_CE(process_CE), .process_input(({process_input[15:8]})), .process_output(inner1_0_process_output));
  LUT #(.INSTANCE_NAME({INSTANCE_NAME,"_inner2_0"})) inner2_0(.CLK(CLK), .process_valid(process_valid), .process_CE(process_CE), .process_input(({process_input[23:16]})), .process_output(inner2_0_process_output));
endmodule

module map_map_LUT_W3_H1_W2_H1(input CLK, input process_valid, input process_CE, input [47:0] process_input, output [47:0] process_output);
parameter INSTANCE_NAME="INST";
always @(posedge CLK) begin if(process_valid===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'process'", INSTANCE_NAME);  end end
  wire [23:0] inner0_0_process_output;
  wire [23:0] inner1_0_process_output;
  assign process_output = {inner1_0_process_output,inner0_0_process_output};
  // function: process pure=false delay=1
  map_LUT_W3_H1 #(.INSTANCE_NAME({INSTANCE_NAME,"_inner0_0"})) inner0_0(.CLK(CLK), .process_valid(process_valid), .process_CE(process_CE), .process_input(({process_input[23:0]})), .process_output(inner0_0_process_output));
  map_LUT_W3_H1 #(.INSTANCE_NAME({INSTANCE_NAME,"_inner1_0"})) inner1_0(.CLK(CLK), .process_valid(process_valid), .process_CE(process_CE), .process_input(({process_input[47:24]})), .process_output(inner1_0_process_output));
endmodule

module addChan(input CLK, input process_CE, input [23:0] inp, output [31:0] process_output);
parameter INSTANCE_NAME="INST";
  assign process_output = {(8'd0),({inp[23:16]}),({inp[15:8]}),({inp[7:0]})};
  // function: process pure=true delay=0
endmodule

module map_addChan_W2_H1(input CLK, input process_CE, input [47:0] process_input, output [63:0] process_output);
parameter INSTANCE_NAME="INST";
  wire [31:0] inner0_0_process_output;
  wire [31:0] inner1_0_process_output;
  assign process_output = {inner1_0_process_output,inner0_0_process_output};
  // function: process pure=true delay=0
  addChan #(.INSTANCE_NAME({INSTANCE_NAME,"_inner0_0"})) inner0_0(.CLK(CLK), .process_CE(process_CE), .inp(({process_input[23:0]})), .process_output(inner0_0_process_output));
  addChan #(.INSTANCE_NAME({INSTANCE_NAME,"_inner1_0"})) inner1_0(.CLK(CLK), .process_CE(process_CE), .inp(({process_input[47:24]})), .process_output(inner1_0_process_output));
endmodule

module campipe(input CLK, input process_valid, input CE, input [15:0] process_input, output [63:0] process_output, input reset);
parameter INSTANCE_NAME="INST";
always @(posedge CLK) begin if(process_valid===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'process'", INSTANCE_NAME);  end end
always @(posedge CLK) begin if(reset===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'reset'", INSTANCE_NAME);  end end
  wire [15:0] bl_process_output;
  reg process_valid_delay1_validunnamednull0_CECE;  always @ (posedge CLK) begin if (CE) begin process_valid_delay1_validunnamednull0_CECE <= process_valid; end end
  reg process_valid_delay2_validunnamednull0_CECE;  always @ (posedge CLK) begin if (CE) begin process_valid_delay2_validunnamednull0_CECE <= process_valid_delay1_validunnamednull0_CECE; end end
  reg process_valid_delay3_validunnamednull0_CECE;  always @ (posedge CLK) begin if (CE) begin process_valid_delay3_validunnamednull0_CECE <= process_valid_delay2_validunnamednull0_CECE; end end
  reg process_valid_delay4_validunnamednull0_CECE;  always @ (posedge CLK) begin if (CE) begin process_valid_delay4_validunnamednull0_CECE <= process_valid_delay3_validunnamednull0_CECE; end end
  reg process_valid_delay5_validunnamednull0_CECE;  always @ (posedge CLK) begin if (CE) begin process_valid_delay5_validunnamednull0_CECE <= process_valid_delay4_validunnamednull0_CECE; end end
  reg process_valid_delay6_validunnamednull0_CECE;  always @ (posedge CLK) begin if (CE) begin process_valid_delay6_validunnamednull0_CECE <= process_valid_delay5_validunnamednull0_CECE; end end
  wire [47:0] dem_process_output;
  wire [47:0] ccm_process_output;
  reg process_valid_delay7_validunnamednull0_CECE;  always @ (posedge CLK) begin if (CE) begin process_valid_delay7_validunnamednull0_CECE <= process_valid_delay6_validunnamednull0_CECE; end end
  reg process_valid_delay8_validunnamednull0_CECE;  always @ (posedge CLK) begin if (CE) begin process_valid_delay8_validunnamednull0_CECE <= process_valid_delay7_validunnamednull0_CECE; end end
  reg process_valid_delay9_validunnamednull0_CECE;  always @ (posedge CLK) begin if (CE) begin process_valid_delay9_validunnamednull0_CECE <= process_valid_delay8_validunnamednull0_CECE; end end
  reg process_valid_delay10_validunnamednull0_CECE;  always @ (posedge CLK) begin if (CE) begin process_valid_delay10_validunnamednull0_CECE <= process_valid_delay9_validunnamednull0_CECE; end end
  reg process_valid_delay11_validunnamednull0_CECE;  always @ (posedge CLK) begin if (CE) begin process_valid_delay11_validunnamednull0_CECE <= process_valid_delay10_validunnamednull0_CECE; end end
  reg process_valid_delay12_validunnamednull0_CECE;  always @ (posedge CLK) begin if (CE) begin process_valid_delay12_validunnamednull0_CECE <= process_valid_delay11_validunnamednull0_CECE; end end
  reg process_valid_delay13_validunnamednull0_CECE;  always @ (posedge CLK) begin if (CE) begin process_valid_delay13_validunnamednull0_CECE <= process_valid_delay12_validunnamednull0_CECE; end end
  reg process_valid_delay14_validunnamednull0_CECE;  always @ (posedge CLK) begin if (CE) begin process_valid_delay14_validunnamednull0_CECE <= process_valid_delay13_validunnamednull0_CECE; end end
  reg process_valid_delay15_validunnamednull0_CECE;  always @ (posedge CLK) begin if (CE) begin process_valid_delay15_validunnamednull0_CECE <= process_valid_delay14_validunnamednull0_CECE; end end
  reg process_valid_delay16_validunnamednull0_CECE;  always @ (posedge CLK) begin if (CE) begin process_valid_delay16_validunnamednull0_CECE <= process_valid_delay15_validunnamednull0_CECE; end end
  reg process_valid_delay17_validunnamednull0_CECE;  always @ (posedge CLK) begin if (CE) begin process_valid_delay17_validunnamednull0_CECE <= process_valid_delay16_validunnamednull0_CECE; end end
  reg process_valid_delay18_validunnamednull0_CECE;  always @ (posedge CLK) begin if (CE) begin process_valid_delay18_validunnamednull0_CECE <= process_valid_delay17_validunnamednull0_CECE; end end
  reg process_valid_delay19_validunnamednull0_CECE;  always @ (posedge CLK) begin if (CE) begin process_valid_delay19_validunnamednull0_CECE <= process_valid_delay18_validunnamednull0_CECE; end end
  reg process_valid_delay20_validunnamednull0_CECE;  always @ (posedge CLK) begin if (CE) begin process_valid_delay20_validunnamednull0_CECE <= process_valid_delay19_validunnamednull0_CECE; end end
  reg process_valid_delay21_validunnamednull0_CECE;  always @ (posedge CLK) begin if (CE) begin process_valid_delay21_validunnamednull0_CECE <= process_valid_delay20_validunnamednull0_CECE; end end
  reg process_valid_delay22_validunnamednull0_CECE;  always @ (posedge CLK) begin if (CE) begin process_valid_delay22_validunnamednull0_CECE <= process_valid_delay21_validunnamednull0_CECE; end end
  reg process_valid_delay23_validunnamednull0_CECE;  always @ (posedge CLK) begin if (CE) begin process_valid_delay23_validunnamednull0_CECE <= process_valid_delay22_validunnamednull0_CECE; end end
  reg process_valid_delay24_validunnamednull0_CECE;  always @ (posedge CLK) begin if (CE) begin process_valid_delay24_validunnamednull0_CECE <= process_valid_delay23_validunnamednull0_CECE; end end
  reg process_valid_delay25_validunnamednull0_CECE;  always @ (posedge CLK) begin if (CE) begin process_valid_delay25_validunnamednull0_CECE <= process_valid_delay24_validunnamednull0_CECE; end end
  reg process_valid_delay26_validunnamednull0_CECE;  always @ (posedge CLK) begin if (CE) begin process_valid_delay26_validunnamednull0_CECE <= process_valid_delay25_validunnamednull0_CECE; end end
  reg process_valid_delay27_validunnamednull0_CECE;  always @ (posedge CLK) begin if (CE) begin process_valid_delay27_validunnamednull0_CECE <= process_valid_delay26_validunnamednull0_CECE; end end
  reg process_valid_delay28_validunnamednull0_CECE;  always @ (posedge CLK) begin if (CE) begin process_valid_delay28_validunnamednull0_CECE <= process_valid_delay27_validunnamednull0_CECE; end end
  reg process_valid_delay29_validunnamednull0_CECE;  always @ (posedge CLK) begin if (CE) begin process_valid_delay29_validunnamednull0_CECE <= process_valid_delay28_validunnamednull0_CECE; end end
  reg process_valid_delay30_validunnamednull0_CECE;  always @ (posedge CLK) begin if (CE) begin process_valid_delay30_validunnamednull0_CECE <= process_valid_delay29_validunnamednull0_CECE; end end
  reg process_valid_delay31_validunnamednull0_CECE;  always @ (posedge CLK) begin if (CE) begin process_valid_delay31_validunnamednull0_CECE <= process_valid_delay30_validunnamednull0_CECE; end end
  wire [47:0] gam_process_output;
  wire [63:0] addchan_process_output;
  assign process_output = addchan_process_output;
  // function: process pure=false delay=32
  // function: reset pure=false delay=0
  map_blackLevel_W2_H1 #(.INSTANCE_NAME({INSTANCE_NAME,"_bl"})) bl(.CLK(CLK), .process_CE(CE), .process_input(process_input), .process_output(bl_process_output));
  demtop #(.INSTANCE_NAME({INSTANCE_NAME,"_dem"})) dem(.CLK(CLK), .process_valid(process_valid_delay6_validunnamednull0_CECE), .CE(CE), .process_input(bl_process_output), .process_output(dem_process_output), .reset(reset));
  map_ccm_W2_H1 #(.INSTANCE_NAME({INSTANCE_NAME,"_ccm"})) ccm(.CLK(CLK), .process_CE(CE), .process_input(dem_process_output), .process_output(ccm_process_output));
  map_map_LUT_W3_H1_W2_H1 #(.INSTANCE_NAME({INSTANCE_NAME,"_gam"})) gam(.CLK(CLK), .process_valid(process_valid_delay31_validunnamednull0_CECE), .process_CE(CE), .process_input(ccm_process_output), .process_output(gam_process_output));
  map_addChan_W2_H1 #(.INSTANCE_NAME({INSTANCE_NAME,"_addchan"})) addchan(.CLK(CLK), .process_CE(CE), .process_input(gam_process_output), .process_output(addchan_process_output));
endmodule

module MakeHandshake_campipe(input CLK, input ready_downstream, output ready, input reset, input [16:0] process_input, output [64:0] process_output);
parameter INSTANCE_NAME="INST";
parameter OUTPUT_COUNT=0;
parameter INPUT_COUNT=0;
  assign ready = ready_downstream;
  wire unnamedbinop5482USEDMULTIPLEbinop;assign unnamedbinop5482USEDMULTIPLEbinop = {(ready_downstream||reset)}; 
  wire unnamedcast5490USEDMULTIPLEcast;assign unnamedcast5490USEDMULTIPLEcast = (process_input[16]); 
  wire [63:0] inner_process_output;
  wire validBitDelay_campipe_pushPop_out;
  always @(posedge CLK) begin if({(~{(unnamedcast5490USEDMULTIPLEcast===1'bx)})} == 1'b0 && (1'd1)==1'b1) begin $display("%s: MakeHandshake: input valid bit should not be X!",INSTANCE_NAME); end end
  assign process_output = {validBitDelay_campipe_pushPop_out,inner_process_output};
  // function: ready pure=true ONLY WIRE
  // function: reset pure=false ONLY WIRE
  // function: process pure=false ONLY WIRE
  ShiftRegister_32_CEtrue_TY1 #(.INSTANCE_NAME({INSTANCE_NAME,"_validBitDelay_campipe"})) validBitDelay_campipe(.CLK(CLK), .pushPop_valid({(~reset)}), .CE(unnamedbinop5482USEDMULTIPLEbinop), .sr_input(unnamedcast5490USEDMULTIPLEcast), .pushPop_out(validBitDelay_campipe_pushPop_out), .reset(reset));
  campipe #(.INSTANCE_NAME({INSTANCE_NAME,"_inner"})) inner(.CLK(CLK), .process_valid(unnamedcast5490USEDMULTIPLEcast), .CE(unnamedbinop5482USEDMULTIPLEbinop), .process_input((process_input[15:0])), .process_output(inner_process_output), .reset(reset));
endmodule

module SSR_W2_H1_T2_Auint8_4_1_(input CLK, input process_valid, input process_CE, input [63:0] inp, output [95:0] process_output);
parameter INSTANCE_NAME="INST";
always @(posedge CLK) begin if(process_valid===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'process'", INSTANCE_NAME);  end end
  reg [31:0] SR_x0_y0;
  wire [31:0] unnamedcast5496USEDMULTIPLEcast;assign unnamedcast5496USEDMULTIPLEcast = ({inp[63:32]}); 
    always @ (posedge CLK) begin if (process_valid && process_CE) begin SR_x0_y0 <= unnamedcast5496USEDMULTIPLEcast; end end
  assign process_output = {unnamedcast5496USEDMULTIPLEcast,({inp[31:0]}),SR_x0_y0};
  // function: process pure=false delay=0
  // function: reset pure=true delay=0
endmodule

module slice_typeuint8_4_1__3_1__xl0_xh1_yl0_yh0(input CLK, input process_CE, input [95:0] inp, output [63:0] process_output);
parameter INSTANCE_NAME="INST";
  assign process_output = {({inp[63:32]}),({inp[31:0]})};
  // function: process pure=true delay=0
endmodule

module CropSeq_uint8_4_1__W648_H482_T2(input CLK, input process_CE, input [127:0] process_input, output [64:0] process_output);
parameter INSTANCE_NAME="INST";
  reg [63:0] unnamedcast5522_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast5522_delay1_validunnamednull0_CEprocess_CE <= (process_input[127:64]); end end
  reg [63:0] unnamedcast5522_delay2_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast5522_delay2_validunnamednull0_CEprocess_CE <= unnamedcast5522_delay1_validunnamednull0_CEprocess_CE; end end
  reg [63:0] unnamedcast5522_delay3_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedcast5522_delay3_validunnamednull0_CEprocess_CE <= unnamedcast5522_delay2_validunnamednull0_CEprocess_CE; end end
  wire [63:0] unnamedcast5524;assign unnamedcast5524 = (process_input[63:0]);  // wire for array index
  wire [31:0] unnamedcast5526USEDMULTIPLEcast;assign unnamedcast5526USEDMULTIPLEcast = ({unnamedcast5524[31:0]}); 
  wire [15:0] unnamedcast5528USEDMULTIPLEcast;assign unnamedcast5528USEDMULTIPLEcast = (unnamedcast5526USEDMULTIPLEcast[15:0]); 
  reg unnamedbinop5540_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedbinop5540_delay1_validunnamednull0_CEprocess_CE <= {((unnamedcast5528USEDMULTIPLEcast)>=((16'd8)))}; end end
  wire [15:0] unnamedcast5534USEDMULTIPLEcast;assign unnamedcast5534USEDMULTIPLEcast = (unnamedcast5526USEDMULTIPLEcast[31:16]); 
  reg unnamedbinop5542_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedbinop5542_delay1_validunnamednull0_CEprocess_CE <= {((unnamedcast5534USEDMULTIPLEcast)>=((16'd2)))}; end end
  reg unnamedbinop5543_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedbinop5543_delay1_validunnamednull0_CEprocess_CE <= {(unnamedbinop5540_delay1_validunnamednull0_CEprocess_CE&&unnamedbinop5542_delay1_validunnamednull0_CEprocess_CE)}; end end
  reg unnamedbinop5545_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedbinop5545_delay1_validunnamednull0_CEprocess_CE <= {((unnamedcast5528USEDMULTIPLEcast)<((16'd648)))}; end end
  reg unnamedbinop5547_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedbinop5547_delay1_validunnamednull0_CEprocess_CE <= {((unnamedcast5534USEDMULTIPLEcast)<((16'd482)))}; end end
  reg unnamedbinop5548_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedbinop5548_delay1_validunnamednull0_CEprocess_CE <= {(unnamedbinop5545_delay1_validunnamednull0_CEprocess_CE&&unnamedbinop5547_delay1_validunnamednull0_CEprocess_CE)}; end end
  reg unnamedbinop5549_delay1_validunnamednull0_CEprocess_CE;  always @ (posedge CLK) begin if (process_CE) begin unnamedbinop5549_delay1_validunnamednull0_CEprocess_CE <= {(unnamedbinop5543_delay1_validunnamednull0_CEprocess_CE&&unnamedbinop5548_delay1_validunnamednull0_CEprocess_CE)}; end end
  assign process_output = {unnamedbinop5549_delay1_validunnamednull0_CEprocess_CE,unnamedcast5522_delay3_validunnamednull0_CEprocess_CE};
  // function: process pure=true delay=3
endmodule

module liftXYSeq_lift_CropSeq_uint8_4_1__W648_H482_T2(input CLK, input process_valid, input CE, input [63:0] process_input, output [64:0] process_output, input reset);
parameter INSTANCE_NAME="INST";
always @(posedge CLK) begin if(process_valid===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'process'", INSTANCE_NAME);  end end
always @(posedge CLK) begin if(reset===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'reset'", INSTANCE_NAME);  end end
  wire [63:0] p_process_output;
  reg [63:0] process_input_delay1_validunnamednull0_CECE;  always @ (posedge CLK) begin if (CE) begin process_input_delay1_validunnamednull0_CECE <= process_input; end end
  wire [64:0] m_process_output;
  assign process_output = m_process_output;
  // function: process pure=false delay=4
  // function: reset pure=false delay=0
  PosSeq_W648_H482_T2 #(.INSTANCE_NAME({INSTANCE_NAME,"_p"})) p(.CLK(CLK), .process_valid(process_valid), .CE(CE), .process_output(p_process_output), .reset(reset));
  CropSeq_uint8_4_1__W648_H482_T2 #(.INSTANCE_NAME({INSTANCE_NAME,"_m"})) m(.CLK(CLK), .process_CE(CE), .process_input({process_input_delay1_validunnamednull0_CECE,p_process_output}), .process_output(m_process_output));
endmodule

module cropHelperSeq_uint8_4_1__W648_H482_T2_L7_R1_B2_Top0(input CLK, input process_valid, input CE, input [63:0] process_input, output [64:0] process_output, input reset);
parameter INSTANCE_NAME="INST";
always @(posedge CLK) begin if(process_valid===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'process'", INSTANCE_NAME);  end end
always @(posedge CLK) begin if(reset===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'reset'", INSTANCE_NAME);  end end
  wire [95:0] SSR_process_output;
  wire [63:0] slice_process_output;
  wire [64:0] crop_process_output;
  assign process_output = crop_process_output;
  // function: process pure=false delay=4
  // function: reset pure=false delay=0
  SSR_W2_H1_T2_Auint8_4_1_ #(.INSTANCE_NAME({INSTANCE_NAME,"_SSR"})) SSR(.CLK(CLK), .process_valid(process_valid), .process_CE(CE), .inp(process_input), .process_output(SSR_process_output));
  slice_typeuint8_4_1__3_1__xl0_xh1_yl0_yh0 #(.INSTANCE_NAME({INSTANCE_NAME,"_slice"})) slice(.CLK(CLK), .process_CE(CE), .inp(SSR_process_output), .process_output(slice_process_output));
  liftXYSeq_lift_CropSeq_uint8_4_1__W648_H482_T2 #(.INSTANCE_NAME({INSTANCE_NAME,"_crop"})) crop(.CLK(CLK), .process_valid(process_valid), .CE(CE), .process_input(slice_process_output), .process_output(crop_process_output), .reset(reset));
endmodule

module LiftDecimate_cropHelperSeq_uint8_4_1__W648_H482_T2_L7_R1_B2_Top0(input CLK, output ready, input reset, input CE, input process_valid, input [64:0] process_input, output [64:0] process_output);
parameter INSTANCE_NAME="INST";
always @(posedge CLK) begin if(reset===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'reset'", INSTANCE_NAME);  end end
always @(posedge CLK) begin if(process_valid===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'process'", INSTANCE_NAME);  end end
  assign ready = (1'd1);
  wire unnamedcast5663USEDMULTIPLEcast;assign unnamedcast5663USEDMULTIPLEcast = (process_input[64]); 
  wire [64:0] LiftDecimate_process_output;
  reg [63:0] unnamedcast5666_delay1_validunnamednull0_CECE;  always @ (posedge CLK) begin if (CE) begin unnamedcast5666_delay1_validunnamednull0_CECE <= (LiftDecimate_process_output[63:0]); end end
  reg unnamedcast5663_delay1_validunnamednull0_CECE;  always @ (posedge CLK) begin if (CE) begin unnamedcast5663_delay1_validunnamednull0_CECE <= unnamedcast5663USEDMULTIPLEcast; end end
  reg unnamedcast5663_delay2_validunnamednull0_CECE;  always @ (posedge CLK) begin if (CE) begin unnamedcast5663_delay2_validunnamednull0_CECE <= unnamedcast5663_delay1_validunnamednull0_CECE; end end
  reg unnamedcast5663_delay3_validunnamednull0_CECE;  always @ (posedge CLK) begin if (CE) begin unnamedcast5663_delay3_validunnamednull0_CECE <= unnamedcast5663_delay2_validunnamednull0_CECE; end end
  reg unnamedcast5663_delay4_validunnamednull0_CECE;  always @ (posedge CLK) begin if (CE) begin unnamedcast5663_delay4_validunnamednull0_CECE <= unnamedcast5663_delay3_validunnamednull0_CECE; end end
  reg unnamedbinop5671_delay1_validunnamednull0_CECE;  always @ (posedge CLK) begin if (CE) begin unnamedbinop5671_delay1_validunnamednull0_CECE <= {((LiftDecimate_process_output[64])&&unnamedcast5663_delay4_validunnamednull0_CECE)}; end end
  assign process_output = {unnamedbinop5671_delay1_validunnamednull0_CECE,unnamedcast5666_delay1_validunnamednull0_CECE};
  // function: ready pure=true delay=0
  // function: reset pure=false delay=0
  // function: process pure=false delay=5
  cropHelperSeq_uint8_4_1__W648_H482_T2_L7_R1_B2_Top0 #(.INSTANCE_NAME({INSTANCE_NAME,"_LiftDecimate"})) LiftDecimate(.CLK(CLK), .process_valid({(unnamedcast5663USEDMULTIPLEcast&&process_valid)}), .CE(CE), .process_input((process_input[63:0])), .process_output(LiftDecimate_process_output), .reset(reset));
endmodule

module ShiftRegister_5_CEtrue_TY1(input CLK, input pushPop_valid, input CE, input sr_input, output pushPop_out, input reset);
parameter INSTANCE_NAME="INST";
always @(posedge CLK) begin if(pushPop_valid===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'pushPop'", INSTANCE_NAME);  end end
always @(posedge CLK) begin if(reset===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'reset'", INSTANCE_NAME);  end end
  reg SR5;
  always @(posedge CLK) begin if(pushPop_valid===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR1' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if(reset===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR1' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if((({4'b0,pushPop_valid})+({4'b0,reset})) > 5'd1) begin $display("error, function 'set' on instance 'SR1' in module '%s' has multiple valid bits active in same cycle!",INSTANCE_NAME);$finish(); end end
  wire [1:0] unnamedcallArbitrate5774USEDMULTIPLEcallArbitrate;assign unnamedcallArbitrate5774USEDMULTIPLEcallArbitrate = {(pushPop_valid||reset),((pushPop_valid)?(sr_input):((1'd0)))}; 
  reg SR1;  always @ (posedge CLK) begin if ((unnamedcallArbitrate5774USEDMULTIPLEcallArbitrate[1]) && CE) begin SR1 <= (unnamedcallArbitrate5774USEDMULTIPLEcallArbitrate[0]); end end
  always @(posedge CLK) begin if(pushPop_valid===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR2' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if(reset===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR2' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if((({4'b0,pushPop_valid})+({4'b0,reset})) > 5'd1) begin $display("error, function 'set' on instance 'SR2' in module '%s' has multiple valid bits active in same cycle!",INSTANCE_NAME);$finish(); end end
  wire [1:0] unnamedcallArbitrate5780USEDMULTIPLEcallArbitrate;assign unnamedcallArbitrate5780USEDMULTIPLEcallArbitrate = {(pushPop_valid||reset),((pushPop_valid)?(SR1):((1'd0)))}; 
  reg SR2;  always @ (posedge CLK) begin if ((unnamedcallArbitrate5780USEDMULTIPLEcallArbitrate[1]) && CE) begin SR2 <= (unnamedcallArbitrate5780USEDMULTIPLEcallArbitrate[0]); end end
  always @(posedge CLK) begin if(pushPop_valid===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR3' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if(reset===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR3' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if((({4'b0,pushPop_valid})+({4'b0,reset})) > 5'd1) begin $display("error, function 'set' on instance 'SR3' in module '%s' has multiple valid bits active in same cycle!",INSTANCE_NAME);$finish(); end end
  wire [1:0] unnamedcallArbitrate5786USEDMULTIPLEcallArbitrate;assign unnamedcallArbitrate5786USEDMULTIPLEcallArbitrate = {(pushPop_valid||reset),((pushPop_valid)?(SR2):((1'd0)))}; 
  reg SR3;  always @ (posedge CLK) begin if ((unnamedcallArbitrate5786USEDMULTIPLEcallArbitrate[1]) && CE) begin SR3 <= (unnamedcallArbitrate5786USEDMULTIPLEcallArbitrate[0]); end end
  always @(posedge CLK) begin if(pushPop_valid===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR4' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if(reset===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR4' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if((({4'b0,pushPop_valid})+({4'b0,reset})) > 5'd1) begin $display("error, function 'set' on instance 'SR4' in module '%s' has multiple valid bits active in same cycle!",INSTANCE_NAME);$finish(); end end
  wire [1:0] unnamedcallArbitrate5792USEDMULTIPLEcallArbitrate;assign unnamedcallArbitrate5792USEDMULTIPLEcallArbitrate = {(pushPop_valid||reset),((pushPop_valid)?(SR3):((1'd0)))}; 
  reg SR4;  always @ (posedge CLK) begin if ((unnamedcallArbitrate5792USEDMULTIPLEcallArbitrate[1]) && CE) begin SR4 <= (unnamedcallArbitrate5792USEDMULTIPLEcallArbitrate[0]); end end
  always @(posedge CLK) begin if(pushPop_valid===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR5' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if(reset===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR5' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if((({4'b0,pushPop_valid})+({4'b0,reset})) > 5'd1) begin $display("error, function 'set' on instance 'SR5' in module '%s' has multiple valid bits active in same cycle!",INSTANCE_NAME);$finish(); end end
  wire [1:0] unnamedcallArbitrate5798USEDMULTIPLEcallArbitrate;assign unnamedcallArbitrate5798USEDMULTIPLEcallArbitrate = {(pushPop_valid||reset),((pushPop_valid)?(SR4):((1'd0)))}; 
    always @ (posedge CLK) begin if ((unnamedcallArbitrate5798USEDMULTIPLEcallArbitrate[1]) && CE) begin SR5 <= (unnamedcallArbitrate5798USEDMULTIPLEcallArbitrate[0]); end end
  assign pushPop_out = SR5;
  // function: pushPop pure=false delay=0
  // function: reset pure=false delay=0
endmodule

module LiftHandshake_LiftDecimate_cropHelperSeq_uint8_4_1__W648_H482_T2_L7_R1_B2_Top0(input CLK, input ready_downstream, output ready, input reset, input [64:0] process_input, output [64:0] process_output);
parameter INSTANCE_NAME="INST";
parameter OUTPUT_COUNT=0;
parameter INPUT_COUNT=0;
  wire inner_LiftDecimate_cropHelperSeq_uint8_4_1__W648_H482_T2_L7_R1_B2_Top0_ready;
  assign ready = {(inner_LiftDecimate_cropHelperSeq_uint8_4_1__W648_H482_T2_L7_R1_B2_Top0_ready&&ready_downstream)};
  wire unnamedbinop5711USEDMULTIPLEbinop;assign unnamedbinop5711USEDMULTIPLEbinop = {(reset||ready_downstream)}; 
  wire unnamedunary5712USEDMULTIPLEunary;assign unnamedunary5712USEDMULTIPLEunary = {(~reset)}; 
  wire [64:0] inner_LiftDecimate_cropHelperSeq_uint8_4_1__W648_H482_T2_L7_R1_B2_Top0_process_output;
  wire validBitDelay_LiftDecimate_cropHelperSeq_uint8_4_1__W648_H482_T2_L7_R1_B2_Top0_pushPop_out;
  wire [64:0] unnamedtuple5812USEDMULTIPLEtuple;assign unnamedtuple5812USEDMULTIPLEtuple = {{((inner_LiftDecimate_cropHelperSeq_uint8_4_1__W648_H482_T2_L7_R1_B2_Top0_process_output[64])&&validBitDelay_LiftDecimate_cropHelperSeq_uint8_4_1__W648_H482_T2_L7_R1_B2_Top0_pushPop_out)},(inner_LiftDecimate_cropHelperSeq_uint8_4_1__W648_H482_T2_L7_R1_B2_Top0_process_output[63:0])}; 
  always @(posedge CLK) begin if({(~{((unnamedtuple5812USEDMULTIPLEtuple[64])===1'bx)})} == 1'b0 && (1'd1)==1'b1) begin $display("%s: LiftHandshake: output valid bit should not be X!",INSTANCE_NAME); end end
  always @(posedge CLK) begin if({(~{((process_input[64])===1'bx)})} == 1'b0 && (1'd1)==1'b1) begin $display("%s: LiftHandshake: input valid bit should not be X!",INSTANCE_NAME); end end
  assign process_output = unnamedtuple5812USEDMULTIPLEtuple;
  // function: ready pure=true ONLY WIRE
  // function: reset pure=false ONLY WIRE
  // function: process pure=false ONLY WIRE
  LiftDecimate_cropHelperSeq_uint8_4_1__W648_H482_T2_L7_R1_B2_Top0 #(.INSTANCE_NAME({INSTANCE_NAME,"_inner_LiftDecimate_cropHelperSeq_uint8_4_1__W648_H482_T2_L7_R1_B2_Top0"})) inner_LiftDecimate_cropHelperSeq_uint8_4_1__W648_H482_T2_L7_R1_B2_Top0(.CLK(CLK), .ready(inner_LiftDecimate_cropHelperSeq_uint8_4_1__W648_H482_T2_L7_R1_B2_Top0_ready), .reset(reset), .CE(unnamedbinop5711USEDMULTIPLEbinop), .process_valid(unnamedunary5712USEDMULTIPLEunary), .process_input(process_input), .process_output(inner_LiftDecimate_cropHelperSeq_uint8_4_1__W648_H482_T2_L7_R1_B2_Top0_process_output));
  ShiftRegister_5_CEtrue_TY1 #(.INSTANCE_NAME({INSTANCE_NAME,"_validBitDelay_LiftDecimate_cropHelperSeq_uint8_4_1__W648_H482_T2_L7_R1_B2_Top0"})) validBitDelay_LiftDecimate_cropHelperSeq_uint8_4_1__W648_H482_T2_L7_R1_B2_Top0(.CLK(CLK), .pushPop_valid(unnamedunary5712USEDMULTIPLEunary), .CE(unnamedbinop5711USEDMULTIPLEbinop), .sr_input((1'd1)), .pushPop_out(validBitDelay_LiftDecimate_cropHelperSeq_uint8_4_1__W648_H482_T2_L7_R1_B2_Top0_pushPop_out), .reset(reset));
endmodule

module hsfn_uint8L3_R3_B1_T1_W640_H480function__0x0576b370(input CLK, input ready_downstream, output ready, input reset, input [16:0] process_input, output [64:0] process_output);
parameter INSTANCE_NAME="INST";
parameter OUTPUT_COUNT=0;
parameter INPUT_COUNT=0;
  wire [2:0] unnamedtuple7497USEDMULTIPLEtuple;assign unnamedtuple7497USEDMULTIPLEtuple = {(1'd1),(1'd1),ready_downstream}; 
  wire f1_store_ready;
  wire pad_ready;
  wire f2_store_ready;
  wire crop_ready;
  wire HH_ready;
  wire f1_load_ready;
  wire f2_load_ready;
  assign ready = pad_ready;
  wire [0:0] unnamedtuple7467USEDMULTIPLEtuple;assign unnamedtuple7467USEDMULTIPLEtuple = {(1'd1)}; 
  wire [64:0] f2_load_output;
  wire [16:0] pad_process_output;
  wire [0:0] f1_store_output;
  wire [16:0] f1_load_output;
  wire [64:0] HH_process_output;
  wire [64:0] crop_process_output;
  wire [0:0] f2_store_output;
  assign process_output = f2_load_output;
  // function: ready pure=true ONLY WIRE
  // function: reset pure=false ONLY WIRE
  // function: process pure=false ONLY WIRE
  LiftHandshake_RunIffReady_LiftDecimate_fifo_SIZE128_uint8_2_1__Wnil_Hnil_Tnil_BYTES256 #(.INSTANCE_NAME({INSTANCE_NAME,"_f1"})) f1(.CLK(CLK), .load_input(unnamedtuple7467USEDMULTIPLEtuple), .load_output(f1_load_output), .store_reset(reset), .store_ready_downstream((unnamedtuple7497USEDMULTIPLEtuple[1])), .store_ready(f1_store_ready), .load_ready_downstream(HH_ready), .load_ready(f1_load_ready), .load_reset(reset), .store_input(pad_process_output), .store_output(f1_store_output));
  LiftHandshake_RunIffReady_LiftDecimate_fifo_SIZE128_uint8_4_1__2_1__Wnil_Hnil_Tnil_BYTES1024 #(.INSTANCE_NAME({INSTANCE_NAME,"_f2"})) f2(.CLK(CLK), .load_input(unnamedtuple7467USEDMULTIPLEtuple), .load_output(f2_load_output), .store_reset(reset), .store_ready_downstream((unnamedtuple7497USEDMULTIPLEtuple[2])), .store_ready(f2_store_ready), .load_ready_downstream((unnamedtuple7497USEDMULTIPLEtuple[0])), .load_ready(f2_load_ready), .load_reset(reset), .store_input(crop_process_output), .store_output(f2_store_output));
  LiftHandshake_WaitOnInput_PadSeq_uint8_W640_H480_L4_R4_B1_Top1_T22 #(.INSTANCE_NAME({INSTANCE_NAME,"_pad"})) pad(.CLK(CLK), .ready_downstream(f1_store_ready), .ready(pad_ready), .reset(reset), .process_input(process_input), .process_output(pad_process_output));
  MakeHandshake_campipe #(.INSTANCE_NAME({INSTANCE_NAME,"_HH"})) HH(.CLK(CLK), .ready_downstream(crop_ready), .ready(HH_ready), .reset(reset), .process_input(f1_load_output), .process_output(HH_process_output));
  LiftHandshake_LiftDecimate_cropHelperSeq_uint8_4_1__W648_H482_T2_L7_R1_B2_Top0 #(.INSTANCE_NAME({INSTANCE_NAME,"_crop"})) crop(.CLK(CLK), .ready_downstream(f2_store_ready), .ready(crop_ready), .reset(reset), .process_input(HH_process_output), .process_output(crop_process_output));
endmodule

module hsfn(input CLK, input ready_downstream, output ready, input reset, input [64:0] process_input, output [64:0] process_output);
parameter INSTANCE_NAME="INST";
parameter OUTPUT_COUNT=0;
parameter INPUT_COUNT=0;
  wire O1_ready;
  wire idx_ready;
  wire incrate_ready;
  assign ready = incrate_ready;
  wire [32:0] incrate_process_output;
  wire [16:0] idx_process_output;
  wire [64:0] O1_process_output;
  assign process_output = O1_process_output;
  // function: ready pure=true ONLY WIRE
  // function: reset pure=false ONLY WIRE
  // function: process pure=false ONLY WIRE
  LiftHandshake_WaitOnInput_ChangeRate_uint8_2_1__from4_to2_H1 #(.INSTANCE_NAME({INSTANCE_NAME,"_incrate"})) incrate(.CLK(CLK), .ready_downstream(idx_ready), .ready(incrate_ready), .reset(reset), .process_input(process_input), .process_output(incrate_process_output));
  MakeHandshake_map_slice_typeuint8_2_1__xl0_xh0_yl0_yh0_W2_H1 #(.INSTANCE_NAME({INSTANCE_NAME,"_idx"})) idx(.CLK(CLK), .ready_downstream(O1_ready), .ready(idx_ready), .reset(reset), .process_input(incrate_process_output), .process_output(idx_process_output));
  hsfn_uint8L3_R3_B1_T1_W640_H480function__0x0576b370 #(.INSTANCE_NAME({INSTANCE_NAME,"_O1"})) O1(.CLK(CLK), .ready_downstream(ready_downstream), .ready(O1_ready), .reset(reset), .process_input(idx_process_output), .process_output(O1_process_output));
endmodule

module Overflow_307200(input CLK, input process_valid, input CE, input [63:0] process_input, output [64:0] process_output, input reset);
parameter INSTANCE_NAME="INST";
always @(posedge CLK) begin if(process_valid===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'process'", INSTANCE_NAME);  end end
always @(posedge CLK) begin if(reset===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'reset'", INSTANCE_NAME);  end end
  reg [63:0] process_input_delay1_validunnamednull0_CECE;  always @ (posedge CLK) begin if (CE) begin process_input_delay1_validunnamednull0_CECE <= process_input; end end
  wire [31:0] cnt_GET_OUTPUT;
  reg unnamedbinop8375_delay1_validunnamednull0_CECE;  always @ (posedge CLK) begin if (CE) begin unnamedbinop8375_delay1_validunnamednull0_CECE <= {((cnt_GET_OUTPUT)<((32'd307200)))}; end end
  wire [31:0] cnt_SETBY_OUTPUT;
  assign process_output = {unnamedbinop8375_delay1_validunnamednull0_CECE,process_input_delay1_validunnamednull0_CECE};
  // function: process pure=false delay=1
  // function: reset pure=false delay=0
  RegBy_incif_1uint32_CEtable__0x07d3ba40_CEtrue_initnil #(.INSTANCE_NAME({INSTANCE_NAME,"_cnt"})) cnt(.CLK(CLK), .set_valid(reset), .CE(CE), .set_inp((32'd0)), .setby_valid(process_valid), .setby_inp((1'd1)), .SETBY_OUTPUT(cnt_SETBY_OUTPUT), .GET_OUTPUT(cnt_GET_OUTPUT));
endmodule

module LiftDecimate_Overflow_307200(input CLK, output ready, input reset, input CE, input process_valid, input [64:0] process_input, output [64:0] process_output);
parameter INSTANCE_NAME="INST";
always @(posedge CLK) begin if(reset===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'reset'", INSTANCE_NAME);  end end
always @(posedge CLK) begin if(process_valid===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'process'", INSTANCE_NAME);  end end
  assign ready = (1'd1);
  wire unnamedcast8403USEDMULTIPLEcast;assign unnamedcast8403USEDMULTIPLEcast = (process_input[64]); 
  wire [64:0] LiftDecimate_process_output;
  reg [63:0] unnamedcast8406_delay1_validunnamednull0_CECE;  always @ (posedge CLK) begin if (CE) begin unnamedcast8406_delay1_validunnamednull0_CECE <= (LiftDecimate_process_output[63:0]); end end
  reg unnamedcast8403_delay1_validunnamednull0_CECE;  always @ (posedge CLK) begin if (CE) begin unnamedcast8403_delay1_validunnamednull0_CECE <= unnamedcast8403USEDMULTIPLEcast; end end
  reg unnamedbinop8411_delay1_validunnamednull0_CECE;  always @ (posedge CLK) begin if (CE) begin unnamedbinop8411_delay1_validunnamednull0_CECE <= {((LiftDecimate_process_output[64])&&unnamedcast8403_delay1_validunnamednull0_CECE)}; end end
  assign process_output = {unnamedbinop8411_delay1_validunnamednull0_CECE,unnamedcast8406_delay1_validunnamednull0_CECE};
  // function: ready pure=true delay=0
  // function: reset pure=false delay=0
  // function: process pure=false delay=2
  Overflow_307200 #(.INSTANCE_NAME({INSTANCE_NAME,"_LiftDecimate"})) LiftDecimate(.CLK(CLK), .process_valid({(unnamedcast8403USEDMULTIPLEcast&&process_valid)}), .CE(CE), .process_input((process_input[63:0])), .process_output(LiftDecimate_process_output), .reset(reset));
endmodule

module ShiftRegister_2_CEtrue_TY1(input CLK, input pushPop_valid, input CE, input sr_input, output pushPop_out, input reset);
parameter INSTANCE_NAME="INST";
always @(posedge CLK) begin if(pushPop_valid===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'pushPop'", INSTANCE_NAME);  end end
always @(posedge CLK) begin if(reset===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'reset'", INSTANCE_NAME);  end end
  reg SR2;
  always @(posedge CLK) begin if(pushPop_valid===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR1' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if(reset===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR1' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if((({4'b0,pushPop_valid})+({4'b0,reset})) > 5'd1) begin $display("error, function 'set' on instance 'SR1' in module '%s' has multiple valid bits active in same cycle!",INSTANCE_NAME);$finish(); end end
  wire [1:0] unnamedcallArbitrate8069USEDMULTIPLEcallArbitrate;assign unnamedcallArbitrate8069USEDMULTIPLEcallArbitrate = {(pushPop_valid||reset),((pushPop_valid)?(sr_input):((1'd0)))}; 
  reg SR1;  always @ (posedge CLK) begin if ((unnamedcallArbitrate8069USEDMULTIPLEcallArbitrate[1]) && CE) begin SR1 <= (unnamedcallArbitrate8069USEDMULTIPLEcallArbitrate[0]); end end
  always @(posedge CLK) begin if(pushPop_valid===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR2' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if(reset===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR2' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if((({4'b0,pushPop_valid})+({4'b0,reset})) > 5'd1) begin $display("error, function 'set' on instance 'SR2' in module '%s' has multiple valid bits active in same cycle!",INSTANCE_NAME);$finish(); end end
  wire [1:0] unnamedcallArbitrate8075USEDMULTIPLEcallArbitrate;assign unnamedcallArbitrate8075USEDMULTIPLEcallArbitrate = {(pushPop_valid||reset),((pushPop_valid)?(SR1):((1'd0)))}; 
    always @ (posedge CLK) begin if ((unnamedcallArbitrate8075USEDMULTIPLEcallArbitrate[1]) && CE) begin SR2 <= (unnamedcallArbitrate8075USEDMULTIPLEcallArbitrate[0]); end end
  assign pushPop_out = SR2;
  // function: pushPop pure=false delay=0
  // function: reset pure=false delay=0
endmodule

module LiftHandshake_LiftDecimate_Overflow_307200(input CLK, input ready_downstream, output ready, input reset, input [64:0] process_input, output [64:0] process_output);
parameter INSTANCE_NAME="INST";
parameter OUTPUT_COUNT=0;
parameter INPUT_COUNT=0;
  wire inner_LiftDecimate_Overflow_307200_ready;
  assign ready = {(inner_LiftDecimate_Overflow_307200_ready&&ready_downstream)};
  wire unnamedbinop8448USEDMULTIPLEbinop;assign unnamedbinop8448USEDMULTIPLEbinop = {(reset||ready_downstream)}; 
  wire unnamedunary8449USEDMULTIPLEunary;assign unnamedunary8449USEDMULTIPLEunary = {(~reset)}; 
  wire [64:0] inner_LiftDecimate_Overflow_307200_process_output;
  wire validBitDelay_LiftDecimate_Overflow_307200_pushPop_out;
  wire [64:0] unnamedtuple8459USEDMULTIPLEtuple;assign unnamedtuple8459USEDMULTIPLEtuple = {{((inner_LiftDecimate_Overflow_307200_process_output[64])&&validBitDelay_LiftDecimate_Overflow_307200_pushPop_out)},(inner_LiftDecimate_Overflow_307200_process_output[63:0])}; 
  always @(posedge CLK) begin if({(~{((unnamedtuple8459USEDMULTIPLEtuple[64])===1'bx)})} == 1'b0 && (1'd1)==1'b1) begin $display("%s: LiftHandshake: output valid bit should not be X!",INSTANCE_NAME); end end
  always @(posedge CLK) begin if({(~{((process_input[64])===1'bx)})} == 1'b0 && (1'd1)==1'b1) begin $display("%s: LiftHandshake: input valid bit should not be X!",INSTANCE_NAME); end end
  assign process_output = unnamedtuple8459USEDMULTIPLEtuple;
  // function: ready pure=true ONLY WIRE
  // function: reset pure=false ONLY WIRE
  // function: process pure=false ONLY WIRE
  LiftDecimate_Overflow_307200 #(.INSTANCE_NAME({INSTANCE_NAME,"_inner_LiftDecimate_Overflow_307200"})) inner_LiftDecimate_Overflow_307200(.CLK(CLK), .ready(inner_LiftDecimate_Overflow_307200_ready), .reset(reset), .CE(unnamedbinop8448USEDMULTIPLEbinop), .process_valid(unnamedunary8449USEDMULTIPLEunary), .process_input(process_input), .process_output(inner_LiftDecimate_Overflow_307200_process_output));
  ShiftRegister_2_CEtrue_TY1 #(.INSTANCE_NAME({INSTANCE_NAME,"_validBitDelay_LiftDecimate_Overflow_307200"})) validBitDelay_LiftDecimate_Overflow_307200(.CLK(CLK), .pushPop_valid(unnamedunary8449USEDMULTIPLEunary), .CE(unnamedbinop8448USEDMULTIPLEbinop), .sr_input((1'd1)), .pushPop_out(validBitDelay_LiftDecimate_Overflow_307200_pushPop_out), .reset(reset));
endmodule

module Underflow_Auint8_4_1__2_1__count307200_cycles468504_toosoon156168_USfalse(input CLK, input ready_downstream, output ready, input reset, input [64:0] process_input, output [64:0] process_output);
parameter INSTANCE_NAME="INST";
parameter OUTPUT_COUNT=0;
parameter INPUT_COUNT=0;
  assign ready = ready_downstream;
  wire unnamedbinop8485USEDMULTIPLEbinop;assign unnamedbinop8485USEDMULTIPLEbinop = {(ready_downstream||reset)}; 
  wire [31:0] cycleCount_GET_OUTPUT;
  wire unnamedbinop8484USEDMULTIPLEbinop;assign unnamedbinop8484USEDMULTIPLEbinop = {((cycleCount_GET_OUTPUT)>((32'd468504)))}; 
  wire [31:0] outputCount_GET_OUTPUT;
  wire [31:0] unnamedcast8498USEDMULTIPLEcast;assign unnamedcast8498USEDMULTIPLEcast = (32'd307200); 
  wire unnamedcast8478USEDMULTIPLEcast;assign unnamedcast8478USEDMULTIPLEcast = (process_input[64]); 
  wire unnamedunary8504USEDMULTIPLEunary;assign unnamedunary8504USEDMULTIPLEunary = {(~reset)}; 
  wire unnamedbinop8514USEDMULTIPLEbinop;assign unnamedbinop8514USEDMULTIPLEbinop = {({(cycleCount_GET_OUTPUT==(32'd156168))}&&{((outputCount_GET_OUTPUT)>=(unnamedcast8498USEDMULTIPLEcast))})}; 
  wire [31:0] outputCount_SETBY_OUTPUT;
  wire [31:0] cycleCount_SETBY_OUTPUT;
  always @(posedge CLK) begin if({(~unnamedbinop8514USEDMULTIPLEbinop)} == 1'b0 && unnamedunary8504USEDMULTIPLEunary==1'b1 && unnamedbinop8485USEDMULTIPLEbinop==1'b1) begin $display("%s: pipeline completed eariler than expected",INSTANCE_NAME); end end
  assign process_output = {{({({({(unnamedbinop8484USEDMULTIPLEbinop&&{((outputCount_GET_OUTPUT)<(unnamedcast8498USEDMULTIPLEcast))})}||{({(~unnamedbinop8484USEDMULTIPLEbinop)}&&unnamedcast8478USEDMULTIPLEcast)})}&&unnamedunary8504USEDMULTIPLEunary)}||unnamedbinop8514USEDMULTIPLEbinop)},((unnamedbinop8484USEDMULTIPLEbinop)?((64'd3735928559)):((process_input[63:0])))};
  // function: ready pure=true ONLY WIRE
  // function: reset pure=false ONLY WIRE
  // function: process pure=false ONLY WIRE
  RegBy_incif_1uint32_CEtable__0x07d3ba40_CEtrue_initnil #(.INSTANCE_NAME({INSTANCE_NAME,"_outputCount"})) outputCount(.CLK(CLK), .set_valid(reset), .CE(unnamedbinop8485USEDMULTIPLEbinop), .set_inp((32'd0)), .setby_valid(unnamedunary8504USEDMULTIPLEunary), .setby_inp({(ready_downstream&&{(unnamedcast8478USEDMULTIPLEcast||unnamedbinop8484USEDMULTIPLEbinop)})}), .SETBY_OUTPUT(outputCount_SETBY_OUTPUT), .GET_OUTPUT(outputCount_GET_OUTPUT));
  RegBy_incif_1uint32_CEtable__0x07d3ba40_CEtrue_initnil #(.INSTANCE_NAME({INSTANCE_NAME,"_cycleCount"})) cycleCount(.CLK(CLK), .set_valid(reset), .CE(unnamedbinop8485USEDMULTIPLEbinop), .set_inp((32'd0)), .setby_valid(unnamedunary8504USEDMULTIPLEunary), .setby_inp((1'd1)), .SETBY_OUTPUT(cycleCount_SETBY_OUTPUT), .GET_OUTPUT(cycleCount_GET_OUTPUT));
endmodule

module incif_wrapuint32_153615_inc1(input CLK, input CE, input [32:0] process_input, output [31:0] process_output);
parameter INSTANCE_NAME="INST";
  wire [31:0] unnamedcast8525USEDMULTIPLEcast;assign unnamedcast8525USEDMULTIPLEcast = (process_input[31:0]); 
  assign process_output = (((process_input[32]))?((({(unnamedcast8525USEDMULTIPLEcast==(32'd153615))})?((32'd0)):({(unnamedcast8525USEDMULTIPLEcast+(32'd1))}))):(unnamedcast8525USEDMULTIPLEcast));
  // function: process pure=true delay=0
endmodule

module RegBy_incif_wrapuint32_153615_inc1_CEtrue_initnil(input CLK, input set_valid, input CE, input [31:0] set_inp, input setby_valid, input setby_inp, output [31:0] SETBY_OUTPUT, output [31:0] GET_OUTPUT);
parameter INSTANCE_NAME="INST";
  reg [31:0] R;
  wire [31:0] regby_inner_process_output;
  always @(posedge CLK) begin if(set_valid===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'R' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if(setby_valid===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'R' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if((({4'b0,set_valid})+({4'b0,setby_valid})) > 5'd1) begin $display("error, function 'set' on instance 'R' in module '%s' has multiple valid bits active in same cycle!",INSTANCE_NAME);$finish(); end end
  wire [32:0] unnamedcallArbitrate8576USEDMULTIPLEcallArbitrate;assign unnamedcallArbitrate8576USEDMULTIPLEcallArbitrate = {(set_valid||setby_valid),((set_valid)?(set_inp):(regby_inner_process_output))}; 
    always @ (posedge CLK) begin if ((unnamedcallArbitrate8576USEDMULTIPLEcallArbitrate[32]) && CE) begin R <= (unnamedcallArbitrate8576USEDMULTIPLEcallArbitrate[31:0]); end end
  assign SETBY_OUTPUT = regby_inner_process_output;
  assign GET_OUTPUT = R;
  // function: set pure=false ONLY WIRE
  // function: setby pure=false ONLY WIRE
  // function: get pure=true ONLY WIRE
  incif_wrapuint32_153615_inc1 #(.INSTANCE_NAME({INSTANCE_NAME,"_regby_inner"})) regby_inner(.CLK(CLK), .CE(CE), .process_input({setby_inp,R}), .process_output(regby_inner_process_output));
endmodule

module incif_1uint32_CEnil(input CLK, input [32:0] process_input, output [31:0] process_output);
parameter INSTANCE_NAME="INST";
  wire [31:0] unnamedcast8585USEDMULTIPLEcast;assign unnamedcast8585USEDMULTIPLEcast = (process_input[31:0]); 
  assign process_output = (((process_input[32]))?({(unnamedcast8585USEDMULTIPLEcast+(32'd1))}):(unnamedcast8585USEDMULTIPLEcast));
  // function: process pure=true delay=0
endmodule

module RegBy_incif_1uint32_CEnil_CEfalse_initnil(input CLK, input set_valid, input [31:0] set_inp, input setby_valid, input setby_inp, output [31:0] SETBY_OUTPUT, output [31:0] GET_OUTPUT);
parameter INSTANCE_NAME="INST";
  reg [31:0] R;
  wire [31:0] regby_inner_process_output;
  always @(posedge CLK) begin if(set_valid===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'R' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if(setby_valid===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'R' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if((({4'b0,set_valid})+({4'b0,setby_valid})) > 5'd1) begin $display("error, function 'set' on instance 'R' in module '%s' has multiple valid bits active in same cycle!",INSTANCE_NAME);$finish(); end end
  wire [32:0] unnamedcallArbitrate8617USEDMULTIPLEcallArbitrate;assign unnamedcallArbitrate8617USEDMULTIPLEcallArbitrate = {(set_valid||setby_valid),((set_valid)?(set_inp):(regby_inner_process_output))}; 
    always @ (posedge CLK) begin R <= (unnamedcallArbitrate8617USEDMULTIPLEcallArbitrate[31:0]); end
  assign SETBY_OUTPUT = regby_inner_process_output;
  assign GET_OUTPUT = R;
  // function: set pure=false ONLY WIRE
  // function: setby pure=false ONLY WIRE
  // function: get pure=true ONLY WIRE
  incif_1uint32_CEnil #(.INSTANCE_NAME({INSTANCE_NAME,"_regby_inner"})) regby_inner(.CLK(CLK), .process_input({setby_inp,R}), .process_output(regby_inner_process_output));
endmodule

module CycleCounter_Auint8_4_1__2_1__count153600(input CLK, input ready_downstream, output ready, input reset, input [64:0] process_input, output [64:0] process_output);
parameter INSTANCE_NAME="INST";
parameter OUTPUT_COUNT=0;
parameter INPUT_COUNT=0;
  wire [31:0] outputCount_GET_OUTPUT;
  wire unnamedbinop8630USEDMULTIPLEbinop;assign unnamedbinop8630USEDMULTIPLEbinop = {((outputCount_GET_OUTPUT)>=((32'd153600)))}; 
  wire unnamedunary8653USEDMULTIPLEunary;assign unnamedunary8653USEDMULTIPLEunary = {(~unnamedbinop8630USEDMULTIPLEbinop)}; 
  assign ready = {(ready_downstream&&unnamedunary8653USEDMULTIPLEunary)};
  wire unnamedbinop8631USEDMULTIPLEbinop;assign unnamedbinop8631USEDMULTIPLEbinop = {(ready_downstream||reset)}; 
  wire [31:0] cycleCount_GET_OUTPUT;
  wire unnamedcast8624USEDMULTIPLEcast;assign unnamedcast8624USEDMULTIPLEcast = (process_input[64]); 
  wire unnamedunary8646USEDMULTIPLEunary;assign unnamedunary8646USEDMULTIPLEunary = {(~reset)}; 
  wire [31:0] outputCount_SETBY_OUTPUT;
  wire [31:0] cycleCount_SETBY_OUTPUT;
  assign process_output = {{({(unnamedbinop8630USEDMULTIPLEbinop||unnamedcast8624USEDMULTIPLEcast)}&&unnamedunary8646USEDMULTIPLEunary)},((unnamedbinop8630USEDMULTIPLEbinop)?({cycleCount_GET_OUTPUT,cycleCount_GET_OUTPUT}):((process_input[63:0])))};
  // function: ready pure=true ONLY WIRE
  // function: reset pure=false ONLY WIRE
  // function: process pure=false ONLY WIRE
  RegBy_incif_wrapuint32_153615_inc1_CEtrue_initnil #(.INSTANCE_NAME({INSTANCE_NAME,"_outputCount"})) outputCount(.CLK(CLK), .set_valid(reset), .CE(unnamedbinop8631USEDMULTIPLEbinop), .set_inp((32'd0)), .setby_valid(unnamedunary8646USEDMULTIPLEunary), .setby_inp({(ready_downstream&&{(unnamedcast8624USEDMULTIPLEcast||unnamedbinop8630USEDMULTIPLEbinop)})}), .SETBY_OUTPUT(outputCount_SETBY_OUTPUT), .GET_OUTPUT(outputCount_GET_OUTPUT));
  RegBy_incif_1uint32_CEnil_CEfalse_initnil #(.INSTANCE_NAME({INSTANCE_NAME,"_cycleCount"})) cycleCount(.CLK(CLK), .set_valid(reset), .set_inp((32'd0)), .setby_valid(unnamedunary8646USEDMULTIPLEunary), .setby_inp(unnamedunary8653USEDMULTIPLEunary), .SETBY_OUTPUT(cycleCount_SETBY_OUTPUT), .GET_OUTPUT(cycleCount_GET_OUTPUT));
endmodule

module fwriteSeq_campipe_ov7660_sim_raw(input CLK, input process_valid, input CE, input [63:0] process_input, output [63:0] process_output, input reset);
parameter INSTANCE_NAME="INST";
always @(posedge CLK) begin if(process_valid===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'process'", INSTANCE_NAME);  end end
always @(posedge CLK) begin if(reset===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'reset'", INSTANCE_NAME);  end end
  assign process_output = process_input;
  // function: process pure=false delay=0
  // function: reset pure=false delay=0
  integer fwritefile_file,r;
  initial begin fwritefile_file = $fopen("campipe_ov7660.sim.raw","wb"); end
  always @ (posedge CLK) begin 
    if (process_valid && CE) begin $fwrite(fwritefile_file, "%c", process_input[7:0] ); $fwrite(fwritefile_file, "%c", process_input[15:8] ); $fwrite(fwritefile_file, "%c", process_input[23:16] ); $fwrite(fwritefile_file, "%c", process_input[31:24] ); $fwrite(fwritefile_file, "%c", process_input[39:32] ); $fwrite(fwritefile_file, "%c", process_input[47:40] ); $fwrite(fwritefile_file, "%c", process_input[55:48] ); $fwrite(fwritefile_file, "%c", process_input[63:56] );  end 
    if (reset) begin r=$fseek(fwritefile_file,0,0); end  end

endmodule

module MakeHandshake_fwriteSeq_campipe_ov7660_sim_raw(input CLK, input ready_downstream, output ready, input reset, input [64:0] process_input, output [64:0] process_output);
parameter INSTANCE_NAME="INST";
parameter OUTPUT_COUNT=0;
parameter INPUT_COUNT=0;
  assign ready = ready_downstream;
  wire unnamedbinop8673USEDMULTIPLEbinop;assign unnamedbinop8673USEDMULTIPLEbinop = {(ready_downstream||reset)}; 
  wire unnamedcast8681USEDMULTIPLEcast;assign unnamedcast8681USEDMULTIPLEcast = (process_input[64]); 
  wire [63:0] inner_process_output;
  wire validBitDelay_fwriteSeq_campipe_ov7660_sim_raw_pushPop_out;
  always @(posedge CLK) begin if({(~{(unnamedcast8681USEDMULTIPLEcast===1'bx)})} == 1'b0 && (1'd1)==1'b1) begin $display("%s: MakeHandshake: input valid bit should not be X!",INSTANCE_NAME); end end
  assign process_output = {validBitDelay_fwriteSeq_campipe_ov7660_sim_raw_pushPop_out,inner_process_output};
  // function: ready pure=true ONLY WIRE
  // function: reset pure=false ONLY WIRE
  // function: process pure=false ONLY WIRE
  ShiftRegister_0_CEtrue_TY1 #(.INSTANCE_NAME({INSTANCE_NAME,"_validBitDelay_fwriteSeq_campipe_ov7660_sim_raw"})) validBitDelay_fwriteSeq_campipe_ov7660_sim_raw(.CLK(CLK), .CE(unnamedbinop8673USEDMULTIPLEbinop), .sr_input(unnamedcast8681USEDMULTIPLEcast), .pushPop_out(validBitDelay_fwriteSeq_campipe_ov7660_sim_raw_pushPop_out));
  fwriteSeq_campipe_ov7660_sim_raw #(.INSTANCE_NAME({INSTANCE_NAME,"_inner"})) inner(.CLK(CLK), .process_valid(unnamedcast8681USEDMULTIPLEcast), .CE(unnamedbinop8673USEDMULTIPLEbinop), .process_input((process_input[63:0])), .process_output(inner_process_output), .reset(reset));
endmodule

module harness3(input CLK, input ready_downstream, output ready, input reset, input process_input, output [64:0] process_output);
parameter INSTANCE_NAME="INST";
parameter OUTPUT_COUNT=0;
parameter INPUT_COUNT=0;
  wire fwrite_ready;
  wire cycleCounter_ready;
  wire underflow_ready;
  wire overflow_ready;
  wire HARNESS_inner_ready;
  wire fread_ready;
  wire inpdata_ready;
  wire underflow_US_ready;
  assign ready = underflow_US_ready;
  wire [0:0] underflow_US_process_output;
  wire [0:0] inpdata_process_output;
  wire [64:0] fread_process_output;
  wire [64:0] HARNESS_inner_process_output;
  wire [64:0] overflow_process_output;
  wire [64:0] underflow_process_output;
  wire [64:0] cycleCounter_process_output;
  wire [64:0] fwrite_process_output;
  assign process_output = fwrite_process_output;
  // function: ready pure=true ONLY WIRE
  // function: reset pure=false ONLY WIRE
  // function: process pure=false ONLY WIRE
  Underflow_A_null_null__count153600_cycles1874016_toosoon156168_UStrue #(.INSTANCE_NAME({INSTANCE_NAME,"_underflow_US"})) underflow_US(.CLK(CLK), .ready_downstream(inpdata_ready), .ready(underflow_US_ready), .reset(reset), .process_input(process_input), .process_output(underflow_US_process_output));
  MakeHandshake_index__null_null__0 #(.INSTANCE_NAME({INSTANCE_NAME,"_inpdata"})) inpdata(.CLK(CLK), .ready_downstream(fread_ready), .ready(inpdata_ready), .reset(reset), .process_input(underflow_US_process_output), .process_output(inpdata_process_output));
  MakeHandshake_freadSeq____ov7660_raw_dup #(.INSTANCE_NAME({INSTANCE_NAME,"_fread"})) fread(.CLK(CLK), .ready_downstream(HARNESS_inner_ready), .ready(fread_ready), .reset(reset), .process_input(inpdata_process_output), .process_output(fread_process_output));
  hsfn #(.INSTANCE_NAME({INSTANCE_NAME,"_HARNESS_inner"})) HARNESS_inner(.CLK(CLK), .ready_downstream(overflow_ready), .ready(HARNESS_inner_ready), .reset(reset), .process_input(fread_process_output), .process_output(HARNESS_inner_process_output));
  LiftHandshake_LiftDecimate_Overflow_307200 #(.INSTANCE_NAME({INSTANCE_NAME,"_overflow"})) overflow(.CLK(CLK), .ready_downstream(underflow_ready), .ready(overflow_ready), .reset(reset), .process_input(HARNESS_inner_process_output), .process_output(overflow_process_output));
  Underflow_Auint8_4_1__2_1__count307200_cycles468504_toosoon156168_USfalse #(.INSTANCE_NAME({INSTANCE_NAME,"_underflow"})) underflow(.CLK(CLK), .ready_downstream(cycleCounter_ready), .ready(underflow_ready), .reset(reset), .process_input(overflow_process_output), .process_output(underflow_process_output));
  CycleCounter_Auint8_4_1__2_1__count153600 #(.INSTANCE_NAME({INSTANCE_NAME,"_cycleCounter"})) cycleCounter(.CLK(CLK), .ready_downstream(fwrite_ready), .ready(cycleCounter_ready), .reset(reset), .process_input(underflow_process_output), .process_output(cycleCounter_process_output));
  MakeHandshake_fwriteSeq_campipe_ov7660_sim_raw #(.INSTANCE_NAME({INSTANCE_NAME,"_fwrite"})) fwrite(.CLK(CLK), .ready_downstream(ready_downstream), .ready(fwrite_ready), .reset(reset), .process_input(cycleCounter_process_output), .process_output(fwrite_process_output));
endmodule

module sim();
reg CLK = 0;
integer i = 0;
reg RST = 1;
wire valid;
reg [0:0] ready_downstream = 1;
reg [15:0] doneCnt = 0;
wire ready;
reg [31:0] totalClocks = 0;
wire [64:0] process_output;
harness3 #(.INPUT_COUNT(153600),.OUTPUT_COUNT(307232)) inst (.CLK(CLK),.process_input(valid),.reset(RST),.ready(ready),.ready_downstream(1'b1),.process_output(process_output));
   initial begin
      // clock in reset bit
      while(i<100) begin CLK = 0; #10; CLK = 1; #10; i = i + 1; end

      RST = 0;
      //valid = 1;
      totalClocks = 0;
      while(1) begin CLK = 0; #10; CLK = 1; #10; end
   end

  reg [31:0] validInCnt = 0; // we should only drive W*H valid bits in
  reg [31:0] validCnt = 0;

  assign valid = (RST==0 && validInCnt < 153600);

  always @(posedge CLK) begin
        // we can't send more than W*H valid bits, or the AXI bus will lock up. Once we have W*H valid bits,
    // keep simulating for N cycles to make sure we don't send any more
    if(validCnt> 307232 ) begin $display("Too many valid bits!"); end // I think we have this _NOT_ finish so that it outputs an invalid file
    if(validCnt>= 307232 && doneCnt==1024 ) begin $finish(); end
    if(validCnt>= 307232 && 1'b1) begin doneCnt <= doneCnt+1; end
    if(RST==0 && ready) begin validInCnt <= validInCnt + 1; end
    
    // ignore the output when we're in reset mode - output is probably bogus
    if(1'b1 && process_output[64] && RST==1'b0) begin validCnt = validCnt + 1; end
    ready_downstream <= ready_downstream + 1;
    totalClocks <= totalClocks + 1;
  end
endmodule
