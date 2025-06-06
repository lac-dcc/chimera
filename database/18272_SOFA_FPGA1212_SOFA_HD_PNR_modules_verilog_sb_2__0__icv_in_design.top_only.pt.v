// This program was cloned from: https://github.com/lnis-uofu/SOFA
// License: MIT License

//
//
//
//
//
//
module sb_2__0_ ( chany_top_in , top_left_grid_pin_42_ , 
    top_left_grid_pin_43_ , top_left_grid_pin_44_ , top_left_grid_pin_45_ , 
    top_left_grid_pin_46_ , top_left_grid_pin_47_ , top_left_grid_pin_48_ , 
    top_left_grid_pin_49_ , top_right_grid_pin_1_ , chanx_left_in , 
    left_bottom_grid_pin_1_ , left_bottom_grid_pin_3_ , 
    left_bottom_grid_pin_5_ , left_bottom_grid_pin_7_ , 
    left_bottom_grid_pin_9_ , left_bottom_grid_pin_11_ , 
    left_bottom_grid_pin_13_ , left_bottom_grid_pin_15_ , 
    left_bottom_grid_pin_17_ , ccff_head , chany_top_out , chanx_left_out , 
    ccff_tail , prog_clk_0_N_in ) ;
input  [0:19] chany_top_in ;
input  [0:0] top_left_grid_pin_42_ ;
input  [0:0] top_left_grid_pin_43_ ;
input  [0:0] top_left_grid_pin_44_ ;
input  [0:0] top_left_grid_pin_45_ ;
input  [0:0] top_left_grid_pin_46_ ;
input  [0:0] top_left_grid_pin_47_ ;
input  [0:0] top_left_grid_pin_48_ ;
input  [0:0] top_left_grid_pin_49_ ;
input  [0:0] top_right_grid_pin_1_ ;
input  [0:19] chanx_left_in ;
input  [0:0] left_bottom_grid_pin_1_ ;
input  [0:0] left_bottom_grid_pin_3_ ;
input  [0:0] left_bottom_grid_pin_5_ ;
input  [0:0] left_bottom_grid_pin_7_ ;
input  [0:0] left_bottom_grid_pin_9_ ;
input  [0:0] left_bottom_grid_pin_11_ ;
input  [0:0] left_bottom_grid_pin_13_ ;
input  [0:0] left_bottom_grid_pin_15_ ;
input  [0:0] left_bottom_grid_pin_17_ ;
input  [0:0] ccff_head ;
output [0:19] chany_top_out ;
output [0:19] chanx_left_out ;
output [0:0] ccff_tail ;
input  prog_clk_0_N_in ;

wire ropt_net_110 ;
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
wire [0:1] mux_tree_tapbuf_size2_2_sram ;
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
wire [0:0] mux_tree_tapbuf_size2_mem_2_ccff_tail ;
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
wire [0:2] mux_tree_tapbuf_size5_0_sram ;
wire [0:2] mux_tree_tapbuf_size5_1_sram ;
wire [0:2] mux_tree_tapbuf_size5_2_sram ;
wire [0:2] mux_tree_tapbuf_size5_3_sram ;
wire [0:0] mux_tree_tapbuf_size5_mem_0_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size5_mem_1_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size5_mem_2_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size5_mem_3_ccff_tail ;
wire [0:2] mux_tree_tapbuf_size6_0_sram ;
wire [0:2] mux_tree_tapbuf_size6_1_sram ;
wire [0:2] mux_tree_tapbuf_size6_2_sram ;
wire [0:2] mux_tree_tapbuf_size6_3_sram ;
wire [0:0] mux_tree_tapbuf_size6_mem_0_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size6_mem_1_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size6_mem_2_ccff_tail ;
wire [0:0] mux_tree_tapbuf_size6_mem_3_ccff_tail ;

assign prog_clk_0 = prog_clk[0] ;

