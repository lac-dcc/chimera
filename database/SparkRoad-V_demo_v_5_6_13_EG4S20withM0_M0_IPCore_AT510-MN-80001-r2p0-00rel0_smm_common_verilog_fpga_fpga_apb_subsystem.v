//-----------------------------------------------------------------------------
// The confidential and proprietary information contained in this file may
// only be used by a person authorised under and to the extent permitted
// by a subsisting licensing agreement from ARM Limited or its affiliates.
//
//        (C) COPYRIGHT 2013 ARM Limited or its affiliates.
//            ALL RIGHTS RESERVED
//
// This entire notice must be reproduced on all copies of this file
// and copies of this file may only be made by a person if such person is
// permitted to do so under the terms of a subsisting license agreement
// from ARM Limited or its affiliates.
//
// -----------------------------------------------------------------------------
//
//      SVN Information
//
//      Checked In          : $Date: 2017-07-25 15:10:13 +0100 (Tue, 25 Jul 2017) $
//
//      Revision            : $Revision: 368444 $
//
//      Release Information : Cortex-M0 DesignStart-r2p0-00rel0
//
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
// Abstract : V2M-MPS2 FPGA APB subsystem
//-----------------------------------------------------------------------------

module fpga_apb_subsystem (
  input  wire          hclk,
  input  wire          hresetn,   // Note: Can be reset by SYSRESETREQ, watchdog
  input  wire          fpga_npor,
  input  wire          clk_100hz,

  input  wire          hsel,
  input  wire  [15:0]  haddr,
  input  wire   [1:0]  htrans,
  input  wire   [2:0]  hsize,
  input  wire   [3:0]  hprot,
  input  wire          hwrite,
  input  wire          hready,
  input  wire  [31:0]  hwdata,
  output wire  [31:0]  hrdata,
  output wire          hresp,
  output wire          hreadyout,

  output wire  [1:0]   leds,
  input  wire  [1:0]   buttons,

  output wire  [9:0]   fpga_misc,

  input  wire          sbcon_sda_i0,
  output wire          sbcon_scl0,
  output wire          sbcon_sdaouten0_n,

  input  wire          sbcon_sda_i1,
  output wire          sbcon_scl1,
  output wire          sbcon_sdaouten1_n,
  
  input  wire          sbcon_sda_i2,
  output wire          sbcon_scl2,
  output wire          sbcon_sdaouten2_n,


  input  wire          sbcon_sda_i3,
  output wire          sbcon_scl3,
  output wire          sbcon_sdaouten3_n,


  input  wire          ssp0_din,
  output wire          ssp0_dout,
  output wire          ssp0_dout_en_n,
  input  wire          ssp0_clk_in,
  output wire          ssp0_clk_out,
  output wire          ssp0_clk_out_en_n,
  input  wire          ssp0_fss_in,
  output wire          ssp0_fss_out,

  input  wire          ssp1_din,
  output wire          ssp1_dout,
  output wire          ssp1_dout_en_n,
  input  wire          ssp1_clk_in,
  output wire          ssp1_clk_out,
  output wire          ssp1_clk_out_en_n,
  input  wire          ssp1_fss_in,
  output wire          ssp1_fss_out,
  
  input  wire          ssp2_din,
  output wire          ssp2_dout,
  output wire          ssp2_dout_en_n,
  input  wire          ssp2_clk_in,
  output wire          ssp2_clk_out,
  output wire          ssp2_clk_out_en_n,
  input  wire          ssp2_fss_in,
  output wire          ssp2_fss_out,
  
  input  wire          ssp3_din,
  output wire          ssp3_dout,
  output wire          ssp3_dout_en_n,
  input  wire          ssp3_clk_in,
  output wire          ssp3_clk_out,
  output wire          ssp3_clk_out_en_n,
  input  wire          ssp3_fss_in,
  output wire          ssp3_fss_out,
  
  input  wire          ssp4_din,
  output wire          ssp4_dout,
  output wire          ssp4_dout_en_n,
  input  wire          ssp4_clk_in,
  output wire          ssp4_clk_out,
  output wire          ssp4_clk_out_en_n,
  input  wire          ssp4_fss_in,
  output wire          ssp4_fss_out,

  output wire          ssp_interrupt,

  input  wire          audio_mclk,     // Audio codec master clock (12.288MHz)
  input  wire          audio_sclk,     // Audio interface bit clock
  output wire          audio_lrck,     // Audio Left/Right clock
  output wire          audio_sdout,    // Audio DAC data
  input  wire          audio_sdin,     // Audio ADC data
  output wire          audio_nRST,     // Audio reset

  output wire          i2s_interrupt,
  output wire          cfgint,

  input  wire          CFGCLK,
  input  wire          nCFGRST,
  input  wire          CFGLOAD,
  input  wire          CFGWnR,
  input  wire          CFGDATAIN,
  output wire          CFGDATAOUT,
  input  wire [7:0]    dll_locked,
  output wire          zbt_boot_ctrl
  );


  // --------------------------------------------------------------------------
  // Internal wires
  // --------------------------------------------------------------------------

  wire     [15:0]  i_paddr;
  wire             i_psel;
  wire             i_penable;
  wire             i_pwrite;
  wire     [2:0]   i_pprot;
  wire     [3:0]   i_pstrb;
  wire     [31:0]  i_pwdata;

  // wire from APB slave mux to APB bridge
  wire             i_pready_mux;
  wire     [31:0]  i_prdata_mux;
  wire             i_pslverr_mux;
  wire             PCLKEN;
  wire             APBACTIVE;

  wire             i_psel_fpga_io_regs;
  wire             i_pready_fpga_io_regs;
  wire     [31:0]  i_prdata_fpga_io_regs;
  wire             i_pslverr_fpga_io_regs;

  wire             i_psel_sbcon0;
  wire             i_pready_sbcon0;
  wire     [31:0]  i_prdata_sbcon0;
  wire             i_pslverr_sbcon0;

  wire             i_psel_sbcon1;
  wire             i_pready_sbcon1;
  wire     [31:0]  i_prdata_sbcon1;
  wire             i_pslverr_sbcon1;
  
  wire             i_psel_sbcon2;
  wire             i_pready_sbcon2;
  wire     [31:0]  i_prdata_sbcon2;
  wire             i_pslverr_sbcon2;
  
  wire             i_psel_sbcon3;
  wire             i_pready_sbcon3;
  wire     [31:0]  i_prdata_sbcon3;
  wire             i_pslverr_sbcon3;

  wire             i_psel_ssp0;
  wire             i_pready_ssp0;
  wire     [31:0]  i_prdata_ssp0;
  wire             i_pslverr_ssp0;

  wire             i_psel_ssp1;
  wire             i_pready_ssp1;
  wire     [31:0]  i_prdata_ssp1;
  wire             i_pslverr_ssp1;
  
  wire             i_psel_ssp2;
  wire             i_pready_ssp2;
  wire     [31:0]  i_prdata_ssp2;
  wire             i_pslverr_ssp2;
  
  wire             i_psel_ssp3;
  wire             i_pready_ssp3;
  wire     [31:0]  i_prdata_ssp3;
  wire             i_pslverr_ssp3;

  wire             i_psel_ssp4;
  wire             i_pready_ssp4;
  wire     [31:0]  i_prdata_ssp4;
  wire             i_pslverr_ssp4;


  wire             i_psel_i2s0;
  wire             i_pready_i2s0;
  wire     [31:0]  i_prdata_i2s0;
  wire             i_pslverr_i2s0;

  wire [31:0]      i_prdata_scc;
  wire             i_pel_scc;

  wire             ssp0_interrupt;
  wire             ssp1_interrupt;
  wire             ssp2_interrupt;
  wire             ssp3_interrupt;
  wire             ssp4_interrupt;

  wire             i2s_rstn;   // reset for I2S interface in MCLK domain

  wire [255:0]     cfgreg_out;

  assign   PCLKEN = 1'b1;

  wire              ncfgrst_sync;

  //--------------------------------------------------------------------
  // AHB to APB bus bridge
  cmsdk_ahb_to_apb
  #(.ADDRWIDTH (16))
  u_ahb_to_apb(
    // AHB side
    .HCLK     (hclk),
    .HRESETn  (hresetn),
    .HSEL     (hsel),
    .HADDR    (haddr[15:0]),
    .HTRANS   (htrans),
    .HSIZE    (hsize[2:0]),
    .HPROT    (hprot),
    .HWRITE   (hwrite),
    .HREADY   (hready),
    .HWDATA   (hwdata),

    .HREADYOUT(hreadyout), // AHB Outputs
    .HRDATA   (hrdata),
    .HRESP    (hresp),

    .PADDR    (i_paddr[15:0]),
    .PSEL     (i_psel),
    .PENABLE  (i_penable),
    .PSTRB    (i_pstrb),
    .PPROT    (i_pprot),
    .PWRITE   (i_pwrite),
    .PWDATA   (i_pwdata),

    .APBACTIVE(APBACTIVE),
    .PCLKEN   (PCLKEN),     // APB clock enable signal

    .PRDATA   (i_prdata_mux),
    .PREADY   (i_pready_mux),
    .PSLVERR  (i_pslverr_mux)
    );

  //--------------------------------------------------------------------
  // APB slave multiplexer
  cmsdk_apb_slave_mux
    #( // Parameter to determine which ports are used
    .PORT0_ENABLE  (1), // SPI
    .PORT1_ENABLE  (1), // SPI
    .PORT2_ENABLE  (1), // SBCon
    .PORT3_ENABLE  (1), // SBCon
    .PORT4_ENABLE  (1), // Audio I2S
    .PORT5_ENABLE  (1), // SPI ADC
    .PORT6_ENABLE  (1), // SPI Shield 0
    .PORT7_ENABLE  (1), // SPI Shield 1
    .PORT8_ENABLE  (1), // FPGA I/O regs
    .PORT9_ENABLE  (1), // SBCon Shield 0
    .PORT10_ENABLE (1), // SBCon Shield 1
    .PORT11_ENABLE (0), //
    .PORT12_ENABLE (0),
    .PORT13_ENABLE (0),
    .PORT14_ENABLE (0),
    .PORT15_ENABLE (1) //SCC
    )
    u_apb_slave_mux (
    // Inputs
    .DECODE4BIT        (i_paddr[15:12]),
    .PSEL              (i_psel),
    // PSEL (output) and return status & data (inputs) for each port
    .PSEL0             (i_psel_ssp0),
    .PREADY0           (i_pready_ssp0),
    .PRDATA0           (i_prdata_ssp0),
    .PSLVERR0          (i_pslverr_ssp0),

    .PSEL1             (i_psel_ssp1),
    .PREADY1           (i_pready_ssp1),
    .PRDATA1           (i_prdata_ssp1),
    .PSLVERR1          (i_pslverr_ssp1),

    .PSEL2             (i_psel_sbcon0),
    .PREADY2           (i_pready_sbcon0),
    .PRDATA2           (i_prdata_sbcon0),
    .PSLVERR2          (i_pslverr_sbcon0),

    .PSEL3             (i_psel_sbcon1),
    .PREADY3           (i_pready_sbcon1),
    .PRDATA3           (i_prdata_sbcon1),
    .PSLVERR3          (i_pslverr_sbcon1),

    .PSEL4             (i_psel_i2s0),
    .PREADY4           (i_pready_i2s0),
    .PRDATA4           (i_prdata_i2s0),
    .PSLVERR4          (i_pslverr_i2s0),

    .PSEL5             (i_psel_ssp2),
    .PREADY5           (i_pready_ssp2),
    .PRDATA5           (i_prdata_ssp2),
    .PSLVERR5          (i_pslverr_ssp2),

    .PSEL6             (i_psel_ssp3),
    .PREADY6           (i_pready_ssp3),
    .PRDATA6           (i_prdata_ssp3),
    .PSLVERR6          (i_pslverr_ssp3),

    .PSEL7             (i_psel_ssp4),
    .PREADY7           (i_pready_ssp4),
    .PRDATA7           (i_prdata_ssp4),
    .PSLVERR7          (i_pslverr_ssp4),

    .PSEL8             (i_psel_fpga_io_regs),
    .PREADY8           (i_pready_fpga_io_regs),
    .PRDATA8           (i_prdata_fpga_io_regs),
    .PSLVERR8          (i_pslverr_fpga_io_regs),

    .PSEL9             (i_psel_sbcon2),
    .PREADY9           (i_pready_sbcon2),
    .PRDATA9           (i_prdata_sbcon2),
    .PSLVERR9          (i_pslverr_sbcon2),

    .PSEL10            (i_psel_sbcon3),
    .PREADY10          (i_pready_sbcon3),
    .PRDATA10          (i_prdata_sbcon3),
    .PSLVERR10         (i_pslverr_sbcon3),

    .PSEL11            (),
    .PREADY11          (1'b1),
    .PRDATA11          (32'h00000000),
    .PSLVERR11         (1'b0),

    .PSEL12            (),
    .PREADY12          (1'b1),
    .PRDATA12          (32'h00000000),
    .PSLVERR12         (1'b0),

    .PSEL13            (),
    .PREADY13          (1'b1),
    .PRDATA13          (32'h00000000),
    .PSLVERR13         (1'b0),

    .PSEL14            (),
    .PREADY14          (1'b1),
    .PRDATA14          (32'h00000000),
    .PSLVERR14         (1'b0),

    .PSEL15            (i_pel_scc),
    .PREADY15          (1'b1),
    .PRDATA15          (i_prdata_scc),
    .PSLVERR15         (1'b0),

    // Output
    .PREADY            (i_pready_mux),
    .PRDATA            (i_prdata_mux),
    .PSLVERR           (i_pslverr_mux)
    );




  //--------------------------------------------------------------------
  //
  fpga_io_regs u_fpga_io_regs (
    .PCLK              (hclk),
    .PRESETn           (hresetn),
    .PSEL              (i_psel_fpga_io_regs),
    .PADDR             (i_paddr[11:2]),
    .PENABLE           (i_penable),
    .PWRITE            (i_pwrite),
    .PWDATA            (i_pwdata[31:0]),
    .PRDATA            (i_prdata_fpga_io_regs[31:0]),
    .PREADY            (i_pready_fpga_io_regs),
    .PSLVERR           (i_pslverr_fpga_io_regs),

    .clk_100hz         (clk_100hz),
    .buttons           (buttons),
    .leds              (leds),

    .fpga_misc         (fpga_misc)
  );


  // ----------------------------------------
  // SPI Header
  Ssp u_ssp_0 (
            // Inputs
            .PCLK           (hclk),
            .SSPCLK         (hclk),

            .PRESETn        (hresetn),
            .nSSPRST        (hresetn),

            .PSEL           (i_psel_ssp0),
            .PENABLE        (i_penable),
            .PWRITE         (i_pwrite),

            // - Frame clock. This is acting as master so Clock in not used
            .SSPCLKIN       (ssp0_clk_in),
            // - Frame Select Signal(s).  This is the Master so FSSIN is tied low.
            .SSPFSSIN       (ssp0_fss_in),
            // - Frame data in
            .SSPRXD         (ssp0_din),

            .SCANENABLE     (1'b0),
            .SCANINPCLK     (1'b0),
            .SCANINSSPCLK   (1'b0),

            .PADDR          (i_paddr[11:2]),

            .PWDATA         (i_pwdata[15:0]),

            .SSPTXDMACLR    (1'b0),
            .SSPRXDMACLR    (1'b0),
            // Outputs
            .SSPINTR        (ssp0_interrupt),
            .SSPRXINTR      (),
            .SSPTXINTR      (),
            .SSPRORINTR     (),
            .SSPRTINTR      (),

            .SSPFSSOUT      (ssp0_fss_out),
            .SSPCLKOUT      (ssp0_clk_out),
            .nSSPCTLOE      (ssp0_clk_out_en_n),

            .SCANOUTPCLK    (),
            .SCANOUTSSPCLK  (),

            .SSPTXD         (ssp0_dout),
            .nSSPOE         (ssp0_dout_en_n),


            .PRDATA         (i_prdata_ssp0[15:0]),

            .SSPTXDMASREQ   (),
            .SSPTXDMABREQ   (),
            .SSPRXDMASREQ   (),
            .SSPRXDMABREQ   ()
           );

  assign i_pready_ssp0  = 1'b1;
  assign i_pslverr_ssp0 = 1'b0;
  assign i_prdata_ssp0[31:16] = {16{1'b0}};

  // ----------------------------------------
  // SPI LCD
    Ssp u_ssp_1 (
            // Inputs
            .PCLK           (hclk),
            .SSPCLK         (hclk),

            .PRESETn        (hresetn),
            .nSSPRST        (hresetn),

            .PSEL           (i_psel_ssp1),
            .PENABLE        (i_penable),
            .PWRITE         (i_pwrite),

            // - Frame clock. This is acting as master so Clock in not used
            .SSPCLKIN       (ssp1_clk_in),
            // - Frame Select Signal(s).  This is the Master so FSSIN is tied low.
            .SSPFSSIN       (ssp1_fss_in),
            // - Frame data in
            .SSPRXD         (ssp1_din),

            .SCANENABLE     (1'b0),
            .SCANINPCLK     (1'b0),
            .SCANINSSPCLK   (1'b0),

            .PADDR          (i_paddr[11:2]),

            .PWDATA         (i_pwdata[15:0]),

            .SSPTXDMACLR    (1'b0),
            .SSPRXDMACLR    (1'b0),
            // Outputs
            .SSPINTR        (ssp1_interrupt),
            .SSPRXINTR      (),
            .SSPTXINTR      (),
            .SSPRORINTR     (),
            .SSPRTINTR      (),

            .SSPFSSOUT      (ssp1_fss_out),
            .SSPCLKOUT      (ssp1_clk_out),
            .nSSPCTLOE      (ssp1_clk_out_en_n),

            .SCANOUTPCLK    (),
            .SCANOUTSSPCLK  (),

            .SSPTXD         (ssp1_dout),
            .nSSPOE         (ssp1_dout_en_n),


            .PRDATA         (i_prdata_ssp1[15:0]),

            .SSPTXDMASREQ   (),
            .SSPTXDMABREQ   (),
            .SSPRXDMASREQ   (),
            .SSPRXDMABREQ   ()
           );

  assign i_pready_ssp1  = 1'b1;
  assign i_pslverr_ssp1 = 1'b0;
  assign i_prdata_ssp1[31:16] = {16{1'b0}};

  assign ssp_interrupt = ssp0_interrupt || ssp1_interrupt || ssp2_interrupt || ssp3_interrupt || ssp4_interrupt;


  // ----------------------------------------
  // Adapter Board ADC SPI
    Ssp u_ssp_2 (
            // Inputs
            .PCLK           (hclk),
            .SSPCLK         (hclk),

            .PRESETn        (hresetn),
            .nSSPRST        (hresetn),

            .PSEL           (i_psel_ssp2),
            .PENABLE        (i_penable),
            .PWRITE         (i_pwrite),

            // - Frame clock. This is acting as master so Clock in not used
            .SSPCLKIN       (ssp2_clk_in),
            // - Frame Select Signal(s).  This is the Master so FSSIN is tied low.
            .SSPFSSIN       (ssp2_fss_in),
            // - Frame data in
            .SSPRXD         (ssp2_din),

            .SCANENABLE     (1'b0),
            .SCANINPCLK     (1'b0),
            .SCANINSSPCLK   (1'b0),

            .PADDR          (i_paddr[11:2]),

            .PWDATA         (i_pwdata[15:0]),

            .SSPTXDMACLR    (1'b0),
            .SSPRXDMACLR    (1'b0),
            // Outputs
            .SSPINTR        (ssp2_interrupt),
            .SSPRXINTR      (),
            .SSPTXINTR      (),
            .SSPRORINTR     (),
            .SSPRTINTR      (),

            .SSPFSSOUT      (ssp2_fss_out),
            .SSPCLKOUT      (ssp2_clk_out),
            .nSSPCTLOE      (ssp2_clk_out_en_n),

            .SCANOUTPCLK    (),
            .SCANOUTSSPCLK  (),

            .SSPTXD         (ssp2_dout),
            .nSSPOE         (ssp2_dout_en_n),


            .PRDATA         (i_prdata_ssp2[15:0]),

            .SSPTXDMASREQ   (),
            .SSPTXDMABREQ   (),
            .SSPRXDMASREQ   (),
            .SSPRXDMABREQ   ()
           );

  assign i_pready_ssp2  = 1'b1;
  assign i_pslverr_ssp2 = 1'b0;
  assign i_prdata_ssp2[31:16] = {16{1'b0}};
  
  
    // ----------------------------------------
    // Adapter Board SHIELD_0 SPI
      Ssp u_ssp_3 (
              // Inputs
              .PCLK           (hclk),
              .SSPCLK         (hclk),
  
              .PRESETn        (hresetn),
              .nSSPRST        (hresetn),
  
              .PSEL           (i_psel_ssp3),
              .PENABLE        (i_penable),
              .PWRITE         (i_pwrite),
  
              // - Frame clock. This is acting as master so Clock in not used
              .SSPCLKIN       (ssp3_clk_in),
              // - Frame Select Signal(s).  This is the Master so FSSIN is tied low.
              .SSPFSSIN       (ssp3_fss_in),
              // - Frame data in
              .SSPRXD         (ssp3_din),
  
              .SCANENABLE     (1'b0),
              .SCANINPCLK     (1'b0),
              .SCANINSSPCLK   (1'b0),
  
              .PADDR          (i_paddr[11:2]),
  
              .PWDATA         (i_pwdata[15:0]),
  
              .SSPTXDMACLR    (1'b0),
              .SSPRXDMACLR    (1'b0),
              // Outputs
              .SSPINTR        (ssp3_interrupt),
              .SSPRXINTR      (),
              .SSPTXINTR      (),
              .SSPRORINTR     (),
              .SSPRTINTR      (),
  
              .SSPFSSOUT      (ssp3_fss_out),
              .SSPCLKOUT      (ssp3_clk_out),
              .nSSPCTLOE      (ssp3_clk_out_en_n),
  
              .SCANOUTPCLK    (),
              .SCANOUTSSPCLK  (),
  
              .SSPTXD         (ssp3_dout),
              .nSSPOE         (ssp3_dout_en_n),
  
  
              .PRDATA         (i_prdata_ssp3[15:0]),
  
              .SSPTXDMASREQ   (),
              .SSPTXDMABREQ   (),
              .SSPRXDMASREQ   (),
              .SSPRXDMABREQ   ()
             );
  
    assign i_pready_ssp3  = 1'b1;
    assign i_pslverr_ssp3 = 1'b0;
    assign i_prdata_ssp3[31:16] = {16{1'b0}};



    // ----------------------------------------
    // Adapter Board SHIELD_1 SPI
      Ssp u_ssp_4 (
              // Inputs
              .PCLK           (hclk),
              .SSPCLK         (hclk),
  
              .PRESETn        (hresetn),
              .nSSPRST        (hresetn),
  
              .PSEL           (i_psel_ssp4),
              .PENABLE        (i_penable),
              .PWRITE         (i_pwrite),
  
              // - Frame clock. This is acting as master so Clock in not used
              .SSPCLKIN       (ssp4_clk_in),
              // - Frame Select Signal(s).  This is the Master so FSSIN is tied low.
              .SSPFSSIN       (ssp4_fss_in),
              // - Frame data in
              .SSPRXD         (ssp4_din),
  
              .SCANENABLE     (1'b0),
              .SCANINPCLK     (1'b0),
              .SCANINSSPCLK   (1'b0),
  
              .PADDR          (i_paddr[11:2]),
  
              .PWDATA         (i_pwdata[15:0]),
  
              .SSPTXDMACLR    (1'b0),
              .SSPRXDMACLR    (1'b0),
              // Outputs
              .SSPINTR        (ssp4_interrupt),
              .SSPRXINTR      (),
              .SSPTXINTR      (),
              .SSPRORINTR     (),
              .SSPRTINTR      (),
  
              .SSPFSSOUT      (ssp4_fss_out),
              .SSPCLKOUT      (ssp4_clk_out),
              .nSSPCTLOE      (ssp4_clk_out_en_n),
  
              .SCANOUTPCLK    (),
              .SCANOUTSSPCLK  (),
  
              .SSPTXD         (ssp4_dout),
              .nSSPOE         (ssp4_dout_en_n),
  
  
              .PRDATA         (i_prdata_ssp4[15:0]),
  
              .SSPTXDMASREQ   (),
              .SSPTXDMABREQ   (),
              .SSPRXDMASREQ   (),
              .SSPRXDMABREQ   ()
             );
  
    assign i_pready_ssp4  = 1'b1;
    assign i_pslverr_ssp4 = 1'b0;
    assign i_prdata_ssp4[31:16] = {16{1'b0}};

  // ----------------------------------------
  // I2C LCD
  SBCon u_sbcon0
  (
  // Inputs
    .PCLK        (hclk),           //-- APB bus clock
    .PRESETn     (hresetn),        //-- APB bus reset
    .PSEL        (i_psel_sbcon0),  //-- APB device select
    .PENABLE     (i_penable),      //-- identifies APB active cycle
    .PWRITE      (i_pwrite),       //-- APB address
    .PADDR       (i_paddr[7:2]),   //-- APB transfer direction
    .PWDATA      (i_pwdata[31:0]), //-- APB write data
    .SDA         (sbcon_sda_i0),
  // Outputs
    .PRDATA      (i_prdata_sbcon0),
    .SCL         (sbcon_scl0),
    .SDAOUTEN_n  (sbcon_sdaouten0_n)
    );

  assign i_pslverr_sbcon0 = 1'b0;
  assign i_pready_sbcon0  = 1'b1;

  // ----------------------------------------
  // I2C Audio
  SBCon u_sbcon1
  (
  // Inputs
    .PCLK        (hclk),           //-- APB bus clock
    .PRESETn     (hresetn),        //-- APB bus reset
    .PSEL        (i_psel_sbcon1),  //-- APB device select
    .PENABLE     (i_penable),      //-- identifies APB active cycle
    .PWRITE      (i_pwrite),       //-- APB address
    .PADDR       (i_paddr[7:2]),   //-- APB transfer direction
    .PWDATA      (i_pwdata[31:0]), //-- APB write data
    .SDA         (sbcon_sda_i1),
  // Outputs
    .PRDATA      (i_prdata_sbcon1),
    .SCL         (sbcon_scl1),
    .SDAOUTEN_n  (sbcon_sdaouten1_n)
    );

  assign i_pslverr_sbcon1 = 1'b0;
  assign i_pready_sbcon1  = 1'b1;
  
    // ----------------------------------------
    // I2C Shield0
    SBCon u_sbcon2
    (
    // Inputs
      .PCLK        (hclk),           //-- APB bus clock
      .PRESETn     (hresetn),        //-- APB bus reset
      .PSEL        (i_psel_sbcon2),  //-- APB device select
      .PENABLE     (i_penable),      //-- identifies APB active cycle
      .PWRITE      (i_pwrite),       //-- APB address
      .PADDR       (i_paddr[7:2]),   //-- APB transfer direction
      .PWDATA      (i_pwdata[31:0]), //-- APB write data
      .SDA         (sbcon_sda_i2),
    // Outputs
      .PRDATA      (i_prdata_sbcon2),
      .SCL         (sbcon_scl2),
      .SDAOUTEN_n  (sbcon_sdaouten2_n)
      );
  
    assign i_pslverr_sbcon2 = 1'b0;
    assign i_pready_sbcon2  = 1'b1;



// ----------------------------------------
    // I2C Shield1
    SBCon u_sbcon3
    (
    // Inputs
      .PCLK        (hclk),           //-- APB bus clock
      .PRESETn     (hresetn),        //-- APB bus reset
      .PSEL        (i_psel_sbcon3),  //-- APB device select
      .PENABLE     (i_penable),      //-- identifies APB active cycle
      .PWRITE      (i_pwrite),       //-- APB address
      .PADDR       (i_paddr[7:2]),   //-- APB transfer direction
      .PWDATA      (i_pwdata[31:0]), //-- APB write data
      .SDA         (sbcon_sda_i3),
    // Outputs
      .PRDATA      (i_prdata_sbcon3),
      .SCL         (sbcon_scl3),
      .SDAOUTEN_n  (sbcon_sdaouten3_n)
      );
  
    assign i_pslverr_sbcon3 = 1'b0;
    assign i_pready_sbcon3  = 1'b1;

  // Reset synchroniser
  // Audio sclk drives everything on negedge, so align reset
  fpga_rst_sync u_fpga_rst_sync_1  (
    .clk          (~audio_sclk),
    .rst_n_in     (hresetn),
    .rst_request  (1'b0),
    .rst_n_out    (i2s_rstn)
    );

  apb_i2s_top u_apb_i2s_top (
    .MCLK         (audio_mclk),   // Audio interface master clock (e.g. 12.88MHz)
    .MRSTn        (i2s_rstn),     // Audio interface reset
    .LRCK         (audio_lrck),   // Left Right Clock
    .SDOUT        (audio_sdout),  // Audio Data Out
    .SDIN         (audio_sdin),   // Audio Data In
    .SCLK         (audio_sclk),   // Audio Serial Clock
    .AUD_nRESET   (audio_nRST),   // Audio codec reset

    .PCLK         (hclk),
    .PRESETn      (hresetn),
    .PADDR        (i_paddr[11:2]),
    .PSEL         (i_psel_i2s0),
    .PENABLE      (i_penable),
    .PWRITE       (i_pwrite),
    .PWDATA       (i_pwdata[31:0]),
    .PRDATA       (i_prdata_i2s0),

    .IRQOUT       (i2s_interrupt)
  );

  assign i_pready_i2s0  = 1'b1;
  assign i_pslverr_i2s0 = 1'b0;


  // ----------------------------------------
  // Serial Communication Controller (SCC)
  // Allow on board micro-controller to communicate
  // with the FPGA design using a simple serial interface.
  //
  // The nCFGRST is an asynchronous reset signal input to the FPGA
  // To reduce warnings, synchronise this before use
  fpga_rst_sync  u_fpga_rst_sync_2 (
  .clk            (hclk),
  .rst_n_in       (nCFGRST),
  .rst_request    (1'b0),
  .rst_n_out      (ncfgrst_sync)
  );

  scc u_scc(
  .PCLK           (hclk),
  .PRESETn        (fpga_npor),
  .PSEL           (i_pel_scc),
  .PENABLE        (i_penable),
  .PWRITE         (i_pwrite),
  .PADDR          (i_paddr[11:0]),
  .PWDATA         (i_pwdata[31:0]),
  .PRDATA         (i_prdata_scc),

  .CFGCLK         (CFGCLK),
  .nCFGRST        (ncfgrst_sync),
  .CFGLOAD        (CFGLOAD),
  .CFGWnR         (CFGWnR),
  .CFGDATAIN      (CFGDATAIN),
  .CFGDATAOUT     (CFGDATAOUT),
  .DLL_LOCKED     (dll_locked),

  .SWITCH_OUTPUT  (),       // output: switch status in CFGCLK domain
  .ALT_LED_SOURCE (8'h00),  // input : mcu_leds synchronized to CFGCLK

  .CFGREG_IN      ({256{1'b0}}),
  .CFGREG_OUT     (cfgreg_out),
  .CFGINT         (cfgint)
  );

  assign zbt_boot_ctrl = cfgreg_out[0];

endmodule
