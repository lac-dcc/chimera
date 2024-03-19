`define SM3_INPT_DW_32
`define INPT_DW    32
`define INPT_DW1        (`INPT_DW - 1)
`define INPT_BYTE_DW1   (`INPT_DW/8 - 1)
`define INPT_BYTE_DW    (`INPT_BYTE_DW1 + 1)
module sm3_cmprss_ceil_comb(
    input                   cmprss_round_sm_16_i,
    input [31:0]            tj_i,

    input [31:0]            reg_a_i,
    input [31:0]            reg_b_i,
    input [31:0]            reg_c_i,
    input [31:0]            reg_d_i,
    input [31:0]            reg_e_i,
    input [31:0]            reg_f_i,
    input [31:0]            reg_g_i,
    input [31:0]            reg_h_i,

    input [31:0]            wj_i,
    input [31:0]            wjj_i,

    output [31:0]           reg_a_o,
    output [31:0]           reg_b_o,
    output [31:0]           reg_c_o,
    output [31:0]           reg_d_o,
    output [31:0]           reg_e_o,
    output [31:0]           reg_f_o,
    output [31:0]           reg_g_o,
    output [31:0]           reg_h_o
    );


//wire
wire [31:0]	tmp_for_ss1_0	;
wire [31:0]	tmp_for_ss1_2	;
wire [31:0]	ss1				;
wire [31:0]	ss2				;
wire [31:0]	tmp_for_tt1_0	;
wire [31:0]	tmp_for_tt1_1	;
wire [31:0]	tt1				;
wire [31:0]	tmp_for_tt2_0	;
wire [31:0]	tmp_for_tt2_1	;
wire [31:0]	tt2				;
wire [31:0]	tt2_after_p0	;

wire [31:0]	TJ				=	tj_i;

//加法器0
assign  tmp_for_ss1_0	=	{reg_a_i[31-12:0], reg_a_i[31:31-12+1]} + reg_e_i;
assign  tmp_for_ss1_2	=	tmp_for_ss1_0 + TJ;

assign      ss1				=	{tmp_for_ss1_2[31 - 7 : 0], tmp_for_ss1_2[31 : 31 - 7 + 1]};
assign  	ss2				=	ss1 ^ {reg_a_i[31 - 12 : 0], reg_a_i[31 : 31 - 12 + 1]};

//加法器1
assign  	tmp_for_tt1_0	=	cmprss_round_sm_16_i? reg_a_i ^ reg_b_i ^ reg_c_i : (reg_a_i & reg_b_i | reg_a_i & reg_c_i | reg_b_i & reg_c_i);
assign  	tmp_for_tt1_1	=	reg_d_i + ss2 + wjj_i;
assign  	tt1				=	tmp_for_tt1_0 + tmp_for_tt1_1;


//加法器2
assign  	tmp_for_tt2_0	=	cmprss_round_sm_16_i? reg_e_i ^ reg_f_i ^ reg_g_i : (reg_e_i & reg_f_i | ~reg_e_i & reg_g_i);
assign  	tmp_for_tt2_1	=	reg_h_i + ss1 + wj_i;
assign  	tt2				=	tmp_for_tt2_0 + tmp_for_tt2_1;

assign  	tt2_after_p0	=	tt2 ^ {tt2[31-9:0], tt2[31:31-9+1]} ^ {tt2[31-17:0], tt2[31:31-17+1]};

assign  reg_a_o             =   tt1;
assign  reg_b_o             =   reg_a_i;
assign  reg_c_o             =   {reg_b_i[31 - 9 : 0], reg_b_i[31 : 31 - 9 + 1]};
assign  reg_d_o             =   reg_c_i;
assign  reg_e_o             =   tt2_after_p0;
assign  reg_f_o             =   reg_e_i;
assign  reg_g_o             =   {reg_f_i[31 - 19 : 0], reg_f_i[31 : 31 - 19 + 1]};
assign  reg_h_o             =   reg_g_i;

endmodule
