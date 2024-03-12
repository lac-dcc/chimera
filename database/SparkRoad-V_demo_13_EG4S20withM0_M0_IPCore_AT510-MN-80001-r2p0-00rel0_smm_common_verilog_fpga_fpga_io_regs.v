//-----------------------------------------------------------------------------
// The confidential and proprietary information contained in this file may
// only be used by a person authorised under and to the extent permitted
// by a subsisting licensing agreement from ARM Limited.
//
//            (C) COPYRIGHT 2013 ARM Limited.
//                ALL RIGHTS RESERVED
//
// This entire notice must be reproduced on all copies of this file
// and copies of this file may only be made by a person if such person is
// permitted to do so under the terms of a subsisting license agreement
// from ARM Limited.
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
// Abstract : V2M-MPS2 FPGA I/O registers block
//-----------------------------------------------------------------------------

module fpga_io_regs (
  // --------------------------------------------------------------------------
  // Port Definitions
  // --------------------------------------------------------------------------
  input  wire          PCLK,
  input  wire          PRESETn,
  input  wire          PSEL,
  input  wire  [11:2]  PADDR,
  input  wire          PENABLE,
  input  wire          PWRITE,
  input  wire  [31:0]  PWDATA,
  output wire  [31:0]  PRDATA,
  output wire          PREADY,
  output wire          PSLVERR,

  input  wire          clk_100hz,
  input  wire   [1:0]  buttons,
  output wire   [1:0]  leds,
  output wire   [9:0]  fpga_misc
  );

  // --------------------------------------------------------------------------
  // Internal wires
  // --------------------------------------------------------------------------

  reg    [31:0]        read_mux;
  wire                 read_enable;
  reg     [1:0]        reg_leds;
  reg     [1:0]        reg_buttons;
  reg     [1:0]        reg_buttons_sync;
  reg    [31:0]        reg_counter_1hz;
  reg    [31:0]        reg_counter_100hz;
  reg    [31:0]        reg_counter_cycle;
  reg    [31:0]        reg_counter_prescale; // Prescale ratio
  reg    [31:0]        reg_counter_pscntr;   // Prescale counter
  reg     [9:0]        reg_fpga_misc;

  wire   write_leds;
  wire   write_cntr1hz;
  wire   write_cntr100hz;
  wire   write_cycle_cntr;
  wire   write_prescale;
  wire   write_ps_cntr;
  wire   write_fpga_misc;

  assign write_leds         = PSEL & PWRITE & PENABLE & (PADDR[11:2]==10'b0000_0000_00); // 0x000
  //                                                                  10'b0000_0000_01      0x004
  assign write_cntr1hz      = PSEL & PWRITE & PENABLE & (PADDR[11:2]==10'b0000_0001_00); // 0x010   1 Hz counter
  assign write_cntr100hz    = PSEL & PWRITE & PENABLE & (PADDR[11:2]==10'b0000_0001_01); // 0x014 100 Hz counter
  assign write_cycle_cntr   = PSEL & PWRITE & PENABLE & (PADDR[11:2]==10'b0000_0001_10); // 0x018 Cycle counter
  assign write_prescale     = PSEL & PWRITE & PENABLE & (PADDR[11:2]==10'b0000_0001_11); // 0x01C Prescale ratio
  assign write_ps_cntr      = PSEL & PWRITE & PENABLE & (PADDR[11:2]==10'b0000_0010_00); // 0x020 Prescale counter
  assign write_fpga_misc    = PSEL & PWRITE & PENABLE & (PADDR[11:2]==10'b0000_0100_11); // 0x04C
  // fpga_misc[9:0] signals:
  // [0] CLCD_CS
  // [1] SPI_nSS
  // [2] Not used
  // [3] CLCD_RESET
  // [4] CLCD_RS
  // [5] CLCD_RD
  // [6] CLCD_BL_CTRL
  // [7] ADAPTER_BOARD_ADC_nCS
  // [8] SHIELD_0_SPI_nCS
  // [9] SHIELD_1_SPI_nCS

  // --------------------------------------------------------------------------
  // Read Mux
  // --------------------------------------------------------------------------

  assign  read_enable = PSEL & ~PWRITE;

  // Read multiplexer
  always @(read_enable or PADDR or reg_leds or reg_buttons or
    reg_counter_1hz or reg_counter_100hz or
    reg_counter_cycle or reg_counter_prescale or reg_counter_pscntr or
    reg_fpga_misc)
  begin
    if (read_enable) begin
      case(PADDR)
        0  : read_mux = {{30{1'b0}},reg_leds[1:0]};            // 0x000
        2  : read_mux = {{30{1'b0}},reg_buttons[1:0]};         // 0x008
        // Counters for benchmarking
        4  : read_mux = reg_counter_1hz;                       // 0x010
        5  : read_mux = reg_counter_100hz;                     // 0x014
        6  : read_mux = reg_counter_cycle;                     // 0x018
        7  : read_mux = reg_counter_prescale;                  // 0x01C
        8  : read_mux = reg_counter_pscntr;                    // 0x020
        19 : read_mux = {{22{1'b0}},reg_fpga_misc};            // 0x04C

        10'b1111110100: // PID4
           read_mux = {{24{1'b0}}, 8'h04};
        10'b1111110101: // PID5
           read_mux = {32{1'b0}};
        10'b1111110110: // PID6
           read_mux = {32{1'b0}};
        10'b1111110111: // PID7
           read_mux = {32{1'b0}};
        10'b1111111000: // PID0
           read_mux = {{24{1'b0}}, 8'h50};// Part number 850
        10'b1111111001: // PID1
           read_mux = {{24{1'b0}}, 8'hB8};// Part number 850
        10'b1111111010: // PID2
           read_mux = {{24{1'b0}}, 8'h0B};// Rev 0
        10'b1111111011: // PID3
           read_mux = {{24{1'b0}}, 8'h00};
        10'b1111111100: // CID0
           read_mux = {{24{1'b0}}, 8'h0D};
        10'b1111111101: // CID1
           read_mux = {{24{1'b0}}, 8'hF0}; // Component type F, PrimeCell/Peripherals
        10'b1111111110: // CID2
           read_mux = {{24{1'b0}}, 8'h05};
        10'b1111111111: // CID3
           read_mux = {{24{1'b0}}, 8'hB1};

        // Reserved
        default:
             read_mux = {32{1'b0}};
      endcase
      end // end-if
    else
      begin
      read_mux = {32{1'b0}};
      end
  end

  assign PRDATA  = read_mux;
  assign PREADY  = 1'b1;
  assign PSLVERR = 1'b0;

  // --------------------------------------------------------------------------
  // LEDs
  // --------------------------------------------------------------------------

  always @(posedge PCLK or negedge PRESETn)
  begin
  if (~PRESETn)
    reg_leds <= 2'b00;
  else if (write_leds)
    reg_leds <= PWDATA[1:0];
  end

  assign leds = reg_leds;

  // --------------------------------------------------------------------------
  // Buttons
  // --------------------------------------------------------------------------
  // 2 stage flip-flop to avoid metastability issue
  always @(posedge PCLK or negedge PRESETn)
  begin
  if (~PRESETn)
    reg_buttons_sync <= 2'b00;
  else
    reg_buttons_sync <= buttons;
  end

  always @(posedge PCLK or negedge PRESETn)
  begin
  if (~PRESETn)
    reg_buttons <= 2'b00;
  else
    reg_buttons <= reg_buttons_sync;
  end

  // --------------------------------------------------------------------------
  // Counters
  // --------------------------------------------------------------------------
  reg  [2:0]   clk_100hz_sync;     // sync DFF for 100Hz clock (assume asynchronous)
  wire         clk_100hz_posedge;  // pulse at 100 Hz
  reg  [6:0]   reg_div_100;        // Count from 0 to 99

  // Synchroniser (assume clk_100hz signal is asynchronous)
  always @(posedge PCLK or negedge PRESETn)
  begin
  if (~PRESETn)
    clk_100hz_sync <= 3'b000;
  else
    clk_100hz_sync <= {clk_100hz_sync[1:0],clk_100hz};
  end

  // Rising edge detection
  assign clk_100hz_posedge = clk_100hz_sync[1] & ~clk_100hz_sync[2];

  // 100Hz counter
  always @(posedge PCLK or negedge PRESETn)
  begin
  if (~PRESETn)
    reg_counter_100hz <= {32{1'b0}};
  else
    if (write_cntr100hz)
      reg_counter_100hz <= PWDATA[31:0];
    else if (clk_100hz_posedge)
      reg_counter_100hz <= reg_counter_100hz + 1;
  end

  // Divider for 1Hz counter
  always @(posedge PCLK or negedge PRESETn)
  begin
  if (~PRESETn)
    reg_div_100 <= {7{1'b0}};
  else
    if (write_cntr1hz)
      reg_div_100 <= {7{1'b0}};
    else if (clk_100hz_posedge)
      begin
      if (reg_div_100 == 7'd99)
        reg_div_100 <=  {7{1'b0}};
      else
        reg_div_100 <= reg_div_100 + 7'b0000001;
      end
  end

  // 1Hz counter
  always @(posedge PCLK or negedge PRESETn)
  begin
  if (~PRESETn)
    reg_counter_1hz <= {32{1'b0}};
  else
    if (write_cntr1hz)
      reg_counter_1hz <= PWDATA[31:0];
    else if (clk_100hz_posedge & (reg_div_100 == 7'd99))
      reg_counter_1hz <= reg_counter_1hz + 1;
  end

  // Prescale control register for cycle counter
  always @(posedge PCLK or negedge PRESETn)
  begin
  if (~PRESETn)
    reg_counter_prescale <= {32{1'b0}};
  else if (write_prescale)
    reg_counter_prescale <= PWDATA[31:0];
  end


  // Prescale counter
  always @(posedge PCLK or negedge PRESETn)
  begin
  if (~PRESETn)
    reg_counter_pscntr <= {32{1'b0}};
  else
    if (write_prescale|write_ps_cntr)
      reg_counter_pscntr <= PWDATA[31:0];
    else if (reg_counter_pscntr=={32{1'b0}})
      reg_counter_pscntr <= reg_counter_prescale;
    else
      reg_counter_pscntr <= reg_counter_pscntr - {{31{1'b0}}, 1'b1};
  end

  // Prescale control register for cycle counter
  always @(posedge PCLK or negedge PRESETn)
  begin
  if (~PRESETn)
    reg_counter_cycle <= {32{1'b0}};
  else
    if (write_cycle_cntr)
      reg_counter_cycle <= PWDATA[31:0];
    else if (reg_counter_pscntr=={32{1'b0}})
      reg_counter_cycle <= reg_counter_cycle + {{31{1'b0}}, 1'b1};
  end

  // --------------------------------------------------------------------------
  // Additional user expansion I/O
  // --------------------------------------------------------------------------

  // Output value register
  always @(posedge PCLK or negedge PRESETn)
  begin
  if (~PRESETn)
    reg_fpga_misc <= {10{1'b1}};
  else
    if (write_fpga_misc)
      reg_fpga_misc <= PWDATA[9:0];
  end

  assign fpga_misc    = reg_fpga_misc;

endmodule
