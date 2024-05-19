// This program was cloned from: https://github.com/alknvl/axis_udp
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// IPv4 header checksum accumulator (RFC 1071)
//////////////////////////////////////////////////////////////////////////////////
module ip_header_checksum(
   input           clk,           
   output[15:0]    checksum,       
   input [31:0]    header,         
   output          valid,          
   input           reset           
   );

   reg [31:0] checksum_int;        
   reg [2:0] header_count;        

always @(posedge clk)
   if (reset) begin                
      checksum_int <= 0;
      header_count <= 0;
   end
   else
      if (header_count < 5)      
      begin
         header_count <= header_count + 1'b1;                            
         checksum_int <= checksum_int + header[15:0] + header[31:16];    
      end

   wire [16:0]  summ = checksum_int[31:16] + checksum_int[15:0];
   assign checksum = ~(summ[15:0] + summ[16]);

   assign valid = (header_count==5);                                      

endmodule
