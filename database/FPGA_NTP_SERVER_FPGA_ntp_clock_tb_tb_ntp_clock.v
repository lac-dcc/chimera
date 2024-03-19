`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/08/2015 10:16:00 PM
// Design Name: 
// Module Name: tb_ntp_clock
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
`default_nettype none

module tb_ntp_clock();

  reg         TEN_MHZ_IN_P;
  reg         TEN_MHZ_IN_N;
  reg         areset;

  // Simple Clock Generator
  initial     begin
    TEN_MHZ_IN_P = 1'b0;
    TEN_MHZ_IN_N = 1'b1;
  end
  always #50 begin
    TEN_MHZ_IN_P = !TEN_MHZ_IN_P;
    TEN_MHZ_IN_N = !TEN_MHZ_IN_N;
  end

  wire          CLK_128M;
  // Create Sync pulses
  reg PPS_IN = 1'b0;
  reg [23:0] Xcount = 0;
  always @(posedge TEN_MHZ_IN_P) begin
    Xcount <= Xcount + 1;
    if (Xcount == 24'd9_999_999) begin
      Xcount <= 0;
    end
    PPS_IN <= #33 (Xcount >= 777 && Xcount < 1777);
  end

  wire          CLK_10M;
  wire          pll_psclk;
  wire 		pll_psen;
  wire 		pll_psincdec;
  wire 		pll_psdone;
  wire 		pll_locked;
 
  ntp_clock_pll pll_0 (
    .clk_in1_n (TEN_MHZ_IN_N),
    .clk_in1_p (TEN_MHZ_IN_P),
    .clk_out1  (CLK_10M),
    .clk_out2  (CLK_128M),
    .locked    (pll_locked),
    .psclk     (pll_psclk),
    .psdone    (pll_psdone),
    .psen      (pll_psen),
    .psincdec  (pll_psincdec),
    .reset     (areset)
  );

  wire       pps_sync;
  wire       pps_pre;
  wire [9:0] sync_status;
  wire       PPS_OUT;
  
  pll_sync pll_sync_inst0 (
    .clk128       (CLK_128M),
    .areset       (areset),
    .PPS_IN       (~PPS_IN),                              
    .PPS_PRE      (pps_pre),                            
    .PPS_OUT      (PPS_OUT),                            
    .PPS_RESET    (pps_sync),                          
    .pll_locked   (pll_locked),
    .pll_psclk    (pll_psclk),                                
    .pll_psen     (pll_psen),                          
    .pll_psincdec (pll_psincdec),
    .pll_psdone   (pll_psdone),                              
    .SYNC_STATUS  (sync_status)
  );

  wire [31:0]  new_second  = 32'b0;
  wire         second_set  =  1'b0;
  wire         second_set_done;
  wire [31:0]  leap_second = 32'b0;
  wire         leap_set    =  1'b0;
  wire         leap_set_done;
  wire         leap_inc    =  1'b0;       

  wire [63:0]   ntp_time;
  wire          ntp_time_upd;

  ntp_counters ntp_counters_inst0 (
    .ntp_clk        (CLK_128M),
    .areset         (areset),
    .pps_reset      (pps_sync),
    .new_second     (new_second),
    .second_set     (second_set),
    .second_set_done(second_set_done),
    .leap_second    (leap_second),
    .leap_set       (leap_set),
    .leap_set_done  (leap_set_done),
    .leap_inc       (leap_inc),
    .ntp_time       (ntp_time),
    .ntp_time_upd   (ntp_time_upd),
    .pps_pre        (pps_pre)
  );

  // Throttle down data rate so network paths can catch them
  reg [63:0]  NTP_TIME;
  reg         NTP_TIME_UPD;
  always @(posedge CLK_128M, posedge areset) begin
    if (areset == 1'b1) begin
      NTP_TIME_UPD <= 1'b0;
    end else if (ntp_time_upd) begin
      NTP_TIME     <=  ntp_time;
      NTP_TIME_UPD <= ~NTP_TIME_UPD;
    end
  end

  reg           CLK_156;

  // Simple Clock Generator
  initial     begin
    CLK_156 = 1'b0;
  end
  always #3.2 begin
    CLK_156 = !CLK_156;
  end

  wire [63:0]   NTP_TIME_SYNC0;
  wire [63:0]   NTP_TIME_SYNC1;

  time_sel_sync time_sel_sync_inst0 ( 
    .areset         (areset),
    .clk            (CLK_156),
    .sel            (1'b0),
    .ntp_time_a     (NTP_TIME),
    .ntp_time_upd_a (NTP_TIME_UPD),
    .ntp_time_b     (64'b0),
    .ntp_time_upd_b (1'b0),
    .ntp_time       (NTP_TIME_SYNC0)
  );

  time_sel_sync time_sel_sync_inst1 ( 
    .areset         (areset),
    .clk            (CLK_156),
    .sel            (1'b1),
    .ntp_time_a     (64'b0),
    .ntp_time_upd_a (1'b0),
    .ntp_time_b     (NTP_TIME),
    .ntp_time_upd_b (NTP_TIME_UPD),
    .ntp_time       (NTP_TIME_SYNC1)
  );

  // Simple Reset Generator and test
  initial begin
    areset = 1'b1;
    #500;
    // Release the reset on the posedge of the clk.
    @(posedge TEN_MHZ_IN_P);
    @(posedge TEN_MHZ_IN_P);
    @(posedge TEN_MHZ_IN_N);
    areset = 1'b0;
    @(posedge TEN_MHZ_IN_P);
    @(posedge TEN_MHZ_IN_P);

    #1100000000;
    
    $stop;
    
  end

endmodule
`default_nettype wire