sb_2__0__mux_tree_tapbuf_size6_0 mux_top_track_0 (
    .in ( { top_left_grid_pin_42_[0] , top_left_grid_pin_44_[0] , 
        top_left_grid_pin_46_[0] , top_left_grid_pin_48_[0] , 
        top_right_grid_pin_1_[0] , chanx_left_in[0] } ) ,
    .sram ( mux_tree_tapbuf_size6_0_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_1 , SYNOPSYS_UNCONNECTED_2 , 
        SYNOPSYS_UNCONNECTED_3 } ) ,
    .out ( chany_top_out[0] ) , .p0 ( optlc_net_91 ) ) ;
sb_2__0__mux_tree_tapbuf_size6_1 mux_top_track_4 (
    .in ( { top_left_grid_pin_42_[0] , top_left_grid_pin_44_[0] , 
        top_left_grid_pin_46_[0] , top_left_grid_pin_48_[0] , 
        top_right_grid_pin_1_[0] , chanx_left_in[18] } ) ,
    .sram ( mux_tree_tapbuf_size6_1_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_4 , SYNOPSYS_UNCONNECTED_5 , 
        SYNOPSYS_UNCONNECTED_6 } ) ,
    .out ( chany_top_out[2] ) , .p0 ( optlc_net_91 ) ) ;
sb_2__0__mux_tree_tapbuf_size6_2 mux_left_track_1 (
    .in ( { chany_top_in[0] , left_bottom_grid_pin_1_[0] , 
        left_bottom_grid_pin_5_[0] , left_bottom_grid_pin_9_[0] , 
        left_bottom_grid_pin_13_[0] , left_bottom_grid_pin_17_[0] } ) ,
    .sram ( mux_tree_tapbuf_size6_2_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_7 , SYNOPSYS_UNCONNECTED_8 , 
        SYNOPSYS_UNCONNECTED_9 } ) ,
    .out ( chanx_left_out[0] ) , .p0 ( optlc_net_89 ) ) ;
sb_2__0__mux_tree_tapbuf_size6 mux_left_track_5 (
    .in ( { chany_top_in[18] , left_bottom_grid_pin_1_[0] , 
        left_bottom_grid_pin_5_[0] , left_bottom_grid_pin_9_[0] , 
        left_bottom_grid_pin_13_[0] , left_bottom_grid_pin_17_[0] } ) ,
    .sram ( mux_tree_tapbuf_size6_3_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_10 , SYNOPSYS_UNCONNECTED_11 , 
        SYNOPSYS_UNCONNECTED_12 } ) ,
    .out ( chanx_left_out[2] ) , .p0 ( optlc_net_89 ) ) ;
sb_2__0__mux_tree_tapbuf_size6_mem_0 mem_top_track_0 ( 
    .prog_clk ( prog_clk ) , .ccff_head ( ccff_head ) , 
    .ccff_tail ( mux_tree_tapbuf_size6_mem_0_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size6_0_sram ) ) ;
sb_2__0__mux_tree_tapbuf_size6_mem_1 mem_top_track_4 ( 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size5_mem_0_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size6_mem_1_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size6_1_sram ) ) ;
sb_2__0__mux_tree_tapbuf_size6_mem_2 mem_left_track_1 ( 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size2_mem_7_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size6_mem_2_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size6_2_sram ) ) ;
sb_2__0__mux_tree_tapbuf_size6_mem mem_left_track_5 ( .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size5_mem_2_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size6_mem_3_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size6_3_sram ) ) ;
sb_2__0__mux_tree_tapbuf_size5_0 mux_top_track_2 (
    .in ( { top_left_grid_pin_43_[0] , top_left_grid_pin_45_[0] , 
        top_left_grid_pin_47_[0] , top_left_grid_pin_49_[0] , 
        chanx_left_in[19] } ) ,
    .sram ( mux_tree_tapbuf_size5_0_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_13 , SYNOPSYS_UNCONNECTED_14 , 
        SYNOPSYS_UNCONNECTED_15 } ) ,
    .out ( chany_top_out[1] ) , .p0 ( optlc_net_90 ) ) ;
sb_2__0__mux_tree_tapbuf_size5_1 mux_top_track_6 (
    .in ( { top_left_grid_pin_43_[0] , top_left_grid_pin_45_[0] , 
        top_left_grid_pin_47_[0] , top_left_grid_pin_49_[0] , 
        chanx_left_in[17] } ) ,
    .sram ( mux_tree_tapbuf_size5_1_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_16 , SYNOPSYS_UNCONNECTED_17 , 
        SYNOPSYS_UNCONNECTED_18 } ) ,
    .out ( chany_top_out[3] ) , .p0 ( optlc_net_90 ) ) ;
