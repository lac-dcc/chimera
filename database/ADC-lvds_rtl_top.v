// This program was cloned from: https://github.com/cjhonlyone/ADC-lvds
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/26 16:26:49
// Design Name: 
// Module Name: top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module top # (
    parameter AdcChnls = 2, 
    parameter AdcWireMode = 1, 
    parameter AdcBits = 14,
    parameter AdcBitOrByteMode = 1, 
    parameter AdcMsbOrLsbFst = 1 
)
(
    input DCLK_p_pin,
    input DCLK_n_pin,
    input FCLK_p_pin,
    input FCLK_n_pin,
    input [(AdcChnls*AdcWireMode)-1 : 0] DATA_p_pin,
    input [(AdcChnls*AdcWireMode)-1 : 0] DATA_n_pin,

    input SysClk_p_pin,
    input SysClk_n_pin,
    input SysRst,

    output                  adc_pdn,
    output                  adc_reset,
    // ADC is Slave
//    inout                   spi_sdio,
    input                   spi_miso_i,
    output                  spi_mosi_o,
    output                  spi_clk,
    output                  spi_cs
);
    
    wire SysClk50M;
    
    wire SysRefClk        ;
    wire AdcIntrfcRst     ;
    wire AdcIntrfcEna     ;
    wire AdcReSync        ;
//    wire AdcFrmSyncWrn    ;
    wire AdcBitClkAlgnWrn ;
    wire AdcBitClkInvrtd  ;
//    wire AdcBitClkDone    ;
    wire AdcIdlyCtrlRdy   ;
   
    wire AdcFrmClk;
    wire [7:0] AdcDataValid;
    wire [15:0] AdcDataCh0;
    wire [15:0] AdcDataCh1;
    wire [15:0] AdcDataCh2;
    wire [15:0] AdcDataCh3;
    wire [15:0] AdcDataCh4;
    wire [15:0] AdcDataCh5;
    wire [15:0] AdcDataCh6;
    wire [15:0] AdcDataCh7;
    
    assign adc_pdn = 0;
    assign adc_reset = 0;
    
//    wire spi_mosi_o;
//    wire spi_miso_i;
    wire spi_tri_o;
    wire [7:0] spi_cs_o;
    
    assign spi_cs = spi_cs_o[0];

    wire AdcSampClk;
    // MMCM regenerate dclk
    MMCM Inst_SysClk
       (
            // Clock in ports
            .clk_in1_p (SysClk_p_pin    ),
            .clk_in1_n (SysClk_n_pin    ),
            // Clock out ports
            .clk_out1  (AdcSampClk      ),
            // Status and control signals
            .reset     (0             ),
            .locked    ( )
       );
    
    // LTC
    AdcLVDS #(
        .AdcChnls(2),
        .AdcBits(14),
        .AdcBitOrByteMode(1),
        .AdcMsbOrLsbFst(1),
        .AdcWireMode(1),
        .AdcFrmPattern(16'b0011111110000000),
        .AdcSampFreDiv2(0),
        .AdcDCLKFrequency(182),
        .AdcFCLKFrequency(26),
        .CLKFBOUT_MULT_F(5),
        .CLKOUT1_DIVIDE(182/26)
    ) inst_AdcLVDS (
        .DCLK_p_pin   (DCLK_p_pin),
        .DCLK_n_pin   (DCLK_n_pin),
        .FCLK_p_pin   (FCLK_p_pin),
        .FCLK_n_pin   (FCLK_n_pin),
        .DATA_p_pin   (DATA_p_pin),
        .DATA_n_pin   (DATA_n_pin),
        .SysRst       (0),
        .AdcSampClk   (AdcSampClk),
        .AdcFrmClk    (AdcFrmClk),
        .AdcDataValid (AdcDataValid),
        .AdcDataCh0   (AdcDataCh0),
        .AdcDataCh1   (AdcDataCh1),
        .AdcDataCh2   (AdcDataCh2),
        .AdcDataCh3   (AdcDataCh3)
    );
    

   // spi_auto_config inst_spi_auto_config
   //     (
   //         .clk            (s_axi_aclk),
   //         .resetn         (s_axi_aresetn),
   //         .ocfg_cur_state (ocfg_cur_state),
   //         .spi_miso_i     (spi_miso_i),
   //         .spi_clk_o      (spi_clk),
   //         .spi_mosi_o     (spi_mosi_o),
   //         .spi_cs_o       (spi_cs_o),
   //         .spi_tri_o      (spi_tri_o),
   //         .cfg_finish_o   (axil_auto_config_resetn),
   //         .ram_inputs_o   (ram_inputs_i),
   //         .ram_outputs_i  (ram_outputs_o),
   //         .ram_addr_i     (ram_addr_o),
   //         .ram_wea_i      (ram_wea_o)
   //     );


    // AD3444
    // AdcLVDS #(
    //         .AdcChnls(4),
    //         .AdcBits(14),
    //         .AdcBitOrByteMode(0),
    //         .AdcMsbOrLsbFst(0),
    //         .AdcWireMode(2),
    //         .AdcFrmPattern(16'b0011111110000000),
    //         .AdcSampFreDiv2(1)
    //     ) inst_AdcLVDS (
    //     .DCLK_p_pin   (DCLK_p_pin),
    //     .DCLK_n_pin   (DCLK_n_pin),
    //     .FCLK_p_pin   (FCLK_p_pin),
    //     .FCLK_n_pin   (FCLK_n_pin),
    //     .DATA_p_pin   (DATA_p_pin),
    //     .DATA_n_pin   (DATA_n_pin),
    //     .SysRst       (0),
    //     .AdcSampClk   (AdcSampClk),
    //     .AdcFrmClk    (AdcFrmClk),
    //     .AdcDataValid (AdcDataValid),
    //     .AdcDataCh0   (AdcDataCh0),
    //     .AdcDataCh1   (AdcDataCh1),
    //     .AdcDataCh2   (AdcDataCh2),
    //     .AdcDataCh3   (AdcDataCh3)
    // );



