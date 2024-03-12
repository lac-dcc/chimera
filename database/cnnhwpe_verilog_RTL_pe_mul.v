// ********************************************************
// Copyright(c)  2018
// Project name  :  HWPE
// Author        :  chenhaoc
// File    name  :  pe_mul.v
// Module  name  :  pe_mul
// Created Time  :  2018/5/16 16:34:47
// Last Modified :  2018/5/20 9:46:48
// Abstract:

// ========================================================
// Revision     Date     Author      Comment
// --------  ---------  ---------    ---------
//   1.0    2018/05/16  chenhaoc
//
// ********************************************************

`define DLY 1
`timescale 1ns/10ps

module pe_mul(
    input  wire             clk,
    input  wire             rst,
    input  wire [1:0]       Data_type,
    input  wire [63:0]      lm,
    input  wire [64*16-1:0] rm,
    output wire [319:0]     mul_out_dat
);


wire [63:0] rm_15;
wire [63:0] rm_14;
wire [63:0] rm_13;
wire [63:0] rm_12;
wire [63:0] rm_11;
wire [63:0] rm_10;
wire [63:0] rm_9 ;
wire [63:0] rm_8 ;
wire [63:0] rm_7 ;
wire [63:0] rm_6 ;
wire [63:0] rm_5 ;
wire [63:0] rm_4 ;
wire [63:0] rm_3 ;
wire [63:0] rm_2 ;
wire [63:0] rm_1 ;
wire [63:0] rm_0 ;

wire [19:0] mul_out_0;
wire [19:0] mul_out_1;
wire [19:0] mul_out_2;
wire [19:0] mul_out_3;
wire [19:0] mul_out_4;
wire [19:0] mul_out_5;
wire [19:0] mul_out_6;
wire [19:0] mul_out_7;
wire [19:0] mul_out_8;
wire [19:0] mul_out_9;
wire [19:0] mul_out_10;
wire [19:0] mul_out_11;
wire [19:0] mul_out_12;
wire [19:0] mul_out_13;
wire [19:0] mul_out_14;
wire [19:0] mul_out_15;

assign {rm_15, rm_14, rm_13, rm_12, rm_11, rm_10, rm_9, rm_8,
        rm_7, rm_6, rm_5, rm_4, rm_3, rm_2, rm_1, rm_0} = rm;
assign mul_out_dat = {mul_out_15, mul_out_14, mul_out_13, mul_out_12,
                      mul_out_11, mul_out_10, mul_out_9,  mul_out_8,
                      mul_out_7,  mul_out_6,  mul_out_5,  mul_out_4,
                      mul_out_3,  mul_out_2,  mul_out_1,  mul_out_0};

mul   u_mul_0(
     .clk	  (clk	)
    ,.rst	  (rst	)
    ,.lm	  (lm	)
    ,.rm	  (rm_0	)
    ,.Data_type	  (Data_type	)
    ,.mul_out     (mul_out_0    )
);
mul   u_mul_1(
     .clk	  (clk	)
    ,.rst	  (rst	)
    ,.lm	  (lm	)
    ,.rm	  (rm_1	)
    ,.Data_type	  (Data_type	)
    ,.mul_out     (mul_out_1    )
);
mul   u_mul_2(
     .clk	  (clk	)
    ,.rst	  (rst	)
    ,.lm	  (lm	)
    ,.rm	  (rm_2	)
    ,.Data_type	  (Data_type	)
    ,.mul_out     (mul_out_2    )
);
mul   u_mul_3(
     .clk	  (clk	)
    ,.rst	  (rst	)
    ,.lm	  (lm	)
    ,.rm	  (rm_3	)
    ,.Data_type	  (Data_type	)
    ,.mul_out     (mul_out_3    )
);
mul   u_mul_4(
     .clk	  (clk	)
    ,.rst	  (rst	)
    ,.lm	  (lm	)
    ,.rm	  (rm_4	)
    ,.Data_type	  (Data_type	)
    ,.mul_out     (mul_out_4    )
);
mul   u_mul_5(
     .clk	  (clk	)
    ,.rst	  (rst	)
    ,.lm	  (lm	)
    ,.rm	  (rm_5	)
    ,.Data_type	  (Data_type	)
    ,.mul_out     (mul_out_5    )
);
mul   u_mul_6(
     .clk	  (clk	)
    ,.rst	  (rst	)
    ,.lm	  (lm	)
    ,.rm	  (rm_6	)
    ,.Data_type	  (Data_type	)
    ,.mul_out     (mul_out_6    )
);
mul   u_mul_7(
     .clk	  (clk	)
    ,.rst	  (rst	)
    ,.lm	  (lm	)
    ,.rm	  (rm_7	)
    ,.Data_type	  (Data_type	)
    ,.mul_out     (mul_out_7    )
);
mul   u_mul_8(
     .clk	  (clk	)
    ,.rst	  (rst	)
    ,.lm	  (lm	)
    ,.rm	  (rm_8	)
    ,.Data_type	  (Data_type	)
    ,.mul_out     (mul_out_8    )
);
mul   u_mul_9(
     .clk	  (clk	)
    ,.rst	  (rst	)
    ,.lm	  (lm	)
    ,.rm	  (rm_9	)
    ,.Data_type	  (Data_type	)
    ,.mul_out     (mul_out_9    )
);
mul   u_mul_10(
     .clk	  (clk	)
    ,.rst	  (rst	)
    ,.lm	  (lm	)
    ,.rm	  (rm_10	)
    ,.Data_type	  (Data_type	)
    ,.mul_out     (mul_out_10   )
);
mul   u_mul_11(
     .clk	  (clk	)
    ,.rst	  (rst	)
    ,.lm	  (lm	)
    ,.rm	  (rm_11	)
    ,.Data_type	  (Data_type	)
    ,.mul_out     (mul_out_11   )
);
mul   u_mul_12(
     .clk	  (clk	)
    ,.rst	  (rst	)
    ,.lm	  (lm	)
    ,.rm	  (rm_12	)
    ,.Data_type	  (Data_type	)
    ,.mul_out     (mul_out_12   )
);
mul   u_mul_13(
     .clk	  (clk	)
    ,.rst	  (rst	)
    ,.lm	  (lm	)
    ,.rm	  (rm_13	)
    ,.Data_type	  (Data_type	)
    ,.mul_out     (mul_out_13   )
);
mul   u_mul_14(
     .clk	  (clk	)
    ,.rst	  (rst	)
    ,.lm	  (lm	)
    ,.rm	  (rm_14	)
    ,.Data_type	  (Data_type	)
    ,.mul_out     (mul_out_14   )
);
mul   u_mul_15(
     .clk	  (clk	)
    ,.rst	  (rst	)
    ,.lm	  (lm	)
    ,.rm	  (rm_15	)
    ,.Data_type	  (Data_type	)
    ,.mul_out     (mul_out_15   )
);

endmodule
