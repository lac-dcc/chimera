// This program was cloned from: https://github.com/alknvl/axis_udp
// License: MIT License


`timescale 1ns / 1ps
module outbond_header_crc(
   input clk,                         
   input reset,                       
   input [159:0] header,              
   input header_valid,                
   output [15:0] checksum,            
   output checksum_valid              

);


   localparam WAIT_HEADER          =0;    
   localparam CHECKSUM_CALCULATE   =1;    
   localparam RESULT               =2;    
   
   reg [2:0]       state;                 
   reg [127:0]     header_sreg;           
   reg [2:0]       shift_cntr;            
   reg [31:0]      header_data;           
   reg             crc_reset;             
   
   
   
   always @(posedge clk) begin
      if (reset) begin                                   
         // reset
         header_sreg<=0;
         header_data<=0;
         shift_cntr<=0;
         crc_reset<=0;
         state<=WAIT_HEADER;
         shift_cntr<=0;
   
      end
      else 
      case (state)
         WAIT_HEADER:begin                                     
            if (header_valid) begin                            
               state <= CHECKSUM_CALCULATE;                    
               header_data<=header[31:0];                      
               header_sreg<=header[159:32];                    
               crc_reset<=0;                                   
               
            end 
            else begin                                         
               crc_reset<=1;                                   
               state <= WAIT_HEADER;                           
            end
         end //WAIT_HEADER:begin
   
         CHECKSUM_CALCULATE: begin                   
            header_data<=header_sreg[31:0];                    
            header_sreg<={32'b0, header_sreg[127:32]};         
            shift_cntr<=shift_cntr+1;                          
            if (shift_cntr==4) begin                           
               state<= WAIT_HEADER;                            
               crc_reset<=1;                                   
            end 
         end //CHECKSUM_CALCULATE: begin
   
         default: state<= WAIT_HEADER;                         
      endcase
   end
   
   
   
   checksum_acc checksum_acc_i(
           .clk(clk),                      
           .valid(checksum_valid),         
           .checksum(checksum[15:0]),      
           .header(header_data),           
           .reset(crc_reset)               
      
   );
   
   
endmodule

module checksum_acc(
   input          clk,
   output[15:0]   checksum,
   input [31:0]   header,
   output         valid,
   input          reset
);

   reg [31:0] checksum_int;
   reg [2:0] header_count;
   
   always @(posedge clk)
   if (reset) begin
      checksum_int <= 0;
      header_count <= 0;
   end
   else
      if (header_count != 5)
      begin
         header_count <= header_count + 1'b1;
         checksum_int <= checksum_int + header[15:0] + header[31:16];
      end

   wire [16:0]  summ = checksum_int[31:16] + checksum_int[15:0];
   assign checksum = ~(summ[15:0] + summ[16]);
   
   assign valid = (header_count==5);
endmodule