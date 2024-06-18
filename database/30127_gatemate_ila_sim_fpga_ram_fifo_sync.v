// This program was cloned from: https://github.com/colognechip/gatemate_ila
// License: GNU General Public License v3.0

// Company           :   RacyICs GmbH
// Author            :   scholze,pilz,winter
// E-Mail            :   winter@racyics.de
//
// Filename          :   sync_fifo.v
// Project Name      :   p_cc
// Subproject Name   :   s_fpga
// Description       :   generic synchronous FIFO for FPGA
// 
// Create Date       :   Wed Jun 11 07:53:45 2008
// Last Change       :   g26.08.2013
// by                :   Pilz
//------------------------------------------------------------ 
`timescale 1 ns / 1 ps

module fifo_sync
  #(parameter CONFIG_1BIT  = 3'd1, //non-split-->32k x 1 bit; split-->16K x 1 bit
    parameter CONFIG_2BIT  = 3'd2, //non-split-->16k x 2 bit; split-->8K x 2 bit
    parameter CONFIG_5BIT  = 3'd3, //non-split-->8k  x 5 bit; split-->4K x 5 bit
    parameter CONFIG_10BIT = 3'd4, //non-split-->4k  x 10 bit; split-->2K x 10 bit
    parameter CONFIG_20BIT = 3'd5, //non-split-->2k  x 20 bit; split-->1K x 20 bit
    parameter CONFIG_40BIT = 3'd6, //non-split-->1K  x 40 bit; split (SPR)-->512 x 40 bit
    parameter CONFIG_80BIT = 3'd7, //non-split(SPR)-->512 x 80 bit; split-->NA 
   
    parameter ADDR_WIDTH   = 15  
    )
   (input  wire clk_i,
    input  wire a_reset_n_i, 
    
    input  wire [ADDR_WIDTH:0]   counter_max_i,
    input  wire [2:0]            fifo_config_i,
    input  wire [ADDR_WIDTH:0]   sram_depth_i, 
    
    input  wire [ADDR_WIDTH-1:0] almost_full_offset_i,
    input  wire [ADDR_WIDTH-1:0] almost_empty_offset_i,
    
    input  wire                  rd_en_i, 
    input  wire                  wr_en_i,
    output  reg [ADDR_WIDTH-1:0] write_address_o,
    output  reg [ADDR_WIDTH-1:0] read_address_o,
    output wire                  we_out_o,
    output wire                  re_out_o,
                                 
    output wire                  empty_o, 
    output  reg                  full_o, 
    output  reg                  almost_full_o, 
    output  reg                  almost_empty_o,
    output wire                  write_error_o,
    output wire                  read_error_o
    );   
   
   reg [ADDR_WIDTH:0]         wr_pointer; 
   reg [ADDR_WIDTH:0]         rd_pointer;
   
   wire [ADDR_WIDTH:0]        wr_pointer_nxt;
   wire [ADDR_WIDTH:0]        rd_pointer_nxt;
   
   always @(posedge clk_i or negedge a_reset_n_i) 
     begin 
        if (a_reset_n_i == 1'b0 ) 
          wr_pointer <= {ADDR_WIDTH+1{1'b0}}; 
        else if ( wr_en_i == 1'b1 && full_o == 1'b0 ) 
          wr_pointer <= wr_pointer_nxt; 
     end 
   
   assign wr_pointer_nxt=(wr_pointer==counter_max_i)?0: wr_pointer + 1'b1;  
   
   
   always @(posedge clk_i or negedge a_reset_n_i) 
     begin 
        if (a_reset_n_i == 1'b0 ) 
          rd_pointer <= {ADDR_WIDTH+1{1'b0}}; 
        else if ( rd_en_i == 1'b1 && empty_o == 1'b0 ) 
          rd_pointer <= rd_pointer_nxt; 
     end 
   
   assign rd_pointer_nxt=(rd_pointer==counter_max_i)?0: rd_pointer + 1'b1;    
     
   
   assign empty_o = (wr_pointer == rd_pointer); 
   
   
   always @(*)
     begin
        case(fifo_config_i)

          CONFIG_1BIT: begin // 32k  x 1 bit
             write_address_o={wr_pointer[14:0]};
             read_address_o={rd_pointer[14:0]};
             full_o=(wr_pointer[15-1:0] == rd_pointer[15-1:0]) && (wr_pointer[15] ^ rd_pointer[15]);
             
             if(wr_pointer[15] == rd_pointer[15]) almost_empty_o= ((wr_pointer[15-1:0]-rd_pointer[15-1:0])<= almost_empty_offset_i);
             else almost_empty_o= ((rd_pointer[15-1:0]-wr_pointer[15-1:0]) >= (sram_depth_i - almost_empty_offset_i));
             
             if(wr_pointer[15] == rd_pointer[15]) almost_full_o= ((wr_pointer[15-1:0]-rd_pointer[15-1:0]) >= (sram_depth_i - almost_full_offset_i));
             else almost_full_o=((rd_pointer[15-1:0]-wr_pointer[15-1:0])<= almost_full_offset_i); 
          end

          CONFIG_2BIT: begin // 16k  x 4 bit
             write_address_o={wr_pointer[13:0], 1'b0};
             read_address_o={rd_pointer[13:0], 1'b0};
             full_o=(wr_pointer[14-1:0] == rd_pointer[14-1:0]) && (wr_pointer[14] ^ rd_pointer[14]);
             
             if(wr_pointer[14] == rd_pointer[14]) almost_empty_o= ((wr_pointer[14-1:0]-rd_pointer[14-1:0])<= almost_empty_offset_i);
             else almost_empty_o= ((rd_pointer[14-1:0]-wr_pointer[14-1:0]) >= (sram_depth_i - almost_empty_offset_i));
             
             if(wr_pointer[14] == rd_pointer[14]) almost_full_o= ((wr_pointer[14-1:0]-rd_pointer[14-1:0]) >= (sram_depth_i - almost_full_offset_i));
             else almost_full_o=((rd_pointer[14-1:0]-wr_pointer[14-1:0])<= almost_full_offset_i); 
          end

          CONFIG_5BIT: begin // 8k  x 5 bit
             write_address_o={wr_pointer[12:0], 2'b00};
             read_address_o={rd_pointer[12:0], 2'b00};
             full_o=(wr_pointer[13-1:0] == rd_pointer[13-1:0]) && (wr_pointer[13] ^ rd_pointer[13]);
             
             if(wr_pointer[13] == rd_pointer[13]) almost_empty_o= ((wr_pointer[13-1:0]-rd_pointer[13-1:0])<= almost_empty_offset_i);
             else almost_empty_o= ((rd_pointer[13-1:0]-wr_pointer[13-1:0]) >= (sram_depth_i - almost_empty_offset_i));
             
             if(wr_pointer[13] == rd_pointer[13]) almost_full_o= ((wr_pointer[13-1:0]-rd_pointer[13-1:0]) >= (sram_depth_i - almost_full_offset_i));
             else almost_full_o=((rd_pointer[13-1:0]-wr_pointer[13-1:0])<= almost_full_offset_i); 
          end

          CONFIG_10BIT: begin // 4k  x 10 bit
             write_address_o={wr_pointer[11:0], 3'b000};
             read_address_o={rd_pointer[11:0], 3'b000};
             full_o=(wr_pointer[12-1:0] == rd_pointer[12-1:0]) && (wr_pointer[12] ^ rd_pointer[12]); 
             
             if(wr_pointer[12] == rd_pointer[12]) almost_empty_o= ((wr_pointer[12-1:0]-rd_pointer[12-1:0])<= almost_empty_offset_i);
             else almost_empty_o= ((rd_pointer[12-1:0]-wr_pointer[12-1:0]) >= (sram_depth_i - almost_empty_offset_i));
             
             if(wr_pointer[12] == rd_pointer[12]) almost_full_o= ((wr_pointer[12-1:0]-rd_pointer[12-1:0]) >= (sram_depth_i - almost_full_offset_i));
             else almost_full_o=((rd_pointer[12-1:0]-wr_pointer[12-1:0])<= almost_full_offset_i); 
          end

          CONFIG_20BIT: begin // 2k  x 20 bit
             write_address_o={wr_pointer[10:0], 4'b0000};
             read_address_o={rd_pointer[10:0], 4'b0000};
             full_o=(wr_pointer[11-1:0] == rd_pointer[11-1:0]) && (wr_pointer[11] ^ rd_pointer[11]); 
             
             if(wr_pointer[11] == rd_pointer[11]) almost_empty_o= ((wr_pointer[11-1:0]-rd_pointer[11-1:0])<= almost_empty_offset_i);
             else almost_empty_o= ((rd_pointer[11-1:0]-wr_pointer[11-1:0]) >= (sram_depth_i - almost_empty_offset_i));
			 
             
             if(wr_pointer[11] == rd_pointer[11]) almost_full_o= ((wr_pointer[11-1:0]-rd_pointer[11-1:0]) >= (sram_depth_i - almost_full_offset_i));
             else almost_full_o=((rd_pointer[11-1:0]-wr_pointer[11-1:0])<= almost_full_offset_i); 
          end

          CONFIG_40BIT: begin // 1K  x 40 bit
             write_address_o={wr_pointer[9:0], 5'b00000};
             read_address_o={rd_pointer[9:0], 5'b00000};
             full_o=(wr_pointer[10-1:0] == rd_pointer[10-1:0]) && (wr_pointer[10] ^ rd_pointer[10]); 
             
             if(wr_pointer[10] == rd_pointer[10]) almost_empty_o= ((wr_pointer[10-1:0]-rd_pointer[10-1:0])<= almost_empty_offset_i);
             else almost_empty_o= ((rd_pointer[10-1:0]-wr_pointer[10-1:0]) >= (sram_depth_i - almost_empty_offset_i));
			 
			 
             if(wr_pointer[10] == rd_pointer[10]) almost_full_o= ((wr_pointer[10-1:0]-rd_pointer[10-1:0]) >= (sram_depth_i - almost_full_offset_i));
             else almost_full_o=((rd_pointer[10-1:0]-wr_pointer[10-1:0])<= almost_full_offset_i); 
          end

          default: begin // CONFIG_80BIT, 512  x 40 bit
             write_address_o={wr_pointer[8:0], 6'd0};
             read_address_o={rd_pointer[8:0], 6'd0};
             full_o=(wr_pointer[9-1:0] == rd_pointer[9-1:0]) && (wr_pointer[9] ^ rd_pointer[9]); 
             
             if(wr_pointer[9] == rd_pointer[9]) almost_empty_o= ((wr_pointer[9-1:0]-rd_pointer[9-1:0])<= almost_empty_offset_i);
             else almost_empty_o= ((rd_pointer[9-1:0]-wr_pointer[9-1:0]) >= (sram_depth_i - almost_empty_offset_i));
			 
			 
             if(wr_pointer[9] == rd_pointer[9]) almost_full_o= ((wr_pointer[9-1:0]-rd_pointer[9-1:0]) >= (sram_depth_i - almost_full_offset_i));
             else almost_full_o=((rd_pointer[9-1:0]-wr_pointer[9-1:0])<= almost_full_offset_i); 
          end
        endcase
     end       
   
   
   
   
   assign write_error_o=  (full_o && wr_en_i);
   assign read_error_o=   (empty_o && rd_en_i);    
   assign we_out_o=       (~full_o && wr_en_i);  
   assign re_out_o=       (~empty_o && rd_en_i);
   
   
   
endmodule // sync_fifo
