////////////////////////////////////////////////////////////////////////////////////////////////////
// This program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public License
// as published by the Free Software Foundation; either version 2
// of the License, or (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA
// 02111-1307, USA.
//
// ©2013 - Roman Ovseitsev <romovs@gmail.com>
////////////////////////////////////////////////////////////////////////////////////////////////////

//##################################################################################################
//
// OmniVision Serial Camera Control Bus (SCCB (a.k.a I2C)) controller.
//
// Supports both 3-Phase writes and 2-phase write/reads.
//
//##################################################################################################

`timescale 1ns / 1ps

module SCCBCtrl (clk_i, rst_i, sccb_clk_i, data_pulse_i, addr_i, data_i, data_o, rw_i, start_i, ack_error_o, 
                  done_o, sioc_o, siod_io, stm);

   input       clk_i;               // Main clock.
   input       rst_i;               // Reset.
   input       sccb_clk_i;          // SCCB clock. Typical - 100KHz as per SCCB spec.
   input       data_pulse_i;        // Negative mid sccb_clk_i cycle pulse.
   input       [7:0] addr_i;        // Device ID. Bit 0 is ignored since read/write operation is specified by rw_i.
   input       [15:0] data_i;       // Register address in [15:8] and data to write in [7:0] if rw_i = 1 (write).
                                    // Register address in [15:8] if rw_i = 0 (read).
   output reg  [7:0] data_o;        // Data received if rw_i = 0 (read).
   input       rw_i;                // 0 - read command. 1 - write command. 
   input       start_i;             // Start transaction.
   output      ack_error_o;         // Error occurred during the transaction.
   output reg  done_o;              // 0 - transaction is in progress. 1 - transaction has completed.
   output      sioc_o;              // SIOC line.
   inout       siod_io;             // SIOD line. External pull-up resistor required.
   
   output reg         [6:0] stm; 

   reg         sccb_stm_clk = 1;
   reg         bit_out = 1;
   reg         ack_err1 = 1;
   reg         ack_err2 = 1;
   reg         ack_err3 = 1;
   
   assign   sioc_o = (start_i == 1 && 
                     (stm >= 5 && stm <= 12 || stm == 14 ||   
                     stm >= 16 && stm <= 23 || stm == 25 ||
                     stm >= 27 && stm <= 34 || stm == 36 ||
                     stm >= 44 && stm <= 51 || stm == 53 ||
                     stm >= 55 && stm <= 62 || stm == 64)) ? sccb_clk_i : sccb_stm_clk;
                     
   // Output acks and read data only.
   assign   siod_io = (stm == 13 || stm == 14 || stm == 24 || stm == 25 || stm == 35 || stm == 36 ||
                        stm == 52 || stm == 53 || stm >= 54 && stm <= 62) ? 1'bz : bit_out;
                        
   assign   ack_error_o = ack_err1 | ack_err2 | ack_err3;
   

   always @(posedge clk_i or negedge rst_i) begin
      if(rst_i == 0) begin 
         stm <= 0;
         sccb_stm_clk <= 1;
         bit_out <= 1; 
         data_o <= 0;  
         done_o <= 0;
         ack_err1 <= 1; 
         ack_err2 <= 1; 
         ack_err3 <= 1;          
      end else if (data_pulse_i) begin
         if (start_i == 0 || done_o == 1) begin
            stm <= 0;
         end else if (rw_i == 0 && stm == 25) begin
            stm <= 37;
         end else if (rw_i == 1 && stm == 36) begin
            stm <= 65;
         end else if (stm < 68) begin
            stm <= stm + 1'b1;
         end

         if (start_i == 1) begin
                (* parallel_case *) case(stm)
                  // Initialize
                  7'd0 : bit_out <= 1;
                  7'd1 : bit_out <= 1;

                  // Start write transaction.
                  7'd2 : bit_out <= 0;
                  7'd3 : sccb_stm_clk <= 0;
                  
                  // Write device`s ID address.
                  7'd4 : bit_out <= addr_i[7];
                  7'd5 : bit_out <= addr_i[6];
                  7'd6 : bit_out <= addr_i[5];
                  7'd7 : bit_out <= addr_i[4];
                  7'd8 : bit_out <= addr_i[3];
                  7'd9 : bit_out <= addr_i[2];
                  7'd10: bit_out <= addr_i[1];
                  7'd11: bit_out <= 0;
                  7'd12: bit_out <= 0;
                  7'd13: ack_err1 <= siod_io;
                  7'd14: bit_out <= 0;
                  
                  // Write register address.
                  7'd15: bit_out <= data_i[15];
                  7'd16: bit_out <= data_i[14];
                  7'd17: bit_out <= data_i[13];
                  7'd18: bit_out <= data_i[12];
                  7'd19: bit_out <= data_i[11];
                  7'd20: bit_out <= data_i[10];
                  7'd21: bit_out <= data_i[9];
                  7'd22: bit_out <= data_i[8];
                  7'd23: bit_out <= 0;
                  7'd24: ack_err2 <= siod_io;
                  7'd25: bit_out <= 0;
                  
                  // Write data. This concludes 3-phase write transaction.
                  7'd26: bit_out <= data_i[7];
                  7'd27: bit_out <= data_i[6];
                  7'd28: bit_out <= data_i[5];
                  7'd29: bit_out <= data_i[4];
                  7'd30: bit_out <= data_i[3];
                  7'd31: bit_out <= data_i[2];
                  7'd32: bit_out <= data_i[1];
                  7'd33: bit_out <= data_i[0];
                  7'd34: bit_out <= 0;
                  7'd35: ack_err3 <= siod_io;
                  7'd36: bit_out <= 0;

                  // Stop transaction.
                  7'd37: sccb_stm_clk <= 0; 
                  7'd38: sccb_stm_clk <= 1;   
                  7'd39: bit_out <= 1;

                  // Start read tranasction. At this point register address has been set in prev write transaction.  
                  7'd40: sccb_stm_clk <= 1;
                  7'd41: bit_out <= 0;
                  7'd42: sccb_stm_clk <= 0;
                  
                  // Write device`s ID address.
                  7'd43: bit_out <= addr_i[7];
                  7'd44: bit_out <= addr_i[6];
                  7'd45: bit_out <= addr_i[5];
                  7'd46: bit_out <= addr_i[4];
                  7'd47: bit_out <= addr_i[3];
                  7'd48: bit_out <= addr_i[2];
                  7'd49: bit_out <= addr_i[1];
                  7'd50: bit_out <= 1;
                  7'd51: bit_out <= 0;
                  7'd52: ack_err3 <= siod_io;
                  7'd53: bit_out <= 0;
                  
                  // Read register value. This concludes 2-phase read transaction.
                  7'd54: data_o[7] <= siod_io;
                  7'd55: data_o[6] <= siod_io; 
                  7'd56: data_o[5] <= siod_io; 
                  7'd57: data_o[4] <= siod_io;
                  7'd58: data_o[3] <= siod_io;
                  7'd59: data_o[2] <= siod_io; 
                  7'd60: data_o[1] <= siod_io;
                  7'd61: data_o[0] <= siod_io;
                  7'd62: bit_out <= 1;
                  7'd63: bit_out <= 1;
                  7'd64: bit_out <= 0;

                  // Stop transaction.
                  7'd65: sccb_stm_clk <= 0;
                  7'd66: sccb_stm_clk <= 1;
                  7'd67: begin 
                     bit_out <= 1;
                     done_o <= 1;
                  end
                  default: sccb_stm_clk <= 1;
               endcase
            
         end else begin
            sccb_stm_clk <= 1;
            bit_out <= 1; 
            data_o <= data_o;
            done_o <= 0;
            ack_err1 <= 1; 
            ack_err2 <= 1; 
            ack_err3 <= 1;
         end
      end
   end
   
endmodule
