// This program was cloned from: https://github.com/lnis-uofu/SOFA
// License: MIT License

//
//
//
//
//
//
module sb_2__2__mux_tree_tapbuf_size3_mem ( pReset , prog_clk , ccff_head , 
    ccff_tail , mem_out ) ;
input  [0:0] pReset ;
input  [0:0] prog_clk ;
input  [0:0] ccff_head ;
output [0:0] ccff_tail ;
output [0:1] mem_out ;

sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_0_ ( .D ( ccff_head[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[0] ) ) ;
sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_1_ ( .D ( mem_out[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[1] ) ) ;
sky130_fd_sc_hd__buf_1 FTB_53__52 ( .A ( mem_out[1] ) , .X ( ccff_tail[0] ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size3_mem_2 ( pReset , prog_clk , ccff_head , 
    ccff_tail , mem_out ) ;
input  [0:0] pReset ;
input  [0:0] prog_clk ;
input  [0:0] ccff_head ;
output [0:0] ccff_tail ;
output [0:1] mem_out ;

sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_0_ ( .D ( ccff_head[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[0] ) ) ;
sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_1_ ( .D ( mem_out[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[1] ) ) ;
sky130_fd_sc_hd__buf_1 FTB_52__51 ( .A ( mem_out[1] ) , .X ( ccff_tail[0] ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size3_mem_1 ( pReset , prog_clk , ccff_head , 
    ccff_tail , mem_out ) ;
input  [0:0] pReset ;
input  [0:0] prog_clk ;
input  [0:0] ccff_head ;
output [0:0] ccff_tail ;
output [0:1] mem_out ;

sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_0_ ( .D ( ccff_head[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[0] ) ) ;
sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_1_ ( .D ( mem_out[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[1] ) ) ;
sky130_fd_sc_hd__buf_1 FTB_51__50 ( .A ( mem_out[1] ) , .X ( ccff_tail[0] ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size3_mem_0 ( pReset , prog_clk , ccff_head , 
    ccff_tail , mem_out ) ;
input  [0:0] pReset ;
input  [0:0] prog_clk ;
input  [0:0] ccff_head ;
output [0:0] ccff_tail ;
output [0:1] mem_out ;

sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_0_ ( .D ( ccff_head[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[0] ) ) ;
sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_1_ ( .D ( mem_out[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[1] ) ) ;
sky130_fd_sc_hd__buf_1 FTB_50__49 ( .A ( mem_out[1] ) , .X ( ccff_tail[0] ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size3 ( in , sram , sram_inv , out , p0 ) ;
input  [0:2] in ;
input  [0:1] sram ;
input  [0:1] sram_inv ;
output [0:0] out ;
input  p0 ;

wire [0:0] sky130_fd_sc_hd__mux2_1_0_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_1_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_2_X ;

sky130_fd_sc_hd__mux2_1 mux_l1_in_0_ ( .A0 ( in[1] ) , .A1 ( in[0] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_0_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l1_in_1_ ( .A0 ( p0 ) , .A1 ( in[2] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_1_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_0_ ( 
    .A0 ( sky130_fd_sc_hd__mux2_1_1_X[0] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_0_X[0] ) , .S ( sram[1] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_2_X[0] ) ) ;
sky130_fd_sc_hd__inv_8 BINV_R_139 ( .A ( BUF_net_140 ) , .Y ( out[0] ) ) ;
sky130_fd_sc_hd__inv_1 BINV_R_140 ( .A ( sky130_fd_sc_hd__mux2_1_2_X[0] ) , 
    .Y ( BUF_net_140 ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size3_2 ( in , sram , sram_inv , out , p0 ) ;
input  [0:2] in ;
input  [0:1] sram ;
input  [0:1] sram_inv ;
output [0:0] out ;
input  p0 ;

wire [0:0] sky130_fd_sc_hd__mux2_1_0_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_1_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_2_X ;

sky130_fd_sc_hd__buf_6 sky130_fd_sc_hd__buf_4_0_ ( 
    .A ( sky130_fd_sc_hd__mux2_1_2_X[0] ) , .X ( out[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l1_in_0_ ( .A0 ( in[1] ) , .A1 ( in[0] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_0_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l1_in_1_ ( .A0 ( p0 ) , .A1 ( in[2] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_1_X[0] ) ) ;
sky130_fd_sc_hd__mux2_2 mux_l2_in_0_ ( 
    .A0 ( sky130_fd_sc_hd__mux2_1_1_X[0] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_0_X[0] ) , .S ( sram[1] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_2_X[0] ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size3_1 ( in , sram , sram_inv , out , p0 ) ;
input  [0:2] in ;
input  [0:1] sram ;
input  [0:1] sram_inv ;
output [0:0] out ;
input  p0 ;

wire [0:0] sky130_fd_sc_hd__mux2_1_0_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_1_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_2_X ;

sky130_fd_sc_hd__mux2_1 mux_l1_in_0_ ( .A0 ( in[1] ) , .A1 ( in[0] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_0_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l1_in_1_ ( .A0 ( p0 ) , .A1 ( in[2] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_1_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_0_ ( 
    .A0 ( sky130_fd_sc_hd__mux2_1_1_X[0] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_0_X[0] ) , .S ( sram[1] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_2_X[0] ) ) ;
sky130_fd_sc_hd__inv_8 BINV_R_137 ( .A ( BUF_net_138 ) , .Y ( out[0] ) ) ;
sky130_fd_sc_hd__inv_1 BINV_R_138 ( .A ( sky130_fd_sc_hd__mux2_1_2_X[0] ) , 
    .Y ( BUF_net_138 ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size3_0 ( in , sram , sram_inv , out , p0 ) ;
input  [0:2] in ;
input  [0:1] sram ;
input  [0:1] sram_inv ;
output [0:0] out ;
input  p0 ;

wire [0:0] sky130_fd_sc_hd__mux2_1_0_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_1_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_2_X ;

sky130_fd_sc_hd__mux2_1 mux_l1_in_0_ ( .A0 ( in[1] ) , .A1 ( in[0] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_0_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l1_in_1_ ( .A0 ( p0 ) , .A1 ( in[2] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_1_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_0_ ( 
    .A0 ( sky130_fd_sc_hd__mux2_1_1_X[0] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_0_X[0] ) , .S ( sram[1] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_2_X[0] ) ) ;
sky130_fd_sc_hd__inv_8 BINV_R_135 ( .A ( BUF_net_136 ) , .Y ( out[0] ) ) ;
sky130_fd_sc_hd__inv_1 BINV_R_136 ( .A ( sky130_fd_sc_hd__mux2_1_2_X[0] ) , 
    .Y ( BUF_net_136 ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size2_mem ( pReset , prog_clk , ccff_head , 
    ccff_tail , mem_out ) ;
input  [0:0] pReset ;
input  [0:0] prog_clk ;
input  [0:0] ccff_head ;
output [0:0] ccff_tail ;
output [0:1] mem_out ;

sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_0_ ( .D ( ccff_head[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[0] ) ) ;
sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_1_ ( .D ( mem_out[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[1] ) ) ;
sky130_fd_sc_hd__buf_6 FTB_49__48 ( .A ( copt_net_165 ) , 
    .X ( ccff_tail[0] ) ) ;
sky130_fd_sc_hd__dlygate4sd3_1 copt_h_inst_1335 ( .A ( mem_out[1] ) , 
    .X ( copt_net_165 ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size2_mem_35 ( pReset , prog_clk , ccff_head , 
    ccff_tail , mem_out ) ;
input  [0:0] pReset ;
input  [0:0] prog_clk ;
input  [0:0] ccff_head ;
output [0:0] ccff_tail ;
output [0:1] mem_out ;

sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_0_ ( .D ( ccff_head[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[0] ) ) ;
sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_1_ ( .D ( mem_out[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[1] ) ) ;
sky130_fd_sc_hd__buf_1 FTB_48__47 ( .A ( mem_out[1] ) , .X ( ccff_tail[0] ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size2_mem_34 ( pReset , prog_clk , ccff_head , 
    ccff_tail , mem_out ) ;
input  [0:0] pReset ;
input  [0:0] prog_clk ;
input  [0:0] ccff_head ;
output [0:0] ccff_tail ;
output [0:1] mem_out ;

sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_0_ ( .D ( ccff_head[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[0] ) ) ;
sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_1_ ( .D ( mem_out[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[1] ) ) ;
sky130_fd_sc_hd__buf_1 FTB_47__46 ( .A ( mem_out[1] ) , .X ( ccff_tail[0] ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size2_mem_33 ( pReset , prog_clk , ccff_head , 
    ccff_tail , mem_out ) ;
input  [0:0] pReset ;
input  [0:0] prog_clk ;
input  [0:0] ccff_head ;
output [0:0] ccff_tail ;
output [0:1] mem_out ;

sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_0_ ( .D ( ccff_head[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[0] ) ) ;
sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_1_ ( .D ( mem_out[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[1] ) ) ;
sky130_fd_sc_hd__buf_1 FTB_46__45 ( .A ( mem_out[1] ) , .X ( ccff_tail[0] ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size2_mem_32 ( pReset , prog_clk , ccff_head , 
    ccff_tail , mem_out ) ;
input  [0:0] pReset ;
input  [0:0] prog_clk ;
input  [0:0] ccff_head ;
output [0:0] ccff_tail ;
output [0:1] mem_out ;

sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_0_ ( .D ( ccff_head[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[0] ) ) ;
sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_1_ ( .D ( mem_out[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[1] ) ) ;
sky130_fd_sc_hd__buf_1 FTB_45__44 ( .A ( mem_out[1] ) , .X ( ccff_tail[0] ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size2_mem_31 ( pReset , prog_clk , ccff_head , 
    ccff_tail , mem_out ) ;
input  [0:0] pReset ;
input  [0:0] prog_clk ;
input  [0:0] ccff_head ;
output [0:0] ccff_tail ;
output [0:1] mem_out ;

sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_0_ ( .D ( ccff_head[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[0] ) ) ;
sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_1_ ( .D ( mem_out[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[1] ) ) ;
sky130_fd_sc_hd__buf_1 FTB_44__43 ( .A ( mem_out[1] ) , .X ( ccff_tail[0] ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size2_mem_30 ( pReset , prog_clk , ccff_head , 
    ccff_tail , mem_out ) ;
input  [0:0] pReset ;
input  [0:0] prog_clk ;
input  [0:0] ccff_head ;
output [0:0] ccff_tail ;
output [0:1] mem_out ;

sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_0_ ( .D ( ccff_head[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[0] ) ) ;
sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_1_ ( .D ( mem_out[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[1] ) ) ;
sky130_fd_sc_hd__buf_1 FTB_43__42 ( .A ( mem_out[1] ) , .X ( ccff_tail[0] ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size2_mem_29 ( pReset , prog_clk , ccff_head , 
    ccff_tail , mem_out ) ;
input  [0:0] pReset ;
input  [0:0] prog_clk ;
input  [0:0] ccff_head ;
output [0:0] ccff_tail ;
output [0:1] mem_out ;

sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_0_ ( .D ( ccff_head[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[0] ) ) ;
sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_1_ ( .D ( mem_out[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[1] ) ) ;
sky130_fd_sc_hd__buf_1 FTB_42__41 ( .A ( mem_out[1] ) , .X ( ccff_tail[0] ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size2_mem_28 ( pReset , prog_clk , ccff_head , 
    ccff_tail , mem_out ) ;
input  [0:0] pReset ;
input  [0:0] prog_clk ;
input  [0:0] ccff_head ;
output [0:0] ccff_tail ;
output [0:1] mem_out ;

sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_0_ ( .D ( ccff_head[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[0] ) ) ;
sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_1_ ( .D ( mem_out[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[1] ) ) ;
sky130_fd_sc_hd__buf_1 FTB_41__40 ( .A ( mem_out[1] ) , .X ( ccff_tail[0] ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size2_mem_27 ( pReset , prog_clk , ccff_head , 
    ccff_tail , mem_out ) ;
input  [0:0] pReset ;
input  [0:0] prog_clk ;
input  [0:0] ccff_head ;
output [0:0] ccff_tail ;
output [0:1] mem_out ;

sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_0_ ( .D ( ccff_head[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[0] ) ) ;
sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_1_ ( .D ( mem_out[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[1] ) ) ;
sky130_fd_sc_hd__buf_1 FTB_40__39 ( .A ( mem_out[1] ) , .X ( ccff_tail[0] ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size2_mem_26 ( pReset , prog_clk , ccff_head , 
    ccff_tail , mem_out ) ;
input  [0:0] pReset ;
input  [0:0] prog_clk ;
input  [0:0] ccff_head ;
output [0:0] ccff_tail ;
output [0:1] mem_out ;

sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_0_ ( .D ( ccff_head[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[0] ) ) ;
sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_1_ ( .D ( mem_out[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[1] ) ) ;
sky130_fd_sc_hd__buf_1 FTB_39__38 ( .A ( mem_out[1] ) , .X ( ccff_tail[0] ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size2_mem_25 ( pReset , prog_clk , ccff_head , 
    ccff_tail , mem_out ) ;
input  [0:0] pReset ;
input  [0:0] prog_clk ;
input  [0:0] ccff_head ;
output [0:0] ccff_tail ;
output [0:1] mem_out ;

sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_0_ ( .D ( ccff_head[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[0] ) ) ;
sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_1_ ( .D ( mem_out[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[1] ) ) ;
sky130_fd_sc_hd__buf_1 FTB_38__37 ( .A ( mem_out[1] ) , .X ( ccff_tail[0] ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size2_mem_24 ( pReset , prog_clk , ccff_head , 
    ccff_tail , mem_out ) ;
input  [0:0] pReset ;
input  [0:0] prog_clk ;
input  [0:0] ccff_head ;
output [0:0] ccff_tail ;
output [0:1] mem_out ;

sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_0_ ( .D ( ccff_head[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[0] ) ) ;
sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_1_ ( .D ( mem_out[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[1] ) ) ;
sky130_fd_sc_hd__buf_1 FTB_37__36 ( .A ( mem_out[1] ) , .X ( ccff_tail[0] ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size2_mem_23 ( pReset , prog_clk , ccff_head , 
    ccff_tail , mem_out ) ;
input  [0:0] pReset ;
input  [0:0] prog_clk ;
input  [0:0] ccff_head ;
output [0:0] ccff_tail ;
output [0:1] mem_out ;

sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_0_ ( .D ( ccff_head[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[0] ) ) ;
sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_1_ ( .D ( mem_out[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[1] ) ) ;
sky130_fd_sc_hd__buf_1 FTB_36__35 ( .A ( mem_out[1] ) , .X ( ccff_tail[0] ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size2_mem_22 ( pReset , prog_clk , ccff_head , 
    ccff_tail , mem_out ) ;
input  [0:0] pReset ;
input  [0:0] prog_clk ;
input  [0:0] ccff_head ;
output [0:0] ccff_tail ;
output [0:1] mem_out ;

sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_0_ ( .D ( ccff_head[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[0] ) ) ;
sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_1_ ( .D ( mem_out[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[1] ) ) ;
sky130_fd_sc_hd__buf_1 FTB_35__34 ( .A ( mem_out[1] ) , .X ( ccff_tail[0] ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size2_mem_21 ( pReset , prog_clk , ccff_head , 
    ccff_tail , mem_out ) ;
input  [0:0] pReset ;
input  [0:0] prog_clk ;
input  [0:0] ccff_head ;
output [0:0] ccff_tail ;
output [0:1] mem_out ;

sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_0_ ( .D ( ccff_head[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[0] ) ) ;
sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_1_ ( .D ( mem_out[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[1] ) ) ;
sky130_fd_sc_hd__buf_1 FTB_34__33 ( .A ( mem_out[1] ) , .X ( ccff_tail[0] ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size2_mem_20 ( pReset , prog_clk , ccff_head , 
    ccff_tail , mem_out ) ;
input  [0:0] pReset ;
input  [0:0] prog_clk ;
input  [0:0] ccff_head ;
output [0:0] ccff_tail ;
output [0:1] mem_out ;

sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_0_ ( .D ( ccff_head[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[0] ) ) ;
sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_1_ ( .D ( mem_out[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[1] ) ) ;
sky130_fd_sc_hd__buf_1 FTB_33__32 ( .A ( mem_out[1] ) , .X ( ccff_tail[0] ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size2_mem_19 ( pReset , prog_clk , ccff_head , 
    ccff_tail , mem_out ) ;
input  [0:0] pReset ;
input  [0:0] prog_clk ;
input  [0:0] ccff_head ;
output [0:0] ccff_tail ;
output [0:1] mem_out ;

sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_0_ ( .D ( ccff_head[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[0] ) ) ;
sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_1_ ( .D ( mem_out[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[1] ) ) ;
sky130_fd_sc_hd__buf_1 FTB_32__31 ( .A ( mem_out[1] ) , .X ( ccff_tail[0] ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size2_mem_18 ( pReset , prog_clk , ccff_head , 
    ccff_tail , mem_out ) ;
input  [0:0] pReset ;
input  [0:0] prog_clk ;
input  [0:0] ccff_head ;
output [0:0] ccff_tail ;
output [0:1] mem_out ;

sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_0_ ( .D ( ccff_head[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[0] ) ) ;
sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_1_ ( .D ( mem_out[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[1] ) ) ;
sky130_fd_sc_hd__buf_1 FTB_31__30 ( .A ( mem_out[1] ) , .X ( ccff_tail[0] ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size2_mem_17 ( pReset , prog_clk , ccff_head , 
    ccff_tail , mem_out ) ;
input  [0:0] pReset ;
input  [0:0] prog_clk ;
input  [0:0] ccff_head ;
output [0:0] ccff_tail ;
output [0:1] mem_out ;

sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_0_ ( .D ( ccff_head[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[0] ) ) ;
sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_1_ ( .D ( mem_out[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[1] ) ) ;
sky130_fd_sc_hd__buf_1 FTB_30__29 ( .A ( mem_out[1] ) , .X ( ccff_tail[0] ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size2_mem_16 ( pReset , prog_clk , ccff_head , 
    ccff_tail , mem_out ) ;
input  [0:0] pReset ;
input  [0:0] prog_clk ;
input  [0:0] ccff_head ;
output [0:0] ccff_tail ;
output [0:1] mem_out ;

sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_0_ ( .D ( ccff_head[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[0] ) ) ;
sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_1_ ( .D ( mem_out[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[1] ) ) ;
sky130_fd_sc_hd__buf_1 FTB_29__28 ( .A ( mem_out[1] ) , .X ( ccff_tail[0] ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size2_mem_15 ( pReset , prog_clk , ccff_head , 
    ccff_tail , mem_out ) ;
input  [0:0] pReset ;
input  [0:0] prog_clk ;
input  [0:0] ccff_head ;
output [0:0] ccff_tail ;
output [0:1] mem_out ;

sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_0_ ( .D ( ccff_head[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[0] ) ) ;
sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_1_ ( .D ( mem_out[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[1] ) ) ;
sky130_fd_sc_hd__buf_1 FTB_28__27 ( .A ( mem_out[1] ) , .X ( ccff_tail[0] ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size2_mem_14 ( pReset , prog_clk , ccff_head , 
    ccff_tail , mem_out ) ;
input  [0:0] pReset ;
input  [0:0] prog_clk ;
input  [0:0] ccff_head ;
output [0:0] ccff_tail ;
output [0:1] mem_out ;

sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_0_ ( .D ( ccff_head[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[0] ) ) ;
sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_1_ ( .D ( mem_out[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[1] ) ) ;
sky130_fd_sc_hd__buf_1 FTB_27__26 ( .A ( mem_out[1] ) , .X ( ccff_tail[0] ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size2_mem_13 ( pReset , prog_clk , ccff_head , 
    ccff_tail , mem_out ) ;
input  [0:0] pReset ;
input  [0:0] prog_clk ;
input  [0:0] ccff_head ;
output [0:0] ccff_tail ;
output [0:1] mem_out ;

sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_0_ ( .D ( ccff_head[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[0] ) ) ;
sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_1_ ( .D ( mem_out[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[1] ) ) ;
sky130_fd_sc_hd__buf_1 FTB_26__25 ( .A ( mem_out[1] ) , .X ( ccff_tail[0] ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size2_mem_12 ( pReset , prog_clk , ccff_head , 
    ccff_tail , mem_out ) ;
input  [0:0] pReset ;
input  [0:0] prog_clk ;
input  [0:0] ccff_head ;
output [0:0] ccff_tail ;
output [0:1] mem_out ;

sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_0_ ( .D ( ccff_head[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[0] ) ) ;
sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_1_ ( .D ( mem_out[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[1] ) ) ;
sky130_fd_sc_hd__buf_1 FTB_25__24 ( .A ( mem_out[1] ) , .X ( ccff_tail[0] ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size2_mem_11 ( pReset , prog_clk , ccff_head , 
    ccff_tail , mem_out ) ;
input  [0:0] pReset ;
input  [0:0] prog_clk ;
input  [0:0] ccff_head ;
output [0:0] ccff_tail ;
output [0:1] mem_out ;

sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_0_ ( .D ( ccff_head[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[0] ) ) ;
sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_1_ ( .D ( mem_out[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[1] ) ) ;
sky130_fd_sc_hd__buf_1 FTB_24__23 ( .A ( mem_out[1] ) , .X ( ccff_tail[0] ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size2_mem_10 ( pReset , prog_clk , ccff_head , 
    ccff_tail , mem_out ) ;
input  [0:0] pReset ;
input  [0:0] prog_clk ;
input  [0:0] ccff_head ;
output [0:0] ccff_tail ;
output [0:1] mem_out ;

sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_0_ ( .D ( ccff_head[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[0] ) ) ;
sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_1_ ( .D ( mem_out[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[1] ) ) ;
sky130_fd_sc_hd__buf_1 FTB_23__22 ( .A ( mem_out[1] ) , .X ( ccff_tail[0] ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size2_mem_9 ( pReset , prog_clk , ccff_head , 
    ccff_tail , mem_out ) ;
input  [0:0] pReset ;
input  [0:0] prog_clk ;
input  [0:0] ccff_head ;
output [0:0] ccff_tail ;
output [0:1] mem_out ;

sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_0_ ( .D ( ccff_head[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[0] ) ) ;
sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_1_ ( .D ( mem_out[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[1] ) ) ;
sky130_fd_sc_hd__buf_1 FTB_22__21 ( .A ( mem_out[1] ) , .X ( ccff_tail[0] ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size2_mem_8 ( pReset , prog_clk , ccff_head , 
    ccff_tail , mem_out ) ;
input  [0:0] pReset ;
input  [0:0] prog_clk ;
input  [0:0] ccff_head ;
output [0:0] ccff_tail ;
output [0:1] mem_out ;

sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_0_ ( .D ( ccff_head[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[0] ) ) ;
sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_1_ ( .D ( mem_out[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[1] ) ) ;
sky130_fd_sc_hd__buf_1 FTB_21__20 ( .A ( mem_out[1] ) , .X ( ccff_tail[0] ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size2_mem_7 ( pReset , prog_clk , ccff_head , 
    ccff_tail , mem_out ) ;
input  [0:0] pReset ;
input  [0:0] prog_clk ;
input  [0:0] ccff_head ;
output [0:0] ccff_tail ;
output [0:1] mem_out ;

sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_0_ ( .D ( ccff_head[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[0] ) ) ;
sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_1_ ( .D ( mem_out[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[1] ) ) ;
sky130_fd_sc_hd__buf_1 FTB_20__19 ( .A ( mem_out[1] ) , .X ( ccff_tail[0] ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size2_mem_6 ( pReset , prog_clk , ccff_head , 
    ccff_tail , mem_out ) ;
input  [0:0] pReset ;
input  [0:0] prog_clk ;
input  [0:0] ccff_head ;
output [0:0] ccff_tail ;
output [0:1] mem_out ;

sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_0_ ( .D ( ccff_head[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[0] ) ) ;
sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_1_ ( .D ( mem_out[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[1] ) ) ;
sky130_fd_sc_hd__buf_1 FTB_19__18 ( .A ( mem_out[1] ) , .X ( ccff_tail[0] ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size2_mem_5 ( pReset , prog_clk , ccff_head , 
    ccff_tail , mem_out ) ;
input  [0:0] pReset ;
input  [0:0] prog_clk ;
input  [0:0] ccff_head ;
output [0:0] ccff_tail ;
output [0:1] mem_out ;

sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_0_ ( .D ( ccff_head[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[0] ) ) ;
sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_1_ ( .D ( mem_out[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[1] ) ) ;
sky130_fd_sc_hd__buf_1 FTB_18__17 ( .A ( mem_out[1] ) , .X ( ccff_tail[0] ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size2_mem_4 ( pReset , prog_clk , ccff_head , 
    ccff_tail , mem_out ) ;
input  [0:0] pReset ;
input  [0:0] prog_clk ;
input  [0:0] ccff_head ;
output [0:0] ccff_tail ;
output [0:1] mem_out ;

sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_0_ ( .D ( ccff_head[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[0] ) ) ;
sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_1_ ( .D ( mem_out[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[1] ) ) ;
sky130_fd_sc_hd__buf_1 FTB_17__16 ( .A ( mem_out[1] ) , .X ( ccff_tail[0] ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size2_mem_3 ( pReset , prog_clk , ccff_head , 
    ccff_tail , mem_out ) ;
input  [0:0] pReset ;
input  [0:0] prog_clk ;
input  [0:0] ccff_head ;
output [0:0] ccff_tail ;
output [0:1] mem_out ;

sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_0_ ( .D ( ccff_head[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[0] ) ) ;
sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_1_ ( .D ( mem_out[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[1] ) ) ;
sky130_fd_sc_hd__buf_1 FTB_16__15 ( .A ( mem_out[1] ) , .X ( ccff_tail[0] ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size2_mem_2 ( pReset , prog_clk , ccff_head , 
    ccff_tail , mem_out ) ;
input  [0:0] pReset ;
input  [0:0] prog_clk ;
input  [0:0] ccff_head ;
output [0:0] ccff_tail ;
output [0:1] mem_out ;

sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_0_ ( .D ( ccff_head[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[0] ) ) ;
sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_1_ ( .D ( mem_out[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[1] ) ) ;
sky130_fd_sc_hd__buf_1 FTB_15__14 ( .A ( mem_out[1] ) , .X ( ccff_tail[0] ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size2_mem_1 ( pReset , prog_clk , ccff_head , 
    ccff_tail , mem_out ) ;
input  [0:0] pReset ;
input  [0:0] prog_clk ;
input  [0:0] ccff_head ;
output [0:0] ccff_tail ;
output [0:1] mem_out ;

sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_0_ ( .D ( ccff_head[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[0] ) ) ;
sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_1_ ( .D ( mem_out[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[1] ) ) ;
sky130_fd_sc_hd__buf_1 FTB_14__13 ( .A ( mem_out[1] ) , .X ( ccff_tail[0] ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size2_mem_0 ( pReset , prog_clk , ccff_head , 
    ccff_tail , mem_out ) ;
input  [0:0] pReset ;
input  [0:0] prog_clk ;
input  [0:0] ccff_head ;
output [0:0] ccff_tail ;
output [0:1] mem_out ;

sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_0_ ( .D ( ccff_head[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[0] ) ) ;
sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_1_ ( .D ( mem_out[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[1] ) ) ;
sky130_fd_sc_hd__buf_1 FTB_13__12 ( .A ( mem_out[1] ) , .X ( ccff_tail[0] ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size2 ( in , sram , sram_inv , out , p0 ) ;
input  [0:1] in ;
input  [0:1] sram ;
input  [0:1] sram_inv ;
output [0:0] out ;
input  p0 ;

wire [0:0] sky130_fd_sc_hd__mux2_1_0_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_1_X ;

sky130_fd_sc_hd__mux2_1 mux_l1_in_0_ ( .A0 ( in[1] ) , .A1 ( in[0] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_0_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_0_ ( .A0 ( p0 ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_0_X[0] ) , .S ( sram[1] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_1_X[0] ) ) ;
sky130_fd_sc_hd__inv_2 BINV_R_134 ( .A ( sky130_fd_sc_hd__mux2_1_1_X[0] ) , 
    .Y ( BUF_net_134 ) ) ;
sky130_fd_sc_hd__inv_6 BINV_R_149 ( .A ( BUF_net_134 ) , .Y ( out[0] ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size2_35 ( in , sram , sram_inv , out , p0 ) ;
input  [0:1] in ;
input  [0:1] sram ;
input  [0:1] sram_inv ;
output [0:0] out ;
input  p0 ;

wire [0:0] sky130_fd_sc_hd__mux2_1_0_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_1_X ;

sky130_fd_sc_hd__buf_6 sky130_fd_sc_hd__buf_4_0_ ( 
    .A ( sky130_fd_sc_hd__mux2_1_1_X[0] ) , .X ( out[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l1_in_0_ ( .A0 ( in[1] ) , .A1 ( in[0] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_0_X[0] ) ) ;
sky130_fd_sc_hd__mux2_2 mux_l2_in_0_ ( .A0 ( p0 ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_0_X[0] ) , .S ( sram[1] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_1_X[0] ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size2_34 ( in , sram , sram_inv , out , p0 ) ;
input  [0:1] in ;
input  [0:1] sram ;
input  [0:1] sram_inv ;
output [0:0] out ;
input  p0 ;

wire [0:0] sky130_fd_sc_hd__mux2_1_0_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_1_X ;

sky130_fd_sc_hd__mux2_1 mux_l1_in_0_ ( .A0 ( in[1] ) , .A1 ( in[0] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_0_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_0_ ( .A0 ( p0 ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_0_X[0] ) , .S ( sram[1] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_1_X[0] ) ) ;
sky130_fd_sc_hd__inv_8 BINV_R_131 ( .A ( BUF_net_132 ) , .Y ( out[0] ) ) ;
sky130_fd_sc_hd__inv_1 BINV_R_132 ( .A ( sky130_fd_sc_hd__mux2_1_1_X[0] ) , 
    .Y ( BUF_net_132 ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size2_33 ( in , sram , sram_inv , out , p0 ) ;
input  [0:1] in ;
input  [0:1] sram ;
input  [0:1] sram_inv ;
output [0:0] out ;
input  p0 ;

wire [0:0] sky130_fd_sc_hd__mux2_1_0_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_1_X ;

sky130_fd_sc_hd__mux2_1 mux_l1_in_0_ ( .A0 ( in[1] ) , .A1 ( in[0] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_0_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_0_ ( .A0 ( p0 ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_0_X[0] ) , .S ( sram[1] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_1_X[0] ) ) ;
sky130_fd_sc_hd__inv_8 BINV_R_129 ( .A ( BUF_net_130 ) , .Y ( out[0] ) ) ;
sky130_fd_sc_hd__inv_1 BINV_R_130 ( .A ( sky130_fd_sc_hd__mux2_1_1_X[0] ) , 
    .Y ( BUF_net_130 ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size2_32 ( in , sram , sram_inv , out , p0 ) ;
input  [0:1] in ;
input  [0:1] sram ;
input  [0:1] sram_inv ;
output [0:0] out ;
input  p0 ;

wire [0:0] sky130_fd_sc_hd__mux2_1_0_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_1_X ;

sky130_fd_sc_hd__mux2_1 mux_l1_in_0_ ( .A0 ( in[1] ) , .A1 ( in[0] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_0_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_0_ ( .A0 ( p0 ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_0_X[0] ) , .S ( sram[1] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_1_X[0] ) ) ;
sky130_fd_sc_hd__inv_8 BINV_R_127 ( .A ( BUF_net_128 ) , .Y ( out[0] ) ) ;
sky130_fd_sc_hd__inv_1 BINV_R_128 ( .A ( sky130_fd_sc_hd__mux2_1_1_X[0] ) , 
    .Y ( BUF_net_128 ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size2_31 ( in , sram , sram_inv , out , p0 ) ;
input  [0:1] in ;
input  [0:1] sram ;
input  [0:1] sram_inv ;
output [0:0] out ;
input  p0 ;

wire [0:0] sky130_fd_sc_hd__mux2_1_0_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_1_X ;

sky130_fd_sc_hd__mux2_1 mux_l1_in_0_ ( .A0 ( in[1] ) , .A1 ( in[0] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_0_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_0_ ( .A0 ( p0 ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_0_X[0] ) , .S ( sram[1] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_1_X[0] ) ) ;
sky130_fd_sc_hd__inv_8 BINV_R_125 ( .A ( BUF_net_126 ) , .Y ( out[0] ) ) ;
sky130_fd_sc_hd__inv_1 BINV_R_126 ( .A ( sky130_fd_sc_hd__mux2_1_1_X[0] ) , 
    .Y ( BUF_net_126 ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size2_30 ( in , sram , sram_inv , out , p0 ) ;
input  [0:1] in ;
input  [0:1] sram ;
input  [0:1] sram_inv ;
output [0:0] out ;
input  p0 ;

wire [0:0] sky130_fd_sc_hd__mux2_1_0_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_1_X ;

sky130_fd_sc_hd__mux2_1 mux_l1_in_0_ ( .A0 ( in[1] ) , .A1 ( in[0] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_0_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_0_ ( .A0 ( p0 ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_0_X[0] ) , .S ( sram[1] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_1_X[0] ) ) ;
sky130_fd_sc_hd__inv_8 BINV_R_123 ( .A ( BUF_net_124 ) , .Y ( out[0] ) ) ;
sky130_fd_sc_hd__inv_1 BINV_R_124 ( .A ( sky130_fd_sc_hd__mux2_1_1_X[0] ) , 
    .Y ( BUF_net_124 ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size2_29 ( in , sram , sram_inv , out , p0 ) ;
input  [0:1] in ;
input  [0:1] sram ;
input  [0:1] sram_inv ;
output [0:0] out ;
input  p0 ;

wire [0:0] sky130_fd_sc_hd__mux2_1_0_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_1_X ;

sky130_fd_sc_hd__mux2_1 mux_l1_in_0_ ( .A0 ( in[1] ) , .A1 ( in[0] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_0_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_0_ ( .A0 ( p0 ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_0_X[0] ) , .S ( sram[1] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_1_X[0] ) ) ;
sky130_fd_sc_hd__inv_8 BINV_R_121 ( .A ( BUF_net_122 ) , .Y ( out[0] ) ) ;
sky130_fd_sc_hd__inv_1 BINV_R_122 ( .A ( sky130_fd_sc_hd__mux2_1_1_X[0] ) , 
    .Y ( BUF_net_122 ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size2_28 ( in , sram , sram_inv , out , p0 ) ;
input  [0:1] in ;
input  [0:1] sram ;
input  [0:1] sram_inv ;
output [0:0] out ;
input  p0 ;

wire [0:0] sky130_fd_sc_hd__mux2_1_0_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_1_X ;

sky130_fd_sc_hd__mux2_1 mux_l1_in_0_ ( .A0 ( in[1] ) , .A1 ( in[0] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_0_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_0_ ( .A0 ( p0 ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_0_X[0] ) , .S ( sram[1] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_1_X[0] ) ) ;
sky130_fd_sc_hd__inv_8 BINV_R_119 ( .A ( BUF_net_120 ) , .Y ( out[0] ) ) ;
sky130_fd_sc_hd__inv_1 BINV_R_120 ( .A ( sky130_fd_sc_hd__mux2_1_1_X[0] ) , 
    .Y ( BUF_net_120 ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size2_27 ( in , sram , sram_inv , out , p0 ) ;
input  [0:1] in ;
input  [0:1] sram ;
input  [0:1] sram_inv ;
output [0:0] out ;
input  p0 ;

wire [0:0] sky130_fd_sc_hd__mux2_1_0_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_1_X ;

sky130_fd_sc_hd__buf_6 sky130_fd_sc_hd__buf_4_0_ ( 
    .A ( sky130_fd_sc_hd__mux2_1_1_X[0] ) , .X ( out[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l1_in_0_ ( .A0 ( in[1] ) , .A1 ( in[0] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_0_X[0] ) ) ;
sky130_fd_sc_hd__mux2_2 mux_l2_in_0_ ( .A0 ( p0 ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_0_X[0] ) , .S ( sram[1] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_1_X[0] ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size2_26 ( in , sram , sram_inv , out , p0 ) ;
input  [0:1] in ;
input  [0:1] sram ;
input  [0:1] sram_inv ;
output [0:0] out ;
input  p0 ;

wire [0:0] sky130_fd_sc_hd__mux2_1_0_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_1_X ;

sky130_fd_sc_hd__mux2_1 mux_l1_in_0_ ( .A0 ( in[1] ) , .A1 ( in[0] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_0_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_0_ ( .A0 ( p0 ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_0_X[0] ) , .S ( sram[1] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_1_X[0] ) ) ;
sky130_fd_sc_hd__inv_8 BINV_R_117 ( .A ( BUF_net_118 ) , .Y ( out[0] ) ) ;
sky130_fd_sc_hd__inv_1 BINV_R_118 ( .A ( sky130_fd_sc_hd__mux2_1_1_X[0] ) , 
    .Y ( BUF_net_118 ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size2_25 ( in , sram , sram_inv , out , p0 ) ;
input  [0:1] in ;
input  [0:1] sram ;
input  [0:1] sram_inv ;
output [0:0] out ;
input  p0 ;

wire [0:0] sky130_fd_sc_hd__mux2_1_0_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_1_X ;

sky130_fd_sc_hd__mux2_1 mux_l1_in_0_ ( .A0 ( in[1] ) , .A1 ( in[0] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_0_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_0_ ( .A0 ( p0 ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_0_X[0] ) , .S ( sram[1] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_1_X[0] ) ) ;
sky130_fd_sc_hd__inv_8 BINV_R_115 ( .A ( BUF_net_116 ) , .Y ( out[0] ) ) ;
sky130_fd_sc_hd__inv_1 BINV_R_116 ( .A ( sky130_fd_sc_hd__mux2_1_1_X[0] ) , 
    .Y ( BUF_net_116 ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size2_24 ( in , sram , sram_inv , out , p0 ) ;
input  [0:1] in ;
input  [0:1] sram ;
input  [0:1] sram_inv ;
output [0:0] out ;
input  p0 ;

wire [0:0] sky130_fd_sc_hd__mux2_1_0_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_1_X ;

sky130_fd_sc_hd__mux2_1 mux_l1_in_0_ ( .A0 ( in[1] ) , .A1 ( in[0] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_0_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_0_ ( .A0 ( p0 ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_0_X[0] ) , .S ( sram[1] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_1_X[0] ) ) ;
sky130_fd_sc_hd__inv_8 BINV_R_113 ( .A ( BUF_net_114 ) , .Y ( out[0] ) ) ;
sky130_fd_sc_hd__inv_1 BINV_R_114 ( .A ( sky130_fd_sc_hd__mux2_1_1_X[0] ) , 
    .Y ( BUF_net_114 ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size2_23 ( in , sram , sram_inv , out , p0 ) ;
input  [0:1] in ;
input  [0:1] sram ;
input  [0:1] sram_inv ;
output [0:0] out ;
input  p0 ;

wire [0:0] sky130_fd_sc_hd__mux2_1_0_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_1_X ;

sky130_fd_sc_hd__mux2_1 mux_l1_in_0_ ( .A0 ( in[1] ) , .A1 ( in[0] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_0_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_0_ ( .A0 ( p0 ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_0_X[0] ) , .S ( sram[1] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_1_X[0] ) ) ;
sky130_fd_sc_hd__inv_6 BINV_R_147 ( .A ( BUF_net_148 ) , .Y ( out[0] ) ) ;
sky130_fd_sc_hd__inv_2 BINV_R_148 ( .A ( sky130_fd_sc_hd__mux2_1_1_X[0] ) , 
    .Y ( BUF_net_148 ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size2_22 ( in , sram , sram_inv , out , p0 ) ;
input  [0:1] in ;
input  [0:1] sram ;
input  [0:1] sram_inv ;
output [0:0] out ;
input  p0 ;

wire [0:0] sky130_fd_sc_hd__mux2_1_0_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_1_X ;

sky130_fd_sc_hd__buf_6 sky130_fd_sc_hd__buf_4_0_ ( 
    .A ( sky130_fd_sc_hd__mux2_1_1_X[0] ) , .X ( out[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l1_in_0_ ( .A0 ( in[1] ) , .A1 ( in[0] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_0_X[0] ) ) ;
sky130_fd_sc_hd__mux2_2 mux_l2_in_0_ ( .A0 ( p0 ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_0_X[0] ) , .S ( sram[1] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_1_X[0] ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size2_21 ( in , sram , sram_inv , out , p0 ) ;
input  [0:1] in ;
input  [0:1] sram ;
input  [0:1] sram_inv ;
output [0:0] out ;
input  p0 ;

wire [0:0] sky130_fd_sc_hd__mux2_1_0_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_1_X ;

sky130_fd_sc_hd__mux2_1 mux_l1_in_0_ ( .A0 ( in[1] ) , .A1 ( in[0] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_0_X[0] ) ) ;
sky130_fd_sc_hd__mux2_2 mux_l2_in_0_ ( .A0 ( p0 ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_0_X[0] ) , .S ( sram[1] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_1_X[0] ) ) ;
sky130_fd_sc_hd__buf_6 BUFT_RR_110 ( .A ( sky130_fd_sc_hd__mux2_1_1_X[0] ) , 
    .X ( out[0] ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size2_20 ( in , sram , sram_inv , out , p0 ) ;
input  [0:1] in ;
input  [0:1] sram ;
input  [0:1] sram_inv ;
output [0:0] out ;
input  p0 ;

wire [0:0] sky130_fd_sc_hd__mux2_1_0_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_1_X ;

sky130_fd_sc_hd__buf_6 sky130_fd_sc_hd__buf_4_0_ ( 
    .A ( sky130_fd_sc_hd__mux2_1_1_X[0] ) , .X ( out[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l1_in_0_ ( .A0 ( in[1] ) , .A1 ( in[0] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_0_X[0] ) ) ;
sky130_fd_sc_hd__mux2_2 mux_l2_in_0_ ( .A0 ( p0 ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_0_X[0] ) , .S ( sram[1] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_1_X[0] ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size2_19 ( in , sram , sram_inv , out , p0 ) ;
input  [0:1] in ;
input  [0:1] sram ;
input  [0:1] sram_inv ;
output [0:0] out ;
input  p0 ;

wire [0:0] sky130_fd_sc_hd__mux2_1_0_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_1_X ;

sky130_fd_sc_hd__mux2_1 mux_l1_in_0_ ( .A0 ( in[1] ) , .A1 ( in[0] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_0_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_0_ ( .A0 ( p0 ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_0_X[0] ) , .S ( sram[1] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_1_X[0] ) ) ;
sky130_fd_sc_hd__inv_8 BINV_R_108 ( .A ( BUF_net_109 ) , .Y ( out[0] ) ) ;
sky130_fd_sc_hd__inv_1 BINV_R_109 ( .A ( sky130_fd_sc_hd__mux2_1_1_X[0] ) , 
    .Y ( BUF_net_109 ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size2_18 ( in , sram , sram_inv , out , p0 ) ;
input  [0:1] in ;
input  [0:1] sram ;
input  [0:1] sram_inv ;
output [0:0] out ;
input  p0 ;

wire [0:0] sky130_fd_sc_hd__mux2_1_0_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_1_X ;

sky130_fd_sc_hd__mux2_1 mux_l1_in_0_ ( .A0 ( in[1] ) , .A1 ( in[0] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_0_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_0_ ( .A0 ( p0 ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_0_X[0] ) , .S ( sram[1] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_1_X[0] ) ) ;
sky130_fd_sc_hd__inv_8 BINV_R_106 ( .A ( BUF_net_107 ) , .Y ( out[0] ) ) ;
sky130_fd_sc_hd__inv_1 BINV_R_107 ( .A ( sky130_fd_sc_hd__mux2_1_1_X[0] ) , 
    .Y ( BUF_net_107 ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size2_17 ( in , sram , sram_inv , out , p0 ) ;
input  [0:1] in ;
input  [0:1] sram ;
input  [0:1] sram_inv ;
output [0:0] out ;
input  p0 ;

wire [0:0] sky130_fd_sc_hd__mux2_1_0_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_1_X ;

sky130_fd_sc_hd__mux2_1 mux_l1_in_0_ ( .A0 ( in[1] ) , .A1 ( in[0] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_0_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_0_ ( .A0 ( p0 ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_0_X[0] ) , .S ( sram[1] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_1_X[0] ) ) ;
sky130_fd_sc_hd__inv_8 BINV_R_104 ( .A ( BUF_net_105 ) , .Y ( out[0] ) ) ;
sky130_fd_sc_hd__inv_1 BINV_R_105 ( .A ( sky130_fd_sc_hd__mux2_1_1_X[0] ) , 
    .Y ( BUF_net_105 ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size2_16 ( in , sram , sram_inv , out , p0 ) ;
input  [0:1] in ;
input  [0:1] sram ;
input  [0:1] sram_inv ;
output [0:0] out ;
input  p0 ;

wire [0:0] sky130_fd_sc_hd__mux2_1_0_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_1_X ;

sky130_fd_sc_hd__buf_6 sky130_fd_sc_hd__buf_4_0_ ( 
    .A ( sky130_fd_sc_hd__mux2_1_1_X[0] ) , .X ( out[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l1_in_0_ ( .A0 ( in[1] ) , .A1 ( in[0] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_0_X[0] ) ) ;
sky130_fd_sc_hd__mux2_2 mux_l2_in_0_ ( .A0 ( p0 ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_0_X[0] ) , .S ( sram[1] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_1_X[0] ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size2_15 ( in , sram , sram_inv , out , p0 ) ;
input  [0:1] in ;
input  [0:1] sram ;
input  [0:1] sram_inv ;
output [0:0] out ;
input  p0 ;

wire [0:0] sky130_fd_sc_hd__mux2_1_0_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_1_X ;

sky130_fd_sc_hd__mux2_1 mux_l1_in_0_ ( .A0 ( in[1] ) , .A1 ( in[0] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_0_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_0_ ( .A0 ( p0 ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_0_X[0] ) , .S ( sram[1] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_1_X[0] ) ) ;
sky130_fd_sc_hd__inv_8 BINV_R_102 ( .A ( BUF_net_103 ) , .Y ( out[0] ) ) ;
sky130_fd_sc_hd__inv_1 BINV_R_103 ( .A ( sky130_fd_sc_hd__mux2_1_1_X[0] ) , 
    .Y ( BUF_net_103 ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size2_14 ( in , sram , sram_inv , out , p0 ) ;
input  [0:1] in ;
input  [0:1] sram ;
input  [0:1] sram_inv ;
output [0:0] out ;
input  p0 ;

wire [0:0] sky130_fd_sc_hd__mux2_1_0_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_1_X ;

sky130_fd_sc_hd__mux2_1 mux_l1_in_0_ ( .A0 ( in[1] ) , .A1 ( in[0] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_0_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_0_ ( .A0 ( p0 ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_0_X[0] ) , .S ( sram[1] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_1_X[0] ) ) ;
sky130_fd_sc_hd__inv_8 BINV_R_100 ( .A ( BUF_net_101 ) , .Y ( out[0] ) ) ;
sky130_fd_sc_hd__inv_1 BINV_R_101 ( .A ( sky130_fd_sc_hd__mux2_1_1_X[0] ) , 
    .Y ( BUF_net_101 ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size2_13 ( in , sram , sram_inv , out , p0 ) ;
input  [0:1] in ;
input  [0:1] sram ;
input  [0:1] sram_inv ;
output [0:0] out ;
input  p0 ;

wire [0:0] sky130_fd_sc_hd__mux2_1_0_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_1_X ;

sky130_fd_sc_hd__mux2_1 mux_l1_in_0_ ( .A0 ( in[1] ) , .A1 ( in[0] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_0_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_0_ ( .A0 ( p0 ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_0_X[0] ) , .S ( sram[1] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_1_X[0] ) ) ;
sky130_fd_sc_hd__inv_8 BINV_R_98 ( .A ( BUF_net_99 ) , .Y ( out[0] ) ) ;
sky130_fd_sc_hd__inv_1 BINV_R_99 ( .A ( sky130_fd_sc_hd__mux2_1_1_X[0] ) , 
    .Y ( BUF_net_99 ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size2_12 ( in , sram , sram_inv , out , p0 ) ;
input  [0:1] in ;
input  [0:1] sram ;
input  [0:1] sram_inv ;
output [0:0] out ;
input  p0 ;

wire [0:0] sky130_fd_sc_hd__mux2_1_0_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_1_X ;

sky130_fd_sc_hd__mux2_1 mux_l1_in_0_ ( .A0 ( in[1] ) , .A1 ( in[0] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_0_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_0_ ( .A0 ( p0 ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_0_X[0] ) , .S ( sram[1] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_1_X[0] ) ) ;
sky130_fd_sc_hd__inv_8 BINV_R_96 ( .A ( BUF_net_97 ) , .Y ( out[0] ) ) ;
sky130_fd_sc_hd__inv_1 BINV_R_97 ( .A ( sky130_fd_sc_hd__mux2_1_1_X[0] ) , 
    .Y ( BUF_net_97 ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size2_11 ( in , sram , sram_inv , out , p0 ) ;
input  [0:1] in ;
input  [0:1] sram ;
input  [0:1] sram_inv ;
output [0:0] out ;
input  p0 ;

wire [0:0] sky130_fd_sc_hd__mux2_1_0_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_1_X ;

sky130_fd_sc_hd__mux2_1 mux_l1_in_0_ ( .A0 ( in[1] ) , .A1 ( in[0] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_0_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_0_ ( .A0 ( p0 ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_0_X[0] ) , .S ( sram[1] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_1_X[0] ) ) ;
sky130_fd_sc_hd__inv_8 BINV_R_94 ( .A ( BUF_net_95 ) , .Y ( out[0] ) ) ;
sky130_fd_sc_hd__inv_1 BINV_R_95 ( .A ( sky130_fd_sc_hd__mux2_1_1_X[0] ) , 
    .Y ( BUF_net_95 ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size2_10 ( in , sram , sram_inv , out , p0 ) ;
input  [0:1] in ;
input  [0:1] sram ;
input  [0:1] sram_inv ;
output [0:0] out ;
input  p0 ;

wire [0:0] sky130_fd_sc_hd__mux2_1_0_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_1_X ;

sky130_fd_sc_hd__buf_6 sky130_fd_sc_hd__buf_4_0_ ( 
    .A ( sky130_fd_sc_hd__mux2_1_1_X[0] ) , .X ( out[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l1_in_0_ ( .A0 ( in[1] ) , .A1 ( in[0] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_0_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_0_ ( .A0 ( p0 ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_0_X[0] ) , .S ( sram[1] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_1_X[0] ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size2_9 ( in , sram , sram_inv , out , p0 ) ;
input  [0:1] in ;
input  [0:1] sram ;
input  [0:1] sram_inv ;
output [0:0] out ;
input  p0 ;

wire [0:0] sky130_fd_sc_hd__mux2_1_0_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_1_X ;

sky130_fd_sc_hd__mux2_1 mux_l1_in_0_ ( .A0 ( in[1] ) , .A1 ( in[0] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_0_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_0_ ( .A0 ( p0 ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_0_X[0] ) , .S ( sram[1] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_1_X[0] ) ) ;
sky130_fd_sc_hd__buf_6 BUFT_RR_93 ( .A ( sky130_fd_sc_hd__mux2_1_1_X[0] ) , 
    .X ( out[0] ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size2_8 ( in , sram , sram_inv , out , p0 ) ;
input  [0:1] in ;
input  [0:1] sram ;
input  [0:1] sram_inv ;
output [0:0] out ;
input  p0 ;

wire [0:0] sky130_fd_sc_hd__mux2_1_0_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_1_X ;

sky130_fd_sc_hd__mux2_1 mux_l1_in_0_ ( .A0 ( in[1] ) , .A1 ( in[0] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_0_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_0_ ( .A0 ( p0 ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_0_X[0] ) , .S ( sram[1] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_1_X[0] ) ) ;
sky130_fd_sc_hd__buf_6 BUFT_RR_92 ( .A ( sky130_fd_sc_hd__mux2_1_1_X[0] ) , 
    .X ( out[0] ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size2_7 ( in , sram , sram_inv , out , p0 ) ;
input  [0:1] in ;
input  [0:1] sram ;
input  [0:1] sram_inv ;
output [0:0] out ;
input  p0 ;

wire [0:0] sky130_fd_sc_hd__mux2_1_0_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_1_X ;

sky130_fd_sc_hd__mux2_1 mux_l1_in_0_ ( .A0 ( in[1] ) , .A1 ( in[0] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_0_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_0_ ( .A0 ( p0 ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_0_X[0] ) , .S ( sram[1] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_1_X[0] ) ) ;
sky130_fd_sc_hd__inv_8 BINV_R_90 ( .A ( BUF_net_91 ) , .Y ( out[0] ) ) ;
sky130_fd_sc_hd__inv_1 BINV_R_91 ( .A ( sky130_fd_sc_hd__mux2_1_1_X[0] ) , 
    .Y ( BUF_net_91 ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size2_6 ( in , sram , sram_inv , out , p0 ) ;
input  [0:1] in ;
input  [0:1] sram ;
input  [0:1] sram_inv ;
output [0:0] out ;
input  p0 ;

wire [0:0] sky130_fd_sc_hd__mux2_1_0_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_1_X ;

sky130_fd_sc_hd__mux2_1 mux_l1_in_0_ ( .A0 ( in[1] ) , .A1 ( in[0] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_0_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_0_ ( .A0 ( p0 ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_0_X[0] ) , .S ( sram[1] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_1_X[0] ) ) ;
sky130_fd_sc_hd__inv_8 BINV_R_88 ( .A ( BUF_net_89 ) , .Y ( out[0] ) ) ;
sky130_fd_sc_hd__inv_1 BINV_R_89 ( .A ( sky130_fd_sc_hd__mux2_1_1_X[0] ) , 
    .Y ( BUF_net_89 ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size2_5 ( in , sram , sram_inv , out , p0 ) ;
input  [0:1] in ;
input  [0:1] sram ;
input  [0:1] sram_inv ;
output [0:0] out ;
input  p0 ;

wire [0:0] sky130_fd_sc_hd__mux2_1_0_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_1_X ;

sky130_fd_sc_hd__mux2_1 mux_l1_in_0_ ( .A0 ( in[1] ) , .A1 ( in[0] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_0_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_0_ ( .A0 ( p0 ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_0_X[0] ) , .S ( sram[1] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_1_X[0] ) ) ;
sky130_fd_sc_hd__inv_8 BINV_R_86 ( .A ( BUF_net_87 ) , .Y ( out[0] ) ) ;
sky130_fd_sc_hd__inv_1 BINV_R_87 ( .A ( sky130_fd_sc_hd__mux2_1_1_X[0] ) , 
    .Y ( BUF_net_87 ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size2_4 ( in , sram , sram_inv , out , p0 ) ;
input  [0:1] in ;
input  [0:1] sram ;
input  [0:1] sram_inv ;
output [0:0] out ;
input  p0 ;

wire [0:0] sky130_fd_sc_hd__mux2_1_0_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_1_X ;

sky130_fd_sc_hd__mux2_1 mux_l1_in_0_ ( .A0 ( in[1] ) , .A1 ( in[0] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_0_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_0_ ( .A0 ( p0 ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_0_X[0] ) , .S ( sram[1] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_1_X[0] ) ) ;
sky130_fd_sc_hd__inv_8 BINV_R_84 ( .A ( BUF_net_85 ) , .Y ( out[0] ) ) ;
sky130_fd_sc_hd__inv_1 BINV_R_85 ( .A ( sky130_fd_sc_hd__mux2_1_1_X[0] ) , 
    .Y ( BUF_net_85 ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size2_3 ( in , sram , sram_inv , out , p0 ) ;
input  [0:1] in ;
input  [0:1] sram ;
input  [0:1] sram_inv ;
output [0:0] out ;
input  p0 ;

wire [0:0] sky130_fd_sc_hd__mux2_1_0_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_1_X ;

sky130_fd_sc_hd__mux2_1 mux_l1_in_0_ ( .A0 ( in[1] ) , .A1 ( in[0] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_0_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_0_ ( .A0 ( p0 ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_0_X[0] ) , .S ( sram[1] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_1_X[0] ) ) ;
sky130_fd_sc_hd__inv_8 BINV_R_82 ( .A ( BUF_net_83 ) , .Y ( out[0] ) ) ;
sky130_fd_sc_hd__inv_1 BINV_R_83 ( .A ( sky130_fd_sc_hd__mux2_1_1_X[0] ) , 
    .Y ( BUF_net_83 ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size2_2 ( in , sram , sram_inv , out , p0 ) ;
input  [0:1] in ;
input  [0:1] sram ;
input  [0:1] sram_inv ;
output [0:0] out ;
input  p0 ;

wire [0:0] sky130_fd_sc_hd__mux2_1_0_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_1_X ;

sky130_fd_sc_hd__mux2_1 mux_l1_in_0_ ( .A0 ( in[1] ) , .A1 ( in[0] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_0_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_0_ ( .A0 ( p0 ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_0_X[0] ) , .S ( sram[1] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_1_X[0] ) ) ;
sky130_fd_sc_hd__inv_8 BINV_R_80 ( .A ( BUF_net_81 ) , .Y ( out[0] ) ) ;
sky130_fd_sc_hd__inv_1 BINV_R_81 ( .A ( sky130_fd_sc_hd__mux2_1_1_X[0] ) , 
    .Y ( BUF_net_81 ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size2_1 ( in , sram , sram_inv , out , p0 ) ;
input  [0:1] in ;
input  [0:1] sram ;
input  [0:1] sram_inv ;
output [0:0] out ;
input  p0 ;

wire [0:0] sky130_fd_sc_hd__mux2_1_0_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_1_X ;

sky130_fd_sc_hd__mux2_1 mux_l1_in_0_ ( .A0 ( in[1] ) , .A1 ( in[0] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_0_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_0_ ( .A0 ( p0 ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_0_X[0] ) , .S ( sram[1] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_1_X[0] ) ) ;
sky130_fd_sc_hd__buf_6 BUFT_RR_79 ( .A ( sky130_fd_sc_hd__mux2_1_1_X[0] ) , 
    .X ( out[0] ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size2_0 ( in , sram , sram_inv , out , p0 ) ;
input  [0:1] in ;
input  [0:1] sram ;
input  [0:1] sram_inv ;
output [0:0] out ;
input  p0 ;

wire [0:0] sky130_fd_sc_hd__mux2_1_0_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_1_X ;

sky130_fd_sc_hd__buf_6 sky130_fd_sc_hd__buf_4_0_ ( 
    .A ( sky130_fd_sc_hd__mux2_1_1_X[0] ) , .X ( out[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l1_in_0_ ( .A0 ( in[1] ) , .A1 ( in[0] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_0_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_0_ ( .A0 ( p0 ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_0_X[0] ) , .S ( sram[1] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_1_X[0] ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size4_mem ( pReset , prog_clk , ccff_head , 
    ccff_tail , mem_out ) ;
input  [0:0] pReset ;
input  [0:0] prog_clk ;
input  [0:0] ccff_head ;
output [0:0] ccff_tail ;
output [0:2] mem_out ;

sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_0_ ( .D ( ccff_head[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[0] ) ) ;
sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_1_ ( .D ( mem_out[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[1] ) ) ;
sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_2_ ( .D ( mem_out[1] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[2] ) ) ;
sky130_fd_sc_hd__buf_1 FTB_12__11 ( .A ( mem_out[2] ) , .X ( ccff_tail[0] ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size4_mem_10 ( pReset , prog_clk , ccff_head , 
    ccff_tail , mem_out ) ;
input  [0:0] pReset ;
input  [0:0] prog_clk ;
input  [0:0] ccff_head ;
output [0:0] ccff_tail ;
output [0:2] mem_out ;

sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_0_ ( .D ( ccff_head[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[0] ) ) ;
sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_1_ ( .D ( mem_out[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[1] ) ) ;
sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_2_ ( .D ( mem_out[1] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[2] ) ) ;
sky130_fd_sc_hd__buf_1 FTB_11__10 ( .A ( mem_out[2] ) , .X ( ccff_tail[0] ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size4_mem_9 ( pReset , prog_clk , ccff_head , 
    ccff_tail , mem_out ) ;
input  [0:0] pReset ;
input  [0:0] prog_clk ;
input  [0:0] ccff_head ;
output [0:0] ccff_tail ;
output [0:2] mem_out ;

sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_0_ ( .D ( ccff_head[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[0] ) ) ;
sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_1_ ( .D ( mem_out[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[1] ) ) ;
sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_2_ ( .D ( mem_out[1] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[2] ) ) ;
sky130_fd_sc_hd__buf_1 FTB_10__9 ( .A ( mem_out[2] ) , .X ( ccff_tail[0] ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size4_mem_8 ( pReset , prog_clk , ccff_head , 
    ccff_tail , mem_out ) ;
input  [0:0] pReset ;
input  [0:0] prog_clk ;
input  [0:0] ccff_head ;
output [0:0] ccff_tail ;
output [0:2] mem_out ;

sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_0_ ( .D ( ccff_head[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[0] ) ) ;
sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_1_ ( .D ( mem_out[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[1] ) ) ;
sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_2_ ( .D ( mem_out[1] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[2] ) ) ;
sky130_fd_sc_hd__buf_1 FTB_9__8 ( .A ( mem_out[2] ) , .X ( ccff_tail[0] ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size4_mem_7 ( pReset , prog_clk , ccff_head , 
    ccff_tail , mem_out ) ;
input  [0:0] pReset ;
input  [0:0] prog_clk ;
input  [0:0] ccff_head ;
output [0:0] ccff_tail ;
output [0:2] mem_out ;

sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_0_ ( .D ( ccff_head[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[0] ) ) ;
sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_1_ ( .D ( mem_out[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[1] ) ) ;
sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_2_ ( .D ( mem_out[1] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[2] ) ) ;
sky130_fd_sc_hd__buf_1 FTB_8__7 ( .A ( mem_out[2] ) , .X ( ccff_tail[0] ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size4_mem_6 ( pReset , prog_clk , ccff_head , 
    ccff_tail , mem_out ) ;
input  [0:0] pReset ;
input  [0:0] prog_clk ;
input  [0:0] ccff_head ;
output [0:0] ccff_tail ;
output [0:2] mem_out ;

sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_0_ ( .D ( ccff_head[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[0] ) ) ;
sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_1_ ( .D ( mem_out[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[1] ) ) ;
sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_2_ ( .D ( mem_out[1] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[2] ) ) ;
sky130_fd_sc_hd__buf_1 FTB_7__6 ( .A ( mem_out[2] ) , .X ( ccff_tail[0] ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size4_mem_5 ( pReset , prog_clk , ccff_head , 
    ccff_tail , mem_out ) ;
input  [0:0] pReset ;
input  [0:0] prog_clk ;
input  [0:0] ccff_head ;
output [0:0] ccff_tail ;
output [0:2] mem_out ;

sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_0_ ( .D ( ccff_head[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[0] ) ) ;
sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_1_ ( .D ( mem_out[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[1] ) ) ;
sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_2_ ( .D ( mem_out[1] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[2] ) ) ;
sky130_fd_sc_hd__buf_1 FTB_6__5 ( .A ( mem_out[2] ) , .X ( ccff_tail[0] ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size4_mem_4 ( pReset , prog_clk , ccff_head , 
    ccff_tail , mem_out ) ;
input  [0:0] pReset ;
input  [0:0] prog_clk ;
input  [0:0] ccff_head ;
output [0:0] ccff_tail ;
output [0:2] mem_out ;

sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_0_ ( .D ( ccff_head[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[0] ) ) ;
sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_1_ ( .D ( mem_out[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[1] ) ) ;
sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_2_ ( .D ( mem_out[1] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[2] ) ) ;
sky130_fd_sc_hd__buf_1 FTB_5__4 ( .A ( mem_out[2] ) , .X ( ccff_tail[0] ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size4_mem_3 ( pReset , prog_clk , ccff_head , 
    ccff_tail , mem_out ) ;
input  [0:0] pReset ;
input  [0:0] prog_clk ;
input  [0:0] ccff_head ;
output [0:0] ccff_tail ;
output [0:2] mem_out ;

sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_0_ ( .D ( ccff_head[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[0] ) ) ;
sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_1_ ( .D ( mem_out[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[1] ) ) ;
sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_2_ ( .D ( mem_out[1] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[2] ) ) ;
sky130_fd_sc_hd__buf_1 FTB_4__3 ( .A ( mem_out[2] ) , .X ( ccff_tail[0] ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size4_mem_2 ( pReset , prog_clk , ccff_head , 
    ccff_tail , mem_out ) ;
input  [0:0] pReset ;
input  [0:0] prog_clk ;
input  [0:0] ccff_head ;
output [0:0] ccff_tail ;
output [0:2] mem_out ;

sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_0_ ( .D ( ccff_head[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[0] ) ) ;
sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_1_ ( .D ( mem_out[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[1] ) ) ;
sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_2_ ( .D ( mem_out[1] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[2] ) ) ;
sky130_fd_sc_hd__buf_1 FTB_3__2 ( .A ( mem_out[2] ) , .X ( ccff_tail[0] ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size4_mem_1 ( pReset , prog_clk , ccff_head , 
    ccff_tail , mem_out ) ;
input  [0:0] pReset ;
input  [0:0] prog_clk ;
input  [0:0] ccff_head ;
output [0:0] ccff_tail ;
output [0:2] mem_out ;

sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_0_ ( .D ( ccff_head[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[0] ) ) ;
sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_1_ ( .D ( mem_out[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[1] ) ) ;
sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_2_ ( .D ( mem_out[1] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[2] ) ) ;
sky130_fd_sc_hd__buf_1 FTB_2__1 ( .A ( mem_out[2] ) , .X ( ccff_tail[0] ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size4_mem_0 ( pReset , prog_clk , ccff_head , 
    ccff_tail , mem_out ) ;
input  [0:0] pReset ;
input  [0:0] prog_clk ;
input  [0:0] ccff_head ;
output [0:0] ccff_tail ;
output [0:2] mem_out ;

sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_0_ ( .D ( ropt_net_195 ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[0] ) ) ;
sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_1_ ( .D ( mem_out[0] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[1] ) ) ;
sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_2_ ( .D ( mem_out[1] ) , 
    .CLK ( prog_clk[0] ) , .RESET_B ( pReset[0] ) , .Q ( mem_out[2] ) ) ;
sky130_fd_sc_hd__buf_1 FTB_1__0 ( .A ( mem_out[2] ) , .X ( ccff_tail[0] ) ) ;
sky130_fd_sc_hd__dlygate4sd3_1 copt_h_inst_1326 ( .A ( ccff_head[0] ) , 
    .X ( copt_net_156 ) ) ;
sky130_fd_sc_hd__dlygate4sd3_1 copt_h_inst_1327 ( .A ( copt_net_156 ) , 
    .X ( copt_net_157 ) ) ;
sky130_fd_sc_hd__dlygate4sd3_1 copt_h_inst_1328 ( .A ( copt_net_157 ) , 
    .X ( copt_net_158 ) ) ;
sky130_fd_sc_hd__dlygate4sd3_1 copt_h_inst_1329 ( .A ( copt_net_158 ) , 
    .X ( copt_net_159 ) ) ;
sky130_fd_sc_hd__dlygate4sd3_1 copt_h_inst_1330 ( .A ( ropt_net_198 ) , 
    .X ( copt_net_160 ) ) ;
sky130_fd_sc_hd__dlygate4sd3_1 copt_h_inst_1331 ( .A ( copt_net_160 ) , 
    .X ( copt_net_161 ) ) ;
sky130_fd_sc_hd__dlygate4sd3_1 ropt_h_inst_1365 ( .A ( copt_net_161 ) , 
    .X ( ropt_net_195 ) ) ;
sky130_fd_sc_hd__dlygate4sd3_1 ropt_h_inst_1366 ( .A ( copt_net_159 ) , 
    .X ( ropt_net_196 ) ) ;
sky130_fd_sc_hd__dlygate4sd3_1 ropt_h_inst_1367 ( .A ( ropt_net_196 ) , 
    .X ( ropt_net_197 ) ) ;
sky130_fd_sc_hd__dlygate4sd3_1 ropt_h_inst_1368 ( .A ( ropt_net_199 ) , 
    .X ( ropt_net_198 ) ) ;
sky130_fd_sc_hd__buf_1 ropt_h_inst_1369 ( .A ( ropt_net_197 ) , 
    .X ( ropt_net_199 ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size4 ( in , sram , sram_inv , out , p0 ) ;
input  [0:3] in ;
input  [0:2] sram ;
input  [0:2] sram_inv ;
output [0:0] out ;
input  p0 ;

wire [0:0] sky130_fd_sc_hd__mux2_1_0_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_1_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_2_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_3_X ;

sky130_fd_sc_hd__buf_6 sky130_fd_sc_hd__buf_4_0_ ( 
    .A ( sky130_fd_sc_hd__mux2_1_3_X[0] ) , .X ( out[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l1_in_0_ ( .A0 ( in[1] ) , .A1 ( in[0] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_0_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_0_ ( .A0 ( in[2] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_0_X[0] ) , .S ( sram[1] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_1_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_1_ ( .A0 ( p0 ) , .A1 ( in[3] ) , 
    .S ( sram[1] ) , .X ( sky130_fd_sc_hd__mux2_1_2_X[0] ) ) ;
sky130_fd_sc_hd__mux2_2 mux_l3_in_0_ ( 
    .A0 ( sky130_fd_sc_hd__mux2_1_2_X[0] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_1_X[0] ) , .S ( sram[2] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_3_X[0] ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size4_10 ( in , sram , sram_inv , out , p0 ) ;
input  [0:3] in ;
input  [0:2] sram ;
input  [0:2] sram_inv ;
output [0:0] out ;
input  p0 ;

wire [0:0] sky130_fd_sc_hd__mux2_1_0_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_1_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_2_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_3_X ;

sky130_fd_sc_hd__mux2_1 mux_l1_in_0_ ( .A0 ( in[1] ) , .A1 ( in[0] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_0_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_0_ ( .A0 ( in[2] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_0_X[0] ) , .S ( sram[1] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_1_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_1_ ( .A0 ( p0 ) , .A1 ( in[3] ) , 
    .S ( sram[1] ) , .X ( sky130_fd_sc_hd__mux2_1_2_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l3_in_0_ ( 
    .A0 ( sky130_fd_sc_hd__mux2_1_2_X[0] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_1_X[0] ) , .S ( sram[2] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_3_X[0] ) ) ;
sky130_fd_sc_hd__inv_8 BINV_R_77 ( .A ( BUF_net_78 ) , .Y ( out[0] ) ) ;
sky130_fd_sc_hd__inv_1 BINV_R_78 ( .A ( sky130_fd_sc_hd__mux2_1_3_X[0] ) , 
    .Y ( BUF_net_78 ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size4_9 ( in , sram , sram_inv , out , p0 ) ;
input  [0:3] in ;
input  [0:2] sram ;
input  [0:2] sram_inv ;
output [0:0] out ;
input  p0 ;

wire [0:0] sky130_fd_sc_hd__mux2_1_0_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_1_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_2_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_3_X ;

sky130_fd_sc_hd__mux2_1 mux_l1_in_0_ ( .A0 ( in[1] ) , .A1 ( in[0] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_0_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_0_ ( .A0 ( in[2] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_0_X[0] ) , .S ( sram[1] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_1_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_1_ ( .A0 ( p0 ) , .A1 ( in[3] ) , 
    .S ( sram[1] ) , .X ( sky130_fd_sc_hd__mux2_1_2_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l3_in_0_ ( 
    .A0 ( sky130_fd_sc_hd__mux2_1_2_X[0] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_1_X[0] ) , .S ( sram[2] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_3_X[0] ) ) ;
sky130_fd_sc_hd__inv_8 BINV_R_75 ( .A ( BUF_net_76 ) , .Y ( out[0] ) ) ;
sky130_fd_sc_hd__inv_1 BINV_R_76 ( .A ( sky130_fd_sc_hd__mux2_1_3_X[0] ) , 
    .Y ( BUF_net_76 ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size4_8 ( in , sram , sram_inv , out , p0 ) ;
input  [0:3] in ;
input  [0:2] sram ;
input  [0:2] sram_inv ;
output [0:0] out ;
input  p0 ;

wire [0:0] sky130_fd_sc_hd__mux2_1_0_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_1_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_2_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_3_X ;

sky130_fd_sc_hd__mux2_1 mux_l1_in_0_ ( .A0 ( in[1] ) , .A1 ( in[0] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_0_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_0_ ( .A0 ( in[2] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_0_X[0] ) , .S ( sram[1] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_1_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_1_ ( .A0 ( p0 ) , .A1 ( in[3] ) , 
    .S ( sram[1] ) , .X ( sky130_fd_sc_hd__mux2_1_2_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l3_in_0_ ( 
    .A0 ( sky130_fd_sc_hd__mux2_1_2_X[0] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_1_X[0] ) , .S ( sram[2] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_3_X[0] ) ) ;
sky130_fd_sc_hd__inv_2 BINV_R_74 ( .A ( sky130_fd_sc_hd__mux2_1_3_X[0] ) , 
    .Y ( BUF_net_74 ) ) ;
sky130_fd_sc_hd__inv_6 BINV_R_141 ( .A ( BUF_net_74 ) , .Y ( out[0] ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size4_7 ( in , sram , sram_inv , out , p0 ) ;
input  [0:3] in ;
input  [0:2] sram ;
input  [0:2] sram_inv ;
output [0:0] out ;
input  p0 ;

wire [0:0] sky130_fd_sc_hd__mux2_1_0_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_1_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_2_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_3_X ;

sky130_fd_sc_hd__mux2_1 mux_l1_in_0_ ( .A0 ( in[1] ) , .A1 ( in[0] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_0_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_0_ ( .A0 ( in[2] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_0_X[0] ) , .S ( sram[1] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_1_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_1_ ( .A0 ( p0 ) , .A1 ( in[3] ) , 
    .S ( sram[1] ) , .X ( sky130_fd_sc_hd__mux2_1_2_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l3_in_0_ ( 
    .A0 ( sky130_fd_sc_hd__mux2_1_2_X[0] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_1_X[0] ) , .S ( sram[2] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_3_X[0] ) ) ;
sky130_fd_sc_hd__inv_8 BINV_R_71 ( .A ( BUF_net_72 ) , .Y ( out[0] ) ) ;
sky130_fd_sc_hd__inv_1 BINV_R_72 ( .A ( sky130_fd_sc_hd__mux2_1_3_X[0] ) , 
    .Y ( BUF_net_72 ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size4_6 ( in , sram , sram_inv , out , p0 ) ;
input  [0:3] in ;
input  [0:2] sram ;
input  [0:2] sram_inv ;
output [0:0] out ;
input  p0 ;

wire [0:0] sky130_fd_sc_hd__mux2_1_0_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_1_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_2_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_3_X ;

sky130_fd_sc_hd__mux2_1 mux_l1_in_0_ ( .A0 ( in[1] ) , .A1 ( in[0] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_0_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_0_ ( .A0 ( in[2] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_0_X[0] ) , .S ( sram[1] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_1_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_1_ ( .A0 ( p0 ) , .A1 ( in[3] ) , 
    .S ( sram[1] ) , .X ( sky130_fd_sc_hd__mux2_1_2_X[0] ) ) ;
sky130_fd_sc_hd__mux2_2 mux_l3_in_0_ ( 
    .A0 ( sky130_fd_sc_hd__mux2_1_2_X[0] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_1_X[0] ) , .S ( sram[2] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_3_X[0] ) ) ;
sky130_fd_sc_hd__buf_6 BUFT_RR_70 ( .A ( sky130_fd_sc_hd__mux2_1_3_X[0] ) , 
    .X ( out[0] ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size4_5 ( in , sram , sram_inv , out , p0 ) ;
input  [0:3] in ;
input  [0:2] sram ;
input  [0:2] sram_inv ;
output [0:0] out ;
input  p0 ;

wire [0:0] sky130_fd_sc_hd__mux2_1_0_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_1_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_2_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_3_X ;

sky130_fd_sc_hd__buf_6 sky130_fd_sc_hd__buf_4_0_ ( 
    .A ( sky130_fd_sc_hd__mux2_1_3_X[0] ) , .X ( out[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l1_in_0_ ( .A0 ( in[1] ) , .A1 ( in[0] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_0_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_0_ ( .A0 ( in[2] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_0_X[0] ) , .S ( sram[1] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_1_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_1_ ( .A0 ( p0 ) , .A1 ( in[3] ) , 
    .S ( sram[1] ) , .X ( sky130_fd_sc_hd__mux2_1_2_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l3_in_0_ ( 
    .A0 ( sky130_fd_sc_hd__mux2_1_2_X[0] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_1_X[0] ) , .S ( sram[2] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_3_X[0] ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size4_4 ( in , sram , sram_inv , out , p0 ) ;
input  [0:3] in ;
input  [0:2] sram ;
input  [0:2] sram_inv ;
output [0:0] out ;
input  p0 ;

wire [0:0] sky130_fd_sc_hd__mux2_1_0_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_1_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_2_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_3_X ;

sky130_fd_sc_hd__mux2_1 mux_l1_in_0_ ( .A0 ( in[1] ) , .A1 ( in[0] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_0_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_0_ ( .A0 ( in[2] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_0_X[0] ) , .S ( sram[1] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_1_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_1_ ( .A0 ( p0 ) , .A1 ( in[3] ) , 
    .S ( sram[1] ) , .X ( sky130_fd_sc_hd__mux2_1_2_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l3_in_0_ ( 
    .A0 ( sky130_fd_sc_hd__mux2_1_2_X[0] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_1_X[0] ) , .S ( sram[2] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_3_X[0] ) ) ;
sky130_fd_sc_hd__inv_8 BINV_R_68 ( .A ( BUF_net_69 ) , .Y ( out[0] ) ) ;
sky130_fd_sc_hd__inv_1 BINV_R_69 ( .A ( sky130_fd_sc_hd__mux2_1_3_X[0] ) , 
    .Y ( BUF_net_69 ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size4_3 ( in , sram , sram_inv , out , p0 ) ;
input  [0:3] in ;
input  [0:2] sram ;
input  [0:2] sram_inv ;
output [0:0] out ;
input  p0 ;

wire [0:0] sky130_fd_sc_hd__mux2_1_0_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_1_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_2_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_3_X ;

sky130_fd_sc_hd__mux2_1 mux_l1_in_0_ ( .A0 ( in[1] ) , .A1 ( in[0] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_0_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_0_ ( .A0 ( in[2] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_0_X[0] ) , .S ( sram[1] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_1_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_1_ ( .A0 ( p0 ) , .A1 ( in[3] ) , 
    .S ( sram[1] ) , .X ( sky130_fd_sc_hd__mux2_1_2_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l3_in_0_ ( 
    .A0 ( sky130_fd_sc_hd__mux2_1_2_X[0] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_1_X[0] ) , .S ( sram[2] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_3_X[0] ) ) ;
sky130_fd_sc_hd__buf_6 BUFT_RR_67 ( .A ( sky130_fd_sc_hd__mux2_1_3_X[0] ) , 
    .X ( out[0] ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size4_2 ( in , sram , sram_inv , out , p0 ) ;
input  [0:3] in ;
input  [0:2] sram ;
input  [0:2] sram_inv ;
output [0:0] out ;
input  p0 ;

wire [0:0] sky130_fd_sc_hd__mux2_1_0_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_1_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_2_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_3_X ;

sky130_fd_sc_hd__mux2_1 mux_l1_in_0_ ( .A0 ( in[1] ) , .A1 ( in[0] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_0_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_0_ ( .A0 ( in[2] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_0_X[0] ) , .S ( sram[1] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_1_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_1_ ( .A0 ( p0 ) , .A1 ( in[3] ) , 
    .S ( sram[1] ) , .X ( sky130_fd_sc_hd__mux2_1_2_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l3_in_0_ ( 
    .A0 ( sky130_fd_sc_hd__mux2_1_2_X[0] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_1_X[0] ) , .S ( sram[2] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_3_X[0] ) ) ;
sky130_fd_sc_hd__inv_8 BINV_R_65 ( .A ( BUF_net_66 ) , .Y ( out[0] ) ) ;
sky130_fd_sc_hd__inv_1 BINV_R_66 ( .A ( sky130_fd_sc_hd__mux2_1_3_X[0] ) , 
    .Y ( BUF_net_66 ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size4_1 ( in , sram , sram_inv , out , p0 ) ;
input  [0:3] in ;
input  [0:2] sram ;
input  [0:2] sram_inv ;
output [0:0] out ;
input  p0 ;

wire [0:0] sky130_fd_sc_hd__mux2_1_0_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_1_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_2_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_3_X ;

sky130_fd_sc_hd__mux2_1 mux_l1_in_0_ ( .A0 ( in[1] ) , .A1 ( in[0] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_0_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_0_ ( .A0 ( in[2] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_0_X[0] ) , .S ( sram[1] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_1_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_1_ ( .A0 ( p0 ) , .A1 ( in[3] ) , 
    .S ( sram[1] ) , .X ( sky130_fd_sc_hd__mux2_1_2_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l3_in_0_ ( 
    .A0 ( sky130_fd_sc_hd__mux2_1_2_X[0] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_1_X[0] ) , .S ( sram[2] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_3_X[0] ) ) ;
sky130_fd_sc_hd__inv_8 BINV_R_63 ( .A ( BUF_net_64 ) , .Y ( out[0] ) ) ;
sky130_fd_sc_hd__inv_1 BINV_R_64 ( .A ( sky130_fd_sc_hd__mux2_1_3_X[0] ) , 
    .Y ( BUF_net_64 ) ) ;
endmodule


module sb_2__2__mux_tree_tapbuf_size4_0 ( in , sram , sram_inv , out , p0 ) ;
input  [0:3] in ;
input  [0:2] sram ;
input  [0:2] sram_inv ;
output [0:0] out ;
input  p0 ;

wire [0:0] sky130_fd_sc_hd__mux2_1_0_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_1_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_2_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_3_X ;

sky130_fd_sc_hd__mux2_1 mux_l1_in_0_ ( .A0 ( in[1] ) , .A1 ( in[0] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_0_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_0_ ( .A0 ( in[2] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_0_X[0] ) , .S ( sram[1] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_1_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_1_ ( .A0 ( p0 ) , .A1 ( in[3] ) , 
    .S ( sram[1] ) , .X ( sky130_fd_sc_hd__mux2_1_2_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l3_in_0_ ( 
    .A0 ( sky130_fd_sc_hd__mux2_1_2_X[0] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_1_X[0] ) , .S ( sram[2] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_3_X[0] ) ) ;
sky130_fd_sc_hd__inv_8 BINV_R_61 ( .A ( BUF_net_62 ) , .Y ( out[0] ) ) ;
sky130_fd_sc_hd__inv_1 BINV_R_62 ( .A ( sky130_fd_sc_hd__mux2_1_3_X[0] ) , 
    .Y ( BUF_net_62 ) ) ;
endmodule


module sb_2__2_ ( pReset , chany_bottom_in , bottom_right_grid_pin_1_ , 
    bottom_left_grid_pin_44_ , bottom_left_grid_pin_45_ , 
    bottom_left_grid_pin_46_ , bottom_left_grid_pin_47_ , 
    bottom_left_grid_pin_48_ , bottom_left_grid_pin_49_ , 
    bottom_left_grid_pin_50_ , bottom_left_grid_pin_51_ , chanx_left_in , 
    left_top_grid_pin_1_ , left_bottom_grid_pin_36_ , 
    left_bottom_grid_pin_37_ , left_bottom_grid_pin_38_ , 
    left_bottom_grid_pin_39_ , left_bottom_grid_pin_40_ , 
    left_bottom_grid_pin_41_ , left_bottom_grid_pin_42_ , 
    left_bottom_grid_pin_43_ , ccff_head , chany_bottom_out , chanx_left_out , 
    ccff_tail , SC_IN_BOT , SC_OUT_BOT , pReset_W_in , prog_clk_0_S_in ) ;
input  [0:0] pReset ;
input  [0:29] chany_bottom_in ;
input  [0:0] bottom_right_grid_pin_1_ ;
input  [0:0] bottom_left_grid_pin_44_ ;
input  [0:0] bottom_left_grid_pin_45_ ;
input  [0:0] bottom_left_grid_pin_46_ ;
input  [0:0] bottom_left_grid_pin_47_ ;
input  [0:0] bottom_left_grid_pin_48_ ;
input  [0:0] bottom_left_grid_pin_49_ ;
input  [0:0] bottom_left_grid_pin_50_ ;
input  [0:0] bottom_left_grid_pin_51_ ;
input  [0:29] chanx_left_in ;
input  [0:0] left_top_grid_pin_1_ ;
input  [0:0] left_bottom_grid_pin_36_ ;
input  [0:0] left_bottom_grid_pin_37_ ;
input  [0:0] left_bottom_grid_pin_38_ ;
input  [0:0] left_bottom_grid_pin_39_ ;
input  [0:0] left_bottom_grid_pin_40_ ;
input  [0:0] left_bottom_grid_pin_41_ ;
input  [0:0] left_bottom_grid_pin_42_ ;
input  [0:0] left_bottom_grid_pin_43_ ;
input  [0:0] ccff_head ;
output [0:29] chany_bottom_out ;
output [0:29] chanx_left_out ;
output [0:0] ccff_tail ;
input  SC_IN_BOT ;
output SC_OUT_BOT ;
input  pReset_W_in ;
input  prog_clk_0_S_in ;

wire ropt_net_177 ;
wire [0:0] prog_clk ;
wire prog_clk_0 ;
wire [0:1] mux_tree_tapbuf_size2_0_sram ;
wire [0:1] mux_tree_tapbuf_size2_10_sram ;
wire [0:1] mux_tree_tapbuf_size2_11_sram ;
wire [0:1] mux_tree_tapbuf_size2_12_sram ;
wire [0:1] mux_tree_tapbuf_size2_13_sram ;
wire [0:1] mux_tree_tapbuf_size2_14_sram ;
wire [0:1] mux_tree_tapbuf_size2_15_sram ;
wire [0:1] mux_tree_tapbuf_size2_16_sram ;
wire [0:1] mux_tree_tapbuf_size2_17_sram ;
wire [0:1] mux_tree_tapbuf_size2_18_sram ;
wire [0:1] mux_tree_tapbuf_size2_19_sram ;
wire [0:1] mux_tree_tapbuf_size2_1_sram ;
wire [0:1] mux_tree_tapbuf_size2_20_sram ;
wire [0:1] mux_tree_tapbuf_size2_21_sram ;
wire [0:1] mux_tree_tapbuf_size2_22_sram ;
wire [0:1] mux_tree_tapbuf_size2_23_sram ;
wire [0:1] mux_tree_tapbuf_size2_24_sram ;
wire [0:1] mux_tree_tapbuf_size2_25_sram ;
wire [0:1] mux_tree_tapbuf_size2_26_sram ;
wire [0:1] mux_tree_tapbuf_size2_27_sram ;
wire [0:1] mux_tree_tapbuf_size2_28_sram ;
wire [0:1] mux_tree_tapbuf_size2_29_sram ;
wire [0:1] mux_tree_tapbuf_size2_2_sram ;
wire [0:1] mux_tree_tapbuf_size2_30_sram ;
wire [0:1] mux_tree_tapbuf_size2_31_sram ;
wire [0:1] mux_tree_tapbuf_size2_32_sram ;
wire [0:1] mux_tree_tapbuf_size2_33_sram ;
wire [0:1] mux_tree_tapbuf_size2_34_sram ;
wire [0:1] mux_tree_tapbuf_size2_35_sram ;
wire [0:1] mux_tree_tapbuf_size2_36_sram ;
wire [0:1] mux_tree_tapbuf_size2_3_sram ;
wire [0:1] mux_tree_tapbuf_size2_4_sram ;
wire [0:1] mux_tree_tapbuf_size2_5_sram ;
wire [0:1] mux_tree_tapbuf_size2_6_sram ;
wire [0:1] mux_tree_tapbuf_size2_7_sram ;
wire [0:1] mux_tree_tapbuf_size2_8_sram ;
wire [0:1] mux_tree_tapbuf_size2_9_sram ;
wire [0:0] mux_tree_tapbuf_size2_mem_0_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size2_mem_10_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size2_mem_11_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size2_mem_12_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size2_mem_13_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size2_mem_14_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size2_mem_15_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size2_mem_16_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size2_mem_17_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size2_mem_18_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size2_mem_19_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size2_mem_1_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size2_mem_20_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size2_mem_21_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size2_mem_22_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size2_mem_23_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size2_mem_24_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size2_mem_25_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size2_mem_26_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size2_mem_27_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size2_mem_28_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size2_mem_29_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size2_mem_2_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size2_mem_30_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size2_mem_31_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size2_mem_32_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size2_mem_33_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size2_mem_34_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size2_mem_35_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size2_mem_3_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size2_mem_4_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size2_mem_5_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size2_mem_6_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size2_mem_7_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size2_mem_8_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size2_mem_9_ccff_tail ;
wire [0:1] mux_tree_tapbuf_size3_0_sram ;
wire [0:1] mux_tree_tapbuf_size3_1_sram ;
wire [0:1] mux_tree_tapbuf_size3_2_sram ;
wire [0:1] mux_tree_tapbuf_size3_3_sram ;
wire [0:0] mux_tree_tapbuf_size3_mem_0_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size3_mem_1_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size3_mem_2_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size3_mem_3_ccff_tail ;
wire [0:2] mux_tree_tapbuf_size4_0_sram ;
wire [0:2] mux_tree_tapbuf_size4_10_sram ;
wire [0:2] mux_tree_tapbuf_size4_11_sram ;
wire [0:2] mux_tree_tapbuf_size4_1_sram ;
wire [0:2] mux_tree_tapbuf_size4_2_sram ;
wire [0:2] mux_tree_tapbuf_size4_3_sram ;
wire [0:2] mux_tree_tapbuf_size4_4_sram ;
wire [0:2] mux_tree_tapbuf_size4_5_sram ;
wire [0:2] mux_tree_tapbuf_size4_6_sram ;
wire [0:2] mux_tree_tapbuf_size4_7_sram ;
wire [0:2] mux_tree_tapbuf_size4_8_sram ;
wire [0:2] mux_tree_tapbuf_size4_9_sram ;
wire [0:0] mux_tree_tapbuf_size4_mem_0_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size4_mem_10_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size4_mem_11_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size4_mem_1_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size4_mem_2_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size4_mem_3_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size4_mem_4_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size4_mem_5_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size4_mem_6_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size4_mem_7_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size4_mem_8_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size4_mem_9_ccff_tail ;

assign prog_clk_0 = prog_clk[0] ;

sb_2__2__mux_tree_tapbuf_size4_0 mux_bottom_track_1 (
    .in ( { bottom_right_grid_pin_1_[0] , bottom_left_grid_pin_46_[0] , 
        bottom_left_grid_pin_49_[0] , chanx_left_in[1] } ) ,
    .sram ( mux_tree_tapbuf_size4_0_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_1 , SYNOPSYS_UNCONNECTED_2 , 
        SYNOPSYS_UNCONNECTED_3 } ) ,
    .out ( chany_bottom_out[0] ) , .p0 ( optlc_net_154 ) ) ;
sb_2__2__mux_tree_tapbuf_size4_1 mux_bottom_track_3 (
    .in ( { bottom_left_grid_pin_44_[0] , bottom_left_grid_pin_47_[0] , 
        bottom_left_grid_pin_50_[0] , chanx_left_in[2] } ) ,
    .sram ( mux_tree_tapbuf_size4_1_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_4 , SYNOPSYS_UNCONNECTED_5 , 
        SYNOPSYS_UNCONNECTED_6 } ) ,
    .out ( chany_bottom_out[1] ) , .p0 ( optlc_net_154 ) ) ;
sb_2__2__mux_tree_tapbuf_size4_2 mux_bottom_track_5 (
    .in ( { bottom_left_grid_pin_45_[0] , bottom_left_grid_pin_48_[0] , 
        bottom_left_grid_pin_51_[0] , chanx_left_in[3] } ) ,
    .sram ( mux_tree_tapbuf_size4_2_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_7 , SYNOPSYS_UNCONNECTED_8 , 
        SYNOPSYS_UNCONNECTED_9 } ) ,
    .out ( chany_bottom_out[2] ) , .p0 ( optlc_net_154 ) ) ;
sb_2__2__mux_tree_tapbuf_size4_3 mux_bottom_track_7 (
    .in ( { bottom_right_grid_pin_1_[0] , bottom_left_grid_pin_46_[0] , 
        bottom_left_grid_pin_49_[0] , chanx_left_in[4] } ) ,
    .sram ( mux_tree_tapbuf_size4_3_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_10 , SYNOPSYS_UNCONNECTED_11 , 
        SYNOPSYS_UNCONNECTED_12 } ) ,
    .out ( chany_bottom_out[3] ) , .p0 ( optlc_net_154 ) ) ;
sb_2__2__mux_tree_tapbuf_size4_4 mux_bottom_track_9 (
    .in ( { bottom_left_grid_pin_44_[0] , bottom_left_grid_pin_47_[0] , 
        bottom_left_grid_pin_50_[0] , chanx_left_in[5] } ) ,
    .sram ( mux_tree_tapbuf_size4_4_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_13 , SYNOPSYS_UNCONNECTED_14 , 
        SYNOPSYS_UNCONNECTED_15 } ) ,
    .out ( chany_bottom_out[4] ) , .p0 ( optlc_net_155 ) ) ;
sb_2__2__mux_tree_tapbuf_size4_5 mux_bottom_track_11 (
    .in ( { bottom_left_grid_pin_45_[0] , bottom_left_grid_pin_48_[0] , 
        bottom_left_grid_pin_51_[0] , chanx_left_in[6] } ) ,
    .sram ( mux_tree_tapbuf_size4_5_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_16 , SYNOPSYS_UNCONNECTED_17 , 
        SYNOPSYS_UNCONNECTED_18 } ) ,
    .out ( chany_bottom_out[5] ) , .p0 ( optlc_net_155 ) ) ;
sb_2__2__mux_tree_tapbuf_size4_6 mux_left_track_1 (
    .in ( { chany_bottom_in[29] , left_top_grid_pin_1_[0] , 
        left_bottom_grid_pin_38_[0] , left_bottom_grid_pin_41_[0] } ) ,
    .sram ( mux_tree_tapbuf_size4_6_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_19 , SYNOPSYS_UNCONNECTED_20 , 
        SYNOPSYS_UNCONNECTED_21 } ) ,
    .out ( chanx_left_out[0] ) , .p0 ( optlc_net_151 ) ) ;
sb_2__2__mux_tree_tapbuf_size4_7 mux_left_track_3 (
    .in ( { chany_bottom_in[0] , left_bottom_grid_pin_36_[0] , 
        left_bottom_grid_pin_39_[0] , left_bottom_grid_pin_42_[0] } ) ,
    .sram ( mux_tree_tapbuf_size4_7_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_22 , SYNOPSYS_UNCONNECTED_23 , 
        SYNOPSYS_UNCONNECTED_24 } ) ,
    .out ( chanx_left_out[1] ) , .p0 ( optlc_net_151 ) ) ;
sb_2__2__mux_tree_tapbuf_size4_8 mux_left_track_5 (
    .in ( { chany_bottom_in[1] , left_bottom_grid_pin_37_[0] , 
        left_bottom_grid_pin_40_[0] , left_bottom_grid_pin_43_[0] } ) ,
    .sram ( mux_tree_tapbuf_size4_8_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_25 , SYNOPSYS_UNCONNECTED_26 , 
        SYNOPSYS_UNCONNECTED_27 } ) ,
    .out ( chanx_left_out[2] ) , .p0 ( optlc_net_151 ) ) ;
sb_2__2__mux_tree_tapbuf_size4_9 mux_left_track_7 (
    .in ( { chany_bottom_in[2] , left_top_grid_pin_1_[0] , 
        left_bottom_grid_pin_38_[0] , left_bottom_grid_pin_41_[0] } ) ,
    .sram ( mux_tree_tapbuf_size4_9_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_28 , SYNOPSYS_UNCONNECTED_29 , 
        SYNOPSYS_UNCONNECTED_30 } ) ,
    .out ( chanx_left_out[3] ) , .p0 ( optlc_net_151 ) ) ;
sb_2__2__mux_tree_tapbuf_size4_10 mux_left_track_9 (
    .in ( { chany_bottom_in[3] , left_bottom_grid_pin_36_[0] , 
        left_bottom_grid_pin_39_[0] , left_bottom_grid_pin_42_[0] } ) ,
    .sram ( mux_tree_tapbuf_size4_10_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_31 , SYNOPSYS_UNCONNECTED_32 , 
        SYNOPSYS_UNCONNECTED_33 } ) ,
    .out ( chanx_left_out[4] ) , .p0 ( optlc_net_151 ) ) ;
sb_2__2__mux_tree_tapbuf_size4 mux_left_track_11 (
    .in ( { chany_bottom_in[4] , left_bottom_grid_pin_37_[0] , 
        left_bottom_grid_pin_40_[0] , left_bottom_grid_pin_43_[0] } ) ,
    .sram ( mux_tree_tapbuf_size4_11_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_34 , SYNOPSYS_UNCONNECTED_35 , 
        SYNOPSYS_UNCONNECTED_36 } ) ,
    .out ( chanx_left_out[5] ) , .p0 ( optlc_net_151 ) ) ;
sb_2__2__mux_tree_tapbuf_size4_mem_0 mem_bottom_track_1 ( .pReset ( pReset ) , 
    .prog_clk ( prog_clk ) , .ccff_head ( ccff_head ) , 
    .ccff_tail ( mux_tree_tapbuf_size4_mem_0_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size4_0_sram ) ) ;
sb_2__2__mux_tree_tapbuf_size4_mem_1 mem_bottom_track_3 ( .pReset ( pReset ) , 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size4_mem_0_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size4_mem_1_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size4_1_sram ) ) ;
sb_2__2__mux_tree_tapbuf_size4_mem_2 mem_bottom_track_5 ( .pReset ( pReset ) , 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size4_mem_1_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size4_mem_2_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size4_2_sram ) ) ;
sb_2__2__mux_tree_tapbuf_size4_mem_3 mem_bottom_track_7 ( .pReset ( pReset ) , 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size4_mem_2_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size4_mem_3_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size4_3_sram ) ) ;
sb_2__2__mux_tree_tapbuf_size4_mem_4 mem_bottom_track_9 ( .pReset ( pReset ) , 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size4_mem_3_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size4_mem_4_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size4_4_sram ) ) ;
sb_2__2__mux_tree_tapbuf_size4_mem_5 mem_bottom_track_11 ( 
    .pReset ( pReset ) , .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size4_mem_4_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size4_mem_5_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size4_5_sram ) ) ;
sb_2__2__mux_tree_tapbuf_size4_mem_6 mem_left_track_1 ( .pReset ( pReset ) , 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size2_mem_14_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size4_mem_6_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size4_6_sram ) ) ;
sb_2__2__mux_tree_tapbuf_size4_mem_7 mem_left_track_3 ( .pReset ( pReset ) , 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size4_mem_6_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size4_mem_7_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size4_7_sram ) ) ;
sb_2__2__mux_tree_tapbuf_size4_mem_8 mem_left_track_5 ( .pReset ( pReset ) , 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size4_mem_7_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size4_mem_8_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size4_8_sram ) ) ;
sb_2__2__mux_tree_tapbuf_size4_mem_9 mem_left_track_7 ( .pReset ( pReset ) , 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size4_mem_8_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size4_mem_9_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size4_9_sram ) ) ;
sb_2__2__mux_tree_tapbuf_size4_mem_10 mem_left_track_9 ( .pReset ( pReset ) , 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size4_mem_9_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size4_mem_10_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size4_10_sram ) ) ;
sb_2__2__mux_tree_tapbuf_size4_mem mem_left_track_11 ( .pReset ( pReset ) , 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size4_mem_10_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size4_mem_11_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size4_11_sram ) ) ;
sb_2__2__mux_tree_tapbuf_size2_0 mux_bottom_track_13 (
    .in ( { bottom_right_grid_pin_1_[0] , chanx_left_in[7] } ) ,
    .sram ( mux_tree_tapbuf_size2_0_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_37 , SYNOPSYS_UNCONNECTED_38 } ) ,
    .out ( chany_bottom_out[6] ) , .p0 ( optlc_net_152 ) ) ;
sb_2__2__mux_tree_tapbuf_size2_1 mux_bottom_track_15 (
    .in ( { bottom_left_grid_pin_44_[0] , chanx_left_in[8] } ) ,
    .sram ( mux_tree_tapbuf_size2_1_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_39 , SYNOPSYS_UNCONNECTED_40 } ) ,
    .out ( chany_bottom_out[7] ) , .p0 ( optlc_net_152 ) ) ;
sb_2__2__mux_tree_tapbuf_size2_2 mux_bottom_track_17 (
    .in ( { bottom_left_grid_pin_45_[0] , chanx_left_in[9] } ) ,
    .sram ( mux_tree_tapbuf_size2_2_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_41 , SYNOPSYS_UNCONNECTED_42 } ) ,
    .out ( chany_bottom_out[8] ) , .p0 ( optlc_net_151 ) ) ;
sb_2__2__mux_tree_tapbuf_size2_3 mux_bottom_track_19 (
    .in ( { bottom_left_grid_pin_46_[0] , chanx_left_in[10] } ) ,
    .sram ( mux_tree_tapbuf_size2_3_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_43 , SYNOPSYS_UNCONNECTED_44 } ) ,
    .out ( chany_bottom_out[9] ) , .p0 ( optlc_net_151 ) ) ;
sb_2__2__mux_tree_tapbuf_size2_4 mux_bottom_track_21 (
    .in ( { bottom_left_grid_pin_47_[0] , chanx_left_in[11] } ) ,
    .sram ( mux_tree_tapbuf_size2_4_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_45 , SYNOPSYS_UNCONNECTED_46 } ) ,
    .out ( chany_bottom_out[10] ) , .p0 ( optlc_net_151 ) ) ;
sb_2__2__mux_tree_tapbuf_size2_5 mux_bottom_track_23 (
    .in ( { bottom_left_grid_pin_48_[0] , chanx_left_in[12] } ) ,
    .sram ( mux_tree_tapbuf_size2_5_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_47 , SYNOPSYS_UNCONNECTED_48 } ) ,
    .out ( chany_bottom_out[11] ) , .p0 ( optlc_net_154 ) ) ;
sb_2__2__mux_tree_tapbuf_size2_6 mux_bottom_track_25 (
    .in ( { bottom_left_grid_pin_49_[0] , chanx_left_in[13] } ) ,
    .sram ( mux_tree_tapbuf_size2_6_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_49 , SYNOPSYS_UNCONNECTED_50 } ) ,
    .out ( chany_bottom_out[12] ) , .p0 ( optlc_net_151 ) ) ;
sb_2__2__mux_tree_tapbuf_size2_7 mux_bottom_track_27 (
    .in ( { bottom_left_grid_pin_50_[0] , chanx_left_in[14] } ) ,
    .sram ( mux_tree_tapbuf_size2_7_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_51 , SYNOPSYS_UNCONNECTED_52 } ) ,
    .out ( chany_bottom_out[13] ) , .p0 ( optlc_net_151 ) ) ;
sb_2__2__mux_tree_tapbuf_size2_8 mux_bottom_track_39 (
    .in ( { bottom_left_grid_pin_44_[0] , chanx_left_in[20] } ) ,
    .sram ( mux_tree_tapbuf_size2_8_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_53 , SYNOPSYS_UNCONNECTED_54 } ) ,
    .out ( chany_bottom_out[19] ) , .p0 ( optlc_net_152 ) ) ;
sb_2__2__mux_tree_tapbuf_size2_9 mux_bottom_track_41 (
    .in ( { bottom_left_grid_pin_45_[0] , chanx_left_in[21] } ) ,
    .sram ( mux_tree_tapbuf_size2_9_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_55 , SYNOPSYS_UNCONNECTED_56 } ) ,
    .out ( chany_bottom_out[20] ) , .p0 ( optlc_net_152 ) ) ;
sb_2__2__mux_tree_tapbuf_size2_10 mux_bottom_track_43 (
    .in ( { bottom_left_grid_pin_46_[0] , chanx_left_in[22] } ) ,
    .sram ( mux_tree_tapbuf_size2_10_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_57 , SYNOPSYS_UNCONNECTED_58 } ) ,
    .out ( chany_bottom_out[21] ) , .p0 ( optlc_net_152 ) ) ;
sb_2__2__mux_tree_tapbuf_size2_11 mux_bottom_track_47 (
    .in ( { bottom_left_grid_pin_48_[0] , chanx_left_in[24] } ) ,
    .sram ( mux_tree_tapbuf_size2_11_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_59 , SYNOPSYS_UNCONNECTED_60 } ) ,
    .out ( chany_bottom_out[23] ) , .p0 ( optlc_net_155 ) ) ;
sb_2__2__mux_tree_tapbuf_size2_12 mux_bottom_track_49 (
    .in ( { bottom_left_grid_pin_49_[0] , chanx_left_in[25] } ) ,
    .sram ( mux_tree_tapbuf_size2_12_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_61 , SYNOPSYS_UNCONNECTED_62 } ) ,
    .out ( chany_bottom_out[24] ) , .p0 ( optlc_net_154 ) ) ;
sb_2__2__mux_tree_tapbuf_size2_13 mux_bottom_track_51 (
    .in ( { bottom_left_grid_pin_50_[0] , chanx_left_in[26] } ) ,
    .sram ( mux_tree_tapbuf_size2_13_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_63 , SYNOPSYS_UNCONNECTED_64 } ) ,
    .out ( chany_bottom_out[25] ) , .p0 ( optlc_net_151 ) ) ;
sb_2__2__mux_tree_tapbuf_size2_14 mux_bottom_track_53 (
    .in ( { bottom_left_grid_pin_51_[0] , chanx_left_in[27] } ) ,
    .sram ( mux_tree_tapbuf_size2_14_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_65 , SYNOPSYS_UNCONNECTED_66 } ) ,
    .out ( chany_bottom_out[26] ) , .p0 ( optlc_net_151 ) ) ;
sb_2__2__mux_tree_tapbuf_size2_15 mux_left_track_13 (
    .in ( { chany_bottom_in[5] , left_top_grid_pin_1_[0] } ) ,
    .sram ( mux_tree_tapbuf_size2_15_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_67 , SYNOPSYS_UNCONNECTED_68 } ) ,
    .out ( chanx_left_out[6] ) , .p0 ( optlc_net_153 ) ) ;
sb_2__2__mux_tree_tapbuf_size2_16 mux_left_track_15 (
    .in ( { chany_bottom_in[6] , left_bottom_grid_pin_36_[0] } ) ,
    .sram ( mux_tree_tapbuf_size2_16_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_69 , SYNOPSYS_UNCONNECTED_70 } ) ,
    .out ( chanx_left_out[7] ) , .p0 ( optlc_net_152 ) ) ;
sb_2__2__mux_tree_tapbuf_size2_17 mux_left_track_17 (
    .in ( { chany_bottom_in[7] , left_bottom_grid_pin_37_[0] } ) ,
    .sram ( mux_tree_tapbuf_size2_17_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_71 , SYNOPSYS_UNCONNECTED_72 } ) ,
    .out ( chanx_left_out[8] ) , .p0 ( optlc_net_153 ) ) ;
sb_2__2__mux_tree_tapbuf_size2_18 mux_left_track_19 (
    .in ( { chany_bottom_in[8] , left_bottom_grid_pin_38_[0] } ) ,
    .sram ( mux_tree_tapbuf_size2_18_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_73 , SYNOPSYS_UNCONNECTED_74 } ) ,
    .out ( chanx_left_out[9] ) , .p0 ( optlc_net_152 ) ) ;
sb_2__2__mux_tree_tapbuf_size2_19 mux_left_track_21 (
    .in ( { chany_bottom_in[9] , left_bottom_grid_pin_39_[0] } ) ,
    .sram ( mux_tree_tapbuf_size2_19_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_75 , SYNOPSYS_UNCONNECTED_76 } ) ,
    .out ( chanx_left_out[10] ) , .p0 ( optlc_net_152 ) ) ;
sb_2__2__mux_tree_tapbuf_size2_20 mux_left_track_23 (
    .in ( { chany_bottom_in[10] , left_bottom_grid_pin_40_[0] } ) ,
    .sram ( mux_tree_tapbuf_size2_20_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_77 , SYNOPSYS_UNCONNECTED_78 } ) ,
    .out ( chanx_left_out[11] ) , .p0 ( optlc_net_152 ) ) ;
sb_2__2__mux_tree_tapbuf_size2_21 mux_left_track_25 (
    .in ( { chany_bottom_in[11] , left_bottom_grid_pin_41_[0] } ) ,
    .sram ( mux_tree_tapbuf_size2_21_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_79 , SYNOPSYS_UNCONNECTED_80 } ) ,
    .out ( chanx_left_out[12] ) , .p0 ( optlc_net_152 ) ) ;
sb_2__2__mux_tree_tapbuf_size2_22 mux_left_track_27 (
    .in ( { chany_bottom_in[12] , left_bottom_grid_pin_42_[0] } ) ,
    .sram ( mux_tree_tapbuf_size2_22_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_81 , SYNOPSYS_UNCONNECTED_82 } ) ,
    .out ( chanx_left_out[13] ) , .p0 ( optlc_net_152 ) ) ;
sb_2__2__mux_tree_tapbuf_size2_23 mux_left_track_31 (
    .in ( { chany_bottom_in[14] , left_bottom_grid_pin_36_[0] } ) ,
    .sram ( mux_tree_tapbuf_size2_23_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_83 , SYNOPSYS_UNCONNECTED_84 } ) ,
    .out ( chanx_left_out[15] ) , .p0 ( optlc_net_152 ) ) ;
sb_2__2__mux_tree_tapbuf_size2_24 mux_left_track_33 (
    .in ( { chany_bottom_in[15] , left_bottom_grid_pin_37_[0] } ) ,
    .sram ( mux_tree_tapbuf_size2_24_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_85 , SYNOPSYS_UNCONNECTED_86 } ) ,
    .out ( chanx_left_out[16] ) , .p0 ( optlc_net_153 ) ) ;
sb_2__2__mux_tree_tapbuf_size2_25 mux_left_track_35 (
    .in ( { chany_bottom_in[16] , left_bottom_grid_pin_38_[0] } ) ,
    .sram ( mux_tree_tapbuf_size2_25_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_87 , SYNOPSYS_UNCONNECTED_88 } ) ,
    .out ( chanx_left_out[17] ) , .p0 ( optlc_net_153 ) ) ;
sb_2__2__mux_tree_tapbuf_size2_26 mux_left_track_37 (
    .in ( { chany_bottom_in[17] , left_bottom_grid_pin_39_[0] } ) ,
    .sram ( mux_tree_tapbuf_size2_26_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_89 , SYNOPSYS_UNCONNECTED_90 } ) ,
    .out ( chanx_left_out[18] ) , .p0 ( optlc_net_153 ) ) ;
sb_2__2__mux_tree_tapbuf_size2_27 mux_left_track_39 (
    .in ( { chany_bottom_in[18] , left_bottom_grid_pin_40_[0] } ) ,
    .sram ( mux_tree_tapbuf_size2_27_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_91 , SYNOPSYS_UNCONNECTED_92 } ) ,
    .out ( chanx_left_out[19] ) , .p0 ( optlc_net_152 ) ) ;
sb_2__2__mux_tree_tapbuf_size2_28 mux_left_track_41 (
    .in ( { chany_bottom_in[19] , left_bottom_grid_pin_41_[0] } ) ,
    .sram ( mux_tree_tapbuf_size2_28_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_93 , SYNOPSYS_UNCONNECTED_94 } ) ,
    .out ( chanx_left_out[20] ) , .p0 ( optlc_net_152 ) ) ;
sb_2__2__mux_tree_tapbuf_size2_29 mux_left_track_43 (
    .in ( { chany_bottom_in[20] , left_bottom_grid_pin_42_[0] } ) ,
    .sram ( mux_tree_tapbuf_size2_29_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_95 , SYNOPSYS_UNCONNECTED_96 } ) ,
    .out ( chanx_left_out[21] ) , .p0 ( optlc_net_152 ) ) ;
sb_2__2__mux_tree_tapbuf_size2_30 mux_left_track_45 (
    .in ( { chany_bottom_in[21] , left_top_grid_pin_1_[0] } ) ,
    .sram ( mux_tree_tapbuf_size2_30_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_97 , SYNOPSYS_UNCONNECTED_98 } ) ,
    .out ( chanx_left_out[22] ) , .p0 ( optlc_net_153 ) ) ;
sb_2__2__mux_tree_tapbuf_size2_31 mux_left_track_47 (
    .in ( { chany_bottom_in[22] , left_bottom_grid_pin_36_[0] } ) ,
    .sram ( mux_tree_tapbuf_size2_31_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_99 , SYNOPSYS_UNCONNECTED_100 } ) ,
    .out ( chanx_left_out[23] ) , .p0 ( optlc_net_153 ) ) ;
sb_2__2__mux_tree_tapbuf_size2_32 mux_left_track_49 (
    .in ( { chany_bottom_in[23] , left_bottom_grid_pin_37_[0] } ) ,
    .sram ( mux_tree_tapbuf_size2_32_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_101 , SYNOPSYS_UNCONNECTED_102 } ) ,
    .out ( chanx_left_out[24] ) , .p0 ( optlc_net_151 ) ) ;
sb_2__2__mux_tree_tapbuf_size2_33 mux_left_track_51 (
    .in ( { chany_bottom_in[24] , left_bottom_grid_pin_38_[0] } ) ,
    .sram ( mux_tree_tapbuf_size2_33_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_103 , SYNOPSYS_UNCONNECTED_104 } ) ,
    .out ( chanx_left_out[25] ) , .p0 ( optlc_net_151 ) ) ;
sb_2__2__mux_tree_tapbuf_size2_34 mux_left_track_55 (
    .in ( { chany_bottom_in[26] , left_bottom_grid_pin_40_[0] } ) ,
    .sram ( mux_tree_tapbuf_size2_34_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_105 , SYNOPSYS_UNCONNECTED_106 } ) ,
    .out ( chanx_left_out[27] ) , .p0 ( optlc_net_151 ) ) ;
sb_2__2__mux_tree_tapbuf_size2_35 mux_left_track_57 (
    .in ( { chany_bottom_in[27] , left_bottom_grid_pin_41_[0] } ) ,
    .sram ( mux_tree_tapbuf_size2_35_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_107 , SYNOPSYS_UNCONNECTED_108 } ) ,
    .out ( chanx_left_out[28] ) , .p0 ( optlc_net_155 ) ) ;
sb_2__2__mux_tree_tapbuf_size2 mux_left_track_59 (
    .in ( { chany_bottom_in[28] , left_bottom_grid_pin_42_[0] } ) ,
    .sram ( mux_tree_tapbuf_size2_36_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_109 , SYNOPSYS_UNCONNECTED_110 } ) ,
    .out ( chanx_left_out[29] ) , .p0 ( optlc_net_155 ) ) ;
sb_2__2__mux_tree_tapbuf_size2_mem_0 mem_bottom_track_13 ( 
    .pReset ( pReset ) , .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size4_mem_5_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size2_mem_0_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size2_0_sram ) ) ;
sb_2__2__mux_tree_tapbuf_size2_mem_1 mem_bottom_track_15 ( 
    .pReset ( pReset ) , .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size2_mem_0_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size2_mem_1_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size2_1_sram ) ) ;
sb_2__2__mux_tree_tapbuf_size2_mem_2 mem_bottom_track_17 ( 
    .pReset ( pReset ) , .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size2_mem_1_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size2_mem_2_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size2_2_sram ) ) ;
sb_2__2__mux_tree_tapbuf_size2_mem_3 mem_bottom_track_19 ( 
    .pReset ( pReset ) , .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size2_mem_2_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size2_mem_3_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size2_3_sram ) ) ;
sb_2__2__mux_tree_tapbuf_size2_mem_4 mem_bottom_track_21 ( 
    .pReset ( pReset ) , .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size2_mem_3_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size2_mem_4_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size2_4_sram ) ) ;
sb_2__2__mux_tree_tapbuf_size2_mem_5 mem_bottom_track_23 ( 
    .pReset ( pReset ) , .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size2_mem_4_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size2_mem_5_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size2_5_sram ) ) ;
sb_2__2__mux_tree_tapbuf_size2_mem_6 mem_bottom_track_25 ( 
    .pReset ( pReset ) , .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size2_mem_5_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size2_mem_6_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size2_6_sram ) ) ;
sb_2__2__mux_tree_tapbuf_size2_mem_7 mem_bottom_track_27 ( 
    .pReset ( pReset ) , .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size2_mem_6_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size2_mem_7_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size2_7_sram ) ) ;
sb_2__2__mux_tree_tapbuf_size2_mem_8 mem_bottom_track_39 ( 
    .pReset ( pReset ) , .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size3_mem_0_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size2_mem_8_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size2_8_sram ) ) ;
sb_2__2__mux_tree_tapbuf_size2_mem_9 mem_bottom_track_41 ( 
    .pReset ( pReset ) , .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size2_mem_8_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size2_mem_9_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size2_9_sram ) ) ;
sb_2__2__mux_tree_tapbuf_size2_mem_10 mem_bottom_track_43 ( 
    .pReset ( pReset ) , .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size2_mem_9_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size2_mem_10_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size2_10_sram ) ) ;
sb_2__2__mux_tree_tapbuf_size2_mem_11 mem_bottom_track_47 ( 
    .pReset ( pReset ) , .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size3_mem_1_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size2_mem_11_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size2_11_sram ) ) ;
sb_2__2__mux_tree_tapbuf_size2_mem_12 mem_bottom_track_49 ( 
    .pReset ( pReset ) , .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size2_mem_11_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size2_mem_12_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size2_12_sram ) ) ;
sb_2__2__mux_tree_tapbuf_size2_mem_13 mem_bottom_track_51 ( 
    .pReset ( pReset ) , .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size2_mem_12_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size2_mem_13_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size2_13_sram ) ) ;
sb_2__2__mux_tree_tapbuf_size2_mem_14 mem_bottom_track_53 ( 
    .pReset ( pReset ) , .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size2_mem_13_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size2_mem_14_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size2_14_sram ) ) ;
sb_2__2__mux_tree_tapbuf_size2_mem_15 mem_left_track_13 ( .pReset ( pReset ) , 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size4_mem_11_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size2_mem_15_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size2_15_sram ) ) ;
sb_2__2__mux_tree_tapbuf_size2_mem_16 mem_left_track_15 ( .pReset ( pReset ) , 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size2_mem_15_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size2_mem_16_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size2_16_sram ) ) ;
sb_2__2__mux_tree_tapbuf_size2_mem_17 mem_left_track_17 ( .pReset ( pReset ) , 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size2_mem_16_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size2_mem_17_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size2_17_sram ) ) ;
sb_2__2__mux_tree_tapbuf_size2_mem_18 mem_left_track_19 ( .pReset ( pReset ) , 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size2_mem_17_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size2_mem_18_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size2_18_sram ) ) ;
sb_2__2__mux_tree_tapbuf_size2_mem_19 mem_left_track_21 ( .pReset ( pReset ) , 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size2_mem_18_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size2_mem_19_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size2_19_sram ) ) ;
sb_2__2__mux_tree_tapbuf_size2_mem_20 mem_left_track_23 ( .pReset ( pReset ) , 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size2_mem_19_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size2_mem_20_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size2_20_sram ) ) ;
sb_2__2__mux_tree_tapbuf_size2_mem_21 mem_left_track_25 ( .pReset ( pReset ) , 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size2_mem_20_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size2_mem_21_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size2_21_sram ) ) ;
sb_2__2__mux_tree_tapbuf_size2_mem_22 mem_left_track_27 ( .pReset ( pReset ) , 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size2_mem_21_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size2_mem_22_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size2_22_sram ) ) ;
sb_2__2__mux_tree_tapbuf_size2_mem_23 mem_left_track_31 ( .pReset ( pReset ) , 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size3_mem_2_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size2_mem_23_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size2_23_sram ) ) ;
sb_2__2__mux_tree_tapbuf_size2_mem_24 mem_left_track_33 ( .pReset ( pReset ) , 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size2_mem_23_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size2_mem_24_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size2_24_sram ) ) ;
sb_2__2__mux_tree_tapbuf_size2_mem_25 mem_left_track_35 ( .pReset ( pReset ) , 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size2_mem_24_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size2_mem_25_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size2_25_sram ) ) ;
sb_2__2__mux_tree_tapbuf_size2_mem_26 mem_left_track_37 ( .pReset ( pReset ) , 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size2_mem_25_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size2_mem_26_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size2_26_sram ) ) ;
sb_2__2__mux_tree_tapbuf_size2_mem_27 mem_left_track_39 ( .pReset ( pReset ) , 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size2_mem_26_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size2_mem_27_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size2_27_sram ) ) ;
sb_2__2__mux_tree_tapbuf_size2_mem_28 mem_left_track_41 ( .pReset ( pReset ) , 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size2_mem_27_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size2_mem_28_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size2_28_sram ) ) ;
sb_2__2__mux_tree_tapbuf_size2_mem_29 mem_left_track_43 ( .pReset ( pReset ) , 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size2_mem_28_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size2_mem_29_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size2_29_sram ) ) ;
sb_2__2__mux_tree_tapbuf_size2_mem_30 mem_left_track_45 ( .pReset ( pReset ) , 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size2_mem_29_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size2_mem_30_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size2_30_sram ) ) ;
sb_2__2__mux_tree_tapbuf_size2_mem_31 mem_left_track_47 ( .pReset ( pReset ) , 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size2_mem_30_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size2_mem_31_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size2_31_sram ) ) ;
sb_2__2__mux_tree_tapbuf_size2_mem_32 mem_left_track_49 ( .pReset ( pReset ) , 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size2_mem_31_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size2_mem_32_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size2_32_sram ) ) ;
sb_2__2__mux_tree_tapbuf_size2_mem_33 mem_left_track_51 ( .pReset ( pReset ) , 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size2_mem_32_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size2_mem_33_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size2_33_sram ) ) ;
sb_2__2__mux_tree_tapbuf_size2_mem_34 mem_left_track_55 ( .pReset ( pReset ) , 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size3_mem_3_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size2_mem_34_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size2_34_sram ) ) ;
sb_2__2__mux_tree_tapbuf_size2_mem_35 mem_left_track_57 ( .pReset ( pReset ) , 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size2_mem_34_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size2_mem_35_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size2_35_sram ) ) ;
sb_2__2__mux_tree_tapbuf_size2_mem mem_left_track_59 ( .pReset ( pReset ) , 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size2_mem_35_ccff_tail ) , 
    .ccff_tail ( ccff_tail ) , .mem_out ( mux_tree_tapbuf_size2_36_sram ) ) ;
sb_2__2__mux_tree_tapbuf_size3_0 mux_bottom_track_29 (
    .in ( { bottom_right_grid_pin_1_[0] , bottom_left_grid_pin_51_[0] , 
        chanx_left_in[15] } ) ,
    .sram ( mux_tree_tapbuf_size3_0_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_111 , SYNOPSYS_UNCONNECTED_112 } ) ,
    .out ( chany_bottom_out[14] ) , .p0 ( optlc_net_154 ) ) ;
sb_2__2__mux_tree_tapbuf_size3_1 mux_bottom_track_45 (
    .in ( { bottom_right_grid_pin_1_[0] , bottom_left_grid_pin_47_[0] , 
        chanx_left_in[23] } ) ,
    .sram ( mux_tree_tapbuf_size3_1_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_113 , SYNOPSYS_UNCONNECTED_114 } ) ,
    .out ( chany_bottom_out[22] ) , .p0 ( optlc_net_155 ) ) ;
sb_2__2__mux_tree_tapbuf_size3_2 mux_left_track_29 (
    .in ( { chany_bottom_in[13] , left_top_grid_pin_1_[0] , 
        left_bottom_grid_pin_43_[0] } ) ,
    .sram ( mux_tree_tapbuf_size3_2_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_115 , SYNOPSYS_UNCONNECTED_116 } ) ,
    .out ( chanx_left_out[14] ) , .p0 ( optlc_net_153 ) ) ;
sb_2__2__mux_tree_tapbuf_size3 mux_left_track_53 (
    .in ( { chany_bottom_in[25] , left_bottom_grid_pin_39_[0] , 
        left_bottom_grid_pin_43_[0] } ) ,
    .sram ( mux_tree_tapbuf_size3_3_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_117 , SYNOPSYS_UNCONNECTED_118 } ) ,
    .out ( chanx_left_out[26] ) , .p0 ( optlc_net_151 ) ) ;
sb_2__2__mux_tree_tapbuf_size3_mem_0 mem_bottom_track_29 ( 
    .pReset ( pReset ) , .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size2_mem_7_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size3_mem_0_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size3_0_sram ) ) ;
sb_2__2__mux_tree_tapbuf_size3_mem_1 mem_bottom_track_45 ( 
    .pReset ( pReset ) , .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size2_mem_10_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size3_mem_1_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size3_1_sram ) ) ;
sb_2__2__mux_tree_tapbuf_size3_mem_2 mem_left_track_29 ( .pReset ( pReset ) , 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size2_mem_22_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size3_mem_2_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size3_2_sram ) ) ;
sb_2__2__mux_tree_tapbuf_size3_mem mem_left_track_53 ( .pReset ( pReset ) , 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size2_mem_33_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size3_mem_3_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size3_3_sram ) ) ;
sky130_fd_sc_hd__buf_8 pReset_FTB00 ( .A ( pReset_W_in ) , .X ( pReset[0] ) ) ;
sky130_fd_sc_hd__buf_1 prog_clk_0_FTB00 ( .A ( prog_clk_0_S_in ) , 
    .X ( prog_clk[0] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_54__53 ( .A ( chanx_left_in[0] ) , 
    .X ( chany_bottom_out[29] ) ) ;
sky130_fd_sc_hd__buf_6 FTB_55__54 ( .A ( chanx_left_in[16] ) , 
    .X ( ropt_net_177 ) ) ;
sky130_fd_sc_hd__buf_8 FTB_56__55 ( .A ( chanx_left_in[17] ) , 
    .X ( chany_bottom_out[16] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_57__56 ( .A ( chanx_left_in[18] ) , 
    .X ( chany_bottom_out[17] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_58__57 ( .A ( chanx_left_in[19] ) , 
    .X ( chany_bottom_out[18] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_59__58 ( .A ( chanx_left_in[28] ) , 
    .X ( chany_bottom_out[27] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_60__59 ( .A ( chanx_left_in[29] ) , 
    .X ( chany_bottom_out[28] ) ) ;
sky130_fd_sc_hd__buf_6 FTB_61__60 ( .A ( SC_IN_BOT ) , .X ( SC_OUT_BOT ) ) ;
sky130_fd_sc_hd__conb_1 optlc_153 ( .LO ( SYNOPSYS_UNCONNECTED_119 ) , 
    .HI ( optlc_net_151 ) ) ;
sky130_fd_sc_hd__conb_1 optlc_158 ( .LO ( SYNOPSYS_UNCONNECTED_120 ) , 
    .HI ( optlc_net_152 ) ) ;
sky130_fd_sc_hd__conb_1 optlc_160 ( .LO ( SYNOPSYS_UNCONNECTED_121 ) , 
    .HI ( optlc_net_153 ) ) ;
sky130_fd_sc_hd__conb_1 optlc_162 ( .LO ( SYNOPSYS_UNCONNECTED_122 ) , 
    .HI ( optlc_net_154 ) ) ;
sky130_fd_sc_hd__conb_1 optlc_164 ( .LO ( SYNOPSYS_UNCONNECTED_123 ) , 
    .HI ( optlc_net_155 ) ) ;
sky130_fd_sc_hd__buf_8 ropt_mt_inst_1347 ( .A ( ropt_net_177 ) , 
    .X ( chany_bottom_out[15] ) ) ;
endmodule


