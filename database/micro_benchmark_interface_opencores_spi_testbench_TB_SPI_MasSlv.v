// This program was cloned from: https://github.com/tangxifan/micro_benchmark
// License: MIT License

////////////////////////////////////////////////////////////////////////////////
////                                                                        ////
//// Project Name: SPI (Verilog)                                            ////
////                                                                        ////
//// Module Name: Master_Slave_Testbench                                    ////
////                                                                        ////
////                                                                        ////
////  This file is part of the Ethernet IP core project                     ////
////  http://opencores.com/project,spi_verilog_master_slave                 ////
////                                                                        ////
////  Author(s):                                                            ////
////      Santhosh G (santhg@opencores.org)                                 ////
////                                                                        ////
////  Refer to Readme.txt for more information                              ////
////                                                                        ////
////////////////////////////////////////////////////////////////////////////////
////                                                                        ////
//// Copyright (C) 2014, 2015 Authors                                       ////
////                                                                        ////
//// This source file may be used and distributed without                   ////
//// restriction provided that this copyright statement is not              ////
//// removed from the file and that any derivative work contains            ////
//// the original copyright notice and the associated disclaimer.           ////
////                                                                        ////
//// This source file is free software; you can redistribute it             ////
//// and/or modify it under the terms of the GNU Lesser General             ////
//// Public License as published by the Free Software Foundation;           ////
//// either version 2.1 of the License, or (at your option) any             ////
//// later version.                                                         ////
////                                                                        ////
//// This source is distributed in the hope that it will be                 ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied             ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR                ////
//// PURPOSE.  See the GNU Lesser General Public License for more           ////
//// details.                                                               ////
////                                                                        ////
//// You should have received a copy of the GNU Lesser General              ////
//// Public License along with this source; if not, download it             ////
//// from http://www.opencores.org/lgpl.shtml                               ////
////                                                                        ////
////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/10ps
module TB_SPI_MasSlv;
    reg rstb;
    reg clk = 1'b0;
    reg mlb = 1'b0;
    reg start = 1'b0;
    reg [7:0] m_tdat = 8'b00000000;
    reg [1:0] cdiv = 0;
    wire din;
    wire ss;
    wire sck;
    wire dout;
    wire Mdone;
    wire [7:0] Mrdata;
	reg ten = 1'b0;
    reg [7:0] s_tdata = 8'b00000000;
    wire SLVdone;
    wire [7:0] SLVrdata;

    parameter PERIOD = 50;
    parameter real DUTY_CYCLE = 0.5;
    parameter OFFSET = 100;
    initial begin  // Clock process for clk
        #OFFSET;
        forever
        begin
            clk = 1'b0;
            #(PERIOD-(PERIOD*DUTY_CYCLE)) clk = 1'b1;
            #(PERIOD*DUTY_CYCLE);
        end
    end
// to end simulation
	initial #10000 $stop;

//uut MASTER instantiation
    spi_master MAS (
        .rstb(rstb),
        .clk(clk),
        .mlb(mlb),
        .start(start),
        .tdat(m_tdat),
        .cdiv(cdiv),
        .din(din),
        .ss(ss),
        .sck(sck),
        .dout(dout),
        .done(Mdone),
        .rdata(Mrdata));
//uut SLAVE instantiation
	spi_slave SLV (
        .rstb(rstb),
        .ten(ten),
        .tdata(s_tdata),
        .mlb(mlb),
        .ss(ss),
        .sck(sck),
        .sdin(dout),
        .sdout(din),
        .done(SLVdone),
        .rdata(SLVrdata));

// timed contrl signals
initial begin
        #10 rstb = 1'b0;
        #100;
			rstb = 1'b1;start = 1'b0;
			m_tdat = 8'b01111100; 
			cdiv = 2'b00;
   
        #100  start = 1'b1;ten=1; //s_tdata=8'hAC;
        #100  start = 1'b0;
 

        #1800 mlb = 1'b1; cdiv=2'b01; m_tdat=8'b00011100;//s_tdata=8'h64;
        #100  start = 1'b1;
		#100  start = 1'b0;
		#2202;
        
        #100  start = 1'b1;
		#100  start = 1'b0;
		#2000;

        m_tdat=~m_tdat;
        #100  start = 1'b1;
		#100  start = 1'b0;
		#2000;

   end

 
 always @ (rstb or Mrdata) begin
    if(rstb==0)
            s_tdata = 8'hAA;
    else
     begin
            # 10 s_tdata = Mrdata;
     end
 end

endmodule


