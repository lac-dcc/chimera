// This program was cloned from: https://github.com/lnis-uofu/SOFA
// License: MIT License

//
//
//
//
//
//
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


