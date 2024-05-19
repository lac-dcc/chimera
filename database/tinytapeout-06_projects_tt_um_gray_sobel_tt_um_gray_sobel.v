// This program was cloned from: https://github.com/TinyTapeout/tinytapeout-06
// License: Apache License 2.0

module tt_um_gray_sobel (VGND,
    VPWR,
    clk,
    ena,
    rst_n,
    ui_in,
    uio_in,
    uio_oe,
    uio_out,
    uo_out);
 input VGND;
 input VPWR;
 input clk;
 input ena;
 input rst_n;
 input [7:0] ui_in;
 input [7:0] uio_in;
 output [7:0] uio_oe;
 output [7:0] uio_out;
 output [7:0] uo_out;

 wire net41;
 wire net42;
 wire net43;
 wire net44;
 wire net45;
 wire net46;
 wire net47;
 wire net48;
 wire net49;
 wire net50;
 wire net51;
 wire net52;
 wire net53;
 wire net54;
 wire net55;
 wire net56;
 wire _000_;
 wire _001_;
 wire _002_;
 wire _003_;
 wire _004_;
 wire _005_;
 wire _006_;
 wire _007_;
 wire _008_;
 wire _009_;
 wire _010_;
 wire _011_;
 wire _012_;
 wire _013_;
 wire _014_;
 wire _015_;
 wire _016_;
 wire _017_;
 wire _018_;
 wire _019_;
 wire _020_;
 wire _021_;
 wire _022_;
 wire _023_;
 wire _024_;
 wire _025_;
 wire _026_;
 wire _027_;
 wire _028_;
 wire _029_;
 wire _030_;
 wire _031_;
 wire _032_;
 wire _033_;
 wire _034_;
 wire _035_;
 wire _036_;
 wire _037_;
 wire _038_;
 wire _039_;
 wire _040_;
 wire _041_;
 wire _042_;
 wire _043_;
 wire _044_;
 wire _045_;
 wire _046_;
 wire _047_;
 wire _048_;
 wire _049_;
 wire _050_;
 wire _051_;
 wire _052_;
 wire _053_;
 wire _054_;
 wire _055_;
 wire _056_;
 wire _057_;
 wire _058_;
 wire _059_;
 wire _060_;
 wire _061_;
 wire _062_;
 wire _063_;
 wire _064_;
 wire _065_;
 wire _066_;
 wire _067_;
 wire _068_;
 wire _069_;
 wire _070_;
 wire _071_;
 wire _072_;
 wire _073_;
 wire _074_;
 wire _075_;
 wire _076_;
 wire _077_;
 wire _078_;
 wire _079_;
 wire _080_;
 wire _081_;
 wire _082_;
 wire clknet_0_clk;
 wire \clknet_0_spi0.spi0._157_ ;
 wire \clknet_0_spi0.spi0._158_ ;
 wire \clknet_0_spi0.spi0._159_ ;
 wire clknet_1_0__leaf_clk;
 wire \clknet_1_0__leaf_spi0.spi0._157_ ;
 wire \clknet_1_0__leaf_spi0.spi0._158_ ;
 wire \clknet_1_0__leaf_spi0.spi0._159_ ;
 wire clknet_1_1__leaf_clk;
 wire \clknet_1_1__leaf_spi0.spi0._157_ ;
 wire \clknet_1_1__leaf_spi0.spi0._158_ ;
 wire \clknet_1_1__leaf_spi0.spi0._159_ ;
 wire clknet_leaf_0_clk;
 wire clknet_leaf_10_clk;
 wire clknet_leaf_11_clk;
 wire clknet_leaf_12_clk;
 wire clknet_leaf_13_clk;
 wire clknet_leaf_14_clk;
 wire clknet_leaf_15_clk;
 wire clknet_leaf_16_clk;
 wire clknet_leaf_17_clk;
 wire clknet_leaf_18_clk;
 wire clknet_leaf_19_clk;
 wire clknet_leaf_1_clk;
 wire clknet_leaf_20_clk;
 wire clknet_leaf_21_clk;
 wire clknet_leaf_22_clk;
 wire clknet_leaf_23_clk;
 wire clknet_leaf_2_clk;
 wire clknet_leaf_3_clk;
 wire clknet_leaf_4_clk;
 wire clknet_leaf_5_clk;
 wire clknet_leaf_6_clk;
 wire clknet_leaf_7_clk;
 wire clknet_leaf_8_clk;
 wire clknet_leaf_9_clk;
 wire \gray_sobel0._000_ ;
 wire \gray_sobel0._001_ ;
 wire \gray_sobel0._002_ ;
 wire \gray_sobel0._003_ ;
 wire \gray_sobel0._004_ ;
 wire \gray_sobel0._005_ ;
 wire \gray_sobel0._006_ ;
 wire \gray_sobel0._007_ ;
 wire \gray_sobel0._008_ ;
 wire \gray_sobel0._009_ ;
 wire \gray_sobel0._010_ ;
 wire \gray_sobel0._011_ ;
 wire \gray_sobel0._012_ ;
 wire \gray_sobel0._013_ ;
 wire \gray_sobel0._014_ ;
 wire \gray_sobel0._015_ ;
 wire \gray_sobel0._016_ ;
 wire \gray_sobel0._017_ ;
 wire \gray_sobel0._018_ ;
 wire \gray_sobel0._019_ ;
 wire \gray_sobel0._020_ ;
 wire \gray_sobel0._021_ ;
 wire \gray_sobel0._022_ ;
 wire \gray_sobel0._023_ ;
 wire \gray_sobel0._024_ ;
 wire \gray_sobel0._025_ ;
 wire \gray_sobel0._026_ ;
 wire \gray_sobel0._027_ ;
 wire \gray_sobel0._028_ ;
 wire \gray_sobel0._029_ ;
 wire \gray_sobel0._030_ ;
 wire \gray_sobel0._031_ ;
 wire \gray_sobel0._032_ ;
 wire \gray_sobel0._033_ ;
 wire \gray_sobel0._034_ ;
 wire \gray_sobel0._035_ ;
 wire \gray_sobel0._036_ ;
 wire \gray_sobel0._037_ ;
 wire \gray_sobel0._038_ ;
 wire \gray_sobel0.gray_scale0._000_ ;
 wire \gray_sobel0.gray_scale0._001_ ;
 wire \gray_sobel0.gray_scale0._002_ ;
 wire \gray_sobel0.gray_scale0._003_ ;
 wire \gray_sobel0.gray_scale0._004_ ;
 wire \gray_sobel0.gray_scale0._005_ ;
 wire \gray_sobel0.gray_scale0._006_ ;
 wire \gray_sobel0.gray_scale0._007_ ;
 wire \gray_sobel0.gray_scale0._008_ ;
 wire \gray_sobel0.gray_scale0._009_ ;
 wire \gray_sobel0.gray_scale0._010_ ;
 wire \gray_sobel0.gray_scale0._011_ ;
 wire \gray_sobel0.gray_scale0._012_ ;
 wire \gray_sobel0.gray_scale0._013_ ;
 wire \gray_sobel0.gray_scale0._014_ ;
 wire \gray_sobel0.gray_scale0._015_ ;
 wire \gray_sobel0.gray_scale0._016_ ;
 wire \gray_sobel0.gray_scale0._017_ ;
 wire \gray_sobel0.gray_scale0._018_ ;
 wire \gray_sobel0.gray_scale0._019_ ;
 wire \gray_sobel0.gray_scale0._020_ ;
 wire \gray_sobel0.gray_scale0._021_ ;
 wire \gray_sobel0.gray_scale0._022_ ;
 wire \gray_sobel0.gray_scale0._023_ ;
 wire \gray_sobel0.gray_scale0._024_ ;
 wire \gray_sobel0.gray_scale0._025_ ;
 wire \gray_sobel0.gray_scale0._026_ ;
 wire \gray_sobel0.gray_scale0._027_ ;
 wire \gray_sobel0.gray_scale0._028_ ;
 wire \gray_sobel0.gray_scale0._029_ ;
 wire \gray_sobel0.gray_scale0._030_ ;
 wire \gray_sobel0.gray_scale0._031_ ;
 wire \gray_sobel0.gray_scale0._032_ ;
 wire \gray_sobel0.gray_scale0._033_ ;
 wire \gray_sobel0.gray_scale0._034_ ;
 wire \gray_sobel0.gray_scale0._035_ ;
 wire \gray_sobel0.gray_scale0._036_ ;
 wire \gray_sobel0.gray_scale0._037_ ;
 wire \gray_sobel0.gray_scale0._038_ ;
 wire \gray_sobel0.gray_scale0._039_ ;
 wire \gray_sobel0.gray_scale0._040_ ;
 wire \gray_sobel0.gray_scale0._041_ ;
 wire \gray_sobel0.gray_scale0._042_ ;
 wire \gray_sobel0.gray_scale0._043_ ;
 wire \gray_sobel0.gray_scale0._044_ ;
 wire \gray_sobel0.gray_scale0._045_ ;
 wire \gray_sobel0.gray_scale0._046_ ;
 wire \gray_sobel0.gray_scale0._047_ ;
 wire \gray_sobel0.gray_scale0._048_ ;
 wire \gray_sobel0.gray_scale0._049_ ;
 wire \gray_sobel0.gray_scale0._050_ ;
 wire \gray_sobel0.gray_scale0._051_ ;
 wire \gray_sobel0.gray_scale0._052_ ;
 wire \gray_sobel0.gray_scale0._053_ ;
 wire \gray_sobel0.gray_scale0._054_ ;
 wire \gray_sobel0.gray_scale0._055_ ;
 wire \gray_sobel0.gray_scale0._056_ ;
 wire \gray_sobel0.gray_scale0._057_ ;
 wire \gray_sobel0.gray_scale0._058_ ;
 wire \gray_sobel0.gray_scale0._059_ ;
 wire \gray_sobel0.gray_scale0._060_ ;
 wire \gray_sobel0.gray_scale0._061_ ;
 wire \gray_sobel0.gray_scale0._062_ ;
 wire \gray_sobel0.gray_scale0._063_ ;
 wire \gray_sobel0.gray_scale0._064_ ;
 wire \gray_sobel0.gray_scale0._065_ ;
 wire \gray_sobel0.gray_scale0._066_ ;
 wire \gray_sobel0.gray_scale0._067_ ;
 wire \gray_sobel0.gray_scale0._068_ ;
 wire \gray_sobel0.gray_scale0._069_ ;
 wire \gray_sobel0.gray_scale0._070_ ;
 wire \gray_sobel0.gray_scale0._071_ ;
 wire \gray_sobel0.gray_scale0._072_ ;
 wire \gray_sobel0.gray_scale0._073_ ;
 wire \gray_sobel0.gray_scale0._074_ ;
 wire \gray_sobel0.gray_scale0._075_ ;
 wire \gray_sobel0.gray_scale0._076_ ;
 wire \gray_sobel0.gray_scale0._077_ ;
 wire \gray_sobel0.gray_scale0._078_ ;
 wire \gray_sobel0.gray_scale0._079_ ;
 wire \gray_sobel0.gray_scale0._080_ ;
 wire \gray_sobel0.gray_scale0._081_ ;
 wire \gray_sobel0.gray_scale0._082_ ;
 wire \gray_sobel0.gray_scale0._083_ ;
 wire \gray_sobel0.gray_scale0._084_ ;
 wire \gray_sobel0.gray_scale0._085_ ;
 wire \gray_sobel0.gray_scale0._086_ ;
 wire \gray_sobel0.gray_scale0._087_ ;
 wire \gray_sobel0.gray_scale0._088_ ;
 wire \gray_sobel0.gray_scale0._089_ ;
 wire \gray_sobel0.gray_scale0._090_ ;
 wire \gray_sobel0.gray_scale0._091_ ;
 wire \gray_sobel0.gray_scale0._092_ ;
 wire \gray_sobel0.gray_scale0._093_ ;
 wire \gray_sobel0.gray_scale0._094_ ;
 wire \gray_sobel0.gray_scale0._095_ ;
 wire \gray_sobel0.gray_scale0._096_ ;
 wire \gray_sobel0.gray_scale0._097_ ;
 wire \gray_sobel0.gray_scale0._098_ ;
 wire \gray_sobel0.gray_scale0._099_ ;
 wire \gray_sobel0.gray_scale0._100_ ;
 wire \gray_sobel0.gray_scale0._101_ ;
 wire \gray_sobel0.gray_scale0._102_ ;
 wire \gray_sobel0.gray_scale0.in_px_rgb_i[0] ;
 wire \gray_sobel0.gray_scale0.in_px_rgb_i[10] ;
 wire \gray_sobel0.gray_scale0.in_px_rgb_i[11] ;
 wire \gray_sobel0.gray_scale0.in_px_rgb_i[12] ;
 wire \gray_sobel0.gray_scale0.in_px_rgb_i[13] ;
 wire \gray_sobel0.gray_scale0.in_px_rgb_i[14] ;
 wire \gray_sobel0.gray_scale0.in_px_rgb_i[15] ;
 wire \gray_sobel0.gray_scale0.in_px_rgb_i[16] ;
 wire \gray_sobel0.gray_scale0.in_px_rgb_i[17] ;
 wire \gray_sobel0.gray_scale0.in_px_rgb_i[18] ;
 wire \gray_sobel0.gray_scale0.in_px_rgb_i[19] ;
 wire \gray_sobel0.gray_scale0.in_px_rgb_i[1] ;
 wire \gray_sobel0.gray_scale0.in_px_rgb_i[20] ;
 wire \gray_sobel0.gray_scale0.in_px_rgb_i[21] ;
 wire \gray_sobel0.gray_scale0.in_px_rgb_i[22] ;
 wire \gray_sobel0.gray_scale0.in_px_rgb_i[23] ;
 wire \gray_sobel0.gray_scale0.in_px_rgb_i[2] ;
 wire \gray_sobel0.gray_scale0.in_px_rgb_i[3] ;
 wire \gray_sobel0.gray_scale0.in_px_rgb_i[4] ;
 wire \gray_sobel0.gray_scale0.in_px_rgb_i[5] ;
 wire \gray_sobel0.gray_scale0.in_px_rgb_i[6] ;
 wire \gray_sobel0.gray_scale0.in_px_rgb_i[7] ;
 wire \gray_sobel0.gray_scale0.in_px_rgb_i[8] ;
 wire \gray_sobel0.gray_scale0.in_px_rgb_i[9] ;
 wire \gray_sobel0.gray_scale0.nreset_i ;
 wire \gray_sobel0.gray_scale0.out_px_gray_o[0] ;
 wire \gray_sobel0.gray_scale0.out_px_gray_o[1] ;
 wire \gray_sobel0.gray_scale0.out_px_gray_o[2] ;
 wire \gray_sobel0.gray_scale0.out_px_gray_o[3] ;
 wire \gray_sobel0.gray_scale0.out_px_gray_o[4] ;
 wire \gray_sobel0.gray_scale0.out_px_gray_o[5] ;
 wire \gray_sobel0.gray_scale0.out_px_gray_o[6] ;
 wire \gray_sobel0.gray_scale0.out_px_gray_o[7] ;
 wire \gray_sobel0.gray_scale0.px_rdy_i ;
 wire \gray_sobel0.gray_scale0.px_rdy_o ;
 wire \gray_sobel0.in_px_sobel[0] ;
 wire \gray_sobel0.in_px_sobel[1] ;
 wire \gray_sobel0.in_px_sobel[2] ;
 wire \gray_sobel0.in_px_sobel[3] ;
 wire \gray_sobel0.in_px_sobel[4] ;
 wire \gray_sobel0.in_px_sobel[5] ;
 wire \gray_sobel0.in_px_sobel[6] ;
 wire \gray_sobel0.in_px_sobel[7] ;
 wire \gray_sobel0.out_pixel_o[0] ;
 wire \gray_sobel0.out_pixel_o[10] ;
 wire \gray_sobel0.out_pixel_o[11] ;
 wire \gray_sobel0.out_pixel_o[12] ;
 wire \gray_sobel0.out_pixel_o[13] ;
 wire \gray_sobel0.out_pixel_o[14] ;
 wire \gray_sobel0.out_pixel_o[15] ;
 wire \gray_sobel0.out_pixel_o[16] ;
 wire \gray_sobel0.out_pixel_o[17] ;
 wire \gray_sobel0.out_pixel_o[18] ;
 wire \gray_sobel0.out_pixel_o[19] ;
 wire \gray_sobel0.out_pixel_o[1] ;
 wire \gray_sobel0.out_pixel_o[20] ;
 wire \gray_sobel0.out_pixel_o[21] ;
 wire \gray_sobel0.out_pixel_o[22] ;
 wire \gray_sobel0.out_pixel_o[23] ;
 wire \gray_sobel0.out_pixel_o[2] ;
 wire \gray_sobel0.out_pixel_o[3] ;
 wire \gray_sobel0.out_pixel_o[4] ;
 wire \gray_sobel0.out_pixel_o[5] ;
 wire \gray_sobel0.out_pixel_o[6] ;
 wire \gray_sobel0.out_pixel_o[7] ;
 wire \gray_sobel0.out_pixel_o[8] ;
 wire \gray_sobel0.out_pixel_o[9] ;
 wire \gray_sobel0.out_px_sobel[0] ;
 wire \gray_sobel0.out_px_sobel[1] ;
 wire \gray_sobel0.out_px_sobel[2] ;
 wire \gray_sobel0.out_px_sobel[3] ;
 wire \gray_sobel0.out_px_sobel[4] ;
 wire \gray_sobel0.out_px_sobel[5] ;
 wire \gray_sobel0.out_px_sobel[6] ;
 wire \gray_sobel0.out_px_sobel[7] ;
 wire \gray_sobel0.px_rdy_i_sobel ;
 wire \gray_sobel0.px_rdy_o ;
 wire \gray_sobel0.px_rdy_o_sobel ;
 wire \gray_sobel0.sobel0._000_ ;
 wire \gray_sobel0.sobel0._001_ ;
 wire \gray_sobel0.sobel0._002_ ;
 wire \gray_sobel0.sobel0._003_ ;
 wire \gray_sobel0.sobel0._004_ ;
 wire \gray_sobel0.sobel0._005_ ;
 wire \gray_sobel0.sobel0._006_ ;
 wire \gray_sobel0.sobel0._007_ ;
 wire \gray_sobel0.sobel0._008_ ;
 wire \gray_sobel0.sobel0._009_ ;
 wire \gray_sobel0.sobel0._010_ ;
 wire \gray_sobel0.sobel0._011_ ;
 wire \gray_sobel0.sobel0._012_ ;
 wire \gray_sobel0.sobel0._013_ ;
 wire \gray_sobel0.sobel0._014_ ;
 wire \gray_sobel0.sobel0._015_ ;
 wire \gray_sobel0.sobel0._016_ ;
 wire \gray_sobel0.sobel0._017_ ;
 wire \gray_sobel0.sobel0._018_ ;
 wire \gray_sobel0.sobel0._019_ ;
 wire \gray_sobel0.sobel0._020_ ;
 wire \gray_sobel0.sobel0._021_ ;
 wire \gray_sobel0.sobel0._022_ ;
 wire \gray_sobel0.sobel0._023_ ;
 wire \gray_sobel0.sobel0._024_ ;
 wire \gray_sobel0.sobel0._025_ ;
 wire \gray_sobel0.sobel0._026_ ;
 wire \gray_sobel0.sobel0._027_ ;
 wire \gray_sobel0.sobel0._028_ ;
 wire \gray_sobel0.sobel0._029_ ;
 wire \gray_sobel0.sobel0._030_ ;
 wire \gray_sobel0.sobel0._031_ ;
 wire \gray_sobel0.sobel0._032_ ;
 wire \gray_sobel0.sobel0._033_ ;
 wire \gray_sobel0.sobel0._034_ ;
 wire \gray_sobel0.sobel0._035_ ;
 wire \gray_sobel0.sobel0._036_ ;
 wire \gray_sobel0.sobel0._037_ ;
 wire \gray_sobel0.sobel0._038_ ;
 wire \gray_sobel0.sobel0._039_ ;
 wire \gray_sobel0.sobel0._040_ ;
 wire \gray_sobel0.sobel0._041_ ;
 wire \gray_sobel0.sobel0._042_ ;
 wire \gray_sobel0.sobel0._043_ ;
 wire \gray_sobel0.sobel0._044_ ;
 wire \gray_sobel0.sobel0._045_ ;
 wire \gray_sobel0.sobel0._046_ ;
 wire \gray_sobel0.sobel0._047_ ;
 wire \gray_sobel0.sobel0._048_ ;
 wire \gray_sobel0.sobel0._049_ ;
 wire \gray_sobel0.sobel0._050_ ;
 wire \gray_sobel0.sobel0._051_ ;
 wire \gray_sobel0.sobel0._052_ ;
 wire \gray_sobel0.sobel0._053_ ;
 wire \gray_sobel0.sobel0._054_ ;
 wire \gray_sobel0.sobel0._055_ ;
 wire \gray_sobel0.sobel0._056_ ;
 wire \gray_sobel0.sobel0._057_ ;
 wire \gray_sobel0.sobel0._058_ ;
 wire \gray_sobel0.sobel0._059_ ;
 wire \gray_sobel0.sobel0._060_ ;
 wire \gray_sobel0.sobel0._061_ ;
 wire \gray_sobel0.sobel0._062_ ;
 wire \gray_sobel0.sobel0._063_ ;
 wire \gray_sobel0.sobel0._064_ ;
 wire \gray_sobel0.sobel0._065_ ;
 wire \gray_sobel0.sobel0._066_ ;
 wire \gray_sobel0.sobel0._067_ ;
 wire \gray_sobel0.sobel0._068_ ;
 wire \gray_sobel0.sobel0._069_ ;
 wire \gray_sobel0.sobel0._070_ ;
 wire \gray_sobel0.sobel0._071_ ;
 wire \gray_sobel0.sobel0._072_ ;
 wire \gray_sobel0.sobel0._073_ ;
 wire \gray_sobel0.sobel0._074_ ;
 wire \gray_sobel0.sobel0._075_ ;
 wire \gray_sobel0.sobel0._076_ ;
 wire \gray_sobel0.sobel0._077_ ;
 wire \gray_sobel0.sobel0._078_ ;
 wire \gray_sobel0.sobel0._079_ ;
 wire \gray_sobel0.sobel0._080_ ;
 wire \gray_sobel0.sobel0._081_ ;
 wire \gray_sobel0.sobel0._082_ ;
 wire \gray_sobel0.sobel0._083_ ;
 wire \gray_sobel0.sobel0._084_ ;
 wire \gray_sobel0.sobel0._085_ ;
 wire \gray_sobel0.sobel0._086_ ;
 wire \gray_sobel0.sobel0._087_ ;
 wire \gray_sobel0.sobel0._088_ ;
 wire \gray_sobel0.sobel0._089_ ;
 wire \gray_sobel0.sobel0._090_ ;
 wire \gray_sobel0.sobel0._091_ ;
 wire \gray_sobel0.sobel0._092_ ;
 wire \gray_sobel0.sobel0._093_ ;
 wire \gray_sobel0.sobel0._094_ ;
 wire \gray_sobel0.sobel0._095_ ;
 wire \gray_sobel0.sobel0._096_ ;
 wire \gray_sobel0.sobel0._097_ ;
 wire \gray_sobel0.sobel0._098_ ;
 wire \gray_sobel0.sobel0._099_ ;
 wire \gray_sobel0.sobel0._100_ ;
 wire \gray_sobel0.sobel0._101_ ;
 wire \gray_sobel0.sobel0._102_ ;
 wire \gray_sobel0.sobel0._103_ ;
 wire \gray_sobel0.sobel0._104_ ;
 wire \gray_sobel0.sobel0._105_ ;
 wire \gray_sobel0.sobel0._106_ ;
 wire \gray_sobel0.sobel0._107_ ;
 wire \gray_sobel0.sobel0._108_ ;
 wire \gray_sobel0.sobel0._109_ ;
 wire \gray_sobel0.sobel0._110_ ;
 wire \gray_sobel0.sobel0._111_ ;
 wire \gray_sobel0.sobel0._112_ ;
 wire \gray_sobel0.sobel0._113_ ;
 wire \gray_sobel0.sobel0._114_ ;
 wire \gray_sobel0.sobel0._115_ ;
 wire \gray_sobel0.sobel0._116_ ;
 wire \gray_sobel0.sobel0._117_ ;
 wire \gray_sobel0.sobel0._118_ ;
 wire \gray_sobel0.sobel0._119_ ;
 wire \gray_sobel0.sobel0._120_ ;
 wire \gray_sobel0.sobel0._121_ ;
 wire \gray_sobel0.sobel0._122_ ;
 wire \gray_sobel0.sobel0._123_ ;
 wire \gray_sobel0.sobel0._124_ ;
 wire \gray_sobel0.sobel0._125_ ;
 wire \gray_sobel0.sobel0._126_ ;
 wire \gray_sobel0.sobel0._127_ ;
 wire \gray_sobel0.sobel0._128_ ;
 wire \gray_sobel0.sobel0._129_ ;
 wire \gray_sobel0.sobel0._130_ ;
 wire \gray_sobel0.sobel0._131_ ;
 wire \gray_sobel0.sobel0._132_ ;
 wire \gray_sobel0.sobel0._133_ ;
 wire \gray_sobel0.sobel0._134_ ;
 wire \gray_sobel0.sobel0._135_ ;
 wire \gray_sobel0.sobel0._136_ ;
 wire \gray_sobel0.sobel0._137_ ;
 wire \gray_sobel0.sobel0._138_ ;
 wire \gray_sobel0.sobel0._139_ ;
 wire \gray_sobel0.sobel0._140_ ;
 wire \gray_sobel0.sobel0._141_ ;
 wire \gray_sobel0.sobel0._142_ ;
 wire \gray_sobel0.sobel0._143_ ;
 wire \gray_sobel0.sobel0._144_ ;
 wire \gray_sobel0.sobel0._145_ ;
 wire \gray_sobel0.sobel0._146_ ;
 wire \gray_sobel0.sobel0._147_ ;
 wire \gray_sobel0.sobel0._148_ ;
 wire \gray_sobel0.sobel0._149_ ;
 wire \gray_sobel0.sobel0._150_ ;
 wire \gray_sobel0.sobel0._151_ ;
 wire \gray_sobel0.sobel0._152_ ;
 wire \gray_sobel0.sobel0._153_ ;
 wire \gray_sobel0.sobel0._154_ ;
 wire \gray_sobel0.sobel0._155_ ;
 wire \gray_sobel0.sobel0._156_ ;
 wire \gray_sobel0.sobel0._157_ ;
 wire \gray_sobel0.sobel0._158_ ;
 wire \gray_sobel0.sobel0._159_ ;
 wire \gray_sobel0.sobel0._160_ ;
 wire \gray_sobel0.sobel0._161_ ;
 wire \gray_sobel0.sobel0._162_ ;
 wire \gray_sobel0.sobel0._163_ ;
 wire \gray_sobel0.sobel0._164_ ;
 wire \gray_sobel0.sobel0._165_ ;
 wire \gray_sobel0.sobel0._166_ ;
 wire \gray_sobel0.sobel0._167_ ;
 wire \gray_sobel0.sobel0._168_ ;
 wire \gray_sobel0.sobel0._169_ ;
 wire \gray_sobel0.sobel0._170_ ;
 wire \gray_sobel0.sobel0._171_ ;
 wire \gray_sobel0.sobel0._172_ ;
 wire \gray_sobel0.sobel0._173_ ;
 wire \gray_sobel0.sobel0._174_ ;
 wire \gray_sobel0.sobel0._175_ ;
 wire \gray_sobel0.sobel0._176_ ;
 wire \gray_sobel0.sobel0._177_ ;
 wire \gray_sobel0.sobel0._178_ ;
 wire \gray_sobel0.sobel0._179_ ;
 wire \gray_sobel0.sobel0._180_ ;
 wire \gray_sobel0.sobel0._181_ ;
 wire \gray_sobel0.sobel0._182_ ;
 wire \gray_sobel0.sobel0._183_ ;
 wire \gray_sobel0.sobel0._184_ ;
 wire \gray_sobel0.sobel0._185_ ;
 wire \gray_sobel0.sobel0._186_ ;
 wire \gray_sobel0.sobel0._187_ ;
 wire \gray_sobel0.sobel0._188_ ;
 wire \gray_sobel0.sobel0._189_ ;
 wire \gray_sobel0.sobel0._190_ ;
 wire \gray_sobel0.sobel0._191_ ;
 wire \gray_sobel0.sobel0._192_ ;
 wire \gray_sobel0.sobel0._193_ ;
 wire \gray_sobel0.sobel0._194_ ;
 wire \gray_sobel0.sobel0._195_ ;
 wire \gray_sobel0.sobel0._196_ ;
 wire \gray_sobel0.sobel0._197_ ;
 wire \gray_sobel0.sobel0._198_ ;
 wire \gray_sobel0.sobel0._199_ ;
 wire \gray_sobel0.sobel0._200_ ;
 wire \gray_sobel0.sobel0._201_ ;
 wire \gray_sobel0.sobel0._202_ ;
 wire \gray_sobel0.sobel0._203_ ;
 wire \gray_sobel0.sobel0._204_ ;
 wire \gray_sobel0.sobel0._205_ ;
 wire \gray_sobel0.sobel0._206_ ;
 wire \gray_sobel0.sobel0._207_ ;
 wire \gray_sobel0.sobel0._208_ ;
 wire \gray_sobel0.sobel0._209_ ;
 wire \gray_sobel0.sobel0._210_ ;
 wire \gray_sobel0.sobel0._211_ ;
 wire \gray_sobel0.sobel0._212_ ;
 wire \gray_sobel0.sobel0._213_ ;
 wire \gray_sobel0.sobel0._214_ ;
 wire \gray_sobel0.sobel0._215_ ;
 wire \gray_sobel0.sobel0._216_ ;
 wire \gray_sobel0.sobel0._217_ ;
 wire \gray_sobel0.sobel0._218_ ;
 wire \gray_sobel0.sobel0._219_ ;
 wire \gray_sobel0.sobel0._220_ ;
 wire \gray_sobel0.sobel0._221_ ;
 wire \gray_sobel0.sobel0._222_ ;
 wire \gray_sobel0.sobel0._223_ ;
 wire \gray_sobel0.sobel0._224_ ;
 wire \gray_sobel0.sobel0._225_ ;
 wire \gray_sobel0.sobel0._226_ ;
 wire \gray_sobel0.sobel0._227_ ;
 wire \gray_sobel0.sobel0._228_ ;
 wire \gray_sobel0.sobel0._229_ ;
 wire \gray_sobel0.sobel0._230_ ;
 wire \gray_sobel0.sobel0._231_ ;
 wire \gray_sobel0.sobel0._232_ ;
 wire \gray_sobel0.sobel0._233_ ;
 wire \gray_sobel0.sobel0._234_ ;
 wire \gray_sobel0.sobel0._235_ ;
 wire \gray_sobel0.sobel0._236_ ;
 wire \gray_sobel0.sobel0._237_ ;
 wire \gray_sobel0.sobel0._238_ ;
 wire \gray_sobel0.sobel0._239_ ;
 wire \gray_sobel0.sobel0._240_ ;
 wire \gray_sobel0.sobel0._241_ ;
 wire \gray_sobel0.sobel0._242_ ;
 wire \gray_sobel0.sobel0._243_ ;
 wire \gray_sobel0.sobel0._244_ ;
 wire \gray_sobel0.sobel0._245_ ;
 wire \gray_sobel0.sobel0._246_ ;
 wire \gray_sobel0.sobel0._247_ ;
 wire \gray_sobel0.sobel0._248_ ;
 wire \gray_sobel0.sobel0._249_ ;
 wire \gray_sobel0.sobel0._250_ ;
 wire \gray_sobel0.sobel0._251_ ;
 wire \gray_sobel0.sobel0._252_ ;
 wire \gray_sobel0.sobel0._253_ ;
 wire \gray_sobel0.sobel0._254_ ;
 wire \gray_sobel0.sobel0._255_ ;
 wire \gray_sobel0.sobel0._256_ ;
 wire \gray_sobel0.sobel0._257_ ;
 wire \gray_sobel0.sobel0._258_ ;
 wire \gray_sobel0.sobel0._259_ ;
 wire \gray_sobel0.sobel0._260_ ;
 wire \gray_sobel0.sobel0._261_ ;
 wire \gray_sobel0.sobel0._262_ ;
 wire \gray_sobel0.sobel0._263_ ;
 wire \gray_sobel0.sobel0._264_ ;
 wire \gray_sobel0.sobel0._265_ ;
 wire \gray_sobel0.sobel0._266_ ;
 wire \gray_sobel0.sobel0._267_ ;
 wire \gray_sobel0.sobel0._268_ ;
 wire \gray_sobel0.sobel0._269_ ;
 wire \gray_sobel0.sobel0._270_ ;
 wire \gray_sobel0.sobel0._271_ ;
 wire \gray_sobel0.sobel0._272_ ;
 wire \gray_sobel0.sobel0._273_ ;
 wire \gray_sobel0.sobel0._274_ ;
 wire \gray_sobel0.sobel0._275_ ;
 wire \gray_sobel0.sobel0._276_ ;
 wire \gray_sobel0.sobel0._277_ ;
 wire \gray_sobel0.sobel0._278_ ;
 wire \gray_sobel0.sobel0._279_ ;
 wire \gray_sobel0.sobel0._280_ ;
 wire \gray_sobel0.sobel0._281_ ;
 wire \gray_sobel0.sobel0._282_ ;
 wire \gray_sobel0.sobel0._283_ ;
 wire \gray_sobel0.sobel0._284_ ;
 wire \gray_sobel0.sobel0._285_ ;
 wire \gray_sobel0.sobel0._286_ ;
 wire \gray_sobel0.sobel0._287_ ;
 wire \gray_sobel0.sobel0._288_ ;
 wire \gray_sobel0.sobel0._289_ ;
 wire \gray_sobel0.sobel0._290_ ;
 wire \gray_sobel0.sobel0._291_ ;
 wire \gray_sobel0.sobel0._292_ ;
 wire \gray_sobel0.sobel0._293_ ;
 wire \gray_sobel0.sobel0._294_ ;
 wire \gray_sobel0.sobel0._295_ ;
 wire \gray_sobel0.sobel0._296_ ;
 wire \gray_sobel0.sobel0._297_ ;
 wire \gray_sobel0.sobel0._298_ ;
 wire \gray_sobel0.sobel0._299_ ;
 wire \gray_sobel0.sobel0._300_ ;
 wire \gray_sobel0.sobel0._301_ ;
 wire \gray_sobel0.sobel0._302_ ;
 wire \gray_sobel0.sobel0._303_ ;
 wire \gray_sobel0.sobel0._304_ ;
 wire \gray_sobel0.sobel0._305_ ;
 wire \gray_sobel0.sobel0._306_ ;
 wire \gray_sobel0.sobel0._307_ ;
 wire \gray_sobel0.sobel0._308_ ;
 wire \gray_sobel0.sobel0._309_ ;
 wire \gray_sobel0.sobel0._310_ ;
 wire \gray_sobel0.sobel0._311_ ;
 wire \gray_sobel0.sobel0._312_ ;
 wire \gray_sobel0.sobel0._313_ ;
 wire \gray_sobel0.sobel0._314_ ;
 wire \gray_sobel0.sobel0._315_ ;
 wire \gray_sobel0.sobel0._316_ ;
 wire \gray_sobel0.sobel0._317_ ;
 wire \gray_sobel0.sobel0._318_ ;
 wire \gray_sobel0.sobel0._319_ ;
 wire \gray_sobel0.sobel0._320_ ;
 wire \gray_sobel0.sobel0._321_ ;
 wire \gray_sobel0.sobel0._322_ ;
 wire \gray_sobel0.sobel0._323_ ;
 wire \gray_sobel0.sobel0._324_ ;
 wire \gray_sobel0.sobel0._325_ ;
 wire \gray_sobel0.sobel0._326_ ;
 wire \gray_sobel0.sobel0._327_ ;
 wire \gray_sobel0.sobel0._328_ ;
 wire \gray_sobel0.sobel0._329_ ;
 wire \gray_sobel0.sobel0._330_ ;
 wire \gray_sobel0.sobel0._331_ ;
 wire \gray_sobel0.sobel0._332_ ;
 wire \gray_sobel0.sobel0._333_ ;
 wire \gray_sobel0.sobel0._334_ ;
 wire \gray_sobel0.sobel0._335_ ;
 wire \gray_sobel0.sobel0._336_ ;
 wire \gray_sobel0.sobel0._337_ ;
 wire \gray_sobel0.sobel0._338_ ;
 wire \gray_sobel0.sobel0._339_ ;
 wire \gray_sobel0.sobel0._340_ ;
 wire \gray_sobel0.sobel0._341_ ;
 wire \gray_sobel0.sobel0._342_ ;
 wire \gray_sobel0.sobel0._343_ ;
 wire \gray_sobel0.sobel0._344_ ;
 wire \gray_sobel0.sobel0._345_ ;
 wire \gray_sobel0.sobel0._346_ ;
 wire \gray_sobel0.sobel0._347_ ;
 wire \gray_sobel0.sobel0._348_ ;
 wire \gray_sobel0.sobel0._349_ ;
 wire \gray_sobel0.sobel0._350_ ;
 wire \gray_sobel0.sobel0._351_ ;
 wire \gray_sobel0.sobel0._352_ ;
 wire \gray_sobel0.sobel0._353_ ;
 wire \gray_sobel0.sobel0._354_ ;
 wire \gray_sobel0.sobel0._355_ ;
 wire \gray_sobel0.sobel0._356_ ;
 wire \gray_sobel0.sobel0._357_ ;
 wire \gray_sobel0.sobel0._358_ ;
 wire \gray_sobel0.sobel0._359_ ;
 wire \gray_sobel0.sobel0._360_ ;
 wire \gray_sobel0.sobel0._361_ ;
 wire \gray_sobel0.sobel0._362_ ;
 wire \gray_sobel0.sobel0._363_ ;
 wire \gray_sobel0.sobel0._364_ ;
 wire \gray_sobel0.sobel0._365_ ;
 wire \gray_sobel0.sobel0._366_ ;
 wire \gray_sobel0.sobel0._367_ ;
 wire \gray_sobel0.sobel0.counter_pixels[0] ;
 wire \gray_sobel0.sobel0.counter_pixels[10] ;
 wire \gray_sobel0.sobel0.counter_pixels[11] ;
 wire \gray_sobel0.sobel0.counter_pixels[12] ;
 wire \gray_sobel0.sobel0.counter_pixels[13] ;
 wire \gray_sobel0.sobel0.counter_pixels[14] ;
 wire \gray_sobel0.sobel0.counter_pixels[15] ;
 wire \gray_sobel0.sobel0.counter_pixels[16] ;
 wire \gray_sobel0.sobel0.counter_pixels[17] ;
 wire \gray_sobel0.sobel0.counter_pixels[18] ;
 wire \gray_sobel0.sobel0.counter_pixels[19] ;
 wire \gray_sobel0.sobel0.counter_pixels[1] ;
 wire \gray_sobel0.sobel0.counter_pixels[20] ;
 wire \gray_sobel0.sobel0.counter_pixels[21] ;
 wire \gray_sobel0.sobel0.counter_pixels[22] ;
 wire \gray_sobel0.sobel0.counter_pixels[23] ;
 wire \gray_sobel0.sobel0.counter_pixels[2] ;
 wire \gray_sobel0.sobel0.counter_pixels[3] ;
 wire \gray_sobel0.sobel0.counter_pixels[4] ;
 wire \gray_sobel0.sobel0.counter_pixels[5] ;
 wire \gray_sobel0.sobel0.counter_pixels[6] ;
 wire \gray_sobel0.sobel0.counter_pixels[7] ;
 wire \gray_sobel0.sobel0.counter_pixels[8] ;
 wire \gray_sobel0.sobel0.counter_pixels[9] ;
 wire \gray_sobel0.sobel0.counter_sobel[0] ;
 wire \gray_sobel0.sobel0.counter_sobel[1] ;
 wire \gray_sobel0.sobel0.counter_sobel[2] ;
 wire \gray_sobel0.sobel0.counter_sobel[3] ;
 wire \gray_sobel0.sobel0.fsm_state[0] ;
 wire \gray_sobel0.sobel0.fsm_state[1] ;
 wire \gray_sobel0.sobel0.next[0] ;
 wire \gray_sobel0.sobel0.next[1] ;
 wire \gray_sobel0.sobel0.out_sobel_core[0] ;
 wire \gray_sobel0.sobel0.out_sobel_core[1] ;
 wire \gray_sobel0.sobel0.out_sobel_core[2] ;
 wire \gray_sobel0.sobel0.out_sobel_core[3] ;
 wire \gray_sobel0.sobel0.out_sobel_core[4] ;
 wire \gray_sobel0.sobel0.out_sobel_core[5] ;
 wire \gray_sobel0.sobel0.out_sobel_core[6] ;
 wire \gray_sobel0.sobel0.out_sobel_core[7] ;
 wire \gray_sobel0.sobel0.px_ready ;
 wire \gray_sobel0.sobel0.sobel._0000_ ;
 wire \gray_sobel0.sobel0.sobel._0001_ ;
 wire \gray_sobel0.sobel0.sobel._0002_ ;
 wire \gray_sobel0.sobel0.sobel._0003_ ;
 wire \gray_sobel0.sobel0.sobel._0004_ ;
 wire \gray_sobel0.sobel0.sobel._0005_ ;
 wire \gray_sobel0.sobel0.sobel._0006_ ;
 wire \gray_sobel0.sobel0.sobel._0007_ ;
 wire \gray_sobel0.sobel0.sobel._0008_ ;
 wire \gray_sobel0.sobel0.sobel._0009_ ;
 wire \gray_sobel0.sobel0.sobel._0010_ ;
 wire \gray_sobel0.sobel0.sobel._0011_ ;
 wire \gray_sobel0.sobel0.sobel._0012_ ;
 wire \gray_sobel0.sobel0.sobel._0013_ ;
 wire \gray_sobel0.sobel0.sobel._0014_ ;
 wire \gray_sobel0.sobel0.sobel._0015_ ;
 wire \gray_sobel0.sobel0.sobel._0016_ ;
 wire \gray_sobel0.sobel0.sobel._0017_ ;
 wire \gray_sobel0.sobel0.sobel._0018_ ;
 wire \gray_sobel0.sobel0.sobel._0019_ ;
 wire \gray_sobel0.sobel0.sobel._0020_ ;
 wire \gray_sobel0.sobel0.sobel._0021_ ;
 wire \gray_sobel0.sobel0.sobel._0022_ ;
 wire \gray_sobel0.sobel0.sobel._0023_ ;
 wire \gray_sobel0.sobel0.sobel._0024_ ;
 wire \gray_sobel0.sobel0.sobel._0025_ ;
 wire \gray_sobel0.sobel0.sobel._0026_ ;
 wire \gray_sobel0.sobel0.sobel._0027_ ;
 wire \gray_sobel0.sobel0.sobel._0028_ ;
 wire \gray_sobel0.sobel0.sobel._0029_ ;
 wire \gray_sobel0.sobel0.sobel._0030_ ;
 wire \gray_sobel0.sobel0.sobel._0031_ ;
 wire \gray_sobel0.sobel0.sobel._0032_ ;
 wire \gray_sobel0.sobel0.sobel._0033_ ;
 wire \gray_sobel0.sobel0.sobel._0034_ ;
 wire \gray_sobel0.sobel0.sobel._0035_ ;
 wire \gray_sobel0.sobel0.sobel._0036_ ;
 wire \gray_sobel0.sobel0.sobel._0037_ ;
 wire \gray_sobel0.sobel0.sobel._0038_ ;
 wire \gray_sobel0.sobel0.sobel._0039_ ;
 wire \gray_sobel0.sobel0.sobel._0040_ ;
 wire \gray_sobel0.sobel0.sobel._0041_ ;
 wire \gray_sobel0.sobel0.sobel._0042_ ;
 wire \gray_sobel0.sobel0.sobel._0043_ ;
 wire \gray_sobel0.sobel0.sobel._0044_ ;
 wire \gray_sobel0.sobel0.sobel._0045_ ;
 wire \gray_sobel0.sobel0.sobel._0046_ ;
 wire \gray_sobel0.sobel0.sobel._0047_ ;
 wire \gray_sobel0.sobel0.sobel._0048_ ;
 wire \gray_sobel0.sobel0.sobel._0049_ ;
 wire \gray_sobel0.sobel0.sobel._0050_ ;
 wire \gray_sobel0.sobel0.sobel._0051_ ;
 wire \gray_sobel0.sobel0.sobel._0052_ ;
 wire \gray_sobel0.sobel0.sobel._0053_ ;
 wire \gray_sobel0.sobel0.sobel._0054_ ;
 wire \gray_sobel0.sobel0.sobel._0055_ ;
 wire \gray_sobel0.sobel0.sobel._0056_ ;
 wire \gray_sobel0.sobel0.sobel._0057_ ;
 wire \gray_sobel0.sobel0.sobel._0058_ ;
 wire \gray_sobel0.sobel0.sobel._0059_ ;
 wire \gray_sobel0.sobel0.sobel._0060_ ;
 wire \gray_sobel0.sobel0.sobel._0061_ ;
 wire \gray_sobel0.sobel0.sobel._0062_ ;
 wire \gray_sobel0.sobel0.sobel._0063_ ;
 wire \gray_sobel0.sobel0.sobel._0064_ ;
 wire \gray_sobel0.sobel0.sobel._0065_ ;
 wire \gray_sobel0.sobel0.sobel._0066_ ;
 wire \gray_sobel0.sobel0.sobel._0067_ ;
 wire \gray_sobel0.sobel0.sobel._0068_ ;
 wire \gray_sobel0.sobel0.sobel._0069_ ;
 wire \gray_sobel0.sobel0.sobel._0070_ ;
 wire \gray_sobel0.sobel0.sobel._0071_ ;
 wire \gray_sobel0.sobel0.sobel._0072_ ;
 wire \gray_sobel0.sobel0.sobel._0073_ ;
 wire \gray_sobel0.sobel0.sobel._0074_ ;
 wire \gray_sobel0.sobel0.sobel._0075_ ;
 wire \gray_sobel0.sobel0.sobel._0076_ ;
 wire \gray_sobel0.sobel0.sobel._0077_ ;
 wire \gray_sobel0.sobel0.sobel._0078_ ;
 wire \gray_sobel0.sobel0.sobel._0079_ ;
 wire \gray_sobel0.sobel0.sobel._0080_ ;
 wire \gray_sobel0.sobel0.sobel._0081_ ;
 wire \gray_sobel0.sobel0.sobel._0082_ ;
 wire \gray_sobel0.sobel0.sobel._0083_ ;
 wire \gray_sobel0.sobel0.sobel._0084_ ;
 wire \gray_sobel0.sobel0.sobel._0085_ ;
 wire \gray_sobel0.sobel0.sobel._0086_ ;
 wire \gray_sobel0.sobel0.sobel._0087_ ;
 wire \gray_sobel0.sobel0.sobel._0088_ ;
 wire \gray_sobel0.sobel0.sobel._0089_ ;
 wire \gray_sobel0.sobel0.sobel._0090_ ;
 wire \gray_sobel0.sobel0.sobel._0091_ ;
 wire \gray_sobel0.sobel0.sobel._0092_ ;
 wire \gray_sobel0.sobel0.sobel._0093_ ;
 wire \gray_sobel0.sobel0.sobel._0094_ ;
 wire \gray_sobel0.sobel0.sobel._0095_ ;
 wire \gray_sobel0.sobel0.sobel._0096_ ;
 wire \gray_sobel0.sobel0.sobel._0097_ ;
 wire \gray_sobel0.sobel0.sobel._0098_ ;
 wire \gray_sobel0.sobel0.sobel._0099_ ;
 wire \gray_sobel0.sobel0.sobel._0100_ ;
 wire \gray_sobel0.sobel0.sobel._0101_ ;
 wire \gray_sobel0.sobel0.sobel._0102_ ;
 wire \gray_sobel0.sobel0.sobel._0103_ ;
 wire \gray_sobel0.sobel0.sobel._0104_ ;
 wire \gray_sobel0.sobel0.sobel._0105_ ;
 wire \gray_sobel0.sobel0.sobel._0106_ ;
 wire \gray_sobel0.sobel0.sobel._0107_ ;
 wire \gray_sobel0.sobel0.sobel._0108_ ;
 wire \gray_sobel0.sobel0.sobel._0109_ ;
 wire \gray_sobel0.sobel0.sobel._0110_ ;
 wire \gray_sobel0.sobel0.sobel._0111_ ;
 wire \gray_sobel0.sobel0.sobel._0112_ ;
 wire \gray_sobel0.sobel0.sobel._0113_ ;
 wire \gray_sobel0.sobel0.sobel._0114_ ;
 wire \gray_sobel0.sobel0.sobel._0115_ ;
 wire \gray_sobel0.sobel0.sobel._0116_ ;
 wire \gray_sobel0.sobel0.sobel._0117_ ;
 wire \gray_sobel0.sobel0.sobel._0118_ ;
 wire \gray_sobel0.sobel0.sobel._0119_ ;
 wire \gray_sobel0.sobel0.sobel._0120_ ;
 wire \gray_sobel0.sobel0.sobel._0121_ ;
 wire \gray_sobel0.sobel0.sobel._0122_ ;
 wire \gray_sobel0.sobel0.sobel._0123_ ;
 wire \gray_sobel0.sobel0.sobel._0124_ ;
 wire \gray_sobel0.sobel0.sobel._0125_ ;
 wire \gray_sobel0.sobel0.sobel._0126_ ;
 wire \gray_sobel0.sobel0.sobel._0127_ ;
 wire \gray_sobel0.sobel0.sobel._0128_ ;
 wire \gray_sobel0.sobel0.sobel._0129_ ;
 wire \gray_sobel0.sobel0.sobel._0130_ ;
 wire \gray_sobel0.sobel0.sobel._0131_ ;
 wire \gray_sobel0.sobel0.sobel._0132_ ;
 wire \gray_sobel0.sobel0.sobel._0133_ ;
 wire \gray_sobel0.sobel0.sobel._0134_ ;
 wire \gray_sobel0.sobel0.sobel._0135_ ;
 wire \gray_sobel0.sobel0.sobel._0136_ ;
 wire \gray_sobel0.sobel0.sobel._0137_ ;
 wire \gray_sobel0.sobel0.sobel._0138_ ;
 wire \gray_sobel0.sobel0.sobel._0139_ ;
 wire \gray_sobel0.sobel0.sobel._0140_ ;
 wire \gray_sobel0.sobel0.sobel._0141_ ;
 wire \gray_sobel0.sobel0.sobel._0142_ ;
 wire \gray_sobel0.sobel0.sobel._0143_ ;
 wire \gray_sobel0.sobel0.sobel._0144_ ;
 wire \gray_sobel0.sobel0.sobel._0145_ ;
 wire \gray_sobel0.sobel0.sobel._0146_ ;
 wire \gray_sobel0.sobel0.sobel._0147_ ;
 wire \gray_sobel0.sobel0.sobel._0148_ ;
 wire \gray_sobel0.sobel0.sobel._0149_ ;
 wire \gray_sobel0.sobel0.sobel._0150_ ;
 wire \gray_sobel0.sobel0.sobel._0151_ ;
 wire \gray_sobel0.sobel0.sobel._0152_ ;
 wire \gray_sobel0.sobel0.sobel._0153_ ;
 wire \gray_sobel0.sobel0.sobel._0154_ ;
 wire \gray_sobel0.sobel0.sobel._0155_ ;
 wire \gray_sobel0.sobel0.sobel._0156_ ;
 wire \gray_sobel0.sobel0.sobel._0157_ ;
 wire \gray_sobel0.sobel0.sobel._0158_ ;
 wire \gray_sobel0.sobel0.sobel._0159_ ;
 wire \gray_sobel0.sobel0.sobel._0160_ ;
 wire \gray_sobel0.sobel0.sobel._0161_ ;
 wire \gray_sobel0.sobel0.sobel._0162_ ;
 wire \gray_sobel0.sobel0.sobel._0163_ ;
 wire \gray_sobel0.sobel0.sobel._0164_ ;
 wire \gray_sobel0.sobel0.sobel._0165_ ;
 wire \gray_sobel0.sobel0.sobel._0166_ ;
 wire \gray_sobel0.sobel0.sobel._0167_ ;
 wire \gray_sobel0.sobel0.sobel._0168_ ;
 wire \gray_sobel0.sobel0.sobel._0169_ ;
 wire \gray_sobel0.sobel0.sobel._0170_ ;
 wire \gray_sobel0.sobel0.sobel._0171_ ;
 wire \gray_sobel0.sobel0.sobel._0172_ ;
 wire \gray_sobel0.sobel0.sobel._0173_ ;
 wire \gray_sobel0.sobel0.sobel._0174_ ;
 wire \gray_sobel0.sobel0.sobel._0175_ ;
 wire \gray_sobel0.sobel0.sobel._0176_ ;
 wire \gray_sobel0.sobel0.sobel._0177_ ;
 wire \gray_sobel0.sobel0.sobel._0178_ ;
 wire \gray_sobel0.sobel0.sobel._0179_ ;
 wire \gray_sobel0.sobel0.sobel._0180_ ;
 wire \gray_sobel0.sobel0.sobel._0181_ ;
 wire \gray_sobel0.sobel0.sobel._0182_ ;
 wire \gray_sobel0.sobel0.sobel._0183_ ;
 wire \gray_sobel0.sobel0.sobel._0184_ ;
 wire \gray_sobel0.sobel0.sobel._0185_ ;
 wire \gray_sobel0.sobel0.sobel._0186_ ;
 wire \gray_sobel0.sobel0.sobel._0187_ ;
 wire \gray_sobel0.sobel0.sobel._0188_ ;
 wire \gray_sobel0.sobel0.sobel._0189_ ;
 wire \gray_sobel0.sobel0.sobel._0190_ ;
 wire \gray_sobel0.sobel0.sobel._0191_ ;
 wire \gray_sobel0.sobel0.sobel._0192_ ;
 wire \gray_sobel0.sobel0.sobel._0193_ ;
 wire \gray_sobel0.sobel0.sobel._0194_ ;
 wire \gray_sobel0.sobel0.sobel._0195_ ;
 wire \gray_sobel0.sobel0.sobel._0196_ ;
 wire \gray_sobel0.sobel0.sobel._0197_ ;
 wire \gray_sobel0.sobel0.sobel._0198_ ;
 wire \gray_sobel0.sobel0.sobel._0199_ ;
 wire \gray_sobel0.sobel0.sobel._0200_ ;
 wire \gray_sobel0.sobel0.sobel._0201_ ;
 wire \gray_sobel0.sobel0.sobel._0202_ ;
 wire \gray_sobel0.sobel0.sobel._0203_ ;
 wire \gray_sobel0.sobel0.sobel._0204_ ;
 wire \gray_sobel0.sobel0.sobel._0205_ ;
 wire \gray_sobel0.sobel0.sobel._0206_ ;
 wire \gray_sobel0.sobel0.sobel._0207_ ;
 wire \gray_sobel0.sobel0.sobel._0208_ ;
 wire \gray_sobel0.sobel0.sobel._0209_ ;
 wire \gray_sobel0.sobel0.sobel._0210_ ;
 wire \gray_sobel0.sobel0.sobel._0211_ ;
 wire \gray_sobel0.sobel0.sobel._0212_ ;
 wire \gray_sobel0.sobel0.sobel._0213_ ;
 wire \gray_sobel0.sobel0.sobel._0214_ ;
 wire \gray_sobel0.sobel0.sobel._0215_ ;
 wire \gray_sobel0.sobel0.sobel._0216_ ;
 wire \gray_sobel0.sobel0.sobel._0217_ ;
 wire \gray_sobel0.sobel0.sobel._0218_ ;
 wire \gray_sobel0.sobel0.sobel._0219_ ;
 wire \gray_sobel0.sobel0.sobel._0220_ ;
 wire \gray_sobel0.sobel0.sobel._0221_ ;
 wire \gray_sobel0.sobel0.sobel._0222_ ;
 wire \gray_sobel0.sobel0.sobel._0223_ ;
 wire \gray_sobel0.sobel0.sobel._0224_ ;
 wire \gray_sobel0.sobel0.sobel._0225_ ;
 wire \gray_sobel0.sobel0.sobel._0226_ ;
 wire \gray_sobel0.sobel0.sobel._0227_ ;
 wire \gray_sobel0.sobel0.sobel._0228_ ;
 wire \gray_sobel0.sobel0.sobel._0229_ ;
 wire \gray_sobel0.sobel0.sobel._0230_ ;
 wire \gray_sobel0.sobel0.sobel._0231_ ;
 wire \gray_sobel0.sobel0.sobel._0232_ ;
 wire \gray_sobel0.sobel0.sobel._0233_ ;
 wire \gray_sobel0.sobel0.sobel._0234_ ;
 wire \gray_sobel0.sobel0.sobel._0235_ ;
 wire \gray_sobel0.sobel0.sobel._0236_ ;
 wire \gray_sobel0.sobel0.sobel._0237_ ;
 wire \gray_sobel0.sobel0.sobel._0238_ ;
 wire \gray_sobel0.sobel0.sobel._0239_ ;
 wire \gray_sobel0.sobel0.sobel._0240_ ;
 wire \gray_sobel0.sobel0.sobel._0241_ ;
 wire \gray_sobel0.sobel0.sobel._0242_ ;
 wire \gray_sobel0.sobel0.sobel._0243_ ;
 wire \gray_sobel0.sobel0.sobel._0244_ ;
 wire \gray_sobel0.sobel0.sobel._0245_ ;
 wire \gray_sobel0.sobel0.sobel._0246_ ;
 wire \gray_sobel0.sobel0.sobel._0247_ ;
 wire \gray_sobel0.sobel0.sobel._0248_ ;
 wire \gray_sobel0.sobel0.sobel._0249_ ;
 wire \gray_sobel0.sobel0.sobel._0250_ ;
 wire \gray_sobel0.sobel0.sobel._0251_ ;
 wire \gray_sobel0.sobel0.sobel._0252_ ;
 wire \gray_sobel0.sobel0.sobel._0253_ ;
 wire \gray_sobel0.sobel0.sobel._0254_ ;
 wire \gray_sobel0.sobel0.sobel._0255_ ;
 wire \gray_sobel0.sobel0.sobel._0256_ ;
 wire \gray_sobel0.sobel0.sobel._0257_ ;
 wire \gray_sobel0.sobel0.sobel._0258_ ;
 wire \gray_sobel0.sobel0.sobel._0259_ ;
 wire \gray_sobel0.sobel0.sobel._0260_ ;
 wire \gray_sobel0.sobel0.sobel._0261_ ;
 wire \gray_sobel0.sobel0.sobel._0262_ ;
 wire \gray_sobel0.sobel0.sobel._0263_ ;
 wire \gray_sobel0.sobel0.sobel._0264_ ;
 wire \gray_sobel0.sobel0.sobel._0265_ ;
 wire \gray_sobel0.sobel0.sobel._0266_ ;
 wire \gray_sobel0.sobel0.sobel._0267_ ;
 wire \gray_sobel0.sobel0.sobel._0268_ ;
 wire \gray_sobel0.sobel0.sobel._0269_ ;
 wire \gray_sobel0.sobel0.sobel._0270_ ;
 wire \gray_sobel0.sobel0.sobel._0271_ ;
 wire \gray_sobel0.sobel0.sobel._0272_ ;
 wire \gray_sobel0.sobel0.sobel._0273_ ;
 wire \gray_sobel0.sobel0.sobel._0274_ ;
 wire \gray_sobel0.sobel0.sobel._0275_ ;
 wire \gray_sobel0.sobel0.sobel._0276_ ;
 wire \gray_sobel0.sobel0.sobel._0277_ ;
 wire \gray_sobel0.sobel0.sobel._0278_ ;
 wire \gray_sobel0.sobel0.sobel._0279_ ;
 wire \gray_sobel0.sobel0.sobel._0280_ ;
 wire \gray_sobel0.sobel0.sobel._0281_ ;
 wire \gray_sobel0.sobel0.sobel._0282_ ;
 wire \gray_sobel0.sobel0.sobel._0283_ ;
 wire \gray_sobel0.sobel0.sobel._0284_ ;
 wire \gray_sobel0.sobel0.sobel._0285_ ;
 wire \gray_sobel0.sobel0.sobel._0286_ ;
 wire \gray_sobel0.sobel0.sobel._0287_ ;
 wire \gray_sobel0.sobel0.sobel._0288_ ;
 wire \gray_sobel0.sobel0.sobel._0289_ ;
 wire \gray_sobel0.sobel0.sobel._0290_ ;
 wire \gray_sobel0.sobel0.sobel._0291_ ;
 wire \gray_sobel0.sobel0.sobel._0292_ ;
 wire \gray_sobel0.sobel0.sobel._0293_ ;
 wire \gray_sobel0.sobel0.sobel._0294_ ;
 wire \gray_sobel0.sobel0.sobel._0295_ ;
 wire \gray_sobel0.sobel0.sobel._0296_ ;
 wire \gray_sobel0.sobel0.sobel._0297_ ;
 wire \gray_sobel0.sobel0.sobel._0298_ ;
 wire \gray_sobel0.sobel0.sobel._0299_ ;
 wire \gray_sobel0.sobel0.sobel._0300_ ;
 wire \gray_sobel0.sobel0.sobel._0301_ ;
 wire \gray_sobel0.sobel0.sobel._0302_ ;
 wire \gray_sobel0.sobel0.sobel._0303_ ;
 wire \gray_sobel0.sobel0.sobel._0304_ ;
 wire \gray_sobel0.sobel0.sobel._0305_ ;
 wire \gray_sobel0.sobel0.sobel._0306_ ;
 wire \gray_sobel0.sobel0.sobel._0307_ ;
 wire \gray_sobel0.sobel0.sobel._0308_ ;
 wire \gray_sobel0.sobel0.sobel._0309_ ;
 wire \gray_sobel0.sobel0.sobel._0310_ ;
 wire \gray_sobel0.sobel0.sobel._0311_ ;
 wire \gray_sobel0.sobel0.sobel._0312_ ;
 wire \gray_sobel0.sobel0.sobel._0313_ ;
 wire \gray_sobel0.sobel0.sobel._0314_ ;
 wire \gray_sobel0.sobel0.sobel._0315_ ;
 wire \gray_sobel0.sobel0.sobel._0316_ ;
 wire \gray_sobel0.sobel0.sobel._0317_ ;
 wire \gray_sobel0.sobel0.sobel._0318_ ;
 wire \gray_sobel0.sobel0.sobel._0319_ ;
 wire \gray_sobel0.sobel0.sobel._0320_ ;
 wire \gray_sobel0.sobel0.sobel._0321_ ;
 wire \gray_sobel0.sobel0.sobel._0322_ ;
 wire \gray_sobel0.sobel0.sobel._0323_ ;
 wire \gray_sobel0.sobel0.sobel._0324_ ;
 wire \gray_sobel0.sobel0.sobel._0325_ ;
 wire \gray_sobel0.sobel0.sobel._0326_ ;
 wire \gray_sobel0.sobel0.sobel._0327_ ;
 wire \gray_sobel0.sobel0.sobel._0328_ ;
 wire \gray_sobel0.sobel0.sobel._0329_ ;
 wire \gray_sobel0.sobel0.sobel._0330_ ;
 wire \gray_sobel0.sobel0.sobel._0331_ ;
 wire \gray_sobel0.sobel0.sobel._0332_ ;
 wire \gray_sobel0.sobel0.sobel._0333_ ;
 wire \gray_sobel0.sobel0.sobel._0334_ ;
 wire \gray_sobel0.sobel0.sobel._0335_ ;
 wire \gray_sobel0.sobel0.sobel._0336_ ;
 wire \gray_sobel0.sobel0.sobel._0337_ ;
 wire \gray_sobel0.sobel0.sobel._0338_ ;
 wire \gray_sobel0.sobel0.sobel._0339_ ;
 wire \gray_sobel0.sobel0.sobel._0340_ ;
 wire \gray_sobel0.sobel0.sobel._0341_ ;
 wire \gray_sobel0.sobel0.sobel._0342_ ;
 wire \gray_sobel0.sobel0.sobel._0343_ ;
 wire \gray_sobel0.sobel0.sobel._0344_ ;
 wire \gray_sobel0.sobel0.sobel._0345_ ;
 wire \gray_sobel0.sobel0.sobel._0346_ ;
 wire \gray_sobel0.sobel0.sobel._0347_ ;
 wire \gray_sobel0.sobel0.sobel._0348_ ;
 wire \gray_sobel0.sobel0.sobel._0349_ ;
 wire \gray_sobel0.sobel0.sobel._0350_ ;
 wire \gray_sobel0.sobel0.sobel._0351_ ;
 wire \gray_sobel0.sobel0.sobel._0352_ ;
 wire \gray_sobel0.sobel0.sobel._0353_ ;
 wire \gray_sobel0.sobel0.sobel._0354_ ;
 wire \gray_sobel0.sobel0.sobel._0355_ ;
 wire \gray_sobel0.sobel0.sobel._0356_ ;
 wire \gray_sobel0.sobel0.sobel._0357_ ;
 wire \gray_sobel0.sobel0.sobel._0358_ ;
 wire \gray_sobel0.sobel0.sobel._0359_ ;
 wire \gray_sobel0.sobel0.sobel._0360_ ;
 wire \gray_sobel0.sobel0.sobel._0361_ ;
 wire \gray_sobel0.sobel0.sobel._0362_ ;
 wire \gray_sobel0.sobel0.sobel._0363_ ;
 wire \gray_sobel0.sobel0.sobel._0364_ ;
 wire \gray_sobel0.sobel0.sobel._0365_ ;
 wire \gray_sobel0.sobel0.sobel._0366_ ;
 wire \gray_sobel0.sobel0.sobel._0367_ ;
 wire \gray_sobel0.sobel0.sobel._0368_ ;
 wire \gray_sobel0.sobel0.sobel._0369_ ;
 wire \gray_sobel0.sobel0.sobel._0370_ ;
 wire \gray_sobel0.sobel0.sobel._0371_ ;
 wire \gray_sobel0.sobel0.sobel._0372_ ;
 wire \gray_sobel0.sobel0.sobel._0373_ ;
 wire \gray_sobel0.sobel0.sobel._0374_ ;
 wire \gray_sobel0.sobel0.sobel._0375_ ;
 wire \gray_sobel0.sobel0.sobel._0376_ ;
 wire \gray_sobel0.sobel0.sobel._0377_ ;
 wire \gray_sobel0.sobel0.sobel._0378_ ;
 wire \gray_sobel0.sobel0.sobel._0379_ ;
 wire \gray_sobel0.sobel0.sobel._0380_ ;
 wire \gray_sobel0.sobel0.sobel._0381_ ;
 wire \gray_sobel0.sobel0.sobel._0382_ ;
 wire \gray_sobel0.sobel0.sobel._0383_ ;
 wire \gray_sobel0.sobel0.sobel._0384_ ;
 wire \gray_sobel0.sobel0.sobel._0385_ ;
 wire \gray_sobel0.sobel0.sobel._0386_ ;
 wire \gray_sobel0.sobel0.sobel._0387_ ;
 wire \gray_sobel0.sobel0.sobel._0388_ ;
 wire \gray_sobel0.sobel0.sobel._0389_ ;
 wire \gray_sobel0.sobel0.sobel._0390_ ;
 wire \gray_sobel0.sobel0.sobel._0391_ ;
 wire \gray_sobel0.sobel0.sobel._0392_ ;
 wire \gray_sobel0.sobel0.sobel._0393_ ;
 wire \gray_sobel0.sobel0.sobel._0394_ ;
 wire \gray_sobel0.sobel0.sobel._0395_ ;
 wire \gray_sobel0.sobel0.sobel._0396_ ;
 wire \gray_sobel0.sobel0.sobel._0397_ ;
 wire \gray_sobel0.sobel0.sobel._0398_ ;
 wire \gray_sobel0.sobel0.sobel._0399_ ;
 wire \gray_sobel0.sobel0.sobel._0400_ ;
 wire \gray_sobel0.sobel0.sobel._0401_ ;
 wire \gray_sobel0.sobel0.sobel._0402_ ;
 wire \gray_sobel0.sobel0.sobel._0403_ ;
 wire \gray_sobel0.sobel0.sobel._0404_ ;
 wire \gray_sobel0.sobel0.sobel._0405_ ;
 wire \gray_sobel0.sobel0.sobel._0406_ ;
 wire \gray_sobel0.sobel0.sobel._0407_ ;
 wire \gray_sobel0.sobel0.sobel._0408_ ;
 wire \gray_sobel0.sobel0.sobel._0409_ ;
 wire \gray_sobel0.sobel0.sobel._0410_ ;
 wire \gray_sobel0.sobel0.sobel._0411_ ;
 wire \gray_sobel0.sobel0.sobel._0412_ ;
 wire \gray_sobel0.sobel0.sobel._0413_ ;
 wire \gray_sobel0.sobel0.sobel._0414_ ;
 wire \gray_sobel0.sobel0.sobel._0415_ ;
 wire \gray_sobel0.sobel0.sobel._0416_ ;
 wire \gray_sobel0.sobel0.sobel._0417_ ;
 wire \gray_sobel0.sobel0.sobel._0418_ ;
 wire \gray_sobel0.sobel0.sobel._0419_ ;
 wire \gray_sobel0.sobel0.sobel._0420_ ;
 wire \gray_sobel0.sobel0.sobel._0421_ ;
 wire \gray_sobel0.sobel0.sobel._0422_ ;
 wire \gray_sobel0.sobel0.sobel._0423_ ;
 wire \gray_sobel0.sobel0.sobel._0424_ ;
 wire \gray_sobel0.sobel0.sobel._0425_ ;
 wire \gray_sobel0.sobel0.sobel._0426_ ;
 wire \gray_sobel0.sobel0.sobel._0427_ ;
 wire \gray_sobel0.sobel0.sobel._0428_ ;
 wire \gray_sobel0.sobel0.sobel._0429_ ;
 wire \gray_sobel0.sobel0.sobel._0430_ ;
 wire \gray_sobel0.sobel0.sobel._0431_ ;
 wire \gray_sobel0.sobel0.sobel._0432_ ;
 wire \gray_sobel0.sobel0.sobel._0433_ ;
 wire \gray_sobel0.sobel0.sobel._0434_ ;
 wire \gray_sobel0.sobel0.sobel._0435_ ;
 wire \gray_sobel0.sobel0.sobel._0436_ ;
 wire \gray_sobel0.sobel0.sobel._0437_ ;
 wire \gray_sobel0.sobel0.sobel._0438_ ;
 wire \gray_sobel0.sobel0.sobel._0439_ ;
 wire \gray_sobel0.sobel0.sobel._0440_ ;
 wire \gray_sobel0.sobel0.sobel._0441_ ;
 wire \gray_sobel0.sobel0.sobel._0442_ ;
 wire \gray_sobel0.sobel0.sobel._0443_ ;
 wire \gray_sobel0.sobel0.sobel._0444_ ;
 wire \gray_sobel0.sobel0.sobel._0445_ ;
 wire \gray_sobel0.sobel0.sobel._0446_ ;
 wire \gray_sobel0.sobel0.sobel._0447_ ;
 wire \gray_sobel0.sobel0.sobel._0448_ ;
 wire \gray_sobel0.sobel0.sobel._0449_ ;
 wire \gray_sobel0.sobel0.sobel._0450_ ;
 wire \gray_sobel0.sobel0.sobel._0451_ ;
 wire \gray_sobel0.sobel0.sobel._0452_ ;
 wire \gray_sobel0.sobel0.sobel._0453_ ;
 wire \gray_sobel0.sobel0.sobel._0454_ ;
 wire \gray_sobel0.sobel0.sobel._0455_ ;
 wire \gray_sobel0.sobel0.sobel._0456_ ;
 wire \gray_sobel0.sobel0.sobel._0457_ ;
 wire \gray_sobel0.sobel0.sobel._0458_ ;
 wire \gray_sobel0.sobel0.sobel._0459_ ;
 wire \gray_sobel0.sobel0.sobel._0460_ ;
 wire \gray_sobel0.sobel0.sobel._0461_ ;
 wire \gray_sobel0.sobel0.sobel._0462_ ;
 wire \gray_sobel0.sobel0.sobel._0463_ ;
 wire \gray_sobel0.sobel0.sobel._0464_ ;
 wire \gray_sobel0.sobel0.sobel._0465_ ;
 wire \gray_sobel0.sobel0.sobel._0466_ ;
 wire \gray_sobel0.sobel0.sobel._0467_ ;
 wire \gray_sobel0.sobel0.sobel._0468_ ;
 wire \gray_sobel0.sobel0.sobel._0469_ ;
 wire \gray_sobel0.sobel0.sobel._0470_ ;
 wire \gray_sobel0.sobel0.sobel._0471_ ;
 wire \gray_sobel0.sobel0.sobel._0472_ ;
 wire \gray_sobel0.sobel0.sobel._0473_ ;
 wire \gray_sobel0.sobel0.sobel._0474_ ;
 wire \gray_sobel0.sobel0.sobel._0475_ ;
 wire \gray_sobel0.sobel0.sobel._0476_ ;
 wire \gray_sobel0.sobel0.sobel._0477_ ;
 wire \gray_sobel0.sobel0.sobel._0478_ ;
 wire \gray_sobel0.sobel0.sobel._0479_ ;
 wire \gray_sobel0.sobel0.sobel._0480_ ;
 wire \gray_sobel0.sobel0.sobel._0481_ ;
 wire \gray_sobel0.sobel0.sobel._0482_ ;
 wire \gray_sobel0.sobel0.sobel._0483_ ;
 wire \gray_sobel0.sobel0.sobel._0484_ ;
 wire \gray_sobel0.sobel0.sobel._0485_ ;
 wire \gray_sobel0.sobel0.sobel._0486_ ;
 wire \gray_sobel0.sobel0.sobel._0487_ ;
 wire \gray_sobel0.sobel0.sobel._0488_ ;
 wire \gray_sobel0.sobel0.sobel._0489_ ;
 wire \gray_sobel0.sobel0.sobel._0490_ ;
 wire \gray_sobel0.sobel0.sobel._0491_ ;
 wire \gray_sobel0.sobel0.sobel._0492_ ;
 wire \gray_sobel0.sobel0.sobel._0493_ ;
 wire \gray_sobel0.sobel0.sobel._0494_ ;
 wire \gray_sobel0.sobel0.sobel._0495_ ;
 wire \gray_sobel0.sobel0.sobel._0496_ ;
 wire \gray_sobel0.sobel0.sobel._0497_ ;
 wire \gray_sobel0.sobel0.sobel._0498_ ;
 wire \gray_sobel0.sobel0.sobel._0499_ ;
 wire \gray_sobel0.sobel0.sobel._0500_ ;
 wire \gray_sobel0.sobel0.sobel._0501_ ;
 wire \gray_sobel0.sobel0.sobel._0502_ ;
 wire \gray_sobel0.sobel0.sobel._0503_ ;
 wire \gray_sobel0.sobel0.sobel._0504_ ;
 wire \gray_sobel0.sobel0.sobel._0505_ ;
 wire \gray_sobel0.sobel0.sobel._0506_ ;
 wire \gray_sobel0.sobel0.sobel._0507_ ;
 wire \gray_sobel0.sobel0.sobel._0508_ ;
 wire \gray_sobel0.sobel0.sobel._0509_ ;
 wire \gray_sobel0.sobel0.sobel._0510_ ;
 wire \gray_sobel0.sobel0.sobel._0511_ ;
 wire \gray_sobel0.sobel0.sobel._0512_ ;
 wire \gray_sobel0.sobel0.sobel._0513_ ;
 wire \gray_sobel0.sobel0.sobel._0514_ ;
 wire \gray_sobel0.sobel0.sobel._0515_ ;
 wire \gray_sobel0.sobel0.sobel._0516_ ;
 wire \gray_sobel0.sobel0.sobel._0517_ ;
 wire \gray_sobel0.sobel0.sobel._0518_ ;
 wire \gray_sobel0.sobel0.sobel._0519_ ;
 wire \gray_sobel0.sobel0.sobel._0520_ ;
 wire \gray_sobel0.sobel0.sobel._0521_ ;
 wire \gray_sobel0.sobel0.sobel._0522_ ;
 wire \gray_sobel0.sobel0.sobel._0523_ ;
 wire \gray_sobel0.sobel0.sobel._0524_ ;
 wire \gray_sobel0.sobel0.sobel._0525_ ;
 wire \gray_sobel0.sobel0.sobel._0526_ ;
 wire \gray_sobel0.sobel0.sobel._0527_ ;
 wire \gray_sobel0.sobel0.sobel.matrix_pixels_i[0] ;
 wire \gray_sobel0.sobel0.sobel.matrix_pixels_i[10] ;
 wire \gray_sobel0.sobel0.sobel.matrix_pixels_i[11] ;
 wire \gray_sobel0.sobel0.sobel.matrix_pixels_i[12] ;
 wire \gray_sobel0.sobel0.sobel.matrix_pixels_i[13] ;
 wire \gray_sobel0.sobel0.sobel.matrix_pixels_i[14] ;
 wire \gray_sobel0.sobel0.sobel.matrix_pixels_i[15] ;
 wire \gray_sobel0.sobel0.sobel.matrix_pixels_i[16] ;
 wire \gray_sobel0.sobel0.sobel.matrix_pixels_i[17] ;
 wire \gray_sobel0.sobel0.sobel.matrix_pixels_i[18] ;
 wire \gray_sobel0.sobel0.sobel.matrix_pixels_i[19] ;
 wire \gray_sobel0.sobel0.sobel.matrix_pixels_i[1] ;
 wire \gray_sobel0.sobel0.sobel.matrix_pixels_i[20] ;
 wire \gray_sobel0.sobel0.sobel.matrix_pixels_i[21] ;
 wire \gray_sobel0.sobel0.sobel.matrix_pixels_i[22] ;
 wire \gray_sobel0.sobel0.sobel.matrix_pixels_i[23] ;
 wire \gray_sobel0.sobel0.sobel.matrix_pixels_i[24] ;
 wire \gray_sobel0.sobel0.sobel.matrix_pixels_i[25] ;
 wire \gray_sobel0.sobel0.sobel.matrix_pixels_i[26] ;
 wire \gray_sobel0.sobel0.sobel.matrix_pixels_i[27] ;
 wire \gray_sobel0.sobel0.sobel.matrix_pixels_i[28] ;
 wire \gray_sobel0.sobel0.sobel.matrix_pixels_i[29] ;
 wire \gray_sobel0.sobel0.sobel.matrix_pixels_i[2] ;
 wire \gray_sobel0.sobel0.sobel.matrix_pixels_i[30] ;
 wire \gray_sobel0.sobel0.sobel.matrix_pixels_i[31] ;
 wire \gray_sobel0.sobel0.sobel.matrix_pixels_i[32] ;
 wire \gray_sobel0.sobel0.sobel.matrix_pixels_i[33] ;
 wire \gray_sobel0.sobel0.sobel.matrix_pixels_i[34] ;
 wire \gray_sobel0.sobel0.sobel.matrix_pixels_i[35] ;
 wire \gray_sobel0.sobel0.sobel.matrix_pixels_i[36] ;
 wire \gray_sobel0.sobel0.sobel.matrix_pixels_i[37] ;
 wire \gray_sobel0.sobel0.sobel.matrix_pixels_i[38] ;
 wire \gray_sobel0.sobel0.sobel.matrix_pixels_i[39] ;
 wire \gray_sobel0.sobel0.sobel.matrix_pixels_i[3] ;
 wire \gray_sobel0.sobel0.sobel.matrix_pixels_i[40] ;
 wire \gray_sobel0.sobel0.sobel.matrix_pixels_i[41] ;
 wire \gray_sobel0.sobel0.sobel.matrix_pixels_i[42] ;
 wire \gray_sobel0.sobel0.sobel.matrix_pixels_i[43] ;
 wire \gray_sobel0.sobel0.sobel.matrix_pixels_i[44] ;
 wire \gray_sobel0.sobel0.sobel.matrix_pixels_i[45] ;
 wire \gray_sobel0.sobel0.sobel.matrix_pixels_i[46] ;
 wire \gray_sobel0.sobel0.sobel.matrix_pixels_i[47] ;
 wire \gray_sobel0.sobel0.sobel.matrix_pixels_i[48] ;
 wire \gray_sobel0.sobel0.sobel.matrix_pixels_i[49] ;
 wire \gray_sobel0.sobel0.sobel.matrix_pixels_i[4] ;
 wire \gray_sobel0.sobel0.sobel.matrix_pixels_i[50] ;
 wire \gray_sobel0.sobel0.sobel.matrix_pixels_i[51] ;
 wire \gray_sobel0.sobel0.sobel.matrix_pixels_i[52] ;
 wire \gray_sobel0.sobel0.sobel.matrix_pixels_i[53] ;
 wire \gray_sobel0.sobel0.sobel.matrix_pixels_i[54] ;
 wire \gray_sobel0.sobel0.sobel.matrix_pixels_i[55] ;
 wire \gray_sobel0.sobel0.sobel.matrix_pixels_i[56] ;
 wire \gray_sobel0.sobel0.sobel.matrix_pixels_i[57] ;
 wire \gray_sobel0.sobel0.sobel.matrix_pixels_i[58] ;
 wire \gray_sobel0.sobel0.sobel.matrix_pixels_i[59] ;
 wire \gray_sobel0.sobel0.sobel.matrix_pixels_i[5] ;
 wire \gray_sobel0.sobel0.sobel.matrix_pixels_i[60] ;
 wire \gray_sobel0.sobel0.sobel.matrix_pixels_i[61] ;
 wire \gray_sobel0.sobel0.sobel.matrix_pixels_i[62] ;
 wire \gray_sobel0.sobel0.sobel.matrix_pixels_i[63] ;
 wire \gray_sobel0.sobel0.sobel.matrix_pixels_i[64] ;
 wire \gray_sobel0.sobel0.sobel.matrix_pixels_i[65] ;
 wire \gray_sobel0.sobel0.sobel.matrix_pixels_i[66] ;
 wire \gray_sobel0.sobel0.sobel.matrix_pixels_i[67] ;
 wire \gray_sobel0.sobel0.sobel.matrix_pixels_i[68] ;
 wire \gray_sobel0.sobel0.sobel.matrix_pixels_i[69] ;
 wire \gray_sobel0.sobel0.sobel.matrix_pixels_i[6] ;
 wire \gray_sobel0.sobel0.sobel.matrix_pixels_i[70] ;
 wire \gray_sobel0.sobel0.sobel.matrix_pixels_i[71] ;
 wire \gray_sobel0.sobel0.sobel.matrix_pixels_i[7] ;
 wire \gray_sobel0.sobel0.sobel.matrix_pixels_i[8] ;
 wire \gray_sobel0.sobel0.sobel.matrix_pixels_i[9] ;
 wire \lfsr0._000_ ;
 wire \lfsr0._001_ ;
 wire \lfsr0._002_ ;
 wire \lfsr0._003_ ;
 wire \lfsr0._004_ ;
 wire \lfsr0._005_ ;
 wire \lfsr0._006_ ;
 wire \lfsr0._007_ ;
 wire \lfsr0._008_ ;
 wire \lfsr0._009_ ;
 wire \lfsr0._010_ ;
 wire \lfsr0._011_ ;
 wire \lfsr0._012_ ;
 wire \lfsr0._013_ ;
 wire \lfsr0._014_ ;
 wire \lfsr0._015_ ;
 wire \lfsr0._016_ ;
 wire \lfsr0._017_ ;
 wire \lfsr0._018_ ;
 wire \lfsr0._019_ ;
 wire \lfsr0._020_ ;
 wire \lfsr0._021_ ;
 wire \lfsr0._022_ ;
 wire \lfsr0._023_ ;
 wire \lfsr0._024_ ;
 wire \lfsr0._025_ ;
 wire \lfsr0._026_ ;
 wire \lfsr0._027_ ;
 wire \lfsr0._028_ ;
 wire \lfsr0._029_ ;
 wire \lfsr0._030_ ;
 wire \lfsr0._031_ ;
 wire \lfsr0._032_ ;
 wire \lfsr0._033_ ;
 wire \lfsr0._034_ ;
 wire \lfsr0._035_ ;
 wire \lfsr0._036_ ;
 wire \lfsr0._037_ ;
 wire \lfsr0._038_ ;
 wire \lfsr0._039_ ;
 wire \lfsr0._040_ ;
 wire \lfsr0._041_ ;
 wire \lfsr0._042_ ;
 wire \lfsr0._043_ ;
 wire \lfsr0._044_ ;
 wire \lfsr0._045_ ;
 wire \lfsr0._046_ ;
 wire \lfsr0._047_ ;
 wire \lfsr0._048_ ;
 wire \lfsr0._049_ ;
 wire \lfsr0._050_ ;
 wire \lfsr0._051_ ;
 wire \lfsr0._052_ ;
 wire \lfsr0._053_ ;
 wire \lfsr0._054_ ;
 wire \lfsr0._055_ ;
 wire \lfsr0._056_ ;
 wire \lfsr0._057_ ;
 wire \lfsr0._058_ ;
 wire \lfsr0._059_ ;
 wire \lfsr0._060_ ;
 wire \lfsr0._061_ ;
 wire \lfsr0._062_ ;
 wire \lfsr0._063_ ;
 wire \lfsr0._064_ ;
 wire \lfsr0._065_ ;
 wire \lfsr0._066_ ;
 wire \lfsr0._067_ ;
 wire \lfsr0._068_ ;
 wire \lfsr0._069_ ;
 wire \lfsr0._070_ ;
 wire \lfsr0._071_ ;
 wire \lfsr0._072_ ;
 wire \lfsr0._073_ ;
 wire \lfsr0._074_ ;
 wire \lfsr0._075_ ;
 wire \lfsr0._076_ ;
 wire \lfsr0._077_ ;
 wire \lfsr0._078_ ;
 wire \lfsr0._079_ ;
 wire \lfsr0._080_ ;
 wire \lfsr0._081_ ;
 wire \lfsr0._082_ ;
 wire \lfsr0._083_ ;
 wire \lfsr0._084_ ;
 wire \lfsr0._085_ ;
 wire \lfsr0._086_ ;
 wire \lfsr0._087_ ;
 wire \lfsr0._088_ ;
 wire \lfsr0._089_ ;
 wire \lfsr0._090_ ;
 wire \lfsr0._091_ ;
 wire \lfsr0._092_ ;
 wire \lfsr0._093_ ;
 wire \lfsr0._094_ ;
 wire \lfsr0._095_ ;
 wire \lfsr0._096_ ;
 wire \lfsr0._097_ ;
 wire \lfsr0._098_ ;
 wire \lfsr0._099_ ;
 wire \lfsr0._100_ ;
 wire \lfsr0._101_ ;
 wire \lfsr0._102_ ;
 wire \lfsr0._103_ ;
 wire \lfsr0._104_ ;
 wire \lfsr0._105_ ;
 wire \lfsr0._106_ ;
 wire \lfsr0._107_ ;
 wire \lfsr0._108_ ;
 wire \lfsr0._109_ ;
 wire \lfsr0._110_ ;
 wire \lfsr0._111_ ;
 wire \lfsr0._112_ ;
 wire \lfsr0._113_ ;
 wire \lfsr0._114_ ;
 wire \lfsr0._115_ ;
 wire \lfsr0._116_ ;
 wire \lfsr0._117_ ;
 wire \lfsr0._118_ ;
 wire \lfsr0._119_ ;
 wire \lfsr0._120_ ;
 wire \lfsr0._121_ ;
 wire \lfsr0._122_ ;
 wire \lfsr0._123_ ;
 wire \lfsr0._124_ ;
 wire \lfsr0._125_ ;
 wire \lfsr0._126_ ;
 wire \lfsr0._127_ ;
 wire \lfsr0._128_ ;
 wire \lfsr0._129_ ;
 wire \lfsr0._130_ ;
 wire \lfsr0._131_ ;
 wire \lfsr0._132_ ;
 wire \lfsr0._133_ ;
 wire \lfsr0._134_ ;
 wire \lfsr0._135_ ;
 wire \lfsr0._136_ ;
 wire \lfsr0._137_ ;
 wire \lfsr0._138_ ;
 wire \lfsr0._139_ ;
 wire \lfsr0._140_ ;
 wire \lfsr0._141_ ;
 wire \lfsr0._142_ ;
 wire \lfsr0._143_ ;
 wire \lfsr0._144_ ;
 wire \lfsr0._145_ ;
 wire \lfsr0._146_ ;
 wire \lfsr0._147_ ;
 wire \lfsr0._148_ ;
 wire \lfsr0._149_ ;
 wire \lfsr0._150_ ;
 wire \lfsr0._151_ ;
 wire \lfsr0._152_ ;
 wire \lfsr0._153_ ;
 wire \lfsr0._154_ ;
 wire \lfsr0._155_ ;
 wire \lfsr0._156_ ;
 wire \lfsr0._157_ ;
 wire \lfsr0._158_ ;
 wire \lfsr0._159_ ;
 wire \lfsr0._160_ ;
 wire \lfsr0._161_ ;
 wire \lfsr0._162_ ;
 wire \lfsr0._163_ ;
 wire \lfsr0._164_ ;
 wire \lfsr0._165_ ;
 wire \lfsr0._166_ ;
 wire \lfsr0._167_ ;
 wire \lfsr0._168_ ;
 wire \lfsr0._169_ ;
 wire \lfsr0._170_ ;
 wire \lfsr0._171_ ;
 wire \lfsr0._172_ ;
 wire \lfsr0._173_ ;
 wire \lfsr0._174_ ;
 wire \lfsr0._175_ ;
 wire \lfsr0._176_ ;
 wire \lfsr0._177_ ;
 wire \lfsr0._178_ ;
 wire \lfsr0._179_ ;
 wire \lfsr0._180_ ;
 wire \lfsr0._181_ ;
 wire \lfsr0._182_ ;
 wire \lfsr0._183_ ;
 wire \lfsr0._184_ ;
 wire \lfsr0._185_ ;
 wire \lfsr0._186_ ;
 wire \lfsr0._187_ ;
 wire \lfsr0._188_ ;
 wire \lfsr0._189_ ;
 wire \lfsr0._190_ ;
 wire \lfsr0._191_ ;
 wire \lfsr0._192_ ;
 wire \lfsr0._193_ ;
 wire \lfsr0._194_ ;
 wire \lfsr0._195_ ;
 wire \lfsr0._196_ ;
 wire \lfsr0._197_ ;
 wire \lfsr0._198_ ;
 wire \lfsr0._199_ ;
 wire \lfsr0._200_ ;
 wire \lfsr0._201_ ;
 wire \lfsr0._202_ ;
 wire \lfsr0._203_ ;
 wire \lfsr0._204_ ;
 wire \lfsr0._205_ ;
 wire \lfsr0._206_ ;
 wire \lfsr0._207_ ;
 wire \lfsr0._208_ ;
 wire \lfsr0._209_ ;
 wire \lfsr0._210_ ;
 wire \lfsr0._211_ ;
 wire \lfsr0._212_ ;
 wire \lfsr0._213_ ;
 wire \lfsr0._214_ ;
 wire \lfsr0._215_ ;
 wire \lfsr0._216_ ;
 wire \lfsr0._217_ ;
 wire \lfsr0._218_ ;
 wire \lfsr0._219_ ;
 wire \lfsr0._220_ ;
 wire \lfsr0._221_ ;
 wire \lfsr0._222_ ;
 wire \lfsr0._223_ ;
 wire \lfsr0._224_ ;
 wire \lfsr0._225_ ;
 wire \lfsr0._226_ ;
 wire \lfsr0._227_ ;
 wire \lfsr0._228_ ;
 wire \lfsr0._229_ ;
 wire \lfsr0._230_ ;
 wire \lfsr0._231_ ;
 wire \lfsr0._232_ ;
 wire \lfsr0._233_ ;
 wire \lfsr0._234_ ;
 wire \lfsr0._235_ ;
 wire \lfsr0._236_ ;
 wire \lfsr0._237_ ;
 wire \lfsr0._238_ ;
 wire \lfsr0._239_ ;
 wire \lfsr0._240_ ;
 wire \lfsr0.config_data_i[0] ;
 wire \lfsr0.config_data_i[10] ;
 wire \lfsr0.config_data_i[11] ;
 wire \lfsr0.config_data_i[12] ;
 wire \lfsr0.config_data_i[13] ;
 wire \lfsr0.config_data_i[14] ;
 wire \lfsr0.config_data_i[15] ;
 wire \lfsr0.config_data_i[16] ;
 wire \lfsr0.config_data_i[17] ;
 wire \lfsr0.config_data_i[18] ;
 wire \lfsr0.config_data_i[19] ;
 wire \lfsr0.config_data_i[1] ;
 wire \lfsr0.config_data_i[20] ;
 wire \lfsr0.config_data_i[21] ;
 wire \lfsr0.config_data_i[22] ;
 wire \lfsr0.config_data_i[23] ;
 wire \lfsr0.config_data_i[2] ;
 wire \lfsr0.config_data_i[3] ;
 wire \lfsr0.config_data_i[4] ;
 wire \lfsr0.config_data_i[5] ;
 wire \lfsr0.config_data_i[6] ;
 wire \lfsr0.config_data_i[7] ;
 wire \lfsr0.config_data_i[8] ;
 wire \lfsr0.config_data_i[9] ;
 wire \lfsr0.config_data_o[0] ;
 wire \lfsr0.config_data_o[10] ;
 wire \lfsr0.config_data_o[11] ;
 wire \lfsr0.config_data_o[12] ;
 wire \lfsr0.config_data_o[13] ;
 wire \lfsr0.config_data_o[14] ;
 wire \lfsr0.config_data_o[15] ;
 wire \lfsr0.config_data_o[16] ;
 wire \lfsr0.config_data_o[17] ;
 wire \lfsr0.config_data_o[18] ;
 wire \lfsr0.config_data_o[19] ;
 wire \lfsr0.config_data_o[1] ;
 wire \lfsr0.config_data_o[20] ;
 wire \lfsr0.config_data_o[21] ;
 wire \lfsr0.config_data_o[22] ;
 wire \lfsr0.config_data_o[23] ;
 wire \lfsr0.config_data_o[2] ;
 wire \lfsr0.config_data_o[3] ;
 wire \lfsr0.config_data_o[4] ;
 wire \lfsr0.config_data_o[5] ;
 wire \lfsr0.config_data_o[6] ;
 wire \lfsr0.config_data_o[7] ;
 wire \lfsr0.config_data_o[8] ;
 wire \lfsr0.config_data_o[9] ;
 wire \lfsr0.config_done_o ;
 wire \lfsr0.config_i ;
 wire \lfsr0.config_rdy_i ;
 wire \lfsr0.lfsr_done ;
 wire \lfsr0.lfsr_en_i ;
 wire \lfsr0.lfsr_out[0] ;
 wire \lfsr0.lfsr_out[10] ;
 wire \lfsr0.lfsr_out[11] ;
 wire \lfsr0.lfsr_out[12] ;
 wire \lfsr0.lfsr_out[13] ;
 wire \lfsr0.lfsr_out[14] ;
 wire \lfsr0.lfsr_out[15] ;
 wire \lfsr0.lfsr_out[16] ;
 wire \lfsr0.lfsr_out[17] ;
 wire \lfsr0.lfsr_out[18] ;
 wire \lfsr0.lfsr_out[19] ;
 wire \lfsr0.lfsr_out[1] ;
 wire \lfsr0.lfsr_out[20] ;
 wire \lfsr0.lfsr_out[21] ;
 wire \lfsr0.lfsr_out[22] ;
 wire \lfsr0.lfsr_out[23] ;
 wire \lfsr0.lfsr_out[2] ;
 wire \lfsr0.lfsr_out[3] ;
 wire \lfsr0.lfsr_out[4] ;
 wire \lfsr0.lfsr_out[5] ;
 wire \lfsr0.lfsr_out[6] ;
 wire \lfsr0.lfsr_out[7] ;
 wire \lfsr0.lfsr_out[8] ;
 wire \lfsr0.lfsr_out[9] ;
 wire \lfsr0.lfsr_rdy_o ;
 wire \lfsr0.seed_reg[0] ;
 wire \lfsr0.seed_reg[10] ;
 wire \lfsr0.seed_reg[11] ;
 wire \lfsr0.seed_reg[12] ;
 wire \lfsr0.seed_reg[13] ;
 wire \lfsr0.seed_reg[14] ;
 wire \lfsr0.seed_reg[15] ;
 wire \lfsr0.seed_reg[16] ;
 wire \lfsr0.seed_reg[17] ;
 wire \lfsr0.seed_reg[18] ;
 wire \lfsr0.seed_reg[19] ;
 wire \lfsr0.seed_reg[1] ;
 wire \lfsr0.seed_reg[20] ;
 wire \lfsr0.seed_reg[21] ;
 wire \lfsr0.seed_reg[22] ;
 wire \lfsr0.seed_reg[23] ;
 wire \lfsr0.seed_reg[2] ;
 wire \lfsr0.seed_reg[3] ;
 wire \lfsr0.seed_reg[4] ;
 wire \lfsr0.seed_reg[5] ;
 wire \lfsr0.seed_reg[6] ;
 wire \lfsr0.seed_reg[7] ;
 wire \lfsr0.seed_reg[8] ;
 wire \lfsr0.seed_reg[9] ;
 wire \lfsr0.stop_reg[0] ;
 wire \lfsr0.stop_reg[10] ;
 wire \lfsr0.stop_reg[11] ;
 wire \lfsr0.stop_reg[12] ;
 wire \lfsr0.stop_reg[13] ;
 wire \lfsr0.stop_reg[14] ;
 wire \lfsr0.stop_reg[15] ;
 wire \lfsr0.stop_reg[16] ;
 wire \lfsr0.stop_reg[17] ;
 wire \lfsr0.stop_reg[18] ;
 wire \lfsr0.stop_reg[19] ;
 wire \lfsr0.stop_reg[1] ;
 wire \lfsr0.stop_reg[20] ;
 wire \lfsr0.stop_reg[21] ;
 wire \lfsr0.stop_reg[22] ;
 wire \lfsr0.stop_reg[23] ;
 wire \lfsr0.stop_reg[2] ;
 wire \lfsr0.stop_reg[3] ;
 wire \lfsr0.stop_reg[4] ;
 wire \lfsr0.stop_reg[5] ;
 wire \lfsr0.stop_reg[6] ;
 wire \lfsr0.stop_reg[7] ;
 wire \lfsr0.stop_reg[8] ;
 wire \lfsr0.stop_reg[9] ;
 wire net1;
 wire net10;
 wire net11;
 wire net12;
 wire net13;
 wire net14;
 wire net15;
 wire net16;
 wire net17;
 wire net18;
 wire net19;
 wire net2;
 wire net20;
 wire net21;
 wire net22;
 wire net23;
 wire net24;
 wire net25;
 wire net26;
 wire net27;
 wire net28;
 wire net29;
 wire net3;
 wire net30;
 wire net31;
 wire net32;
 wire net33;
 wire net34;
 wire net35;
 wire net36;
 wire net37;
 wire net38;
 wire net39;
 wire net4;
 wire net40;
 wire net5;
 wire net57;
 wire net58;
 wire net59;
 wire net6;
 wire net60;
 wire net61;
 wire net62;
 wire net63;
 wire net64;
 wire net65;
 wire net66;
 wire net67;
 wire net68;
 wire net69;
 wire net7;
 wire net70;
 wire net71;
 wire net72;
 wire net73;
 wire net74;
 wire net75;
 wire net76;
 wire net77;
 wire net78;
 wire net79;
 wire net8;
 wire net80;
 wire net81;
 wire net82;
 wire net83;
 wire net84;
 wire net85;
 wire net86;
 wire net87;
 wire net9;
 wire \nreset_sync0.r_sync ;
 wire \sgnl_sync0.signal_o ;
 wire \sgnl_sync0.signal_sync ;
 wire \sgnl_sync1.signal_sync ;
 wire \sgnl_sync2.signal_sync ;
 wire \spi0._000_ ;
 wire \spi0._001_ ;
 wire \spi0._002_ ;
 wire \spi0._003_ ;
 wire \spi0._004_ ;
 wire \spi0._005_ ;
 wire \spi0._006_ ;
 wire \spi0._007_ ;
 wire \spi0._008_ ;
 wire \spi0._009_ ;
 wire \spi0._010_ ;
 wire \spi0._011_ ;
 wire \spi0._012_ ;
 wire \spi0._013_ ;
 wire \spi0._014_ ;
 wire \spi0._015_ ;
 wire \spi0._016_ ;
 wire \spi0._017_ ;
 wire \spi0._018_ ;
 wire \spi0._019_ ;
 wire \spi0._020_ ;
 wire \spi0._021_ ;
 wire \spi0._022_ ;
 wire \spi0._023_ ;
 wire \spi0._024_ ;
 wire \spi0._025_ ;
 wire \spi0._026_ ;
 wire \spi0._027_ ;
 wire \spi0._028_ ;
 wire \spi0._029_ ;
 wire \spi0._030_ ;
 wire \spi0._031_ ;
 wire \spi0._032_ ;
 wire \spi0._033_ ;
 wire \spi0._034_ ;
 wire \spi0._035_ ;
 wire \spi0._036_ ;
 wire \spi0._037_ ;
 wire \spi0._038_ ;
 wire \spi0._039_ ;
 wire \spi0._040_ ;
 wire \spi0._041_ ;
 wire \spi0._042_ ;
 wire \spi0._043_ ;
 wire \spi0._044_ ;
 wire \spi0._045_ ;
 wire \spi0._046_ ;
 wire \spi0._047_ ;
 wire \spi0._048_ ;
 wire \spi0._049_ ;
 wire \spi0._050_ ;
 wire \spi0._051_ ;
 wire \spi0._052_ ;
 wire \spi0._053_ ;
 wire \spi0._054_ ;
 wire \spi0._055_ ;
 wire \spi0._056_ ;
 wire \spi0._057_ ;
 wire \spi0._058_ ;
 wire \spi0._059_ ;
 wire \spi0._060_ ;
 wire \spi0._061_ ;
 wire \spi0._062_ ;
 wire \spi0._063_ ;
 wire \spi0._064_ ;
 wire \spi0._065_ ;
 wire \spi0._066_ ;
 wire \spi0._067_ ;
 wire \spi0._068_ ;
 wire \spi0._069_ ;
 wire \spi0._070_ ;
 wire \spi0._071_ ;
 wire \spi0._072_ ;
 wire \spi0._073_ ;
 wire \spi0._074_ ;
 wire \spi0._075_ ;
 wire \spi0._076_ ;
 wire \spi0._077_ ;
 wire \spi0._078_ ;
 wire \spi0._079_ ;
 wire \spi0._080_ ;
 wire \spi0._081_ ;
 wire \spi0._082_ ;
 wire \spi0._083_ ;
 wire \spi0._084_ ;
 wire \spi0._085_ ;
 wire \spi0._086_ ;
 wire \spi0._087_ ;
 wire \spi0._088_ ;
 wire \spi0._089_ ;
 wire \spi0._090_ ;
 wire \spi0._091_ ;
 wire \spi0._092_ ;
 wire \spi0._093_ ;
 wire \spi0._094_ ;
 wire \spi0._095_ ;
 wire \spi0._096_ ;
 wire \spi0._097_ ;
 wire \spi0._098_ ;
 wire \spi0._099_ ;
 wire \spi0._100_ ;
 wire \spi0.data_tx[0] ;
 wire \spi0.data_tx[10] ;
 wire \spi0.data_tx[11] ;
 wire \spi0.data_tx[12] ;
 wire \spi0.data_tx[13] ;
 wire \spi0.data_tx[14] ;
 wire \spi0.data_tx[15] ;
 wire \spi0.data_tx[16] ;
 wire \spi0.data_tx[17] ;
 wire \spi0.data_tx[18] ;
 wire \spi0.data_tx[19] ;
 wire \spi0.data_tx[1] ;
 wire \spi0.data_tx[20] ;
 wire \spi0.data_tx[21] ;
 wire \spi0.data_tx[22] ;
 wire \spi0.data_tx[23] ;
 wire \spi0.data_tx[2] ;
 wire \spi0.data_tx[3] ;
 wire \spi0.data_tx[4] ;
 wire \spi0.data_tx[5] ;
 wire \spi0.data_tx[6] ;
 wire \spi0.data_tx[7] ;
 wire \spi0.data_tx[8] ;
 wire \spi0.data_tx[9] ;
 wire \spi0.input_px_gray_o[0] ;
 wire \spi0.input_px_gray_o[10] ;
 wire \spi0.input_px_gray_o[11] ;
 wire \spi0.input_px_gray_o[12] ;
 wire \spi0.input_px_gray_o[13] ;
 wire \spi0.input_px_gray_o[14] ;
 wire \spi0.input_px_gray_o[15] ;
 wire \spi0.input_px_gray_o[16] ;
 wire \spi0.input_px_gray_o[17] ;
 wire \spi0.input_px_gray_o[18] ;
 wire \spi0.input_px_gray_o[19] ;
 wire \spi0.input_px_gray_o[1] ;
 wire \spi0.input_px_gray_o[20] ;
 wire \spi0.input_px_gray_o[21] ;
 wire \spi0.input_px_gray_o[22] ;
 wire \spi0.input_px_gray_o[23] ;
 wire \spi0.input_px_gray_o[2] ;
 wire \spi0.input_px_gray_o[3] ;
 wire \spi0.input_px_gray_o[4] ;
 wire \spi0.input_px_gray_o[5] ;
 wire \spi0.input_px_gray_o[6] ;
 wire \spi0.input_px_gray_o[7] ;
 wire \spi0.input_px_gray_o[8] ;
 wire \spi0.input_px_gray_o[9] ;
 wire \spi0.output_px_sobel_i[0] ;
 wire \spi0.output_px_sobel_i[10] ;
 wire \spi0.output_px_sobel_i[11] ;
 wire \spi0.output_px_sobel_i[12] ;
 wire \spi0.output_px_sobel_i[13] ;
 wire \spi0.output_px_sobel_i[14] ;
 wire \spi0.output_px_sobel_i[15] ;
 wire \spi0.output_px_sobel_i[16] ;
 wire \spi0.output_px_sobel_i[17] ;
 wire \spi0.output_px_sobel_i[18] ;
 wire \spi0.output_px_sobel_i[19] ;
 wire \spi0.output_px_sobel_i[1] ;
 wire \spi0.output_px_sobel_i[20] ;
 wire \spi0.output_px_sobel_i[21] ;
 wire \spi0.output_px_sobel_i[22] ;
 wire \spi0.output_px_sobel_i[23] ;
 wire \spi0.output_px_sobel_i[2] ;
 wire \spi0.output_px_sobel_i[3] ;
 wire \spi0.output_px_sobel_i[4] ;
 wire \spi0.output_px_sobel_i[5] ;
 wire \spi0.output_px_sobel_i[6] ;
 wire \spi0.output_px_sobel_i[7] ;
 wire \spi0.output_px_sobel_i[8] ;
 wire \spi0.output_px_sobel_i[9] ;
 wire \spi0.px_rdy_i_spi_o ;
 wire \spi0.px_rdy_o_spi_i ;
 wire \spi0.rxtx_done ;
 wire \spi0.rxtx_done_reg ;
 wire \spi0.rxtx_done_rising ;
 wire \spi0.signal_sync1.async_signal_i ;
 wire \spi0.signal_sync1.signal_sync ;
 wire \spi0.spi0._000_ ;
 wire \spi0.spi0._001_ ;
 wire \spi0.spi0._002_ ;
 wire \spi0.spi0._003_ ;
 wire \spi0.spi0._004_ ;
 wire \spi0.spi0._005_ ;
 wire \spi0.spi0._006_ ;
 wire \spi0.spi0._007_ ;
 wire \spi0.spi0._008_ ;
 wire \spi0.spi0._009_ ;
 wire \spi0.spi0._010_ ;
 wire \spi0.spi0._011_ ;
 wire \spi0.spi0._012_ ;
 wire \spi0.spi0._013_ ;
 wire \spi0.spi0._014_ ;
 wire \spi0.spi0._015_ ;
 wire \spi0.spi0._016_ ;
 wire \spi0.spi0._017_ ;
 wire \spi0.spi0._018_ ;
 wire \spi0.spi0._019_ ;
 wire \spi0.spi0._020_ ;
 wire \spi0.spi0._021_ ;
 wire \spi0.spi0._022_ ;
 wire \spi0.spi0._023_ ;
 wire \spi0.spi0._024_ ;
 wire \spi0.spi0._025_ ;
 wire \spi0.spi0._026_ ;
 wire \spi0.spi0._027_ ;
 wire \spi0.spi0._028_ ;
 wire \spi0.spi0._029_ ;
 wire \spi0.spi0._030_ ;
 wire \spi0.spi0._031_ ;
 wire \spi0.spi0._032_ ;
 wire \spi0.spi0._034_ ;
 wire \spi0.spi0._036_ ;
 wire \spi0.spi0._038_ ;
 wire \spi0.spi0._040_ ;
 wire \spi0.spi0._042_ ;
 wire \spi0.spi0._044_ ;
 wire \spi0.spi0._046_ ;
 wire \spi0.spi0._048_ ;
 wire \spi0.spi0._050_ ;
 wire \spi0.spi0._052_ ;
 wire \spi0.spi0._054_ ;
 wire \spi0.spi0._056_ ;
 wire \spi0.spi0._058_ ;
 wire \spi0.spi0._060_ ;
 wire \spi0.spi0._062_ ;
 wire \spi0.spi0._064_ ;
 wire \spi0.spi0._066_ ;
 wire \spi0.spi0._068_ ;
 wire \spi0.spi0._070_ ;
 wire \spi0.spi0._072_ ;
 wire \spi0.spi0._074_ ;
 wire \spi0.spi0._076_ ;
 wire \spi0.spi0._078_ ;
 wire \spi0.spi0._080_ ;
 wire \spi0.spi0._081_ ;
 wire \spi0.spi0._082_ ;
 wire \spi0.spi0._083_ ;
 wire \spi0.spi0._084_ ;
 wire \spi0.spi0._085_ ;
 wire \spi0.spi0._086_ ;
 wire \spi0.spi0._087_ ;
 wire \spi0.spi0._088_ ;
 wire \spi0.spi0._089_ ;
 wire \spi0.spi0._090_ ;
 wire \spi0.spi0._091_ ;
 wire \spi0.spi0._092_ ;
 wire \spi0.spi0._093_ ;
 wire \spi0.spi0._094_ ;
 wire \spi0.spi0._095_ ;
 wire \spi0.spi0._096_ ;
 wire \spi0.spi0._097_ ;
 wire \spi0.spi0._098_ ;
 wire \spi0.spi0._099_ ;
 wire \spi0.spi0._100_ ;
 wire \spi0.spi0._101_ ;
 wire \spi0.spi0._102_ ;
 wire \spi0.spi0._103_ ;
 wire \spi0.spi0._104_ ;
 wire \spi0.spi0._106_ ;
 wire \spi0.spi0._108_ ;
 wire \spi0.spi0._110_ ;
 wire \spi0.spi0._112_ ;
 wire \spi0.spi0._114_ ;
 wire \spi0.spi0._116_ ;
 wire \spi0.spi0._117_ ;
 wire \spi0.spi0._118_ ;
 wire \spi0.spi0._119_ ;
 wire \spi0.spi0._120_ ;
 wire \spi0.spi0._121_ ;
 wire \spi0.spi0._122_ ;
 wire \spi0.spi0._123_ ;
 wire \spi0.spi0._124_ ;
 wire \spi0.spi0._125_ ;
 wire \spi0.spi0._126_ ;
 wire \spi0.spi0._127_ ;
 wire \spi0.spi0._128_ ;
 wire \spi0.spi0._129_ ;
 wire \spi0.spi0._130_ ;
 wire \spi0.spi0._131_ ;
 wire \spi0.spi0._132_ ;
 wire \spi0.spi0._133_ ;
 wire \spi0.spi0._134_ ;
 wire \spi0.spi0._135_ ;
 wire \spi0.spi0._136_ ;
 wire \spi0.spi0._137_ ;
 wire \spi0.spi0._138_ ;
 wire \spi0.spi0._139_ ;
 wire \spi0.spi0._140_ ;
 wire \spi0.spi0._141_ ;
 wire \spi0.spi0._142_ ;
 wire \spi0.spi0._143_ ;
 wire \spi0.spi0._144_ ;
 wire \spi0.spi0._145_ ;
 wire \spi0.spi0._146_ ;
 wire \spi0.spi0._147_ ;
 wire \spi0.spi0._148_ ;
 wire \spi0.spi0._149_ ;
 wire \spi0.spi0._150_ ;
 wire \spi0.spi0._151_ ;
 wire \spi0.spi0._152_ ;
 wire \spi0.spi0._153_ ;
 wire \spi0.spi0._154_ ;
 wire \spi0.spi0._155_ ;
 wire \spi0.spi0._156_ ;
 wire \spi0.spi0._157_ ;
 wire \spi0.spi0._158_ ;
 wire \spi0.spi0._159_ ;
 wire \spi0.spi0._160_ ;
 wire \spi0.spi0.counter[0] ;
 wire \spi0.spi0.counter[1] ;
 wire \spi0.spi0.counter[2] ;
 wire \spi0.spi0.counter[3] ;
 wire \spi0.spi0.counter[4] ;
 wire \spi0.spi0.counter[5] ;
 wire \spi0.spi0.data_rx_o[0] ;
 wire \spi0.spi0.data_rx_o[10] ;
 wire \spi0.spi0.data_rx_o[11] ;
 wire \spi0.spi0.data_rx_o[12] ;
 wire \spi0.spi0.data_rx_o[13] ;
 wire \spi0.spi0.data_rx_o[14] ;
 wire \spi0.spi0.data_rx_o[15] ;
 wire \spi0.spi0.data_rx_o[16] ;
 wire \spi0.spi0.data_rx_o[17] ;
 wire \spi0.spi0.data_rx_o[18] ;
 wire \spi0.spi0.data_rx_o[19] ;
 wire \spi0.spi0.data_rx_o[1] ;
 wire \spi0.spi0.data_rx_o[20] ;
 wire \spi0.spi0.data_rx_o[21] ;
 wire \spi0.spi0.data_rx_o[22] ;
 wire \spi0.spi0.data_rx_o[23] ;
 wire \spi0.spi0.data_rx_o[2] ;
 wire \spi0.spi0.data_rx_o[3] ;
 wire \spi0.spi0.data_rx_o[4] ;
 wire \spi0.spi0.data_rx_o[5] ;
 wire \spi0.spi0.data_rx_o[6] ;
 wire \spi0.spi0.data_rx_o[7] ;
 wire \spi0.spi0.data_rx_o[8] ;
 wire \spi0.spi0.data_rx_o[9] ;
 wire \spi0.spi0.sdo_o ;
 wire \spi0.spi0.sdo_register[0] ;
 wire \spi0.spi0.sdo_register[10] ;
 wire \spi0.spi0.sdo_register[11] ;
 wire \spi0.spi0.sdo_register[12] ;
 wire \spi0.spi0.sdo_register[13] ;
 wire \spi0.spi0.sdo_register[14] ;
 wire \spi0.spi0.sdo_register[15] ;
 wire \spi0.spi0.sdo_register[16] ;
 wire \spi0.spi0.sdo_register[17] ;
 wire \spi0.spi0.sdo_register[18] ;
 wire \spi0.spi0.sdo_register[19] ;
 wire \spi0.spi0.sdo_register[1] ;
 wire \spi0.spi0.sdo_register[20] ;
 wire \spi0.spi0.sdo_register[21] ;
 wire \spi0.spi0.sdo_register[22] ;
 wire \spi0.spi0.sdo_register[2] ;
 wire \spi0.spi0.sdo_register[3] ;
 wire \spi0.spi0.sdo_register[4] ;
 wire \spi0.spi0.sdo_register[5] ;
 wire \spi0.spi0.sdo_register[6] ;
 wire \spi0.spi0.sdo_register[7] ;
 wire \spi0.spi0.sdo_register[8] ;
 wire \spi0.spi0.sdo_register[9] ;
 wire [0:0] clknet_0_ui_in;
 wire [0:0] clknet_1_0__leaf_ui_in;
 wire [0:0] clknet_1_1__leaf_ui_in;

 sky130_fd_sc_hd__diode_2 ANTENNA_1 (.DIODE(\spi0.input_px_gray_o[0] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__diode_2 ANTENNA_2 (.DIODE(\spi0.input_px_gray_o[0] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__diode_2 ANTENNA_3 (.DIODE(net2),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_0_109 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_0_113 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_0_125 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_3 FILLER_0_0_137 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_0_141 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_0_15 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_0_153 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_3 FILLER_0_0_165 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_0_169 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_0_181 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_3 FILLER_0_0_193 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_0_197 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_0_209 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_3 FILLER_0_0_221 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_0_225 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_0_237 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_3 FILLER_0_0_249 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_0_253 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_0_265 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__fill_1 FILLER_0_0_27 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_0_277 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_0_281 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_0_29 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_0_293 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_0_3 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_3 FILLER_0_0_305 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_0_309 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_0_321 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__fill_2 FILLER_0_0_333 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_0_41 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_3 FILLER_0_0_53 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_0_57 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_0_69 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_3 FILLER_0_0_81 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_0_85 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_0_97 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_10_109 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_10_121 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_6 FILLER_0_10_133 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_10_139 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_10_141 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_10_15 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_10_153 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_8 FILLER_0_10_165 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_10_173 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_10_206 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_10_214 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_10_245 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_10_260 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_10_269 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__fill_1 FILLER_0_10_27 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_10_281 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_10_29 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_4 FILLER_0_10_293 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_10_297 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_10_3 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__fill_1 FILLER_0_10_307 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_10_309 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_10_321 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__fill_2 FILLER_0_10_333 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_10_41 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_10_53 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_10_65 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_6 FILLER_0_10_77 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_10_83 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_10_85 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_10_97 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_4 FILLER_0_11_108 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_11_127 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_11_15 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_11_151 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_4 FILLER_0_11_163 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_11_167 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_11_169 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_4 FILLER_0_11_181 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_11_188 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_11_201 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_11_228 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__fill_1 FILLER_0_11_240 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_11_253 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_6 FILLER_0_11_265 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_11_27 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__fill_2 FILLER_0_11_278 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_11_290 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_11_294 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_11_3 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_4 FILLER_0_11_302 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_11_321 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__fill_2 FILLER_0_11_333 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_11_39 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_4 FILLER_0_11_51 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_11_55 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_11_57 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_11_69 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_4 FILLER_0_11_81 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_11_85 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_12_147 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_12_15 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_12_159 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_12_171 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__fill_2 FILLER_0_12_183 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_12_188 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_12_197 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_12_205 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_12_213 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_12_218 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_12_237 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_12_247 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_12_251 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_12_253 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_12_265 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__fill_1 FILLER_0_12_27 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_12_277 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_12_281 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_12_29 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_12_3 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_3 FILLER_0_12_305 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_12_316 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_6 FILLER_0_12_328 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_12_334 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_12_41 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_12_53 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_8 FILLER_0_12_65 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_12_73 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_12_96 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_13_118 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_13_126 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_13_15 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_8 FILLER_0_13_159 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_13_167 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_13_169 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_13_177 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_13_214 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_13_245 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_13_263 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_13_27 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__fill_2 FILLER_0_13_278 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_13_281 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_4 FILLER_0_13_293 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_13_3 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_6 FILLER_0_13_304 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_13_323 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_13_39 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_4 FILLER_0_13_51 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_13_55 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_13_57 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_8 FILLER_0_13_69 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_13_77 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_13_90 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_13_97 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_14_102 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_4 FILLER_0_14_114 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_14_125 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_14_144 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_14_15 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_14_156 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_4 FILLER_0_14_168 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_14_172 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_14_206 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_14_210 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_14_226 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_14_251 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_14_269 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_14_27 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_14_277 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_14_294 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_14_3 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__fill_2 FILLER_0_14_306 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_14_309 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_14_320 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_3 FILLER_0_14_332 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_14_49 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__fill_2 FILLER_0_14_61 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_14_66 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_3 FILLER_0_14_78 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_14_90 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_4 FILLER_0_15_107 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_15_111 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_15_113 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_15_120 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__fill_1 FILLER_0_15_132 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_15_140 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_15_15 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_15_152 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_4 FILLER_0_15_164 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_15_169 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__fill_2 FILLER_0_15_225 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_15_245 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_15_267 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__fill_1 FILLER_0_15_279 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_15_294 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_15_3 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_6 FILLER_0_15_306 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_15_328 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_15_334 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_15_47 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_15_57 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_15_78 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_15_86 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_15_95 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_16_125 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_3 FILLER_0_16_137 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_16_141 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_16_15 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_16_164 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_4 FILLER_0_16_176 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_16_183 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_16_193 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_16_197 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_16_204 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_16_218 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_16_23 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_16_233 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_16_250 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_16_253 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_3 FILLER_0_16_281 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_16_29 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_16_3 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__fill_2 FILLER_0_16_306 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_16_309 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_16_333 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_16_82 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_17_111 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_17_113 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_17_128 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_17_132 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_17_147 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_17_15 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_17_162 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_17_169 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_17_195 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_17_207 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_4 FILLER_0_17_219 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_17_223 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_17_225 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_17_229 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_17_23 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_17_236 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_17_244 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_17_256 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_17_262 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_6 FILLER_0_17_274 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_17_3 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__fill_2 FILLER_0_17_314 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_17_321 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_17_333 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_17_48 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_17_55 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_17_99 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__fill_1 FILLER_0_18_109 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_18_116 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_18_128 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__fill_1 FILLER_0_18_141 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_18_149 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_18_169 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_18_175 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_18_197 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_18_235 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_18_250 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_18_253 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_18_275 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_4 FILLER_0_18_287 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_18_29 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_18_291 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_18_3 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_18_307 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_18_309 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_18_315 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_18_319 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_18_323 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_18_331 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_18_44 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_18_68 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_18_7 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_18_83 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_18_97 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_3 FILLER_0_19_11 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_19_113 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_19_121 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_19_140 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_19_169 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__fill_2 FILLER_0_19_17 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_19_181 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_19_186 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_19_196 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_19_273 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_19_279 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_19_281 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_4 FILLER_0_19_293 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_19_297 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_19_3 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_19_301 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__fill_1 FILLER_0_19_316 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_19_322 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_19_331 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_19_42 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_19_50 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_19_55 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_19_57 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_19_62 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_19_74 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_19_86 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__fill_2 FILLER_0_19_98 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_1_105 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_1_111 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_1_113 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_1_125 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_1_137 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_1_149 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_1_15 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_6 FILLER_0_1_161 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_1_167 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_1_169 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_1_181 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_1_193 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_1_205 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_6 FILLER_0_1_217 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_1_223 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_1_225 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_1_237 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_8 FILLER_0_1_249 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_1_257 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_1_262 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_1_269 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_1_27 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_3 FILLER_0_1_277 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_1_281 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_1_293 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_1_3 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_1_305 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_1_317 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_6 FILLER_0_1_329 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_1_39 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_4 FILLER_0_1_51 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_1_55 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_1_57 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_1_69 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_1_81 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_1_93 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__fill_2 FILLER_0_20_108 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_20_115 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_4 FILLER_0_20_127 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_20_138 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_20_141 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_20_15 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_20_151 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_20_163 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_4 FILLER_0_20_175 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_20_179 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_20_183 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__fill_1 FILLER_0_20_195 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_20_203 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_20_226 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_20_251 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_20_253 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_20_268 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_20_27 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_20_284 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_20_3 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_4 FILLER_0_20_32 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_20_332 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_20_76 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_20_82 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_20_85 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_21_101 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_21_109 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_21_113 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_8 FILLER_0_21_125 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_21_133 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_21_146 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_21_15 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_4 FILLER_0_21_169 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_21_173 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_21_206 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_21_214 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_21_222 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_21_225 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_21_235 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_21_252 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_4 FILLER_0_21_264 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_21_268 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_21_27 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_21_276 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_21_288 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_21_3 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__fill_1 FILLER_0_21_334 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_21_39 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_21_52 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_21_57 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_21_96 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_22_106 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_22_111 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_22_118 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_22_122 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_22_134 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_22_153 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_22_164 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_22_18 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_22_191 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_22_195 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_22_206 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_22_231 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_22_24 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_22_253 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_6 FILLER_0_22_265 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_22_278 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_22_29 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_22_297 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_22_3 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__fill_1 FILLER_0_22_33 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_22_331 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_22_57 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_6 FILLER_0_22_69 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_22_75 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_22_98 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_23_111 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_23_147 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_23_198 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_23_202 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_23_217 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_23_223 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_23_225 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_23_242 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_23_255 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_23_268 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_23_274 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_23_281 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_23_286 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_6 FILLER_0_23_298 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_23_3 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_23_30 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_23_304 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_23_334 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_23_36 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_23_54 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_23_86 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_23_9 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_23_96 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_24_122 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_24_126 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_24_132 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_24_159 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_24_187 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_24_197 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_24_21 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_24_222 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_24_251 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_24_277 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_4 FILLER_0_24_289 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_24_293 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_24_297 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_24_305 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_24_314 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_24_38 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_24_48 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_24_58 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_24_79 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_24_95 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_25_108 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_25_113 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_25_119 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_25_169 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_25_181 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_3 FILLER_0_25_193 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_25_216 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_25_220 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_25_245 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_25_258 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_25_269 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_25_277 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_25_281 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_25_303 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_25_317 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_25_334 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_25_35 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_25_57 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_25_95 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_26_121 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_26_136 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_26_141 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_26_151 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_26_172 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_26_183 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_26_193 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_26_206 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_6 FILLER_0_26_218 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_26_224 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_26_234 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_6 FILLER_0_26_246 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_26_253 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_26_259 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_26_27 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_26_273 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_26_29 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_26_3 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_26_307 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_26_316 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_26_324 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_26_333 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_26_57 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_26_99 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_27_103 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_27_107 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_27_111 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_27_12 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_27_125 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__fill_2 FILLER_0_27_146 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_27_172 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_27_196 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_27_204 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_27_22 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_27_222 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_27_231 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_27_235 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_27_248 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_27_258 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_27_266 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_27_294 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_27_3 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_27_319 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_4 FILLER_0_27_331 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_27_45 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_27_60 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_27_64 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_28_136 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_28_15 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__fill_1 FILLER_0_28_203 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_28_227 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_28_236 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_28_247 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_28_266 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_28_27 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_28_275 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_28_283 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_28_3 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_6 FILLER_0_28_302 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_28_309 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_28_323 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_28_58 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_28_66 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_28_72 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_28_80 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_28_85 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_29_100 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__fill_1 FILLER_0_29_11 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_29_113 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__fill_1 FILLER_0_29_125 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_29_166 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_29_178 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_29_202 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_29_24 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_3 FILLER_0_29_262 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_29_278 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_29_281 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_29_287 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_29_294 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_29_3 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_29_305 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_29_314 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_29_334 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_29_36 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_29_40 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_4 FILLER_0_29_52 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_29_62 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_29_89 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_2_109 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_2_121 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_6 FILLER_0_2_133 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_2_139 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_2_141 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_2_15 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_2_153 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_2_165 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_2_177 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_6 FILLER_0_2_189 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_2_195 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_2_197 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_2_209 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_2_221 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_4 FILLER_0_2_233 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_2_243 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_2_27 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_2_274 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_2_286 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_2_29 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_8 FILLER_0_2_298 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_2_3 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__fill_2 FILLER_0_2_306 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_2_309 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_2_321 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__fill_2 FILLER_0_2_333 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_2_41 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_2_53 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_2_65 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_6 FILLER_0_2_77 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_2_83 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_2_85 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_2_97 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__fill_2 FILLER_0_30_109 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_30_118 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_30_129 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_30_139 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_30_150 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_30_215 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_30_225 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_30_229 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_30_237 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_30_253 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_8 FILLER_0_30_265 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_30_280 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__fill_1 FILLER_0_30_292 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_30_300 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_30_313 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_30_58 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_6 FILLER_0_30_70 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_30_85 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_31_102 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_31_106 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_31_133 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_31_137 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_31_152 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_31_167 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_31_176 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_31_180 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_4 FILLER_0_31_192 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_31_196 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_31_219 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_31_223 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_31_234 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_31_240 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_31_247 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_8 FILLER_0_31_259 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_31_267 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_31_271 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_31_279 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_31_286 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_31_297 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_31_301 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_31_307 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_31_321 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_31_330 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_31_334 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_31_85 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_32_108 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_32_141 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_32_186 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_32_194 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_32_206 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_32_216 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_32_244 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_32_282 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_32_294 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_32_3 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_32_32 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_32_320 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_33_107 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_33_125 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_4 FILLER_0_33_137 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_33_141 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_33_15 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_33_166 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_33_181 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_33_191 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_33_197 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_33_21 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_33_219 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_33_223 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_33_240 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_33_244 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_33_257 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_33_272 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_33_279 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_33_3 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_8 FILLER_0_33_324 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_33_332 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_33_42 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_33_57 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_33_74 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_34_129 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_34_18 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_34_197 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_34_224 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_34_241 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_34_253 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_34_3 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_4 FILLER_0_34_304 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_34_309 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_34_321 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__fill_2 FILLER_0_34_333 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_34_38 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_34_59 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_34_78 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_34_85 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_34_89 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_35_106 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_35_123 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_35_198 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_35_204 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_35_217 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_35_223 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_35_228 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_35_253 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_35_279 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_35_3 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_35_315 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_35_321 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_35_327 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_35_334 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_35_50 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_35_57 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_35_63 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_35_93 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_36_100 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_36_112 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_36_141 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_36_154 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_36_158 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_36_194 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_36_197 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_36_205 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_36_209 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_36_217 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_36_247 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_36_251 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_36_253 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__fill_2 FILLER_0_36_26 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_36_265 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_36_280 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_36_29 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_36_297 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_36_306 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_36_316 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_36_333 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_36_60 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_36_68 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_36_75 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_36_83 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_37_108 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_37_135 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_4 FILLER_0_37_147 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_37_156 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_37_162 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_37_166 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_37_169 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_37_177 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_37_223 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_37_231 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_37_241 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_37_249 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_37_257 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_37_262 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_37_278 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_37_32 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_37_331 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_37_44 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__fill_1 FILLER_0_37_75 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_38_131 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_38_139 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_38_141 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_38_179 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_38_188 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_38_206 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_38_227 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_38_24 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_38_262 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_38_274 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_38_285 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_38_299 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_38_306 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_38_313 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_38_317 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_38_331 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_38_36 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_38_44 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_38_78 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_38_85 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_8 FILLER_0_38_97 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_39_143 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_39_165 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_39_169 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_39_18 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_39_182 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__fill_1 FILLER_0_39_194 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_39_217 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_39_277 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_39_281 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_4 FILLER_0_39_293 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_39_297 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_39_3 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_39_30 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_39_311 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__fill_2 FILLER_0_39_323 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_39_331 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_39_51 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_39_55 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_39_57 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_39_88 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_3_105 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_3_111 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_3_113 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_3_125 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_3_137 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_3_149 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_3_15 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_6 FILLER_0_3_161 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_3_167 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_3_169 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_3_181 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_3_193 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_3_205 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_6 FILLER_0_3_217 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_3_223 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_3_225 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_3_229 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_3_235 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_3_256 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_4 FILLER_0_3_268 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_3_27 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__fill_1 FILLER_0_3_279 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_3_284 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_3_296 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_3_3 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_3_308 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_3_320 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_3 FILLER_0_3_332 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_3_39 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_4 FILLER_0_3_51 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_3_55 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_3_57 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_3_69 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_3_81 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_3_93 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__fill_2 FILLER_0_40_141 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_40_166 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_40_190 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_40_203 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_40_207 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_40_211 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_3 FILLER_0_40_223 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_40_23 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_40_235 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_40_249 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_40_261 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_40_265 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_40_279 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_40_288 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_8 FILLER_0_40_300 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_40_309 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_3 FILLER_0_40_321 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_40_333 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_40_43 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_41_122 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_41_157 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_41_169 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_41_21 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_41_231 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_41_239 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_41_248 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__fill_1 FILLER_0_41_260 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_41_269 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_41_28 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_41_294 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_41_3 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_41_303 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_41_309 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_41_334 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_41_39 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_41_52 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_41_60 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_4 FILLER_0_41_72 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_41_76 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_41_9 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_42_109 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__fill_2 FILLER_0_42_11 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_42_121 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_6 FILLER_0_42_133 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_42_139 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_42_141 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_42_154 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_42_16 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_42_170 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_42_20 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_42_213 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_42_24 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_42_247 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_42_251 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_42_274 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_42_279 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_42_29 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_42_3 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_42_307 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_42_333 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_42_73 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_42_81 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_42_85 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_42_93 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_42_97 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_43_102 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_43_110 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_43_119 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_43_129 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__fill_2 FILLER_0_43_141 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_43_163 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_43_167 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_43_178 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_43_194 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_43_222 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_43_225 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_43_288 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_43_3 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_43_319 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_43_332 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_43_49 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_43_77 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_44_109 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_44_134 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_44_139 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_44_159 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_44_251 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_44_253 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_44_26 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_44_267 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_44_271 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_44_307 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_44_309 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_44_325 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_44_333 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_44_41 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_44_47 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_44_51 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__fill_1 FILLER_0_44_63 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_44_85 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_45_153 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_45_167 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_45_169 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_45_223 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_45_225 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_45_233 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_45_241 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_45_260 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_45_270 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_45_278 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_45_281 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_45_287 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_45_320 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_3 FILLER_0_45_332 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_45_35 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_45_40 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_45_46 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_45_57 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_45_84 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_46_101 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_46_130 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_46_141 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_46_145 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_46_155 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_46_166 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_46_186 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_46_215 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_6 FILLER_0_46_227 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_46_23 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_46_233 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_46_249 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_46_259 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_46_268 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_46_27 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_46_279 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_46_291 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_4 FILLER_0_46_303 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_46_307 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_46_322 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_46_331 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_46_78 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_46_85 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_47_136 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_47_144 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_47_20 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_47_221 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_47_225 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_47_249 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_47_26 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_47_265 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_47_287 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_3 FILLER_0_47_3 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_47_306 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_47_330 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_47_334 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_47_54 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_47_57 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_47_65 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_47_80 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_47_86 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_47_9 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_47_91 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_48_100 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_48_126 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_48_134 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_48_138 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_48_155 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_48_162 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__fill_2 FILLER_0_48_174 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_48_26 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_48_274 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_48_283 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_48_32 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_48_334 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_48_41 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_48_54 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_48_58 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_48_66 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_48_74 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_48_79 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_48_83 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_49_113 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_49_117 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_49_129 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_49_153 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_49_161 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_49_167 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_49_178 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_49_183 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_49_193 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_49_201 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_49_225 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_49_25 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_49_273 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_49_279 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_49_281 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_49_288 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_49_294 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_49_3 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_49_301 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_49_313 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_8 FILLER_0_49_325 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_49_333 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_49_46 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_49_51 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_49_55 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_49_57 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_4_109 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_4_121 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_6 FILLER_0_4_133 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_4_139 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_4_141 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_4_15 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_4_153 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_4_165 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_4_177 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_6 FILLER_0_4_189 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_4_195 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_4_197 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_8 FILLER_0_4_209 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_4_217 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_4_253 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_4_264 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__fill_1 FILLER_0_4_27 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_4_276 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_4_288 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_4_29 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_4_3 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_8 FILLER_0_4_300 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_4_309 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_4_321 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__fill_2 FILLER_0_4_333 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_4_41 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_4_53 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_4_65 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_6 FILLER_0_4_77 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_4_83 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_4_85 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_4_97 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_4 FILLER_0_50_132 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_50_139 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_50_193 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_50_197 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__fill_1 FILLER_0_50_209 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_50_213 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_50_248 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_50_256 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_3 FILLER_0_50_268 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_50_278 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_50_284 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_50_29 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_50_292 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_3 FILLER_0_50_3 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_50_304 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_50_309 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_50_317 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_50_326 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_50_334 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_50_39 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_50_77 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_50_9 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_51_110 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_51_113 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_51_128 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_51_150 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_51_161 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_51_165 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_51_169 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__fill_1 FILLER_0_51_181 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_51_217 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_51_223 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_51_225 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_51_23 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_51_233 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_51_240 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_6 FILLER_0_51_252 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_51_265 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_51_276 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_51_295 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_51_303 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_51_317 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_51_333 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_51_34 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_51_49 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_51_55 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_51_82 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_51_87 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_51_97 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_52_118 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_52_129 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_52_138 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_52_153 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_52_165 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_52_194 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_52_213 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_52_227 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_52_231 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_52_26 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_52_260 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_52_264 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_52_278 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_52_286 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_52_297 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_52_3 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_52_306 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_52_315 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_52_32 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_52_325 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_52_64 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_52_83 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_53_107 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_53_111 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_53_113 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_53_122 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_53_140 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_53_167 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_53_189 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_53_19 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_53_217 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_53_223 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_53_272 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_53_281 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_53_289 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_53_298 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_53_3 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_53_309 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_53_313 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_53_323 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_53_327 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_53_333 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_53_51 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_53_57 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_54_108 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_54_112 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_54_131 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_54_135 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_54_139 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_54_174 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_54_222 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_54_235 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_54_265 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_54_276 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_54_281 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_6 FILLER_0_54_293 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_54_3 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_54_302 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_54_306 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_54_318 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_54_333 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_54_7 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_54_85 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_55_106 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_55_113 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_55_143 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_55_149 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_55_159 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_55_163 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_55_169 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_55_179 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_55_188 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_55_196 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_55_205 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_55_211 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_55_290 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_55_296 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_55_305 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_55_317 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_55_331 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_55_57 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_55_79 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_56_119 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_56_129 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_56_137 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_56_161 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_56_188 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_56_226 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_56_235 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_56_239 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_56_247 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_56_251 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_56_259 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_56_26 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_56_29 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_56_309 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_56_324 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_56_333 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_56_56 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_56_70 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_56_77 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_56_83 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_56_88 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_56_95 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_57_102 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_57_116 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_57_163 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_57_167 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_57_209 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_57_223 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_57_23 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_57_234 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_57_238 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_57_260 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_8 FILLER_0_57_272 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_57_28 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_57_288 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_57_295 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__fill_2 FILLER_0_57_307 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_57_315 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_57_319 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_57_329 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_57_57 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_57_65 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_57_71 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_57_92 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_58_139 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_58_15 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_58_152 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_58_165 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_58_178 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_58_188 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_58_192 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_58_197 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_58_245 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_58_251 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_58_253 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_58_265 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_58_276 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_58_289 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_58_298 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_58_3 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__fill_1 FILLER_0_58_302 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_58_307 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_58_309 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__fill_1 FILLER_0_58_32 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_58_321 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_58_331 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_58_71 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_59_108 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_59_11 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_59_133 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_59_16 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_59_167 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_59_189 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_59_223 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_59_23 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_59_252 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_59_264 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_4 FILLER_0_59_276 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_59_281 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_4 FILLER_0_59_293 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_59_297 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_59_3 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_59_303 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_59_309 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_59_327 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_59_35 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_59_39 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_59_69 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_5_105 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_5_111 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_5_113 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_5_125 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_5_137 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_5_149 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_5_15 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_6 FILLER_0_5_161 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_5_167 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_5_169 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_5_181 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_5_193 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_5_205 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_6 FILLER_0_5_217 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_5_223 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_5_225 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_5_236 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_5_247 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_5_256 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_3 FILLER_0_5_268 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_5_27 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_3 FILLER_0_5_277 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_5_281 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_5_293 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_5_3 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_5_305 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_5_317 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_6 FILLER_0_5_329 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_5_39 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_4 FILLER_0_5_51 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_5_55 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_5_57 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_5_69 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_5_81 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_5_93 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_3 FILLER_0_60_100 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_60_138 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_60_150 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_60_171 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_60_184 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_60_190 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_60_237 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_60_26 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_60_267 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_60_272 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_60_286 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_60_29 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_60_292 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_60_301 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_60_316 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_60_33 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_60_332 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_61_105 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_61_113 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_61_125 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_6 FILLER_0_61_137 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_61_143 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_61_147 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_61_160 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_61_164 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_61_178 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_61_182 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_61_186 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_61_194 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_61_207 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_61_218 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_61_281 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_61_295 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_61_3 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_61_331 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_61_53 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_61_57 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_61_76 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_61_91 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_61_97 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_62_121 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_62_139 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_62_141 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_62_184 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_62_195 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_62_217 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_62_281 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_62_3 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_62_306 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_62_318 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_62_326 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_62_333 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_62_49 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__fill_1 FILLER_0_62_7 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_62_70 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_62_82 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_62_85 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_62_99 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_63_122 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_63_137 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_63_158 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_63_175 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_63_197 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_63_220 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_63_231 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_63_25 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_63_265 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_63_276 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_63_289 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_3 FILLER_0_63_3 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_63_301 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_63_313 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_3 FILLER_0_63_325 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_63_33 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_63_331 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_63_38 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_63_49 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_63_54 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_63_60 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_6 FILLER_0_63_72 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_63_78 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_63_82 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_63_9 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_64_115 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_64_141 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_64_162 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_64_192 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_64_206 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_64_253 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_64_26 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_64_275 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_64_287 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_8 FILLER_0_64_299 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_64_307 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_64_309 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_64_321 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__fill_2 FILLER_0_64_333 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_64_72 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_64_78 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_64_82 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_64_85 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_64_90 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_65_100 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_65_110 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_65_113 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_65_139 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_65_163 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_65_201 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_65_211 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_65_223 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_65_243 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_65_268 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_6 FILLER_0_65_281 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_65_287 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_65_308 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_65_314 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_65_54 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_65_60 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_65_90 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_66_121 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_66_130 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_66_136 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_66_150 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_66_156 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_66_163 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_66_167 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_66_186 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_66_194 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_66_197 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_66_201 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_66_23 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_66_240 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_66_253 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_66_265 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__fill_2 FILLER_0_66_277 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_66_299 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_66_32 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_66_57 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_66_71 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_66_85 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_67_10 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_67_110 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_67_113 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_67_133 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_67_178 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_67_22 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_67_223 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_67_254 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_67_28 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_67_281 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_67_3 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_67_303 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_67_334 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_67_38 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_67_43 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_67_57 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_67_63 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_68_129 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_68_161 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_68_172 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_68_194 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_68_217 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_68_227 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_68_23 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_68_250 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_68_253 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_68_263 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_68_274 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_68_281 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_68_29 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_68_291 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_68_309 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_68_317 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_68_327 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_68_40 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_68_67 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_68_81 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_68_99 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_69_109 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_69_116 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_69_158 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_69_178 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_69_183 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_69_193 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_69_199 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_69_206 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_69_215 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_69_228 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_69_236 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_69_248 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_69_25 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_69_286 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_69_3 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_69_303 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_69_311 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_69_332 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_6_109 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_6_121 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_6 FILLER_0_6_133 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_6_139 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_6_141 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_6_15 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_6_153 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_6_165 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_6_177 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_6 FILLER_0_6_189 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_6_195 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_6_197 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__fill_1 FILLER_0_6_209 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_6_227 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_6_242 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_6_250 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_6_253 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_3 FILLER_0_6_265 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_6_27 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_6_282 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_6_29 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_6_296 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_6_3 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_6_309 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_6_321 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__fill_2 FILLER_0_6_333 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_6_41 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_6_53 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_6_65 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_6 FILLER_0_6_77 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_6_83 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_6_85 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_6_97 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_70_102 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_8 FILLER_0_70_114 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_70_122 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_70_128 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_70_138 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_70_141 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_70_152 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_70_183 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_70_191 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_70_197 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_70_204 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_70_216 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_70_227 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_70_233 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_70_237 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_70_24 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_70_29 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_70_3 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_70_309 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_70_60 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_70_85 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_71_109 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_71_122 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_71_175 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_71_210 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_71_223 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_71_275 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_71_279 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_71_3 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_71_306 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_71_48 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_71_57 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_71_61 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_71_98 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_72_161 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_72_183 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_72_191 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_72_197 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_72_211 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_72_246 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_72_253 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_72_283 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_72_3 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_72_306 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_72_309 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_72_32 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_72_333 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_72_55 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_72_59 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_72_83 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_72_97 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_73_12 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_73_136 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_73_147 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_6 FILLER_0_73_159 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_73_178 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_73_186 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_73_211 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_73_22 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_73_220 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_73_277 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_73_281 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_73_289 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_73_297 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__fill_2 FILLER_0_73_309 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_73_38 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_6 FILLER_0_73_50 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_73_57 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_73_98 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_74_110 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_74_12 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_74_135 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_74_161 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_3 FILLER_0_74_173 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_74_197 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_74_203 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_74_227 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_4 FILLER_0_74_23 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_74_239 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_74_248 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_74_27 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_74_29 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_74_298 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_74_3 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_74_302 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_74_317 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_74_33 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_74_332 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_74_46 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_74_56 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_74_8 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_74_85 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_75_122 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_75_136 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_75_143 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_75_161 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_75_178 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_75_199 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_75_207 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_75_215 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_75_223 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_75_225 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_75_241 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_75_250 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_75_258 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_75_271 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_75_279 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_75_289 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_75_3 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_75_47 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_75_72 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_75_9 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__fill_1 FILLER_0_76_15 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_76_188 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_76_197 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_76_210 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_76_231 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_76_253 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_76_274 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_76_3 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_6 FILLER_0_76_302 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_76_36 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_77_145 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_77_15 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_77_166 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_77_169 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_77_183 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_3 FILLER_0_77_195 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_77_294 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_77_3 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__fill_2 FILLER_0_78_141 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_78_15 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_78_20 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_78_241 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_78_251 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_78_286 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_78_29 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_78_3 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_4 FILLER_0_78_309 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_78_333 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_78_40 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_79_113 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_79_149 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_79_15 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_79_159 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_79_166 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_79_175 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_79_21 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_79_223 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_79_225 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_79_250 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_79_255 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_79_261 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_79_270 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_79_3 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_4 FILLER_0_79_308 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_79_49 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_7_105 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_7_111 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_7_113 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_7_125 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_7_137 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_7_149 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_7_15 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_6 FILLER_0_7_161 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_7_167 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_7_169 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_7_181 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_6 FILLER_0_7_193 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_7_199 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_7_206 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_7_222 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_7_228 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_7_244 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_7_250 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_7_259 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_7_266 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_7_27 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_7_3 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_7_312 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_8 FILLER_0_7_324 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_7_332 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_7_39 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_4 FILLER_0_7_51 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_7_55 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_7_57 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_7_69 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_7_81 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_7_93 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__fill_1 FILLER_0_80_10 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_80_116 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_80_14 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_80_141 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_80_148 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_80_161 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_80_18 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_80_189 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_80_195 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_80_22 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_80_223 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_80_225 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_80_233 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_80_238 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_80_246 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_80_256 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__fill_2 FILLER_0_80_26 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_80_268 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_80_274 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_80_278 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_80_281 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_80_289 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_80_297 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_80_302 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_80_309 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_80_315 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_80_319 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_80_32 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_80_326 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_80_334 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 FILLER_0_80_40 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_80_46 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_80_50 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_80_54 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_2 FILLER_0_80_57 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_80_6 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_80_62 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_8_109 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_8_121 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_6 FILLER_0_8_133 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_8_139 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_8_141 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_8_15 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_8_153 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_8_165 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_8_177 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_6 FILLER_0_8_189 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_8_195 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_8_197 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_8_231 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_8 FILLER_0_8_243 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_8_251 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_4 FILLER_0_8_253 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_8_27 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_8_29 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__fill_1 FILLER_0_8_294 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_8_298 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_8_3 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__fill_2 FILLER_0_8_306 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_8_309 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_8_321 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__fill_2 FILLER_0_8_333 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_8_41 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_8_53 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_8_65 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_6 FILLER_0_8_77 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_8_83 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_8_85 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_8_97 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_6 FILLER_0_9_105 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_9_111 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_9_113 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_9_125 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_9_137 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_9_149 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_9_15 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_6 FILLER_0_9_161 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_9_167 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_9_169 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_3 FILLER_0_9_181 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_8 FILLER_0_9_216 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_6 FILLER_0_9_225 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_9_231 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_9_238 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_9_27 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_4 FILLER_0_9_276 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_9_284 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_6 FILLER_0_9_296 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_9_3 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_9_309 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_9_321 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__fill_2 FILLER_0_9_333 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_9_39 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_4 FILLER_0_9_51 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__fill_1 FILLER_0_9_55 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_ef_sc_hd__decap_12 FILLER_0_9_57 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_9_69 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_9_81 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_ef_sc_hd__decap_12 FILLER_0_9_93 (.VPWR(VPWR),
    .VGND(VGND),
    .VPB(VPWR),
    .VNB(VGND));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_0_Left_81 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_0_Right_0 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_10_Left_91 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_10_Right_10 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_11_Left_92 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_11_Right_11 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_12_Left_93 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_12_Right_12 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_13_Left_94 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_13_Right_13 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_14_Left_95 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_14_Right_14 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_15_Left_96 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_15_Right_15 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_16_Left_97 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_16_Right_16 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_17_Left_98 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_17_Right_17 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_18_Left_99 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_18_Right_18 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_19_Left_100 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_19_Right_19 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_1_Left_82 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_1_Right_1 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_20_Left_101 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_20_Right_20 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_21_Left_102 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_21_Right_21 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_22_Left_103 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_22_Right_22 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_23_Left_104 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_23_Right_23 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_24_Left_105 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_24_Right_24 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_25_Left_106 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_25_Right_25 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_26_Left_107 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_26_Right_26 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_27_Left_108 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_27_Right_27 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_28_Left_109 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_28_Right_28 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_29_Left_110 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_29_Right_29 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_2_Left_83 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_2_Right_2 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_30_Left_111 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_30_Right_30 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_31_Left_112 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_31_Right_31 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_32_Left_113 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_32_Right_32 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_33_Left_114 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_33_Right_33 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_34_Left_115 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_34_Right_34 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_35_Left_116 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_35_Right_35 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_36_Left_117 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_36_Right_36 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_37_Left_118 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_37_Right_37 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_38_Left_119 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_38_Right_38 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_39_Left_120 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_39_Right_39 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_3_Left_84 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_3_Right_3 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_40_Left_121 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_40_Right_40 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_41_Left_122 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_41_Right_41 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_42_Left_123 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_42_Right_42 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_43_Left_124 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_43_Right_43 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_44_Left_125 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_44_Right_44 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_45_Left_126 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_45_Right_45 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_46_Left_127 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_46_Right_46 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_47_Left_128 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_47_Right_47 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_48_Left_129 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_48_Right_48 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_49_Left_130 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_49_Right_49 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_4_Left_85 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_4_Right_4 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_50_Left_131 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_50_Right_50 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_51_Left_132 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_51_Right_51 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_52_Left_133 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_52_Right_52 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_53_Left_134 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_53_Right_53 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_54_Left_135 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_54_Right_54 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_55_Left_136 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_55_Right_55 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_56_Left_137 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_56_Right_56 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_57_Left_138 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_57_Right_57 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_58_Left_139 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_58_Right_58 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_59_Left_140 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_59_Right_59 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_5_Left_86 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_5_Right_5 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_60_Left_141 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_60_Right_60 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_61_Left_142 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_61_Right_61 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_62_Left_143 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_62_Right_62 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_63_Left_144 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_63_Right_63 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_64_Left_145 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_64_Right_64 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_65_Left_146 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_65_Right_65 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_66_Left_147 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_66_Right_66 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_67_Left_148 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_67_Right_67 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_68_Left_149 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_68_Right_68 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_69_Left_150 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_69_Right_69 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_6_Left_87 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_6_Right_6 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_70_Left_151 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_70_Right_70 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_71_Left_152 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_71_Right_71 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_72_Left_153 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_72_Right_72 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_73_Left_154 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_73_Right_73 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_74_Left_155 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_74_Right_74 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_75_Left_156 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_75_Right_75 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_76_Left_157 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_76_Right_76 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_77_Left_158 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_77_Right_77 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_78_Left_159 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_78_Right_78 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_79_Left_160 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_79_Right_79 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_7_Left_88 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_7_Right_7 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_80_Left_161 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_80_Right_80 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_8_Left_89 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_8_Right_8 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_9_Left_90 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_9_Right_9 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_162 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_163 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_164 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_165 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_166 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_167 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_168 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_169 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_170 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_171 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_172 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_10_222 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_10_223 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_10_224 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_10_225 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_10_226 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_10_227 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_11_228 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_11_229 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_11_230 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_11_231 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_11_232 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_12_233 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_12_234 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_12_235 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_12_236 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_12_237 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_12_238 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_13_239 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_13_240 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_13_241 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_13_242 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_13_243 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_14_244 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_14_245 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_14_246 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_14_247 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_14_248 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_14_249 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_15_250 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_15_251 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_15_252 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_15_253 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_15_254 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_16_255 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_16_256 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_16_257 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_16_258 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_16_259 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_16_260 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_17_261 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_17_262 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_17_263 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_17_264 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_17_265 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_18_266 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_18_267 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_18_268 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_18_269 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_18_270 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_18_271 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_19_272 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_19_273 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_19_274 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_19_275 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_19_276 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_1_173 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_1_174 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_1_175 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_1_176 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_1_177 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_20_277 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_20_278 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_20_279 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_20_280 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_20_281 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_20_282 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_21_283 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_21_284 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_21_285 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_21_286 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_21_287 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_22_288 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_22_289 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_22_290 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_22_291 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_22_292 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_22_293 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_23_294 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_23_295 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_23_296 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_23_297 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_23_298 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_24_299 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_24_300 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_24_301 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_24_302 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_24_303 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_24_304 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_25_305 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_25_306 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_25_307 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_25_308 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_25_309 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_26_310 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_26_311 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_26_312 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_26_313 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_26_314 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_26_315 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_27_316 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_27_317 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_27_318 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_27_319 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_27_320 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_28_321 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_28_322 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_28_323 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_28_324 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_28_325 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_28_326 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_29_327 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_29_328 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_29_329 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_29_330 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_29_331 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_2_178 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_2_179 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_2_180 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_2_181 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_2_182 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_2_183 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_30_332 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_30_333 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_30_334 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_30_335 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_30_336 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_30_337 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_31_338 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_31_339 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_31_340 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_31_341 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_31_342 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_32_343 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_32_344 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_32_345 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_32_346 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_32_347 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_32_348 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_33_349 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_33_350 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_33_351 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_33_352 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_33_353 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_34_354 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_34_355 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_34_356 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_34_357 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_34_358 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_34_359 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_35_360 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_35_361 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_35_362 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_35_363 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_35_364 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_36_365 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_36_366 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_36_367 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_36_368 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_36_369 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_36_370 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_37_371 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_37_372 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_37_373 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_37_374 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_37_375 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_38_376 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_38_377 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_38_378 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_38_379 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_38_380 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_38_381 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_39_382 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_39_383 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_39_384 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_39_385 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_39_386 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_3_184 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_3_185 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_3_186 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_3_187 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_3_188 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_40_387 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_40_388 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_40_389 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_40_390 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_40_391 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_40_392 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_41_393 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_41_394 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_41_395 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_41_396 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_41_397 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_42_398 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_42_399 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_42_400 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_42_401 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_42_402 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_42_403 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_43_404 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_43_405 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_43_406 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_43_407 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_43_408 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_44_409 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_44_410 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_44_411 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_44_412 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_44_413 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_44_414 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_45_415 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_45_416 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_45_417 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_45_418 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_45_419 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_46_420 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_46_421 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_46_422 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_46_423 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_46_424 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_46_425 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_47_426 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_47_427 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_47_428 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_47_429 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_47_430 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_48_431 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_48_432 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_48_433 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_48_434 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_48_435 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_48_436 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_49_437 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_49_438 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_49_439 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_49_440 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_49_441 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_4_189 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_4_190 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_4_191 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_4_192 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_4_193 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_4_194 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_50_442 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_50_443 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_50_444 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_50_445 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_50_446 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_50_447 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_51_448 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_51_449 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_51_450 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_51_451 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_51_452 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_52_453 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_52_454 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_52_455 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_52_456 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_52_457 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_52_458 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_53_459 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_53_460 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_53_461 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_53_462 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_53_463 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_54_464 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_54_465 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_54_466 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_54_467 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_54_468 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_54_469 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_55_470 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_55_471 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_55_472 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_55_473 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_55_474 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_56_475 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_56_476 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_56_477 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_56_478 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_56_479 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_56_480 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_57_481 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_57_482 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_57_483 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_57_484 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_57_485 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_58_486 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_58_487 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_58_488 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_58_489 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_58_490 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_58_491 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_59_492 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_59_493 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_59_494 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_59_495 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_59_496 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_5_195 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_5_196 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_5_197 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_5_198 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_5_199 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_60_497 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_60_498 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_60_499 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_60_500 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_60_501 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_60_502 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_61_503 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_61_504 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_61_505 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_61_506 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_61_507 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_62_508 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_62_509 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_62_510 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_62_511 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_62_512 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_62_513 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_63_514 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_63_515 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_63_516 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_63_517 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_63_518 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_64_519 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_64_520 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_64_521 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_64_522 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_64_523 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_64_524 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_65_525 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_65_526 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_65_527 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_65_528 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_65_529 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_66_530 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_66_531 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_66_532 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_66_533 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_66_534 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_66_535 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_67_536 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_67_537 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_67_538 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_67_539 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_67_540 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_68_541 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_68_542 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_68_543 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_68_544 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_68_545 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_68_546 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_69_547 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_69_548 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_69_549 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_69_550 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_69_551 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_6_200 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_6_201 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_6_202 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_6_203 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_6_204 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_6_205 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_70_552 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_70_553 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_70_554 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_70_555 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_70_556 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_70_557 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_71_558 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_71_559 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_71_560 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_71_561 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_71_562 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_72_563 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_72_564 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_72_565 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_72_566 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_72_567 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_72_568 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_73_569 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_73_570 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_73_571 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_73_572 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_73_573 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_74_574 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_74_575 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_74_576 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_74_577 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_74_578 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_74_579 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_75_580 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_75_581 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_75_582 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_75_583 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_75_584 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_76_585 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_76_586 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_76_587 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_76_588 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_76_589 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_76_590 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_77_591 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_77_592 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_77_593 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_77_594 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_77_595 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_78_596 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_78_597 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_78_598 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_78_599 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_78_600 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_78_601 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_79_602 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_79_603 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_79_604 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_79_605 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_79_606 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_7_206 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_7_207 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_7_208 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_7_209 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_7_210 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_80_607 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_80_608 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_80_609 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_80_610 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_80_611 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_80_612 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_80_613 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_80_614 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_80_615 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_80_616 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_80_617 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_8_211 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_8_212 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_8_213 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_8_214 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_8_215 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_8_216 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_9_217 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_9_218 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_9_219 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_9_220 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_9_221 (.VGND(VGND),
    .VPWR(VPWR));
 sky130_fd_sc_hd__clkbuf_4 _084_ (.A(\sgnl_sync0.signal_o ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_000_));
 sky130_fd_sc_hd__buf_2 _085_ (.A(_000_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_001_));
 sky130_fd_sc_hd__and2_1 _086_ (.A(_001_),
    .B(\spi0.input_px_gray_o[0] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_002_));
 sky130_fd_sc_hd__clkbuf_1 _087_ (.A(_002_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0.config_data_i[0] ));
 sky130_fd_sc_hd__and2_1 _088_ (.A(_001_),
    .B(\spi0.input_px_gray_o[1] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_003_));
 sky130_fd_sc_hd__clkbuf_1 _089_ (.A(_003_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0.config_data_i[1] ));
 sky130_fd_sc_hd__and2_1 _090_ (.A(_001_),
    .B(\spi0.input_px_gray_o[2] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_004_));
 sky130_fd_sc_hd__buf_1 _091_ (.A(_004_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0.config_data_i[2] ));
 sky130_fd_sc_hd__and2_1 _092_ (.A(_001_),
    .B(\spi0.input_px_gray_o[3] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_005_));
 sky130_fd_sc_hd__clkbuf_1 _093_ (.A(_005_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0.config_data_i[3] ));
 sky130_fd_sc_hd__and2_1 _094_ (.A(_001_),
    .B(\spi0.input_px_gray_o[4] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_006_));
 sky130_fd_sc_hd__clkbuf_1 _095_ (.A(_006_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0.config_data_i[4] ));
 sky130_fd_sc_hd__and2_1 _096_ (.A(_001_),
    .B(\spi0.input_px_gray_o[5] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_007_));
 sky130_fd_sc_hd__clkbuf_1 _097_ (.A(_007_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0.config_data_i[5] ));
 sky130_fd_sc_hd__and2_1 _098_ (.A(_001_),
    .B(\spi0.input_px_gray_o[6] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_008_));
 sky130_fd_sc_hd__clkbuf_1 _099_ (.A(_008_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0.config_data_i[6] ));
 sky130_fd_sc_hd__and2_1 _100_ (.A(_001_),
    .B(\spi0.input_px_gray_o[7] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_009_));
 sky130_fd_sc_hd__clkbuf_1 _101_ (.A(_009_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0.config_data_i[7] ));
 sky130_fd_sc_hd__and2_1 _102_ (.A(_001_),
    .B(\spi0.input_px_gray_o[8] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_010_));
 sky130_fd_sc_hd__clkbuf_1 _103_ (.A(_010_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0.config_data_i[8] ));
 sky130_fd_sc_hd__and2_1 _104_ (.A(_001_),
    .B(\spi0.input_px_gray_o[9] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_011_));
 sky130_fd_sc_hd__clkbuf_1 _105_ (.A(_011_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0.config_data_i[9] ));
 sky130_fd_sc_hd__buf_2 _106_ (.A(_000_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_012_));
 sky130_fd_sc_hd__and2_1 _107_ (.A(_012_),
    .B(\spi0.input_px_gray_o[10] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_013_));
 sky130_fd_sc_hd__clkbuf_1 _108_ (.A(_013_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0.config_data_i[10] ));
 sky130_fd_sc_hd__and2_1 _109_ (.A(_012_),
    .B(\spi0.input_px_gray_o[11] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_014_));
 sky130_fd_sc_hd__clkbuf_1 _110_ (.A(_014_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0.config_data_i[11] ));
 sky130_fd_sc_hd__and2_1 _111_ (.A(_012_),
    .B(\spi0.input_px_gray_o[12] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_015_));
 sky130_fd_sc_hd__clkbuf_1 _112_ (.A(_015_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0.config_data_i[12] ));
 sky130_fd_sc_hd__and2_1 _113_ (.A(_012_),
    .B(\spi0.input_px_gray_o[13] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_016_));
 sky130_fd_sc_hd__clkbuf_1 _114_ (.A(_016_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0.config_data_i[13] ));
 sky130_fd_sc_hd__and2_1 _115_ (.A(_012_),
    .B(\spi0.input_px_gray_o[14] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_017_));
 sky130_fd_sc_hd__clkbuf_1 _116_ (.A(_017_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0.config_data_i[14] ));
 sky130_fd_sc_hd__and2_1 _117_ (.A(_012_),
    .B(\spi0.input_px_gray_o[15] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_018_));
 sky130_fd_sc_hd__clkbuf_1 _118_ (.A(_018_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0.config_data_i[15] ));
 sky130_fd_sc_hd__and2_1 _119_ (.A(_012_),
    .B(\spi0.input_px_gray_o[16] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_019_));
 sky130_fd_sc_hd__clkbuf_1 _120_ (.A(_019_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0.config_data_i[16] ));
 sky130_fd_sc_hd__and2_1 _121_ (.A(_012_),
    .B(\spi0.input_px_gray_o[17] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_020_));
 sky130_fd_sc_hd__clkbuf_1 _122_ (.A(_020_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0.config_data_i[17] ));
 sky130_fd_sc_hd__and2_1 _123_ (.A(_012_),
    .B(\spi0.input_px_gray_o[18] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_021_));
 sky130_fd_sc_hd__clkbuf_1 _124_ (.A(_021_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0.config_data_i[18] ));
 sky130_fd_sc_hd__and2_1 _125_ (.A(_012_),
    .B(\spi0.input_px_gray_o[19] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_022_));
 sky130_fd_sc_hd__clkbuf_1 _126_ (.A(_022_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0.config_data_i[19] ));
 sky130_fd_sc_hd__clkbuf_4 _127_ (.A(_000_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_023_));
 sky130_fd_sc_hd__and2_1 _128_ (.A(_023_),
    .B(\spi0.input_px_gray_o[20] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_024_));
 sky130_fd_sc_hd__clkbuf_1 _129_ (.A(_024_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0.config_data_i[20] ));
 sky130_fd_sc_hd__and2_1 _130_ (.A(_023_),
    .B(\spi0.input_px_gray_o[21] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_025_));
 sky130_fd_sc_hd__clkbuf_1 _131_ (.A(_025_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0.config_data_i[21] ));
 sky130_fd_sc_hd__and2_1 _132_ (.A(_023_),
    .B(\spi0.input_px_gray_o[22] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_026_));
 sky130_fd_sc_hd__clkbuf_1 _133_ (.A(_026_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0.config_data_i[22] ));
 sky130_fd_sc_hd__and2_1 _134_ (.A(_023_),
    .B(\spi0.input_px_gray_o[23] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_027_));
 sky130_fd_sc_hd__clkbuf_1 _135_ (.A(_027_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0.config_data_i[23] ));
 sky130_fd_sc_hd__mux2_1 _136_ (.A0(\spi0.input_px_gray_o[0] ),
    .A1(\lfsr0.lfsr_out[0] ),
    .S(_023_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_028_));
 sky130_fd_sc_hd__clkbuf_1 _137_ (.A(_028_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.gray_scale0.in_px_rgb_i[0] ));
 sky130_fd_sc_hd__mux2_1 _138_ (.A0(\spi0.input_px_gray_o[1] ),
    .A1(\lfsr0.lfsr_out[1] ),
    .S(_023_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_029_));
 sky130_fd_sc_hd__clkbuf_1 _139_ (.A(_029_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.gray_scale0.in_px_rgb_i[1] ));
 sky130_fd_sc_hd__mux2_1 _140_ (.A0(\spi0.input_px_gray_o[2] ),
    .A1(\lfsr0.lfsr_out[2] ),
    .S(_023_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_030_));
 sky130_fd_sc_hd__clkbuf_1 _141_ (.A(_030_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.gray_scale0.in_px_rgb_i[2] ));
 sky130_fd_sc_hd__mux2_1 _142_ (.A0(\spi0.input_px_gray_o[3] ),
    .A1(\lfsr0.lfsr_out[3] ),
    .S(_023_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_031_));
 sky130_fd_sc_hd__clkbuf_1 _143_ (.A(_031_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.gray_scale0.in_px_rgb_i[3] ));
 sky130_fd_sc_hd__mux2_1 _144_ (.A0(\spi0.input_px_gray_o[4] ),
    .A1(\lfsr0.lfsr_out[4] ),
    .S(_023_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_032_));
 sky130_fd_sc_hd__buf_1 _145_ (.A(_032_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.gray_scale0.in_px_rgb_i[4] ));
 sky130_fd_sc_hd__buf_4 _146_ (.A(_000_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_033_));
 sky130_fd_sc_hd__mux2_1 _147_ (.A0(\spi0.input_px_gray_o[5] ),
    .A1(\lfsr0.lfsr_out[5] ),
    .S(_033_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_034_));
 sky130_fd_sc_hd__clkbuf_2 _148_ (.A(_034_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.gray_scale0.in_px_rgb_i[5] ));
 sky130_fd_sc_hd__mux2_1 _149_ (.A0(\spi0.input_px_gray_o[6] ),
    .A1(\lfsr0.lfsr_out[6] ),
    .S(_033_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_035_));
 sky130_fd_sc_hd__clkbuf_2 _150_ (.A(_035_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.gray_scale0.in_px_rgb_i[6] ));
 sky130_fd_sc_hd__mux2_1 _151_ (.A0(\spi0.input_px_gray_o[7] ),
    .A1(\lfsr0.lfsr_out[7] ),
    .S(_033_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_036_));
 sky130_fd_sc_hd__clkbuf_2 _152_ (.A(_036_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.gray_scale0.in_px_rgb_i[7] ));
 sky130_fd_sc_hd__mux2_1 _153_ (.A0(\spi0.input_px_gray_o[8] ),
    .A1(\lfsr0.lfsr_out[8] ),
    .S(_033_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_037_));
 sky130_fd_sc_hd__clkbuf_1 _154_ (.A(_037_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.gray_scale0.in_px_rgb_i[8] ));
 sky130_fd_sc_hd__mux2_1 _155_ (.A0(\spi0.input_px_gray_o[9] ),
    .A1(\lfsr0.lfsr_out[9] ),
    .S(_033_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_038_));
 sky130_fd_sc_hd__dlymetal6s2s_1 _156_ (.A(_038_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.gray_scale0.in_px_rgb_i[9] ));
 sky130_fd_sc_hd__mux2_1 _157_ (.A0(\spi0.input_px_gray_o[10] ),
    .A1(\lfsr0.lfsr_out[10] ),
    .S(_033_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_039_));
 sky130_fd_sc_hd__dlymetal6s2s_1 _158_ (.A(_039_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.gray_scale0.in_px_rgb_i[10] ));
 sky130_fd_sc_hd__mux2_1 _159_ (.A0(\spi0.input_px_gray_o[11] ),
    .A1(\lfsr0.lfsr_out[11] ),
    .S(_033_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_040_));
 sky130_fd_sc_hd__buf_1 _160_ (.A(_040_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.gray_scale0.in_px_rgb_i[11] ));
 sky130_fd_sc_hd__mux2_1 _161_ (.A0(\spi0.input_px_gray_o[12] ),
    .A1(\lfsr0.lfsr_out[12] ),
    .S(_033_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_041_));
 sky130_fd_sc_hd__dlymetal6s2s_1 _162_ (.A(_041_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.gray_scale0.in_px_rgb_i[12] ));
 sky130_fd_sc_hd__mux2_1 _163_ (.A0(\spi0.input_px_gray_o[13] ),
    .A1(\lfsr0.lfsr_out[13] ),
    .S(_033_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_042_));
 sky130_fd_sc_hd__clkbuf_2 _164_ (.A(_042_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.gray_scale0.in_px_rgb_i[13] ));
 sky130_fd_sc_hd__mux2_1 _165_ (.A0(\spi0.input_px_gray_o[14] ),
    .A1(\lfsr0.lfsr_out[14] ),
    .S(_033_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_043_));
 sky130_fd_sc_hd__dlymetal6s2s_1 _166_ (.A(_043_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.gray_scale0.in_px_rgb_i[14] ));
 sky130_fd_sc_hd__buf_4 _167_ (.A(_000_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_044_));
 sky130_fd_sc_hd__mux2_1 _168_ (.A0(\spi0.input_px_gray_o[15] ),
    .A1(\lfsr0.lfsr_out[15] ),
    .S(_044_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_045_));
 sky130_fd_sc_hd__clkbuf_2 _169_ (.A(_045_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.gray_scale0.in_px_rgb_i[15] ));
 sky130_fd_sc_hd__mux2_1 _170_ (.A0(\spi0.input_px_gray_o[16] ),
    .A1(\lfsr0.lfsr_out[16] ),
    .S(_044_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_046_));
 sky130_fd_sc_hd__clkbuf_1 _171_ (.A(_046_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.gray_scale0.in_px_rgb_i[16] ));
 sky130_fd_sc_hd__mux2_1 _172_ (.A0(\spi0.input_px_gray_o[17] ),
    .A1(\lfsr0.lfsr_out[17] ),
    .S(_044_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_047_));
 sky130_fd_sc_hd__clkbuf_1 _173_ (.A(_047_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.gray_scale0.in_px_rgb_i[17] ));
 sky130_fd_sc_hd__mux2_1 _174_ (.A0(\spi0.input_px_gray_o[18] ),
    .A1(\lfsr0.lfsr_out[18] ),
    .S(_044_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_048_));
 sky130_fd_sc_hd__buf_1 _175_ (.A(_048_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.gray_scale0.in_px_rgb_i[18] ));
 sky130_fd_sc_hd__mux2_1 _176_ (.A0(\spi0.input_px_gray_o[19] ),
    .A1(\lfsr0.lfsr_out[19] ),
    .S(_044_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_049_));
 sky130_fd_sc_hd__buf_1 _177_ (.A(_049_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.gray_scale0.in_px_rgb_i[19] ));
 sky130_fd_sc_hd__mux2_1 _178_ (.A0(\spi0.input_px_gray_o[20] ),
    .A1(\lfsr0.lfsr_out[20] ),
    .S(_044_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_050_));
 sky130_fd_sc_hd__buf_1 _179_ (.A(_050_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.gray_scale0.in_px_rgb_i[20] ));
 sky130_fd_sc_hd__mux2_1 _180_ (.A0(\spi0.input_px_gray_o[21] ),
    .A1(\lfsr0.lfsr_out[21] ),
    .S(_044_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_051_));
 sky130_fd_sc_hd__buf_2 _181_ (.A(_051_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.gray_scale0.in_px_rgb_i[21] ));
 sky130_fd_sc_hd__mux2_1 _182_ (.A0(\spi0.input_px_gray_o[22] ),
    .A1(\lfsr0.lfsr_out[22] ),
    .S(_044_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_052_));
 sky130_fd_sc_hd__buf_2 _183_ (.A(_052_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.gray_scale0.in_px_rgb_i[22] ));
 sky130_fd_sc_hd__mux2_1 _184_ (.A0(\spi0.input_px_gray_o[23] ),
    .A1(\lfsr0.lfsr_out[23] ),
    .S(_044_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_053_));
 sky130_fd_sc_hd__clkbuf_2 _185_ (.A(_053_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.gray_scale0.in_px_rgb_i[23] ));
 sky130_fd_sc_hd__mux2_1 _186_ (.A0(\spi0.px_rdy_i_spi_o ),
    .A1(\lfsr0.lfsr_rdy_o ),
    .S(_044_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_054_));
 sky130_fd_sc_hd__buf_1 _187_ (.A(_054_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.gray_scale0.px_rdy_i ));
 sky130_fd_sc_hd__buf_4 _188_ (.A(\sgnl_sync0.signal_o ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_055_));
 sky130_fd_sc_hd__mux2_1 _189_ (.A0(\gray_sobel0.out_pixel_o[0] ),
    .A1(\lfsr0.config_data_o[0] ),
    .S(_055_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_056_));
 sky130_fd_sc_hd__clkbuf_1 _190_ (.A(_056_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.output_px_sobel_i[0] ));
 sky130_fd_sc_hd__mux2_1 _191_ (.A0(\gray_sobel0.out_pixel_o[1] ),
    .A1(\lfsr0.config_data_o[1] ),
    .S(_055_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_057_));
 sky130_fd_sc_hd__clkbuf_1 _192_ (.A(_057_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.output_px_sobel_i[1] ));
 sky130_fd_sc_hd__mux2_1 _193_ (.A0(\gray_sobel0.out_pixel_o[2] ),
    .A1(\lfsr0.config_data_o[2] ),
    .S(_055_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_058_));
 sky130_fd_sc_hd__clkbuf_1 _194_ (.A(_058_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.output_px_sobel_i[2] ));
 sky130_fd_sc_hd__mux2_1 _195_ (.A0(\gray_sobel0.out_pixel_o[3] ),
    .A1(\lfsr0.config_data_o[3] ),
    .S(_055_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_059_));
 sky130_fd_sc_hd__clkbuf_1 _196_ (.A(_059_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.output_px_sobel_i[3] ));
 sky130_fd_sc_hd__mux2_1 _197_ (.A0(\gray_sobel0.out_pixel_o[4] ),
    .A1(\lfsr0.config_data_o[4] ),
    .S(_055_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_060_));
 sky130_fd_sc_hd__clkbuf_1 _198_ (.A(_060_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.output_px_sobel_i[4] ));
 sky130_fd_sc_hd__mux2_1 _199_ (.A0(\gray_sobel0.out_pixel_o[5] ),
    .A1(\lfsr0.config_data_o[5] ),
    .S(_055_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_061_));
 sky130_fd_sc_hd__clkbuf_1 _200_ (.A(_061_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.output_px_sobel_i[5] ));
 sky130_fd_sc_hd__mux2_1 _201_ (.A0(\gray_sobel0.out_pixel_o[6] ),
    .A1(\lfsr0.config_data_o[6] ),
    .S(_055_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_062_));
 sky130_fd_sc_hd__clkbuf_1 _202_ (.A(_062_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.output_px_sobel_i[6] ));
 sky130_fd_sc_hd__mux2_1 _203_ (.A0(\gray_sobel0.out_pixel_o[7] ),
    .A1(\lfsr0.config_data_o[7] ),
    .S(_055_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_063_));
 sky130_fd_sc_hd__clkbuf_1 _204_ (.A(_063_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.output_px_sobel_i[7] ));
 sky130_fd_sc_hd__mux2_1 _205_ (.A0(\gray_sobel0.out_pixel_o[8] ),
    .A1(\lfsr0.config_data_o[8] ),
    .S(_055_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_064_));
 sky130_fd_sc_hd__clkbuf_1 _206_ (.A(_064_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.output_px_sobel_i[8] ));
 sky130_fd_sc_hd__mux2_1 _207_ (.A0(\gray_sobel0.out_pixel_o[9] ),
    .A1(\lfsr0.config_data_o[9] ),
    .S(_055_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_065_));
 sky130_fd_sc_hd__clkbuf_1 _208_ (.A(_065_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.output_px_sobel_i[9] ));
 sky130_fd_sc_hd__buf_4 _209_ (.A(\sgnl_sync0.signal_o ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_066_));
 sky130_fd_sc_hd__mux2_1 _210_ (.A0(\gray_sobel0.out_pixel_o[10] ),
    .A1(\lfsr0.config_data_o[10] ),
    .S(_066_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_067_));
 sky130_fd_sc_hd__clkbuf_1 _211_ (.A(_067_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.output_px_sobel_i[10] ));
 sky130_fd_sc_hd__mux2_1 _212_ (.A0(\gray_sobel0.out_pixel_o[11] ),
    .A1(\lfsr0.config_data_o[11] ),
    .S(_066_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_068_));
 sky130_fd_sc_hd__clkbuf_1 _213_ (.A(_068_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.output_px_sobel_i[11] ));
 sky130_fd_sc_hd__mux2_1 _214_ (.A0(\gray_sobel0.out_pixel_o[12] ),
    .A1(\lfsr0.config_data_o[12] ),
    .S(_066_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_069_));
 sky130_fd_sc_hd__clkbuf_1 _215_ (.A(_069_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.output_px_sobel_i[12] ));
 sky130_fd_sc_hd__mux2_1 _216_ (.A0(\gray_sobel0.out_pixel_o[13] ),
    .A1(\lfsr0.config_data_o[13] ),
    .S(_066_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_070_));
 sky130_fd_sc_hd__clkbuf_1 _217_ (.A(_070_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.output_px_sobel_i[13] ));
 sky130_fd_sc_hd__mux2_1 _218_ (.A0(\gray_sobel0.out_pixel_o[14] ),
    .A1(\lfsr0.config_data_o[14] ),
    .S(_066_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_071_));
 sky130_fd_sc_hd__clkbuf_1 _219_ (.A(_071_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.output_px_sobel_i[14] ));
 sky130_fd_sc_hd__mux2_1 _220_ (.A0(\gray_sobel0.out_pixel_o[15] ),
    .A1(\lfsr0.config_data_o[15] ),
    .S(_066_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_072_));
 sky130_fd_sc_hd__clkbuf_1 _221_ (.A(_072_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.output_px_sobel_i[15] ));
 sky130_fd_sc_hd__mux2_1 _222_ (.A0(\gray_sobel0.out_pixel_o[16] ),
    .A1(\lfsr0.config_data_o[16] ),
    .S(_066_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_073_));
 sky130_fd_sc_hd__clkbuf_1 _223_ (.A(_073_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.output_px_sobel_i[16] ));
 sky130_fd_sc_hd__mux2_1 _224_ (.A0(\gray_sobel0.out_pixel_o[17] ),
    .A1(\lfsr0.config_data_o[17] ),
    .S(_066_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_074_));
 sky130_fd_sc_hd__clkbuf_1 _225_ (.A(_074_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.output_px_sobel_i[17] ));
 sky130_fd_sc_hd__mux2_1 _226_ (.A0(\gray_sobel0.out_pixel_o[18] ),
    .A1(\lfsr0.config_data_o[18] ),
    .S(_066_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_075_));
 sky130_fd_sc_hd__clkbuf_1 _227_ (.A(_075_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.output_px_sobel_i[18] ));
 sky130_fd_sc_hd__mux2_1 _228_ (.A0(\gray_sobel0.out_pixel_o[19] ),
    .A1(\lfsr0.config_data_o[19] ),
    .S(_066_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_076_));
 sky130_fd_sc_hd__clkbuf_1 _229_ (.A(_076_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.output_px_sobel_i[19] ));
 sky130_fd_sc_hd__mux2_1 _230_ (.A0(\gray_sobel0.out_pixel_o[20] ),
    .A1(\lfsr0.config_data_o[20] ),
    .S(_000_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_077_));
 sky130_fd_sc_hd__clkbuf_1 _231_ (.A(_077_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.output_px_sobel_i[20] ));
 sky130_fd_sc_hd__mux2_1 _232_ (.A0(\gray_sobel0.out_pixel_o[21] ),
    .A1(\lfsr0.config_data_o[21] ),
    .S(_000_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_078_));
 sky130_fd_sc_hd__clkbuf_1 _233_ (.A(_078_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.output_px_sobel_i[21] ));
 sky130_fd_sc_hd__mux2_1 _234_ (.A0(\gray_sobel0.out_pixel_o[22] ),
    .A1(\lfsr0.config_data_o[22] ),
    .S(_000_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_079_));
 sky130_fd_sc_hd__clkbuf_1 _235_ (.A(_079_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.output_px_sobel_i[22] ));
 sky130_fd_sc_hd__mux2_1 _236_ (.A0(\gray_sobel0.out_pixel_o[23] ),
    .A1(\lfsr0.config_data_o[23] ),
    .S(_000_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_080_));
 sky130_fd_sc_hd__clkbuf_1 _237_ (.A(_080_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.output_px_sobel_i[23] ));
 sky130_fd_sc_hd__mux2_1 _238_ (.A0(\gray_sobel0.px_rdy_o ),
    .A1(\lfsr0.config_done_o ),
    .S(_000_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_081_));
 sky130_fd_sc_hd__clkbuf_2 _239_ (.A(_081_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.px_rdy_o_spi_i ));
 sky130_fd_sc_hd__and2_1 _240_ (.A(_023_),
    .B(\spi0.px_rdy_i_spi_o ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(_082_));
 sky130_fd_sc_hd__buf_1 _241_ (.A(_082_),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0.config_rdy_i ));
 sky130_fd_sc_hd__clkbuf_4 _259_ (.A(\spi0.spi0.sdo_o ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(uo_out[0]));
 sky130_fd_sc_hd__clkbuf_4 _260_ (.A(\lfsr0.lfsr_done ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(uo_out[1]));
 sky130_fd_sc_hd__clkbuf_4 _261_ (.A(ena),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(uo_out[2]));
 sky130_fd_sc_hd__clkbuf_4 _262_ (.A(\gray_sobel0.out_pixel_o[0] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(uo_out[3]));
 sky130_fd_sc_hd__clkbuf_4 _263_ (.A(\gray_sobel0.out_pixel_o[1] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(uo_out[4]));
 sky130_fd_sc_hd__clkbuf_4 _264_ (.A(\gray_sobel0.out_pixel_o[2] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(uo_out[5]));
 sky130_fd_sc_hd__clkbuf_4 _265_ (.A(\gray_sobel0.out_pixel_o[3] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(uo_out[6]));
 sky130_fd_sc_hd__clkbuf_4 _266_ (.A(\gray_sobel0.out_pixel_o[4] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(uo_out[7]));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_0_clk (.A(clk),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(clknet_0_clk));
 sky130_fd_sc_hd__clkbuf_16 \clkbuf_0_spi0.spi0._157_  (.A(\spi0.spi0._157_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\clknet_0_spi0.spi0._157_ ));
 sky130_fd_sc_hd__clkbuf_16 \clkbuf_0_spi0.spi0._158_  (.A(\spi0.spi0._158_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\clknet_0_spi0.spi0._158_ ));
 sky130_fd_sc_hd__clkbuf_16 \clkbuf_0_spi0.spi0._159_  (.A(\spi0.spi0._159_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\clknet_0_spi0.spi0._159_ ));
 sky130_fd_sc_hd__clkbuf_16 \clkbuf_0_ui_in[0]  (.A(ui_in[0]),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(clknet_0_ui_in[0]));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_1_0__f_clk (.A(clknet_0_clk),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(clknet_1_0__leaf_clk));
 sky130_fd_sc_hd__clkbuf_16 \clkbuf_1_0__f_spi0.spi0._157_  (.A(\clknet_0_spi0.spi0._157_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\clknet_1_0__leaf_spi0.spi0._157_ ));
 sky130_fd_sc_hd__clkbuf_16 \clkbuf_1_0__f_spi0.spi0._158_  (.A(\clknet_0_spi0.spi0._158_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\clknet_1_0__leaf_spi0.spi0._158_ ));
 sky130_fd_sc_hd__clkbuf_16 \clkbuf_1_0__f_spi0.spi0._159_  (.A(\clknet_0_spi0.spi0._159_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\clknet_1_0__leaf_spi0.spi0._159_ ));
 sky130_fd_sc_hd__clkbuf_16 \clkbuf_1_0__f_ui_in[0]  (.A(clknet_0_ui_in[0]),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(clknet_1_0__leaf_ui_in[0]));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_1_1__f_clk (.A(clknet_0_clk),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(clknet_1_1__leaf_clk));
 sky130_fd_sc_hd__clkbuf_16 \clkbuf_1_1__f_spi0.spi0._157_  (.A(\clknet_0_spi0.spi0._157_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\clknet_1_1__leaf_spi0.spi0._157_ ));
 sky130_fd_sc_hd__clkbuf_16 \clkbuf_1_1__f_spi0.spi0._158_  (.A(\clknet_0_spi0.spi0._158_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\clknet_1_1__leaf_spi0.spi0._158_ ));
 sky130_fd_sc_hd__clkbuf_16 \clkbuf_1_1__f_spi0.spi0._159_  (.A(\clknet_0_spi0.spi0._159_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\clknet_1_1__leaf_spi0.spi0._159_ ));
 sky130_fd_sc_hd__clkbuf_16 \clkbuf_1_1__f_ui_in[0]  (.A(clknet_0_ui_in[0]),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(clknet_1_1__leaf_ui_in[0]));
 sky130_fd_sc_hd__clkbuf_8 clkbuf_leaf_0_clk (.A(clknet_1_0__leaf_clk),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(clknet_leaf_0_clk));
 sky130_fd_sc_hd__clkbuf_8 clkbuf_leaf_10_clk (.A(clknet_1_1__leaf_clk),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(clknet_leaf_10_clk));
 sky130_fd_sc_hd__clkbuf_8 clkbuf_leaf_11_clk (.A(clknet_1_1__leaf_clk),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(clknet_leaf_11_clk));
 sky130_fd_sc_hd__clkbuf_8 clkbuf_leaf_12_clk (.A(clknet_1_1__leaf_clk),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(clknet_leaf_12_clk));
 sky130_fd_sc_hd__clkbuf_8 clkbuf_leaf_13_clk (.A(clknet_1_1__leaf_clk),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(clknet_leaf_13_clk));
 sky130_fd_sc_hd__clkbuf_8 clkbuf_leaf_14_clk (.A(clknet_1_1__leaf_clk),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(clknet_leaf_14_clk));
 sky130_fd_sc_hd__clkbuf_8 clkbuf_leaf_15_clk (.A(clknet_1_1__leaf_clk),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(clknet_leaf_15_clk));
 sky130_fd_sc_hd__clkbuf_8 clkbuf_leaf_16_clk (.A(clknet_1_0__leaf_clk),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(clknet_leaf_16_clk));
 sky130_fd_sc_hd__clkbuf_8 clkbuf_leaf_17_clk (.A(clknet_1_0__leaf_clk),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(clknet_leaf_17_clk));
 sky130_fd_sc_hd__clkbuf_8 clkbuf_leaf_18_clk (.A(clknet_1_0__leaf_clk),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(clknet_leaf_18_clk));
 sky130_fd_sc_hd__clkbuf_8 clkbuf_leaf_19_clk (.A(clknet_1_0__leaf_clk),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(clknet_leaf_19_clk));
 sky130_fd_sc_hd__clkbuf_8 clkbuf_leaf_1_clk (.A(clknet_1_0__leaf_clk),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(clknet_leaf_1_clk));
 sky130_fd_sc_hd__clkbuf_8 clkbuf_leaf_20_clk (.A(clknet_1_0__leaf_clk),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(clknet_leaf_20_clk));
 sky130_fd_sc_hd__clkbuf_8 clkbuf_leaf_21_clk (.A(clknet_1_0__leaf_clk),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(clknet_leaf_21_clk));
 sky130_fd_sc_hd__clkbuf_8 clkbuf_leaf_22_clk (.A(clknet_1_0__leaf_clk),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(clknet_leaf_22_clk));
 sky130_fd_sc_hd__clkbuf_8 clkbuf_leaf_23_clk (.A(clknet_1_0__leaf_clk),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(clknet_leaf_23_clk));
 sky130_fd_sc_hd__clkbuf_8 clkbuf_leaf_2_clk (.A(clknet_1_1__leaf_clk),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(clknet_leaf_2_clk));
 sky130_fd_sc_hd__clkbuf_8 clkbuf_leaf_3_clk (.A(clknet_1_1__leaf_clk),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(clknet_leaf_3_clk));
 sky130_fd_sc_hd__clkbuf_8 clkbuf_leaf_4_clk (.A(clknet_1_1__leaf_clk),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(clknet_leaf_4_clk));
 sky130_fd_sc_hd__clkbuf_8 clkbuf_leaf_5_clk (.A(clknet_1_1__leaf_clk),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(clknet_leaf_5_clk));
 sky130_fd_sc_hd__clkbuf_8 clkbuf_leaf_6_clk (.A(clknet_1_1__leaf_clk),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(clknet_leaf_6_clk));
 sky130_fd_sc_hd__clkbuf_8 clkbuf_leaf_7_clk (.A(clknet_1_1__leaf_clk),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(clknet_leaf_7_clk));
 sky130_fd_sc_hd__clkbuf_8 clkbuf_leaf_8_clk (.A(clknet_1_1__leaf_clk),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(clknet_leaf_8_clk));
 sky130_fd_sc_hd__clkbuf_8 clkbuf_leaf_9_clk (.A(clknet_1_1__leaf_clk),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(clknet_leaf_9_clk));
 sky130_fd_sc_hd__clkbuf_2 fanout10 (.A(net11),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net10));
 sky130_fd_sc_hd__clkbuf_4 fanout11 (.A(net22),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net11));
 sky130_fd_sc_hd__clkbuf_4 fanout12 (.A(net22),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net12));
 sky130_fd_sc_hd__clkbuf_4 fanout13 (.A(net22),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net13));
 sky130_fd_sc_hd__clkbuf_4 fanout14 (.A(net15),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net14));
 sky130_fd_sc_hd__clkbuf_4 fanout15 (.A(net22),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net15));
 sky130_fd_sc_hd__clkbuf_4 fanout16 (.A(net18),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net16));
 sky130_fd_sc_hd__clkbuf_4 fanout17 (.A(net18),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net17));
 sky130_fd_sc_hd__clkbuf_2 fanout18 (.A(net22),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net18));
 sky130_fd_sc_hd__clkbuf_4 fanout19 (.A(net21),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net19));
 sky130_fd_sc_hd__clkbuf_4 fanout20 (.A(net21),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net20));
 sky130_fd_sc_hd__clkbuf_2 fanout21 (.A(net22),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net21));
 sky130_fd_sc_hd__clkbuf_4 fanout22 (.A(\gray_sobel0.gray_scale0.nreset_i ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net22));
 sky130_fd_sc_hd__clkbuf_4 fanout23 (.A(net25),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net23));
 sky130_fd_sc_hd__clkbuf_4 fanout24 (.A(net25),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net24));
 sky130_fd_sc_hd__clkbuf_2 fanout25 (.A(net31),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net25));
 sky130_fd_sc_hd__clkbuf_4 fanout26 (.A(net31),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net26));
 sky130_fd_sc_hd__clkbuf_4 fanout27 (.A(net31),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net27));
 sky130_fd_sc_hd__clkbuf_4 fanout28 (.A(net31),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net28));
 sky130_fd_sc_hd__clkbuf_4 fanout29 (.A(net30),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net29));
 sky130_fd_sc_hd__buf_2 fanout30 (.A(net31),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net30));
 sky130_fd_sc_hd__buf_2 fanout31 (.A(\gray_sobel0.gray_scale0.nreset_i ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net31));
 sky130_fd_sc_hd__clkbuf_4 fanout32 (.A(net34),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net32));
 sky130_fd_sc_hd__clkbuf_4 fanout33 (.A(net34),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net33));
 sky130_fd_sc_hd__clkbuf_4 fanout34 (.A(\gray_sobel0.gray_scale0.nreset_i ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net34));
 sky130_fd_sc_hd__clkbuf_4 fanout35 (.A(net40),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net35));
 sky130_fd_sc_hd__clkbuf_4 fanout36 (.A(net40),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net36));
 sky130_fd_sc_hd__clkbuf_2 fanout37 (.A(net40),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net37));
 sky130_fd_sc_hd__clkbuf_4 fanout38 (.A(net39),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net38));
 sky130_fd_sc_hd__clkbuf_4 fanout39 (.A(net40),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net39));
 sky130_fd_sc_hd__clkbuf_4 fanout40 (.A(\gray_sobel0.gray_scale0.nreset_i ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net40));
 sky130_fd_sc_hd__clkbuf_4 fanout9 (.A(net10),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net9));
 sky130_fd_sc_hd__buf_2 \gray_sobel0._039_  (.A(net3),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0._027_ ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0._040_  (.A0(\gray_sobel0.gray_scale0.out_px_gray_o[0] ),
    .A1(\gray_sobel0.gray_scale0.in_px_rgb_i[0] ),
    .S(\gray_sobel0._027_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0._028_ ));
 sky130_fd_sc_hd__dlymetal6s2s_1 \gray_sobel0._041_  (.A(\gray_sobel0._028_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.in_px_sobel[0] ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0._042_  (.A0(\gray_sobel0.gray_scale0.out_px_gray_o[1] ),
    .A1(\gray_sobel0.gray_scale0.in_px_rgb_i[1] ),
    .S(\gray_sobel0._027_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0._029_ ));
 sky130_fd_sc_hd__dlymetal6s2s_1 \gray_sobel0._043_  (.A(\gray_sobel0._029_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.in_px_sobel[1] ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0._044_  (.A0(\gray_sobel0.gray_scale0.out_px_gray_o[2] ),
    .A1(\gray_sobel0.gray_scale0.in_px_rgb_i[2] ),
    .S(net3),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0._030_ ));
 sky130_fd_sc_hd__dlymetal6s2s_1 \gray_sobel0._045_  (.A(\gray_sobel0._030_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.in_px_sobel[2] ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0._046_  (.A0(\gray_sobel0.gray_scale0.out_px_gray_o[3] ),
    .A1(\gray_sobel0.gray_scale0.in_px_rgb_i[3] ),
    .S(net3),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0._031_ ));
 sky130_fd_sc_hd__dlymetal6s2s_1 \gray_sobel0._047_  (.A(\gray_sobel0._031_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.in_px_sobel[3] ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0._048_  (.A0(\gray_sobel0.gray_scale0.out_px_gray_o[4] ),
    .A1(\gray_sobel0.gray_scale0.in_px_rgb_i[4] ),
    .S(net3),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0._032_ ));
 sky130_fd_sc_hd__clkbuf_2 \gray_sobel0._049_  (.A(\gray_sobel0._032_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.in_px_sobel[4] ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0._050_  (.A0(\gray_sobel0.gray_scale0.out_px_gray_o[5] ),
    .A1(\gray_sobel0.gray_scale0.in_px_rgb_i[5] ),
    .S(net3),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0._033_ ));
 sky130_fd_sc_hd__dlymetal6s2s_1 \gray_sobel0._051_  (.A(\gray_sobel0._033_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.in_px_sobel[5] ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0._052_  (.A0(\gray_sobel0.gray_scale0.out_px_gray_o[6] ),
    .A1(\gray_sobel0.gray_scale0.in_px_rgb_i[6] ),
    .S(net3),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0._034_ ));
 sky130_fd_sc_hd__dlymetal6s2s_1 \gray_sobel0._053_  (.A(\gray_sobel0._034_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.in_px_sobel[6] ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0._054_  (.A0(\gray_sobel0.gray_scale0.out_px_gray_o[7] ),
    .A1(\gray_sobel0.gray_scale0.in_px_rgb_i[7] ),
    .S(net3),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0._035_ ));
 sky130_fd_sc_hd__buf_2 \gray_sobel0._055_  (.A(\gray_sobel0._035_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.in_px_sobel[7] ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0._056_  (.A0(\gray_sobel0.gray_scale0.px_rdy_o ),
    .A1(\gray_sobel0.gray_scale0.px_rdy_i ),
    .S(\gray_sobel0._027_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0._036_ ));
 sky130_fd_sc_hd__buf_2 \gray_sobel0._057_  (.A(net4),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0._037_ ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0._058_  (.A0(\gray_sobel0.px_rdy_o_sobel ),
    .A1(\gray_sobel0._036_ ),
    .S(\gray_sobel0._037_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0._038_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0._059_  (.A(\gray_sobel0._038_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.px_rdy_o ));
 sky130_fd_sc_hd__buf_2 \gray_sobel0._060_  (.A(net4),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0._000_ ));
 sky130_fd_sc_hd__and2b_1 \gray_sobel0._061_  (.A_N(\gray_sobel0._000_ ),
    .B(\gray_sobel0._036_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0._001_ ));
 sky130_fd_sc_hd__clkbuf_2 \gray_sobel0._062_  (.A(\gray_sobel0._001_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.px_rdy_i_sobel ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0._063_  (.A0(\gray_sobel0.out_px_sobel[0] ),
    .A1(\gray_sobel0.in_px_sobel[0] ),
    .S(\gray_sobel0._037_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0._002_ ));
 sky130_fd_sc_hd__buf_1 \gray_sobel0._064_  (.A(\gray_sobel0._002_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.out_pixel_o[0] ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0._065_  (.A0(\gray_sobel0.out_px_sobel[1] ),
    .A1(\gray_sobel0.in_px_sobel[1] ),
    .S(\gray_sobel0._037_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0._003_ ));
 sky130_fd_sc_hd__buf_1 \gray_sobel0._066_  (.A(\gray_sobel0._003_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.out_pixel_o[1] ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0._067_  (.A0(\gray_sobel0.out_px_sobel[2] ),
    .A1(\gray_sobel0.in_px_sobel[2] ),
    .S(net4),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0._004_ ));
 sky130_fd_sc_hd__buf_1 \gray_sobel0._068_  (.A(\gray_sobel0._004_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.out_pixel_o[2] ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0._069_  (.A0(\gray_sobel0.out_px_sobel[3] ),
    .A1(\gray_sobel0.in_px_sobel[3] ),
    .S(net4),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0._005_ ));
 sky130_fd_sc_hd__buf_1 \gray_sobel0._070_  (.A(\gray_sobel0._005_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.out_pixel_o[3] ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0._071_  (.A0(\gray_sobel0.out_px_sobel[4] ),
    .A1(\gray_sobel0.in_px_sobel[4] ),
    .S(net4),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0._006_ ));
 sky130_fd_sc_hd__buf_1 \gray_sobel0._072_  (.A(\gray_sobel0._006_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.out_pixel_o[4] ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0._073_  (.A0(\gray_sobel0.out_px_sobel[5] ),
    .A1(\gray_sobel0.in_px_sobel[5] ),
    .S(net4),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0._007_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0._074_  (.A(\gray_sobel0._007_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.out_pixel_o[5] ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0._075_  (.A0(\gray_sobel0.out_px_sobel[6] ),
    .A1(\gray_sobel0.in_px_sobel[6] ),
    .S(net4),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0._008_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0._076_  (.A(\gray_sobel0._008_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.out_pixel_o[6] ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0._077_  (.A0(\gray_sobel0.out_px_sobel[7] ),
    .A1(\gray_sobel0.in_px_sobel[7] ),
    .S(net4),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0._009_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0._078_  (.A(\gray_sobel0._009_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.out_pixel_o[7] ));
 sky130_fd_sc_hd__buf_2 \gray_sobel0._079_  (.A(\gray_sobel0._027_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0._010_ ));
 sky130_fd_sc_hd__and3_1 \gray_sobel0._080_  (.A(\gray_sobel0._010_ ),
    .B(\gray_sobel0._000_ ),
    .C(\gray_sobel0.gray_scale0.in_px_rgb_i[8] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0._011_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0._081_  (.A(\gray_sobel0._011_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.out_pixel_o[8] ));
 sky130_fd_sc_hd__and3_1 \gray_sobel0._082_  (.A(\gray_sobel0._010_ ),
    .B(\gray_sobel0._000_ ),
    .C(\gray_sobel0.gray_scale0.in_px_rgb_i[9] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0._012_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0._083_  (.A(\gray_sobel0._012_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.out_pixel_o[9] ));
 sky130_fd_sc_hd__and3_1 \gray_sobel0._084_  (.A(\gray_sobel0._010_ ),
    .B(\gray_sobel0._000_ ),
    .C(\gray_sobel0.gray_scale0.in_px_rgb_i[10] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0._013_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0._085_  (.A(\gray_sobel0._013_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.out_pixel_o[10] ));
 sky130_fd_sc_hd__and3_1 \gray_sobel0._086_  (.A(\gray_sobel0._010_ ),
    .B(\gray_sobel0._000_ ),
    .C(\gray_sobel0.gray_scale0.in_px_rgb_i[11] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0._014_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0._087_  (.A(\gray_sobel0._014_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.out_pixel_o[11] ));
 sky130_fd_sc_hd__and3_1 \gray_sobel0._088_  (.A(\gray_sobel0._010_ ),
    .B(\gray_sobel0._000_ ),
    .C(\gray_sobel0.gray_scale0.in_px_rgb_i[12] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0._015_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0._089_  (.A(\gray_sobel0._015_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.out_pixel_o[12] ));
 sky130_fd_sc_hd__and3_1 \gray_sobel0._090_  (.A(\gray_sobel0._010_ ),
    .B(\gray_sobel0._000_ ),
    .C(\gray_sobel0.gray_scale0.in_px_rgb_i[13] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0._016_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0._091_  (.A(\gray_sobel0._016_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.out_pixel_o[13] ));
 sky130_fd_sc_hd__and3_1 \gray_sobel0._092_  (.A(\gray_sobel0._010_ ),
    .B(\gray_sobel0._000_ ),
    .C(\gray_sobel0.gray_scale0.in_px_rgb_i[14] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0._017_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0._093_  (.A(\gray_sobel0._017_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.out_pixel_o[14] ));
 sky130_fd_sc_hd__and3_1 \gray_sobel0._094_  (.A(\gray_sobel0._010_ ),
    .B(\gray_sobel0._000_ ),
    .C(\gray_sobel0.gray_scale0.in_px_rgb_i[15] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0._018_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0._095_  (.A(\gray_sobel0._018_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.out_pixel_o[15] ));
 sky130_fd_sc_hd__and3_1 \gray_sobel0._096_  (.A(\gray_sobel0._010_ ),
    .B(\gray_sobel0._000_ ),
    .C(\gray_sobel0.gray_scale0.in_px_rgb_i[16] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0._019_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0._097_  (.A(\gray_sobel0._019_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.out_pixel_o[16] ));
 sky130_fd_sc_hd__and3_1 \gray_sobel0._098_  (.A(\gray_sobel0._010_ ),
    .B(\gray_sobel0._037_ ),
    .C(\gray_sobel0.gray_scale0.in_px_rgb_i[17] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0._020_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0._099_  (.A(\gray_sobel0._020_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.out_pixel_o[17] ));
 sky130_fd_sc_hd__and3_1 \gray_sobel0._100_  (.A(\gray_sobel0._027_ ),
    .B(\gray_sobel0._037_ ),
    .C(\gray_sobel0.gray_scale0.in_px_rgb_i[18] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0._021_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0._101_  (.A(\gray_sobel0._021_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.out_pixel_o[18] ));
 sky130_fd_sc_hd__and3_1 \gray_sobel0._102_  (.A(\gray_sobel0._027_ ),
    .B(\gray_sobel0._037_ ),
    .C(\gray_sobel0.gray_scale0.in_px_rgb_i[19] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0._022_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0._103_  (.A(\gray_sobel0._022_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.out_pixel_o[19] ));
 sky130_fd_sc_hd__and3_1 \gray_sobel0._104_  (.A(\gray_sobel0._027_ ),
    .B(\gray_sobel0._037_ ),
    .C(\gray_sobel0.gray_scale0.in_px_rgb_i[20] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0._023_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0._105_  (.A(\gray_sobel0._023_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.out_pixel_o[20] ));
 sky130_fd_sc_hd__and3_1 \gray_sobel0._106_  (.A(\gray_sobel0._027_ ),
    .B(\gray_sobel0._037_ ),
    .C(\gray_sobel0.gray_scale0.in_px_rgb_i[21] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0._024_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0._107_  (.A(\gray_sobel0._024_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.out_pixel_o[21] ));
 sky130_fd_sc_hd__and3_1 \gray_sobel0._108_  (.A(\gray_sobel0._027_ ),
    .B(\gray_sobel0._037_ ),
    .C(\gray_sobel0.gray_scale0.in_px_rgb_i[22] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0._025_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0._109_  (.A(\gray_sobel0._025_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.out_pixel_o[22] ));
 sky130_fd_sc_hd__and3_1 \gray_sobel0._110_  (.A(\gray_sobel0._027_ ),
    .B(\gray_sobel0._037_ ),
    .C(\gray_sobel0.gray_scale0.in_px_rgb_i[23] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0._026_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0._111_  (.A(\gray_sobel0._026_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.out_pixel_o[23] ));
 sky130_fd_sc_hd__nor2_1 \gray_sobel0.gray_scale0._103_  (.A(\gray_sobel0.gray_scale0.in_px_rgb_i[5] ),
    .B(\gray_sobel0.gray_scale0.in_px_rgb_i[4] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.gray_scale0._032_ ));
 sky130_fd_sc_hd__and2_1 \gray_sobel0.gray_scale0._104_  (.A(\gray_sobel0.gray_scale0.in_px_rgb_i[5] ),
    .B(\gray_sobel0.gray_scale0.in_px_rgb_i[4] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.gray_scale0._033_ ));
 sky130_fd_sc_hd__nor2_1 \gray_sobel0.gray_scale0._105_  (.A(\gray_sobel0.gray_scale0._032_ ),
    .B(\gray_sobel0.gray_scale0._033_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.gray_scale0._034_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.gray_scale0._106_  (.A(\gray_sobel0.gray_scale0.in_px_rgb_i[9] ),
    .B(\gray_sobel0.gray_scale0._034_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.gray_scale0._035_ ));
 sky130_fd_sc_hd__nand2_1 \gray_sobel0.gray_scale0._107_  (.A(\gray_sobel0.gray_scale0.in_px_rgb_i[18] ),
    .B(\gray_sobel0.gray_scale0.in_px_rgb_i[12] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.gray_scale0._036_ ));
 sky130_fd_sc_hd__or2_1 \gray_sobel0.gray_scale0._108_  (.A(\gray_sobel0.gray_scale0.in_px_rgb_i[18] ),
    .B(\gray_sobel0.gray_scale0.in_px_rgb_i[12] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.gray_scale0._037_ ));
 sky130_fd_sc_hd__nand2_1 \gray_sobel0.gray_scale0._109_  (.A(\gray_sobel0.gray_scale0._036_ ),
    .B(\gray_sobel0.gray_scale0._037_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.gray_scale0._038_ ));
 sky130_fd_sc_hd__xor2_1 \gray_sobel0.gray_scale0._110_  (.A(\gray_sobel0.gray_scale0.in_px_rgb_i[21] ),
    .B(\gray_sobel0.gray_scale0._038_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.gray_scale0._039_ ));
 sky130_fd_sc_hd__nor2_1 \gray_sobel0.gray_scale0._111_  (.A(\gray_sobel0.gray_scale0._035_ ),
    .B(\gray_sobel0.gray_scale0._039_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.gray_scale0._040_ ));
 sky130_fd_sc_hd__and2_1 \gray_sobel0.gray_scale0._112_  (.A(\gray_sobel0.gray_scale0._035_ ),
    .B(\gray_sobel0.gray_scale0._039_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.gray_scale0._041_ ));
 sky130_fd_sc_hd__nor2_1 \gray_sobel0.gray_scale0._113_  (.A(\gray_sobel0.gray_scale0._040_ ),
    .B(\gray_sobel0.gray_scale0._041_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.gray_scale0._000_ ));
 sky130_fd_sc_hd__a21boi_1 \gray_sobel0.gray_scale0._114_  (.A1(\gray_sobel0.gray_scale0.in_px_rgb_i[21] ),
    .A2(\gray_sobel0.gray_scale0._037_ ),
    .B1_N(\gray_sobel0.gray_scale0._036_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.gray_scale0._042_ ));
 sky130_fd_sc_hd__or2_1 \gray_sobel0.gray_scale0._115_  (.A(\gray_sobel0.gray_scale0.in_px_rgb_i[19] ),
    .B(\gray_sobel0.gray_scale0.in_px_rgb_i[13] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.gray_scale0._043_ ));
 sky130_fd_sc_hd__nand2_1 \gray_sobel0.gray_scale0._116_  (.A(\gray_sobel0.gray_scale0.in_px_rgb_i[19] ),
    .B(\gray_sobel0.gray_scale0.in_px_rgb_i[13] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.gray_scale0._044_ ));
 sky130_fd_sc_hd__nand2_1 \gray_sobel0.gray_scale0._117_  (.A(\gray_sobel0.gray_scale0._043_ ),
    .B(\gray_sobel0.gray_scale0._044_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.gray_scale0._045_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.gray_scale0._118_  (.A(\gray_sobel0.gray_scale0.in_px_rgb_i[22] ),
    .B(\gray_sobel0.gray_scale0._045_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.gray_scale0._046_ ));
 sky130_fd_sc_hd__xor2_2 \gray_sobel0.gray_scale0._119_  (.A(\gray_sobel0.gray_scale0.in_px_rgb_i[6] ),
    .B(\gray_sobel0.gray_scale0.in_px_rgb_i[5] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.gray_scale0._047_ ));
 sky130_fd_sc_hd__xnor2_2 \gray_sobel0.gray_scale0._120_  (.A(\gray_sobel0.gray_scale0.in_px_rgb_i[10] ),
    .B(\gray_sobel0.gray_scale0._047_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.gray_scale0._048_ ));
 sky130_fd_sc_hd__inv_2 \gray_sobel0.gray_scale0._121_  (.A(\gray_sobel0.gray_scale0.in_px_rgb_i[9] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.gray_scale0._049_ ));
 sky130_fd_sc_hd__o21ba_1 \gray_sobel0.gray_scale0._122_  (.A1(\gray_sobel0.gray_scale0._049_ ),
    .A2(\gray_sobel0.gray_scale0._032_ ),
    .B1_N(\gray_sobel0.gray_scale0._033_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.gray_scale0._050_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.gray_scale0._123_  (.A(\gray_sobel0.gray_scale0._048_ ),
    .B(\gray_sobel0.gray_scale0._050_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.gray_scale0._051_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.gray_scale0._124_  (.A(\gray_sobel0.gray_scale0._046_ ),
    .B(\gray_sobel0.gray_scale0._051_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.gray_scale0._052_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.gray_scale0._125_  (.A(\gray_sobel0.gray_scale0._040_ ),
    .B(\gray_sobel0.gray_scale0._052_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.gray_scale0._053_ ));
 sky130_fd_sc_hd__or2_1 \gray_sobel0.gray_scale0._126_  (.A(\gray_sobel0.gray_scale0._042_ ),
    .B(\gray_sobel0.gray_scale0._053_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.gray_scale0._054_ ));
 sky130_fd_sc_hd__nand2_1 \gray_sobel0.gray_scale0._127_  (.A(\gray_sobel0.gray_scale0._042_ ),
    .B(\gray_sobel0.gray_scale0._053_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.gray_scale0._055_ ));
 sky130_fd_sc_hd__and2_1 \gray_sobel0.gray_scale0._128_  (.A(\gray_sobel0.gray_scale0._054_ ),
    .B(\gray_sobel0.gray_scale0._055_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.gray_scale0._056_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0.gray_scale0._129_  (.A(\gray_sobel0.gray_scale0._056_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.gray_scale0._001_ ));
 sky130_fd_sc_hd__nand2_1 \gray_sobel0.gray_scale0._130_  (.A(\gray_sobel0.gray_scale0._040_ ),
    .B(\gray_sobel0.gray_scale0._052_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.gray_scale0._057_ ));
 sky130_fd_sc_hd__a21bo_1 \gray_sobel0.gray_scale0._131_  (.A1(\gray_sobel0.gray_scale0.in_px_rgb_i[22] ),
    .A2(\gray_sobel0.gray_scale0._043_ ),
    .B1_N(\gray_sobel0.gray_scale0._044_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.gray_scale0._058_ ));
 sky130_fd_sc_hd__nand2_1 \gray_sobel0.gray_scale0._132_  (.A(\gray_sobel0.gray_scale0._048_ ),
    .B(\gray_sobel0.gray_scale0._050_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.gray_scale0._059_ ));
 sky130_fd_sc_hd__nor2_1 \gray_sobel0.gray_scale0._133_  (.A(\gray_sobel0.gray_scale0._048_ ),
    .B(\gray_sobel0.gray_scale0._050_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.gray_scale0._060_ ));
 sky130_fd_sc_hd__a21oi_1 \gray_sobel0.gray_scale0._134_  (.A1(\gray_sobel0.gray_scale0._046_ ),
    .A2(\gray_sobel0.gray_scale0._059_ ),
    .B1(\gray_sobel0.gray_scale0._060_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.gray_scale0._061_ ));
 sky130_fd_sc_hd__and2_1 \gray_sobel0.gray_scale0._135_  (.A(\gray_sobel0.gray_scale0.in_px_rgb_i[6] ),
    .B(\gray_sobel0.gray_scale0.in_px_rgb_i[5] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.gray_scale0._062_ ));
 sky130_fd_sc_hd__a21oi_1 \gray_sobel0.gray_scale0._136_  (.A1(\gray_sobel0.gray_scale0.in_px_rgb_i[10] ),
    .A2(\gray_sobel0.gray_scale0._047_ ),
    .B1(\gray_sobel0.gray_scale0._062_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.gray_scale0._063_ ));
 sky130_fd_sc_hd__xor2_1 \gray_sobel0.gray_scale0._137_  (.A(\gray_sobel0.gray_scale0.in_px_rgb_i[6] ),
    .B(\gray_sobel0.gray_scale0.in_px_rgb_i[7] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.gray_scale0._064_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.gray_scale0._138_  (.A(\gray_sobel0.gray_scale0.in_px_rgb_i[11] ),
    .B(\gray_sobel0.gray_scale0._064_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.gray_scale0._065_ ));
 sky130_fd_sc_hd__xor2_1 \gray_sobel0.gray_scale0._139_  (.A(\gray_sobel0.gray_scale0._063_ ),
    .B(\gray_sobel0.gray_scale0._065_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.gray_scale0._066_ ));
 sky130_fd_sc_hd__nand2_1 \gray_sobel0.gray_scale0._140_  (.A(\gray_sobel0.gray_scale0.in_px_rgb_i[20] ),
    .B(\gray_sobel0.gray_scale0.in_px_rgb_i[14] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.gray_scale0._067_ ));
 sky130_fd_sc_hd__or2_1 \gray_sobel0.gray_scale0._141_  (.A(\gray_sobel0.gray_scale0.in_px_rgb_i[20] ),
    .B(\gray_sobel0.gray_scale0.in_px_rgb_i[14] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.gray_scale0._068_ ));
 sky130_fd_sc_hd__nand2_1 \gray_sobel0.gray_scale0._142_  (.A(\gray_sobel0.gray_scale0._067_ ),
    .B(\gray_sobel0.gray_scale0._068_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.gray_scale0._069_ ));
 sky130_fd_sc_hd__xor2_1 \gray_sobel0.gray_scale0._143_  (.A(\gray_sobel0.gray_scale0.in_px_rgb_i[23] ),
    .B(\gray_sobel0.gray_scale0._069_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.gray_scale0._070_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.gray_scale0._144_  (.A(\gray_sobel0.gray_scale0._066_ ),
    .B(\gray_sobel0.gray_scale0._070_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.gray_scale0._071_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.gray_scale0._145_  (.A(\gray_sobel0.gray_scale0._061_ ),
    .B(\gray_sobel0.gray_scale0._071_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.gray_scale0._072_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.gray_scale0._146_  (.A(\gray_sobel0.gray_scale0._058_ ),
    .B(\gray_sobel0.gray_scale0._072_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.gray_scale0._073_ ));
 sky130_fd_sc_hd__a21oi_2 \gray_sobel0.gray_scale0._147_  (.A1(\gray_sobel0.gray_scale0._057_ ),
    .A2(\gray_sobel0.gray_scale0._054_ ),
    .B1(\gray_sobel0.gray_scale0._073_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.gray_scale0._074_ ));
 sky130_fd_sc_hd__a21boi_1 \gray_sobel0.gray_scale0._148_  (.A1(\gray_sobel0.gray_scale0.in_px_rgb_i[23] ),
    .A2(\gray_sobel0.gray_scale0._068_ ),
    .B1_N(\gray_sobel0.gray_scale0._067_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.gray_scale0._075_ ));
 sky130_fd_sc_hd__and2_1 \gray_sobel0.gray_scale0._149_  (.A(\gray_sobel0.gray_scale0.in_px_rgb_i[6] ),
    .B(\gray_sobel0.gray_scale0.in_px_rgb_i[7] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.gray_scale0._076_ ));
 sky130_fd_sc_hd__a21oi_1 \gray_sobel0.gray_scale0._150_  (.A1(\gray_sobel0.gray_scale0.in_px_rgb_i[11] ),
    .A2(\gray_sobel0.gray_scale0._064_ ),
    .B1(\gray_sobel0.gray_scale0._076_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.gray_scale0._077_ ));
 sky130_fd_sc_hd__xor2_1 \gray_sobel0.gray_scale0._151_  (.A(\gray_sobel0.gray_scale0.in_px_rgb_i[12] ),
    .B(\gray_sobel0.gray_scale0.in_px_rgb_i[7] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.gray_scale0._078_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.gray_scale0._152_  (.A(\gray_sobel0.gray_scale0.in_px_rgb_i[15] ),
    .B(\gray_sobel0.gray_scale0._078_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.gray_scale0._079_ ));
 sky130_fd_sc_hd__xor2_1 \gray_sobel0.gray_scale0._153_  (.A(\gray_sobel0.gray_scale0._077_ ),
    .B(\gray_sobel0.gray_scale0._079_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.gray_scale0._080_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.gray_scale0._154_  (.A(\gray_sobel0.gray_scale0.in_px_rgb_i[21] ),
    .B(\gray_sobel0.gray_scale0._080_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.gray_scale0._081_ ));
 sky130_fd_sc_hd__and2_1 \gray_sobel0.gray_scale0._155_  (.A(\gray_sobel0.gray_scale0._063_ ),
    .B(\gray_sobel0.gray_scale0._065_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.gray_scale0._082_ ));
 sky130_fd_sc_hd__or2_1 \gray_sobel0.gray_scale0._156_  (.A(\gray_sobel0.gray_scale0._063_ ),
    .B(\gray_sobel0.gray_scale0._065_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.gray_scale0._083_ ));
 sky130_fd_sc_hd__o21a_1 \gray_sobel0.gray_scale0._157_  (.A1(\gray_sobel0.gray_scale0._082_ ),
    .A2(\gray_sobel0.gray_scale0._070_ ),
    .B1(\gray_sobel0.gray_scale0._083_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.gray_scale0._084_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.gray_scale0._158_  (.A(\gray_sobel0.gray_scale0._081_ ),
    .B(\gray_sobel0.gray_scale0._084_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.gray_scale0._085_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.gray_scale0._159_  (.A(\gray_sobel0.gray_scale0._075_ ),
    .B(\gray_sobel0.gray_scale0._085_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.gray_scale0._086_ ));
 sky130_fd_sc_hd__and2b_1 \gray_sobel0.gray_scale0._160_  (.A_N(\gray_sobel0.gray_scale0._061_ ),
    .B(\gray_sobel0.gray_scale0._071_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.gray_scale0._087_ ));
 sky130_fd_sc_hd__a21oi_1 \gray_sobel0.gray_scale0._161_  (.A1(\gray_sobel0.gray_scale0._058_ ),
    .A2(\gray_sobel0.gray_scale0._072_ ),
    .B1(\gray_sobel0.gray_scale0._087_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.gray_scale0._088_ ));
 sky130_fd_sc_hd__xor2_1 \gray_sobel0.gray_scale0._162_  (.A(\gray_sobel0.gray_scale0._086_ ),
    .B(\gray_sobel0.gray_scale0._088_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.gray_scale0._089_ ));
 sky130_fd_sc_hd__xor2_1 \gray_sobel0.gray_scale0._163_  (.A(\gray_sobel0.gray_scale0._074_ ),
    .B(\gray_sobel0.gray_scale0._089_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.gray_scale0._003_ ));
 sky130_fd_sc_hd__nand2_1 \gray_sobel0.gray_scale0._164_  (.A(\gray_sobel0.gray_scale0.in_px_rgb_i[13] ),
    .B(\gray_sobel0.gray_scale0.in_px_rgb_i[22] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.gray_scale0._090_ ));
 sky130_fd_sc_hd__or2_1 \gray_sobel0.gray_scale0._165_  (.A(\gray_sobel0.gray_scale0.in_px_rgb_i[13] ),
    .B(\gray_sobel0.gray_scale0.in_px_rgb_i[22] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.gray_scale0._091_ ));
 sky130_fd_sc_hd__and2_1 \gray_sobel0.gray_scale0._166_  (.A(\gray_sobel0.gray_scale0.in_px_rgb_i[12] ),
    .B(\gray_sobel0.gray_scale0.in_px_rgb_i[7] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.gray_scale0._092_ ));
 sky130_fd_sc_hd__a21o_1 \gray_sobel0.gray_scale0._167_  (.A1(\gray_sobel0.gray_scale0.in_px_rgb_i[15] ),
    .A2(\gray_sobel0.gray_scale0._078_ ),
    .B1(\gray_sobel0.gray_scale0._092_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.gray_scale0._093_ ));
 sky130_fd_sc_hd__and3_1 \gray_sobel0.gray_scale0._168_  (.A(\gray_sobel0.gray_scale0._090_ ),
    .B(\gray_sobel0.gray_scale0._091_ ),
    .C(\gray_sobel0.gray_scale0._093_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.gray_scale0._094_ ));
 sky130_fd_sc_hd__a21oi_1 \gray_sobel0.gray_scale0._169_  (.A1(\gray_sobel0.gray_scale0._090_ ),
    .A2(\gray_sobel0.gray_scale0._091_ ),
    .B1(\gray_sobel0.gray_scale0._093_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.gray_scale0._095_ ));
 sky130_fd_sc_hd__or2_1 \gray_sobel0.gray_scale0._170_  (.A(\gray_sobel0.gray_scale0._094_ ),
    .B(\gray_sobel0.gray_scale0._095_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.gray_scale0._096_ ));
 sky130_fd_sc_hd__nor2_1 \gray_sobel0.gray_scale0._171_  (.A(\gray_sobel0.gray_scale0._077_ ),
    .B(\gray_sobel0.gray_scale0._079_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.gray_scale0._097_ ));
 sky130_fd_sc_hd__a21oi_1 \gray_sobel0.gray_scale0._172_  (.A1(\gray_sobel0.gray_scale0.in_px_rgb_i[21] ),
    .A2(\gray_sobel0.gray_scale0._080_ ),
    .B1(\gray_sobel0.gray_scale0._097_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.gray_scale0._098_ ));
 sky130_fd_sc_hd__nor2_1 \gray_sobel0.gray_scale0._173_  (.A(\gray_sobel0.gray_scale0._096_ ),
    .B(\gray_sobel0.gray_scale0._098_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.gray_scale0._099_ ));
 sky130_fd_sc_hd__and2_1 \gray_sobel0.gray_scale0._174_  (.A(\gray_sobel0.gray_scale0._096_ ),
    .B(\gray_sobel0.gray_scale0._098_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.gray_scale0._100_ ));
 sky130_fd_sc_hd__nor2_1 \gray_sobel0.gray_scale0._175_  (.A(\gray_sobel0.gray_scale0._099_ ),
    .B(\gray_sobel0.gray_scale0._100_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.gray_scale0._101_ ));
 sky130_fd_sc_hd__or2_1 \gray_sobel0.gray_scale0._176_  (.A(\gray_sobel0.gray_scale0._081_ ),
    .B(\gray_sobel0.gray_scale0._084_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.gray_scale0._102_ ));
 sky130_fd_sc_hd__o21a_1 \gray_sobel0.gray_scale0._177_  (.A1(\gray_sobel0.gray_scale0._075_ ),
    .A2(\gray_sobel0.gray_scale0._085_ ),
    .B1(\gray_sobel0.gray_scale0._102_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.gray_scale0._008_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.gray_scale0._178_  (.A(\gray_sobel0.gray_scale0._101_ ),
    .B(\gray_sobel0.gray_scale0._008_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.gray_scale0._009_ ));
 sky130_fd_sc_hd__nor2_1 \gray_sobel0.gray_scale0._179_  (.A(\gray_sobel0.gray_scale0._086_ ),
    .B(\gray_sobel0.gray_scale0._088_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.gray_scale0._010_ ));
 sky130_fd_sc_hd__a21oi_1 \gray_sobel0.gray_scale0._180_  (.A1(\gray_sobel0.gray_scale0._074_ ),
    .A2(\gray_sobel0.gray_scale0._089_ ),
    .B1(\gray_sobel0.gray_scale0._010_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.gray_scale0._011_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.gray_scale0._181_  (.A(\gray_sobel0.gray_scale0._009_ ),
    .B(\gray_sobel0.gray_scale0._011_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.gray_scale0._004_ ));
 sky130_fd_sc_hd__and2_1 \gray_sobel0.gray_scale0._182_  (.A(\gray_sobel0.gray_scale0.in_px_rgb_i[14] ),
    .B(\gray_sobel0.gray_scale0.in_px_rgb_i[23] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.gray_scale0._012_ ));
 sky130_fd_sc_hd__nor2_1 \gray_sobel0.gray_scale0._183_  (.A(\gray_sobel0.gray_scale0.in_px_rgb_i[14] ),
    .B(\gray_sobel0.gray_scale0.in_px_rgb_i[23] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.gray_scale0._013_ ));
 sky130_fd_sc_hd__nor2_1 \gray_sobel0.gray_scale0._184_  (.A(\gray_sobel0.gray_scale0._012_ ),
    .B(\gray_sobel0.gray_scale0._013_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.gray_scale0._014_ ));
 sky130_fd_sc_hd__xor2_1 \gray_sobel0.gray_scale0._185_  (.A(\gray_sobel0.gray_scale0._090_ ),
    .B(\gray_sobel0.gray_scale0._014_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.gray_scale0._015_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.gray_scale0._186_  (.A(\gray_sobel0.gray_scale0._094_ ),
    .B(\gray_sobel0.gray_scale0._015_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.gray_scale0._016_ ));
 sky130_fd_sc_hd__nor2_1 \gray_sobel0.gray_scale0._187_  (.A(\gray_sobel0.gray_scale0._099_ ),
    .B(\gray_sobel0.gray_scale0._016_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.gray_scale0._017_ ));
 sky130_fd_sc_hd__nand2_1 \gray_sobel0.gray_scale0._188_  (.A(\gray_sobel0.gray_scale0._099_ ),
    .B(\gray_sobel0.gray_scale0._016_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.gray_scale0._018_ ));
 sky130_fd_sc_hd__or2b_1 \gray_sobel0.gray_scale0._189_  (.A(\gray_sobel0.gray_scale0._017_ ),
    .B_N(\gray_sobel0.gray_scale0._018_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.gray_scale0._019_ ));
 sky130_fd_sc_hd__or2b_1 \gray_sobel0.gray_scale0._190_  (.A(\gray_sobel0.gray_scale0._008_ ),
    .B_N(\gray_sobel0.gray_scale0._101_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.gray_scale0._020_ ));
 sky130_fd_sc_hd__or2b_1 \gray_sobel0.gray_scale0._191_  (.A(\gray_sobel0.gray_scale0._011_ ),
    .B_N(\gray_sobel0.gray_scale0._009_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.gray_scale0._021_ ));
 sky130_fd_sc_hd__nand2_1 \gray_sobel0.gray_scale0._192_  (.A(\gray_sobel0.gray_scale0._020_ ),
    .B(\gray_sobel0.gray_scale0._021_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.gray_scale0._022_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.gray_scale0._193_  (.A(\gray_sobel0.gray_scale0._019_ ),
    .B(\gray_sobel0.gray_scale0._022_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.gray_scale0._005_ ));
 sky130_fd_sc_hd__and4_1 \gray_sobel0.gray_scale0._194_  (.A(\gray_sobel0.gray_scale0._090_ ),
    .B(\gray_sobel0.gray_scale0._091_ ),
    .C(\gray_sobel0.gray_scale0._093_ ),
    .D(\gray_sobel0.gray_scale0._014_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.gray_scale0._023_ ));
 sky130_fd_sc_hd__a31o_1 \gray_sobel0.gray_scale0._195_  (.A1(\gray_sobel0.gray_scale0.in_px_rgb_i[13] ),
    .A2(\gray_sobel0.gray_scale0.in_px_rgb_i[22] ),
    .A3(\gray_sobel0.gray_scale0._014_ ),
    .B1(\gray_sobel0.gray_scale0._012_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.gray_scale0._024_ ));
 sky130_fd_sc_hd__or2_1 \gray_sobel0.gray_scale0._196_  (.A(\gray_sobel0.gray_scale0.in_px_rgb_i[15] ),
    .B(\gray_sobel0.gray_scale0._024_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.gray_scale0._025_ ));
 sky130_fd_sc_hd__nand2_1 \gray_sobel0.gray_scale0._197_  (.A(\gray_sobel0.gray_scale0.in_px_rgb_i[15] ),
    .B(\gray_sobel0.gray_scale0._024_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.gray_scale0._026_ ));
 sky130_fd_sc_hd__nand2_1 \gray_sobel0.gray_scale0._198_  (.A(\gray_sobel0.gray_scale0._025_ ),
    .B(\gray_sobel0.gray_scale0._026_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.gray_scale0._027_ ));
 sky130_fd_sc_hd__xor2_1 \gray_sobel0.gray_scale0._199_  (.A(\gray_sobel0.gray_scale0._023_ ),
    .B(\gray_sobel0.gray_scale0._027_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.gray_scale0._028_ ));
 sky130_fd_sc_hd__a31o_1 \gray_sobel0.gray_scale0._200_  (.A1(\gray_sobel0.gray_scale0._020_ ),
    .A2(\gray_sobel0.gray_scale0._021_ ),
    .A3(\gray_sobel0.gray_scale0._018_ ),
    .B1(\gray_sobel0.gray_scale0._017_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.gray_scale0._029_ ));
 sky130_fd_sc_hd__xor2_1 \gray_sobel0.gray_scale0._201_  (.A(\gray_sobel0.gray_scale0._028_ ),
    .B(\gray_sobel0.gray_scale0._029_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.gray_scale0._006_ ));
 sky130_fd_sc_hd__a21boi_1 \gray_sobel0.gray_scale0._202_  (.A1(\gray_sobel0.gray_scale0._023_ ),
    .A2(\gray_sobel0.gray_scale0._025_ ),
    .B1_N(\gray_sobel0.gray_scale0._026_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.gray_scale0._030_ ));
 sky130_fd_sc_hd__o21ai_1 \gray_sobel0.gray_scale0._203_  (.A1(\gray_sobel0.gray_scale0._028_ ),
    .A2(\gray_sobel0.gray_scale0._029_ ),
    .B1(\gray_sobel0.gray_scale0._030_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.gray_scale0._007_ ));
 sky130_fd_sc_hd__and3_1 \gray_sobel0.gray_scale0._204_  (.A(\gray_sobel0.gray_scale0._057_ ),
    .B(\gray_sobel0.gray_scale0._054_ ),
    .C(\gray_sobel0.gray_scale0._073_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.gray_scale0._031_ ));
 sky130_fd_sc_hd__nor2_1 \gray_sobel0.gray_scale0._205_  (.A(\gray_sobel0.gray_scale0._074_ ),
    .B(\gray_sobel0.gray_scale0._031_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.gray_scale0._002_ ));
 sky130_fd_sc_hd__dfrtp_1 \gray_sobel0.gray_scale0._206_  (.CLK(clknet_leaf_8_clk),
    .D(\gray_sobel0.gray_scale0.px_rdy_i ),
    .RESET_B(net33),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.gray_scale0.px_rdy_o ));
 sky130_fd_sc_hd__dfrtp_1 \gray_sobel0.gray_scale0._207_  (.CLK(clknet_leaf_21_clk),
    .D(\gray_sobel0.gray_scale0._000_ ),
    .RESET_B(net11),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.gray_scale0.out_px_gray_o[0] ));
 sky130_fd_sc_hd__dfrtp_1 \gray_sobel0.gray_scale0._208_  (.CLK(clknet_leaf_21_clk),
    .D(\gray_sobel0.gray_scale0._001_ ),
    .RESET_B(net11),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.gray_scale0.out_px_gray_o[1] ));
 sky130_fd_sc_hd__dfrtp_1 \gray_sobel0.gray_scale0._209_  (.CLK(clknet_leaf_21_clk),
    .D(\gray_sobel0.gray_scale0._002_ ),
    .RESET_B(net11),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.gray_scale0.out_px_gray_o[2] ));
 sky130_fd_sc_hd__dfrtp_1 \gray_sobel0.gray_scale0._210_  (.CLK(clknet_leaf_21_clk),
    .D(\gray_sobel0.gray_scale0._003_ ),
    .RESET_B(net11),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.gray_scale0.out_px_gray_o[3] ));
 sky130_fd_sc_hd__dfrtp_1 \gray_sobel0.gray_scale0._211_  (.CLK(clknet_leaf_21_clk),
    .D(\gray_sobel0.gray_scale0._004_ ),
    .RESET_B(net11),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.gray_scale0.out_px_gray_o[4] ));
 sky130_fd_sc_hd__dfrtp_1 \gray_sobel0.gray_scale0._212_  (.CLK(clknet_leaf_22_clk),
    .D(\gray_sobel0.gray_scale0._005_ ),
    .RESET_B(net11),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.gray_scale0.out_px_gray_o[5] ));
 sky130_fd_sc_hd__dfrtp_1 \gray_sobel0.gray_scale0._213_  (.CLK(clknet_leaf_22_clk),
    .D(\gray_sobel0.gray_scale0._006_ ),
    .RESET_B(net11),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.gray_scale0.out_px_gray_o[6] ));
 sky130_fd_sc_hd__dfrtp_1 \gray_sobel0.gray_scale0._214_  (.CLK(clknet_leaf_22_clk),
    .D(\gray_sobel0.gray_scale0._007_ ),
    .RESET_B(net11),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.gray_scale0.out_px_gray_o[7] ));
 sky130_fd_sc_hd__inv_2 \gray_sobel0.sobel0._368_  (.A(\gray_sobel0.sobel0.fsm_state[1] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0._109_ ));
 sky130_fd_sc_hd__or4_1 \gray_sobel0.sobel0._369_  (.A(\gray_sobel0.sobel0.counter_pixels[5] ),
    .B(\gray_sobel0.sobel0.counter_pixels[4] ),
    .C(\gray_sobel0.sobel0.counter_pixels[7] ),
    .D(\gray_sobel0.sobel0.counter_pixels[6] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._110_ ));
 sky130_fd_sc_hd__or4b_1 \gray_sobel0.sobel0._370_  (.A(\gray_sobel0.sobel0.counter_pixels[1] ),
    .B(\gray_sobel0.sobel0.counter_pixels[3] ),
    .C(\gray_sobel0.sobel0.counter_pixels[2] ),
    .D_N(\gray_sobel0.sobel0.counter_pixels[0] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._111_ ));
 sky130_fd_sc_hd__nor2_1 \gray_sobel0.sobel0._371_  (.A(\gray_sobel0.sobel0._110_ ),
    .B(\gray_sobel0.sobel0._111_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0._112_ ));
 sky130_fd_sc_hd__or4_1 \gray_sobel0.sobel0._372_  (.A(\gray_sobel0.sobel0.counter_pixels[13] ),
    .B(\gray_sobel0.sobel0.counter_pixels[12] ),
    .C(\gray_sobel0.sobel0.counter_pixels[15] ),
    .D(\gray_sobel0.sobel0.counter_pixels[14] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._113_ ));
 sky130_fd_sc_hd__or4_1 \gray_sobel0.sobel0._373_  (.A(\gray_sobel0.sobel0.counter_pixels[9] ),
    .B(\gray_sobel0.sobel0.counter_pixels[8] ),
    .C(\gray_sobel0.sobel0.counter_pixels[11] ),
    .D(\gray_sobel0.sobel0.counter_pixels[10] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._114_ ));
 sky130_fd_sc_hd__or4_1 \gray_sobel0.sobel0._374_  (.A(\gray_sobel0.sobel0.counter_pixels[17] ),
    .B(\gray_sobel0.sobel0.counter_pixels[16] ),
    .C(\gray_sobel0.sobel0.counter_pixels[19] ),
    .D(\gray_sobel0.sobel0.counter_pixels[18] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._115_ ));
 sky130_fd_sc_hd__or4_1 \gray_sobel0.sobel0._375_  (.A(\gray_sobel0.sobel0.counter_pixels[21] ),
    .B(\gray_sobel0.sobel0.counter_pixels[20] ),
    .C(\gray_sobel0.sobel0.counter_pixels[23] ),
    .D(\gray_sobel0.sobel0.counter_pixels[22] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._116_ ));
 sky130_fd_sc_hd__nor4_1 \gray_sobel0.sobel0._376_  (.A(\gray_sobel0.sobel0._113_ ),
    .B(\gray_sobel0.sobel0._114_ ),
    .C(\gray_sobel0.sobel0._115_ ),
    .D(\gray_sobel0.sobel0._116_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0._117_ ));
 sky130_fd_sc_hd__and3b_1 \gray_sobel0.sobel0._377_  (.A_N(\gray_sobel0.sobel0.fsm_state[0] ),
    .B(\gray_sobel0.sobel0.fsm_state[1] ),
    .C(net5),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._118_ ));
 sky130_fd_sc_hd__a41o_4 \gray_sobel0.sobel0._378_  (.A1(\gray_sobel0.sobel0.fsm_state[0] ),
    .A2(\gray_sobel0.sobel0._109_ ),
    .A3(\gray_sobel0.sobel0._112_ ),
    .A4(\gray_sobel0.sobel0._117_ ),
    .B1(\gray_sobel0.sobel0._118_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._119_ ));
 sky130_fd_sc_hd__clkbuf_4 \gray_sobel0.sobel0._379_  (.A(\gray_sobel0.sobel0._119_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._120_ ));
 sky130_fd_sc_hd__clkbuf_4 \gray_sobel0.sobel0._380_  (.A(\gray_sobel0.sobel0._120_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.next[1] ));
 sky130_fd_sc_hd__a21oi_1 \gray_sobel0.sobel0._381_  (.A1(\gray_sobel0.sobel0.fsm_state[1] ),
    .A2(net5),
    .B1(\gray_sobel0.sobel0.fsm_state[0] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0._121_ ));
 sky130_fd_sc_hd__or2_1 \gray_sobel0.sobel0._382_  (.A(\gray_sobel0.sobel0.fsm_state[1] ),
    .B(net5),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._122_ ));
 sky130_fd_sc_hd__nand2_1 \gray_sobel0.sobel0._383_  (.A(\gray_sobel0.sobel0._121_ ),
    .B(\gray_sobel0.sobel0._122_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0._123_ ));
 sky130_fd_sc_hd__inv_2 \gray_sobel0.sobel0._384_  (.A(\gray_sobel0.sobel0.fsm_state[0] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0._124_ ));
 sky130_fd_sc_hd__a211o_1 \gray_sobel0.sobel0._385_  (.A1(\gray_sobel0.sobel0._112_ ),
    .A2(\gray_sobel0.sobel0._117_ ),
    .B1(\gray_sobel0.sobel0._124_ ),
    .C1(\gray_sobel0.sobel0.fsm_state[1] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._125_ ));
 sky130_fd_sc_hd__nand2_1 \gray_sobel0.sobel0._386_  (.A(\gray_sobel0.sobel0._123_ ),
    .B(\gray_sobel0.sobel0._125_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.next[0] ));
 sky130_fd_sc_hd__a221o_2 \gray_sobel0.sobel0._387_  (.A1(\gray_sobel0.sobel0.fsm_state[0] ),
    .A2(\gray_sobel0.sobel0._109_ ),
    .B1(\gray_sobel0.sobel0._121_ ),
    .B2(\gray_sobel0.sobel0._122_ ),
    .C1(\gray_sobel0.sobel0._118_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._126_ ));
 sky130_fd_sc_hd__buf_2 \gray_sobel0.sobel0._388_  (.A(\gray_sobel0.sobel0.counter_sobel[3] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._127_ ));
 sky130_fd_sc_hd__or4b_2 \gray_sobel0.sobel0._389_  (.A(\gray_sobel0.sobel0.counter_sobel[0] ),
    .B(\gray_sobel0.sobel0.counter_sobel[2] ),
    .C(\gray_sobel0.sobel0._127_ ),
    .D_N(\gray_sobel0.sobel0.counter_sobel[1] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._128_ ));
 sky130_fd_sc_hd__nand2_1 \gray_sobel0.sobel0._390_  (.A(\gray_sobel0.sobel0._119_ ),
    .B(\gray_sobel0.sobel0._128_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0._129_ ));
 sky130_fd_sc_hd__or2_1 \gray_sobel0.sobel0._391_  (.A(\gray_sobel0.sobel0.counter_sobel[1] ),
    .B(\gray_sobel0.sobel0.counter_sobel[0] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._130_ ));
 sky130_fd_sc_hd__or3b_1 \gray_sobel0.sobel0._392_  (.A(\gray_sobel0.sobel0._130_ ),
    .B(\gray_sobel0.sobel0.counter_sobel[2] ),
    .C_N(\gray_sobel0.sobel0._127_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._131_ ));
 sky130_fd_sc_hd__a21bo_1 \gray_sobel0.sobel0._393_  (.A1(\gray_sobel0.sobel0._123_ ),
    .A2(\gray_sobel0.sobel0._125_ ),
    .B1_N(\gray_sobel0.sobel0._131_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._132_ ));
 sky130_fd_sc_hd__and4_1 \gray_sobel0.sobel0._394_  (.A(\gray_sobel0.px_rdy_i_sobel ),
    .B(\gray_sobel0.sobel0._126_ ),
    .C(\gray_sobel0.sobel0._129_ ),
    .D(\gray_sobel0.sobel0._132_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._133_ ));
 sky130_fd_sc_hd__clkbuf_2 \gray_sobel0.sobel0._395_  (.A(\gray_sobel0.sobel0._133_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._134_ ));
 sky130_fd_sc_hd__clkbuf_4 \gray_sobel0.sobel0._396_  (.A(\gray_sobel0.sobel0._134_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._000_ ));
 sky130_fd_sc_hd__nand2_1 \gray_sobel0.sobel0._397_  (.A(\gray_sobel0.px_rdy_i_sobel ),
    .B(\gray_sobel0.sobel0._126_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0._135_ ));
 sky130_fd_sc_hd__buf_4 \gray_sobel0.sobel0._398_  (.A(\gray_sobel0.sobel0._135_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._136_ ));
 sky130_fd_sc_hd__or4b_2 \gray_sobel0.sobel0._399_  (.A(\gray_sobel0.sobel0.counter_sobel[1] ),
    .B(\gray_sobel0.sobel0.counter_sobel[2] ),
    .C(\gray_sobel0.sobel0._127_ ),
    .D_N(\gray_sobel0.sobel0.counter_sobel[0] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._137_ ));
 sky130_fd_sc_hd__nor2_8 \gray_sobel0.sobel0._400_  (.A(\gray_sobel0.sobel0._119_ ),
    .B(\gray_sobel0.sobel0._136_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0._138_ ));
 sky130_fd_sc_hd__and3_1 \gray_sobel0.sobel0._401_  (.A(\gray_sobel0.sobel0.counter_sobel[1] ),
    .B(\gray_sobel0.sobel0.counter_sobel[0] ),
    .C(\gray_sobel0.sobel0.counter_sobel[2] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._139_ ));
 sky130_fd_sc_hd__or2b_1 \gray_sobel0.sobel0._402_  (.A(\gray_sobel0.sobel0._127_ ),
    .B_N(\gray_sobel0.sobel0._139_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._140_ ));
 sky130_fd_sc_hd__a22o_1 \gray_sobel0.sobel0._403_  (.A1(\gray_sobel0.sobel0._119_ ),
    .A2(\gray_sobel0.sobel0._137_ ),
    .B1(\gray_sobel0.sobel0._138_ ),
    .B2(\gray_sobel0.sobel0._140_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._141_ ));
 sky130_fd_sc_hd__nor2_4 \gray_sobel0.sobel0._404_  (.A(\gray_sobel0.sobel0._136_ ),
    .B(\gray_sobel0.sobel0._141_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0._142_ ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0.sobel0._405_  (.A0(\gray_sobel0.sobel0.sobel.matrix_pixels_i[8] ),
    .A1(\gray_sobel0.in_px_sobel[0] ),
    .S(\gray_sobel0.sobel0._142_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._143_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0.sobel0._406_  (.A(\gray_sobel0.sobel0._143_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._001_ ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0.sobel0._407_  (.A0(\gray_sobel0.sobel0.sobel.matrix_pixels_i[9] ),
    .A1(\gray_sobel0.in_px_sobel[1] ),
    .S(\gray_sobel0.sobel0._142_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._144_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0.sobel0._408_  (.A(\gray_sobel0.sobel0._144_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._002_ ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0.sobel0._409_  (.A0(\gray_sobel0.sobel0.sobel.matrix_pixels_i[10] ),
    .A1(\gray_sobel0.in_px_sobel[2] ),
    .S(\gray_sobel0.sobel0._142_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._145_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0.sobel0._410_  (.A(\gray_sobel0.sobel0._145_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._003_ ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0.sobel0._411_  (.A0(\gray_sobel0.sobel0.sobel.matrix_pixels_i[11] ),
    .A1(\gray_sobel0.in_px_sobel[3] ),
    .S(\gray_sobel0.sobel0._142_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._146_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0.sobel0._412_  (.A(\gray_sobel0.sobel0._146_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._004_ ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0.sobel0._413_  (.A0(\gray_sobel0.sobel0.sobel.matrix_pixels_i[12] ),
    .A1(\gray_sobel0.in_px_sobel[4] ),
    .S(\gray_sobel0.sobel0._142_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._147_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0.sobel0._414_  (.A(\gray_sobel0.sobel0._147_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._005_ ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0.sobel0._415_  (.A0(\gray_sobel0.sobel0.sobel.matrix_pixels_i[13] ),
    .A1(\gray_sobel0.in_px_sobel[5] ),
    .S(\gray_sobel0.sobel0._142_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._148_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0.sobel0._416_  (.A(\gray_sobel0.sobel0._148_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._006_ ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0.sobel0._417_  (.A0(\gray_sobel0.sobel0.sobel.matrix_pixels_i[14] ),
    .A1(\gray_sobel0.in_px_sobel[6] ),
    .S(\gray_sobel0.sobel0._142_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._149_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0.sobel0._418_  (.A(\gray_sobel0.sobel0._149_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._007_ ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0.sobel0._419_  (.A0(\gray_sobel0.sobel0.sobel.matrix_pixels_i[15] ),
    .A1(\gray_sobel0.in_px_sobel[7] ),
    .S(\gray_sobel0.sobel0._142_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._150_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0.sobel0._420_  (.A(\gray_sobel0.sobel0._150_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._008_ ));
 sky130_fd_sc_hd__buf_4 \gray_sobel0.sobel0._421_  (.A(\gray_sobel0.sobel0._134_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._151_ ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0.sobel0._422_  (.A0(\gray_sobel0.sobel0.sobel.matrix_pixels_i[0] ),
    .A1(\gray_sobel0.in_px_sobel[0] ),
    .S(\gray_sobel0.sobel0._151_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._152_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0.sobel0._423_  (.A(\gray_sobel0.sobel0._152_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._009_ ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0.sobel0._424_  (.A0(\gray_sobel0.sobel0.sobel.matrix_pixels_i[1] ),
    .A1(\gray_sobel0.in_px_sobel[1] ),
    .S(\gray_sobel0.sobel0._151_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._153_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0.sobel0._425_  (.A(\gray_sobel0.sobel0._153_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._010_ ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0.sobel0._426_  (.A0(\gray_sobel0.sobel0.sobel.matrix_pixels_i[2] ),
    .A1(\gray_sobel0.in_px_sobel[2] ),
    .S(\gray_sobel0.sobel0._151_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._154_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0.sobel0._427_  (.A(\gray_sobel0.sobel0._154_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._011_ ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0.sobel0._428_  (.A0(\gray_sobel0.sobel0.sobel.matrix_pixels_i[3] ),
    .A1(\gray_sobel0.in_px_sobel[3] ),
    .S(\gray_sobel0.sobel0._151_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._155_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0.sobel0._429_  (.A(\gray_sobel0.sobel0._155_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._012_ ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0.sobel0._430_  (.A0(\gray_sobel0.sobel0.sobel.matrix_pixels_i[4] ),
    .A1(\gray_sobel0.in_px_sobel[4] ),
    .S(\gray_sobel0.sobel0._151_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._156_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0.sobel0._431_  (.A(\gray_sobel0.sobel0._156_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._013_ ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0.sobel0._432_  (.A0(\gray_sobel0.sobel0.sobel.matrix_pixels_i[5] ),
    .A1(\gray_sobel0.in_px_sobel[5] ),
    .S(\gray_sobel0.sobel0._151_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._157_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0.sobel0._433_  (.A(\gray_sobel0.sobel0._157_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._014_ ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0.sobel0._434_  (.A0(\gray_sobel0.sobel0.sobel.matrix_pixels_i[6] ),
    .A1(\gray_sobel0.in_px_sobel[6] ),
    .S(\gray_sobel0.sobel0._151_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._158_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0.sobel0._435_  (.A(\gray_sobel0.sobel0._158_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._015_ ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0.sobel0._436_  (.A0(\gray_sobel0.sobel0.sobel.matrix_pixels_i[7] ),
    .A1(\gray_sobel0.in_px_sobel[7] ),
    .S(\gray_sobel0.sobel0._134_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._159_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0.sobel0._437_  (.A(\gray_sobel0.sobel0._159_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._016_ ));
 sky130_fd_sc_hd__clkbuf_4 \gray_sobel0.sobel0._438_  (.A(\gray_sobel0.sobel0._120_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._160_ ));
 sky130_fd_sc_hd__nor2b_2 \gray_sobel0.sobel0._439_  (.A(\gray_sobel0.sobel0._120_ ),
    .B_N(\gray_sobel0.in_px_sobel[0] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0._161_ ));
 sky130_fd_sc_hd__a21o_1 \gray_sobel0.sobel0._440_  (.A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[24] ),
    .A2(\gray_sobel0.sobel0._160_ ),
    .B1(\gray_sobel0.sobel0._161_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._162_ ));
 sky130_fd_sc_hd__or3_1 \gray_sobel0.sobel0._441_  (.A(\gray_sobel0.sobel0.counter_sobel[2] ),
    .B(\gray_sobel0.sobel0.counter_sobel[3] ),
    .C(\gray_sobel0.sobel0._130_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._163_ ));
 sky130_fd_sc_hd__clkbuf_4 \gray_sobel0.sobel0._442_  (.A(\gray_sobel0.sobel0._163_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._164_ ));
 sky130_fd_sc_hd__nor2_4 \gray_sobel0.sobel0._443_  (.A(\gray_sobel0.sobel0._135_ ),
    .B(\gray_sobel0.sobel0._164_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0._165_ ));
 sky130_fd_sc_hd__nor2_4 \gray_sobel0.sobel0._444_  (.A(\gray_sobel0.sobel0._138_ ),
    .B(\gray_sobel0.sobel0._165_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0._166_ ));
 sky130_fd_sc_hd__a21oi_4 \gray_sobel0.sobel0._445_  (.A1(\gray_sobel0.sobel0._128_ ),
    .A2(\gray_sobel0.sobel0._138_ ),
    .B1(\gray_sobel0.sobel0._166_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0._167_ ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0.sobel0._446_  (.A0(\gray_sobel0.sobel0.sobel.matrix_pixels_i[48] ),
    .A1(\gray_sobel0.sobel0._162_ ),
    .S(\gray_sobel0.sobel0._167_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._168_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0.sobel0._447_  (.A(\gray_sobel0.sobel0._168_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._017_ ));
 sky130_fd_sc_hd__nor2b_2 \gray_sobel0.sobel0._448_  (.A(\gray_sobel0.sobel0._120_ ),
    .B_N(\gray_sobel0.in_px_sobel[1] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0._169_ ));
 sky130_fd_sc_hd__a21o_1 \gray_sobel0.sobel0._449_  (.A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[25] ),
    .A2(\gray_sobel0.sobel0._160_ ),
    .B1(\gray_sobel0.sobel0._169_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._170_ ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0.sobel0._450_  (.A0(\gray_sobel0.sobel0.sobel.matrix_pixels_i[49] ),
    .A1(\gray_sobel0.sobel0._170_ ),
    .S(\gray_sobel0.sobel0._167_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._171_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0.sobel0._451_  (.A(\gray_sobel0.sobel0._171_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._018_ ));
 sky130_fd_sc_hd__nor2b_2 \gray_sobel0.sobel0._452_  (.A(\gray_sobel0.sobel0._120_ ),
    .B_N(\gray_sobel0.in_px_sobel[2] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0._172_ ));
 sky130_fd_sc_hd__a21o_1 \gray_sobel0.sobel0._453_  (.A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[26] ),
    .A2(\gray_sobel0.sobel0._160_ ),
    .B1(\gray_sobel0.sobel0._172_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._173_ ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0.sobel0._454_  (.A0(\gray_sobel0.sobel0.sobel.matrix_pixels_i[50] ),
    .A1(\gray_sobel0.sobel0._173_ ),
    .S(\gray_sobel0.sobel0._167_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._174_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0.sobel0._455_  (.A(\gray_sobel0.sobel0._174_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._019_ ));
 sky130_fd_sc_hd__clkbuf_4 \gray_sobel0.sobel0._456_  (.A(\gray_sobel0.sobel0._120_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._175_ ));
 sky130_fd_sc_hd__nor2b_2 \gray_sobel0.sobel0._457_  (.A(\gray_sobel0.sobel0._120_ ),
    .B_N(\gray_sobel0.in_px_sobel[3] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0._176_ ));
 sky130_fd_sc_hd__a21o_1 \gray_sobel0.sobel0._458_  (.A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[27] ),
    .A2(\gray_sobel0.sobel0._175_ ),
    .B1(\gray_sobel0.sobel0._176_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._177_ ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0.sobel0._459_  (.A0(\gray_sobel0.sobel0.sobel.matrix_pixels_i[51] ),
    .A1(\gray_sobel0.sobel0._177_ ),
    .S(\gray_sobel0.sobel0._167_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._178_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0.sobel0._460_  (.A(\gray_sobel0.sobel0._178_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._020_ ));
 sky130_fd_sc_hd__nor2b_2 \gray_sobel0.sobel0._461_  (.A(\gray_sobel0.sobel0._120_ ),
    .B_N(\gray_sobel0.in_px_sobel[4] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0._179_ ));
 sky130_fd_sc_hd__a21o_1 \gray_sobel0.sobel0._462_  (.A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[28] ),
    .A2(\gray_sobel0.sobel0._175_ ),
    .B1(\gray_sobel0.sobel0._179_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._180_ ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0.sobel0._463_  (.A0(\gray_sobel0.sobel0.sobel.matrix_pixels_i[52] ),
    .A1(\gray_sobel0.sobel0._180_ ),
    .S(\gray_sobel0.sobel0._167_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._181_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0.sobel0._464_  (.A(\gray_sobel0.sobel0._181_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._021_ ));
 sky130_fd_sc_hd__nor2b_2 \gray_sobel0.sobel0._465_  (.A(\gray_sobel0.sobel0._120_ ),
    .B_N(\gray_sobel0.in_px_sobel[5] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0._182_ ));
 sky130_fd_sc_hd__a21o_1 \gray_sobel0.sobel0._466_  (.A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[29] ),
    .A2(\gray_sobel0.sobel0._175_ ),
    .B1(\gray_sobel0.sobel0._182_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._183_ ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0.sobel0._467_  (.A0(\gray_sobel0.sobel0.sobel.matrix_pixels_i[53] ),
    .A1(\gray_sobel0.sobel0._183_ ),
    .S(\gray_sobel0.sobel0._167_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._184_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0.sobel0._468_  (.A(\gray_sobel0.sobel0._184_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._022_ ));
 sky130_fd_sc_hd__nor2b_2 \gray_sobel0.sobel0._469_  (.A(\gray_sobel0.sobel0._119_ ),
    .B_N(\gray_sobel0.in_px_sobel[6] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0._185_ ));
 sky130_fd_sc_hd__a21o_1 \gray_sobel0.sobel0._470_  (.A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[30] ),
    .A2(\gray_sobel0.sobel0._175_ ),
    .B1(\gray_sobel0.sobel0._185_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._186_ ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0.sobel0._471_  (.A0(\gray_sobel0.sobel0.sobel.matrix_pixels_i[54] ),
    .A1(\gray_sobel0.sobel0._186_ ),
    .S(\gray_sobel0.sobel0._167_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._187_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0.sobel0._472_  (.A(\gray_sobel0.sobel0._187_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._023_ ));
 sky130_fd_sc_hd__nor2b_2 \gray_sobel0.sobel0._473_  (.A(\gray_sobel0.sobel0._119_ ),
    .B_N(\gray_sobel0.in_px_sobel[7] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0._188_ ));
 sky130_fd_sc_hd__a21o_1 \gray_sobel0.sobel0._474_  (.A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[31] ),
    .A2(\gray_sobel0.sobel0._175_ ),
    .B1(\gray_sobel0.sobel0._188_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._189_ ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0.sobel0._475_  (.A0(\gray_sobel0.sobel0.sobel.matrix_pixels_i[55] ),
    .A1(\gray_sobel0.sobel0._189_ ),
    .S(\gray_sobel0.sobel0._167_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._190_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0.sobel0._476_  (.A(\gray_sobel0.sobel0._190_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._024_ ));
 sky130_fd_sc_hd__a21o_1 \gray_sobel0.sobel0._477_  (.A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[32] ),
    .A2(\gray_sobel0.sobel0._175_ ),
    .B1(\gray_sobel0.sobel0._161_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._191_ ));
 sky130_fd_sc_hd__a21oi_4 \gray_sobel0.sobel0._478_  (.A1(\gray_sobel0.sobel0._137_ ),
    .A2(\gray_sobel0.sobel0._138_ ),
    .B1(\gray_sobel0.sobel0._166_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0._192_ ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0.sobel0._479_  (.A0(\gray_sobel0.sobel0.sobel.matrix_pixels_i[56] ),
    .A1(\gray_sobel0.sobel0._191_ ),
    .S(\gray_sobel0.sobel0._192_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._193_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0.sobel0._480_  (.A(\gray_sobel0.sobel0._193_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._025_ ));
 sky130_fd_sc_hd__a21o_1 \gray_sobel0.sobel0._481_  (.A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[33] ),
    .A2(\gray_sobel0.sobel0._175_ ),
    .B1(\gray_sobel0.sobel0._169_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._194_ ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0.sobel0._482_  (.A0(\gray_sobel0.sobel0.sobel.matrix_pixels_i[57] ),
    .A1(\gray_sobel0.sobel0._194_ ),
    .S(\gray_sobel0.sobel0._192_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._195_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0.sobel0._483_  (.A(\gray_sobel0.sobel0._195_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._026_ ));
 sky130_fd_sc_hd__a21o_1 \gray_sobel0.sobel0._484_  (.A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[34] ),
    .A2(\gray_sobel0.sobel0._175_ ),
    .B1(\gray_sobel0.sobel0._172_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._196_ ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0.sobel0._485_  (.A0(\gray_sobel0.sobel0.sobel.matrix_pixels_i[58] ),
    .A1(\gray_sobel0.sobel0._196_ ),
    .S(\gray_sobel0.sobel0._192_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._197_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0.sobel0._486_  (.A(\gray_sobel0.sobel0._197_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._027_ ));
 sky130_fd_sc_hd__a21o_1 \gray_sobel0.sobel0._487_  (.A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[35] ),
    .A2(\gray_sobel0.sobel0._175_ ),
    .B1(\gray_sobel0.sobel0._176_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._198_ ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0.sobel0._488_  (.A0(\gray_sobel0.sobel0.sobel.matrix_pixels_i[59] ),
    .A1(\gray_sobel0.sobel0._198_ ),
    .S(\gray_sobel0.sobel0._192_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._199_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0.sobel0._489_  (.A(\gray_sobel0.sobel0._199_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._028_ ));
 sky130_fd_sc_hd__a21o_1 \gray_sobel0.sobel0._490_  (.A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[36] ),
    .A2(\gray_sobel0.sobel0._175_ ),
    .B1(\gray_sobel0.sobel0._179_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._200_ ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0.sobel0._491_  (.A0(\gray_sobel0.sobel0.sobel.matrix_pixels_i[60] ),
    .A1(\gray_sobel0.sobel0._200_ ),
    .S(\gray_sobel0.sobel0._192_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._201_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0.sobel0._492_  (.A(\gray_sobel0.sobel0._201_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._029_ ));
 sky130_fd_sc_hd__clkbuf_4 \gray_sobel0.sobel0._493_  (.A(\gray_sobel0.sobel0._120_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._202_ ));
 sky130_fd_sc_hd__a21o_1 \gray_sobel0.sobel0._494_  (.A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[37] ),
    .A2(\gray_sobel0.sobel0._202_ ),
    .B1(\gray_sobel0.sobel0._182_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._203_ ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0.sobel0._495_  (.A0(\gray_sobel0.sobel0.sobel.matrix_pixels_i[61] ),
    .A1(\gray_sobel0.sobel0._203_ ),
    .S(\gray_sobel0.sobel0._192_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._204_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0.sobel0._496_  (.A(\gray_sobel0.sobel0._204_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._030_ ));
 sky130_fd_sc_hd__a21o_1 \gray_sobel0.sobel0._497_  (.A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[38] ),
    .A2(\gray_sobel0.sobel0._202_ ),
    .B1(\gray_sobel0.sobel0._185_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._205_ ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0.sobel0._498_  (.A0(\gray_sobel0.sobel0.sobel.matrix_pixels_i[62] ),
    .A1(\gray_sobel0.sobel0._205_ ),
    .S(\gray_sobel0.sobel0._192_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._206_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0.sobel0._499_  (.A(\gray_sobel0.sobel0._206_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._031_ ));
 sky130_fd_sc_hd__a21o_1 \gray_sobel0.sobel0._500_  (.A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[39] ),
    .A2(\gray_sobel0.sobel0._202_ ),
    .B1(\gray_sobel0.sobel0._188_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._207_ ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0.sobel0._501_  (.A0(\gray_sobel0.sobel0.sobel.matrix_pixels_i[63] ),
    .A1(\gray_sobel0.sobel0._207_ ),
    .S(\gray_sobel0.sobel0._192_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._208_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0.sobel0._502_  (.A(\gray_sobel0.sobel0._208_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._032_ ));
 sky130_fd_sc_hd__a21o_1 \gray_sobel0.sobel0._503_  (.A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[16] ),
    .A2(\gray_sobel0.sobel0._202_ ),
    .B1(\gray_sobel0.sobel0._161_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._209_ ));
 sky130_fd_sc_hd__nand2_1 \gray_sobel0.sobel0._504_  (.A(\gray_sobel0.sobel0.counter_sobel[1] ),
    .B(\gray_sobel0.sobel0.counter_sobel[0] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0._210_ ));
 sky130_fd_sc_hd__o31a_1 \gray_sobel0.sobel0._505_  (.A1(\gray_sobel0.sobel0.counter_sobel[2] ),
    .A2(\gray_sobel0.sobel0._127_ ),
    .A3(\gray_sobel0.sobel0._210_ ),
    .B1(\gray_sobel0.sobel0.next[0] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._211_ ));
 sky130_fd_sc_hd__nor2_4 \gray_sobel0.sobel0._506_  (.A(\gray_sobel0.sobel0._166_ ),
    .B(\gray_sobel0.sobel0._211_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0._212_ ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0.sobel0._507_  (.A0(\gray_sobel0.sobel0.sobel.matrix_pixels_i[40] ),
    .A1(\gray_sobel0.sobel0._209_ ),
    .S(\gray_sobel0.sobel0._212_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._213_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0.sobel0._508_  (.A(\gray_sobel0.sobel0._213_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._033_ ));
 sky130_fd_sc_hd__a21o_1 \gray_sobel0.sobel0._509_  (.A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[17] ),
    .A2(\gray_sobel0.sobel0._202_ ),
    .B1(\gray_sobel0.sobel0._169_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._214_ ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0.sobel0._510_  (.A0(\gray_sobel0.sobel0.sobel.matrix_pixels_i[41] ),
    .A1(\gray_sobel0.sobel0._214_ ),
    .S(\gray_sobel0.sobel0._212_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._215_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0.sobel0._511_  (.A(\gray_sobel0.sobel0._215_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._034_ ));
 sky130_fd_sc_hd__a21o_1 \gray_sobel0.sobel0._512_  (.A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[18] ),
    .A2(\gray_sobel0.sobel0._202_ ),
    .B1(\gray_sobel0.sobel0._172_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._216_ ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0.sobel0._513_  (.A0(\gray_sobel0.sobel0.sobel.matrix_pixels_i[42] ),
    .A1(\gray_sobel0.sobel0._216_ ),
    .S(\gray_sobel0.sobel0._212_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._217_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0.sobel0._514_  (.A(\gray_sobel0.sobel0._217_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._035_ ));
 sky130_fd_sc_hd__a21o_1 \gray_sobel0.sobel0._515_  (.A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[19] ),
    .A2(\gray_sobel0.sobel0._202_ ),
    .B1(\gray_sobel0.sobel0._176_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._218_ ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0.sobel0._516_  (.A0(\gray_sobel0.sobel0.sobel.matrix_pixels_i[43] ),
    .A1(\gray_sobel0.sobel0._218_ ),
    .S(\gray_sobel0.sobel0._212_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._219_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0.sobel0._517_  (.A(\gray_sobel0.sobel0._219_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._036_ ));
 sky130_fd_sc_hd__a21o_1 \gray_sobel0.sobel0._518_  (.A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[20] ),
    .A2(\gray_sobel0.sobel0._202_ ),
    .B1(\gray_sobel0.sobel0._179_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._220_ ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0.sobel0._519_  (.A0(\gray_sobel0.sobel0.sobel.matrix_pixels_i[44] ),
    .A1(\gray_sobel0.sobel0._220_ ),
    .S(\gray_sobel0.sobel0._212_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._221_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0.sobel0._520_  (.A(\gray_sobel0.sobel0._221_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._037_ ));
 sky130_fd_sc_hd__a21o_1 \gray_sobel0.sobel0._521_  (.A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[21] ),
    .A2(\gray_sobel0.sobel0._202_ ),
    .B1(\gray_sobel0.sobel0._182_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._222_ ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0.sobel0._522_  (.A0(\gray_sobel0.sobel0.sobel.matrix_pixels_i[45] ),
    .A1(\gray_sobel0.sobel0._222_ ),
    .S(\gray_sobel0.sobel0._212_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._223_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0.sobel0._523_  (.A(\gray_sobel0.sobel0._223_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._038_ ));
 sky130_fd_sc_hd__a21o_1 \gray_sobel0.sobel0._524_  (.A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[22] ),
    .A2(\gray_sobel0.sobel0._202_ ),
    .B1(\gray_sobel0.sobel0._185_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._224_ ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0.sobel0._525_  (.A0(\gray_sobel0.sobel0.sobel.matrix_pixels_i[46] ),
    .A1(\gray_sobel0.sobel0._224_ ),
    .S(\gray_sobel0.sobel0._212_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._225_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0.sobel0._526_  (.A(\gray_sobel0.sobel0._225_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._039_ ));
 sky130_fd_sc_hd__clkbuf_4 \gray_sobel0.sobel0._527_  (.A(\gray_sobel0.sobel0._119_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._226_ ));
 sky130_fd_sc_hd__a21o_1 \gray_sobel0.sobel0._528_  (.A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[23] ),
    .A2(\gray_sobel0.sobel0._226_ ),
    .B1(\gray_sobel0.sobel0._188_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._227_ ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0.sobel0._529_  (.A0(\gray_sobel0.sobel0.sobel.matrix_pixels_i[47] ),
    .A1(\gray_sobel0.sobel0._227_ ),
    .S(\gray_sobel0.sobel0._212_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._228_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0.sobel0._530_  (.A(\gray_sobel0.sobel0._228_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._040_ ));
 sky130_fd_sc_hd__a21o_1 \gray_sobel0.sobel0._531_  (.A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[8] ),
    .A2(\gray_sobel0.sobel0._226_ ),
    .B1(\gray_sobel0.sobel0._161_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._229_ ));
 sky130_fd_sc_hd__or3b_2 \gray_sobel0.sobel0._532_  (.A(\gray_sobel0.sobel0._127_ ),
    .B(\gray_sobel0.sobel0._130_ ),
    .C_N(\gray_sobel0.sobel0.counter_sobel[2] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._230_ ));
 sky130_fd_sc_hd__a21oi_4 \gray_sobel0.sobel0._533_  (.A1(\gray_sobel0.sobel0._138_ ),
    .A2(\gray_sobel0.sobel0._230_ ),
    .B1(\gray_sobel0.sobel0._166_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0._231_ ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0.sobel0._534_  (.A0(\gray_sobel0.sobel0.sobel.matrix_pixels_i[32] ),
    .A1(\gray_sobel0.sobel0._229_ ),
    .S(\gray_sobel0.sobel0._231_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._232_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0.sobel0._535_  (.A(\gray_sobel0.sobel0._232_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._041_ ));
 sky130_fd_sc_hd__a21o_1 \gray_sobel0.sobel0._536_  (.A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[9] ),
    .A2(\gray_sobel0.sobel0._226_ ),
    .B1(\gray_sobel0.sobel0._169_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._233_ ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0.sobel0._537_  (.A0(\gray_sobel0.sobel0.sobel.matrix_pixels_i[33] ),
    .A1(\gray_sobel0.sobel0._233_ ),
    .S(\gray_sobel0.sobel0._231_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._234_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0.sobel0._538_  (.A(\gray_sobel0.sobel0._234_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._042_ ));
 sky130_fd_sc_hd__a21o_1 \gray_sobel0.sobel0._539_  (.A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[10] ),
    .A2(\gray_sobel0.sobel0._226_ ),
    .B1(\gray_sobel0.sobel0._172_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._235_ ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0.sobel0._540_  (.A0(\gray_sobel0.sobel0.sobel.matrix_pixels_i[34] ),
    .A1(\gray_sobel0.sobel0._235_ ),
    .S(\gray_sobel0.sobel0._231_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._236_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0.sobel0._541_  (.A(\gray_sobel0.sobel0._236_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._043_ ));
 sky130_fd_sc_hd__a21o_1 \gray_sobel0.sobel0._542_  (.A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[11] ),
    .A2(\gray_sobel0.sobel0._226_ ),
    .B1(\gray_sobel0.sobel0._176_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._237_ ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0.sobel0._543_  (.A0(\gray_sobel0.sobel0.sobel.matrix_pixels_i[35] ),
    .A1(\gray_sobel0.sobel0._237_ ),
    .S(\gray_sobel0.sobel0._231_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._238_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0.sobel0._544_  (.A(\gray_sobel0.sobel0._238_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._044_ ));
 sky130_fd_sc_hd__a21o_1 \gray_sobel0.sobel0._545_  (.A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[12] ),
    .A2(\gray_sobel0.sobel0._226_ ),
    .B1(\gray_sobel0.sobel0._179_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._239_ ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0.sobel0._546_  (.A0(\gray_sobel0.sobel0.sobel.matrix_pixels_i[36] ),
    .A1(\gray_sobel0.sobel0._239_ ),
    .S(\gray_sobel0.sobel0._231_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._240_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0.sobel0._547_  (.A(\gray_sobel0.sobel0._240_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._045_ ));
 sky130_fd_sc_hd__a21o_1 \gray_sobel0.sobel0._548_  (.A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[13] ),
    .A2(\gray_sobel0.sobel0._226_ ),
    .B1(\gray_sobel0.sobel0._182_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._241_ ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0.sobel0._549_  (.A0(\gray_sobel0.sobel0.sobel.matrix_pixels_i[37] ),
    .A1(\gray_sobel0.sobel0._241_ ),
    .S(\gray_sobel0.sobel0._231_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._242_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0.sobel0._550_  (.A(\gray_sobel0.sobel0._242_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._046_ ));
 sky130_fd_sc_hd__a21o_1 \gray_sobel0.sobel0._551_  (.A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[14] ),
    .A2(\gray_sobel0.sobel0._226_ ),
    .B1(\gray_sobel0.sobel0._185_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._243_ ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0.sobel0._552_  (.A0(\gray_sobel0.sobel0.sobel.matrix_pixels_i[38] ),
    .A1(\gray_sobel0.sobel0._243_ ),
    .S(\gray_sobel0.sobel0._231_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._244_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0.sobel0._553_  (.A(\gray_sobel0.sobel0._244_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._047_ ));
 sky130_fd_sc_hd__a21o_1 \gray_sobel0.sobel0._554_  (.A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[15] ),
    .A2(\gray_sobel0.sobel0._226_ ),
    .B1(\gray_sobel0.sobel0._188_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._245_ ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0.sobel0._555_  (.A0(\gray_sobel0.sobel0.sobel.matrix_pixels_i[39] ),
    .A1(\gray_sobel0.sobel0._245_ ),
    .S(\gray_sobel0.sobel0._231_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._246_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0.sobel0._556_  (.A(\gray_sobel0.sobel0._246_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._048_ ));
 sky130_fd_sc_hd__or4bb_1 \gray_sobel0.sobel0._557_  (.A(\gray_sobel0.sobel0.counter_sobel[0] ),
    .B(\gray_sobel0.sobel0._127_ ),
    .C_N(\gray_sobel0.sobel0.counter_sobel[2] ),
    .D_N(\gray_sobel0.sobel0.counter_sobel[1] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._247_ ));
 sky130_fd_sc_hd__a21o_4 \gray_sobel0.sobel0._558_  (.A1(\gray_sobel0.sobel0._138_ ),
    .A2(\gray_sobel0.sobel0._247_ ),
    .B1(\gray_sobel0.sobel0._166_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._248_ ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0.sobel0._559_  (.A0(\gray_sobel0.in_px_sobel[0] ),
    .A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[16] ),
    .S(\gray_sobel0.sobel0._248_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._249_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0.sobel0._560_  (.A(\gray_sobel0.sobel0._249_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._049_ ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0.sobel0._561_  (.A0(\gray_sobel0.in_px_sobel[1] ),
    .A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[17] ),
    .S(\gray_sobel0.sobel0._248_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._250_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0.sobel0._562_  (.A(\gray_sobel0.sobel0._250_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._050_ ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0.sobel0._563_  (.A0(\gray_sobel0.in_px_sobel[2] ),
    .A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[18] ),
    .S(\gray_sobel0.sobel0._248_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._251_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0.sobel0._564_  (.A(\gray_sobel0.sobel0._251_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._051_ ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0.sobel0._565_  (.A0(\gray_sobel0.in_px_sobel[3] ),
    .A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[19] ),
    .S(\gray_sobel0.sobel0._248_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._252_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0.sobel0._566_  (.A(\gray_sobel0.sobel0._252_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._052_ ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0.sobel0._567_  (.A0(\gray_sobel0.in_px_sobel[4] ),
    .A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[20] ),
    .S(\gray_sobel0.sobel0._248_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._253_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0.sobel0._568_  (.A(\gray_sobel0.sobel0._253_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._053_ ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0.sobel0._569_  (.A0(\gray_sobel0.in_px_sobel[5] ),
    .A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[21] ),
    .S(\gray_sobel0.sobel0._248_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._254_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0.sobel0._570_  (.A(\gray_sobel0.sobel0._254_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._054_ ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0.sobel0._571_  (.A0(\gray_sobel0.in_px_sobel[6] ),
    .A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[22] ),
    .S(\gray_sobel0.sobel0._248_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._255_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0.sobel0._572_  (.A(\gray_sobel0.sobel0._255_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._055_ ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0.sobel0._573_  (.A0(\gray_sobel0.in_px_sobel[7] ),
    .A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[23] ),
    .S(\gray_sobel0.sobel0._248_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._256_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0.sobel0._574_  (.A(\gray_sobel0.sobel0._256_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._056_ ));
 sky130_fd_sc_hd__a21o_1 \gray_sobel0.sobel0._575_  (.A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[0] ),
    .A2(\gray_sobel0.sobel0.next[1] ),
    .B1(\gray_sobel0.sobel0._161_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._257_ ));
 sky130_fd_sc_hd__or4bb_1 \gray_sobel0.sobel0._576_  (.A(\gray_sobel0.sobel0.counter_sobel[1] ),
    .B(\gray_sobel0.sobel0._127_ ),
    .C_N(\gray_sobel0.sobel0.counter_sobel[2] ),
    .D_N(\gray_sobel0.sobel0.counter_sobel[0] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._258_ ));
 sky130_fd_sc_hd__a21o_4 \gray_sobel0.sobel0._577_  (.A1(\gray_sobel0.sobel0._138_ ),
    .A2(\gray_sobel0.sobel0._258_ ),
    .B1(\gray_sobel0.sobel0._166_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._259_ ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0.sobel0._578_  (.A0(\gray_sobel0.sobel0._257_ ),
    .A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[24] ),
    .S(\gray_sobel0.sobel0._259_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._260_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0.sobel0._579_  (.A(\gray_sobel0.sobel0._260_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._057_ ));
 sky130_fd_sc_hd__a21o_1 \gray_sobel0.sobel0._580_  (.A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[1] ),
    .A2(\gray_sobel0.sobel0._160_ ),
    .B1(\gray_sobel0.sobel0._169_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._261_ ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0.sobel0._581_  (.A0(\gray_sobel0.sobel0._261_ ),
    .A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[25] ),
    .S(\gray_sobel0.sobel0._259_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._262_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0.sobel0._582_  (.A(\gray_sobel0.sobel0._262_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._058_ ));
 sky130_fd_sc_hd__a21o_1 \gray_sobel0.sobel0._583_  (.A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[2] ),
    .A2(\gray_sobel0.sobel0._160_ ),
    .B1(\gray_sobel0.sobel0._172_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._263_ ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0.sobel0._584_  (.A0(\gray_sobel0.sobel0._263_ ),
    .A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[26] ),
    .S(\gray_sobel0.sobel0._259_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._264_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0.sobel0._585_  (.A(\gray_sobel0.sobel0._264_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._059_ ));
 sky130_fd_sc_hd__a21o_1 \gray_sobel0.sobel0._586_  (.A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[3] ),
    .A2(\gray_sobel0.sobel0._160_ ),
    .B1(\gray_sobel0.sobel0._176_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._265_ ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0.sobel0._587_  (.A0(\gray_sobel0.sobel0._265_ ),
    .A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[27] ),
    .S(\gray_sobel0.sobel0._259_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._266_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0.sobel0._588_  (.A(\gray_sobel0.sobel0._266_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._060_ ));
 sky130_fd_sc_hd__a21o_1 \gray_sobel0.sobel0._589_  (.A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[4] ),
    .A2(\gray_sobel0.sobel0._160_ ),
    .B1(\gray_sobel0.sobel0._179_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._267_ ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0.sobel0._590_  (.A0(\gray_sobel0.sobel0._267_ ),
    .A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[28] ),
    .S(\gray_sobel0.sobel0._259_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._268_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0.sobel0._591_  (.A(\gray_sobel0.sobel0._268_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._061_ ));
 sky130_fd_sc_hd__a21o_1 \gray_sobel0.sobel0._592_  (.A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[5] ),
    .A2(\gray_sobel0.sobel0._160_ ),
    .B1(\gray_sobel0.sobel0._182_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._269_ ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0.sobel0._593_  (.A0(\gray_sobel0.sobel0._269_ ),
    .A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[29] ),
    .S(\gray_sobel0.sobel0._259_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._270_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0.sobel0._594_  (.A(\gray_sobel0.sobel0._270_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._062_ ));
 sky130_fd_sc_hd__a21o_1 \gray_sobel0.sobel0._595_  (.A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[6] ),
    .A2(\gray_sobel0.sobel0._160_ ),
    .B1(\gray_sobel0.sobel0._185_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._271_ ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0.sobel0._596_  (.A0(\gray_sobel0.sobel0._271_ ),
    .A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[30] ),
    .S(\gray_sobel0.sobel0._259_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._272_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0.sobel0._597_  (.A(\gray_sobel0.sobel0._272_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._063_ ));
 sky130_fd_sc_hd__a21o_1 \gray_sobel0.sobel0._598_  (.A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[7] ),
    .A2(\gray_sobel0.sobel0._160_ ),
    .B1(\gray_sobel0.sobel0._188_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._273_ ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0.sobel0._599_  (.A0(\gray_sobel0.sobel0._273_ ),
    .A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[31] ),
    .S(\gray_sobel0.sobel0._259_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._274_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0.sobel0._600_  (.A(\gray_sobel0.sobel0._274_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._064_ ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0.sobel0._601_  (.A0(\gray_sobel0.out_px_sobel[0] ),
    .A1(\gray_sobel0.sobel0.out_sobel_core[0] ),
    .S(\gray_sobel0.sobel0.px_ready ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._275_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0.sobel0._602_  (.A(\gray_sobel0.sobel0._275_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._065_ ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0.sobel0._603_  (.A0(\gray_sobel0.out_px_sobel[1] ),
    .A1(\gray_sobel0.sobel0.out_sobel_core[1] ),
    .S(\gray_sobel0.sobel0.px_ready ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._276_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0.sobel0._604_  (.A(\gray_sobel0.sobel0._276_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._066_ ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0.sobel0._605_  (.A0(\gray_sobel0.out_px_sobel[2] ),
    .A1(\gray_sobel0.sobel0.out_sobel_core[2] ),
    .S(\gray_sobel0.sobel0.px_ready ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._277_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0.sobel0._606_  (.A(\gray_sobel0.sobel0._277_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._067_ ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0.sobel0._607_  (.A0(\gray_sobel0.out_px_sobel[3] ),
    .A1(\gray_sobel0.sobel0.out_sobel_core[3] ),
    .S(\gray_sobel0.sobel0.px_ready ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._278_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0.sobel0._608_  (.A(\gray_sobel0.sobel0._278_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._068_ ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0.sobel0._609_  (.A0(\gray_sobel0.out_px_sobel[4] ),
    .A1(\gray_sobel0.sobel0.out_sobel_core[4] ),
    .S(\gray_sobel0.sobel0.px_ready ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._279_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0.sobel0._610_  (.A(\gray_sobel0.sobel0._279_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._069_ ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0.sobel0._611_  (.A0(\gray_sobel0.out_px_sobel[5] ),
    .A1(\gray_sobel0.sobel0.out_sobel_core[5] ),
    .S(\gray_sobel0.sobel0.px_ready ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._280_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0.sobel0._612_  (.A(\gray_sobel0.sobel0._280_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._070_ ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0.sobel0._613_  (.A0(\gray_sobel0.out_px_sobel[6] ),
    .A1(\gray_sobel0.sobel0.out_sobel_core[6] ),
    .S(\gray_sobel0.sobel0.px_ready ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._281_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0.sobel0._614_  (.A(\gray_sobel0.sobel0._281_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._071_ ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0.sobel0._615_  (.A0(\gray_sobel0.out_px_sobel[7] ),
    .A1(\gray_sobel0.sobel0.out_sobel_core[7] ),
    .S(\gray_sobel0.sobel0.px_ready ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._282_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0.sobel0._616_  (.A(\gray_sobel0.sobel0._282_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._072_ ));
 sky130_fd_sc_hd__nor2b_2 \gray_sobel0.sobel0._617_  (.A(\gray_sobel0.px_rdy_i_sobel ),
    .B_N(\gray_sobel0.sobel0._126_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0._283_ ));
 sky130_fd_sc_hd__inv_2 \gray_sobel0.sobel0._618_  (.A(\gray_sobel0.sobel0._283_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0._284_ ));
 sky130_fd_sc_hd__nand3_2 \gray_sobel0.sobel0._619_  (.A(\gray_sobel0.sobel0._129_ ),
    .B(\gray_sobel0.sobel0._284_ ),
    .C(\gray_sobel0.sobel0._132_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0._285_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0._620_  (.A(\gray_sobel0.sobel0.counter_sobel[0] ),
    .B(\gray_sobel0.sobel0._283_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0._286_ ));
 sky130_fd_sc_hd__and2_1 \gray_sobel0.sobel0._621_  (.A(\gray_sobel0.sobel0._285_ ),
    .B(\gray_sobel0.sobel0._286_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._287_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0.sobel0._622_  (.A(\gray_sobel0.sobel0._287_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._073_ ));
 sky130_fd_sc_hd__a31oi_1 \gray_sobel0.sobel0._623_  (.A1(\gray_sobel0.sobel0._123_ ),
    .A2(\gray_sobel0.sobel0._125_ ),
    .A3(\gray_sobel0.sobel0._129_ ),
    .B1(\gray_sobel0.sobel0._283_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0._288_ ));
 sky130_fd_sc_hd__a32o_1 \gray_sobel0.sobel0._624_  (.A1(\gray_sobel0.sobel0._130_ ),
    .A2(\gray_sobel0.sobel0._210_ ),
    .A3(\gray_sobel0.sobel0._288_ ),
    .B1(\gray_sobel0.sobel0._283_ ),
    .B2(\gray_sobel0.sobel0.counter_sobel[1] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._074_ ));
 sky130_fd_sc_hd__a31o_1 \gray_sobel0.sobel0._625_  (.A1(\gray_sobel0.px_rdy_i_sobel ),
    .A2(\gray_sobel0.sobel0.counter_sobel[1] ),
    .A3(\gray_sobel0.sobel0.counter_sobel[0] ),
    .B1(\gray_sobel0.sobel0.counter_sobel[2] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._289_ ));
 sky130_fd_sc_hd__nand2_1 \gray_sobel0.sobel0._626_  (.A(\gray_sobel0.px_rdy_i_sobel ),
    .B(\gray_sobel0.sobel0._139_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0._290_ ));
 sky130_fd_sc_hd__and3_1 \gray_sobel0.sobel0._627_  (.A(\gray_sobel0.sobel0._126_ ),
    .B(\gray_sobel0.sobel0._289_ ),
    .C(\gray_sobel0.sobel0._290_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._291_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0.sobel0._628_  (.A(\gray_sobel0.sobel0._291_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._075_ ));
 sky130_fd_sc_hd__nand3_1 \gray_sobel0.sobel0._629_  (.A(\gray_sobel0.sobel0._127_ ),
    .B(\gray_sobel0.sobel0._284_ ),
    .C(\gray_sobel0.sobel0._139_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0._292_ ));
 sky130_fd_sc_hd__or3b_1 \gray_sobel0.sobel0._630_  (.A(\gray_sobel0.sobel0._226_ ),
    .B(\gray_sobel0.sobel0._283_ ),
    .C_N(\gray_sobel0.sobel0._132_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._293_ ));
 sky130_fd_sc_hd__a21o_1 \gray_sobel0.sobel0._631_  (.A1(\gray_sobel0.sobel0._284_ ),
    .A2(\gray_sobel0.sobel0._139_ ),
    .B1(\gray_sobel0.sobel0._127_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._294_ ));
 sky130_fd_sc_hd__and3_1 \gray_sobel0.sobel0._632_  (.A(\gray_sobel0.sobel0._292_ ),
    .B(\gray_sobel0.sobel0._293_ ),
    .C(\gray_sobel0.sobel0._294_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._295_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0.sobel0._633_  (.A(\gray_sobel0.sobel0._295_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._076_ ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0.sobel0._634_  (.A0(\gray_sobel0.sobel0._151_ ),
    .A1(\gray_sobel0.sobel0._285_ ),
    .S(\gray_sobel0.sobel0.counter_pixels[0] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._296_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0.sobel0._635_  (.A(\gray_sobel0.sobel0._296_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._077_ ));
 sky130_fd_sc_hd__nand2_1 \gray_sobel0.sobel0._636_  (.A(\gray_sobel0.sobel0.counter_pixels[0] ),
    .B(\gray_sobel0.sobel0.counter_pixels[1] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0._297_ ));
 sky130_fd_sc_hd__or2_1 \gray_sobel0.sobel0._637_  (.A(\gray_sobel0.sobel0.counter_pixels[0] ),
    .B(\gray_sobel0.sobel0.counter_pixels[1] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._298_ ));
 sky130_fd_sc_hd__clkbuf_4 \gray_sobel0.sobel0._638_  (.A(\gray_sobel0.sobel0._285_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._299_ ));
 sky130_fd_sc_hd__a32o_1 \gray_sobel0.sobel0._639_  (.A1(\gray_sobel0.sobel0._000_ ),
    .A2(\gray_sobel0.sobel0._297_ ),
    .A3(\gray_sobel0.sobel0._298_ ),
    .B1(\gray_sobel0.sobel0._299_ ),
    .B2(\gray_sobel0.sobel0.counter_pixels[1] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._078_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0._640_  (.A(\gray_sobel0.sobel0.counter_pixels[2] ),
    .B(\gray_sobel0.sobel0._297_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0._300_ ));
 sky130_fd_sc_hd__a22o_1 \gray_sobel0.sobel0._641_  (.A1(\gray_sobel0.sobel0.counter_pixels[2] ),
    .A2(\gray_sobel0.sobel0._299_ ),
    .B1(\gray_sobel0.sobel0._000_ ),
    .B2(\gray_sobel0.sobel0._300_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._079_ ));
 sky130_fd_sc_hd__a31o_1 \gray_sobel0.sobel0._642_  (.A1(\gray_sobel0.sobel0.counter_pixels[0] ),
    .A2(\gray_sobel0.sobel0.counter_pixels[1] ),
    .A3(\gray_sobel0.sobel0.counter_pixels[2] ),
    .B1(\gray_sobel0.sobel0.counter_pixels[3] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._301_ ));
 sky130_fd_sc_hd__and4_2 \gray_sobel0.sobel0._643_  (.A(\gray_sobel0.sobel0.counter_pixels[0] ),
    .B(\gray_sobel0.sobel0.counter_pixels[1] ),
    .C(\gray_sobel0.sobel0.counter_pixels[3] ),
    .D(\gray_sobel0.sobel0.counter_pixels[2] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._302_ ));
 sky130_fd_sc_hd__inv_2 \gray_sobel0.sobel0._644_  (.A(\gray_sobel0.sobel0._302_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0._303_ ));
 sky130_fd_sc_hd__a32o_1 \gray_sobel0.sobel0._645_  (.A1(\gray_sobel0.sobel0._000_ ),
    .A2(\gray_sobel0.sobel0._301_ ),
    .A3(\gray_sobel0.sobel0._303_ ),
    .B1(\gray_sobel0.sobel0._299_ ),
    .B2(\gray_sobel0.sobel0.counter_pixels[3] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._080_ ));
 sky130_fd_sc_hd__buf_2 \gray_sobel0.sobel0._646_  (.A(\gray_sobel0.sobel0._134_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._304_ ));
 sky130_fd_sc_hd__or2_1 \gray_sobel0.sobel0._647_  (.A(\gray_sobel0.sobel0.counter_pixels[4] ),
    .B(\gray_sobel0.sobel0._302_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._305_ ));
 sky130_fd_sc_hd__nand2_1 \gray_sobel0.sobel0._648_  (.A(\gray_sobel0.sobel0.counter_pixels[4] ),
    .B(\gray_sobel0.sobel0._302_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0._306_ ));
 sky130_fd_sc_hd__a32o_1 \gray_sobel0.sobel0._649_  (.A1(\gray_sobel0.sobel0._304_ ),
    .A2(\gray_sobel0.sobel0._305_ ),
    .A3(\gray_sobel0.sobel0._306_ ),
    .B1(\gray_sobel0.sobel0._299_ ),
    .B2(\gray_sobel0.sobel0.counter_pixels[4] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._081_ ));
 sky130_fd_sc_hd__a21o_1 \gray_sobel0.sobel0._650_  (.A1(\gray_sobel0.sobel0.counter_pixels[4] ),
    .A2(\gray_sobel0.sobel0._302_ ),
    .B1(\gray_sobel0.sobel0.counter_pixels[5] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._307_ ));
 sky130_fd_sc_hd__and2_1 \gray_sobel0.sobel0._651_  (.A(\gray_sobel0.sobel0.counter_pixels[5] ),
    .B(\gray_sobel0.sobel0.counter_pixels[4] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._308_ ));
 sky130_fd_sc_hd__and2_1 \gray_sobel0.sobel0._652_  (.A(\gray_sobel0.sobel0._302_ ),
    .B(\gray_sobel0.sobel0._308_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._309_ ));
 sky130_fd_sc_hd__inv_2 \gray_sobel0.sobel0._653_  (.A(\gray_sobel0.sobel0._309_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0._310_ ));
 sky130_fd_sc_hd__buf_2 \gray_sobel0.sobel0._654_  (.A(\gray_sobel0.sobel0._285_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._311_ ));
 sky130_fd_sc_hd__a32o_1 \gray_sobel0.sobel0._655_  (.A1(\gray_sobel0.sobel0._304_ ),
    .A2(\gray_sobel0.sobel0._307_ ),
    .A3(\gray_sobel0.sobel0._310_ ),
    .B1(\gray_sobel0.sobel0._311_ ),
    .B2(\gray_sobel0.sobel0.counter_pixels[5] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._082_ ));
 sky130_fd_sc_hd__or2_1 \gray_sobel0.sobel0._656_  (.A(\gray_sobel0.sobel0.counter_pixels[6] ),
    .B(\gray_sobel0.sobel0._309_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._312_ ));
 sky130_fd_sc_hd__nand2_1 \gray_sobel0.sobel0._657_  (.A(\gray_sobel0.sobel0.counter_pixels[6] ),
    .B(\gray_sobel0.sobel0._309_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0._313_ ));
 sky130_fd_sc_hd__a32o_1 \gray_sobel0.sobel0._658_  (.A1(\gray_sobel0.sobel0._304_ ),
    .A2(\gray_sobel0.sobel0._312_ ),
    .A3(\gray_sobel0.sobel0._313_ ),
    .B1(\gray_sobel0.sobel0._311_ ),
    .B2(\gray_sobel0.sobel0.counter_pixels[6] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._083_ ));
 sky130_fd_sc_hd__a31o_1 \gray_sobel0.sobel0._659_  (.A1(\gray_sobel0.sobel0.counter_pixels[6] ),
    .A2(\gray_sobel0.sobel0._302_ ),
    .A3(\gray_sobel0.sobel0._308_ ),
    .B1(\gray_sobel0.sobel0.counter_pixels[7] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._314_ ));
 sky130_fd_sc_hd__and2_1 \gray_sobel0.sobel0._660_  (.A(\gray_sobel0.sobel0.counter_pixels[7] ),
    .B(\gray_sobel0.sobel0.counter_pixels[6] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._315_ ));
 sky130_fd_sc_hd__and3_1 \gray_sobel0.sobel0._661_  (.A(\gray_sobel0.sobel0._302_ ),
    .B(\gray_sobel0.sobel0._308_ ),
    .C(\gray_sobel0.sobel0._315_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._316_ ));
 sky130_fd_sc_hd__inv_2 \gray_sobel0.sobel0._662_  (.A(\gray_sobel0.sobel0._316_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0._317_ ));
 sky130_fd_sc_hd__a32o_1 \gray_sobel0.sobel0._663_  (.A1(\gray_sobel0.sobel0._304_ ),
    .A2(\gray_sobel0.sobel0._314_ ),
    .A3(\gray_sobel0.sobel0._317_ ),
    .B1(\gray_sobel0.sobel0._311_ ),
    .B2(\gray_sobel0.sobel0.counter_pixels[7] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._084_ ));
 sky130_fd_sc_hd__xor2_1 \gray_sobel0.sobel0._664_  (.A(\gray_sobel0.sobel0.counter_pixels[8] ),
    .B(\gray_sobel0.sobel0._316_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._318_ ));
 sky130_fd_sc_hd__a22o_1 \gray_sobel0.sobel0._665_  (.A1(\gray_sobel0.sobel0.counter_pixels[8] ),
    .A2(\gray_sobel0.sobel0._299_ ),
    .B1(\gray_sobel0.sobel0._000_ ),
    .B2(\gray_sobel0.sobel0._318_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._085_ ));
 sky130_fd_sc_hd__a21oi_1 \gray_sobel0.sobel0._666_  (.A1(\gray_sobel0.sobel0.counter_pixels[8] ),
    .A2(\gray_sobel0.sobel0._316_ ),
    .B1(\gray_sobel0.sobel0.counter_pixels[9] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0._319_ ));
 sky130_fd_sc_hd__and2_1 \gray_sobel0.sobel0._667_  (.A(\gray_sobel0.sobel0.counter_pixels[9] ),
    .B(\gray_sobel0.sobel0.counter_pixels[8] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._320_ ));
 sky130_fd_sc_hd__and4_1 \gray_sobel0.sobel0._668_  (.A(\gray_sobel0.sobel0._302_ ),
    .B(\gray_sobel0.sobel0._308_ ),
    .C(\gray_sobel0.sobel0._315_ ),
    .D(\gray_sobel0.sobel0._320_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._321_ ));
 sky130_fd_sc_hd__clkbuf_2 \gray_sobel0.sobel0._669_  (.A(\gray_sobel0.sobel0._321_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._322_ ));
 sky130_fd_sc_hd__nor2_1 \gray_sobel0.sobel0._670_  (.A(\gray_sobel0.sobel0._319_ ),
    .B(\gray_sobel0.sobel0._322_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0._323_ ));
 sky130_fd_sc_hd__a22o_1 \gray_sobel0.sobel0._671_  (.A1(\gray_sobel0.sobel0.counter_pixels[9] ),
    .A2(\gray_sobel0.sobel0._299_ ),
    .B1(\gray_sobel0.sobel0._000_ ),
    .B2(\gray_sobel0.sobel0._323_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._086_ ));
 sky130_fd_sc_hd__xor2_1 \gray_sobel0.sobel0._672_  (.A(\gray_sobel0.sobel0.counter_pixels[10] ),
    .B(\gray_sobel0.sobel0._322_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._324_ ));
 sky130_fd_sc_hd__a22o_1 \gray_sobel0.sobel0._673_  (.A1(\gray_sobel0.sobel0.counter_pixels[10] ),
    .A2(\gray_sobel0.sobel0._299_ ),
    .B1(\gray_sobel0.sobel0._000_ ),
    .B2(\gray_sobel0.sobel0._324_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._087_ ));
 sky130_fd_sc_hd__a21oi_1 \gray_sobel0.sobel0._674_  (.A1(\gray_sobel0.sobel0.counter_pixels[10] ),
    .A2(\gray_sobel0.sobel0._322_ ),
    .B1(\gray_sobel0.sobel0.counter_pixels[11] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0._325_ ));
 sky130_fd_sc_hd__and2_1 \gray_sobel0.sobel0._675_  (.A(\gray_sobel0.sobel0.counter_pixels[11] ),
    .B(\gray_sobel0.sobel0.counter_pixels[10] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._326_ ));
 sky130_fd_sc_hd__and2_1 \gray_sobel0.sobel0._676_  (.A(\gray_sobel0.sobel0._322_ ),
    .B(\gray_sobel0.sobel0._326_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._327_ ));
 sky130_fd_sc_hd__nor2_1 \gray_sobel0.sobel0._677_  (.A(\gray_sobel0.sobel0._325_ ),
    .B(\gray_sobel0.sobel0._327_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0._328_ ));
 sky130_fd_sc_hd__a22o_1 \gray_sobel0.sobel0._678_  (.A1(\gray_sobel0.sobel0.counter_pixels[11] ),
    .A2(\gray_sobel0.sobel0._299_ ),
    .B1(\gray_sobel0.sobel0._000_ ),
    .B2(\gray_sobel0.sobel0._328_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._088_ ));
 sky130_fd_sc_hd__xor2_1 \gray_sobel0.sobel0._679_  (.A(\gray_sobel0.sobel0.counter_pixels[12] ),
    .B(\gray_sobel0.sobel0._327_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._329_ ));
 sky130_fd_sc_hd__a22o_1 \gray_sobel0.sobel0._680_  (.A1(\gray_sobel0.sobel0.counter_pixels[12] ),
    .A2(\gray_sobel0.sobel0._299_ ),
    .B1(\gray_sobel0.sobel0._000_ ),
    .B2(\gray_sobel0.sobel0._329_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._089_ ));
 sky130_fd_sc_hd__a31o_1 \gray_sobel0.sobel0._681_  (.A1(\gray_sobel0.sobel0.counter_pixels[12] ),
    .A2(\gray_sobel0.sobel0._322_ ),
    .A3(\gray_sobel0.sobel0._326_ ),
    .B1(\gray_sobel0.sobel0.counter_pixels[13] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._330_ ));
 sky130_fd_sc_hd__and2_1 \gray_sobel0.sobel0._682_  (.A(\gray_sobel0.sobel0.counter_pixels[13] ),
    .B(\gray_sobel0.sobel0.counter_pixels[12] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._331_ ));
 sky130_fd_sc_hd__and4_2 \gray_sobel0.sobel0._683_  (.A(\gray_sobel0.sobel0._316_ ),
    .B(\gray_sobel0.sobel0._320_ ),
    .C(\gray_sobel0.sobel0._326_ ),
    .D(\gray_sobel0.sobel0._331_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._332_ ));
 sky130_fd_sc_hd__inv_2 \gray_sobel0.sobel0._684_  (.A(\gray_sobel0.sobel0._332_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0._333_ ));
 sky130_fd_sc_hd__a32o_1 \gray_sobel0.sobel0._685_  (.A1(\gray_sobel0.sobel0._304_ ),
    .A2(\gray_sobel0.sobel0._330_ ),
    .A3(\gray_sobel0.sobel0._333_ ),
    .B1(\gray_sobel0.sobel0._311_ ),
    .B2(\gray_sobel0.sobel0.counter_pixels[13] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._090_ ));
 sky130_fd_sc_hd__or2_1 \gray_sobel0.sobel0._686_  (.A(\gray_sobel0.sobel0.counter_pixels[14] ),
    .B(\gray_sobel0.sobel0._332_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._334_ ));
 sky130_fd_sc_hd__nand2_1 \gray_sobel0.sobel0._687_  (.A(\gray_sobel0.sobel0.counter_pixels[14] ),
    .B(\gray_sobel0.sobel0._332_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0._335_ ));
 sky130_fd_sc_hd__a32o_1 \gray_sobel0.sobel0._688_  (.A1(\gray_sobel0.sobel0._304_ ),
    .A2(\gray_sobel0.sobel0._334_ ),
    .A3(\gray_sobel0.sobel0._335_ ),
    .B1(\gray_sobel0.sobel0._311_ ),
    .B2(\gray_sobel0.sobel0.counter_pixels[14] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._091_ ));
 sky130_fd_sc_hd__a21o_1 \gray_sobel0.sobel0._689_  (.A1(\gray_sobel0.sobel0.counter_pixels[14] ),
    .A2(\gray_sobel0.sobel0._332_ ),
    .B1(\gray_sobel0.sobel0.counter_pixels[15] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._336_ ));
 sky130_fd_sc_hd__and2_1 \gray_sobel0.sobel0._690_  (.A(\gray_sobel0.sobel0.counter_pixels[15] ),
    .B(\gray_sobel0.sobel0.counter_pixels[14] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._337_ ));
 sky130_fd_sc_hd__and2_1 \gray_sobel0.sobel0._691_  (.A(\gray_sobel0.sobel0._332_ ),
    .B(\gray_sobel0.sobel0._337_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._338_ ));
 sky130_fd_sc_hd__inv_2 \gray_sobel0.sobel0._692_  (.A(\gray_sobel0.sobel0._338_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0._339_ ));
 sky130_fd_sc_hd__a32o_1 \gray_sobel0.sobel0._693_  (.A1(\gray_sobel0.sobel0._304_ ),
    .A2(\gray_sobel0.sobel0._336_ ),
    .A3(\gray_sobel0.sobel0._339_ ),
    .B1(\gray_sobel0.sobel0._311_ ),
    .B2(\gray_sobel0.sobel0.counter_pixels[15] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._092_ ));
 sky130_fd_sc_hd__and4_1 \gray_sobel0.sobel0._694_  (.A(\gray_sobel0.sobel0._322_ ),
    .B(\gray_sobel0.sobel0._326_ ),
    .C(\gray_sobel0.sobel0._331_ ),
    .D(\gray_sobel0.sobel0._337_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._340_ ));
 sky130_fd_sc_hd__or2_1 \gray_sobel0.sobel0._695_  (.A(\gray_sobel0.sobel0.counter_pixels[16] ),
    .B(\gray_sobel0.sobel0._340_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._341_ ));
 sky130_fd_sc_hd__nand2_1 \gray_sobel0.sobel0._696_  (.A(\gray_sobel0.sobel0.counter_pixels[16] ),
    .B(\gray_sobel0.sobel0._340_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0._342_ ));
 sky130_fd_sc_hd__a32o_1 \gray_sobel0.sobel0._697_  (.A1(\gray_sobel0.sobel0._304_ ),
    .A2(\gray_sobel0.sobel0._341_ ),
    .A3(\gray_sobel0.sobel0._342_ ),
    .B1(\gray_sobel0.sobel0._311_ ),
    .B2(\gray_sobel0.sobel0.counter_pixels[16] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._093_ ));
 sky130_fd_sc_hd__and2_1 \gray_sobel0.sobel0._698_  (.A(\gray_sobel0.sobel0.counter_pixels[16] ),
    .B(\gray_sobel0.sobel0._340_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._343_ ));
 sky130_fd_sc_hd__nand2_1 \gray_sobel0.sobel0._699_  (.A(\gray_sobel0.sobel0.counter_pixels[17] ),
    .B(\gray_sobel0.sobel0._343_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0._344_ ));
 sky130_fd_sc_hd__or2_1 \gray_sobel0.sobel0._700_  (.A(\gray_sobel0.sobel0.counter_pixels[17] ),
    .B(\gray_sobel0.sobel0._343_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._345_ ));
 sky130_fd_sc_hd__a32o_1 \gray_sobel0.sobel0._701_  (.A1(\gray_sobel0.sobel0._304_ ),
    .A2(\gray_sobel0.sobel0._344_ ),
    .A3(\gray_sobel0.sobel0._345_ ),
    .B1(\gray_sobel0.sobel0._311_ ),
    .B2(\gray_sobel0.sobel0.counter_pixels[17] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._094_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0._702_  (.A(\gray_sobel0.sobel0.counter_pixels[18] ),
    .B(\gray_sobel0.sobel0._344_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0._346_ ));
 sky130_fd_sc_hd__a22o_1 \gray_sobel0.sobel0._703_  (.A1(\gray_sobel0.sobel0.counter_pixels[18] ),
    .A2(\gray_sobel0.sobel0._299_ ),
    .B1(\gray_sobel0.sobel0._000_ ),
    .B2(\gray_sobel0.sobel0._346_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._095_ ));
 sky130_fd_sc_hd__a31o_1 \gray_sobel0.sobel0._704_  (.A1(\gray_sobel0.sobel0.counter_pixels[17] ),
    .A2(\gray_sobel0.sobel0.counter_pixels[18] ),
    .A3(\gray_sobel0.sobel0._343_ ),
    .B1(\gray_sobel0.sobel0.counter_pixels[19] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._347_ ));
 sky130_fd_sc_hd__and4_1 \gray_sobel0.sobel0._705_  (.A(\gray_sobel0.sobel0.counter_pixels[17] ),
    .B(\gray_sobel0.sobel0.counter_pixels[16] ),
    .C(\gray_sobel0.sobel0.counter_pixels[19] ),
    .D(\gray_sobel0.sobel0.counter_pixels[18] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._348_ ));
 sky130_fd_sc_hd__nand2_1 \gray_sobel0.sobel0._706_  (.A(\gray_sobel0.sobel0._338_ ),
    .B(\gray_sobel0.sobel0._348_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0._349_ ));
 sky130_fd_sc_hd__a32o_1 \gray_sobel0.sobel0._707_  (.A1(\gray_sobel0.sobel0._304_ ),
    .A2(\gray_sobel0.sobel0._347_ ),
    .A3(\gray_sobel0.sobel0._349_ ),
    .B1(\gray_sobel0.sobel0._311_ ),
    .B2(\gray_sobel0.sobel0.counter_pixels[19] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._096_ ));
 sky130_fd_sc_hd__and3_1 \gray_sobel0.sobel0._708_  (.A(\gray_sobel0.sobel0.counter_pixels[20] ),
    .B(\gray_sobel0.sobel0._340_ ),
    .C(\gray_sobel0.sobel0._348_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._350_ ));
 sky130_fd_sc_hd__inv_2 \gray_sobel0.sobel0._709_  (.A(\gray_sobel0.sobel0._350_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0._351_ ));
 sky130_fd_sc_hd__a21o_1 \gray_sobel0.sobel0._710_  (.A1(\gray_sobel0.sobel0._340_ ),
    .A2(\gray_sobel0.sobel0._348_ ),
    .B1(\gray_sobel0.sobel0.counter_pixels[20] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._352_ ));
 sky130_fd_sc_hd__a32o_1 \gray_sobel0.sobel0._711_  (.A1(\gray_sobel0.sobel0._151_ ),
    .A2(\gray_sobel0.sobel0._351_ ),
    .A3(\gray_sobel0.sobel0._352_ ),
    .B1(\gray_sobel0.sobel0._311_ ),
    .B2(\gray_sobel0.sobel0.counter_pixels[20] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._097_ ));
 sky130_fd_sc_hd__nand2_1 \gray_sobel0.sobel0._712_  (.A(\gray_sobel0.sobel0.counter_pixels[21] ),
    .B(\gray_sobel0.sobel0._350_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0._353_ ));
 sky130_fd_sc_hd__or2_1 \gray_sobel0.sobel0._713_  (.A(\gray_sobel0.sobel0.counter_pixels[21] ),
    .B(\gray_sobel0.sobel0._350_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._354_ ));
 sky130_fd_sc_hd__a32o_1 \gray_sobel0.sobel0._714_  (.A1(\gray_sobel0.sobel0._151_ ),
    .A2(\gray_sobel0.sobel0._353_ ),
    .A3(\gray_sobel0.sobel0._354_ ),
    .B1(\gray_sobel0.sobel0._285_ ),
    .B2(\gray_sobel0.sobel0.counter_pixels[21] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._098_ ));
 sky130_fd_sc_hd__nand3_1 \gray_sobel0.sobel0._715_  (.A(\gray_sobel0.sobel0.counter_pixels[21] ),
    .B(\gray_sobel0.sobel0.counter_pixels[22] ),
    .C(\gray_sobel0.sobel0._350_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0._355_ ));
 sky130_fd_sc_hd__a21o_1 \gray_sobel0.sobel0._716_  (.A1(\gray_sobel0.sobel0._126_ ),
    .A2(\gray_sobel0.sobel0._355_ ),
    .B1(\gray_sobel0.sobel0._285_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._356_ ));
 sky130_fd_sc_hd__a31o_1 \gray_sobel0.sobel0._717_  (.A1(\gray_sobel0.sobel0.counter_pixels[21] ),
    .A2(\gray_sobel0.sobel0._134_ ),
    .A3(\gray_sobel0.sobel0._350_ ),
    .B1(\gray_sobel0.sobel0.counter_pixels[22] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._357_ ));
 sky130_fd_sc_hd__and2_1 \gray_sobel0.sobel0._718_  (.A(\gray_sobel0.sobel0._356_ ),
    .B(\gray_sobel0.sobel0._357_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._358_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0.sobel0._719_  (.A(\gray_sobel0.sobel0._358_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._099_ ));
 sky130_fd_sc_hd__or3b_1 \gray_sobel0.sobel0._720_  (.A(\gray_sobel0.sobel0._355_ ),
    .B(\gray_sobel0.sobel0.counter_pixels[23] ),
    .C_N(\gray_sobel0.sobel0._134_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._359_ ));
 sky130_fd_sc_hd__a21bo_1 \gray_sobel0.sobel0._721_  (.A1(\gray_sobel0.sobel0.counter_pixels[23] ),
    .A2(\gray_sobel0.sobel0._356_ ),
    .B1_N(\gray_sobel0.sobel0._359_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._100_ ));
 sky130_fd_sc_hd__a211o_1 \gray_sobel0.sobel0._722_  (.A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[40] ),
    .A2(\gray_sobel0.sobel0.next[1] ),
    .B1(\gray_sobel0.sobel0._136_ ),
    .C1(\gray_sobel0.sobel0._164_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._360_ ));
 sky130_fd_sc_hd__o22a_1 \gray_sobel0.sobel0._723_  (.A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[64] ),
    .A2(\gray_sobel0.sobel0._165_ ),
    .B1(\gray_sobel0.sobel0._161_ ),
    .B2(\gray_sobel0.sobel0._360_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._101_ ));
 sky130_fd_sc_hd__a211o_1 \gray_sobel0.sobel0._724_  (.A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[41] ),
    .A2(\gray_sobel0.sobel0.next[1] ),
    .B1(\gray_sobel0.sobel0._136_ ),
    .C1(\gray_sobel0.sobel0._164_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._361_ ));
 sky130_fd_sc_hd__o22a_1 \gray_sobel0.sobel0._725_  (.A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[65] ),
    .A2(\gray_sobel0.sobel0._165_ ),
    .B1(\gray_sobel0.sobel0._169_ ),
    .B2(\gray_sobel0.sobel0._361_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._102_ ));
 sky130_fd_sc_hd__a211o_1 \gray_sobel0.sobel0._726_  (.A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[42] ),
    .A2(\gray_sobel0.sobel0.next[1] ),
    .B1(\gray_sobel0.sobel0._136_ ),
    .C1(\gray_sobel0.sobel0._164_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._362_ ));
 sky130_fd_sc_hd__o22a_1 \gray_sobel0.sobel0._727_  (.A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[66] ),
    .A2(\gray_sobel0.sobel0._165_ ),
    .B1(\gray_sobel0.sobel0._172_ ),
    .B2(\gray_sobel0.sobel0._362_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._103_ ));
 sky130_fd_sc_hd__a211o_1 \gray_sobel0.sobel0._728_  (.A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[43] ),
    .A2(\gray_sobel0.sobel0.next[1] ),
    .B1(\gray_sobel0.sobel0._136_ ),
    .C1(\gray_sobel0.sobel0._164_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._363_ ));
 sky130_fd_sc_hd__o22a_1 \gray_sobel0.sobel0._729_  (.A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[67] ),
    .A2(\gray_sobel0.sobel0._165_ ),
    .B1(\gray_sobel0.sobel0._176_ ),
    .B2(\gray_sobel0.sobel0._363_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._104_ ));
 sky130_fd_sc_hd__a211o_1 \gray_sobel0.sobel0._730_  (.A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[44] ),
    .A2(\gray_sobel0.sobel0.next[1] ),
    .B1(\gray_sobel0.sobel0._136_ ),
    .C1(\gray_sobel0.sobel0._164_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._364_ ));
 sky130_fd_sc_hd__o22a_1 \gray_sobel0.sobel0._731_  (.A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[68] ),
    .A2(\gray_sobel0.sobel0._165_ ),
    .B1(\gray_sobel0.sobel0._179_ ),
    .B2(\gray_sobel0.sobel0._364_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._105_ ));
 sky130_fd_sc_hd__a211o_1 \gray_sobel0.sobel0._732_  (.A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[45] ),
    .A2(\gray_sobel0.sobel0.next[1] ),
    .B1(\gray_sobel0.sobel0._136_ ),
    .C1(\gray_sobel0.sobel0._164_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._365_ ));
 sky130_fd_sc_hd__o22a_1 \gray_sobel0.sobel0._733_  (.A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[69] ),
    .A2(\gray_sobel0.sobel0._165_ ),
    .B1(\gray_sobel0.sobel0._182_ ),
    .B2(\gray_sobel0.sobel0._365_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._106_ ));
 sky130_fd_sc_hd__a211o_1 \gray_sobel0.sobel0._734_  (.A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[46] ),
    .A2(\gray_sobel0.sobel0.next[1] ),
    .B1(\gray_sobel0.sobel0._136_ ),
    .C1(\gray_sobel0.sobel0._164_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._366_ ));
 sky130_fd_sc_hd__o22a_1 \gray_sobel0.sobel0._735_  (.A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[70] ),
    .A2(\gray_sobel0.sobel0._165_ ),
    .B1(\gray_sobel0.sobel0._185_ ),
    .B2(\gray_sobel0.sobel0._366_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._107_ ));
 sky130_fd_sc_hd__a211o_1 \gray_sobel0.sobel0._736_  (.A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[47] ),
    .A2(\gray_sobel0.sobel0.next[1] ),
    .B1(\gray_sobel0.sobel0._136_ ),
    .C1(\gray_sobel0.sobel0._164_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._367_ ));
 sky130_fd_sc_hd__o22a_1 \gray_sobel0.sobel0._737_  (.A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[71] ),
    .A2(\gray_sobel0.sobel0._165_ ),
    .B1(\gray_sobel0.sobel0._188_ ),
    .B2(\gray_sobel0.sobel0._367_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0._108_ ));
 sky130_fd_sc_hd__dfrtp_1 \gray_sobel0.sobel0._738_  (.CLK(clknet_leaf_10_clk),
    .D(\gray_sobel0.sobel0._001_ ),
    .RESET_B(net35),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.sobel.matrix_pixels_i[8] ));
 sky130_fd_sc_hd__dfrtp_1 \gray_sobel0.sobel0._739_  (.CLK(clknet_leaf_9_clk),
    .D(\gray_sobel0.sobel0._002_ ),
    .RESET_B(net32),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.sobel.matrix_pixels_i[9] ));
 sky130_fd_sc_hd__dfrtp_1 \gray_sobel0.sobel0._740_  (.CLK(clknet_leaf_9_clk),
    .D(\gray_sobel0.sobel0._003_ ),
    .RESET_B(net33),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.sobel.matrix_pixels_i[10] ));
 sky130_fd_sc_hd__dfrtp_1 \gray_sobel0.sobel0._741_  (.CLK(clknet_leaf_20_clk),
    .D(\gray_sobel0.sobel0._004_ ),
    .RESET_B(net20),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.sobel.matrix_pixels_i[11] ));
 sky130_fd_sc_hd__dfrtp_1 \gray_sobel0.sobel0._742_  (.CLK(clknet_leaf_19_clk),
    .D(\gray_sobel0.sobel0._005_ ),
    .RESET_B(net17),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.sobel.matrix_pixels_i[12] ));
 sky130_fd_sc_hd__dfrtp_1 \gray_sobel0.sobel0._743_  (.CLK(clknet_leaf_19_clk),
    .D(\gray_sobel0.sobel0._006_ ),
    .RESET_B(net17),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.sobel.matrix_pixels_i[13] ));
 sky130_fd_sc_hd__dfrtp_1 \gray_sobel0.sobel0._744_  (.CLK(clknet_leaf_18_clk),
    .D(\gray_sobel0.sobel0._007_ ),
    .RESET_B(net16),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.sobel.matrix_pixels_i[14] ));
 sky130_fd_sc_hd__dfrtp_1 \gray_sobel0.sobel0._745_  (.CLK(clknet_leaf_18_clk),
    .D(\gray_sobel0.sobel0._008_ ),
    .RESET_B(net16),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.sobel.matrix_pixels_i[15] ));
 sky130_fd_sc_hd__dfrtp_2 \gray_sobel0.sobel0._746_  (.CLK(clknet_leaf_12_clk),
    .D(\gray_sobel0.sobel0._009_ ),
    .RESET_B(net39),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.sobel.matrix_pixels_i[0] ));
 sky130_fd_sc_hd__dfrtp_2 \gray_sobel0.sobel0._747_  (.CLK(clknet_leaf_15_clk),
    .D(\gray_sobel0.sobel0._010_ ),
    .RESET_B(net32),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.sobel.matrix_pixels_i[1] ));
 sky130_fd_sc_hd__dfrtp_2 \gray_sobel0.sobel0._748_  (.CLK(clknet_leaf_15_clk),
    .D(\gray_sobel0.sobel0._011_ ),
    .RESET_B(net33),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.sobel.matrix_pixels_i[2] ));
 sky130_fd_sc_hd__dfrtp_2 \gray_sobel0.sobel0._749_  (.CLK(clknet_leaf_16_clk),
    .D(\gray_sobel0.sobel0._012_ ),
    .RESET_B(net20),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.sobel.matrix_pixels_i[3] ));
 sky130_fd_sc_hd__dfrtp_2 \gray_sobel0.sobel0._750_  (.CLK(clknet_leaf_19_clk),
    .D(\gray_sobel0.sobel0._013_ ),
    .RESET_B(net19),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.sobel.matrix_pixels_i[4] ));
 sky130_fd_sc_hd__dfrtp_2 \gray_sobel0.sobel0._751_  (.CLK(clknet_leaf_19_clk),
    .D(\gray_sobel0.sobel0._014_ ),
    .RESET_B(net17),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.sobel.matrix_pixels_i[5] ));
 sky130_fd_sc_hd__dfrtp_2 \gray_sobel0.sobel0._752_  (.CLK(clknet_leaf_18_clk),
    .D(\gray_sobel0.sobel0._015_ ),
    .RESET_B(net17),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.sobel.matrix_pixels_i[6] ));
 sky130_fd_sc_hd__dfrtp_4 \gray_sobel0.sobel0._753_  (.CLK(clknet_leaf_12_clk),
    .D(\gray_sobel0.sobel0._016_ ),
    .RESET_B(net35),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.sobel.matrix_pixels_i[7] ));
 sky130_fd_sc_hd__dfrtp_2 \gray_sobel0.sobel0._754_  (.CLK(clknet_leaf_12_clk),
    .D(\gray_sobel0.sobel0._017_ ),
    .RESET_B(net39),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.sobel.matrix_pixels_i[48] ));
 sky130_fd_sc_hd__dfrtp_2 \gray_sobel0.sobel0._755_  (.CLK(clknet_leaf_15_clk),
    .D(\gray_sobel0.sobel0._018_ ),
    .RESET_B(net34),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.sobel.matrix_pixels_i[49] ));
 sky130_fd_sc_hd__dfrtp_2 \gray_sobel0.sobel0._756_  (.CLK(clknet_leaf_15_clk),
    .D(\gray_sobel0.sobel0._019_ ),
    .RESET_B(net34),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.sobel.matrix_pixels_i[50] ));
 sky130_fd_sc_hd__dfrtp_4 \gray_sobel0.sobel0._757_  (.CLK(clknet_leaf_16_clk),
    .D(\gray_sobel0.sobel0._020_ ),
    .RESET_B(net20),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.sobel.matrix_pixels_i[51] ));
 sky130_fd_sc_hd__dfrtp_4 \gray_sobel0.sobel0._758_  (.CLK(clknet_leaf_17_clk),
    .D(\gray_sobel0.sobel0._021_ ),
    .RESET_B(net22),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.sobel.matrix_pixels_i[52] ));
 sky130_fd_sc_hd__dfrtp_2 \gray_sobel0.sobel0._759_  (.CLK(clknet_leaf_19_clk),
    .D(\gray_sobel0.sobel0._022_ ),
    .RESET_B(net17),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.sobel.matrix_pixels_i[53] ));
 sky130_fd_sc_hd__dfrtp_2 \gray_sobel0.sobel0._760_  (.CLK(clknet_leaf_17_clk),
    .D(\gray_sobel0.sobel0._023_ ),
    .RESET_B(net22),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.sobel.matrix_pixels_i[54] ));
 sky130_fd_sc_hd__dfrtp_4 \gray_sobel0.sobel0._761_  (.CLK(clknet_leaf_18_clk),
    .D(\gray_sobel0.sobel0._024_ ),
    .RESET_B(net18),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.sobel.matrix_pixels_i[55] ));
 sky130_fd_sc_hd__dfrtp_1 \gray_sobel0.sobel0._762_  (.CLK(clknet_leaf_9_clk),
    .D(\gray_sobel0.sobel0._025_ ),
    .RESET_B(net32),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.sobel.matrix_pixels_i[56] ));
 sky130_fd_sc_hd__dfrtp_1 \gray_sobel0.sobel0._763_  (.CLK(clknet_leaf_9_clk),
    .D(\gray_sobel0.sobel0._026_ ),
    .RESET_B(net33),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.sobel.matrix_pixels_i[57] ));
 sky130_fd_sc_hd__dfrtp_1 \gray_sobel0.sobel0._764_  (.CLK(clknet_leaf_16_clk),
    .D(\gray_sobel0.sobel0._027_ ),
    .RESET_B(net33),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.sobel.matrix_pixels_i[58] ));
 sky130_fd_sc_hd__dfrtp_1 \gray_sobel0.sobel0._765_  (.CLK(clknet_leaf_20_clk),
    .D(\gray_sobel0.sobel0._028_ ),
    .RESET_B(net20),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.sobel.matrix_pixels_i[59] ));
 sky130_fd_sc_hd__dfrtp_1 \gray_sobel0.sobel0._766_  (.CLK(clknet_leaf_19_clk),
    .D(\gray_sobel0.sobel0._029_ ),
    .RESET_B(net19),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.sobel.matrix_pixels_i[60] ));
 sky130_fd_sc_hd__dfrtp_1 \gray_sobel0.sobel0._767_  (.CLK(clknet_leaf_18_clk),
    .D(\gray_sobel0.sobel0._030_ ),
    .RESET_B(net17),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.sobel.matrix_pixels_i[61] ));
 sky130_fd_sc_hd__dfrtp_1 \gray_sobel0.sobel0._768_  (.CLK(clknet_leaf_18_clk),
    .D(\gray_sobel0.sobel0._031_ ),
    .RESET_B(net16),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.sobel.matrix_pixels_i[62] ));
 sky130_fd_sc_hd__dfrtp_1 \gray_sobel0.sobel0._769_  (.CLK(clknet_leaf_18_clk),
    .D(\gray_sobel0.sobel0._032_ ),
    .RESET_B(net16),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.sobel.matrix_pixels_i[63] ));
 sky130_fd_sc_hd__dfrtp_1 \gray_sobel0.sobel0._770_  (.CLK(clknet_leaf_9_clk),
    .D(\gray_sobel0.sobel0._033_ ),
    .RESET_B(net32),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.sobel.matrix_pixels_i[40] ));
 sky130_fd_sc_hd__dfrtp_1 \gray_sobel0.sobel0._771_  (.CLK(clknet_leaf_15_clk),
    .D(\gray_sobel0.sobel0._034_ ),
    .RESET_B(net34),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.sobel.matrix_pixels_i[41] ));
 sky130_fd_sc_hd__dfrtp_1 \gray_sobel0.sobel0._772_  (.CLK(clknet_leaf_15_clk),
    .D(\gray_sobel0.sobel0._035_ ),
    .RESET_B(net33),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.sobel.matrix_pixels_i[42] ));
 sky130_fd_sc_hd__dfrtp_1 \gray_sobel0.sobel0._773_  (.CLK(clknet_leaf_16_clk),
    .D(\gray_sobel0.sobel0._036_ ),
    .RESET_B(net20),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.sobel.matrix_pixels_i[43] ));
 sky130_fd_sc_hd__dfrtp_1 \gray_sobel0.sobel0._774_  (.CLK(clknet_leaf_16_clk),
    .D(\gray_sobel0.sobel0._037_ ),
    .RESET_B(net19),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.sobel.matrix_pixels_i[44] ));
 sky130_fd_sc_hd__dfrtp_1 \gray_sobel0.sobel0._775_  (.CLK(clknet_leaf_19_clk),
    .D(\gray_sobel0.sobel0._038_ ),
    .RESET_B(net19),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.sobel.matrix_pixels_i[45] ));
 sky130_fd_sc_hd__dfrtp_1 \gray_sobel0.sobel0._776_  (.CLK(clknet_leaf_18_clk),
    .D(\gray_sobel0.sobel0._039_ ),
    .RESET_B(net16),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.sobel.matrix_pixels_i[46] ));
 sky130_fd_sc_hd__dfrtp_1 \gray_sobel0.sobel0._777_  (.CLK(clknet_leaf_18_clk),
    .D(\gray_sobel0.sobel0._040_ ),
    .RESET_B(net16),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.sobel.matrix_pixels_i[47] ));
 sky130_fd_sc_hd__dfrtp_1 \gray_sobel0.sobel0._778_  (.CLK(clknet_leaf_9_clk),
    .D(\gray_sobel0.sobel0._041_ ),
    .RESET_B(net32),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.sobel.matrix_pixels_i[32] ));
 sky130_fd_sc_hd__dfrtp_1 \gray_sobel0.sobel0._779_  (.CLK(clknet_leaf_9_clk),
    .D(\gray_sobel0.sobel0._042_ ),
    .RESET_B(net32),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.sobel.matrix_pixels_i[33] ));
 sky130_fd_sc_hd__dfrtp_1 \gray_sobel0.sobel0._780_  (.CLK(clknet_leaf_16_clk),
    .D(\gray_sobel0.sobel0._043_ ),
    .RESET_B(net33),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.sobel.matrix_pixels_i[34] ));
 sky130_fd_sc_hd__dfrtp_1 \gray_sobel0.sobel0._781_  (.CLK(clknet_leaf_16_clk),
    .D(\gray_sobel0.sobel0._044_ ),
    .RESET_B(net20),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.sobel.matrix_pixels_i[35] ));
 sky130_fd_sc_hd__dfrtp_1 \gray_sobel0.sobel0._782_  (.CLK(clknet_leaf_19_clk),
    .D(\gray_sobel0.sobel0._045_ ),
    .RESET_B(net19),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.sobel.matrix_pixels_i[36] ));
 sky130_fd_sc_hd__dfrtp_1 \gray_sobel0.sobel0._783_  (.CLK(clknet_leaf_18_clk),
    .D(\gray_sobel0.sobel0._046_ ),
    .RESET_B(net17),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.sobel.matrix_pixels_i[37] ));
 sky130_fd_sc_hd__dfrtp_1 \gray_sobel0.sobel0._784_  (.CLK(clknet_leaf_18_clk),
    .D(\gray_sobel0.sobel0._047_ ),
    .RESET_B(net16),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.sobel.matrix_pixels_i[38] ));
 sky130_fd_sc_hd__dfrtp_1 \gray_sobel0.sobel0._785_  (.CLK(clknet_leaf_18_clk),
    .D(\gray_sobel0.sobel0._048_ ),
    .RESET_B(net16),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.sobel.matrix_pixels_i[39] ));
 sky130_fd_sc_hd__dfrtp_4 \gray_sobel0.sobel0._786_  (.CLK(clknet_leaf_10_clk),
    .D(\gray_sobel0.sobel0._049_ ),
    .RESET_B(net40),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.sobel.matrix_pixels_i[16] ));
 sky130_fd_sc_hd__dfrtp_4 \gray_sobel0.sobel0._787_  (.CLK(clknet_leaf_9_clk),
    .D(\gray_sobel0.sobel0._050_ ),
    .RESET_B(net32),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.sobel.matrix_pixels_i[17] ));
 sky130_fd_sc_hd__dfrtp_4 \gray_sobel0.sobel0._788_  (.CLK(clknet_leaf_15_clk),
    .D(\gray_sobel0.sobel0._051_ ),
    .RESET_B(net33),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.sobel.matrix_pixels_i[18] ));
 sky130_fd_sc_hd__dfrtp_4 \gray_sobel0.sobel0._789_  (.CLK(clknet_leaf_16_clk),
    .D(\gray_sobel0.sobel0._052_ ),
    .RESET_B(net20),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.sobel.matrix_pixels_i[19] ));
 sky130_fd_sc_hd__dfrtp_4 \gray_sobel0.sobel0._790_  (.CLK(clknet_leaf_19_clk),
    .D(\gray_sobel0.sobel0._053_ ),
    .RESET_B(net19),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.sobel.matrix_pixels_i[20] ));
 sky130_fd_sc_hd__dfrtp_4 \gray_sobel0.sobel0._791_  (.CLK(clknet_leaf_19_clk),
    .D(\gray_sobel0.sobel0._054_ ),
    .RESET_B(net21),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.sobel.matrix_pixels_i[21] ));
 sky130_fd_sc_hd__dfrtp_4 \gray_sobel0.sobel0._792_  (.CLK(clknet_leaf_19_clk),
    .D(\gray_sobel0.sobel0._055_ ),
    .RESET_B(net17),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.sobel.matrix_pixels_i[22] ));
 sky130_fd_sc_hd__dfrtp_4 \gray_sobel0.sobel0._793_  (.CLK(clknet_leaf_18_clk),
    .D(\gray_sobel0.sobel0._056_ ),
    .RESET_B(net16),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.sobel.matrix_pixels_i[23] ));
 sky130_fd_sc_hd__dfrtp_1 \gray_sobel0.sobel0._794_  (.CLK(clknet_leaf_10_clk),
    .D(\gray_sobel0.sobel0._057_ ),
    .RESET_B(net35),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.sobel.matrix_pixels_i[24] ));
 sky130_fd_sc_hd__dfrtp_1 \gray_sobel0.sobel0._795_  (.CLK(clknet_leaf_15_clk),
    .D(\gray_sobel0.sobel0._058_ ),
    .RESET_B(net34),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.sobel.matrix_pixels_i[25] ));
 sky130_fd_sc_hd__dfrtp_1 \gray_sobel0.sobel0._796_  (.CLK(clknet_leaf_15_clk),
    .D(\gray_sobel0.sobel0._059_ ),
    .RESET_B(net33),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.sobel.matrix_pixels_i[26] ));
 sky130_fd_sc_hd__dfrtp_1 \gray_sobel0.sobel0._797_  (.CLK(clknet_leaf_16_clk),
    .D(\gray_sobel0.sobel0._060_ ),
    .RESET_B(net20),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.sobel.matrix_pixels_i[27] ));
 sky130_fd_sc_hd__dfrtp_1 \gray_sobel0.sobel0._798_  (.CLK(clknet_leaf_19_clk),
    .D(\gray_sobel0.sobel0._061_ ),
    .RESET_B(net19),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.sobel.matrix_pixels_i[28] ));
 sky130_fd_sc_hd__dfrtp_1 \gray_sobel0.sobel0._799_  (.CLK(clknet_leaf_19_clk),
    .D(\gray_sobel0.sobel0._062_ ),
    .RESET_B(net17),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.sobel.matrix_pixels_i[29] ));
 sky130_fd_sc_hd__dfrtp_1 \gray_sobel0.sobel0._800_  (.CLK(clknet_leaf_17_clk),
    .D(\gray_sobel0.sobel0._063_ ),
    .RESET_B(net16),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.sobel.matrix_pixels_i[30] ));
 sky130_fd_sc_hd__dfrtp_1 \gray_sobel0.sobel0._801_  (.CLK(clknet_leaf_18_clk),
    .D(\gray_sobel0.sobel0._064_ ),
    .RESET_B(net18),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.sobel.matrix_pixels_i[31] ));
 sky130_fd_sc_hd__dfrtp_1 \gray_sobel0.sobel0._802_  (.CLK(clknet_leaf_9_clk),
    .D(\gray_sobel0.sobel0.px_ready ),
    .RESET_B(net32),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.px_rdy_o_sobel ));
 sky130_fd_sc_hd__dfrtp_1 \gray_sobel0.sobel0._803_  (.CLK(clknet_leaf_7_clk),
    .D(\gray_sobel0.sobel0._065_ ),
    .RESET_B(net35),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.out_px_sobel[0] ));
 sky130_fd_sc_hd__dfrtp_1 \gray_sobel0.sobel0._804_  (.CLK(clknet_leaf_9_clk),
    .D(\gray_sobel0.sobel0._066_ ),
    .RESET_B(net32),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.out_px_sobel[1] ));
 sky130_fd_sc_hd__dfrtp_1 \gray_sobel0.sobel0._805_  (.CLK(clknet_leaf_10_clk),
    .D(\gray_sobel0.sobel0._067_ ),
    .RESET_B(net35),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.out_px_sobel[2] ));
 sky130_fd_sc_hd__dfrtp_1 \gray_sobel0.sobel0._806_  (.CLK(clknet_leaf_10_clk),
    .D(\gray_sobel0.sobel0._068_ ),
    .RESET_B(net35),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.out_px_sobel[3] ));
 sky130_fd_sc_hd__dfrtp_1 \gray_sobel0.sobel0._807_  (.CLK(clknet_leaf_9_clk),
    .D(\gray_sobel0.sobel0._069_ ),
    .RESET_B(net32),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.out_px_sobel[4] ));
 sky130_fd_sc_hd__dfrtp_1 \gray_sobel0.sobel0._808_  (.CLK(clknet_leaf_20_clk),
    .D(\gray_sobel0.sobel0._070_ ),
    .RESET_B(net20),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.out_px_sobel[5] ));
 sky130_fd_sc_hd__dfrtp_1 \gray_sobel0.sobel0._809_  (.CLK(clknet_leaf_19_clk),
    .D(\gray_sobel0.sobel0._071_ ),
    .RESET_B(net19),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.out_px_sobel[6] ));
 sky130_fd_sc_hd__dfrtp_1 \gray_sobel0.sobel0._810_  (.CLK(clknet_leaf_10_clk),
    .D(\gray_sobel0.sobel0._072_ ),
    .RESET_B(net35),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.out_px_sobel[7] ));
 sky130_fd_sc_hd__dfrtp_4 \gray_sobel0.sobel0._811_  (.CLK(clknet_leaf_11_clk),
    .D(\gray_sobel0.sobel0._073_ ),
    .RESET_B(net36),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.counter_sobel[0] ));
 sky130_fd_sc_hd__dfrtp_4 \gray_sobel0.sobel0._812_  (.CLK(clknet_leaf_11_clk),
    .D(\gray_sobel0.sobel0._074_ ),
    .RESET_B(net37),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.counter_sobel[1] ));
 sky130_fd_sc_hd__dfrtp_4 \gray_sobel0.sobel0._813_  (.CLK(clknet_leaf_11_clk),
    .D(\gray_sobel0.sobel0._075_ ),
    .RESET_B(net36),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.counter_sobel[2] ));
 sky130_fd_sc_hd__dfrtp_1 \gray_sobel0.sobel0._814_  (.CLK(clknet_leaf_10_clk),
    .D(\gray_sobel0.sobel0._076_ ),
    .RESET_B(net35),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.counter_sobel[3] ));
 sky130_fd_sc_hd__dfrtp_4 \gray_sobel0.sobel0._815_  (.CLK(clknet_leaf_10_clk),
    .D(\gray_sobel0.sobel0._000_ ),
    .RESET_B(net36),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.px_ready ));
 sky130_fd_sc_hd__dfrtp_2 \gray_sobel0.sobel0._816_  (.CLK(clknet_leaf_11_clk),
    .D(\gray_sobel0.sobel0._077_ ),
    .RESET_B(net37),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.counter_pixels[0] ));
 sky130_fd_sc_hd__dfrtp_1 \gray_sobel0.sobel0._817_  (.CLK(clknet_leaf_11_clk),
    .D(\gray_sobel0.sobel0._078_ ),
    .RESET_B(net37),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.counter_pixels[1] ));
 sky130_fd_sc_hd__dfrtp_2 \gray_sobel0.sobel0._818_  (.CLK(clknet_leaf_11_clk),
    .D(\gray_sobel0.sobel0._079_ ),
    .RESET_B(net37),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.counter_pixels[2] ));
 sky130_fd_sc_hd__dfrtp_1 \gray_sobel0.sobel0._819_  (.CLK(clknet_leaf_11_clk),
    .D(\gray_sobel0.sobel0._080_ ),
    .RESET_B(net37),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.counter_pixels[3] ));
 sky130_fd_sc_hd__dfrtp_1 \gray_sobel0.sobel0._820_  (.CLK(clknet_leaf_12_clk),
    .D(\gray_sobel0.sobel0._081_ ),
    .RESET_B(net38),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.counter_pixels[4] ));
 sky130_fd_sc_hd__dfrtp_1 \gray_sobel0.sobel0._821_  (.CLK(clknet_leaf_12_clk),
    .D(\gray_sobel0.sobel0._082_ ),
    .RESET_B(net38),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.counter_pixels[5] ));
 sky130_fd_sc_hd__dfrtp_1 \gray_sobel0.sobel0._822_  (.CLK(clknet_leaf_12_clk),
    .D(\gray_sobel0.sobel0._083_ ),
    .RESET_B(net38),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.counter_pixels[6] ));
 sky130_fd_sc_hd__dfrtp_1 \gray_sobel0.sobel0._823_  (.CLK(clknet_leaf_12_clk),
    .D(\gray_sobel0.sobel0._084_ ),
    .RESET_B(net38),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.counter_pixels[7] ));
 sky130_fd_sc_hd__dfrtp_2 \gray_sobel0.sobel0._824_  (.CLK(clknet_leaf_13_clk),
    .D(\gray_sobel0.sobel0._085_ ),
    .RESET_B(net40),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.counter_pixels[8] ));
 sky130_fd_sc_hd__dfrtp_1 \gray_sobel0.sobel0._825_  (.CLK(clknet_leaf_13_clk),
    .D(\gray_sobel0.sobel0._086_ ),
    .RESET_B(net38),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.counter_pixels[9] ));
 sky130_fd_sc_hd__dfrtp_2 \gray_sobel0.sobel0._826_  (.CLK(clknet_leaf_13_clk),
    .D(\gray_sobel0.sobel0._087_ ),
    .RESET_B(net40),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.counter_pixels[10] ));
 sky130_fd_sc_hd__dfrtp_1 \gray_sobel0.sobel0._827_  (.CLK(clknet_leaf_13_clk),
    .D(\gray_sobel0.sobel0._088_ ),
    .RESET_B(net38),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.counter_pixels[11] ));
 sky130_fd_sc_hd__dfrtp_2 \gray_sobel0.sobel0._828_  (.CLK(clknet_leaf_13_clk),
    .D(\gray_sobel0.sobel0._089_ ),
    .RESET_B(net38),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.counter_pixels[12] ));
 sky130_fd_sc_hd__dfrtp_1 \gray_sobel0.sobel0._829_  (.CLK(clknet_leaf_13_clk),
    .D(\gray_sobel0.sobel0._090_ ),
    .RESET_B(net39),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.counter_pixels[13] ));
 sky130_fd_sc_hd__dfrtp_1 \gray_sobel0.sobel0._830_  (.CLK(clknet_leaf_13_clk),
    .D(\gray_sobel0.sobel0._091_ ),
    .RESET_B(net39),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.counter_pixels[14] ));
 sky130_fd_sc_hd__dfrtp_1 \gray_sobel0.sobel0._831_  (.CLK(clknet_leaf_13_clk),
    .D(\gray_sobel0.sobel0._092_ ),
    .RESET_B(net39),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.counter_pixels[15] ));
 sky130_fd_sc_hd__dfrtp_1 \gray_sobel0.sobel0._832_  (.CLK(clknet_leaf_14_clk),
    .D(\gray_sobel0.sobel0._093_ ),
    .RESET_B(net39),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.counter_pixels[16] ));
 sky130_fd_sc_hd__dfrtp_1 \gray_sobel0.sobel0._833_  (.CLK(clknet_leaf_12_clk),
    .D(\gray_sobel0.sobel0._094_ ),
    .RESET_B(net38),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.counter_pixels[17] ));
 sky130_fd_sc_hd__dfrtp_1 \gray_sobel0.sobel0._834_  (.CLK(clknet_leaf_12_clk),
    .D(\gray_sobel0.sobel0._095_ ),
    .RESET_B(net40),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.counter_pixels[18] ));
 sky130_fd_sc_hd__dfrtp_1 \gray_sobel0.sobel0._835_  (.CLK(clknet_leaf_14_clk),
    .D(\gray_sobel0.sobel0._096_ ),
    .RESET_B(net39),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.counter_pixels[19] ));
 sky130_fd_sc_hd__dfrtp_1 \gray_sobel0.sobel0._836_  (.CLK(clknet_leaf_12_clk),
    .D(\gray_sobel0.sobel0._097_ ),
    .RESET_B(net39),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.counter_pixels[20] ));
 sky130_fd_sc_hd__dfrtp_2 \gray_sobel0.sobel0._837_  (.CLK(clknet_leaf_12_clk),
    .D(\gray_sobel0.sobel0._098_ ),
    .RESET_B(net38),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.counter_pixels[21] ));
 sky130_fd_sc_hd__dfrtp_1 \gray_sobel0.sobel0._838_  (.CLK(clknet_leaf_12_clk),
    .D(\gray_sobel0.sobel0._099_ ),
    .RESET_B(net39),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.counter_pixels[22] ));
 sky130_fd_sc_hd__dfrtp_1 \gray_sobel0.sobel0._839_  (.CLK(clknet_leaf_12_clk),
    .D(\gray_sobel0.sobel0._100_ ),
    .RESET_B(net38),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.counter_pixels[23] ));
 sky130_fd_sc_hd__dfrtp_2 \gray_sobel0.sobel0._840_  (.CLK(clknet_leaf_12_clk),
    .D(\gray_sobel0.sobel0.next[0] ),
    .RESET_B(net37),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.fsm_state[0] ));
 sky130_fd_sc_hd__dfrtp_2 \gray_sobel0.sobel0._841_  (.CLK(clknet_leaf_12_clk),
    .D(\gray_sobel0.sobel0.next[1] ),
    .RESET_B(net35),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.fsm_state[1] ));
 sky130_fd_sc_hd__dfrtp_4 \gray_sobel0.sobel0._842_  (.CLK(clknet_leaf_10_clk),
    .D(\gray_sobel0.sobel0._101_ ),
    .RESET_B(net34),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.sobel.matrix_pixels_i[64] ));
 sky130_fd_sc_hd__dfrtp_2 \gray_sobel0.sobel0._843_  (.CLK(clknet_leaf_15_clk),
    .D(\gray_sobel0.sobel0._102_ ),
    .RESET_B(net34),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.sobel.matrix_pixels_i[65] ));
 sky130_fd_sc_hd__dfrtp_2 \gray_sobel0.sobel0._844_  (.CLK(clknet_leaf_15_clk),
    .D(\gray_sobel0.sobel0._103_ ),
    .RESET_B(net34),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.sobel.matrix_pixels_i[66] ));
 sky130_fd_sc_hd__dfrtp_4 \gray_sobel0.sobel0._845_  (.CLK(clknet_leaf_16_clk),
    .D(\gray_sobel0.sobel0._104_ ),
    .RESET_B(net21),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.sobel.matrix_pixels_i[67] ));
 sky130_fd_sc_hd__dfrtp_4 \gray_sobel0.sobel0._846_  (.CLK(clknet_leaf_16_clk),
    .D(\gray_sobel0.sobel0._105_ ),
    .RESET_B(net19),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.sobel.matrix_pixels_i[68] ));
 sky130_fd_sc_hd__dfrtp_4 \gray_sobel0.sobel0._847_  (.CLK(clknet_leaf_19_clk),
    .D(\gray_sobel0.sobel0._106_ ),
    .RESET_B(net21),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.sobel.matrix_pixels_i[69] ));
 sky130_fd_sc_hd__dfrtp_2 \gray_sobel0.sobel0._848_  (.CLK(clknet_leaf_17_clk),
    .D(\gray_sobel0.sobel0._107_ ),
    .RESET_B(net17),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.sobel.matrix_pixels_i[70] ));
 sky130_fd_sc_hd__dfrtp_1 \gray_sobel0.sobel0._849_  (.CLK(clknet_leaf_17_clk),
    .D(\gray_sobel0.sobel0._108_ ),
    .RESET_B(net18),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.sobel0.sobel.matrix_pixels_i[71] ));
 sky130_fd_sc_hd__or2_1 \gray_sobel0.sobel0.sobel._0528_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[4] ),
    .B(\gray_sobel0.sobel0.sobel.matrix_pixels_i[20] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0501_ ));
 sky130_fd_sc_hd__and2b_1 \gray_sobel0.sobel0.sobel._0529_  (.A_N(\gray_sobel0.sobel0.sobel.matrix_pixels_i[58] ),
    .B(\gray_sobel0.sobel0.sobel.matrix_pixels_i[10] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0502_ ));
 sky130_fd_sc_hd__and2b_1 \gray_sobel0.sobel0.sobel._0530_  (.A_N(\gray_sobel0.sobel0.sobel.matrix_pixels_i[10] ),
    .B(\gray_sobel0.sobel0.sobel.matrix_pixels_i[58] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0503_ ));
 sky130_fd_sc_hd__nor2_1 \gray_sobel0.sobel0.sobel._0531_  (.A(\gray_sobel0.sobel0.sobel._0502_ ),
    .B(\gray_sobel0.sobel0.sobel._0503_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0504_ ));
 sky130_fd_sc_hd__nand2b_1 \gray_sobel0.sobel0.sobel._0532_  (.A_N(\gray_sobel0.sobel0.sobel.matrix_pixels_i[8] ),
    .B(\gray_sobel0.sobel0.sobel.matrix_pixels_i[56] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0505_ ));
 sky130_fd_sc_hd__or2b_1 \gray_sobel0.sobel0.sobel._0533_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[9] ),
    .B_N(\gray_sobel0.sobel0.sobel.matrix_pixels_i[57] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0506_ ));
 sky130_fd_sc_hd__and2b_1 \gray_sobel0.sobel0.sobel._0534_  (.A_N(\gray_sobel0.sobel0.sobel.matrix_pixels_i[57] ),
    .B(\gray_sobel0.sobel0.sobel.matrix_pixels_i[9] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0507_ ));
 sky130_fd_sc_hd__a21o_1 \gray_sobel0.sobel0.sobel._0535_  (.A1(\gray_sobel0.sobel0.sobel._0505_ ),
    .A2(\gray_sobel0.sobel0.sobel._0506_ ),
    .B1(\gray_sobel0.sobel0.sobel._0507_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0508_ ));
 sky130_fd_sc_hd__a21oi_1 \gray_sobel0.sobel0.sobel._0536_  (.A1(\gray_sobel0.sobel0.sobel._0504_ ),
    .A2(\gray_sobel0.sobel0.sobel._0508_ ),
    .B1(\gray_sobel0.sobel0.sobel._0502_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0509_ ));
 sky130_fd_sc_hd__and2b_1 \gray_sobel0.sobel0.sobel._0537_  (.A_N(\gray_sobel0.sobel0.sobel.matrix_pixels_i[11] ),
    .B(\gray_sobel0.sobel0.sobel.matrix_pixels_i[59] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0510_ ));
 sky130_fd_sc_hd__and2b_1 \gray_sobel0.sobel0.sobel._0538_  (.A_N(\gray_sobel0.sobel0.sobel.matrix_pixels_i[59] ),
    .B(\gray_sobel0.sobel0.sobel.matrix_pixels_i[11] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0511_ ));
 sky130_fd_sc_hd__nor2_1 \gray_sobel0.sobel0.sobel._0539_  (.A(\gray_sobel0.sobel0.sobel._0510_ ),
    .B(\gray_sobel0.sobel0.sobel._0511_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0512_ ));
 sky130_fd_sc_hd__xnor2_2 \gray_sobel0.sobel0.sobel._0540_  (.A(\gray_sobel0.sobel0.sobel._0509_ ),
    .B(\gray_sobel0.sobel0.sobel._0512_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0513_ ));
 sky130_fd_sc_hd__nand2_1 \gray_sobel0.sobel0.sobel._0541_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[4] ),
    .B(\gray_sobel0.sobel0.sobel.matrix_pixels_i[20] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0514_ ));
 sky130_fd_sc_hd__a21bo_1 \gray_sobel0.sobel0.sobel._0542_  (.A1(\gray_sobel0.sobel0.sobel._0501_ ),
    .A2(\gray_sobel0.sobel0.sobel._0513_ ),
    .B1_N(\gray_sobel0.sobel0.sobel._0514_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0515_ ));
 sky130_fd_sc_hd__nand2_1 \gray_sobel0.sobel0.sobel._0543_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[5] ),
    .B(\gray_sobel0.sobel0.sobel.matrix_pixels_i[21] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0516_ ));
 sky130_fd_sc_hd__or2_1 \gray_sobel0.sobel0.sobel._0544_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[5] ),
    .B(\gray_sobel0.sobel0.sobel.matrix_pixels_i[21] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0517_ ));
 sky130_fd_sc_hd__nand2_1 \gray_sobel0.sobel0.sobel._0545_  (.A(\gray_sobel0.sobel0.sobel._0516_ ),
    .B(\gray_sobel0.sobel0.sobel._0517_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0518_ ));
 sky130_fd_sc_hd__and2b_1 \gray_sobel0.sobel0.sobel._0546_  (.A_N(\gray_sobel0.sobel0.sobel.matrix_pixels_i[60] ),
    .B(\gray_sobel0.sobel0.sobel.matrix_pixels_i[12] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0519_ ));
 sky130_fd_sc_hd__and2b_1 \gray_sobel0.sobel0.sobel._0547_  (.A_N(\gray_sobel0.sobel0.sobel.matrix_pixels_i[12] ),
    .B(\gray_sobel0.sobel0.sobel.matrix_pixels_i[60] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0520_ ));
 sky130_fd_sc_hd__nor2_1 \gray_sobel0.sobel0.sobel._0548_  (.A(\gray_sobel0.sobel0.sobel._0519_ ),
    .B(\gray_sobel0.sobel0.sobel._0520_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0521_ ));
 sky130_fd_sc_hd__nor3b_1 \gray_sobel0.sobel0.sobel._0549_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[58] ),
    .B(\gray_sobel0.sobel0.sobel._0510_ ),
    .C_N(\gray_sobel0.sobel0.sobel.matrix_pixels_i[10] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0522_ ));
 sky130_fd_sc_hd__a311o_1 \gray_sobel0.sobel0.sobel._0550_  (.A1(\gray_sobel0.sobel0.sobel._0504_ ),
    .A2(\gray_sobel0.sobel0.sobel._0508_ ),
    .A3(\gray_sobel0.sobel0.sobel._0512_ ),
    .B1(\gray_sobel0.sobel0.sobel._0522_ ),
    .C1(\gray_sobel0.sobel0.sobel._0511_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0523_ ));
 sky130_fd_sc_hd__xor2_1 \gray_sobel0.sobel0.sobel._0551_  (.A(\gray_sobel0.sobel0.sobel._0521_ ),
    .B(\gray_sobel0.sobel0.sobel._0523_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0524_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._0552_  (.A(\gray_sobel0.sobel0.sobel._0518_ ),
    .B(\gray_sobel0.sobel0.sobel._0524_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0525_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._0553_  (.A(\gray_sobel0.sobel0.sobel._0515_ ),
    .B(\gray_sobel0.sobel0.sobel._0525_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0526_ ));
 sky130_fd_sc_hd__nand2_1 \gray_sobel0.sobel0.sobel._0554_  (.A(\gray_sobel0.sobel0.sobel._0515_ ),
    .B(\gray_sobel0.sobel0.sobel._0525_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0527_ ));
 sky130_fd_sc_hd__o21ai_1 \gray_sobel0.sobel0.sobel._0555_  (.A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[53] ),
    .A2(\gray_sobel0.sobel0.sobel._0526_ ),
    .B1(\gray_sobel0.sobel0.sobel._0527_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0000_ ));
 sky130_fd_sc_hd__a21boi_1 \gray_sobel0.sobel0.sobel._0556_  (.A1(\gray_sobel0.sobel0.sobel._0517_ ),
    .A2(\gray_sobel0.sobel0.sobel._0524_ ),
    .B1_N(\gray_sobel0.sobel0.sobel._0516_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0001_ ));
 sky130_fd_sc_hd__nand2_1 \gray_sobel0.sobel0.sobel._0557_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[6] ),
    .B(\gray_sobel0.sobel0.sobel.matrix_pixels_i[22] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0002_ ));
 sky130_fd_sc_hd__or2_1 \gray_sobel0.sobel0.sobel._0558_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[6] ),
    .B(\gray_sobel0.sobel0.sobel.matrix_pixels_i[22] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0003_ ));
 sky130_fd_sc_hd__nand2_1 \gray_sobel0.sobel0.sobel._0559_  (.A(\gray_sobel0.sobel0.sobel._0002_ ),
    .B(\gray_sobel0.sobel0.sobel._0003_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0004_ ));
 sky130_fd_sc_hd__and2b_1 \gray_sobel0.sobel0.sobel._0560_  (.A_N(\gray_sobel0.sobel0.sobel.matrix_pixels_i[61] ),
    .B(\gray_sobel0.sobel0.sobel.matrix_pixels_i[13] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0005_ ));
 sky130_fd_sc_hd__or2b_1 \gray_sobel0.sobel0.sobel._0561_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[13] ),
    .B_N(\gray_sobel0.sobel0.sobel.matrix_pixels_i[61] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0006_ ));
 sky130_fd_sc_hd__or2b_1 \gray_sobel0.sobel0.sobel._0562_  (.A(\gray_sobel0.sobel0.sobel._0005_ ),
    .B_N(\gray_sobel0.sobel0.sobel._0006_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0007_ ));
 sky130_fd_sc_hd__a21oi_1 \gray_sobel0.sobel0.sobel._0563_  (.A1(\gray_sobel0.sobel0.sobel._0521_ ),
    .A2(\gray_sobel0.sobel0.sobel._0523_ ),
    .B1(\gray_sobel0.sobel0.sobel._0519_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0008_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._0564_  (.A(\gray_sobel0.sobel0.sobel._0007_ ),
    .B(\gray_sobel0.sobel0.sobel._0008_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0009_ ));
 sky130_fd_sc_hd__xor2_1 \gray_sobel0.sobel0.sobel._0565_  (.A(\gray_sobel0.sobel0.sobel._0004_ ),
    .B(\gray_sobel0.sobel0.sobel._0009_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0010_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._0566_  (.A(\gray_sobel0.sobel0.sobel._0001_ ),
    .B(\gray_sobel0.sobel0.sobel._0010_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0011_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._0567_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[54] ),
    .B(\gray_sobel0.sobel0.sobel._0011_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0012_ ));
 sky130_fd_sc_hd__and2_1 \gray_sobel0.sobel0.sobel._0568_  (.A(\gray_sobel0.sobel0.sobel._0000_ ),
    .B(\gray_sobel0.sobel0.sobel._0012_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0013_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._0569_  (.A(\gray_sobel0.sobel0.sobel._0000_ ),
    .B(\gray_sobel0.sobel0.sobel._0012_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0014_ ));
 sky130_fd_sc_hd__nor2_1 \gray_sobel0.sobel0.sobel._0570_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[70] ),
    .B(\gray_sobel0.sobel0.sobel._0014_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0015_ ));
 sky130_fd_sc_hd__buf_4 \gray_sobel0.sobel0.sobel._0571_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[71] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0016_ ));
 sky130_fd_sc_hd__inv_2 \gray_sobel0.sobel0.sobel._0572_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[54] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0017_ ));
 sky130_fd_sc_hd__and2b_1 \gray_sobel0.sobel0.sobel._0573_  (.A_N(\gray_sobel0.sobel0.sobel._0001_ ),
    .B(\gray_sobel0.sobel0.sobel._0010_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0018_ ));
 sky130_fd_sc_hd__a21o_1 \gray_sobel0.sobel0.sobel._0574_  (.A1(\gray_sobel0.sobel0.sobel._0017_ ),
    .A2(\gray_sobel0.sobel0.sobel._0011_ ),
    .B1(\gray_sobel0.sobel0.sobel._0018_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0019_ ));
 sky130_fd_sc_hd__o21ai_1 \gray_sobel0.sobel0.sobel._0575_  (.A1(\gray_sobel0.sobel0.sobel._0004_ ),
    .A2(\gray_sobel0.sobel0.sobel._0009_ ),
    .B1(\gray_sobel0.sobel0.sobel._0002_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0020_ ));
 sky130_fd_sc_hd__or2_1 \gray_sobel0.sobel0.sobel._0576_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[7] ),
    .B(\gray_sobel0.sobel0.sobel.matrix_pixels_i[23] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0021_ ));
 sky130_fd_sc_hd__nand2_1 \gray_sobel0.sobel0.sobel._0577_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[7] ),
    .B(\gray_sobel0.sobel0.sobel.matrix_pixels_i[23] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0022_ ));
 sky130_fd_sc_hd__nand2_2 \gray_sobel0.sobel0.sobel._0578_  (.A(\gray_sobel0.sobel0.sobel._0021_ ),
    .B(\gray_sobel0.sobel0.sobel._0022_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0023_ ));
 sky130_fd_sc_hd__and2b_1 \gray_sobel0.sobel0.sobel._0579_  (.A_N(\gray_sobel0.sobel0.sobel.matrix_pixels_i[62] ),
    .B(\gray_sobel0.sobel0.sobel.matrix_pixels_i[14] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0024_ ));
 sky130_fd_sc_hd__or2b_1 \gray_sobel0.sobel0.sobel._0580_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[14] ),
    .B_N(\gray_sobel0.sobel0.sobel.matrix_pixels_i[62] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0025_ ));
 sky130_fd_sc_hd__or2b_1 \gray_sobel0.sobel0.sobel._0581_  (.A(\gray_sobel0.sobel0.sobel._0024_ ),
    .B_N(\gray_sobel0.sobel0.sobel._0025_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0026_ ));
 sky130_fd_sc_hd__and3b_1 \gray_sobel0.sobel0.sobel._0582_  (.A_N(\gray_sobel0.sobel0.sobel.matrix_pixels_i[60] ),
    .B(\gray_sobel0.sobel0.sobel.matrix_pixels_i[12] ),
    .C(\gray_sobel0.sobel0.sobel._0006_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0027_ ));
 sky130_fd_sc_hd__a311o_1 \gray_sobel0.sobel0.sobel._0583_  (.A1(\gray_sobel0.sobel0.sobel._0521_ ),
    .A2(\gray_sobel0.sobel0.sobel._0523_ ),
    .A3(\gray_sobel0.sobel0.sobel._0006_ ),
    .B1(\gray_sobel0.sobel0.sobel._0027_ ),
    .C1(\gray_sobel0.sobel0.sobel._0005_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0028_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._0584_  (.A(\gray_sobel0.sobel0.sobel._0026_ ),
    .B(\gray_sobel0.sobel0.sobel._0028_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0029_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._0585_  (.A(\gray_sobel0.sobel0.sobel._0023_ ),
    .B(\gray_sobel0.sobel0.sobel._0029_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0030_ ));
 sky130_fd_sc_hd__xor2_1 \gray_sobel0.sobel0.sobel._0586_  (.A(\gray_sobel0.sobel0.sobel._0020_ ),
    .B(\gray_sobel0.sobel0.sobel._0030_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0031_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._0587_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[55] ),
    .B(\gray_sobel0.sobel0.sobel._0031_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0032_ ));
 sky130_fd_sc_hd__xor2_1 \gray_sobel0.sobel0.sobel._0588_  (.A(\gray_sobel0.sobel0.sobel._0019_ ),
    .B(\gray_sobel0.sobel0.sobel._0032_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0033_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._0589_  (.A(\gray_sobel0.sobel0.sobel._0016_ ),
    .B(\gray_sobel0.sobel0.sobel._0033_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0034_ ));
 sky130_fd_sc_hd__o21a_1 \gray_sobel0.sobel0.sobel._0590_  (.A1(\gray_sobel0.sobel0.sobel._0013_ ),
    .A2(\gray_sobel0.sobel0.sobel._0015_ ),
    .B1(\gray_sobel0.sobel0.sobel._0034_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0035_ ));
 sky130_fd_sc_hd__nor3_1 \gray_sobel0.sobel0.sobel._0591_  (.A(\gray_sobel0.sobel0.sobel._0034_ ),
    .B(\gray_sobel0.sobel0.sobel._0013_ ),
    .C(\gray_sobel0.sobel0.sobel._0015_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0036_ ));
 sky130_fd_sc_hd__nor2_1 \gray_sobel0.sobel0.sobel._0592_  (.A(\gray_sobel0.sobel0.sobel._0035_ ),
    .B(\gray_sobel0.sobel0.sobel._0036_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0037_ ));
 sky130_fd_sc_hd__inv_2 \gray_sobel0.sobel0.sobel._0593_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[52] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0038_ ));
 sky130_fd_sc_hd__or2_1 \gray_sobel0.sobel0.sobel._0594_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[3] ),
    .B(\gray_sobel0.sobel0.sobel.matrix_pixels_i[19] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0039_ ));
 sky130_fd_sc_hd__xor2_2 \gray_sobel0.sobel0.sobel._0595_  (.A(\gray_sobel0.sobel0.sobel._0504_ ),
    .B(\gray_sobel0.sobel0.sobel._0508_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0040_ ));
 sky130_fd_sc_hd__nand2_1 \gray_sobel0.sobel0.sobel._0596_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[3] ),
    .B(\gray_sobel0.sobel0.sobel.matrix_pixels_i[19] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0041_ ));
 sky130_fd_sc_hd__a21boi_2 \gray_sobel0.sobel0.sobel._0597_  (.A1(\gray_sobel0.sobel0.sobel._0039_ ),
    .A2(\gray_sobel0.sobel0.sobel._0040_ ),
    .B1_N(\gray_sobel0.sobel0.sobel._0041_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0042_ ));
 sky130_fd_sc_hd__nand2_1 \gray_sobel0.sobel0.sobel._0598_  (.A(\gray_sobel0.sobel0.sobel._0514_ ),
    .B(\gray_sobel0.sobel0.sobel._0501_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0043_ ));
 sky130_fd_sc_hd__xnor2_2 \gray_sobel0.sobel0.sobel._0599_  (.A(\gray_sobel0.sobel0.sobel._0043_ ),
    .B(\gray_sobel0.sobel0.sobel._0513_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0044_ ));
 sky130_fd_sc_hd__xnor2_2 \gray_sobel0.sobel0.sobel._0600_  (.A(\gray_sobel0.sobel0.sobel._0042_ ),
    .B(\gray_sobel0.sobel0.sobel._0044_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0045_ ));
 sky130_fd_sc_hd__and2b_1 \gray_sobel0.sobel0.sobel._0601_  (.A_N(\gray_sobel0.sobel0.sobel._0042_ ),
    .B(\gray_sobel0.sobel0.sobel._0044_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0046_ ));
 sky130_fd_sc_hd__a21o_1 \gray_sobel0.sobel0.sobel._0602_  (.A1(\gray_sobel0.sobel0.sobel._0038_ ),
    .A2(\gray_sobel0.sobel0.sobel._0045_ ),
    .B1(\gray_sobel0.sobel0.sobel._0046_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0047_ ));
 sky130_fd_sc_hd__xor2_1 \gray_sobel0.sobel0.sobel._0603_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[53] ),
    .B(\gray_sobel0.sobel0.sobel._0526_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0048_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._0604_  (.A(\gray_sobel0.sobel0.sobel._0047_ ),
    .B(\gray_sobel0.sobel0.sobel._0048_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0049_ ));
 sky130_fd_sc_hd__nand2_1 \gray_sobel0.sobel0.sobel._0605_  (.A(\gray_sobel0.sobel0.sobel._0047_ ),
    .B(\gray_sobel0.sobel0.sobel._0048_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0050_ ));
 sky130_fd_sc_hd__o21a_1 \gray_sobel0.sobel0.sobel._0606_  (.A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[69] ),
    .A2(\gray_sobel0.sobel0.sobel._0049_ ),
    .B1(\gray_sobel0.sobel0.sobel._0050_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0051_ ));
 sky130_fd_sc_hd__inv_2 \gray_sobel0.sobel0.sobel._0607_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[70] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0052_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._0608_  (.A(\gray_sobel0.sobel0.sobel._0052_ ),
    .B(\gray_sobel0.sobel0.sobel._0014_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0053_ ));
 sky130_fd_sc_hd__and2b_1 \gray_sobel0.sobel0.sobel._0609_  (.A_N(\gray_sobel0.sobel0.sobel._0051_ ),
    .B(\gray_sobel0.sobel0.sobel._0053_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0054_ ));
 sky130_fd_sc_hd__xor2_1 \gray_sobel0.sobel0.sobel._0610_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[69] ),
    .B(\gray_sobel0.sobel0.sobel._0049_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0055_ ));
 sky130_fd_sc_hd__or2_1 \gray_sobel0.sobel0.sobel._0611_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[2] ),
    .B(\gray_sobel0.sobel0.sobel.matrix_pixels_i[18] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0056_ ));
 sky130_fd_sc_hd__xor2_1 \gray_sobel0.sobel0.sobel._0612_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[57] ),
    .B(\gray_sobel0.sobel0.sobel.matrix_pixels_i[9] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0057_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._0613_  (.A(\gray_sobel0.sobel0.sobel._0505_ ),
    .B(\gray_sobel0.sobel0.sobel._0057_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0058_ ));
 sky130_fd_sc_hd__nand2_1 \gray_sobel0.sobel0.sobel._0614_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[2] ),
    .B(\gray_sobel0.sobel0.sobel.matrix_pixels_i[18] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0059_ ));
 sky130_fd_sc_hd__a21bo_1 \gray_sobel0.sobel0.sobel._0615_  (.A1(\gray_sobel0.sobel0.sobel._0056_ ),
    .A2(\gray_sobel0.sobel0.sobel._0058_ ),
    .B1_N(\gray_sobel0.sobel0.sobel._0059_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0060_ ));
 sky130_fd_sc_hd__nand2_1 \gray_sobel0.sobel0.sobel._0616_  (.A(\gray_sobel0.sobel0.sobel._0041_ ),
    .B(\gray_sobel0.sobel0.sobel._0039_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0061_ ));
 sky130_fd_sc_hd__xnor2_2 \gray_sobel0.sobel0.sobel._0617_  (.A(\gray_sobel0.sobel0.sobel._0061_ ),
    .B(\gray_sobel0.sobel0.sobel._0040_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0062_ ));
 sky130_fd_sc_hd__xnor2_2 \gray_sobel0.sobel0.sobel._0618_  (.A(\gray_sobel0.sobel0.sobel._0060_ ),
    .B(\gray_sobel0.sobel0.sobel._0062_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0063_ ));
 sky130_fd_sc_hd__nand2_1 \gray_sobel0.sobel0.sobel._0619_  (.A(\gray_sobel0.sobel0.sobel._0060_ ),
    .B(\gray_sobel0.sobel0.sobel._0062_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0064_ ));
 sky130_fd_sc_hd__o21ai_2 \gray_sobel0.sobel0.sobel._0620_  (.A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[51] ),
    .A2(\gray_sobel0.sobel0.sobel._0063_ ),
    .B1(\gray_sobel0.sobel0.sobel._0064_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0065_ ));
 sky130_fd_sc_hd__xnor2_2 \gray_sobel0.sobel0.sobel._0621_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[52] ),
    .B(\gray_sobel0.sobel0.sobel._0045_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0066_ ));
 sky130_fd_sc_hd__and2_1 \gray_sobel0.sobel0.sobel._0622_  (.A(\gray_sobel0.sobel0.sobel._0065_ ),
    .B(\gray_sobel0.sobel0.sobel._0066_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0067_ ));
 sky130_fd_sc_hd__xnor2_2 \gray_sobel0.sobel0.sobel._0623_  (.A(\gray_sobel0.sobel0.sobel._0065_ ),
    .B(\gray_sobel0.sobel0.sobel._0066_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0068_ ));
 sky130_fd_sc_hd__nor2_1 \gray_sobel0.sobel0.sobel._0624_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[68] ),
    .B(\gray_sobel0.sobel0.sobel._0068_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0069_ ));
 sky130_fd_sc_hd__nor3_1 \gray_sobel0.sobel0.sobel._0625_  (.A(\gray_sobel0.sobel0.sobel._0055_ ),
    .B(\gray_sobel0.sobel0.sobel._0067_ ),
    .C(\gray_sobel0.sobel0.sobel._0069_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0070_ ));
 sky130_fd_sc_hd__inv_2 \gray_sobel0.sobel0.sobel._0626_  (.A(\gray_sobel0.sobel0.sobel._0070_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0071_ ));
 sky130_fd_sc_hd__nand2_1 \gray_sobel0.sobel0.sobel._0627_  (.A(\gray_sobel0.sobel0.sobel._0059_ ),
    .B(\gray_sobel0.sobel0.sobel._0056_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0072_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._0628_  (.A(\gray_sobel0.sobel0.sobel._0072_ ),
    .B(\gray_sobel0.sobel0.sobel._0058_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0073_ ));
 sky130_fd_sc_hd__nor2_1 \gray_sobel0.sobel0.sobel._0629_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[17] ),
    .B(\gray_sobel0.sobel0.sobel.matrix_pixels_i[1] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0074_ ));
 sky130_fd_sc_hd__xor2_1 \gray_sobel0.sobel0.sobel._0630_  (.A(\gray_sobel0.sobel0.sobel._0073_ ),
    .B(\gray_sobel0.sobel0.sobel._0074_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0075_ ));
 sky130_fd_sc_hd__xor2_1 \gray_sobel0.sobel0.sobel._0631_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[50] ),
    .B(\gray_sobel0.sobel0.sobel._0075_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0076_ ));
 sky130_fd_sc_hd__inv_2 \gray_sobel0.sobel0.sobel._0632_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[48] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0077_ ));
 sky130_fd_sc_hd__xor2_1 \gray_sobel0.sobel0.sobel._0633_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[0] ),
    .B(\gray_sobel0.sobel0.sobel.matrix_pixels_i[16] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0078_ ));
 sky130_fd_sc_hd__and2_1 \gray_sobel0.sobel0.sobel._0634_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[0] ),
    .B(\gray_sobel0.sobel0.sobel.matrix_pixels_i[16] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0079_ ));
 sky130_fd_sc_hd__a21oi_1 \gray_sobel0.sobel0.sobel._0635_  (.A1(\gray_sobel0.sobel0.sobel._0077_ ),
    .A2(\gray_sobel0.sobel0.sobel._0078_ ),
    .B1(\gray_sobel0.sobel0.sobel._0079_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0080_ ));
 sky130_fd_sc_hd__and2_1 \gray_sobel0.sobel0.sobel._0636_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[17] ),
    .B(\gray_sobel0.sobel0.sobel.matrix_pixels_i[1] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0081_ ));
 sky130_fd_sc_hd__nor2_1 \gray_sobel0.sobel0.sobel._0637_  (.A(\gray_sobel0.sobel0.sobel._0074_ ),
    .B(\gray_sobel0.sobel0.sobel._0081_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0082_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._0638_  (.A(\gray_sobel0.sobel0.sobel._0080_ ),
    .B(\gray_sobel0.sobel0.sobel._0082_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0083_ ));
 sky130_fd_sc_hd__or2_1 \gray_sobel0.sobel0.sobel._0639_  (.A(\gray_sobel0.sobel0.sobel._0080_ ),
    .B(\gray_sobel0.sobel0.sobel._0082_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0084_ ));
 sky130_fd_sc_hd__o21a_1 \gray_sobel0.sobel0.sobel._0640_  (.A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[49] ),
    .A2(\gray_sobel0.sobel0.sobel._0083_ ),
    .B1(\gray_sobel0.sobel0.sobel._0084_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0085_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._0641_  (.A(\gray_sobel0.sobel0.sobel._0076_ ),
    .B(\gray_sobel0.sobel0.sobel._0085_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0086_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._0642_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[66] ),
    .B(\gray_sobel0.sobel0.sobel._0086_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0087_ ));
 sky130_fd_sc_hd__xor2_1 \gray_sobel0.sobel0.sobel._0643_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[49] ),
    .B(\gray_sobel0.sobel0.sobel._0083_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0088_ ));
 sky130_fd_sc_hd__or2b_1 \gray_sobel0.sobel0.sobel._0644_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[56] ),
    .B_N(\gray_sobel0.sobel0.sobel.matrix_pixels_i[8] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0089_ ));
 sky130_fd_sc_hd__nand2_1 \gray_sobel0.sobel0.sobel._0645_  (.A(\gray_sobel0.sobel0.sobel._0505_ ),
    .B(\gray_sobel0.sobel0.sobel._0089_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0090_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._0646_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[48] ),
    .B(\gray_sobel0.sobel0.sobel._0078_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0091_ ));
 sky130_fd_sc_hd__nor2_1 \gray_sobel0.sobel0.sobel._0647_  (.A(\gray_sobel0.sobel0.sobel._0090_ ),
    .B(\gray_sobel0.sobel0.sobel._0091_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0092_ ));
 sky130_fd_sc_hd__and2_1 \gray_sobel0.sobel0.sobel._0648_  (.A(\gray_sobel0.sobel0.sobel._0090_ ),
    .B(\gray_sobel0.sobel0.sobel._0091_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0093_ ));
 sky130_fd_sc_hd__o21bai_1 \gray_sobel0.sobel0.sobel._0649_  (.A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[64] ),
    .A2(\gray_sobel0.sobel0.sobel._0092_ ),
    .B1_N(\gray_sobel0.sobel0.sobel._0093_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0094_ ));
 sky130_fd_sc_hd__xor2_1 \gray_sobel0.sobel0.sobel._0650_  (.A(\gray_sobel0.sobel0.sobel._0088_ ),
    .B(\gray_sobel0.sobel0.sobel._0094_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0095_ ));
 sky130_fd_sc_hd__and2b_1 \gray_sobel0.sobel0.sobel._0651_  (.A_N(\gray_sobel0.sobel0.sobel.matrix_pixels_i[65] ),
    .B(\gray_sobel0.sobel0.sobel._0095_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0096_ ));
 sky130_fd_sc_hd__a21oi_1 \gray_sobel0.sobel0.sobel._0652_  (.A1(\gray_sobel0.sobel0.sobel._0088_ ),
    .A2(\gray_sobel0.sobel0.sobel._0094_ ),
    .B1(\gray_sobel0.sobel0.sobel._0096_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0097_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._0653_  (.A(\gray_sobel0.sobel0.sobel._0087_ ),
    .B(\gray_sobel0.sobel0.sobel._0097_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0098_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._0654_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[65] ),
    .B(\gray_sobel0.sobel0.sobel._0095_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0099_ ));
 sky130_fd_sc_hd__inv_2 \gray_sobel0.sobel0.sobel._0655_  (.A(\gray_sobel0.sobel0.sobel._0099_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0100_ ));
 sky130_fd_sc_hd__nor2_1 \gray_sobel0.sobel0.sobel._0656_  (.A(\gray_sobel0.sobel0.sobel._0093_ ),
    .B(\gray_sobel0.sobel0.sobel._0092_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0101_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._0657_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[64] ),
    .B(\gray_sobel0.sobel0.sobel._0101_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0102_ ));
 sky130_fd_sc_hd__nand2_1 \gray_sobel0.sobel0.sobel._0658_  (.A(\gray_sobel0.sobel0.sobel._0090_ ),
    .B(\gray_sobel0.sobel0.sobel._0102_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0103_ ));
 sky130_fd_sc_hd__nor2_1 \gray_sobel0.sobel0.sobel._0659_  (.A(\gray_sobel0.sobel0.sobel._0100_ ),
    .B(\gray_sobel0.sobel0.sobel._0103_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0104_ ));
 sky130_fd_sc_hd__and2b_1 \gray_sobel0.sobel0.sobel._0660_  (.A_N(\gray_sobel0.sobel0.sobel._0097_ ),
    .B(\gray_sobel0.sobel0.sobel._0087_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0105_ ));
 sky130_fd_sc_hd__a21o_1 \gray_sobel0.sobel0.sobel._0661_  (.A1(\gray_sobel0.sobel0.sobel._0098_ ),
    .A2(\gray_sobel0.sobel0.sobel._0104_ ),
    .B1(\gray_sobel0.sobel0.sobel._0105_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0106_ ));
 sky130_fd_sc_hd__or2b_1 \gray_sobel0.sobel0.sobel._0662_  (.A(\gray_sobel0.sobel0.sobel._0074_ ),
    .B_N(\gray_sobel0.sobel0.sobel._0073_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0107_ ));
 sky130_fd_sc_hd__o21ai_2 \gray_sobel0.sobel0.sobel._0663_  (.A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[50] ),
    .A2(\gray_sobel0.sobel0.sobel._0075_ ),
    .B1(\gray_sobel0.sobel0.sobel._0107_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0108_ ));
 sky130_fd_sc_hd__xor2_2 \gray_sobel0.sobel0.sobel._0664_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[51] ),
    .B(\gray_sobel0.sobel0.sobel._0063_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0109_ ));
 sky130_fd_sc_hd__xnor2_2 \gray_sobel0.sobel0.sobel._0665_  (.A(\gray_sobel0.sobel0.sobel._0108_ ),
    .B(\gray_sobel0.sobel0.sobel._0109_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0110_ ));
 sky130_fd_sc_hd__xor2_2 \gray_sobel0.sobel0.sobel._0666_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[67] ),
    .B(\gray_sobel0.sobel0.sobel._0110_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0111_ ));
 sky130_fd_sc_hd__inv_2 \gray_sobel0.sobel0.sobel._0667_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[66] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0112_ ));
 sky130_fd_sc_hd__and2b_1 \gray_sobel0.sobel0.sobel._0668_  (.A_N(\gray_sobel0.sobel0.sobel._0085_ ),
    .B(\gray_sobel0.sobel0.sobel._0076_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0113_ ));
 sky130_fd_sc_hd__a21oi_2 \gray_sobel0.sobel0.sobel._0669_  (.A1(\gray_sobel0.sobel0.sobel._0112_ ),
    .A2(\gray_sobel0.sobel0.sobel._0086_ ),
    .B1(\gray_sobel0.sobel0.sobel._0113_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0114_ ));
 sky130_fd_sc_hd__xnor2_2 \gray_sobel0.sobel0.sobel._0670_  (.A(\gray_sobel0.sobel0.sobel._0111_ ),
    .B(\gray_sobel0.sobel0.sobel._0114_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0115_ ));
 sky130_fd_sc_hd__and2b_1 \gray_sobel0.sobel0.sobel._0671_  (.A_N(\gray_sobel0.sobel0.sobel._0114_ ),
    .B(\gray_sobel0.sobel0.sobel._0111_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0116_ ));
 sky130_fd_sc_hd__a21o_1 \gray_sobel0.sobel0.sobel._0672_  (.A1(\gray_sobel0.sobel0.sobel._0106_ ),
    .A2(\gray_sobel0.sobel0.sobel._0115_ ),
    .B1(\gray_sobel0.sobel0.sobel._0116_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0117_ ));
 sky130_fd_sc_hd__inv_2 \gray_sobel0.sobel0.sobel._0673_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[68] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0118_ ));
 sky130_fd_sc_hd__xnor2_2 \gray_sobel0.sobel0.sobel._0674_  (.A(\gray_sobel0.sobel0.sobel._0118_ ),
    .B(\gray_sobel0.sobel0.sobel._0068_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0119_ ));
 sky130_fd_sc_hd__nand2_1 \gray_sobel0.sobel0.sobel._0675_  (.A(\gray_sobel0.sobel0.sobel._0108_ ),
    .B(\gray_sobel0.sobel0.sobel._0109_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0120_ ));
 sky130_fd_sc_hd__o21a_1 \gray_sobel0.sobel0.sobel._0676_  (.A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[67] ),
    .A2(\gray_sobel0.sobel0.sobel._0110_ ),
    .B1(\gray_sobel0.sobel0.sobel._0120_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0121_ ));
 sky130_fd_sc_hd__xnor2_2 \gray_sobel0.sobel0.sobel._0677_  (.A(\gray_sobel0.sobel0.sobel._0119_ ),
    .B(\gray_sobel0.sobel0.sobel._0121_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0122_ ));
 sky130_fd_sc_hd__o21a_1 \gray_sobel0.sobel0.sobel._0678_  (.A1(\gray_sobel0.sobel0.sobel._0067_ ),
    .A2(\gray_sobel0.sobel0.sobel._0069_ ),
    .B1(\gray_sobel0.sobel0.sobel._0055_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0123_ ));
 sky130_fd_sc_hd__and2b_1 \gray_sobel0.sobel0.sobel._0679_  (.A_N(\gray_sobel0.sobel0.sobel._0121_ ),
    .B(\gray_sobel0.sobel0.sobel._0119_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0124_ ));
 sky130_fd_sc_hd__a211o_1 \gray_sobel0.sobel0.sobel._0680_  (.A1(\gray_sobel0.sobel0.sobel._0117_ ),
    .A2(\gray_sobel0.sobel0.sobel._0122_ ),
    .B1(\gray_sobel0.sobel0.sobel._0123_ ),
    .C1(\gray_sobel0.sobel0.sobel._0124_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0125_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._0681_  (.A(\gray_sobel0.sobel0.sobel._0053_ ),
    .B(\gray_sobel0.sobel0.sobel._0051_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0126_ ));
 sky130_fd_sc_hd__and3_1 \gray_sobel0.sobel0.sobel._0682_  (.A(\gray_sobel0.sobel0.sobel._0071_ ),
    .B(\gray_sobel0.sobel0.sobel._0125_ ),
    .C(\gray_sobel0.sobel0.sobel._0126_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0127_ ));
 sky130_fd_sc_hd__nor2_1 \gray_sobel0.sobel0.sobel._0683_  (.A(\gray_sobel0.sobel0.sobel._0054_ ),
    .B(\gray_sobel0.sobel0.sobel._0127_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0128_ ));
 sky130_fd_sc_hd__xnor2_2 \gray_sobel0.sobel0.sobel._0684_  (.A(\gray_sobel0.sobel0.sobel._0037_ ),
    .B(\gray_sobel0.sobel0.sobel._0128_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0129_ ));
 sky130_fd_sc_hd__inv_2 \gray_sobel0.sobel0.sobel._0685_  (.A(\gray_sobel0.sobel0.sobel._0016_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0130_ ));
 sky130_fd_sc_hd__inv_2 \gray_sobel0.sobel0.sobel._0686_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[55] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0131_ ));
 sky130_fd_sc_hd__and2b_1 \gray_sobel0.sobel0.sobel._0687_  (.A_N(\gray_sobel0.sobel0.sobel.matrix_pixels_i[15] ),
    .B(\gray_sobel0.sobel0.sobel.matrix_pixels_i[63] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0132_ ));
 sky130_fd_sc_hd__and2b_1 \gray_sobel0.sobel0.sobel._0688_  (.A_N(\gray_sobel0.sobel0.sobel.matrix_pixels_i[63] ),
    .B(\gray_sobel0.sobel0.sobel.matrix_pixels_i[15] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0133_ ));
 sky130_fd_sc_hd__nor2_1 \gray_sobel0.sobel0.sobel._0689_  (.A(\gray_sobel0.sobel0.sobel._0132_ ),
    .B(\gray_sobel0.sobel0.sobel._0133_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0134_ ));
 sky130_fd_sc_hd__a21oi_2 \gray_sobel0.sobel0.sobel._0690_  (.A1(\gray_sobel0.sobel0.sobel._0025_ ),
    .A2(\gray_sobel0.sobel0.sobel._0028_ ),
    .B1(\gray_sobel0.sobel0.sobel._0024_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0135_ ));
 sky130_fd_sc_hd__xor2_2 \gray_sobel0.sobel0.sobel._0691_  (.A(\gray_sobel0.sobel0.sobel._0134_ ),
    .B(\gray_sobel0.sobel0.sobel._0135_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0136_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._0692_  (.A(\gray_sobel0.sobel0.sobel._0023_ ),
    .B(\gray_sobel0.sobel0.sobel._0136_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0137_ ));
 sky130_fd_sc_hd__a21boi_1 \gray_sobel0.sobel0.sobel._0693_  (.A1(\gray_sobel0.sobel0.sobel._0021_ ),
    .A2(\gray_sobel0.sobel0.sobel._0029_ ),
    .B1_N(\gray_sobel0.sobel0.sobel._0022_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0138_ ));
 sky130_fd_sc_hd__xor2_1 \gray_sobel0.sobel0.sobel._0694_  (.A(\gray_sobel0.sobel0.sobel._0137_ ),
    .B(\gray_sobel0.sobel0.sobel._0138_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0139_ ));
 sky130_fd_sc_hd__nor2_1 \gray_sobel0.sobel0.sobel._0695_  (.A(\gray_sobel0.sobel0.sobel._0137_ ),
    .B(\gray_sobel0.sobel0.sobel._0138_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0140_ ));
 sky130_fd_sc_hd__a21o_1 \gray_sobel0.sobel0.sobel._0696_  (.A1(\gray_sobel0.sobel0.sobel._0131_ ),
    .A2(\gray_sobel0.sobel0.sobel._0139_ ),
    .B1(\gray_sobel0.sobel0.sobel._0140_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0141_ ));
 sky130_fd_sc_hd__o21ai_1 \gray_sobel0.sobel0.sobel._0697_  (.A1(\gray_sobel0.sobel0.sobel._0023_ ),
    .A2(\gray_sobel0.sobel0.sobel._0136_ ),
    .B1(\gray_sobel0.sobel0.sobel._0022_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0142_ ));
 sky130_fd_sc_hd__a21oi_1 \gray_sobel0.sobel0.sobel._0698_  (.A1(\gray_sobel0.sobel0.sobel._0134_ ),
    .A2(\gray_sobel0.sobel0.sobel._0135_ ),
    .B1(\gray_sobel0.sobel0.sobel._0133_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0143_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._0699_  (.A(\gray_sobel0.sobel0.sobel._0023_ ),
    .B(\gray_sobel0.sobel0.sobel._0143_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0144_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._0700_  (.A(\gray_sobel0.sobel0.sobel._0142_ ),
    .B(\gray_sobel0.sobel0.sobel._0144_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0145_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._0701_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[55] ),
    .B(\gray_sobel0.sobel0.sobel._0145_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0146_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._0702_  (.A(\gray_sobel0.sobel0.sobel._0141_ ),
    .B(\gray_sobel0.sobel0.sobel._0146_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0147_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._0703_  (.A(\gray_sobel0.sobel0.sobel._0130_ ),
    .B(\gray_sobel0.sobel0.sobel._0147_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0148_ ));
 sky130_fd_sc_hd__and2_1 \gray_sobel0.sobel0.sobel._0704_  (.A(\gray_sobel0.sobel0.sobel._0020_ ),
    .B(\gray_sobel0.sobel0.sobel._0030_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0149_ ));
 sky130_fd_sc_hd__a21oi_1 \gray_sobel0.sobel0.sobel._0705_  (.A1(\gray_sobel0.sobel0.sobel._0131_ ),
    .A2(\gray_sobel0.sobel0.sobel._0031_ ),
    .B1(\gray_sobel0.sobel0.sobel._0149_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0150_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._0706_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[55] ),
    .B(\gray_sobel0.sobel0.sobel._0139_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0151_ ));
 sky130_fd_sc_hd__and2b_1 \gray_sobel0.sobel0.sobel._0707_  (.A_N(\gray_sobel0.sobel0.sobel._0150_ ),
    .B(\gray_sobel0.sobel0.sobel._0151_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0152_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._0708_  (.A(\gray_sobel0.sobel0.sobel._0151_ ),
    .B(\gray_sobel0.sobel0.sobel._0150_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0153_ ));
 sky130_fd_sc_hd__and2_1 \gray_sobel0.sobel0.sobel._0709_  (.A(\gray_sobel0.sobel0.sobel._0130_ ),
    .B(\gray_sobel0.sobel0.sobel._0153_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0154_ ));
 sky130_fd_sc_hd__nor3_1 \gray_sobel0.sobel0.sobel._0710_  (.A(\gray_sobel0.sobel0.sobel._0148_ ),
    .B(\gray_sobel0.sobel0.sobel._0152_ ),
    .C(\gray_sobel0.sobel0.sobel._0154_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0155_ ));
 sky130_fd_sc_hd__nand2_1 \gray_sobel0.sobel0.sobel._0711_  (.A(\gray_sobel0.sobel0.sobel._0141_ ),
    .B(\gray_sobel0.sobel0.sobel._0146_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0156_ ));
 sky130_fd_sc_hd__o21a_1 \gray_sobel0.sobel0.sobel._0712_  (.A1(\gray_sobel0.sobel0.sobel._0016_ ),
    .A2(\gray_sobel0.sobel0.sobel._0147_ ),
    .B1(\gray_sobel0.sobel0.sobel._0156_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0157_ ));
 sky130_fd_sc_hd__and2b_1 \gray_sobel0.sobel0.sobel._0713_  (.A_N(\gray_sobel0.sobel0.sobel._0144_ ),
    .B(\gray_sobel0.sobel0.sobel._0142_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0158_ ));
 sky130_fd_sc_hd__or2_1 \gray_sobel0.sobel0.sobel._0714_  (.A(\gray_sobel0.sobel0.sobel._0023_ ),
    .B(\gray_sobel0.sobel0.sobel._0136_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0159_ ));
 sky130_fd_sc_hd__a31o_1 \gray_sobel0.sobel0.sobel._0715_  (.A1(\gray_sobel0.sobel0.sobel._0022_ ),
    .A2(\gray_sobel0.sobel0.sobel._0159_ ),
    .A3(\gray_sobel0.sobel0.sobel._0144_ ),
    .B1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[55] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0160_ ));
 sky130_fd_sc_hd__o21a_1 \gray_sobel0.sobel0.sobel._0716_  (.A1(\gray_sobel0.sobel0.sobel._0131_ ),
    .A2(\gray_sobel0.sobel0.sobel._0158_ ),
    .B1(\gray_sobel0.sobel0.sobel._0160_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0161_ ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0.sobel0.sobel._0717_  (.A0(\gray_sobel0.sobel0.sobel._0022_ ),
    .A1(\gray_sobel0.sobel0.sobel._0021_ ),
    .S(\gray_sobel0.sobel0.sobel._0143_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0162_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._0718_  (.A(\gray_sobel0.sobel0.sobel._0016_ ),
    .B(\gray_sobel0.sobel0.sobel._0162_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0163_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._0719_  (.A(\gray_sobel0.sobel0.sobel._0161_ ),
    .B(\gray_sobel0.sobel0.sobel._0163_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0164_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._0720_  (.A(\gray_sobel0.sobel0.sobel._0157_ ),
    .B(\gray_sobel0.sobel0.sobel._0164_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0165_ ));
 sky130_fd_sc_hd__inv_2 \gray_sobel0.sobel0.sobel._0721_  (.A(\gray_sobel0.sobel0.sobel._0036_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0166_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._0722_  (.A(\gray_sobel0.sobel0.sobel._0016_ ),
    .B(\gray_sobel0.sobel0.sobel._0153_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0167_ ));
 sky130_fd_sc_hd__and2_1 \gray_sobel0.sobel0.sobel._0723_  (.A(\gray_sobel0.sobel0.sobel._0019_ ),
    .B(\gray_sobel0.sobel0.sobel._0032_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0168_ ));
 sky130_fd_sc_hd__a21oi_1 \gray_sobel0.sobel0.sobel._0724_  (.A1(\gray_sobel0.sobel0.sobel._0130_ ),
    .A2(\gray_sobel0.sobel0.sobel._0033_ ),
    .B1(\gray_sobel0.sobel0.sobel._0168_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0169_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._0725_  (.A(\gray_sobel0.sobel0.sobel._0167_ ),
    .B(\gray_sobel0.sobel0.sobel._0169_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0170_ ));
 sky130_fd_sc_hd__a311o_1 \gray_sobel0.sobel0.sobel._0726_  (.A1(\gray_sobel0.sobel0.sobel._0071_ ),
    .A2(\gray_sobel0.sobel0.sobel._0125_ ),
    .A3(\gray_sobel0.sobel0.sobel._0126_ ),
    .B1(\gray_sobel0.sobel0.sobel._0054_ ),
    .C1(\gray_sobel0.sobel0.sobel._0035_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0171_ ));
 sky130_fd_sc_hd__o21a_1 \gray_sobel0.sobel0.sobel._0727_  (.A1(\gray_sobel0.sobel0.sobel._0152_ ),
    .A2(\gray_sobel0.sobel0.sobel._0154_ ),
    .B1(\gray_sobel0.sobel0.sobel._0148_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0172_ ));
 sky130_fd_sc_hd__and2b_1 \gray_sobel0.sobel0.sobel._0728_  (.A_N(\gray_sobel0.sobel0.sobel._0169_ ),
    .B(\gray_sobel0.sobel0.sobel._0167_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0173_ ));
 sky130_fd_sc_hd__a311o_1 \gray_sobel0.sobel0.sobel._0729_  (.A1(\gray_sobel0.sobel0.sobel._0166_ ),
    .A2(\gray_sobel0.sobel0.sobel._0170_ ),
    .A3(\gray_sobel0.sobel0.sobel._0171_ ),
    .B1(\gray_sobel0.sobel0.sobel._0172_ ),
    .C1(\gray_sobel0.sobel0.sobel._0173_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0174_ ));
 sky130_fd_sc_hd__or3b_2 \gray_sobel0.sobel0.sobel._0730_  (.A(\gray_sobel0.sobel0.sobel._0155_ ),
    .B(\gray_sobel0.sobel0.sobel._0165_ ),
    .C_N(\gray_sobel0.sobel0.sobel._0174_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0175_ ));
 sky130_fd_sc_hd__inv_2 \gray_sobel0.sobel0.sobel._0731_  (.A(\gray_sobel0.sobel0.sobel._0155_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0176_ ));
 sky130_fd_sc_hd__a21bo_1 \gray_sobel0.sobel0.sobel._0732_  (.A1(\gray_sobel0.sobel0.sobel._0176_ ),
    .A2(\gray_sobel0.sobel0.sobel._0174_ ),
    .B1_N(\gray_sobel0.sobel0.sobel._0165_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0177_ ));
 sky130_fd_sc_hd__and2_1 \gray_sobel0.sobel0.sobel._0733_  (.A(\gray_sobel0.sobel0.sobel._0175_ ),
    .B(\gray_sobel0.sobel0.sobel._0177_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0178_ ));
 sky130_fd_sc_hd__clkbuf_2 \gray_sobel0.sobel0.sobel._0734_  (.A(\gray_sobel0.sobel0.sobel._0178_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0179_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._0735_  (.A(\gray_sobel0.sobel0.sobel._0098_ ),
    .B(\gray_sobel0.sobel0.sobel._0104_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0180_ ));
 sky130_fd_sc_hd__or2_1 \gray_sobel0.sobel0.sobel._0736_  (.A(\gray_sobel0.sobel0.sobel._0090_ ),
    .B(\gray_sobel0.sobel0.sobel._0102_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0181_ ));
 sky130_fd_sc_hd__and2_1 \gray_sobel0.sobel0.sobel._0737_  (.A(\gray_sobel0.sobel0.sobel._0103_ ),
    .B(\gray_sobel0.sobel0.sobel._0181_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0182_ ));
 sky130_fd_sc_hd__clkbuf_2 \gray_sobel0.sobel0.sobel._0738_  (.A(\gray_sobel0.sobel0.sobel._0182_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0183_ ));
 sky130_fd_sc_hd__and2_1 \gray_sobel0.sobel0.sobel._0739_  (.A(\gray_sobel0.sobel0.sobel._0100_ ),
    .B(\gray_sobel0.sobel0.sobel._0103_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0184_ ));
 sky130_fd_sc_hd__nor2_1 \gray_sobel0.sobel0.sobel._0740_  (.A(\gray_sobel0.sobel0.sobel._0104_ ),
    .B(\gray_sobel0.sobel0.sobel._0184_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0185_ ));
 sky130_fd_sc_hd__nor2_1 \gray_sobel0.sobel0.sobel._0741_  (.A(\gray_sobel0.sobel0.sobel._0183_ ),
    .B(\gray_sobel0.sobel0.sobel._0185_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0186_ ));
 sky130_fd_sc_hd__nand2_1 \gray_sobel0.sobel0.sobel._0742_  (.A(\gray_sobel0.sobel0.sobel._0180_ ),
    .B(\gray_sobel0.sobel0.sobel._0186_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0187_ ));
 sky130_fd_sc_hd__xor2_2 \gray_sobel0.sobel0.sobel._0743_  (.A(\gray_sobel0.sobel0.sobel._0106_ ),
    .B(\gray_sobel0.sobel0.sobel._0115_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0188_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._0744_  (.A(\gray_sobel0.sobel0.sobel._0117_ ),
    .B(\gray_sobel0.sobel0.sobel._0122_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0189_ ));
 sky130_fd_sc_hd__or3b_1 \gray_sobel0.sobel0.sobel._0745_  (.A(\gray_sobel0.sobel0.sobel._0187_ ),
    .B(\gray_sobel0.sobel0.sobel._0188_ ),
    .C_N(\gray_sobel0.sobel0.sobel._0189_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0190_ ));
 sky130_fd_sc_hd__a21oi_1 \gray_sobel0.sobel0.sobel._0746_  (.A1(\gray_sobel0.sobel0.sobel._0117_ ),
    .A2(\gray_sobel0.sobel0.sobel._0122_ ),
    .B1(\gray_sobel0.sobel0.sobel._0124_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0191_ ));
 sky130_fd_sc_hd__nor2_1 \gray_sobel0.sobel0.sobel._0747_  (.A(\gray_sobel0.sobel0.sobel._0123_ ),
    .B(\gray_sobel0.sobel0.sobel._0070_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0192_ ));
 sky130_fd_sc_hd__xnor2_2 \gray_sobel0.sobel0.sobel._0748_  (.A(\gray_sobel0.sobel0.sobel._0191_ ),
    .B(\gray_sobel0.sobel0.sobel._0192_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0193_ ));
 sky130_fd_sc_hd__a21oi_1 \gray_sobel0.sobel0.sobel._0749_  (.A1(\gray_sobel0.sobel0.sobel._0071_ ),
    .A2(\gray_sobel0.sobel0.sobel._0125_ ),
    .B1(\gray_sobel0.sobel0.sobel._0126_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0194_ ));
 sky130_fd_sc_hd__or2_1 \gray_sobel0.sobel0.sobel._0750_  (.A(\gray_sobel0.sobel0.sobel._0127_ ),
    .B(\gray_sobel0.sobel0.sobel._0194_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0195_ ));
 sky130_fd_sc_hd__or3b_1 \gray_sobel0.sobel0.sobel._0751_  (.A(\gray_sobel0.sobel0.sobel._0190_ ),
    .B(\gray_sobel0.sobel0.sobel._0193_ ),
    .C_N(\gray_sobel0.sobel0.sobel._0195_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0196_ ));
 sky130_fd_sc_hd__nand2_1 \gray_sobel0.sobel0.sobel._0752_  (.A(\gray_sobel0.sobel0.sobel._0179_ ),
    .B(\gray_sobel0.sobel0.sobel._0196_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0197_ ));
 sky130_fd_sc_hd__xor2_2 \gray_sobel0.sobel0.sobel._0753_  (.A(\gray_sobel0.sobel0.sobel._0129_ ),
    .B(\gray_sobel0.sobel0.sobel._0197_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0198_ ));
 sky130_fd_sc_hd__or2_1 \gray_sobel0.sobel0.sobel._0754_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[4] ),
    .B(\gray_sobel0.sobel0.sobel.matrix_pixels_i[52] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0199_ ));
 sky130_fd_sc_hd__and2b_1 \gray_sobel0.sobel0.sobel._0755_  (.A_N(\gray_sobel0.sobel0.sobel.matrix_pixels_i[42] ),
    .B(\gray_sobel0.sobel0.sobel.matrix_pixels_i[26] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0200_ ));
 sky130_fd_sc_hd__and2b_1 \gray_sobel0.sobel0.sobel._0756_  (.A_N(\gray_sobel0.sobel0.sobel.matrix_pixels_i[26] ),
    .B(\gray_sobel0.sobel0.sobel.matrix_pixels_i[42] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0201_ ));
 sky130_fd_sc_hd__nor2_1 \gray_sobel0.sobel0.sobel._0757_  (.A(\gray_sobel0.sobel0.sobel._0200_ ),
    .B(\gray_sobel0.sobel0.sobel._0201_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0202_ ));
 sky130_fd_sc_hd__nand2b_1 \gray_sobel0.sobel0.sobel._0758_  (.A_N(\gray_sobel0.sobel0.sobel.matrix_pixels_i[24] ),
    .B(\gray_sobel0.sobel0.sobel.matrix_pixels_i[40] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0203_ ));
 sky130_fd_sc_hd__or2b_1 \gray_sobel0.sobel0.sobel._0759_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[25] ),
    .B_N(\gray_sobel0.sobel0.sobel.matrix_pixels_i[41] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0204_ ));
 sky130_fd_sc_hd__and2b_1 \gray_sobel0.sobel0.sobel._0760_  (.A_N(\gray_sobel0.sobel0.sobel.matrix_pixels_i[41] ),
    .B(\gray_sobel0.sobel0.sobel.matrix_pixels_i[25] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0205_ ));
 sky130_fd_sc_hd__a21o_1 \gray_sobel0.sobel0.sobel._0761_  (.A1(\gray_sobel0.sobel0.sobel._0203_ ),
    .A2(\gray_sobel0.sobel0.sobel._0204_ ),
    .B1(\gray_sobel0.sobel0.sobel._0205_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0206_ ));
 sky130_fd_sc_hd__a21oi_1 \gray_sobel0.sobel0.sobel._0762_  (.A1(\gray_sobel0.sobel0.sobel._0202_ ),
    .A2(\gray_sobel0.sobel0.sobel._0206_ ),
    .B1(\gray_sobel0.sobel0.sobel._0200_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0207_ ));
 sky130_fd_sc_hd__and2b_1 \gray_sobel0.sobel0.sobel._0763_  (.A_N(\gray_sobel0.sobel0.sobel.matrix_pixels_i[27] ),
    .B(\gray_sobel0.sobel0.sobel.matrix_pixels_i[43] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0208_ ));
 sky130_fd_sc_hd__and2b_1 \gray_sobel0.sobel0.sobel._0764_  (.A_N(\gray_sobel0.sobel0.sobel.matrix_pixels_i[43] ),
    .B(\gray_sobel0.sobel0.sobel.matrix_pixels_i[27] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0209_ ));
 sky130_fd_sc_hd__nor2_1 \gray_sobel0.sobel0.sobel._0765_  (.A(\gray_sobel0.sobel0.sobel._0208_ ),
    .B(\gray_sobel0.sobel0.sobel._0209_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0210_ ));
 sky130_fd_sc_hd__xnor2_2 \gray_sobel0.sobel0.sobel._0766_  (.A(\gray_sobel0.sobel0.sobel._0207_ ),
    .B(\gray_sobel0.sobel0.sobel._0210_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0211_ ));
 sky130_fd_sc_hd__nand2_1 \gray_sobel0.sobel0.sobel._0767_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[4] ),
    .B(\gray_sobel0.sobel0.sobel.matrix_pixels_i[52] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0212_ ));
 sky130_fd_sc_hd__a21bo_1 \gray_sobel0.sobel0.sobel._0768_  (.A1(\gray_sobel0.sobel0.sobel._0199_ ),
    .A2(\gray_sobel0.sobel0.sobel._0211_ ),
    .B1_N(\gray_sobel0.sobel0.sobel._0212_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0213_ ));
 sky130_fd_sc_hd__nand2_1 \gray_sobel0.sobel0.sobel._0769_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[5] ),
    .B(\gray_sobel0.sobel0.sobel.matrix_pixels_i[53] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0214_ ));
 sky130_fd_sc_hd__or2_1 \gray_sobel0.sobel0.sobel._0770_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[5] ),
    .B(\gray_sobel0.sobel0.sobel.matrix_pixels_i[53] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0215_ ));
 sky130_fd_sc_hd__nand2_1 \gray_sobel0.sobel0.sobel._0771_  (.A(\gray_sobel0.sobel0.sobel._0214_ ),
    .B(\gray_sobel0.sobel0.sobel._0215_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0216_ ));
 sky130_fd_sc_hd__and2b_1 \gray_sobel0.sobel0.sobel._0772_  (.A_N(\gray_sobel0.sobel0.sobel.matrix_pixels_i[44] ),
    .B(\gray_sobel0.sobel0.sobel.matrix_pixels_i[28] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0217_ ));
 sky130_fd_sc_hd__and2b_1 \gray_sobel0.sobel0.sobel._0773_  (.A_N(\gray_sobel0.sobel0.sobel.matrix_pixels_i[28] ),
    .B(\gray_sobel0.sobel0.sobel.matrix_pixels_i[44] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0218_ ));
 sky130_fd_sc_hd__nor2_2 \gray_sobel0.sobel0.sobel._0774_  (.A(\gray_sobel0.sobel0.sobel._0217_ ),
    .B(\gray_sobel0.sobel0.sobel._0218_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0219_ ));
 sky130_fd_sc_hd__nor3b_1 \gray_sobel0.sobel0.sobel._0775_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[42] ),
    .B(\gray_sobel0.sobel0.sobel._0208_ ),
    .C_N(\gray_sobel0.sobel0.sobel.matrix_pixels_i[26] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0220_ ));
 sky130_fd_sc_hd__a311o_2 \gray_sobel0.sobel0.sobel._0776_  (.A1(\gray_sobel0.sobel0.sobel._0202_ ),
    .A2(\gray_sobel0.sobel0.sobel._0206_ ),
    .A3(\gray_sobel0.sobel0.sobel._0210_ ),
    .B1(\gray_sobel0.sobel0.sobel._0220_ ),
    .C1(\gray_sobel0.sobel0.sobel._0209_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0221_ ));
 sky130_fd_sc_hd__xor2_2 \gray_sobel0.sobel0.sobel._0777_  (.A(\gray_sobel0.sobel0.sobel._0219_ ),
    .B(\gray_sobel0.sobel0.sobel._0221_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0222_ ));
 sky130_fd_sc_hd__xnor2_2 \gray_sobel0.sobel0.sobel._0778_  (.A(\gray_sobel0.sobel0.sobel._0216_ ),
    .B(\gray_sobel0.sobel0.sobel._0222_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0223_ ));
 sky130_fd_sc_hd__xnor2_2 \gray_sobel0.sobel0.sobel._0779_  (.A(\gray_sobel0.sobel0.sobel._0213_ ),
    .B(\gray_sobel0.sobel0.sobel._0223_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0224_ ));
 sky130_fd_sc_hd__nand2_1 \gray_sobel0.sobel0.sobel._0780_  (.A(\gray_sobel0.sobel0.sobel._0213_ ),
    .B(\gray_sobel0.sobel0.sobel._0223_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0225_ ));
 sky130_fd_sc_hd__o21ai_2 \gray_sobel0.sobel0.sobel._0781_  (.A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[69] ),
    .A2(\gray_sobel0.sobel0.sobel._0224_ ),
    .B1(\gray_sobel0.sobel0.sobel._0225_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0226_ ));
 sky130_fd_sc_hd__a21boi_1 \gray_sobel0.sobel0.sobel._0782_  (.A1(\gray_sobel0.sobel0.sobel._0215_ ),
    .A2(\gray_sobel0.sobel0.sobel._0222_ ),
    .B1_N(\gray_sobel0.sobel0.sobel._0214_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0227_ ));
 sky130_fd_sc_hd__nand2_1 \gray_sobel0.sobel0.sobel._0783_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[6] ),
    .B(\gray_sobel0.sobel0.sobel.matrix_pixels_i[54] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0228_ ));
 sky130_fd_sc_hd__or2_1 \gray_sobel0.sobel0.sobel._0784_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[6] ),
    .B(\gray_sobel0.sobel0.sobel.matrix_pixels_i[54] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0229_ ));
 sky130_fd_sc_hd__nand2_1 \gray_sobel0.sobel0.sobel._0785_  (.A(\gray_sobel0.sobel0.sobel._0228_ ),
    .B(\gray_sobel0.sobel0.sobel._0229_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0230_ ));
 sky130_fd_sc_hd__and2b_1 \gray_sobel0.sobel0.sobel._0786_  (.A_N(\gray_sobel0.sobel0.sobel.matrix_pixels_i[45] ),
    .B(\gray_sobel0.sobel0.sobel.matrix_pixels_i[29] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0231_ ));
 sky130_fd_sc_hd__or2b_1 \gray_sobel0.sobel0.sobel._0787_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[29] ),
    .B_N(\gray_sobel0.sobel0.sobel.matrix_pixels_i[45] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0232_ ));
 sky130_fd_sc_hd__or2b_1 \gray_sobel0.sobel0.sobel._0788_  (.A(\gray_sobel0.sobel0.sobel._0231_ ),
    .B_N(\gray_sobel0.sobel0.sobel._0232_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0233_ ));
 sky130_fd_sc_hd__a21oi_1 \gray_sobel0.sobel0.sobel._0789_  (.A1(\gray_sobel0.sobel0.sobel._0219_ ),
    .A2(\gray_sobel0.sobel0.sobel._0221_ ),
    .B1(\gray_sobel0.sobel0.sobel._0217_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0234_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._0790_  (.A(\gray_sobel0.sobel0.sobel._0233_ ),
    .B(\gray_sobel0.sobel0.sobel._0234_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0235_ ));
 sky130_fd_sc_hd__xor2_1 \gray_sobel0.sobel0.sobel._0791_  (.A(\gray_sobel0.sobel0.sobel._0230_ ),
    .B(\gray_sobel0.sobel0.sobel._0235_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0236_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._0792_  (.A(\gray_sobel0.sobel0.sobel._0227_ ),
    .B(\gray_sobel0.sobel0.sobel._0236_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0237_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._0793_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[70] ),
    .B(\gray_sobel0.sobel0.sobel._0237_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0238_ ));
 sky130_fd_sc_hd__and2_1 \gray_sobel0.sobel0.sobel._0794_  (.A(\gray_sobel0.sobel0.sobel._0226_ ),
    .B(\gray_sobel0.sobel0.sobel._0238_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0239_ ));
 sky130_fd_sc_hd__xnor2_2 \gray_sobel0.sobel0.sobel._0795_  (.A(\gray_sobel0.sobel0.sobel._0226_ ),
    .B(\gray_sobel0.sobel0.sobel._0238_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0240_ ));
 sky130_fd_sc_hd__nor2_1 \gray_sobel0.sobel0.sobel._0796_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[22] ),
    .B(\gray_sobel0.sobel0.sobel._0240_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0241_ ));
 sky130_fd_sc_hd__and2b_1 \gray_sobel0.sobel0.sobel._0797_  (.A_N(\gray_sobel0.sobel0.sobel._0227_ ),
    .B(\gray_sobel0.sobel0.sobel._0236_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0242_ ));
 sky130_fd_sc_hd__a21o_1 \gray_sobel0.sobel0.sobel._0798_  (.A1(\gray_sobel0.sobel0.sobel._0052_ ),
    .A2(\gray_sobel0.sobel0.sobel._0237_ ),
    .B1(\gray_sobel0.sobel0.sobel._0242_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0243_ ));
 sky130_fd_sc_hd__o21ai_1 \gray_sobel0.sobel0.sobel._0799_  (.A1(\gray_sobel0.sobel0.sobel._0230_ ),
    .A2(\gray_sobel0.sobel0.sobel._0235_ ),
    .B1(\gray_sobel0.sobel0.sobel._0228_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0244_ ));
 sky130_fd_sc_hd__or2_1 \gray_sobel0.sobel0.sobel._0800_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[55] ),
    .B(\gray_sobel0.sobel0.sobel.matrix_pixels_i[7] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0245_ ));
 sky130_fd_sc_hd__nand2_1 \gray_sobel0.sobel0.sobel._0801_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[55] ),
    .B(\gray_sobel0.sobel0.sobel.matrix_pixels_i[7] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0246_ ));
 sky130_fd_sc_hd__nand2_2 \gray_sobel0.sobel0.sobel._0802_  (.A(\gray_sobel0.sobel0.sobel._0245_ ),
    .B(\gray_sobel0.sobel0.sobel._0246_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0247_ ));
 sky130_fd_sc_hd__and2b_1 \gray_sobel0.sobel0.sobel._0803_  (.A_N(\gray_sobel0.sobel0.sobel.matrix_pixels_i[46] ),
    .B(\gray_sobel0.sobel0.sobel.matrix_pixels_i[30] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0248_ ));
 sky130_fd_sc_hd__or2b_1 \gray_sobel0.sobel0.sobel._0804_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[30] ),
    .B_N(\gray_sobel0.sobel0.sobel.matrix_pixels_i[46] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0249_ ));
 sky130_fd_sc_hd__or2b_1 \gray_sobel0.sobel0.sobel._0805_  (.A(\gray_sobel0.sobel0.sobel._0248_ ),
    .B_N(\gray_sobel0.sobel0.sobel._0249_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0250_ ));
 sky130_fd_sc_hd__and3b_1 \gray_sobel0.sobel0.sobel._0806_  (.A_N(\gray_sobel0.sobel0.sobel.matrix_pixels_i[44] ),
    .B(\gray_sobel0.sobel0.sobel.matrix_pixels_i[28] ),
    .C(\gray_sobel0.sobel0.sobel._0232_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0251_ ));
 sky130_fd_sc_hd__a311o_1 \gray_sobel0.sobel0.sobel._0807_  (.A1(\gray_sobel0.sobel0.sobel._0219_ ),
    .A2(\gray_sobel0.sobel0.sobel._0221_ ),
    .A3(\gray_sobel0.sobel0.sobel._0232_ ),
    .B1(\gray_sobel0.sobel0.sobel._0251_ ),
    .C1(\gray_sobel0.sobel0.sobel._0231_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0252_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._0808_  (.A(\gray_sobel0.sobel0.sobel._0250_ ),
    .B(\gray_sobel0.sobel0.sobel._0252_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0253_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._0809_  (.A(\gray_sobel0.sobel0.sobel._0247_ ),
    .B(\gray_sobel0.sobel0.sobel._0253_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0254_ ));
 sky130_fd_sc_hd__xor2_1 \gray_sobel0.sobel0.sobel._0810_  (.A(\gray_sobel0.sobel0.sobel._0244_ ),
    .B(\gray_sobel0.sobel0.sobel._0254_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0255_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._0811_  (.A(\gray_sobel0.sobel0.sobel._0016_ ),
    .B(\gray_sobel0.sobel0.sobel._0255_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0256_ ));
 sky130_fd_sc_hd__xor2_1 \gray_sobel0.sobel0.sobel._0812_  (.A(\gray_sobel0.sobel0.sobel._0243_ ),
    .B(\gray_sobel0.sobel0.sobel._0256_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0257_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._0813_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[23] ),
    .B(\gray_sobel0.sobel0.sobel._0257_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0258_ ));
 sky130_fd_sc_hd__o21ai_2 \gray_sobel0.sobel0.sobel._0814_  (.A1(\gray_sobel0.sobel0.sobel._0239_ ),
    .A2(\gray_sobel0.sobel0.sobel._0241_ ),
    .B1(\gray_sobel0.sobel0.sobel._0258_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0259_ ));
 sky130_fd_sc_hd__nor3_1 \gray_sobel0.sobel0.sobel._0815_  (.A(\gray_sobel0.sobel0.sobel._0258_ ),
    .B(\gray_sobel0.sobel0.sobel._0239_ ),
    .C(\gray_sobel0.sobel0.sobel._0241_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0260_ ));
 sky130_fd_sc_hd__inv_2 \gray_sobel0.sobel0.sobel._0816_  (.A(\gray_sobel0.sobel0.sobel._0260_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0261_ ));
 sky130_fd_sc_hd__nand2_1 \gray_sobel0.sobel0.sobel._0817_  (.A(\gray_sobel0.sobel0.sobel._0259_ ),
    .B(\gray_sobel0.sobel0.sobel._0261_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0262_ ));
 sky130_fd_sc_hd__or2_1 \gray_sobel0.sobel0.sobel._0818_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[3] ),
    .B(\gray_sobel0.sobel0.sobel.matrix_pixels_i[51] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0263_ ));
 sky130_fd_sc_hd__xor2_2 \gray_sobel0.sobel0.sobel._0819_  (.A(\gray_sobel0.sobel0.sobel._0202_ ),
    .B(\gray_sobel0.sobel0.sobel._0206_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0264_ ));
 sky130_fd_sc_hd__nand2_1 \gray_sobel0.sobel0.sobel._0820_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[3] ),
    .B(\gray_sobel0.sobel0.sobel.matrix_pixels_i[51] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0265_ ));
 sky130_fd_sc_hd__a21boi_2 \gray_sobel0.sobel0.sobel._0821_  (.A1(\gray_sobel0.sobel0.sobel._0263_ ),
    .A2(\gray_sobel0.sobel0.sobel._0264_ ),
    .B1_N(\gray_sobel0.sobel0.sobel._0265_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0266_ ));
 sky130_fd_sc_hd__nand2_1 \gray_sobel0.sobel0.sobel._0822_  (.A(\gray_sobel0.sobel0.sobel._0212_ ),
    .B(\gray_sobel0.sobel0.sobel._0199_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0267_ ));
 sky130_fd_sc_hd__xnor2_2 \gray_sobel0.sobel0.sobel._0823_  (.A(\gray_sobel0.sobel0.sobel._0267_ ),
    .B(\gray_sobel0.sobel0.sobel._0211_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0268_ ));
 sky130_fd_sc_hd__xnor2_2 \gray_sobel0.sobel0.sobel._0824_  (.A(\gray_sobel0.sobel0.sobel._0266_ ),
    .B(\gray_sobel0.sobel0.sobel._0268_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0269_ ));
 sky130_fd_sc_hd__and2b_1 \gray_sobel0.sobel0.sobel._0825_  (.A_N(\gray_sobel0.sobel0.sobel._0266_ ),
    .B(\gray_sobel0.sobel0.sobel._0268_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0270_ ));
 sky130_fd_sc_hd__a21o_1 \gray_sobel0.sobel0.sobel._0826_  (.A1(\gray_sobel0.sobel0.sobel._0118_ ),
    .A2(\gray_sobel0.sobel0.sobel._0269_ ),
    .B1(\gray_sobel0.sobel0.sobel._0270_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0271_ ));
 sky130_fd_sc_hd__xor2_2 \gray_sobel0.sobel0.sobel._0827_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[69] ),
    .B(\gray_sobel0.sobel0.sobel._0224_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0272_ ));
 sky130_fd_sc_hd__xnor2_2 \gray_sobel0.sobel0.sobel._0828_  (.A(\gray_sobel0.sobel0.sobel._0271_ ),
    .B(\gray_sobel0.sobel0.sobel._0272_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0273_ ));
 sky130_fd_sc_hd__xor2_2 \gray_sobel0.sobel0.sobel._0829_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[21] ),
    .B(\gray_sobel0.sobel0.sobel._0273_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0274_ ));
 sky130_fd_sc_hd__or2_1 \gray_sobel0.sobel0.sobel._0830_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[2] ),
    .B(\gray_sobel0.sobel0.sobel.matrix_pixels_i[50] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0275_ ));
 sky130_fd_sc_hd__xor2_1 \gray_sobel0.sobel0.sobel._0831_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[41] ),
    .B(\gray_sobel0.sobel0.sobel.matrix_pixels_i[25] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0276_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._0832_  (.A(\gray_sobel0.sobel0.sobel._0203_ ),
    .B(\gray_sobel0.sobel0.sobel._0276_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0277_ ));
 sky130_fd_sc_hd__nand2_1 \gray_sobel0.sobel0.sobel._0833_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[2] ),
    .B(\gray_sobel0.sobel0.sobel.matrix_pixels_i[50] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0278_ ));
 sky130_fd_sc_hd__a21bo_1 \gray_sobel0.sobel0.sobel._0834_  (.A1(\gray_sobel0.sobel0.sobel._0275_ ),
    .A2(\gray_sobel0.sobel0.sobel._0277_ ),
    .B1_N(\gray_sobel0.sobel0.sobel._0278_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0279_ ));
 sky130_fd_sc_hd__nand2_1 \gray_sobel0.sobel0.sobel._0835_  (.A(\gray_sobel0.sobel0.sobel._0265_ ),
    .B(\gray_sobel0.sobel0.sobel._0263_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0280_ ));
 sky130_fd_sc_hd__xnor2_2 \gray_sobel0.sobel0.sobel._0836_  (.A(\gray_sobel0.sobel0.sobel._0280_ ),
    .B(\gray_sobel0.sobel0.sobel._0264_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0281_ ));
 sky130_fd_sc_hd__xnor2_2 \gray_sobel0.sobel0.sobel._0837_  (.A(\gray_sobel0.sobel0.sobel._0279_ ),
    .B(\gray_sobel0.sobel0.sobel._0281_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0282_ ));
 sky130_fd_sc_hd__nand2_1 \gray_sobel0.sobel0.sobel._0838_  (.A(\gray_sobel0.sobel0.sobel._0279_ ),
    .B(\gray_sobel0.sobel0.sobel._0281_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0283_ ));
 sky130_fd_sc_hd__o21ai_2 \gray_sobel0.sobel0.sobel._0839_  (.A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[67] ),
    .A2(\gray_sobel0.sobel0.sobel._0282_ ),
    .B1(\gray_sobel0.sobel0.sobel._0283_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0284_ ));
 sky130_fd_sc_hd__xnor2_2 \gray_sobel0.sobel0.sobel._0840_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[68] ),
    .B(\gray_sobel0.sobel0.sobel._0269_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0285_ ));
 sky130_fd_sc_hd__and2_1 \gray_sobel0.sobel0.sobel._0841_  (.A(\gray_sobel0.sobel0.sobel._0284_ ),
    .B(\gray_sobel0.sobel0.sobel._0285_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0286_ ));
 sky130_fd_sc_hd__xnor2_2 \gray_sobel0.sobel0.sobel._0842_  (.A(\gray_sobel0.sobel0.sobel._0284_ ),
    .B(\gray_sobel0.sobel0.sobel._0285_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0287_ ));
 sky130_fd_sc_hd__nor2_1 \gray_sobel0.sobel0.sobel._0843_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[20] ),
    .B(\gray_sobel0.sobel0.sobel._0287_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0288_ ));
 sky130_fd_sc_hd__nor3_2 \gray_sobel0.sobel0.sobel._0844_  (.A(\gray_sobel0.sobel0.sobel._0274_ ),
    .B(\gray_sobel0.sobel0.sobel._0286_ ),
    .C(\gray_sobel0.sobel0.sobel._0288_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0289_ ));
 sky130_fd_sc_hd__nand2_1 \gray_sobel0.sobel0.sobel._0845_  (.A(\gray_sobel0.sobel0.sobel._0278_ ),
    .B(\gray_sobel0.sobel0.sobel._0275_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0290_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._0846_  (.A(\gray_sobel0.sobel0.sobel._0290_ ),
    .B(\gray_sobel0.sobel0.sobel._0277_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0291_ ));
 sky130_fd_sc_hd__nor2_1 \gray_sobel0.sobel0.sobel._0847_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[1] ),
    .B(\gray_sobel0.sobel0.sobel.matrix_pixels_i[49] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0292_ ));
 sky130_fd_sc_hd__xor2_1 \gray_sobel0.sobel0.sobel._0848_  (.A(\gray_sobel0.sobel0.sobel._0291_ ),
    .B(\gray_sobel0.sobel0.sobel._0292_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0293_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._0849_  (.A(\gray_sobel0.sobel0.sobel._0112_ ),
    .B(\gray_sobel0.sobel0.sobel._0293_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0294_ ));
 sky130_fd_sc_hd__inv_2 \gray_sobel0.sobel0.sobel._0850_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[64] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0295_ ));
 sky130_fd_sc_hd__xor2_1 \gray_sobel0.sobel0.sobel._0851_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[0] ),
    .B(\gray_sobel0.sobel0.sobel.matrix_pixels_i[48] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0296_ ));
 sky130_fd_sc_hd__and2_1 \gray_sobel0.sobel0.sobel._0852_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[0] ),
    .B(\gray_sobel0.sobel0.sobel.matrix_pixels_i[48] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0297_ ));
 sky130_fd_sc_hd__a21oi_1 \gray_sobel0.sobel0.sobel._0853_  (.A1(\gray_sobel0.sobel0.sobel._0295_ ),
    .A2(\gray_sobel0.sobel0.sobel._0296_ ),
    .B1(\gray_sobel0.sobel0.sobel._0297_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0298_ ));
 sky130_fd_sc_hd__and2_1 \gray_sobel0.sobel0.sobel._0854_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[1] ),
    .B(\gray_sobel0.sobel0.sobel.matrix_pixels_i[49] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0299_ ));
 sky130_fd_sc_hd__nor2_1 \gray_sobel0.sobel0.sobel._0855_  (.A(\gray_sobel0.sobel0.sobel._0292_ ),
    .B(\gray_sobel0.sobel0.sobel._0299_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0300_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._0856_  (.A(\gray_sobel0.sobel0.sobel._0298_ ),
    .B(\gray_sobel0.sobel0.sobel._0300_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0301_ ));
 sky130_fd_sc_hd__or2_1 \gray_sobel0.sobel0.sobel._0857_  (.A(\gray_sobel0.sobel0.sobel._0298_ ),
    .B(\gray_sobel0.sobel0.sobel._0300_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0302_ ));
 sky130_fd_sc_hd__o21a_1 \gray_sobel0.sobel0.sobel._0858_  (.A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[65] ),
    .A2(\gray_sobel0.sobel0.sobel._0301_ ),
    .B1(\gray_sobel0.sobel0.sobel._0302_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0303_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._0859_  (.A(\gray_sobel0.sobel0.sobel._0294_ ),
    .B(\gray_sobel0.sobel0.sobel._0303_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0304_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._0860_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[18] ),
    .B(\gray_sobel0.sobel0.sobel._0304_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0305_ ));
 sky130_fd_sc_hd__or2b_1 \gray_sobel0.sobel0.sobel._0861_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[40] ),
    .B_N(\gray_sobel0.sobel0.sobel.matrix_pixels_i[24] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0306_ ));
 sky130_fd_sc_hd__nand2_1 \gray_sobel0.sobel0.sobel._0862_  (.A(\gray_sobel0.sobel0.sobel._0203_ ),
    .B(\gray_sobel0.sobel0.sobel._0306_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0307_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._0863_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[64] ),
    .B(\gray_sobel0.sobel0.sobel._0296_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0308_ ));
 sky130_fd_sc_hd__and2_1 \gray_sobel0.sobel0.sobel._0864_  (.A(\gray_sobel0.sobel0.sobel._0307_ ),
    .B(\gray_sobel0.sobel0.sobel._0308_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0309_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._0865_  (.A(\gray_sobel0.sobel0.sobel._0307_ ),
    .B(\gray_sobel0.sobel0.sobel._0308_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0310_ ));
 sky130_fd_sc_hd__nor2_1 \gray_sobel0.sobel0.sobel._0866_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[16] ),
    .B(\gray_sobel0.sobel0.sobel._0310_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0311_ ));
 sky130_fd_sc_hd__xor2_1 \gray_sobel0.sobel0.sobel._0867_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[65] ),
    .B(\gray_sobel0.sobel0.sobel._0301_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0312_ ));
 sky130_fd_sc_hd__o21a_1 \gray_sobel0.sobel0.sobel._0868_  (.A1(\gray_sobel0.sobel0.sobel._0309_ ),
    .A2(\gray_sobel0.sobel0.sobel._0311_ ),
    .B1(\gray_sobel0.sobel0.sobel._0312_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0313_ ));
 sky130_fd_sc_hd__nor3_1 \gray_sobel0.sobel0.sobel._0869_  (.A(\gray_sobel0.sobel0.sobel._0312_ ),
    .B(\gray_sobel0.sobel0.sobel._0309_ ),
    .C(\gray_sobel0.sobel0.sobel._0311_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0314_ ));
 sky130_fd_sc_hd__nor2_1 \gray_sobel0.sobel0.sobel._0870_  (.A(\gray_sobel0.sobel0.sobel._0313_ ),
    .B(\gray_sobel0.sobel0.sobel._0314_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0315_ ));
 sky130_fd_sc_hd__and2b_1 \gray_sobel0.sobel0.sobel._0871_  (.A_N(\gray_sobel0.sobel0.sobel.matrix_pixels_i[17] ),
    .B(\gray_sobel0.sobel0.sobel._0315_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0316_ ));
 sky130_fd_sc_hd__or3_1 \gray_sobel0.sobel0.sobel._0872_  (.A(\gray_sobel0.sobel0.sobel._0305_ ),
    .B(\gray_sobel0.sobel0.sobel._0313_ ),
    .C(\gray_sobel0.sobel0.sobel._0316_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0317_ ));
 sky130_fd_sc_hd__inv_2 \gray_sobel0.sobel0.sobel._0873_  (.A(\gray_sobel0.sobel0.sobel._0311_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0318_ ));
 sky130_fd_sc_hd__nand2_1 \gray_sobel0.sobel0.sobel._0874_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[16] ),
    .B(\gray_sobel0.sobel0.sobel._0310_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0319_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._0875_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[17] ),
    .B(\gray_sobel0.sobel0.sobel._0315_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0320_ ));
 sky130_fd_sc_hd__and4_1 \gray_sobel0.sobel0.sobel._0876_  (.A(\gray_sobel0.sobel0.sobel._0307_ ),
    .B(\gray_sobel0.sobel0.sobel._0318_ ),
    .C(\gray_sobel0.sobel0.sobel._0319_ ),
    .D(\gray_sobel0.sobel0.sobel._0320_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0321_ ));
 sky130_fd_sc_hd__o21a_1 \gray_sobel0.sobel0.sobel._0877_  (.A1(\gray_sobel0.sobel0.sobel._0313_ ),
    .A2(\gray_sobel0.sobel0.sobel._0316_ ),
    .B1(\gray_sobel0.sobel0.sobel._0305_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0322_ ));
 sky130_fd_sc_hd__a21o_1 \gray_sobel0.sobel0.sobel._0878_  (.A1(\gray_sobel0.sobel0.sobel._0317_ ),
    .A2(\gray_sobel0.sobel0.sobel._0321_ ),
    .B1(\gray_sobel0.sobel0.sobel._0322_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0323_ ));
 sky130_fd_sc_hd__or2b_1 \gray_sobel0.sobel0.sobel._0879_  (.A(\gray_sobel0.sobel0.sobel._0292_ ),
    .B_N(\gray_sobel0.sobel0.sobel._0291_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0324_ ));
 sky130_fd_sc_hd__o21ai_2 \gray_sobel0.sobel0.sobel._0880_  (.A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[66] ),
    .A2(\gray_sobel0.sobel0.sobel._0293_ ),
    .B1(\gray_sobel0.sobel0.sobel._0324_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0325_ ));
 sky130_fd_sc_hd__xor2_2 \gray_sobel0.sobel0.sobel._0881_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[67] ),
    .B(\gray_sobel0.sobel0.sobel._0282_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0326_ ));
 sky130_fd_sc_hd__xnor2_2 \gray_sobel0.sobel0.sobel._0882_  (.A(\gray_sobel0.sobel0.sobel._0325_ ),
    .B(\gray_sobel0.sobel0.sobel._0326_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0327_ ));
 sky130_fd_sc_hd__xor2_2 \gray_sobel0.sobel0.sobel._0883_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[19] ),
    .B(\gray_sobel0.sobel0.sobel._0327_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0328_ ));
 sky130_fd_sc_hd__inv_2 \gray_sobel0.sobel0.sobel._0884_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[18] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0329_ ));
 sky130_fd_sc_hd__and2b_1 \gray_sobel0.sobel0.sobel._0885_  (.A_N(\gray_sobel0.sobel0.sobel._0303_ ),
    .B(\gray_sobel0.sobel0.sobel._0294_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0330_ ));
 sky130_fd_sc_hd__a21oi_2 \gray_sobel0.sobel0.sobel._0886_  (.A1(\gray_sobel0.sobel0.sobel._0329_ ),
    .A2(\gray_sobel0.sobel0.sobel._0304_ ),
    .B1(\gray_sobel0.sobel0.sobel._0330_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0331_ ));
 sky130_fd_sc_hd__xnor2_2 \gray_sobel0.sobel0.sobel._0887_  (.A(\gray_sobel0.sobel0.sobel._0328_ ),
    .B(\gray_sobel0.sobel0.sobel._0331_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0332_ ));
 sky130_fd_sc_hd__and2b_1 \gray_sobel0.sobel0.sobel._0888_  (.A_N(\gray_sobel0.sobel0.sobel._0331_ ),
    .B(\gray_sobel0.sobel0.sobel._0328_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0333_ ));
 sky130_fd_sc_hd__a21o_1 \gray_sobel0.sobel0.sobel._0889_  (.A1(\gray_sobel0.sobel0.sobel._0323_ ),
    .A2(\gray_sobel0.sobel0.sobel._0332_ ),
    .B1(\gray_sobel0.sobel0.sobel._0333_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0334_ ));
 sky130_fd_sc_hd__xor2_2 \gray_sobel0.sobel0.sobel._0890_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[20] ),
    .B(\gray_sobel0.sobel0.sobel._0287_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0335_ ));
 sky130_fd_sc_hd__nand2_1 \gray_sobel0.sobel0.sobel._0891_  (.A(\gray_sobel0.sobel0.sobel._0325_ ),
    .B(\gray_sobel0.sobel0.sobel._0326_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0336_ ));
 sky130_fd_sc_hd__o21a_1 \gray_sobel0.sobel0.sobel._0892_  (.A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[19] ),
    .A2(\gray_sobel0.sobel0.sobel._0327_ ),
    .B1(\gray_sobel0.sobel0.sobel._0336_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0337_ ));
 sky130_fd_sc_hd__xnor2_2 \gray_sobel0.sobel0.sobel._0893_  (.A(\gray_sobel0.sobel0.sobel._0335_ ),
    .B(\gray_sobel0.sobel0.sobel._0337_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0338_ ));
 sky130_fd_sc_hd__o21a_1 \gray_sobel0.sobel0.sobel._0894_  (.A1(\gray_sobel0.sobel0.sobel._0286_ ),
    .A2(\gray_sobel0.sobel0.sobel._0288_ ),
    .B1(\gray_sobel0.sobel0.sobel._0274_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0339_ ));
 sky130_fd_sc_hd__and2b_1 \gray_sobel0.sobel0.sobel._0895_  (.A_N(\gray_sobel0.sobel0.sobel._0337_ ),
    .B(\gray_sobel0.sobel0.sobel._0335_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0340_ ));
 sky130_fd_sc_hd__a211oi_2 \gray_sobel0.sobel0.sobel._0896_  (.A1(\gray_sobel0.sobel0.sobel._0334_ ),
    .A2(\gray_sobel0.sobel0.sobel._0338_ ),
    .B1(\gray_sobel0.sobel0.sobel._0339_ ),
    .C1(\gray_sobel0.sobel0.sobel._0340_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0341_ ));
 sky130_fd_sc_hd__or2_2 \gray_sobel0.sobel0.sobel._0897_  (.A(\gray_sobel0.sobel0.sobel._0289_ ),
    .B(\gray_sobel0.sobel0.sobel._0341_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0342_ ));
 sky130_fd_sc_hd__xor2_4 \gray_sobel0.sobel0.sobel._0898_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[22] ),
    .B(\gray_sobel0.sobel0.sobel._0240_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0343_ ));
 sky130_fd_sc_hd__nand2_1 \gray_sobel0.sobel0.sobel._0899_  (.A(\gray_sobel0.sobel0.sobel._0271_ ),
    .B(\gray_sobel0.sobel0.sobel._0272_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0344_ ));
 sky130_fd_sc_hd__o21ai_4 \gray_sobel0.sobel0.sobel._0900_  (.A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[21] ),
    .A2(\gray_sobel0.sobel0.sobel._0273_ ),
    .B1(\gray_sobel0.sobel0.sobel._0344_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0345_ ));
 sky130_fd_sc_hd__xnor2_4 \gray_sobel0.sobel0.sobel._0901_  (.A(\gray_sobel0.sobel0.sobel._0343_ ),
    .B(\gray_sobel0.sobel0.sobel._0345_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0346_ ));
 sky130_fd_sc_hd__nand2_1 \gray_sobel0.sobel0.sobel._0902_  (.A(\gray_sobel0.sobel0.sobel._0343_ ),
    .B(\gray_sobel0.sobel0.sobel._0345_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0347_ ));
 sky130_fd_sc_hd__o21a_1 \gray_sobel0.sobel0.sobel._0903_  (.A1(\gray_sobel0.sobel0.sobel._0342_ ),
    .A2(\gray_sobel0.sobel0.sobel._0346_ ),
    .B1(\gray_sobel0.sobel0.sobel._0347_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0348_ ));
 sky130_fd_sc_hd__xor2_2 \gray_sobel0.sobel0.sobel._0904_  (.A(\gray_sobel0.sobel0.sobel._0262_ ),
    .B(\gray_sobel0.sobel0.sobel._0348_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0349_ ));
 sky130_fd_sc_hd__xor2_2 \gray_sobel0.sobel0.sobel._0905_  (.A(\gray_sobel0.sobel0.sobel._0342_ ),
    .B(\gray_sobel0.sobel0.sobel._0346_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0350_ ));
 sky130_fd_sc_hd__a21oi_1 \gray_sobel0.sobel0.sobel._0906_  (.A1(\gray_sobel0.sobel0.sobel._0334_ ),
    .A2(\gray_sobel0.sobel0.sobel._0338_ ),
    .B1(\gray_sobel0.sobel0.sobel._0340_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0351_ ));
 sky130_fd_sc_hd__nor2_1 \gray_sobel0.sobel0.sobel._0907_  (.A(\gray_sobel0.sobel0.sobel._0339_ ),
    .B(\gray_sobel0.sobel0.sobel._0289_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0352_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._0908_  (.A(\gray_sobel0.sobel0.sobel._0351_ ),
    .B(\gray_sobel0.sobel0.sobel._0352_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0353_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._0909_  (.A(\gray_sobel0.sobel0.sobel._0334_ ),
    .B(\gray_sobel0.sobel0.sobel._0338_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0354_ ));
 sky130_fd_sc_hd__xor2_2 \gray_sobel0.sobel0.sobel._0910_  (.A(\gray_sobel0.sobel0.sobel._0323_ ),
    .B(\gray_sobel0.sobel0.sobel._0332_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0355_ ));
 sky130_fd_sc_hd__and2b_1 \gray_sobel0.sobel0.sobel._0911_  (.A_N(\gray_sobel0.sobel0.sobel._0322_ ),
    .B(\gray_sobel0.sobel0.sobel._0317_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0356_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._0912_  (.A(\gray_sobel0.sobel0.sobel._0356_ ),
    .B(\gray_sobel0.sobel0.sobel._0321_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0357_ ));
 sky130_fd_sc_hd__a31o_1 \gray_sobel0.sobel0.sobel._0913_  (.A1(\gray_sobel0.sobel0.sobel._0307_ ),
    .A2(\gray_sobel0.sobel0.sobel._0318_ ),
    .A3(\gray_sobel0.sobel0.sobel._0319_ ),
    .B1(\gray_sobel0.sobel0.sobel._0320_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0358_ ));
 sky130_fd_sc_hd__and2b_1 \gray_sobel0.sobel0.sobel._0914_  (.A_N(\gray_sobel0.sobel0.sobel._0321_ ),
    .B(\gray_sobel0.sobel0.sobel._0358_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0359_ ));
 sky130_fd_sc_hd__inv_2 \gray_sobel0.sobel0.sobel._0915_  (.A(\gray_sobel0.sobel0.sobel._0359_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0360_ ));
 sky130_fd_sc_hd__nand3b_1 \gray_sobel0.sobel0.sobel._0916_  (.A_N(\gray_sobel0.sobel0.sobel._0183_ ),
    .B(\gray_sobel0.sobel0.sobel._0357_ ),
    .C(\gray_sobel0.sobel0.sobel._0360_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0361_ ));
 sky130_fd_sc_hd__nor2_1 \gray_sobel0.sobel0.sobel._0917_  (.A(\gray_sobel0.sobel0.sobel._0355_ ),
    .B(\gray_sobel0.sobel0.sobel._0361_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0362_ ));
 sky130_fd_sc_hd__nand2_1 \gray_sobel0.sobel0.sobel._0918_  (.A(\gray_sobel0.sobel0.sobel._0354_ ),
    .B(\gray_sobel0.sobel0.sobel._0362_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0363_ ));
 sky130_fd_sc_hd__or2_1 \gray_sobel0.sobel0.sobel._0919_  (.A(\gray_sobel0.sobel0.sobel._0353_ ),
    .B(\gray_sobel0.sobel0.sobel._0363_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0364_ ));
 sky130_fd_sc_hd__inv_2 \gray_sobel0.sobel0.sobel._0920_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[23] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0365_ ));
 sky130_fd_sc_hd__and2b_1 \gray_sobel0.sobel0.sobel._0921_  (.A_N(\gray_sobel0.sobel0.sobel.matrix_pixels_i[31] ),
    .B(\gray_sobel0.sobel0.sobel.matrix_pixels_i[47] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0366_ ));
 sky130_fd_sc_hd__and2b_1 \gray_sobel0.sobel0.sobel._0922_  (.A_N(\gray_sobel0.sobel0.sobel.matrix_pixels_i[47] ),
    .B(\gray_sobel0.sobel0.sobel.matrix_pixels_i[31] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0367_ ));
 sky130_fd_sc_hd__nor2_1 \gray_sobel0.sobel0.sobel._0923_  (.A(\gray_sobel0.sobel0.sobel._0366_ ),
    .B(\gray_sobel0.sobel0.sobel._0367_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0368_ ));
 sky130_fd_sc_hd__a21oi_2 \gray_sobel0.sobel0.sobel._0924_  (.A1(\gray_sobel0.sobel0.sobel._0249_ ),
    .A2(\gray_sobel0.sobel0.sobel._0252_ ),
    .B1(\gray_sobel0.sobel0.sobel._0248_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0369_ ));
 sky130_fd_sc_hd__xor2_2 \gray_sobel0.sobel0.sobel._0925_  (.A(\gray_sobel0.sobel0.sobel._0368_ ),
    .B(\gray_sobel0.sobel0.sobel._0369_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0370_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._0926_  (.A(\gray_sobel0.sobel0.sobel._0247_ ),
    .B(\gray_sobel0.sobel0.sobel._0370_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0371_ ));
 sky130_fd_sc_hd__a21boi_1 \gray_sobel0.sobel0.sobel._0927_  (.A1(\gray_sobel0.sobel0.sobel._0245_ ),
    .A2(\gray_sobel0.sobel0.sobel._0253_ ),
    .B1_N(\gray_sobel0.sobel0.sobel._0246_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0372_ ));
 sky130_fd_sc_hd__xor2_1 \gray_sobel0.sobel0.sobel._0928_  (.A(\gray_sobel0.sobel0.sobel._0371_ ),
    .B(\gray_sobel0.sobel0.sobel._0372_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0373_ ));
 sky130_fd_sc_hd__nor2_1 \gray_sobel0.sobel0.sobel._0929_  (.A(\gray_sobel0.sobel0.sobel._0371_ ),
    .B(\gray_sobel0.sobel0.sobel._0372_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0374_ ));
 sky130_fd_sc_hd__a21o_1 \gray_sobel0.sobel0.sobel._0930_  (.A1(\gray_sobel0.sobel0.sobel._0130_ ),
    .A2(\gray_sobel0.sobel0.sobel._0373_ ),
    .B1(\gray_sobel0.sobel0.sobel._0374_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0375_ ));
 sky130_fd_sc_hd__o21ai_1 \gray_sobel0.sobel0.sobel._0931_  (.A1(\gray_sobel0.sobel0.sobel._0247_ ),
    .A2(\gray_sobel0.sobel0.sobel._0370_ ),
    .B1(\gray_sobel0.sobel0.sobel._0246_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0376_ ));
 sky130_fd_sc_hd__a21oi_1 \gray_sobel0.sobel0.sobel._0932_  (.A1(\gray_sobel0.sobel0.sobel._0368_ ),
    .A2(\gray_sobel0.sobel0.sobel._0369_ ),
    .B1(\gray_sobel0.sobel0.sobel._0367_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0377_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._0933_  (.A(\gray_sobel0.sobel0.sobel._0247_ ),
    .B(\gray_sobel0.sobel0.sobel._0377_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0378_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._0934_  (.A(\gray_sobel0.sobel0.sobel._0376_ ),
    .B(\gray_sobel0.sobel0.sobel._0378_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0379_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._0935_  (.A(\gray_sobel0.sobel0.sobel._0016_ ),
    .B(\gray_sobel0.sobel0.sobel._0379_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0380_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._0936_  (.A(\gray_sobel0.sobel0.sobel._0375_ ),
    .B(\gray_sobel0.sobel0.sobel._0380_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0381_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._0937_  (.A(\gray_sobel0.sobel0.sobel._0365_ ),
    .B(\gray_sobel0.sobel0.sobel._0381_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0382_ ));
 sky130_fd_sc_hd__and2_1 \gray_sobel0.sobel0.sobel._0938_  (.A(\gray_sobel0.sobel0.sobel._0244_ ),
    .B(\gray_sobel0.sobel0.sobel._0254_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0383_ ));
 sky130_fd_sc_hd__a21oi_1 \gray_sobel0.sobel0.sobel._0939_  (.A1(\gray_sobel0.sobel0.sobel._0130_ ),
    .A2(\gray_sobel0.sobel0.sobel._0255_ ),
    .B1(\gray_sobel0.sobel0.sobel._0383_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0384_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._0940_  (.A(\gray_sobel0.sobel0.sobel._0016_ ),
    .B(\gray_sobel0.sobel0.sobel._0373_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0385_ ));
 sky130_fd_sc_hd__and2b_1 \gray_sobel0.sobel0.sobel._0941_  (.A_N(\gray_sobel0.sobel0.sobel._0384_ ),
    .B(\gray_sobel0.sobel0.sobel._0385_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0386_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._0942_  (.A(\gray_sobel0.sobel0.sobel._0385_ ),
    .B(\gray_sobel0.sobel0.sobel._0384_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0387_ ));
 sky130_fd_sc_hd__and2_1 \gray_sobel0.sobel0.sobel._0943_  (.A(\gray_sobel0.sobel0.sobel._0365_ ),
    .B(\gray_sobel0.sobel0.sobel._0387_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0388_ ));
 sky130_fd_sc_hd__nor3_1 \gray_sobel0.sobel0.sobel._0944_  (.A(\gray_sobel0.sobel0.sobel._0382_ ),
    .B(\gray_sobel0.sobel0.sobel._0386_ ),
    .C(\gray_sobel0.sobel0.sobel._0388_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0389_ ));
 sky130_fd_sc_hd__inv_2 \gray_sobel0.sobel0.sobel._0945_  (.A(\gray_sobel0.sobel0.sobel._0389_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0390_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._0946_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[23] ),
    .B(\gray_sobel0.sobel0.sobel._0387_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0391_ ));
 sky130_fd_sc_hd__and2_1 \gray_sobel0.sobel0.sobel._0947_  (.A(\gray_sobel0.sobel0.sobel._0243_ ),
    .B(\gray_sobel0.sobel0.sobel._0256_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0392_ ));
 sky130_fd_sc_hd__a21oi_1 \gray_sobel0.sobel0.sobel._0948_  (.A1(\gray_sobel0.sobel0.sobel._0365_ ),
    .A2(\gray_sobel0.sobel0.sobel._0257_ ),
    .B1(\gray_sobel0.sobel0.sobel._0392_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0393_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._0949_  (.A(\gray_sobel0.sobel0.sobel._0391_ ),
    .B(\gray_sobel0.sobel0.sobel._0393_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0394_ ));
 sky130_fd_sc_hd__o311ai_4 \gray_sobel0.sobel0.sobel._0950_  (.A1(\gray_sobel0.sobel0.sobel._0289_ ),
    .A2(\gray_sobel0.sobel0.sobel._0341_ ),
    .A3(\gray_sobel0.sobel0.sobel._0346_ ),
    .B1(\gray_sobel0.sobel0.sobel._0347_ ),
    .C1(\gray_sobel0.sobel0.sobel._0259_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0395_ ));
 sky130_fd_sc_hd__o21a_1 \gray_sobel0.sobel0.sobel._0951_  (.A1(\gray_sobel0.sobel0.sobel._0386_ ),
    .A2(\gray_sobel0.sobel0.sobel._0388_ ),
    .B1(\gray_sobel0.sobel0.sobel._0382_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0396_ ));
 sky130_fd_sc_hd__and2b_1 \gray_sobel0.sobel0.sobel._0952_  (.A_N(\gray_sobel0.sobel0.sobel._0393_ ),
    .B(\gray_sobel0.sobel0.sobel._0391_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0397_ ));
 sky130_fd_sc_hd__a311o_1 \gray_sobel0.sobel0.sobel._0953_  (.A1(\gray_sobel0.sobel0.sobel._0261_ ),
    .A2(\gray_sobel0.sobel0.sobel._0394_ ),
    .A3(\gray_sobel0.sobel0.sobel._0395_ ),
    .B1(\gray_sobel0.sobel0.sobel._0396_ ),
    .C1(\gray_sobel0.sobel0.sobel._0397_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0398_ ));
 sky130_fd_sc_hd__nand2_1 \gray_sobel0.sobel0.sobel._0954_  (.A(\gray_sobel0.sobel0.sobel._0375_ ),
    .B(\gray_sobel0.sobel0.sobel._0380_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0399_ ));
 sky130_fd_sc_hd__o21a_1 \gray_sobel0.sobel0.sobel._0955_  (.A1(\gray_sobel0.sobel0.sobel.matrix_pixels_i[23] ),
    .A2(\gray_sobel0.sobel0.sobel._0381_ ),
    .B1(\gray_sobel0.sobel0.sobel._0399_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0400_ ));
 sky130_fd_sc_hd__and2b_1 \gray_sobel0.sobel0.sobel._0956_  (.A_N(\gray_sobel0.sobel0.sobel._0378_ ),
    .B(\gray_sobel0.sobel0.sobel._0376_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0401_ ));
 sky130_fd_sc_hd__or2_1 \gray_sobel0.sobel0.sobel._0957_  (.A(\gray_sobel0.sobel0.sobel._0247_ ),
    .B(\gray_sobel0.sobel0.sobel._0370_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0402_ ));
 sky130_fd_sc_hd__a31o_1 \gray_sobel0.sobel0.sobel._0958_  (.A1(\gray_sobel0.sobel0.sobel._0246_ ),
    .A2(\gray_sobel0.sobel0.sobel._0402_ ),
    .A3(\gray_sobel0.sobel0.sobel._0378_ ),
    .B1(\gray_sobel0.sobel0.sobel._0016_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0403_ ));
 sky130_fd_sc_hd__o21ai_1 \gray_sobel0.sobel0.sobel._0959_  (.A1(\gray_sobel0.sobel0.sobel._0130_ ),
    .A2(\gray_sobel0.sobel0.sobel._0401_ ),
    .B1(\gray_sobel0.sobel0.sobel._0403_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0404_ ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0.sobel0.sobel._0960_  (.A0(\gray_sobel0.sobel0.sobel._0246_ ),
    .A1(\gray_sobel0.sobel0.sobel._0245_ ),
    .S(\gray_sobel0.sobel0.sobel._0377_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0405_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._0961_  (.A(\gray_sobel0.sobel0.sobel.matrix_pixels_i[23] ),
    .B(\gray_sobel0.sobel0.sobel._0405_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0406_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._0962_  (.A(\gray_sobel0.sobel0.sobel._0404_ ),
    .B(\gray_sobel0.sobel0.sobel._0406_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0407_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._0963_  (.A(\gray_sobel0.sobel0.sobel._0400_ ),
    .B(\gray_sobel0.sobel0.sobel._0407_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0408_ ));
 sky130_fd_sc_hd__nand3_2 \gray_sobel0.sobel0.sobel._0964_  (.A(\gray_sobel0.sobel0.sobel._0390_ ),
    .B(\gray_sobel0.sobel0.sobel._0398_ ),
    .C(\gray_sobel0.sobel0.sobel._0408_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0409_ ));
 sky130_fd_sc_hd__a21o_1 \gray_sobel0.sobel0.sobel._0965_  (.A1(\gray_sobel0.sobel0.sobel._0390_ ),
    .A2(\gray_sobel0.sobel0.sobel._0398_ ),
    .B1(\gray_sobel0.sobel0.sobel._0408_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0410_ ));
 sky130_fd_sc_hd__nand2_2 \gray_sobel0.sobel0.sobel._0966_  (.A(\gray_sobel0.sobel0.sobel._0409_ ),
    .B(\gray_sobel0.sobel0.sobel._0410_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0411_ ));
 sky130_fd_sc_hd__o21ba_1 \gray_sobel0.sobel0.sobel._0967_  (.A1(\gray_sobel0.sobel0.sobel._0350_ ),
    .A2(\gray_sobel0.sobel0.sobel._0364_ ),
    .B1_N(\gray_sobel0.sobel0.sobel._0411_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0412_ ));
 sky130_fd_sc_hd__xnor2_2 \gray_sobel0.sobel0.sobel._0968_  (.A(\gray_sobel0.sobel0.sobel._0349_ ),
    .B(\gray_sobel0.sobel0.sobel._0412_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0413_ ));
 sky130_fd_sc_hd__xor2_1 \gray_sobel0.sobel0.sobel._0969_  (.A(\gray_sobel0.sobel0.sobel._0198_ ),
    .B(\gray_sobel0.sobel0.sobel._0413_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0414_ ));
 sky130_fd_sc_hd__o21ai_1 \gray_sobel0.sobel0.sobel._0970_  (.A1(\gray_sobel0.sobel0.sobel._0193_ ),
    .A2(\gray_sobel0.sobel0.sobel._0190_ ),
    .B1(\gray_sobel0.sobel0.sobel._0179_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0415_ ));
 sky130_fd_sc_hd__xnor2_2 \gray_sobel0.sobel0.sobel._0971_  (.A(\gray_sobel0.sobel0.sobel._0195_ ),
    .B(\gray_sobel0.sobel0.sobel._0415_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0416_ ));
 sky130_fd_sc_hd__and2b_1 \gray_sobel0.sobel0.sobel._0972_  (.A_N(\gray_sobel0.sobel0.sobel._0411_ ),
    .B(\gray_sobel0.sobel0.sobel._0364_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0417_ ));
 sky130_fd_sc_hd__xnor2_2 \gray_sobel0.sobel0.sobel._0973_  (.A(\gray_sobel0.sobel0.sobel._0350_ ),
    .B(\gray_sobel0.sobel0.sobel._0417_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0418_ ));
 sky130_fd_sc_hd__xor2_1 \gray_sobel0.sobel0.sobel._0974_  (.A(\gray_sobel0.sobel0.sobel._0416_ ),
    .B(\gray_sobel0.sobel0.sobel._0418_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0419_ ));
 sky130_fd_sc_hd__o21ai_1 \gray_sobel0.sobel0.sobel._0975_  (.A1(\gray_sobel0.sobel0.sobel._0188_ ),
    .A2(\gray_sobel0.sobel0.sobel._0187_ ),
    .B1(\gray_sobel0.sobel0.sobel._0179_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0420_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._0976_  (.A(\gray_sobel0.sobel0.sobel._0189_ ),
    .B(\gray_sobel0.sobel0.sobel._0420_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0421_ ));
 sky130_fd_sc_hd__or2_1 \gray_sobel0.sobel0.sobel._0977_  (.A(\gray_sobel0.sobel0.sobel._0411_ ),
    .B(\gray_sobel0.sobel0.sobel._0362_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0422_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._0978_  (.A(\gray_sobel0.sobel0.sobel._0354_ ),
    .B(\gray_sobel0.sobel0.sobel._0422_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0423_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._0979_  (.A(\gray_sobel0.sobel0.sobel._0421_ ),
    .B(\gray_sobel0.sobel0.sobel._0423_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0424_ ));
 sky130_fd_sc_hd__inv_2 \gray_sobel0.sobel0.sobel._0980_  (.A(\gray_sobel0.sobel0.sobel._0424_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0425_ ));
 sky130_fd_sc_hd__o211a_1 \gray_sobel0.sobel0.sobel._0981_  (.A1(\gray_sobel0.sobel0.sobel._0183_ ),
    .A2(\gray_sobel0.sobel0.sobel._0185_ ),
    .B1(\gray_sobel0.sobel0.sobel._0175_ ),
    .C1(\gray_sobel0.sobel0.sobel._0177_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0426_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._0982_  (.A(\gray_sobel0.sobel0.sobel._0180_ ),
    .B(\gray_sobel0.sobel0.sobel._0426_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0427_ ));
 sky130_fd_sc_hd__o211a_1 \gray_sobel0.sobel0.sobel._0983_  (.A1(\gray_sobel0.sobel0.sobel._0183_ ),
    .A2(\gray_sobel0.sobel0.sobel._0359_ ),
    .B1(\gray_sobel0.sobel0.sobel._0410_ ),
    .C1(\gray_sobel0.sobel0.sobel._0409_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0428_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._0984_  (.A(\gray_sobel0.sobel0.sobel._0357_ ),
    .B(\gray_sobel0.sobel0.sobel._0428_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0429_ ));
 sky130_fd_sc_hd__nand2_1 \gray_sobel0.sobel0.sobel._0985_  (.A(\gray_sobel0.sobel0.sobel._0427_ ),
    .B(\gray_sobel0.sobel0.sobel._0429_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0430_ ));
 sky130_fd_sc_hd__or2_1 \gray_sobel0.sobel0.sobel._0986_  (.A(\gray_sobel0.sobel0.sobel._0427_ ),
    .B(\gray_sobel0.sobel0.sobel._0429_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0431_ ));
 sky130_fd_sc_hd__and2_1 \gray_sobel0.sobel0.sobel._0987_  (.A(\gray_sobel0.sobel0.sobel._0430_ ),
    .B(\gray_sobel0.sobel0.sobel._0431_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0432_ ));
 sky130_fd_sc_hd__inv_2 \gray_sobel0.sobel0.sobel._0988_  (.A(\gray_sobel0.sobel0.sobel._0185_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0433_ ));
 sky130_fd_sc_hd__and3_1 \gray_sobel0.sobel0.sobel._0989_  (.A(\gray_sobel0.sobel0.sobel._0175_ ),
    .B(\gray_sobel0.sobel0.sobel._0177_ ),
    .C(\gray_sobel0.sobel0.sobel._0183_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0434_ ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0.sobel0.sobel._0990_  (.A0(\gray_sobel0.sobel0.sobel._0433_ ),
    .A1(\gray_sobel0.sobel0.sobel._0099_ ),
    .S(\gray_sobel0.sobel0.sobel._0434_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0435_ ));
 sky130_fd_sc_hd__and3_1 \gray_sobel0.sobel0.sobel._0991_  (.A(\gray_sobel0.sobel0.sobel._0183_ ),
    .B(\gray_sobel0.sobel0.sobel._0409_ ),
    .C(\gray_sobel0.sobel0.sobel._0410_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0436_ ));
 sky130_fd_sc_hd__mux2_1 \gray_sobel0.sobel0.sobel._0992_  (.A0(\gray_sobel0.sobel0.sobel._0360_ ),
    .A1(\gray_sobel0.sobel0.sobel._0320_ ),
    .S(\gray_sobel0.sobel0.sobel._0436_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0437_ ));
 sky130_fd_sc_hd__xor2_1 \gray_sobel0.sobel0.sobel._0993_  (.A(\gray_sobel0.sobel0.sobel._0435_ ),
    .B(\gray_sobel0.sobel0.sobel._0437_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0438_ ));
 sky130_fd_sc_hd__nor2_1 \gray_sobel0.sobel0.sobel._0994_  (.A(\gray_sobel0.sobel0.sobel._0435_ ),
    .B(\gray_sobel0.sobel0.sobel._0437_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0439_ ));
 sky130_fd_sc_hd__a21o_1 \gray_sobel0.sobel0.sobel._0995_  (.A1(\gray_sobel0.sobel0.sobel._0183_ ),
    .A2(\gray_sobel0.sobel0.sobel._0438_ ),
    .B1(\gray_sobel0.sobel0.sobel._0439_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0440_ ));
 sky130_fd_sc_hd__nand2_1 \gray_sobel0.sobel0.sobel._0996_  (.A(\gray_sobel0.sobel0.sobel._0179_ ),
    .B(\gray_sobel0.sobel0.sobel._0187_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0441_ ));
 sky130_fd_sc_hd__xor2_2 \gray_sobel0.sobel0.sobel._0997_  (.A(\gray_sobel0.sobel0.sobel._0188_ ),
    .B(\gray_sobel0.sobel0.sobel._0441_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0442_ ));
 sky130_fd_sc_hd__and3_1 \gray_sobel0.sobel0.sobel._0998_  (.A(\gray_sobel0.sobel0.sobel._0409_ ),
    .B(\gray_sobel0.sobel0.sobel._0410_ ),
    .C(\gray_sobel0.sobel0.sobel._0361_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0443_ ));
 sky130_fd_sc_hd__xnor2_2 \gray_sobel0.sobel0.sobel._0999_  (.A(\gray_sobel0.sobel0.sobel._0355_ ),
    .B(\gray_sobel0.sobel0.sobel._0443_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0444_ ));
 sky130_fd_sc_hd__xor2_1 \gray_sobel0.sobel0.sobel._1000_  (.A(\gray_sobel0.sobel0.sobel._0442_ ),
    .B(\gray_sobel0.sobel0.sobel._0444_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0445_ ));
 sky130_fd_sc_hd__o21ai_1 \gray_sobel0.sobel0.sobel._1001_  (.A1(\gray_sobel0.sobel0.sobel._0442_ ),
    .A2(\gray_sobel0.sobel0.sobel._0444_ ),
    .B1(\gray_sobel0.sobel0.sobel._0430_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0446_ ));
 sky130_fd_sc_hd__nand2_1 \gray_sobel0.sobel0.sobel._1002_  (.A(\gray_sobel0.sobel0.sobel._0442_ ),
    .B(\gray_sobel0.sobel0.sobel._0444_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0447_ ));
 sky130_fd_sc_hd__a32o_1 \gray_sobel0.sobel0.sobel._1003_  (.A1(\gray_sobel0.sobel0.sobel._0432_ ),
    .A2(\gray_sobel0.sobel0.sobel._0440_ ),
    .A3(\gray_sobel0.sobel0.sobel._0445_ ),
    .B1(\gray_sobel0.sobel0.sobel._0446_ ),
    .B2(\gray_sobel0.sobel0.sobel._0447_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0448_ ));
 sky130_fd_sc_hd__nand2_1 \gray_sobel0.sobel0.sobel._1004_  (.A(\gray_sobel0.sobel0.sobel._0179_ ),
    .B(\gray_sobel0.sobel0.sobel._0190_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0449_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._1005_  (.A(\gray_sobel0.sobel0.sobel._0193_ ),
    .B(\gray_sobel0.sobel0.sobel._0449_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0450_ ));
 sky130_fd_sc_hd__or2b_1 \gray_sobel0.sobel0.sobel._1006_  (.A(\gray_sobel0.sobel0.sobel._0411_ ),
    .B_N(\gray_sobel0.sobel0.sobel._0363_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0451_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._1007_  (.A(\gray_sobel0.sobel0.sobel._0353_ ),
    .B(\gray_sobel0.sobel0.sobel._0451_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0452_ ));
 sky130_fd_sc_hd__and2_1 \gray_sobel0.sobel0.sobel._1008_  (.A(\gray_sobel0.sobel0.sobel._0450_ ),
    .B(\gray_sobel0.sobel0.sobel._0452_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0453_ ));
 sky130_fd_sc_hd__or2_1 \gray_sobel0.sobel0.sobel._1009_  (.A(\gray_sobel0.sobel0.sobel._0450_ ),
    .B(\gray_sobel0.sobel0.sobel._0452_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0454_ ));
 sky130_fd_sc_hd__and2b_1 \gray_sobel0.sobel0.sobel._1010_  (.A_N(\gray_sobel0.sobel0.sobel._0453_ ),
    .B(\gray_sobel0.sobel0.sobel._0454_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0455_ ));
 sky130_fd_sc_hd__nor2_1 \gray_sobel0.sobel0.sobel._1011_  (.A(\gray_sobel0.sobel0.sobel._0421_ ),
    .B(\gray_sobel0.sobel0.sobel._0423_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0456_ ));
 sky130_fd_sc_hd__o21a_1 \gray_sobel0.sobel0.sobel._1012_  (.A1(\gray_sobel0.sobel0.sobel._0453_ ),
    .A2(\gray_sobel0.sobel0.sobel._0456_ ),
    .B1(\gray_sobel0.sobel0.sobel._0454_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0457_ ));
 sky130_fd_sc_hd__a31o_1 \gray_sobel0.sobel0.sobel._1013_  (.A1(\gray_sobel0.sobel0.sobel._0425_ ),
    .A2(\gray_sobel0.sobel0.sobel._0448_ ),
    .A3(\gray_sobel0.sobel0.sobel._0455_ ),
    .B1(\gray_sobel0.sobel0.sobel._0457_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0458_ ));
 sky130_fd_sc_hd__o21a_1 \gray_sobel0.sobel0.sobel._1014_  (.A1(\gray_sobel0.sobel0.sobel._0416_ ),
    .A2(\gray_sobel0.sobel0.sobel._0418_ ),
    .B1(\gray_sobel0.sobel0.sobel._0413_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0459_ ));
 sky130_fd_sc_hd__and3_1 \gray_sobel0.sobel0.sobel._1015_  (.A(\gray_sobel0.sobel0.sobel._0166_ ),
    .B(\gray_sobel0.sobel0.sobel._0170_ ),
    .C(\gray_sobel0.sobel0.sobel._0171_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0460_ ));
 sky130_fd_sc_hd__nor2_1 \gray_sobel0.sobel0.sobel._1016_  (.A(\gray_sobel0.sobel0.sobel._0173_ ),
    .B(\gray_sobel0.sobel0.sobel._0460_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0461_ ));
 sky130_fd_sc_hd__or2_1 \gray_sobel0.sobel0.sobel._1017_  (.A(\gray_sobel0.sobel0.sobel._0172_ ),
    .B(\gray_sobel0.sobel0.sobel._0155_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0462_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._1018_  (.A(\gray_sobel0.sobel0.sobel._0461_ ),
    .B(\gray_sobel0.sobel0.sobel._0462_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0463_ ));
 sky130_fd_sc_hd__a21oi_1 \gray_sobel0.sobel0.sobel._1019_  (.A1(\gray_sobel0.sobel0.sobel._0166_ ),
    .A2(\gray_sobel0.sobel0.sobel._0171_ ),
    .B1(\gray_sobel0.sobel0.sobel._0170_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0464_ ));
 sky130_fd_sc_hd__nor2_1 \gray_sobel0.sobel0.sobel._1020_  (.A(\gray_sobel0.sobel0.sobel._0460_ ),
    .B(\gray_sobel0.sobel0.sobel._0464_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0465_ ));
 sky130_fd_sc_hd__o21a_1 \gray_sobel0.sobel0.sobel._1021_  (.A1(\gray_sobel0.sobel0.sobel._0129_ ),
    .A2(\gray_sobel0.sobel0.sobel._0196_ ),
    .B1(\gray_sobel0.sobel0.sobel._0179_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0466_ ));
 sky130_fd_sc_hd__a21o_1 \gray_sobel0.sobel0.sobel._1022_  (.A1(\gray_sobel0.sobel0.sobel._0179_ ),
    .A2(\gray_sobel0.sobel0.sobel._0465_ ),
    .B1(\gray_sobel0.sobel0.sobel._0466_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0467_ ));
 sky130_fd_sc_hd__nand2_1 \gray_sobel0.sobel0.sobel._1023_  (.A(\gray_sobel0.sobel0.sobel._0463_ ),
    .B(\gray_sobel0.sobel0.sobel._0467_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0468_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._1024_  (.A(\gray_sobel0.sobel0.sobel._0466_ ),
    .B(\gray_sobel0.sobel0.sobel._0465_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0469_ ));
 sky130_fd_sc_hd__or2_1 \gray_sobel0.sobel0.sobel._1025_  (.A(\gray_sobel0.sobel0.sobel._0463_ ),
    .B(\gray_sobel0.sobel0.sobel._0467_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0470_ ));
 sky130_fd_sc_hd__or3_1 \gray_sobel0.sobel0.sobel._1026_  (.A(\gray_sobel0.sobel0.sobel._0349_ ),
    .B(\gray_sobel0.sobel0.sobel._0350_ ),
    .C(\gray_sobel0.sobel0.sobel._0364_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0471_ ));
 sky130_fd_sc_hd__and3_1 \gray_sobel0.sobel0.sobel._1027_  (.A(\gray_sobel0.sobel0.sobel._0261_ ),
    .B(\gray_sobel0.sobel0.sobel._0394_ ),
    .C(\gray_sobel0.sobel0.sobel._0395_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0472_ ));
 sky130_fd_sc_hd__a21oi_1 \gray_sobel0.sobel0.sobel._1028_  (.A1(\gray_sobel0.sobel0.sobel._0261_ ),
    .A2(\gray_sobel0.sobel0.sobel._0395_ ),
    .B1(\gray_sobel0.sobel0.sobel._0394_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0473_ ));
 sky130_fd_sc_hd__nor2_1 \gray_sobel0.sobel0.sobel._1029_  (.A(\gray_sobel0.sobel0.sobel._0472_ ),
    .B(\gray_sobel0.sobel0.sobel._0473_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0474_ ));
 sky130_fd_sc_hd__o21ba_1 \gray_sobel0.sobel0.sobel._1030_  (.A1(\gray_sobel0.sobel0.sobel._0471_ ),
    .A2(\gray_sobel0.sobel0.sobel._0474_ ),
    .B1_N(\gray_sobel0.sobel0.sobel._0411_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0475_ ));
 sky130_fd_sc_hd__nor2_1 \gray_sobel0.sobel0.sobel._1031_  (.A(\gray_sobel0.sobel0.sobel._0397_ ),
    .B(\gray_sobel0.sobel0.sobel._0472_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0476_ ));
 sky130_fd_sc_hd__nor2_1 \gray_sobel0.sobel0.sobel._1032_  (.A(\gray_sobel0.sobel0.sobel._0396_ ),
    .B(\gray_sobel0.sobel0.sobel._0389_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0477_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._1033_  (.A(\gray_sobel0.sobel0.sobel._0476_ ),
    .B(\gray_sobel0.sobel0.sobel._0477_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0478_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._1034_  (.A(\gray_sobel0.sobel0.sobel._0475_ ),
    .B(\gray_sobel0.sobel0.sobel._0478_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0479_ ));
 sky130_fd_sc_hd__and2b_1 \gray_sobel0.sobel0.sobel._1035_  (.A_N(\gray_sobel0.sobel0.sobel._0411_ ),
    .B(\gray_sobel0.sobel0.sobel._0471_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0480_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._1036_  (.A(\gray_sobel0.sobel0.sobel._0480_ ),
    .B(\gray_sobel0.sobel0.sobel._0474_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0481_ ));
 sky130_fd_sc_hd__o311a_1 \gray_sobel0.sobel0.sobel._1037_  (.A1(\gray_sobel0.sobel0.sobel._0413_ ),
    .A2(\gray_sobel0.sobel0.sobel._0416_ ),
    .A3(\gray_sobel0.sobel0.sobel._0418_ ),
    .B1(\gray_sobel0.sobel0.sobel._0479_ ),
    .C1(\gray_sobel0.sobel0.sobel._0481_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0482_ ));
 sky130_fd_sc_hd__and4_1 \gray_sobel0.sobel0.sobel._1038_  (.A(\gray_sobel0.sobel0.sobel._0468_ ),
    .B(\gray_sobel0.sobel0.sobel._0469_ ),
    .C(\gray_sobel0.sobel0.sobel._0470_ ),
    .D(\gray_sobel0.sobel0.sobel._0482_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0483_ ));
 sky130_fd_sc_hd__o21ai_1 \gray_sobel0.sobel0.sobel._1039_  (.A1(\gray_sobel0.sobel0.sobel._0198_ ),
    .A2(\gray_sobel0.sobel0.sobel._0459_ ),
    .B1(\gray_sobel0.sobel0.sobel._0483_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0484_ ));
 sky130_fd_sc_hd__a31o_1 \gray_sobel0.sobel0.sobel._1040_  (.A1(\gray_sobel0.sobel0.sobel._0414_ ),
    .A2(\gray_sobel0.sobel0.sobel._0419_ ),
    .A3(\gray_sobel0.sobel0.sobel._0458_ ),
    .B1(\gray_sobel0.sobel0.sobel._0484_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0485_ ));
 sky130_fd_sc_hd__buf_2 \gray_sobel0.sobel0.sobel._1041_  (.A(\gray_sobel0.sobel0.sobel._0485_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.out_sobel_core[0] ));
 sky130_fd_sc_hd__nand2_1 \gray_sobel0.sobel0.sobel._1042_  (.A(\gray_sobel0.sobel0.sobel._0183_ ),
    .B(\gray_sobel0.sobel0.sobel._0438_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0486_ ));
 sky130_fd_sc_hd__or2_1 \gray_sobel0.sobel0.sobel._1043_  (.A(\gray_sobel0.sobel0.sobel._0183_ ),
    .B(\gray_sobel0.sobel0.sobel._0438_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0487_ ));
 sky130_fd_sc_hd__a21o_1 \gray_sobel0.sobel0.sobel._1044_  (.A1(\gray_sobel0.sobel0.sobel._0486_ ),
    .A2(\gray_sobel0.sobel0.sobel._0487_ ),
    .B1(\gray_sobel0.sobel0.out_sobel_core[0] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.out_sobel_core[1] ));
 sky130_fd_sc_hd__nand2_1 \gray_sobel0.sobel0.sobel._1045_  (.A(\gray_sobel0.sobel0.sobel._0432_ ),
    .B(\gray_sobel0.sobel0.sobel._0440_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0488_ ));
 sky130_fd_sc_hd__or2_1 \gray_sobel0.sobel0.sobel._1046_  (.A(\gray_sobel0.sobel0.sobel._0432_ ),
    .B(\gray_sobel0.sobel0.sobel._0440_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0489_ ));
 sky130_fd_sc_hd__a21o_1 \gray_sobel0.sobel0.sobel._1047_  (.A1(\gray_sobel0.sobel0.sobel._0488_ ),
    .A2(\gray_sobel0.sobel0.sobel._0489_ ),
    .B1(\gray_sobel0.sobel0.out_sobel_core[0] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.out_sobel_core[2] ));
 sky130_fd_sc_hd__nand2_1 \gray_sobel0.sobel0.sobel._1048_  (.A(\gray_sobel0.sobel0.sobel._0430_ ),
    .B(\gray_sobel0.sobel0.sobel._0488_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0490_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._1049_  (.A(\gray_sobel0.sobel0.sobel._0490_ ),
    .B(\gray_sobel0.sobel0.sobel._0445_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0491_ ));
 sky130_fd_sc_hd__or2b_1 \gray_sobel0.sobel0.sobel._1050_  (.A(\gray_sobel0.sobel0.out_sobel_core[0] ),
    .B_N(\gray_sobel0.sobel0.sobel._0491_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0492_ ));
 sky130_fd_sc_hd__buf_1 \gray_sobel0.sobel0.sobel._1051_  (.A(\gray_sobel0.sobel0.sobel._0492_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.out_sobel_core[3] ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._1052_  (.A(\gray_sobel0.sobel0.sobel._0424_ ),
    .B(\gray_sobel0.sobel0.sobel._0448_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0493_ ));
 sky130_fd_sc_hd__or2_1 \gray_sobel0.sobel0.sobel._1053_  (.A(\gray_sobel0.sobel0.out_sobel_core[0] ),
    .B(\gray_sobel0.sobel0.sobel._0493_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0494_ ));
 sky130_fd_sc_hd__clkbuf_1 \gray_sobel0.sobel0.sobel._1054_  (.A(\gray_sobel0.sobel0.sobel._0494_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.out_sobel_core[4] ));
 sky130_fd_sc_hd__a21o_1 \gray_sobel0.sobel0.sobel._1055_  (.A1(\gray_sobel0.sobel0.sobel._0425_ ),
    .A2(\gray_sobel0.sobel0.sobel._0448_ ),
    .B1(\gray_sobel0.sobel0.sobel._0456_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0495_ ));
 sky130_fd_sc_hd__xnor2_1 \gray_sobel0.sobel0.sobel._1056_  (.A(\gray_sobel0.sobel0.sobel._0495_ ),
    .B(\gray_sobel0.sobel0.sobel._0455_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0496_ ));
 sky130_fd_sc_hd__or2b_1 \gray_sobel0.sobel0.sobel._1057_  (.A(\gray_sobel0.sobel0.out_sobel_core[0] ),
    .B_N(\gray_sobel0.sobel0.sobel._0496_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0497_ ));
 sky130_fd_sc_hd__buf_1 \gray_sobel0.sobel0.sobel._1058_  (.A(\gray_sobel0.sobel0.sobel._0497_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.out_sobel_core[5] ));
 sky130_fd_sc_hd__nand2_1 \gray_sobel0.sobel0.sobel._1059_  (.A(\gray_sobel0.sobel0.sobel._0419_ ),
    .B(\gray_sobel0.sobel0.sobel._0458_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0498_ ));
 sky130_fd_sc_hd__or2_1 \gray_sobel0.sobel0.sobel._1060_  (.A(\gray_sobel0.sobel0.sobel._0419_ ),
    .B(\gray_sobel0.sobel0.sobel._0458_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.sobel._0499_ ));
 sky130_fd_sc_hd__a21o_1 \gray_sobel0.sobel0.sobel._1061_  (.A1(\gray_sobel0.sobel0.sobel._0498_ ),
    .A2(\gray_sobel0.sobel0.sobel._0499_ ),
    .B1(\gray_sobel0.sobel0.out_sobel_core[0] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\gray_sobel0.sobel0.out_sobel_core[6] ));
 sky130_fd_sc_hd__nor3_1 \gray_sobel0.sobel0.sobel._1062_  (.A(\gray_sobel0.sobel0.sobel._0413_ ),
    .B(\gray_sobel0.sobel0.sobel._0416_ ),
    .C(\gray_sobel0.sobel0.sobel._0418_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.sobel._0500_ ));
 sky130_fd_sc_hd__o2111ai_4 \gray_sobel0.sobel0.sobel._1063_  (.A1(\gray_sobel0.sobel0.sobel._0500_ ),
    .A2(\gray_sobel0.sobel0.sobel._0459_ ),
    .B1(\gray_sobel0.sobel0.sobel._0483_ ),
    .C1(\gray_sobel0.sobel0.sobel._0198_ ),
    .D1(\gray_sobel0.sobel0.sobel._0498_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\gray_sobel0.sobel0.out_sobel_core[7] ));
 sky130_fd_sc_hd__buf_1 input1 (.A(rst_n),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net1));
 sky130_fd_sc_hd__clkbuf_2 input2 (.A(ui_in[2]),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net2));
 sky130_fd_sc_hd__clkbuf_4 input3 (.A(ui_in[3]),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net3));
 sky130_fd_sc_hd__clkbuf_4 input4 (.A(ui_in[4]),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net4));
 sky130_fd_sc_hd__buf_1 input5 (.A(ui_in[5]),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net5));
 sky130_fd_sc_hd__clkbuf_1 input6 (.A(uio_in[0]),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net6));
 sky130_fd_sc_hd__clkbuf_1 input7 (.A(uio_in[1]),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net7));
 sky130_fd_sc_hd__clkbuf_1 input8 (.A(uio_in[2]),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(net8));
 sky130_fd_sc_hd__or2_1 \lfsr0._241_  (.A(\lfsr0.lfsr_out[15] ),
    .B(\lfsr0.stop_reg[15] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._073_ ));
 sky130_fd_sc_hd__nand2_1 \lfsr0._242_  (.A(\lfsr0.lfsr_out[15] ),
    .B(\lfsr0.stop_reg[15] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\lfsr0._074_ ));
 sky130_fd_sc_hd__inv_2 \lfsr0._243_  (.A(\lfsr0.lfsr_out[5] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\lfsr0._075_ ));
 sky130_fd_sc_hd__inv_2 \lfsr0._244_  (.A(\lfsr0.lfsr_out[19] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\lfsr0._076_ ));
 sky130_fd_sc_hd__xor2_1 \lfsr0._245_  (.A(\lfsr0.lfsr_out[11] ),
    .B(\lfsr0.stop_reg[11] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._077_ ));
 sky130_fd_sc_hd__a221o_1 \lfsr0._246_  (.A1(\lfsr0._075_ ),
    .A2(\lfsr0.stop_reg[5] ),
    .B1(\lfsr0._076_ ),
    .B2(\lfsr0.stop_reg[19] ),
    .C1(\lfsr0._077_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._078_ ));
 sky130_fd_sc_hd__xor2_1 \lfsr0._247_  (.A(\lfsr0.lfsr_out[1] ),
    .B(\lfsr0.stop_reg[1] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._079_ ));
 sky130_fd_sc_hd__a211o_1 \lfsr0._248_  (.A1(\lfsr0._073_ ),
    .A2(\lfsr0._074_ ),
    .B1(\lfsr0._078_ ),
    .C1(\lfsr0._079_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._080_ ));
 sky130_fd_sc_hd__xor2_1 \lfsr0._249_  (.A(\lfsr0.lfsr_out[4] ),
    .B(\lfsr0.stop_reg[4] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._081_ ));
 sky130_fd_sc_hd__xor2_1 \lfsr0._250_  (.A(\lfsr0.lfsr_out[3] ),
    .B(\lfsr0.stop_reg[3] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._082_ ));
 sky130_fd_sc_hd__xnor2_1 \lfsr0._251_  (.A(\lfsr0.lfsr_out[9] ),
    .B(\lfsr0.stop_reg[9] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\lfsr0._083_ ));
 sky130_fd_sc_hd__o221a_1 \lfsr0._252_  (.A1(\lfsr0._075_ ),
    .A2(\lfsr0.stop_reg[5] ),
    .B1(\lfsr0._076_ ),
    .B2(\lfsr0.stop_reg[19] ),
    .C1(\lfsr0._083_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._084_ ));
 sky130_fd_sc_hd__or3b_1 \lfsr0._253_  (.A(\lfsr0._081_ ),
    .B(\lfsr0._082_ ),
    .C_N(\lfsr0._084_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._085_ ));
 sky130_fd_sc_hd__xor2_1 \lfsr0._254_  (.A(\lfsr0.lfsr_out[7] ),
    .B(\lfsr0.stop_reg[7] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._086_ ));
 sky130_fd_sc_hd__xor2_1 \lfsr0._255_  (.A(\lfsr0.lfsr_out[6] ),
    .B(\lfsr0.stop_reg[6] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._087_ ));
 sky130_fd_sc_hd__xor2_1 \lfsr0._256_  (.A(\lfsr0.lfsr_out[14] ),
    .B(\lfsr0.stop_reg[14] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._088_ ));
 sky130_fd_sc_hd__xor2_1 \lfsr0._257_  (.A(\lfsr0.lfsr_out[8] ),
    .B(\lfsr0.stop_reg[8] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._089_ ));
 sky130_fd_sc_hd__or4_1 \lfsr0._258_  (.A(\lfsr0._086_ ),
    .B(\lfsr0._087_ ),
    .C(\lfsr0._088_ ),
    .D(\lfsr0._089_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._090_ ));
 sky130_fd_sc_hd__xor2_1 \lfsr0._259_  (.A(\lfsr0.lfsr_out[0] ),
    .B(\lfsr0.stop_reg[0] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._091_ ));
 sky130_fd_sc_hd__xor2_1 \lfsr0._260_  (.A(\lfsr0.lfsr_out[22] ),
    .B(\lfsr0.stop_reg[22] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._092_ ));
 sky130_fd_sc_hd__xor2_1 \lfsr0._261_  (.A(\lfsr0.lfsr_out[2] ),
    .B(\lfsr0.stop_reg[2] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._093_ ));
 sky130_fd_sc_hd__xor2_1 \lfsr0._262_  (.A(\lfsr0.lfsr_out[17] ),
    .B(\lfsr0.stop_reg[17] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._094_ ));
 sky130_fd_sc_hd__or4_1 \lfsr0._263_  (.A(\lfsr0._091_ ),
    .B(\lfsr0._092_ ),
    .C(\lfsr0._093_ ),
    .D(\lfsr0._094_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._095_ ));
 sky130_fd_sc_hd__xor2_1 \lfsr0._264_  (.A(\lfsr0.lfsr_out[16] ),
    .B(\lfsr0.stop_reg[16] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._096_ ));
 sky130_fd_sc_hd__xor2_1 \lfsr0._265_  (.A(\lfsr0.lfsr_out[13] ),
    .B(\lfsr0.stop_reg[13] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._097_ ));
 sky130_fd_sc_hd__xor2_1 \lfsr0._266_  (.A(\lfsr0.lfsr_out[23] ),
    .B(\lfsr0.stop_reg[23] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._098_ ));
 sky130_fd_sc_hd__xor2_1 \lfsr0._267_  (.A(\lfsr0.lfsr_out[20] ),
    .B(\lfsr0.stop_reg[20] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._099_ ));
 sky130_fd_sc_hd__or4_1 \lfsr0._268_  (.A(\lfsr0._096_ ),
    .B(\lfsr0._097_ ),
    .C(\lfsr0._098_ ),
    .D(\lfsr0._099_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._100_ ));
 sky130_fd_sc_hd__xor2_1 \lfsr0._269_  (.A(\lfsr0.lfsr_out[10] ),
    .B(\lfsr0.stop_reg[10] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._101_ ));
 sky130_fd_sc_hd__xor2_1 \lfsr0._270_  (.A(\lfsr0.lfsr_out[12] ),
    .B(\lfsr0.stop_reg[12] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._102_ ));
 sky130_fd_sc_hd__xor2_1 \lfsr0._271_  (.A(\lfsr0.lfsr_out[18] ),
    .B(\lfsr0.stop_reg[18] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._103_ ));
 sky130_fd_sc_hd__xor2_1 \lfsr0._272_  (.A(\lfsr0.lfsr_out[21] ),
    .B(\lfsr0.stop_reg[21] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._104_ ));
 sky130_fd_sc_hd__or4_1 \lfsr0._273_  (.A(\lfsr0._101_ ),
    .B(\lfsr0._102_ ),
    .C(\lfsr0._103_ ),
    .D(\lfsr0._104_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._105_ ));
 sky130_fd_sc_hd__or4_1 \lfsr0._274_  (.A(\lfsr0._090_ ),
    .B(\lfsr0._095_ ),
    .C(\lfsr0._100_ ),
    .D(\lfsr0._105_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._106_ ));
 sky130_fd_sc_hd__nor3_4 \lfsr0._275_  (.A(\lfsr0._080_ ),
    .B(\lfsr0._085_ ),
    .C(\lfsr0._106_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\lfsr0._107_ ));
 sky130_fd_sc_hd__buf_4 \lfsr0._276_  (.A(\lfsr0._107_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0.lfsr_done ));
 sky130_fd_sc_hd__clkbuf_4 \lfsr0._277_  (.A(\lfsr0.lfsr_en_i ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._108_ ));
 sky130_fd_sc_hd__and2b_1 \lfsr0._278_  (.A_N(\lfsr0.lfsr_done ),
    .B(\lfsr0._108_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._109_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._279_  (.A(\lfsr0._109_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._000_ ));
 sky130_fd_sc_hd__buf_4 \lfsr0._280_  (.A(\lfsr0.config_i ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._110_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._281_  (.A0(\lfsr0.seed_reg[0] ),
    .A1(\lfsr0.stop_reg[0] ),
    .S(\lfsr0._110_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._111_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._282_  (.A(\lfsr0._111_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0.config_data_o[0] ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._283_  (.A0(\lfsr0.seed_reg[1] ),
    .A1(\lfsr0.stop_reg[1] ),
    .S(\lfsr0._110_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._112_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._284_  (.A(\lfsr0._112_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0.config_data_o[1] ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._285_  (.A0(\lfsr0.seed_reg[2] ),
    .A1(\lfsr0.stop_reg[2] ),
    .S(\lfsr0._110_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._113_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._286_  (.A(\lfsr0._113_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0.config_data_o[2] ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._287_  (.A0(\lfsr0.seed_reg[3] ),
    .A1(\lfsr0.stop_reg[3] ),
    .S(\lfsr0._110_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._114_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._288_  (.A(\lfsr0._114_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0.config_data_o[3] ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._289_  (.A0(\lfsr0.seed_reg[4] ),
    .A1(\lfsr0.stop_reg[4] ),
    .S(\lfsr0._110_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._115_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._290_  (.A(\lfsr0._115_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0.config_data_o[4] ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._291_  (.A0(\lfsr0.seed_reg[5] ),
    .A1(\lfsr0.stop_reg[5] ),
    .S(\lfsr0._110_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._116_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._292_  (.A(\lfsr0._116_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0.config_data_o[5] ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._293_  (.A0(\lfsr0.seed_reg[6] ),
    .A1(\lfsr0.stop_reg[6] ),
    .S(\lfsr0._110_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._117_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._294_  (.A(\lfsr0._117_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0.config_data_o[6] ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._295_  (.A0(\lfsr0.seed_reg[7] ),
    .A1(\lfsr0.stop_reg[7] ),
    .S(\lfsr0._110_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._118_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._296_  (.A(\lfsr0._118_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0.config_data_o[7] ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._297_  (.A0(\lfsr0.seed_reg[8] ),
    .A1(\lfsr0.stop_reg[8] ),
    .S(\lfsr0._110_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._119_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._298_  (.A(\lfsr0._119_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0.config_data_o[8] ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._299_  (.A0(\lfsr0.seed_reg[9] ),
    .A1(\lfsr0.stop_reg[9] ),
    .S(\lfsr0._110_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._120_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._300_  (.A(\lfsr0._120_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0.config_data_o[9] ));
 sky130_fd_sc_hd__buf_4 \lfsr0._301_  (.A(\lfsr0.config_i ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._121_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._302_  (.A0(\lfsr0.seed_reg[10] ),
    .A1(\lfsr0.stop_reg[10] ),
    .S(\lfsr0._121_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._122_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._303_  (.A(\lfsr0._122_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0.config_data_o[10] ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._304_  (.A0(\lfsr0.seed_reg[11] ),
    .A1(\lfsr0.stop_reg[11] ),
    .S(\lfsr0._121_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._123_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._305_  (.A(\lfsr0._123_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0.config_data_o[11] ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._306_  (.A0(\lfsr0.seed_reg[12] ),
    .A1(\lfsr0.stop_reg[12] ),
    .S(\lfsr0._121_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._124_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._307_  (.A(\lfsr0._124_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0.config_data_o[12] ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._308_  (.A0(\lfsr0.seed_reg[13] ),
    .A1(\lfsr0.stop_reg[13] ),
    .S(\lfsr0._121_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._125_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._309_  (.A(\lfsr0._125_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0.config_data_o[13] ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._310_  (.A0(\lfsr0.seed_reg[14] ),
    .A1(\lfsr0.stop_reg[14] ),
    .S(\lfsr0._121_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._126_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._311_  (.A(\lfsr0._126_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0.config_data_o[14] ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._312_  (.A0(\lfsr0.seed_reg[15] ),
    .A1(\lfsr0.stop_reg[15] ),
    .S(\lfsr0._121_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._127_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._313_  (.A(\lfsr0._127_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0.config_data_o[15] ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._314_  (.A0(\lfsr0.seed_reg[16] ),
    .A1(\lfsr0.stop_reg[16] ),
    .S(\lfsr0._121_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._128_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._315_  (.A(\lfsr0._128_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0.config_data_o[16] ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._316_  (.A0(\lfsr0.seed_reg[17] ),
    .A1(\lfsr0.stop_reg[17] ),
    .S(\lfsr0._121_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._129_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._317_  (.A(\lfsr0._129_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0.config_data_o[17] ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._318_  (.A0(\lfsr0.seed_reg[18] ),
    .A1(\lfsr0.stop_reg[18] ),
    .S(\lfsr0._121_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._130_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._319_  (.A(\lfsr0._130_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0.config_data_o[18] ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._320_  (.A0(\lfsr0.seed_reg[19] ),
    .A1(\lfsr0.stop_reg[19] ),
    .S(\lfsr0._121_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._131_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._321_  (.A(\lfsr0._131_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0.config_data_o[19] ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._322_  (.A0(\lfsr0.seed_reg[20] ),
    .A1(\lfsr0.stop_reg[20] ),
    .S(\lfsr0.config_i ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._132_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._323_  (.A(\lfsr0._132_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0.config_data_o[20] ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._324_  (.A0(\lfsr0.seed_reg[21] ),
    .A1(\lfsr0.stop_reg[21] ),
    .S(\lfsr0.config_i ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._133_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._325_  (.A(\lfsr0._133_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0.config_data_o[21] ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._326_  (.A0(\lfsr0.seed_reg[22] ),
    .A1(\lfsr0.stop_reg[22] ),
    .S(\lfsr0.config_i ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._134_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._327_  (.A(\lfsr0._134_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0.config_data_o[22] ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._328_  (.A0(\lfsr0.seed_reg[23] ),
    .A1(\lfsr0.stop_reg[23] ),
    .S(\lfsr0.config_i ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._135_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._329_  (.A(\lfsr0._135_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0.config_data_o[23] ));
 sky130_fd_sc_hd__nand2_2 \lfsr0._330_  (.A(\lfsr0.config_rdy_i ),
    .B(\lfsr0.config_i ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\lfsr0._136_ ));
 sky130_fd_sc_hd__buf_4 \lfsr0._331_  (.A(\lfsr0._136_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._137_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._332_  (.A0(\lfsr0.config_data_i[0] ),
    .A1(\lfsr0.stop_reg[0] ),
    .S(\lfsr0._137_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._138_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._333_  (.A(\lfsr0._138_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._001_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._334_  (.A0(\lfsr0.config_data_i[1] ),
    .A1(\lfsr0.stop_reg[1] ),
    .S(\lfsr0._137_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._139_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._335_  (.A(\lfsr0._139_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._002_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._336_  (.A0(\lfsr0.config_data_i[2] ),
    .A1(\lfsr0.stop_reg[2] ),
    .S(\lfsr0._137_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._140_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._337_  (.A(\lfsr0._140_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._003_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._338_  (.A0(\lfsr0.config_data_i[3] ),
    .A1(\lfsr0.stop_reg[3] ),
    .S(\lfsr0._137_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._141_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._339_  (.A(\lfsr0._141_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._004_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._340_  (.A0(\lfsr0.config_data_i[4] ),
    .A1(\lfsr0.stop_reg[4] ),
    .S(\lfsr0._137_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._142_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._341_  (.A(\lfsr0._142_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._005_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._342_  (.A0(\lfsr0.config_data_i[5] ),
    .A1(\lfsr0.stop_reg[5] ),
    .S(\lfsr0._137_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._143_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._343_  (.A(\lfsr0._143_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._006_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._344_  (.A0(\lfsr0.config_data_i[6] ),
    .A1(\lfsr0.stop_reg[6] ),
    .S(\lfsr0._137_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._144_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._345_  (.A(\lfsr0._144_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._007_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._346_  (.A0(\lfsr0.config_data_i[7] ),
    .A1(\lfsr0.stop_reg[7] ),
    .S(\lfsr0._137_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._145_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._347_  (.A(\lfsr0._145_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._008_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._348_  (.A0(\lfsr0.config_data_i[8] ),
    .A1(\lfsr0.stop_reg[8] ),
    .S(\lfsr0._137_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._146_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._349_  (.A(\lfsr0._146_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._009_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._350_  (.A0(\lfsr0.config_data_i[9] ),
    .A1(\lfsr0.stop_reg[9] ),
    .S(\lfsr0._137_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._147_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._351_  (.A(\lfsr0._147_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._010_ ));
 sky130_fd_sc_hd__buf_4 \lfsr0._352_  (.A(\lfsr0._136_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._148_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._353_  (.A0(\lfsr0.config_data_i[10] ),
    .A1(\lfsr0.stop_reg[10] ),
    .S(\lfsr0._148_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._149_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._354_  (.A(\lfsr0._149_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._011_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._355_  (.A0(\lfsr0.config_data_i[11] ),
    .A1(\lfsr0.stop_reg[11] ),
    .S(\lfsr0._148_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._150_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._356_  (.A(\lfsr0._150_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._012_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._357_  (.A0(\lfsr0.config_data_i[12] ),
    .A1(\lfsr0.stop_reg[12] ),
    .S(\lfsr0._148_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._151_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._358_  (.A(\lfsr0._151_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._013_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._359_  (.A0(\lfsr0.config_data_i[13] ),
    .A1(\lfsr0.stop_reg[13] ),
    .S(\lfsr0._148_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._152_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._360_  (.A(\lfsr0._152_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._014_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._361_  (.A0(\lfsr0.config_data_i[14] ),
    .A1(\lfsr0.stop_reg[14] ),
    .S(\lfsr0._148_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._153_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._362_  (.A(\lfsr0._153_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._015_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._363_  (.A0(\lfsr0.config_data_i[15] ),
    .A1(\lfsr0.stop_reg[15] ),
    .S(\lfsr0._148_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._154_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._364_  (.A(\lfsr0._154_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._016_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._365_  (.A0(\lfsr0.config_data_i[16] ),
    .A1(\lfsr0.stop_reg[16] ),
    .S(\lfsr0._148_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._155_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._366_  (.A(\lfsr0._155_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._017_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._367_  (.A0(\lfsr0.config_data_i[17] ),
    .A1(\lfsr0.stop_reg[17] ),
    .S(\lfsr0._148_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._156_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._368_  (.A(\lfsr0._156_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._018_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._369_  (.A0(\lfsr0.config_data_i[18] ),
    .A1(\lfsr0.stop_reg[18] ),
    .S(\lfsr0._148_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._157_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._370_  (.A(\lfsr0._157_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._019_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._371_  (.A0(\lfsr0.config_data_i[19] ),
    .A1(\lfsr0.stop_reg[19] ),
    .S(\lfsr0._148_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._158_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._372_  (.A(\lfsr0._158_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._020_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._373_  (.A0(\lfsr0.config_data_i[20] ),
    .A1(\lfsr0.stop_reg[20] ),
    .S(\lfsr0._136_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._159_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._374_  (.A(\lfsr0._159_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._021_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._375_  (.A0(\lfsr0.config_data_i[21] ),
    .A1(\lfsr0.stop_reg[21] ),
    .S(\lfsr0._136_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._160_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._376_  (.A(\lfsr0._160_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._022_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._377_  (.A0(\lfsr0.config_data_i[22] ),
    .A1(\lfsr0.stop_reg[22] ),
    .S(\lfsr0._136_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._161_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._378_  (.A(\lfsr0._161_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._023_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._379_  (.A0(\lfsr0.config_data_i[23] ),
    .A1(\lfsr0.stop_reg[23] ),
    .S(\lfsr0._136_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._162_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._380_  (.A(\lfsr0._162_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._024_ ));
 sky130_fd_sc_hd__xnor2_1 \lfsr0._381_  (.A(\lfsr0.lfsr_out[3] ),
    .B(\lfsr0.lfsr_out[12] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\lfsr0._163_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._382_  (.A0(\lfsr0.seed_reg[0] ),
    .A1(\lfsr0._163_ ),
    .S(\lfsr0._108_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._164_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._383_  (.A0(\lfsr0._164_ ),
    .A1(\lfsr0.lfsr_out[0] ),
    .S(\lfsr0.lfsr_done ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._165_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._384_  (.A(\lfsr0._165_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._025_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._385_  (.A0(\lfsr0.seed_reg[1] ),
    .A1(\lfsr0.lfsr_out[0] ),
    .S(\lfsr0._108_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._166_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._386_  (.A0(\lfsr0._166_ ),
    .A1(\lfsr0.lfsr_out[1] ),
    .S(\lfsr0.lfsr_done ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._167_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._387_  (.A(\lfsr0._167_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._026_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._388_  (.A0(\lfsr0.seed_reg[2] ),
    .A1(\lfsr0.lfsr_out[1] ),
    .S(\lfsr0._108_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._168_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._389_  (.A0(\lfsr0._168_ ),
    .A1(\lfsr0.lfsr_out[2] ),
    .S(\lfsr0.lfsr_done ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._169_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._390_  (.A(\lfsr0._169_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._027_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._391_  (.A0(\lfsr0.seed_reg[3] ),
    .A1(\lfsr0.lfsr_out[2] ),
    .S(\lfsr0._108_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._170_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._392_  (.A0(\lfsr0._170_ ),
    .A1(\lfsr0.lfsr_out[3] ),
    .S(\lfsr0.lfsr_done ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._171_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._393_  (.A(\lfsr0._171_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._028_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._394_  (.A0(\lfsr0.seed_reg[4] ),
    .A1(\lfsr0.lfsr_out[3] ),
    .S(\lfsr0._108_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._172_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._395_  (.A0(\lfsr0._172_ ),
    .A1(\lfsr0.lfsr_out[4] ),
    .S(\lfsr0.lfsr_done ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._173_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._396_  (.A(\lfsr0._173_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._029_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._397_  (.A0(\lfsr0.seed_reg[5] ),
    .A1(\lfsr0.lfsr_out[4] ),
    .S(\lfsr0._108_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._174_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._398_  (.A0(\lfsr0._174_ ),
    .A1(\lfsr0.lfsr_out[5] ),
    .S(\lfsr0.lfsr_done ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._175_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._399_  (.A(\lfsr0._175_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._030_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._400_  (.A0(\lfsr0.seed_reg[6] ),
    .A1(\lfsr0.lfsr_out[5] ),
    .S(\lfsr0._108_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._176_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._401_  (.A0(\lfsr0._176_ ),
    .A1(\lfsr0.lfsr_out[6] ),
    .S(\lfsr0.lfsr_done ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._177_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._402_  (.A(\lfsr0._177_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._031_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._403_  (.A0(\lfsr0.seed_reg[7] ),
    .A1(\lfsr0.lfsr_out[6] ),
    .S(\lfsr0._108_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._178_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._404_  (.A0(\lfsr0._178_ ),
    .A1(\lfsr0.lfsr_out[7] ),
    .S(\lfsr0.lfsr_done ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._179_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._405_  (.A(\lfsr0._179_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._032_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._406_  (.A0(\lfsr0.seed_reg[8] ),
    .A1(\lfsr0.lfsr_out[7] ),
    .S(\lfsr0._108_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._180_ ));
 sky130_fd_sc_hd__buf_4 \lfsr0._407_  (.A(\lfsr0._107_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._181_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._408_  (.A0(\lfsr0._180_ ),
    .A1(\lfsr0.lfsr_out[8] ),
    .S(\lfsr0._181_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._182_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._409_  (.A(\lfsr0._182_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._033_ ));
 sky130_fd_sc_hd__buf_4 \lfsr0._410_  (.A(\lfsr0.lfsr_en_i ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._183_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._411_  (.A0(\lfsr0.seed_reg[9] ),
    .A1(\lfsr0.lfsr_out[8] ),
    .S(\lfsr0._183_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._184_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._412_  (.A0(\lfsr0._184_ ),
    .A1(\lfsr0.lfsr_out[9] ),
    .S(\lfsr0._181_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._185_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._413_  (.A(\lfsr0._185_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._034_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._414_  (.A0(\lfsr0.seed_reg[10] ),
    .A1(\lfsr0.lfsr_out[9] ),
    .S(\lfsr0._183_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._186_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._415_  (.A0(\lfsr0._186_ ),
    .A1(\lfsr0.lfsr_out[10] ),
    .S(\lfsr0._181_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._187_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._416_  (.A(\lfsr0._187_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._035_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._417_  (.A0(\lfsr0.seed_reg[11] ),
    .A1(\lfsr0.lfsr_out[10] ),
    .S(\lfsr0._183_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._188_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._418_  (.A0(\lfsr0._188_ ),
    .A1(\lfsr0.lfsr_out[11] ),
    .S(\lfsr0._181_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._189_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._419_  (.A(\lfsr0._189_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._036_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._420_  (.A0(\lfsr0.seed_reg[12] ),
    .A1(\lfsr0.lfsr_out[11] ),
    .S(\lfsr0._183_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._190_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._421_  (.A0(\lfsr0._190_ ),
    .A1(\lfsr0.lfsr_out[12] ),
    .S(\lfsr0._181_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._191_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._422_  (.A(\lfsr0._191_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._037_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._423_  (.A0(\lfsr0.seed_reg[13] ),
    .A1(\lfsr0.lfsr_out[12] ),
    .S(\lfsr0._183_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._192_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._424_  (.A0(\lfsr0._192_ ),
    .A1(\lfsr0.lfsr_out[13] ),
    .S(\lfsr0._181_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._193_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._425_  (.A(\lfsr0._193_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._038_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._426_  (.A0(\lfsr0.seed_reg[14] ),
    .A1(\lfsr0.lfsr_out[13] ),
    .S(\lfsr0._183_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._194_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._427_  (.A0(\lfsr0._194_ ),
    .A1(\lfsr0.lfsr_out[14] ),
    .S(\lfsr0._181_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._195_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._428_  (.A(\lfsr0._195_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._039_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._429_  (.A0(\lfsr0.seed_reg[15] ),
    .A1(\lfsr0.lfsr_out[14] ),
    .S(\lfsr0._183_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._196_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._430_  (.A0(\lfsr0._196_ ),
    .A1(\lfsr0.lfsr_out[15] ),
    .S(\lfsr0._181_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._197_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._431_  (.A(\lfsr0._197_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._040_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._432_  (.A0(\lfsr0.seed_reg[16] ),
    .A1(\lfsr0.lfsr_out[15] ),
    .S(\lfsr0._183_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._198_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._433_  (.A0(\lfsr0._198_ ),
    .A1(\lfsr0.lfsr_out[16] ),
    .S(\lfsr0._181_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._199_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._434_  (.A(\lfsr0._199_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._041_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._435_  (.A0(\lfsr0.seed_reg[17] ),
    .A1(\lfsr0.lfsr_out[16] ),
    .S(\lfsr0._183_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._200_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._436_  (.A0(\lfsr0._200_ ),
    .A1(\lfsr0.lfsr_out[17] ),
    .S(\lfsr0._181_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._201_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._437_  (.A(\lfsr0._201_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._042_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._438_  (.A0(\lfsr0.seed_reg[18] ),
    .A1(\lfsr0.lfsr_out[17] ),
    .S(\lfsr0._183_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._202_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._439_  (.A0(\lfsr0._202_ ),
    .A1(\lfsr0.lfsr_out[18] ),
    .S(\lfsr0._107_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._203_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._440_  (.A(\lfsr0._203_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._043_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._441_  (.A0(\lfsr0.seed_reg[19] ),
    .A1(\lfsr0.lfsr_out[18] ),
    .S(\lfsr0.lfsr_en_i ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._204_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._442_  (.A0(\lfsr0._204_ ),
    .A1(\lfsr0.lfsr_out[19] ),
    .S(\lfsr0._107_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._205_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._443_  (.A(\lfsr0._205_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._044_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._444_  (.A0(\lfsr0.seed_reg[20] ),
    .A1(\lfsr0.lfsr_out[19] ),
    .S(\lfsr0.lfsr_en_i ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._206_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._445_  (.A0(\lfsr0._206_ ),
    .A1(\lfsr0.lfsr_out[20] ),
    .S(\lfsr0._107_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._207_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._446_  (.A(\lfsr0._207_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._045_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._447_  (.A0(\lfsr0.seed_reg[21] ),
    .A1(\lfsr0.lfsr_out[20] ),
    .S(\lfsr0.lfsr_en_i ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._208_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._448_  (.A0(\lfsr0._208_ ),
    .A1(\lfsr0.lfsr_out[21] ),
    .S(\lfsr0._107_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._209_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._449_  (.A(\lfsr0._209_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._046_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._450_  (.A0(\lfsr0.seed_reg[22] ),
    .A1(\lfsr0.lfsr_out[21] ),
    .S(\lfsr0.lfsr_en_i ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._210_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._451_  (.A0(\lfsr0._210_ ),
    .A1(\lfsr0.lfsr_out[22] ),
    .S(\lfsr0._107_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._211_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._452_  (.A(\lfsr0._211_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._047_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._453_  (.A0(\lfsr0.seed_reg[23] ),
    .A1(\lfsr0.lfsr_out[22] ),
    .S(\lfsr0.lfsr_en_i ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._212_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._454_  (.A0(\lfsr0._212_ ),
    .A1(\lfsr0.lfsr_out[23] ),
    .S(\lfsr0._107_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._213_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._455_  (.A(\lfsr0._213_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._048_ ));
 sky130_fd_sc_hd__nor2b_2 \lfsr0._456_  (.A(\lfsr0.config_i ),
    .B_N(\lfsr0.config_rdy_i ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\lfsr0._214_ ));
 sky130_fd_sc_hd__buf_4 \lfsr0._457_  (.A(\lfsr0._214_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._215_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._458_  (.A0(\lfsr0.seed_reg[0] ),
    .A1(\lfsr0.config_data_i[0] ),
    .S(\lfsr0._215_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._216_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._459_  (.A(\lfsr0._216_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._049_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._460_  (.A0(\lfsr0.seed_reg[1] ),
    .A1(\lfsr0.config_data_i[1] ),
    .S(\lfsr0._215_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._217_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._461_  (.A(\lfsr0._217_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._050_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._462_  (.A0(\lfsr0.seed_reg[2] ),
    .A1(\lfsr0.config_data_i[2] ),
    .S(\lfsr0._215_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._218_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._463_  (.A(\lfsr0._218_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._051_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._464_  (.A0(\lfsr0.seed_reg[3] ),
    .A1(\lfsr0.config_data_i[3] ),
    .S(\lfsr0._215_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._219_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._465_  (.A(\lfsr0._219_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._052_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._466_  (.A0(\lfsr0.seed_reg[4] ),
    .A1(\lfsr0.config_data_i[4] ),
    .S(\lfsr0._215_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._220_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._467_  (.A(\lfsr0._220_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._053_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._468_  (.A0(\lfsr0.seed_reg[5] ),
    .A1(\lfsr0.config_data_i[5] ),
    .S(\lfsr0._215_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._221_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._469_  (.A(\lfsr0._221_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._054_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._470_  (.A0(\lfsr0.seed_reg[6] ),
    .A1(\lfsr0.config_data_i[6] ),
    .S(\lfsr0._215_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._222_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._471_  (.A(\lfsr0._222_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._055_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._472_  (.A0(\lfsr0.seed_reg[7] ),
    .A1(\lfsr0.config_data_i[7] ),
    .S(\lfsr0._215_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._223_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._473_  (.A(\lfsr0._223_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._056_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._474_  (.A0(\lfsr0.seed_reg[8] ),
    .A1(\lfsr0.config_data_i[8] ),
    .S(\lfsr0._215_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._224_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._475_  (.A(\lfsr0._224_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._057_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._476_  (.A0(\lfsr0.seed_reg[9] ),
    .A1(\lfsr0.config_data_i[9] ),
    .S(\lfsr0._215_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._225_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._477_  (.A(\lfsr0._225_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._058_ ));
 sky130_fd_sc_hd__buf_4 \lfsr0._478_  (.A(\lfsr0._214_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._226_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._479_  (.A0(\lfsr0.seed_reg[10] ),
    .A1(\lfsr0.config_data_i[10] ),
    .S(\lfsr0._226_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._227_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._480_  (.A(\lfsr0._227_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._059_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._481_  (.A0(\lfsr0.seed_reg[11] ),
    .A1(\lfsr0.config_data_i[11] ),
    .S(\lfsr0._226_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._228_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._482_  (.A(\lfsr0._228_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._060_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._483_  (.A0(\lfsr0.seed_reg[12] ),
    .A1(\lfsr0.config_data_i[12] ),
    .S(\lfsr0._226_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._229_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._484_  (.A(\lfsr0._229_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._061_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._485_  (.A0(\lfsr0.seed_reg[13] ),
    .A1(\lfsr0.config_data_i[13] ),
    .S(\lfsr0._226_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._230_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._486_  (.A(\lfsr0._230_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._062_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._487_  (.A0(\lfsr0.seed_reg[14] ),
    .A1(\lfsr0.config_data_i[14] ),
    .S(\lfsr0._226_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._231_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._488_  (.A(\lfsr0._231_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._063_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._489_  (.A0(\lfsr0.seed_reg[15] ),
    .A1(\lfsr0.config_data_i[15] ),
    .S(\lfsr0._226_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._232_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._490_  (.A(\lfsr0._232_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._064_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._491_  (.A0(\lfsr0.seed_reg[16] ),
    .A1(\lfsr0.config_data_i[16] ),
    .S(\lfsr0._226_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._233_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._492_  (.A(\lfsr0._233_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._065_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._493_  (.A0(\lfsr0.seed_reg[17] ),
    .A1(\lfsr0.config_data_i[17] ),
    .S(\lfsr0._226_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._234_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._494_  (.A(\lfsr0._234_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._066_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._495_  (.A0(\lfsr0.seed_reg[18] ),
    .A1(\lfsr0.config_data_i[18] ),
    .S(\lfsr0._226_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._235_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._496_  (.A(\lfsr0._235_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._067_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._497_  (.A0(\lfsr0.seed_reg[19] ),
    .A1(\lfsr0.config_data_i[19] ),
    .S(\lfsr0._226_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._236_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._498_  (.A(\lfsr0._236_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._068_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._499_  (.A0(\lfsr0.seed_reg[20] ),
    .A1(\lfsr0.config_data_i[20] ),
    .S(\lfsr0._214_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._237_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._500_  (.A(\lfsr0._237_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._069_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._501_  (.A0(\lfsr0.seed_reg[21] ),
    .A1(\lfsr0.config_data_i[21] ),
    .S(\lfsr0._214_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._238_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._502_  (.A(\lfsr0._238_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._070_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._503_  (.A0(\lfsr0.seed_reg[22] ),
    .A1(\lfsr0.config_data_i[22] ),
    .S(\lfsr0._214_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._239_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._504_  (.A(\lfsr0._239_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._071_ ));
 sky130_fd_sc_hd__mux2_1 \lfsr0._505_  (.A0(\lfsr0.seed_reg[23] ),
    .A1(\lfsr0.config_data_i[23] ),
    .S(\lfsr0._214_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._240_ ));
 sky130_fd_sc_hd__clkbuf_1 \lfsr0._506_  (.A(\lfsr0._240_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\lfsr0._072_ ));
 sky130_fd_sc_hd__dfrtp_1 \lfsr0._507_  (.CLK(clknet_leaf_8_clk),
    .D(\lfsr0._001_ ),
    .RESET_B(net27),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\lfsr0.stop_reg[0] ));
 sky130_fd_sc_hd__dfrtp_1 \lfsr0._508_  (.CLK(clknet_leaf_7_clk),
    .D(\lfsr0._002_ ),
    .RESET_B(net30),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\lfsr0.stop_reg[1] ));
 sky130_fd_sc_hd__dfrtp_1 \lfsr0._509_  (.CLK(clknet_leaf_7_clk),
    .D(\lfsr0._003_ ),
    .RESET_B(net29),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\lfsr0.stop_reg[2] ));
 sky130_fd_sc_hd__dfrtp_1 \lfsr0._510_  (.CLK(clknet_leaf_8_clk),
    .D(\lfsr0._004_ ),
    .RESET_B(net27),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\lfsr0.stop_reg[3] ));
 sky130_fd_sc_hd__dfrtp_1 \lfsr0._511_  (.CLK(clknet_leaf_2_clk),
    .D(\lfsr0._005_ ),
    .RESET_B(net26),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\lfsr0.stop_reg[4] ));
 sky130_fd_sc_hd__dfrtp_1 \lfsr0._512_  (.CLK(clknet_leaf_1_clk),
    .D(\lfsr0._006_ ),
    .RESET_B(net15),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\lfsr0.stop_reg[5] ));
 sky130_fd_sc_hd__dfrtp_1 \lfsr0._513_  (.CLK(clknet_leaf_20_clk),
    .D(\lfsr0._007_ ),
    .RESET_B(net14),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\lfsr0.stop_reg[6] ));
 sky130_fd_sc_hd__dfrtp_1 \lfsr0._514_  (.CLK(clknet_leaf_1_clk),
    .D(\lfsr0._008_ ),
    .RESET_B(net14),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\lfsr0.stop_reg[7] ));
 sky130_fd_sc_hd__dfrtp_1 \lfsr0._515_  (.CLK(clknet_leaf_21_clk),
    .D(\lfsr0._009_ ),
    .RESET_B(net14),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\lfsr0.stop_reg[8] ));
 sky130_fd_sc_hd__dfrtp_1 \lfsr0._516_  (.CLK(clknet_leaf_1_clk),
    .D(\lfsr0._010_ ),
    .RESET_B(net15),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\lfsr0.stop_reg[9] ));
 sky130_fd_sc_hd__dfrtp_1 \lfsr0._517_  (.CLK(clknet_leaf_0_clk),
    .D(\lfsr0._011_ ),
    .RESET_B(net12),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\lfsr0.stop_reg[10] ));
 sky130_fd_sc_hd__dfrtp_1 \lfsr0._518_  (.CLK(clknet_leaf_23_clk),
    .D(\lfsr0._012_ ),
    .RESET_B(net9),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\lfsr0.stop_reg[11] ));
 sky130_fd_sc_hd__dfrtp_1 \lfsr0._519_  (.CLK(clknet_leaf_23_clk),
    .D(\lfsr0._013_ ),
    .RESET_B(net12),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\lfsr0.stop_reg[12] ));
 sky130_fd_sc_hd__dfrtp_1 \lfsr0._520_  (.CLK(clknet_leaf_0_clk),
    .D(\lfsr0._014_ ),
    .RESET_B(net9),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\lfsr0.stop_reg[13] ));
 sky130_fd_sc_hd__dfrtp_1 \lfsr0._521_  (.CLK(clknet_leaf_0_clk),
    .D(\lfsr0._015_ ),
    .RESET_B(net12),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\lfsr0.stop_reg[14] ));
 sky130_fd_sc_hd__dfrtp_1 \lfsr0._522_  (.CLK(clknet_leaf_1_clk),
    .D(\lfsr0._016_ ),
    .RESET_B(net13),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\lfsr0.stop_reg[15] ));
 sky130_fd_sc_hd__dfrtp_1 \lfsr0._523_  (.CLK(clknet_leaf_0_clk),
    .D(\lfsr0._017_ ),
    .RESET_B(net13),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\lfsr0.stop_reg[16] ));
 sky130_fd_sc_hd__dfrtp_1 \lfsr0._524_  (.CLK(clknet_leaf_4_clk),
    .D(\lfsr0._018_ ),
    .RESET_B(net24),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\lfsr0.stop_reg[17] ));
 sky130_fd_sc_hd__dfrtp_1 \lfsr0._525_  (.CLK(clknet_leaf_4_clk),
    .D(\lfsr0._019_ ),
    .RESET_B(net23),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\lfsr0.stop_reg[18] ));
 sky130_fd_sc_hd__dfrtp_1 \lfsr0._526_  (.CLK(clknet_leaf_3_clk),
    .D(\lfsr0._020_ ),
    .RESET_B(net25),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\lfsr0.stop_reg[19] ));
 sky130_fd_sc_hd__dfrtp_1 \lfsr0._527_  (.CLK(clknet_leaf_3_clk),
    .D(\lfsr0._021_ ),
    .RESET_B(net23),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\lfsr0.stop_reg[20] ));
 sky130_fd_sc_hd__dfrtp_1 \lfsr0._528_  (.CLK(clknet_leaf_4_clk),
    .D(\lfsr0._022_ ),
    .RESET_B(net24),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\lfsr0.stop_reg[21] ));
 sky130_fd_sc_hd__dfrtp_1 \lfsr0._529_  (.CLK(clknet_leaf_3_clk),
    .D(\lfsr0._023_ ),
    .RESET_B(net27),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\lfsr0.stop_reg[22] ));
 sky130_fd_sc_hd__dfrtp_1 \lfsr0._530_  (.CLK(clknet_leaf_2_clk),
    .D(\lfsr0._024_ ),
    .RESET_B(net26),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\lfsr0.stop_reg[23] ));
 sky130_fd_sc_hd__dfrtp_1 \lfsr0._531_  (.CLK(clknet_leaf_2_clk),
    .D(\lfsr0._000_ ),
    .RESET_B(net26),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\lfsr0.lfsr_rdy_o ));
 sky130_fd_sc_hd__dfrtp_1 \lfsr0._532_  (.CLK(clknet_leaf_7_clk),
    .D(\lfsr0.config_rdy_i ),
    .RESET_B(net29),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\lfsr0.config_done_o ));
 sky130_fd_sc_hd__dfrtp_1 \lfsr0._533_  (.CLK(clknet_leaf_2_clk),
    .D(\lfsr0._025_ ),
    .RESET_B(net27),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\lfsr0.lfsr_out[0] ));
 sky130_fd_sc_hd__dfrtp_1 \lfsr0._534_  (.CLK(clknet_leaf_8_clk),
    .D(\lfsr0._026_ ),
    .RESET_B(net27),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\lfsr0.lfsr_out[1] ));
 sky130_fd_sc_hd__dfrtp_1 \lfsr0._535_  (.CLK(clknet_leaf_8_clk),
    .D(\lfsr0._027_ ),
    .RESET_B(net27),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\lfsr0.lfsr_out[2] ));
 sky130_fd_sc_hd__dfrtp_2 \lfsr0._536_  (.CLK(clknet_leaf_8_clk),
    .D(\lfsr0._028_ ),
    .RESET_B(net26),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\lfsr0.lfsr_out[3] ));
 sky130_fd_sc_hd__dfrtp_1 \lfsr0._537_  (.CLK(clknet_leaf_2_clk),
    .D(\lfsr0._029_ ),
    .RESET_B(net26),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\lfsr0.lfsr_out[4] ));
 sky130_fd_sc_hd__dfrtp_1 \lfsr0._538_  (.CLK(clknet_leaf_1_clk),
    .D(\lfsr0._030_ ),
    .RESET_B(net15),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\lfsr0.lfsr_out[5] ));
 sky130_fd_sc_hd__dfrtp_1 \lfsr0._539_  (.CLK(clknet_leaf_20_clk),
    .D(\lfsr0._031_ ),
    .RESET_B(net15),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\lfsr0.lfsr_out[6] ));
 sky130_fd_sc_hd__dfrtp_1 \lfsr0._540_  (.CLK(clknet_leaf_21_clk),
    .D(\lfsr0._032_ ),
    .RESET_B(net14),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\lfsr0.lfsr_out[7] ));
 sky130_fd_sc_hd__dfrtp_1 \lfsr0._541_  (.CLK(clknet_leaf_1_clk),
    .D(\lfsr0._033_ ),
    .RESET_B(net14),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\lfsr0.lfsr_out[8] ));
 sky130_fd_sc_hd__dfrtp_1 \lfsr0._542_  (.CLK(clknet_leaf_1_clk),
    .D(\lfsr0._034_ ),
    .RESET_B(net13),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\lfsr0.lfsr_out[9] ));
 sky130_fd_sc_hd__dfrtp_1 \lfsr0._543_  (.CLK(clknet_leaf_0_clk),
    .D(\lfsr0._035_ ),
    .RESET_B(net12),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\lfsr0.lfsr_out[10] ));
 sky130_fd_sc_hd__dfrtp_1 \lfsr0._544_  (.CLK(clknet_leaf_23_clk),
    .D(\lfsr0._036_ ),
    .RESET_B(net9),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\lfsr0.lfsr_out[11] ));
 sky130_fd_sc_hd__dfrtp_4 \lfsr0._545_  (.CLK(clknet_leaf_23_clk),
    .D(\lfsr0._037_ ),
    .RESET_B(net9),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\lfsr0.lfsr_out[12] ));
 sky130_fd_sc_hd__dfrtp_1 \lfsr0._546_  (.CLK(clknet_leaf_23_clk),
    .D(\lfsr0._038_ ),
    .RESET_B(net9),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\lfsr0.lfsr_out[13] ));
 sky130_fd_sc_hd__dfrtp_1 \lfsr0._547_  (.CLK(clknet_leaf_0_clk),
    .D(\lfsr0._039_ ),
    .RESET_B(net12),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\lfsr0.lfsr_out[14] ));
 sky130_fd_sc_hd__dfrtp_1 \lfsr0._548_  (.CLK(clknet_leaf_0_clk),
    .D(\lfsr0._040_ ),
    .RESET_B(net13),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\lfsr0.lfsr_out[15] ));
 sky130_fd_sc_hd__dfrtp_2 \lfsr0._549_  (.CLK(clknet_leaf_0_clk),
    .D(\lfsr0._041_ ),
    .RESET_B(net12),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\lfsr0.lfsr_out[16] ));
 sky130_fd_sc_hd__dfrtp_1 \lfsr0._550_  (.CLK(clknet_leaf_4_clk),
    .D(\lfsr0._042_ ),
    .RESET_B(net23),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\lfsr0.lfsr_out[17] ));
 sky130_fd_sc_hd__dfrtp_1 \lfsr0._551_  (.CLK(clknet_leaf_4_clk),
    .D(\lfsr0._043_ ),
    .RESET_B(net23),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\lfsr0.lfsr_out[18] ));
 sky130_fd_sc_hd__dfrtp_2 \lfsr0._552_  (.CLK(clknet_leaf_4_clk),
    .D(\lfsr0._044_ ),
    .RESET_B(net23),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\lfsr0.lfsr_out[19] ));
 sky130_fd_sc_hd__dfrtp_1 \lfsr0._553_  (.CLK(clknet_leaf_4_clk),
    .D(\lfsr0._045_ ),
    .RESET_B(net24),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\lfsr0.lfsr_out[20] ));
 sky130_fd_sc_hd__dfrtp_1 \lfsr0._554_  (.CLK(clknet_leaf_4_clk),
    .D(\lfsr0._046_ ),
    .RESET_B(net24),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\lfsr0.lfsr_out[21] ));
 sky130_fd_sc_hd__dfrtp_1 \lfsr0._555_  (.CLK(clknet_leaf_3_clk),
    .D(\lfsr0._047_ ),
    .RESET_B(net27),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\lfsr0.lfsr_out[22] ));
 sky130_fd_sc_hd__dfrtp_1 \lfsr0._556_  (.CLK(clknet_leaf_3_clk),
    .D(\lfsr0._048_ ),
    .RESET_B(net26),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\lfsr0.lfsr_out[23] ));
 sky130_fd_sc_hd__dfrtp_1 \lfsr0._557_  (.CLK(clknet_leaf_8_clk),
    .D(\lfsr0._049_ ),
    .RESET_B(net27),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\lfsr0.seed_reg[0] ));
 sky130_fd_sc_hd__dfrtp_1 \lfsr0._558_  (.CLK(clknet_leaf_7_clk),
    .D(\lfsr0._050_ ),
    .RESET_B(net30),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\lfsr0.seed_reg[1] ));
 sky130_fd_sc_hd__dfrtp_1 \lfsr0._559_  (.CLK(clknet_leaf_7_clk),
    .D(\lfsr0._051_ ),
    .RESET_B(net29),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\lfsr0.seed_reg[2] ));
 sky130_fd_sc_hd__dfrtp_1 \lfsr0._560_  (.CLK(clknet_leaf_8_clk),
    .D(\lfsr0._052_ ),
    .RESET_B(net27),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\lfsr0.seed_reg[3] ));
 sky130_fd_sc_hd__dfrtp_1 \lfsr0._561_  (.CLK(clknet_leaf_2_clk),
    .D(\lfsr0._053_ ),
    .RESET_B(net26),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\lfsr0.seed_reg[4] ));
 sky130_fd_sc_hd__dfrtp_1 \lfsr0._562_  (.CLK(clknet_leaf_1_clk),
    .D(\lfsr0._054_ ),
    .RESET_B(net15),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\lfsr0.seed_reg[5] ));
 sky130_fd_sc_hd__dfrtp_1 \lfsr0._563_  (.CLK(clknet_leaf_19_clk),
    .D(\lfsr0._055_ ),
    .RESET_B(net14),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\lfsr0.seed_reg[6] ));
 sky130_fd_sc_hd__dfrtp_1 \lfsr0._564_  (.CLK(clknet_leaf_20_clk),
    .D(\lfsr0._056_ ),
    .RESET_B(net15),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\lfsr0.seed_reg[7] ));
 sky130_fd_sc_hd__dfrtp_1 \lfsr0._565_  (.CLK(clknet_leaf_1_clk),
    .D(\lfsr0._057_ ),
    .RESET_B(net14),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\lfsr0.seed_reg[8] ));
 sky130_fd_sc_hd__dfrtp_1 \lfsr0._566_  (.CLK(clknet_leaf_1_clk),
    .D(\lfsr0._058_ ),
    .RESET_B(net15),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\lfsr0.seed_reg[9] ));
 sky130_fd_sc_hd__dfrtp_1 \lfsr0._567_  (.CLK(clknet_leaf_0_clk),
    .D(\lfsr0._059_ ),
    .RESET_B(net12),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\lfsr0.seed_reg[10] ));
 sky130_fd_sc_hd__dfrtp_1 \lfsr0._568_  (.CLK(clknet_leaf_23_clk),
    .D(\lfsr0._060_ ),
    .RESET_B(net9),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\lfsr0.seed_reg[11] ));
 sky130_fd_sc_hd__dfrtp_1 \lfsr0._569_  (.CLK(clknet_leaf_23_clk),
    .D(\lfsr0._061_ ),
    .RESET_B(net9),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\lfsr0.seed_reg[12] ));
 sky130_fd_sc_hd__dfrtp_1 \lfsr0._570_  (.CLK(clknet_leaf_23_clk),
    .D(\lfsr0._062_ ),
    .RESET_B(net9),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\lfsr0.seed_reg[13] ));
 sky130_fd_sc_hd__dfrtp_1 \lfsr0._571_  (.CLK(clknet_leaf_0_clk),
    .D(\lfsr0._063_ ),
    .RESET_B(net12),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\lfsr0.seed_reg[14] ));
 sky130_fd_sc_hd__dfrtp_1 \lfsr0._572_  (.CLK(clknet_leaf_0_clk),
    .D(\lfsr0._064_ ),
    .RESET_B(net13),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\lfsr0.seed_reg[15] ));
 sky130_fd_sc_hd__dfrtp_1 \lfsr0._573_  (.CLK(clknet_leaf_0_clk),
    .D(\lfsr0._065_ ),
    .RESET_B(net13),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\lfsr0.seed_reg[16] ));
 sky130_fd_sc_hd__dfrtp_1 \lfsr0._574_  (.CLK(clknet_leaf_4_clk),
    .D(\lfsr0._066_ ),
    .RESET_B(net24),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\lfsr0.seed_reg[17] ));
 sky130_fd_sc_hd__dfrtp_1 \lfsr0._575_  (.CLK(clknet_leaf_4_clk),
    .D(\lfsr0._067_ ),
    .RESET_B(net23),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\lfsr0.seed_reg[18] ));
 sky130_fd_sc_hd__dfrtp_1 \lfsr0._576_  (.CLK(clknet_leaf_4_clk),
    .D(\lfsr0._068_ ),
    .RESET_B(net23),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\lfsr0.seed_reg[19] ));
 sky130_fd_sc_hd__dfrtp_1 \lfsr0._577_  (.CLK(clknet_leaf_3_clk),
    .D(\lfsr0._069_ ),
    .RESET_B(net25),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\lfsr0.seed_reg[20] ));
 sky130_fd_sc_hd__dfrtp_1 \lfsr0._578_  (.CLK(clknet_leaf_4_clk),
    .D(\lfsr0._070_ ),
    .RESET_B(net24),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\lfsr0.seed_reg[21] ));
 sky130_fd_sc_hd__dfrtp_1 \lfsr0._579_  (.CLK(clknet_leaf_5_clk),
    .D(\lfsr0._071_ ),
    .RESET_B(net24),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\lfsr0.seed_reg[22] ));
 sky130_fd_sc_hd__dfrtp_1 \lfsr0._580_  (.CLK(clknet_leaf_2_clk),
    .D(\lfsr0._072_ ),
    .RESET_B(net27),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\lfsr0.seed_reg[23] ));
 sky130_fd_sc_hd__dfrtp_4 \nreset_sync0._0_  (.CLK(clknet_leaf_13_clk),
    .D(\nreset_sync0.r_sync ),
    .RESET_B(net1),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\gray_sobel0.gray_scale0.nreset_i ));
 sky130_fd_sc_hd__dfrtp_1 \nreset_sync0._1_  (.CLK(clknet_leaf_13_clk),
    .D(net57),
    .RESET_B(net1),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\nreset_sync0.r_sync ));
 sky130_fd_sc_hd__conb_1 \nreset_sync0._1__57  (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .HI(net57));
 sky130_fd_sc_hd__dfrtp_1 \sgnl_sync0._0_  (.CLK(clknet_leaf_10_clk),
    .D(\sgnl_sync0.signal_sync ),
    .RESET_B(net36),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\sgnl_sync0.signal_o ));
 sky130_fd_sc_hd__dfrtp_1 \sgnl_sync0._1_  (.CLK(clknet_leaf_11_clk),
    .D(net6),
    .RESET_B(net36),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\sgnl_sync0.signal_sync ));
 sky130_fd_sc_hd__dfrtp_4 \sgnl_sync1._0_  (.CLK(clknet_leaf_11_clk),
    .D(\sgnl_sync1.signal_sync ),
    .RESET_B(net36),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\lfsr0.config_i ));
 sky130_fd_sc_hd__dfrtp_1 \sgnl_sync1._1_  (.CLK(clknet_leaf_11_clk),
    .D(net7),
    .RESET_B(net36),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\sgnl_sync1.signal_sync ));
 sky130_fd_sc_hd__dfrtp_4 \sgnl_sync2._0_  (.CLK(clknet_leaf_11_clk),
    .D(\sgnl_sync2.signal_sync ),
    .RESET_B(net36),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\lfsr0.lfsr_en_i ));
 sky130_fd_sc_hd__dfrtp_1 \sgnl_sync2._1_  (.CLK(clknet_leaf_11_clk),
    .D(net8),
    .RESET_B(net36),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\sgnl_sync2.signal_sync ));
 sky130_fd_sc_hd__and2b_1 \spi0._101_  (.A_N(\spi0.rxtx_done_reg ),
    .B(\spi0.rxtx_done ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._048_ ));
 sky130_fd_sc_hd__buf_2 \spi0._102_  (.A(\spi0._048_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._049_ ));
 sky130_fd_sc_hd__buf_4 \spi0._103_  (.A(\spi0._049_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.rxtx_done_rising ));
 sky130_fd_sc_hd__clkbuf_4 \spi0._104_  (.A(\spi0.px_rdy_o_spi_i ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._050_ ));
 sky130_fd_sc_hd__mux2_1 \spi0._105_  (.A0(\spi0.data_tx[15] ),
    .A1(\spi0.output_px_sobel_i[15] ),
    .S(\spi0._050_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._051_ ));
 sky130_fd_sc_hd__clkbuf_1 \spi0._106_  (.A(\spi0._051_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._000_ ));
 sky130_fd_sc_hd__mux2_1 \spi0._107_  (.A0(\spi0.data_tx[16] ),
    .A1(\spi0.output_px_sobel_i[16] ),
    .S(\spi0._050_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._052_ ));
 sky130_fd_sc_hd__clkbuf_1 \spi0._108_  (.A(\spi0._052_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._001_ ));
 sky130_fd_sc_hd__mux2_1 \spi0._109_  (.A0(\spi0.data_tx[17] ),
    .A1(\spi0.output_px_sobel_i[17] ),
    .S(\spi0._050_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._053_ ));
 sky130_fd_sc_hd__clkbuf_1 \spi0._110_  (.A(\spi0._053_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._002_ ));
 sky130_fd_sc_hd__mux2_1 \spi0._111_  (.A0(\spi0.data_tx[18] ),
    .A1(\spi0.output_px_sobel_i[18] ),
    .S(\spi0._050_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._054_ ));
 sky130_fd_sc_hd__clkbuf_1 \spi0._112_  (.A(\spi0._054_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._003_ ));
 sky130_fd_sc_hd__mux2_1 \spi0._113_  (.A0(\spi0.data_tx[19] ),
    .A1(\spi0.output_px_sobel_i[19] ),
    .S(\spi0._050_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._055_ ));
 sky130_fd_sc_hd__clkbuf_1 \spi0._114_  (.A(\spi0._055_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._004_ ));
 sky130_fd_sc_hd__mux2_1 \spi0._115_  (.A0(\spi0.data_tx[20] ),
    .A1(\spi0.output_px_sobel_i[20] ),
    .S(\spi0._050_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._056_ ));
 sky130_fd_sc_hd__clkbuf_1 \spi0._116_  (.A(\spi0._056_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._005_ ));
 sky130_fd_sc_hd__mux2_1 \spi0._117_  (.A0(\spi0.data_tx[21] ),
    .A1(\spi0.output_px_sobel_i[21] ),
    .S(\spi0._050_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._057_ ));
 sky130_fd_sc_hd__clkbuf_1 \spi0._118_  (.A(\spi0._057_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._006_ ));
 sky130_fd_sc_hd__mux2_1 \spi0._119_  (.A0(\spi0.data_tx[22] ),
    .A1(\spi0.output_px_sobel_i[22] ),
    .S(\spi0._050_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._058_ ));
 sky130_fd_sc_hd__clkbuf_1 \spi0._120_  (.A(\spi0._058_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._007_ ));
 sky130_fd_sc_hd__mux2_1 \spi0._121_  (.A0(\spi0.data_tx[23] ),
    .A1(\spi0.output_px_sobel_i[23] ),
    .S(\spi0._050_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._059_ ));
 sky130_fd_sc_hd__clkbuf_1 \spi0._122_  (.A(\spi0._059_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._008_ ));
 sky130_fd_sc_hd__mux2_1 \spi0._123_  (.A0(\spi0.input_px_gray_o[0] ),
    .A1(\spi0.spi0.data_rx_o[16] ),
    .S(\spi0.rxtx_done_rising ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._060_ ));
 sky130_fd_sc_hd__clkbuf_1 \spi0._124_  (.A(\spi0._060_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._009_ ));
 sky130_fd_sc_hd__mux2_1 \spi0._125_  (.A0(\spi0.input_px_gray_o[1] ),
    .A1(\spi0.spi0.data_rx_o[17] ),
    .S(\spi0.rxtx_done_rising ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._061_ ));
 sky130_fd_sc_hd__clkbuf_1 \spi0._126_  (.A(\spi0._061_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._010_ ));
 sky130_fd_sc_hd__mux2_1 \spi0._127_  (.A0(\spi0.input_px_gray_o[2] ),
    .A1(\spi0.spi0.data_rx_o[18] ),
    .S(\spi0.rxtx_done_rising ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._062_ ));
 sky130_fd_sc_hd__clkbuf_1 \spi0._128_  (.A(\spi0._062_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._011_ ));
 sky130_fd_sc_hd__mux2_1 \spi0._129_  (.A0(\spi0.input_px_gray_o[3] ),
    .A1(\spi0.spi0.data_rx_o[19] ),
    .S(\spi0.rxtx_done_rising ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._063_ ));
 sky130_fd_sc_hd__clkbuf_1 \spi0._130_  (.A(\spi0._063_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._012_ ));
 sky130_fd_sc_hd__mux2_1 \spi0._131_  (.A0(\spi0.input_px_gray_o[4] ),
    .A1(\spi0.spi0.data_rx_o[20] ),
    .S(\spi0.rxtx_done_rising ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._064_ ));
 sky130_fd_sc_hd__clkbuf_1 \spi0._132_  (.A(\spi0._064_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._013_ ));
 sky130_fd_sc_hd__mux2_1 \spi0._133_  (.A0(\spi0.input_px_gray_o[5] ),
    .A1(\spi0.spi0.data_rx_o[21] ),
    .S(\spi0.rxtx_done_rising ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._065_ ));
 sky130_fd_sc_hd__clkbuf_1 \spi0._134_  (.A(\spi0._065_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._014_ ));
 sky130_fd_sc_hd__mux2_1 \spi0._135_  (.A0(\spi0.input_px_gray_o[6] ),
    .A1(\spi0.spi0.data_rx_o[22] ),
    .S(\spi0.rxtx_done_rising ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._066_ ));
 sky130_fd_sc_hd__clkbuf_1 \spi0._136_  (.A(\spi0._066_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._015_ ));
 sky130_fd_sc_hd__mux2_1 \spi0._137_  (.A0(\spi0.input_px_gray_o[7] ),
    .A1(\spi0.spi0.data_rx_o[23] ),
    .S(\spi0.rxtx_done_rising ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._067_ ));
 sky130_fd_sc_hd__clkbuf_1 \spi0._138_  (.A(\spi0._067_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._016_ ));
 sky130_fd_sc_hd__mux2_1 \spi0._139_  (.A0(\spi0.input_px_gray_o[8] ),
    .A1(\spi0.spi0.data_rx_o[8] ),
    .S(\spi0.rxtx_done_rising ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._068_ ));
 sky130_fd_sc_hd__clkbuf_1 \spi0._140_  (.A(\spi0._068_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._017_ ));
 sky130_fd_sc_hd__buf_4 \spi0._141_  (.A(\spi0._049_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._069_ ));
 sky130_fd_sc_hd__mux2_1 \spi0._142_  (.A0(\spi0.input_px_gray_o[9] ),
    .A1(\spi0.spi0.data_rx_o[9] ),
    .S(\spi0._069_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._070_ ));
 sky130_fd_sc_hd__clkbuf_1 \spi0._143_  (.A(\spi0._070_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._018_ ));
 sky130_fd_sc_hd__mux2_1 \spi0._144_  (.A0(\spi0.input_px_gray_o[10] ),
    .A1(\spi0.spi0.data_rx_o[10] ),
    .S(\spi0._069_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._071_ ));
 sky130_fd_sc_hd__clkbuf_1 \spi0._145_  (.A(\spi0._071_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._019_ ));
 sky130_fd_sc_hd__mux2_1 \spi0._146_  (.A0(\spi0.input_px_gray_o[11] ),
    .A1(\spi0.spi0.data_rx_o[11] ),
    .S(\spi0._069_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._072_ ));
 sky130_fd_sc_hd__clkbuf_1 \spi0._147_  (.A(\spi0._072_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._020_ ));
 sky130_fd_sc_hd__mux2_1 \spi0._148_  (.A0(\spi0.input_px_gray_o[12] ),
    .A1(\spi0.spi0.data_rx_o[12] ),
    .S(\spi0._069_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._073_ ));
 sky130_fd_sc_hd__clkbuf_1 \spi0._149_  (.A(\spi0._073_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._021_ ));
 sky130_fd_sc_hd__mux2_1 \spi0._150_  (.A0(\spi0.input_px_gray_o[13] ),
    .A1(\spi0.spi0.data_rx_o[13] ),
    .S(\spi0._069_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._074_ ));
 sky130_fd_sc_hd__clkbuf_1 \spi0._151_  (.A(\spi0._074_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._022_ ));
 sky130_fd_sc_hd__mux2_1 \spi0._152_  (.A0(\spi0.input_px_gray_o[14] ),
    .A1(\spi0.spi0.data_rx_o[14] ),
    .S(\spi0._069_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._075_ ));
 sky130_fd_sc_hd__clkbuf_1 \spi0._153_  (.A(\spi0._075_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._023_ ));
 sky130_fd_sc_hd__mux2_1 \spi0._154_  (.A0(\spi0.input_px_gray_o[15] ),
    .A1(\spi0.spi0.data_rx_o[15] ),
    .S(\spi0._069_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._076_ ));
 sky130_fd_sc_hd__clkbuf_1 \spi0._155_  (.A(\spi0._076_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._024_ ));
 sky130_fd_sc_hd__mux2_1 \spi0._156_  (.A0(\spi0.input_px_gray_o[16] ),
    .A1(\spi0.spi0.data_rx_o[0] ),
    .S(\spi0._069_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._077_ ));
 sky130_fd_sc_hd__clkbuf_1 \spi0._157_  (.A(\spi0._077_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._025_ ));
 sky130_fd_sc_hd__mux2_1 \spi0._158_  (.A0(\spi0.input_px_gray_o[17] ),
    .A1(\spi0.spi0.data_rx_o[1] ),
    .S(\spi0._069_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._078_ ));
 sky130_fd_sc_hd__clkbuf_1 \spi0._159_  (.A(\spi0._078_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._026_ ));
 sky130_fd_sc_hd__mux2_1 \spi0._160_  (.A0(\spi0.input_px_gray_o[18] ),
    .A1(\spi0.spi0.data_rx_o[2] ),
    .S(\spi0._069_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._079_ ));
 sky130_fd_sc_hd__clkbuf_1 \spi0._161_  (.A(\spi0._079_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._027_ ));
 sky130_fd_sc_hd__mux2_1 \spi0._162_  (.A0(\spi0.input_px_gray_o[19] ),
    .A1(\spi0.spi0.data_rx_o[3] ),
    .S(\spi0._049_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._080_ ));
 sky130_fd_sc_hd__clkbuf_1 \spi0._163_  (.A(\spi0._080_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._028_ ));
 sky130_fd_sc_hd__mux2_1 \spi0._164_  (.A0(\spi0.input_px_gray_o[20] ),
    .A1(\spi0.spi0.data_rx_o[4] ),
    .S(\spi0._049_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._081_ ));
 sky130_fd_sc_hd__clkbuf_1 \spi0._165_  (.A(\spi0._081_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._029_ ));
 sky130_fd_sc_hd__mux2_1 \spi0._166_  (.A0(\spi0.input_px_gray_o[21] ),
    .A1(\spi0.spi0.data_rx_o[5] ),
    .S(\spi0._049_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._082_ ));
 sky130_fd_sc_hd__clkbuf_1 \spi0._167_  (.A(\spi0._082_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._030_ ));
 sky130_fd_sc_hd__mux2_1 \spi0._168_  (.A0(\spi0.input_px_gray_o[22] ),
    .A1(\spi0.spi0.data_rx_o[6] ),
    .S(\spi0._049_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._083_ ));
 sky130_fd_sc_hd__clkbuf_1 \spi0._169_  (.A(\spi0._083_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._031_ ));
 sky130_fd_sc_hd__mux2_1 \spi0._170_  (.A0(\spi0.input_px_gray_o[23] ),
    .A1(\spi0.spi0.data_rx_o[7] ),
    .S(\spi0._049_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._084_ ));
 sky130_fd_sc_hd__clkbuf_1 \spi0._171_  (.A(\spi0._084_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._032_ ));
 sky130_fd_sc_hd__mux2_1 \spi0._172_  (.A0(\spi0.data_tx[0] ),
    .A1(\spi0.output_px_sobel_i[0] ),
    .S(\spi0._050_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._085_ ));
 sky130_fd_sc_hd__clkbuf_1 \spi0._173_  (.A(\spi0._085_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._033_ ));
 sky130_fd_sc_hd__buf_4 \spi0._174_  (.A(\spi0.px_rdy_o_spi_i ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._086_ ));
 sky130_fd_sc_hd__mux2_1 \spi0._175_  (.A0(\spi0.data_tx[1] ),
    .A1(\spi0.output_px_sobel_i[1] ),
    .S(\spi0._086_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._087_ ));
 sky130_fd_sc_hd__clkbuf_1 \spi0._176_  (.A(\spi0._087_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._034_ ));
 sky130_fd_sc_hd__mux2_1 \spi0._177_  (.A0(\spi0.data_tx[2] ),
    .A1(\spi0.output_px_sobel_i[2] ),
    .S(\spi0._086_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._088_ ));
 sky130_fd_sc_hd__clkbuf_1 \spi0._178_  (.A(\spi0._088_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._035_ ));
 sky130_fd_sc_hd__mux2_1 \spi0._179_  (.A0(\spi0.data_tx[3] ),
    .A1(\spi0.output_px_sobel_i[3] ),
    .S(\spi0._086_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._089_ ));
 sky130_fd_sc_hd__clkbuf_1 \spi0._180_  (.A(\spi0._089_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._036_ ));
 sky130_fd_sc_hd__mux2_1 \spi0._181_  (.A0(\spi0.data_tx[4] ),
    .A1(\spi0.output_px_sobel_i[4] ),
    .S(\spi0._086_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._090_ ));
 sky130_fd_sc_hd__clkbuf_1 \spi0._182_  (.A(\spi0._090_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._037_ ));
 sky130_fd_sc_hd__mux2_1 \spi0._183_  (.A0(\spi0.data_tx[5] ),
    .A1(\spi0.output_px_sobel_i[5] ),
    .S(\spi0._086_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._091_ ));
 sky130_fd_sc_hd__clkbuf_1 \spi0._184_  (.A(\spi0._091_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._038_ ));
 sky130_fd_sc_hd__mux2_1 \spi0._185_  (.A0(\spi0.data_tx[6] ),
    .A1(\spi0.output_px_sobel_i[6] ),
    .S(\spi0._086_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._092_ ));
 sky130_fd_sc_hd__clkbuf_1 \spi0._186_  (.A(\spi0._092_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._039_ ));
 sky130_fd_sc_hd__mux2_1 \spi0._187_  (.A0(\spi0.data_tx[7] ),
    .A1(\spi0.output_px_sobel_i[7] ),
    .S(\spi0._086_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._093_ ));
 sky130_fd_sc_hd__clkbuf_1 \spi0._188_  (.A(\spi0._093_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._040_ ));
 sky130_fd_sc_hd__mux2_1 \spi0._189_  (.A0(\spi0.data_tx[8] ),
    .A1(\spi0.output_px_sobel_i[8] ),
    .S(\spi0._086_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._094_ ));
 sky130_fd_sc_hd__clkbuf_1 \spi0._190_  (.A(\spi0._094_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._041_ ));
 sky130_fd_sc_hd__mux2_1 \spi0._191_  (.A0(\spi0.data_tx[9] ),
    .A1(\spi0.output_px_sobel_i[9] ),
    .S(\spi0._086_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._095_ ));
 sky130_fd_sc_hd__clkbuf_1 \spi0._192_  (.A(\spi0._095_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._042_ ));
 sky130_fd_sc_hd__mux2_1 \spi0._193_  (.A0(\spi0.data_tx[10] ),
    .A1(\spi0.output_px_sobel_i[10] ),
    .S(\spi0._086_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._096_ ));
 sky130_fd_sc_hd__clkbuf_1 \spi0._194_  (.A(\spi0._096_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._043_ ));
 sky130_fd_sc_hd__mux2_1 \spi0._195_  (.A0(\spi0.data_tx[11] ),
    .A1(\spi0.output_px_sobel_i[11] ),
    .S(\spi0.px_rdy_o_spi_i ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._097_ ));
 sky130_fd_sc_hd__clkbuf_1 \spi0._196_  (.A(\spi0._097_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._044_ ));
 sky130_fd_sc_hd__mux2_1 \spi0._197_  (.A0(\spi0.data_tx[12] ),
    .A1(\spi0.output_px_sobel_i[12] ),
    .S(\spi0.px_rdy_o_spi_i ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._098_ ));
 sky130_fd_sc_hd__clkbuf_1 \spi0._198_  (.A(\spi0._098_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._045_ ));
 sky130_fd_sc_hd__mux2_1 \spi0._199_  (.A0(\spi0.data_tx[13] ),
    .A1(\spi0.output_px_sobel_i[13] ),
    .S(\spi0.px_rdy_o_spi_i ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._099_ ));
 sky130_fd_sc_hd__clkbuf_1 \spi0._200_  (.A(\spi0._099_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._046_ ));
 sky130_fd_sc_hd__mux2_1 \spi0._201_  (.A0(\spi0.data_tx[14] ),
    .A1(\spi0.output_px_sobel_i[14] ),
    .S(\spi0.px_rdy_o_spi_i ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._100_ ));
 sky130_fd_sc_hd__clkbuf_1 \spi0._202_  (.A(\spi0._100_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0._047_ ));
 sky130_fd_sc_hd__dfrtp_1 \spi0._203_  (.CLK(clknet_leaf_6_clk),
    .D(\spi0._000_ ),
    .RESET_B(net29),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.data_tx[15] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0._204_  (.CLK(clknet_leaf_5_clk),
    .D(\spi0._001_ ),
    .RESET_B(net28),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.data_tx[16] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0._205_  (.CLK(clknet_leaf_5_clk),
    .D(\spi0._002_ ),
    .RESET_B(net28),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.data_tx[17] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0._206_  (.CLK(clknet_leaf_5_clk),
    .D(\spi0._003_ ),
    .RESET_B(net28),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.data_tx[18] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0._207_  (.CLK(clknet_leaf_5_clk),
    .D(\spi0._004_ ),
    .RESET_B(net28),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.data_tx[19] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0._208_  (.CLK(clknet_leaf_5_clk),
    .D(\spi0._005_ ),
    .RESET_B(net28),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.data_tx[20] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0._209_  (.CLK(clknet_leaf_5_clk),
    .D(\spi0._006_ ),
    .RESET_B(net28),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.data_tx[21] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0._210_  (.CLK(clknet_leaf_5_clk),
    .D(\spi0._007_ ),
    .RESET_B(net28),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.data_tx[22] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0._211_  (.CLK(clknet_leaf_5_clk),
    .D(\spi0._008_ ),
    .RESET_B(net28),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.data_tx[23] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0._212_  (.CLK(clknet_leaf_4_clk),
    .D(\spi0.rxtx_done ),
    .RESET_B(net24),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.rxtx_done_reg ));
 sky130_fd_sc_hd__dfrtp_1 \spi0._213_  (.CLK(clknet_leaf_21_clk),
    .D(\spi0._009_ ),
    .RESET_B(net14),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.input_px_gray_o[0] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0._214_  (.CLK(clknet_leaf_2_clk),
    .D(\spi0._010_ ),
    .RESET_B(net15),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.input_px_gray_o[1] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0._215_  (.CLK(clknet_leaf_2_clk),
    .D(\spi0._011_ ),
    .RESET_B(net15),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.input_px_gray_o[2] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0._216_  (.CLK(clknet_leaf_2_clk),
    .D(\spi0._012_ ),
    .RESET_B(net26),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.input_px_gray_o[3] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0._217_  (.CLK(clknet_leaf_16_clk),
    .D(\spi0._013_ ),
    .RESET_B(net33),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.input_px_gray_o[4] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0._218_  (.CLK(clknet_leaf_20_clk),
    .D(\spi0._014_ ),
    .RESET_B(net20),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.input_px_gray_o[5] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0._219_  (.CLK(clknet_leaf_20_clk),
    .D(\spi0._015_ ),
    .RESET_B(net14),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.input_px_gray_o[6] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0._220_  (.CLK(clknet_leaf_19_clk),
    .D(\spi0._016_ ),
    .RESET_B(net19),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.input_px_gray_o[7] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0._221_  (.CLK(clknet_leaf_1_clk),
    .D(\spi0._017_ ),
    .RESET_B(net14),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.input_px_gray_o[8] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0._222_  (.CLK(clknet_leaf_1_clk),
    .D(\spi0._018_ ),
    .RESET_B(net12),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.input_px_gray_o[9] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0._223_  (.CLK(clknet_leaf_23_clk),
    .D(\spi0._019_ ),
    .RESET_B(net10),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.input_px_gray_o[10] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0._224_  (.CLK(clknet_leaf_23_clk),
    .D(\spi0._020_ ),
    .RESET_B(net10),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.input_px_gray_o[11] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0._225_  (.CLK(clknet_leaf_23_clk),
    .D(\spi0._021_ ),
    .RESET_B(net10),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.input_px_gray_o[12] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0._226_  (.CLK(clknet_leaf_23_clk),
    .D(\spi0._022_ ),
    .RESET_B(net9),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.input_px_gray_o[13] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0._227_  (.CLK(clknet_leaf_23_clk),
    .D(\spi0._023_ ),
    .RESET_B(net9),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.input_px_gray_o[14] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0._228_  (.CLK(clknet_leaf_23_clk),
    .D(\spi0._024_ ),
    .RESET_B(net10),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.input_px_gray_o[15] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0._229_  (.CLK(clknet_leaf_0_clk),
    .D(\spi0._025_ ),
    .RESET_B(net13),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.input_px_gray_o[16] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0._230_  (.CLK(clknet_leaf_4_clk),
    .D(\spi0._026_ ),
    .RESET_B(net23),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.input_px_gray_o[17] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0._231_  (.CLK(clknet_leaf_4_clk),
    .D(\spi0._027_ ),
    .RESET_B(net23),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.input_px_gray_o[18] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0._232_  (.CLK(clknet_leaf_0_clk),
    .D(\spi0._028_ ),
    .RESET_B(net12),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.input_px_gray_o[19] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0._233_  (.CLK(clknet_leaf_0_clk),
    .D(\spi0._029_ ),
    .RESET_B(net13),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.input_px_gray_o[20] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0._234_  (.CLK(clknet_leaf_3_clk),
    .D(\spi0._030_ ),
    .RESET_B(net23),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.input_px_gray_o[21] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0._235_  (.CLK(clknet_leaf_3_clk),
    .D(\spi0._031_ ),
    .RESET_B(net25),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.input_px_gray_o[22] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0._236_  (.CLK(clknet_leaf_2_clk),
    .D(\spi0._032_ ),
    .RESET_B(net26),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.input_px_gray_o[23] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0._237_  (.CLK(clknet_leaf_2_clk),
    .D(\spi0.rxtx_done_rising ),
    .RESET_B(net26),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.px_rdy_i_spi_o ));
 sky130_fd_sc_hd__dfrtp_1 \spi0._238_  (.CLK(clknet_leaf_6_clk),
    .D(\spi0._033_ ),
    .RESET_B(net29),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.data_tx[0] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0._239_  (.CLK(clknet_leaf_7_clk),
    .D(\spi0._034_ ),
    .RESET_B(net29),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.data_tx[1] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0._240_  (.CLK(clknet_leaf_7_clk),
    .D(\spi0._035_ ),
    .RESET_B(net30),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.data_tx[2] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0._241_  (.CLK(clknet_leaf_7_clk),
    .D(\spi0._036_ ),
    .RESET_B(net30),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.data_tx[3] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0._242_  (.CLK(clknet_leaf_7_clk),
    .D(\spi0._037_ ),
    .RESET_B(net30),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.data_tx[4] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0._243_  (.CLK(clknet_leaf_7_clk),
    .D(\spi0._038_ ),
    .RESET_B(net30),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.data_tx[5] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0._244_  (.CLK(clknet_leaf_7_clk),
    .D(\spi0._039_ ),
    .RESET_B(net36),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.data_tx[6] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0._245_  (.CLK(clknet_leaf_7_clk),
    .D(\spi0._040_ ),
    .RESET_B(net35),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.data_tx[7] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0._246_  (.CLK(clknet_leaf_6_clk),
    .D(\spi0._041_ ),
    .RESET_B(net28),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.data_tx[8] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0._247_  (.CLK(clknet_leaf_6_clk),
    .D(\spi0._042_ ),
    .RESET_B(net28),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.data_tx[9] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0._248_  (.CLK(clknet_leaf_6_clk),
    .D(\spi0._043_ ),
    .RESET_B(net31),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.data_tx[10] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0._249_  (.CLK(clknet_leaf_6_clk),
    .D(\spi0._044_ ),
    .RESET_B(net29),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.data_tx[11] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0._250_  (.CLK(clknet_leaf_6_clk),
    .D(\spi0._045_ ),
    .RESET_B(net29),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.data_tx[12] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0._251_  (.CLK(clknet_leaf_6_clk),
    .D(\spi0._046_ ),
    .RESET_B(net29),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.data_tx[13] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0._252_  (.CLK(clknet_leaf_6_clk),
    .D(\spi0._047_ ),
    .RESET_B(net29),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.data_tx[14] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0.signal_sync1._0_  (.CLK(clknet_leaf_5_clk),
    .D(\spi0.signal_sync1.signal_sync ),
    .RESET_B(net24),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.rxtx_done ));
 sky130_fd_sc_hd__dfrtp_1 \spi0.signal_sync1._1_  (.CLK(clknet_leaf_4_clk),
    .D(\spi0.signal_sync1.async_signal_i ),
    .RESET_B(net24),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.signal_sync1.signal_sync ));
 sky130_fd_sc_hd__buf_4 \spi0.spi0._161_  (.A(ui_in[1]),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.spi0._116_ ));
 sky130_fd_sc_hd__buf_4 \spi0.spi0._162_  (.A(\spi0.spi0._116_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.spi0._117_ ));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._163_  (.A(\spi0.spi0._117_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\spi0.spi0._114_ ));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._164_  (.A(\spi0.spi0._117_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\spi0.spi0._112_ ));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._165_  (.A(\spi0.spi0._117_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\spi0.spi0._110_ ));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._166_  (.A(\spi0.spi0._117_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\spi0.spi0._108_ ));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._167_  (.A(\spi0.spi0._117_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\spi0.spi0._106_ ));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._168_  (.A(\spi0.spi0._117_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\spi0.spi0._104_ ));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._169_  (.A(\spi0.spi0._117_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\spi0.spi0._078_ ));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._170_  (.A(\spi0.spi0._117_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\spi0.spi0._076_ ));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._171_  (.A(\spi0.spi0._117_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\spi0.spi0._074_ ));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._172_  (.A(\spi0.spi0._117_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\spi0.spi0._072_ ));
 sky130_fd_sc_hd__buf_4 \spi0.spi0._173_  (.A(\spi0.spi0._116_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.spi0._118_ ));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._174_  (.A(\spi0.spi0._118_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\spi0.spi0._070_ ));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._175_  (.A(\spi0.spi0._118_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\spi0.spi0._068_ ));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._176_  (.A(\spi0.spi0._118_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\spi0.spi0._066_ ));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._177_  (.A(\spi0.spi0._118_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\spi0.spi0._064_ ));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._178_  (.A(\spi0.spi0._118_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\spi0.spi0._062_ ));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._179_  (.A(\spi0.spi0._118_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\spi0.spi0._060_ ));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._180_  (.A(\spi0.spi0._118_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\spi0.spi0._058_ ));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._181_  (.A(\spi0.spi0._118_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\spi0.spi0._056_ ));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._182_  (.A(\spi0.spi0._118_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\spi0.spi0._054_ ));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._183_  (.A(\spi0.spi0._118_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\spi0.spi0._052_ ));
 sky130_fd_sc_hd__buf_4 \spi0.spi0._184_  (.A(\spi0.spi0._116_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.spi0._119_ ));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._185_  (.A(\spi0.spi0._119_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\spi0.spi0._050_ ));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._186_  (.A(\spi0.spi0._119_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\spi0.spi0._048_ ));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._187_  (.A(\spi0.spi0._119_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\spi0.spi0._046_ ));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._188_  (.A(\spi0.spi0._119_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\spi0.spi0._044_ ));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._189_  (.A(\spi0.spi0._119_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\spi0.spi0._042_ ));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._190_  (.A(\spi0.spi0._119_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\spi0.spi0._040_ ));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._191_  (.A(\spi0.spi0._119_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\spi0.spi0._038_ ));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._192_  (.A(\spi0.spi0._119_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\spi0.spi0._036_ ));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._193_  (.A(\spi0.spi0._119_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\spi0.spi0._034_ ));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._194_  (.A(\spi0.spi0._119_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\spi0.spi0._032_ ));
 sky130_fd_sc_hd__nor2_1 \spi0.spi0._195_  (.A(\spi0.spi0.counter[1] ),
    .B(\spi0.spi0.counter[0] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\spi0.spi0._120_ ));
 sky130_fd_sc_hd__nor2_1 \spi0.spi0._196_  (.A(\spi0.spi0.counter[2] ),
    .B(\spi0.spi0.counter[5] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\spi0.spi0._121_ ));
 sky130_fd_sc_hd__and4_1 \spi0.spi0._197_  (.A(\spi0.spi0.counter[3] ),
    .B(\spi0.spi0.counter[4] ),
    .C(\spi0.spi0._120_ ),
    .D(\spi0.spi0._121_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.spi0._122_ ));
 sky130_fd_sc_hd__clkbuf_4 \spi0.spi0._198_  (.A(\spi0.spi0._122_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.spi0._123_ ));
 sky130_fd_sc_hd__clkbuf_4 \spi0.spi0._199_  (.A(\spi0.spi0._123_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.spi0._006_ ));
 sky130_fd_sc_hd__and2_1 \spi0.spi0._200_  (.A(\spi0.data_tx[16] ),
    .B(\spi0.spi0._006_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.spi0._124_ ));
 sky130_fd_sc_hd__clkbuf_1 \spi0.spi0._201_  (.A(\spi0.spi0._124_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.spi0._007_ ));
 sky130_fd_sc_hd__mux2_1 \spi0.spi0._202_  (.A0(\spi0.spi0.sdo_register[0] ),
    .A1(\spi0.data_tx[17] ),
    .S(\spi0.spi0._006_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.spi0._125_ ));
 sky130_fd_sc_hd__clkbuf_1 \spi0.spi0._203_  (.A(\spi0.spi0._125_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.spi0._018_ ));
 sky130_fd_sc_hd__mux2_1 \spi0.spi0._204_  (.A0(\spi0.spi0.sdo_register[1] ),
    .A1(\spi0.data_tx[18] ),
    .S(\spi0.spi0._006_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.spi0._126_ ));
 sky130_fd_sc_hd__clkbuf_1 \spi0.spi0._205_  (.A(\spi0.spi0._126_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.spi0._023_ ));
 sky130_fd_sc_hd__mux2_1 \spi0.spi0._206_  (.A0(\spi0.spi0.sdo_register[2] ),
    .A1(\spi0.data_tx[19] ),
    .S(\spi0.spi0._006_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.spi0._127_ ));
 sky130_fd_sc_hd__clkbuf_1 \spi0.spi0._207_  (.A(\spi0.spi0._127_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.spi0._024_ ));
 sky130_fd_sc_hd__mux2_1 \spi0.spi0._208_  (.A0(\spi0.spi0.sdo_register[3] ),
    .A1(\spi0.data_tx[20] ),
    .S(\spi0.spi0._006_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.spi0._128_ ));
 sky130_fd_sc_hd__clkbuf_1 \spi0.spi0._209_  (.A(\spi0.spi0._128_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.spi0._025_ ));
 sky130_fd_sc_hd__mux2_1 \spi0.spi0._210_  (.A0(\spi0.spi0.sdo_register[4] ),
    .A1(\spi0.data_tx[21] ),
    .S(\spi0.spi0._006_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.spi0._129_ ));
 sky130_fd_sc_hd__clkbuf_1 \spi0.spi0._211_  (.A(\spi0.spi0._129_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.spi0._026_ ));
 sky130_fd_sc_hd__mux2_1 \spi0.spi0._212_  (.A0(\spi0.spi0.sdo_register[5] ),
    .A1(\spi0.data_tx[22] ),
    .S(\spi0.spi0._006_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.spi0._130_ ));
 sky130_fd_sc_hd__clkbuf_1 \spi0.spi0._213_  (.A(\spi0.spi0._130_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.spi0._027_ ));
 sky130_fd_sc_hd__clkbuf_4 \spi0.spi0._214_  (.A(\spi0.spi0._123_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.spi0._131_ ));
 sky130_fd_sc_hd__mux2_1 \spi0.spi0._215_  (.A0(\spi0.spi0.sdo_register[6] ),
    .A1(\spi0.data_tx[23] ),
    .S(\spi0.spi0._131_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.spi0._132_ ));
 sky130_fd_sc_hd__clkbuf_1 \spi0.spi0._216_  (.A(\spi0.spi0._132_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.spi0._028_ ));
 sky130_fd_sc_hd__mux2_1 \spi0.spi0._217_  (.A0(\spi0.spi0.sdo_register[7] ),
    .A1(\spi0.data_tx[8] ),
    .S(\spi0.spi0._131_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.spi0._133_ ));
 sky130_fd_sc_hd__clkbuf_1 \spi0.spi0._218_  (.A(\spi0.spi0._133_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.spi0._029_ ));
 sky130_fd_sc_hd__mux2_1 \spi0.spi0._219_  (.A0(\spi0.spi0.sdo_register[8] ),
    .A1(\spi0.data_tx[9] ),
    .S(\spi0.spi0._131_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.spi0._134_ ));
 sky130_fd_sc_hd__clkbuf_1 \spi0.spi0._220_  (.A(\spi0.spi0._134_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.spi0._030_ ));
 sky130_fd_sc_hd__mux2_1 \spi0.spi0._221_  (.A0(\spi0.spi0.sdo_register[9] ),
    .A1(\spi0.data_tx[10] ),
    .S(\spi0.spi0._131_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.spi0._135_ ));
 sky130_fd_sc_hd__clkbuf_1 \spi0.spi0._222_  (.A(\spi0.spi0._135_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.spi0._008_ ));
 sky130_fd_sc_hd__mux2_1 \spi0.spi0._223_  (.A0(\spi0.spi0.sdo_register[10] ),
    .A1(\spi0.data_tx[11] ),
    .S(\spi0.spi0._131_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.spi0._136_ ));
 sky130_fd_sc_hd__clkbuf_1 \spi0.spi0._224_  (.A(\spi0.spi0._136_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.spi0._009_ ));
 sky130_fd_sc_hd__mux2_1 \spi0.spi0._225_  (.A0(\spi0.spi0.sdo_register[11] ),
    .A1(\spi0.data_tx[12] ),
    .S(\spi0.spi0._131_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.spi0._137_ ));
 sky130_fd_sc_hd__clkbuf_1 \spi0.spi0._226_  (.A(\spi0.spi0._137_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.spi0._010_ ));
 sky130_fd_sc_hd__mux2_1 \spi0.spi0._227_  (.A0(\spi0.spi0.sdo_register[12] ),
    .A1(\spi0.data_tx[13] ),
    .S(\spi0.spi0._131_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.spi0._138_ ));
 sky130_fd_sc_hd__clkbuf_1 \spi0.spi0._228_  (.A(\spi0.spi0._138_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.spi0._011_ ));
 sky130_fd_sc_hd__mux2_1 \spi0.spi0._229_  (.A0(\spi0.spi0.sdo_register[13] ),
    .A1(\spi0.data_tx[14] ),
    .S(\spi0.spi0._131_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.spi0._139_ ));
 sky130_fd_sc_hd__clkbuf_1 \spi0.spi0._230_  (.A(\spi0.spi0._139_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.spi0._012_ ));
 sky130_fd_sc_hd__mux2_1 \spi0.spi0._231_  (.A0(\spi0.spi0.sdo_register[14] ),
    .A1(\spi0.data_tx[15] ),
    .S(\spi0.spi0._131_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.spi0._140_ ));
 sky130_fd_sc_hd__clkbuf_1 \spi0.spi0._232_  (.A(\spi0.spi0._140_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.spi0._013_ ));
 sky130_fd_sc_hd__mux2_1 \spi0.spi0._233_  (.A0(\spi0.spi0.sdo_register[15] ),
    .A1(\spi0.data_tx[0] ),
    .S(\spi0.spi0._131_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.spi0._141_ ));
 sky130_fd_sc_hd__clkbuf_1 \spi0.spi0._234_  (.A(\spi0.spi0._141_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.spi0._014_ ));
 sky130_fd_sc_hd__mux2_1 \spi0.spi0._235_  (.A0(\spi0.spi0.sdo_register[16] ),
    .A1(\spi0.data_tx[1] ),
    .S(\spi0.spi0._123_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.spi0._142_ ));
 sky130_fd_sc_hd__clkbuf_1 \spi0.spi0._236_  (.A(\spi0.spi0._142_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.spi0._015_ ));
 sky130_fd_sc_hd__mux2_1 \spi0.spi0._237_  (.A0(\spi0.spi0.sdo_register[17] ),
    .A1(\spi0.data_tx[2] ),
    .S(\spi0.spi0._123_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.spi0._143_ ));
 sky130_fd_sc_hd__clkbuf_1 \spi0.spi0._238_  (.A(\spi0.spi0._143_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.spi0._016_ ));
 sky130_fd_sc_hd__mux2_1 \spi0.spi0._239_  (.A0(\spi0.spi0.sdo_register[18] ),
    .A1(\spi0.data_tx[3] ),
    .S(\spi0.spi0._123_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.spi0._144_ ));
 sky130_fd_sc_hd__clkbuf_1 \spi0.spi0._240_  (.A(\spi0.spi0._144_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.spi0._017_ ));
 sky130_fd_sc_hd__mux2_1 \spi0.spi0._241_  (.A0(\spi0.spi0.sdo_register[19] ),
    .A1(\spi0.data_tx[4] ),
    .S(\spi0.spi0._123_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.spi0._145_ ));
 sky130_fd_sc_hd__clkbuf_1 \spi0.spi0._242_  (.A(\spi0.spi0._145_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.spi0._019_ ));
 sky130_fd_sc_hd__mux2_1 \spi0.spi0._243_  (.A0(\spi0.spi0.sdo_register[20] ),
    .A1(\spi0.data_tx[5] ),
    .S(\spi0.spi0._123_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.spi0._146_ ));
 sky130_fd_sc_hd__clkbuf_1 \spi0.spi0._244_  (.A(\spi0.spi0._146_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.spi0._020_ ));
 sky130_fd_sc_hd__mux2_1 \spi0.spi0._245_  (.A0(\spi0.spi0.sdo_register[21] ),
    .A1(\spi0.data_tx[6] ),
    .S(\spi0.spi0._123_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.spi0._147_ ));
 sky130_fd_sc_hd__clkbuf_1 \spi0.spi0._246_  (.A(\spi0.spi0._147_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.spi0._021_ ));
 sky130_fd_sc_hd__mux2_1 \spi0.spi0._247_  (.A0(\spi0.spi0.sdo_register[22] ),
    .A1(\spi0.data_tx[7] ),
    .S(\spi0.spi0._123_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.spi0._148_ ));
 sky130_fd_sc_hd__clkbuf_1 \spi0.spi0._248_  (.A(\spi0.spi0._148_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.spi0._022_ ));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._249_  (.A(\spi0.spi0.counter[0] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\spi0.spi0._000_ ));
 sky130_fd_sc_hd__and2_1 \spi0.spi0._250_  (.A(\spi0.spi0.counter[1] ),
    .B(\spi0.spi0.counter[0] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.spi0._149_ ));
 sky130_fd_sc_hd__nor2_1 \spi0.spi0._251_  (.A(\spi0.spi0._120_ ),
    .B(\spi0.spi0._149_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\spi0.spi0._001_ ));
 sky130_fd_sc_hd__and3_1 \spi0.spi0._252_  (.A(\spi0.spi0.counter[1] ),
    .B(\spi0.spi0.counter[0] ),
    .C(\spi0.spi0.counter[2] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.spi0._150_ ));
 sky130_fd_sc_hd__nor2_1 \spi0.spi0._253_  (.A(\spi0.spi0.counter[2] ),
    .B(\spi0.spi0._149_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\spi0.spi0._151_ ));
 sky130_fd_sc_hd__nor2_1 \spi0.spi0._254_  (.A(\spi0.spi0._150_ ),
    .B(\spi0.spi0._151_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\spi0.spi0._002_ ));
 sky130_fd_sc_hd__nor2_1 \spi0.spi0._255_  (.A(\spi0.spi0.counter[3] ),
    .B(\spi0.spi0._150_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\spi0.spi0._152_ ));
 sky130_fd_sc_hd__a211oi_1 \spi0.spi0._256_  (.A1(\spi0.spi0.counter[3] ),
    .A2(\spi0.spi0._150_ ),
    .B1(\spi0.spi0._152_ ),
    .C1(\spi0.spi0._006_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\spi0.spi0._003_ ));
 sky130_fd_sc_hd__a21o_1 \spi0.spi0._257_  (.A1(\spi0.spi0.counter[3] ),
    .A2(\spi0.spi0._150_ ),
    .B1(\spi0.spi0.counter[4] ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.spi0._153_ ));
 sky130_fd_sc_hd__nand3_1 \spi0.spi0._258_  (.A(\spi0.spi0.counter[3] ),
    .B(\spi0.spi0.counter[4] ),
    .C(\spi0.spi0._150_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\spi0.spi0._154_ ));
 sky130_fd_sc_hd__and3b_1 \spi0.spi0._259_  (.A_N(\spi0.spi0._006_ ),
    .B(\spi0.spi0._153_ ),
    .C(\spi0.spi0._154_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.spi0._155_ ));
 sky130_fd_sc_hd__clkbuf_1 \spi0.spi0._260_  (.A(\spi0.spi0._155_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.spi0._004_ ));
 sky130_fd_sc_hd__xnor2_1 \spi0.spi0._261_  (.A(\spi0.spi0.counter[5] ),
    .B(\spi0.spi0._154_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\spi0.spi0._005_ ));
 sky130_fd_sc_hd__buf_4 \spi0.spi0._262_  (.A(\spi0.spi0._116_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.spi0._156_ ));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._263_  (.A(\spi0.spi0._156_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\spi0.spi0._031_ ));
 sky130_fd_sc_hd__buf_1 \spi0.spi0._264_  (.A(clknet_1_1__leaf_ui_in[0]),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.spi0._157_ ));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._265__1  (.A(\clknet_1_0__leaf_spi0.spi0._157_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(net58));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._266__2  (.A(\clknet_1_0__leaf_spi0.spi0._157_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(net59));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._267__3  (.A(\clknet_1_0__leaf_spi0.spi0._157_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(net60));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._268__4  (.A(\clknet_1_0__leaf_spi0.spi0._157_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(net61));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._269__5  (.A(\clknet_1_0__leaf_spi0.spi0._157_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(net62));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._270__6  (.A(\clknet_1_1__leaf_spi0.spi0._157_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(net63));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._271__7  (.A(\clknet_1_1__leaf_spi0.spi0._157_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(net64));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._272__8  (.A(\clknet_1_1__leaf_spi0.spi0._157_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(net65));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._273__9  (.A(\clknet_1_1__leaf_spi0.spi0._157_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(net66));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._274__10  (.A(\clknet_1_1__leaf_spi0.spi0._157_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(net67));
 sky130_fd_sc_hd__buf_1 \spi0.spi0._275_  (.A(clknet_1_1__leaf_ui_in[0]),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.spi0._158_ ));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._276__11  (.A(\clknet_1_0__leaf_spi0.spi0._158_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(net68));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._277__12  (.A(\clknet_1_0__leaf_spi0.spi0._158_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(net69));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._278__13  (.A(\clknet_1_0__leaf_spi0.spi0._158_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(net70));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._279__14  (.A(\clknet_1_0__leaf_spi0.spi0._158_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(net71));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._280__15  (.A(\clknet_1_0__leaf_spi0.spi0._158_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(net72));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._281__16  (.A(\clknet_1_1__leaf_spi0.spi0._158_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(net73));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._282__17  (.A(\clknet_1_1__leaf_spi0.spi0._158_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(net74));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._283__18  (.A(\clknet_1_1__leaf_spi0.spi0._158_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(net75));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._284__19  (.A(\clknet_1_1__leaf_spi0.spi0._158_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(net76));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._285__20  (.A(\clknet_1_1__leaf_spi0.spi0._158_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(net77));
 sky130_fd_sc_hd__buf_1 \spi0.spi0._286_  (.A(clknet_1_1__leaf_ui_in[0]),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.spi0._159_ ));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._287__21  (.A(\clknet_1_1__leaf_spi0.spi0._159_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(net78));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._288__22  (.A(\clknet_1_1__leaf_spi0.spi0._159_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(net79));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._289__23  (.A(\clknet_1_1__leaf_spi0.spi0._159_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(net80));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._290__24  (.A(\clknet_1_1__leaf_spi0.spi0._159_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(net81));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._291_  (.A(\spi0.spi0._156_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\spi0.spi0._080_ ));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._292_  (.A(\spi0.spi0._156_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\spi0.spi0._081_ ));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._293_  (.A(\spi0.spi0._156_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\spi0.spi0._082_ ));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._294_  (.A(\spi0.spi0._156_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\spi0.spi0._083_ ));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._295_  (.A(\spi0.spi0._156_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\spi0.spi0._084_ ));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._296_  (.A(\spi0.spi0._156_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\spi0.spi0._085_ ));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._297_  (.A(\spi0.spi0._156_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\spi0.spi0._086_ ));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._298_  (.A(\spi0.spi0._156_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\spi0.spi0._087_ ));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._299_  (.A(\spi0.spi0._156_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\spi0.spi0._088_ ));
 sky130_fd_sc_hd__buf_4 \spi0.spi0._300_  (.A(\spi0.spi0._116_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .X(\spi0.spi0._160_ ));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._301_  (.A(\spi0.spi0._160_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\spi0.spi0._089_ ));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._302_  (.A(\spi0.spi0._160_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\spi0.spi0._090_ ));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._303_  (.A(\spi0.spi0._160_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\spi0.spi0._091_ ));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._304_  (.A(\spi0.spi0._160_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\spi0.spi0._092_ ));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._305_  (.A(\spi0.spi0._160_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\spi0.spi0._093_ ));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._306_  (.A(\spi0.spi0._160_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\spi0.spi0._094_ ));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._307_  (.A(\spi0.spi0._160_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\spi0.spi0._095_ ));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._308_  (.A(\spi0.spi0._160_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\spi0.spi0._096_ ));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._309_  (.A(\spi0.spi0._160_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\spi0.spi0._097_ ));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._310_  (.A(\spi0.spi0._160_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\spi0.spi0._098_ ));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._311_  (.A(\spi0.spi0._116_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\spi0.spi0._099_ ));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._312_  (.A(\spi0.spi0._116_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\spi0.spi0._100_ ));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._313_  (.A(\spi0.spi0._116_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\spi0.spi0._101_ ));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._314_  (.A(\spi0.spi0._116_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\spi0.spi0._102_ ));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._315_  (.A(\spi0.spi0._116_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(\spi0.spi0._103_ ));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._316__25  (.A(\clknet_1_0__leaf_spi0.spi0._159_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(net82));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._317__26  (.A(\clknet_1_0__leaf_spi0.spi0._159_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(net83));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._318__27  (.A(\clknet_1_0__leaf_spi0.spi0._159_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(net84));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._319__28  (.A(\clknet_1_0__leaf_spi0.spi0._159_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(net85));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._320__29  (.A(\clknet_1_0__leaf_spi0.spi0._159_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(net86));
 sky130_fd_sc_hd__inv_2 \spi0.spi0._321__30  (.A(\clknet_1_0__leaf_spi0.spi0._159_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Y(net87));
 sky130_fd_sc_hd__dfrtp_1 \spi0.spi0._322_  (.CLK(clknet_1_1__leaf_ui_in[0]),
    .D(\spi0.spi0._006_ ),
    .RESET_B(\spi0.spi0._031_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.signal_sync1.async_signal_i ));
 sky130_fd_sc_hd__dfrtp_1 \spi0.spi0._323_  (.CLK(net58),
    .D(\spi0.spi0._007_ ),
    .RESET_B(\spi0.spi0._032_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.spi0.sdo_register[0] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0.spi0._324_  (.CLK(net59),
    .D(\spi0.spi0._018_ ),
    .RESET_B(\spi0.spi0._034_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.spi0.sdo_register[1] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0.spi0._325_  (.CLK(net60),
    .D(\spi0.spi0._023_ ),
    .RESET_B(\spi0.spi0._036_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.spi0.sdo_register[2] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0.spi0._326_  (.CLK(net61),
    .D(\spi0.spi0._024_ ),
    .RESET_B(\spi0.spi0._038_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.spi0.sdo_register[3] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0.spi0._327_  (.CLK(net62),
    .D(\spi0.spi0._025_ ),
    .RESET_B(\spi0.spi0._040_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.spi0.sdo_register[4] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0.spi0._328_  (.CLK(net63),
    .D(\spi0.spi0._026_ ),
    .RESET_B(\spi0.spi0._042_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.spi0.sdo_register[5] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0.spi0._329_  (.CLK(net64),
    .D(\spi0.spi0._027_ ),
    .RESET_B(\spi0.spi0._044_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.spi0.sdo_register[6] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0.spi0._330_  (.CLK(net65),
    .D(\spi0.spi0._028_ ),
    .RESET_B(\spi0.spi0._046_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.spi0.sdo_register[7] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0.spi0._331_  (.CLK(net66),
    .D(\spi0.spi0._029_ ),
    .RESET_B(\spi0.spi0._048_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.spi0.sdo_register[8] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0.spi0._332_  (.CLK(net67),
    .D(\spi0.spi0._030_ ),
    .RESET_B(\spi0.spi0._050_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.spi0.sdo_register[9] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0.spi0._333_  (.CLK(net68),
    .D(\spi0.spi0._008_ ),
    .RESET_B(\spi0.spi0._052_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.spi0.sdo_register[10] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0.spi0._334_  (.CLK(net69),
    .D(\spi0.spi0._009_ ),
    .RESET_B(\spi0.spi0._054_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.spi0.sdo_register[11] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0.spi0._335_  (.CLK(net70),
    .D(\spi0.spi0._010_ ),
    .RESET_B(\spi0.spi0._056_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.spi0.sdo_register[12] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0.spi0._336_  (.CLK(net71),
    .D(\spi0.spi0._011_ ),
    .RESET_B(\spi0.spi0._058_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.spi0.sdo_register[13] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0.spi0._337_  (.CLK(net72),
    .D(\spi0.spi0._012_ ),
    .RESET_B(\spi0.spi0._060_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.spi0.sdo_register[14] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0.spi0._338_  (.CLK(net73),
    .D(\spi0.spi0._013_ ),
    .RESET_B(\spi0.spi0._062_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.spi0.sdo_register[15] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0.spi0._339_  (.CLK(net74),
    .D(\spi0.spi0._014_ ),
    .RESET_B(\spi0.spi0._064_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.spi0.sdo_register[16] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0.spi0._340_  (.CLK(net75),
    .D(\spi0.spi0._015_ ),
    .RESET_B(\spi0.spi0._066_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.spi0.sdo_register[17] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0.spi0._341_  (.CLK(net76),
    .D(\spi0.spi0._016_ ),
    .RESET_B(\spi0.spi0._068_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.spi0.sdo_register[18] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0.spi0._342_  (.CLK(net77),
    .D(\spi0.spi0._017_ ),
    .RESET_B(\spi0.spi0._070_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.spi0.sdo_register[19] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0.spi0._343_  (.CLK(net78),
    .D(\spi0.spi0._019_ ),
    .RESET_B(\spi0.spi0._072_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.spi0.sdo_register[20] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0.spi0._344_  (.CLK(net79),
    .D(\spi0.spi0._020_ ),
    .RESET_B(\spi0.spi0._074_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.spi0.sdo_register[21] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0.spi0._345_  (.CLK(net80),
    .D(\spi0.spi0._021_ ),
    .RESET_B(\spi0.spi0._076_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.spi0.sdo_register[22] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0.spi0._346_  (.CLK(net81),
    .D(\spi0.spi0._022_ ),
    .RESET_B(\spi0.spi0._078_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.spi0.sdo_o ));
 sky130_fd_sc_hd__dfrtp_1 \spi0.spi0._347_  (.CLK(clknet_1_1__leaf_ui_in[0]),
    .D(net2),
    .RESET_B(\spi0.spi0._080_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.spi0.data_rx_o[0] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0.spi0._348_  (.CLK(clknet_1_1__leaf_ui_in[0]),
    .D(\spi0.spi0.data_rx_o[0] ),
    .RESET_B(\spi0.spi0._081_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.spi0.data_rx_o[1] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0.spi0._349_  (.CLK(clknet_1_1__leaf_ui_in[0]),
    .D(\spi0.spi0.data_rx_o[1] ),
    .RESET_B(\spi0.spi0._082_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.spi0.data_rx_o[2] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0.spi0._350_  (.CLK(clknet_1_1__leaf_ui_in[0]),
    .D(\spi0.spi0.data_rx_o[2] ),
    .RESET_B(\spi0.spi0._083_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.spi0.data_rx_o[3] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0.spi0._351_  (.CLK(clknet_1_1__leaf_ui_in[0]),
    .D(\spi0.spi0.data_rx_o[3] ),
    .RESET_B(\spi0.spi0._084_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.spi0.data_rx_o[4] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0.spi0._352_  (.CLK(clknet_1_1__leaf_ui_in[0]),
    .D(\spi0.spi0.data_rx_o[4] ),
    .RESET_B(\spi0.spi0._085_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.spi0.data_rx_o[5] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0.spi0._353_  (.CLK(clknet_1_1__leaf_ui_in[0]),
    .D(\spi0.spi0.data_rx_o[5] ),
    .RESET_B(\spi0.spi0._086_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.spi0.data_rx_o[6] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0.spi0._354_  (.CLK(clknet_1_1__leaf_ui_in[0]),
    .D(\spi0.spi0.data_rx_o[6] ),
    .RESET_B(\spi0.spi0._087_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.spi0.data_rx_o[7] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0.spi0._355_  (.CLK(clknet_1_0__leaf_ui_in[0]),
    .D(\spi0.spi0.data_rx_o[7] ),
    .RESET_B(\spi0.spi0._088_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.spi0.data_rx_o[8] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0.spi0._356_  (.CLK(clknet_1_0__leaf_ui_in[0]),
    .D(\spi0.spi0.data_rx_o[8] ),
    .RESET_B(\spi0.spi0._089_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.spi0.data_rx_o[9] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0.spi0._357_  (.CLK(clknet_1_0__leaf_ui_in[0]),
    .D(\spi0.spi0.data_rx_o[9] ),
    .RESET_B(\spi0.spi0._090_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.spi0.data_rx_o[10] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0.spi0._358_  (.CLK(clknet_1_0__leaf_ui_in[0]),
    .D(\spi0.spi0.data_rx_o[10] ),
    .RESET_B(\spi0.spi0._091_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.spi0.data_rx_o[11] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0.spi0._359_  (.CLK(clknet_1_0__leaf_ui_in[0]),
    .D(\spi0.spi0.data_rx_o[11] ),
    .RESET_B(\spi0.spi0._092_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.spi0.data_rx_o[12] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0.spi0._360_  (.CLK(clknet_1_0__leaf_ui_in[0]),
    .D(\spi0.spi0.data_rx_o[12] ),
    .RESET_B(\spi0.spi0._093_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.spi0.data_rx_o[13] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0.spi0._361_  (.CLK(clknet_1_0__leaf_ui_in[0]),
    .D(\spi0.spi0.data_rx_o[13] ),
    .RESET_B(\spi0.spi0._094_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.spi0.data_rx_o[14] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0.spi0._362_  (.CLK(clknet_1_0__leaf_ui_in[0]),
    .D(\spi0.spi0.data_rx_o[14] ),
    .RESET_B(\spi0.spi0._095_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.spi0.data_rx_o[15] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0.spi0._363_  (.CLK(clknet_1_0__leaf_ui_in[0]),
    .D(\spi0.spi0.data_rx_o[15] ),
    .RESET_B(\spi0.spi0._096_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.spi0.data_rx_o[16] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0.spi0._364_  (.CLK(clknet_1_0__leaf_ui_in[0]),
    .D(\spi0.spi0.data_rx_o[16] ),
    .RESET_B(\spi0.spi0._097_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.spi0.data_rx_o[17] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0.spi0._365_  (.CLK(clknet_1_0__leaf_ui_in[0]),
    .D(\spi0.spi0.data_rx_o[17] ),
    .RESET_B(\spi0.spi0._098_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.spi0.data_rx_o[18] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0.spi0._366_  (.CLK(clknet_1_0__leaf_ui_in[0]),
    .D(\spi0.spi0.data_rx_o[18] ),
    .RESET_B(\spi0.spi0._099_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.spi0.data_rx_o[19] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0.spi0._367_  (.CLK(clknet_1_0__leaf_ui_in[0]),
    .D(\spi0.spi0.data_rx_o[19] ),
    .RESET_B(\spi0.spi0._100_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.spi0.data_rx_o[20] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0.spi0._368_  (.CLK(clknet_1_0__leaf_ui_in[0]),
    .D(\spi0.spi0.data_rx_o[20] ),
    .RESET_B(\spi0.spi0._101_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.spi0.data_rx_o[21] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0.spi0._369_  (.CLK(clknet_1_0__leaf_ui_in[0]),
    .D(\spi0.spi0.data_rx_o[21] ),
    .RESET_B(\spi0.spi0._102_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.spi0.data_rx_o[22] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0.spi0._370_  (.CLK(clknet_1_0__leaf_ui_in[0]),
    .D(\spi0.spi0.data_rx_o[22] ),
    .RESET_B(\spi0.spi0._103_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.spi0.data_rx_o[23] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0.spi0._371_  (.CLK(net82),
    .D(\spi0.spi0._000_ ),
    .RESET_B(\spi0.spi0._104_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.spi0.counter[0] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0.spi0._372_  (.CLK(net83),
    .D(\spi0.spi0._001_ ),
    .RESET_B(\spi0.spi0._106_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.spi0.counter[1] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0.spi0._373_  (.CLK(net84),
    .D(\spi0.spi0._002_ ),
    .RESET_B(\spi0.spi0._108_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.spi0.counter[2] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0.spi0._374_  (.CLK(net85),
    .D(\spi0.spi0._003_ ),
    .RESET_B(\spi0.spi0._110_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.spi0.counter[3] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0.spi0._375_  (.CLK(net86),
    .D(\spi0.spi0._004_ ),
    .RESET_B(\spi0.spi0._112_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.spi0.counter[4] ));
 sky130_fd_sc_hd__dfrtp_1 \spi0.spi0._376_  (.CLK(net87),
    .D(\spi0.spi0._005_ ),
    .RESET_B(\spi0.spi0._114_ ),
    .VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .Q(\spi0.spi0.counter[5] ));
 sky130_fd_sc_hd__conb_1 tt_um_gray_sobel_41 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .LO(net41));
 sky130_fd_sc_hd__conb_1 tt_um_gray_sobel_42 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .LO(net42));
 sky130_fd_sc_hd__conb_1 tt_um_gray_sobel_43 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .LO(net43));
 sky130_fd_sc_hd__conb_1 tt_um_gray_sobel_44 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .LO(net44));
 sky130_fd_sc_hd__conb_1 tt_um_gray_sobel_45 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .LO(net45));
 sky130_fd_sc_hd__conb_1 tt_um_gray_sobel_46 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .LO(net46));
 sky130_fd_sc_hd__conb_1 tt_um_gray_sobel_47 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .LO(net47));
 sky130_fd_sc_hd__conb_1 tt_um_gray_sobel_48 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .LO(net48));
 sky130_fd_sc_hd__conb_1 tt_um_gray_sobel_49 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .LO(net49));
 sky130_fd_sc_hd__conb_1 tt_um_gray_sobel_50 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .LO(net50));
 sky130_fd_sc_hd__conb_1 tt_um_gray_sobel_51 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .LO(net51));
 sky130_fd_sc_hd__conb_1 tt_um_gray_sobel_52 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .LO(net52));
 sky130_fd_sc_hd__conb_1 tt_um_gray_sobel_53 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .LO(net53));
 sky130_fd_sc_hd__conb_1 tt_um_gray_sobel_54 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .LO(net54));
 sky130_fd_sc_hd__conb_1 tt_um_gray_sobel_55 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .LO(net55));
 sky130_fd_sc_hd__conb_1 tt_um_gray_sobel_56 (.VGND(VGND),
    .VNB(VGND),
    .VPB(VPWR),
    .VPWR(VPWR),
    .LO(net56));
 assign uio_oe[0] = net41;
 assign uio_oe[1] = net42;
 assign uio_oe[2] = net43;
 assign uio_oe[3] = net44;
 assign uio_oe[4] = net45;
 assign uio_oe[5] = net46;
 assign uio_oe[6] = net47;
 assign uio_oe[7] = net48;
 assign uio_out[0] = net49;
 assign uio_out[1] = net50;
 assign uio_out[2] = net51;
 assign uio_out[3] = net52;
 assign uio_out[4] = net53;
 assign uio_out[5] = net54;
 assign uio_out[6] = net55;
 assign uio_out[7] = net56;
endmodule
