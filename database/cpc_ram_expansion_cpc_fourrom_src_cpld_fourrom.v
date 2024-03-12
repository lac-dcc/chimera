/*
 * This code is part of the cpc_ram_expansion set of Amstrad CPC peripherals.
 * https://github.com/revaldinho/cpc_ram_expansion
 * 
 * Copyright (C) 2018 Revaldinho
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */
module cpld_fourrom(dip, reset_b,adr15,adr14,adr13,ioreq_b,mreq_b,romen_b,wr_b,rd_b,data,romdis,rom01cs_b,rom23cs_b, clk, romoe_b, skt01p27, skt23p27, roma14);


  input [7:0] dip;  
  input reset_b;
  input adr15;
  input adr14;
  input adr13;
  input ioreq_b;
  input mreq_b;
  input romen_b;
  input wr_b;
  input rd_b;
  input [7:0] data;
  input  clk;
  output romdis;
  output rom01cs_b;
  output rom23cs_b;
  output romoe_b;
  output skt01p27;
  output skt23p27;
  output roma14;
   
  
  reg       clken_lat_qb;
  reg [7:0] romsel_q;
  reg [3:0] rom16k_cs_r ;

  assign rom01cs_b = !(rom16k_cs_r[0] | rom16k_cs_r[1]) ;
  assign rom23cs_b = !(rom16k_cs_r[2] | rom16k_cs_r[3]) ;
  assign roma14    =   rom16k_cs_r[1] | rom16k_cs_r[3];

  assign skt01p27  = (!dip[6])?1'b1: roma14; 
  assign skt23p27  = (!dip[7])?1'b1: roma14; 

  assign romoe_b  =   romen_b | !rom16k_cs_r;
  assign romdis   = | rom16k_cs_r ;

  // DIP switches and numbered 1-8 on the board, but 0-7 in the Verilog code  
  // DIP 0 = enable lower ROM SKT01
  // DIP 1 = enable upper ROM SKT01
  // DIP 2 = enable lower ROM SKT23    
  // DIP 3 = enable upper ROM SKT23
  // DIP 54 =  00 : LOW ROM + ROMS 0-2
  // DIP 54 =  01 : ROMS 1-4
  // DIP 54 =  10 : ROMS 5,6,9,14
  // DIP 54 =  11 : ROMS 10-13  [FutureOS]
  // DIP 6  = select 32K EPROM in Skt01 - Care will wipe EEPROM if present 
  // DIP 7  = select 32K EPROM in Skt02 - Care will wipe EEPROM if present 
  
  // Create neg edge clock on IO write event - clock low pulse will be suppressed if not an IOWR* event
  // but if the pulse is allowed through use the trailing (rising) edge to capture data
  wire      wclk    = !(clk|clken_lat_qb); 

  always @ ( * )
    if ( clk )
      clken_lat_qb <= !(!ioreq_b && !wr_b && !adr13);

   
  always @ (negedge reset_b or posedge wclk )
    if ( !reset_b)
      romsel_q <= 8'b0;
    else
      romsel_q <= data; 

  always @ ( * ) 
    begin
      rom16k_cs_r = 4'b0;
      
      if (!adr14)
        rom16k_cs_r[0] = ( dip[0] & (dip[5:4]==2'b0));
      else
        if ( dip[5:4]== 2'h0 ) begin
          rom16k_cs_r[0] = 1'b0;          
          rom16k_cs_r[1] = dip[1] & ( romsel_q == 8'h00 ) ;
          rom16k_cs_r[2] = dip[2] & ( romsel_q == 8'h01 ) ;
          rom16k_cs_r[3] = dip[3] & ( romsel_q == 8'h02 ) ;
        end
        else if ( dip[5:4]== 2'h1 ) begin
          rom16k_cs_r[0] = dip[0] & ( romsel_q == 8'h01 ) ;
          rom16k_cs_r[1] = dip[1] & ( romsel_q == 8'h02 ) ;
          rom16k_cs_r[2] = dip[2] & ( romsel_q == 8'h03 ) ;
          rom16k_cs_r[3] = dip[3] & ( romsel_q == 8'h04 ) ;
        end
        else if ( dip[5:4]== 2'h2 ) begin
          rom16k_cs_r[0] = dip[0] & ( romsel_q == 8'h05 ) ;
          rom16k_cs_r[1] = dip[1] & ( romsel_q == 8'h06 ) ;
          rom16k_cs_r[2] = dip[2] & ( romsel_q == 8'h09 ) ;
          rom16k_cs_r[3] = dip[3] & ( romsel_q == 8'h0E ) ;
        end
        else if ( dip[5:4]== 2'h3 ) begin
          rom16k_cs_r[0] = dip[0] & ( romsel_q == 8'h0A ) ;
          rom16k_cs_r[1] = dip[1] & ( romsel_q == 8'h0B ) ;
          rom16k_cs_r[2] = dip[2] & ( romsel_q == 8'h0C ) ;
          rom16k_cs_r[3] = dip[3] & ( romsel_q == 8'h0D ) ;
        end
    end // always @ ( * )
  
          
  
endmodule


