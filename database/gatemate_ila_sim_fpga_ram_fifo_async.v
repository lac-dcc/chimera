// This program was cloned from: https://github.com/colognechip/gatemate_ila
// License: GNU General Public License v3.0

// Company           :   RacyICs GmbH
// Author            :   scholze,pilz,winter
// E-Mail            :   winter@racyics.de
//
// Filename          :   fifo_async.v
// Project Name      :   p_cc
// Subproject Name   :   s_fpga
// Description       :   
// 
// Create Date       :   July 2013
// Last Change       :   11.12.2013
// by                :   Winter
//------------------------------------------------------------ 

`timescale 1ns/1ps

module fifo_async
  #(parameter CONFIG_1BIT  = 3'd1, //non-split-->32k x 1 bit; split-->16K x 1 bit
    parameter CONFIG_2BIT  = 3'd2, //non-split-->16k x 2 bit; split-->8K x 2 bit
    parameter CONFIG_5BIT  = 3'd3, //non-split-->8k  x 5 bit; split-->4K x 5 bit
    parameter CONFIG_10BIT = 3'd4, //non-split-->4k  x 10 bit; split-->2K x 10 bit
    parameter CONFIG_20BIT = 3'd5, //non-split-->2k  x 20 bit; split-->1K x 20 bit
    parameter CONFIG_40BIT = 3'd6, //non-split-->1K  x 40 bit; split (SPR)-->512 x 40 bit
    parameter CONFIG_80BIT = 3'd7, //non-split(SPR)-->512 x 80 bit; split-->NA
   
    parameter ADDR_WIDTH   = 15 
    )
   (input  wire wclk_i,
    input  wire rclk_i,
    input  wire wa_reset_n_i,
    input  wire ra_reset_n_i,
    
    input  wire [ADDR_WIDTH:0]   next_bin_max_i,
    input  wire [2:0]            fifo_config_i,
    input  wire [ADDR_WIDTH:0]   sram_depth_i, 
    
    input  wire [ADDR_WIDTH-1:0] almost_full_offset_i,
    input  wire [ADDR_WIDTH-1:0] almost_empty_offset_i,
    
    input  wire                  write_en_i,
    input  wire                  read_en_i,
    output  reg [ADDR_WIDTH-1:0] write_address_o,
    output  reg [ADDR_WIDTH-1:0] read_address_o,
    output wire                  we_out_o,
    output wire                  re_out_o,
    
    output  reg                  full_o,
    output  reg                  empty_o,
    output  reg                  almost_full_o,
    output  reg                  almost_empty_o,
    output wire                  write_error_o,
    output wire                  read_error_o);
   
   
   reg [ADDR_WIDTH - 1:0]    int_waddr;
   reg [ADDR_WIDTH:0]        waddr_sync_0;
   reg [ADDR_WIDTH:0]        waddr_sync_1;
   reg [ADDR_WIDTH:0]        wbin;

   reg [ADDR_WIDTH - 1:0]    int_raddr;
   reg [ADDR_WIDTH:0]        raddr_sync_0;
   reg [ADDR_WIDTH:0]        raddr_sync_1;
   reg [ADDR_WIDTH:0]        rbin;

   wire                      int_write_en_i;
   wire [ADDR_WIDTH:0]       next_wbin;
   wire [ADDR_WIDTH:0]       next_rbin;
   reg [ADDR_WIDTH:0]        wbin_sync;
   reg [ADDR_WIDTH:0]        rbin_sync;
   
   
   reg [ADDR_WIDTH:0]        raddr;
   reg [ADDR_WIDTH:0]        waddr;

   integer                   i;


   // write address synchronizer
   always @(posedge rclk_i or negedge ra_reset_n_i)
     begin
        if ( ra_reset_n_i == 1'b0 )
          begin
             waddr_sync_0 <= {ADDR_WIDTH+1{1'b0}};
             waddr_sync_1 <= {ADDR_WIDTH+1{1'b0}};
          end
        else
          begin
             waddr_sync_0 <= waddr;
             waddr_sync_1 <= waddr_sync_0;
          end
     end 

   // read address synchronizer
   always @(posedge wclk_i or negedge wa_reset_n_i)
     begin
        if ( wa_reset_n_i == 1'b0 )
          begin
             raddr_sync_0 <= {ADDR_WIDTH+1{1'b0}};
             raddr_sync_1 <= {ADDR_WIDTH+1{1'b0}};
          end
        else
          begin
             raddr_sync_0 <= raddr;
             raddr_sync_1 <= raddr_sync_0;
          end
     end 

   assign next_rbin= (rbin==next_bin_max_i)? 0 : rbin + {{ADDR_WIDTH{1'b0}}, 1'b1};

   // read address register
   always @(posedge rclk_i or negedge ra_reset_n_i)
     begin
        if ( ra_reset_n_i == 1'b0 )
          begin
             rbin <= {ADDR_WIDTH+1{1'b0}};
             int_raddr  <= {ADDR_WIDTH{1'b0}};
          end
        
        else if ( read_en_i == 1'b1 && empty_o == 1'b0 )
          begin
             rbin       <= next_rbin;
             int_raddr  <= next_rbin[ADDR_WIDTH:1] ^
                           next_rbin[ADDR_WIDTH - 1:0];
          end
     end 


   assign int_write_en_i   = ~full_o & write_en_i;
   assign next_wbin = (wbin==next_bin_max_i)? 0 : wbin + {{ADDR_WIDTH{1'b0}}, 1'b1};

   // write address register
   always @(posedge wclk_i or negedge wa_reset_n_i)
     begin
        if ( wa_reset_n_i == 1'b0 )
          begin
             wbin       <= {ADDR_WIDTH+1{1'b0}};
             int_waddr  <= {ADDR_WIDTH{1'b0}};
          end
        else if ( int_write_en_i == 1'b1 )
          begin
             wbin       <= next_wbin;
             int_waddr  <= next_wbin[ADDR_WIDTH:1] ^
                           next_wbin[ADDR_WIDTH - 1:0];
          end
     end 

   always @(*)
     begin
        case(fifo_config_i)          
          CONFIG_1BIT:  begin
             raddr = {rbin[15], int_raddr[14:0]};
             empty_o = ( raddr[15:0] == waddr_sync_1[15:0] );
             waddr = {wbin[15], int_waddr[14:0]};
             full_o  = ( waddr[15 - 2:0] == raddr_sync_1[15 - 2:0] ) && (waddr[15] != raddr_sync_1[15] ) && ( waddr[15 - 1] != raddr_sync_1[15 - 1] );
          end
          
          CONFIG_2BIT:  begin
             raddr = {1'd0, rbin[14], int_raddr[13:0]};
             empty_o = ( raddr[14:0] == waddr_sync_1[14:0] );
             waddr = {1'd0, wbin[14], int_waddr[13:0]};
             full_o  = ( waddr[14 - 2:0] == raddr_sync_1[14 - 2:0] ) && (waddr[14] != raddr_sync_1[14] ) && ( waddr[14 - 1] != raddr_sync_1[14 - 1] );
          end
          
          CONFIG_5BIT:  begin
             raddr = {2'd0, rbin[13], int_raddr[12:0]};
             empty_o = ( raddr[13:0] == waddr_sync_1[13:0] );
             waddr = {2'd0, wbin[13], int_waddr[12:0]};
             full_o  = ( waddr[13 - 2:0] == raddr_sync_1[13 - 2:0] ) && (waddr[13] != raddr_sync_1[13] ) && ( waddr[13 - 1] != raddr_sync_1[13 - 1] );
          end
          
          CONFIG_10BIT:  begin
             raddr = {3'd0, rbin[12], int_raddr[11:0]};
             empty_o = ( raddr[12:0] == waddr_sync_1[12:0] );
             waddr = {3'd0, wbin[12], int_waddr[11:0]};
             full_o  = ( waddr[12 - 2:0] == raddr_sync_1[12 - 2:0] ) && (waddr[12] != raddr_sync_1[12] ) && ( waddr[12 - 1] != raddr_sync_1[12 - 1] );
          end
          
          CONFIG_20BIT:  begin
             raddr = {4'd0, rbin[11], int_raddr[10:0]};
             empty_o = ( raddr[11:0] == waddr_sync_1[11:0] );
             waddr = {4'd0, wbin[11], int_waddr[10:0]};
             full_o  = ( waddr[11 - 2:0] == raddr_sync_1[11 - 2:0] ) && (waddr[11] != raddr_sync_1[11] ) && ( waddr[11 - 1] != raddr_sync_1[11 - 1] );
          end          
          
          CONFIG_40BIT: begin 
             raddr = {5'd0, rbin[10], int_raddr[9:0]};
             empty_o = ( raddr[10:0] == waddr_sync_1[10:0] );
             waddr = {5'd0, wbin[10], int_waddr[9:0]};
             full_o  = ( waddr[10 - 2:0] == raddr_sync_1[10 - 2:0] ) && (waddr[10] != raddr_sync_1[10] ) && ( waddr[10 - 1] != raddr_sync_1[10 - 1] );
          end         
          
          default:  begin // CONFIG_40BIT, more is not allowed for FIFO 
             raddr = {5'd0, rbin[9], int_raddr[8:0]};
             empty_o = ( raddr[9:0] == waddr_sync_1[9:0] );
             waddr = {5'd0, wbin[9], int_waddr[8:0]};
             full_o  = ( waddr[9 - 2:0] == raddr_sync_1[9 - 2:0] ) && (waddr[9] != raddr_sync_1[9] ) && ( waddr[9 - 1] != raddr_sync_1[9 - 1] );
          end
        endcase
     end        

   
   always@(*)
     begin
        wbin_sync=0;
        rbin_sync=0;
        case(fifo_config_i)       
          
          CONFIG_1BIT:   begin
             for (i=15;i>=0;i=i-1)
               begin
                  if (i==15)
                    begin
                       wbin_sync[i] = waddr_sync_1[i];
                       rbin_sync[i] = raddr_sync_1[i];
                    end
                  else
                    begin
                       wbin_sync[i] = waddr_sync_1[i] ^ wbin_sync[i+1];
                       rbin_sync[i] = raddr_sync_1[i] ^ rbin_sync[i+1];
                    end
               end
          end      
          
          CONFIG_2BIT:   begin
             for (i=14;i>=0;i=i-1)
               begin
                  if (i==14)
                    begin
                       wbin_sync[i] = waddr_sync_1[i];
                       rbin_sync[i] = raddr_sync_1[i];
                    end
                  else
                    begin
                       wbin_sync[i] = waddr_sync_1[i] ^ wbin_sync[i+1];
                       rbin_sync[i] = raddr_sync_1[i] ^ rbin_sync[i+1];
                    end
               end
          end      
          
          CONFIG_5BIT:   begin
             for (i=13;i>=0;i=i-1)
               begin
                  if (i==13)
                    begin
                       wbin_sync[i] = waddr_sync_1[i];
                       rbin_sync[i] = raddr_sync_1[i];
                    end
                  else
                    begin
                       wbin_sync[i] = waddr_sync_1[i] ^ wbin_sync[i+1];
                       rbin_sync[i] = raddr_sync_1[i] ^ rbin_sync[i+1];
                    end
               end
          end
          
          CONFIG_10BIT:   begin
             for (i=12;i>=0;i=i-1)
               begin
                  if (i==12)
                    begin
                       wbin_sync[i] = waddr_sync_1[i];
                       rbin_sync[i] = raddr_sync_1[i];
                    end
                  else
                    begin
                       wbin_sync[i] = waddr_sync_1[i] ^ wbin_sync[i+1];
                       rbin_sync[i] = raddr_sync_1[i] ^ rbin_sync[i+1];
                    end
               end
          end

          CONFIG_20BIT:   begin
             for (i=11;i>=0;i=i-1)
               begin
                  if (i==11)
                    begin
                       wbin_sync[i] = waddr_sync_1[i];
                       rbin_sync[i] = raddr_sync_1[i];
                    end
                  else
                    begin
                       wbin_sync[i] = waddr_sync_1[i] ^ wbin_sync[i+1];
                       rbin_sync[i] = raddr_sync_1[i] ^ rbin_sync[i+1];
                    end
               end
          end

          CONFIG_40BIT:   begin
             for (i=10;i>=0;i=i-1)
               begin
                  if (i==10)
                    begin
                       wbin_sync[i] = waddr_sync_1[i];
                       rbin_sync[i] = raddr_sync_1[i];
                    end
                  else
                    begin
                       wbin_sync[i] = waddr_sync_1[i] ^ wbin_sync[i+1];
                       rbin_sync[i] = raddr_sync_1[i] ^ rbin_sync[i+1];
                    end
               end
          end

          CONFIG_80BIT:   begin
             for (i=9;i>=0;i=i-1)
               begin
                  if (i==9)
                    begin
                       wbin_sync[i] = waddr_sync_1[i];
                       rbin_sync[i] = raddr_sync_1[i];
                    end
                  else
                    begin
                       wbin_sync[i] = waddr_sync_1[i] ^ wbin_sync[i+1];
                       rbin_sync[i] = raddr_sync_1[i] ^ rbin_sync[i+1];
                    end
               end
          end
        endcase // case (fifo_config_i)
     end

   //////////////////almost flags

   always @(fifo_config_i or wbin or rbin_sync or wbin_sync or rbin or wbin or sram_depth_i or almost_full_offset_i)
     begin
        case(fifo_config_i)

          CONFIG_1BIT: begin
             if(wbin[15] == rbin_sync[15])
               begin
                  almost_full_o=((wbin[15-1:0] - rbin_sync[15-1:0]) >= (sram_depth_i - almost_full_offset_i));
               end
             else
               begin
                  almost_full_o=((rbin_sync[15-1:0] - wbin[15-1:0])<= (almost_full_offset_i)); 
               end    
          end

          CONFIG_2BIT: begin
             if(wbin[14] == rbin_sync[14])
               begin
                  almost_full_o=((wbin[14-1:0] - rbin_sync[14-1:0]) >= (sram_depth_i - almost_full_offset_i));
               end
             else
               begin
                  almost_full_o=((rbin_sync[14-1:0] - wbin[14-1:0])<= (almost_full_offset_i)); 
               end    
          end

          CONFIG_5BIT: begin
             if(wbin[13] == rbin_sync[13])
               begin
                  almost_full_o=((wbin[13-1:0] - rbin_sync[13-1:0]) >= (sram_depth_i - almost_full_offset_i));
               end
             else
               begin
                  almost_full_o=((rbin_sync[13-1:0] - wbin[13-1:0])<= (almost_full_offset_i)); 
               end    
          end

          CONFIG_10BIT: begin
             if(wbin[12] == rbin_sync[12])
               begin
                  almost_full_o=((wbin[12-1:0] - rbin_sync[12-1:0]) >= (sram_depth_i - almost_full_offset_i));
               end
             else
               begin
                  almost_full_o=((rbin_sync[12-1:0] - wbin[12-1:0])<= (almost_full_offset_i)); 
               end    
          end

          CONFIG_20BIT: begin
             if(wbin[11] == rbin_sync[11])
               begin
                  almost_full_o=((wbin[11-1:0] - rbin_sync[11-1:0]) >= (sram_depth_i - almost_full_offset_i));
               end
             else
               begin
                  almost_full_o=((rbin_sync[11-1:0] - wbin[11-1:0])<= (almost_full_offset_i)); 
               end      
          end

          CONFIG_40BIT: begin
             if(wbin[10] == rbin_sync[10])
               begin
                  almost_full_o=((wbin[10-1:0] - rbin_sync[10-1:0]) >= (sram_depth_i - almost_full_offset_i));
               end
             else
               begin
                  almost_full_o=((rbin_sync[10-1:0] - wbin[10-1:0])<= (almost_full_offset_i)); 
               end  
          end

          default: begin // CONFIG_80BIT
             if(wbin[9] == rbin_sync[9])
               begin
                  almost_full_o=((wbin[9-1:0] - rbin_sync[9-1:0]) >= (sram_depth_i - almost_full_offset_i));
               end
             else
               begin
                  almost_full_o=((rbin_sync[9-1:0] - wbin[9-1:0])<= (almost_full_offset_i)); 
               end  
          end
        endcase
     end

   always @(fifo_config_i or wbin_sync or rbin or sram_depth_i or almost_empty_offset_i)
     begin
        case(fifo_config_i)

          CONFIG_1BIT: begin
             if(wbin_sync[15] == rbin[15])
               begin
                  almost_empty_o=((wbin_sync[15-1:0] - rbin[15-1:0]) <= almost_empty_offset_i);
               end
             else
               begin
                  almost_empty_o=((rbin[15-1:0] - wbin_sync[15-1:0]) >= (sram_depth_i-almost_empty_offset_i));
               end  
          end

          CONFIG_2BIT: begin
             if(wbin_sync[14] == rbin[14])
               begin
                  almost_empty_o=((wbin_sync[14-1:0] - rbin[14-1:0]) <= almost_empty_offset_i);
               end
             else
               begin
                  almost_empty_o=((rbin[14-1:0] - wbin_sync[14-1:0]) >= (sram_depth_i-almost_empty_offset_i));
               end  
          end

          CONFIG_5BIT: begin
             if(wbin_sync[13] == rbin[13])
               begin
                  almost_empty_o=((wbin_sync[13-1:0] - rbin[13-1:0]) <= almost_empty_offset_i);
               end
             else
               begin
                  almost_empty_o=((rbin[13-1:0] - wbin_sync[13-1:0]) >= (sram_depth_i-almost_empty_offset_i));
               end  
          end

          CONFIG_10BIT: begin
             if(wbin_sync[12] == rbin[12])
               begin
                  almost_empty_o=((wbin_sync[12-1:0] - rbin[12-1:0]) <= almost_empty_offset_i);
               end
             else
               begin
                  almost_empty_o=((rbin[12-1:0] - wbin_sync[12-1:0]) >= (sram_depth_i-almost_empty_offset_i));
               end  
          end

          CONFIG_20BIT: begin
             if(wbin_sync[11] == rbin[11])
               begin
                  almost_empty_o=((wbin_sync[11-1:0] - rbin[11-1:0]) <= almost_empty_offset_i);
               end
             else
               begin
                  almost_empty_o=((rbin[11-1:0] - wbin_sync[11-1:0]) >= (sram_depth_i-almost_empty_offset_i));
               end  
          end

          CONFIG_40BIT: begin
             if(wbin_sync[10] == rbin[10])
               begin
                  almost_empty_o=((wbin_sync[10-1:0] - rbin[10-1:0]) <= almost_empty_offset_i);
               end
             else
               begin
                  almost_empty_o=((rbin[10-1:0] - wbin_sync[10-1:0]) >= (sram_depth_i-almost_empty_offset_i));
               end  
          end

          default: begin // CONFIG_80BIT
             if(wbin_sync[9] == rbin[9])
               begin
                  almost_empty_o=((wbin_sync[9-1:0] - rbin[9-1:0]) <= almost_empty_offset_i);
               end
             else
               begin
                  almost_empty_o=((rbin[9-1:0] - wbin_sync[9-1:0]) >= (sram_depth_i-almost_empty_offset_i));
               end  
          end
        endcase
     end

   assign write_error_o= (full_o && write_en_i);
   assign read_error_o= (empty_o && read_en_i);    
   assign we_out_o= int_write_en_i;  
   assign re_out_o   =(~empty_o && read_en_i);
   
   //address output
   always @(*)
     begin
        case(fifo_config_i)

          CONFIG_1BIT: begin // 32k  x 1 bit
             write_address_o={wbin[14:0]};
             read_address_o={rbin[14:0]};
          end

          CONFIG_2BIT: begin // 16k  x 2 bit
             write_address_o={wbin[13:0], 1'b0};
             read_address_o={rbin[13:0], 1'b0};
          end

          CONFIG_5BIT: begin // 8k  x 5 bit
             write_address_o={wbin[12:0], 2'b00};
             read_address_o={rbin[12:0], 2'b00};
          end

          CONFIG_10BIT: begin // 4k  x 10 bit
             write_address_o={wbin[11:0], 3'b000};
             read_address_o={rbin[11:0], 3'b000};
          end

          CONFIG_20BIT: begin // 2k  x 20 bit
             write_address_o={wbin[10:0], 4'b0000};
             read_address_o={rbin[10:0], 4'b0000};
          end

          CONFIG_40BIT: begin // 1K  x 40 bit 
             write_address_o={wbin[9:0], 5'b00000};
             read_address_o={rbin[9:0], 5'b00000};
          end

          default: begin // CONFIG_80BIT, 512  x 80 bit 
             write_address_o={wbin[8:0], 6'd0};
             read_address_o={rbin[8:0], 6'd0};
          end
        endcase
     end

   

endmodule // async_fifo