sb_2__0__mux_tree_tapbuf_size5_2 mux_left_track_3 (
    .in ( { chany_top_in[19] , left_bottom_grid_pin_3_[0] , 
        left_bottom_grid_pin_7_[0] , left_bottom_grid_pin_11_[0] , 
        left_bottom_grid_pin_15_[0] } ) ,
    .sram ( mux_tree_tapbuf_size5_2_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_19 , SYNOPSYS_UNCONNECTED_20 , 
        SYNOPSYS_UNCONNECTED_21 } ) ,
    .out ( chanx_left_out[1] ) , .p0 ( optlc_net_89 ) ) ;
sb_2__0__mux_tree_tapbuf_size5 mux_left_track_7 (
    .in ( { chany_top_in[17] , left_bottom_grid_pin_3_[0] , 
        left_bottom_grid_pin_7_[0] , left_bottom_grid_pin_11_[0] , 
        left_bottom_grid_pin_15_[0] } ) ,
    .sram ( mux_tree_tapbuf_size5_3_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_22 , SYNOPSYS_UNCONNECTED_23 , 
        SYNOPSYS_UNCONNECTED_24 } ) ,
    .out ( chanx_left_out[3] ) , .p0 ( optlc_net_89 ) ) ;
sb_2__0__mux_tree_tapbuf_size5_mem_0 mem_top_track_2 ( 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size6_mem_0_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size5_mem_0_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size5_0_sram ) ) ;
sb_2__0__mux_tree_tapbuf_size5_mem_1 mem_top_track_6 ( 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size6_mem_1_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size5_mem_1_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size5_1_sram ) ) ;
sb_2__0__mux_tree_tapbuf_size5_mem_2 mem_left_track_3 ( 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size6_mem_2_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size5_mem_2_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size5_2_sram ) ) ;
sb_2__0__mux_tree_tapbuf_size5_mem mem_left_track_7 ( .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size6_mem_3_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size5_mem_3_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size5_3_sram ) ) ;
sb_2__0__mux_tree_tapbuf_size3_0 mux_top_track_8 (
    .in ( { top_left_grid_pin_42_[0] , top_right_grid_pin_1_[0] , 
        chanx_left_in[16] } ) ,
    .sram ( mux_tree_tapbuf_size3_0_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_25 , SYNOPSYS_UNCONNECTED_26 } ) ,
    .out ( chany_top_out[4] ) , .p0 ( optlc_net_90 ) ) ;
sb_2__0__mux_tree_tapbuf_size3_1 mux_top_track_24 (
    .in ( { top_left_grid_pin_42_[0] , top_right_grid_pin_1_[0] , 
        chanx_left_in[8] } ) ,
    .sram ( mux_tree_tapbuf_size3_1_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_27 , SYNOPSYS_UNCONNECTED_28 } ) ,
    .out ( chany_top_out[12] ) , .p0 ( optlc_net_90 ) ) ;
sb_2__0__mux_tree_tapbuf_size3_2 mux_left_track_9 (
    .in ( { chany_top_in[16] , left_bottom_grid_pin_1_[0] , 
        left_bottom_grid_pin_17_[0] } ) ,
    .sram ( mux_tree_tapbuf_size3_2_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_29 , SYNOPSYS_UNCONNECTED_30 } ) ,
    .out ( chanx_left_out[4] ) , .p0 ( optlc_net_89 ) ) ;
sb_2__0__mux_tree_tapbuf_size3 mux_left_track_25 (
    .in ( { chany_top_in[8] , left_bottom_grid_pin_1_[0] , 
        left_bottom_grid_pin_17_[0] } ) ,
    .sram ( mux_tree_tapbuf_size3_3_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_31 , SYNOPSYS_UNCONNECTED_32 } ) ,
    .out ( chanx_left_out[12] ) , .p0 ( optlc_net_89 ) ) ;
