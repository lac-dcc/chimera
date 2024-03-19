// Company           :   racyics
// Author            :   winter
// E-Mail            :   <email>
//
// Filename          :   bit_deselection_ram_port.v
// Project Name      :   p_cc
// Subproject Name   :   s_fpga, dpsram_block_4x512x20
// Description       :   <short description>
//
// Create Date       :   
// Last Change       :   $Date: 2015-04-20 12:47:55 +0200 (Mon, 20 Apr 2015) $
// by                :   $Author: winter $
//------------------------------------------------------------

`timescale 1 ns / 1 ps

module bit_deselection_ram_port
  #(parameter C_RAM = 1,
    parameter CONFIG_1BIT  = 3'd1, //non-split-->32k x 1 bit; split-->16K x 1 bit
    parameter CONFIG_2BIT  = 3'd2, //non-split-->16k x 2 bit; split-->8K x 2 bit
    parameter CONFIG_5BIT  = 3'd3, //non-split-->8k  x 5 bit; split-->4K x 5 bit
    parameter CONFIG_10BIT = 3'd4, //non-split-->4k  x 10 bit; split-->2K x 10 bit
    parameter CONFIG_20BIT = 3'd5, //non-split-->2k  x 20 bit; split-->1K x 20 bit
    parameter CONFIG_40BIT = 3'd6, //non-split-->1K  x 40 bit; split (SPR)-->512 x 40 bit
    parameter CONFIG_80BIT = 3'd7  //non-split(SPR)-->512 x 80 bit; split-->NA
    )
  (// signals from mode_selection
   input  wire [2:0]  output_config_i,
   input  wire        clk_i,
   input  wire        re_i,
   input  wire [15:0] addr_i,
   input  wire [19:0] rddata_i,
   
   // signals to RAM-macro
   output wire [19:0] rddata_o
   );

   reg [19:0]        aligned_rddata;
   reg [4:1]         r_addr;

   always@(posedge clk_i) begin
      // read access or writethrough on this memory
      if(re_i) begin
        r_addr <=  addr_i[4:1];
      end
   end

   always@* begin
      aligned_rddata = 'd0;

      case(output_config_i)
        CONFIG_1BIT: begin
           case(r_addr[4:1])
             4'd0: aligned_rddata[0]    = rddata_i[0];
             4'd1: aligned_rddata[0]    = rddata_i[1];
             4'd2: aligned_rddata[0]    = rddata_i[2];
             4'd3: aligned_rddata[0]    = rddata_i[3];
             4'd4: aligned_rddata[0]    = rddata_i[5];
             4'd5: aligned_rddata[0]    = rddata_i[6];
             4'd6: aligned_rddata[0]    = rddata_i[7];
             4'd7: aligned_rddata[0]    = rddata_i[8];
             4'd8: aligned_rddata[0]    = rddata_i[10];
             4'd9: aligned_rddata[0]    = rddata_i[11];
             4'd10: aligned_rddata[0]   = rddata_i[12];
             4'd11: aligned_rddata[0]   = rddata_i[13];
             4'd12: aligned_rddata[0]   = rddata_i[15];
             4'd13: aligned_rddata[0]   = rddata_i[16];
             4'd14: aligned_rddata[0]   = rddata_i[17];
             4'd15: aligned_rddata[0]   = rddata_i[18];
           endcase
        end // case: CONFIG_1BIT
        
        CONFIG_2BIT: begin
           case(r_addr[4:2])
             3'd0: aligned_rddata[1:0]    = rddata_i[1:0];
             3'd1: aligned_rddata[1:0]    = rddata_i[3:2];
             3'd2: aligned_rddata[1:0]    = rddata_i[6:5];
             3'd3: aligned_rddata[1:0]    = rddata_i[8:7];
             3'd4: aligned_rddata[1:0]    = rddata_i[11:10];
             3'd5: aligned_rddata[1:0]    = rddata_i[13:12];
             3'd6: aligned_rddata[1:0]    = rddata_i[16:15];
             3'd7: aligned_rddata[1:0]    = rddata_i[18:17];
           endcase
        end // case: CONFIG_2BIT        
        
        CONFIG_5BIT: begin
           case(r_addr[4:3])
             2'd0: aligned_rddata[4:0]    = rddata_i[4:0];
             2'd1: aligned_rddata[4:0]    = rddata_i[9:5];
             2'd2: aligned_rddata[4:0]    = rddata_i[14:10];
             2'd3: aligned_rddata[4:0]    = rddata_i[19:15];
           endcase
        end // case: CONFIG_5BIT
        
        CONFIG_10BIT: begin
           case(r_addr[4])
             1'd0: aligned_rddata[9:0]    = rddata_i[9:0];
             1'd1: aligned_rddata[9:0]    = rddata_i[19:10];
           endcase
        end // case: CONFIG_10BIT
      endcase
   end // always@ *


   bit_deselection_mux
     #(.CONFIG_1BIT (CONFIG_1BIT ),
       .CONFIG_2BIT (CONFIG_2BIT ),
       .CONFIG_5BIT (CONFIG_5BIT ),
       .CONFIG_10BIT(CONFIG_10BIT),
       .CONFIG_20BIT(CONFIG_20BIT),
       .CONFIG_40BIT(CONFIG_40BIT),
       .CONFIG_80BIT(CONFIG_80BIT) 
       )
     bit_deselection_mux_i0
       (.output_config_i (output_config_i),
        .rddata_i        (rddata_i),
        .aligned_rddata_i(aligned_rddata),
        .rddata_o        (rddata_o)
        );
   

endmodule // bit_deselection_ram_port
