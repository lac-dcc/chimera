// This program was cloned from: https://github.com/tangxifan/micro_benchmark
// License: MIT License

////////////////////////////////////////////////////////////////////////////////
////                                                                        ////
//// Project Name: SPI (Verilog)                                            ////
////                                                                        ////
//// Module Name: spi_master                                                ////
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
/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  SPI MODE 3
		CHANGE DATA @ NEGEDGE
		read data @posedge

 RSTB-active low asyn reset, CLK-clock, T_RB=0-rx  1-TX, mlb=0-LSB 1st 1-msb 1st
 START=1- starts data transmission cdiv 0=clk/4 1=/8   2=/16  3=/32
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
module spi_master(rstb,clk,mlb,start,tdat,cdiv,din, ss,sck,dout,done,rdata);
    input rstb,clk,mlb,start;
    input [7:0] tdat;  //transmit data
    input [1:0] cdiv;  //clock divider
	input din;
	output reg ss; 
	output reg sck; 
	output reg dout; 
    output reg done;
	output reg [7:0] rdata; //received data

parameter idle=2'b00;		
parameter send=2'b10; 
parameter finish=2'b11; 
reg [1:0] cur,nxt;

	reg [7:0] treg,rreg;
	reg [3:0] nbit;
	reg [4:0] mid,cnt;
	reg shift,clr;

//FSM i/o
always @(start or cur or nbit or cdiv or rreg) begin
		 nxt=cur;
		 clr=0;  
		 shift=0;//ss=0;
		 case(cur)
			idle:begin
				if(start==1)
		               begin 
							 case (cdiv)
								2'b00: mid=2;
								2'b01: mid=4;
								2'b10: mid=8;
								2'b11: mid=16;
 							 endcase
						shift=1;
						done=1'b0;
						nxt=send;	 
						end
		        end //idle
			send:begin
				ss=0;
				if(nbit!=8)
					begin shift=1; end
				else begin
						rdata=rreg;done=1'b1;
						nxt=finish;
					end
				end//send
			finish:begin
					shift=0;
					ss=1;
					clr=1;
					nxt=idle;
				 end
			default: nxt=finish;
      endcase
    end//always

//state transistion
always@(negedge clk or negedge rstb) begin
 if(rstb==0) 
   cur<=finish;
 else 
   cur<=nxt;
 end

//setup falling edge (shift dout) sample rising edge (read din)
always@(negedge clk or posedge clr) begin
  if(clr==1) 
		begin cnt=0; sck=1; end
  else begin
	if(shift==1) begin
		cnt=cnt+1; 
	  if(cnt==mid) begin
	  	sck=~sck;
		cnt=0;
		end //mid
	end //shift
 end //rst
end //always

//sample @ rising edge (read din)
always@(posedge sck or posedge clr ) begin // or negedge rstb
 if(clr==1)  begin
			nbit=0;  rreg=8'hFF;  end
    else begin 
		  if(mlb==0) //LSB first, din@msb -> right shift
			begin  rreg={din,rreg[7:1]};  end 
		  else  //MSB first, din@lsb -> left shift
			begin  rreg={rreg[6:0],din};  end
		  nbit=nbit+1;
 end //rst
end //always

always@(negedge sck or posedge clr) begin
 if(clr==1) begin
	  treg=8'hFF;  dout=1;  
  end  
 else begin
		if(nbit==0) begin //load data into TREG
			treg=tdat; dout=mlb?treg[7]:treg[0];
		end //nbit_if
		else begin
			if(mlb==0) //LSB first, shift right
				begin treg={1'b1,treg[7:1]}; dout=treg[0]; end
			else//MSB first shift LEFT
				begin treg={treg[6:0],1'b1}; dout=treg[7]; end
		end
 end //rst
end //always


endmodule