sb_2__0__mux_tree_tapbuf_size3_mem_0 mem_top_track_8 ( 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size5_mem_1_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size3_mem_0_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size3_0_sram ) ) ;
sb_2__0__mux_tree_tapbuf_size3_mem_1 mem_top_track_24 ( 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size2_mem_6_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size3_mem_1_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size3_1_sram ) ) ;
sb_2__0__mux_tree_tapbuf_size3_mem_2 mem_left_track_9 ( 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size5_mem_3_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size3_mem_2_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size3_2_sram ) ) ;
sb_2__0__mux_tree_tapbuf_size3_mem mem_left_track_25 ( 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size2_mem_14_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size3_mem_3_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size3_3_sram ) ) ;
sb_2__0__mux_tree_tapbuf_size2_0 mux_top_track_10 (
    .in ( { top_left_grid_pin_43_[0] , chanx_left_in[15] } ) ,
    .sram ( mux_tree_tapbuf_size2_0_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_33 , SYNOPSYS_UNCONNECTED_34 } ) ,
    .out ( chany_top_out[5] ) , .p0 ( optlc_net_91 ) ) ;
sb_2__0__mux_tree_tapbuf_size2_1 mux_top_track_12 (
    .in ( { top_left_grid_pin_44_[0] , chanx_left_in[14] } ) ,
    .sram ( mux_tree_tapbuf_size2_1_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_35 , SYNOPSYS_UNCONNECTED_36 } ) ,
    .out ( chany_top_out[6] ) , .p0 ( optlc_net_91 ) ) ;
sb_2__0__mux_tree_tapbuf_size2_2 mux_top_track_14 (
    .in ( { top_left_grid_pin_45_[0] , chanx_left_in[13] } ) ,
    .sram ( mux_tree_tapbuf_size2_2_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_37 , SYNOPSYS_UNCONNECTED_38 } ) ,
    .out ( chany_top_out[7] ) , .p0 ( optlc_net_90 ) ) ;
sb_2__0__mux_tree_tapbuf_size2_3 mux_top_track_16 (
    .in ( { top_left_grid_pin_46_[0] , chanx_left_in[12] } ) ,
    .sram ( mux_tree_tapbuf_size2_3_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_39 , SYNOPSYS_UNCONNECTED_40 } ) ,
    .out ( chany_top_out[8] ) , .p0 ( optlc_net_90 ) ) ;
sb_2__0__mux_tree_tapbuf_size2_4 mux_top_track_18 (
    .in ( { top_left_grid_pin_47_[0] , chanx_left_in[11] } ) ,
    .sram ( mux_tree_tapbuf_size2_4_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_41 , SYNOPSYS_UNCONNECTED_42 } ) ,
    .out ( chany_top_out[9] ) , .p0 ( optlc_net_90 ) ) ;
sb_2__0__mux_tree_tapbuf_size2_5 mux_top_track_20 (
    .in ( { top_left_grid_pin_48_[0] , chanx_left_in[10] } ) ,
    .sram ( mux_tree_tapbuf_size2_5_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_43 , SYNOPSYS_UNCONNECTED_44 } ) ,
    .out ( chany_top_out[10] ) , .p0 ( optlc_net_90 ) ) ;
sb_2__0__mux_tree_tapbuf_size2_6 mux_top_track_22 (
    .in ( { top_left_grid_pin_49_[0] , chanx_left_in[9] } ) ,
    .sram ( mux_tree_tapbuf_size2_6_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_45 , SYNOPSYS_UNCONNECTED_46 } ) ,
    .out ( chany_top_out[11] ) , .p0 ( optlc_net_90 ) ) ;
sb_2__0__mux_tree_tapbuf_size2_7 mux_top_track_26 (
    .in ( { top_left_grid_pin_43_[0] , chanx_left_in[7] } ) ,
    .sram ( mux_tree_tapbuf_size2_7_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_47 , SYNOPSYS_UNCONNECTED_48 } ) ,
    .out ( chany_top_out[13] ) , .p0 ( optlc_net_91 ) ) ;