/*
   // AD9252

   IOBUF 
       #(.DRIVE("12"), .SLEW("FAST"))
   Inst_spidio_IOBUF
       (.O(spi_miso_i), .IO(spi_sdio), .I(spi_mosi_o), .T(spi_tri_o));
    AdcLVDS #(
            .AdcChnls(8),
            .AdcBits(14),
            .AdcBitOrByteMode(1),
            .AdcMsbOrLsbFst(1),
            .AdcWireMode(1),
            .AdcFrmPattern(16'b0011111110000000),
            .AdcSampFreDiv2(0)
        ) inst_AdcLVDS (
        .DCLK_p_pin   (DCLK_p_pin),
        .DCLK_n_pin   (DCLK_n_pin),
        .FCLK_p_pin   (FCLK_p_pin),
        .FCLK_n_pin   (FCLK_n_pin),
        .DATA_p_pin   (DATA_p_pin),
        .DATA_n_pin   (DATA_n_pin),
        .SysRst       (0),
        .AdcSampClk   (),
        .AdcFrmClk    (AdcFrmClk),
        .AdcDataValid (AdcDataValid),
        .AdcDataCh0   (AdcDataCh0),
        .AdcDataCh1   (AdcDataCh1),
        .AdcDataCh2   (AdcDataCh2),
        .AdcDataCh3   (AdcDataCh3),
        .AdcDataCh4   (AdcDataCh4),
        .AdcDataCh5   (AdcDataCh5),
        .AdcDataCh6   (AdcDataCh6),
        .AdcDataCh7   (AdcDataCh7)
    );

*/

endmodule

//(* CORE_GENERATION_INFO = "dcm,clk_wiz_v3_6,{component_name=dcm,use_phase_alignment=true,use_min_o_jitter=false,use_max_i_jitter=false,use_dyn_phase_shift=false,use_inclk_switchover=false,use_dyn_reconfig=false,feedback_source=FDBK_AUTO,primtype_sel=MMCM_ADV,num_out_clk=1,clkin1_period=8.000,clkin2_period=10.000,use_power_down=false,use_reset=true,use_locked=true,use_inclk_stopped=false,use_status=false,use_freeze=false,use_clk_valid=false,feedback_type=SINGLE,clock_mgr_type=MANUAL,manual_override=false}" *)
module MMCM

 (// Clock in ports
  // Clock out ports
  output        clk_out1,
  output        clk_out2,
  output        clk_out1b,
  output        clk_out2b,
  // Status and control signals
  input         reset,
  output        locked,
  input         clk_in1_p,
  input         clk_in1_n
 );
  // Input buffering
  //------------------------------------
