// This program was cloned from: https://github.com/OVGN/OpenIRV
// License: Apache License 2.0

/* 
 * ----------------------------------------------------------------------------
 *  Project:  OpenIRV
 *  Filename: top.v
 *  Purpose:  The very top module of the OpenIRV project.
 * ----------------------------------------------------------------------------
 *  Copyright © 2020-2021, Vaagn Oganesyan <ovgn@protonmail.com>
 *  
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *  
 *      http://www.apache.org/licenses/LICENSE-2.0
 *  
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 * ----------------------------------------------------------------------------
 */


`default_nettype none
`timescale 1ps / 1ps


module top
(
    input   wire            extclk,

    inout   wire    [19:0]  gpio_sensor,

    output  wire            tmds_d0_p,
    output  wire            tmds_d0_n,
    output  wire            tmds_d1_p,
    output  wire            tmds_d1_n,
    output  wire            tmds_d2_p,
    output  wire            tmds_d2_n,
    output  wire            tmds_clk_p,
    output  wire            tmds_clk_n,

    output  wire            hram_r0_ck_p,
    output  wire            hram_r0_ck_n,
    output  wire            hram_r0_reset_n,
    output  wire            hram_r0_cs_n,
    inout   wire            hram_r0_rwds,
    inout   wire    [7:0]   hram_r0_dq,

    output  wire            hram_r1_ck_p,
    output  wire            hram_r1_ck_n,
    output  wire            hram_r1_reset_n,
    output  wire            hram_r1_cs_n,
    inout   wire            hram_r1_rwds,
    inout   wire    [7:0]   hram_r1_dq,

    inout   wire            cnfg_cs_n,
    inout   wire            cnfg_mosi_miso_0,
    inout   wire            cnfg_miso_miso_1,
    inout   wire            cnfg_miso_2,
    inout   wire            cnfg_miso_3,

    output  wire            fx2_ifclk,
    output  wire            av_clkin,

    input   wire            fx2_pa0,
    output  wire            fx2_pa1_led_act_y,
    output  wire            fx2_pa2,
    output  wire            fx2_pa3_led_act_r,
    output  wire            fx2_pa4,
    output  wire            fx2_pa5,
    output  wire            fx2_pa6,
    input   wire            fx2_pa7_hdmi_cec,

    output  wire    [7:0]   fx2_pb,
    output  wire    [7:0]   fx2_av_pd,

    output  wire            fx2_rdy0_slrd,
    output  wire            fx2_rdy1_slwr,

    input   wire            fx2_ctl0_flaga,
    input   wire            fx2_ctl1_flagb,
    input   wire            fx2_ctl2_flagc,

    output  wire            lcd_led_ctrl,
    output  wire            lcd_spi_dat,
    output  wire            lcd_spi_sck,
    output  wire            lcd_spi_rst_n,

    inout   wire            sdio_cmd,
    inout   wire            sdio_clk,
    inout   wire    [3:0]   sdio_dat,

    inout   wire            i2c_sda,
    inout   wire            i2c_scl,
    input   wire            i2c_irq_n,

    output  wire            sensor_bias_boost_pwr_ena,
    output  wire            sensor_core_pwr_ena,
    output  wire            sensor_bias_pwr_ena,
    output  wire            sensor_io_pwr_ena_n,
    output  wire            sensor_bias_volt_sel,

    output  wire            shtr_drive_ena,
    output  wire            focus_drive_ena,
    input   wire            focus_sensor_pulse,

    input   wire            gpio_aux_spi_sck,
    input   wire            gpio_aux_spi_cs_0,
    input   wire            gpio_aux_spi_cs_1,
    input   wire            gpio_aux_spi_miso,
    input   wire            gpio_aux_spi_mosi,
    input   wire            gpio_aux_i2c_sda,
    input   wire            gpio_aux_i2c_scl,

    inout   wire            ext_gpio_0_buf,
    output  wire            ext_gpio_0_dir,
    output  wire            ext_gpio_0_oc,

    inout   wire            ext_gpio_1_buf,
    output  wire            ext_gpio_1_dir,
    output  wire            ext_gpio_1_oc,

    input   wire            ext_gpi_buf,

    output  wire            pwr_fd_clk,
    output  wire            pwr_fd_dat,

    input   wire    [3:0]   btn
);