sb_2__0__mux_tree_tapbuf_size2_8 mux_left_track_11 (
    .in ( { chany_top_in[15] , left_bottom_grid_pin_3_[0] } ) ,
    .sram ( mux_tree_tapbuf_size2_8_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_49 , SYNOPSYS_UNCONNECTED_50 } ) ,
    .out ( chanx_left_out[5] ) , .p0 ( optlc_net_91 ) ) ;
sb_2__0__mux_tree_tapbuf_size2_9 mux_left_track_13 (
    .in ( { chany_top_in[14] , left_bottom_grid_pin_5_[0] } ) ,
    .sram ( mux_tree_tapbuf_size2_9_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_51 , SYNOPSYS_UNCONNECTED_52 } ) ,
    .out ( chanx_left_out[6] ) , .p0 ( optlc_net_91 ) ) ;
sb_2__0__mux_tree_tapbuf_size2_10 mux_left_track_15 (
    .in ( { chany_top_in[13] , left_bottom_grid_pin_7_[0] } ) ,
    .sram ( mux_tree_tapbuf_size2_10_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_53 , SYNOPSYS_UNCONNECTED_54 } ) ,
    .out ( chanx_left_out[7] ) , .p0 ( optlc_net_92 ) ) ;
sb_2__0__mux_tree_tapbuf_size2_11 mux_left_track_17 (
    .in ( { chany_top_in[12] , left_bottom_grid_pin_9_[0] } ) ,
    .sram ( mux_tree_tapbuf_size2_11_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_55 , SYNOPSYS_UNCONNECTED_56 } ) ,
    .out ( chanx_left_out[8] ) , .p0 ( optlc_net_91 ) ) ;
sb_2__0__mux_tree_tapbuf_size2_12 mux_left_track_19 (
    .in ( { chany_top_in[11] , left_bottom_grid_pin_11_[0] } ) ,
    .sram ( mux_tree_tapbuf_size2_12_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_57 , SYNOPSYS_UNCONNECTED_58 } ) ,
    .out ( chanx_left_out[9] ) , .p0 ( optlc_net_92 ) ) ;
sb_2__0__mux_tree_tapbuf_size2_13 mux_left_track_21 (
    .in ( { chany_top_in[10] , left_bottom_grid_pin_13_[0] } ) ,
    .sram ( mux_tree_tapbuf_size2_13_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_59 , SYNOPSYS_UNCONNECTED_60 } ) ,
    .out ( chanx_left_out[10] ) , .p0 ( optlc_net_91 ) ) ;
sb_2__0__mux_tree_tapbuf_size2_14 mux_left_track_23 (
    .in ( { chany_top_in[9] , left_bottom_grid_pin_15_[0] } ) ,
    .sram ( mux_tree_tapbuf_size2_14_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_61 , SYNOPSYS_UNCONNECTED_62 } ) ,
    .out ( chanx_left_out[11] ) , .p0 ( optlc_net_89 ) ) ;
sb_2__0__mux_tree_tapbuf_size2_15 mux_left_track_27 (
    .in ( { chany_top_in[7] , left_bottom_grid_pin_3_[0] } ) ,
    .sram ( mux_tree_tapbuf_size2_15_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_63 , SYNOPSYS_UNCONNECTED_64 } ) ,
    .out ( chanx_left_out[13] ) , .p0 ( optlc_net_91 ) ) ;
sb_2__0__mux_tree_tapbuf_size2_16 mux_left_track_29 (
    .in ( { chany_top_in[6] , left_bottom_grid_pin_5_[0] } ) ,
    .sram ( mux_tree_tapbuf_size2_16_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_65 , SYNOPSYS_UNCONNECTED_66 } ) ,
    .out ( chanx_left_out[14] ) , .p0 ( optlc_net_91 ) ) ;
sb_2__0__mux_tree_tapbuf_size2_17 mux_left_track_31 (
    .in ( { chany_top_in[5] , left_bottom_grid_pin_7_[0] } ) ,
    .sram ( mux_tree_tapbuf_size2_17_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_67 , SYNOPSYS_UNCONNECTED_68 } ) ,
    .out ( chanx_left_out[15] ) , .p0 ( optlc_net_92 ) ) ;
