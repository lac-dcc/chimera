// This program was cloned from: https://github.com/lnis-uofu/SOFA
// License: MIT License

//
//
//
//
//
//
module cby_2__1__EMBEDDED_IO_HD_sky130_fd_sc_hd__dfxtp_1_mem ( prog_clk , 
    ccff_head , ccff_tail , mem_out ) ;
input  [0:0] prog_clk ;
input  [0:0] ccff_head ;
output [0:0] ccff_tail ;
output [0:0] mem_out ;

wire copt_net_88 ;

sky130_fd_sc_hd__dfxtp_1 sky130_fd_sc_hd__dfxtp_1_0_ ( .D ( ccff_head[0] ) , 
    .CLK ( prog_clk[0] ) , .Q ( copt_net_88 ) ) ;
sky130_fd_sc_hd__buf_6 FTB_18__17 ( .A ( copt_net_89 ) , .X ( ccff_tail[0] ) ) ;
sky130_fd_sc_hd__dlygate4sd3_1 copt_h_inst_1308 ( .A ( copt_net_88 ) , 
    .X ( copt_net_86 ) ) ;
sky130_fd_sc_hd__dlygate4sd3_1 copt_h_inst_1309 ( .A ( copt_net_86 ) , 
    .X ( copt_net_87 ) ) ;
sky130_fd_sc_hd__dlygate4sd3_1 copt_h_inst_1310 ( .A ( copt_net_87 ) , 
    .X ( mem_out[0] ) ) ;
sky130_fd_sc_hd__buf_1 copt_h_inst_1311 ( .A ( mem_out[0] ) , 
    .X ( copt_net_89 ) ) ;
endmodule


module cby_2__1__EMBEDDED_IO_HD ( SOC_IN , SOC_OUT , SOC_DIR , FPGA_IN , 
    FPGA_OUT , FPGA_DIR , IO_ISOL_N ) ;
input  SOC_IN ;
output SOC_OUT ;
output SOC_DIR ;
output FPGA_IN ;
input  FPGA_OUT ;
input  FPGA_DIR ;
input  IO_ISOL_N ;

sky130_fd_sc_hd__nand2b_1 ISOL_EN_GATE ( .A_N ( FPGA_DIR ) , 
    .B ( IO_ISOL_N ) , .Y ( aps_rename_505_ ) ) ;
sky130_fd_sc_hd__inv_1 INV_SOC_DIR ( .A ( BUF_net_59 ) , .Y ( SOC_DIR_N ) ) ;
sky130_fd_sc_hd__ebufn_4 IN_PROTECT_GATE ( .A ( SOC_IN ) , 
    .TE_B ( SOC_DIR_N ) , .Z ( FPGA_IN ) ) ;
sky130_fd_sc_hd__ebufn_4 OUT_PROTECT_GATE ( .A ( FPGA_OUT ) , 
    .TE_B ( BUF_net_59 ) , .Z ( SOC_OUT ) ) ;
sky130_fd_sc_hd__inv_4 BINV_R_59 ( .A ( BUF_net_61 ) , .Y ( BUF_net_59 ) ) ;
sky130_fd_sc_hd__inv_1 BINV_R_61 ( .A ( aps_rename_505_ ) , 
    .Y ( BUF_net_61 ) ) ;
sky130_fd_sc_hd__inv_6 BINV_R_71 ( .A ( BUF_net_61 ) , .Y ( SOC_DIR ) ) ;
endmodule


module cby_2__1__logical_tile_io_mode_physical__iopad ( IO_ISOL_N , prog_clk , 
    gfpga_pad_EMBEDDED_IO_HD_SOC_IN , gfpga_pad_EMBEDDED_IO_HD_SOC_OUT , 
    gfpga_pad_EMBEDDED_IO_HD_SOC_DIR , iopad_outpad , ccff_head , 
    iopad_inpad , ccff_tail ) ;
input  [0:0] IO_ISOL_N ;
input  [0:0] prog_clk ;
input  [0:0] gfpga_pad_EMBEDDED_IO_HD_SOC_IN ;
output [0:0] gfpga_pad_EMBEDDED_IO_HD_SOC_OUT ;
output [0:0] gfpga_pad_EMBEDDED_IO_HD_SOC_DIR ;
input  [0:0] iopad_outpad ;
input  [0:0] ccff_head ;
output [0:0] iopad_inpad ;
output [0:0] ccff_tail ;

wire [0:0] EMBEDDED_IO_HD_0_en ;

cby_2__1__EMBEDDED_IO_HD EMBEDDED_IO_HD_0_ ( 
    .SOC_IN ( gfpga_pad_EMBEDDED_IO_HD_SOC_IN[0] ) , 
    .SOC_OUT ( gfpga_pad_EMBEDDED_IO_HD_SOC_OUT[0] ) , 
    .SOC_DIR ( gfpga_pad_EMBEDDED_IO_HD_SOC_DIR[0] ) , 
    .FPGA_IN ( iopad_inpad[0] ) , .FPGA_OUT ( iopad_outpad[0] ) , 
    .FPGA_DIR ( EMBEDDED_IO_HD_0_en[0] ) , .IO_ISOL_N ( IO_ISOL_N[0] ) ) ;
cby_2__1__EMBEDDED_IO_HD_sky130_fd_sc_hd__dfxtp_1_mem EMBEDDED_IO_HD_sky130_fd_sc_hd__dfxtp_1_mem ( 
    .prog_clk ( prog_clk ) , .ccff_head ( ccff_head ) , 
    .ccff_tail ( ccff_tail ) , .mem_out ( EMBEDDED_IO_HD_0_en ) ) ;
endmodule


module cby_2__1__logical_tile_io_mode_io_ ( IO_ISOL_N , prog_clk , 
    gfpga_pad_EMBEDDED_IO_HD_SOC_IN , gfpga_pad_EMBEDDED_IO_HD_SOC_OUT , 
    gfpga_pad_EMBEDDED_IO_HD_SOC_DIR , io_outpad , ccff_head , io_inpad , 
    ccff_tail ) ;
input  [0:0] IO_ISOL_N ;
input  [0:0] prog_clk ;
input  [0:0] gfpga_pad_EMBEDDED_IO_HD_SOC_IN ;
output [0:0] gfpga_pad_EMBEDDED_IO_HD_SOC_OUT ;
output [0:0] gfpga_pad_EMBEDDED_IO_HD_SOC_DIR ;
input  [0:0] io_outpad ;
input  [0:0] ccff_head ;
output [0:0] io_inpad ;
output [0:0] ccff_tail ;

cby_2__1__logical_tile_io_mode_physical__iopad logical_tile_io_mode_physical__iopad_0 ( 
    .IO_ISOL_N ( IO_ISOL_N ) , .prog_clk ( prog_clk ) , 
    .gfpga_pad_EMBEDDED_IO_HD_SOC_IN ( gfpga_pad_EMBEDDED_IO_HD_SOC_IN ) , 
    .gfpga_pad_EMBEDDED_IO_HD_SOC_OUT ( gfpga_pad_EMBEDDED_IO_HD_SOC_OUT ) , 
    .gfpga_pad_EMBEDDED_IO_HD_SOC_DIR ( gfpga_pad_EMBEDDED_IO_HD_SOC_DIR ) , 
    .iopad_outpad ( io_outpad ) , .ccff_head ( ccff_head ) , 
    .iopad_inpad ( io_inpad ) , .ccff_tail ( ccff_tail ) ) ;
endmodule


module cby_2__1__mux_tree_tapbuf_size8_mem ( prog_clk , ccff_head , 
    ccff_tail , mem_out ) ;
input  [0:0] prog_clk ;
input  [0:0] ccff_head ;
output [0:0] ccff_tail ;
output [0:3] mem_out ;

sky130_fd_sc_hd__dfxtp_1 sky130_fd_sc_hd__dfxtp_1_0_ ( .D ( ccff_head[0] ) , 
    .CLK ( prog_clk[0] ) , .Q ( mem_out[0] ) ) ;
sky130_fd_sc_hd__dfxtp_4 sky130_fd_sc_hd__dfxtp_1_1_ ( .D ( mem_out[0] ) , 
    .CLK ( prog_clk[0] ) , .Q ( mem_out[1] ) ) ;
sky130_fd_sc_hd__dfxtp_1 sky130_fd_sc_hd__dfxtp_1_2_ ( .D ( mem_out[1] ) , 
    .CLK ( prog_clk[0] ) , .Q ( mem_out[2] ) ) ;
sky130_fd_sc_hd__dfxtp_4 sky130_fd_sc_hd__dfxtp_1_3_ ( .D ( mem_out[2] ) , 
    .CLK ( prog_clk[0] ) , .Q ( mem_out[3] ) ) ;
sky130_fd_sc_hd__buf_1 FTB_17__16 ( .A ( mem_out[3] ) , .X ( ccff_tail[0] ) ) ;
endmodule


module cby_2__1__mux_tree_tapbuf_size8_mem_6 ( prog_clk , ccff_head , 
    ccff_tail , mem_out ) ;
input  [0:0] prog_clk ;
input  [0:0] ccff_head ;
output [0:0] ccff_tail ;
output [0:3] mem_out ;

sky130_fd_sc_hd__dfxtp_4 sky130_fd_sc_hd__dfxtp_1_0_ ( .D ( ccff_head[0] ) , 
    .CLK ( prog_clk[0] ) , .Q ( mem_out[0] ) ) ;
sky130_fd_sc_hd__dfxtp_1 sky130_fd_sc_hd__dfxtp_1_1_ ( .D ( mem_out[0] ) , 
    .CLK ( prog_clk[0] ) , .Q ( mem_out[1] ) ) ;
sky130_fd_sc_hd__dfxtp_4 sky130_fd_sc_hd__dfxtp_1_2_ ( .D ( mem_out[1] ) , 
    .CLK ( prog_clk[0] ) , .Q ( mem_out[2] ) ) ;
sky130_fd_sc_hd__dfxtp_1 sky130_fd_sc_hd__dfxtp_1_3_ ( .D ( mem_out[2] ) , 
    .CLK ( prog_clk[0] ) , .Q ( mem_out[3] ) ) ;
sky130_fd_sc_hd__buf_1 FTB_16__15 ( .A ( mem_out[3] ) , .X ( ccff_tail[0] ) ) ;
endmodule


module cby_2__1__mux_tree_tapbuf_size8_mem_5 ( prog_clk , ccff_head , 
    ccff_tail , mem_out ) ;
input  [0:0] prog_clk ;
input  [0:0] ccff_head ;
output [0:0] ccff_tail ;
output [0:3] mem_out ;

sky130_fd_sc_hd__dfxtp_1 sky130_fd_sc_hd__dfxtp_1_0_ ( .D ( ccff_head[0] ) , 
    .CLK ( prog_clk[0] ) , .Q ( mem_out[0] ) ) ;
sky130_fd_sc_hd__dfxtp_2 sky130_fd_sc_hd__dfxtp_1_1_ ( .D ( mem_out[0] ) , 
    .CLK ( prog_clk[0] ) , .Q ( mem_out[1] ) ) ;
sky130_fd_sc_hd__dfxtp_1 sky130_fd_sc_hd__dfxtp_1_2_ ( .D ( mem_out[1] ) , 
    .CLK ( prog_clk[0] ) , .Q ( mem_out[2] ) ) ;
sky130_fd_sc_hd__dfxtp_1 sky130_fd_sc_hd__dfxtp_1_3_ ( .D ( mem_out[2] ) , 
    .CLK ( prog_clk[0] ) , .Q ( mem_out[3] ) ) ;
sky130_fd_sc_hd__buf_1 FTB_15__14 ( .A ( mem_out[3] ) , .X ( ccff_tail[0] ) ) ;
endmodule


module cby_2__1__mux_tree_tapbuf_size8_mem_4 ( prog_clk , ccff_head , 
    ccff_tail , mem_out ) ;
input  [0:0] prog_clk ;
input  [0:0] ccff_head ;
output [0:0] ccff_tail ;
output [0:3] mem_out ;

sky130_fd_sc_hd__dfxtp_1 sky130_fd_sc_hd__dfxtp_1_0_ ( .D ( ccff_head[0] ) , 
    .CLK ( prog_clk[0] ) , .Q ( mem_out[0] ) ) ;
sky130_fd_sc_hd__dfxtp_1 sky130_fd_sc_hd__dfxtp_1_1_ ( .D ( mem_out[0] ) , 
    .CLK ( prog_clk[0] ) , .Q ( mem_out[1] ) ) ;
