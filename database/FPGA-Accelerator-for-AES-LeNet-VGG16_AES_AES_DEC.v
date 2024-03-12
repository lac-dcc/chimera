`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2017 04:35:07 AM
// Design Name: 
// Module Name: AES_DEC
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


module AES_DEC(
    Din, Key, Dout, Drdy, Krdy, RSTn, EN, CLK, BSY, Dvld
    );
    input  [127:0] Din;  // Data input
      input  [127:0] Key;  // Key input
      output [127:0] Dout; // Data output
      input  Drdy;         // Data input ready
      input  Krdy;         // Key input ready
      input  RSTn;         // Reset (Low active)
      input  EN;           // AES circuit enable
      input  CLK;          // System clock
      output BSY;          // Busy signal
      output Dvld;         // Data output valid
    
      reg  [127:0] Drg;    // Data register
      reg  [127:0] Krg;    // Key register
      reg  [127:0] KrgX;   // Temporary key Register
      reg  [9:0]   Rrg;    // Round counter
      reg  Dvldrg, BSYrg;
      wire [127:0] Dnext, Knext;
    
      DecCore DC (Drg, KrgX, Rrg, Dnext, Knext);
    
      assign Dvld = Dvldrg;
      assign Dout = Drg;
      assign BSY  = BSYrg;
    
      always @(posedge CLK) begin
        if (RSTn == 0) begin
          Rrg    <= 10'b1000000000;
          Dvldrg <= 0;
          BSYrg  <= 0;
        end
        else if (EN == 1) begin
          if (BSYrg == 0) begin
            if (Krdy == 1) begin
              Krg    <= Key;
              KrgX   <= Key;
              Dvldrg <= 0;
            end
            else if (Drdy == 1) begin
              KrgX   <= Knext;
              Drg    <= Din ^ Krg;
              Rrg <= {Rrg[0], Rrg[9:1]};
              Dvldrg <= 0;
              BSYrg  <= 1;
            end
          end
          else begin
            Drg <= Dnext;
            if (Rrg[9] == 1) begin
              KrgX   <= Krg;
              Dvldrg <= 1;
              BSYrg  <= 0;
            end
            else begin
              Rrg    <= {Rrg[0], Rrg[9:1]};
              KrgX   <= Knext;
            end
          end
        end
      end   
endmodule
