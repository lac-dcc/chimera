// This program was cloned from: https://github.com/abdelazeem201/SoC-FPGA
// License: MIT License

//*********************************************************************
//*   ASIC Fresh Board                                                *
//*   digital clock testbench                                         *
//*  Top File : testbench.v                                           *
//*  Author: abdelazeem                                                *
//*  Revision 0.1                                                     *
//*  Date     2023/12/11                                              *
//*  Email : a.abdelazeem201@gmail.com                                *
//*********************************************************************

`timescale 1ns/10ps
`define SIM
module testbench();

reg        t_clk   ;
reg        t_reset ;
reg        t_modify;
reg        t_minus ;

wire        t_second;
wire        t_a     ;
wire        t_b     ;
wire        t_c     ;
wire        t_d     ;
wire        t_e     ;
wire        t_f     ;
wire        t_g     ;
wire        t_point ;


clock clock_t(
              .clk    (t_clk   ),
            
              .modify_n (t_modify),
              .plus_n  (t_minus ), 
              .a      (t_a     ),
              .b      (t_b     ),
              .c      (t_c     ),
              .d      (t_d     ),
              .e      (t_e     ),
              .f      (t_f     ),
              .g      (t_g     ),
              .point  (t_point )
             );

  always #20.00 t_clk <= ~t_clk;

initial
begin
 // $fsdbDumpfile("clock.fsdb");
 // $fsdbDumpvars(0,testbench);
  t_reset =0 ;
  t_clk = 0;
  t_modify =0;
  t_minus = 0;
  #1000;
  t_modify =1;
  t_minus = 1;
  #1000;
  t_modify =0;
  #120000;
  t_modify =1;
  #1000;
  //_______________________
  t_minus = 0; 
  #1000 t_minus = 1; 
  #1000 t_minus = 0; 
  #1000 t_minus = 1; 
  #1000 t_minus = 0; 
  #1000 t_minus = 1; 
  #1000;
  //________________
  t_modify =0;
  #130000;
  t_modify =1;
  #1000;
  t_modify =0;
  #130000;
  t_modify =1;
  #1000;
  t_modify =0;
  #130000;
  t_modify =1;
  #1000;
  t_modify =0;
  #130000;
  t_modify =1;
  #1000;
  $stop;
end



endmodule