/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
    localparam GPIO_DIR_INPUT  = 1'b1,
               GPIO_DIR_OUTPUT = 1'b0;
    
    assign ext_gpio_0_buf = 1'bz;
    assign ext_gpio_0_dir = GPIO_DIR_OUTPUT;
    assign ext_gpio_0_oc  = 1'b1; 
    
    assign ext_gpio_1_buf = 1'bz;
    assign ext_gpio_1_dir = GPIO_DIR_OUTPUT;
    assign ext_gpio_1_oc  = 1'b1;  
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
    wire IIC_scl_i;
    wire IIC_scl_o;
    wire IIC_scl_t;
    
    wire IIC_sda_i;
    wire IIC_sda_o;
    wire IIC_sda_t;
    
    IOBUF IIC_scl_iobuf
    (
        .I  ( IIC_scl_o ),
        .IO ( i2c_scl   ),
        .O  ( IIC_scl_i ),
        .T  ( IIC_scl_t )
    );
        
    IOBUF IIC_sda_iobuf
    (
        .I  ( IIC_sda_o ),
        .IO ( i2c_sda   ),
        .O  ( IIC_sda_i ),
        .T  ( IIC_sda_t )
    );
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
    wire SPI_io0_i;
    wire SPI_io0_o;
    wire SPI_io0_t;
    wire SPI_io1_i;
    wire SPI_io1_o;
    wire SPI_io1_t;
    wire SPI_sck_i;
    wire SPI_sck_o;
    wire SPI_sck_t;
    wire SPI_ss_i_0;
    wire SPI_ss_o_0;
    wire SPI_ss_t;
    
    IOBUF SPI_io0_iobuf
    (
        .I  ( SPI_io0_o ),
        .IO ( sdio_cmd  ),
        .O  ( SPI_io0_i ),
        .T  ( SPI_io0_t )
    );
    
    IOBUF SPI_io1_iobuf
    (
        .I  ( SPI_io1_o   ),
        .IO ( sdio_dat[0] ),
        .O  ( SPI_io1_i   ),
        .T  ( SPI_io1_t   )
    );
    
    IOBUF SPI_sck_iobuf
    (
        .I  ( SPI_sck_o ),
        .IO ( sdio_clk  ),
        .O  ( SPI_sck_i ),
        .T  ( SPI_sck_t )
    );
    
    IOBUF SPI_ss_iobuf_0
    (
        .I  ( SPI_ss_o_0  ),
        .IO ( sdio_dat[3] ),
        .O  ( SPI_ss_i_0  ),
        .T  ( SPI_ss_t    )
    );
    
    assign sdio_dat[1] = 1'bz;
    assign sdio_dat[2] = 1'bz;
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
    wire QSPI_ss_i;
    wire QSPI_ss_o;
    wire QSPI_ss_t;
    
    wire QSPI_io0_i;
    wire QSPI_io0_o;
    wire QSPI_io0_t;
    
    wire QSPI_io1_i;
    wire QSPI_io1_o;
    wire QSPI_io1_t;
    
    wire QSPI_io2_i;
    wire QSPI_io2_o;
    wire QSPI_io2_t;
    
    wire QSPI_io3_i;
    wire QSPI_io3_o;
    wire QSPI_io3_t;
    
    
    IOBUF QSPI_ss_iobuf_0
    (
        .I  ( QSPI_ss_o ),
        .IO ( cnfg_cs_n ),
        .O  ( QSPI_ss_i ),
        .T  ( QSPI_ss_t )
    );
    
    IOBUF QSPI_io0_iobuf
    (
        .I  ( QSPI_io0_o        ),
        .IO ( cnfg_mosi_miso_0  ),
        .O  ( QSPI_io0_i        ),
        .T  ( QSPI_io0_t        )
    );
    
    IOBUF QSPI_io1_iobuf
    (
        .I  ( QSPI_io1_o        ),
        .IO ( cnfg_miso_miso_1  ),
        .O  ( QSPI_io1_i        ),
        .T  ( QSPI_io1_t        )
    );
    
    IOBUF QSPI_io2_iobuf
    (
        .I  ( QSPI_io2_o  ),
        .IO ( cnfg_miso_2 ),
        .O  ( QSPI_io2_i  ),
        .T  ( QSPI_io2_t  )
    );
    
    IOBUF QSPI_io3_iobuf
    (
        .I  (QSPI_io3_o   ),
        .IO (cnfg_miso_3  ),
        .O  (QSPI_io3_i   ),
        .T  (QSPI_io3_t   )
    );
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
    wire sensor_bias;
    wire sensor_clk_fwd;
    wire sensor_cmd;
    wire sensor_data_even;
    wire sensor_data_odd;
    wire sensor_ena;
    
    assign gpio_sensor[0]  = 1'bz;
    assign gpio_sensor[1]  = 1'bz;
    assign gpio_sensor[2]  = sensor_ena;
    assign gpio_sensor[3]  = 1'bz;
    assign gpio_sensor[4]  = 1'bz;
    assign gpio_sensor[5]  = sensor_bias;
    assign gpio_sensor[6]  = 1'bz;
    assign gpio_sensor[7]  = 1'bz;
    assign gpio_sensor[8]  = 1'bz;
    assign gpio_sensor[9]  = 1'bz;
    assign gpio_sensor[10] = 1'bz;
    assign gpio_sensor[11] = 1'bz;
    assign gpio_sensor[12] = 1'bz;
    assign gpio_sensor[13] = sensor_clk_fwd;
    assign gpio_sensor[14] = 1'bz;
    assign gpio_sensor[15] = 1'bz;
    assign gpio_sensor[16] = sensor_cmd;
    assign gpio_sensor[17] = 1'bz;
    assign gpio_sensor[18] = 1'bz;
    assign gpio_sensor[19] = 1'bz;
    
    assign sensor_data_odd  = gpio_sensor[3];
    assign sensor_data_even = gpio_sensor[15];
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
    SoC SoC_i
    (
        .extclk                     ( extclk ),
        
        .fd_clk                     ( pwr_fd_clk ),
        .fd_dat                     ( pwr_fd_dat ),
        
        .sensor_bias_boost_pwr_ena  ( sensor_bias_boost_pwr_ena ),
        .sensor_core_pwr_ena        ( sensor_core_pwr_ena       ),
        .sensor_bias_pwr_ena        ( sensor_bias_pwr_ena       ),
        .sensor_io_pwr_ena_n        ( sensor_io_pwr_ena_n       ),
        .sensor_bias_volt_sel       ( sensor_bias_volt_sel      ),
        
        .shtr_drive_ena             ( shtr_drive_ena     ),
        .focus_drive_ena            ( focus_drive_ena    ),
        .focus_sensor_pulse         ( focus_sensor_pulse ),
        
        .act_led                    ( {fx2_pa3_led_act_r, fx2_pa1_led_act_y} ),
        
        .btn_0                      ( btn[0] ),
        .btn_1                      ( btn[1] ),
        .btn_2                      ( btn[2] ),
        .btn_3                      ( btn[3] ),
        
        .lcd_led_ctrl               ( lcd_led_ctrl  ),
        .lcd_resetn                 ( lcd_spi_rst_n ),
        .lcd_spi_scl                ( lcd_spi_sck   ),
        .lcd_spi_sda                ( lcd_spi_dat   ),
        
        .i2c_exp_irq                ( ~i2c_irq_n    ),
        .IIC_scl_i                  ( IIC_scl_i     ),
        .IIC_scl_o                  ( IIC_scl_o     ),
        .IIC_scl_t                  ( IIC_scl_t     ),
        .IIC_sda_i                  ( IIC_sda_i     ),
        .IIC_sda_o                  ( IIC_sda_o     ),
        .IIC_sda_t                  ( IIC_sda_t     ),
        
        .SPI_io0_i                  ( SPI_io0_i     ),
        .SPI_io0_o                  ( SPI_io0_o     ),
        .SPI_io0_t                  ( SPI_io0_t     ),
        .SPI_io1_i                  ( SPI_io1_i     ),
        .SPI_io1_o                  ( SPI_io1_o     ),
        .SPI_io1_t                  ( SPI_io1_t     ),
        .SPI_sck_i                  ( SPI_sck_i     ),
        .SPI_sck_o                  ( SPI_sck_o     ),
        .SPI_sck_t                  ( SPI_sck_t     ),
        .SPI_ss_i                   ( SPI_ss_i_0    ),
        .SPI_ss_o                   ( SPI_ss_o_0    ),
        .SPI_ss_t                   ( SPI_ss_t      ),
        
        .QSPI_ss_i                  ( QSPI_ss_i     ),
        .QSPI_ss_o                  ( QSPI_ss_o     ),
        .QSPI_ss_t                  ( QSPI_ss_t     ),
        .QSPI_io0_i                 ( QSPI_io0_i    ),
        .QSPI_io0_o                 ( QSPI_io0_o    ),
        .QSPI_io0_t                 ( QSPI_io0_t    ),
        .QSPI_io1_i                 ( QSPI_io1_i    ),
        .QSPI_io1_o                 ( QSPI_io1_o    ),
        .QSPI_io1_t                 ( QSPI_io1_t    ),
        .QSPI_io2_i                 ( QSPI_io2_i    ),
        .QSPI_io2_o                 ( QSPI_io2_o    ),
        .QSPI_io2_t                 ( QSPI_io2_t    ),
        .QSPI_io3_i                 ( QSPI_io3_i    ),
        .QSPI_io3_o                 ( QSPI_io3_o    ),
        .QSPI_io3_t                 ( QSPI_io3_t    ),
        
        .sensor_bias                ( sensor_bias       ),
        .sensor_clk_fwd             ( sensor_clk_fwd    ),
        .sensor_cmd                 ( sensor_cmd        ),
        .sensor_data_even           ( sensor_data_even  ),
        .sensor_data_odd            ( sensor_data_odd   ),
        .sensor_ena                 ( sensor_ena        ),
        
        .hdmi_tx_clk_p              ( tmds_clk_p                        ),
        .hdmi_tx_clk_n              ( tmds_clk_n                        ),
        .hdmi_tx_p                  ( {tmds_d2_p, tmds_d1_p, tmds_d0_p} ),
        .hdmi_tx_n                  ( {tmds_d2_n, tmds_d1_n, tmds_d0_n} ),
        
        .AV_av_clk                  ( av_clkin              ),
        .AV_av_dq                   ( fx2_av_pd             ),
        
        .FX2_sfifo_arst_n           ( fx2_pa0               ),
        .FX2_sfifo_addr             ( {fx2_pa5, fx2_pa4}    ),
        .FX2_sfifo_dq               ( fx2_pb                ),
        .FX2_sfifo_flag_a           ( fx2_ctl0_flaga        ),
        .FX2_sfifo_flag_b           ( fx2_ctl1_flagb        ),
        .FX2_sfifo_flag_c           ( fx2_ctl2_flagc        ),
        .FX2_sfifo_flag_d           ( 1'b1                  ),
        .FX2_sfifo_ifclk            ( fx2_ifclk             ),
        .FX2_sfifo_pktend_n         ( fx2_pa6               ),
        .FX2_sfifo_sloe_n           ( fx2_pa2               ),
        .FX2_sfifo_slrd_n           ( fx2_rdy0_slrd         ),
        .FX2_sfifo_slwr_n           ( fx2_rdy1_slwr         ),
        
        .HyperBus_R0_hb_ck_p        ( hram_r0_ck_p          ),
        .HyperBus_R0_hb_ck_n        ( hram_r0_ck_n          ),
        .HyperBus_R0_hb_cs_n        ( hram_r0_cs_n          ),
        .HyperBus_R0_hb_dq          ( hram_r0_dq            ),
        .HyperBus_R0_hb_reset_n     ( hram_r0_reset_n       ),
        .HyperBus_R0_hb_rwds        ( hram_r0_rwds          ),
        
        .HyperBus_R1_hb_ck_p        ( hram_r1_ck_p          ),
        .HyperBus_R1_hb_ck_n        ( hram_r1_ck_n          ),
        .HyperBus_R1_hb_cs_n        ( hram_r1_cs_n          ),
        .HyperBus_R1_hb_dq          ( hram_r1_dq            ),
        .HyperBus_R1_hb_reset_n     ( hram_r1_reset_n       ),
        .HyperBus_R1_hb_rwds        ( hram_r1_rwds          )
    );
    
endmodule

/*-------------------------------------------------------------------------------------------------------------------------------------*/

`default_nettype wire
