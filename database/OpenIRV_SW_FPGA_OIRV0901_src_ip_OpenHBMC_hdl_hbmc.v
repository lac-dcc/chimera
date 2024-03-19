/* 
 * ----------------------------------------------------------------------------
 *  Project:  OpenHBMC
 *  Filename: hbmc.v
 *  Purpose:  HyperBus memory controller module. Includes FSMs that perform
 *            memory burst read/write and configuration registers access.
 * ----------------------------------------------------------------------------
 *  Copyright © 2020, Vaagn Oganesyan <ovgn@protonmail.com>
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


module hbmc #
(
    parameter integer C_AXI_DATA_WIDTH           = 32,
    parameter integer C_HBMC_CLOCK_HZ            = 166000000,
    parameter integer C_HBMC_FPGA_DRIVE_STRENGTH = 8,
    parameter         C_HBMC_FPGA_SLEW_RATE      = "SLOW",
    parameter integer C_HBMC_MEM_DRIVE_STRENGTH  = 46,
    parameter integer C_HBMC_CS_MAX_LOW_TIME_US  = 4,
    parameter         C_HBMC_FIXED_LATENCY       = 0,
    parameter         C_IODELAY_GROUP_ID         = "HBMC",
    parameter real    C_IODELAY_REFCLK_MHZ       = 200.0,
    
    parameter         C_RWDS_USE_IDELAY = 0,
    parameter         C_DQ7_USE_IDELAY  = 0,
    parameter         C_DQ6_USE_IDELAY  = 0,
    parameter         C_DQ5_USE_IDELAY  = 0,
    parameter         C_DQ4_USE_IDELAY  = 0,
    parameter         C_DQ3_USE_IDELAY  = 0,
    parameter         C_DQ2_USE_IDELAY  = 0,
    parameter         C_DQ1_USE_IDELAY  = 0,
    parameter         C_DQ0_USE_IDELAY  = 0,
    
    parameter [4:0]   C_RWDS_IDELAY_TAPS_VALUE = 0,
    parameter [4:0]   C_DQ7_IDELAY_TAPS_VALUE  = 0,
    parameter [4:0]   C_DQ6_IDELAY_TAPS_VALUE  = 0,
    parameter [4:0]   C_DQ5_IDELAY_TAPS_VALUE  = 0,
    parameter [4:0]   C_DQ4_IDELAY_TAPS_VALUE  = 0,
    parameter [4:0]   C_DQ3_IDELAY_TAPS_VALUE  = 0,
    parameter [4:0]   C_DQ2_IDELAY_TAPS_VALUE  = 0,
    parameter [4:0]   C_DQ1_IDELAY_TAPS_VALUE  = 0,
    parameter [4:0]   C_DQ0_IDELAY_TAPS_VALUE  = 0
)
(
    input   wire            arst,
    input   wire            clk_hbmc_0,
    input   wire            clk_hbmc_270,
    input   wire            clk_idelay_ref,
    
    input   wire            cmd_req,
    output  reg             cmd_ack = 1'b0,
    input   wire    [31:0]  cmd_mem_addr,
    input   wire    [15:0]  cmd_word_count,
    input   wire            cmd_wr_not_rd,
    input   wire            cmd_wrap_not_incr,
    
    output  wire    [15:0]  fifo_dout,
    output  wire            fifo_dout_last,
    output  wire            fifo_dout_we,
    
    input   wire    [15:0]  fifo_din,
    input   wire    [1:0]   fifo_din_strb,
    output  wire            fifo_din_re,
    
    output  wire            hb_ck_p,
    output  wire            hb_ck_n,
    output  wire            hb_reset_n,
    output  wire            hb_cs_n,
    inout   wire            hb_rwds,
    inout   wire    [7:0]   hb_dq
);

/*----------------------------------------------------------------------------------------------------------------------------*/
    
    /* Checking input parameters */
    
    generate
        /* 
         * Min clock frequency in current implementation is limited by max 
         * delay value that IDELAYE2 module can provide to delay the RWDS
         * strobe for the 1/4 of clock period for accurate incoming data 
         * sampling. Upper frequency level is limited by memory part and 
         * FPGA design timing capabilities.
         */
        if (C_HBMC_CLOCK_HZ < 100000000) begin
            INVALID_PARAMETER invalid_parameter_msg();
        end
    endgenerate
    
    
    generate
        /* 
         * This parameter depends only on memory part capabilities and 
         * operating temperature ranges. For HyperRAM and HyperRAM 2.0
         * this value usually does not exceed 4us.
         */
        if (C_HBMC_CS_MAX_LOW_TIME_US > 4) begin
            INVALID_PARAMETER invalid_parameter_msg();
        end
    endgenerate
    
    
    generate
        /* 
         * Memory part possible output drive strength values.
         */
        if ((C_HBMC_MEM_DRIVE_STRENGTH !=  19) &&
            (C_HBMC_MEM_DRIVE_STRENGTH !=  22) &&
            (C_HBMC_MEM_DRIVE_STRENGTH !=  27) &&
            (C_HBMC_MEM_DRIVE_STRENGTH !=  34) &&
            (C_HBMC_MEM_DRIVE_STRENGTH !=  46) &&
            (C_HBMC_MEM_DRIVE_STRENGTH !=  67) &&
            (C_HBMC_MEM_DRIVE_STRENGTH != 115)) begin
            INVALID_PARAMETER invalid_parameter_msg();
        end
    endgenerate
    
