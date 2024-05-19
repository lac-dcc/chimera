// This program was cloned from: https://github.com/alknvl/axis_udp
// License: MIT License

`timescale 1ns / 1ps

module payload_crc_acc_A(

   input    wire        clk,
   input    wire        rst,
   input    wire [63:0] udp_data,
   input   wire         udp_data_valid,
   input    wire        eop,
   input    wire        sop,
   output   reg[15:0]   udp_crc,
   output   reg         udp_crc_valid

);

   reg [31:0] sum_a;
   reg [31:0] sum_b;
   wire [16:0] result_a;
   wire [16:0] result_b;
   wire [17:0] result;
   reg last_detect;
   
   always @(posedge clk) begin
      if (rst) begin
         sum_a    <= 0;
         sum_b    <= 0;
         udp_crc <= 0;
         udp_crc_valid <= 0;
      end
      else begin
         if (udp_data_valid) begin
            sum_a <= udp_data[15:0] + udp_data[31:16]  + (sop? 16'b0 : sum_a);
            sum_b <= udp_data[47:32] + udp_data[63:48] + (sop? 16'b0 : sum_b);
         end
         if (last_detect) begin
            udp_crc <= (result[15:0] + result[17:16]);
            udp_crc_valid <= 1;
         end
         else udp_crc_valid <= 0;
      end
   end
   
   assign result_a = (sum_a[15:0] + sum_a[31:16]);
   assign result_b = (sum_b[15:0] + sum_b[31:16]);
   assign result   = result_a[15:0] + result_b[15:0] + result_a[16] + result_b[16];
   
   always @(posedge clk) begin 
       if (rst) begin
           last_detect <= 0;
       end else begin
         last_detect <= eop;
      end
   end

endmodule