sky130_fd_sc_hd__dfxtp_1 sky130_fd_sc_hd__dfxtp_1_2_ ( .D ( mem_out[1] ) , 
    .CLK ( prog_clk[0] ) , .Q ( mem_out[2] ) ) ;
sky130_fd_sc_hd__dfxtp_1 sky130_fd_sc_hd__dfxtp_1_3_ ( .D ( mem_out[2] ) , 
    .CLK ( prog_clk[0] ) , .Q ( mem_out[3] ) ) ;
sky130_fd_sc_hd__buf_1 FTB_14__13 ( .A ( mem_out[3] ) , .X ( ccff_tail[0] ) ) ;
endmodule


module cby_2__1__mux_tree_tapbuf_size8_mem_3 ( prog_clk , ccff_head , 
    ccff_tail , mem_out ) ;
input  [0:0] prog_clk ;
input  [0:0] ccff_head ;
output [0:0] ccff_tail ;
output [0:3] mem_out ;

sky130_fd_sc_hd__dfxtp_1 sky130_fd_sc_hd__dfxtp_1_0_ ( .D ( ccff_head[0] ) , 
    .CLK ( prog_clk[0] ) , .Q ( mem_out[0] ) ) ;
sky130_fd_sc_hd__dfxtp_4 sky130_fd_sc_hd__dfxtp_1_1_ ( .D ( mem_out[0] ) , 
    .CLK ( prog_clk[0] ) , .Q ( mem_out[1] ) ) ;
sky130_fd_sc_hd__dfxtp_4 sky130_fd_sc_hd__dfxtp_1_2_ ( .D ( mem_out[1] ) , 
    .CLK ( prog_clk[0] ) , .Q ( mem_out[2] ) ) ;
sky130_fd_sc_hd__dfxtp_4 sky130_fd_sc_hd__dfxtp_1_3_ ( .D ( mem_out[2] ) , 
    .CLK ( prog_clk[0] ) , .Q ( mem_out[3] ) ) ;
sky130_fd_sc_hd__buf_1 FTB_13__12 ( .A ( mem_out[3] ) , .X ( ccff_tail[0] ) ) ;
endmodule


module cby_2__1__mux_tree_tapbuf_size8_mem_2 ( prog_clk , ccff_head , 
    ccff_tail , mem_out ) ;
input  [0:0] prog_clk ;
input  [0:0] ccff_head ;
output [0:0] ccff_tail ;
output [0:3] mem_out ;

sky130_fd_sc_hd__dfxtp_4 sky130_fd_sc_hd__dfxtp_1_0_ ( .D ( ccff_head[0] ) , 
    .CLK ( prog_clk[0] ) , .Q ( mem_out[0] ) ) ;
sky130_fd_sc_hd__dfxtp_4 sky130_fd_sc_hd__dfxtp_1_1_ ( .D ( mem_out[0] ) , 
    .CLK ( prog_clk[0] ) , .Q ( mem_out[1] ) ) ;
sky130_fd_sc_hd__dfxtp_4 sky130_fd_sc_hd__dfxtp_1_2_ ( .D ( mem_out[1] ) , 
    .CLK ( prog_clk[0] ) , .Q ( mem_out[2] ) ) ;
sky130_fd_sc_hd__dfxtp_4 sky130_fd_sc_hd__dfxtp_1_3_ ( .D ( mem_out[2] ) , 
    .CLK ( prog_clk[0] ) , .Q ( mem_out[3] ) ) ;
sky130_fd_sc_hd__buf_1 FTB_12__11 ( .A ( mem_out[3] ) , .X ( ccff_tail[0] ) ) ;
endmodule


module cby_2__1__mux_tree_tapbuf_size8_mem_1 ( prog_clk , ccff_head , 
    ccff_tail , mem_out ) ;
input  [0:0] prog_clk ;
input  [0:0] ccff_head ;
output [0:0] ccff_tail ;
output [0:3] mem_out ;

sky130_fd_sc_hd__dfxtp_1 sky130_fd_sc_hd__dfxtp_1_0_ ( .D ( ccff_head[0] ) , 
    .CLK ( prog_clk[0] ) , .Q ( mem_out[0] ) ) ;
sky130_fd_sc_hd__dfxtp_4 sky130_fd_sc_hd__dfxtp_1_1_ ( .D ( mem_out[0] ) , 
    .CLK ( prog_clk[0] ) , .Q ( mem_out[1] ) ) ;
sky130_fd_sc_hd__dfxtp_1 sky130_fd_sc_hd__dfxtp_1_2_ ( .D ( mem_out[1] ) , 
    .CLK ( prog_clk[0] ) , .Q ( mem_out[2] ) ) ;
sky130_fd_sc_hd__dfxtp_4 sky130_fd_sc_hd__dfxtp_1_3_ ( .D ( mem_out[2] ) , 
    .CLK ( prog_clk[0] ) , .Q ( mem_out[3] ) ) ;
sky130_fd_sc_hd__buf_1 FTB_11__10 ( .A ( mem_out[3] ) , .X ( ccff_tail[0] ) ) ;
endmodule


module cby_2__1__mux_tree_tapbuf_size8_mem_0 ( prog_clk , ccff_head , 
    ccff_tail , mem_out ) ;
input  [0:0] prog_clk ;
input  [0:0] ccff_head ;
output [0:0] ccff_tail ;
output [0:3] mem_out ;

sky130_fd_sc_hd__dfxtp_4 sky130_fd_sc_hd__dfxtp_1_0_ ( .D ( ccff_head[0] ) , 
    .CLK ( prog_clk[0] ) , .Q ( mem_out[0] ) ) ;
sky130_fd_sc_hd__dfxtp_4 sky130_fd_sc_hd__dfxtp_1_1_ ( .D ( mem_out[0] ) , 
    .CLK ( prog_clk[0] ) , .Q ( mem_out[1] ) ) ;
sky130_fd_sc_hd__dfxtp_1 sky130_fd_sc_hd__dfxtp_1_2_ ( .D ( mem_out[1] ) , 
    .CLK ( prog_clk[0] ) , .Q ( mem_out[2] ) ) ;
sky130_fd_sc_hd__dfxtp_4 sky130_fd_sc_hd__dfxtp_1_3_ ( .D ( mem_out[2] ) , 
    .CLK ( prog_clk[0] ) , .Q ( mem_out[3] ) ) ;
sky130_fd_sc_hd__buf_1 FTB_10__9 ( .A ( mem_out[3] ) , .X ( ccff_tail[0] ) ) ;
endmodule


module cby_2__1__const1 ( const1 ) ;
output [0:0] const1 ;

wire [0:0] const1_0 ;

assign const1_0[0] = 1'b1 ;
endmodule


module cby_2__1__mux_tree_tapbuf_size8 ( in , sram , sram_inv , out , p0 ) ;
input  [0:7] in ;
input  [0:3] sram ;
input  [0:3] sram_inv ;
output [0:0] out ;
input  p0 ;

wire [0:0] sky130_fd_sc_hd__mux2_1_0_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_1_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_2_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_3_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_4_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_5_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_6_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_7_X ;

cby_2__1__const1 const1_0_ (
    .const1 ( { SYNOPSYS_UNCONNECTED_1 } ) ) ;