sb_2__0__mux_tree_tapbuf_size2_18 mux_left_track_33 (
    .in ( { chany_top_in[4] , left_bottom_grid_pin_9_[0] } ) ,
    .sram ( mux_tree_tapbuf_size2_18_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_69 , SYNOPSYS_UNCONNECTED_70 } ) ,
    .out ( chanx_left_out[16] ) , .p0 ( optlc_net_93 ) ) ;
sb_2__0__mux_tree_tapbuf_size2_19 mux_left_track_35 (
    .in ( { chany_top_in[3] , left_bottom_grid_pin_11_[0] } ) ,
    .sram ( mux_tree_tapbuf_size2_19_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_71 , SYNOPSYS_UNCONNECTED_72 } ) ,
    .out ( chanx_left_out[17] ) , .p0 ( optlc_net_93 ) ) ;
sb_2__0__mux_tree_tapbuf_size2_20 mux_left_track_37 (
    .in ( { chany_top_in[2] , left_bottom_grid_pin_13_[0] } ) ,
    .sram ( mux_tree_tapbuf_size2_20_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_73 , SYNOPSYS_UNCONNECTED_74 } ) ,
    .out ( chanx_left_out[18] ) , .p0 ( optlc_net_91 ) ) ;
sb_2__0__mux_tree_tapbuf_size2 mux_left_track_39 (
    .in ( { chany_top_in[1] , left_bottom_grid_pin_15_[0] } ) ,
    .sram ( mux_tree_tapbuf_size2_21_sram ) ,
    .sram_inv ( { SYNOPSYS_UNCONNECTED_75 , SYNOPSYS_UNCONNECTED_76 } ) ,
    .out ( chanx_left_out[19] ) , .p0 ( optlc_net_90 ) ) ;
sb_2__0__mux_tree_tapbuf_size2_mem_0 mem_top_track_10 ( 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size3_mem_0_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size2_mem_0_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size2_0_sram ) ) ;
sb_2__0__mux_tree_tapbuf_size2_mem_1 mem_top_track_12 ( 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size2_mem_0_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size2_mem_1_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size2_1_sram ) ) ;
sb_2__0__mux_tree_tapbuf_size2_mem_2 mem_top_track_14 ( 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size2_mem_1_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size2_mem_2_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size2_2_sram ) ) ;
sb_2__0__mux_tree_tapbuf_size2_mem_3 mem_top_track_16 ( 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size2_mem_2_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size2_mem_3_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size2_3_sram ) ) ;
sb_2__0__mux_tree_tapbuf_size2_mem_4 mem_top_track_18 ( 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size2_mem_3_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size2_mem_4_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size2_4_sram ) ) ;
sb_2__0__mux_tree_tapbuf_size2_mem_5 mem_top_track_20 ( 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size2_mem_4_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size2_mem_5_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size2_5_sram ) ) ;
sb_2__0__mux_tree_tapbuf_size2_mem_6 mem_top_track_22 ( 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size2_mem_5_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size2_mem_6_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size2_6_sram ) ) ;
sb_2__0__mux_tree_tapbuf_size2_mem_7 mem_top_track_26 ( 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size3_mem_1_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size2_mem_7_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size2_7_sram ) ) ;
sb_2__0__mux_tree_tapbuf_size2_mem_8 mem_left_track_11 ( 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size3_mem_2_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size2_mem_8_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size2_8_sram ) ) ;
sb_2__0__mux_tree_tapbuf_size2_mem_9 mem_left_track_13 ( 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size2_mem_8_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size2_mem_9_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size2_9_sram ) ) ;
sb_2__0__mux_tree_tapbuf_size2_mem_10 mem_left_track_15 ( 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size2_mem_9_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size2_mem_10_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size2_10_sram ) ) ;
sb_2__0__mux_tree_tapbuf_size2_mem_11 mem_left_track_17 ( 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size2_mem_10_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size2_mem_11_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size2_11_sram ) ) ;
sb_2__0__mux_tree_tapbuf_size2_mem_12 mem_left_track_19 ( 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size2_mem_11_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size2_mem_12_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size2_12_sram ) ) ;
sb_2__0__mux_tree_tapbuf_size2_mem_13 mem_left_track_21 ( 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size2_mem_12_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size2_mem_13_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size2_13_sram ) ) ;
sb_2__0__mux_tree_tapbuf_size2_mem_14 mem_left_track_23 ( 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size2_mem_13_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size2_mem_14_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size2_14_sram ) ) ;
sb_2__0__mux_tree_tapbuf_size2_mem_15 mem_left_track_27 ( 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size3_mem_3_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size2_mem_15_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size2_15_sram ) ) ;
sb_2__0__mux_tree_tapbuf_size2_mem_16 mem_left_track_29 ( 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size2_mem_15_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size2_mem_16_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size2_16_sram ) ) ;
sb_2__0__mux_tree_tapbuf_size2_mem_17 mem_left_track_31 ( 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size2_mem_16_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size2_mem_17_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size2_17_sram ) ) ;
sb_2__0__mux_tree_tapbuf_size2_mem_18 mem_left_track_33 ( 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size2_mem_17_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size2_mem_18_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size2_18_sram ) ) ;
sb_2__0__mux_tree_tapbuf_size2_mem_19 mem_left_track_35 ( 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size2_mem_18_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size2_mem_19_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size2_19_sram ) ) ;
sb_2__0__mux_tree_tapbuf_size2_mem_20 mem_left_track_37 ( 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size2_mem_19_ccff_tail ) , 
    .ccff_tail ( mux_tree_tapbuf_size2_mem_20_ccff_tail ) , 
    .mem_out ( mux_tree_tapbuf_size2_20_sram ) ) ;