/*----------------------------------------------------------------------------------------------------------------------------*/
    
    localparam  real    HBMC_CLOCK_PERIOD_NS = 1000000000.0 / C_HBMC_CLOCK_HZ;
    
    localparam  integer MEM_POWER_UP_DELAY_US = 200;
    localparam  integer MEM_POWER_UP_DELAY = (C_HBMC_CLOCK_HZ / 1000000) * MEM_POWER_UP_DELAY_US;
    
    localparam  integer INITIAL_LATENCY = (C_HBMC_CLOCK_HZ <=  83000000)? 3 :       /* Min initial latency for <=  83MHz */
                                          (C_HBMC_CLOCK_HZ <= 100000000)? 4 :       /* Min initial latency for <= 100MHz */
                                          (C_HBMC_CLOCK_HZ <= 133000000)? 5 :       /* Min initial latency for <= 133MHz */
                                          (C_HBMC_CLOCK_HZ <= 166000000)? 6 :       /* Min initial latency for <= 166MHz */
                                          (C_HBMC_CLOCK_HZ <= 200000000)? 7 : 7;    /* Min initial latency for <= 200MHz */      
    
    localparam  integer MIN_RWR = INITIAL_LATENCY;                                  /* Min Read-Write recovery time */
    
    localparam  integer MAX_BURST_COUNT = ((C_HBMC_CS_MAX_LOW_TIME_US * 1000) / HBMC_CLOCK_PERIOD_NS - INITIAL_LATENCY * 3);    // x3 - is a margin
    
/*----------------------------------------------------------------------------------------------------------------------------*/
    
                                                      /*  |                  */
    localparam  CR_0_NORMAL_OPERATION_DEFAULT       = 16'b1000_0000_0000_0000,
                CR_0_DEEP_POWER_DOWN_ENABLE         = 16'b0000_0000_0000_0000;
    
                                                      /*   |||               */
    localparam  CR_0_DRIVE_STRENGTH_34_DEFAULT      = 16'b0000_0000_0000_0000,
                CR_0_DRIVE_STRENGTH_115             = 16'b0001_0000_0000_0000,
                CR_0_DRIVE_STRENGTH_67              = 16'b0010_0000_0000_0000,
                CR_0_DRIVE_STRENGTH_46              = 16'b0011_0000_0000_0000,
                CR_0_DRIVE_STRENGTH_34              = 16'b0100_0000_0000_0000,
                CR_0_DRIVE_STRENGTH_27              = 16'b0101_0000_0000_0000,
                CR_0_DRIVE_STRENGTH_22              = 16'b0110_0000_0000_0000,
                CR_0_DRIVE_STRENGTH_19              = 16'b0111_0000_0000_0000;
    
                                                      /*       ||||          */
    localparam  CR_0_RESERVED_DEFAULT               = 16'b0000_1111_0000_0000;
    
                                                      /*            ||||     */
    localparam  CR_0_INITIAL_LATENCY_3              = 16'b0000_0000_1110_0000,
                CR_0_INITIAL_LATENCY_4              = 16'b0000_0000_1111_0000,
                CR_0_INITIAL_LATENCY_5              = 16'b0000_0000_0000_0000,
                CR_0_INITIAL_LATENCY_6              = 16'b0000_0000_0001_0000,
                CR_0_INITIAL_LATENCY_7              = 16'b0000_0000_0010_0000;
    
                                                      /*                 |   */
    localparam  CR_0_FIXED_LATENCY_DEFAULT          = 16'b0000_0000_0000_1000,
                CR_0_VARIABLE_LATENCY               = 16'b0000_0000_0000_0000;
    
                                                      /*                  |  */
    localparam  CR_0_HYBRID_BURST_ENABLED           = 16'b0000_0000_0000_0000,
                CR_0_HYBRID_BURST_DISABLED_DEFAULT  = 16'b0000_0000_0000_0100;
    
                                                      /*                   ||*/
    localparam  CR_0_BURST_LENGTH_128               = 16'b0000_0000_0000_0000,
                CR_0_BURST_LENGTH_64                = 16'b0000_0000_0000_0001,
                CR_0_BURST_LENGTH_16                = 16'b0000_0000_0000_0010,
                CR_0_BURST_LENGTH_32_DEFAULT        = 16'b0000_0000_0000_0011,
                CR_0_BURST_LENGTH_MASK              = 16'b1111_1111_1111_1100;
    
/*----------------------------------------------------------------------------------------------------------------------------*/
    
                                                      /*  |||| |||| |||| ||  */
    localparam  CR_1_RESERVED_DEFAULT               = 16'b0000_0000_0000_0000;
    
                                                      /*                   ||*/
    localparam  CR_1_REFRESH_INTERVAL_DEFAULT       = 16'b0000_0000_0000_0010,
                CR_1_REFRESH_INTERVAL_1P5X          = 16'b0000_0000_0000_0011,
                CR_1_REFRESH_INTERVAL_2X            = 16'b0000_0000_0000_0000,
                CR_1_REFRESH_INTERVAL_4X            = 16'b0000_0000_0000_0001;
    
/*----------------------------------------------------------------------------------------------------------------------------*/
    
    localparam  CA_RD            = 48'h8000_0000_0000,
                CA_WR            = 48'h0000_0000_0000,
                CA_REG_SPACE     = 48'h4000_0000_0000,
                CA_MEM_SPACE     = 48'h0000_0000_0000,
                CA_BURST_LINEAR  = 48'h2000_0000_0000,
                CA_BURST_WRAPPED = 48'h0000_0000_0000;
    
    localparam  ID0_REG_ADDR = 48'h0000_0000_0000_0000,
                ID1_REG_ADDR = 48'h0000_0000_0000_0001,
                CR0_REG_ADDR = 48'h0000_0000_0100_0000,
                CR1_REG_ADDR = 48'h0000_0000_0100_0001;
    