wire clk_in1_clk_wiz_0;
wire clk_in2_clk_wiz_0;
  IBUFDS clkin1_ibufgds
   (.O  (clk_in1_clk_wiz_0),
    .I  (clk_in1_p),
    .IB (clk_in1_n));




  // Clocking PRIMITIVE
  //------------------------------------

  // Instantiation of the MMCM PRIMITIVE
  //    * Unused inputs are tied off
  //    * Unused outputs are labeled unused

  wire        clk_out1_clk_wiz_0;
  wire        clk_out2_clk_wiz_0;
  wire        clk_out1_clk_wiz_0b;
  wire        clk_out2_clk_wiz_0b;
  wire        clk_out3_clk_wiz_0;
  wire        clk_out4_clk_wiz_0;
  wire        clk_out5_clk_wiz_0;
  wire        clk_out6_clk_wiz_0;
  wire        clk_out7_clk_wiz_0;

  wire [15:0] do_unused;
  wire        drdy_unused;
  wire        psdone_unused;
  wire        locked_int;
  wire        clkfbout_clk_wiz_0;
  wire        clkfbout_buf_clk_wiz_0;
  wire        clkfboutb_unused;
    wire clkout0b_unused;
   wire clkout1b_unused;
   wire clkout2_unused;
   wire clkout2b_unused;
   wire clkout3_unused;
   wire clkout3b_unused;
   wire clkout4_unused;
  wire        clkout5_unused;
  wire        clkout6_unused;
  wire        clkfbstopped_unused;
  wire        clkinstopped_unused;
  wire        reset_high;

  MMCME2_ADV
  #(.BANDWIDTH            ("OPTIMIZED"),
    .CLKOUT4_CASCADE      ("FALSE"),
    .COMPENSATION         ("ZHOLD"),
    .STARTUP_WAIT         ("FALSE"),
    .DIVCLK_DIVIDE        (1),
    .CLKFBOUT_MULT_F      (10.000),
    .CLKFBOUT_PHASE       (0.000),
    .CLKFBOUT_USE_FINE_PS ("FALSE"),
    .CLKOUT0_DIVIDE_F     (10.000),
    .CLKOUT0_PHASE        (0.000),
    .CLKOUT0_DUTY_CYCLE   (0.500),
    .CLKOUT0_USE_FINE_PS  ("FALSE"),
    .CLKOUT1_DIVIDE       (21),
    .CLKOUT1_PHASE        (00.000),
    .CLKOUT1_DUTY_CYCLE   (0.500),
    .CLKOUT1_USE_FINE_PS  ("FALSE"),
    .CLKIN1_PERIOD        (10))
  mmcm_adv_inst
    // Output clocks
   (
    .CLKFBOUT            (clkfbout_clk_wiz_0),
    .CLKFBOUTB           (clkfboutb_unused),
    .CLKOUT0             (clk_out1_clk_wiz_0),
    .CLKOUT0B            (clk_out1_clk_wiz_0b),
    .CLKOUT1             (clk_out2_clk_wiz_0),
    .CLKOUT1B            (clk_out2_clk_wiz_0b),
    .CLKOUT2             (clkout2_unused),
    .CLKOUT2B            (clkout2b_unused),
    .CLKOUT3             (clkout3_unused),
    .CLKOUT3B            (clkout3b_unused),
    .CLKOUT4             (clkout4_unused),
    .CLKOUT5             (clkout5_unused),
    .CLKOUT6             (clkout6_unused),
     // Input clock control
    .CLKFBIN             (clkfbout_buf_clk_wiz_0),
    .CLKIN1              (clk_in1_clk_wiz_0),
    .CLKIN2              (1'b0),
     // Tied to always select the primary input clock
    .CLKINSEL            (1'b1),
    // Ports for dynamic reconfiguration
    .DADDR               (7'h0),
    .DCLK                (1'b0),
    .DEN                 (1'b0),
    .DI                  (16'h0),
    .DO                  (do_unused),
    .DRDY                (drdy_unused),
    .DWE                 (1'b0),
    // Ports for dynamic phase shift
    .PSCLK               (1'b0),
    .PSEN                (1'b0),
    .PSINCDEC            (1'b0),
    .PSDONE              (psdone_unused),
    // Other control and status signals
    .LOCKED              (locked_int),
    .CLKINSTOPPED        (clkinstopped_unused),
    .CLKFBSTOPPED        (clkfbstopped_unused),
    .PWRDWN              (1'b0),
    .RST                 (reset_high));
  assign reset_high = reset; 

  assign locked = locked_int;
// Clock Monitor clock assigning
//--------------------------------------
 // Output buffering
  //-----------------------------------

  BUFG clkf_buf
   (.O (clkfbout_buf_clk_wiz_0),
    .I (clkfbout_clk_wiz_0));






  BUFG clkout1_buf
   (.O   (clk_out1),
    .I   (clk_out1_clk_wiz_0));


  BUFG clkout2_buf
   (.O   (clk_out2),
    .I   (clk_out2_clk_wiz_0));


  BUFG clkout1_bufb
   (.O   (clk_out1b),
    .I   (clk_out1_clk_wiz_0b));


  BUFG clkout2_bufb
   (.O   (clk_out2b),
    .I   (clk_out2_clk_wiz_0b));

endmodule