sb_2__0__mux_tree_tapbuf_size2_mem mem_left_track_39 ( 
    .prog_clk ( prog_clk ) , 
    .ccff_head ( mux_tree_tapbuf_size2_mem_20_ccff_tail ) , 
    .ccff_tail ( ccff_tail ) , .mem_out ( mux_tree_tapbuf_size2_21_sram ) ) ;
sky130_fd_sc_hd__buf_1 prog_clk_0_FTB00 ( .A ( prog_clk_0_N_in ) , 
    .X ( prog_clk[0] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_35__34 ( .A ( chanx_left_in[1] ) , 
    .X ( chany_top_out[19] ) ) ;
sky130_fd_sc_hd__buf_6 FTB_36__35 ( .A ( chanx_left_in[2] ) , 
    .X ( chany_top_out[18] ) ) ;
sky130_fd_sc_hd__buf_6 FTB_37__36 ( .A ( chanx_left_in[3] ) , 
    .X ( ropt_net_110 ) ) ;
sky130_fd_sc_hd__buf_6 FTB_38__37 ( .A ( chanx_left_in[4] ) , 
    .X ( chany_top_out[16] ) ) ;
sky130_fd_sc_hd__buf_6 FTB_39__38 ( .A ( chanx_left_in[5] ) , 
    .X ( chany_top_out[15] ) ) ;
sky130_fd_sc_hd__buf_8 FTB_40__39 ( .A ( chanx_left_in[6] ) , 
    .X ( chany_top_out[14] ) ) ;
sky130_fd_sc_hd__conb_1 optlc_90 ( .LO ( SYNOPSYS_UNCONNECTED_77 ) , 
    .HI ( optlc_net_89 ) ) ;
sky130_fd_sc_hd__conb_1 optlc_93 ( .LO ( SYNOPSYS_UNCONNECTED_78 ) , 
    .HI ( optlc_net_90 ) ) ;
sky130_fd_sc_hd__conb_1 optlc_95 ( .LO ( SYNOPSYS_UNCONNECTED_79 ) , 
    .HI ( optlc_net_91 ) ) ;
sky130_fd_sc_hd__conb_1 optlc_97 ( .LO ( SYNOPSYS_UNCONNECTED_80 ) , 
    .HI ( optlc_net_92 ) ) ;
sky130_fd_sc_hd__conb_1 optlc_99 ( .LO ( SYNOPSYS_UNCONNECTED_81 ) , 
    .HI ( optlc_net_93 ) ) ;
sky130_fd_sc_hd__buf_8 ropt_mt_inst_1275 ( .A ( ropt_net_110 ) , 
    .X ( chany_top_out[17] ) ) ;
endmodule


