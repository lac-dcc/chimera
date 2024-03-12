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

module fifo_sync
                #(
                   parameter DATA_WIDTH = 8,
                   parameter ADDR_WIDTH = 5,
                   parameter FWFT = 0,
                   parameter DISTR = 0
                  )
                 (
                  input clk,
                  input rst_n,
                  input wr_en,
                  input [DATA_WIDTH-1:0] din,
                  input rd_en,
                  output [DATA_WIDTH-1:0] dout,
                  output valid,
                  output full,
                  output empty,
                  output almost_full,
                  output almost_empty,
                  output reg overflow,
                  output reg underflow,
                  output [ADDR_WIDTH-1:0] count 
                  );

 wire [ADDR_WIDTH-1:0] ram_wa;
 wire ram_wen;
 wire [ADDR_WIDTH-1:0] ram_ra;
 wire [DATA_WIDTH-1:0] ram_di;
 wire [DATA_WIDTH-1:0] ram_do;
 wire [ADDR_WIDTH-1:0] pcnt_0 = {ADDR_WIDTH{1'b0}};
 wire [ADDR_WIDTH-1:0] pcnt_1 = {{ADDR_WIDTH-1{1'b0}}, 1'b1};
 wire [ADDR_WIDTH:0] ecnt_0 = {ADDR_WIDTH+1{1'b0}};
 wire [ADDR_WIDTH:0] ecnt_1 = {{ADDR_WIDTH{1'b0}}, 1'b1};
 wire [ADDR_WIDTH:0] ecnt_max = {1'b1, {ADDR_WIDTH{1'b0}}};
 wire [ADDR_WIDTH:0] ecnt_max_1 = {1'b0, {ADDR_WIDTH{1'b1}}};
 wire [ADDR_WIDTH:0] ecnt_max_2 = {1'b0, {(ADDR_WIDTH-1){1'b1}},1'b0};
 reg [ADDR_WIDTH-1:0] wr_pnt, rd_pnt;
 reg [ADDR_WIDTH:0] valid_entry_cnt; 
 reg rd_en_sync;
 reg wr_en_dly;

 always@(posedge clk or negedge rst_n)
   if(~rst_n) 
     wr_pnt <= pcnt_0;
   else if(wr_en && ~full)
     wr_pnt <= wr_pnt + pcnt_1;

 always@(posedge clk or negedge rst_n)
   if(~rst_n) 
     wr_en_dly <= 0;
   else
     wr_en_dly <= wr_en;  // fifo cannot be read immediately after the first wr_en, data can only be valid on the port in the 2nd cycle after the first wr_en

 assign ram_wen = wr_en;
 assign ram_di = din;
 assign ram_wa = wr_pnt;
 assign dout = ram_do;

 always@(posedge clk or negedge rst_n)
   if(~rst_n) 
     rd_pnt <= pcnt_0;
   else if(rd_en && ~empty)
     rd_pnt <= rd_pnt + pcnt_1;

 assign ram_ra = (FWFT)? (rd_en? (rd_pnt+1): rd_pnt) : rd_pnt;

 always@(posedge clk or negedge rst_n)
   if(~rst_n) 
     valid_entry_cnt <= ecnt_0;
   else
     casez({wr_en_dly, rd_en, full, empty})
       4'b01?0 : valid_entry_cnt <= valid_entry_cnt - ecnt_1;  // read
       4'b100? : valid_entry_cnt <= valid_entry_cnt + ecnt_1;  // write
       4'b11?1 : valid_entry_cnt <= ecnt_1;                    // underflow
       default :;
     endcase

 always@(posedge clk or negedge rst_n)
   if(~rst_n) 
     rd_en_sync <= 1'b0;
   else 
     rd_en_sync <= rd_en;

 always@(posedge clk or negedge rst_n)
   if(~rst_n) 
     begin
       underflow <= 1'b0;
       overflow <= 1'b0;
     end
   else
     begin
       underflow <= empty && rd_en;
       overflow <= full && wr_en;
     end

 assign full = (valid_entry_cnt == ecnt_max);
 assign empty = (valid_entry_cnt == ecnt_0);
 assign almost_full = ((valid_entry_cnt == ecnt_max_1) || (valid_entry_cnt == ecnt_max_2));
 assign almost_empty = (valid_entry_cnt == ecnt_1);
 assign count = valid_entry_cnt[ADDR_WIDTH-1:0];
 assign valid = (FWFT)? ~empty : (rd_en_sync && ~underflow);

 ram_simple_dual #(DATA_WIDTH,ADDR_WIDTH,DISTR) mram_simple_dual (.clk(clk),.ena(1'b1),.enb(1'b1),.wea(ram_wen),.addra(ram_wa),.addrb(ram_ra),.dia(ram_di),.dob(ram_do));

endmodule
