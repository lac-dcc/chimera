// This program was cloned from: https://github.com/OpenCAPI/oc-accel
// License: Apache License 2.0

/*
 * Copyright 2019 International Business Machines
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
`timescale 1ns/1ps

`include "snap_global_vars.v"

module brdg_context_surveil 
                #(
                   parameter DISTR = 0
                  )
( 
                             input                      clk                   ,
                             input                      rst_n                 ,

                             //---- configuration --------------------------------------
                             input      [011:0]         cfg_actag_base        ,
                             input      [019:0]         cfg_pasid_base        ,
                             input      [019:0]         cfg_pasid_mask        ,

                             output                     tlx_cmd_s1_ready     ,
                             output                     tlx_wdata_rdrq       ,

                             input                      tlx_i_cmd_valid      ,
                             input      [007:0]         tlx_i_cmd_opcode     ,
                             input      [015:0]         tlx_i_cmd_afutag     ,
                             input      [067:0]         tlx_i_cmd_ea_or_obj  ,
                             input      [001:0]         tlx_i_cmd_dl         ,
                             input      [002:0]         tlx_i_cmd_pl         ,
                             input      [011:0]         tlx_i_cmd_actag      ,
                             input      [019:0]         tlx_i_cmd_pasid      ,

                             output                     tlx_o_cmd_valid      , 
                             output     [007:0]         tlx_o_cmd_opcode     ,
                             output     [015:0]         tlx_o_cmd_afutag     ,
                             output     [067:0]         tlx_o_cmd_ea_or_obj  ,
                             output     [001:0]         tlx_o_cmd_dl         ,
                             output     [002:0]         tlx_o_cmd_pl         ,
                             output     [011:0]         tlx_o_cmd_actag      ,
                             output     [019:0]         tlx_o_cmd_pasid      ,

                             input                      tlx_afu_cmd_ready    
                             );

 localparam [7:0] AFU_TLX_CMD_OPCODE_ASSIGN_ACTAG  = 8'b0101_0000;  // Assign acTag
 localparam [7:0] AFU_TLX_CMD_OPCODE_DMA_W         = 8'b0010_0000;  // DMA Write
 localparam [7:0] AFU_TLX_CMD_OPCODE_DMA_PR_W      = 8'b0011_0000;  // DMA Partial Write

 reg                 s1_cmd_valid         ;    
 reg [007:0]         s1_cmd_opcode        ;     
 reg [011:0]         s1_cmd_actag         ;    
 reg [067:0]         s1_cmd_ea_or_obj     ;        
 reg [015:0]         s1_cmd_afutag        ;     
 reg [001:0]         s1_cmd_dl            ; 
 reg [002:0]         s1_cmd_pl            ; 
 reg [019:0]         s1_cmd_pasid         ;    
 wire                s1_ready             ;

 reg                 s2_cmd_valid         ;    
 reg [007:0]         s2_cmd_opcode        ;     
 reg [011:0]         s2_cmd_actag         ;    
 reg [067:0]         s2_cmd_ea_or_obj     ;        
 reg [015:0]         s2_cmd_afutag        ;     
 reg [001:0]         s2_cmd_dl            ; 
 reg [002:0]         s2_cmd_pl            ; 
 reg [019:0]         s2_cmd_pasid         ;    
 wire                s2_ready             ;

 wire                ram_wr_en            ;
 wire [005:0]        ram_wr_addr          ;
 wire [005:0]        ram_rd_addr          ;
 wire [`CTXW-6:0]    ram_data_i           ;
 wire [`CTXW-6:0]    ram_data_o           ;
 wire                entry_valid          ;
 wire [`CTXW-7:0]    pasid_stored_in_entry;
 wire                send_assign_actag    ;
 reg                 send_assign_actag_dly;
 reg  [019:0]        cmd_pasid_aligned    ;
 reg  [011:0]        cmd_actag            ;

 parameter DEPTH = 2**6                   ;  // ADDR_WIDTH used here is 6
 reg [DEPTH-1:0]     bit0                 ;

//-----------------------------------------------------------------------------------------------------------
// stage 0: read pasid<->actag mapping ram, use input pasid[5:0](actag) as address
//-----------------------------------------------------------------------------------------------------------
 assign tlx_cmd_s1_ready = s1_ready;

 // pasid<->actag mapping ram.
 // as actag should be less than 64 but pasid should be less than 512, use this ram to mapping the 6bit actag with 9bit pasid
 // the mapping is handled in this way: actag is equal to pasid[5:0] and is used as rd/wr addr for this ram while pasid[8:6] is
 // store in this ram. 
 // in each entry of this ram, there is an extra valid bit to indicate whether actag<->pasid mapping relationship has been setup
 // in this entry
 ram_simple_dual #(`CTXW-5,6,DISTR) mram_simple_dual (
     .clk   (clk        ),
     .ena   (1'b1       ),
     .enb   (1'b1       ),
     .wea   (ram_wr_en  ),
     .addra (ram_wr_addr),
     .addrb (ram_rd_addr),
     .dia   (ram_data_i ),
     .dob   (ram_data_o ));

 assign ram_rd_addr = tlx_i_cmd_actag[5:0]; 

 // manage separately bit 0 to be able to reset it
 always @(posedge clk) begin
    if (~rst_n)
      bit0 <= 0;
    else begin
      if (ram_wr_en) begin
         if (ram_data_i[0:0])
            bit0 <= bit0 | (1'b1 << ram_wr_addr);  //set 1 to the ram_wr_addr position
         else
            bit0 <= bit0 & ~(1'b1 << ram_wr_addr); //set 0 to the ram_wr_addr position
      end
      else
         bit0 <= bit0;
    end
 end

//-----------------------------------------------------------------------------------------------------------
// stage 1: check if pasid<->actag mapping ram need to be updated. if need update, update this ram and 
// send assign_actag cmd to stage 2 at the same time, else pass tlx_cmd in stage 1 to stage 2 directly
//-----------------------------------------------------------------------------------------------------------
 assign s1_ready = (s2_ready && (!send_assign_actag));

 always@(posedge clk or negedge rst_n)
 begin
     if(~rst_n)
         s1_cmd_valid <= 1'b0;
     else if(tlx_i_cmd_valid && s1_ready)
         s1_cmd_valid <= 1'b1;
     else if(s2_ready && (!send_assign_actag))
         s1_cmd_valid <= 1'b0;
 end

 always@(posedge clk or negedge rst_n)
 begin
     if(~rst_n)
     begin
         s1_cmd_opcode    <= 0;     
         s1_cmd_actag     <= 0;    
         s1_cmd_ea_or_obj <= 0;        
         s1_cmd_afutag    <= 0;     
         s1_cmd_dl        <= 0; 
         s1_cmd_pl        <= 0; 
         s1_cmd_pasid     <= 0;    
     end
     else if(s1_ready && tlx_i_cmd_valid)
     begin
         s1_cmd_opcode    <= tlx_i_cmd_opcode   ;     
         s1_cmd_actag     <= tlx_i_cmd_actag    ;    
         s1_cmd_ea_or_obj <= tlx_i_cmd_ea_or_obj;        
         s1_cmd_afutag    <= tlx_i_cmd_afutag   ;     
         s1_cmd_dl        <= tlx_i_cmd_dl       ; 
         s1_cmd_pl        <= tlx_i_cmd_pl       ; 
         s1_cmd_pasid     <= tlx_i_cmd_pasid    ;    
     end
 end

 assign entry_valid = bit0[ram_rd_addr]; //ram_data_o[0];
 assign pasid_stored_in_entry = ram_data_o[`CTXW-6:1]; 
 assign send_assign_actag = s1_cmd_valid && s2_ready && !(send_assign_actag_dly) && (!entry_valid || (pasid_stored_in_entry != s1_cmd_pasid[`CTXW-1:6]));
 assign ram_wr_en = send_assign_actag;
 assign ram_wr_addr = s1_cmd_actag[5:0];
 assign ram_data_i = {s1_cmd_pasid[`CTXW-1:6], 1'b1};

 always@(posedge clk or negedge rst_n)
 begin
     if(~rst_n)
         send_assign_actag_dly <= 1'b0;
     else 
         send_assign_actag_dly <= send_assign_actag;
 end

//-----------------------------------------------------------------------------------------------------------
// stage 2: send command to afu_tlx interface
//-----------------------------------------------------------------------------------------------------------
 assign s2_ready = tlx_afu_cmd_ready; 

 always@(posedge clk or negedge rst_n)
 begin
     if(~rst_n)
         s2_cmd_valid <= 1'b0;
     else
         s2_cmd_valid <= s1_cmd_valid && s2_ready;
 end

 always@(posedge clk or negedge rst_n)
 begin
     if(~rst_n)
         s2_cmd_opcode <= 0;
     else if(s1_cmd_valid && s2_ready)
         s2_cmd_opcode <= send_assign_actag ? AFU_TLX_CMD_OPCODE_ASSIGN_ACTAG : s1_cmd_opcode;
 end

 always@(posedge clk or negedge rst_n)
   if(~rst_n)
   begin
       s2_cmd_actag     <= 0;    
       s2_cmd_ea_or_obj <= 0;        
       s2_cmd_afutag    <= 0;     
       s2_cmd_dl        <= 0; 
       s2_cmd_pl        <= 0; 
       s2_cmd_pasid     <= 0;
   end
   else if(s1_cmd_valid && s2_ready)
   begin
       s2_cmd_actag     <= s1_cmd_actag    ;    
       s2_cmd_ea_or_obj <= s1_cmd_ea_or_obj;        
       s2_cmd_afutag    <= s1_cmd_afutag   ;     
       s2_cmd_dl        <= s1_cmd_dl       ; 
       s2_cmd_pl        <= s1_cmd_pl       ; 
       s2_cmd_pasid     <= s1_cmd_pasid    ;
   end

//----ouptut signals----
 assign tlx_wdata_rdrq      = s1_cmd_valid && s2_ready && (!send_assign_actag) && ((s1_cmd_opcode == AFU_TLX_CMD_OPCODE_DMA_W) || (s1_cmd_opcode == AFU_TLX_CMD_OPCODE_DMA_PR_W)); 
 assign tlx_o_cmd_valid     = s2_cmd_valid    ;
 assign tlx_o_cmd_opcode    = s2_cmd_opcode   ;
 assign tlx_o_cmd_afutag    = s2_cmd_afutag   ;
 assign tlx_o_cmd_ea_or_obj = s2_cmd_ea_or_obj;
 assign tlx_o_cmd_dl        = s2_cmd_dl       ;
 assign tlx_o_cmd_pl        = s2_cmd_pl       ;
 assign tlx_o_cmd_actag     = {6'b0,s2_cmd_actag[5:0]};
 assign tlx_o_cmd_pasid     = s2_cmd_pasid    ;

endmodule