/*----------------------------------------------------------------------------------------------------------------------------*/
    
    localparam  CR_0_DRIVE_STRENGTH = (C_HBMC_MEM_DRIVE_STRENGTH ==  19)? CR_0_DRIVE_STRENGTH_19  :
                                      (C_HBMC_MEM_DRIVE_STRENGTH ==  22)? CR_0_DRIVE_STRENGTH_22  :
                                      (C_HBMC_MEM_DRIVE_STRENGTH ==  27)? CR_0_DRIVE_STRENGTH_27  :
                                      (C_HBMC_MEM_DRIVE_STRENGTH ==  34)? CR_0_DRIVE_STRENGTH_34  :
                                      (C_HBMC_MEM_DRIVE_STRENGTH ==  46)? CR_0_DRIVE_STRENGTH_46  :
                                      (C_HBMC_MEM_DRIVE_STRENGTH ==  67)? CR_0_DRIVE_STRENGTH_67  :
                                      (C_HBMC_MEM_DRIVE_STRENGTH == 115)? CR_0_DRIVE_STRENGTH_115 : CR_0_DRIVE_STRENGTH_34_DEFAULT;
    
    localparam  CR_0_INITIAL_LATENCY = (INITIAL_LATENCY == 3)? CR_0_INITIAL_LATENCY_3 :
                                       (INITIAL_LATENCY == 4)? CR_0_INITIAL_LATENCY_4 :
                                       (INITIAL_LATENCY == 5)? CR_0_INITIAL_LATENCY_5 :
                                       (INITIAL_LATENCY == 6)? CR_0_INITIAL_LATENCY_6 : CR_0_INITIAL_LATENCY_7;
    
    localparam  CR_0_LATENCY_MODE = (C_HBMC_FIXED_LATENCY)? CR_0_FIXED_LATENCY_DEFAULT : CR_0_VARIABLE_LATENCY;
    
/*----------------------------------------------------------------------------------------------------------------------------*/
    
    localparam  CR0_INIT = CR_0_NORMAL_OPERATION_DEFAULT      |
                           CR_0_DRIVE_STRENGTH                |
                           CR_0_RESERVED_DEFAULT              |
                           CR_0_INITIAL_LATENCY               |
                           CR_0_LATENCY_MODE                  |
                           CR_0_HYBRID_BURST_DISABLED_DEFAULT |
                           CR_0_BURST_LENGTH_32_DEFAULT;
    
    
    localparam  CR1_INIT = CR_1_RESERVED_DEFAULT | CR_1_REFRESH_INTERVAL_DEFAULT;
    
/*----------------------------------------------------------------------------------------------------------------------------*/
    
    localparam  SINGLE_LATENCY  = ((INITIAL_LATENCY >= 3) && (INITIAL_LATENCY <= 5))? INITIAL_LATENCY : 6;
    
    localparam  DUAL_LATENCY    = SINGLE_LATENCY * 2;
    
    localparam  DQ_DIR_OUTPUT   = 8'h00,
                DQ_DIR_INPUT    = 8'hff;
    
    localparam  RWDS_DIR_OUTPUT = 1'b0,
                RWDS_DIR_INPUT  = 1'b1;
    
/*----------------------------------------------------------------------------------------------------------------------------*/
    
    localparam  WRAPPED_BURST_8_BYTE    = 4,    /* NOT supported by HyperBus, but required for AXI4 */
                WRAPPED_BURST_16_BYTE   = 8,
                WRAPPED_BURST_32_BYTE   = 16,
                WRAPPED_BURST_64_BYTE   = 32,
                WRAPPED_BURST_128_BYTE  = 64,
                WRAPPED_BURST_UNDEFINED = 0;
    
