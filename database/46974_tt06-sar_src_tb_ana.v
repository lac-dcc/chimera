// This program was cloned from: https://github.com/wulffern/tt06-sar
// License: Apache License 2.0


`timescale 1 ns / 1 ps
module test;

  logic rst_n = 0;

  logic clk = 0;
  always #125 clk = !clk;

   logic VGND;
   logic VPWR;

   logic [7:0] ui_in;
   logic [7:0] uo_out;
   logic [7:0] uio_in;
   logic [7:0] uio_out;
   logic [7:0] uio_oe;

`ifdef ANA_TYPE_REAL
   real      ua_0  = 0;
   real      ua_1 = 0;

`else
   tri [7:0] ua;
   logic     uain = 0;
   assign ua = uain;
`endif
   wire       ena;



   tt_um_TT06_SAR_wulffern dut (
                                .VGND(VGND),
                                .VPWR(VPWR),
                                .ui_in(ui_in),
                                .uo_out(uo_out),
                                .uio_in(uio_in),
                                .uio_out(uio_out),
                                .uio_oe(uio_oe),
`ifdef ANA_TYPE_REAL
                                .ua_0(ua_0),
                                .ua_1(ua_1),
`else
                                .ua(ua),
`endif
                                .ena(ena),
                                .clk(clk),
                                .rst_n(rst_n)
                                );


`ifdef ANA_TYPE_REAL


   always #100 begin
      ua_0 = $sin(2*3.14*1/7750*$time);
      ua_1 = -$sin(2*3.14*1/7750*$time);
   end

`endif



  initial
    begin
       $dumpfile("test.vcd");
       $dumpvars(0,test);

       ui_in = 0;


       #10 rst_n = 0;
       #10 rst_n = 1;

       #10 VGND = 0;
       #1 VPWR = 1;

       #500 ui_in[0] = 1;

       #5000 $stop;

    end
endmodule // test
