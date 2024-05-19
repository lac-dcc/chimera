// This program was cloned from: https://github.com/jameshegarty/rigel
// License: MIT License

module serializer
    #(  parameter INLOGBITS = 6,
        parameter OUTLOGBITS = 5,
        localparam INWIDTH = 1<<INLOGBITS,
        localparam OUTWIDTH = 1<<OUTLOGBITS)
    (
    
    input clk,
    input rst_n,

    input in_valid,
    output reg in_ready,
    input [INWIDTH-1:0] in_data,

    output out_valid,
    input out_ready,
    output [OUTWIDTH-1:0] out_data

);
 /*
    reg [3:0] cnt;
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) cnt <= 4'hf;
        else cnt <= (cnt==4'h0) ? 4'h0 : cnt-1'b1;
    end

    wire reset;
    assign reset = (cnt!=0);

    wire [32:0] out;
    LiftHandshake_WaitOnInput_ChangeRate_uint8_2_1__from4_to2_H1_2 inst(
        .CLK(clk),
        .ready_downstream(out_ready),
        .ready(in_ready),
        .reset(reset),
        .process_input({in_valid,in_data}),
        .process_output(out)
    );
    assign out_valid = out[32];
    assign out_data = out[31:0];

*/

    localparam LOGBITDIFF = INLOGBITS-OUTLOGBITS ;
    localparam MAXCNT = (1<<LOGBITDIFF)-1;

    reg [LOGBITDIFF-1:0] cnt;
    reg [LOGBITDIFF-1:0] cnt_next;

    reg [INWIDTH-1:0] in_buf;
    wire [INWIDTH-1:0] in_buf_shifted;
    reg [INWIDTH-1:0] in_buf_next;

    assign in_buf_shifted = in_buf >> OUTWIDTH ;
    assign out_data = in_buf[OUTWIDTH-1:0] ;

    reg in_buf_valid;
    reg in_buf_valid_next;
    
    assign out_valid = in_buf_valid;

    always @(*) begin
        in_buf_next = in_buf;
        in_ready = 0;
        in_buf_valid_next = in_buf_valid;
        cnt_next = cnt;
        if (cnt == MAXCNT && !in_buf_valid && in_valid) begin
            in_buf_next = in_data;
            in_buf_valid_next = 1;
            in_ready = 1;
        end
        else if (cnt == 0 && out_ready && in_valid) begin // in_valid better be valid
            cnt_next = cnt - 1'b1;
            in_buf_valid_next = 1;
            in_buf_next = in_data;
            in_ready = 1;
        end
        else if (cnt == 0 && out_ready && !in_valid) begin // should never be here for vga
            in_buf_valid_next = 0;
            in_ready = 1;
        end
        else if (out_ready) begin
            cnt_next = cnt - 1'b1;
            in_buf_next = in_buf_shifted;
            in_ready = 0;
        end
    end
    `REG(clk, cnt, MAXCNT, cnt_next)
    `REG(clk, in_buf_valid, 0, in_buf_valid_next)
    `REG(clk, in_buf, 0, in_buf_next)

endmodule

/*
module LiftHandshake_WaitOnInput_ChangeRate_uint8_2_1__from4_to2_H1_2(input CLK, input ready_downstream, output ready, input reset, input [64:0] process_input, output [32:0] process_output);
parameter INSTANCE_NAME="INST";
parameter OUTPUT_COUNT=0;
parameter INPUT_COUNT=0;
  wire inner_WaitOnInput_ChangeRate_uint8_2_1__from4_to2_H1_ready;
  assign ready = {(inner_WaitOnInput_ChangeRate_uint8_2_1__from4_to2_H1_ready&&ready_downstream)};
  wire unnamedbinop286USEDMULTIPLEbinop;assign unnamedbinop286USEDMULTIPLEbinop = {(reset||ready_downstream)}; 
  wire unnamedunary287USEDMULTIPLEunary;assign unnamedunary287USEDMULTIPLEunary = {(~reset)}; 
  wire [32:0] inner_WaitOnInput_ChangeRate_uint8_2_1__from4_to2_H1_process_output;
  wire validBitDelay_WaitOnInput_ChangeRate_uint8_2_1__from4_to2_H1_pushPop_out;
  wire [32:0] unnamedtuple319USEDMULTIPLEtuple;assign unnamedtuple319USEDMULTIPLEtuple = {{((inner_WaitOnInput_ChangeRate_uint8_2_1__from4_to2_H1_process_output[32])&&validBitDelay_WaitOnInput_ChangeRate_uint8_2_1__from4_to2_H1_pushPop_out)},(inner_WaitOnInput_ChangeRate_uint8_2_1__from4_to2_H1_process_output[31:0])}; 
  always @(posedge CLK) begin if({(~{((unnamedtuple319USEDMULTIPLEtuple[32])===1'bx)})} == 1'b0 && (1'd1)==1'b1) begin $display("%s: LiftHandshake: output valid bit should not be X!",INSTANCE_NAME); end end
  always @(posedge CLK) begin if({(~{((process_input[64])===1'bx)})} == 1'b0 && (1'd1)==1'b1) begin $display("%s: LiftHandshake: input valid bit should not be X!",INSTANCE_NAME); end end
  assign process_output = unnamedtuple319USEDMULTIPLEtuple;
  // function: ready pure=true ONLY WIRE
  // function: reset pure=false ONLY WIRE
  // function: process pure=false ONLY WIRE
  WaitOnInput_ChangeRate_uint8_2_1__from4_to2_H1_2 #(.INSTANCE_NAME({INSTANCE_NAME,"_inner_WaitOnInput_ChangeRate_uint8_2_1__from4_to2_H1"})) inner_WaitOnInput_ChangeRate_uint8_2_1__from4_to2_H1(.CLK(CLK), .ready(inner_WaitOnInput_ChangeRate_uint8_2_1__from4_to2_H1_ready), .reset(reset), .CE(unnamedbinop286USEDMULTIPLEbinop), .process_valid(unnamedunary287USEDMULTIPLEunary), .process_input(process_input), .process_output(inner_WaitOnInput_ChangeRate_uint8_2_1__from4_to2_H1_process_output));
  ShiftRegister_1_CEtrue_TY1_2 #(.INSTANCE_NAME({INSTANCE_NAME,"_validBitDelay_WaitOnInput_ChangeRate_uint8_2_1__from4_to2_H1"})) validBitDelay_WaitOnInput_ChangeRate_uint8_2_1__from4_to2_H1(.CLK(CLK), .pushPop_valid(unnamedunary287USEDMULTIPLEunary), .CE(unnamedbinop286USEDMULTIPLEbinop), .sr_input((1'd1)), .pushPop_out(validBitDelay_WaitOnInput_ChangeRate_uint8_2_1__from4_to2_H1_pushPop_out), .reset(reset));
endmodule


module ChangeRate_uint8_2_1__from4_to2_H1_2(input CLK, output ready, input reset, input CE, input process_valid, input [63:0] process_input, output [32:0] process_output);
parameter INSTANCE_NAME="INST";
always @(posedge CLK) begin if(reset===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'reset'", INSTANCE_NAME);  end end
always @(posedge CLK) begin if(process_valid===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'process'", INSTANCE_NAME);  end end
  wire [15:0] phase_GET_OUTPUT;
  wire unnamedbinop163_readingUSEDMULTIPLEbinop;assign unnamedbinop163_readingUSEDMULTIPLEbinop = {(phase_GET_OUTPUT==(16'd0))}; 
  assign ready = unnamedbinop163_readingUSEDMULTIPLEbinop;
  reg [31:0] SR_2;
  wire [31:0] unnamedselect173USEDMULTIPLEselect;assign unnamedselect173USEDMULTIPLEselect = ((unnamedbinop163_readingUSEDMULTIPLEbinop)?(({process_input[31:0]})):(SR_2)); 
  reg [31:0] unnamedselect173_delay1_validunnamednull0_CECE;  always @ (posedge CLK) begin if (CE) begin unnamedselect173_delay1_validunnamednull0_CECE <= unnamedselect173USEDMULTIPLEselect; end end
  reg [31:0] SR_1;  always @ (posedge CLK) begin if (process_valid && CE) begin SR_1 <= unnamedselect173USEDMULTIPLEselect; end end
    always @ (posedge CLK) begin if (process_valid && CE) begin SR_2 <= ((unnamedbinop163_readingUSEDMULTIPLEbinop)?(({process_input[63:32]})):(SR_1)); end end
  wire [15:0] phase_SETBY_OUTPUT;
  assign process_output = {(1'd1),unnamedselect173_delay1_validunnamednull0_CECE};
  // function: ready pure=true delay=0
  // function: reset pure=false delay=0
  // function: process pure=false delay=1
  RegBy_sumwrap_uint16_to1_CEtrue_initnil_2 #(.INSTANCE_NAME({INSTANCE_NAME,"_phase"})) phase(.CLK(CLK), .set_valid(reset), .CE(CE), .set_inp((16'd0)), .setby_valid(process_valid), .setby_inp((16'd1)), .SETBY_OUTPUT(phase_SETBY_OUTPUT), .GET_OUTPUT(phase_GET_OUTPUT));
endmodule

module RegBy_sumwrap_uint16_to1_CEtrue_initnil_2(input CLK, input set_valid, input CE, input [15:0] set_inp, input setby_valid, input [15:0] setby_inp, output [15:0] SETBY_OUTPUT, output [15:0] GET_OUTPUT);
parameter INSTANCE_NAME="INST";
  reg [15:0] R;
  wire [15:0] regby_inner_process_output;
  always @(posedge CLK) begin if(set_valid===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'R' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if(setby_valid===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'R' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if((({4'b0,set_valid})+({4'b0,setby_valid})) > 5'd1) begin $display("error, function 'set' on instance 'R' in module '%s' has multiple valid bits active in same cycle!",INSTANCE_NAME);$finish(); end end
  wire [16:0] unnamedcallArbitrate152USEDMULTIPLEcallArbitrate;assign unnamedcallArbitrate152USEDMULTIPLEcallArbitrate = {(set_valid||setby_valid),((set_valid)?(set_inp):(regby_inner_process_output))}; 
    always @ (posedge CLK) begin if ((unnamedcallArbitrate152USEDMULTIPLEcallArbitrate[16]) && CE) begin R <= (unnamedcallArbitrate152USEDMULTIPLEcallArbitrate[15:0]); end end
  assign SETBY_OUTPUT = regby_inner_process_output;
  assign GET_OUTPUT = R;
  // function: set pure=false ONLY WIRE
  // function: setby pure=false ONLY WIRE
  // function: get pure=true ONLY WIRE
  sumwrap_uint16_to1_1 #(.INSTANCE_NAME({INSTANCE_NAME,"_regby_inner"})) regby_inner(.CLK(CLK), .CE(CE), .process_input({setby_inp,R}), .process_output(regby_inner_process_output));
endmodule

module sumwrap_uint16_to1_1(input CLK, input CE, input [31:0] process_input, output [15:0] process_output);
parameter INSTANCE_NAME="INST";
  wire [15:0] unnamedcast112USEDMULTIPLEcast;assign unnamedcast112USEDMULTIPLEcast = (process_input[15:0]); 
  assign process_output = (({(unnamedcast112USEDMULTIPLEcast==(16'd1))})?((16'd0)):({(unnamedcast112USEDMULTIPLEcast+(process_input[31:16]))}));
  // function: process pure=true delay=0
endmodule

module WaitOnInput_ChangeRate_uint8_2_1__from4_to2_H1_2(input CLK, output ready, input reset, input CE, input process_valid, input [64:0] process_input, output [32:0] process_output);
parameter INSTANCE_NAME="INST";
always @(posedge CLK) begin if(reset===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'reset'", INSTANCE_NAME);  end end
always @(posedge CLK) begin if(process_valid===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'process'", INSTANCE_NAME);  end end
  wire WaitOnInput_inner_ready;
  assign ready = WaitOnInput_inner_ready;
  wire unnamedbinop251USEDMULTIPLEbinop;assign unnamedbinop251USEDMULTIPLEbinop = {({({(~WaitOnInput_inner_ready)}||(process_input[64]))}&&process_valid)}; 
  wire [32:0] WaitOnInput_inner_process_output;
  reg unnamedbinop251_delay1_validunnamednull0_CECE;  always @ (posedge CLK) begin if (CE) begin unnamedbinop251_delay1_validunnamednull0_CECE <= unnamedbinop251USEDMULTIPLEbinop; end end
  assign process_output = {{((WaitOnInput_inner_process_output[32])&&unnamedbinop251_delay1_validunnamednull0_CECE)},(WaitOnInput_inner_process_output[31:0])};
  // function: ready pure=true delay=0
  // function: reset pure=false delay=0
  // function: process pure=false delay=1
  ChangeRate_uint8_2_1__from4_to2_H1_2 #(.INSTANCE_NAME({INSTANCE_NAME,"_WaitOnInput_inner"})) WaitOnInput_inner(.CLK(CLK), .ready(WaitOnInput_inner_ready), .reset(reset), .CE(CE), .process_valid(unnamedbinop251USEDMULTIPLEbinop), .process_input((process_input[63:0])), .process_output(WaitOnInput_inner_process_output));
endmodule



module ShiftRegister_1_CEtrue_TY1_2(input CLK, input pushPop_valid, input CE, input sr_input, output pushPop_out, input reset);
parameter INSTANCE_NAME="INST";
always @(posedge CLK) begin if(pushPop_valid===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'pushPop'", INSTANCE_NAME);  end end
always @(posedge CLK) begin if(reset===1'bx) begin $display("Valid bit can't be x! Module '%s' function 'reset'", INSTANCE_NAME);  end end
  reg SR1;
  always @(posedge CLK) begin if(pushPop_valid===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR1' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if(reset===1'bx) begin $display("valid bit can't be x! Module '%s' instance 'SR1' function 'set'", INSTANCE_NAME); end end
  always @(posedge CLK) begin if((({4'b0,pushPop_valid})+({4'b0,reset})) > 5'd1) begin $display("error, function 'set' on instance 'SR1' in module '%s' has multiple valid bits active in same cycle!",INSTANCE_NAME);$finish(); end end
  wire [1:0] unnamedcallArbitrate305USEDMULTIPLEcallArbitrate;assign unnamedcallArbitrate305USEDMULTIPLEcallArbitrate = {(pushPop_valid||reset),((pushPop_valid)?(sr_input):((1'd0)))}; 
    always @ (posedge CLK) begin if ((unnamedcallArbitrate305USEDMULTIPLEcallArbitrate[1]) && CE) begin SR1 <= (unnamedcallArbitrate305USEDMULTIPLEcallArbitrate[0]); end end
  assign pushPop_out = SR1;
  // function: pushPop pure=false delay=0
  // function: reset pure=false delay=0
endmodule

*/

/*
serializer #(.INLOGBITS(6), .OUTLOGBITS(3)) inst_XXX(
    
    .clk(clk),
    .rst_n(rst_n),

    .in_valid(XXX_in_valid),
    .in_ready(XXX_in_ready),
    .in_data(XXX_in_data),

    .out_valid(XXX_out_valid),
    .out_ready(XXX_out_ready),
    .out_data(XXX_out_data)

);
*/