/*----------------------------------------------------------------------------------------------------------------------------*/
    
    /* Mapping 32-bit address to 48-bit HyperRam CA (Command-Address) */
    function [47:0] CA_ADDR;
        input [31:0] addr;
        begin
            CA_ADDR =   {
                            {3{1'b0}}, addr[31:19],     // CA0
                                       addr[18:3],      // CA1
                            {13{1'b0}}, addr[2:0]       // CA2
                        };
        end
    endfunction
    
/*----------------------------------------------------------------------------------------------------------------------------*/
    
    reg     [15:0]  cr0_reg = CR0_INIT;
    reg     [15:0]  cr1_reg = CR1_INIT;
    
                            reg             reset_n         = 1'b0;
                            reg             cs_n            = 1'b1;
                            reg             cen             = 1'b0;
                            reg     [1:0]   rwds_sdr_i      = 2'b00;
                            reg             rwds_t          = RWDS_DIR_INPUT;
                            reg     [15:0]  dq_sdr_i        = 16'h0000;
    (* KEEP  = "TRUE" *)    reg     [7:0]   dq_t            = DQ_DIR_INPUT;
                            reg             rd_srst         = 1'b1;
                            reg     [7:0]   latency_tc      = 8'h00;
                            reg     [7:0]   rwr_tc          = 8'h00;
                            reg     [15:0]  power_up_tc     = 16'h0000;
                            reg     [15:0]  hram_id_reg     = 16'h0000;
                            reg             fifo_rd         = 1'b0;
                            reg             mem_access      = 1'b0;
                            reg             word_last       = 1'b0;
                            reg     [47:0]  ca              = {32{1'b0}};
                            reg     [15:0]  burst_cnt       = {16{1'b0}};
                            reg     [15:0]  burst_size      = {16{1'b0}};
                            reg     [15:0]  word_count      = {16{1'b0}};
                            reg     [15:0]  word_count_prev = {16{1'b0}};
                            reg     [31:0]  mem_addr        = {32{1'b0}};
                            reg             wr_not_rd       = 1'b0;
                            reg             wrap_not_incr   = 1'b0;
    
    wire            srst;
    
    wire    [15:0]  dq_sdr_o;
    wire    [7:0]   dq_sdr_o_vld;
    wire            rwds_clk;
    wire            rwds_delayed;
    wire            rwds_delayed_sync;
        
    wire            hb_recov_data_vld;
    wire    [15:0]  hb_recov_data;
    
    genvar i;
    
/*----------------------------------------------------------------------------------------------------------------------------*/
    
    assign hb_reset_n = reset_n;
    assign hb_cs_n    = cs_n;
    
    assign fifo_din_re = fifo_rd;
    
    assign fifo_dout = hb_recov_data;
    assign fifo_dout_we  = hb_recov_data_vld & mem_access;
    assign fifo_dout_last = word_last;
    
/*----------------------------------------------------------------------------------------------------------------------------*/
    
    hb_clk_obuf #
    (
        .DRIVE_STRENGTH ( C_HBMC_FPGA_DRIVE_STRENGTH ),
        .SLEW_RATE      ( C_HBMC_FPGA_SLEW_RATE      )
    )
    hb_clk_obuf_inst
    (
        .cen     ( cen          ),
        .clk     ( clk_hbmc_270 ),
        .hb_ck_p ( hb_ck_p      ),
        .hb_ck_n ( hb_ck_n      )
    );
    
/*----------------------------------------------------------------------------------------------------------------------------*/
    
    hb_rwds_iobuf #
    (
        .DRIVE_STRENGTH         ( C_HBMC_FPGA_DRIVE_STRENGTH  ),
        .SLEW_RATE              ( C_HBMC_FPGA_SLEW_RATE       ),
        .IODELAY_REFCLK_MHZ     ( C_IODELAY_REFCLK_MHZ        ),
        .IODELAY_GROUP_ID       ( C_IODELAY_GROUP_ID          ),
        .USE_IDELAY_PRIMITIVE   ( C_RWDS_USE_IDELAY           ),
        .IDELAY_TAPS_VALUE      ( C_RWDS_IDELAY_TAPS_VALUE    )
    )
    hb_rwds_iobuf_inst
    (
        .oddr_clk     ( clk_hbmc_0     ),
        .idelay_clk   ( clk_idelay_ref ),
        
        .buf_io       ( hb_rwds        ),
        .buf_t        ( rwds_t         ),
        .sdr_i        ( ~rwds_sdr_i    ),
        .rwds_delayed ( rwds_delayed   )
    );
    
/*----------------------------------------------------------------------------------------------------------------------------*/

    BUFR #
    (
        .BUFR_DIVIDE ( "BYPASS"  ), // Values: "BYPASS, 1, 2, 3, 4, 5, 6, 7, 8"
        .SIM_DEVICE  ( "7SERIES" )  // Must be set to "7SERIES"
    )
    BUFR_inst
    (
        .I   ( rwds_delayed ),  // 1-bit input: Clock buffer input driven by an IBUFG, MMCM or local interconnect
        .CE  ( 1'b1         ),  // 1-bit input: Active high, clock enable (Divided modes only)
        .CLR ( 1'b0         ),  // 1-bit input: Active high, asynchronous clear (Divided modes only)
        .O   ( rwds_clk     )   // 1-bit output: Clock output port
    );

/*----------------------------------------------------------------------------------------------------------------------------*/
    
    localparam  [7:0]   C_DQ_VECT_USE_IDELAY_PRIMITIVE = {
                                                             (C_DQ7_USE_IDELAY)? 1'b1 : 1'b0,
                                                             (C_DQ6_USE_IDELAY)? 1'b1 : 1'b0,
                                                             (C_DQ5_USE_IDELAY)? 1'b1 : 1'b0,
                                                             (C_DQ4_USE_IDELAY)? 1'b1 : 1'b0,
                                                             (C_DQ3_USE_IDELAY)? 1'b1 : 1'b0,
                                                             (C_DQ2_USE_IDELAY)? 1'b1 : 1'b0,
                                                             (C_DQ1_USE_IDELAY)? 1'b1 : 1'b0,
                                                             (C_DQ0_USE_IDELAY)? 1'b1 : 1'b0
                                                         };
    
    localparam  [39:0]  C_DQ_VECT_IDELAY_TAPS_VALUE =   {
                                                            C_DQ7_IDELAY_TAPS_VALUE,
                                                            C_DQ6_IDELAY_TAPS_VALUE,
                                                            C_DQ5_IDELAY_TAPS_VALUE,
                                                            C_DQ4_IDELAY_TAPS_VALUE,
                                                            C_DQ3_IDELAY_TAPS_VALUE,
                                                            C_DQ2_IDELAY_TAPS_VALUE,
                                                            C_DQ1_IDELAY_TAPS_VALUE,
                                                            C_DQ0_IDELAY_TAPS_VALUE
                                                        };
    
    generate
        for (i = 0; i < 8; i = i + 1) begin : dq
            hb_dq_iobuf #
            (
                .DRIVE_STRENGTH         ( C_HBMC_FPGA_DRIVE_STRENGTH                  ),
                .SLEW_RATE              ( C_HBMC_FPGA_SLEW_RATE                       ),
                .IODELAY_REFCLK_MHZ     ( C_IODELAY_REFCLK_MHZ                        ),
                .IODELAY_GROUP_ID       ( C_IODELAY_GROUP_ID                          ),
                .USE_IDELAY_PRIMITIVE   ( C_DQ_VECT_USE_IDELAY_PRIMITIVE[i]           ),
                .IDELAY_TAPS_VALUE      ( C_DQ_VECT_IDELAY_TAPS_VALUE[i*5 + 4 : i*5 ] )
            )
            hb_dq_iobuf_inst
            (
                .arst       ( rd_srst         ),
                .oddr_clk   ( clk_hbmc_0      ),
                .iddr_clk   ( rwds_clk        ),
                .idelay_clk ( clk_idelay_ref  ),
                
                .buf_io     ( hb_dq[i]        ),
                .buf_t      ( dq_t[i]         ),
                .sdr_i      ( {dq_sdr_i[i + 8], dq_sdr_i[i]} ),
                .sdr_o      ( {dq_sdr_o[i + 8], dq_sdr_o[i]} ),
                .sdr_o_vld  ( dq_sdr_o_vld[i] )
            );
        end
    endgenerate

/*----------------------------------------------------------------------------------------------------------------------------*/

    hb_elastic_buf hb_elastic_buf_inst
    (
        .clk_din    ( ~rwds_clk         ),
        .din        ( dq_sdr_o          ),
        .din_vld    ( &dq_sdr_o_vld     ),
        
        .srst       ( rd_srst           ),
        .clk_dout   ( clk_hbmc_0        ),
        .dout       ( hb_recov_data     ),
        .dout_vld   ( hb_recov_data_vld )
    );

/*----------------------------------------------------------------------------------------------------------------------------*/

    sync_cdc_bit #(.C_SYNC_STAGES(3)) arst_sync
    (
        .clk    ( clk_hbmc_0 ),
        .d      ( arst       ),
        .q      ( srst       )
    );

/*----------------------------------------------------------------------------------------------------------------------------*/

    sync_cdc_bit #(.C_SYNC_STAGES(2)) rdws_sync
    (
        .clk    ( clk_hbmc_0        ),
        .d      ( rwds_delayed      ),
        .q      ( rwds_delayed_sync )
    );

/*----------------------------------------------------------------------------------------------------------------------------*/

    localparam  [2:0]   ST_WR_REG_0             = 3'd0,
                        ST_WR_REG_1             = 3'd1,
                        ST_WR_REG_2             = 3'd2,
                        ST_WR_REG_3             = 3'd3,
                        ST_WR_REG_4             = 3'd4,
                        ST_WR_REG_5             = 3'd5,
                        ST_WR_REG_6             = 3'd6,
                        ST_WR_REG_DONE          = 3'd7,
                        FSM_WR_REG_RESET_STATE  = ST_WR_REG_0;
    
    reg         [2:0]   wr_reg_state = FSM_WR_REG_RESET_STATE;
    wire                wr_reg_done  = (wr_reg_state == ST_WR_REG_DONE);

    task wr_reg;
        input   [47:0]  cmd;
        input   [15:0]  reg_data;
    begin
        case (wr_reg_state)
            
            ST_WR_REG_0: begin
                if (rwr_tc >= MIN_RWR) begin
                    wr_reg_state <= ST_WR_REG_1;
                end
            end
            
            ST_WR_REG_1: begin
                cs_n     <= 1'b0;
                cen      <= 1'b1;
                rwds_t   <= RWDS_DIR_INPUT;
                dq_t     <= DQ_DIR_OUTPUT;
                dq_sdr_i <= cmd[47:32];
                wr_reg_state <= ST_WR_REG_2;
            end
            
            ST_WR_REG_2: begin
                dq_sdr_i <= cmd[31:16];
                wr_reg_state <= ST_WR_REG_3;
            end
            
            ST_WR_REG_3: begin
                dq_sdr_i <= cmd[15:0];
                wr_reg_state <= ST_WR_REG_4;
            end
            
            ST_WR_REG_4: begin
                dq_sdr_i <= reg_data;
                wr_reg_state <= ST_WR_REG_5;
            end
            
            ST_WR_REG_5: begin
                cen  <= 1'b0;
                dq_t <= DQ_DIR_INPUT;
                wr_reg_state <= ST_WR_REG_6;
            end
            
            ST_WR_REG_6: begin
                cs_n <= 1'b1;
                wr_reg_state <= ST_WR_REG_DONE;
            end
            
            ST_WR_REG_DONE: begin
                wr_reg_state <= FSM_WR_REG_RESET_STATE;
            end
            
            default: begin
                wr_reg_state <= FSM_WR_REG_RESET_STATE;
            end
        endcase
    end
    endtask
    
/*----------------------------------------------------------------------------------------------------------------------------*/
    
    localparam  [2:0]   ST_WR_BURST_0             = 3'd0,
                        ST_WR_BURST_1             = 3'd1,
                        ST_WR_BURST_2             = 3'd2,
                        ST_WR_BURST_3             = 3'd3,
                        ST_WR_BURST_4             = 3'd4,
                        ST_WR_BURST_5             = 3'd5,
                        ST_WR_BURST_6             = 3'd6,
                        ST_WR_BURST_DONE          = 3'd7,
                        FSM_WR_BURST_RESET_STATE  = ST_WR_BURST_0;
    
    reg         [2:0]   wr_burst_state = FSM_WR_BURST_RESET_STATE;
    wire                wr_burst_done  = (wr_burst_state == ST_WR_BURST_DONE);

    task wr_burst;
        input   [47:0]  cmd;
        input   [15:0]  wr_burst_size;
    begin
        case (wr_burst_state)
            
            ST_WR_BURST_0: begin
                if (rwr_tc >= MIN_RWR) begin
                    cs_n       <= 1'b0;
                    cen        <= 1'b1;
                    rwds_t     <= RWDS_DIR_INPUT;
                    dq_t       <= DQ_DIR_OUTPUT;
                    burst_cnt  <= 16'd1;            // Not zero, as FIFO is FWFT (first word falls through)
                    dq_sdr_i   <= cmd[47:32];
                    rwds_sdr_i <= 2'b00;
                    wr_burst_state <= ST_WR_BURST_1;
                end
            end
            
            ST_WR_BURST_1: begin
                dq_sdr_i <= cmd[31:16];
                wr_burst_state <= ST_WR_BURST_2;
            end
            
            ST_WR_BURST_2: begin
                dq_sdr_i <= cmd[15:0];
                wr_burst_state <= ST_WR_BURST_3;
            end
            
            ST_WR_BURST_3: begin
                latency_tc <= (rwds_delayed_sync)? DUAL_LATENCY - 3 : SINGLE_LATENCY - 3;
                wr_burst_state <= ST_WR_BURST_4;
            end
            
            ST_WR_BURST_4: begin
                if (latency_tc == 8'h00) begin
                    fifo_rd <= 1'b1;
                    rwds_t <= RWDS_DIR_OUTPUT;
                    wr_burst_state <= ST_WR_BURST_5;
                end else begin
                    latency_tc <= latency_tc - 1'b1;
                end
            end
            
            ST_WR_BURST_5: begin
                dq_sdr_i   <= fifo_din;
                rwds_sdr_i <= fifo_din_strb;
                if (burst_cnt == wr_burst_size) begin
                    fifo_rd <= 1'b0;
                    wr_burst_state <= ST_WR_BURST_6;
                end else begin
                    burst_cnt <= burst_cnt + 1'b1;
                end
            end
            
            ST_WR_BURST_6: begin
                cen    <= 1'b0;
                dq_t   <= DQ_DIR_INPUT;
                rwds_t <= RWDS_DIR_INPUT;
                wr_burst_state <= ST_WR_BURST_DONE;
            end
            
            ST_WR_BURST_DONE: begin
                cs_n <= 1'b1;
                wr_burst_state <= FSM_WR_BURST_RESET_STATE;
            end
        endcase
    end
    endtask

/*----------------------------------------------------------------------------------------------------------------------------*/
    
    localparam  [2:0]   ST_RD_REG_0             = 3'd0,
                        ST_RD_REG_1             = 3'd1,
                        ST_RD_REG_2             = 3'd2,
                        ST_RD_REG_3             = 3'd3,
                        ST_RD_REG_4             = 3'd4,
                        ST_RD_REG_5             = 3'd5,
                        ST_RD_REG_6             = 3'd6,
                        ST_RD_REG_DONE          = 3'd7,
                        FSM_RD_REG_RESET_STATE  = ST_RD_REG_0;
    
    reg         [2:0]   rd_reg_state = FSM_RD_REG_RESET_STATE;
    wire                rd_reg_done  = (rd_reg_state == ST_RD_REG_DONE);
    
    task rd_reg;
        input       [47:0]  cmd;
        output  reg [15:0]  reg_data;
    begin
    
        case (rd_reg_state)
            ST_RD_REG_0: begin
                if (rwr_tc >= MIN_RWR) begin
                    rd_reg_state <= ST_RD_REG_1;
                end
            end
            
            ST_RD_REG_1: begin
                cs_n         <= 1'b0;
                cen          <= 1'b1;
                rd_srst      <= 1'b1;
                mem_access   <= 1'b0;
                rwds_t       <= RWDS_DIR_INPUT;
                dq_t         <= DQ_DIR_OUTPUT;
                dq_sdr_i     <= cmd[47:32];
                rd_reg_state <= ST_RD_REG_2;
            end
            
            ST_RD_REG_2: begin
                dq_sdr_i <= cmd[31:16];
                rd_reg_state <= ST_RD_REG_3;
            end
            
            ST_RD_REG_3: begin
                dq_sdr_i <= cmd[15:0];
                rd_reg_state <= ST_RD_REG_4;
            end
            
            ST_RD_REG_4: begin
                latency_tc <= (rwds_delayed_sync)? DUAL_LATENCY - 3 : SINGLE_LATENCY - 3;
                rd_reg_state <= ST_RD_REG_5;
            end
            
            ST_RD_REG_5: begin
                if (latency_tc == 8'h00) begin
                    rd_srst <= 1'b0;
                    dq_t <= DQ_DIR_INPUT;
                    rd_reg_state <= ST_RD_REG_6;
                end else begin
                    latency_tc <= latency_tc - 1'b1;
                end
            end
            
            ST_RD_REG_6: begin
                if (hb_recov_data_vld) begin
                    cen  <= 1'b0;
                    cs_n <= 1'b1;
                    rd_srst <= 1'b1;
                    reg_data <= hb_recov_data;
                    rd_reg_state <= ST_RD_REG_DONE;
                end
            end
            
            ST_RD_REG_DONE: begin
                rd_reg_state <= FSM_RD_REG_RESET_STATE;
            end
        endcase
    end
    endtask
    
/*----------------------------------------------------------------------------------------------------------------------------*/

    localparam  [3:0]   ST_RD_BURST_0            = 4'd0,
                        ST_RD_BURST_1            = 4'd1,
                        ST_RD_BURST_2            = 4'd2,
                        ST_RD_BURST_3            = 4'd3,
                        ST_RD_BURST_4            = 4'd4,
                        ST_RD_BURST_5            = 4'd5,
                        ST_RD_BURST_6            = 4'd6,
                        ST_RD_BURST_7            = 4'd7,
                        ST_RD_BURST_8            = 4'd8,
                        ST_RD_BURST_9            = 4'd9,
                        ST_RD_BURST_DONE         = 4'd10,
                        FSM_RD_BURST_RESET_STATE = ST_RD_BURST_0;
    
    reg         [3:0]   rd_burst_state = FSM_RD_BURST_RESET_STATE;
    wire                rd_burst_done  = (rd_burst_state == ST_RD_BURST_DONE);
    
    task rd_burst;
        input   [47:0]  cmd;
        input   [15:0]  rd_burst_size;
    begin
    
        case (rd_burst_state)
            ST_RD_BURST_0: begin
                if (rwr_tc >= MIN_RWR) begin
                    cs_n       <= 1'b0;
                    cen        <= 1'b1;
                    rd_srst    <= 1'b1;
                    mem_access <= 1'b1;
                    rwds_t     <= RWDS_DIR_INPUT;
                    dq_t       <= DQ_DIR_OUTPUT;
                    burst_cnt  <= 16'd0;
                    dq_sdr_i   <= cmd[47:32];
                    rd_burst_state <= ST_RD_BURST_1;
                end
            end
            
            ST_RD_BURST_1: begin
                dq_sdr_i <= cmd[31:16];
                rd_burst_state <= ST_RD_BURST_2;
            end
            
            ST_RD_BURST_2: begin
                dq_sdr_i <= cmd[15:0];
                rd_burst_state <= ST_RD_BURST_3;
            end
            
            ST_RD_BURST_3: begin
                latency_tc <= (rwds_delayed_sync)? DUAL_LATENCY - 3 : SINGLE_LATENCY - 3;
                rd_burst_state <= ST_RD_BURST_4;
            end
            
            ST_RD_BURST_4: begin
                if (latency_tc == 8'h00) begin
                    rd_srst <= 1'b0;
                    dq_t <= DQ_DIR_INPUT;
                    rd_burst_state <= ST_RD_BURST_5;
                end else begin
                    latency_tc <= latency_tc - 1'b1;
                end
            end
            
            ST_RD_BURST_5: begin
                if (burst_cnt == rd_burst_size) begin
                    rd_burst_state <= ST_RD_BURST_6;
                end else begin
                    burst_cnt <= burst_cnt + 1'b1;
                end
            end
            
            ST_RD_BURST_6: begin
                rd_burst_state <= ST_RD_BURST_7;
            end
            
            ST_RD_BURST_7: begin
                rd_burst_state <= ST_RD_BURST_8;
            end
            
            ST_RD_BURST_8: begin
                cen  <= 1'b0;
                cs_n <= 1'b1;
                if (hb_recov_data_vld) begin
                    rd_burst_state <= ST_RD_BURST_9;
                end
            end
            
            ST_RD_BURST_9: begin
                if (~hb_recov_data_vld) begin
                    rd_srst <= 1'b1;
                    rd_burst_state <= ST_RD_BURST_DONE;
                end
            end
            
            ST_RD_BURST_DONE: begin
                rd_burst_state <= FSM_RD_BURST_RESET_STATE;
            end
        endcase
    end
    endtask

/*----------------------------------------------------------------------------------------------------------------------------*/

    task local_rst;
    begin
        wr_reg_state    <= FSM_WR_REG_RESET_STATE;
        rd_reg_state    <= FSM_RD_REG_RESET_STATE;
        
        wr_burst_state  <= FSM_WR_BURST_RESET_STATE;
        rd_burst_state  <= FSM_RD_BURST_RESET_STATE;
        
        cr0_reg         <= CR0_INIT;
        cr1_reg         <= CR1_INIT;
        
        reset_n         <= 1'b0;
        cs_n            <= 1'b1;
        cen             <= 1'b0;
        rwds_t          <= RWDS_DIR_INPUT;
        dq_t            <= DQ_DIR_INPUT;
        rd_srst         <= 1'b1;
        cmd_ack         <= 1'b0;
        power_up_tc     <= 16'h0000;
        fifo_rd         <= 1'b0;
        word_last       <= 1'b0;
        word_count_prev <= WRAPPED_BURST_UNDEFINED;
    end
    endtask
    
/*----------------------------------------------------------------------------------------------------------------------------*/
    
    localparam  [3:0]   ST_RST                          = 4'd0,
                        ST_POR_DELAY                    = 4'd1,
                        
                        ST_SETUP_CR0                    = 4'd2,
                        ST_SETUP_CR1                    = 4'd3,
                        
                        ST_READ_ID0                     = 4'd4,
                        ST_READ_ID1                     = 4'd5,
                        
                        ST_IDLE                         = 4'd6,
                        ST_CMD_PREPARE                  = 4'd7,
                        
                        ST_CHECK_WRAP_BURST_SIZE        = 4'd8,
                        ST_CONFIG_WRAP_BURST_SIZE       = 4'd9,
                        
                        ST_WRAP_BURST_8BYTE_XFER_FIRST  = 4'd10,
                        ST_WRAP_BURST_8BYTE_ADDR_INCR   = 4'd11,
                        ST_WRAP_BURST_8BYTE_XFER_SECOND = 4'd12,
                        
                        ST_BURST_INIT                   = 4'd13,
                        ST_BURST_XFER                   = 4'd14,
                        ST_BURST_STOP                   = 4'd15;
    
    reg         [3:0]   state = ST_RST;
    
    
    always @(posedge clk_hbmc_0) begin
        if (srst) begin
            local_rst();
            state <= ST_RST;
        end else begin
            
            case (state)
                ST_RST: begin
                    local_rst();
                    state <= ST_POR_DELAY;
                end
                
                
                ST_POR_DELAY: begin
                    reset_n  <= 1'b1;
                    if (power_up_tc == MEM_POWER_UP_DELAY) begin
                        state <= ST_SETUP_CR0;
                    end else begin
                        power_up_tc <= power_up_tc + 1'b1;
                    end
                end
                
                
                ST_SETUP_CR0: begin
                    wr_reg(CA_WR | CA_REG_SPACE | CA_BURST_LINEAR | CR0_REG_ADDR, cr0_reg);
                    state <= (wr_reg_done)? ST_SETUP_CR1 : state;
                end
                
                
                ST_SETUP_CR1: begin
                    wr_reg(CA_WR | CA_REG_SPACE | CA_BURST_LINEAR | CR1_REG_ADDR, cr1_reg);
                    state <= (wr_reg_done)? ST_READ_ID0 : state;
                end
                
                
                ST_READ_ID0: begin
                    rd_reg(CA_RD | CA_REG_SPACE | CA_BURST_LINEAR | ID0_REG_ADDR, hram_id_reg);
                    state <= (rd_reg_done)? ST_READ_ID1 : state;
                end
                
                
                ST_READ_ID1: begin
                    rd_reg(CA_RD | CA_REG_SPACE | CA_BURST_LINEAR | ID1_REG_ADDR, hram_id_reg);
                    state <= (rd_reg_done)? ST_IDLE : state;
                end
                
                
                ST_IDLE: begin
                    if (cmd_req) begin
                        mem_addr      <= cmd_mem_addr;
                        word_count    <= cmd_word_count;
                        wr_not_rd     <= cmd_wr_not_rd;
                        wrap_not_incr <= cmd_wrap_not_incr;
                        
                        cmd_ack <= 1'b1;
                        state <= ST_CMD_PREPARE;
                    end
                end
                
                
                ST_CMD_PREPARE: begin
                    ca <= ((wr_not_rd)? CA_WR : CA_RD) | CA_MEM_SPACE | ((wrap_not_incr)? CA_BURST_WRAPPED : CA_BURST_LINEAR);
                    
                    if (~cmd_req) begin
                        cmd_ack <= 1'b0;
                        state <= (wrap_not_incr)? ST_CHECK_WRAP_BURST_SIZE : ST_BURST_INIT;
                    end
                end
                
                
                ST_CHECK_WRAP_BURST_SIZE: begin
                /*
                 * Before starting each new wrapped transfer, the burst size in CR0 
                 * configuration register is going to be modified if necessary. This
                 * feature allows to dynamically support all types of wrapped bursts.
                 * AXI4 specifies wrapped burst length of 2,4,8,16 beats.
                 *
                 * For 64-bit AXI4 bus we have following wrapped burst lengths:
                 * 64bit x 2  beats = 16 bytes  - supported by HyperBus
                 * 64bit x 4  beats = 32 bytes  - supported by HyperBus
                 * 64bit x 8  beats = 64 bytes  - supported by HyperBus
                 * 64bit x 16 beats = 128 bytes - supported by HyperBus
                 *
                 * For 32-bit AXI4 bus we have following wrapped burst lengths:
                 * 32bit x 2  beats = 8  bytes  - NOT supported by HyperBus (-_-)
                 * 32bit x 4  beats = 16 bytes  - supported by HyperBus
                 * 32bit x 8  beats = 32 bytes  - supported by HyperBus
                 * 32bit x 16 beats = 64 bytes  - supported by HyperBus
                 */
                    if ((C_AXI_DATA_WIDTH == 64) || (word_count != WRAPPED_BURST_8_BYTE)) begin
                        
                        /* Check if new wrapped burst size changed */
                        if (word_count_prev != word_count) begin
                            case (word_count)
                                WRAPPED_BURST_16_BYTE:  cr0_reg <= cr0_reg & CR_0_BURST_LENGTH_MASK | CR_0_BURST_LENGTH_16;
                                WRAPPED_BURST_32_BYTE:  cr0_reg <= cr0_reg & CR_0_BURST_LENGTH_MASK | CR_0_BURST_LENGTH_32_DEFAULT;
                                WRAPPED_BURST_64_BYTE:  cr0_reg <= cr0_reg & CR_0_BURST_LENGTH_MASK | CR_0_BURST_LENGTH_64;
                                WRAPPED_BURST_128_BYTE: cr0_reg <= cr0_reg & CR_0_BURST_LENGTH_MASK | CR_0_BURST_LENGTH_128;
                                default:                cr0_reg <= cr0_reg;
                            endcase
                            
                            word_count_prev <= word_count;
                            state <= ST_CONFIG_WRAP_BURST_SIZE;
                        end else begin
                            state <= ST_BURST_INIT;
                        end
                    end else begin
                    /*
                     * Unfortunately 8-byte wrapped burst configuration is not supported 
                     * by HyperBus. That's why this case will be implemented by two separate
                     * linear bursts to keep this memory controller fully AXI4 compatible.
                     * Burst separation will cause performance degradation, that's why
                     * consider NOT using this wrapped burst length in your system.
                     */
                        state <= ST_WRAP_BURST_8BYTE_XFER_FIRST;
                    end
                end
                
                /* Write new wrapped burst size value to CR0 */
                ST_CONFIG_WRAP_BURST_SIZE: begin
                    wr_reg(CA_WR | CA_REG_SPACE | CA_BURST_LINEAR | CR0_REG_ADDR, cr0_reg);
                    state <= (wr_reg_done)? ST_BURST_INIT : state;
                end
                
                
                /* First half of the 8-byte wrapped burst transfer */
                ST_WRAP_BURST_8BYTE_XFER_FIRST: begin
                    if (wr_not_rd) begin
                        wr_burst(ca | CA_ADDR(mem_addr), (C_AXI_DATA_WIDTH == 32)? 16'd2 : 16'd1);
                        state <= (wr_burst_done)? ST_WRAP_BURST_8BYTE_ADDR_INCR : state;
                    end else begin
                        rd_burst(ca | CA_ADDR(mem_addr), (C_AXI_DATA_WIDTH == 32)? 16'd2 : 16'd1);
                        state <= (rd_burst_done)? ST_WRAP_BURST_8BYTE_ADDR_INCR : state;
                    end
                end
                
                
                /* Incrementing wrapped burst address */
                ST_WRAP_BURST_8BYTE_ADDR_INCR: begin
                
                    if (C_AXI_DATA_WIDTH == 32) begin
                        mem_addr <= (mem_addr[1])? (mem_addr & 32'hFFFF_FFFC) : (mem_addr | 32'h2);
                    end else begin  // 16-bit
                        mem_addr <= (mem_addr[1])? (mem_addr & 32'hFFFF_FFFE) : (mem_addr | 32'h1);
                    end
                    
                    word_last <= 1'b1;
                    state <= ST_WRAP_BURST_8BYTE_XFER_SECOND;
                end
                
                
                /* Second half of the 8-byte wrapped burst transfer */
                ST_WRAP_BURST_8BYTE_XFER_SECOND: begin
                    if (wr_not_rd) begin
                        wr_burst(ca | CA_ADDR(mem_addr), (C_AXI_DATA_WIDTH == 32)? 16'd2 : 16'd1);
                        state <= (wr_burst_done)? ST_BURST_STOP : state;
                    end else begin
                        rd_burst(ca | CA_ADDR(mem_addr), (C_AXI_DATA_WIDTH == 32)? 16'd2 : 16'd1);
                        state <= (rd_burst_done)? ST_BURST_STOP : state;
                    end
                end
                
                
                ST_BURST_INIT: begin
                    /* If AXI transfer is bigger that the max burst size,
                     * it will be divided into several transfer. */
                    burst_size <= (word_count < MAX_BURST_COUNT)? word_count : MAX_BURST_COUNT;
                    word_last  <= (word_count == 16'd1)? 1'b1 : 1'b0;
                    state <= ST_BURST_XFER;
                end
                
                
                ST_BURST_XFER: begin
                
                    if (wr_not_rd) begin
                        wr_burst(ca | CA_ADDR(mem_addr), burst_size);
                        state <= (wr_burst_done)? ST_BURST_STOP : state;
                    end else begin
                        rd_burst(ca | CA_ADDR(mem_addr), burst_size);
                        state <= (rd_burst_done)? ST_BURST_STOP : state;
                    end
                    
                    if (fifo_din_re | fifo_dout_we) begin
                        mem_addr <= mem_addr + 1'b1;
                        word_count <= word_count - 1'b1;
                        
                        if (word_count == 16'd2) begin
                            word_last <= 1'b1;
                        end
                    end
                end
                
                
                ST_BURST_STOP: begin
                    if (word_last) begin
                        word_last <= 1'b0;
                        state <= ST_IDLE;
                    end else begin
                        state <= ST_BURST_INIT;
                    end
                end
                
                
                default: begin
                    state <= ST_RST;
                end
                
            endcase
        end
    end
    
/*----------------------------------------------------------------------------------------------------------------------------*/

    /* RWR (Read-Write Recovery) counter process */
    always @(posedge clk_hbmc_0) begin
        if (srst) begin
            rwr_tc <= 8'h00;
        end else begin
            if (cs_n) begin
                rwr_tc <= (rwr_tc == 8'hff)? rwr_tc : rwr_tc + 1'b1;
            end else begin
                rwr_tc <= 8'h00;
            end
        end
    end
    
endmodule

/*----------------------------------------------------------------------------------------------------------------------------*/

`default_nettype wire
