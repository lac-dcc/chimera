/* 
 * ----------------------------------------------------------------------------
 *  Project:  OpenHBMC
 *  Filename: hbmc_ctrl.v
 *  Purpose:  HyperBus memory controller module. Includes FSMs that perform
 *            memory burst read/write and configuration registers access.
 * ----------------------------------------------------------------------------
 *  Copyright © 2020-2022, Vaagn Oganesyan <ovgn@protonmail.com>
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
 *  limitations under the License.
 * ----------------------------------------------------------------------------
 */


`default_nettype none
`timescale 1ps / 1ps


module hbmc_ctrl #
(
    parameter   integer C_AXI_DATA_WIDTH           = 32,
    parameter   integer C_HBMC_CLOCK_HZ            = 166000000,
    parameter   integer C_HBMC_FPGA_DRIVE_STRENGTH = 8,
    parameter           C_HBMC_FPGA_SLEW_RATE      = "SLOW",
    parameter   integer C_HBMC_MEM_DRIVE_STRENGTH  = 46,
    parameter   integer C_HBMC_CS_MAX_LOW_TIME_US  = 4,
    parameter           C_HBMC_FIXED_LATENCY       = 0,
    parameter   integer C_ISERDES_CLOCKING_MODE    = 0,
    parameter           C_IODELAY_GROUP_ID         = "HBMC",
    parameter   real    C_IODELAY_REFCLK_MHZ       = 200.0,
    
    parameter           C_RWDS_USE_IDELAY = 0,
    parameter           C_DQ7_USE_IDELAY  = 0,
    parameter           C_DQ6_USE_IDELAY  = 0,
    parameter           C_DQ5_USE_IDELAY  = 0,
    parameter           C_DQ4_USE_IDELAY  = 0,
    parameter           C_DQ3_USE_IDELAY  = 0,
    parameter           C_DQ2_USE_IDELAY  = 0,
    parameter           C_DQ1_USE_IDELAY  = 0,
    parameter           C_DQ0_USE_IDELAY  = 0,
    
    parameter   [4:0]   C_RWDS_IDELAY_TAPS_VALUE = 0,
    parameter   [4:0]   C_DQ7_IDELAY_TAPS_VALUE  = 0,
    parameter   [4:0]   C_DQ6_IDELAY_TAPS_VALUE  = 0,
    parameter   [4:0]   C_DQ5_IDELAY_TAPS_VALUE  = 0,
    parameter   [4:0]   C_DQ4_IDELAY_TAPS_VALUE  = 0,
    parameter   [4:0]   C_DQ3_IDELAY_TAPS_VALUE  = 0,
    parameter   [4:0]   C_DQ2_IDELAY_TAPS_VALUE  = 0,
    parameter   [4:0]   C_DQ1_IDELAY_TAPS_VALUE  = 0,
    parameter   [4:0]   C_DQ0_IDELAY_TAPS_VALUE  = 0
)
(
    input   wire            rst,
    input   wire            clk_hbmc_0,
    input   wire            clk_hbmc_90,
    input   wire            clk_iserdes,
    input   wire            clk_idelay_ref,
    
    input   wire            cmd_valid,
    output  reg             cmd_ready,
    input   wire    [31:0]  cmd_mem_addr,
    input   wire    [15:0]  cmd_word_count,
    input   wire            cmd_wr_not_rd,
    input   wire            cmd_wrap_not_incr,
    
    output  wire    [15:0]  ufifo_data,         // Upstream FIFO data
    output  wire            ufifo_last,         // Upstream FIFO data last word strobe
    output  wire            ufifo_we,           // Upstream FIFO write enable
    
    input   wire    [15:0]  dfifo_data,         // Downstream FIFO data
    input   wire    [1:0]   dfifo_strb,         // Downstream FIFO data byte enable strobes
    output  wire            dfifo_re,           // Downstream FIFO read enable
    
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
    
    localparam  integer MODE_BUFG       = 0,
                        MODE_BUFIO_BUFR = 1;

/*----------------------------------------------------------------------------------------------------------------------------*/
    
    localparam  real    HBMC_CLOCK_PERIOD_NS = 1000000000.0 / C_HBMC_CLOCK_HZ;
    
    localparam  integer MEM_POWER_UP_DELAY_US = 200;
    localparam  integer MEM_POWER_UP_DELAY = (C_HBMC_CLOCK_HZ / 1000000) * MEM_POWER_UP_DELAY_US;
    
    localparam  integer INITIAL_LATENCY = (C_HBMC_CLOCK_HZ <=  83000000)? 3 :       /* Min initial latency for <=  83MHz */
                                          (C_HBMC_CLOCK_HZ <= 100000000)? 4 :       /* Min initial latency for <= 100MHz */
                                          (C_HBMC_CLOCK_HZ <= 133000000)? 5 :       /* Min initial latency for <= 133MHz */
                                          (C_HBMC_CLOCK_HZ <= 166000000)? 6 :       /* Min initial latency for <= 166MHz */
                                          (C_HBMC_CLOCK_HZ <= 200000000)? 7 : 7;    /* Min initial latency for <= 200MHz */      
    
    localparam  integer MIN_RWR = INITIAL_LATENCY - 3;                              /* Min Read-Write recovery time */
    
    localparam  integer MAX_BURST_COUNT = ((C_HBMC_CS_MAX_LOW_TIME_US * 1000) / HBMC_CLOCK_PERIOD_NS - INITIAL_LATENCY * 3);    /* x3 - is a margin */
    
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
    
    localparam  ID0_REG_ADDR     = 48'h0000_0000_0000,
                ID1_REG_ADDR     = 48'h0000_0000_0001,
                CR0_REG_ADDR     = 48'h0000_0100_0000,
                CR1_REG_ADDR     = 48'h0000_0100_0001;
    
/*----------------------------------------------------------------------------------------------------------------------------*/
    
    localparam  CR_0_DRIVE_STRENGTH  = (C_HBMC_MEM_DRIVE_STRENGTH ==  19)? CR_0_DRIVE_STRENGTH_19  :
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
    
    localparam  SINGLE_LATENCY  = INITIAL_LATENCY;
    localparam  DUAL_LATENCY    = INITIAL_LATENCY * 2;
    
    localparam  DQ_DIR_OUTPUT   = 8'h00,
                DQ_DIR_INPUT    = 8'hff;
    
    localparam  RWDS_DIR_OUTPUT = 1'b0,
                RWDS_DIR_INPUT  = 1'b1;
    
/*----------------------------------------------------------------------------------------------------------------------------*/
    
    localparam  WRAPPED_BURST_8_BYTE    = 4,    /* NOT supported by HyperBus, but required for AXI4 */
                WRAPPED_BURST_16_BYTE   = 8,
                WRAPPED_BURST_32_BYTE   = 16,
                WRAPPED_BURST_64_BYTE   = 32,
                WRAPPED_BURST_128_BYTE  = 64;
    
/*----------------------------------------------------------------------------------------------------------------------------*/
    
    /* Mapping 32-bit address to 48-bit HyperRam CA (Command-Address) */
    function [47:0] CA_ADDR;
        input [31:0] addr;
        begin
            CA_ADDR =   {
                            {3{1'b0}},  addr[31:19],    // CA0
                                        addr[18:3],     // CA1
                            {13{1'b0}}, addr[2:0]       // CA2
                        };
        end
    endfunction
    
/*----------------------------------------------------------------------------------------------------------------------------*/
    
    reg     [15:0]  cr0_reg;
    reg     [15:0]  cr1_reg;
    
    
                        reg             reset_n;
                        reg             cs_n;
                        reg             rwr_tc_run;
                        reg             ck_ena;
                        reg     [1:0]   rwds_sdr_i;
                        reg             rwds_t;
                        reg     [15:0]  dq_sdr_i;
    (* KEEP = "TRUE" *) reg     [7:0]   dq_t;
                        reg             dru_iserdes_rst;
                        reg     [7:0]   latency_tc;
                        reg     [2:0]   rwr_tc;
                        reg     [15:0]  power_up_tc;
                        reg     [15:0]  hram_id_reg;
                        reg             fifo_rd;
                        reg             mem_access;
                        reg             word_last;
                        reg     [47:0]  ca;
                        reg     [15:0]  burst_cnt;
                        reg     [15:0]  burst_size;
                        reg     [15:0]  word_count;
                        reg     [15:0]  word_count_prev;
                        reg     [31:0]  mem_addr;
                        reg             wr_not_rd;
                        reg             wrap_not_incr;
    
    
    wire    [5:0]   rwds_iserdes;
    wire    [47:0]  data_iserdes;
    
    wire    [5:0]   rwds_resync;
    wire    [47:0]  data_resync;
    
    wire            hb_recov_data_vld;
    wire    [15:0]  hb_recov_data;
    
    genvar i;
    
/*----------------------------------------------------------------------------------------------------------------------------*/
    
    assign ufifo_data = hb_recov_data;
    assign ufifo_we   = hb_recov_data_vld & mem_access;
    assign ufifo_last = word_last;
    
    assign dfifo_re = fifo_rd;
    
/*----------------------------------------------------------------------------------------------------------------------------*/
    
    hbmc_clk_obuf #
    (
        .DRIVE_STRENGTH ( C_HBMC_FPGA_DRIVE_STRENGTH ),
        .SLEW_RATE      ( C_HBMC_FPGA_SLEW_RATE      )
    )
    hbmc_clk_obuf_inst
    (
        .cen     ( ck_ena      ),
        .clk     ( clk_hbmc_90 ),
        .hb_ck_p ( hb_ck_p     ),
        .hb_ck_n ( hb_ck_n     )
    );
    
/*----------------------------------------------------------------------------------------------------------------------------*/
 
    wire    iserdes_clk_iobuf;
    wire    iserdes_clkdiv;
    
    
    generate
        case (C_ISERDES_CLOCKING_MODE)
            MODE_BUFIO_BUFR: begin
                BUFIO
                BUFIO_inst
                (
                    .I  ( clk_iserdes       ),
                    .O  ( iserdes_clk_iobuf )
                );
                
                
                BUFR #
                (
                    .BUFR_DIVIDE ( "3"       ), // Values: "BYPASS, 1, 2, 3, 4, 5, 6, 7, 8"
                    .SIM_DEVICE  ( "7SERIES" )  // Must be set to "7SERIES"
                )
                BUFR_inst_0
                (
                    .I   ( clk_iserdes      ),  // 1-bit input: Clock buffer input driven by an IBUF, MMCM or local interconnect
                    .CE  ( 1'b1             ),  // 1-bit input: Active high, clock enable (Divided modes only)
                    .CLR ( 1'b0             ),  // 1-bit input: Active high, asynchronous clear (Divided modes only)
                    .O   ( iserdes_clkdiv   )   // 1-bit output: Clock output port
                );
            end
            
            MODE_BUFG: begin
                assign iserdes_clk_iobuf = clk_iserdes;
                assign iserdes_clkdiv = clk_hbmc_0;
            end
            
            default: begin
                INVALID_PARAMETER invalid_parameter_msg();
            end
        
        endcase
    endgenerate
    
/*----------------------------------------------------------------------------------------------------------------------------*/
    
    wire    rwds_imm;
    
    
    hbmc_iobuf #
    (
        .DRIVE_STRENGTH         ( C_HBMC_FPGA_DRIVE_STRENGTH  ),
        .SLEW_RATE              ( C_HBMC_FPGA_SLEW_RATE       ),
        .USE_IDELAY_PRIMITIVE   ( C_RWDS_USE_IDELAY           ),
        .IODELAY_REFCLK_MHZ     ( C_IODELAY_REFCLK_MHZ        ),
        .IODELAY_GROUP_ID       ( C_IODELAY_GROUP_ID          ),
        .IDELAY_TAPS_VALUE      ( C_RWDS_IDELAY_TAPS_VALUE    )
    )
    hbmc_iobuf_rwds
    (
        .arst           ( dru_iserdes_rst   ),
        .oddr_clk       ( clk_hbmc_0        ),
        .iserdes_clk    ( iserdes_clk_iobuf ),
        .iserdes_clkdiv ( iserdes_clkdiv    ),
        .idelay_clk     ( clk_idelay_ref    ),
        
        .buf_io         ( hb_rwds           ),
        .buf_t          ( rwds_t            ),
        .sdr_i          ( ~rwds_sdr_i       ),
        .iserdes_o      ( rwds_iserdes      ),
        .iserdes_comb_o ( rwds_imm          )
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
            hbmc_iobuf #
            (
                .DRIVE_STRENGTH         ( C_HBMC_FPGA_DRIVE_STRENGTH                 ),
                .SLEW_RATE              ( C_HBMC_FPGA_SLEW_RATE                      ),
                .USE_IDELAY_PRIMITIVE   ( C_DQ_VECT_USE_IDELAY_PRIMITIVE[i]          ),
                .IODELAY_REFCLK_MHZ     ( C_IODELAY_REFCLK_MHZ                       ),
                .IODELAY_GROUP_ID       ( C_IODELAY_GROUP_ID                         ),
                .IDELAY_TAPS_VALUE      ( C_DQ_VECT_IDELAY_TAPS_VALUE[i*5 + 4 : i*5] )
            )
            hbmc_iobuf_dq
            (
                .arst           ( rst                             ),
                .oddr_clk       ( clk_hbmc_0                      ),
                .iserdes_clk    ( iserdes_clk_iobuf               ),
                .iserdes_clkdiv ( iserdes_clkdiv                  ),
                .idelay_clk     ( clk_idelay_ref                  ),
                
                .buf_io         ( hb_dq[i]                        ),
                .buf_t          ( dq_t[i]                         ),
                .sdr_i          ( {dq_sdr_i[i + 8], dq_sdr_i[i]}  ),
                .iserdes_o      ( data_iserdes[i * 6 + 5 : i * 6] ),
                .iserdes_comb_o ( /*------------NC------------*/  )
            );
        end
    endgenerate

/*----------------------------------------------------------------------------------------------------------------------------*/
    
    /* Elastic buffer is required only for "BUFIO+BUFR"
     * clocking mode to make a proper data transfer from 
     * BUFR clock domain "iserdes_clkdiv" to "clk_hbmc_0"
     */
    generate
        if (C_ISERDES_CLOCKING_MODE == MODE_BUFIO_BUFR) begin
            hbmc_elastic_buf #
            (
                .DATA_WIDTH ( 54 )   // 8x6 bit of data + 6 bit of RWDS
            )
            hbmc_elastic_buf_inst
            (
                .arst     ( rst                          ),
                .clk_din  ( iserdes_clkdiv               ),
                .clk_dout ( clk_hbmc_0                   ),
                .din      ( {rwds_iserdes, data_iserdes} ),
                .dout     ( {rwds_resync, data_resync}   )
            );
        end else begin
            assign rwds_resync = rwds_iserdes;
            assign data_resync = data_iserdes;
        end
    endgenerate
    
/*----------------------------------------------------------------------------------------------------------------------------*/
    
    hbmc_dru
    hbmc_dru_inst
    (
        .clk                ( clk_hbmc_0        ),
        .arst               ( dru_iserdes_rst   ),
        .rwds_oversampled   ( rwds_resync       ),
        .data_oversampled   ( data_resync       ),
        .recov_valid        ( hb_recov_data_vld ),
        .recov_data         ( hb_recov_data     ),
        .align_error        ( /*------NC-----*/ ),
        .rwds_error         ( /*------NC-----*/ )
    );
    
/*----------------------------------------------------------------------------------------------------------------------------*/
    
    localparam  [2:0]   ST_WR_0            = 3'd0,
                        ST_WR_1            = 3'd1,
                        ST_WR_2            = 3'd2,
                        ST_WR_3            = 3'd3,
                        ST_WR_4            = 3'd4,
                        ST_WR_5            = 3'd5,
                        ST_WR_6            = 3'd6,
                        ST_WR_DONE         = 3'd7,
                        FSM_WR_RESET_STATE = ST_WR_0;
    
    reg         [2:0]   wr_state;
    wire                wr_done  = (wr_state == ST_WR_DONE);
    
    
    task wr_xfer;
        input wire [47:0] cmd;
        input wire [15:0] wr_size;
        input wire [15:0] reg_data;
    begin
        case (wr_state)
            
            ST_WR_0: begin
                if (rwr_tc >= MIN_RWR) begin
                    cs_n       <= 1'b0;
                    rwr_tc_run <= 1'b0;
                    ck_ena     <= 1'b1;
                    rwds_t     <= RWDS_DIR_INPUT;
                    dq_t       <= DQ_DIR_OUTPUT;
                    burst_cnt  <= 16'd1;            // Not zero, as FIFO is FWFT (First Word Falls Through)
                    dq_sdr_i   <= cmd[47:32];
                    rwds_sdr_i <= 2'b00;
                    wr_state   <= ST_WR_1;
                end
            end
            
            ST_WR_1: begin
                dq_sdr_i <= cmd[31:16];
                wr_state <= ST_WR_2;
            end
            
            ST_WR_2: begin
                dq_sdr_i <= cmd[15:0];
                wr_state <= ST_WR_3;
            end
            
            ST_WR_3: begin
                if (cmd & CA_REG_SPACE) begin
                    dq_sdr_i <= reg_data;
                    wr_state <= ST_WR_6;
                end else begin
                    latency_tc <= (rwds_imm)? DUAL_LATENCY - 3 : SINGLE_LATENCY - 3;
                    wr_state <= ST_WR_4;
                end
            end
            
            ST_WR_4: begin
                if (latency_tc == 8'h00) begin
                    fifo_rd  <= 1'b1;
                    rwds_t   <= RWDS_DIR_OUTPUT;
                    wr_state <= ST_WR_5;
                end else begin
                    latency_tc <= latency_tc - 1'b1;
                end
            end
            
            ST_WR_5: begin
                dq_sdr_i   <= dfifo_data;
                rwds_sdr_i <= dfifo_strb;
                if (burst_cnt == wr_size) begin
                    fifo_rd  <= 1'b0;
                    wr_state <= ST_WR_6;
                end else begin
                    burst_cnt <= burst_cnt + 1'b1;
                end
            end
            
            ST_WR_6: begin
                ck_ena   <= 1'b0;
                dq_t     <= DQ_DIR_INPUT;
                rwds_t   <= RWDS_DIR_INPUT;
                wr_state <= ST_WR_DONE;
            end
            
            ST_WR_DONE: begin
                cs_n <= 1'b1;
                rwr_tc_run <= 1'b1;
                wr_state <= FSM_WR_RESET_STATE;
            end
        endcase
    end
    endtask

/*----------------------------------------------------------------------------------------------------------------------------*/

    localparam  [3:0]   ST_RD_0            = 4'd0,
                        ST_RD_1            = 4'd1,
                        ST_RD_2            = 4'd2,
                        ST_RD_3            = 4'd3,
                        ST_RD_4            = 4'd4,
                        ST_RD_5            = 4'd5,
                        ST_RD_6            = 4'd6,
                        ST_RD_7            = 4'd7,
                        ST_RD_8            = 4'd8,
                        ST_RD_DONE         = 4'd9,
                        FSM_RD_RESET_STATE = ST_RD_0;
    
    reg         [3:0]   rd_state;
    wire                rd_done  = (rd_state == ST_RD_DONE);
    
    
    task rd_xfer;
        input  wire [47:0] cmd;
        input  wire [15:0] rd_size;
        output reg  [15:0] reg_data;   // register access output value
    begin
    
        case (rd_state)
            ST_RD_0: begin
                if (rwr_tc >= MIN_RWR) begin
                    cs_n       <= 1'b0;
                    rwr_tc_run <= 1'b0;
                    ck_ena     <= 1'b1;
                    burst_cnt  <= 16'd0;
                    rwds_t     <= RWDS_DIR_INPUT;
                    dq_t       <= DQ_DIR_OUTPUT;
                    dq_sdr_i   <= cmd[47:32];
                    rd_state   <= ST_RD_1;
                end
            end
            
            ST_RD_1: begin
                dq_sdr_i <= cmd[31:16];
                rd_state <= ST_RD_2;
            end
            
            ST_RD_2: begin
                dq_sdr_i <= cmd[15:0];
                rd_state <= ST_RD_3;
            end
            
            ST_RD_3: begin
                latency_tc <= (rwds_imm)? DUAL_LATENCY - 3 : SINGLE_LATENCY - 3;
                rd_state   <= ST_RD_4;
            end
            
            ST_RD_4: begin
                dru_iserdes_rst <= 1'b0;
                if (latency_tc == 8'h00) begin
                    dq_t <= DQ_DIR_INPUT;
                    rd_state <= ST_RD_5;
                end else begin
                    latency_tc <= latency_tc - 1'b1;
                end
            end
            
            ST_RD_5: begin
                if (burst_cnt == rd_size) begin
                    ck_ena <= 1'b0;
                    rd_state <= ST_RD_6;
                end else begin
                    burst_cnt <= burst_cnt + 1'b1;
                end
            end
            
            ST_RD_6: begin
                rd_state <= ST_RD_7;
            end
            
            ST_RD_7: begin
                cs_n <= 1'b1;
                rwr_tc_run <= 1'b1;
                if (hb_recov_data_vld) begin
                    reg_data <= hb_recov_data;
                    rd_state <= ST_RD_8;
                end
            end
            
            ST_RD_8: begin
                if (~hb_recov_data_vld) begin
                    dru_iserdes_rst <= 1'b1;
                    rd_state <= ST_RD_DONE;
                end
            end
            
            ST_RD_DONE: begin
                rd_state <= FSM_RD_RESET_STATE;
            end
        endcase
    end
    endtask
    
/*----------------------------------------------------------------------------------------------------------------------------*/

    task wr_reg;
        input wire [47:0] cmd;
        input wire [15:0] reg_data;
    begin
        wr_xfer(cmd, 16'd2, reg_data);
    end
    endtask

/*----------------------------------------------------------------------------------------------------------------------------*/

    task rd_reg;
        input  wire [47:0] cmd;
        output reg  [15:0] reg_data;
    begin
        mem_access <= 1'b0;
        rd_xfer(cmd, 16'd1, reg_data);
    end
    endtask

/*----------------------------------------------------------------------------------------------------------------------------*/

    task wr_burst;
        input wire [47:0] cmd;
        input wire [15:0] wr_size;
    begin
        wr_xfer(cmd, wr_size, 16'h0000);
    end
    endtask

/*----------------------------------------------------------------------------------------------------------------------------*/

    task rd_burst;
        input wire [47:0] cmd;
        input wire [15:0] rd_size;
        
        reg [15:0]  dummy_reg;
    begin
        mem_access <= 1'b1;
        rd_xfer(cmd, rd_size, dummy_reg);
    end
    endtask

/*----------------------------------------------------------------------------------------------------------------------------*/

    task local_rst;
    begin
        wr_state        <= FSM_WR_RESET_STATE;
        rd_state        <= FSM_RD_RESET_STATE;
        
        cr0_reg         <= CR0_INIT;
        cr1_reg         <= CR1_INIT;
        
        reset_n         <= 1'b0;
        cs_n            <= 1'b1;
        rwr_tc_run      <= 1'b1;
        ck_ena          <= 1'b0;
        rwds_sdr_i      <= 2'b00;
        rwds_t          <= RWDS_DIR_INPUT;
        dq_sdr_i        <= {16{1'b0}};
        dq_t            <= DQ_DIR_INPUT;
        dru_iserdes_rst <= 1'b1;
        latency_tc      <=  {8{1'b0}};
        power_up_tc     <= {16{1'b0}};
        hram_id_reg     <= {16{1'b0}};
        fifo_rd         <= 1'b0;
        mem_access      <= 1'b0;
        word_last       <= 1'b0;
        ca              <= {48{1'b0}};
        burst_cnt       <= {16{1'b0}};
        burst_size      <= {16{1'b0}};
        word_count      <= {16{1'b0}};
        word_count_prev <= {16{1'b0}};
        mem_addr        <= {32{1'b0}};
        wr_not_rd       <= 1'b0;
        wrap_not_incr   <= 1'b0;
        cmd_ready       <= 1'b0;
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
    
    
    always @(posedge clk_hbmc_0 or posedge rst) begin
        if (rst) begin
            local_rst();
            state <= ST_RST;
        end else begin
            
            case (state)
                ST_RST: begin
                    local_rst();
                    state <= ST_POR_DELAY;
                end
                
                
                ST_POR_DELAY: begin
                    reset_n <= 1'b1;
                    if (power_up_tc == MEM_POWER_UP_DELAY) begin
                        state <= ST_SETUP_CR0;
                    end else begin
                        power_up_tc <= power_up_tc + 1'b1;
                    end
                end
                
                
                ST_SETUP_CR0: begin
                    wr_reg(CA_WR | CA_REG_SPACE | CA_BURST_LINEAR | CR0_REG_ADDR, cr0_reg);
                    state <= (wr_done)? ST_SETUP_CR1 : state;
                end
                
                
                ST_SETUP_CR1: begin
                    wr_reg(CA_WR | CA_REG_SPACE | CA_BURST_LINEAR | CR1_REG_ADDR, cr1_reg);
                    state <= (wr_done)? ST_IDLE : state;
                end
                
                
                // ST_READ_ID0: begin
                //     rd_reg(CA_RD | CA_REG_SPACE | CA_BURST_LINEAR | ID0_REG_ADDR, hram_id_reg);
                //     state <= (rd_done)? ST_READ_ID1 : state;
                // end
                // 
                // 
                // ST_READ_ID1: begin
                //     rd_reg(CA_RD | CA_REG_SPACE | CA_BURST_LINEAR | ID1_REG_ADDR, hram_id_reg);
                //     state <= (rd_done)? ST_IDLE : state;
                // end
                
                
                ST_IDLE: begin
                    if (cmd_valid) begin
                        mem_addr      <= cmd_mem_addr;
                        word_count    <= cmd_word_count;
                        wr_not_rd     <= cmd_wr_not_rd;
                        wrap_not_incr <= cmd_wrap_not_incr;
                        
                        cmd_ready <= 1'b1;
                        state <= ST_CMD_PREPARE;
                    end
                end
                
                
                ST_CMD_PREPARE: begin
                    ca <= ((wr_not_rd)? CA_WR : CA_RD) | CA_MEM_SPACE | ((wrap_not_incr)? CA_BURST_WRAPPED : CA_BURST_LINEAR);
                    cmd_ready <= 1'b0;
                    state <= (wrap_not_incr)? ST_CHECK_WRAP_BURST_SIZE : ST_BURST_INIT;
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
                    state <= (wr_done)? ST_BURST_INIT : state;
                end
                
                
                /* First half of the 8-byte wrapped burst transfer */
                ST_WRAP_BURST_8BYTE_XFER_FIRST: begin
                    if (wr_not_rd) begin
                        wr_burst(ca | CA_ADDR(mem_addr), (C_AXI_DATA_WIDTH == 32)? 16'd2 : 16'd1);
                        state <= (wr_done)? ST_WRAP_BURST_8BYTE_ADDR_INCR : state;
                    end else begin
                        rd_burst(ca | CA_ADDR(mem_addr), (C_AXI_DATA_WIDTH == 32)? 16'd2 : 16'd1);
                        state <= (rd_done)? ST_WRAP_BURST_8BYTE_ADDR_INCR : state;
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
                        state <= (wr_done)? ST_BURST_STOP : state;
                    end else begin
                        rd_burst(ca | CA_ADDR(mem_addr), (C_AXI_DATA_WIDTH == 32)? 16'd2 : 16'd1);
                        state <= (rd_done)? ST_BURST_STOP : state;
                    end
                end
                
                
                ST_BURST_INIT: begin
                    /* If AXI transaction size is larger that max burst size,
                     * that depends on max CS low time, it will be divided
                     * into several transactions over HuperBUS. */
                    burst_size <= (word_count < MAX_BURST_COUNT)? word_count : MAX_BURST_COUNT;
                    word_last  <= (word_count == 16'd1)? 1'b1 : 1'b0;
                    state <= ST_BURST_XFER;
                end
                
                
                ST_BURST_XFER: begin
                
                    if (wr_not_rd) begin
                        wr_burst(ca | CA_ADDR(mem_addr), burst_size);
                        state <= (wr_done)? ST_BURST_STOP : state;
                    end else begin
                        rd_burst(ca | CA_ADDR(mem_addr), burst_size);
                        state <= (rd_done)? ST_BURST_STOP : state;
                    end
                    
                    if (dfifo_re | ufifo_we) begin
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
    always @(posedge clk_hbmc_0 or posedge rst) begin
        if (rst) begin
            rwr_tc <= 3'd0;
        end else begin
            if (rwr_tc_run) begin
                rwr_tc <= (rwr_tc == 3'd7)? rwr_tc : rwr_tc + 1'b1;
            end else begin
                rwr_tc <= 3'd0;
            end
        end
    end
    
/*----------------------------------------------------------------------------------------------------------------------------*/

    OBUF #
    (
        .DRIVE  ( C_HBMC_FPGA_DRIVE_STRENGTH ),
        .SLEW   ( C_HBMC_FPGA_SLEW_RATE      )
    )
    OBUF_reset_n
    (
        .I  ( reset_n    ),
        .O  ( hb_reset_n )
    );
    
/*----------------------------------------------------------------------------------------------------------------------------*/

    OBUF #
    (
        .DRIVE  ( C_HBMC_FPGA_DRIVE_STRENGTH ),
        .SLEW   ( C_HBMC_FPGA_SLEW_RATE      )
    )
    OBUF_cs_n
    (
        .I  ( cs_n    ),
        .O  ( hb_cs_n )
    );
    
endmodule

/*----------------------------------------------------------------------------------------------------------------------------*/

`default_nettype wire
