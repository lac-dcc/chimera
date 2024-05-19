// This program was cloned from: https://github.com/ManuFerHi/N-GO
// License: GNU General Public License v3.0

`timescale 1ns / 1ns
`default_nettype none

//    This file is part of the ZXUNO Spectrum core. 
//    Creation date is 23:49:58 2020-02-27 by Miguel Angel Rodriguez Jodar
//    (c)2014-2020 ZXUNO association.
//    ZXUNO official repository: http://svn.zxuno.com/svn/zxuno
//    Username: guest   Password: zxuno
//    Github repository for this core: https://github.com/mcleod-ideafix/zxuno_spectrum_core
//
//    ZXUNO Spectrum core is free software: you can redistribute it and/or modify
//    it under the terms of the GNU General Public License as published by
//    the Free Software Foundation, either version 3 of the License, or
//    (at your option) any later version.
//
//    ZXUNO Spectrum core is distributed in the hope that it will be useful,
//    but WITHOUT ANY WARRANTY; without even the implied warranty of
//    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//    GNU General Public License for more details.
//
//    You should have received a copy of the GNU General Public License
//    along with the ZXUNO Spectrum core.  If not, see <https://www.gnu.org/licenses/>.
//
//    Any distributed copy of this file must keep this notice intact.

module spi (
  input wire clk,         // 
  input wire clken,       //
  input wire enviar_dato, // a 1 para indicar que queremos enviar un dato por SPI
  input wire recibir_dato,// a 1 para indicar que queremos recibir un dato
  input wire [7:0] din,   // del bus de datos de salida de la CPU
  output reg [7:0] dout,  // al bus de datos de entrada de la CPU
  output wire oe,         // el dato en dout es válido
  output reg spi_transfer_in_progress,
   
  output wire sclk,       // Interface SPI
  output wire mosi,       //
  input wire miso         //
  );
  
  reg [7:0] spireg = 8'hFF;
  reg [4:0] count = 5'b10000;
  reg data_from_miso = 1'b0;
  assign mosi = spireg[7];
  assign sclk = count[0];
  assign oe = recibir_dato;
  always @(posedge clk) begin
    if (enviar_dato == 1'b1 && spi_transfer_in_progress == 1'b0) begin
      spireg <= din;
      count <= 5'b11110;
    end
    else if (recibir_dato == 1'b1 && spi_transfer_in_progress == 1'b0) begin
      dout <= spireg;
      count <= 5'b11100;
    end
    else if (count == 5'b11110)
      count <= 5'b00000;
    else if (count == 5'b11100) begin
      count <= 5'b00000;
      spireg <= 8'hFF;
    end
    else if (clken == 1'b1) begin
      if (spi_transfer_in_progress == 1'b1) begin
        if (sclk == 1'b1)   // con SCLK a 1, en la transición de 1 a 0, el registro se desplaza
          spireg <= {spireg[6:0], data_from_miso};
        else                // con SCLK a 0, en la transición de 0 a 1, MISO se samplea
          data_from_miso <= miso;        
        count <= count + 5'd1;
      end
    end
  end
  
  always @* begin
    if (count >= 5'b0000 && count < 5'b10000)
      spi_transfer_in_progress = 1'b1;
    else
      spi_transfer_in_progress = 1'b0;
  end
endmodule
