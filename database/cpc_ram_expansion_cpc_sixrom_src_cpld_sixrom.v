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
module cpld_sixrom(dip, reset_b,adr15,adr14,adr13,ioreq_b,mreq_b,romen_b,wr_b,rd_b,data,romdis,rom01cs_b,rom23cs_b, rom45cs_b,  clk, romoe_b, roma14, busrq_b, busack_b);


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
  input  busrq_b;
  input  busack_b;
  output romdis;
  output rom01cs_b;
  output rom23cs_b;
  output rom45cs_b;
  output romoe_b;
  output roma14;


  reg [7:0] romsel_q;
  reg [5:0] rom16k_cs_r ;

  assign rom01cs_b = !(rom16k_cs_r[0] | rom16k_cs_r[1]) ;
  assign rom23cs_b = !(rom16k_cs_r[2] | rom16k_cs_r[3]) ;
  assign rom45cs_b = !(rom16k_cs_r[4] | rom16k_cs_r[5]) ;
  assign roma14    =   rom16k_cs_r[1] | rom16k_cs_r[3] | rom16k_cs_r[5];

  assign romoe_b  = romen_b;
  assign romdis = | rom16k_cs_r ;

  // DIP switches and numbered 1-8 on the board, but 0-7 in the Verilog code
  // DIP 0 = enable lower ROM SKT01
  // DIP 1 = enable upper ROM SKT01
  // DIP 2 = enable lower ROM SKT23
  // DIP 3 = enable upper ROM SKT23
  // DIP 4 = enable lower ROM SKT45
  // DIP 5 = enable upper ROM SKT45
  // DIP 6 = }__ ROM number selection - see table below
  // DIP 7 = }

  // Create neg edge clock on IO write event - clock low pulse will be suppressed if not an IOWR* event
  // but if the pulse is allowed through use the trailing (rising) edge to capture data
  wire      wclk = !(!ioreq_b && !wr_b && !adr13 && adr15 && adr14);

  always @ (negedge reset_b or posedge wclk )
    if ( !reset_b)
      romsel_q <= 8'b0;
    else
      romsel_q <= data;

  always @ ( * )
    begin
      rom16k_cs_r = 6'b0;
      if (!adr14)
        rom16k_cs_r[0] = ( dip[0] & (dip[7]==1'b0));
      else
        if ( dip[7:6]== 2'b00 ) begin
          // Firmware and BASIC replacement in SKT01, ROMS 1-4 in others
          rom16k_cs_r[0] = 1'b0 ;
          rom16k_cs_r[1] = dip[1] & ( romsel_q == 8'h0 ) ;
          rom16k_cs_r[2] = dip[2] & ( romsel_q == 8'h1 ) ;
          rom16k_cs_r[3] = dip[3] & ( romsel_q == 8'h2 ) ;
          rom16k_cs_r[4] = dip[4] & ( romsel_q == 8'h3 ) ;
          rom16k_cs_r[5] = dip[5] & ( romsel_q == 8'h4 ) ;
        end
        else if ( dip[7:6]== 2'b01 ) begin
          // FutureOS autoboot configuration - replacement lower ROM + FOS in slots 10-13
          rom16k_cs_r[0] = 1'b0 ;
          rom16k_cs_r[1] = dip[1] & ( romsel_q == 8'h0 ) ;
          rom16k_cs_r[2] = dip[2] & ( romsel_q == 8'hA ) ;
          rom16k_cs_r[3] = dip[3] & ( romsel_q == 8'hB ) ;
          rom16k_cs_r[4] = dip[4] & ( romsel_q == 8'hC ) ;
          rom16k_cs_r[5] = dip[5] & ( romsel_q == 8'hD ) ;
        end
        else if ( dip[7:6]== 2'b10 ) begin
          // ROMS 1-6
          rom16k_cs_r[0] = dip[0] & ( romsel_q == 8'h1 ) ;
          rom16k_cs_r[1] = dip[1] & ( romsel_q == 8'h2 ) ;
          rom16k_cs_r[2] = dip[2] & ( romsel_q == 8'h3 ) ;
          rom16k_cs_r[3] = dip[3] & ( romsel_q == 8'h4 ) ;
          rom16k_cs_r[4] = dip[4] & ( romsel_q == 8'h5 ) ;
          rom16k_cs_r[5] = dip[5] & ( romsel_q == 8'h6 ) ;
        end
        else if ( dip[7:6]== 2'b11 ) begin
          // ROMS 8-13
          rom16k_cs_r[0] = dip[0] & ( romsel_q == 8'h8 ) ;
          rom16k_cs_r[1] = dip[1] & ( romsel_q == 8'h9 ) ;
          rom16k_cs_r[2] = dip[2] & ( romsel_q == 8'hA ) ;
          rom16k_cs_r[3] = dip[3] & ( romsel_q == 8'hB ) ;
          rom16k_cs_r[4] = dip[4] & ( romsel_q == 8'hC ) ;
          rom16k_cs_r[5] = dip[5] & ( romsel_q == 8'hD ) ;
        end
    end // always @ ( * )



endmodule