sky130_fd_sc_hd__buf_6 sky130_fd_sc_hd__buf_4_0_ ( 
    .A ( sky130_fd_sc_hd__mux2_1_7_X[0] ) , .X ( out[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l1_in_0_ ( .A0 ( in[1] ) , .A1 ( in[0] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_0_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_0_ ( .A0 ( in[2] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_0_X[0] ) , .S ( sram[1] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_1_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_1_ ( .A0 ( in[4] ) , .A1 ( in[3] ) , 
    .S ( sram[1] ) , .X ( sky130_fd_sc_hd__mux2_1_2_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_2_ ( .A0 ( in[6] ) , .A1 ( in[5] ) , 
    .S ( sram[1] ) , .X ( sky130_fd_sc_hd__mux2_1_3_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_3_ ( .A0 ( p0 ) , .A1 ( in[7] ) , 
    .S ( sram[1] ) , .X ( sky130_fd_sc_hd__mux2_1_4_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l3_in_0_ ( 
    .A0 ( sky130_fd_sc_hd__mux2_1_2_X[0] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_1_X[0] ) , .S ( sram[2] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_5_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l3_in_1_ ( 
    .A0 ( sky130_fd_sc_hd__mux2_1_4_X[0] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_3_X[0] ) , .S ( sram[2] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_6_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l4_in_0_ ( 
    .A0 ( sky130_fd_sc_hd__mux2_1_6_X[0] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_5_X[0] ) , .S ( sram[3] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_7_X[0] ) ) ;
endmodule


module cby_2__1__const1_15 ( const1 ) ;
output [0:0] const1 ;

wire [0:0] const1_0 ;

assign const1_0[0] = 1'b1 ;
endmodule


module cby_2__1__mux_tree_tapbuf_size8_6 ( in , sram , sram_inv , out , p0 ) ;
input  [0:7] in ;
input  [0:3] sram ;
input  [0:3] sram_inv ;
output [0:0] out ;
input  p0 ;

wire [0:0] sky130_fd_sc_hd__mux2_1_0_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_1_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_2_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_3_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_4_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_5_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_6_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_7_X ;

cby_2__1__const1_15 const1_0_ (
    .const1 ( { SYNOPSYS_UNCONNECTED_1 } ) ) ;
sky130_fd_sc_hd__buf_6 sky130_fd_sc_hd__buf_4_0_ ( 
    .A ( sky130_fd_sc_hd__mux2_1_7_X[0] ) , .X ( out[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l1_in_0_ ( .A0 ( in[1] ) , .A1 ( in[0] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_0_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_0_ ( .A0 ( in[2] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_0_X[0] ) , .S ( sram[1] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_1_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_1_ ( .A0 ( in[4] ) , .A1 ( in[3] ) , 
    .S ( sram[1] ) , .X ( sky130_fd_sc_hd__mux2_1_2_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_2_ ( .A0 ( in[6] ) , .A1 ( in[5] ) , 
    .S ( sram[1] ) , .X ( sky130_fd_sc_hd__mux2_1_3_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_3_ ( .A0 ( p0 ) , .A1 ( in[7] ) , 
    .S ( sram[1] ) , .X ( sky130_fd_sc_hd__mux2_1_4_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l3_in_0_ ( 
    .A0 ( sky130_fd_sc_hd__mux2_1_2_X[0] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_1_X[0] ) , .S ( sram[2] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_5_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l3_in_1_ ( 
    .A0 ( sky130_fd_sc_hd__mux2_1_4_X[0] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_3_X[0] ) , .S ( sram[2] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_6_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l4_in_0_ ( 
    .A0 ( sky130_fd_sc_hd__mux2_1_6_X[0] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_5_X[0] ) , .S ( sram[3] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_7_X[0] ) ) ;
endmodule


module cby_2__1__const1_14 ( const1 ) ;
output [0:0] const1 ;

wire [0:0] const1_0 ;

assign const1_0[0] = 1'b1 ;
endmodule


module cby_2__1__mux_tree_tapbuf_size8_5 ( in , sram , sram_inv , out , p0 ) ;
input  [0:7] in ;
input  [0:3] sram ;
input  [0:3] sram_inv ;
output [0:0] out ;
input  p0 ;

wire [0:0] sky130_fd_sc_hd__mux2_1_0_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_1_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_2_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_3_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_4_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_5_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_6_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_7_X ;

cby_2__1__const1_14 const1_0_ (
    .const1 ( { SYNOPSYS_UNCONNECTED_1 } ) ) ;
sky130_fd_sc_hd__buf_6 sky130_fd_sc_hd__buf_4_0_ ( 
    .A ( sky130_fd_sc_hd__mux2_1_7_X[0] ) , .X ( out[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l1_in_0_ ( .A0 ( in[1] ) , .A1 ( in[0] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_0_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_0_ ( .A0 ( in[2] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_0_X[0] ) , .S ( sram[1] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_1_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_1_ ( .A0 ( in[4] ) , .A1 ( in[3] ) , 
    .S ( sram[1] ) , .X ( sky130_fd_sc_hd__mux2_1_2_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_2_ ( .A0 ( in[6] ) , .A1 ( in[5] ) , 
    .S ( sram[1] ) , .X ( sky130_fd_sc_hd__mux2_1_3_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_3_ ( .A0 ( p0 ) , .A1 ( in[7] ) , 
    .S ( sram[1] ) , .X ( sky130_fd_sc_hd__mux2_1_4_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l3_in_0_ ( 
    .A0 ( sky130_fd_sc_hd__mux2_1_2_X[0] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_1_X[0] ) , .S ( sram[2] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_5_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l3_in_1_ ( 
    .A0 ( sky130_fd_sc_hd__mux2_1_4_X[0] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_3_X[0] ) , .S ( sram[2] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_6_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l4_in_0_ ( 
    .A0 ( sky130_fd_sc_hd__mux2_1_6_X[0] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_5_X[0] ) , .S ( sram[3] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_7_X[0] ) ) ;
endmodule


module cby_2__1__const1_13 ( const1 ) ;
output [0:0] const1 ;

wire [0:0] const1_0 ;

assign const1_0[0] = 1'b1 ;
endmodule


module cby_2__1__mux_tree_tapbuf_size8_4 ( in , sram , sram_inv , out , p0 ) ;
input  [0:7] in ;
input  [0:3] sram ;
input  [0:3] sram_inv ;
output [0:0] out ;
input  p0 ;

wire [0:0] sky130_fd_sc_hd__mux2_1_0_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_1_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_2_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_3_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_4_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_5_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_6_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_7_X ;

cby_2__1__const1_13 const1_0_ (
    .const1 ( { SYNOPSYS_UNCONNECTED_1 } ) ) ;
sky130_fd_sc_hd__buf_6 sky130_fd_sc_hd__buf_4_0_ ( 
    .A ( sky130_fd_sc_hd__mux2_1_7_X[0] ) , .X ( out[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l1_in_0_ ( .A0 ( in[1] ) , .A1 ( in[0] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_0_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_0_ ( .A0 ( in[2] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_0_X[0] ) , .S ( sram[1] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_1_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_1_ ( .A0 ( in[4] ) , .A1 ( in[3] ) , 
    .S ( sram[1] ) , .X ( sky130_fd_sc_hd__mux2_1_2_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_2_ ( .A0 ( in[6] ) , .A1 ( in[5] ) , 
    .S ( sram[1] ) , .X ( sky130_fd_sc_hd__mux2_1_3_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_3_ ( .A0 ( p0 ) , .A1 ( in[7] ) , 
    .S ( sram[1] ) , .X ( sky130_fd_sc_hd__mux2_1_4_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l3_in_0_ ( 
    .A0 ( sky130_fd_sc_hd__mux2_1_2_X[0] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_1_X[0] ) , .S ( sram[2] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_5_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l3_in_1_ ( 
    .A0 ( sky130_fd_sc_hd__mux2_1_4_X[0] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_3_X[0] ) , .S ( sram[2] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_6_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l4_in_0_ ( 
    .A0 ( sky130_fd_sc_hd__mux2_1_6_X[0] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_5_X[0] ) , .S ( sram[3] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_7_X[0] ) ) ;
endmodule


module cby_2__1__const1_12 ( const1 ) ;
output [0:0] const1 ;

wire [0:0] const1_0 ;

assign const1_0[0] = 1'b1 ;
endmodule


module cby_2__1__mux_tree_tapbuf_size8_3 ( in , sram , sram_inv , out , p0 ) ;
input  [0:7] in ;
input  [0:3] sram ;
input  [0:3] sram_inv ;
output [0:0] out ;
input  p0 ;

wire [0:0] sky130_fd_sc_hd__mux2_1_0_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_1_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_2_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_3_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_4_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_5_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_6_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_7_X ;

cby_2__1__const1_12 const1_0_ (
    .const1 ( { SYNOPSYS_UNCONNECTED_1 } ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l1_in_0_ ( .A0 ( in[1] ) , .A1 ( in[0] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_0_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_0_ ( .A0 ( in[2] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_0_X[0] ) , .S ( sram[1] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_1_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_1_ ( .A0 ( in[4] ) , .A1 ( in[3] ) , 
    .S ( sram[1] ) , .X ( sky130_fd_sc_hd__mux2_1_2_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_2_ ( .A0 ( in[6] ) , .A1 ( in[5] ) , 
    .S ( sram[1] ) , .X ( sky130_fd_sc_hd__mux2_1_3_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_3_ ( .A0 ( p0 ) , .A1 ( in[7] ) , 
    .S ( sram[1] ) , .X ( sky130_fd_sc_hd__mux2_1_4_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l3_in_0_ ( 
    .A0 ( sky130_fd_sc_hd__mux2_1_2_X[0] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_1_X[0] ) , .S ( sram[2] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_5_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l3_in_1_ ( 
    .A0 ( sky130_fd_sc_hd__mux2_1_4_X[0] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_3_X[0] ) , .S ( sram[2] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_6_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l4_in_0_ ( 
    .A0 ( sky130_fd_sc_hd__mux2_1_6_X[0] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_5_X[0] ) , .S ( sram[3] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_7_X[0] ) ) ;
sky130_fd_sc_hd__buf_6 BUFT_RR_70 ( .A ( sky130_fd_sc_hd__mux2_1_7_X[0] ) , 
    .X ( out[0] ) ) ;
endmodule


module cby_2__1__const1_11 ( const1 ) ;
output [0:0] const1 ;

wire [0:0] const1_0 ;

assign const1_0[0] = 1'b1 ;
endmodule


module cby_2__1__mux_tree_tapbuf_size8_2 ( in , sram , sram_inv , out , p0 ) ;
input  [0:7] in ;
input  [0:3] sram ;
input  [0:3] sram_inv ;
output [0:0] out ;
input  p0 ;

wire [0:0] sky130_fd_sc_hd__mux2_1_0_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_1_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_2_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_3_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_4_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_5_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_6_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_7_X ;

cby_2__1__const1_11 const1_0_ (
    .const1 ( { SYNOPSYS_UNCONNECTED_1 } ) ) ;
sky130_fd_sc_hd__buf_6 sky130_fd_sc_hd__buf_4_0_ ( 
    .A ( sky130_fd_sc_hd__mux2_1_7_X[0] ) , .X ( out[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l1_in_0_ ( .A0 ( in[1] ) , .A1 ( in[0] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_0_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_0_ ( .A0 ( in[2] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_0_X[0] ) , .S ( sram[1] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_1_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_1_ ( .A0 ( in[4] ) , .A1 ( in[3] ) , 
    .S ( sram[1] ) , .X ( sky130_fd_sc_hd__mux2_1_2_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_2_ ( .A0 ( in[6] ) , .A1 ( in[5] ) , 
    .S ( sram[1] ) , .X ( sky130_fd_sc_hd__mux2_1_3_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_3_ ( .A0 ( p0 ) , .A1 ( in[7] ) , 
    .S ( sram[1] ) , .X ( sky130_fd_sc_hd__mux2_1_4_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l3_in_0_ ( 
    .A0 ( sky130_fd_sc_hd__mux2_1_2_X[0] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_1_X[0] ) , .S ( sram[2] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_5_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l3_in_1_ ( 
    .A0 ( sky130_fd_sc_hd__mux2_1_4_X[0] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_3_X[0] ) , .S ( sram[2] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_6_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l4_in_0_ ( 
    .A0 ( sky130_fd_sc_hd__mux2_1_6_X[0] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_5_X[0] ) , .S ( sram[3] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_7_X[0] ) ) ;
endmodule


module cby_2__1__const1_10 ( const1 ) ;
output [0:0] const1 ;

wire [0:0] const1_0 ;

assign const1_0[0] = 1'b1 ;
endmodule


module cby_2__1__mux_tree_tapbuf_size8_1 ( in , sram , sram_inv , out , p0 ) ;
input  [0:7] in ;
input  [0:3] sram ;
input  [0:3] sram_inv ;
output [0:0] out ;
input  p0 ;

wire [0:0] sky130_fd_sc_hd__mux2_1_0_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_1_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_2_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_3_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_4_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_5_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_6_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_7_X ;

cby_2__1__const1_10 const1_0_ (
    .const1 ( { SYNOPSYS_UNCONNECTED_1 } ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l1_in_0_ ( .A0 ( in[1] ) , .A1 ( in[0] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_0_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_0_ ( .A0 ( in[2] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_0_X[0] ) , .S ( sram[1] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_1_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_1_ ( .A0 ( in[4] ) , .A1 ( in[3] ) , 
    .S ( sram[1] ) , .X ( sky130_fd_sc_hd__mux2_1_2_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_2_ ( .A0 ( in[6] ) , .A1 ( in[5] ) , 
    .S ( sram[1] ) , .X ( sky130_fd_sc_hd__mux2_1_3_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_3_ ( .A0 ( p0 ) , .A1 ( in[7] ) , 
    .S ( sram[1] ) , .X ( sky130_fd_sc_hd__mux2_1_4_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l3_in_0_ ( 
    .A0 ( sky130_fd_sc_hd__mux2_1_2_X[0] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_1_X[0] ) , .S ( sram[2] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_5_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l3_in_1_ ( 
    .A0 ( sky130_fd_sc_hd__mux2_1_4_X[0] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_3_X[0] ) , .S ( sram[2] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_6_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l4_in_0_ ( 
    .A0 ( sky130_fd_sc_hd__mux2_1_6_X[0] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_5_X[0] ) , .S ( sram[3] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_7_X[0] ) ) ;
sky130_fd_sc_hd__buf_6 BUFT_RR_69 ( .A ( sky130_fd_sc_hd__mux2_1_7_X[0] ) , 
    .X ( out[0] ) ) ;
endmodule


module cby_2__1__const1_9 ( const1 ) ;
output [0:0] const1 ;

wire [0:0] const1_0 ;

assign const1_0[0] = 1'b1 ;
endmodule


module cby_2__1__mux_tree_tapbuf_size8_0 ( in , sram , sram_inv , out , p0 ) ;
input  [0:7] in ;
input  [0:3] sram ;
input  [0:3] sram_inv ;
output [0:0] out ;
input  p0 ;

wire [0:0] sky130_fd_sc_hd__mux2_1_0_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_1_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_2_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_3_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_4_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_5_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_6_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_7_X ;

cby_2__1__const1_9 const1_0_ (
    .const1 ( { SYNOPSYS_UNCONNECTED_1 } ) ) ;
sky130_fd_sc_hd__buf_6 sky130_fd_sc_hd__buf_4_0_ ( 
    .A ( sky130_fd_sc_hd__mux2_1_7_X[0] ) , .X ( out[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l1_in_0_ ( .A0 ( in[1] ) , .A1 ( in[0] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_0_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_0_ ( .A0 ( in[2] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_0_X[0] ) , .S ( sram[1] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_1_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_1_ ( .A0 ( in[4] ) , .A1 ( in[3] ) , 
    .S ( sram[1] ) , .X ( sky130_fd_sc_hd__mux2_1_2_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_2_ ( .A0 ( in[6] ) , .A1 ( in[5] ) , 
    .S ( sram[1] ) , .X ( sky130_fd_sc_hd__mux2_1_3_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_3_ ( .A0 ( p0 ) , .A1 ( in[7] ) , 
    .S ( sram[1] ) , .X ( sky130_fd_sc_hd__mux2_1_4_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l3_in_0_ ( 
    .A0 ( sky130_fd_sc_hd__mux2_1_2_X[0] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_1_X[0] ) , .S ( sram[2] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_5_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l3_in_1_ ( 
    .A0 ( sky130_fd_sc_hd__mux2_1_4_X[0] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_3_X[0] ) , .S ( sram[2] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_6_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l4_in_0_ ( 
    .A0 ( sky130_fd_sc_hd__mux2_1_6_X[0] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_5_X[0] ) , .S ( sram[3] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_7_X[0] ) ) ;
endmodule


module cby_2__1__mux_tree_tapbuf_size10_mem ( prog_clk , ccff_head , 
    ccff_tail , mem_out ) ;
input  [0:0] prog_clk ;
input  [0:0] ccff_head ;
output [0:0] ccff_tail ;
output [0:3] mem_out ;

sky130_fd_sc_hd__dfxtp_1 sky130_fd_sc_hd__dfxtp_1_0_ ( .D ( ccff_head[0] ) , 
    .CLK ( prog_clk[0] ) , .Q ( mem_out[0] ) ) ;
sky130_fd_sc_hd__dfxtp_4 sky130_fd_sc_hd__dfxtp_1_1_ ( .D ( mem_out[0] ) , 
    .CLK ( prog_clk[0] ) , .Q ( mem_out[1] ) ) ;
sky130_fd_sc_hd__dfxtp_4 sky130_fd_sc_hd__dfxtp_1_2_ ( .D ( mem_out[1] ) , 
    .CLK ( prog_clk[0] ) , .Q ( mem_out[2] ) ) ;
sky130_fd_sc_hd__dfxtp_4 sky130_fd_sc_hd__dfxtp_1_3_ ( .D ( mem_out[2] ) , 
    .CLK ( prog_clk[0] ) , .Q ( mem_out[3] ) ) ;
sky130_fd_sc_hd__buf_1 FTB_9__8 ( .A ( mem_out[3] ) , .X ( ccff_tail[0] ) ) ;
endmodule


module cby_2__1__mux_tree_tapbuf_size10_mem_7 ( prog_clk , ccff_head , 
    ccff_tail , mem_out ) ;
input  [0:0] prog_clk ;
input  [0:0] ccff_head ;
output [0:0] ccff_tail ;
output [0:3] mem_out ;

sky130_fd_sc_hd__dfxtp_2 sky130_fd_sc_hd__dfxtp_1_0_ ( .D ( ccff_head[0] ) , 
    .CLK ( prog_clk[0] ) , .Q ( mem_out[0] ) ) ;
sky130_fd_sc_hd__dfxtp_1 sky130_fd_sc_hd__dfxtp_1_1_ ( .D ( mem_out[0] ) , 
    .CLK ( prog_clk[0] ) , .Q ( mem_out[1] ) ) ;
sky130_fd_sc_hd__dfxtp_4 sky130_fd_sc_hd__dfxtp_1_2_ ( .D ( mem_out[1] ) , 
    .CLK ( prog_clk[0] ) , .Q ( mem_out[2] ) ) ;
sky130_fd_sc_hd__dfxtp_4 sky130_fd_sc_hd__dfxtp_1_3_ ( .D ( mem_out[2] ) , 
    .CLK ( prog_clk[0] ) , .Q ( mem_out[3] ) ) ;
sky130_fd_sc_hd__buf_1 FTB_8__7 ( .A ( mem_out[3] ) , .X ( ccff_tail[0] ) ) ;
endmodule


module cby_2__1__mux_tree_tapbuf_size10_mem_6 ( prog_clk , ccff_head , 
    ccff_tail , mem_out ) ;
input  [0:0] prog_clk ;
input  [0:0] ccff_head ;
output [0:0] ccff_tail ;
output [0:3] mem_out ;

sky130_fd_sc_hd__dfxtp_1 sky130_fd_sc_hd__dfxtp_1_0_ ( .D ( ccff_head[0] ) , 
    .CLK ( prog_clk[0] ) , .Q ( mem_out[0] ) ) ;
sky130_fd_sc_hd__dfxtp_1 sky130_fd_sc_hd__dfxtp_1_1_ ( .D ( mem_out[0] ) , 
    .CLK ( prog_clk[0] ) , .Q ( mem_out[1] ) ) ;
sky130_fd_sc_hd__dfxtp_1 sky130_fd_sc_hd__dfxtp_1_2_ ( .D ( mem_out[1] ) , 
    .CLK ( prog_clk[0] ) , .Q ( mem_out[2] ) ) ;
sky130_fd_sc_hd__dfxtp_1 sky130_fd_sc_hd__dfxtp_1_3_ ( .D ( mem_out[2] ) , 
    .CLK ( prog_clk[0] ) , .Q ( mem_out[3] ) ) ;
sky130_fd_sc_hd__buf_1 FTB_7__6 ( .A ( mem_out[3] ) , .X ( ccff_tail[0] ) ) ;
endmodule


module cby_2__1__mux_tree_tapbuf_size10_mem_5 ( prog_clk , ccff_head , 
    ccff_tail , mem_out ) ;
input  [0:0] prog_clk ;
input  [0:0] ccff_head ;
output [0:0] ccff_tail ;
output [0:3] mem_out ;

sky130_fd_sc_hd__dfxtp_4 sky130_fd_sc_hd__dfxtp_1_0_ ( .D ( ccff_head[0] ) , 
    .CLK ( prog_clk[0] ) , .Q ( mem_out[0] ) ) ;
sky130_fd_sc_hd__dfxtp_4 sky130_fd_sc_hd__dfxtp_1_1_ ( .D ( mem_out[0] ) , 
    .CLK ( prog_clk[0] ) , .Q ( mem_out[1] ) ) ;
sky130_fd_sc_hd__dfxtp_4 sky130_fd_sc_hd__dfxtp_1_2_ ( .D ( mem_out[1] ) , 
    .CLK ( prog_clk[0] ) , .Q ( mem_out[2] ) ) ;
sky130_fd_sc_hd__dfxtp_4 sky130_fd_sc_hd__dfxtp_1_3_ ( .D ( mem_out[2] ) , 
    .CLK ( prog_clk[0] ) , .Q ( mem_out[3] ) ) ;
sky130_fd_sc_hd__buf_1 FTB_6__5 ( .A ( mem_out[3] ) , .X ( ccff_tail[0] ) ) ;
endmodule


module cby_2__1__mux_tree_tapbuf_size10_mem_4 ( prog_clk , ccff_head , 
    ccff_tail , mem_out ) ;
input  [0:0] prog_clk ;
input  [0:0] ccff_head ;
output [0:0] ccff_tail ;
output [0:3] mem_out ;

sky130_fd_sc_hd__dfxtp_1 sky130_fd_sc_hd__dfxtp_1_0_ ( .D ( ccff_head[0] ) , 
    .CLK ( prog_clk[0] ) , .Q ( mem_out[0] ) ) ;
sky130_fd_sc_hd__dfxtp_4 sky130_fd_sc_hd__dfxtp_1_1_ ( .D ( mem_out[0] ) , 
    .CLK ( prog_clk[0] ) , .Q ( mem_out[1] ) ) ;
sky130_fd_sc_hd__dfxtp_4 sky130_fd_sc_hd__dfxtp_1_2_ ( .D ( mem_out[1] ) , 
    .CLK ( prog_clk[0] ) , .Q ( mem_out[2] ) ) ;
sky130_fd_sc_hd__dfxtp_4 sky130_fd_sc_hd__dfxtp_1_3_ ( .D ( mem_out[2] ) , 
    .CLK ( prog_clk[0] ) , .Q ( mem_out[3] ) ) ;
sky130_fd_sc_hd__buf_1 FTB_5__4 ( .A ( mem_out[3] ) , .X ( ccff_tail[0] ) ) ;
endmodule


module cby_2__1__mux_tree_tapbuf_size10_mem_3 ( prog_clk , ccff_head , 
    ccff_tail , mem_out ) ;
input  [0:0] prog_clk ;
input  [0:0] ccff_head ;
output [0:0] ccff_tail ;
output [0:3] mem_out ;

sky130_fd_sc_hd__dfxtp_1 sky130_fd_sc_hd__dfxtp_1_0_ ( .D ( ccff_head[0] ) , 
    .CLK ( prog_clk[0] ) , .Q ( mem_out[0] ) ) ;
sky130_fd_sc_hd__dfxtp_1 sky130_fd_sc_hd__dfxtp_1_1_ ( .D ( mem_out[0] ) , 
    .CLK ( prog_clk[0] ) , .Q ( mem_out[1] ) ) ;
sky130_fd_sc_hd__dfxtp_1 sky130_fd_sc_hd__dfxtp_1_2_ ( .D ( mem_out[1] ) , 
    .CLK ( prog_clk[0] ) , .Q ( mem_out[2] ) ) ;
sky130_fd_sc_hd__dfxtp_4 sky130_fd_sc_hd__dfxtp_1_3_ ( .D ( mem_out[2] ) , 
    .CLK ( prog_clk[0] ) , .Q ( mem_out[3] ) ) ;
sky130_fd_sc_hd__buf_1 FTB_4__3 ( .A ( mem_out[3] ) , .X ( ccff_tail[0] ) ) ;
endmodule


module cby_2__1__mux_tree_tapbuf_size10_mem_2 ( prog_clk , ccff_head , 
    ccff_tail , mem_out ) ;
input  [0:0] prog_clk ;
input  [0:0] ccff_head ;
output [0:0] ccff_tail ;
output [0:3] mem_out ;

sky130_fd_sc_hd__dfxtp_4 sky130_fd_sc_hd__dfxtp_1_0_ ( .D ( ccff_head[0] ) , 
    .CLK ( prog_clk[0] ) , .Q ( mem_out[0] ) ) ;
sky130_fd_sc_hd__dfxtp_4 sky130_fd_sc_hd__dfxtp_1_1_ ( .D ( mem_out[0] ) , 
    .CLK ( prog_clk[0] ) , .Q ( mem_out[1] ) ) ;
sky130_fd_sc_hd__dfxtp_4 sky130_fd_sc_hd__dfxtp_1_2_ ( .D ( mem_out[1] ) , 
    .CLK ( prog_clk[0] ) , .Q ( mem_out[2] ) ) ;
sky130_fd_sc_hd__dfxtp_4 sky130_fd_sc_hd__dfxtp_1_3_ ( .D ( mem_out[2] ) , 
    .CLK ( prog_clk[0] ) , .Q ( mem_out[3] ) ) ;
sky130_fd_sc_hd__buf_1 FTB_3__2 ( .A ( mem_out[3] ) , .X ( ccff_tail[0] ) ) ;
endmodule


module cby_2__1__mux_tree_tapbuf_size10_mem_1 ( prog_clk , ccff_head , 
    ccff_tail , mem_out ) ;
input  [0:0] prog_clk ;
input  [0:0] ccff_head ;
output [0:0] ccff_tail ;
output [0:3] mem_out ;

sky130_fd_sc_hd__dfxtp_4 sky130_fd_sc_hd__dfxtp_1_0_ ( .D ( ccff_head[0] ) , 
    .CLK ( prog_clk[0] ) , .Q ( mem_out[0] ) ) ;
sky130_fd_sc_hd__dfxtp_4 sky130_fd_sc_hd__dfxtp_1_1_ ( .D ( mem_out[0] ) , 
    .CLK ( prog_clk[0] ) , .Q ( mem_out[1] ) ) ;
sky130_fd_sc_hd__dfxtp_4 sky130_fd_sc_hd__dfxtp_1_2_ ( .D ( mem_out[1] ) , 
    .CLK ( prog_clk[0] ) , .Q ( mem_out[2] ) ) ;
sky130_fd_sc_hd__dfxtp_4 sky130_fd_sc_hd__dfxtp_1_3_ ( .D ( mem_out[2] ) , 
    .CLK ( prog_clk[0] ) , .Q ( mem_out[3] ) ) ;
sky130_fd_sc_hd__buf_1 FTB_2__1 ( .A ( mem_out[3] ) , .X ( ccff_tail[0] ) ) ;
endmodule


module cby_2__1__mux_tree_tapbuf_size10_mem_0 ( prog_clk , ccff_head , 
    ccff_tail , mem_out ) ;
input  [0:0] prog_clk ;
input  [0:0] ccff_head ;
output [0:0] ccff_tail ;
output [0:3] mem_out ;

sky130_fd_sc_hd__dfxtp_1 sky130_fd_sc_hd__dfxtp_1_0_ ( .D ( ropt_net_92 ) , 
    .CLK ( prog_clk[0] ) , .Q ( mem_out[0] ) ) ;
sky130_fd_sc_hd__dfxtp_1 sky130_fd_sc_hd__dfxtp_1_1_ ( .D ( mem_out[0] ) , 
    .CLK ( prog_clk[0] ) , .Q ( mem_out[1] ) ) ;
sky130_fd_sc_hd__dfxtp_4 sky130_fd_sc_hd__dfxtp_1_2_ ( .D ( mem_out[1] ) , 
    .CLK ( prog_clk[0] ) , .Q ( mem_out[2] ) ) ;
sky130_fd_sc_hd__dfxtp_1 sky130_fd_sc_hd__dfxtp_1_3_ ( .D ( mem_out[2] ) , 
    .CLK ( prog_clk[0] ) , .Q ( mem_out[3] ) ) ;
sky130_fd_sc_hd__buf_1 FTB_1__0 ( .A ( mem_out[3] ) , .X ( ccff_tail[0] ) ) ;
sky130_fd_sc_hd__dlygate4sd3_1 copt_h_inst_1301 ( .A ( ropt_net_94 ) , 
    .X ( copt_net_79 ) ) ;
sky130_fd_sc_hd__dlygate4sd3_1 copt_h_inst_1302 ( .A ( copt_net_79 ) , 
    .X ( copt_net_80 ) ) ;
sky130_fd_sc_hd__dlygate4sd3_1 copt_h_inst_1303 ( .A ( copt_net_80 ) , 
    .X ( copt_net_81 ) ) ;
sky130_fd_sc_hd__dlygate4sd3_1 copt_h_inst_1304 ( .A ( ccff_head[0] ) , 
    .X ( copt_net_82 ) ) ;
sky130_fd_sc_hd__dlygate4sd3_1 copt_h_inst_1305 ( .A ( copt_net_81 ) , 
    .X ( copt_net_83 ) ) ;
sky130_fd_sc_hd__dlygate4sd3_1 copt_h_inst_1306 ( .A ( copt_net_83 ) , 
    .X ( copt_net_84 ) ) ;
sky130_fd_sc_hd__dlygate4sd2_1 ropt_h_inst_1314 ( .A ( copt_net_84 ) , 
    .X ( ropt_net_92 ) ) ;
sky130_fd_sc_hd__dlygate4sd3_1 ropt_h_inst_1315 ( .A ( copt_net_82 ) , 
    .X ( ropt_net_93 ) ) ;
sky130_fd_sc_hd__dlygate4sd3_1 ropt_h_inst_1316 ( .A ( ropt_net_93 ) , 
    .X ( ropt_net_94 ) ) ;
endmodule


module cby_2__1__const1_8 ( const1 ) ;
output [0:0] const1 ;

wire [0:0] const1_0 ;

assign const1_0[0] = 1'b1 ;
endmodule


module cby_2__1__mux_tree_tapbuf_size10 ( in , sram , sram_inv , out , p0 ) ;
input  [0:9] in ;
input  [0:3] sram ;
input  [0:3] sram_inv ;
output [0:0] out ;
input  p0 ;

wire [0:0] sky130_fd_sc_hd__mux2_1_0_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_1_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_2_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_3_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_4_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_5_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_6_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_7_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_8_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_9_X ;

cby_2__1__const1_8 const1_0_ (
    .const1 ( { SYNOPSYS_UNCONNECTED_1 } ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l1_in_0_ ( .A0 ( in[1] ) , .A1 ( in[0] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_0_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l1_in_1_ ( .A0 ( in[3] ) , .A1 ( in[2] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_1_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l1_in_2_ ( .A0 ( in[5] ) , .A1 ( in[4] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_2_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_0_ ( 
    .A0 ( sky130_fd_sc_hd__mux2_1_1_X[0] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_0_X[0] ) , .S ( sram[1] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_3_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_1_ ( .A0 ( in[6] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_2_X[0] ) , .S ( sram[1] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_4_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_2_ ( .A0 ( in[8] ) , .A1 ( in[7] ) , 
    .S ( sram[1] ) , .X ( sky130_fd_sc_hd__mux2_1_5_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_3_ ( .A0 ( p0 ) , .A1 ( in[9] ) , 
    .S ( sram[1] ) , .X ( sky130_fd_sc_hd__mux2_1_6_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l3_in_0_ ( 
    .A0 ( sky130_fd_sc_hd__mux2_1_4_X[0] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_3_X[0] ) , .S ( sram[2] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_7_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l3_in_1_ ( 
    .A0 ( sky130_fd_sc_hd__mux2_1_6_X[0] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_5_X[0] ) , .S ( sram[2] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_8_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l4_in_0_ ( 
    .A0 ( sky130_fd_sc_hd__mux2_1_8_X[0] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_7_X[0] ) , .S ( sram[3] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_9_X[0] ) ) ;
sky130_fd_sc_hd__buf_6 BUFT_RR_68 ( .A ( sky130_fd_sc_hd__mux2_1_9_X[0] ) , 
    .X ( out[0] ) ) ;
endmodule


module cby_2__1__const1_7 ( const1 ) ;
output [0:0] const1 ;

wire [0:0] const1_0 ;

assign const1_0[0] = 1'b1 ;
endmodule


module cby_2__1__mux_tree_tapbuf_size10_7 ( in , sram , sram_inv , out , p0 ) ;
input  [0:9] in ;
input  [0:3] sram ;
input  [0:3] sram_inv ;
output [0:0] out ;
input  p0 ;

wire [0:0] sky130_fd_sc_hd__mux2_1_0_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_1_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_2_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_3_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_4_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_5_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_6_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_7_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_8_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_9_X ;

cby_2__1__const1_7 const1_0_ (
    .const1 ( { SYNOPSYS_UNCONNECTED_1 } ) ) ;
sky130_fd_sc_hd__buf_6 sky130_fd_sc_hd__buf_4_0_ ( 
    .A ( sky130_fd_sc_hd__mux2_1_9_X[0] ) , .X ( out[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l1_in_0_ ( .A0 ( in[1] ) , .A1 ( in[0] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_0_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l1_in_1_ ( .A0 ( in[3] ) , .A1 ( in[2] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_1_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l1_in_2_ ( .A0 ( in[5] ) , .A1 ( in[4] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_2_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_0_ ( 
    .A0 ( sky130_fd_sc_hd__mux2_1_1_X[0] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_0_X[0] ) , .S ( sram[1] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_3_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_1_ ( .A0 ( in[6] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_2_X[0] ) , .S ( sram[1] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_4_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_2_ ( .A0 ( in[8] ) , .A1 ( in[7] ) , 
    .S ( sram[1] ) , .X ( sky130_fd_sc_hd__mux2_1_5_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_3_ ( .A0 ( p0 ) , .A1 ( in[9] ) , 
    .S ( sram[1] ) , .X ( sky130_fd_sc_hd__mux2_1_6_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l3_in_0_ ( 
    .A0 ( sky130_fd_sc_hd__mux2_1_4_X[0] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_3_X[0] ) , .S ( sram[2] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_7_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l3_in_1_ ( 
    .A0 ( sky130_fd_sc_hd__mux2_1_6_X[0] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_5_X[0] ) , .S ( sram[2] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_8_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l4_in_0_ ( 
    .A0 ( sky130_fd_sc_hd__mux2_1_8_X[0] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_7_X[0] ) , .S ( sram[3] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_9_X[0] ) ) ;
endmodule


module cby_2__1__const1_6 ( const1 ) ;
output [0:0] const1 ;

wire [0:0] const1_0 ;

assign const1_0[0] = 1'b1 ;
endmodule


module cby_2__1__mux_tree_tapbuf_size10_6 ( in , sram , sram_inv , out , p0 ) ;
input  [0:9] in ;
input  [0:3] sram ;
input  [0:3] sram_inv ;
output [0:0] out ;
input  p0 ;

wire [0:0] sky130_fd_sc_hd__mux2_1_0_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_1_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_2_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_3_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_4_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_5_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_6_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_7_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_8_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_9_X ;

cby_2__1__const1_6 const1_0_ (
    .const1 ( { SYNOPSYS_UNCONNECTED_1 } ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l1_in_0_ ( .A0 ( in[1] ) , .A1 ( in[0] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_0_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l1_in_1_ ( .A0 ( in[3] ) , .A1 ( in[2] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_1_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l1_in_2_ ( .A0 ( in[5] ) , .A1 ( in[4] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_2_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_0_ ( 
    .A0 ( sky130_fd_sc_hd__mux2_1_1_X[0] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_0_X[0] ) , .S ( sram[1] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_3_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_1_ ( .A0 ( in[6] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_2_X[0] ) , .S ( sram[1] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_4_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_2_ ( .A0 ( in[8] ) , .A1 ( in[7] ) , 
    .S ( sram[1] ) , .X ( sky130_fd_sc_hd__mux2_1_5_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_3_ ( .A0 ( p0 ) , .A1 ( in[9] ) , 
    .S ( sram[1] ) , .X ( sky130_fd_sc_hd__mux2_1_6_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l3_in_0_ ( 
    .A0 ( sky130_fd_sc_hd__mux2_1_4_X[0] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_3_X[0] ) , .S ( sram[2] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_7_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l3_in_1_ ( 
    .A0 ( sky130_fd_sc_hd__mux2_1_6_X[0] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_5_X[0] ) , .S ( sram[2] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_8_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l4_in_0_ ( 
    .A0 ( sky130_fd_sc_hd__mux2_1_8_X[0] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_7_X[0] ) , .S ( sram[3] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_9_X[0] ) ) ;
sky130_fd_sc_hd__inv_8 BINV_R_66 ( .A ( BUF_net_67 ) , .Y ( out[0] ) ) ;
sky130_fd_sc_hd__inv_1 BINV_R_67 ( .A ( sky130_fd_sc_hd__mux2_1_9_X[0] ) , 
    .Y ( BUF_net_67 ) ) ;
endmodule


module cby_2__1__const1_5 ( const1 ) ;
output [0:0] const1 ;

wire [0:0] const1_0 ;

assign const1_0[0] = 1'b1 ;
endmodule


module cby_2__1__mux_tree_tapbuf_size10_5 ( in , sram , sram_inv , out , p0 ) ;
input  [0:9] in ;
input  [0:3] sram ;
input  [0:3] sram_inv ;
output [0:0] out ;
input  p0 ;

wire [0:0] sky130_fd_sc_hd__mux2_1_0_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_1_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_2_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_3_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_4_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_5_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_6_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_7_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_8_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_9_X ;

cby_2__1__const1_5 const1_0_ (
    .const1 ( { SYNOPSYS_UNCONNECTED_1 } ) ) ;
sky130_fd_sc_hd__buf_6 sky130_fd_sc_hd__buf_4_0_ ( 
    .A ( sky130_fd_sc_hd__mux2_1_9_X[0] ) , .X ( out[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l1_in_0_ ( .A0 ( in[1] ) , .A1 ( in[0] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_0_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l1_in_1_ ( .A0 ( in[3] ) , .A1 ( in[2] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_1_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l1_in_2_ ( .A0 ( in[5] ) , .A1 ( in[4] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_2_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_0_ ( 
    .A0 ( sky130_fd_sc_hd__mux2_1_1_X[0] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_0_X[0] ) , .S ( sram[1] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_3_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_1_ ( .A0 ( in[6] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_2_X[0] ) , .S ( sram[1] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_4_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_2_ ( .A0 ( in[8] ) , .A1 ( in[7] ) , 
    .S ( sram[1] ) , .X ( sky130_fd_sc_hd__mux2_1_5_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_3_ ( .A0 ( p0 ) , .A1 ( in[9] ) , 
    .S ( sram[1] ) , .X ( sky130_fd_sc_hd__mux2_1_6_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l3_in_0_ ( 
    .A0 ( sky130_fd_sc_hd__mux2_1_4_X[0] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_3_X[0] ) , .S ( sram[2] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_7_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l3_in_1_ ( 
    .A0 ( sky130_fd_sc_hd__mux2_1_6_X[0] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_5_X[0] ) , .S ( sram[2] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_8_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l4_in_0_ ( 
    .A0 ( sky130_fd_sc_hd__mux2_1_8_X[0] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_7_X[0] ) , .S ( sram[3] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_9_X[0] ) ) ;
endmodule


module cby_2__1__const1_4 ( const1 ) ;
output [0:0] const1 ;

wire [0:0] const1_0 ;

assign const1_0[0] = 1'b1 ;
endmodule


module cby_2__1__mux_tree_tapbuf_size10_4 ( in , sram , sram_inv , out , p0 ) ;
input  [0:9] in ;
input  [0:3] sram ;
input  [0:3] sram_inv ;
output [0:0] out ;
input  p0 ;

wire [0:0] sky130_fd_sc_hd__mux2_1_0_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_1_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_2_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_3_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_4_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_5_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_6_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_7_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_8_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_9_X ;

cby_2__1__const1_4 const1_0_ (
    .const1 ( { SYNOPSYS_UNCONNECTED_1 } ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l1_in_0_ ( .A0 ( in[1] ) , .A1 ( in[0] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_0_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l1_in_1_ ( .A0 ( in[3] ) , .A1 ( in[2] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_1_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l1_in_2_ ( .A0 ( in[5] ) , .A1 ( in[4] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_2_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_0_ ( 
    .A0 ( sky130_fd_sc_hd__mux2_1_1_X[0] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_0_X[0] ) , .S ( sram[1] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_3_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_1_ ( .A0 ( in[6] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_2_X[0] ) , .S ( sram[1] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_4_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_2_ ( .A0 ( in[8] ) , .A1 ( in[7] ) , 
    .S ( sram[1] ) , .X ( sky130_fd_sc_hd__mux2_1_5_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_3_ ( .A0 ( p0 ) , .A1 ( in[9] ) , 
    .S ( sram[1] ) , .X ( sky130_fd_sc_hd__mux2_1_6_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l3_in_0_ ( 
    .A0 ( sky130_fd_sc_hd__mux2_1_4_X[0] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_3_X[0] ) , .S ( sram[2] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_7_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l3_in_1_ ( 
    .A0 ( sky130_fd_sc_hd__mux2_1_6_X[0] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_5_X[0] ) , .S ( sram[2] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_8_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l4_in_0_ ( 
    .A0 ( sky130_fd_sc_hd__mux2_1_8_X[0] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_7_X[0] ) , .S ( sram[3] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_9_X[0] ) ) ;
sky130_fd_sc_hd__inv_6 BINV_R_64 ( .A ( BUF_net_65 ) , .Y ( out[0] ) ) ;
sky130_fd_sc_hd__inv_1 BINV_R_65 ( .A ( sky130_fd_sc_hd__mux2_1_9_X[0] ) , 
    .Y ( BUF_net_65 ) ) ;
endmodule


module cby_2__1__const1_3 ( const1 ) ;
output [0:0] const1 ;

wire [0:0] const1_0 ;

assign const1_0[0] = 1'b1 ;
endmodule


module cby_2__1__mux_tree_tapbuf_size10_3 ( in , sram , sram_inv , out , p0 ) ;
input  [0:9] in ;
input  [0:3] sram ;
input  [0:3] sram_inv ;
output [0:0] out ;
input  p0 ;

wire [0:0] sky130_fd_sc_hd__mux2_1_0_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_1_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_2_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_3_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_4_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_5_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_6_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_7_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_8_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_9_X ;

cby_2__1__const1_3 const1_0_ (
    .const1 ( { SYNOPSYS_UNCONNECTED_1 } ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l1_in_0_ ( .A0 ( in[1] ) , .A1 ( in[0] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_0_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l1_in_1_ ( .A0 ( in[3] ) , .A1 ( in[2] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_1_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l1_in_2_ ( .A0 ( in[5] ) , .A1 ( in[4] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_2_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_0_ ( 
    .A0 ( sky130_fd_sc_hd__mux2_1_1_X[0] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_0_X[0] ) , .S ( sram[1] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_3_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_1_ ( .A0 ( in[6] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_2_X[0] ) , .S ( sram[1] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_4_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_2_ ( .A0 ( in[8] ) , .A1 ( in[7] ) , 
    .S ( sram[1] ) , .X ( sky130_fd_sc_hd__mux2_1_5_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_3_ ( .A0 ( p0 ) , .A1 ( in[9] ) , 
    .S ( sram[1] ) , .X ( sky130_fd_sc_hd__mux2_1_6_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l3_in_0_ ( 
    .A0 ( sky130_fd_sc_hd__mux2_1_4_X[0] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_3_X[0] ) , .S ( sram[2] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_7_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l3_in_1_ ( 
    .A0 ( sky130_fd_sc_hd__mux2_1_6_X[0] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_5_X[0] ) , .S ( sram[2] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_8_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l4_in_0_ ( 
    .A0 ( sky130_fd_sc_hd__mux2_1_8_X[0] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_7_X[0] ) , .S ( sram[3] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_9_X[0] ) ) ;
sky130_fd_sc_hd__buf_6 BUFT_RR_63 ( .A ( sky130_fd_sc_hd__mux2_1_9_X[0] ) , 
    .X ( out[0] ) ) ;
endmodule


module cby_2__1__const1_2 ( const1 ) ;
output [0:0] const1 ;

wire [0:0] const1_0 ;

assign const1_0[0] = 1'b1 ;
endmodule


module cby_2__1__mux_tree_tapbuf_size10_2 ( in , sram , sram_inv , out , p0 ) ;
input  [0:9] in ;
input  [0:3] sram ;
input  [0:3] sram_inv ;
output [0:0] out ;
input  p0 ;

wire [0:0] sky130_fd_sc_hd__mux2_1_0_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_1_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_2_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_3_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_4_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_5_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_6_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_7_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_8_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_9_X ;

cby_2__1__const1_2 const1_0_ (
    .const1 ( { SYNOPSYS_UNCONNECTED_1 } ) ) ;
sky130_fd_sc_hd__buf_6 sky130_fd_sc_hd__buf_4_0_ ( 
    .A ( sky130_fd_sc_hd__mux2_1_9_X[0] ) , .X ( out[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l1_in_0_ ( .A0 ( in[1] ) , .A1 ( in[0] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_0_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l1_in_1_ ( .A0 ( in[3] ) , .A1 ( in[2] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_1_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l1_in_2_ ( .A0 ( in[5] ) , .A1 ( in[4] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_2_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_0_ ( 
    .A0 ( sky130_fd_sc_hd__mux2_1_1_X[0] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_0_X[0] ) , .S ( sram[1] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_3_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_1_ ( .A0 ( in[6] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_2_X[0] ) , .S ( sram[1] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_4_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_2_ ( .A0 ( in[8] ) , .A1 ( in[7] ) , 
    .S ( sram[1] ) , .X ( sky130_fd_sc_hd__mux2_1_5_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_3_ ( .A0 ( p0 ) , .A1 ( in[9] ) , 
    .S ( sram[1] ) , .X ( sky130_fd_sc_hd__mux2_1_6_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l3_in_0_ ( 
    .A0 ( sky130_fd_sc_hd__mux2_1_4_X[0] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_3_X[0] ) , .S ( sram[2] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_7_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l3_in_1_ ( 
    .A0 ( sky130_fd_sc_hd__mux2_1_6_X[0] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_5_X[0] ) , .S ( sram[2] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_8_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l4_in_0_ ( 
    .A0 ( sky130_fd_sc_hd__mux2_1_8_X[0] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_7_X[0] ) , .S ( sram[3] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_9_X[0] ) ) ;
endmodule


module cby_2__1__const1_1 ( const1 ) ;
output [0:0] const1 ;

wire [0:0] const1_0 ;

assign const1_0[0] = 1'b1 ;
endmodule


module cby_2__1__mux_tree_tapbuf_size10_1 ( in , sram , sram_inv , out , p0 ) ;
input  [0:9] in ;
input  [0:3] sram ;
input  [0:3] sram_inv ;
output [0:0] out ;
input  p0 ;

wire [0:0] sky130_fd_sc_hd__mux2_1_0_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_1_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_2_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_3_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_4_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_5_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_6_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_7_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_8_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_9_X ;

cby_2__1__const1_1 const1_0_ (
    .const1 ( { SYNOPSYS_UNCONNECTED_1 } ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l1_in_0_ ( .A0 ( in[1] ) , .A1 ( in[0] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_0_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l1_in_1_ ( .A0 ( in[3] ) , .A1 ( in[2] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_1_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l1_in_2_ ( .A0 ( in[5] ) , .A1 ( in[4] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_2_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_0_ ( 
    .A0 ( sky130_fd_sc_hd__mux2_1_1_X[0] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_0_X[0] ) , .S ( sram[1] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_3_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_1_ ( .A0 ( in[6] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_2_X[0] ) , .S ( sram[1] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_4_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_2_ ( .A0 ( in[8] ) , .A1 ( in[7] ) , 
    .S ( sram[1] ) , .X ( sky130_fd_sc_hd__mux2_1_5_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_3_ ( .A0 ( p0 ) , .A1 ( in[9] ) , 
    .S ( sram[1] ) , .X ( sky130_fd_sc_hd__mux2_1_6_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l3_in_0_ ( 
    .A0 ( sky130_fd_sc_hd__mux2_1_4_X[0] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_3_X[0] ) , .S ( sram[2] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_7_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l3_in_1_ ( 
    .A0 ( sky130_fd_sc_hd__mux2_1_6_X[0] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_5_X[0] ) , .S ( sram[2] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_8_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l4_in_0_ ( 
    .A0 ( sky130_fd_sc_hd__mux2_1_8_X[0] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_7_X[0] ) , .S ( sram[3] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_9_X[0] ) ) ;
sky130_fd_sc_hd__buf_6 BUFT_RR_62 ( .A ( sky130_fd_sc_hd__mux2_1_9_X[0] ) , 
    .X ( out[0] ) ) ;
endmodule


module cby_2__1__const1_0 ( const1 ) ;
output [0:0] const1 ;

wire [0:0] const1_0 ;

assign const1_0[0] = 1'b1 ;
endmodule


module cby_2__1__mux_tree_tapbuf_size10_0 ( in , sram , sram_inv , out , p0 ) ;
input  [0:9] in ;
input  [0:3] sram ;
input  [0:3] sram_inv ;
output [0:0] out ;
input  p0 ;

wire [0:0] sky130_fd_sc_hd__mux2_1_0_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_1_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_2_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_3_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_4_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_5_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_6_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_7_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_8_X ;
wire [0:0] sky130_fd_sc_hd__mux2_1_9_X ;

cby_2__1__const1_0 const1_0_ (
    .const1 ( { SYNOPSYS_UNCONNECTED_1 } ) ) ;
sky130_fd_sc_hd__buf_6 sky130_fd_sc_hd__buf_4_0_ ( 
    .A ( sky130_fd_sc_hd__mux2_1_9_X[0] ) , .X ( out[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l1_in_0_ ( .A0 ( in[1] ) , .A1 ( in[0] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_0_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l1_in_1_ ( .A0 ( in[3] ) , .A1 ( in[2] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_1_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l1_in_2_ ( .A0 ( in[5] ) , .A1 ( in[4] ) , 
    .S ( sram[0] ) , .X ( sky130_fd_sc_hd__mux2_1_2_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_0_ ( 
    .A0 ( sky130_fd_sc_hd__mux2_1_1_X[0] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_0_X[0] ) , .S ( sram[1] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_3_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_1_ ( .A0 ( in[6] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_2_X[0] ) , .S ( sram[1] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_4_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_2_ ( .A0 ( in[8] ) , .A1 ( in[7] ) , 
    .S ( sram[1] ) , .X ( sky130_fd_sc_hd__mux2_1_5_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l2_in_3_ ( .A0 ( p0 ) , .A1 ( in[9] ) , 
    .S ( sram[1] ) , .X ( sky130_fd_sc_hd__mux2_1_6_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l3_in_0_ ( 
    .A0 ( sky130_fd_sc_hd__mux2_1_4_X[0] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_3_X[0] ) , .S ( sram[2] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_7_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l3_in_1_ ( 
    .A0 ( sky130_fd_sc_hd__mux2_1_6_X[0] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_5_X[0] ) , .S ( sram[2] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_8_X[0] ) ) ;
sky130_fd_sc_hd__mux2_1 mux_l4_in_0_ ( 
    .A0 ( sky130_fd_sc_hd__mux2_1_8_X[0] ) , 
    .A1 ( sky130_fd_sc_hd__mux2_1_7_X[0] ) , .S ( sram[3] ) , 
    .X ( sky130_fd_sc_hd__mux2_1_9_X[0] ) ) ;
endmodule


module cby_2__1_ ( chany_bottom_in , chany_top_in , ccff_head , 
    chany_bottom_out , chany_top_out , right_grid_pin_0_ , left_grid_pin_16_ , 
    left_grid_pin_17_ , left_grid_pin_18_ , left_grid_pin_19_ , 
    left_grid_pin_20_ , left_grid_pin_21_ , left_grid_pin_22_ , 
    left_grid_pin_23_ , left_grid_pin_24_ , left_grid_pin_25_ , 
    left_grid_pin_26_ , left_grid_pin_27_ , left_grid_pin_28_ , 
    left_grid_pin_29_ , left_grid_pin_30_ , left_grid_pin_31_ , ccff_tail , 
    IO_ISOL_N , gfpga_pad_EMBEDDED_IO_HD_SOC_IN , 
    gfpga_pad_EMBEDDED_IO_HD_SOC_OUT , gfpga_pad_EMBEDDED_IO_HD_SOC_DIR , 
    left_width_0_height_0__pin_0_ , left_width_0_height_0__pin_1_upper , 
    left_width_0_height_0__pin_1_lower , prog_clk_0_W_in , prog_clk_0_S_out , 
    prog_clk_0_N_out ) ;
input  [0:19] chany_bottom_in ;
input  [0:19] chany_top_in ;
input  [0:0] ccff_head ;
output [0:19] chany_bottom_out ;
output [0:19] chany_top_out ;
output [0:0] right_grid_pin_0_ ;
output [0:0] left_grid_pin_16_ ;
output [0:0] left_grid_pin_17_ ;
output [0:0] left_grid_pin_18_ ;
output [0:0] left_grid_pin_19_ ;
output [0:0] left_grid_pin_20_ ;
output [0:0] left_grid_pin_21_ ;
output [0:0] left_grid_pin_22_ ;
output [0:0] left_grid_pin_23_ ;
output [0:0] left_grid_pin_24_ ;
output [0:0] left_grid_pin_25_ ;
output [0:0] left_grid_pin_26_ ;
output [0:0] left_grid_pin_27_ ;
output [0:0] left_grid_pin_28_ ;
output [0:0] left_grid_pin_29_ ;
output [0:0] left_grid_pin_30_ ;
output [0:0] left_grid_pin_31_ ;
output [0:0] ccff_tail ;
input  [0:0] IO_ISOL_N ;
input  [0:0] gfpga_pad_EMBEDDED_IO_HD_SOC_IN ;
output [0:0] gfpga_pad_EMBEDDED_IO_HD_SOC_OUT ;
output [0:0] gfpga_pad_EMBEDDED_IO_HD_SOC_DIR ;
input  [0:0] left_width_0_height_0__pin_0_ ;
output [0:0] left_width_0_height_0__pin_1_upper ;
output [0:0] left_width_0_height_0__pin_1_lower ;
input  prog_clk_0_W_in ;
output prog_clk_0_S_out ;
output prog_clk_0_N_out ;

wire [0:0] prog_clk ;
wire prog_clk_0 ;
wire [0:3] mux_tree_tapbuf_size10_0_sram ;
wire [0:3] mux_tree_tapbuf_size10_1_sram ;
wire [0:3] mux_tree_tapbuf_size10_2_sram ;
wire [0:3] mux_tree_tapbuf_size10_3_sram ;
wire [0:3] mux_tree_tapbuf_size10_4_sram ;
wire [0:3] mux_tree_tapbuf_size10_5_sram ;
wire [0:3] mux_tree_tapbuf_size10_6_sram ;
wire [0:3] mux_tree_tapbuf_size10_7_sram ;
wire [0:3] mux_tree_tapbuf_size10_8_sram ;
wire [0:0] mux_tree_tapbuf_size10_mem_0_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size10_mem_1_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size10_mem_2_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size10_mem_3_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size10_mem_4_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size10_mem_5_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size10_mem_6_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size10_mem_7_ccff_tail ;
wire [0:3] mux_tree_tapbuf_size8_0_sram ;
wire [0:3] mux_tree_tapbuf_size8_1_sram ;
wire [0:3] mux_tree_tapbuf_size8_2_sram ;
wire [0:3] mux_tree_tapbuf_size8_3_sram ;
wire [0:3] mux_tree_tapbuf_size8_4_sram ;
wire [0:3] mux_tree_tapbuf_size8_5_sram ;
wire [0:3] mux_tree_tapbuf_size8_6_sram ;
wire [0:3] mux_tree_tapbuf_size8_7_sram ;
wire [0:0] mux_tree_tapbuf_size8_mem_0_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size8_mem_1_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size8_mem_2_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size8_mem_3_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size8_mem_4_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size8_mem_5_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size8_mem_6_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size8_mem_7_ccff_tail ;

assign prog_clk_0 = prog_clk[0] ;

cby_2__1__mux_tree_tapbuf_size10_0 mux_left_ipin_0 (
    .in ( { chany_top_out[0] , chany_bottom_out[0] , chany_top_out[2] , 
        chany_bottom_out[2] , chany_top_out[4] , chany_bottom_out[4] , 
        chany_top_out[10] , chany_bottom_out[10] , chany_top_out[16] , 
        chany_bottom_out[16] } ) ,
    .sram ( mux_tree_tapbuf_size10_0_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_1 , SYNOPSYS_UNCONNECTED_2 , 
        SYNOPSYS_UNCONNECTED_3 , SYNOPSYS_UNCONNECTED_4 } ) ,
    .out ( right_grid_pin_0_ ) , .p0 ( optlc_net_74 ) ) ;
cby_2__1__mux_tree_tapbuf_size10_1 mux_right_ipin_0 (
    .in ( { chany_top_out[1] , chany_bottom_out[1] , chany_top_out[3] , 
        chany_bottom_out[3] , chany_top_out[5] , chany_bottom_out[5] , 
        chany_top_out[11] , chany_bottom_out[11] , chany_top_out[17] , 
        chany_bottom_out[17] } ) ,
    .sram ( mux_tree_tapbuf_size10_1_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_5 , SYNOPSYS_UNCONNECTED_6 , 
        SYNOPSYS_UNCONNECTED_7 , SYNOPSYS_UNCONNECTED_8 } ) ,
    .out ( left_grid_pin_16_ ) , .p0 ( optlc_net_75 ) ) ;
cby_2__1__mux_tree_tapbuf_size10_2 mux_right_ipin_3 (
    .in ( { chany_top_out[0] , chany_bottom_out[0] , chany_top_out[2] , 
        chany_bottom_out[2] , chany_top_out[4] , chany_bottom_out[4] , 
        chany_top_out[8] , chany_bottom_out[8] , chany_top_out[14] , 
        chany_bottom_out[14] } ) ,
    .sram ( mux_tree_tapbuf_size10_2_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_9 , SYNOPSYS_UNCONNECTED_10 , 
        SYNOPSYS_UNCONNECTED_11 , SYNOPSYS_UNCONNECTED_12 } ) ,
    .out ( left_grid_pin_19_ ) , .p0 ( optlc_net_73 ) ) ;
cby_2__1__mux_tree_tapbuf_size10_3 mux_right_ipin_4 (
    .in ( { chany_top_out[1] , chany_bottom_out[1] , chany_top_out[3] , 
        chany_bottom_out[3] , chany_top_out[5] , chany_bottom_out[5] , 
        chany_top_out[9] , chany_bottom_out[9] , chany_top_out[15] , 
        chany_bottom_out[15] } ) ,
    .sram ( mux_tree_tapbuf_size10_3_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_13 , SYNOPSYS_UNCONNECTED_14 , 
        SYNOPSYS_UNCONNECTED_15 , SYNOPSYS_UNCONNECTED_16 } ) ,
    .out ( left_grid_pin_20_ ) , .p0 ( optlc_net_73 ) ) ;
cby_2__1__mux_tree_tapbuf_size10_4 mux_right_ipin_7 (
    .in ( { chany_top_out[0] , chany_bottom_out[0] , chany_top_out[2] , 
        chany_bottom_out[2] , chany_top_out[8] , chany_bottom_out[8] , 
        chany_top_out[12] , chany_bottom_out[12] , chany_top_out[18] , 
        chany_bottom_out[18] } ) ,
    .sram ( mux_tree_tapbuf_size10_4_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_17 , SYNOPSYS_UNCONNECTED_18 , 
        SYNOPSYS_UNCONNECTED_19 , SYNOPSYS_UNCONNECTED_20 } ) ,
    .out ( left_grid_pin_23_ ) , .p0 ( optlc_net_76 ) ) ;
cby_2__1__mux_tree_tapbuf_size10_5 mux_right_ipin_8 (
    .in ( { chany_top_out[1] , chany_bottom_out[1] , chany_top_out[3] , 
        chany_bottom_out[3] , chany_top_out[9] , chany_bottom_out[9] , 
        chany_top_out[13] , chany_bottom_out[13] , chany_top_out[19] , 
        chany_bottom_out[19] } ) ,
    .sram ( mux_tree_tapbuf_size10_5_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_21 , SYNOPSYS_UNCONNECTED_22 , 
        SYNOPSYS_UNCONNECTED_23 , SYNOPSYS_UNCONNECTED_24 } ) ,
    .out ( left_grid_pin_24_ ) , .p0 ( optlc_net_73 ) ) ;
cby_2__1__mux_tree_tapbuf_size10_6 mux_right_ipin_11 (
    .in ( { chany_top_out[0] , chany_bottom_out[0] , chany_top_out[2] , 
        chany_bottom_out[2] , chany_top_out[6] , chany_bottom_out[6] , 
        chany_top_out[12] , chany_bottom_out[12] , chany_top_out[16] , 
        chany_bottom_out[16] } ) ,
    .sram ( mux_tree_tapbuf_size10_6_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_25 , SYNOPSYS_UNCONNECTED_26 , 
        SYNOPSYS_UNCONNECTED_27 , SYNOPSYS_UNCONNECTED_28 } ) ,
    .out ( left_grid_pin_27_ ) , .p0 ( optlc_net_74 ) ) ;
cby_2__1__mux_tree_tapbuf_size10_7 mux_right_ipin_12 (
    .in ( { chany_top_out[1] , chany_bottom_out[1] , chany_top_out[3] , 
        chany_bottom_out[3] , chany_top_out[7] , chany_bottom_out[7] , 
        chany_top_out[13] , chany_bottom_out[13] , chany_top_out[17] , 
        chany_bottom_out[17] } ) ,
    .sram ( mux_tree_tapbuf_size10_7_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_29 , SYNOPSYS_UNCONNECTED_30 , 
        SYNOPSYS_UNCONNECTED_31 , SYNOPSYS_UNCONNECTED_32 } ) ,
    .out ( left_grid_pin_28_ ) , .p0 ( optlc_net_75 ) ) ;
cby_2__1__mux_tree_tapbuf_size10 mux_right_ipin_15 (
    .in ( { chany_top_out[0] , chany_bottom_out[0] , chany_top_out[2] , 
        chany_bottom_out[2] , chany_top_out[4] , chany_bottom_out[4] , 
        chany_top_out[10] , chany_bottom_out[10] , chany_top_out[16] , 
        chany_bottom_out[16] } ) ,
    .sram ( mux_tree_tapbuf_size10_8_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_33 , SYNOPSYS_UNCONNECTED_34 , 
        SYNOPSYS_UNCONNECTED_35 , SYNOPSYS_UNCONNECTED_36 } ) ,
    .out ( left_grid_pin_31_ ) , .p0 ( optlc_net_73 ) ) ;
cby_2__1__mux_tree_tapbuf_size10_mem_0 mem_left_ipin_0 ( 
    .prog_clk ( prog_clk ) , .ccff_head ( ccff_head ) , 
    .ccff_tail ( mux_tree_tapbuf_size10_mem_0_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size10_0_sram ) ) ;
cby_2__1__mux_tree_tapbuf_size10_mem_1 mem_right_ipin_0 ( 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size10_mem_0_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size10_mem_1_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size10_1_sram ) ) ;
cby_2__1__mux_tree_tapbuf_size10_mem_2 mem_right_ipin_3 ( 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size8_mem_1_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size10_mem_2_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size10_2_sram ) ) ;
cby_2__1__mux_tree_tapbuf_size10_mem_3 mem_right_ipin_4 ( 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size10_mem_2_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size10_mem_3_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size10_3_sram ) ) ;
cby_2__1__mux_tree_tapbuf_size10_mem_4 mem_right_ipin_7 ( 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size8_mem_3_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size10_mem_4_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size10_4_sram ) ) ;
cby_2__1__mux_tree_tapbuf_size10_mem_5 mem_right_ipin_8 ( 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size10_mem_4_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size10_mem_5_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size10_5_sram ) ) ;
cby_2__1__mux_tree_tapbuf_size10_mem_6 mem_right_ipin_11 ( 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size8_mem_5_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size10_mem_6_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size10_6_sram ) ) ;
cby_2__1__mux_tree_tapbuf_size10_mem_7 mem_right_ipin_12 ( 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size10_mem_6_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size10_mem_7_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size10_7_sram ) ) ;
cby_2__1__mux_tree_tapbuf_size10_mem mem_right_ipin_15 ( 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size8_mem_7_ccff_tail ) ,
    .ccff_tail ( { ccff_tail_mid } ) ,
    .mem_out ( mux_tree_tapbuf_size10_8_sram ) ) ;
cby_2__1__mux_tree_tapbuf_size8_0 mux_right_ipin_1 (
    .in ( { chany_top_out[0] , chany_bottom_out[0] , chany_top_out[2] , 
        chany_bottom_out[2] , chany_top_out[6] , chany_bottom_out[6] , 
        chany_top_out[14] , chany_bottom_out[14] } ) ,
    .sram ( mux_tree_tapbuf_size8_0_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_37 , SYNOPSYS_UNCONNECTED_38 , 
        SYNOPSYS_UNCONNECTED_39 , SYNOPSYS_UNCONNECTED_40 } ) ,
    .out ( left_grid_pin_17_ ) , .p0 ( optlc_net_74 ) ) ;
cby_2__1__mux_tree_tapbuf_size8_1 mux_right_ipin_2 (
    .in ( { chany_top_out[1] , chany_bottom_out[1] , chany_top_out[3] , 
        chany_bottom_out[3] , chany_top_out[7] , chany_bottom_out[7] , 
        chany_top_out[15] , chany_bottom_out[15] } ) ,
    .sram ( mux_tree_tapbuf_size8_1_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_41 , SYNOPSYS_UNCONNECTED_42 , 
        SYNOPSYS_UNCONNECTED_43 , SYNOPSYS_UNCONNECTED_44 } ) ,
    .out ( left_grid_pin_18_ ) , .p0 ( optlc_net_73 ) ) ;
cby_2__1__mux_tree_tapbuf_size8_2 mux_right_ipin_5 (
    .in ( { chany_top_out[0] , chany_bottom_out[0] , chany_top_out[2] , 
        chany_bottom_out[2] , chany_top_out[10] , chany_bottom_out[10] , 
        chany_top_out[18] , chany_bottom_out[18] } ) ,
    .sram ( mux_tree_tapbuf_size8_2_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_45 , SYNOPSYS_UNCONNECTED_46 , 
        SYNOPSYS_UNCONNECTED_47 , SYNOPSYS_UNCONNECTED_48 } ) ,
    .out ( left_grid_pin_21_ ) , .p0 ( optlc_net_76 ) ) ;
cby_2__1__mux_tree_tapbuf_size8_3 mux_right_ipin_6 (
    .in ( { chany_top_out[1] , chany_bottom_out[1] , chany_top_out[3] , 
        chany_bottom_out[3] , chany_top_out[11] , chany_bottom_out[11] , 
        chany_top_out[19] , chany_bottom_out[19] } ) ,
    .sram ( mux_tree_tapbuf_size8_3_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_49 , SYNOPSYS_UNCONNECTED_50 , 
        SYNOPSYS_UNCONNECTED_51 , SYNOPSYS_UNCONNECTED_52 } ) ,
    .out ( left_grid_pin_22_ ) , .p0 ( optlc_net_73 ) ) ;
cby_2__1__mux_tree_tapbuf_size8_4 mux_right_ipin_9 (
    .in ( { chany_top_out[0] , chany_bottom_out[0] , chany_top_out[2] , 
        chany_bottom_out[2] , chany_top_out[6] , chany_bottom_out[6] , 
        chany_top_out[14] , chany_bottom_out[14] } ) ,
    .sram ( mux_tree_tapbuf_size8_4_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_53 , SYNOPSYS_UNCONNECTED_54 , 
        SYNOPSYS_UNCONNECTED_55 , SYNOPSYS_UNCONNECTED_56 } ) ,
    .out ( left_grid_pin_25_ ) , .p0 ( optlc_net_73 ) ) ;
cby_2__1__mux_tree_tapbuf_size8_5 mux_right_ipin_10 (
    .in ( { chany_top_out[1] , chany_bottom_out[1] , chany_top_out[3] , 
        chany_bottom_out[3] , chany_top_out[7] , chany_bottom_out[7] , 
        chany_top_out[15] , chany_bottom_out[15] } ) ,
    .sram ( mux_tree_tapbuf_size8_5_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_57 , SYNOPSYS_UNCONNECTED_58 , 
        SYNOPSYS_UNCONNECTED_59 , SYNOPSYS_UNCONNECTED_60 } ) ,
    .out ( left_grid_pin_26_ ) , .p0 ( optlc_net_74 ) ) ;
cby_2__1__mux_tree_tapbuf_size8_6 mux_right_ipin_13 (
    .in ( { chany_top_out[0] , chany_bottom_out[0] , chany_top_out[2] , 
        chany_bottom_out[2] , chany_top_out[10] , chany_bottom_out[10] , 
        chany_top_out[18] , chany_bottom_out[18] } ) ,
    .sram ( mux_tree_tapbuf_size8_6_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_61 , SYNOPSYS_UNCONNECTED_62 , 
        SYNOPSYS_UNCONNECTED_63 , SYNOPSYS_UNCONNECTED_64 } ) ,
    .out ( left_grid_pin_29_ ) , .p0 ( optlc_net_74 ) ) ;
cby_2__1__mux_tree_tapbuf_size8 mux_right_ipin_14 (
    .in ( { chany_top_out[1] , chany_bottom_out[1] , chany_top_out[3] , 
        chany_bottom_out[3] , chany_top_out[11] , chany_bottom_out[11] , 
        chany_top_out[19] , chany_bottom_out[19] } ) ,
    .sram ( mux_tree_tapbuf_size8_7_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_65 , SYNOPSYS_UNCONNECTED_66 , 
        SYNOPSYS_UNCONNECTED_67 , SYNOPSYS_UNCONNECTED_68 } ) ,
    .out ( left_grid_pin_30_ ) , .p0 ( optlc_net_73 ) ) ;
cby_2__1__mux_tree_tapbuf_size8_mem_0 mem_right_ipin_1 ( 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size10_mem_1_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size8_mem_0_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size8_0_sram ) ) ;
cby_2__1__mux_tree_tapbuf_size8_mem_1 mem_right_ipin_2 ( 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size8_mem_0_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size8_mem_1_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size8_1_sram ) ) ;
cby_2__1__mux_tree_tapbuf_size8_mem_2 mem_right_ipin_5 ( 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size10_mem_3_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size8_mem_2_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size8_2_sram ) ) ;
cby_2__1__mux_tree_tapbuf_size8_mem_3 mem_right_ipin_6 ( 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size8_mem_2_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size8_mem_3_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size8_3_sram ) ) ;
cby_2__1__mux_tree_tapbuf_size8_mem_4 mem_right_ipin_9 ( 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size10_mem_5_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size8_mem_4_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size8_4_sram ) ) ;
cby_2__1__mux_tree_tapbuf_size8_mem_5 mem_right_ipin_10 ( 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size8_mem_4_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size8_mem_5_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size8_5_sram ) ) ;
cby_2__1__mux_tree_tapbuf_size8_mem_6 mem_right_ipin_13 ( 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size10_mem_7_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size8_mem_6_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size8_6_sram ) ) ;
cby_2__1__mux_tree_tapbuf_size8_mem mem_right_ipin_14 ( 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size8_mem_6_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size8_mem_7_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size8_7_sram ) ) ;
cby_2__1__logical_tile_io_mode_io_ logical_tile_io_mode_io__0 ( 
    .IO_ISOL_N ( IO_ISOL_N ) , .prog_clk ( prog_clk ) , 
    .gfpga_pad_EMBEDDED_IO_HD_SOC_IN ( gfpga_pad_EMBEDDED_IO_HD_SOC_IN ) , 
    .gfpga_pad_EMBEDDED_IO_HD_SOC_OUT ( gfpga_pad_EMBEDDED_IO_HD_SOC_OUT ) , 
    .gfpga_pad_EMBEDDED_IO_HD_SOC_DIR ( gfpga_pad_EMBEDDED_IO_HD_SOC_DIR ) , 
    .io_outpad ( left_width_0_height_0__pin_0_ ) ,
    .ccff_head ( { ccff_tail_mid } ) ,
    .io_inpad ( left_width_0_height_0__pin_1_lower ) , 
    .ccff_tail ( ccff_tail ) ) ;
sky130_fd_sc_hd__buf_1 prog_clk_0_FTB00 ( .A ( prog_clk_0_W_in ) , 
    .X ( prog_clk[0] ) ) ;
sky130_fd_sc_hd__clkbuf_1 prog_clk_0_S_FTB01 ( .A ( prog_clk_0_W_in ) , 
    .X ( ctsbuf_net_177 ) ) ;
sky130_fd_sc_hd__clkbuf_1 prog_clk_0_N_FTB01 ( .A ( prog_clk_0_W_in ) , 
    .X ( ctsbuf_net_278 ) ) ;
sky130_fd_sc_hd__buf_8 FTB_19__18 ( .A ( chany_bottom_in[0] ) , 
    .X ( chany_top_out[0] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_20__19 ( .A ( chany_bottom_in[1] ) , 
    .X ( chany_top_out[1] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_21__20 ( .A ( chany_bottom_in[2] ) , 
    .X ( chany_top_out[2] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_22__21 ( .A ( chany_bottom_in[3] ) , 
    .X ( chany_top_out[3] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_23__22 ( .A ( chany_bottom_in[4] ) , 
    .X ( chany_top_out[4] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_24__23 ( .A ( chany_bottom_in[5] ) , 
    .X ( chany_top_out[5] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_25__24 ( .A ( chany_bottom_in[6] ) , 
    .X ( chany_top_out[6] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_26__25 ( .A ( chany_bottom_in[7] ) , 
    .X ( chany_top_out[7] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_27__26 ( .A ( chany_bottom_in[8] ) , 
    .X ( chany_top_out[8] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_28__27 ( .A ( chany_bottom_in[9] ) , 
    .X ( chany_top_out[9] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_29__28 ( .A ( chany_bottom_in[10] ) , 
    .X ( chany_top_out[10] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_30__29 ( .A ( chany_bottom_in[11] ) , 
    .X ( chany_top_out[11] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_31__30 ( .A ( chany_bottom_in[12] ) , 
    .X ( chany_top_out[12] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_32__31 ( .A ( chany_bottom_in[13] ) , 
    .X ( chany_top_out[13] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_33__32 ( .A ( chany_bottom_in[14] ) , 
    .X ( chany_top_out[14] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_34__33 ( .A ( chany_bottom_in[15] ) , 
    .X ( chany_top_out[15] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_35__34 ( .A ( chany_bottom_in[16] ) , 
    .X ( chany_top_out[16] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_36__35 ( .A ( chany_bottom_in[17] ) , 
    .X ( chany_top_out[17] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_37__36 ( .A ( chany_bottom_in[18] ) , 
    .X ( chany_top_out[18] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_38__37 ( .A ( chany_bottom_in[19] ) , 
    .X ( chany_top_out[19] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_39__38 ( .A ( chany_top_in[0] ) , 
    .X ( chany_bottom_out[0] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_40__39 ( .A ( chany_top_in[1] ) , 
    .X ( chany_bottom_out[1] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_41__40 ( .A ( chany_top_in[2] ) , 
    .X ( chany_bottom_out[2] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_42__41 ( .A ( chany_top_in[3] ) , 
    .X ( chany_bottom_out[3] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_43__42 ( .A ( chany_top_in[4] ) , 
    .X ( chany_bottom_out[4] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_44__43 ( .A ( chany_top_in[5] ) , 
    .X ( chany_bottom_out[5] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_45__44 ( .A ( chany_top_in[6] ) , 
    .X ( chany_bottom_out[6] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_46__45 ( .A ( chany_top_in[7] ) , 
    .X ( chany_bottom_out[7] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_47__46 ( .A ( chany_top_in[8] ) , 
    .X ( chany_bottom_out[8] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_48__47 ( .A ( chany_top_in[9] ) , 
    .X ( chany_bottom_out[9] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_49__48 ( .A ( chany_top_in[10] ) , 
    .X ( chany_bottom_out[10] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_50__49 ( .A ( chany_top_in[11] ) , 
    .X ( chany_bottom_out[11] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_51__50 ( .A ( chany_top_in[12] ) , 
    .X ( chany_bottom_out[12] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_52__51 ( .A ( chany_top_in[13] ) , 
    .X ( chany_bottom_out[13] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_53__52 ( .A ( chany_top_in[14] ) , 
    .X ( chany_bottom_out[14] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_54__53 ( .A ( chany_top_in[15] ) , 
    .X ( chany_bottom_out[15] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_55__54 ( .A ( chany_top_in[16] ) , 
    .X ( chany_bottom_out[16] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_56__55 ( .A ( chany_top_in[17] ) , 
    .X ( chany_bottom_out[17] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_57__56 ( .A ( chany_top_in[18] ) , 
    .X ( chany_bottom_out[18] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_58__57 ( .A ( chany_top_in[19] ) , 
    .X ( chany_bottom_out[19] ) ) ;
sky130_fd_sc_hd__buf_6 FTB_59__58 ( 
    .A ( left_width_0_height_0__pin_1_lower[0] ) , 
    .X ( left_width_0_height_0__pin_1_upper[0] ) ) ;
sky130_fd_sc_hd__conb_1 optlc_75 ( .LO ( SYNOPSYS_UNCONNECTED_69 ) , 
    .HI ( optlc_net_73 ) ) ;
sky130_fd_sc_hd__conb_1 optlc_77 ( .LO ( SYNOPSYS_UNCONNECTED_70 ) , 
    .HI ( optlc_net_74 ) ) ;
sky130_fd_sc_hd__conb_1 optlc_79 ( .LO ( SYNOPSYS_UNCONNECTED_71 ) , 
    .HI ( optlc_net_75 ) ) ;
sky130_fd_sc_hd__conb_1 optlc_81 ( .LO ( SYNOPSYS_UNCONNECTED_72 ) , 
    .HI ( optlc_net_76 ) ) ;
sky130_fd_sc_hd__buf_6 cts_buf_3471203 ( .A ( ctsbuf_net_177 ) , 
    .X ( prog_clk_0_S_out ) ) ;
sky130_fd_sc_hd__buf_6 cts_buf_3521208 ( .A ( ctsbuf_net_278 ) , 
    .X ( prog_clk_0_N_out ) ) ;
endmodule


