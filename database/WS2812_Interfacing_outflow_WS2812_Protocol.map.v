// This program was cloned from: https://github.com/Mr-Kaushal-22/WS2812_Interfacing
// License: MIT License


//
// Verific Verilog Description of module ws2812_phy
//

module ws2812_phy (clk, i_rx_serial, data, led);
    input clk /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_INPUT=TRUE */ ;
    input i_rx_serial /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_INPUT=TRUE */ ;
    output data /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_OUTPUT=TRUE */ ;
    output led /* verific EFX_ATTRIBUTE_PORT__IS_PRIMARY_OUTPUT=TRUE */ ;
    
    wire \ws_wr_fifo/u_efx_fifo_top/genblk2.rd_rst[1]  /* verific async_reg="true" */ ;
    wire \ws_wr_fifo/u_efx_fifo_top/genblk2.wr_rst[0]  /* verific async_reg="true" */ ;
    wire \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][5]  /* verific async_reg="true" */ ;
    wire \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][4]  /* verific async_reg="true" */ ;
    wire \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][3]  /* verific async_reg="true" */ ;
    wire \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][2]  /* verific async_reg="true" */ ;
    wire \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][6]  /* verific async_reg="true" */ ;
    wire \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][0]  /* verific async_reg="true" */ ;
    wire \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][1]  /* verific async_reg="true" */ ;
    wire \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][7]  /* verific async_reg="true" */ ;
    wire \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][8]  /* verific async_reg="true" */ ;
    wire \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][9]  /* verific async_reg="true" */ ;
    wire \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[0]  /* verific async_reg="true" */ ;
    wire \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[1]  /* verific async_reg="true" */ ;
    wire \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[2]  /* verific async_reg="true" */ ;
    wire \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[3]  /* verific async_reg="true" */ ;
    wire \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[4]  /* verific async_reg="true" */ ;
    wire \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[5]  /* verific async_reg="true" */ ;
    wire \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[6]  /* verific async_reg="true" */ ;
    wire \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[7]  /* verific async_reg="true" */ ;
    wire \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[8]  /* verific async_reg="true" */ ;
    wire \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][5]  /* verific async_reg="true" */ ;
    wire \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][4]  /* verific async_reg="true" */ ;
    wire \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][3]  /* verific async_reg="true" */ ;
    wire \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][2]  /* verific async_reg="true" */ ;
    wire \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][6]  /* verific async_reg="true" */ ;
    wire \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][0]  /* verific async_reg="true" */ ;
    wire \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][1]  /* verific async_reg="true" */ ;
    wire \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][7]  /* verific async_reg="true" */ ;
    wire \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][8]  /* verific async_reg="true" */ ;
    wire \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][9]  /* verific async_reg="true" */ ;
    wire \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[0]  /* verific async_reg="true" */ ;
    wire \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[1]  /* verific async_reg="true" */ ;
    wire \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[2]  /* verific async_reg="true" */ ;
    wire \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[3]  /* verific async_reg="true" */ ;
    wire \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[4]  /* verific async_reg="true" */ ;
    wire \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[5]  /* verific async_reg="true" */ ;
    wire \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[6]  /* verific async_reg="true" */ ;
    wire \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[7]  /* verific async_reg="true" */ ;
    wire \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[8]  /* verific async_reg="true" */ ;
    wire \ws_wr_fifo/u_efx_fifo_top/genblk2.rd_rst[0]  /* verific async_reg="true" */ ;
    wire \ws_wr_fifo/u_efx_fifo_top/genblk2.wr_rst[1]  /* verific async_reg="true" */ ;
    wire \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[9]  /* verific async_reg="true" */ ;
    wire \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[9]  /* verific async_reg="true" */ ;
    
    wire \uartrx/r_Rx_Data , \uartrx/r_SM_Main[1] , \uartrx/r_Rx_Byte[0] , 
        \uartrx/r_Clock_Count[0] , w_rx_dv, \uartrx/r_Bit_Index[1] , \uartrx/r_Bit_Index[0] , 
        \uartrx/r_SM_Main[0] , n15, n16, \uartrx/r_Rx_Byte[1] , \uartrx/r_Rx_Byte[2] , 
        \uartrx/r_Rx_Byte[3] , \uartrx/r_Rx_Byte[4] , \uartrx/r_Rx_Byte[5] , 
        \uartrx/r_Rx_Byte[6] , \uartrx/r_Rx_Byte[7] , \uartrx/r_Clock_Count[1] , 
        \uartrx/r_Clock_Count[2] , \uartrx/r_Clock_Count[3] , \uartrx/r_Clock_Count[4] , 
        \uartrx/r_Clock_Count[5] , \uartrx/r_Clock_Count[6] , \uartrx/r_Clock_Count[7] , 
        \uartrx/r_Clock_Count[8] , \uartrx/r_Clock_Count[9] , \uartrx/r_Clock_Count[10] , 
        \uartrx/r_Bit_Index[2] , n35, n36, n37, n38, \ws_wr_fifo/u_efx_fifo_top/waddr[3] , 
        \ws_wr_fifo/u_efx_fifo_top/waddr[2] , \ws_wr_fifo/u_efx_fifo_top/waddr[1] , 
        \ws_wr_fifo/u_efx_fifo_top/waddr[0] , n46, n47, \ws_wr_fifo/u_efx_fifo_top/raddr[0] , 
        n49, n50, \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[0] , 
        \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[0] , 
        \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[0] , 
        \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[0] , 
        \ws_wr_fifo/u_efx_fifo_top/waddr[4] , \ws_wr_fifo/u_efx_fifo_top/waddr[5] , 
        \ws_wr_fifo/u_efx_fifo_top/waddr[6] , \ws_wr_fifo/u_efx_fifo_top/waddr[7] , 
        \ws_wr_fifo/u_efx_fifo_top/waddr[8] , \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/waddr_cntr[9] , 
        \wsinterface/n2448 , \ws_wr_fifo/u_efx_fifo_top/raddr[1] , \ws_wr_fifo/u_efx_fifo_top/raddr[2] , 
        \ws_wr_fifo/u_efx_fifo_top/raddr[3] , \ws_wr_fifo/u_efx_fifo_top/raddr[4] , 
        \ws_wr_fifo/u_efx_fifo_top/raddr[5] , \ws_wr_fifo/u_efx_fifo_top/raddr[6] , 
        \ws_wr_fifo/u_efx_fifo_top/raddr[7] , \ws_wr_fifo/u_efx_fifo_top/raddr[8] , 
        \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/raddr_cntr[9] , \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[1] , 
        \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[2] , 
        \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[3] , 
        \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[4] , 
        \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[5] , 
        \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[6] , 
        \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[7] , 
        \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[8] , 
        \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[9] , 
        \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[1] , 
        \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[2] , 
        \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[3] , 
        \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[4] , 
        \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[5] , 
        \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[6] , 
        \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[7] , 
        \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[8] , 
        \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[9] , 
        \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[1] , 
        \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[2] , 
        \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[3] , 
        \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[4] , 
        \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[5] , 
        \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[6] , 
        \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[7] , 
        \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[8] , 
        \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[9] , 
        \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[1] , 
        \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[2] , 
        \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[3] , 
        \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[4] , 
        \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[5] , 
        \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[6] , 
        \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[7] , 
        \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[8] , 
        \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[9] , 
        \w_address[0] , \wsctrl/post_wait_state[0] , n879, \wsctrl/length[0] , 
        \w_rgb_data[0] , w_fifo_rd_en, \w_fifo_rd_data[0] , \w_fifo_rd_data[1] , 
        \w_fifo_rd_data[2] , \w_fifo_rd_data[3] , \w_fifo_rd_data[4] , 
        \w_fifo_rd_data[5] , \w_fifo_rd_data[6] , \w_fifo_rd_data[7] , 
        \w_address[1] , \wsctrl/post_wait_state[1] , \wsctrl/post_wait_state[2] , 
        \wsctrl/state[2] , \wsctrl/state[3] , \wsctrl/length[1] , \wsctrl/length[2] , 
        \wsctrl/length[3] , \wsctrl/length[4] , \wsctrl/length[5] , \wsctrl/length[6] , 
        \wsctrl/length[7] , \w_rgb_data[1] , \w_rgb_data[2] , \w_rgb_data[3] , 
        \w_rgb_data[4] , \w_rgb_data[5] , \w_rgb_data[6] , \w_rgb_data[7] , 
        \w_rgb_data[8] , \w_rgb_data[9] , \w_rgb_data[10] , \w_rgb_data[11] , 
        \w_rgb_data[12] , \w_rgb_data[13] , \w_rgb_data[14] , \w_rgb_data[15] , 
        \w_rgb_data[16] , \w_rgb_data[17] , \w_rgb_data[18] , \w_rgb_data[19] , 
        \w_rgb_data[20] , \w_rgb_data[21] , \w_rgb_data[22] , \w_rgb_data[23] , 
        \wsinterface/reset_count[0] , \wsinterface/state[0] , \wsinterface/rgb_counter[0] , 
        \wsinterface/high_count[0] , \wsinterface/low_count[0] , \wsinterface/data_count[0] , 
        \wsinterface/led_counter[0] , \wsinterface/n2454 , \wsinterface/n2457 , 
        \wsinterface/n2460 , \wsinterface/n2463 , \wsinterface/n2466 , 
        \wsinterface/n2469 , \wsinterface/n2472 , \wsinterface/n2475 , 
        \wsinterface/n2478 , \wsinterface/n2481 , \wsinterface/n2484 , 
        \wsinterface/n2487 , \wsinterface/n2490 , \wsinterface/n2493 , 
        \wsinterface/n2496 , \wsinterface/n2499 , \wsinterface/n2502 , 
        \wsinterface/n2505 , \wsinterface/n2508 , \wsinterface/n2511 , 
        \wsinterface/n2514 , \wsinterface/n2451 , \wsinterface/reset_count[1] , 
        \wsinterface/reset_count[2] , \wsinterface/reset_count[3] , \wsinterface/reset_count[4] , 
        \wsinterface/reset_count[5] , \wsinterface/reset_count[6] , \wsinterface/reset_count[7] , 
        \wsinterface/reset_count[8] , \wsinterface/reset_count[9] , \wsinterface/reset_count[10] , 
        \wsinterface/reset_count[11] , \wsinterface/reset_count[12] , \wsinterface/reset_count[13] , 
        \wsinterface/reset_count[14] , \wsinterface/reset_count[15] , \wsinterface/reset_count[16] , 
        \wsinterface/reset_count[17] , \wsinterface/reset_count[18] , \wsinterface/reset_count[19] , 
        \wsinterface/reset_count[20] , \wsinterface/reset_count[21] , \wsinterface/reset_count[22] , 
        \wsinterface/reset_count[23] , \wsinterface/reset_count[24] , \wsinterface/reset_count[25] , 
        \wsinterface/reset_count[26] , \wsinterface/reset_count[27] , \wsinterface/reset_count[28] , 
        \wsinterface/reset_count[29] , \wsinterface/reset_count[30] , \wsinterface/reset_count[31] , 
        \wsinterface/state[1] , \wsinterface/state[2] , \wsinterface/rgb_counter[1] , 
        \wsinterface/rgb_counter[2] , \wsinterface/rgb_counter[3] , \wsinterface/rgb_counter[4] , 
        \wsinterface/high_count[1] , \wsinterface/high_count[2] , \wsinterface/high_count[3] , 
        \wsinterface/high_count[4] , \wsinterface/high_count[5] , \wsinterface/high_count[6] , 
        \wsinterface/high_count[7] , \wsinterface/high_count[8] , \wsinterface/high_count[9] , 
        \wsinterface/high_count[10] , \wsinterface/low_count[1] , \wsinterface/low_count[2] , 
        \wsinterface/low_count[3] , \wsinterface/low_count[4] , \wsinterface/low_count[5] , 
        \wsinterface/low_count[6] , \wsinterface/low_count[7] , \wsinterface/low_count[8] , 
        \wsinterface/low_count[9] , \wsinterface/low_count[10] , \wsinterface/data_count[1] , 
        \wsinterface/led_counter[1] , \wsinterface/led_counter[2] , \wsinterface/led_counter[3] , 
        \wsinterface/led_counter[4] , \wsinterface/led_counter[5] , \wsinterface/led_counter[6] , 
        \wsinterface/n2517 , n293, n294, n295, n296, n297, n298, 
        n299, n300, n301, n302, n303, n304, n305, n306, n307, 
        n308, n309, n310, n311, n312, n313, n314, n315, n316, 
        n317, n318, n319, n320, n321, n322, n323, n324, n325, 
        n326, n327, n328, n329, n330, n331, n332, n333, n334, 
        n335, n336, \uartrx/r_Rx_Data_R , \uartrx/n365 , \uartrx/r_SM_Main[2] , 
        \uartrx/n509 , \uartrx/n55 , \uartrx/n453 , \uartrx/n442 , ceg_net63, 
        \uartrx/n477 , ceg_net352, \uartrx/n403 , ceg_net230, \uartrx/n446 , 
        \uartrx/n439 , \uartrx/n485 , \uartrx/n487 , \uartrx/n489 , 
        \uartrx/n491 , \uartrx/n500 , \uartrx/n503 , \uartrx/n506 , 
        \uartrx/n372 , \uartrx/n375 , \uartrx/n378 , \uartrx/n381 , 
        \uartrx/n384 , \uartrx/n387 , \uartrx/n390 , \uartrx/n393 , 
        \uartrx/n396 , \uartrx/n399 , \uartrx/n407 , \ws_wr_fifo/u_efx_fifo_top/wr_en_int , 
        \ws_wr_fifo/u_efx_fifo_top/rd_en_int , \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_sync_g2b[0] , 
        \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_sync_g2b[0] , 
        \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry[0] , 
        \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry[0] , 
        \~wsinterface/equal_43/n7 , \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_sync_g2b[1] , 
        \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_sync_g2b[2] , 
        \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_sync_g2b[3] , 
        \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_sync_g2b[4] , 
        \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_sync_g2b[5] , 
        \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_sync_g2b[6] , 
        \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_sync_g2b[7] , 
        \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_sync_g2b[8] , 
        \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_sync_g2b[1] , 
        \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_sync_g2b[2] , 
        \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_sync_g2b[3] , 
        \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_sync_g2b[4] , 
        \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_sync_g2b[5] , 
        \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_sync_g2b[6] , 
        \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_sync_g2b[7] , 
        \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_sync_g2b[8] , 
        \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry[1] , 
        \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry[2] , 
        \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry[3] , 
        \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry[4] , 
        \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry[5] , 
        \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry[6] , 
        \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry[7] , 
        \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry[8] , 
        \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry[1] , 
        \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry[2] , 
        \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry[3] , 
        \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry[4] , 
        \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry[5] , 
        \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry[6] , 
        \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry[7] , 
        \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry[8] , 
        \wsctrl/n85 , \wsctrl/n1252 , \wsctrl/n119 , ceg_net392, \wsctrl/n124 , 
        ceg_net85, \wsctrl/n910 , ceg_net389, \wsctrl/n769 , ceg_net317, 
        n878, ceg_net246, \w_rx_byte[0] , \w_rx_byte[1] , \w_rx_byte[2] , 
        \w_rx_byte[3] , \w_rx_byte[4] , \w_rx_byte[5] , \w_rx_byte[6] , 
        \w_rx_byte[7] , \wsctrl/n84 , \wsctrl/n118 , \wsctrl/n117 , 
        \wsctrl/n123 , \wsctrl/n122 , \wsctrl/n121 , \wsctrl/n631 , 
        \wsctrl/n638 , \wsctrl/n645 , \wsctrl/n652 , \wsctrl/n659 , 
        \wsctrl/n666 , \wsctrl/n673 , \wsctrl/n775 , \wsctrl/n781 , 
        \wsctrl/n787 , \wsctrl/n793 , \wsctrl/n799 , \wsctrl/n805 , 
        \wsctrl/n811 , ceg_net341, ceg_net350, \wsinterface/select_51/Select_0/n11 , 
        \wsinterface/n454 , \wsinterface/n485 , \wsinterface/n497 , \wsinterface/n509 , 
        \wsinterface/n153 , \~wsinterface/select_52/Select_0/n4 , \~wsinterface/equal_45/n7 , 
        \wsinterface/n416 , \wsinterface/select_51/Select_1/n11 , \wsinterface/select_51/Select_2/n11 , 
        \wsinterface/n446 , \wsinterface/n445 , \wsinterface/select_51/Select_5/n11 , 
        \wsinterface/select_51/Select_6/n11 , \wsinterface/n442 , \wsinterface/select_51/Select_8/n11 , 
        \wsinterface/n440 , \wsinterface/n439 , \wsinterface/n438 , \wsinterface/n437 , 
        \wsinterface/n436 , \wsinterface/select_51/Select_14/n11 , \wsinterface/select_51/Select_15/n11 , 
        \wsinterface/n433 , \wsinterface/n432 , \wsinterface/select_51/Select_18/n11 , 
        \wsinterface/n430 , \wsinterface/n429 , \wsinterface/select_51/Select_21/n11 , 
        \wsinterface/select_51/Select_22/n11 , \wsinterface/select_51/Select_23/n11 , 
        \wsinterface/n425 , \wsinterface/n424 , \wsinterface/n423 , \wsinterface/n422 , 
        \wsinterface/n421 , \wsinterface/n420 , \wsinterface/n419 , \wsinterface/n418 , 
        \wsinterface/n453 , \wsinterface/n452 , \wsinterface/n484 , \wsinterface/n483 , 
        \wsinterface/n482 , \wsinterface/n481 , \wsinterface/n496 , \wsinterface/n495 , 
        \wsinterface/n494 , \wsinterface/n493 , \wsinterface/n492 , \wsinterface/n491 , 
        \wsinterface/n490 , \wsinterface/n489 , \wsinterface/n488 , \wsinterface/n487 , 
        \wsinterface/n508 , \wsinterface/n507 , \wsinterface/n506 , \wsinterface/n505 , 
        \wsinterface/n504 , \wsinterface/n503 , \wsinterface/n502 , \wsinterface/n501 , 
        \wsinterface/n500 , \wsinterface/n499 , \wsinterface/n152 , \wsinterface/n415 , 
        \wsinterface/n414 , \wsinterface/n413 , \wsinterface/n412 , \wsinterface/n411 , 
        \wsinterface/n410 , \clk~O , \wsctrl/state[0]~FF_brt_0_q_pinv , 
        \wsctrl/state[1]~FF_brt_5_q , \wsctrl/state[1]~FF_brt_4_q , \wsctrl/state[0]~FF_brt_3_q , 
        \wsctrl/state[0]~FF_brt_2_q , \wsctrl/state[0]~FF_brt_1_q , \wsctrl/state[0]~FF_brt_0_q , 
        n685, n686, n687, n688, n689, n690, n691, n692, n693, 
        n694, n695, n696, n697, n698, n699, n700, n701, n702, 
        n703, n704, n705, n706, n707, n708, n709, n710, n711, 
        n712, n713, n714, n715, n716, n717, n718, n719, n720, 
        n721, n722, n723, n724, n725, n726, n727, n728, n729, 
        n730, n731, n732, n733, n734, n735, n736, n737, n738, 
        n739, n740, n741, n742, n743, n744, n745, n746, n747, 
        n748, n749, n750, n751, n752, n753, n754, n755, n756, 
        n757, n758, n759, n760, n761, n762, n763, n764, n765, 
        n766, n767, n768, n769, n770, n771, n772, n773, n774, 
        n775, n776, n777, n778, n779, n780, n781, n782, n783, 
        n784, n785, n786, n787, n788, n789, n790, n791, n792, 
        n793, n794, n795, n796, n797, n798, n799, n800, n801, 
        n802, n803, n804, n805, n806, n807, n808, n809, n810, 
        n811, n812, n813, n814, n815, n816, n817, n818, n819, 
        n820, n821, n822, n823, n824, n825, n826, n827, n828, 
        n829, n830, n831, n832, n833, n834, n835, n836, n837, 
        n838, n839, n840, n841, n842, n843, n844, n845, n846, 
        n847, n848, n849, n850, n851, n852, n853, n854, n855, 
        n856, n857, n858, n859, n860, n861, n862, n863, n864, 
        n865, n866, n867, n868, n869, n870, n871, n872, n873, 
        n874, n875, n876, n877;
    
    assign led = 1'b1 /* verific EFX_ATTRIBUTE_CELL_NAME=VCC */ ;
    EFX_FF \uartrx/r_Rx_Data~FF  (.D(\uartrx/r_Rx_Data_R ), .CE(1'b1), .CLK(\clk~O ), 
           .SR(1'b0), .Q(\uartrx/r_Rx_Data )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/test_uart_rx.v(28)
    defparam \uartrx/r_Rx_Data~FF .CLK_POLARITY = 1'b1;
    defparam \uartrx/r_Rx_Data~FF .CE_POLARITY = 1'b1;
    defparam \uartrx/r_Rx_Data~FF .SR_POLARITY = 1'b1;
    defparam \uartrx/r_Rx_Data~FF .D_POLARITY = 1'b1;
    defparam \uartrx/r_Rx_Data~FF .SR_SYNC = 1'b1;
    defparam \uartrx/r_Rx_Data~FF .SR_VALUE = 1'b0;
    defparam \uartrx/r_Rx_Data~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uartrx/r_SM_Main[1]~FF  (.D(\uartrx/n365 ), .CE(1'b1), .CLK(\clk~O ), 
           .SR(\uartrx/r_SM_Main[2] ), .Q(\uartrx/r_SM_Main[1] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/test_uart_rx.v(98)
    defparam \uartrx/r_SM_Main[1]~FF .CLK_POLARITY = 1'b1;
    defparam \uartrx/r_SM_Main[1]~FF .CE_POLARITY = 1'b1;
    defparam \uartrx/r_SM_Main[1]~FF .SR_POLARITY = 1'b1;
    defparam \uartrx/r_SM_Main[1]~FF .D_POLARITY = 1'b1;
    defparam \uartrx/r_SM_Main[1]~FF .SR_SYNC = 1'b1;
    defparam \uartrx/r_SM_Main[1]~FF .SR_VALUE = 1'b0;
    defparam \uartrx/r_SM_Main[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uartrx/r_Rx_Byte[0]~FF  (.D(\uartrx/r_Rx_Data ), .CE(\uartrx/n509 ), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\uartrx/r_Rx_Byte[0] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b0, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/test_uart_rx.v(98)
    defparam \uartrx/r_Rx_Byte[0]~FF .CLK_POLARITY = 1'b1;
    defparam \uartrx/r_Rx_Byte[0]~FF .CE_POLARITY = 1'b1;
    defparam \uartrx/r_Rx_Byte[0]~FF .SR_POLARITY = 1'b1;
    defparam \uartrx/r_Rx_Byte[0]~FF .D_POLARITY = 1'b0;
    defparam \uartrx/r_Rx_Byte[0]~FF .SR_SYNC = 1'b1;
    defparam \uartrx/r_Rx_Byte[0]~FF .SR_VALUE = 1'b0;
    defparam \uartrx/r_Rx_Byte[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uartrx/r_SM_Main[2]~FF  (.D(\uartrx/n55 ), .CE(1'b1), .CLK(\clk~O ), 
           .SR(\uartrx/n453 ), .Q(\uartrx/r_SM_Main[2] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b0, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b0 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/test_uart_rx.v(98)
    defparam \uartrx/r_SM_Main[2]~FF .CLK_POLARITY = 1'b1;
    defparam \uartrx/r_SM_Main[2]~FF .CE_POLARITY = 1'b1;
    defparam \uartrx/r_SM_Main[2]~FF .SR_POLARITY = 1'b0;
    defparam \uartrx/r_SM_Main[2]~FF .D_POLARITY = 1'b0;
    defparam \uartrx/r_SM_Main[2]~FF .SR_SYNC = 1'b1;
    defparam \uartrx/r_SM_Main[2]~FF .SR_VALUE = 1'b0;
    defparam \uartrx/r_SM_Main[2]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uartrx/r_Clock_Count[0]~FF  (.D(\uartrx/n442 ), .CE(ceg_net63), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\uartrx/r_Clock_Count[0] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/test_uart_rx.v(98)
    defparam \uartrx/r_Clock_Count[0]~FF .CLK_POLARITY = 1'b1;
    defparam \uartrx/r_Clock_Count[0]~FF .CE_POLARITY = 1'b0;
    defparam \uartrx/r_Clock_Count[0]~FF .SR_POLARITY = 1'b1;
    defparam \uartrx/r_Clock_Count[0]~FF .D_POLARITY = 1'b1;
    defparam \uartrx/r_Clock_Count[0]~FF .SR_SYNC = 1'b1;
    defparam \uartrx/r_Clock_Count[0]~FF .SR_VALUE = 1'b0;
    defparam \uartrx/r_Clock_Count[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \w_rx_dv~FF  (.D(\uartrx/n477 ), .CE(ceg_net352), .CLK(\clk~O ), 
           .SR(1'b0), .Q(w_rx_dv)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/test_uart_rx.v(98)
    defparam \w_rx_dv~FF .CLK_POLARITY = 1'b1;
    defparam \w_rx_dv~FF .CE_POLARITY = 1'b0;
    defparam \w_rx_dv~FF .SR_POLARITY = 1'b1;
    defparam \w_rx_dv~FF .D_POLARITY = 1'b1;
    defparam \w_rx_dv~FF .SR_SYNC = 1'b1;
    defparam \w_rx_dv~FF .SR_VALUE = 1'b0;
    defparam \w_rx_dv~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uartrx/r_Bit_Index[1]~FF  (.D(\uartrx/n403 ), .CE(ceg_net230), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\uartrx/r_Bit_Index[1] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/test_uart_rx.v(98)
    defparam \uartrx/r_Bit_Index[1]~FF .CLK_POLARITY = 1'b1;
    defparam \uartrx/r_Bit_Index[1]~FF .CE_POLARITY = 1'b0;
    defparam \uartrx/r_Bit_Index[1]~FF .SR_POLARITY = 1'b1;
    defparam \uartrx/r_Bit_Index[1]~FF .D_POLARITY = 1'b1;
    defparam \uartrx/r_Bit_Index[1]~FF .SR_SYNC = 1'b1;
    defparam \uartrx/r_Bit_Index[1]~FF .SR_VALUE = 1'b0;
    defparam \uartrx/r_Bit_Index[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uartrx/r_Bit_Index[0]~FF  (.D(\uartrx/n446 ), .CE(ceg_net230), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\uartrx/r_Bit_Index[0] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/test_uart_rx.v(98)
    defparam \uartrx/r_Bit_Index[0]~FF .CLK_POLARITY = 1'b1;
    defparam \uartrx/r_Bit_Index[0]~FF .CE_POLARITY = 1'b0;
    defparam \uartrx/r_Bit_Index[0]~FF .SR_POLARITY = 1'b1;
    defparam \uartrx/r_Bit_Index[0]~FF .D_POLARITY = 1'b1;
    defparam \uartrx/r_Bit_Index[0]~FF .SR_SYNC = 1'b1;
    defparam \uartrx/r_Bit_Index[0]~FF .SR_VALUE = 1'b0;
    defparam \uartrx/r_Bit_Index[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uartrx/r_SM_Main[0]~FF  (.D(\uartrx/n439 ), .CE(1'b1), .CLK(\clk~O ), 
           .SR(\uartrx/r_SM_Main[2] ), .Q(\uartrx/r_SM_Main[0] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/test_uart_rx.v(98)
    defparam \uartrx/r_SM_Main[0]~FF .CLK_POLARITY = 1'b1;
    defparam \uartrx/r_SM_Main[0]~FF .CE_POLARITY = 1'b1;
    defparam \uartrx/r_SM_Main[0]~FF .SR_POLARITY = 1'b1;
    defparam \uartrx/r_SM_Main[0]~FF .D_POLARITY = 1'b1;
    defparam \uartrx/r_SM_Main[0]~FF .SR_SYNC = 1'b1;
    defparam \uartrx/r_SM_Main[0]~FF .SR_VALUE = 1'b0;
    defparam \uartrx/r_SM_Main[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uartrx/r_Rx_Data_R~FF  (.D(i_rx_serial), .CE(1'b1), .CLK(\clk~O ), 
           .SR(1'b0), .Q(\uartrx/r_Rx_Data_R )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b0, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/test_uart_rx.v(28)
    defparam \uartrx/r_Rx_Data_R~FF .CLK_POLARITY = 1'b1;
    defparam \uartrx/r_Rx_Data_R~FF .CE_POLARITY = 1'b1;
    defparam \uartrx/r_Rx_Data_R~FF .SR_POLARITY = 1'b1;
    defparam \uartrx/r_Rx_Data_R~FF .D_POLARITY = 1'b0;
    defparam \uartrx/r_Rx_Data_R~FF .SR_SYNC = 1'b1;
    defparam \uartrx/r_Rx_Data_R~FF .SR_VALUE = 1'b0;
    defparam \uartrx/r_Rx_Data_R~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uartrx/r_Rx_Byte[1]~FF  (.D(\uartrx/r_Rx_Data ), .CE(\uartrx/n485 ), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\uartrx/r_Rx_Byte[1] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b0, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/test_uart_rx.v(98)
    defparam \uartrx/r_Rx_Byte[1]~FF .CLK_POLARITY = 1'b1;
    defparam \uartrx/r_Rx_Byte[1]~FF .CE_POLARITY = 1'b1;
    defparam \uartrx/r_Rx_Byte[1]~FF .SR_POLARITY = 1'b1;
    defparam \uartrx/r_Rx_Byte[1]~FF .D_POLARITY = 1'b0;
    defparam \uartrx/r_Rx_Byte[1]~FF .SR_SYNC = 1'b1;
    defparam \uartrx/r_Rx_Byte[1]~FF .SR_VALUE = 1'b0;
    defparam \uartrx/r_Rx_Byte[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uartrx/r_Rx_Byte[2]~FF  (.D(\uartrx/r_Rx_Data ), .CE(\uartrx/n487 ), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\uartrx/r_Rx_Byte[2] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b0, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/test_uart_rx.v(98)
    defparam \uartrx/r_Rx_Byte[2]~FF .CLK_POLARITY = 1'b1;
    defparam \uartrx/r_Rx_Byte[2]~FF .CE_POLARITY = 1'b1;
    defparam \uartrx/r_Rx_Byte[2]~FF .SR_POLARITY = 1'b1;
    defparam \uartrx/r_Rx_Byte[2]~FF .D_POLARITY = 1'b0;
    defparam \uartrx/r_Rx_Byte[2]~FF .SR_SYNC = 1'b1;
    defparam \uartrx/r_Rx_Byte[2]~FF .SR_VALUE = 1'b0;
    defparam \uartrx/r_Rx_Byte[2]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uartrx/r_Rx_Byte[3]~FF  (.D(\uartrx/r_Rx_Data ), .CE(\uartrx/n489 ), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\uartrx/r_Rx_Byte[3] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b0, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/test_uart_rx.v(98)
    defparam \uartrx/r_Rx_Byte[3]~FF .CLK_POLARITY = 1'b1;
    defparam \uartrx/r_Rx_Byte[3]~FF .CE_POLARITY = 1'b1;
    defparam \uartrx/r_Rx_Byte[3]~FF .SR_POLARITY = 1'b1;
    defparam \uartrx/r_Rx_Byte[3]~FF .D_POLARITY = 1'b0;
    defparam \uartrx/r_Rx_Byte[3]~FF .SR_SYNC = 1'b1;
    defparam \uartrx/r_Rx_Byte[3]~FF .SR_VALUE = 1'b0;
    defparam \uartrx/r_Rx_Byte[3]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uartrx/r_Rx_Byte[4]~FF  (.D(\uartrx/r_Rx_Data ), .CE(\uartrx/n491 ), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\uartrx/r_Rx_Byte[4] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b0, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/test_uart_rx.v(98)
    defparam \uartrx/r_Rx_Byte[4]~FF .CLK_POLARITY = 1'b1;
    defparam \uartrx/r_Rx_Byte[4]~FF .CE_POLARITY = 1'b1;
    defparam \uartrx/r_Rx_Byte[4]~FF .SR_POLARITY = 1'b1;
    defparam \uartrx/r_Rx_Byte[4]~FF .D_POLARITY = 1'b0;
    defparam \uartrx/r_Rx_Byte[4]~FF .SR_SYNC = 1'b1;
    defparam \uartrx/r_Rx_Byte[4]~FF .SR_VALUE = 1'b0;
    defparam \uartrx/r_Rx_Byte[4]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uartrx/r_Rx_Byte[5]~FF  (.D(\uartrx/r_Rx_Data ), .CE(\uartrx/n500 ), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\uartrx/r_Rx_Byte[5] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b0, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/test_uart_rx.v(98)
    defparam \uartrx/r_Rx_Byte[5]~FF .CLK_POLARITY = 1'b1;
    defparam \uartrx/r_Rx_Byte[5]~FF .CE_POLARITY = 1'b1;
    defparam \uartrx/r_Rx_Byte[5]~FF .SR_POLARITY = 1'b1;
    defparam \uartrx/r_Rx_Byte[5]~FF .D_POLARITY = 1'b0;
    defparam \uartrx/r_Rx_Byte[5]~FF .SR_SYNC = 1'b1;
    defparam \uartrx/r_Rx_Byte[5]~FF .SR_VALUE = 1'b0;
    defparam \uartrx/r_Rx_Byte[5]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uartrx/r_Rx_Byte[6]~FF  (.D(\uartrx/r_Rx_Data ), .CE(\uartrx/n503 ), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\uartrx/r_Rx_Byte[6] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b0, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/test_uart_rx.v(98)
    defparam \uartrx/r_Rx_Byte[6]~FF .CLK_POLARITY = 1'b1;
    defparam \uartrx/r_Rx_Byte[6]~FF .CE_POLARITY = 1'b1;
    defparam \uartrx/r_Rx_Byte[6]~FF .SR_POLARITY = 1'b1;
    defparam \uartrx/r_Rx_Byte[6]~FF .D_POLARITY = 1'b0;
    defparam \uartrx/r_Rx_Byte[6]~FF .SR_SYNC = 1'b1;
    defparam \uartrx/r_Rx_Byte[6]~FF .SR_VALUE = 1'b0;
    defparam \uartrx/r_Rx_Byte[6]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uartrx/r_Rx_Byte[7]~FF  (.D(\uartrx/r_Rx_Data ), .CE(\uartrx/n506 ), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\uartrx/r_Rx_Byte[7] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b0, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/test_uart_rx.v(98)
    defparam \uartrx/r_Rx_Byte[7]~FF .CLK_POLARITY = 1'b1;
    defparam \uartrx/r_Rx_Byte[7]~FF .CE_POLARITY = 1'b1;
    defparam \uartrx/r_Rx_Byte[7]~FF .SR_POLARITY = 1'b1;
    defparam \uartrx/r_Rx_Byte[7]~FF .D_POLARITY = 1'b0;
    defparam \uartrx/r_Rx_Byte[7]~FF .SR_SYNC = 1'b1;
    defparam \uartrx/r_Rx_Byte[7]~FF .SR_VALUE = 1'b0;
    defparam \uartrx/r_Rx_Byte[7]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uartrx/r_Clock_Count[1]~FF  (.D(\uartrx/n372 ), .CE(ceg_net63), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\uartrx/r_Clock_Count[1] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/test_uart_rx.v(98)
    defparam \uartrx/r_Clock_Count[1]~FF .CLK_POLARITY = 1'b1;
    defparam \uartrx/r_Clock_Count[1]~FF .CE_POLARITY = 1'b0;
    defparam \uartrx/r_Clock_Count[1]~FF .SR_POLARITY = 1'b1;
    defparam \uartrx/r_Clock_Count[1]~FF .D_POLARITY = 1'b1;
    defparam \uartrx/r_Clock_Count[1]~FF .SR_SYNC = 1'b1;
    defparam \uartrx/r_Clock_Count[1]~FF .SR_VALUE = 1'b0;
    defparam \uartrx/r_Clock_Count[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uartrx/r_Clock_Count[2]~FF  (.D(\uartrx/n375 ), .CE(ceg_net63), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\uartrx/r_Clock_Count[2] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/test_uart_rx.v(98)
    defparam \uartrx/r_Clock_Count[2]~FF .CLK_POLARITY = 1'b1;
    defparam \uartrx/r_Clock_Count[2]~FF .CE_POLARITY = 1'b0;
    defparam \uartrx/r_Clock_Count[2]~FF .SR_POLARITY = 1'b1;
    defparam \uartrx/r_Clock_Count[2]~FF .D_POLARITY = 1'b1;
    defparam \uartrx/r_Clock_Count[2]~FF .SR_SYNC = 1'b1;
    defparam \uartrx/r_Clock_Count[2]~FF .SR_VALUE = 1'b0;
    defparam \uartrx/r_Clock_Count[2]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uartrx/r_Clock_Count[3]~FF  (.D(\uartrx/n378 ), .CE(ceg_net63), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\uartrx/r_Clock_Count[3] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/test_uart_rx.v(98)
    defparam \uartrx/r_Clock_Count[3]~FF .CLK_POLARITY = 1'b1;
    defparam \uartrx/r_Clock_Count[3]~FF .CE_POLARITY = 1'b0;
    defparam \uartrx/r_Clock_Count[3]~FF .SR_POLARITY = 1'b1;
    defparam \uartrx/r_Clock_Count[3]~FF .D_POLARITY = 1'b1;
    defparam \uartrx/r_Clock_Count[3]~FF .SR_SYNC = 1'b1;
    defparam \uartrx/r_Clock_Count[3]~FF .SR_VALUE = 1'b0;
    defparam \uartrx/r_Clock_Count[3]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uartrx/r_Clock_Count[4]~FF  (.D(\uartrx/n381 ), .CE(ceg_net63), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\uartrx/r_Clock_Count[4] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/test_uart_rx.v(98)
    defparam \uartrx/r_Clock_Count[4]~FF .CLK_POLARITY = 1'b1;
    defparam \uartrx/r_Clock_Count[4]~FF .CE_POLARITY = 1'b0;
    defparam \uartrx/r_Clock_Count[4]~FF .SR_POLARITY = 1'b1;
    defparam \uartrx/r_Clock_Count[4]~FF .D_POLARITY = 1'b1;
    defparam \uartrx/r_Clock_Count[4]~FF .SR_SYNC = 1'b1;
    defparam \uartrx/r_Clock_Count[4]~FF .SR_VALUE = 1'b0;
    defparam \uartrx/r_Clock_Count[4]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uartrx/r_Clock_Count[5]~FF  (.D(\uartrx/n384 ), .CE(ceg_net63), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\uartrx/r_Clock_Count[5] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/test_uart_rx.v(98)
    defparam \uartrx/r_Clock_Count[5]~FF .CLK_POLARITY = 1'b1;
    defparam \uartrx/r_Clock_Count[5]~FF .CE_POLARITY = 1'b0;
    defparam \uartrx/r_Clock_Count[5]~FF .SR_POLARITY = 1'b1;
    defparam \uartrx/r_Clock_Count[5]~FF .D_POLARITY = 1'b1;
    defparam \uartrx/r_Clock_Count[5]~FF .SR_SYNC = 1'b1;
    defparam \uartrx/r_Clock_Count[5]~FF .SR_VALUE = 1'b0;
    defparam \uartrx/r_Clock_Count[5]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uartrx/r_Clock_Count[6]~FF  (.D(\uartrx/n387 ), .CE(ceg_net63), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\uartrx/r_Clock_Count[6] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/test_uart_rx.v(98)
    defparam \uartrx/r_Clock_Count[6]~FF .CLK_POLARITY = 1'b1;
    defparam \uartrx/r_Clock_Count[6]~FF .CE_POLARITY = 1'b0;
    defparam \uartrx/r_Clock_Count[6]~FF .SR_POLARITY = 1'b1;
    defparam \uartrx/r_Clock_Count[6]~FF .D_POLARITY = 1'b1;
    defparam \uartrx/r_Clock_Count[6]~FF .SR_SYNC = 1'b1;
    defparam \uartrx/r_Clock_Count[6]~FF .SR_VALUE = 1'b0;
    defparam \uartrx/r_Clock_Count[6]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uartrx/r_Clock_Count[7]~FF  (.D(\uartrx/n390 ), .CE(ceg_net63), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\uartrx/r_Clock_Count[7] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/test_uart_rx.v(98)
    defparam \uartrx/r_Clock_Count[7]~FF .CLK_POLARITY = 1'b1;
    defparam \uartrx/r_Clock_Count[7]~FF .CE_POLARITY = 1'b0;
    defparam \uartrx/r_Clock_Count[7]~FF .SR_POLARITY = 1'b1;
    defparam \uartrx/r_Clock_Count[7]~FF .D_POLARITY = 1'b1;
    defparam \uartrx/r_Clock_Count[7]~FF .SR_SYNC = 1'b1;
    defparam \uartrx/r_Clock_Count[7]~FF .SR_VALUE = 1'b0;
    defparam \uartrx/r_Clock_Count[7]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uartrx/r_Clock_Count[8]~FF  (.D(\uartrx/n393 ), .CE(ceg_net63), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\uartrx/r_Clock_Count[8] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/test_uart_rx.v(98)
    defparam \uartrx/r_Clock_Count[8]~FF .CLK_POLARITY = 1'b1;
    defparam \uartrx/r_Clock_Count[8]~FF .CE_POLARITY = 1'b0;
    defparam \uartrx/r_Clock_Count[8]~FF .SR_POLARITY = 1'b1;
    defparam \uartrx/r_Clock_Count[8]~FF .D_POLARITY = 1'b1;
    defparam \uartrx/r_Clock_Count[8]~FF .SR_SYNC = 1'b1;
    defparam \uartrx/r_Clock_Count[8]~FF .SR_VALUE = 1'b0;
    defparam \uartrx/r_Clock_Count[8]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uartrx/r_Clock_Count[9]~FF  (.D(\uartrx/n396 ), .CE(ceg_net63), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\uartrx/r_Clock_Count[9] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/test_uart_rx.v(98)
    defparam \uartrx/r_Clock_Count[9]~FF .CLK_POLARITY = 1'b1;
    defparam \uartrx/r_Clock_Count[9]~FF .CE_POLARITY = 1'b0;
    defparam \uartrx/r_Clock_Count[9]~FF .SR_POLARITY = 1'b1;
    defparam \uartrx/r_Clock_Count[9]~FF .D_POLARITY = 1'b1;
    defparam \uartrx/r_Clock_Count[9]~FF .SR_SYNC = 1'b1;
    defparam \uartrx/r_Clock_Count[9]~FF .SR_VALUE = 1'b0;
    defparam \uartrx/r_Clock_Count[9]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uartrx/r_Clock_Count[10]~FF  (.D(\uartrx/n399 ), .CE(ceg_net63), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\uartrx/r_Clock_Count[10] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/test_uart_rx.v(98)
    defparam \uartrx/r_Clock_Count[10]~FF .CLK_POLARITY = 1'b1;
    defparam \uartrx/r_Clock_Count[10]~FF .CE_POLARITY = 1'b0;
    defparam \uartrx/r_Clock_Count[10]~FF .SR_POLARITY = 1'b1;
    defparam \uartrx/r_Clock_Count[10]~FF .D_POLARITY = 1'b1;
    defparam \uartrx/r_Clock_Count[10]~FF .SR_SYNC = 1'b1;
    defparam \uartrx/r_Clock_Count[10]~FF .SR_VALUE = 1'b0;
    defparam \uartrx/r_Clock_Count[10]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \uartrx/r_Bit_Index[2]~FF  (.D(\uartrx/n407 ), .CE(ceg_net230), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\uartrx/r_Bit_Index[2] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/test_uart_rx.v(98)
    defparam \uartrx/r_Bit_Index[2]~FF .CLK_POLARITY = 1'b1;
    defparam \uartrx/r_Bit_Index[2]~FF .CE_POLARITY = 1'b0;
    defparam \uartrx/r_Bit_Index[2]~FF .SR_POLARITY = 1'b1;
    defparam \uartrx/r_Bit_Index[2]~FF .D_POLARITY = 1'b1;
    defparam \uartrx/r_Bit_Index[2]~FF .SR_SYNC = 1'b1;
    defparam \uartrx/r_Bit_Index[2]~FF .SR_VALUE = 1'b0;
    defparam \uartrx/r_Bit_Index[2]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/genblk2.rd_rst[1]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/genblk2.rd_rst[0] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(1'b0), .Q(\ws_wr_fifo/u_efx_fifo_top/genblk2.rd_rst[1] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1, async_reg="true" */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(513)
    defparam \ws_wr_fifo/u_efx_fifo_top/genblk2.rd_rst[1]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/genblk2.rd_rst[1]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/genblk2.rd_rst[1]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/genblk2.rd_rst[1]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/genblk2.rd_rst[1]~FF .SR_SYNC = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/genblk2.rd_rst[1]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/genblk2.rd_rst[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/genblk2.rd_rst[0]~FF  (.D(1'b0), .CE(1'b1), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\ws_wr_fifo/u_efx_fifo_top/genblk2.rd_rst[0] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1, async_reg="true" */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(513)
    defparam \ws_wr_fifo/u_efx_fifo_top/genblk2.rd_rst[0]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/genblk2.rd_rst[0]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/genblk2.rd_rst[0]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/genblk2.rd_rst[0]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/genblk2.rd_rst[0]~FF .SR_SYNC = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/genblk2.rd_rst[0]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/genblk2.rd_rst[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/genblk2.wr_rst[0]~FF  (.D(1'b0), .CE(1'b1), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\ws_wr_fifo/u_efx_fifo_top/genblk2.wr_rst[0] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1, async_reg="true" */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(506)
    defparam \ws_wr_fifo/u_efx_fifo_top/genblk2.wr_rst[0]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/genblk2.wr_rst[0]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/genblk2.wr_rst[0]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/genblk2.wr_rst[0]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/genblk2.wr_rst[0]~FF .SR_SYNC = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/genblk2.wr_rst[0]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/genblk2.wr_rst[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/waddr[3]~FF  (.D(n15), .CE(\ws_wr_fifo/u_efx_fifo_top/wr_en_int ), 
           .CLK(\clk~O ), .SR(\ws_wr_fifo/u_efx_fifo_top/genblk2.wr_rst[1] ), 
           .Q(\ws_wr_fifo/u_efx_fifo_top/waddr[3] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1287)
    defparam \ws_wr_fifo/u_efx_fifo_top/waddr[3]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/waddr[3]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/waddr[3]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/waddr[3]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/waddr[3]~FF .SR_SYNC = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/waddr[3]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/waddr[3]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/waddr[2]~FF  (.D(n35), .CE(\ws_wr_fifo/u_efx_fifo_top/wr_en_int ), 
           .CLK(\clk~O ), .SR(\ws_wr_fifo/u_efx_fifo_top/genblk2.wr_rst[1] ), 
           .Q(\ws_wr_fifo/u_efx_fifo_top/waddr[2] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1287)
    defparam \ws_wr_fifo/u_efx_fifo_top/waddr[2]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/waddr[2]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/waddr[2]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/waddr[2]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/waddr[2]~FF .SR_SYNC = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/waddr[2]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/waddr[2]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/waddr[1]~FF  (.D(n37), .CE(\ws_wr_fifo/u_efx_fifo_top/wr_en_int ), 
           .CLK(\clk~O ), .SR(\ws_wr_fifo/u_efx_fifo_top/genblk2.wr_rst[1] ), 
           .Q(\ws_wr_fifo/u_efx_fifo_top/waddr[1] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1287)
    defparam \ws_wr_fifo/u_efx_fifo_top/waddr[1]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/waddr[1]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/waddr[1]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/waddr[1]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/waddr[1]~FF .SR_SYNC = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/waddr[1]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/waddr[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/waddr[0]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/waddr[0] ), 
           .CE(\ws_wr_fifo/u_efx_fifo_top/wr_en_int ), .CLK(\clk~O ), .SR(\ws_wr_fifo/u_efx_fifo_top/genblk2.wr_rst[1] ), 
           .Q(\ws_wr_fifo/u_efx_fifo_top/waddr[0] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b0, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1287)
    defparam \ws_wr_fifo/u_efx_fifo_top/waddr[0]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/waddr[0]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/waddr[0]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/waddr[0]~FF .D_POLARITY = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/waddr[0]~FF .SR_SYNC = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/waddr[0]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/waddr[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/raddr[0]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/raddr[0] ), 
           .CE(\ws_wr_fifo/u_efx_fifo_top/rd_en_int ), .CLK(\clk~O ), .SR(\ws_wr_fifo/u_efx_fifo_top/genblk2.rd_rst[1] ), 
           .Q(\ws_wr_fifo/u_efx_fifo_top/raddr[0] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b0, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1298)
    defparam \ws_wr_fifo/u_efx_fifo_top/raddr[0]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/raddr[0]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/raddr[0]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/raddr[0]~FF .D_POLARITY = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/raddr[0]~FF .SR_SYNC = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/raddr[0]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/raddr[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[0]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_sync_g2b[0] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(\ws_wr_fifo/u_efx_fifo_top/genblk2.wr_rst[1] ), 
           .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[0] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1330)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[0]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[0]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[0]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[0]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[0]~FF .SR_SYNC = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[0]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[0]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_sync_g2b[0] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(\ws_wr_fifo/u_efx_fifo_top/genblk2.rd_rst[1] ), 
           .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[0] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1339)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[0]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[0]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[0]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[0]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[0]~FF .SR_SYNC = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[0]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[0]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry[0] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(\ws_wr_fifo/u_efx_fifo_top/genblk2.rd_rst[1] ), 
           .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[0] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1353)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[0]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[0]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[0]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[0]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[0]~FF .SR_SYNC = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[0]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[0]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry[0] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(\ws_wr_fifo/u_efx_fifo_top/genblk2.wr_rst[1] ), 
           .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[0] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1365)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[0]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[0]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[0]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[0]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[0]~FF .SR_SYNC = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[0]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/waddr[4]~FF  (.D(n335), .CE(\ws_wr_fifo/u_efx_fifo_top/wr_en_int ), 
           .CLK(\clk~O ), .SR(\ws_wr_fifo/u_efx_fifo_top/genblk2.wr_rst[1] ), 
           .Q(\ws_wr_fifo/u_efx_fifo_top/waddr[4] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1287)
    defparam \ws_wr_fifo/u_efx_fifo_top/waddr[4]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/waddr[4]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/waddr[4]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/waddr[4]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/waddr[4]~FF .SR_SYNC = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/waddr[4]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/waddr[4]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/waddr[5]~FF  (.D(n333), .CE(\ws_wr_fifo/u_efx_fifo_top/wr_en_int ), 
           .CLK(\clk~O ), .SR(\ws_wr_fifo/u_efx_fifo_top/genblk2.wr_rst[1] ), 
           .Q(\ws_wr_fifo/u_efx_fifo_top/waddr[5] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1287)
    defparam \ws_wr_fifo/u_efx_fifo_top/waddr[5]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/waddr[5]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/waddr[5]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/waddr[5]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/waddr[5]~FF .SR_SYNC = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/waddr[5]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/waddr[5]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/waddr[6]~FF  (.D(n331), .CE(\ws_wr_fifo/u_efx_fifo_top/wr_en_int ), 
           .CLK(\clk~O ), .SR(\ws_wr_fifo/u_efx_fifo_top/genblk2.wr_rst[1] ), 
           .Q(\ws_wr_fifo/u_efx_fifo_top/waddr[6] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1287)
    defparam \ws_wr_fifo/u_efx_fifo_top/waddr[6]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/waddr[6]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/waddr[6]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/waddr[6]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/waddr[6]~FF .SR_SYNC = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/waddr[6]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/waddr[6]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/waddr[7]~FF  (.D(n329), .CE(\ws_wr_fifo/u_efx_fifo_top/wr_en_int ), 
           .CLK(\clk~O ), .SR(\ws_wr_fifo/u_efx_fifo_top/genblk2.wr_rst[1] ), 
           .Q(\ws_wr_fifo/u_efx_fifo_top/waddr[7] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1287)
    defparam \ws_wr_fifo/u_efx_fifo_top/waddr[7]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/waddr[7]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/waddr[7]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/waddr[7]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/waddr[7]~FF .SR_SYNC = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/waddr[7]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/waddr[7]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/waddr[8]~FF  (.D(n327), .CE(\ws_wr_fifo/u_efx_fifo_top/wr_en_int ), 
           .CLK(\clk~O ), .SR(\ws_wr_fifo/u_efx_fifo_top/genblk2.wr_rst[1] ), 
           .Q(\ws_wr_fifo/u_efx_fifo_top/waddr[8] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1287)
    defparam \ws_wr_fifo/u_efx_fifo_top/waddr[8]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/waddr[8]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/waddr[8]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/waddr[8]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/waddr[8]~FF .SR_SYNC = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/waddr[8]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/waddr[8]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/waddr_cntr[9]~FF  (.D(n326), 
           .CE(\ws_wr_fifo/u_efx_fifo_top/wr_en_int ), .CLK(\clk~O ), .SR(\ws_wr_fifo/u_efx_fifo_top/genblk2.wr_rst[1] ), 
           .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/waddr_cntr[9] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1287)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/waddr_cntr[9]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/waddr_cntr[9]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/waddr_cntr[9]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/waddr_cntr[9]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/waddr_cntr[9]~FF .SR_SYNC = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/waddr_cntr[9]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/waddr_cntr[9]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/raddr[1]~FF  (.D(n46), .CE(\ws_wr_fifo/u_efx_fifo_top/rd_en_int ), 
           .CLK(\clk~O ), .SR(\ws_wr_fifo/u_efx_fifo_top/genblk2.rd_rst[1] ), 
           .Q(\ws_wr_fifo/u_efx_fifo_top/raddr[1] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1298)
    defparam \ws_wr_fifo/u_efx_fifo_top/raddr[1]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/raddr[1]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/raddr[1]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/raddr[1]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/raddr[1]~FF .SR_SYNC = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/raddr[1]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/raddr[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/raddr[2]~FF  (.D(n324), .CE(\ws_wr_fifo/u_efx_fifo_top/rd_en_int ), 
           .CLK(\clk~O ), .SR(\ws_wr_fifo/u_efx_fifo_top/genblk2.rd_rst[1] ), 
           .Q(\ws_wr_fifo/u_efx_fifo_top/raddr[2] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1298)
    defparam \ws_wr_fifo/u_efx_fifo_top/raddr[2]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/raddr[2]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/raddr[2]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/raddr[2]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/raddr[2]~FF .SR_SYNC = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/raddr[2]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/raddr[2]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/raddr[3]~FF  (.D(n322), .CE(\ws_wr_fifo/u_efx_fifo_top/rd_en_int ), 
           .CLK(\clk~O ), .SR(\ws_wr_fifo/u_efx_fifo_top/genblk2.rd_rst[1] ), 
           .Q(\ws_wr_fifo/u_efx_fifo_top/raddr[3] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1298)
    defparam \ws_wr_fifo/u_efx_fifo_top/raddr[3]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/raddr[3]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/raddr[3]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/raddr[3]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/raddr[3]~FF .SR_SYNC = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/raddr[3]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/raddr[3]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/raddr[4]~FF  (.D(n320), .CE(\ws_wr_fifo/u_efx_fifo_top/rd_en_int ), 
           .CLK(\clk~O ), .SR(\ws_wr_fifo/u_efx_fifo_top/genblk2.rd_rst[1] ), 
           .Q(\ws_wr_fifo/u_efx_fifo_top/raddr[4] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1298)
    defparam \ws_wr_fifo/u_efx_fifo_top/raddr[4]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/raddr[4]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/raddr[4]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/raddr[4]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/raddr[4]~FF .SR_SYNC = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/raddr[4]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/raddr[4]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/raddr[5]~FF  (.D(n318), .CE(\ws_wr_fifo/u_efx_fifo_top/rd_en_int ), 
           .CLK(\clk~O ), .SR(\ws_wr_fifo/u_efx_fifo_top/genblk2.rd_rst[1] ), 
           .Q(\ws_wr_fifo/u_efx_fifo_top/raddr[5] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1298)
    defparam \ws_wr_fifo/u_efx_fifo_top/raddr[5]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/raddr[5]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/raddr[5]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/raddr[5]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/raddr[5]~FF .SR_SYNC = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/raddr[5]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/raddr[5]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/raddr[6]~FF  (.D(n316), .CE(\ws_wr_fifo/u_efx_fifo_top/rd_en_int ), 
           .CLK(\clk~O ), .SR(\ws_wr_fifo/u_efx_fifo_top/genblk2.rd_rst[1] ), 
           .Q(\ws_wr_fifo/u_efx_fifo_top/raddr[6] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1298)
    defparam \ws_wr_fifo/u_efx_fifo_top/raddr[6]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/raddr[6]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/raddr[6]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/raddr[6]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/raddr[6]~FF .SR_SYNC = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/raddr[6]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/raddr[6]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/raddr[7]~FF  (.D(n314), .CE(\ws_wr_fifo/u_efx_fifo_top/rd_en_int ), 
           .CLK(\clk~O ), .SR(\ws_wr_fifo/u_efx_fifo_top/genblk2.rd_rst[1] ), 
           .Q(\ws_wr_fifo/u_efx_fifo_top/raddr[7] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1298)
    defparam \ws_wr_fifo/u_efx_fifo_top/raddr[7]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/raddr[7]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/raddr[7]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/raddr[7]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/raddr[7]~FF .SR_SYNC = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/raddr[7]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/raddr[7]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/raddr[8]~FF  (.D(n312), .CE(\ws_wr_fifo/u_efx_fifo_top/rd_en_int ), 
           .CLK(\clk~O ), .SR(\ws_wr_fifo/u_efx_fifo_top/genblk2.rd_rst[1] ), 
           .Q(\ws_wr_fifo/u_efx_fifo_top/raddr[8] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1298)
    defparam \ws_wr_fifo/u_efx_fifo_top/raddr[8]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/raddr[8]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/raddr[8]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/raddr[8]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/raddr[8]~FF .SR_SYNC = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/raddr[8]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/raddr[8]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/raddr_cntr[9]~FF  (.D(n311), 
           .CE(\ws_wr_fifo/u_efx_fifo_top/rd_en_int ), .CLK(\clk~O ), .SR(\ws_wr_fifo/u_efx_fifo_top/genblk2.rd_rst[1] ), 
           .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/raddr_cntr[9] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1298)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/raddr_cntr[9]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/raddr_cntr[9]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/raddr_cntr[9]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/raddr_cntr[9]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/raddr_cntr[9]~FF .SR_SYNC = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/raddr_cntr[9]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/raddr_cntr[9]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[1]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_sync_g2b[1] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(\ws_wr_fifo/u_efx_fifo_top/genblk2.wr_rst[1] ), 
           .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[1] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1330)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[1]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[1]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[1]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[1]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[1]~FF .SR_SYNC = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[1]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[2]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_sync_g2b[2] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(\ws_wr_fifo/u_efx_fifo_top/genblk2.wr_rst[1] ), 
           .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[2] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1330)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[2]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[2]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[2]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[2]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[2]~FF .SR_SYNC = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[2]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[2]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[3]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_sync_g2b[3] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(\ws_wr_fifo/u_efx_fifo_top/genblk2.wr_rst[1] ), 
           .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[3] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1330)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[3]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[3]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[3]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[3]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[3]~FF .SR_SYNC = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[3]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[3]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[4]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_sync_g2b[4] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(\ws_wr_fifo/u_efx_fifo_top/genblk2.wr_rst[1] ), 
           .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[4] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1330)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[4]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[4]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[4]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[4]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[4]~FF .SR_SYNC = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[4]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[4]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[5]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_sync_g2b[5] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(\ws_wr_fifo/u_efx_fifo_top/genblk2.wr_rst[1] ), 
           .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[5] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1330)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[5]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[5]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[5]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[5]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[5]~FF .SR_SYNC = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[5]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[5]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[6]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_sync_g2b[6] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(\ws_wr_fifo/u_efx_fifo_top/genblk2.wr_rst[1] ), 
           .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[6] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1330)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[6]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[6]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[6]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[6]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[6]~FF .SR_SYNC = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[6]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[6]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[7]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_sync_g2b[7] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(\ws_wr_fifo/u_efx_fifo_top/genblk2.wr_rst[1] ), 
           .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[7] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1330)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[7]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[7]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[7]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[7]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[7]~FF .SR_SYNC = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[7]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[7]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[8]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_sync_g2b[8] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(\ws_wr_fifo/u_efx_fifo_top/genblk2.wr_rst[1] ), 
           .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[8] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1330)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[8]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[8]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[8]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[8]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[8]~FF .SR_SYNC = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[8]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[8]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[9]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[9] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(\ws_wr_fifo/u_efx_fifo_top/genblk2.wr_rst[1] ), 
           .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[9] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1330)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[9]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[9]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[9]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[9]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[9]~FF .SR_SYNC = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[9]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[9]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[1]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_sync_g2b[1] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(\ws_wr_fifo/u_efx_fifo_top/genblk2.rd_rst[1] ), 
           .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[1] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1339)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[1]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[1]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[1]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[1]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[1]~FF .SR_SYNC = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[1]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[2]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_sync_g2b[2] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(\ws_wr_fifo/u_efx_fifo_top/genblk2.rd_rst[1] ), 
           .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[2] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1339)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[2]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[2]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[2]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[2]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[2]~FF .SR_SYNC = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[2]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[2]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[3]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_sync_g2b[3] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(\ws_wr_fifo/u_efx_fifo_top/genblk2.rd_rst[1] ), 
           .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[3] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1339)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[3]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[3]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[3]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[3]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[3]~FF .SR_SYNC = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[3]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[3]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[4]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_sync_g2b[4] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(\ws_wr_fifo/u_efx_fifo_top/genblk2.rd_rst[1] ), 
           .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[4] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1339)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[4]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[4]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[4]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[4]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[4]~FF .SR_SYNC = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[4]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[4]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[5]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_sync_g2b[5] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(\ws_wr_fifo/u_efx_fifo_top/genblk2.rd_rst[1] ), 
           .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[5] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1339)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[5]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[5]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[5]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[5]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[5]~FF .SR_SYNC = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[5]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[5]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[6]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_sync_g2b[6] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(\ws_wr_fifo/u_efx_fifo_top/genblk2.rd_rst[1] ), 
           .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[6] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1339)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[6]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[6]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[6]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[6]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[6]~FF .SR_SYNC = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[6]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[6]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[7]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_sync_g2b[7] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(\ws_wr_fifo/u_efx_fifo_top/genblk2.rd_rst[1] ), 
           .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[7] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1339)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[7]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[7]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[7]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[7]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[7]~FF .SR_SYNC = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[7]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[7]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[8]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_sync_g2b[8] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(\ws_wr_fifo/u_efx_fifo_top/genblk2.rd_rst[1] ), 
           .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[8] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1339)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[8]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[8]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[8]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[8]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[8]~FF .SR_SYNC = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[8]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[8]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[9]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[9] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(\ws_wr_fifo/u_efx_fifo_top/genblk2.rd_rst[1] ), 
           .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[9] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1339)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[9]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[9]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[9]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[9]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[9]~FF .SR_SYNC = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[9]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[9]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[1]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry[1] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(\ws_wr_fifo/u_efx_fifo_top/genblk2.rd_rst[1] ), 
           .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[1] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1353)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[1]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[1]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[1]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[1]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[1]~FF .SR_SYNC = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[1]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[2]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry[2] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(\ws_wr_fifo/u_efx_fifo_top/genblk2.rd_rst[1] ), 
           .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[2] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1353)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[2]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[2]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[2]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[2]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[2]~FF .SR_SYNC = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[2]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[2]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[3]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry[3] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(\ws_wr_fifo/u_efx_fifo_top/genblk2.rd_rst[1] ), 
           .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[3] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1353)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[3]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[3]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[3]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[3]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[3]~FF .SR_SYNC = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[3]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[3]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[4]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry[4] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(\ws_wr_fifo/u_efx_fifo_top/genblk2.rd_rst[1] ), 
           .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[4] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1353)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[4]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[4]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[4]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[4]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[4]~FF .SR_SYNC = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[4]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[4]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[5]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry[5] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(\ws_wr_fifo/u_efx_fifo_top/genblk2.rd_rst[1] ), 
           .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[5] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1353)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[5]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[5]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[5]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[5]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[5]~FF .SR_SYNC = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[5]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[5]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[6]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry[6] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(\ws_wr_fifo/u_efx_fifo_top/genblk2.rd_rst[1] ), 
           .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[6] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1353)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[6]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[6]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[6]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[6]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[6]~FF .SR_SYNC = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[6]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[6]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[7]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry[7] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(\ws_wr_fifo/u_efx_fifo_top/genblk2.rd_rst[1] ), 
           .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[7] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1353)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[7]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[7]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[7]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[7]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[7]~FF .SR_SYNC = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[7]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[7]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[8]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry[8] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(\ws_wr_fifo/u_efx_fifo_top/genblk2.rd_rst[1] ), 
           .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[8] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1353)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[8]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[8]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[8]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[8]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[8]~FF .SR_SYNC = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[8]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[8]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[9]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/raddr_cntr[9] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(\ws_wr_fifo/u_efx_fifo_top/genblk2.rd_rst[1] ), 
           .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[9] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1353)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[9]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[9]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[9]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[9]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[9]~FF .SR_SYNC = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[9]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[9]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[1]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry[1] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(\ws_wr_fifo/u_efx_fifo_top/genblk2.wr_rst[1] ), 
           .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[1] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1365)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[1]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[1]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[1]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[1]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[1]~FF .SR_SYNC = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[1]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[2]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry[2] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(\ws_wr_fifo/u_efx_fifo_top/genblk2.wr_rst[1] ), 
           .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[2] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1365)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[2]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[2]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[2]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[2]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[2]~FF .SR_SYNC = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[2]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[2]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[3]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry[3] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(\ws_wr_fifo/u_efx_fifo_top/genblk2.wr_rst[1] ), 
           .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[3] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1365)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[3]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[3]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[3]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[3]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[3]~FF .SR_SYNC = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[3]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[3]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[4]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry[4] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(\ws_wr_fifo/u_efx_fifo_top/genblk2.wr_rst[1] ), 
           .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[4] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1365)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[4]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[4]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[4]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[4]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[4]~FF .SR_SYNC = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[4]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[4]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[5]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry[5] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(\ws_wr_fifo/u_efx_fifo_top/genblk2.wr_rst[1] ), 
           .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[5] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1365)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[5]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[5]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[5]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[5]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[5]~FF .SR_SYNC = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[5]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[5]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[6]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry[6] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(\ws_wr_fifo/u_efx_fifo_top/genblk2.wr_rst[1] ), 
           .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[6] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1365)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[6]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[6]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[6]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[6]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[6]~FF .SR_SYNC = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[6]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[6]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[7]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry[7] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(\ws_wr_fifo/u_efx_fifo_top/genblk2.wr_rst[1] ), 
           .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[7] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1365)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[7]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[7]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[7]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[7]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[7]~FF .SR_SYNC = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[7]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[7]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[8]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry[8] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(\ws_wr_fifo/u_efx_fifo_top/genblk2.wr_rst[1] ), 
           .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[8] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1365)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[8]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[8]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[8]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[8]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[8]~FF .SR_SYNC = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[8]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[8]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[9]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/waddr_cntr[9] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(\ws_wr_fifo/u_efx_fifo_top/genblk2.wr_rst[1] ), 
           .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[9] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b0, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1365)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[9]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[9]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[9]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[9]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[9]~FF .SR_SYNC = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[9]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[9]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][5]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[5] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(1'b0), .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][5] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1, async_reg="true" */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(147)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][5]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][5]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][5]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][5]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][5]~FF .SR_SYNC = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][5]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][5]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][4]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[4] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(1'b0), .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][4] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1, async_reg="true" */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(147)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][4]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][4]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][4]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][4]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][4]~FF .SR_SYNC = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][4]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][4]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][3]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[3] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(1'b0), .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][3] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1, async_reg="true" */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(147)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][3]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][3]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][3]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][3]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][3]~FF .SR_SYNC = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][3]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][3]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][2]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[2] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(1'b0), .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][2] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1, async_reg="true" */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(147)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][2]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][2]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][2]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][2]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][2]~FF .SR_SYNC = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][2]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][2]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][6]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[6] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(1'b0), .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][6] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1, async_reg="true" */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(147)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][6]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][6]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][6]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][6]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][6]~FF .SR_SYNC = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][6]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][6]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][0]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[0] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(1'b0), .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][0] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1, async_reg="true" */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(147)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][0]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][0]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][0]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][0]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][0]~FF .SR_SYNC = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][0]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][1]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[1] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(1'b0), .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][1] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1, async_reg="true" */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(147)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][1]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][1]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][1]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][1]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][1]~FF .SR_SYNC = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][1]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][7]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[7] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(1'b0), .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][7] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1, async_reg="true" */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(147)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][7]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][7]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][7]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][7]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][7]~FF .SR_SYNC = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][7]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][7]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][8]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[8] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(1'b0), .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][8] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1, async_reg="true" */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(147)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][8]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][8]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][8]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][8]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][8]~FF .SR_SYNC = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][8]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][8]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][9]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_r[9] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(1'b0), .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][9] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1, async_reg="true" */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(147)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][9]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][9]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][9]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][9]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][9]~FF .SR_SYNC = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][9]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][9]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[0]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][0] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(1'b0), .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[0] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1, async_reg="true" */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(147)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[0]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[0]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[0]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[0]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[0]~FF .SR_SYNC = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[0]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[1]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][1] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(1'b0), .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[1] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1, async_reg="true" */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(147)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[1]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[1]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[1]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[1]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[1]~FF .SR_SYNC = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[1]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[2]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][2] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(1'b0), .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[2] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1, async_reg="true" */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(147)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[2]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[2]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[2]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[2]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[2]~FF .SR_SYNC = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[2]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[2]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[3]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][3] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(1'b0), .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[3] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1, async_reg="true" */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(147)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[3]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[3]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[3]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[3]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[3]~FF .SR_SYNC = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[3]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[3]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[4]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][4] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(1'b0), .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[4] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1, async_reg="true" */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(147)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[4]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[4]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[4]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[4]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[4]~FF .SR_SYNC = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[4]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[4]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[5]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][5] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(1'b0), .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[5] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1, async_reg="true" */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(147)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[5]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[5]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[5]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[5]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[5]~FF .SR_SYNC = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[5]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[5]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[6]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][6] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(1'b0), .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[6] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1, async_reg="true" */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(147)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[6]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[6]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[6]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[6]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[6]~FF .SR_SYNC = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[6]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[6]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[7]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][7] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(1'b0), .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[7] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1, async_reg="true" */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(147)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[7]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[7]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[7]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[7]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[7]~FF .SR_SYNC = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[7]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[7]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[8]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][8] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(1'b0), .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[8] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1, async_reg="true" */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(147)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[8]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[8]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[8]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[8]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[8]~FF .SR_SYNC = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[8]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[8]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[9]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.xrd2wr_addr_sync/pipe_reg[0][9] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(1'b0), .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[9] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1, async_reg="true" */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(147)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[9]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[9]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[9]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[9]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[9]~FF .SR_SYNC = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[9]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[9]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][5]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[5] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(1'b0), .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][5] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1, async_reg="true" */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(147)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][5]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][5]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][5]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][5]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][5]~FF .SR_SYNC = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][5]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][5]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][4]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[4] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(1'b0), .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][4] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1, async_reg="true" */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(147)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][4]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][4]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][4]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][4]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][4]~FF .SR_SYNC = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][4]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][4]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][3]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[3] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(1'b0), .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][3] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1, async_reg="true" */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(147)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][3]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][3]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][3]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][3]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][3]~FF .SR_SYNC = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][3]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][3]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][2]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[2] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(1'b0), .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][2] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1, async_reg="true" */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(147)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][2]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][2]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][2]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][2]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][2]~FF .SR_SYNC = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][2]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][2]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][6]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[6] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(1'b0), .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][6] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1, async_reg="true" */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(147)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][6]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][6]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][6]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][6]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][6]~FF .SR_SYNC = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][6]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][6]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][0]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[0] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(1'b0), .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][0] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1, async_reg="true" */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(147)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][0]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][0]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][0]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][0]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][0]~FF .SR_SYNC = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][0]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][1]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[1] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(1'b0), .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][1] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1, async_reg="true" */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(147)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][1]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][1]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][1]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][1]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][1]~FF .SR_SYNC = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][1]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][7]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[7] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(1'b0), .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][7] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1, async_reg="true" */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(147)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][7]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][7]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][7]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][7]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][7]~FF .SR_SYNC = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][7]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][7]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][8]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[8] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(1'b0), .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][8] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1, async_reg="true" */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(147)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][8]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][8]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][8]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][8]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][8]~FF .SR_SYNC = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][8]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][8]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][9]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_r[9] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(1'b0), .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][9] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1, async_reg="true" */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(147)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][9]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][9]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][9]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][9]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][9]~FF .SR_SYNC = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][9]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][9]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[0]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][0] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(1'b0), .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[0] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1, async_reg="true" */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(147)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[0]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[0]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[0]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[0]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[0]~FF .SR_SYNC = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[0]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[1]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][1] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(1'b0), .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[1] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1, async_reg="true" */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(147)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[1]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[1]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[1]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[1]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[1]~FF .SR_SYNC = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[1]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[2]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][2] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(1'b0), .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[2] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1, async_reg="true" */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(147)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[2]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[2]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[2]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[2]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[2]~FF .SR_SYNC = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[2]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[2]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[3]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][3] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(1'b0), .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[3] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1, async_reg="true" */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(147)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[3]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[3]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[3]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[3]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[3]~FF .SR_SYNC = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[3]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[3]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[4]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][4] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(1'b0), .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[4] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1, async_reg="true" */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(147)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[4]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[4]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[4]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[4]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[4]~FF .SR_SYNC = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[4]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[4]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[5]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][5] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(1'b0), .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[5] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1, async_reg="true" */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(147)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[5]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[5]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[5]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[5]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[5]~FF .SR_SYNC = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[5]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[5]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[6]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][6] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(1'b0), .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[6] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1, async_reg="true" */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(147)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[6]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[6]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[6]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[6]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[6]~FF .SR_SYNC = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[6]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[6]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[7]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][7] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(1'b0), .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[7] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1, async_reg="true" */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(147)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[7]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[7]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[7]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[7]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[7]~FF .SR_SYNC = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[7]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[7]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[8]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][8] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(1'b0), .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[8] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1, async_reg="true" */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(147)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[8]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[8]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[8]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[8]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[8]~FF .SR_SYNC = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[8]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[8]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[9]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.wr2rd_addr_sync/pipe_reg[0][9] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(1'b0), .Q(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[9] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1, async_reg="true" */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(147)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[9]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[9]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[9]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[9]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[9]~FF .SR_SYNC = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[9]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[9]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \ws_wr_fifo/u_efx_fifo_top/genblk2.wr_rst[1]~FF  (.D(\ws_wr_fifo/u_efx_fifo_top/genblk2.wr_rst[0] ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(1'b0), .Q(\ws_wr_fifo/u_efx_fifo_top/genblk2.wr_rst[1] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1, async_reg="true" */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(506)
    defparam \ws_wr_fifo/u_efx_fifo_top/genblk2.wr_rst[1]~FF .CLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/genblk2.wr_rst[1]~FF .CE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/genblk2.wr_rst[1]~FF .SR_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/genblk2.wr_rst[1]~FF .D_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/genblk2.wr_rst[1]~FF .SR_SYNC = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/genblk2.wr_rst[1]~FF .SR_VALUE = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/genblk2.wr_rst[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \w_address[0]~FF  (.D(\wsctrl/n85 ), .CE(\wsctrl/n1252 ), .CLK(\clk~O ), 
           .SR(1'b0), .Q(\w_address[0] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_ctrl.v(114)
    defparam \w_address[0]~FF .CLK_POLARITY = 1'b1;
    defparam \w_address[0]~FF .CE_POLARITY = 1'b0;
    defparam \w_address[0]~FF .SR_POLARITY = 1'b1;
    defparam \w_address[0]~FF .D_POLARITY = 1'b1;
    defparam \w_address[0]~FF .SR_SYNC = 1'b1;
    defparam \w_address[0]~FF .SR_VALUE = 1'b0;
    defparam \w_address[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsctrl/post_wait_state[0]~FF  (.D(\wsctrl/n119 ), .CE(ceg_net392), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\wsctrl/post_wait_state[0] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_ctrl.v(114)
    defparam \wsctrl/post_wait_state[0]~FF .CLK_POLARITY = 1'b1;
    defparam \wsctrl/post_wait_state[0]~FF .CE_POLARITY = 1'b0;
    defparam \wsctrl/post_wait_state[0]~FF .SR_POLARITY = 1'b1;
    defparam \wsctrl/post_wait_state[0]~FF .D_POLARITY = 1'b1;
    defparam \wsctrl/post_wait_state[0]~FF .SR_SYNC = 1'b1;
    defparam \wsctrl/post_wait_state[0]~FF .SR_VALUE = 1'b0;
    defparam \wsctrl/post_wait_state[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_ADD \AUX_ADD_CI__ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/sub_37/add_2/i1  (.I0(1'b1), 
            .I1(1'b1), .CI(1'b0), .CO(n878)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1275)
    defparam \AUX_ADD_CI__ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/sub_37/add_2/i1 .I0_POLARITY = 1'b1;
    defparam \AUX_ADD_CI__ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/sub_37/add_2/i1 .I1_POLARITY = 1'b1;
    EFX_FF \wsctrl/length[0]~FF  (.D(\wsctrl/n910 ), .CE(ceg_net389), .CLK(\clk~O ), 
           .SR(1'b0), .Q(\wsctrl/length[0] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_ctrl.v(114)
    defparam \wsctrl/length[0]~FF .CLK_POLARITY = 1'b1;
    defparam \wsctrl/length[0]~FF .CE_POLARITY = 1'b0;
    defparam \wsctrl/length[0]~FF .SR_POLARITY = 1'b1;
    defparam \wsctrl/length[0]~FF .D_POLARITY = 1'b1;
    defparam \wsctrl/length[0]~FF .SR_SYNC = 1'b1;
    defparam \wsctrl/length[0]~FF .SR_VALUE = 1'b0;
    defparam \wsctrl/length[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \w_rgb_data[0]~FF  (.D(\wsctrl/n769 ), .CE(ceg_net317), .CLK(\clk~O ), 
           .SR(1'b0), .Q(\w_rgb_data[0] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_ctrl.v(114)
    defparam \w_rgb_data[0]~FF .CLK_POLARITY = 1'b1;
    defparam \w_rgb_data[0]~FF .CE_POLARITY = 1'b0;
    defparam \w_rgb_data[0]~FF .SR_POLARITY = 1'b1;
    defparam \w_rgb_data[0]~FF .D_POLARITY = 1'b1;
    defparam \w_rgb_data[0]~FF .SR_SYNC = 1'b1;
    defparam \w_rgb_data[0]~FF .SR_VALUE = 1'b0;
    defparam \w_rgb_data[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \w_fifo_rd_en~FF  (.D(\wsctrl/n123 ), .CE(ceg_net246), .CLK(\clk~O ), 
           .SR(1'b0), .Q(w_fifo_rd_en)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b0, CE_POLARITY=1'b0, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_ctrl.v(114)
    defparam \w_fifo_rd_en~FF .CLK_POLARITY = 1'b1;
    defparam \w_fifo_rd_en~FF .CE_POLARITY = 1'b0;
    defparam \w_fifo_rd_en~FF .SR_POLARITY = 1'b1;
    defparam \w_fifo_rd_en~FF .D_POLARITY = 1'b0;
    defparam \w_fifo_rd_en~FF .SR_SYNC = 1'b1;
    defparam \w_fifo_rd_en~FF .SR_VALUE = 1'b0;
    defparam \w_fifo_rd_en~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \w_address[1]~FF  (.D(\wsctrl/n84 ), .CE(\wsctrl/n1252 ), .CLK(\clk~O ), 
           .SR(1'b0), .Q(\w_address[1] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_ctrl.v(114)
    defparam \w_address[1]~FF .CLK_POLARITY = 1'b1;
    defparam \w_address[1]~FF .CE_POLARITY = 1'b0;
    defparam \w_address[1]~FF .SR_POLARITY = 1'b1;
    defparam \w_address[1]~FF .D_POLARITY = 1'b1;
    defparam \w_address[1]~FF .SR_SYNC = 1'b1;
    defparam \w_address[1]~FF .SR_VALUE = 1'b0;
    defparam \w_address[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsctrl/post_wait_state[1]~FF  (.D(\wsctrl/n118 ), .CE(ceg_net392), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\wsctrl/post_wait_state[1] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_ctrl.v(114)
    defparam \wsctrl/post_wait_state[1]~FF .CLK_POLARITY = 1'b1;
    defparam \wsctrl/post_wait_state[1]~FF .CE_POLARITY = 1'b0;
    defparam \wsctrl/post_wait_state[1]~FF .SR_POLARITY = 1'b1;
    defparam \wsctrl/post_wait_state[1]~FF .D_POLARITY = 1'b1;
    defparam \wsctrl/post_wait_state[1]~FF .SR_SYNC = 1'b1;
    defparam \wsctrl/post_wait_state[1]~FF .SR_VALUE = 1'b0;
    defparam \wsctrl/post_wait_state[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsctrl/post_wait_state[2]~FF  (.D(\wsctrl/n117 ), .CE(ceg_net392), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\wsctrl/post_wait_state[2] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_ctrl.v(114)
    defparam \wsctrl/post_wait_state[2]~FF .CLK_POLARITY = 1'b1;
    defparam \wsctrl/post_wait_state[2]~FF .CE_POLARITY = 1'b0;
    defparam \wsctrl/post_wait_state[2]~FF .SR_POLARITY = 1'b1;
    defparam \wsctrl/post_wait_state[2]~FF .D_POLARITY = 1'b1;
    defparam \wsctrl/post_wait_state[2]~FF .SR_SYNC = 1'b1;
    defparam \wsctrl/post_wait_state[2]~FF .SR_VALUE = 1'b0;
    defparam \wsctrl/post_wait_state[2]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_LUT4 LUT__1021 (.I0(\uartrx/r_Clock_Count[1] ), .I1(\uartrx/r_Clock_Count[2] ), 
            .I2(\uartrx/r_Clock_Count[3] ), .O(n686)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0101 */ ;
    defparam LUT__1021.LUTMASK = 16'h0101;
    EFX_FF \wsctrl/state[2]~FF  (.D(\wsctrl/n122 ), .CE(ceg_net85), .CLK(\clk~O ), 
           .SR(1'b0), .Q(\wsctrl/state[2] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_ctrl.v(114)
    defparam \wsctrl/state[2]~FF .CLK_POLARITY = 1'b1;
    defparam \wsctrl/state[2]~FF .CE_POLARITY = 1'b0;
    defparam \wsctrl/state[2]~FF .SR_POLARITY = 1'b1;
    defparam \wsctrl/state[2]~FF .D_POLARITY = 1'b1;
    defparam \wsctrl/state[2]~FF .SR_SYNC = 1'b1;
    defparam \wsctrl/state[2]~FF .SR_VALUE = 1'b0;
    defparam \wsctrl/state[2]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsctrl/state[3]~FF  (.D(\wsctrl/n121 ), .CE(ceg_net85), .CLK(\clk~O ), 
           .SR(1'b0), .Q(\wsctrl/state[3] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_ctrl.v(114)
    defparam \wsctrl/state[3]~FF .CLK_POLARITY = 1'b1;
    defparam \wsctrl/state[3]~FF .CE_POLARITY = 1'b0;
    defparam \wsctrl/state[3]~FF .SR_POLARITY = 1'b1;
    defparam \wsctrl/state[3]~FF .D_POLARITY = 1'b1;
    defparam \wsctrl/state[3]~FF .SR_SYNC = 1'b1;
    defparam \wsctrl/state[3]~FF .SR_VALUE = 1'b0;
    defparam \wsctrl/state[3]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsctrl/length[1]~FF  (.D(\wsctrl/n631 ), .CE(ceg_net389), .CLK(\clk~O ), 
           .SR(1'b0), .Q(\wsctrl/length[1] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_ctrl.v(114)
    defparam \wsctrl/length[1]~FF .CLK_POLARITY = 1'b1;
    defparam \wsctrl/length[1]~FF .CE_POLARITY = 1'b0;
    defparam \wsctrl/length[1]~FF .SR_POLARITY = 1'b1;
    defparam \wsctrl/length[1]~FF .D_POLARITY = 1'b1;
    defparam \wsctrl/length[1]~FF .SR_SYNC = 1'b1;
    defparam \wsctrl/length[1]~FF .SR_VALUE = 1'b0;
    defparam \wsctrl/length[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsctrl/length[2]~FF  (.D(\wsctrl/n638 ), .CE(ceg_net389), .CLK(\clk~O ), 
           .SR(1'b0), .Q(\wsctrl/length[2] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_ctrl.v(114)
    defparam \wsctrl/length[2]~FF .CLK_POLARITY = 1'b1;
    defparam \wsctrl/length[2]~FF .CE_POLARITY = 1'b0;
    defparam \wsctrl/length[2]~FF .SR_POLARITY = 1'b1;
    defparam \wsctrl/length[2]~FF .D_POLARITY = 1'b1;
    defparam \wsctrl/length[2]~FF .SR_SYNC = 1'b1;
    defparam \wsctrl/length[2]~FF .SR_VALUE = 1'b0;
    defparam \wsctrl/length[2]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsctrl/length[3]~FF  (.D(\wsctrl/n645 ), .CE(ceg_net389), .CLK(\clk~O ), 
           .SR(1'b0), .Q(\wsctrl/length[3] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_ctrl.v(114)
    defparam \wsctrl/length[3]~FF .CLK_POLARITY = 1'b1;
    defparam \wsctrl/length[3]~FF .CE_POLARITY = 1'b0;
    defparam \wsctrl/length[3]~FF .SR_POLARITY = 1'b1;
    defparam \wsctrl/length[3]~FF .D_POLARITY = 1'b1;
    defparam \wsctrl/length[3]~FF .SR_SYNC = 1'b1;
    defparam \wsctrl/length[3]~FF .SR_VALUE = 1'b0;
    defparam \wsctrl/length[3]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsctrl/length[4]~FF  (.D(\wsctrl/n652 ), .CE(ceg_net389), .CLK(\clk~O ), 
           .SR(1'b0), .Q(\wsctrl/length[4] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_ctrl.v(114)
    defparam \wsctrl/length[4]~FF .CLK_POLARITY = 1'b1;
    defparam \wsctrl/length[4]~FF .CE_POLARITY = 1'b0;
    defparam \wsctrl/length[4]~FF .SR_POLARITY = 1'b1;
    defparam \wsctrl/length[4]~FF .D_POLARITY = 1'b1;
    defparam \wsctrl/length[4]~FF .SR_SYNC = 1'b1;
    defparam \wsctrl/length[4]~FF .SR_VALUE = 1'b0;
    defparam \wsctrl/length[4]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsctrl/length[5]~FF  (.D(\wsctrl/n659 ), .CE(ceg_net389), .CLK(\clk~O ), 
           .SR(1'b0), .Q(\wsctrl/length[5] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_ctrl.v(114)
    defparam \wsctrl/length[5]~FF .CLK_POLARITY = 1'b1;
    defparam \wsctrl/length[5]~FF .CE_POLARITY = 1'b0;
    defparam \wsctrl/length[5]~FF .SR_POLARITY = 1'b1;
    defparam \wsctrl/length[5]~FF .D_POLARITY = 1'b1;
    defparam \wsctrl/length[5]~FF .SR_SYNC = 1'b1;
    defparam \wsctrl/length[5]~FF .SR_VALUE = 1'b0;
    defparam \wsctrl/length[5]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsctrl/length[6]~FF  (.D(\wsctrl/n666 ), .CE(ceg_net389), .CLK(\clk~O ), 
           .SR(1'b0), .Q(\wsctrl/length[6] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_ctrl.v(114)
    defparam \wsctrl/length[6]~FF .CLK_POLARITY = 1'b1;
    defparam \wsctrl/length[6]~FF .CE_POLARITY = 1'b0;
    defparam \wsctrl/length[6]~FF .SR_POLARITY = 1'b1;
    defparam \wsctrl/length[6]~FF .D_POLARITY = 1'b1;
    defparam \wsctrl/length[6]~FF .SR_SYNC = 1'b1;
    defparam \wsctrl/length[6]~FF .SR_VALUE = 1'b0;
    defparam \wsctrl/length[6]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsctrl/length[7]~FF  (.D(\wsctrl/n673 ), .CE(ceg_net389), .CLK(\clk~O ), 
           .SR(1'b0), .Q(\wsctrl/length[7] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_ctrl.v(114)
    defparam \wsctrl/length[7]~FF .CLK_POLARITY = 1'b1;
    defparam \wsctrl/length[7]~FF .CE_POLARITY = 1'b0;
    defparam \wsctrl/length[7]~FF .SR_POLARITY = 1'b1;
    defparam \wsctrl/length[7]~FF .D_POLARITY = 1'b1;
    defparam \wsctrl/length[7]~FF .SR_SYNC = 1'b1;
    defparam \wsctrl/length[7]~FF .SR_VALUE = 1'b0;
    defparam \wsctrl/length[7]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \w_rgb_data[1]~FF  (.D(\wsctrl/n775 ), .CE(ceg_net317), .CLK(\clk~O ), 
           .SR(1'b0), .Q(\w_rgb_data[1] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_ctrl.v(114)
    defparam \w_rgb_data[1]~FF .CLK_POLARITY = 1'b1;
    defparam \w_rgb_data[1]~FF .CE_POLARITY = 1'b0;
    defparam \w_rgb_data[1]~FF .SR_POLARITY = 1'b1;
    defparam \w_rgb_data[1]~FF .D_POLARITY = 1'b1;
    defparam \w_rgb_data[1]~FF .SR_SYNC = 1'b1;
    defparam \w_rgb_data[1]~FF .SR_VALUE = 1'b0;
    defparam \w_rgb_data[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \w_rgb_data[2]~FF  (.D(\wsctrl/n781 ), .CE(ceg_net317), .CLK(\clk~O ), 
           .SR(1'b0), .Q(\w_rgb_data[2] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_ctrl.v(114)
    defparam \w_rgb_data[2]~FF .CLK_POLARITY = 1'b1;
    defparam \w_rgb_data[2]~FF .CE_POLARITY = 1'b0;
    defparam \w_rgb_data[2]~FF .SR_POLARITY = 1'b1;
    defparam \w_rgb_data[2]~FF .D_POLARITY = 1'b1;
    defparam \w_rgb_data[2]~FF .SR_SYNC = 1'b1;
    defparam \w_rgb_data[2]~FF .SR_VALUE = 1'b0;
    defparam \w_rgb_data[2]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \w_rgb_data[3]~FF  (.D(\wsctrl/n787 ), .CE(ceg_net317), .CLK(\clk~O ), 
           .SR(1'b0), .Q(\w_rgb_data[3] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_ctrl.v(114)
    defparam \w_rgb_data[3]~FF .CLK_POLARITY = 1'b1;
    defparam \w_rgb_data[3]~FF .CE_POLARITY = 1'b0;
    defparam \w_rgb_data[3]~FF .SR_POLARITY = 1'b1;
    defparam \w_rgb_data[3]~FF .D_POLARITY = 1'b1;
    defparam \w_rgb_data[3]~FF .SR_SYNC = 1'b1;
    defparam \w_rgb_data[3]~FF .SR_VALUE = 1'b0;
    defparam \w_rgb_data[3]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \w_rgb_data[4]~FF  (.D(\wsctrl/n793 ), .CE(ceg_net317), .CLK(\clk~O ), 
           .SR(1'b0), .Q(\w_rgb_data[4] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_ctrl.v(114)
    defparam \w_rgb_data[4]~FF .CLK_POLARITY = 1'b1;
    defparam \w_rgb_data[4]~FF .CE_POLARITY = 1'b0;
    defparam \w_rgb_data[4]~FF .SR_POLARITY = 1'b1;
    defparam \w_rgb_data[4]~FF .D_POLARITY = 1'b1;
    defparam \w_rgb_data[4]~FF .SR_SYNC = 1'b1;
    defparam \w_rgb_data[4]~FF .SR_VALUE = 1'b0;
    defparam \w_rgb_data[4]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \w_rgb_data[5]~FF  (.D(\wsctrl/n799 ), .CE(ceg_net317), .CLK(\clk~O ), 
           .SR(1'b0), .Q(\w_rgb_data[5] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_ctrl.v(114)
    defparam \w_rgb_data[5]~FF .CLK_POLARITY = 1'b1;
    defparam \w_rgb_data[5]~FF .CE_POLARITY = 1'b0;
    defparam \w_rgb_data[5]~FF .SR_POLARITY = 1'b1;
    defparam \w_rgb_data[5]~FF .D_POLARITY = 1'b1;
    defparam \w_rgb_data[5]~FF .SR_SYNC = 1'b1;
    defparam \w_rgb_data[5]~FF .SR_VALUE = 1'b0;
    defparam \w_rgb_data[5]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \w_rgb_data[6]~FF  (.D(\wsctrl/n805 ), .CE(ceg_net317), .CLK(\clk~O ), 
           .SR(1'b0), .Q(\w_rgb_data[6] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_ctrl.v(114)
    defparam \w_rgb_data[6]~FF .CLK_POLARITY = 1'b1;
    defparam \w_rgb_data[6]~FF .CE_POLARITY = 1'b0;
    defparam \w_rgb_data[6]~FF .SR_POLARITY = 1'b1;
    defparam \w_rgb_data[6]~FF .D_POLARITY = 1'b1;
    defparam \w_rgb_data[6]~FF .SR_SYNC = 1'b1;
    defparam \w_rgb_data[6]~FF .SR_VALUE = 1'b0;
    defparam \w_rgb_data[6]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \w_rgb_data[7]~FF  (.D(\wsctrl/n811 ), .CE(ceg_net317), .CLK(\clk~O ), 
           .SR(1'b0), .Q(\w_rgb_data[7] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_ctrl.v(114)
    defparam \w_rgb_data[7]~FF .CLK_POLARITY = 1'b1;
    defparam \w_rgb_data[7]~FF .CE_POLARITY = 1'b0;
    defparam \w_rgb_data[7]~FF .SR_POLARITY = 1'b1;
    defparam \w_rgb_data[7]~FF .D_POLARITY = 1'b1;
    defparam \w_rgb_data[7]~FF .SR_SYNC = 1'b1;
    defparam \w_rgb_data[7]~FF .SR_VALUE = 1'b0;
    defparam \w_rgb_data[7]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \w_rgb_data[8]~FF  (.D(\wsctrl/n769 ), .CE(ceg_net341), .CLK(\clk~O ), 
           .SR(1'b0), .Q(\w_rgb_data[8] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_ctrl.v(114)
    defparam \w_rgb_data[8]~FF .CLK_POLARITY = 1'b1;
    defparam \w_rgb_data[8]~FF .CE_POLARITY = 1'b0;
    defparam \w_rgb_data[8]~FF .SR_POLARITY = 1'b1;
    defparam \w_rgb_data[8]~FF .D_POLARITY = 1'b1;
    defparam \w_rgb_data[8]~FF .SR_SYNC = 1'b1;
    defparam \w_rgb_data[8]~FF .SR_VALUE = 1'b0;
    defparam \w_rgb_data[8]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \w_rgb_data[9]~FF  (.D(\wsctrl/n775 ), .CE(ceg_net341), .CLK(\clk~O ), 
           .SR(1'b0), .Q(\w_rgb_data[9] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_ctrl.v(114)
    defparam \w_rgb_data[9]~FF .CLK_POLARITY = 1'b1;
    defparam \w_rgb_data[9]~FF .CE_POLARITY = 1'b0;
    defparam \w_rgb_data[9]~FF .SR_POLARITY = 1'b1;
    defparam \w_rgb_data[9]~FF .D_POLARITY = 1'b1;
    defparam \w_rgb_data[9]~FF .SR_SYNC = 1'b1;
    defparam \w_rgb_data[9]~FF .SR_VALUE = 1'b0;
    defparam \w_rgb_data[9]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \w_rgb_data[10]~FF  (.D(\wsctrl/n781 ), .CE(ceg_net341), .CLK(\clk~O ), 
           .SR(1'b0), .Q(\w_rgb_data[10] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_ctrl.v(114)
    defparam \w_rgb_data[10]~FF .CLK_POLARITY = 1'b1;
    defparam \w_rgb_data[10]~FF .CE_POLARITY = 1'b0;
    defparam \w_rgb_data[10]~FF .SR_POLARITY = 1'b1;
    defparam \w_rgb_data[10]~FF .D_POLARITY = 1'b1;
    defparam \w_rgb_data[10]~FF .SR_SYNC = 1'b1;
    defparam \w_rgb_data[10]~FF .SR_VALUE = 1'b0;
    defparam \w_rgb_data[10]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \w_rgb_data[11]~FF  (.D(\wsctrl/n787 ), .CE(ceg_net341), .CLK(\clk~O ), 
           .SR(1'b0), .Q(\w_rgb_data[11] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_ctrl.v(114)
    defparam \w_rgb_data[11]~FF .CLK_POLARITY = 1'b1;
    defparam \w_rgb_data[11]~FF .CE_POLARITY = 1'b0;
    defparam \w_rgb_data[11]~FF .SR_POLARITY = 1'b1;
    defparam \w_rgb_data[11]~FF .D_POLARITY = 1'b1;
    defparam \w_rgb_data[11]~FF .SR_SYNC = 1'b1;
    defparam \w_rgb_data[11]~FF .SR_VALUE = 1'b0;
    defparam \w_rgb_data[11]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \w_rgb_data[12]~FF  (.D(\wsctrl/n793 ), .CE(ceg_net341), .CLK(\clk~O ), 
           .SR(1'b0), .Q(\w_rgb_data[12] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_ctrl.v(114)
    defparam \w_rgb_data[12]~FF .CLK_POLARITY = 1'b1;
    defparam \w_rgb_data[12]~FF .CE_POLARITY = 1'b0;
    defparam \w_rgb_data[12]~FF .SR_POLARITY = 1'b1;
    defparam \w_rgb_data[12]~FF .D_POLARITY = 1'b1;
    defparam \w_rgb_data[12]~FF .SR_SYNC = 1'b1;
    defparam \w_rgb_data[12]~FF .SR_VALUE = 1'b0;
    defparam \w_rgb_data[12]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \w_rgb_data[13]~FF  (.D(\wsctrl/n799 ), .CE(ceg_net341), .CLK(\clk~O ), 
           .SR(1'b0), .Q(\w_rgb_data[13] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_ctrl.v(114)
    defparam \w_rgb_data[13]~FF .CLK_POLARITY = 1'b1;
    defparam \w_rgb_data[13]~FF .CE_POLARITY = 1'b0;
    defparam \w_rgb_data[13]~FF .SR_POLARITY = 1'b1;
    defparam \w_rgb_data[13]~FF .D_POLARITY = 1'b1;
    defparam \w_rgb_data[13]~FF .SR_SYNC = 1'b1;
    defparam \w_rgb_data[13]~FF .SR_VALUE = 1'b0;
    defparam \w_rgb_data[13]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \w_rgb_data[14]~FF  (.D(\wsctrl/n805 ), .CE(ceg_net341), .CLK(\clk~O ), 
           .SR(1'b0), .Q(\w_rgb_data[14] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_ctrl.v(114)
    defparam \w_rgb_data[14]~FF .CLK_POLARITY = 1'b1;
    defparam \w_rgb_data[14]~FF .CE_POLARITY = 1'b0;
    defparam \w_rgb_data[14]~FF .SR_POLARITY = 1'b1;
    defparam \w_rgb_data[14]~FF .D_POLARITY = 1'b1;
    defparam \w_rgb_data[14]~FF .SR_SYNC = 1'b1;
    defparam \w_rgb_data[14]~FF .SR_VALUE = 1'b0;
    defparam \w_rgb_data[14]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \w_rgb_data[15]~FF  (.D(\wsctrl/n811 ), .CE(ceg_net341), .CLK(\clk~O ), 
           .SR(1'b0), .Q(\w_rgb_data[15] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_ctrl.v(114)
    defparam \w_rgb_data[15]~FF .CLK_POLARITY = 1'b1;
    defparam \w_rgb_data[15]~FF .CE_POLARITY = 1'b0;
    defparam \w_rgb_data[15]~FF .SR_POLARITY = 1'b1;
    defparam \w_rgb_data[15]~FF .D_POLARITY = 1'b1;
    defparam \w_rgb_data[15]~FF .SR_SYNC = 1'b1;
    defparam \w_rgb_data[15]~FF .SR_VALUE = 1'b0;
    defparam \w_rgb_data[15]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \w_rgb_data[16]~FF  (.D(\wsctrl/n769 ), .CE(ceg_net350), .CLK(\clk~O ), 
           .SR(1'b0), .Q(\w_rgb_data[16] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_ctrl.v(114)
    defparam \w_rgb_data[16]~FF .CLK_POLARITY = 1'b1;
    defparam \w_rgb_data[16]~FF .CE_POLARITY = 1'b0;
    defparam \w_rgb_data[16]~FF .SR_POLARITY = 1'b1;
    defparam \w_rgb_data[16]~FF .D_POLARITY = 1'b1;
    defparam \w_rgb_data[16]~FF .SR_SYNC = 1'b1;
    defparam \w_rgb_data[16]~FF .SR_VALUE = 1'b0;
    defparam \w_rgb_data[16]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \w_rgb_data[17]~FF  (.D(\wsctrl/n775 ), .CE(ceg_net350), .CLK(\clk~O ), 
           .SR(1'b0), .Q(\w_rgb_data[17] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_ctrl.v(114)
    defparam \w_rgb_data[17]~FF .CLK_POLARITY = 1'b1;
    defparam \w_rgb_data[17]~FF .CE_POLARITY = 1'b0;
    defparam \w_rgb_data[17]~FF .SR_POLARITY = 1'b1;
    defparam \w_rgb_data[17]~FF .D_POLARITY = 1'b1;
    defparam \w_rgb_data[17]~FF .SR_SYNC = 1'b1;
    defparam \w_rgb_data[17]~FF .SR_VALUE = 1'b0;
    defparam \w_rgb_data[17]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \w_rgb_data[18]~FF  (.D(\wsctrl/n781 ), .CE(ceg_net350), .CLK(\clk~O ), 
           .SR(1'b0), .Q(\w_rgb_data[18] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_ctrl.v(114)
    defparam \w_rgb_data[18]~FF .CLK_POLARITY = 1'b1;
    defparam \w_rgb_data[18]~FF .CE_POLARITY = 1'b0;
    defparam \w_rgb_data[18]~FF .SR_POLARITY = 1'b1;
    defparam \w_rgb_data[18]~FF .D_POLARITY = 1'b1;
    defparam \w_rgb_data[18]~FF .SR_SYNC = 1'b1;
    defparam \w_rgb_data[18]~FF .SR_VALUE = 1'b0;
    defparam \w_rgb_data[18]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \w_rgb_data[19]~FF  (.D(\wsctrl/n787 ), .CE(ceg_net350), .CLK(\clk~O ), 
           .SR(1'b0), .Q(\w_rgb_data[19] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_ctrl.v(114)
    defparam \w_rgb_data[19]~FF .CLK_POLARITY = 1'b1;
    defparam \w_rgb_data[19]~FF .CE_POLARITY = 1'b0;
    defparam \w_rgb_data[19]~FF .SR_POLARITY = 1'b1;
    defparam \w_rgb_data[19]~FF .D_POLARITY = 1'b1;
    defparam \w_rgb_data[19]~FF .SR_SYNC = 1'b1;
    defparam \w_rgb_data[19]~FF .SR_VALUE = 1'b0;
    defparam \w_rgb_data[19]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \w_rgb_data[20]~FF  (.D(\wsctrl/n793 ), .CE(ceg_net350), .CLK(\clk~O ), 
           .SR(1'b0), .Q(\w_rgb_data[20] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_ctrl.v(114)
    defparam \w_rgb_data[20]~FF .CLK_POLARITY = 1'b1;
    defparam \w_rgb_data[20]~FF .CE_POLARITY = 1'b0;
    defparam \w_rgb_data[20]~FF .SR_POLARITY = 1'b1;
    defparam \w_rgb_data[20]~FF .D_POLARITY = 1'b1;
    defparam \w_rgb_data[20]~FF .SR_SYNC = 1'b1;
    defparam \w_rgb_data[20]~FF .SR_VALUE = 1'b0;
    defparam \w_rgb_data[20]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \w_rgb_data[21]~FF  (.D(\wsctrl/n799 ), .CE(ceg_net350), .CLK(\clk~O ), 
           .SR(1'b0), .Q(\w_rgb_data[21] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_ctrl.v(114)
    defparam \w_rgb_data[21]~FF .CLK_POLARITY = 1'b1;
    defparam \w_rgb_data[21]~FF .CE_POLARITY = 1'b0;
    defparam \w_rgb_data[21]~FF .SR_POLARITY = 1'b1;
    defparam \w_rgb_data[21]~FF .D_POLARITY = 1'b1;
    defparam \w_rgb_data[21]~FF .SR_SYNC = 1'b1;
    defparam \w_rgb_data[21]~FF .SR_VALUE = 1'b0;
    defparam \w_rgb_data[21]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \w_rgb_data[22]~FF  (.D(\wsctrl/n805 ), .CE(ceg_net350), .CLK(\clk~O ), 
           .SR(1'b0), .Q(\w_rgb_data[22] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_ctrl.v(114)
    defparam \w_rgb_data[22]~FF .CLK_POLARITY = 1'b1;
    defparam \w_rgb_data[22]~FF .CE_POLARITY = 1'b0;
    defparam \w_rgb_data[22]~FF .SR_POLARITY = 1'b1;
    defparam \w_rgb_data[22]~FF .D_POLARITY = 1'b1;
    defparam \w_rgb_data[22]~FF .SR_SYNC = 1'b1;
    defparam \w_rgb_data[22]~FF .SR_VALUE = 1'b0;
    defparam \w_rgb_data[22]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \w_rgb_data[23]~FF  (.D(\wsctrl/n811 ), .CE(ceg_net350), .CLK(\clk~O ), 
           .SR(1'b0), .Q(\w_rgb_data[23] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_ctrl.v(114)
    defparam \w_rgb_data[23]~FF .CLK_POLARITY = 1'b1;
    defparam \w_rgb_data[23]~FF .CE_POLARITY = 1'b0;
    defparam \w_rgb_data[23]~FF .SR_POLARITY = 1'b1;
    defparam \w_rgb_data[23]~FF .D_POLARITY = 1'b1;
    defparam \w_rgb_data[23]~FF .SR_SYNC = 1'b1;
    defparam \w_rgb_data[23]~FF .SR_VALUE = 1'b0;
    defparam \w_rgb_data[23]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsinterface/reset_count[0]~FF  (.D(\wsinterface/select_51/Select_0/n11 ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(1'b0), .Q(\wsinterface/reset_count[0] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(141)
    defparam \wsinterface/reset_count[0]~FF .CLK_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[0]~FF .CE_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[0]~FF .SR_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[0]~FF .D_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[0]~FF .SR_SYNC = 1'b1;
    defparam \wsinterface/reset_count[0]~FF .SR_VALUE = 1'b0;
    defparam \wsinterface/reset_count[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsinterface/state[0]~FF  (.D(\wsinterface/n454 ), .CE(1'b1), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\wsinterface/state[0] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(141)
    defparam \wsinterface/state[0]~FF .CLK_POLARITY = 1'b1;
    defparam \wsinterface/state[0]~FF .CE_POLARITY = 1'b1;
    defparam \wsinterface/state[0]~FF .SR_POLARITY = 1'b1;
    defparam \wsinterface/state[0]~FF .D_POLARITY = 1'b1;
    defparam \wsinterface/state[0]~FF .SR_SYNC = 1'b1;
    defparam \wsinterface/state[0]~FF .SR_VALUE = 1'b0;
    defparam \wsinterface/state[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsinterface/rgb_counter[0]~FF  (.D(\wsinterface/n485 ), .CE(1'b1), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\wsinterface/rgb_counter[0] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(141)
    defparam \wsinterface/rgb_counter[0]~FF .CLK_POLARITY = 1'b1;
    defparam \wsinterface/rgb_counter[0]~FF .CE_POLARITY = 1'b1;
    defparam \wsinterface/rgb_counter[0]~FF .SR_POLARITY = 1'b1;
    defparam \wsinterface/rgb_counter[0]~FF .D_POLARITY = 1'b1;
    defparam \wsinterface/rgb_counter[0]~FF .SR_SYNC = 1'b1;
    defparam \wsinterface/rgb_counter[0]~FF .SR_VALUE = 1'b0;
    defparam \wsinterface/rgb_counter[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsinterface/high_count[0]~FF  (.D(\wsinterface/n497 ), .CE(1'b1), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\wsinterface/high_count[0] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(141)
    defparam \wsinterface/high_count[0]~FF .CLK_POLARITY = 1'b1;
    defparam \wsinterface/high_count[0]~FF .CE_POLARITY = 1'b1;
    defparam \wsinterface/high_count[0]~FF .SR_POLARITY = 1'b1;
    defparam \wsinterface/high_count[0]~FF .D_POLARITY = 1'b1;
    defparam \wsinterface/high_count[0]~FF .SR_SYNC = 1'b1;
    defparam \wsinterface/high_count[0]~FF .SR_VALUE = 1'b0;
    defparam \wsinterface/high_count[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsinterface/low_count[0]~FF  (.D(\wsinterface/n509 ), .CE(1'b1), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\wsinterface/low_count[0] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(141)
    defparam \wsinterface/low_count[0]~FF .CLK_POLARITY = 1'b1;
    defparam \wsinterface/low_count[0]~FF .CE_POLARITY = 1'b1;
    defparam \wsinterface/low_count[0]~FF .SR_POLARITY = 1'b1;
    defparam \wsinterface/low_count[0]~FF .D_POLARITY = 1'b1;
    defparam \wsinterface/low_count[0]~FF .SR_SYNC = 1'b1;
    defparam \wsinterface/low_count[0]~FF .SR_VALUE = 1'b0;
    defparam \wsinterface/low_count[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsinterface/data_count[0]~FF  (.D(\wsinterface/n153 ), .CE(\~wsinterface/select_52/Select_0/n4 ), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\wsinterface/data_count[0] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(141)
    defparam \wsinterface/data_count[0]~FF .CLK_POLARITY = 1'b1;
    defparam \wsinterface/data_count[0]~FF .CE_POLARITY = 1'b0;
    defparam \wsinterface/data_count[0]~FF .SR_POLARITY = 1'b1;
    defparam \wsinterface/data_count[0]~FF .D_POLARITY = 1'b1;
    defparam \wsinterface/data_count[0]~FF .SR_SYNC = 1'b1;
    defparam \wsinterface/data_count[0]~FF .SR_VALUE = 1'b0;
    defparam \wsinterface/data_count[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \data~FF  (.D(\~wsinterface/equal_45/n7 ), .CE(1'b1), .CLK(\clk~O ), 
           .SR(1'b0), .Q(data)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(141)
    defparam \data~FF .CLK_POLARITY = 1'b1;
    defparam \data~FF .CE_POLARITY = 1'b1;
    defparam \data~FF .SR_POLARITY = 1'b1;
    defparam \data~FF .D_POLARITY = 1'b1;
    defparam \data~FF .SR_SYNC = 1'b1;
    defparam \data~FF .SR_VALUE = 1'b0;
    defparam \data~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsinterface/led_counter[0]~FF  (.D(\wsinterface/n416 ), .CE(1'b1), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\wsinterface/led_counter[0] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(141)
    defparam \wsinterface/led_counter[0]~FF .CLK_POLARITY = 1'b1;
    defparam \wsinterface/led_counter[0]~FF .CE_POLARITY = 1'b1;
    defparam \wsinterface/led_counter[0]~FF .SR_POLARITY = 1'b1;
    defparam \wsinterface/led_counter[0]~FF .D_POLARITY = 1'b1;
    defparam \wsinterface/led_counter[0]~FF .SR_SYNC = 1'b1;
    defparam \wsinterface/led_counter[0]~FF .SR_VALUE = 1'b0;
    defparam \wsinterface/led_counter[0]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsinterface/reset_count[1]~FF  (.D(\wsinterface/select_51/Select_1/n11 ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(1'b0), .Q(\wsinterface/reset_count[1] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(141)
    defparam \wsinterface/reset_count[1]~FF .CLK_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[1]~FF .CE_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[1]~FF .SR_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[1]~FF .D_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[1]~FF .SR_SYNC = 1'b1;
    defparam \wsinterface/reset_count[1]~FF .SR_VALUE = 1'b0;
    defparam \wsinterface/reset_count[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsinterface/reset_count[2]~FF  (.D(\wsinterface/select_51/Select_2/n11 ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(1'b0), .Q(\wsinterface/reset_count[2] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(141)
    defparam \wsinterface/reset_count[2]~FF .CLK_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[2]~FF .CE_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[2]~FF .SR_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[2]~FF .D_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[2]~FF .SR_SYNC = 1'b1;
    defparam \wsinterface/reset_count[2]~FF .SR_VALUE = 1'b0;
    defparam \wsinterface/reset_count[2]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsinterface/reset_count[3]~FF  (.D(\wsinterface/n446 ), .CE(1'b1), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\wsinterface/reset_count[3] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(141)
    defparam \wsinterface/reset_count[3]~FF .CLK_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[3]~FF .CE_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[3]~FF .SR_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[3]~FF .D_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[3]~FF .SR_SYNC = 1'b1;
    defparam \wsinterface/reset_count[3]~FF .SR_VALUE = 1'b0;
    defparam \wsinterface/reset_count[3]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsinterface/reset_count[4]~FF  (.D(\wsinterface/n445 ), .CE(1'b1), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\wsinterface/reset_count[4] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(141)
    defparam \wsinterface/reset_count[4]~FF .CLK_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[4]~FF .CE_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[4]~FF .SR_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[4]~FF .D_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[4]~FF .SR_SYNC = 1'b1;
    defparam \wsinterface/reset_count[4]~FF .SR_VALUE = 1'b0;
    defparam \wsinterface/reset_count[4]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsinterface/reset_count[5]~FF  (.D(\wsinterface/select_51/Select_5/n11 ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(1'b0), .Q(\wsinterface/reset_count[5] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(141)
    defparam \wsinterface/reset_count[5]~FF .CLK_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[5]~FF .CE_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[5]~FF .SR_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[5]~FF .D_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[5]~FF .SR_SYNC = 1'b1;
    defparam \wsinterface/reset_count[5]~FF .SR_VALUE = 1'b0;
    defparam \wsinterface/reset_count[5]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsinterface/reset_count[6]~FF  (.D(\wsinterface/select_51/Select_6/n11 ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(1'b0), .Q(\wsinterface/reset_count[6] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(141)
    defparam \wsinterface/reset_count[6]~FF .CLK_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[6]~FF .CE_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[6]~FF .SR_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[6]~FF .D_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[6]~FF .SR_SYNC = 1'b1;
    defparam \wsinterface/reset_count[6]~FF .SR_VALUE = 1'b0;
    defparam \wsinterface/reset_count[6]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsinterface/reset_count[7]~FF  (.D(\wsinterface/n442 ), .CE(1'b1), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\wsinterface/reset_count[7] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(141)
    defparam \wsinterface/reset_count[7]~FF .CLK_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[7]~FF .CE_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[7]~FF .SR_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[7]~FF .D_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[7]~FF .SR_SYNC = 1'b1;
    defparam \wsinterface/reset_count[7]~FF .SR_VALUE = 1'b0;
    defparam \wsinterface/reset_count[7]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsinterface/reset_count[8]~FF  (.D(\wsinterface/select_51/Select_8/n11 ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(1'b0), .Q(\wsinterface/reset_count[8] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(141)
    defparam \wsinterface/reset_count[8]~FF .CLK_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[8]~FF .CE_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[8]~FF .SR_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[8]~FF .D_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[8]~FF .SR_SYNC = 1'b1;
    defparam \wsinterface/reset_count[8]~FF .SR_VALUE = 1'b0;
    defparam \wsinterface/reset_count[8]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsinterface/reset_count[9]~FF  (.D(\wsinterface/n440 ), .CE(1'b1), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\wsinterface/reset_count[9] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(141)
    defparam \wsinterface/reset_count[9]~FF .CLK_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[9]~FF .CE_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[9]~FF .SR_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[9]~FF .D_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[9]~FF .SR_SYNC = 1'b1;
    defparam \wsinterface/reset_count[9]~FF .SR_VALUE = 1'b0;
    defparam \wsinterface/reset_count[9]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsinterface/reset_count[10]~FF  (.D(\wsinterface/n439 ), .CE(1'b1), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\wsinterface/reset_count[10] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(141)
    defparam \wsinterface/reset_count[10]~FF .CLK_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[10]~FF .CE_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[10]~FF .SR_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[10]~FF .D_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[10]~FF .SR_SYNC = 1'b1;
    defparam \wsinterface/reset_count[10]~FF .SR_VALUE = 1'b0;
    defparam \wsinterface/reset_count[10]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsinterface/reset_count[11]~FF  (.D(\wsinterface/n438 ), .CE(1'b1), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\wsinterface/reset_count[11] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(141)
    defparam \wsinterface/reset_count[11]~FF .CLK_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[11]~FF .CE_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[11]~FF .SR_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[11]~FF .D_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[11]~FF .SR_SYNC = 1'b1;
    defparam \wsinterface/reset_count[11]~FF .SR_VALUE = 1'b0;
    defparam \wsinterface/reset_count[11]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsinterface/reset_count[12]~FF  (.D(\wsinterface/n437 ), .CE(1'b1), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\wsinterface/reset_count[12] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(141)
    defparam \wsinterface/reset_count[12]~FF .CLK_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[12]~FF .CE_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[12]~FF .SR_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[12]~FF .D_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[12]~FF .SR_SYNC = 1'b1;
    defparam \wsinterface/reset_count[12]~FF .SR_VALUE = 1'b0;
    defparam \wsinterface/reset_count[12]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsinterface/reset_count[13]~FF  (.D(\wsinterface/n436 ), .CE(1'b1), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\wsinterface/reset_count[13] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(141)
    defparam \wsinterface/reset_count[13]~FF .CLK_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[13]~FF .CE_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[13]~FF .SR_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[13]~FF .D_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[13]~FF .SR_SYNC = 1'b1;
    defparam \wsinterface/reset_count[13]~FF .SR_VALUE = 1'b0;
    defparam \wsinterface/reset_count[13]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsinterface/reset_count[14]~FF  (.D(\wsinterface/select_51/Select_14/n11 ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(1'b0), .Q(\wsinterface/reset_count[14] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(141)
    defparam \wsinterface/reset_count[14]~FF .CLK_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[14]~FF .CE_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[14]~FF .SR_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[14]~FF .D_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[14]~FF .SR_SYNC = 1'b1;
    defparam \wsinterface/reset_count[14]~FF .SR_VALUE = 1'b0;
    defparam \wsinterface/reset_count[14]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsinterface/reset_count[15]~FF  (.D(\wsinterface/select_51/Select_15/n11 ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(1'b0), .Q(\wsinterface/reset_count[15] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(141)
    defparam \wsinterface/reset_count[15]~FF .CLK_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[15]~FF .CE_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[15]~FF .SR_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[15]~FF .D_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[15]~FF .SR_SYNC = 1'b1;
    defparam \wsinterface/reset_count[15]~FF .SR_VALUE = 1'b0;
    defparam \wsinterface/reset_count[15]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsinterface/reset_count[16]~FF  (.D(\wsinterface/n433 ), .CE(1'b1), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\wsinterface/reset_count[16] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(141)
    defparam \wsinterface/reset_count[16]~FF .CLK_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[16]~FF .CE_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[16]~FF .SR_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[16]~FF .D_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[16]~FF .SR_SYNC = 1'b1;
    defparam \wsinterface/reset_count[16]~FF .SR_VALUE = 1'b0;
    defparam \wsinterface/reset_count[16]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsinterface/reset_count[17]~FF  (.D(\wsinterface/n432 ), .CE(1'b1), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\wsinterface/reset_count[17] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(141)
    defparam \wsinterface/reset_count[17]~FF .CLK_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[17]~FF .CE_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[17]~FF .SR_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[17]~FF .D_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[17]~FF .SR_SYNC = 1'b1;
    defparam \wsinterface/reset_count[17]~FF .SR_VALUE = 1'b0;
    defparam \wsinterface/reset_count[17]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsinterface/reset_count[18]~FF  (.D(\wsinterface/select_51/Select_18/n11 ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(1'b0), .Q(\wsinterface/reset_count[18] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(141)
    defparam \wsinterface/reset_count[18]~FF .CLK_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[18]~FF .CE_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[18]~FF .SR_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[18]~FF .D_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[18]~FF .SR_SYNC = 1'b1;
    defparam \wsinterface/reset_count[18]~FF .SR_VALUE = 1'b0;
    defparam \wsinterface/reset_count[18]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsinterface/reset_count[19]~FF  (.D(\wsinterface/n430 ), .CE(1'b1), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\wsinterface/reset_count[19] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(141)
    defparam \wsinterface/reset_count[19]~FF .CLK_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[19]~FF .CE_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[19]~FF .SR_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[19]~FF .D_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[19]~FF .SR_SYNC = 1'b1;
    defparam \wsinterface/reset_count[19]~FF .SR_VALUE = 1'b0;
    defparam \wsinterface/reset_count[19]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsinterface/reset_count[20]~FF  (.D(\wsinterface/n429 ), .CE(1'b1), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\wsinterface/reset_count[20] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(141)
    defparam \wsinterface/reset_count[20]~FF .CLK_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[20]~FF .CE_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[20]~FF .SR_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[20]~FF .D_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[20]~FF .SR_SYNC = 1'b1;
    defparam \wsinterface/reset_count[20]~FF .SR_VALUE = 1'b0;
    defparam \wsinterface/reset_count[20]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsinterface/reset_count[21]~FF  (.D(\wsinterface/select_51/Select_21/n11 ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(1'b0), .Q(\wsinterface/reset_count[21] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(141)
    defparam \wsinterface/reset_count[21]~FF .CLK_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[21]~FF .CE_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[21]~FF .SR_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[21]~FF .D_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[21]~FF .SR_SYNC = 1'b1;
    defparam \wsinterface/reset_count[21]~FF .SR_VALUE = 1'b0;
    defparam \wsinterface/reset_count[21]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsinterface/reset_count[22]~FF  (.D(\wsinterface/select_51/Select_22/n11 ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(1'b0), .Q(\wsinterface/reset_count[22] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(141)
    defparam \wsinterface/reset_count[22]~FF .CLK_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[22]~FF .CE_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[22]~FF .SR_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[22]~FF .D_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[22]~FF .SR_SYNC = 1'b1;
    defparam \wsinterface/reset_count[22]~FF .SR_VALUE = 1'b0;
    defparam \wsinterface/reset_count[22]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsinterface/reset_count[23]~FF  (.D(\wsinterface/select_51/Select_23/n11 ), 
           .CE(1'b1), .CLK(\clk~O ), .SR(1'b0), .Q(\wsinterface/reset_count[23] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(141)
    defparam \wsinterface/reset_count[23]~FF .CLK_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[23]~FF .CE_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[23]~FF .SR_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[23]~FF .D_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[23]~FF .SR_SYNC = 1'b1;
    defparam \wsinterface/reset_count[23]~FF .SR_VALUE = 1'b0;
    defparam \wsinterface/reset_count[23]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsinterface/reset_count[24]~FF  (.D(\wsinterface/n425 ), .CE(1'b1), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\wsinterface/reset_count[24] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(141)
    defparam \wsinterface/reset_count[24]~FF .CLK_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[24]~FF .CE_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[24]~FF .SR_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[24]~FF .D_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[24]~FF .SR_SYNC = 1'b1;
    defparam \wsinterface/reset_count[24]~FF .SR_VALUE = 1'b0;
    defparam \wsinterface/reset_count[24]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsinterface/reset_count[25]~FF  (.D(\wsinterface/n424 ), .CE(1'b1), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\wsinterface/reset_count[25] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(141)
    defparam \wsinterface/reset_count[25]~FF .CLK_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[25]~FF .CE_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[25]~FF .SR_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[25]~FF .D_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[25]~FF .SR_SYNC = 1'b1;
    defparam \wsinterface/reset_count[25]~FF .SR_VALUE = 1'b0;
    defparam \wsinterface/reset_count[25]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsinterface/reset_count[26]~FF  (.D(\wsinterface/n423 ), .CE(1'b1), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\wsinterface/reset_count[26] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(141)
    defparam \wsinterface/reset_count[26]~FF .CLK_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[26]~FF .CE_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[26]~FF .SR_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[26]~FF .D_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[26]~FF .SR_SYNC = 1'b1;
    defparam \wsinterface/reset_count[26]~FF .SR_VALUE = 1'b0;
    defparam \wsinterface/reset_count[26]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsinterface/reset_count[27]~FF  (.D(\wsinterface/n422 ), .CE(1'b1), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\wsinterface/reset_count[27] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(141)
    defparam \wsinterface/reset_count[27]~FF .CLK_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[27]~FF .CE_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[27]~FF .SR_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[27]~FF .D_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[27]~FF .SR_SYNC = 1'b1;
    defparam \wsinterface/reset_count[27]~FF .SR_VALUE = 1'b0;
    defparam \wsinterface/reset_count[27]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsinterface/reset_count[28]~FF  (.D(\wsinterface/n421 ), .CE(1'b1), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\wsinterface/reset_count[28] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(141)
    defparam \wsinterface/reset_count[28]~FF .CLK_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[28]~FF .CE_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[28]~FF .SR_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[28]~FF .D_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[28]~FF .SR_SYNC = 1'b1;
    defparam \wsinterface/reset_count[28]~FF .SR_VALUE = 1'b0;
    defparam \wsinterface/reset_count[28]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsinterface/reset_count[29]~FF  (.D(\wsinterface/n420 ), .CE(1'b1), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\wsinterface/reset_count[29] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(141)
    defparam \wsinterface/reset_count[29]~FF .CLK_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[29]~FF .CE_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[29]~FF .SR_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[29]~FF .D_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[29]~FF .SR_SYNC = 1'b1;
    defparam \wsinterface/reset_count[29]~FF .SR_VALUE = 1'b0;
    defparam \wsinterface/reset_count[29]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsinterface/reset_count[30]~FF  (.D(\wsinterface/n419 ), .CE(1'b1), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\wsinterface/reset_count[30] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(141)
    defparam \wsinterface/reset_count[30]~FF .CLK_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[30]~FF .CE_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[30]~FF .SR_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[30]~FF .D_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[30]~FF .SR_SYNC = 1'b1;
    defparam \wsinterface/reset_count[30]~FF .SR_VALUE = 1'b0;
    defparam \wsinterface/reset_count[30]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsinterface/reset_count[31]~FF  (.D(\wsinterface/n418 ), .CE(1'b1), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\wsinterface/reset_count[31] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(141)
    defparam \wsinterface/reset_count[31]~FF .CLK_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[31]~FF .CE_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[31]~FF .SR_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[31]~FF .D_POLARITY = 1'b1;
    defparam \wsinterface/reset_count[31]~FF .SR_SYNC = 1'b1;
    defparam \wsinterface/reset_count[31]~FF .SR_VALUE = 1'b0;
    defparam \wsinterface/reset_count[31]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsinterface/state[1]~FF  (.D(\wsinterface/n453 ), .CE(1'b1), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\wsinterface/state[1] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(141)
    defparam \wsinterface/state[1]~FF .CLK_POLARITY = 1'b1;
    defparam \wsinterface/state[1]~FF .CE_POLARITY = 1'b1;
    defparam \wsinterface/state[1]~FF .SR_POLARITY = 1'b1;
    defparam \wsinterface/state[1]~FF .D_POLARITY = 1'b1;
    defparam \wsinterface/state[1]~FF .SR_SYNC = 1'b1;
    defparam \wsinterface/state[1]~FF .SR_VALUE = 1'b0;
    defparam \wsinterface/state[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsinterface/state[2]~FF  (.D(\wsinterface/n452 ), .CE(1'b1), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\wsinterface/state[2] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(141)
    defparam \wsinterface/state[2]~FF .CLK_POLARITY = 1'b1;
    defparam \wsinterface/state[2]~FF .CE_POLARITY = 1'b1;
    defparam \wsinterface/state[2]~FF .SR_POLARITY = 1'b1;
    defparam \wsinterface/state[2]~FF .D_POLARITY = 1'b1;
    defparam \wsinterface/state[2]~FF .SR_SYNC = 1'b1;
    defparam \wsinterface/state[2]~FF .SR_VALUE = 1'b0;
    defparam \wsinterface/state[2]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsinterface/rgb_counter[1]~FF  (.D(\wsinterface/n484 ), .CE(1'b1), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\wsinterface/rgb_counter[1] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(141)
    defparam \wsinterface/rgb_counter[1]~FF .CLK_POLARITY = 1'b1;
    defparam \wsinterface/rgb_counter[1]~FF .CE_POLARITY = 1'b1;
    defparam \wsinterface/rgb_counter[1]~FF .SR_POLARITY = 1'b1;
    defparam \wsinterface/rgb_counter[1]~FF .D_POLARITY = 1'b1;
    defparam \wsinterface/rgb_counter[1]~FF .SR_SYNC = 1'b1;
    defparam \wsinterface/rgb_counter[1]~FF .SR_VALUE = 1'b0;
    defparam \wsinterface/rgb_counter[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsinterface/rgb_counter[2]~FF  (.D(\wsinterface/n483 ), .CE(1'b1), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\wsinterface/rgb_counter[2] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(141)
    defparam \wsinterface/rgb_counter[2]~FF .CLK_POLARITY = 1'b1;
    defparam \wsinterface/rgb_counter[2]~FF .CE_POLARITY = 1'b1;
    defparam \wsinterface/rgb_counter[2]~FF .SR_POLARITY = 1'b1;
    defparam \wsinterface/rgb_counter[2]~FF .D_POLARITY = 1'b1;
    defparam \wsinterface/rgb_counter[2]~FF .SR_SYNC = 1'b1;
    defparam \wsinterface/rgb_counter[2]~FF .SR_VALUE = 1'b0;
    defparam \wsinterface/rgb_counter[2]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsinterface/rgb_counter[3]~FF  (.D(\wsinterface/n482 ), .CE(1'b1), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\wsinterface/rgb_counter[3] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(141)
    defparam \wsinterface/rgb_counter[3]~FF .CLK_POLARITY = 1'b1;
    defparam \wsinterface/rgb_counter[3]~FF .CE_POLARITY = 1'b1;
    defparam \wsinterface/rgb_counter[3]~FF .SR_POLARITY = 1'b1;
    defparam \wsinterface/rgb_counter[3]~FF .D_POLARITY = 1'b1;
    defparam \wsinterface/rgb_counter[3]~FF .SR_SYNC = 1'b1;
    defparam \wsinterface/rgb_counter[3]~FF .SR_VALUE = 1'b0;
    defparam \wsinterface/rgb_counter[3]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsinterface/rgb_counter[4]~FF  (.D(\wsinterface/n481 ), .CE(1'b1), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\wsinterface/rgb_counter[4] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(141)
    defparam \wsinterface/rgb_counter[4]~FF .CLK_POLARITY = 1'b1;
    defparam \wsinterface/rgb_counter[4]~FF .CE_POLARITY = 1'b1;
    defparam \wsinterface/rgb_counter[4]~FF .SR_POLARITY = 1'b1;
    defparam \wsinterface/rgb_counter[4]~FF .D_POLARITY = 1'b1;
    defparam \wsinterface/rgb_counter[4]~FF .SR_SYNC = 1'b1;
    defparam \wsinterface/rgb_counter[4]~FF .SR_VALUE = 1'b0;
    defparam \wsinterface/rgb_counter[4]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsinterface/high_count[1]~FF  (.D(\wsinterface/n496 ), .CE(1'b1), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\wsinterface/high_count[1] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(141)
    defparam \wsinterface/high_count[1]~FF .CLK_POLARITY = 1'b1;
    defparam \wsinterface/high_count[1]~FF .CE_POLARITY = 1'b1;
    defparam \wsinterface/high_count[1]~FF .SR_POLARITY = 1'b1;
    defparam \wsinterface/high_count[1]~FF .D_POLARITY = 1'b1;
    defparam \wsinterface/high_count[1]~FF .SR_SYNC = 1'b1;
    defparam \wsinterface/high_count[1]~FF .SR_VALUE = 1'b0;
    defparam \wsinterface/high_count[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsinterface/high_count[2]~FF  (.D(\wsinterface/n495 ), .CE(1'b1), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\wsinterface/high_count[2] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(141)
    defparam \wsinterface/high_count[2]~FF .CLK_POLARITY = 1'b1;
    defparam \wsinterface/high_count[2]~FF .CE_POLARITY = 1'b1;
    defparam \wsinterface/high_count[2]~FF .SR_POLARITY = 1'b1;
    defparam \wsinterface/high_count[2]~FF .D_POLARITY = 1'b1;
    defparam \wsinterface/high_count[2]~FF .SR_SYNC = 1'b1;
    defparam \wsinterface/high_count[2]~FF .SR_VALUE = 1'b0;
    defparam \wsinterface/high_count[2]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsinterface/high_count[3]~FF  (.D(\wsinterface/n494 ), .CE(1'b1), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\wsinterface/high_count[3] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(141)
    defparam \wsinterface/high_count[3]~FF .CLK_POLARITY = 1'b1;
    defparam \wsinterface/high_count[3]~FF .CE_POLARITY = 1'b1;
    defparam \wsinterface/high_count[3]~FF .SR_POLARITY = 1'b1;
    defparam \wsinterface/high_count[3]~FF .D_POLARITY = 1'b1;
    defparam \wsinterface/high_count[3]~FF .SR_SYNC = 1'b1;
    defparam \wsinterface/high_count[3]~FF .SR_VALUE = 1'b0;
    defparam \wsinterface/high_count[3]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsinterface/high_count[4]~FF  (.D(\wsinterface/n493 ), .CE(1'b1), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\wsinterface/high_count[4] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(141)
    defparam \wsinterface/high_count[4]~FF .CLK_POLARITY = 1'b1;
    defparam \wsinterface/high_count[4]~FF .CE_POLARITY = 1'b1;
    defparam \wsinterface/high_count[4]~FF .SR_POLARITY = 1'b1;
    defparam \wsinterface/high_count[4]~FF .D_POLARITY = 1'b1;
    defparam \wsinterface/high_count[4]~FF .SR_SYNC = 1'b1;
    defparam \wsinterface/high_count[4]~FF .SR_VALUE = 1'b0;
    defparam \wsinterface/high_count[4]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsinterface/high_count[5]~FF  (.D(\wsinterface/n492 ), .CE(1'b1), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\wsinterface/high_count[5] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(141)
    defparam \wsinterface/high_count[5]~FF .CLK_POLARITY = 1'b1;
    defparam \wsinterface/high_count[5]~FF .CE_POLARITY = 1'b1;
    defparam \wsinterface/high_count[5]~FF .SR_POLARITY = 1'b1;
    defparam \wsinterface/high_count[5]~FF .D_POLARITY = 1'b1;
    defparam \wsinterface/high_count[5]~FF .SR_SYNC = 1'b1;
    defparam \wsinterface/high_count[5]~FF .SR_VALUE = 1'b0;
    defparam \wsinterface/high_count[5]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsinterface/high_count[6]~FF  (.D(\wsinterface/n491 ), .CE(1'b1), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\wsinterface/high_count[6] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(141)
    defparam \wsinterface/high_count[6]~FF .CLK_POLARITY = 1'b1;
    defparam \wsinterface/high_count[6]~FF .CE_POLARITY = 1'b1;
    defparam \wsinterface/high_count[6]~FF .SR_POLARITY = 1'b1;
    defparam \wsinterface/high_count[6]~FF .D_POLARITY = 1'b1;
    defparam \wsinterface/high_count[6]~FF .SR_SYNC = 1'b1;
    defparam \wsinterface/high_count[6]~FF .SR_VALUE = 1'b0;
    defparam \wsinterface/high_count[6]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsinterface/high_count[7]~FF  (.D(\wsinterface/n490 ), .CE(1'b1), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\wsinterface/high_count[7] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(141)
    defparam \wsinterface/high_count[7]~FF .CLK_POLARITY = 1'b1;
    defparam \wsinterface/high_count[7]~FF .CE_POLARITY = 1'b1;
    defparam \wsinterface/high_count[7]~FF .SR_POLARITY = 1'b1;
    defparam \wsinterface/high_count[7]~FF .D_POLARITY = 1'b1;
    defparam \wsinterface/high_count[7]~FF .SR_SYNC = 1'b1;
    defparam \wsinterface/high_count[7]~FF .SR_VALUE = 1'b0;
    defparam \wsinterface/high_count[7]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsinterface/high_count[8]~FF  (.D(\wsinterface/n489 ), .CE(1'b1), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\wsinterface/high_count[8] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(141)
    defparam \wsinterface/high_count[8]~FF .CLK_POLARITY = 1'b1;
    defparam \wsinterface/high_count[8]~FF .CE_POLARITY = 1'b1;
    defparam \wsinterface/high_count[8]~FF .SR_POLARITY = 1'b1;
    defparam \wsinterface/high_count[8]~FF .D_POLARITY = 1'b1;
    defparam \wsinterface/high_count[8]~FF .SR_SYNC = 1'b1;
    defparam \wsinterface/high_count[8]~FF .SR_VALUE = 1'b0;
    defparam \wsinterface/high_count[8]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsinterface/high_count[9]~FF  (.D(\wsinterface/n488 ), .CE(1'b1), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\wsinterface/high_count[9] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(141)
    defparam \wsinterface/high_count[9]~FF .CLK_POLARITY = 1'b1;
    defparam \wsinterface/high_count[9]~FF .CE_POLARITY = 1'b1;
    defparam \wsinterface/high_count[9]~FF .SR_POLARITY = 1'b1;
    defparam \wsinterface/high_count[9]~FF .D_POLARITY = 1'b1;
    defparam \wsinterface/high_count[9]~FF .SR_SYNC = 1'b1;
    defparam \wsinterface/high_count[9]~FF .SR_VALUE = 1'b0;
    defparam \wsinterface/high_count[9]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsinterface/high_count[10]~FF  (.D(\wsinterface/n487 ), .CE(1'b1), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\wsinterface/high_count[10] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(141)
    defparam \wsinterface/high_count[10]~FF .CLK_POLARITY = 1'b1;
    defparam \wsinterface/high_count[10]~FF .CE_POLARITY = 1'b1;
    defparam \wsinterface/high_count[10]~FF .SR_POLARITY = 1'b1;
    defparam \wsinterface/high_count[10]~FF .D_POLARITY = 1'b1;
    defparam \wsinterface/high_count[10]~FF .SR_SYNC = 1'b1;
    defparam \wsinterface/high_count[10]~FF .SR_VALUE = 1'b0;
    defparam \wsinterface/high_count[10]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsinterface/low_count[1]~FF  (.D(\wsinterface/n508 ), .CE(1'b1), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\wsinterface/low_count[1] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(141)
    defparam \wsinterface/low_count[1]~FF .CLK_POLARITY = 1'b1;
    defparam \wsinterface/low_count[1]~FF .CE_POLARITY = 1'b1;
    defparam \wsinterface/low_count[1]~FF .SR_POLARITY = 1'b1;
    defparam \wsinterface/low_count[1]~FF .D_POLARITY = 1'b1;
    defparam \wsinterface/low_count[1]~FF .SR_SYNC = 1'b1;
    defparam \wsinterface/low_count[1]~FF .SR_VALUE = 1'b0;
    defparam \wsinterface/low_count[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsinterface/low_count[2]~FF  (.D(\wsinterface/n507 ), .CE(1'b1), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\wsinterface/low_count[2] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(141)
    defparam \wsinterface/low_count[2]~FF .CLK_POLARITY = 1'b1;
    defparam \wsinterface/low_count[2]~FF .CE_POLARITY = 1'b1;
    defparam \wsinterface/low_count[2]~FF .SR_POLARITY = 1'b1;
    defparam \wsinterface/low_count[2]~FF .D_POLARITY = 1'b1;
    defparam \wsinterface/low_count[2]~FF .SR_SYNC = 1'b1;
    defparam \wsinterface/low_count[2]~FF .SR_VALUE = 1'b0;
    defparam \wsinterface/low_count[2]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsinterface/low_count[3]~FF  (.D(\wsinterface/n506 ), .CE(1'b1), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\wsinterface/low_count[3] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(141)
    defparam \wsinterface/low_count[3]~FF .CLK_POLARITY = 1'b1;
    defparam \wsinterface/low_count[3]~FF .CE_POLARITY = 1'b1;
    defparam \wsinterface/low_count[3]~FF .SR_POLARITY = 1'b1;
    defparam \wsinterface/low_count[3]~FF .D_POLARITY = 1'b1;
    defparam \wsinterface/low_count[3]~FF .SR_SYNC = 1'b1;
    defparam \wsinterface/low_count[3]~FF .SR_VALUE = 1'b0;
    defparam \wsinterface/low_count[3]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsinterface/low_count[4]~FF  (.D(\wsinterface/n505 ), .CE(1'b1), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\wsinterface/low_count[4] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(141)
    defparam \wsinterface/low_count[4]~FF .CLK_POLARITY = 1'b1;
    defparam \wsinterface/low_count[4]~FF .CE_POLARITY = 1'b1;
    defparam \wsinterface/low_count[4]~FF .SR_POLARITY = 1'b1;
    defparam \wsinterface/low_count[4]~FF .D_POLARITY = 1'b1;
    defparam \wsinterface/low_count[4]~FF .SR_SYNC = 1'b1;
    defparam \wsinterface/low_count[4]~FF .SR_VALUE = 1'b0;
    defparam \wsinterface/low_count[4]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsinterface/low_count[5]~FF  (.D(\wsinterface/n504 ), .CE(1'b1), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\wsinterface/low_count[5] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(141)
    defparam \wsinterface/low_count[5]~FF .CLK_POLARITY = 1'b1;
    defparam \wsinterface/low_count[5]~FF .CE_POLARITY = 1'b1;
    defparam \wsinterface/low_count[5]~FF .SR_POLARITY = 1'b1;
    defparam \wsinterface/low_count[5]~FF .D_POLARITY = 1'b1;
    defparam \wsinterface/low_count[5]~FF .SR_SYNC = 1'b1;
    defparam \wsinterface/low_count[5]~FF .SR_VALUE = 1'b0;
    defparam \wsinterface/low_count[5]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsinterface/low_count[6]~FF  (.D(\wsinterface/n503 ), .CE(1'b1), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\wsinterface/low_count[6] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(141)
    defparam \wsinterface/low_count[6]~FF .CLK_POLARITY = 1'b1;
    defparam \wsinterface/low_count[6]~FF .CE_POLARITY = 1'b1;
    defparam \wsinterface/low_count[6]~FF .SR_POLARITY = 1'b1;
    defparam \wsinterface/low_count[6]~FF .D_POLARITY = 1'b1;
    defparam \wsinterface/low_count[6]~FF .SR_SYNC = 1'b1;
    defparam \wsinterface/low_count[6]~FF .SR_VALUE = 1'b0;
    defparam \wsinterface/low_count[6]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsinterface/low_count[7]~FF  (.D(\wsinterface/n502 ), .CE(1'b1), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\wsinterface/low_count[7] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(141)
    defparam \wsinterface/low_count[7]~FF .CLK_POLARITY = 1'b1;
    defparam \wsinterface/low_count[7]~FF .CE_POLARITY = 1'b1;
    defparam \wsinterface/low_count[7]~FF .SR_POLARITY = 1'b1;
    defparam \wsinterface/low_count[7]~FF .D_POLARITY = 1'b1;
    defparam \wsinterface/low_count[7]~FF .SR_SYNC = 1'b1;
    defparam \wsinterface/low_count[7]~FF .SR_VALUE = 1'b0;
    defparam \wsinterface/low_count[7]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsinterface/low_count[8]~FF  (.D(\wsinterface/n501 ), .CE(1'b1), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\wsinterface/low_count[8] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(141)
    defparam \wsinterface/low_count[8]~FF .CLK_POLARITY = 1'b1;
    defparam \wsinterface/low_count[8]~FF .CE_POLARITY = 1'b1;
    defparam \wsinterface/low_count[8]~FF .SR_POLARITY = 1'b1;
    defparam \wsinterface/low_count[8]~FF .D_POLARITY = 1'b1;
    defparam \wsinterface/low_count[8]~FF .SR_SYNC = 1'b1;
    defparam \wsinterface/low_count[8]~FF .SR_VALUE = 1'b0;
    defparam \wsinterface/low_count[8]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsinterface/low_count[9]~FF  (.D(\wsinterface/n500 ), .CE(1'b1), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\wsinterface/low_count[9] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(141)
    defparam \wsinterface/low_count[9]~FF .CLK_POLARITY = 1'b1;
    defparam \wsinterface/low_count[9]~FF .CE_POLARITY = 1'b1;
    defparam \wsinterface/low_count[9]~FF .SR_POLARITY = 1'b1;
    defparam \wsinterface/low_count[9]~FF .D_POLARITY = 1'b1;
    defparam \wsinterface/low_count[9]~FF .SR_SYNC = 1'b1;
    defparam \wsinterface/low_count[9]~FF .SR_VALUE = 1'b0;
    defparam \wsinterface/low_count[9]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsinterface/low_count[10]~FF  (.D(\wsinterface/n499 ), .CE(1'b1), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\wsinterface/low_count[10] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(141)
    defparam \wsinterface/low_count[10]~FF .CLK_POLARITY = 1'b1;
    defparam \wsinterface/low_count[10]~FF .CE_POLARITY = 1'b1;
    defparam \wsinterface/low_count[10]~FF .SR_POLARITY = 1'b1;
    defparam \wsinterface/low_count[10]~FF .D_POLARITY = 1'b1;
    defparam \wsinterface/low_count[10]~FF .SR_SYNC = 1'b1;
    defparam \wsinterface/low_count[10]~FF .SR_VALUE = 1'b0;
    defparam \wsinterface/low_count[10]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsinterface/data_count[1]~FF  (.D(\wsinterface/n152 ), .CE(\~wsinterface/select_52/Select_0/n4 ), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\wsinterface/data_count[1] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(141)
    defparam \wsinterface/data_count[1]~FF .CLK_POLARITY = 1'b1;
    defparam \wsinterface/data_count[1]~FF .CE_POLARITY = 1'b0;
    defparam \wsinterface/data_count[1]~FF .SR_POLARITY = 1'b1;
    defparam \wsinterface/data_count[1]~FF .D_POLARITY = 1'b1;
    defparam \wsinterface/data_count[1]~FF .SR_SYNC = 1'b1;
    defparam \wsinterface/data_count[1]~FF .SR_VALUE = 1'b0;
    defparam \wsinterface/data_count[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsinterface/led_counter[1]~FF  (.D(\wsinterface/n415 ), .CE(1'b1), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\wsinterface/led_counter[1] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(141)
    defparam \wsinterface/led_counter[1]~FF .CLK_POLARITY = 1'b1;
    defparam \wsinterface/led_counter[1]~FF .CE_POLARITY = 1'b1;
    defparam \wsinterface/led_counter[1]~FF .SR_POLARITY = 1'b1;
    defparam \wsinterface/led_counter[1]~FF .D_POLARITY = 1'b1;
    defparam \wsinterface/led_counter[1]~FF .SR_SYNC = 1'b1;
    defparam \wsinterface/led_counter[1]~FF .SR_VALUE = 1'b0;
    defparam \wsinterface/led_counter[1]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsinterface/led_counter[2]~FF  (.D(\wsinterface/n414 ), .CE(1'b1), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\wsinterface/led_counter[2] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(141)
    defparam \wsinterface/led_counter[2]~FF .CLK_POLARITY = 1'b1;
    defparam \wsinterface/led_counter[2]~FF .CE_POLARITY = 1'b1;
    defparam \wsinterface/led_counter[2]~FF .SR_POLARITY = 1'b1;
    defparam \wsinterface/led_counter[2]~FF .D_POLARITY = 1'b1;
    defparam \wsinterface/led_counter[2]~FF .SR_SYNC = 1'b1;
    defparam \wsinterface/led_counter[2]~FF .SR_VALUE = 1'b0;
    defparam \wsinterface/led_counter[2]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsinterface/led_counter[3]~FF  (.D(\wsinterface/n413 ), .CE(1'b1), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\wsinterface/led_counter[3] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(141)
    defparam \wsinterface/led_counter[3]~FF .CLK_POLARITY = 1'b1;
    defparam \wsinterface/led_counter[3]~FF .CE_POLARITY = 1'b1;
    defparam \wsinterface/led_counter[3]~FF .SR_POLARITY = 1'b1;
    defparam \wsinterface/led_counter[3]~FF .D_POLARITY = 1'b1;
    defparam \wsinterface/led_counter[3]~FF .SR_SYNC = 1'b1;
    defparam \wsinterface/led_counter[3]~FF .SR_VALUE = 1'b0;
    defparam \wsinterface/led_counter[3]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsinterface/led_counter[4]~FF  (.D(\wsinterface/n412 ), .CE(1'b1), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\wsinterface/led_counter[4] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(141)
    defparam \wsinterface/led_counter[4]~FF .CLK_POLARITY = 1'b1;
    defparam \wsinterface/led_counter[4]~FF .CE_POLARITY = 1'b1;
    defparam \wsinterface/led_counter[4]~FF .SR_POLARITY = 1'b1;
    defparam \wsinterface/led_counter[4]~FF .D_POLARITY = 1'b1;
    defparam \wsinterface/led_counter[4]~FF .SR_SYNC = 1'b1;
    defparam \wsinterface/led_counter[4]~FF .SR_VALUE = 1'b0;
    defparam \wsinterface/led_counter[4]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsinterface/led_counter[5]~FF  (.D(\wsinterface/n411 ), .CE(1'b1), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\wsinterface/led_counter[5] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(141)
    defparam \wsinterface/led_counter[5]~FF .CLK_POLARITY = 1'b1;
    defparam \wsinterface/led_counter[5]~FF .CE_POLARITY = 1'b1;
    defparam \wsinterface/led_counter[5]~FF .SR_POLARITY = 1'b1;
    defparam \wsinterface/led_counter[5]~FF .D_POLARITY = 1'b1;
    defparam \wsinterface/led_counter[5]~FF .SR_SYNC = 1'b1;
    defparam \wsinterface/led_counter[5]~FF .SR_VALUE = 1'b0;
    defparam \wsinterface/led_counter[5]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsinterface/led_counter[6]~FF  (.D(\wsinterface/n410 ), .CE(1'b1), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\wsinterface/led_counter[6] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b1, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(141)
    defparam \wsinterface/led_counter[6]~FF .CLK_POLARITY = 1'b1;
    defparam \wsinterface/led_counter[6]~FF .CE_POLARITY = 1'b1;
    defparam \wsinterface/led_counter[6]~FF .SR_POLARITY = 1'b1;
    defparam \wsinterface/led_counter[6]~FF .D_POLARITY = 1'b1;
    defparam \wsinterface/led_counter[6]~FF .SR_SYNC = 1'b1;
    defparam \wsinterface/led_counter[6]~FF .SR_VALUE = 1'b0;
    defparam \wsinterface/led_counter[6]~FF .SR_SYNC_PRIORITY = 1'b1;
    EFX_ADD \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/add_75/i3  (.I0(\ws_wr_fifo/u_efx_fifo_top/waddr[3] ), 
            .I1(1'b0), .CI(n36), .O(n15), .CO(n16)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1286)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/add_75/i3 .I0_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/add_75/i3 .I1_POLARITY = 1'b1;
    EFX_ADD \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/add_75/i2  (.I0(\ws_wr_fifo/u_efx_fifo_top/waddr[2] ), 
            .I1(1'b0), .CI(n38), .O(n35), .CO(n36)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1286)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/add_75/i2 .I0_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/add_75/i2 .I1_POLARITY = 1'b1;
    EFX_ADD \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/add_75/i1  (.I0(\ws_wr_fifo/u_efx_fifo_top/waddr[1] ), 
            .I1(\ws_wr_fifo/u_efx_fifo_top/waddr[0] ), .CI(1'b0), .O(n37), 
            .CO(n38)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1286)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/add_75/i1 .I0_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/add_75/i1 .I1_POLARITY = 1'b1;
    EFX_ADD \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/add_78/i1  (.I0(\ws_wr_fifo/u_efx_fifo_top/raddr[1] ), 
            .I1(\ws_wr_fifo/u_efx_fifo_top/raddr[0] ), .CI(1'b0), .O(n46), 
            .CO(n47)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1296)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/add_78/i1 .I0_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/add_78/i1 .I1_POLARITY = 1'b1;
    EFX_ADD \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/sub_37/add_2/i1  (.I0(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[0] ), 
            .I1(\ws_wr_fifo/u_efx_fifo_top/raddr[0] ), .CI(n878), .O(n49), 
            .CO(n50)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b0 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1275)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/sub_37/add_2/i1 .I0_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/sub_37/add_2/i1 .I1_POLARITY = 1'b0;
    EFX_ADD \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/sub_37/add_2/i10  (.I0(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[9] ), 
            .I1(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/raddr_cntr[9] ), 
            .CI(n296), .O(n293), .CO(n879)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b0 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1275)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/sub_37/add_2/i10 .I0_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/sub_37/add_2/i10 .I1_POLARITY = 1'b0;
    EFX_ADD \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/sub_37/add_2/i9  (.I0(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[8] ), 
            .I1(\ws_wr_fifo/u_efx_fifo_top/raddr[8] ), .CI(n298), .O(n295), 
            .CO(n296)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b0 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1275)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/sub_37/add_2/i9 .I0_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/sub_37/add_2/i9 .I1_POLARITY = 1'b0;
    EFX_ADD \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/sub_37/add_2/i8  (.I0(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[7] ), 
            .I1(\ws_wr_fifo/u_efx_fifo_top/raddr[7] ), .CI(n300), .O(n297), 
            .CO(n298)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b0 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1275)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/sub_37/add_2/i8 .I0_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/sub_37/add_2/i8 .I1_POLARITY = 1'b0;
    EFX_ADD \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/sub_37/add_2/i7  (.I0(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[6] ), 
            .I1(\ws_wr_fifo/u_efx_fifo_top/raddr[6] ), .CI(n302), .O(n299), 
            .CO(n300)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b0 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1275)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/sub_37/add_2/i7 .I0_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/sub_37/add_2/i7 .I1_POLARITY = 1'b0;
    EFX_ADD \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/sub_37/add_2/i6  (.I0(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[5] ), 
            .I1(\ws_wr_fifo/u_efx_fifo_top/raddr[5] ), .CI(n304), .O(n301), 
            .CO(n302)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b0 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1275)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/sub_37/add_2/i6 .I0_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/sub_37/add_2/i6 .I1_POLARITY = 1'b0;
    EFX_ADD \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/sub_37/add_2/i5  (.I0(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[4] ), 
            .I1(\ws_wr_fifo/u_efx_fifo_top/raddr[4] ), .CI(n306), .O(n303), 
            .CO(n304)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b0 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1275)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/sub_37/add_2/i5 .I0_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/sub_37/add_2/i5 .I1_POLARITY = 1'b0;
    EFX_ADD \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/sub_37/add_2/i4  (.I0(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[3] ), 
            .I1(\ws_wr_fifo/u_efx_fifo_top/raddr[3] ), .CI(n308), .O(n305), 
            .CO(n306)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b0 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1275)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/sub_37/add_2/i4 .I0_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/sub_37/add_2/i4 .I1_POLARITY = 1'b0;
    EFX_ADD \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/sub_37/add_2/i3  (.I0(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[2] ), 
            .I1(\ws_wr_fifo/u_efx_fifo_top/raddr[2] ), .CI(n310), .O(n307), 
            .CO(n308)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b0 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1275)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/sub_37/add_2/i3 .I0_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/sub_37/add_2/i3 .I1_POLARITY = 1'b0;
    EFX_ADD \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/sub_37/add_2/i2  (.I0(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.waddr_cntr_sync_g2b_r[1] ), 
            .I1(\ws_wr_fifo/u_efx_fifo_top/raddr[1] ), .CI(n50), .O(n309), 
            .CO(n310)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b0 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1275)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/sub_37/add_2/i2 .I0_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/sub_37/add_2/i2 .I1_POLARITY = 1'b0;
    EFX_ADD \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/add_78/i9  (.I0(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/raddr_cntr[9] ), 
            .I1(1'b0), .CI(n313), .O(n311)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1296)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/add_78/i9 .I0_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/add_78/i9 .I1_POLARITY = 1'b1;
    EFX_ADD \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/add_78/i8  (.I0(\ws_wr_fifo/u_efx_fifo_top/raddr[8] ), 
            .I1(1'b0), .CI(n315), .O(n312), .CO(n313)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1296)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/add_78/i8 .I0_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/add_78/i8 .I1_POLARITY = 1'b1;
    EFX_ADD \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/add_78/i7  (.I0(\ws_wr_fifo/u_efx_fifo_top/raddr[7] ), 
            .I1(1'b0), .CI(n317), .O(n314), .CO(n315)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1296)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/add_78/i7 .I0_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/add_78/i7 .I1_POLARITY = 1'b1;
    EFX_ADD \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/add_78/i6  (.I0(\ws_wr_fifo/u_efx_fifo_top/raddr[6] ), 
            .I1(1'b0), .CI(n319), .O(n316), .CO(n317)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1296)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/add_78/i6 .I0_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/add_78/i6 .I1_POLARITY = 1'b1;
    EFX_ADD \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/add_78/i5  (.I0(\ws_wr_fifo/u_efx_fifo_top/raddr[5] ), 
            .I1(1'b0), .CI(n321), .O(n318), .CO(n319)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1296)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/add_78/i5 .I0_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/add_78/i5 .I1_POLARITY = 1'b1;
    EFX_ADD \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/add_78/i4  (.I0(\ws_wr_fifo/u_efx_fifo_top/raddr[4] ), 
            .I1(1'b0), .CI(n323), .O(n320), .CO(n321)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1296)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/add_78/i4 .I0_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/add_78/i4 .I1_POLARITY = 1'b1;
    EFX_ADD \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/add_78/i3  (.I0(\ws_wr_fifo/u_efx_fifo_top/raddr[3] ), 
            .I1(1'b0), .CI(n325), .O(n322), .CO(n323)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1296)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/add_78/i3 .I0_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/add_78/i3 .I1_POLARITY = 1'b1;
    EFX_ADD \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/add_78/i2  (.I0(\ws_wr_fifo/u_efx_fifo_top/raddr[2] ), 
            .I1(1'b0), .CI(n47), .O(n324), .CO(n325)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1296)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/add_78/i2 .I0_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/add_78/i2 .I1_POLARITY = 1'b1;
    EFX_ADD \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/add_75/i9  (.I0(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/waddr_cntr[9] ), 
            .I1(1'b0), .CI(n328), .O(n326)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1286)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/add_75/i9 .I0_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/add_75/i9 .I1_POLARITY = 1'b1;
    EFX_ADD \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/add_75/i8  (.I0(\ws_wr_fifo/u_efx_fifo_top/waddr[8] ), 
            .I1(1'b0), .CI(n330), .O(n327), .CO(n328)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1286)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/add_75/i8 .I0_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/add_75/i8 .I1_POLARITY = 1'b1;
    EFX_ADD \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/add_75/i7  (.I0(\ws_wr_fifo/u_efx_fifo_top/waddr[7] ), 
            .I1(1'b0), .CI(n332), .O(n329), .CO(n330)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1286)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/add_75/i7 .I0_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/add_75/i7 .I1_POLARITY = 1'b1;
    EFX_ADD \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/add_75/i6  (.I0(\ws_wr_fifo/u_efx_fifo_top/waddr[6] ), 
            .I1(1'b0), .CI(n334), .O(n331), .CO(n332)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1286)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/add_75/i6 .I0_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/add_75/i6 .I1_POLARITY = 1'b1;
    EFX_ADD \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/add_75/i5  (.I0(\ws_wr_fifo/u_efx_fifo_top/waddr[5] ), 
            .I1(1'b0), .CI(n336), .O(n333), .CO(n334)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1286)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/add_75/i5 .I0_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/add_75/i5 .I1_POLARITY = 1'b1;
    EFX_ADD \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/add_75/i4  (.I0(\ws_wr_fifo/u_efx_fifo_top/waddr[4] ), 
            .I1(1'b0), .CI(n16), .O(n335), .CO(n336)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1286)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/add_75/i4 .I0_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/add_75/i4 .I1_POLARITY = 1'b1;
    EFX_RAM_5K \wsinterface/led_reg__D$h0w1  (.WCLK(\clk~O ), .RCLK(\clk~O ), 
            .WCLKE(1'b1), .WE(\wsctrl/state[3] ), .RE(\~wsinterface/equal_43/n7 ), 
            .WDATA({\w_rgb_data[23] }), .WADDR({10'b0000000000, \w_address[1] , 
            \w_address[0] }), .RADDR({10'b0000000000, \wsinterface/data_count[1] , 
            \wsinterface/data_count[0] }), .RDATA({\wsinterface/n2448 })) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_RAM_5K, READ_WIDTH=1, WRITE_WIDTH=1, WCLK_POLARITY=1'b1, WCLKE_POLARITY=1'b1, WE_POLARITY=1'b1, RCLK_POLARITY=1'b1, RE_POLARITY=1'b1, OUTPUT_REG=1'b0, WRITE_MODE="READ_FIRST", INIT_0=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_1=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_2=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_3=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_4=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_5=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_6=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_7=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_8=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_9=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_A=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_B=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_C=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_D=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_E=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_F=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_10=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_11=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_12=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_13=256'h0000000000000000000000000000000000000000000000000000000000000000, PRESERVE_USER_INIT=1'b0 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(28)
    defparam \wsinterface/led_reg__D$h0w1 .READ_WIDTH = 1;
    defparam \wsinterface/led_reg__D$h0w1 .WRITE_WIDTH = 1;
    defparam \wsinterface/led_reg__D$h0w1 .WCLK_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0w1 .WCLKE_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0w1 .WE_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0w1 .RCLK_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0w1 .RE_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0w1 .INIT_0 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0w1 .INIT_1 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0w1 .INIT_2 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0w1 .INIT_3 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0w1 .INIT_4 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0w1 .INIT_5 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0w1 .INIT_6 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0w1 .INIT_7 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0w1 .INIT_8 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0w1 .INIT_9 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0w1 .INIT_A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0w1 .INIT_B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0w1 .INIT_C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0w1 .INIT_D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0w1 .INIT_E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0w1 .INIT_F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0w1 .INIT_10 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0w1 .INIT_11 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0w1 .INIT_12 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0w1 .INIT_13 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0w1 .OUTPUT_REG = 1'b0;
    defparam \wsinterface/led_reg__D$h0w1 .WRITE_MODE = "READ_FIRST";
    EFX_RAM_5K \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ram/ram  (.WCLK(\clk~O ), 
            .RCLK(\clk~O ), .WCLKE(1'b1), .WE(\ws_wr_fifo/u_efx_fifo_top/wr_en_int ), 
            .RE(\ws_wr_fifo/u_efx_fifo_top/rd_en_int ), .WDATA({\w_rx_byte[7] , 
            \w_rx_byte[6] , \w_rx_byte[5] , \w_rx_byte[4] , \w_rx_byte[3] , 
            \w_rx_byte[2] , \w_rx_byte[1] , \w_rx_byte[0] }), .WADDR({\ws_wr_fifo/u_efx_fifo_top/waddr[8] , 
            \ws_wr_fifo/u_efx_fifo_top/waddr[7] , \ws_wr_fifo/u_efx_fifo_top/waddr[6] , 
            \ws_wr_fifo/u_efx_fifo_top/waddr[5] , \ws_wr_fifo/u_efx_fifo_top/waddr[4] , 
            \ws_wr_fifo/u_efx_fifo_top/waddr[3] , \ws_wr_fifo/u_efx_fifo_top/waddr[2] , 
            \ws_wr_fifo/u_efx_fifo_top/waddr[1] , \ws_wr_fifo/u_efx_fifo_top/waddr[0] }), 
            .RADDR({\ws_wr_fifo/u_efx_fifo_top/raddr[8] , \ws_wr_fifo/u_efx_fifo_top/raddr[7] , 
            \ws_wr_fifo/u_efx_fifo_top/raddr[6] , \ws_wr_fifo/u_efx_fifo_top/raddr[5] , 
            \ws_wr_fifo/u_efx_fifo_top/raddr[4] , \ws_wr_fifo/u_efx_fifo_top/raddr[3] , 
            \ws_wr_fifo/u_efx_fifo_top/raddr[2] , \ws_wr_fifo/u_efx_fifo_top/raddr[1] , 
            \ws_wr_fifo/u_efx_fifo_top/raddr[0] }), .RDATA({\w_fifo_rd_data[7] , 
            \w_fifo_rd_data[6] , \w_fifo_rd_data[5] , \w_fifo_rd_data[4] , 
            \w_fifo_rd_data[3] , \w_fifo_rd_data[2] , \w_fifo_rd_data[1] , 
            \w_fifo_rd_data[0] })) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_RAM_5K, READ_WIDTH=8, WRITE_WIDTH=8, WCLK_POLARITY=1'b1, WCLKE_POLARITY=1'b1, WE_POLARITY=1'b1, RCLK_POLARITY=1'b1, RE_POLARITY=1'b1, OUTPUT_REG=1'b0, WRITE_MODE="READ_FIRST", INIT_0=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_1=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_2=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_3=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_4=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_5=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_6=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_7=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_8=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_9=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_A=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_B=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_C=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_D=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_E=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_F=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_10=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_11=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_12=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_13=256'h0000000000000000000000000000000000000000000000000000000000000000, PRESERVE_USER_INIT=1'b0 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(719)
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ram/ram .READ_WIDTH = 8;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ram/ram .WRITE_WIDTH = 8;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ram/ram .WCLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ram/ram .WCLKE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ram/ram .WE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ram/ram .RCLK_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ram/ram .RE_POLARITY = 1'b1;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ram/ram .INIT_0 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ram/ram .INIT_1 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ram/ram .INIT_2 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ram/ram .INIT_3 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ram/ram .INIT_4 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ram/ram .INIT_5 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ram/ram .INIT_6 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ram/ram .INIT_7 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ram/ram .INIT_8 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ram/ram .INIT_9 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ram/ram .INIT_A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ram/ram .INIT_B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ram/ram .INIT_C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ram/ram .INIT_D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ram/ram .INIT_E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ram/ram .INIT_F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ram/ram .INIT_10 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ram/ram .INIT_11 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ram/ram .INIT_12 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ram/ram .INIT_13 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ram/ram .OUTPUT_REG = 1'b0;
    defparam \ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ram/ram .WRITE_MODE = "READ_FIRST";
    EFX_RAM_5K \wsinterface/led_reg__D$h0u12  (.WCLK(\clk~O ), .RCLK(\clk~O ), 
            .WCLKE(1'b1), .WE(\wsctrl/state[3] ), .RE(\~wsinterface/equal_43/n7 ), 
            .WDATA({\w_rgb_data[21] }), .WADDR({10'b0000000000, \w_address[1] , 
            \w_address[0] }), .RADDR({10'b0000000000, \wsinterface/data_count[1] , 
            \wsinterface/data_count[0] }), .RDATA({\wsinterface/n2454 })) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_RAM_5K, READ_WIDTH=1, WRITE_WIDTH=1, WCLK_POLARITY=1'b1, WCLKE_POLARITY=1'b1, WE_POLARITY=1'b1, RCLK_POLARITY=1'b1, RE_POLARITY=1'b1, OUTPUT_REG=1'b0, WRITE_MODE="READ_FIRST", INIT_0=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_1=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_2=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_3=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_4=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_5=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_6=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_7=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_8=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_9=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_A=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_B=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_C=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_D=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_E=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_F=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_10=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_11=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_12=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_13=256'h0000000000000000000000000000000000000000000000000000000000000000, PRESERVE_USER_INIT=1'b0 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(28)
    defparam \wsinterface/led_reg__D$h0u12 .READ_WIDTH = 1;
    defparam \wsinterface/led_reg__D$h0u12 .WRITE_WIDTH = 1;
    defparam \wsinterface/led_reg__D$h0u12 .WCLK_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0u12 .WCLKE_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0u12 .WE_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0u12 .RCLK_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0u12 .RE_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0u12 .INIT_0 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0u12 .INIT_1 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0u12 .INIT_2 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0u12 .INIT_3 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0u12 .INIT_4 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0u12 .INIT_5 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0u12 .INIT_6 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0u12 .INIT_7 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0u12 .INIT_8 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0u12 .INIT_9 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0u12 .INIT_A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0u12 .INIT_B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0u12 .INIT_C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0u12 .INIT_D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0u12 .INIT_E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0u12 .INIT_F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0u12 .INIT_10 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0u12 .INIT_11 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0u12 .INIT_12 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0u12 .INIT_13 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0u12 .OUTPUT_REG = 1'b0;
    defparam \wsinterface/led_reg__D$h0u12 .WRITE_MODE = "READ_FIRST";
    EFX_RAM_5K \wsinterface/led_reg__D$h0t12  (.WCLK(\clk~O ), .RCLK(\clk~O ), 
            .WCLKE(1'b1), .WE(\wsctrl/state[3] ), .RE(\~wsinterface/equal_43/n7 ), 
            .WDATA({\w_rgb_data[20] }), .WADDR({10'b0000000000, \w_address[1] , 
            \w_address[0] }), .RADDR({10'b0000000000, \wsinterface/data_count[1] , 
            \wsinterface/data_count[0] }), .RDATA({\wsinterface/n2457 })) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_RAM_5K, READ_WIDTH=1, WRITE_WIDTH=1, WCLK_POLARITY=1'b1, WCLKE_POLARITY=1'b1, WE_POLARITY=1'b1, RCLK_POLARITY=1'b1, RE_POLARITY=1'b1, OUTPUT_REG=1'b0, WRITE_MODE="READ_FIRST", INIT_0=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_1=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_2=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_3=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_4=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_5=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_6=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_7=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_8=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_9=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_A=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_B=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_C=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_D=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_E=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_F=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_10=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_11=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_12=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_13=256'h0000000000000000000000000000000000000000000000000000000000000000, PRESERVE_USER_INIT=1'b0 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(28)
    defparam \wsinterface/led_reg__D$h0t12 .READ_WIDTH = 1;
    defparam \wsinterface/led_reg__D$h0t12 .WRITE_WIDTH = 1;
    defparam \wsinterface/led_reg__D$h0t12 .WCLK_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0t12 .WCLKE_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0t12 .WE_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0t12 .RCLK_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0t12 .RE_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0t12 .INIT_0 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0t12 .INIT_1 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0t12 .INIT_2 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0t12 .INIT_3 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0t12 .INIT_4 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0t12 .INIT_5 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0t12 .INIT_6 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0t12 .INIT_7 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0t12 .INIT_8 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0t12 .INIT_9 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0t12 .INIT_A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0t12 .INIT_B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0t12 .INIT_C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0t12 .INIT_D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0t12 .INIT_E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0t12 .INIT_F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0t12 .INIT_10 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0t12 .INIT_11 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0t12 .INIT_12 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0t12 .INIT_13 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0t12 .OUTPUT_REG = 1'b0;
    defparam \wsinterface/led_reg__D$h0t12 .WRITE_MODE = "READ_FIRST";
    EFX_RAM_5K \wsinterface/led_reg__D$h0s12  (.WCLK(\clk~O ), .RCLK(\clk~O ), 
            .WCLKE(1'b1), .WE(\wsctrl/state[3] ), .RE(\~wsinterface/equal_43/n7 ), 
            .WDATA({\w_rgb_data[19] }), .WADDR({10'b0000000000, \w_address[1] , 
            \w_address[0] }), .RADDR({10'b0000000000, \wsinterface/data_count[1] , 
            \wsinterface/data_count[0] }), .RDATA({\wsinterface/n2460 })) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_RAM_5K, READ_WIDTH=1, WRITE_WIDTH=1, WCLK_POLARITY=1'b1, WCLKE_POLARITY=1'b1, WE_POLARITY=1'b1, RCLK_POLARITY=1'b1, RE_POLARITY=1'b1, OUTPUT_REG=1'b0, WRITE_MODE="READ_FIRST", INIT_0=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_1=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_2=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_3=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_4=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_5=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_6=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_7=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_8=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_9=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_A=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_B=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_C=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_D=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_E=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_F=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_10=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_11=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_12=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_13=256'h0000000000000000000000000000000000000000000000000000000000000000, PRESERVE_USER_INIT=1'b0 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(28)
    defparam \wsinterface/led_reg__D$h0s12 .READ_WIDTH = 1;
    defparam \wsinterface/led_reg__D$h0s12 .WRITE_WIDTH = 1;
    defparam \wsinterface/led_reg__D$h0s12 .WCLK_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0s12 .WCLKE_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0s12 .WE_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0s12 .RCLK_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0s12 .RE_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0s12 .INIT_0 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0s12 .INIT_1 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0s12 .INIT_2 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0s12 .INIT_3 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0s12 .INIT_4 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0s12 .INIT_5 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0s12 .INIT_6 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0s12 .INIT_7 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0s12 .INIT_8 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0s12 .INIT_9 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0s12 .INIT_A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0s12 .INIT_B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0s12 .INIT_C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0s12 .INIT_D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0s12 .INIT_E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0s12 .INIT_F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0s12 .INIT_10 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0s12 .INIT_11 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0s12 .INIT_12 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0s12 .INIT_13 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0s12 .OUTPUT_REG = 1'b0;
    defparam \wsinterface/led_reg__D$h0s12 .WRITE_MODE = "READ_FIRST";
    EFX_RAM_5K \wsinterface/led_reg__D$h0r12  (.WCLK(\clk~O ), .RCLK(\clk~O ), 
            .WCLKE(1'b1), .WE(\wsctrl/state[3] ), .RE(\~wsinterface/equal_43/n7 ), 
            .WDATA({\w_rgb_data[18] }), .WADDR({10'b0000000000, \w_address[1] , 
            \w_address[0] }), .RADDR({10'b0000000000, \wsinterface/data_count[1] , 
            \wsinterface/data_count[0] }), .RDATA({\wsinterface/n2463 })) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_RAM_5K, READ_WIDTH=1, WRITE_WIDTH=1, WCLK_POLARITY=1'b1, WCLKE_POLARITY=1'b1, WE_POLARITY=1'b1, RCLK_POLARITY=1'b1, RE_POLARITY=1'b1, OUTPUT_REG=1'b0, WRITE_MODE="READ_FIRST", INIT_0=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_1=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_2=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_3=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_4=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_5=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_6=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_7=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_8=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_9=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_A=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_B=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_C=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_D=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_E=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_F=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_10=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_11=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_12=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_13=256'h0000000000000000000000000000000000000000000000000000000000000000, PRESERVE_USER_INIT=1'b0 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(28)
    defparam \wsinterface/led_reg__D$h0r12 .READ_WIDTH = 1;
    defparam \wsinterface/led_reg__D$h0r12 .WRITE_WIDTH = 1;
    defparam \wsinterface/led_reg__D$h0r12 .WCLK_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0r12 .WCLKE_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0r12 .WE_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0r12 .RCLK_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0r12 .RE_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0r12 .INIT_0 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0r12 .INIT_1 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0r12 .INIT_2 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0r12 .INIT_3 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0r12 .INIT_4 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0r12 .INIT_5 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0r12 .INIT_6 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0r12 .INIT_7 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0r12 .INIT_8 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0r12 .INIT_9 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0r12 .INIT_A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0r12 .INIT_B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0r12 .INIT_C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0r12 .INIT_D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0r12 .INIT_E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0r12 .INIT_F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0r12 .INIT_10 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0r12 .INIT_11 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0r12 .INIT_12 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0r12 .INIT_13 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0r12 .OUTPUT_REG = 1'b0;
    defparam \wsinterface/led_reg__D$h0r12 .WRITE_MODE = "READ_FIRST";
    EFX_RAM_5K \wsinterface/led_reg__D$h0q12  (.WCLK(\clk~O ), .RCLK(\clk~O ), 
            .WCLKE(1'b1), .WE(\wsctrl/state[3] ), .RE(\~wsinterface/equal_43/n7 ), 
            .WDATA({\w_rgb_data[17] }), .WADDR({10'b0000000000, \w_address[1] , 
            \w_address[0] }), .RADDR({10'b0000000000, \wsinterface/data_count[1] , 
            \wsinterface/data_count[0] }), .RDATA({\wsinterface/n2466 })) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_RAM_5K, READ_WIDTH=1, WRITE_WIDTH=1, WCLK_POLARITY=1'b1, WCLKE_POLARITY=1'b1, WE_POLARITY=1'b1, RCLK_POLARITY=1'b1, RE_POLARITY=1'b1, OUTPUT_REG=1'b0, WRITE_MODE="READ_FIRST", INIT_0=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_1=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_2=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_3=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_4=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_5=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_6=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_7=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_8=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_9=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_A=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_B=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_C=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_D=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_E=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_F=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_10=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_11=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_12=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_13=256'h0000000000000000000000000000000000000000000000000000000000000000, PRESERVE_USER_INIT=1'b0 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(28)
    defparam \wsinterface/led_reg__D$h0q12 .READ_WIDTH = 1;
    defparam \wsinterface/led_reg__D$h0q12 .WRITE_WIDTH = 1;
    defparam \wsinterface/led_reg__D$h0q12 .WCLK_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0q12 .WCLKE_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0q12 .WE_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0q12 .RCLK_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0q12 .RE_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0q12 .INIT_0 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0q12 .INIT_1 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0q12 .INIT_2 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0q12 .INIT_3 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0q12 .INIT_4 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0q12 .INIT_5 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0q12 .INIT_6 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0q12 .INIT_7 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0q12 .INIT_8 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0q12 .INIT_9 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0q12 .INIT_A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0q12 .INIT_B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0q12 .INIT_C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0q12 .INIT_D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0q12 .INIT_E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0q12 .INIT_F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0q12 .INIT_10 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0q12 .INIT_11 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0q12 .INIT_12 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0q12 .INIT_13 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0q12 .OUTPUT_REG = 1'b0;
    defparam \wsinterface/led_reg__D$h0q12 .WRITE_MODE = "READ_FIRST";
    EFX_RAM_5K \wsinterface/led_reg__D$h0p12  (.WCLK(\clk~O ), .RCLK(\clk~O ), 
            .WCLKE(1'b1), .WE(\wsctrl/state[3] ), .RE(\~wsinterface/equal_43/n7 ), 
            .WDATA({\w_rgb_data[16] }), .WADDR({10'b0000000000, \w_address[1] , 
            \w_address[0] }), .RADDR({10'b0000000000, \wsinterface/data_count[1] , 
            \wsinterface/data_count[0] }), .RDATA({\wsinterface/n2469 })) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_RAM_5K, READ_WIDTH=1, WRITE_WIDTH=1, WCLK_POLARITY=1'b1, WCLKE_POLARITY=1'b1, WE_POLARITY=1'b1, RCLK_POLARITY=1'b1, RE_POLARITY=1'b1, OUTPUT_REG=1'b0, WRITE_MODE="READ_FIRST", INIT_0=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_1=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_2=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_3=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_4=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_5=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_6=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_7=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_8=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_9=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_A=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_B=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_C=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_D=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_E=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_F=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_10=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_11=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_12=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_13=256'h0000000000000000000000000000000000000000000000000000000000000000, PRESERVE_USER_INIT=1'b0 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(28)
    defparam \wsinterface/led_reg__D$h0p12 .READ_WIDTH = 1;
    defparam \wsinterface/led_reg__D$h0p12 .WRITE_WIDTH = 1;
    defparam \wsinterface/led_reg__D$h0p12 .WCLK_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0p12 .WCLKE_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0p12 .WE_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0p12 .RCLK_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0p12 .RE_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0p12 .INIT_0 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0p12 .INIT_1 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0p12 .INIT_2 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0p12 .INIT_3 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0p12 .INIT_4 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0p12 .INIT_5 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0p12 .INIT_6 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0p12 .INIT_7 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0p12 .INIT_8 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0p12 .INIT_9 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0p12 .INIT_A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0p12 .INIT_B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0p12 .INIT_C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0p12 .INIT_D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0p12 .INIT_E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0p12 .INIT_F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0p12 .INIT_10 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0p12 .INIT_11 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0p12 .INIT_12 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0p12 .INIT_13 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0p12 .OUTPUT_REG = 1'b0;
    defparam \wsinterface/led_reg__D$h0p12 .WRITE_MODE = "READ_FIRST";
    EFX_RAM_5K \wsinterface/led_reg__D$h0o12  (.WCLK(\clk~O ), .RCLK(\clk~O ), 
            .WCLKE(1'b1), .WE(\wsctrl/state[3] ), .RE(\~wsinterface/equal_43/n7 ), 
            .WDATA({\w_rgb_data[15] }), .WADDR({10'b0000000000, \w_address[1] , 
            \w_address[0] }), .RADDR({10'b0000000000, \wsinterface/data_count[1] , 
            \wsinterface/data_count[0] }), .RDATA({\wsinterface/n2472 })) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_RAM_5K, READ_WIDTH=1, WRITE_WIDTH=1, WCLK_POLARITY=1'b1, WCLKE_POLARITY=1'b1, WE_POLARITY=1'b1, RCLK_POLARITY=1'b1, RE_POLARITY=1'b1, OUTPUT_REG=1'b0, WRITE_MODE="READ_FIRST", INIT_0=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_1=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_2=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_3=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_4=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_5=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_6=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_7=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_8=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_9=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_A=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_B=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_C=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_D=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_E=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_F=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_10=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_11=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_12=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_13=256'h0000000000000000000000000000000000000000000000000000000000000000, PRESERVE_USER_INIT=1'b0 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(28)
    defparam \wsinterface/led_reg__D$h0o12 .READ_WIDTH = 1;
    defparam \wsinterface/led_reg__D$h0o12 .WRITE_WIDTH = 1;
    defparam \wsinterface/led_reg__D$h0o12 .WCLK_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0o12 .WCLKE_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0o12 .WE_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0o12 .RCLK_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0o12 .RE_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0o12 .INIT_0 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0o12 .INIT_1 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0o12 .INIT_2 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0o12 .INIT_3 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0o12 .INIT_4 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0o12 .INIT_5 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0o12 .INIT_6 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0o12 .INIT_7 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0o12 .INIT_8 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0o12 .INIT_9 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0o12 .INIT_A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0o12 .INIT_B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0o12 .INIT_C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0o12 .INIT_D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0o12 .INIT_E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0o12 .INIT_F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0o12 .INIT_10 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0o12 .INIT_11 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0o12 .INIT_12 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0o12 .INIT_13 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0o12 .OUTPUT_REG = 1'b0;
    defparam \wsinterface/led_reg__D$h0o12 .WRITE_MODE = "READ_FIRST";
    EFX_RAM_5K \wsinterface/led_reg__D$h0n12  (.WCLK(\clk~O ), .RCLK(\clk~O ), 
            .WCLKE(1'b1), .WE(\wsctrl/state[3] ), .RE(\~wsinterface/equal_43/n7 ), 
            .WDATA({\w_rgb_data[14] }), .WADDR({10'b0000000000, \w_address[1] , 
            \w_address[0] }), .RADDR({10'b0000000000, \wsinterface/data_count[1] , 
            \wsinterface/data_count[0] }), .RDATA({\wsinterface/n2475 })) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_RAM_5K, READ_WIDTH=1, WRITE_WIDTH=1, WCLK_POLARITY=1'b1, WCLKE_POLARITY=1'b1, WE_POLARITY=1'b1, RCLK_POLARITY=1'b1, RE_POLARITY=1'b1, OUTPUT_REG=1'b0, WRITE_MODE="READ_FIRST", INIT_0=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_1=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_2=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_3=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_4=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_5=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_6=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_7=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_8=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_9=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_A=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_B=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_C=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_D=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_E=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_F=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_10=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_11=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_12=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_13=256'h0000000000000000000000000000000000000000000000000000000000000000, PRESERVE_USER_INIT=1'b0 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(28)
    defparam \wsinterface/led_reg__D$h0n12 .READ_WIDTH = 1;
    defparam \wsinterface/led_reg__D$h0n12 .WRITE_WIDTH = 1;
    defparam \wsinterface/led_reg__D$h0n12 .WCLK_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0n12 .WCLKE_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0n12 .WE_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0n12 .RCLK_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0n12 .RE_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0n12 .INIT_0 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0n12 .INIT_1 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0n12 .INIT_2 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0n12 .INIT_3 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0n12 .INIT_4 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0n12 .INIT_5 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0n12 .INIT_6 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0n12 .INIT_7 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0n12 .INIT_8 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0n12 .INIT_9 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0n12 .INIT_A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0n12 .INIT_B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0n12 .INIT_C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0n12 .INIT_D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0n12 .INIT_E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0n12 .INIT_F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0n12 .INIT_10 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0n12 .INIT_11 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0n12 .INIT_12 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0n12 .INIT_13 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0n12 .OUTPUT_REG = 1'b0;
    defparam \wsinterface/led_reg__D$h0n12 .WRITE_MODE = "READ_FIRST";
    EFX_RAM_5K \wsinterface/led_reg__D$h0m12  (.WCLK(\clk~O ), .RCLK(\clk~O ), 
            .WCLKE(1'b1), .WE(\wsctrl/state[3] ), .RE(\~wsinterface/equal_43/n7 ), 
            .WDATA({\w_rgb_data[13] }), .WADDR({10'b0000000000, \w_address[1] , 
            \w_address[0] }), .RADDR({10'b0000000000, \wsinterface/data_count[1] , 
            \wsinterface/data_count[0] }), .RDATA({\wsinterface/n2478 })) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_RAM_5K, READ_WIDTH=1, WRITE_WIDTH=1, WCLK_POLARITY=1'b1, WCLKE_POLARITY=1'b1, WE_POLARITY=1'b1, RCLK_POLARITY=1'b1, RE_POLARITY=1'b1, OUTPUT_REG=1'b0, WRITE_MODE="READ_FIRST", INIT_0=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_1=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_2=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_3=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_4=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_5=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_6=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_7=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_8=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_9=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_A=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_B=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_C=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_D=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_E=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_F=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_10=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_11=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_12=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_13=256'h0000000000000000000000000000000000000000000000000000000000000000, PRESERVE_USER_INIT=1'b0 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(28)
    defparam \wsinterface/led_reg__D$h0m12 .READ_WIDTH = 1;
    defparam \wsinterface/led_reg__D$h0m12 .WRITE_WIDTH = 1;
    defparam \wsinterface/led_reg__D$h0m12 .WCLK_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0m12 .WCLKE_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0m12 .WE_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0m12 .RCLK_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0m12 .RE_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0m12 .INIT_0 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0m12 .INIT_1 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0m12 .INIT_2 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0m12 .INIT_3 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0m12 .INIT_4 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0m12 .INIT_5 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0m12 .INIT_6 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0m12 .INIT_7 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0m12 .INIT_8 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0m12 .INIT_9 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0m12 .INIT_A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0m12 .INIT_B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0m12 .INIT_C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0m12 .INIT_D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0m12 .INIT_E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0m12 .INIT_F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0m12 .INIT_10 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0m12 .INIT_11 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0m12 .INIT_12 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0m12 .INIT_13 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0m12 .OUTPUT_REG = 1'b0;
    defparam \wsinterface/led_reg__D$h0m12 .WRITE_MODE = "READ_FIRST";
    EFX_RAM_5K \wsinterface/led_reg__D$h0l12  (.WCLK(\clk~O ), .RCLK(\clk~O ), 
            .WCLKE(1'b1), .WE(\wsctrl/state[3] ), .RE(\~wsinterface/equal_43/n7 ), 
            .WDATA({\w_rgb_data[12] }), .WADDR({10'b0000000000, \w_address[1] , 
            \w_address[0] }), .RADDR({10'b0000000000, \wsinterface/data_count[1] , 
            \wsinterface/data_count[0] }), .RDATA({\wsinterface/n2481 })) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_RAM_5K, READ_WIDTH=1, WRITE_WIDTH=1, WCLK_POLARITY=1'b1, WCLKE_POLARITY=1'b1, WE_POLARITY=1'b1, RCLK_POLARITY=1'b1, RE_POLARITY=1'b1, OUTPUT_REG=1'b0, WRITE_MODE="READ_FIRST", INIT_0=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_1=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_2=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_3=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_4=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_5=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_6=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_7=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_8=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_9=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_A=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_B=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_C=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_D=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_E=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_F=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_10=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_11=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_12=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_13=256'h0000000000000000000000000000000000000000000000000000000000000000, PRESERVE_USER_INIT=1'b0 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(28)
    defparam \wsinterface/led_reg__D$h0l12 .READ_WIDTH = 1;
    defparam \wsinterface/led_reg__D$h0l12 .WRITE_WIDTH = 1;
    defparam \wsinterface/led_reg__D$h0l12 .WCLK_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0l12 .WCLKE_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0l12 .WE_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0l12 .RCLK_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0l12 .RE_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0l12 .INIT_0 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0l12 .INIT_1 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0l12 .INIT_2 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0l12 .INIT_3 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0l12 .INIT_4 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0l12 .INIT_5 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0l12 .INIT_6 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0l12 .INIT_7 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0l12 .INIT_8 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0l12 .INIT_9 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0l12 .INIT_A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0l12 .INIT_B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0l12 .INIT_C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0l12 .INIT_D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0l12 .INIT_E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0l12 .INIT_F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0l12 .INIT_10 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0l12 .INIT_11 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0l12 .INIT_12 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0l12 .INIT_13 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0l12 .OUTPUT_REG = 1'b0;
    defparam \wsinterface/led_reg__D$h0l12 .WRITE_MODE = "READ_FIRST";
    EFX_RAM_5K \wsinterface/led_reg__D$h0k12  (.WCLK(\clk~O ), .RCLK(\clk~O ), 
            .WCLKE(1'b1), .WE(\wsctrl/state[3] ), .RE(\~wsinterface/equal_43/n7 ), 
            .WDATA({\w_rgb_data[11] }), .WADDR({10'b0000000000, \w_address[1] , 
            \w_address[0] }), .RADDR({10'b0000000000, \wsinterface/data_count[1] , 
            \wsinterface/data_count[0] }), .RDATA({\wsinterface/n2484 })) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_RAM_5K, READ_WIDTH=1, WRITE_WIDTH=1, WCLK_POLARITY=1'b1, WCLKE_POLARITY=1'b1, WE_POLARITY=1'b1, RCLK_POLARITY=1'b1, RE_POLARITY=1'b1, OUTPUT_REG=1'b0, WRITE_MODE="READ_FIRST", INIT_0=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_1=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_2=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_3=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_4=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_5=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_6=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_7=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_8=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_9=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_A=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_B=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_C=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_D=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_E=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_F=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_10=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_11=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_12=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_13=256'h0000000000000000000000000000000000000000000000000000000000000000, PRESERVE_USER_INIT=1'b0 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(28)
    defparam \wsinterface/led_reg__D$h0k12 .READ_WIDTH = 1;
    defparam \wsinterface/led_reg__D$h0k12 .WRITE_WIDTH = 1;
    defparam \wsinterface/led_reg__D$h0k12 .WCLK_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0k12 .WCLKE_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0k12 .WE_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0k12 .RCLK_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0k12 .RE_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0k12 .INIT_0 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0k12 .INIT_1 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0k12 .INIT_2 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0k12 .INIT_3 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0k12 .INIT_4 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0k12 .INIT_5 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0k12 .INIT_6 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0k12 .INIT_7 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0k12 .INIT_8 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0k12 .INIT_9 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0k12 .INIT_A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0k12 .INIT_B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0k12 .INIT_C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0k12 .INIT_D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0k12 .INIT_E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0k12 .INIT_F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0k12 .INIT_10 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0k12 .INIT_11 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0k12 .INIT_12 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0k12 .INIT_13 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0k12 .OUTPUT_REG = 1'b0;
    defparam \wsinterface/led_reg__D$h0k12 .WRITE_MODE = "READ_FIRST";
    EFX_RAM_5K \wsinterface/led_reg__D$h0j12  (.WCLK(\clk~O ), .RCLK(\clk~O ), 
            .WCLKE(1'b1), .WE(\wsctrl/state[3] ), .RE(\~wsinterface/equal_43/n7 ), 
            .WDATA({\w_rgb_data[10] }), .WADDR({10'b0000000000, \w_address[1] , 
            \w_address[0] }), .RADDR({10'b0000000000, \wsinterface/data_count[1] , 
            \wsinterface/data_count[0] }), .RDATA({\wsinterface/n2487 })) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_RAM_5K, READ_WIDTH=1, WRITE_WIDTH=1, WCLK_POLARITY=1'b1, WCLKE_POLARITY=1'b1, WE_POLARITY=1'b1, RCLK_POLARITY=1'b1, RE_POLARITY=1'b1, OUTPUT_REG=1'b0, WRITE_MODE="READ_FIRST", INIT_0=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_1=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_2=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_3=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_4=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_5=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_6=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_7=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_8=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_9=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_A=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_B=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_C=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_D=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_E=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_F=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_10=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_11=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_12=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_13=256'h0000000000000000000000000000000000000000000000000000000000000000, PRESERVE_USER_INIT=1'b0 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(28)
    defparam \wsinterface/led_reg__D$h0j12 .READ_WIDTH = 1;
    defparam \wsinterface/led_reg__D$h0j12 .WRITE_WIDTH = 1;
    defparam \wsinterface/led_reg__D$h0j12 .WCLK_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0j12 .WCLKE_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0j12 .WE_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0j12 .RCLK_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0j12 .RE_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0j12 .INIT_0 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0j12 .INIT_1 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0j12 .INIT_2 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0j12 .INIT_3 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0j12 .INIT_4 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0j12 .INIT_5 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0j12 .INIT_6 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0j12 .INIT_7 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0j12 .INIT_8 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0j12 .INIT_9 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0j12 .INIT_A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0j12 .INIT_B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0j12 .INIT_C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0j12 .INIT_D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0j12 .INIT_E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0j12 .INIT_F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0j12 .INIT_10 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0j12 .INIT_11 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0j12 .INIT_12 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0j12 .INIT_13 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0j12 .OUTPUT_REG = 1'b0;
    defparam \wsinterface/led_reg__D$h0j12 .WRITE_MODE = "READ_FIRST";
    EFX_RAM_5K \wsinterface/led_reg__D$h0i12  (.WCLK(\clk~O ), .RCLK(\clk~O ), 
            .WCLKE(1'b1), .WE(\wsctrl/state[3] ), .RE(\~wsinterface/equal_43/n7 ), 
            .WDATA({\w_rgb_data[9] }), .WADDR({10'b0000000000, \w_address[1] , 
            \w_address[0] }), .RADDR({10'b0000000000, \wsinterface/data_count[1] , 
            \wsinterface/data_count[0] }), .RDATA({\wsinterface/n2490 })) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_RAM_5K, READ_WIDTH=1, WRITE_WIDTH=1, WCLK_POLARITY=1'b1, WCLKE_POLARITY=1'b1, WE_POLARITY=1'b1, RCLK_POLARITY=1'b1, RE_POLARITY=1'b1, OUTPUT_REG=1'b0, WRITE_MODE="READ_FIRST", INIT_0=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_1=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_2=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_3=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_4=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_5=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_6=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_7=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_8=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_9=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_A=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_B=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_C=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_D=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_E=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_F=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_10=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_11=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_12=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_13=256'h0000000000000000000000000000000000000000000000000000000000000000, PRESERVE_USER_INIT=1'b0 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(28)
    defparam \wsinterface/led_reg__D$h0i12 .READ_WIDTH = 1;
    defparam \wsinterface/led_reg__D$h0i12 .WRITE_WIDTH = 1;
    defparam \wsinterface/led_reg__D$h0i12 .WCLK_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0i12 .WCLKE_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0i12 .WE_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0i12 .RCLK_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0i12 .RE_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0i12 .INIT_0 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0i12 .INIT_1 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0i12 .INIT_2 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0i12 .INIT_3 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0i12 .INIT_4 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0i12 .INIT_5 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0i12 .INIT_6 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0i12 .INIT_7 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0i12 .INIT_8 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0i12 .INIT_9 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0i12 .INIT_A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0i12 .INIT_B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0i12 .INIT_C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0i12 .INIT_D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0i12 .INIT_E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0i12 .INIT_F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0i12 .INIT_10 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0i12 .INIT_11 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0i12 .INIT_12 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0i12 .INIT_13 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0i12 .OUTPUT_REG = 1'b0;
    defparam \wsinterface/led_reg__D$h0i12 .WRITE_MODE = "READ_FIRST";
    EFX_RAM_5K \wsinterface/led_reg__D$h0h12  (.WCLK(\clk~O ), .RCLK(\clk~O ), 
            .WCLKE(1'b1), .WE(\wsctrl/state[3] ), .RE(\~wsinterface/equal_43/n7 ), 
            .WDATA({\w_rgb_data[8] }), .WADDR({10'b0000000000, \w_address[1] , 
            \w_address[0] }), .RADDR({10'b0000000000, \wsinterface/data_count[1] , 
            \wsinterface/data_count[0] }), .RDATA({\wsinterface/n2493 })) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_RAM_5K, READ_WIDTH=1, WRITE_WIDTH=1, WCLK_POLARITY=1'b1, WCLKE_POLARITY=1'b1, WE_POLARITY=1'b1, RCLK_POLARITY=1'b1, RE_POLARITY=1'b1, OUTPUT_REG=1'b0, WRITE_MODE="READ_FIRST", INIT_0=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_1=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_2=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_3=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_4=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_5=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_6=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_7=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_8=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_9=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_A=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_B=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_C=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_D=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_E=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_F=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_10=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_11=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_12=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_13=256'h0000000000000000000000000000000000000000000000000000000000000000, PRESERVE_USER_INIT=1'b0 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(28)
    defparam \wsinterface/led_reg__D$h0h12 .READ_WIDTH = 1;
    defparam \wsinterface/led_reg__D$h0h12 .WRITE_WIDTH = 1;
    defparam \wsinterface/led_reg__D$h0h12 .WCLK_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0h12 .WCLKE_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0h12 .WE_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0h12 .RCLK_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0h12 .RE_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0h12 .INIT_0 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0h12 .INIT_1 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0h12 .INIT_2 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0h12 .INIT_3 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0h12 .INIT_4 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0h12 .INIT_5 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0h12 .INIT_6 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0h12 .INIT_7 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0h12 .INIT_8 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0h12 .INIT_9 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0h12 .INIT_A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0h12 .INIT_B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0h12 .INIT_C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0h12 .INIT_D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0h12 .INIT_E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0h12 .INIT_F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0h12 .INIT_10 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0h12 .INIT_11 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0h12 .INIT_12 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0h12 .INIT_13 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0h12 .OUTPUT_REG = 1'b0;
    defparam \wsinterface/led_reg__D$h0h12 .WRITE_MODE = "READ_FIRST";
    EFX_RAM_5K \wsinterface/led_reg__D$h0g12  (.WCLK(\clk~O ), .RCLK(\clk~O ), 
            .WCLKE(1'b1), .WE(\wsctrl/state[3] ), .RE(\~wsinterface/equal_43/n7 ), 
            .WDATA({\w_rgb_data[7] }), .WADDR({10'b0000000000, \w_address[1] , 
            \w_address[0] }), .RADDR({10'b0000000000, \wsinterface/data_count[1] , 
            \wsinterface/data_count[0] }), .RDATA({\wsinterface/n2496 })) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_RAM_5K, READ_WIDTH=1, WRITE_WIDTH=1, WCLK_POLARITY=1'b1, WCLKE_POLARITY=1'b1, WE_POLARITY=1'b1, RCLK_POLARITY=1'b1, RE_POLARITY=1'b1, OUTPUT_REG=1'b0, WRITE_MODE="READ_FIRST", INIT_0=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_1=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_2=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_3=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_4=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_5=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_6=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_7=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_8=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_9=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_A=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_B=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_C=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_D=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_E=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_F=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_10=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_11=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_12=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_13=256'h0000000000000000000000000000000000000000000000000000000000000000, PRESERVE_USER_INIT=1'b0 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(28)
    defparam \wsinterface/led_reg__D$h0g12 .READ_WIDTH = 1;
    defparam \wsinterface/led_reg__D$h0g12 .WRITE_WIDTH = 1;
    defparam \wsinterface/led_reg__D$h0g12 .WCLK_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0g12 .WCLKE_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0g12 .WE_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0g12 .RCLK_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0g12 .RE_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0g12 .INIT_0 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0g12 .INIT_1 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0g12 .INIT_2 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0g12 .INIT_3 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0g12 .INIT_4 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0g12 .INIT_5 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0g12 .INIT_6 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0g12 .INIT_7 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0g12 .INIT_8 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0g12 .INIT_9 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0g12 .INIT_A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0g12 .INIT_B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0g12 .INIT_C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0g12 .INIT_D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0g12 .INIT_E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0g12 .INIT_F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0g12 .INIT_10 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0g12 .INIT_11 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0g12 .INIT_12 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0g12 .INIT_13 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0g12 .OUTPUT_REG = 1'b0;
    defparam \wsinterface/led_reg__D$h0g12 .WRITE_MODE = "READ_FIRST";
    EFX_RAM_5K \wsinterface/led_reg__D$h0f12  (.WCLK(\clk~O ), .RCLK(\clk~O ), 
            .WCLKE(1'b1), .WE(\wsctrl/state[3] ), .RE(\~wsinterface/equal_43/n7 ), 
            .WDATA({\w_rgb_data[6] }), .WADDR({10'b0000000000, \w_address[1] , 
            \w_address[0] }), .RADDR({10'b0000000000, \wsinterface/data_count[1] , 
            \wsinterface/data_count[0] }), .RDATA({\wsinterface/n2499 })) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_RAM_5K, READ_WIDTH=1, WRITE_WIDTH=1, WCLK_POLARITY=1'b1, WCLKE_POLARITY=1'b1, WE_POLARITY=1'b1, RCLK_POLARITY=1'b1, RE_POLARITY=1'b1, OUTPUT_REG=1'b0, WRITE_MODE="READ_FIRST", INIT_0=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_1=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_2=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_3=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_4=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_5=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_6=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_7=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_8=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_9=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_A=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_B=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_C=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_D=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_E=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_F=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_10=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_11=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_12=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_13=256'h0000000000000000000000000000000000000000000000000000000000000000, PRESERVE_USER_INIT=1'b0 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(28)
    defparam \wsinterface/led_reg__D$h0f12 .READ_WIDTH = 1;
    defparam \wsinterface/led_reg__D$h0f12 .WRITE_WIDTH = 1;
    defparam \wsinterface/led_reg__D$h0f12 .WCLK_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0f12 .WCLKE_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0f12 .WE_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0f12 .RCLK_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0f12 .RE_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0f12 .INIT_0 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0f12 .INIT_1 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0f12 .INIT_2 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0f12 .INIT_3 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0f12 .INIT_4 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0f12 .INIT_5 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0f12 .INIT_6 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0f12 .INIT_7 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0f12 .INIT_8 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0f12 .INIT_9 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0f12 .INIT_A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0f12 .INIT_B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0f12 .INIT_C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0f12 .INIT_D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0f12 .INIT_E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0f12 .INIT_F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0f12 .INIT_10 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0f12 .INIT_11 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0f12 .INIT_12 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0f12 .INIT_13 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0f12 .OUTPUT_REG = 1'b0;
    defparam \wsinterface/led_reg__D$h0f12 .WRITE_MODE = "READ_FIRST";
    EFX_RAM_5K \wsinterface/led_reg__D$h0e12  (.WCLK(\clk~O ), .RCLK(\clk~O ), 
            .WCLKE(1'b1), .WE(\wsctrl/state[3] ), .RE(\~wsinterface/equal_43/n7 ), 
            .WDATA({\w_rgb_data[5] }), .WADDR({10'b0000000000, \w_address[1] , 
            \w_address[0] }), .RADDR({10'b0000000000, \wsinterface/data_count[1] , 
            \wsinterface/data_count[0] }), .RDATA({\wsinterface/n2502 })) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_RAM_5K, READ_WIDTH=1, WRITE_WIDTH=1, WCLK_POLARITY=1'b1, WCLKE_POLARITY=1'b1, WE_POLARITY=1'b1, RCLK_POLARITY=1'b1, RE_POLARITY=1'b1, OUTPUT_REG=1'b0, WRITE_MODE="READ_FIRST", INIT_0=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_1=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_2=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_3=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_4=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_5=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_6=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_7=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_8=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_9=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_A=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_B=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_C=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_D=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_E=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_F=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_10=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_11=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_12=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_13=256'h0000000000000000000000000000000000000000000000000000000000000000, PRESERVE_USER_INIT=1'b0 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(28)
    defparam \wsinterface/led_reg__D$h0e12 .READ_WIDTH = 1;
    defparam \wsinterface/led_reg__D$h0e12 .WRITE_WIDTH = 1;
    defparam \wsinterface/led_reg__D$h0e12 .WCLK_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0e12 .WCLKE_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0e12 .WE_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0e12 .RCLK_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0e12 .RE_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0e12 .INIT_0 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0e12 .INIT_1 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0e12 .INIT_2 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0e12 .INIT_3 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0e12 .INIT_4 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0e12 .INIT_5 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0e12 .INIT_6 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0e12 .INIT_7 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0e12 .INIT_8 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0e12 .INIT_9 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0e12 .INIT_A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0e12 .INIT_B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0e12 .INIT_C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0e12 .INIT_D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0e12 .INIT_E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0e12 .INIT_F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0e12 .INIT_10 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0e12 .INIT_11 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0e12 .INIT_12 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0e12 .INIT_13 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0e12 .OUTPUT_REG = 1'b0;
    defparam \wsinterface/led_reg__D$h0e12 .WRITE_MODE = "READ_FIRST";
    EFX_RAM_5K \wsinterface/led_reg__D$h0d12  (.WCLK(\clk~O ), .RCLK(\clk~O ), 
            .WCLKE(1'b1), .WE(\wsctrl/state[3] ), .RE(\~wsinterface/equal_43/n7 ), 
            .WDATA({\w_rgb_data[4] }), .WADDR({10'b0000000000, \w_address[1] , 
            \w_address[0] }), .RADDR({10'b0000000000, \wsinterface/data_count[1] , 
            \wsinterface/data_count[0] }), .RDATA({\wsinterface/n2505 })) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_RAM_5K, READ_WIDTH=1, WRITE_WIDTH=1, WCLK_POLARITY=1'b1, WCLKE_POLARITY=1'b1, WE_POLARITY=1'b1, RCLK_POLARITY=1'b1, RE_POLARITY=1'b1, OUTPUT_REG=1'b0, WRITE_MODE="READ_FIRST", INIT_0=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_1=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_2=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_3=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_4=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_5=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_6=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_7=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_8=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_9=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_A=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_B=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_C=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_D=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_E=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_F=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_10=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_11=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_12=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_13=256'h0000000000000000000000000000000000000000000000000000000000000000, PRESERVE_USER_INIT=1'b0 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(28)
    defparam \wsinterface/led_reg__D$h0d12 .READ_WIDTH = 1;
    defparam \wsinterface/led_reg__D$h0d12 .WRITE_WIDTH = 1;
    defparam \wsinterface/led_reg__D$h0d12 .WCLK_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0d12 .WCLKE_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0d12 .WE_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0d12 .RCLK_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0d12 .RE_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0d12 .INIT_0 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0d12 .INIT_1 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0d12 .INIT_2 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0d12 .INIT_3 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0d12 .INIT_4 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0d12 .INIT_5 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0d12 .INIT_6 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0d12 .INIT_7 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0d12 .INIT_8 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0d12 .INIT_9 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0d12 .INIT_A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0d12 .INIT_B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0d12 .INIT_C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0d12 .INIT_D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0d12 .INIT_E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0d12 .INIT_F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0d12 .INIT_10 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0d12 .INIT_11 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0d12 .INIT_12 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0d12 .INIT_13 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0d12 .OUTPUT_REG = 1'b0;
    defparam \wsinterface/led_reg__D$h0d12 .WRITE_MODE = "READ_FIRST";
    EFX_RAM_5K \wsinterface/led_reg__D$h0c12  (.WCLK(\clk~O ), .RCLK(\clk~O ), 
            .WCLKE(1'b1), .WE(\wsctrl/state[3] ), .RE(\~wsinterface/equal_43/n7 ), 
            .WDATA({\w_rgb_data[3] }), .WADDR({10'b0000000000, \w_address[1] , 
            \w_address[0] }), .RADDR({10'b0000000000, \wsinterface/data_count[1] , 
            \wsinterface/data_count[0] }), .RDATA({\wsinterface/n2508 })) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_RAM_5K, READ_WIDTH=1, WRITE_WIDTH=1, WCLK_POLARITY=1'b1, WCLKE_POLARITY=1'b1, WE_POLARITY=1'b1, RCLK_POLARITY=1'b1, RE_POLARITY=1'b1, OUTPUT_REG=1'b0, WRITE_MODE="READ_FIRST", INIT_0=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_1=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_2=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_3=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_4=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_5=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_6=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_7=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_8=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_9=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_A=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_B=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_C=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_D=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_E=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_F=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_10=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_11=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_12=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_13=256'h0000000000000000000000000000000000000000000000000000000000000000, PRESERVE_USER_INIT=1'b0 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(28)
    defparam \wsinterface/led_reg__D$h0c12 .READ_WIDTH = 1;
    defparam \wsinterface/led_reg__D$h0c12 .WRITE_WIDTH = 1;
    defparam \wsinterface/led_reg__D$h0c12 .WCLK_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0c12 .WCLKE_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0c12 .WE_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0c12 .RCLK_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0c12 .RE_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0c12 .INIT_0 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0c12 .INIT_1 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0c12 .INIT_2 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0c12 .INIT_3 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0c12 .INIT_4 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0c12 .INIT_5 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0c12 .INIT_6 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0c12 .INIT_7 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0c12 .INIT_8 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0c12 .INIT_9 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0c12 .INIT_A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0c12 .INIT_B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0c12 .INIT_C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0c12 .INIT_D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0c12 .INIT_E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0c12 .INIT_F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0c12 .INIT_10 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0c12 .INIT_11 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0c12 .INIT_12 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0c12 .INIT_13 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0c12 .OUTPUT_REG = 1'b0;
    defparam \wsinterface/led_reg__D$h0c12 .WRITE_MODE = "READ_FIRST";
    EFX_RAM_5K \wsinterface/led_reg__D$h0b12  (.WCLK(\clk~O ), .RCLK(\clk~O ), 
            .WCLKE(1'b1), .WE(\wsctrl/state[3] ), .RE(\~wsinterface/equal_43/n7 ), 
            .WDATA({\w_rgb_data[2] }), .WADDR({10'b0000000000, \w_address[1] , 
            \w_address[0] }), .RADDR({10'b0000000000, \wsinterface/data_count[1] , 
            \wsinterface/data_count[0] }), .RDATA({\wsinterface/n2511 })) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_RAM_5K, READ_WIDTH=1, WRITE_WIDTH=1, WCLK_POLARITY=1'b1, WCLKE_POLARITY=1'b1, WE_POLARITY=1'b1, RCLK_POLARITY=1'b1, RE_POLARITY=1'b1, OUTPUT_REG=1'b0, WRITE_MODE="READ_FIRST", INIT_0=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_1=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_2=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_3=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_4=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_5=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_6=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_7=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_8=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_9=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_A=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_B=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_C=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_D=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_E=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_F=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_10=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_11=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_12=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_13=256'h0000000000000000000000000000000000000000000000000000000000000000, PRESERVE_USER_INIT=1'b0 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(28)
    defparam \wsinterface/led_reg__D$h0b12 .READ_WIDTH = 1;
    defparam \wsinterface/led_reg__D$h0b12 .WRITE_WIDTH = 1;
    defparam \wsinterface/led_reg__D$h0b12 .WCLK_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0b12 .WCLKE_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0b12 .WE_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0b12 .RCLK_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0b12 .RE_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0b12 .INIT_0 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0b12 .INIT_1 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0b12 .INIT_2 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0b12 .INIT_3 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0b12 .INIT_4 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0b12 .INIT_5 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0b12 .INIT_6 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0b12 .INIT_7 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0b12 .INIT_8 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0b12 .INIT_9 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0b12 .INIT_A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0b12 .INIT_B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0b12 .INIT_C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0b12 .INIT_D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0b12 .INIT_E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0b12 .INIT_F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0b12 .INIT_10 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0b12 .INIT_11 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0b12 .INIT_12 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0b12 .INIT_13 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0b12 .OUTPUT_REG = 1'b0;
    defparam \wsinterface/led_reg__D$h0b12 .WRITE_MODE = "READ_FIRST";
    EFX_RAM_5K \wsinterface/led_reg__D$h012  (.WCLK(\clk~O ), .RCLK(\clk~O ), 
            .WCLKE(1'b1), .WE(\wsctrl/state[3] ), .RE(\~wsinterface/equal_43/n7 ), 
            .WDATA({\w_rgb_data[1] }), .WADDR({10'b0000000000, \w_address[1] , 
            \w_address[0] }), .RADDR({10'b0000000000, \wsinterface/data_count[1] , 
            \wsinterface/data_count[0] }), .RDATA({\wsinterface/n2514 })) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_RAM_5K, READ_WIDTH=1, WRITE_WIDTH=1, WCLK_POLARITY=1'b1, WCLKE_POLARITY=1'b1, WE_POLARITY=1'b1, RCLK_POLARITY=1'b1, RE_POLARITY=1'b1, OUTPUT_REG=1'b0, WRITE_MODE="READ_FIRST", INIT_0=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_1=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_2=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_3=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_4=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_5=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_6=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_7=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_8=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_9=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_A=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_B=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_C=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_D=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_E=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_F=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_10=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_11=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_12=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_13=256'h0000000000000000000000000000000000000000000000000000000000000000, PRESERVE_USER_INIT=1'b0 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(28)
    defparam \wsinterface/led_reg__D$h012 .READ_WIDTH = 1;
    defparam \wsinterface/led_reg__D$h012 .WRITE_WIDTH = 1;
    defparam \wsinterface/led_reg__D$h012 .WCLK_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h012 .WCLKE_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h012 .WE_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h012 .RCLK_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h012 .RE_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h012 .INIT_0 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h012 .INIT_1 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h012 .INIT_2 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h012 .INIT_3 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h012 .INIT_4 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h012 .INIT_5 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h012 .INIT_6 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h012 .INIT_7 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h012 .INIT_8 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h012 .INIT_9 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h012 .INIT_A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h012 .INIT_B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h012 .INIT_C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h012 .INIT_D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h012 .INIT_E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h012 .INIT_F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h012 .INIT_10 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h012 .INIT_11 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h012 .INIT_12 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h012 .INIT_13 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h012 .OUTPUT_REG = 1'b0;
    defparam \wsinterface/led_reg__D$h012 .WRITE_MODE = "READ_FIRST";
    EFX_RAM_5K \wsinterface/led_reg__D$h0v12  (.WCLK(\clk~O ), .RCLK(\clk~O ), 
            .WCLKE(1'b1), .WE(\wsctrl/state[3] ), .RE(\~wsinterface/equal_43/n7 ), 
            .WDATA({\w_rgb_data[22] }), .WADDR({10'b0000000000, \w_address[1] , 
            \w_address[0] }), .RADDR({10'b0000000000, \wsinterface/data_count[1] , 
            \wsinterface/data_count[0] }), .RDATA({\wsinterface/n2451 })) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_RAM_5K, READ_WIDTH=1, WRITE_WIDTH=1, WCLK_POLARITY=1'b1, WCLKE_POLARITY=1'b1, WE_POLARITY=1'b1, RCLK_POLARITY=1'b1, RE_POLARITY=1'b1, OUTPUT_REG=1'b0, WRITE_MODE="READ_FIRST", INIT_0=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_1=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_2=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_3=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_4=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_5=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_6=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_7=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_8=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_9=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_A=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_B=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_C=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_D=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_E=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_F=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_10=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_11=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_12=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_13=256'h0000000000000000000000000000000000000000000000000000000000000000, PRESERVE_USER_INIT=1'b0 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(28)
    defparam \wsinterface/led_reg__D$h0v12 .READ_WIDTH = 1;
    defparam \wsinterface/led_reg__D$h0v12 .WRITE_WIDTH = 1;
    defparam \wsinterface/led_reg__D$h0v12 .WCLK_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0v12 .WCLKE_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0v12 .WE_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0v12 .RCLK_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0v12 .RE_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h0v12 .INIT_0 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0v12 .INIT_1 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0v12 .INIT_2 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0v12 .INIT_3 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0v12 .INIT_4 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0v12 .INIT_5 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0v12 .INIT_6 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0v12 .INIT_7 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0v12 .INIT_8 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0v12 .INIT_9 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0v12 .INIT_A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0v12 .INIT_B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0v12 .INIT_C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0v12 .INIT_D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0v12 .INIT_E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0v12 .INIT_F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0v12 .INIT_10 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0v12 .INIT_11 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0v12 .INIT_12 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0v12 .INIT_13 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h0v12 .OUTPUT_REG = 1'b0;
    defparam \wsinterface/led_reg__D$h0v12 .WRITE_MODE = "READ_FIRST";
    EFX_RAM_5K \wsinterface/led_reg__D$h02  (.WCLK(\clk~O ), .RCLK(\clk~O ), 
            .WCLKE(1'b1), .WE(\wsctrl/state[3] ), .RE(\~wsinterface/equal_43/n7 ), 
            .WDATA({\w_rgb_data[0] }), .WADDR({10'b0000000000, \w_address[1] , 
            \w_address[0] }), .RADDR({10'b0000000000, \wsinterface/data_count[1] , 
            \wsinterface/data_count[0] }), .RDATA({\wsinterface/n2517 })) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_RAM_5K, READ_WIDTH=1, WRITE_WIDTH=1, WCLK_POLARITY=1'b1, WCLKE_POLARITY=1'b1, WE_POLARITY=1'b1, RCLK_POLARITY=1'b1, RE_POLARITY=1'b1, OUTPUT_REG=1'b0, WRITE_MODE="READ_FIRST", INIT_0=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_1=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_2=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_3=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_4=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_5=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_6=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_7=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_8=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_9=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_A=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_B=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_C=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_D=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_E=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_F=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_10=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_11=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_12=256'h0000000000000000000000000000000000000000000000000000000000000000, INIT_13=256'h0000000000000000000000000000000000000000000000000000000000000000, PRESERVE_USER_INIT=1'b0 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_interface.v(28)
    defparam \wsinterface/led_reg__D$h02 .READ_WIDTH = 1;
    defparam \wsinterface/led_reg__D$h02 .WRITE_WIDTH = 1;
    defparam \wsinterface/led_reg__D$h02 .WCLK_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h02 .WCLKE_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h02 .WE_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h02 .RCLK_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h02 .RE_POLARITY = 1'b1;
    defparam \wsinterface/led_reg__D$h02 .INIT_0 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h02 .INIT_1 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h02 .INIT_2 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h02 .INIT_3 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h02 .INIT_4 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h02 .INIT_5 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h02 .INIT_6 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h02 .INIT_7 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h02 .INIT_8 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h02 .INIT_9 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h02 .INIT_A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h02 .INIT_B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h02 .INIT_C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h02 .INIT_D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h02 .INIT_E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h02 .INIT_F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h02 .INIT_10 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h02 .INIT_11 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h02 .INIT_12 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h02 .INIT_13 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam \wsinterface/led_reg__D$h02 .OUTPUT_REG = 1'b0;
    defparam \wsinterface/led_reg__D$h02 .WRITE_MODE = "READ_FIRST";
    EFX_LUT4 LUT__1022 (.I0(n686), .I1(n685), .I2(\uartrx/r_Clock_Count[6] ), 
            .O(n687)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0b0b */ ;
    defparam LUT__1022.LUTMASK = 16'h0b0b;
    EFX_LUT4 LUT__1023 (.I0(\uartrx/r_Clock_Count[9] ), .I1(\uartrx/r_Clock_Count[10] ), 
            .O(n688)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h1111 */ ;
    defparam LUT__1023.LUTMASK = 16'h1111;
    EFX_LUT4 LUT__1024 (.I0(n687), .I1(\uartrx/r_Clock_Count[7] ), .I2(\uartrx/r_Clock_Count[8] ), 
            .I3(n688), .O(\uartrx/n55 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hbf00 */ ;
    defparam LUT__1024.LUTMASK = 16'hbf00;
    EFX_LUT4 LUT__1025 (.I0(\uartrx/r_SM_Main[1] ), .I1(\uartrx/r_SM_Main[0] ), 
            .O(\uartrx/n453 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__1025.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__1026 (.I0(\uartrx/r_Clock_Count[8] ), .I1(\uartrx/r_Clock_Count[3] ), 
            .I2(\uartrx/r_Clock_Count[7] ), .I3(\uartrx/r_Clock_Count[0] ), 
            .O(n689)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4000 */ ;
    defparam LUT__1026.LUTMASK = 16'h4000;
    EFX_LUT4 LUT__1027 (.I0(\uartrx/r_Clock_Count[1] ), .I1(\uartrx/r_Clock_Count[2] ), 
            .I2(n688), .I3(n689), .O(n690)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h1000 */ ;
    defparam LUT__1027.LUTMASK = 16'h1000;
    EFX_LUT4 LUT__1028 (.I0(\uartrx/r_Clock_Count[5] ), .I1(\uartrx/r_Clock_Count[4] ), 
            .I2(\uartrx/r_Clock_Count[6] ), .I3(n690), .O(n691)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4000 */ ;
    defparam LUT__1028.LUTMASK = 16'h4000;
    EFX_LUT4 LUT__1029 (.I0(n691), .I1(\uartrx/r_Rx_Data ), .I2(\uartrx/r_SM_Main[0] ), 
            .I3(\uartrx/r_SM_Main[1] ), .O(n692)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h007f */ ;
    defparam LUT__1029.LUTMASK = 16'h007f;
    EFX_LUT4 LUT__1030 (.I0(\uartrx/n453 ), .I1(\uartrx/n55 ), .I2(n692), 
            .O(\uartrx/n365 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0d0d */ ;
    defparam LUT__1030.LUTMASK = 16'h0d0d;
    EFX_LUT4 LUT__1031 (.I0(\uartrx/r_SM_Main[0] ), .I1(\uartrx/r_SM_Main[1] ), 
            .O(n693)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__1031.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__1032 (.I0(\uartrx/r_Bit_Index[1] ), .I1(\uartrx/r_Bit_Index[0] ), 
            .I2(\uartrx/r_Bit_Index[2] ), .I3(n693), .O(n694)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0100 */ ;
    defparam LUT__1032.LUTMASK = 16'h0100;
    EFX_LUT4 LUT__1033 (.I0(\uartrx/n55 ), .I1(n694), .O(\uartrx/n509 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__1033.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__1034 (.I0(n691), .I1(\uartrx/r_SM_Main[0] ), .I2(\uartrx/n55 ), 
            .I3(\uartrx/r_SM_Main[1] ), .O(n695)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0fbb */ ;
    defparam LUT__1034.LUTMASK = 16'h0fbb;
    EFX_LUT4 LUT__1035 (.I0(\uartrx/r_Clock_Count[0] ), .I1(n695), .O(\uartrx/n442 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h1111 */ ;
    defparam LUT__1035.LUTMASK = 16'h1111;
    EFX_LUT4 LUT__1036 (.I0(\uartrx/r_SM_Main[1] ), .I1(\uartrx/r_SM_Main[0] ), 
            .O(n696)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__1036.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__1037 (.I0(\uartrx/r_Rx_Data ), .I1(n691), .I2(n696), 
            .I3(\uartrx/r_SM_Main[2] ), .O(ceg_net63)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hff40 */ ;
    defparam LUT__1037.LUTMASK = 16'hff40;
    EFX_LUT4 LUT__1038 (.I0(\uartrx/r_SM_Main[2] ), .I1(\uartrx/r_SM_Main[1] ), 
            .O(\uartrx/n477 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__1038.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__1039 (.I0(\uartrx/r_SM_Main[2] ), .I1(\uartrx/n55 ), .I2(\uartrx/r_SM_Main[0] ), 
            .I3(\uartrx/r_SM_Main[1] ), .O(ceg_net352)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'heff0 */ ;
    defparam LUT__1039.LUTMASK = 16'heff0;
    EFX_LUT4 LUT__1040 (.I0(\uartrx/r_Bit_Index[1] ), .I1(\uartrx/r_Bit_Index[0] ), 
            .I2(\uartrx/r_SM_Main[1] ), .O(\uartrx/n403 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h6060 */ ;
    defparam LUT__1040.LUTMASK = 16'h6060;
    EFX_LUT4 LUT__1041 (.I0(\uartrx/n55 ), .I1(\uartrx/r_SM_Main[1] ), .I2(\uartrx/r_SM_Main[0] ), 
            .I3(\uartrx/r_SM_Main[2] ), .O(ceg_net230)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hfff8 */ ;
    defparam LUT__1041.LUTMASK = 16'hfff8;
    EFX_LUT4 LUT__1042 (.I0(\uartrx/r_Bit_Index[0] ), .I1(\uartrx/r_SM_Main[1] ), 
            .O(\uartrx/n446 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__1042.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__1043 (.I0(\uartrx/r_Bit_Index[1] ), .I1(\uartrx/r_Bit_Index[0] ), 
            .O(n697)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__1043.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__1044 (.I0(\uartrx/r_Bit_Index[2] ), .I1(n697), .I2(\uartrx/n55 ), 
            .I3(\uartrx/r_SM_Main[0] ), .O(n698)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0ff7 */ ;
    defparam LUT__1044.LUTMASK = 16'h0ff7;
    EFX_LUT4 LUT__1045 (.I0(n691), .I1(\uartrx/r_Rx_Data ), .I2(\uartrx/r_SM_Main[0] ), 
            .O(n699)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'ha3a3 */ ;
    defparam LUT__1045.LUTMASK = 16'ha3a3;
    EFX_LUT4 LUT__1046 (.I0(n699), .I1(n698), .I2(\uartrx/r_SM_Main[1] ), 
            .O(\uartrx/n439 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h3535 */ ;
    defparam LUT__1046.LUTMASK = 16'h3535;
    EFX_LUT4 LUT__1047 (.I0(\uartrx/r_SM_Main[2] ), .I1(\uartrx/r_Bit_Index[2] ), 
            .I2(\uartrx/n55 ), .I3(n693), .O(n700)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0100 */ ;
    defparam LUT__1047.LUTMASK = 16'h0100;
    EFX_LUT4 LUT__1048 (.I0(\uartrx/r_Bit_Index[1] ), .I1(\uartrx/r_Bit_Index[0] ), 
            .I2(n700), .O(\uartrx/n485 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4040 */ ;
    defparam LUT__1048.LUTMASK = 16'h4040;
    EFX_LUT4 LUT__1049 (.I0(\uartrx/r_Bit_Index[0] ), .I1(\uartrx/r_Bit_Index[1] ), 
            .I2(n700), .O(\uartrx/n487 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4040 */ ;
    defparam LUT__1049.LUTMASK = 16'h4040;
    EFX_LUT4 LUT__1050 (.I0(n697), .I1(n700), .O(\uartrx/n489 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__1050.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__1051 (.I0(\uartrx/n55 ), .I1(\uartrx/r_Bit_Index[2] ), 
            .I2(n693), .O(n701)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4040 */ ;
    defparam LUT__1051.LUTMASK = 16'h4040;
    EFX_LUT4 LUT__1052 (.I0(\uartrx/r_SM_Main[2] ), .I1(\uartrx/r_Bit_Index[1] ), 
            .I2(\uartrx/r_Bit_Index[0] ), .I3(n701), .O(\uartrx/n491 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0100 */ ;
    defparam LUT__1052.LUTMASK = 16'h0100;
    EFX_LUT4 LUT__1053 (.I0(\uartrx/r_Bit_Index[1] ), .I1(\uartrx/r_Bit_Index[0] ), 
            .I2(n701), .O(\uartrx/n500 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4040 */ ;
    defparam LUT__1053.LUTMASK = 16'h4040;
    EFX_LUT4 LUT__1054 (.I0(\uartrx/r_Bit_Index[0] ), .I1(\uartrx/r_Bit_Index[1] ), 
            .I2(n701), .O(\uartrx/n503 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4040 */ ;
    defparam LUT__1054.LUTMASK = 16'h4040;
    EFX_LUT4 LUT__1055 (.I0(n697), .I1(n701), .O(\uartrx/n506 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__1055.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__1056 (.I0(n695), .I1(\uartrx/r_Clock_Count[0] ), .I2(\uartrx/r_Clock_Count[1] ), 
            .O(\uartrx/n372 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h1414 */ ;
    defparam LUT__1056.LUTMASK = 16'h1414;
    EFX_LUT4 LUT__1057 (.I0(\uartrx/r_Clock_Count[0] ), .I1(\uartrx/r_Clock_Count[1] ), 
            .O(n702)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__1057.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__1058 (.I0(n695), .I1(\uartrx/r_Clock_Count[2] ), .I2(n702), 
            .O(\uartrx/n375 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h1414 */ ;
    defparam LUT__1058.LUTMASK = 16'h1414;
    EFX_LUT4 LUT__1059 (.I0(\uartrx/r_Clock_Count[2] ), .I1(n702), .I2(n695), 
            .I3(\uartrx/r_Clock_Count[3] ), .O(\uartrx/n378 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0708 */ ;
    defparam LUT__1059.LUTMASK = 16'h0708;
    EFX_LUT4 LUT__1060 (.I0(\uartrx/r_Clock_Count[2] ), .I1(\uartrx/r_Clock_Count[3] ), 
            .I2(n702), .O(n703)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8080 */ ;
    defparam LUT__1060.LUTMASK = 16'h8080;
    EFX_LUT4 LUT__1061 (.I0(n695), .I1(\uartrx/r_Clock_Count[4] ), .I2(n703), 
            .O(\uartrx/n381 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h1414 */ ;
    defparam LUT__1061.LUTMASK = 16'h1414;
    EFX_LUT4 LUT__1062 (.I0(\uartrx/r_Clock_Count[4] ), .I1(n703), .I2(n695), 
            .I3(\uartrx/r_Clock_Count[5] ), .O(\uartrx/n384 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0708 */ ;
    defparam LUT__1062.LUTMASK = 16'h0708;
    EFX_LUT4 LUT__1063 (.I0(n685), .I1(n703), .I2(n695), .I3(\uartrx/r_Clock_Count[6] ), 
            .O(\uartrx/n387 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0708 */ ;
    defparam LUT__1063.LUTMASK = 16'h0708;
    EFX_LUT4 LUT__1064 (.I0(\uartrx/r_Clock_Count[6] ), .I1(n685), .I2(n703), 
            .O(n704)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8080 */ ;
    defparam LUT__1064.LUTMASK = 16'h8080;
    EFX_LUT4 LUT__1065 (.I0(n695), .I1(\uartrx/r_Clock_Count[7] ), .I2(n704), 
            .O(\uartrx/n390 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h1414 */ ;
    defparam LUT__1065.LUTMASK = 16'h1414;
    EFX_LUT4 LUT__1066 (.I0(\uartrx/r_Clock_Count[7] ), .I1(n704), .I2(n695), 
            .I3(\uartrx/r_Clock_Count[8] ), .O(\uartrx/n393 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0708 */ ;
    defparam LUT__1066.LUTMASK = 16'h0708;
    EFX_LUT4 LUT__1067 (.I0(\uartrx/r_Clock_Count[7] ), .I1(\uartrx/r_Clock_Count[8] ), 
            .O(n705)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__1067.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__1068 (.I0(n705), .I1(n704), .I2(\uartrx/r_Clock_Count[9] ), 
            .I3(n696), .O(\uartrx/n396 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h7800 */ ;
    defparam LUT__1068.LUTMASK = 16'h7800;
    EFX_LUT4 LUT__1069 (.I0(\uartrx/r_Clock_Count[9] ), .I1(n705), .O(n706)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__1069.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__1070 (.I0(n704), .I1(n706), .I2(\uartrx/r_Clock_Count[10] ), 
            .I3(n696), .O(\uartrx/n399 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h7800 */ ;
    defparam LUT__1070.LUTMASK = 16'h7800;
    EFX_LUT4 LUT__1071 (.I0(\uartrx/r_Bit_Index[2] ), .I1(n697), .I2(\uartrx/r_SM_Main[1] ), 
            .O(\uartrx/n407 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h6060 */ ;
    defparam LUT__1071.LUTMASK = 16'h6060;
    EFX_LUT4 LUT__1072 (.I0(\ws_wr_fifo/u_efx_fifo_top/waddr[7] ), .I1(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[7] ), 
            .I2(\ws_wr_fifo/u_efx_fifo_top/waddr[8] ), .I3(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[8] ), 
            .O(n707)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h9009 */ ;
    defparam LUT__1072.LUTMASK = 16'h9009;
    EFX_LUT4 LUT__1073 (.I0(\ws_wr_fifo/u_efx_fifo_top/waddr[3] ), .I1(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[3] ), 
            .I2(\ws_wr_fifo/u_efx_fifo_top/waddr[4] ), .I3(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[4] ), 
            .O(n708)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h9009 */ ;
    defparam LUT__1073.LUTMASK = 16'h9009;
    EFX_LUT4 LUT__1074 (.I0(\ws_wr_fifo/u_efx_fifo_top/waddr[0] ), .I1(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[0] ), 
            .I2(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/waddr_cntr[9] ), 
            .I3(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[9] ), 
            .O(n709)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0990 */ ;
    defparam LUT__1074.LUTMASK = 16'h0990;
    EFX_LUT4 LUT__1075 (.I0(\ws_wr_fifo/u_efx_fifo_top/waddr[2] ), .I1(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[2] ), 
            .I2(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[1] ), 
            .I3(\ws_wr_fifo/u_efx_fifo_top/waddr[1] ), .O(n710)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h9009 */ ;
    defparam LUT__1075.LUTMASK = 16'h9009;
    EFX_LUT4 LUT__1076 (.I0(\ws_wr_fifo/u_efx_fifo_top/waddr[5] ), .I1(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[5] ), 
            .I2(\ws_wr_fifo/u_efx_fifo_top/waddr[6] ), .I3(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.genblk1.raddr_cntr_sync_g2b_r[6] ), 
            .O(n711)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h9009 */ ;
    defparam LUT__1076.LUTMASK = 16'h9009;
    EFX_LUT4 LUT__1077 (.I0(n708), .I1(n709), .I2(n710), .I3(n711), 
            .O(n712)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8000 */ ;
    defparam LUT__1077.LUTMASK = 16'h8000;
    EFX_LUT4 LUT__1078 (.I0(n712), .I1(n707), .I2(w_rx_dv), .O(\ws_wr_fifo/u_efx_fifo_top/wr_en_int )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h7070 */ ;
    defparam LUT__1078.LUTMASK = 16'h7070;
    EFX_LUT4 LUT__1079 (.I0(n49), .I1(n293), .I2(n297), .I3(n294), .O(n713)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0100 */ ;
    defparam LUT__1079.LUTMASK = 16'h0100;
    EFX_LUT4 LUT__1080 (.I0(n295), .I1(n299), .I2(n301), .I3(n309), 
            .O(n714)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0001 */ ;
    defparam LUT__1080.LUTMASK = 16'h0001;
    EFX_LUT4 LUT__1081 (.I0(n303), .I1(n305), .I2(n307), .O(n715)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0101 */ ;
    defparam LUT__1081.LUTMASK = 16'h0101;
    EFX_LUT4 LUT__1082 (.I0(n713), .I1(n714), .I2(n715), .O(n716)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8080 */ ;
    defparam LUT__1082.LUTMASK = 16'h8080;
    EFX_LUT4 LUT__1083 (.I0(n716), .I1(w_fifo_rd_en), .O(\ws_wr_fifo/u_efx_fifo_top/rd_en_int )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__1083.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__1084 (.I0(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[8] ), 
            .I1(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[9] ), 
            .O(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_sync_g2b[8] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h6666 */ ;
    defparam LUT__1084.LUTMASK = 16'h6666;
    EFX_LUT4 LUT__1085 (.I0(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[7] ), 
            .I1(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_sync_g2b[8] ), 
            .O(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_sync_g2b[7] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h6666 */ ;
    defparam LUT__1085.LUTMASK = 16'h6666;
    EFX_LUT4 LUT__1086 (.I0(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[4] ), 
            .I1(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[5] ), 
            .I2(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[6] ), 
            .I3(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_sync_g2b[7] ), 
            .O(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_sync_g2b[4] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h6996 */ ;
    defparam LUT__1086.LUTMASK = 16'h6996;
    EFX_LUT4 LUT__1087 (.I0(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[3] ), 
            .I1(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_sync_g2b[4] ), 
            .O(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_sync_g2b[3] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h6666 */ ;
    defparam LUT__1087.LUTMASK = 16'h6666;
    EFX_LUT4 LUT__1088 (.I0(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[0] ), 
            .I1(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[1] ), 
            .I2(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[2] ), 
            .I3(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_sync_g2b[3] ), 
            .O(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_sync_g2b[0] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h6996 */ ;
    defparam LUT__1088.LUTMASK = 16'h6996;
    EFX_LUT4 LUT__1089 (.I0(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[8] ), 
            .I1(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[9] ), 
            .O(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_sync_g2b[8] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h6666 */ ;
    defparam LUT__1089.LUTMASK = 16'h6666;
    EFX_LUT4 LUT__1090 (.I0(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[7] ), 
            .I1(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_sync_g2b[8] ), 
            .O(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_sync_g2b[7] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h6666 */ ;
    defparam LUT__1090.LUTMASK = 16'h6666;
    EFX_LUT4 LUT__1091 (.I0(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[4] ), 
            .I1(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[5] ), 
            .I2(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[6] ), 
            .I3(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_sync_g2b[7] ), 
            .O(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_sync_g2b[4] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h6996 */ ;
    defparam LUT__1091.LUTMASK = 16'h6996;
    EFX_LUT4 LUT__1092 (.I0(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[3] ), 
            .I1(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_sync_g2b[4] ), 
            .O(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_sync_g2b[3] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h6666 */ ;
    defparam LUT__1092.LUTMASK = 16'h6666;
    EFX_LUT4 LUT__1093 (.I0(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[0] ), 
            .I1(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[1] ), 
            .I2(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[2] ), 
            .I3(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_sync_g2b[3] ), 
            .O(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_sync_g2b[0] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h6996 */ ;
    defparam LUT__1093.LUTMASK = 16'h6996;
    EFX_LUT4 LUT__1094 (.I0(\ws_wr_fifo/u_efx_fifo_top/raddr[0] ), .I1(\ws_wr_fifo/u_efx_fifo_top/raddr[1] ), 
            .O(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry[0] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h6666 */ ;
    defparam LUT__1094.LUTMASK = 16'h6666;
    EFX_LUT4 LUT__1095 (.I0(\ws_wr_fifo/u_efx_fifo_top/waddr[1] ), .I1(\ws_wr_fifo/u_efx_fifo_top/waddr[0] ), 
            .O(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry[0] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h6666 */ ;
    defparam LUT__1095.LUTMASK = 16'h6666;
    EFX_LUT4 LUT__1096 (.I0(\wsinterface/state[1] ), .I1(\wsinterface/state[2] ), 
            .O(n717)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h1111 */ ;
    defparam LUT__1096.LUTMASK = 16'h1111;
    EFX_LUT4 LUT__1097 (.I0(\wsinterface/state[0] ), .I1(n717), .O(\~wsinterface/equal_43/n7 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__1097.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__1098 (.I0(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[1] ), 
            .I1(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[2] ), 
            .I2(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_sync_g2b[3] ), 
            .O(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_sync_g2b[1] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h9696 */ ;
    defparam LUT__1098.LUTMASK = 16'h9696;
    EFX_LUT4 LUT__1099 (.I0(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[2] ), 
            .I1(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_sync_g2b[3] ), 
            .O(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_sync_g2b[2] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h6666 */ ;
    defparam LUT__1099.LUTMASK = 16'h6666;
    EFX_LUT4 LUT__1100 (.I0(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[6] ), 
            .I1(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_sync_g2b[7] ), 
            .O(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_sync_g2b[6] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h6666 */ ;
    defparam LUT__1100.LUTMASK = 16'h6666;
    EFX_LUT4 LUT__1101 (.I0(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry_sync[5] ), 
            .I1(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_sync_g2b[6] ), 
            .O(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_sync_g2b[5] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h6666 */ ;
    defparam LUT__1101.LUTMASK = 16'h6666;
    EFX_LUT4 LUT__1102 (.I0(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[1] ), 
            .I1(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[2] ), 
            .I2(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_sync_g2b[3] ), 
            .O(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_sync_g2b[1] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h9696 */ ;
    defparam LUT__1102.LUTMASK = 16'h9696;
    EFX_LUT4 LUT__1103 (.I0(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[2] ), 
            .I1(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_sync_g2b[3] ), 
            .O(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_sync_g2b[2] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h6666 */ ;
    defparam LUT__1103.LUTMASK = 16'h6666;
    EFX_LUT4 LUT__1104 (.I0(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[6] ), 
            .I1(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_sync_g2b[7] ), 
            .O(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_sync_g2b[6] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h6666 */ ;
    defparam LUT__1104.LUTMASK = 16'h6666;
    EFX_LUT4 LUT__1105 (.I0(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry_sync[5] ), 
            .I1(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_sync_g2b[6] ), 
            .O(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_sync_g2b[5] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h6666 */ ;
    defparam LUT__1105.LUTMASK = 16'h6666;
    EFX_LUT4 LUT__1106 (.I0(\ws_wr_fifo/u_efx_fifo_top/raddr[1] ), .I1(\ws_wr_fifo/u_efx_fifo_top/raddr[2] ), 
            .O(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry[1] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h6666 */ ;
    defparam LUT__1106.LUTMASK = 16'h6666;
    EFX_LUT4 LUT__1107 (.I0(\ws_wr_fifo/u_efx_fifo_top/raddr[2] ), .I1(\ws_wr_fifo/u_efx_fifo_top/raddr[3] ), 
            .O(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry[2] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h6666 */ ;
    defparam LUT__1107.LUTMASK = 16'h6666;
    EFX_LUT4 LUT__1108 (.I0(\ws_wr_fifo/u_efx_fifo_top/raddr[3] ), .I1(\ws_wr_fifo/u_efx_fifo_top/raddr[4] ), 
            .O(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry[3] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h6666 */ ;
    defparam LUT__1108.LUTMASK = 16'h6666;
    EFX_LUT4 LUT__1109 (.I0(\ws_wr_fifo/u_efx_fifo_top/raddr[4] ), .I1(\ws_wr_fifo/u_efx_fifo_top/raddr[5] ), 
            .O(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry[4] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h6666 */ ;
    defparam LUT__1109.LUTMASK = 16'h6666;
    EFX_LUT4 LUT__1110 (.I0(\ws_wr_fifo/u_efx_fifo_top/raddr[5] ), .I1(\ws_wr_fifo/u_efx_fifo_top/raddr[6] ), 
            .O(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry[5] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h6666 */ ;
    defparam LUT__1110.LUTMASK = 16'h6666;
    EFX_LUT4 LUT__1111 (.I0(\ws_wr_fifo/u_efx_fifo_top/raddr[6] ), .I1(\ws_wr_fifo/u_efx_fifo_top/raddr[7] ), 
            .O(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry[6] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h6666 */ ;
    defparam LUT__1111.LUTMASK = 16'h6666;
    EFX_LUT4 LUT__1112 (.I0(\ws_wr_fifo/u_efx_fifo_top/raddr[7] ), .I1(\ws_wr_fifo/u_efx_fifo_top/raddr[8] ), 
            .O(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry[7] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h6666 */ ;
    defparam LUT__1112.LUTMASK = 16'h6666;
    EFX_LUT4 LUT__1113 (.I0(\ws_wr_fifo/u_efx_fifo_top/raddr[8] ), .I1(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/raddr_cntr[9] ), 
            .O(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.raddr_cntr_gry[8] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h6666 */ ;
    defparam LUT__1113.LUTMASK = 16'h6666;
    EFX_LUT4 LUT__1114 (.I0(\ws_wr_fifo/u_efx_fifo_top/waddr[2] ), .I1(\ws_wr_fifo/u_efx_fifo_top/waddr[1] ), 
            .O(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry[1] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h6666 */ ;
    defparam LUT__1114.LUTMASK = 16'h6666;
    EFX_LUT4 LUT__1115 (.I0(\ws_wr_fifo/u_efx_fifo_top/waddr[3] ), .I1(\ws_wr_fifo/u_efx_fifo_top/waddr[2] ), 
            .O(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry[2] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h6666 */ ;
    defparam LUT__1115.LUTMASK = 16'h6666;
    EFX_LUT4 LUT__1116 (.I0(\ws_wr_fifo/u_efx_fifo_top/waddr[3] ), .I1(\ws_wr_fifo/u_efx_fifo_top/waddr[4] ), 
            .O(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry[3] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h6666 */ ;
    defparam LUT__1116.LUTMASK = 16'h6666;
    EFX_LUT4 LUT__1117 (.I0(\ws_wr_fifo/u_efx_fifo_top/waddr[4] ), .I1(\ws_wr_fifo/u_efx_fifo_top/waddr[5] ), 
            .O(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry[4] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h6666 */ ;
    defparam LUT__1117.LUTMASK = 16'h6666;
    EFX_LUT4 LUT__1118 (.I0(\ws_wr_fifo/u_efx_fifo_top/waddr[5] ), .I1(\ws_wr_fifo/u_efx_fifo_top/waddr[6] ), 
            .O(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry[5] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h6666 */ ;
    defparam LUT__1118.LUTMASK = 16'h6666;
    EFX_LUT4 LUT__1119 (.I0(\ws_wr_fifo/u_efx_fifo_top/waddr[6] ), .I1(\ws_wr_fifo/u_efx_fifo_top/waddr[7] ), 
            .O(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry[6] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h6666 */ ;
    defparam LUT__1119.LUTMASK = 16'h6666;
    EFX_LUT4 LUT__1120 (.I0(\ws_wr_fifo/u_efx_fifo_top/waddr[7] ), .I1(\ws_wr_fifo/u_efx_fifo_top/waddr[8] ), 
            .O(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry[7] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h6666 */ ;
    defparam LUT__1120.LUTMASK = 16'h6666;
    EFX_LUT4 LUT__1121 (.I0(\ws_wr_fifo/u_efx_fifo_top/waddr[8] ), .I1(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/waddr_cntr[9] ), 
            .O(\ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/genblk7.waddr_cntr_gry[8] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h6666 */ ;
    defparam LUT__1121.LUTMASK = 16'h6666;
    EFX_LUT4 LUT__1122 (.I0(\w_address[0] ), .I1(\w_address[1] ), .O(\wsctrl/n85 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h1111 */ ;
    defparam LUT__1122.LUTMASK = 16'h1111;
    EFX_LUT4 LUT__1123 (.I0(\wsctrl/n124 ), .I1(\wsctrl/n123 ), .I2(\wsctrl/state[2] ), 
            .O(n718)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0101 */ ;
    defparam LUT__1123.LUTMASK = 16'h0101;
    EFX_LUT4 LUT__1124 (.I0(\wsctrl/state[3] ), .I1(n718), .O(\wsctrl/n1252 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h7777 */ ;
    defparam LUT__1124.LUTMASK = 16'h7777;
    EFX_LUT4 LUT__1125 (.I0(\wsctrl/n123 ), .I1(\wsctrl/n124 ), .I2(\wsctrl/state[3] ), 
            .I3(\wsctrl/state[2] ), .O(\wsctrl/n119 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0305 */ ;
    defparam LUT__1125.LUTMASK = 16'h0305;
    EFX_LUT4 LUT__1126 (.I0(\wsctrl/length[0] ), .I1(\wsctrl/length[1] ), 
            .I2(\wsctrl/length[2] ), .I3(\wsctrl/length[3] ), .O(n719)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0001 */ ;
    defparam LUT__1126.LUTMASK = 16'h0001;
    EFX_LUT4 LUT__1127 (.I0(\wsctrl/length[4] ), .I1(\wsctrl/length[5] ), 
            .I2(n719), .O(n720)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h1010 */ ;
    defparam LUT__1127.LUTMASK = 16'h1010;
    EFX_LUT4 LUT__1128 (.I0(\wsctrl/length[6] ), .I1(\wsctrl/length[7] ), 
            .I2(n720), .O(n721)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h1010 */ ;
    defparam LUT__1128.LUTMASK = 16'h1010;
    EFX_LUT4 LUT__1129 (.I0(\wsctrl/state[2] ), .I1(\wsctrl/n124 ), .I2(\wsctrl/n123 ), 
            .O(n722)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4b4b */ ;
    defparam LUT__1129.LUTMASK = 16'h4b4b;
    EFX_LUT4 LUT__1130 (.I0(n721), .I1(n718), .I2(n722), .I3(\wsctrl/state[3] ), 
            .O(ceg_net392)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hbb0f */ ;
    defparam LUT__1130.LUTMASK = 16'hbb0f;
    EFX_LUT4 LUT__1131 (.I0(\wsctrl/post_wait_state[0] ), .I1(\wsctrl/n124 ), 
            .I2(\wsctrl/state[2] ), .I3(\wsctrl/n123 ), .O(n723)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0100 */ ;
    defparam LUT__1131.LUTMASK = 16'h0100;
    EFX_LUT4 LUT__1132 (.I0(n716), .I1(\wsctrl/n123 ), .I2(\wsctrl/state[2] ), 
            .I3(\wsctrl/n124 ), .O(n724)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hc100 */ ;
    defparam LUT__1132.LUTMASK = 16'hc100;
    EFX_LUT4 LUT__1133 (.I0(\wsctrl/state[0]~FF_brt_0_q ), .I1(\wsctrl/state[0]~FF_brt_1_q ), 
            .I2(\wsctrl/state[0]~FF_brt_2_q ), .I3(\wsctrl/state[0]~FF_brt_3_q ), 
            .O(\wsctrl/n124 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0f11 */ ;
    defparam LUT__1133.LUTMASK = 16'h0f11;
    EFX_LUT4 LUT__1134 (.I0(n718), .I1(\wsctrl/state[3] ), .O(ceg_net85)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__1134.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__1135 (.I0(\w_fifo_rd_data[0] ), .I1(\wsctrl/n123 ), .I2(\wsctrl/length[0] ), 
            .I3(\wsctrl/state[2] ), .O(\wsctrl/n910 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0f88 */ ;
    defparam LUT__1135.LUTMASK = 16'h0f88;
    EFX_LUT4 LUT__1136 (.I0(\wsctrl/state[2] ), .I1(\wsctrl/state[3] ), 
            .I2(\wsctrl/n124 ), .I3(\wsctrl/n123 ), .O(ceg_net389)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hcffe */ ;
    defparam LUT__1136.LUTMASK = 16'hcffe;
    EFX_LUT4 LUT__1137 (.I0(\w_fifo_rd_data[0] ), .I1(\wsctrl/state[2] ), 
            .O(\wsctrl/n769 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__1137.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__1138 (.I0(\wsctrl/n124 ), .I1(\wsctrl/state[3] ), .I2(\wsctrl/state[2] ), 
            .I3(\wsctrl/n123 ), .O(ceg_net317)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'heffe */ ;
    defparam LUT__1138.LUTMASK = 16'heffe;
    EFX_LUT4 LUT__1139 (.I0(\wsctrl/state[2] ), .I1(\wsctrl/state[3] ), 
            .O(n725)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h1111 */ ;
    defparam LUT__1139.LUTMASK = 16'h1111;
    EFX_LUT4 LUT__1140 (.I0(n716), .I1(\wsctrl/n123 ), .I2(\wsctrl/n124 ), 
            .I3(n725), .O(ceg_net246)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'he3ff */ ;
    defparam LUT__1140.LUTMASK = 16'he3ff;
    EFX_LUT4 LUT__1141 (.I0(\uartrx/r_Rx_Byte[0] ), .I1(w_rx_dv), .O(\w_rx_byte[0] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__1141.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__1142 (.I0(w_rx_dv), .I1(\uartrx/r_Rx_Byte[1] ), .O(\w_rx_byte[1] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__1142.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__1143 (.I0(w_rx_dv), .I1(\uartrx/r_Rx_Byte[2] ), .O(\w_rx_byte[2] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__1143.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__1144 (.I0(w_rx_dv), .I1(\uartrx/r_Rx_Byte[3] ), .O(\w_rx_byte[3] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__1144.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__1145 (.I0(w_rx_dv), .I1(\uartrx/r_Rx_Byte[4] ), .O(\w_rx_byte[4] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__1145.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__1146 (.I0(w_rx_dv), .I1(\uartrx/r_Rx_Byte[5] ), .O(\w_rx_byte[5] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__1146.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__1147 (.I0(w_rx_dv), .I1(\uartrx/r_Rx_Byte[6] ), .O(\w_rx_byte[6] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__1147.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__1148 (.I0(w_rx_dv), .I1(\uartrx/r_Rx_Byte[7] ), .O(\w_rx_byte[7] )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__1148.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__1149 (.I0(\w_address[1] ), .I1(\w_address[0] ), .O(\wsctrl/n84 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__1149.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__1150 (.I0(\wsctrl/n123 ), .I1(\wsctrl/n124 ), .I2(\wsctrl/state[3] ), 
            .I3(\wsctrl/state[2] ), .O(\wsctrl/n118 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0c05 */ ;
    defparam LUT__1150.LUTMASK = 16'h0c05;
    EFX_LUT4 LUT__1151 (.I0(\wsctrl/n123 ), .I1(n725), .O(\wsctrl/n117 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hbbbb */ ;
    defparam LUT__1151.LUTMASK = 16'hbbbb;
    EFX_LUT4 LUT__1152 (.I0(\wsctrl/n123 ), .I1(\wsctrl/state[2] ), .I2(n716), 
            .I3(\wsctrl/n124 ), .O(n726)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0100 */ ;
    defparam LUT__1152.LUTMASK = 16'h0100;
    EFX_LUT4 LUT__1153 (.I0(\wsctrl/n124 ), .I1(\wsctrl/n123 ), .O(n727)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__1153.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__1154 (.I0(\wsctrl/state[2] ), .I1(\wsctrl/post_wait_state[1] ), 
            .I2(n727), .O(n728)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'he0e0 */ ;
    defparam LUT__1154.LUTMASK = 16'he0e0;
    EFX_LUT4 LUT__1155 (.I0(\wsctrl/state[1]~FF_brt_4_q ), .I1(\wsctrl/state[1]~FF_brt_5_q ), 
            .I2(\wsctrl/state[0]~FF_brt_3_q ), .O(\wsctrl/n123 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0e0e */ ;
    defparam LUT__1155.LUTMASK = 16'h0e0e;
    EFX_LUT4 LUT__1156 (.I0(\wsctrl/state[2] ), .I1(\wsctrl/post_wait_state[2] ), 
            .I2(\wsctrl/state[3] ), .I3(n727), .O(\wsctrl/n122 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0e00 */ ;
    defparam LUT__1156.LUTMASK = 16'h0e00;
    EFX_LUT4 LUT__1157 (.I0(\wsctrl/state[3] ), .I1(\wsctrl/n123 ), .I2(\wsctrl/state[2] ), 
            .I3(\wsctrl/n124 ), .O(\wsctrl/n121 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4000 */ ;
    defparam LUT__1157.LUTMASK = 16'h4000;
    EFX_LUT4 LUT__1158 (.I0(\wsctrl/length[0] ), .I1(\wsctrl/length[1] ), 
            .O(n729)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h9999 */ ;
    defparam LUT__1158.LUTMASK = 16'h9999;
    EFX_LUT4 LUT__1159 (.I0(\wsctrl/n123 ), .I1(\w_fifo_rd_data[1] ), .I2(n729), 
            .I3(\wsctrl/state[2] ), .O(\wsctrl/n631 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hf088 */ ;
    defparam LUT__1159.LUTMASK = 16'hf088;
    EFX_LUT4 LUT__1160 (.I0(\wsctrl/length[0] ), .I1(\wsctrl/length[1] ), 
            .I2(\wsctrl/length[2] ), .O(n730)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'he1e1 */ ;
    defparam LUT__1160.LUTMASK = 16'he1e1;
    EFX_LUT4 LUT__1161 (.I0(\wsctrl/n123 ), .I1(\w_fifo_rd_data[2] ), .I2(n730), 
            .I3(\wsctrl/state[2] ), .O(\wsctrl/n638 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hf088 */ ;
    defparam LUT__1161.LUTMASK = 16'hf088;
    EFX_LUT4 LUT__1162 (.I0(\wsctrl/length[0] ), .I1(\wsctrl/length[1] ), 
            .I2(\wsctrl/length[2] ), .I3(\wsctrl/length[3] ), .O(n731)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hfe01 */ ;
    defparam LUT__1162.LUTMASK = 16'hfe01;
    EFX_LUT4 LUT__1163 (.I0(\wsctrl/n123 ), .I1(\w_fifo_rd_data[3] ), .I2(n731), 
            .I3(\wsctrl/state[2] ), .O(\wsctrl/n645 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hf088 */ ;
    defparam LUT__1163.LUTMASK = 16'hf088;
    EFX_LUT4 LUT__1164 (.I0(\w_fifo_rd_data[4] ), .I1(\wsctrl/n123 ), .O(n732)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__1164.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__1165 (.I0(n732), .I1(\wsctrl/length[4] ), .I2(n719), 
            .I3(\wsctrl/state[2] ), .O(\wsctrl/n652 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h3caa */ ;
    defparam LUT__1165.LUTMASK = 16'h3caa;
    EFX_LUT4 LUT__1166 (.I0(\wsctrl/length[4] ), .I1(n719), .I2(\wsctrl/length[5] ), 
            .O(n733)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4b4b */ ;
    defparam LUT__1166.LUTMASK = 16'h4b4b;
    EFX_LUT4 LUT__1167 (.I0(\wsctrl/n123 ), .I1(\w_fifo_rd_data[5] ), .I2(n733), 
            .I3(\wsctrl/state[2] ), .O(\wsctrl/n659 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0f88 */ ;
    defparam LUT__1167.LUTMASK = 16'h0f88;
    EFX_LUT4 LUT__1168 (.I0(\w_fifo_rd_data[6] ), .I1(\wsctrl/n123 ), .O(n734)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__1168.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__1169 (.I0(n734), .I1(\wsctrl/length[6] ), .I2(n720), 
            .I3(\wsctrl/state[2] ), .O(\wsctrl/n666 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h3caa */ ;
    defparam LUT__1169.LUTMASK = 16'h3caa;
    EFX_LUT4 LUT__1170 (.I0(\wsctrl/length[6] ), .I1(n720), .I2(\wsctrl/length[7] ), 
            .O(n735)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4b4b */ ;
    defparam LUT__1170.LUTMASK = 16'h4b4b;
    EFX_LUT4 LUT__1171 (.I0(\wsctrl/n123 ), .I1(\w_fifo_rd_data[7] ), .I2(n735), 
            .I3(\wsctrl/state[2] ), .O(\wsctrl/n673 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0f88 */ ;
    defparam LUT__1171.LUTMASK = 16'h0f88;
    EFX_LUT4 LUT__1172 (.I0(\w_fifo_rd_data[1] ), .I1(\wsctrl/state[2] ), 
            .O(\wsctrl/n775 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__1172.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__1173 (.I0(\w_fifo_rd_data[2] ), .I1(\wsctrl/state[2] ), 
            .O(\wsctrl/n781 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__1173.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__1174 (.I0(\w_fifo_rd_data[3] ), .I1(\wsctrl/state[2] ), 
            .O(\wsctrl/n787 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__1174.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__1175 (.I0(\w_fifo_rd_data[4] ), .I1(\wsctrl/state[2] ), 
            .O(\wsctrl/n793 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__1175.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__1176 (.I0(\w_fifo_rd_data[5] ), .I1(\wsctrl/state[2] ), 
            .O(\wsctrl/n799 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__1176.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__1177 (.I0(\w_fifo_rd_data[6] ), .I1(\wsctrl/state[2] ), 
            .O(\wsctrl/n805 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__1177.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__1178 (.I0(\w_fifo_rd_data[7] ), .I1(\wsctrl/state[2] ), 
            .O(\wsctrl/n811 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__1178.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__1179 (.I0(\wsctrl/n123 ), .I1(\wsctrl/state[3] ), .I2(\wsctrl/state[2] ), 
            .I3(\wsctrl/n124 ), .O(ceg_net341)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'heffe */ ;
    defparam LUT__1179.LUTMASK = 16'heffe;
    EFX_LUT4 LUT__1180 (.I0(\wsctrl/n124 ), .I1(\wsctrl/n123 ), .I2(\wsctrl/state[3] ), 
            .O(ceg_net350)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hfefe */ ;
    defparam LUT__1180.LUTMASK = 16'hfefe;
    EFX_LUT4 LUT__1181 (.I0(\wsinterface/reset_count[0] ), .I1(\wsinterface/reset_count[1] ), 
            .I2(\wsinterface/reset_count[2] ), .I3(\wsinterface/reset_count[3] ), 
            .O(n736)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0001 */ ;
    defparam LUT__1181.LUTMASK = 16'h0001;
    EFX_LUT4 LUT__1182 (.I0(\wsinterface/reset_count[4] ), .I1(\wsinterface/reset_count[5] ), 
            .I2(\wsinterface/reset_count[6] ), .I3(\wsinterface/reset_count[7] ), 
            .O(n737)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0001 */ ;
    defparam LUT__1182.LUTMASK = 16'h0001;
    EFX_LUT4 LUT__1183 (.I0(\wsinterface/reset_count[8] ), .I1(\wsinterface/reset_count[9] ), 
            .I2(\wsinterface/reset_count[10] ), .I3(\wsinterface/reset_count[11] ), 
            .O(n738)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0001 */ ;
    defparam LUT__1183.LUTMASK = 16'h0001;
    EFX_LUT4 LUT__1184 (.I0(\wsinterface/reset_count[12] ), .I1(\wsinterface/reset_count[13] ), 
            .I2(\wsinterface/reset_count[14] ), .I3(\wsinterface/reset_count[15] ), 
            .O(n739)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0001 */ ;
    defparam LUT__1184.LUTMASK = 16'h0001;
    EFX_LUT4 LUT__1185 (.I0(n736), .I1(n737), .I2(n738), .I3(n739), 
            .O(n740)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8000 */ ;
    defparam LUT__1185.LUTMASK = 16'h8000;
    EFX_LUT4 LUT__1186 (.I0(\wsinterface/reset_count[16] ), .I1(\wsinterface/reset_count[17] ), 
            .I2(\wsinterface/reset_count[18] ), .O(n741)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0101 */ ;
    defparam LUT__1186.LUTMASK = 16'h0101;
    EFX_LUT4 LUT__1187 (.I0(\wsinterface/reset_count[21] ), .I1(\wsinterface/reset_count[22] ), 
            .I2(\wsinterface/reset_count[23] ), .I3(\wsinterface/reset_count[24] ), 
            .O(n742)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0001 */ ;
    defparam LUT__1187.LUTMASK = 16'h0001;
    EFX_LUT4 LUT__1188 (.I0(\wsinterface/reset_count[19] ), .I1(\wsinterface/reset_count[20] ), 
            .I2(n741), .I3(n742), .O(n743)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h1000 */ ;
    defparam LUT__1188.LUTMASK = 16'h1000;
    EFX_LUT4 LUT__1189 (.I0(\wsinterface/reset_count[25] ), .I1(\wsinterface/reset_count[26] ), 
            .I2(\wsinterface/reset_count[27] ), .I3(\wsinterface/reset_count[28] ), 
            .O(n744)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0001 */ ;
    defparam LUT__1189.LUTMASK = 16'h0001;
    EFX_LUT4 LUT__1190 (.I0(\wsinterface/reset_count[29] ), .I1(\wsinterface/reset_count[30] ), 
            .I2(n744), .O(n745)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h1010 */ ;
    defparam LUT__1190.LUTMASK = 16'h1010;
    EFX_LUT4 LUT__1191 (.I0(\wsinterface/reset_count[31] ), .I1(n740), .I2(n743), 
            .I3(n745), .O(n746)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4000 */ ;
    defparam LUT__1191.LUTMASK = 16'h4000;
    EFX_LUT4 LUT__1192 (.I0(\wsinterface/state[0] ), .I1(\wsinterface/state[1] ), 
            .I2(\wsinterface/state[2] ), .O(n747)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h6060 */ ;
    defparam LUT__1192.LUTMASK = 16'h6060;
    EFX_LUT4 LUT__1193 (.I0(n746), .I1(\wsinterface/state[1] ), .I2(n747), 
            .O(n748)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hd0d0 */ ;
    defparam LUT__1193.LUTMASK = 16'hd0d0;
    EFX_LUT4 LUT__1194 (.I0(\wsinterface/reset_count[0] ), .I1(n748), .O(\wsinterface/select_51/Select_0/n11 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__1194.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__1195 (.I0(\wsinterface/state[1] ), .I1(n746), .I2(\wsinterface/state[2] ), 
            .O(n749)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h1010 */ ;
    defparam LUT__1195.LUTMASK = 16'h1010;
    EFX_LUT4 LUT__1196 (.I0(\wsinterface/high_count[0] ), .I1(\wsinterface/high_count[1] ), 
            .I2(\wsinterface/high_count[2] ), .I3(\wsinterface/high_count[3] ), 
            .O(n750)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0001 */ ;
    defparam LUT__1196.LUTMASK = 16'h0001;
    EFX_LUT4 LUT__1197 (.I0(\wsinterface/high_count[4] ), .I1(n750), .O(n751)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__1197.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__1198 (.I0(\wsinterface/high_count[5] ), .I1(\wsinterface/high_count[6] ), 
            .I2(\wsinterface/high_count[7] ), .O(n752)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0101 */ ;
    defparam LUT__1198.LUTMASK = 16'h0101;
    EFX_LUT4 LUT__1199 (.I0(\wsinterface/high_count[8] ), .I1(\wsinterface/high_count[9] ), 
            .I2(n751), .I3(n752), .O(n753)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h1000 */ ;
    defparam LUT__1199.LUTMASK = 16'h1000;
    EFX_LUT4 LUT__1200 (.I0(\wsinterface/state[2] ), .I1(\wsinterface/high_count[10] ), 
            .I2(n753), .I3(\wsinterface/state[1] ), .O(n754)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hef00 */ ;
    defparam LUT__1200.LUTMASK = 16'hef00;
    EFX_LUT4 LUT__1201 (.I0(\wsinterface/low_count[0] ), .I1(\wsinterface/low_count[1] ), 
            .I2(\wsinterface/low_count[2] ), .I3(\wsinterface/low_count[3] ), 
            .O(n755)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0001 */ ;
    defparam LUT__1201.LUTMASK = 16'h0001;
    EFX_LUT4 LUT__1202 (.I0(\wsinterface/low_count[7] ), .I1(\wsinterface/low_count[8] ), 
            .I2(\wsinterface/low_count[9] ), .I3(\wsinterface/low_count[10] ), 
            .O(n756)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0001 */ ;
    defparam LUT__1202.LUTMASK = 16'h0001;
    EFX_LUT4 LUT__1203 (.I0(\wsinterface/low_count[4] ), .I1(\wsinterface/low_count[5] ), 
            .I2(\wsinterface/low_count[6] ), .O(n757)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0101 */ ;
    defparam LUT__1203.LUTMASK = 16'h0101;
    EFX_LUT4 LUT__1204 (.I0(n755), .I1(n756), .I2(n757), .O(n758)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8080 */ ;
    defparam LUT__1204.LUTMASK = 16'h8080;
    EFX_LUT4 LUT__1205 (.I0(\wsinterface/rgb_counter[0] ), .I1(\wsinterface/rgb_counter[1] ), 
            .O(n759)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h1111 */ ;
    defparam LUT__1205.LUTMASK = 16'h1111;
    EFX_LUT4 LUT__1206 (.I0(\wsinterface/rgb_counter[2] ), .I1(\wsinterface/rgb_counter[3] ), 
            .O(n760)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h1111 */ ;
    defparam LUT__1206.LUTMASK = 16'h1111;
    EFX_LUT4 LUT__1207 (.I0(\wsinterface/rgb_counter[4] ), .I1(n759), .I2(n760), 
            .O(n761)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4040 */ ;
    defparam LUT__1207.LUTMASK = 16'h4040;
    EFX_LUT4 LUT__1208 (.I0(n758), .I1(n761), .O(n762)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__1208.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__1209 (.I0(n762), .I1(\wsinterface/state[1] ), .I2(\wsinterface/state[2] ), 
            .O(n763)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hd0d0 */ ;
    defparam LUT__1209.LUTMASK = 16'hd0d0;
    EFX_LUT4 LUT__1210 (.I0(n754), .I1(n749), .I2(n763), .I3(\wsinterface/state[0] ), 
            .O(\wsinterface/n454 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hee0f */ ;
    defparam LUT__1210.LUTMASK = 16'hee0f;
    EFX_LUT4 LUT__1211 (.I0(\wsinterface/state[0] ), .I1(\wsinterface/state[1] ), 
            .O(n764)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h1111 */ ;
    defparam LUT__1211.LUTMASK = 16'h1111;
    EFX_LUT4 LUT__1212 (.I0(\wsinterface/state[2] ), .I1(n764), .O(n765)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__1212.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__1213 (.I0(n761), .I1(\wsinterface/rgb_counter[0] ), .I2(n758), 
            .I3(n765), .O(n766)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h1c00 */ ;
    defparam LUT__1213.LUTMASK = 16'h1c00;
    EFX_LUT4 LUT__1214 (.I0(\wsinterface/state[2] ), .I1(\wsinterface/state[0] ), 
            .I2(\wsinterface/rgb_counter[0] ), .I3(\wsinterface/state[1] ), 
            .O(n767)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8fab */ ;
    defparam LUT__1214.LUTMASK = 16'h8fab;
    EFX_LUT4 LUT__1215 (.I0(n766), .I1(n767), .O(\wsinterface/n485 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hbbbb */ ;
    defparam LUT__1215.LUTMASK = 16'hbbbb;
    EFX_LUT4 LUT__1216 (.I0(\wsinterface/state[2] ), .I1(\wsinterface/state[1] ), 
            .O(n768)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__1216.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__1217 (.I0(\wsinterface/state[0] ), .I1(\wsinterface/high_count[0] ), 
            .I2(n768), .O(\wsinterface/n497 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h2c2c */ ;
    defparam LUT__1217.LUTMASK = 16'h2c2c;
    EFX_LUT4 LUT__1218 (.I0(n768), .I1(n765), .I2(\wsinterface/low_count[0] ), 
            .O(\wsinterface/n509 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h1c1c */ ;
    defparam LUT__1218.LUTMASK = 16'h1c1c;
    EFX_LUT4 LUT__1219 (.I0(\wsinterface/data_count[0] ), .I1(\wsinterface/data_count[1] ), 
            .O(\wsinterface/n153 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h1111 */ ;
    defparam LUT__1219.LUTMASK = 16'h1111;
    EFX_LUT4 LUT__1220 (.I0(n762), .I1(n765), .O(\~wsinterface/select_52/Select_0/n4 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h7777 */ ;
    defparam LUT__1220.LUTMASK = 16'h7777;
    EFX_LUT4 LUT__1221 (.I0(\wsinterface/state[0] ), .I1(n768), .O(\~wsinterface/equal_45/n7 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__1221.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__1222 (.I0(\wsinterface/state[2] ), .I1(\wsinterface/state[0] ), 
            .I2(\wsinterface/state[1] ), .I3(\wsinterface/led_counter[0] ), 
            .O(n769)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h7c00 */ ;
    defparam LUT__1222.LUTMASK = 16'h7c00;
    EFX_LUT4 LUT__1223 (.I0(\wsinterface/led_counter[0] ), .I1(\wsinterface/led_counter[1] ), 
            .I2(\wsinterface/led_counter[2] ), .I3(\wsinterface/led_counter[3] ), 
            .O(n770)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h007f */ ;
    defparam LUT__1223.LUTMASK = 16'h007f;
    EFX_LUT4 LUT__1224 (.I0(n770), .I1(\wsinterface/led_counter[4] ), .I2(\wsinterface/led_counter[5] ), 
            .I3(\wsinterface/led_counter[6] ), .O(n771)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hf400 */ ;
    defparam LUT__1224.LUTMASK = 16'hf400;
    EFX_LUT4 LUT__1225 (.I0(n771), .I1(n761), .I2(n758), .O(n772)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4040 */ ;
    defparam LUT__1225.LUTMASK = 16'h4040;
    EFX_LUT4 LUT__1226 (.I0(n769), .I1(\wsinterface/led_counter[0] ), .I2(n772), 
            .I3(n765), .O(\wsinterface/n416 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hbeaa */ ;
    defparam LUT__1226.LUTMASK = 16'hbeaa;
    EFX_LUT4 LUT__1227 (.I0(\wsinterface/reset_count[0] ), .I1(\wsinterface/reset_count[1] ), 
            .I2(n748), .O(\wsinterface/select_51/Select_1/n11 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h9090 */ ;
    defparam LUT__1227.LUTMASK = 16'h9090;
    EFX_LUT4 LUT__1228 (.I0(\wsinterface/reset_count[0] ), .I1(\wsinterface/reset_count[1] ), 
            .I2(\wsinterface/reset_count[2] ), .I3(n748), .O(\wsinterface/select_51/Select_2/n11 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'he100 */ ;
    defparam LUT__1228.LUTMASK = 16'he100;
    EFX_LUT4 LUT__1229 (.I0(\wsinterface/reset_count[3] ), .I1(n764), .I2(\wsinterface/state[2] ), 
            .O(n773)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h7171 */ ;
    defparam LUT__1229.LUTMASK = 16'h7171;
    EFX_LUT4 LUT__1230 (.I0(\wsinterface/reset_count[0] ), .I1(\wsinterface/reset_count[1] ), 
            .I2(\wsinterface/reset_count[2] ), .O(n774)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0101 */ ;
    defparam LUT__1230.LUTMASK = 16'h0101;
    EFX_LUT4 LUT__1231 (.I0(n773), .I1(\wsinterface/reset_count[3] ), .I2(n774), 
            .I3(n748), .O(\wsinterface/n446 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h7d55 */ ;
    defparam LUT__1231.LUTMASK = 16'h7d55;
    EFX_LUT4 LUT__1232 (.I0(\wsinterface/reset_count[4] ), .I1(n764), .I2(\wsinterface/state[2] ), 
            .O(n775)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h7171 */ ;
    defparam LUT__1232.LUTMASK = 16'h7171;
    EFX_LUT4 LUT__1233 (.I0(n775), .I1(\wsinterface/reset_count[4] ), .I2(n736), 
            .I3(n748), .O(\wsinterface/n445 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h7d55 */ ;
    defparam LUT__1233.LUTMASK = 16'h7d55;
    EFX_LUT4 LUT__1234 (.I0(\wsinterface/reset_count[4] ), .I1(n736), .O(n776)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__1234.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__1235 (.I0(\wsinterface/reset_count[5] ), .I1(n776), .I2(n748), 
            .O(\wsinterface/select_51/Select_5/n11 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h6060 */ ;
    defparam LUT__1235.LUTMASK = 16'h6060;
    EFX_LUT4 LUT__1236 (.I0(\wsinterface/reset_count[5] ), .I1(n776), .I2(\wsinterface/reset_count[6] ), 
            .I3(n747), .O(\wsinterface/select_51/Select_6/n11 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hb400 */ ;
    defparam LUT__1236.LUTMASK = 16'hb400;
    EFX_LUT4 LUT__1237 (.I0(\wsinterface/reset_count[13] ), .I1(n764), .I2(\wsinterface/state[2] ), 
            .O(n777)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h7171 */ ;
    defparam LUT__1237.LUTMASK = 16'h7171;
    EFX_LUT4 LUT__1238 (.I0(\wsinterface/reset_count[5] ), .I1(\wsinterface/reset_count[6] ), 
            .O(n778)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h1111 */ ;
    defparam LUT__1238.LUTMASK = 16'h1111;
    EFX_LUT4 LUT__1239 (.I0(n778), .I1(n776), .O(n779)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__1239.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__1240 (.I0(n777), .I1(\wsinterface/reset_count[7] ), .I2(n779), 
            .I3(n747), .O(\wsinterface/n442 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h7d55 */ ;
    defparam LUT__1240.LUTMASK = 16'h7d55;
    EFX_LUT4 LUT__1241 (.I0(n736), .I1(n737), .O(n780)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__1241.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__1242 (.I0(\wsinterface/reset_count[8] ), .I1(n780), .I2(n747), 
            .O(\wsinterface/select_51/Select_8/n11 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h6060 */ ;
    defparam LUT__1242.LUTMASK = 16'h6060;
    EFX_LUT4 LUT__1243 (.I0(\wsinterface/reset_count[8] ), .I1(n780), .I2(\wsinterface/reset_count[9] ), 
            .O(n781)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4b4b */ ;
    defparam LUT__1243.LUTMASK = 16'h4b4b;
    EFX_LUT4 LUT__1244 (.I0(\wsinterface/reset_count[9] ), .I1(n764), .I2(\wsinterface/state[2] ), 
            .O(n782)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h7171 */ ;
    defparam LUT__1244.LUTMASK = 16'h7171;
    EFX_LUT4 LUT__1245 (.I0(n781), .I1(n748), .I2(n782), .O(\wsinterface/n440 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4f4f */ ;
    defparam LUT__1245.LUTMASK = 16'h4f4f;
    EFX_LUT4 LUT__1246 (.I0(\wsinterface/state[2] ), .I1(n764), .O(n783)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h9999 */ ;
    defparam LUT__1246.LUTMASK = 16'h9999;
    EFX_LUT4 LUT__1247 (.I0(\wsinterface/reset_count[8] ), .I1(\wsinterface/reset_count[9] ), 
            .I2(n780), .O(n784)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h1010 */ ;
    defparam LUT__1247.LUTMASK = 16'h1010;
    EFX_LUT4 LUT__1248 (.I0(n783), .I1(n784), .I2(n748), .I3(\wsinterface/reset_count[10] ), 
            .O(\wsinterface/n439 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hbac0 */ ;
    defparam LUT__1248.LUTMASK = 16'hbac0;
    EFX_LUT4 LUT__1249 (.I0(\wsinterface/reset_count[10] ), .I1(n784), .I2(\wsinterface/reset_count[11] ), 
            .O(n785)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4b4b */ ;
    defparam LUT__1249.LUTMASK = 16'h4b4b;
    EFX_LUT4 LUT__1250 (.I0(n785), .I1(n748), .I2(n782), .O(\wsinterface/n438 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4f4f */ ;
    defparam LUT__1250.LUTMASK = 16'h4f4f;
    EFX_LUT4 LUT__1251 (.I0(n780), .I1(n738), .I2(\wsinterface/reset_count[12] ), 
            .O(n786)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8787 */ ;
    defparam LUT__1251.LUTMASK = 16'h8787;
    EFX_LUT4 LUT__1252 (.I0(n786), .I1(n748), .I2(n782), .O(\wsinterface/n437 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4f4f */ ;
    defparam LUT__1252.LUTMASK = 16'h4f4f;
    EFX_LUT4 LUT__1253 (.I0(\wsinterface/reset_count[12] ), .I1(n780), .I2(n738), 
            .O(n787)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4040 */ ;
    defparam LUT__1253.LUTMASK = 16'h4040;
    EFX_LUT4 LUT__1254 (.I0(n777), .I1(\wsinterface/reset_count[13] ), .I2(n787), 
            .I3(n747), .O(\wsinterface/n436 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h7d55 */ ;
    defparam LUT__1254.LUTMASK = 16'h7d55;
    EFX_LUT4 LUT__1255 (.I0(\wsinterface/reset_count[13] ), .I1(n787), .O(n788)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__1255.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__1256 (.I0(\wsinterface/reset_count[14] ), .I1(n788), .I2(n747), 
            .O(\wsinterface/select_51/Select_14/n11 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h6060 */ ;
    defparam LUT__1256.LUTMASK = 16'h6060;
    EFX_LUT4 LUT__1257 (.I0(\wsinterface/reset_count[14] ), .I1(n788), .I2(\wsinterface/reset_count[15] ), 
            .I3(n747), .O(\wsinterface/select_51/Select_15/n11 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hb400 */ ;
    defparam LUT__1257.LUTMASK = 16'hb400;
    EFX_LUT4 LUT__1258 (.I0(n783), .I1(n740), .I2(n748), .I3(\wsinterface/reset_count[16] ), 
            .O(\wsinterface/n433 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hbac0 */ ;
    defparam LUT__1258.LUTMASK = 16'hbac0;
    EFX_LUT4 LUT__1259 (.I0(\wsinterface/reset_count[16] ), .I1(n740), .O(n789)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__1259.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__1260 (.I0(n783), .I1(n789), .I2(n748), .I3(\wsinterface/reset_count[17] ), 
            .O(\wsinterface/n432 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hbac0 */ ;
    defparam LUT__1260.LUTMASK = 16'hbac0;
    EFX_LUT4 LUT__1261 (.I0(\wsinterface/reset_count[16] ), .I1(\wsinterface/reset_count[17] ), 
            .O(n790)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h1111 */ ;
    defparam LUT__1261.LUTMASK = 16'h1111;
    EFX_LUT4 LUT__1262 (.I0(n740), .I1(n790), .I2(\wsinterface/reset_count[18] ), 
            .I3(n747), .O(\wsinterface/select_51/Select_18/n11 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h7800 */ ;
    defparam LUT__1262.LUTMASK = 16'h7800;
    EFX_LUT4 LUT__1263 (.I0(n740), .I1(n741), .O(n791)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__1263.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__1264 (.I0(n783), .I1(n791), .I2(n748), .I3(\wsinterface/reset_count[19] ), 
            .O(\wsinterface/n430 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hbac0 */ ;
    defparam LUT__1264.LUTMASK = 16'hbac0;
    EFX_LUT4 LUT__1265 (.I0(\wsinterface/reset_count[19] ), .I1(n791), .O(n792)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__1265.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__1266 (.I0(n783), .I1(n792), .I2(n748), .I3(\wsinterface/reset_count[20] ), 
            .O(\wsinterface/n429 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hbac0 */ ;
    defparam LUT__1266.LUTMASK = 16'hbac0;
    EFX_LUT4 LUT__1267 (.I0(\wsinterface/reset_count[19] ), .I1(\wsinterface/reset_count[20] ), 
            .I2(n741), .O(n793)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h1010 */ ;
    defparam LUT__1267.LUTMASK = 16'h1010;
    EFX_LUT4 LUT__1268 (.I0(n740), .I1(n793), .O(n794)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__1268.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__1269 (.I0(\wsinterface/reset_count[21] ), .I1(n794), .I2(n747), 
            .O(\wsinterface/select_51/Select_21/n11 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h6060 */ ;
    defparam LUT__1269.LUTMASK = 16'h6060;
    EFX_LUT4 LUT__1270 (.I0(\wsinterface/reset_count[21] ), .I1(n794), .I2(\wsinterface/reset_count[22] ), 
            .I3(n747), .O(\wsinterface/select_51/Select_22/n11 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hb400 */ ;
    defparam LUT__1270.LUTMASK = 16'hb400;
    EFX_LUT4 LUT__1271 (.I0(\wsinterface/reset_count[21] ), .I1(\wsinterface/reset_count[22] ), 
            .I2(n740), .I3(n793), .O(n795)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h1000 */ ;
    defparam LUT__1271.LUTMASK = 16'h1000;
    EFX_LUT4 LUT__1272 (.I0(\wsinterface/reset_count[23] ), .I1(n795), .I2(n747), 
            .O(\wsinterface/select_51/Select_23/n11 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h6060 */ ;
    defparam LUT__1272.LUTMASK = 16'h6060;
    EFX_LUT4 LUT__1273 (.I0(\wsinterface/reset_count[23] ), .I1(n795), .O(n796)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__1273.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__1274 (.I0(n783), .I1(n796), .I2(n748), .I3(\wsinterface/reset_count[24] ), 
            .O(\wsinterface/n425 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hbac0 */ ;
    defparam LUT__1274.LUTMASK = 16'hbac0;
    EFX_LUT4 LUT__1275 (.I0(n740), .I1(n743), .O(n797)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__1275.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__1276 (.I0(n783), .I1(n797), .I2(n748), .I3(\wsinterface/reset_count[25] ), 
            .O(\wsinterface/n424 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hbac0 */ ;
    defparam LUT__1276.LUTMASK = 16'hbac0;
    EFX_LUT4 LUT__1277 (.I0(\wsinterface/reset_count[25] ), .I1(n797), .O(n798)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__1277.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__1278 (.I0(n783), .I1(n798), .I2(n748), .I3(\wsinterface/reset_count[26] ), 
            .O(\wsinterface/n423 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hbac0 */ ;
    defparam LUT__1278.LUTMASK = 16'hbac0;
    EFX_LUT4 LUT__1279 (.I0(\wsinterface/reset_count[25] ), .I1(\wsinterface/reset_count[26] ), 
            .I2(n797), .O(n799)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h1010 */ ;
    defparam LUT__1279.LUTMASK = 16'h1010;
    EFX_LUT4 LUT__1280 (.I0(n783), .I1(n799), .I2(n748), .I3(\wsinterface/reset_count[27] ), 
            .O(\wsinterface/n422 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hbac0 */ ;
    defparam LUT__1280.LUTMASK = 16'hbac0;
    EFX_LUT4 LUT__1281 (.I0(\wsinterface/reset_count[25] ), .I1(\wsinterface/reset_count[26] ), 
            .I2(\wsinterface/reset_count[27] ), .I3(n797), .O(n800)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0100 */ ;
    defparam LUT__1281.LUTMASK = 16'h0100;
    EFX_LUT4 LUT__1282 (.I0(n783), .I1(n800), .I2(n748), .I3(\wsinterface/reset_count[28] ), 
            .O(\wsinterface/n421 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hbac0 */ ;
    defparam LUT__1282.LUTMASK = 16'hbac0;
    EFX_LUT4 LUT__1283 (.I0(n740), .I1(n793), .I2(n742), .I3(n744), 
            .O(n801)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8000 */ ;
    defparam LUT__1283.LUTMASK = 16'h8000;
    EFX_LUT4 LUT__1284 (.I0(n783), .I1(n801), .I2(n748), .I3(\wsinterface/reset_count[29] ), 
            .O(\wsinterface/n420 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hbac0 */ ;
    defparam LUT__1284.LUTMASK = 16'hbac0;
    EFX_LUT4 LUT__1285 (.I0(\wsinterface/reset_count[29] ), .I1(n801), .O(n802)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__1285.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__1286 (.I0(n783), .I1(n802), .I2(n748), .I3(\wsinterface/reset_count[30] ), 
            .O(\wsinterface/n419 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hbac0 */ ;
    defparam LUT__1286.LUTMASK = 16'hbac0;
    EFX_LUT4 LUT__1287 (.I0(n797), .I1(n745), .O(n803)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__1287.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__1288 (.I0(n783), .I1(n803), .I2(n748), .I3(\wsinterface/reset_count[31] ), 
            .O(\wsinterface/n418 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hbac0 */ ;
    defparam LUT__1288.LUTMASK = 16'hbac0;
    EFX_LUT4 LUT__1289 (.I0(\wsinterface/high_count[10] ), .I1(n753), .I2(n768), 
            .O(n804)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4040 */ ;
    defparam LUT__1289.LUTMASK = 16'h4040;
    EFX_LUT4 LUT__1290 (.I0(n761), .I1(n758), .O(n805)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__1290.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__1291 (.I0(n746), .I1(n805), .I2(\wsinterface/state[2] ), 
            .I3(\wsinterface/state[1] ), .O(n806)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'ha03f */ ;
    defparam LUT__1291.LUTMASK = 16'ha03f;
    EFX_LUT4 LUT__1292 (.I0(n749), .I1(n804), .I2(n806), .I3(\wsinterface/state[0] ), 
            .O(\wsinterface/n453 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h110f */ ;
    defparam LUT__1292.LUTMASK = 16'h110f;
    EFX_LUT4 LUT__1293 (.I0(n771), .I1(n761), .I2(n758), .O(n807)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h7070 */ ;
    defparam LUT__1293.LUTMASK = 16'h7070;
    EFX_LUT4 LUT__1294 (.I0(n807), .I1(n746), .I2(\wsinterface/state[1] ), 
            .O(n808)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h3535 */ ;
    defparam LUT__1294.LUTMASK = 16'h3535;
    EFX_LUT4 LUT__1295 (.I0(n808), .I1(n804), .I2(\wsinterface/state[0] ), 
            .I3(\wsinterface/state[2] ), .O(\wsinterface/n452 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hfac0 */ ;
    defparam LUT__1295.LUTMASK = 16'hfac0;
    EFX_LUT4 LUT__1296 (.I0(\wsinterface/rgb_counter[0] ), .I1(n805), .I2(\wsinterface/rgb_counter[1] ), 
            .I3(n765), .O(n809)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hb400 */ ;
    defparam LUT__1296.LUTMASK = 16'hb400;
    EFX_LUT4 LUT__1297 (.I0(\wsinterface/state[0] ), .I1(\wsinterface/state[1] ), 
            .I2(\wsinterface/state[2] ), .O(n810)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hbcbc */ ;
    defparam LUT__1297.LUTMASK = 16'hbcbc;
    EFX_LUT4 LUT__1298 (.I0(n810), .I1(\wsinterface/rgb_counter[0] ), .I2(\~wsinterface/equal_43/n7 ), 
            .O(n811)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0b0b */ ;
    defparam LUT__1298.LUTMASK = 16'h0b0b;
    EFX_LUT4 LUT__1299 (.I0(n768), .I1(\wsinterface/rgb_counter[1] ), .I2(n809), 
            .I3(n811), .O(\wsinterface/n484 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hf8ff */ ;
    defparam LUT__1299.LUTMASK = 16'hf8ff;
    EFX_LUT4 LUT__1300 (.I0(n759), .I1(n805), .I2(\wsinterface/rgb_counter[2] ), 
            .I3(n765), .O(n812)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h7800 */ ;
    defparam LUT__1300.LUTMASK = 16'h7800;
    EFX_LUT4 LUT__1301 (.I0(n768), .I1(\wsinterface/rgb_counter[2] ), .I2(n812), 
            .I3(n811), .O(\wsinterface/n483 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hf8ff */ ;
    defparam LUT__1301.LUTMASK = 16'hf8ff;
    EFX_LUT4 LUT__1302 (.I0(\wsinterface/rgb_counter[2] ), .I1(n759), .O(n813)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__1302.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__1303 (.I0(n813), .I1(n765), .O(n814)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__1303.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__1304 (.I0(\~wsinterface/equal_43/n7 ), .I1(n805), .I2(n814), 
            .I3(\wsinterface/rgb_counter[3] ), .O(\wsinterface/n482 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h15c0 */ ;
    defparam LUT__1304.LUTMASK = 16'h15c0;
    EFX_LUT4 LUT__1305 (.I0(n758), .I1(n759), .I2(n760), .I3(n765), 
            .O(n815)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h7f00 */ ;
    defparam LUT__1305.LUTMASK = 16'h7f00;
    EFX_LUT4 LUT__1306 (.I0(n768), .I1(n815), .I2(\wsinterface/rgb_counter[4] ), 
            .I3(n811), .O(\wsinterface/n481 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'he0ff */ ;
    defparam LUT__1306.LUTMASK = 16'he0ff;
    EFX_LUT4 LUT__1307 (.I0(\wsinterface/state[2] ), .I1(\wsinterface/state[0] ), 
            .I2(\wsinterface/state[1] ), .O(n816)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hd0d0 */ ;
    defparam LUT__1307.LUTMASK = 16'hd0d0;
    EFX_LUT4 LUT__1308 (.I0(n816), .I1(\wsinterface/high_count[0] ), .I2(\~wsinterface/equal_45/n7 ), 
            .I3(\wsinterface/high_count[1] ), .O(\wsinterface/n496 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hd530 */ ;
    defparam LUT__1308.LUTMASK = 16'hd530;
    EFX_LUT4 LUT__1309 (.I0(\wsinterface/n2463 ), .I1(\wsinterface/n2460 ), 
            .I2(\wsinterface/rgb_counter[0] ), .O(n817)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h3535 */ ;
    defparam LUT__1309.LUTMASK = 16'h3535;
    EFX_LUT4 LUT__1310 (.I0(\wsinterface/n2469 ), .I1(\wsinterface/n2466 ), 
            .I2(\wsinterface/rgb_counter[0] ), .O(n818)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h3535 */ ;
    defparam LUT__1310.LUTMASK = 16'h3535;
    EFX_LUT4 LUT__1311 (.I0(n818), .I1(n817), .I2(\wsinterface/rgb_counter[1] ), 
            .I3(n760), .O(n819)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h3500 */ ;
    defparam LUT__1311.LUTMASK = 16'h3500;
    EFX_LUT4 LUT__1312 (.I0(\wsinterface/rgb_counter[2] ), .I1(\wsinterface/rgb_counter[1] ), 
            .I2(\wsinterface/rgb_counter[3] ), .O(n820)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0707 */ ;
    defparam LUT__1312.LUTMASK = 16'h0707;
    EFX_LUT4 LUT__1313 (.I0(\wsinterface/n2451 ), .I1(\wsinterface/n2448 ), 
            .I2(n820), .I3(\wsinterface/rgb_counter[0] ), .O(n821)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0c0a */ ;
    defparam LUT__1313.LUTMASK = 16'h0c0a;
    EFX_LUT4 LUT__1314 (.I0(\wsinterface/n2457 ), .I1(\wsinterface/n2454 ), 
            .I2(\wsinterface/rgb_counter[0] ), .O(n822)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h3535 */ ;
    defparam LUT__1314.LUTMASK = 16'h3535;
    EFX_LUT4 LUT__1315 (.I0(\wsinterface/rgb_counter[1] ), .I1(\wsinterface/rgb_counter[3] ), 
            .I2(n822), .I3(\wsinterface/rgb_counter[2] ), .O(n823)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0100 */ ;
    defparam LUT__1315.LUTMASK = 16'h0100;
    EFX_LUT4 LUT__1316 (.I0(n819), .I1(n821), .I2(n823), .I3(\wsinterface/rgb_counter[4] ), 
            .O(n824)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0100 */ ;
    defparam LUT__1316.LUTMASK = 16'h0100;
    EFX_LUT4 LUT__1317 (.I0(\wsinterface/n2478 ), .I1(\wsinterface/n2472 ), 
            .I2(\wsinterface/rgb_counter[1] ), .O(n825)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h3535 */ ;
    defparam LUT__1317.LUTMASK = 16'h3535;
    EFX_LUT4 LUT__1318 (.I0(\wsinterface/n2481 ), .I1(\wsinterface/n2475 ), 
            .I2(\wsinterface/rgb_counter[1] ), .O(n826)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h3535 */ ;
    defparam LUT__1318.LUTMASK = 16'h3535;
    EFX_LUT4 LUT__1319 (.I0(n826), .I1(n825), .I2(\wsinterface/rgb_counter[0] ), 
            .I3(\wsinterface/rgb_counter[2] ), .O(n827)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h3500 */ ;
    defparam LUT__1319.LUTMASK = 16'h3500;
    EFX_LUT4 LUT__1320 (.I0(\wsinterface/n2487 ), .I1(\wsinterface/n2484 ), 
            .I2(\wsinterface/rgb_counter[0] ), .O(n828)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h3535 */ ;
    defparam LUT__1320.LUTMASK = 16'h3535;
    EFX_LUT4 LUT__1321 (.I0(\wsinterface/n2493 ), .I1(\wsinterface/n2490 ), 
            .I2(\wsinterface/rgb_counter[0] ), .O(n829)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h3535 */ ;
    defparam LUT__1321.LUTMASK = 16'h3535;
    EFX_LUT4 LUT__1322 (.I0(n829), .I1(n828), .I2(\wsinterface/rgb_counter[2] ), 
            .I3(\wsinterface/rgb_counter[1] ), .O(n830)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0305 */ ;
    defparam LUT__1322.LUTMASK = 16'h0305;
    EFX_LUT4 LUT__1323 (.I0(\wsinterface/rgb_counter[4] ), .I1(n827), .I2(n830), 
            .I3(\wsinterface/rgb_counter[3] ), .O(n831)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0100 */ ;
    defparam LUT__1323.LUTMASK = 16'h0100;
    EFX_LUT4 LUT__1324 (.I0(\wsinterface/n2499 ), .I1(\wsinterface/n2496 ), 
            .I2(\wsinterface/rgb_counter[0] ), .O(n832)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h3535 */ ;
    defparam LUT__1324.LUTMASK = 16'h3535;
    EFX_LUT4 LUT__1325 (.I0(\wsinterface/n2505 ), .I1(\wsinterface/n2502 ), 
            .I2(\wsinterface/rgb_counter[0] ), .O(n833)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h3535 */ ;
    defparam LUT__1325.LUTMASK = 16'h3535;
    EFX_LUT4 LUT__1326 (.I0(n833), .I1(n832), .I2(\wsinterface/rgb_counter[1] ), 
            .I3(\wsinterface/rgb_counter[2] ), .O(n834)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h3500 */ ;
    defparam LUT__1326.LUTMASK = 16'h3500;
    EFX_LUT4 LUT__1327 (.I0(\wsinterface/n2514 ), .I1(\wsinterface/n2508 ), 
            .I2(\wsinterface/rgb_counter[1] ), .O(n835)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h3535 */ ;
    defparam LUT__1327.LUTMASK = 16'h3535;
    EFX_LUT4 LUT__1328 (.I0(\wsinterface/n2517 ), .I1(\wsinterface/n2511 ), 
            .I2(\wsinterface/rgb_counter[1] ), .O(n836)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h3535 */ ;
    defparam LUT__1328.LUTMASK = 16'h3535;
    EFX_LUT4 LUT__1329 (.I0(n836), .I1(n835), .I2(\wsinterface/rgb_counter[2] ), 
            .I3(\wsinterface/rgb_counter[0] ), .O(n837)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0305 */ ;
    defparam LUT__1329.LUTMASK = 16'h0305;
    EFX_LUT4 LUT__1330 (.I0(\wsinterface/rgb_counter[3] ), .I1(\wsinterface/rgb_counter[4] ), 
            .I2(n834), .I3(n837), .O(n838)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0001 */ ;
    defparam LUT__1330.LUTMASK = 16'h0001;
    EFX_LUT4 LUT__1331 (.I0(\wsinterface/state[0] ), .I1(n768), .O(n839)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__1331.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__1332 (.I0(n831), .I1(n838), .I2(n824), .I3(n839), 
            .O(n840)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hfe00 */ ;
    defparam LUT__1332.LUTMASK = 16'hfe00;
    EFX_LUT4 LUT__1333 (.I0(\wsinterface/high_count[0] ), .I1(\wsinterface/high_count[1] ), 
            .I2(\wsinterface/high_count[2] ), .I3(\~wsinterface/equal_45/n7 ), 
            .O(n841)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'he100 */ ;
    defparam LUT__1333.LUTMASK = 16'he100;
    EFX_LUT4 LUT__1334 (.I0(n816), .I1(\wsinterface/high_count[2] ), .I2(n840), 
            .I3(n841), .O(\wsinterface/n495 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hfff4 */ ;
    defparam LUT__1334.LUTMASK = 16'hfff4;
    EFX_LUT4 LUT__1335 (.I0(n838), .I1(n824), .I2(n831), .I3(n839), 
            .O(n842)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0100 */ ;
    defparam LUT__1335.LUTMASK = 16'h0100;
    EFX_LUT4 LUT__1336 (.I0(\wsinterface/high_count[0] ), .I1(\wsinterface/high_count[1] ), 
            .I2(\wsinterface/high_count[2] ), .O(n843)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0101 */ ;
    defparam LUT__1336.LUTMASK = 16'h0101;
    EFX_LUT4 LUT__1337 (.I0(n816), .I1(n843), .I2(\~wsinterface/equal_45/n7 ), 
            .I3(\wsinterface/high_count[3] ), .O(n844)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8a3f */ ;
    defparam LUT__1337.LUTMASK = 16'h8a3f;
    EFX_LUT4 LUT__1338 (.I0(n842), .I1(n844), .O(\wsinterface/n494 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hbbbb */ ;
    defparam LUT__1338.LUTMASK = 16'hbbbb;
    EFX_LUT4 LUT__1339 (.I0(n816), .I1(n750), .I2(\~wsinterface/equal_45/n7 ), 
            .I3(\wsinterface/high_count[4] ), .O(n845)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8a3f */ ;
    defparam LUT__1339.LUTMASK = 16'h8a3f;
    EFX_LUT4 LUT__1340 (.I0(n840), .I1(n845), .O(\wsinterface/n493 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hbbbb */ ;
    defparam LUT__1340.LUTMASK = 16'hbbbb;
    EFX_LUT4 LUT__1341 (.I0(n816), .I1(n751), .I2(\~wsinterface/equal_45/n7 ), 
            .I3(\wsinterface/high_count[5] ), .O(n846)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8a3f */ ;
    defparam LUT__1341.LUTMASK = 16'h8a3f;
    EFX_LUT4 LUT__1342 (.I0(n842), .I1(n846), .O(\wsinterface/n492 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hbbbb */ ;
    defparam LUT__1342.LUTMASK = 16'hbbbb;
    EFX_LUT4 LUT__1343 (.I0(\wsinterface/high_count[5] ), .I1(n751), .I2(\wsinterface/high_count[6] ), 
            .O(n847)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4b4b */ ;
    defparam LUT__1343.LUTMASK = 16'h4b4b;
    EFX_LUT4 LUT__1344 (.I0(n768), .I1(\wsinterface/high_count[9] ), .O(n848)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__1344.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__1345 (.I0(n847), .I1(\~wsinterface/equal_45/n7 ), .I2(n848), 
            .O(\wsinterface/n491 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hf4f4 */ ;
    defparam LUT__1345.LUTMASK = 16'hf4f4;
    EFX_LUT4 LUT__1346 (.I0(\wsinterface/high_count[5] ), .I1(\wsinterface/high_count[6] ), 
            .I2(n751), .I3(\wsinterface/high_count[7] ), .O(n849)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h10ef */ ;
    defparam LUT__1346.LUTMASK = 16'h10ef;
    EFX_LUT4 LUT__1347 (.I0(n849), .I1(\~wsinterface/equal_45/n7 ), .I2(n848), 
            .O(\wsinterface/n490 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hf4f4 */ ;
    defparam LUT__1347.LUTMASK = 16'hf4f4;
    EFX_LUT4 LUT__1348 (.I0(n751), .I1(n752), .O(n850)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__1348.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__1349 (.I0(n848), .I1(\wsinterface/high_count[8] ), .I2(n850), 
            .I3(\~wsinterface/equal_45/n7 ), .O(\wsinterface/n489 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hbeaa */ ;
    defparam LUT__1349.LUTMASK = 16'hbeaa;
    EFX_LUT4 LUT__1350 (.I0(\wsinterface/high_count[8] ), .I1(n850), .O(n851)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__1350.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__1351 (.I0(n768), .I1(n851), .I2(\wsinterface/state[0] ), 
            .I3(\wsinterface/high_count[9] ), .O(\wsinterface/n488 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h7580 */ ;
    defparam LUT__1351.LUTMASK = 16'h7580;
    EFX_LUT4 LUT__1352 (.I0(n848), .I1(\wsinterface/high_count[10] ), .I2(n753), 
            .I3(\~wsinterface/equal_45/n7 ), .O(\wsinterface/n487 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hbeaa */ ;
    defparam LUT__1352.LUTMASK = 16'hbeaa;
    EFX_LUT4 LUT__1353 (.I0(\wsinterface/low_count[0] ), .I1(n816), .I2(n765), 
            .I3(\wsinterface/low_count[1] ), .O(\wsinterface/n508 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h2350 */ ;
    defparam LUT__1353.LUTMASK = 16'h2350;
    EFX_LUT4 LUT__1354 (.I0(\wsinterface/low_count[0] ), .I1(\wsinterface/low_count[1] ), 
            .O(n852)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h1111 */ ;
    defparam LUT__1354.LUTMASK = 16'h1111;
    EFX_LUT4 LUT__1355 (.I0(n839), .I1(n852), .I2(\wsinterface/low_count[2] ), 
            .I3(n765), .O(n853)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hc3af */ ;
    defparam LUT__1355.LUTMASK = 16'hc3af;
    EFX_LUT4 LUT__1356 (.I0(n842), .I1(n853), .O(\wsinterface/n507 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hbbbb */ ;
    defparam LUT__1356.LUTMASK = 16'hbbbb;
    EFX_LUT4 LUT__1357 (.I0(\wsinterface/low_count[2] ), .I1(n852), .O(n854)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__1357.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__1358 (.I0(n839), .I1(n854), .I2(\wsinterface/low_count[3] ), 
            .I3(n765), .O(n855)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hc3af */ ;
    defparam LUT__1358.LUTMASK = 16'hc3af;
    EFX_LUT4 LUT__1359 (.I0(n840), .I1(n855), .O(\wsinterface/n506 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hbbbb */ ;
    defparam LUT__1359.LUTMASK = 16'hbbbb;
    EFX_LUT4 LUT__1360 (.I0(\wsinterface/state[0] ), .I1(\wsinterface/state[1] ), 
            .I2(\wsinterface/state[2] ), .O(n856)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h6b6b */ ;
    defparam LUT__1360.LUTMASK = 16'h6b6b;
    EFX_LUT4 LUT__1361 (.I0(n856), .I1(n755), .I2(n765), .I3(\wsinterface/low_count[4] ), 
            .O(n857)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h453f */ ;
    defparam LUT__1361.LUTMASK = 16'h453f;
    EFX_LUT4 LUT__1362 (.I0(n842), .I1(n857), .O(\wsinterface/n505 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hbbbb */ ;
    defparam LUT__1362.LUTMASK = 16'hbbbb;
    EFX_LUT4 LUT__1363 (.I0(\wsinterface/state[1] ), .I1(\wsinterface/low_count[1] ), 
            .I2(\wsinterface/low_count[5] ), .I3(\wsinterface/state[2] ), 
            .O(n858)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hbb0f */ ;
    defparam LUT__1363.LUTMASK = 16'hbb0f;
    EFX_LUT4 LUT__1364 (.I0(\wsinterface/low_count[4] ), .I1(n755), .O(n859)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__1364.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__1365 (.I0(\wsinterface/state[2] ), .I1(n859), .I2(\wsinterface/state[1] ), 
            .I3(\wsinterface/low_count[5] ), .O(n860)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h5cf7 */ ;
    defparam LUT__1365.LUTMASK = 16'h5cf7;
    EFX_LUT4 LUT__1366 (.I0(n860), .I1(n858), .I2(\wsinterface/state[0] ), 
            .O(n861)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hcaca */ ;
    defparam LUT__1366.LUTMASK = 16'hcaca;
    EFX_LUT4 LUT__1367 (.I0(n717), .I1(\wsinterface/low_count[5] ), .I2(n840), 
            .I3(n861), .O(\wsinterface/n504 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hf8ff */ ;
    defparam LUT__1367.LUTMASK = 16'hf8ff;
    EFX_LUT4 LUT__1368 (.I0(\~wsinterface/equal_45/n7 ), .I1(\wsinterface/low_count[9] ), 
            .I2(n816), .I3(\wsinterface/low_count[6] ), .O(n862)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h7077 */ ;
    defparam LUT__1368.LUTMASK = 16'h7077;
    EFX_LUT4 LUT__1369 (.I0(\wsinterface/low_count[5] ), .I1(n859), .I2(n765), 
            .I3(n862), .O(\wsinterface/n503 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h40bf */ ;
    defparam LUT__1369.LUTMASK = 16'h40bf;
    EFX_LUT4 LUT__1370 (.I0(\wsinterface/low_count[6] ), .I1(\wsinterface/low_count[9] ), 
            .I2(\wsinterface/state[1] ), .I3(\wsinterface/state[2] ), .O(n863)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hf53f */ ;
    defparam LUT__1370.LUTMASK = 16'hf53f;
    EFX_LUT4 LUT__1371 (.I0(n755), .I1(n757), .O(n864)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__1371.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__1372 (.I0(\wsinterface/state[2] ), .I1(n864), .I2(\wsinterface/state[1] ), 
            .I3(\wsinterface/low_count[7] ), .O(n865)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h5cf7 */ ;
    defparam LUT__1372.LUTMASK = 16'h5cf7;
    EFX_LUT4 LUT__1373 (.I0(\wsinterface/low_count[7] ), .I1(n717), .O(n866)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__1373.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__1374 (.I0(n865), .I1(n863), .I2(n866), .I3(\wsinterface/state[0] ), 
            .O(\wsinterface/n502 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hf3f5 */ ;
    defparam LUT__1374.LUTMASK = 16'hf3f5;
    EFX_LUT4 LUT__1375 (.I0(\wsinterface/state[0] ), .I1(\wsinterface/state[1] ), 
            .I2(\wsinterface/state[2] ), .I3(\wsinterface/low_count[9] ), 
            .O(n867)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h6800 */ ;
    defparam LUT__1375.LUTMASK = 16'h6800;
    EFX_LUT4 LUT__1376 (.I0(\wsinterface/low_count[7] ), .I1(n864), .I2(\wsinterface/low_count[8] ), 
            .I3(n765), .O(n868)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hb400 */ ;
    defparam LUT__1376.LUTMASK = 16'hb400;
    EFX_LUT4 LUT__1377 (.I0(n867), .I1(\wsinterface/low_count[8] ), .I2(n868), 
            .I3(n810), .O(\wsinterface/n501 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hfafc */ ;
    defparam LUT__1377.LUTMASK = 16'hfafc;
    EFX_LUT4 LUT__1378 (.I0(\wsinterface/low_count[7] ), .I1(\wsinterface/low_count[8] ), 
            .I2(n864), .O(n869)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h1010 */ ;
    defparam LUT__1378.LUTMASK = 16'h1010;
    EFX_LUT4 LUT__1379 (.I0(n856), .I1(n869), .I2(n765), .I3(\wsinterface/low_count[9] ), 
            .O(\wsinterface/n500 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'hbac0 */ ;
    defparam LUT__1379.LUTMASK = 16'hbac0;
    EFX_LUT4 LUT__1380 (.I0(\wsinterface/state[2] ), .I1(\wsinterface/low_count[9] ), 
            .I2(n869), .I3(\wsinterface/low_count[10] ), .O(n870)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h30df */ ;
    defparam LUT__1380.LUTMASK = 16'h30df;
    EFX_LUT4 LUT__1381 (.I0(n717), .I1(\wsinterface/low_count[10] ), .I2(n867), 
            .O(n871)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0707 */ ;
    defparam LUT__1381.LUTMASK = 16'h0707;
    EFX_LUT4 LUT__1382 (.I0(n870), .I1(n764), .I2(n871), .O(\wsinterface/n499 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4f4f */ ;
    defparam LUT__1382.LUTMASK = 16'h4f4f;
    EFX_LUT4 LUT__1383 (.I0(\wsinterface/data_count[1] ), .I1(\wsinterface/data_count[0] ), 
            .O(\wsinterface/n152 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__1383.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__1384 (.I0(\wsinterface/led_counter[0] ), .I1(n764), .O(n872)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__1384.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__1385 (.I0(\wsinterface/state[0] ), .I1(n717), .O(n873)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h4444 */ ;
    defparam LUT__1385.LUTMASK = 16'h4444;
    EFX_LUT4 LUT__1386 (.I0(n772), .I1(n872), .I2(n873), .I3(\wsinterface/led_counter[1] ), 
            .O(\wsinterface/n415 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0708 */ ;
    defparam LUT__1386.LUTMASK = 16'h0708;
    EFX_LUT4 LUT__1387 (.I0(\wsinterface/led_counter[0] ), .I1(\wsinterface/led_counter[1] ), 
            .I2(n764), .O(n874)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8080 */ ;
    defparam LUT__1387.LUTMASK = 16'h8080;
    EFX_LUT4 LUT__1388 (.I0(n772), .I1(n874), .I2(n873), .I3(\wsinterface/led_counter[2] ), 
            .O(\wsinterface/n414 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0708 */ ;
    defparam LUT__1388.LUTMASK = 16'h0708;
    EFX_LUT4 LUT__1389 (.I0(\wsinterface/led_counter[2] ), .I1(n874), .O(n875)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__1389.LUTMASK = 16'h8888;
    EFX_LUT4 LUT__1390 (.I0(n772), .I1(n875), .I2(n873), .I3(\wsinterface/led_counter[3] ), 
            .O(\wsinterface/n413 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0708 */ ;
    defparam LUT__1390.LUTMASK = 16'h0708;
    EFX_LUT4 LUT__1391 (.I0(\wsinterface/led_counter[3] ), .I1(n772), .I2(n875), 
            .O(n876)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8080 */ ;
    defparam LUT__1391.LUTMASK = 16'h8080;
    EFX_LUT4 LUT__1392 (.I0(n873), .I1(\wsinterface/led_counter[4] ), .I2(n876), 
            .O(\wsinterface/n412 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h1414 */ ;
    defparam LUT__1392.LUTMASK = 16'h1414;
    EFX_LUT4 LUT__1393 (.I0(\wsinterface/led_counter[3] ), .I1(\wsinterface/led_counter[4] ), 
            .I2(n762), .I3(n875), .O(n877)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8000 */ ;
    defparam LUT__1393.LUTMASK = 16'h8000;
    EFX_LUT4 LUT__1394 (.I0(\wsinterface/led_counter[6] ), .I1(n877), .I2(n873), 
            .I3(\wsinterface/led_counter[5] ), .O(\wsinterface/n411 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h0b04 */ ;
    defparam LUT__1394.LUTMASK = 16'h0b04;
    EFX_LUT4 LUT__1395 (.I0(\wsinterface/led_counter[5] ), .I1(n877), .I2(\wsinterface/led_counter[6] ), 
            .I3(n873), .O(\wsinterface/n410 )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h00f8 */ ;
    defparam LUT__1395.LUTMASK = 16'h00f8;
    EFX_LUT4 \wsctrl/state[0]~FF_brt_0_rtinv  (.I0(\wsctrl/state[0]~FF_brt_0_q_pinv ), 
            .O(\wsctrl/state[0]~FF_brt_0_q )) /* verific LUTMASK=16'h5555, EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, EFX_ATTRIBUTE_INSTANCE__IS_LUT_SOP_INF_INV=TRUE */ ;
    defparam \wsctrl/state[0]~FF_brt_0_rtinv .LUTMASK = 16'h5555;
    EFX_LUT4 LUT__1020 (.I0(\uartrx/r_Clock_Count[4] ), .I1(\uartrx/r_Clock_Count[5] ), 
            .O(n685)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_LUT4, LUTMASK=16'h8888 */ ;
    defparam LUT__1020.LUTMASK = 16'h8888;
    EFX_GBUFCE CLKBUF__0 (.CE(1'b1), .I(clk), .O(\clk~O )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_GBUFCE, CE_POLARITY=1'b1 */ ;
    defparam CLKBUF__0.CE_POLARITY = 1'b1;
    EFX_ADD \AUX_ADD_CO__ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/sub_37/add_2/i10  (.I0(1'b0), 
            .I1(1'b0), .CI(n879), .O(n294)) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_ADD, I0_POLARITY=1'b1, I1_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/ip/phy_fifo/phy_fifo.v(1275)
    defparam \AUX_ADD_CO__ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/sub_37/add_2/i10 .I0_POLARITY = 1'b1;
    defparam \AUX_ADD_CO__ws_wr_fifo/u_efx_fifo_top/xefx_fifo_ctl/sub_37/add_2/i10 .I1_POLARITY = 1'b1;
    EFX_FF \wsctrl/state[1]~FF_brt_5  (.D(n726), .CE(ceg_net85), .CLK(\clk~O ), 
           .SR(1'b0), .Q(\wsctrl/state[1]~FF_brt_5_q )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1, INIT_VALUE=1'b0 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_ctrl.v(114)
    defparam \wsctrl/state[1]~FF_brt_5 .CLK_POLARITY = 1'b1;
    defparam \wsctrl/state[1]~FF_brt_5 .CE_POLARITY = 1'b0;
    defparam \wsctrl/state[1]~FF_brt_5 .SR_POLARITY = 1'b1;
    defparam \wsctrl/state[1]~FF_brt_5 .D_POLARITY = 1'b1;
    defparam \wsctrl/state[1]~FF_brt_5 .SR_SYNC = 1'b1;
    defparam \wsctrl/state[1]~FF_brt_5 .SR_VALUE = 1'b0;
    defparam \wsctrl/state[1]~FF_brt_5 .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsctrl/state[1]~FF_brt_4  (.D(n728), .CE(ceg_net85), .CLK(\clk~O ), 
           .SR(1'b0), .Q(\wsctrl/state[1]~FF_brt_4_q )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1, INIT_VALUE=1'b0 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_ctrl.v(114)
    defparam \wsctrl/state[1]~FF_brt_4 .CLK_POLARITY = 1'b1;
    defparam \wsctrl/state[1]~FF_brt_4 .CE_POLARITY = 1'b0;
    defparam \wsctrl/state[1]~FF_brt_4 .SR_POLARITY = 1'b1;
    defparam \wsctrl/state[1]~FF_brt_4 .D_POLARITY = 1'b1;
    defparam \wsctrl/state[1]~FF_brt_4 .SR_SYNC = 1'b1;
    defparam \wsctrl/state[1]~FF_brt_4 .SR_VALUE = 1'b0;
    defparam \wsctrl/state[1]~FF_brt_4 .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsctrl/state[0]~FF_brt_3  (.D(\wsctrl/state[3] ), .CE(ceg_net85), 
           .CLK(\clk~O ), .SR(1'b0), .Q(\wsctrl/state[0]~FF_brt_3_q )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1, INIT_VALUE=1'b0 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_ctrl.v(114)
    defparam \wsctrl/state[0]~FF_brt_3 .CLK_POLARITY = 1'b1;
    defparam \wsctrl/state[0]~FF_brt_3 .CE_POLARITY = 1'b0;
    defparam \wsctrl/state[0]~FF_brt_3 .SR_POLARITY = 1'b1;
    defparam \wsctrl/state[0]~FF_brt_3 .D_POLARITY = 1'b1;
    defparam \wsctrl/state[0]~FF_brt_3 .SR_SYNC = 1'b1;
    defparam \wsctrl/state[0]~FF_brt_3 .SR_VALUE = 1'b0;
    defparam \wsctrl/state[0]~FF_brt_3 .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsctrl/state[0]~FF_brt_2  (.D(n721), .CE(ceg_net85), .CLK(\clk~O ), 
           .SR(1'b0), .Q(\wsctrl/state[0]~FF_brt_2_q )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1, INIT_VALUE=1'b0 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_ctrl.v(114)
    defparam \wsctrl/state[0]~FF_brt_2 .CLK_POLARITY = 1'b1;
    defparam \wsctrl/state[0]~FF_brt_2 .CE_POLARITY = 1'b0;
    defparam \wsctrl/state[0]~FF_brt_2 .SR_POLARITY = 1'b1;
    defparam \wsctrl/state[0]~FF_brt_2 .D_POLARITY = 1'b1;
    defparam \wsctrl/state[0]~FF_brt_2 .SR_SYNC = 1'b1;
    defparam \wsctrl/state[0]~FF_brt_2 .SR_VALUE = 1'b0;
    defparam \wsctrl/state[0]~FF_brt_2 .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsctrl/state[0]~FF_brt_1  (.D(n723), .CE(ceg_net85), .CLK(\clk~O ), 
           .SR(1'b0), .Q(\wsctrl/state[0]~FF_brt_1_q )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b1, CE_POLARITY=1'b0, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1, INIT_VALUE=1'b0 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_ctrl.v(114)
    defparam \wsctrl/state[0]~FF_brt_1 .CLK_POLARITY = 1'b1;
    defparam \wsctrl/state[0]~FF_brt_1 .CE_POLARITY = 1'b0;
    defparam \wsctrl/state[0]~FF_brt_1 .SR_POLARITY = 1'b1;
    defparam \wsctrl/state[0]~FF_brt_1 .D_POLARITY = 1'b1;
    defparam \wsctrl/state[0]~FF_brt_1 .SR_SYNC = 1'b1;
    defparam \wsctrl/state[0]~FF_brt_1 .SR_VALUE = 1'b0;
    defparam \wsctrl/state[0]~FF_brt_1 .SR_SYNC_PRIORITY = 1'b1;
    EFX_FF \wsctrl/state[0]~FF_brt_0  (.D(n724), .CE(ceg_net85), .CLK(\clk~O ), 
           .SR(1'b0), .Q(\wsctrl/state[0]~FF_brt_0_q_pinv )) /* verific EFX_ATTRIBUTE_CELL_NAME=EFX_FF, CLK_POLARITY=1'b1, D_POLARITY=1'b0, CE_POLARITY=1'b0, SR_SYNC=1'b1, SR_SYNC_PRIORITY=1'b1, SR_VALUE=1'b0, SR_POLARITY=1'b1 */ ;   // /home/kaush/Desktop/Efinity/WS2812_Protocol/Design/ws2812_ctrl.v(114)
    defparam \wsctrl/state[0]~FF_brt_0 .CLK_POLARITY = 1'b1;
    defparam \wsctrl/state[0]~FF_brt_0 .CE_POLARITY = 1'b0;
    defparam \wsctrl/state[0]~FF_brt_0 .SR_POLARITY = 1'b1;
    defparam \wsctrl/state[0]~FF_brt_0 .D_POLARITY = 1'b0;
    defparam \wsctrl/state[0]~FF_brt_0 .SR_SYNC = 1'b1;
    defparam \wsctrl/state[0]~FF_brt_0 .SR_VALUE = 1'b0;
    defparam \wsctrl/state[0]~FF_brt_0 .SR_SYNC_PRIORITY = 1'b1;
    
endmodule

//
// Verific Verilog Description of module EFX_FF_c64959f4_0
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_FF_c64959f4_1
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_FF_c64959f4_2
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_FF_c64959f4_3
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_FF_c64959f4_4
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_FF_c64959f4_5
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_ADD_c64959f4_0
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_FF_c64959f4_6
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_0
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_ADD_c64959f4_1
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_RAM_5K_c64959f4__1_1_0
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_RAM_5K_c64959f4__8_8_1
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_RAM_5K_c64959f4__1_1_2
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_RAM_5K_c64959f4__1_1_3
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_RAM_5K_c64959f4__1_1_4
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_RAM_5K_c64959f4__1_1_5
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_RAM_5K_c64959f4__1_1_6
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_RAM_5K_c64959f4__1_1_7
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_RAM_5K_c64959f4__1_1_8
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_RAM_5K_c64959f4__1_1_9
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_RAM_5K_c64959f4__1_1_10
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_RAM_5K_c64959f4__1_1_11
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_RAM_5K_c64959f4__1_1_12
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_RAM_5K_c64959f4__1_1_13
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_RAM_5K_c64959f4__1_1_14
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_RAM_5K_c64959f4__1_1_15
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_RAM_5K_c64959f4__1_1_16
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_RAM_5K_c64959f4__1_1_17
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_RAM_5K_c64959f4__1_1_18
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_RAM_5K_c64959f4__1_1_19
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_RAM_5K_c64959f4__1_1_20
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_RAM_5K_c64959f4__1_1_21
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_RAM_5K_c64959f4__1_1_22
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_RAM_5K_c64959f4__1_1_23
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_RAM_5K_c64959f4__1_1_24
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_1
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_2
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_3
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_4
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_5
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_6
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_7
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_8
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_9
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_10
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_11
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_12
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_13
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_14
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_15
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_16
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_17
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_18
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_19
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_20
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_21
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_22
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_23
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_24
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_25
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_26
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_27
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_28
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_29
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_30
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_31
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_32
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_33
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_34
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_35
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_36
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_37
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_38
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_39
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_40
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_41
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_42
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_43
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_44
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_45
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_46
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_47
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_48
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_49
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_50
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_51
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_52
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_53
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_54
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_55
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_56
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_57
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_58
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_59
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_60
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_61
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_62
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_63
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_64
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_65
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_66
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_67
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_68
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_69
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_70
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_71
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_72
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_73
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_74
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_75
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_76
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_77
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_78
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_79
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_80
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_81
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_82
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_83
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_84
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_85
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_86
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_87
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_88
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_89
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_90
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_91
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_92
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_93
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_94
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_95
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_96
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_97
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_98
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_99
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_100
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_101
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_102
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_103
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_104
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_LUT4_c64959f4_105
// module not written out since it is a black box. 
//


//
// Verific Verilog Description of module EFX_GBUFCE_c64959f4_0
// module not written out since it is a black box. 
//

