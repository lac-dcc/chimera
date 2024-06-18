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

module fifo_async
                 #(
                   parameter DATA_WIDTH = 8,
                   parameter ADDR_WIDTH = 5,
                   parameter DISTR = 0
                  )
                 (
                  input wr_clk,
                  input wr_rst,
                  input wr_en,
                  input [DATA_WIDTH-1:0] din,
                  input rd_clk,
                  input rd_rst,
                  input rd_en,
                  output [DATA_WIDTH-1:0] dout,
                  output valid,
                  output reg [ADDR_WIDTH-1:0] rd_data_count,
                  output reg [ADDR_WIDTH-1:0] wr_data_count,
                  output reg full,
                  output reg empty,
                  output reg overflow,
                  output reg underflow,
                  output reg almost_full,
                  output reg almost_empty
                  );
 
 wire [ADDR_WIDTH:0] wr_pnt_nxt;
 reg [ADDR_WIDTH:0] wr_pnt;
 wire [ADDR_WIDTH:0] wr_gray_nxt;
 reg [ADDR_WIDTH:0] wr_gray;
 reg [ADDR_WIDTH:0] r2w_gray_sync1, r2w_gray_sync2;
 wire [ADDR_WIDTH:0] r2w_bin;
 wire [ADDR_WIDTH:0] rd_pnt_nxt;
 reg [ADDR_WIDTH:0] rd_pnt;
 wire [ADDR_WIDTH:0] rd_gray_nxt;
 reg [ADDR_WIDTH:0] rd_gray;
 reg [ADDR_WIDTH:0] w2r_gray_sync1, w2r_gray_sync2;
 wire [ADDR_WIDTH:0] w2r_bin;
 wire ram_clka;
 wire ram_clkb;
 wire ram_ena;
 wire ram_enb;
 wire ram_wea;
 wire ram_web;
 wire [ADDR_WIDTH-1:0] ram_addra;
 wire [ADDR_WIDTH-1:0] ram_addrb;
 wire [DATA_WIDTH-1:0] ram_dia;
 wire [DATA_WIDTH-1:0] ram_dib;
 wire [DATA_WIDTH-1:0] ram_doa;
 wire [DATA_WIDTH-1:0] ram_dob;
 wire [DATA_WIDTH-1:0] dcnt_0 = {DATA_WIDTH{1'b0}};
 wire [ADDR_WIDTH:0] pcnt_0 = {ADDR_WIDTH+1{1'b0}};
 wire [ADDR_WIDTH:0] pcnt_1 = {{ADDR_WIDTH{1'b0}}, 1'b1};
 wire [ADDR_WIDTH:0] pcnt_2 = {{ADDR_WIDTH-2{1'b0}}, 2'b10};
 wire [ADDR_WIDTH-1:0] pcnt_max_2 = {{ADDR_WIDTH-1{1'b1}}, 1'b0};
 reg rd_en_sync;
 wire wr_rst_n = ~wr_rst;
 wire rd_rst_n = ~rd_rst;
 
 parameter DEPTH = 2**ADDR_WIDTH;

 assign wr_pnt_nxt = wr_pnt + pcnt_1;

 always@(posedge wr_clk or negedge wr_rst_n)
   if(~wr_rst_n) 
     wr_pnt <= pcnt_0;
   else if(wr_en && ~full)
     wr_pnt <= wr_pnt_nxt;

 assign wr_gray_nxt = (wr_pnt_nxt>>1) ^ wr_pnt_nxt;

 always@(posedge wr_clk or negedge wr_rst_n)
   if(~wr_rst_n) 
     wr_gray <= pcnt_0;
   else if(wr_en && ~full)
     wr_gray <= wr_gray_nxt;

 always@(posedge wr_clk or negedge wr_rst_n)
   if(~wr_rst_n) 
     {r2w_gray_sync2, r2w_gray_sync1} <= {pcnt_0, pcnt_0};
   else
     {r2w_gray_sync2, r2w_gray_sync1} <= {r2w_gray_sync1, rd_gray};

 always@(posedge wr_clk or negedge wr_rst_n)
   if(~wr_rst_n) 
     full <= 1'b0;
   else if((wr_gray_nxt == {~r2w_gray_sync2[ADDR_WIDTH:ADDR_WIDTH-1], r2w_gray_sync2[ADDR_WIDTH-2:0]}) && wr_en)
     full <= 1'b1;
   else if(wr_gray != {~r2w_gray_sync2[ADDR_WIDTH:ADDR_WIDTH-1], r2w_gray_sync2[ADDR_WIDTH-2:0]})
     full <= 1'b0;

 genvar i;
 generate 
   for(i = ADDR_WIDTH; i >= 0; i = i-1)
     begin
       if(i == ADDR_WIDTH)
         assign r2w_bin[i] = r2w_gray_sync2[i];
       else
         assign r2w_bin[i] = r2w_bin[i+1] ^ r2w_gray_sync2[i];
     end
 endgenerate

 always@(posedge wr_clk or negedge wr_rst_n)
   if(~wr_rst_n) 
     almost_full <= 1'b0;
   else if((((r2w_bin[ADDR_WIDTH] != wr_pnt_nxt[ADDR_WIDTH]) && (r2w_bin[ADDR_WIDTH-1:0] - wr_pnt_nxt[ADDR_WIDTH-1:0] <= pcnt_2))  || 
            ((r2w_bin[ADDR_WIDTH] == wr_pnt_nxt[ADDR_WIDTH]) && (wr_pnt_nxt[ADDR_WIDTH-1:0] - r2w_bin[ADDR_WIDTH-1:0] >= pcnt_max_2))))
     almost_full <= 1'b1;
   else if(((r2w_bin[ADDR_WIDTH] != wr_pnt_nxt[ADDR_WIDTH]) && (r2w_bin[ADDR_WIDTH-1:0] - wr_pnt_nxt[ADDR_WIDTH-1:0] > pcnt_2))  || 
           ((r2w_bin[ADDR_WIDTH] == wr_pnt_nxt[ADDR_WIDTH]) && (wr_pnt_nxt[ADDR_WIDTH-1:0] - r2w_bin[ADDR_WIDTH-1:0] < pcnt_max_2)))
     almost_full <= 1'b0;

 always@(posedge wr_clk or negedge wr_rst_n)
   if(~wr_rst_n) 
     wr_data_count <= pcnt_0[ADDR_WIDTH-1:0];
   else 
     wr_data_count <= (r2w_bin[ADDR_WIDTH] == wr_pnt[ADDR_WIDTH])? (wr_pnt[ADDR_WIDTH-1:0] - r2w_bin[ADDR_WIDTH-1:0]) : 
                                                                   (DEPTH - (r2w_bin[ADDR_WIDTH-1:0] - wr_pnt[ADDR_WIDTH-1:0]));

 always@(posedge wr_clk or negedge wr_rst_n)
   if(~wr_rst_n) 
     overflow <= 1'b0;
   else
     overflow <= full && wr_en;


 assign rd_pnt_nxt = rd_pnt + pcnt_1;

 always@(posedge rd_clk or negedge rd_rst_n)
   if(~rd_rst_n) 
     rd_pnt <= pcnt_0;
   else if(rd_en && ~empty)
     rd_pnt <= rd_pnt_nxt;

 assign rd_gray_nxt = (rd_pnt_nxt>>1) ^ rd_pnt_nxt;

 always@(posedge rd_clk or negedge rd_rst_n)
   if(~rd_rst_n) 
     rd_gray <= pcnt_0;
   else if(rd_en && ~empty)
     rd_gray <= rd_gray_nxt;

 always@(posedge rd_clk or negedge rd_rst_n)
   if(~rd_rst_n) 
     {w2r_gray_sync2, w2r_gray_sync1} <= {pcnt_0, pcnt_0};
   else
     {w2r_gray_sync2, w2r_gray_sync1} <= {w2r_gray_sync1, wr_gray};

 always@(posedge rd_clk or negedge rd_rst_n)
   if(~rd_rst_n) 
     empty <= 1'b1;
   else if((rd_gray_nxt == w2r_gray_sync2) && rd_en)
     empty <= 1'b1;
   else if(rd_gray != w2r_gray_sync2)
     empty <= 1'b0;
     

 genvar j;
 generate 
   for(j = ADDR_WIDTH; j >= 0; j = j-1)
     begin
       if(j == ADDR_WIDTH)
         assign w2r_bin[j] = w2r_gray_sync2[j];
       else
         assign w2r_bin[j] = w2r_bin[j+1] ^ w2r_gray_sync2[j];
     end
 endgenerate

 always@(posedge rd_clk or negedge rd_rst_n)
   if(~rd_rst_n) 
     almost_empty <= 1'b1;
   else if((((w2r_bin[ADDR_WIDTH] == rd_pnt_nxt[ADDR_WIDTH]) && (w2r_bin[ADDR_WIDTH-1:0] - rd_pnt_nxt[ADDR_WIDTH-1:0] <= pcnt_2)) ||
            ((w2r_bin[ADDR_WIDTH] != rd_pnt_nxt[ADDR_WIDTH]) && (rd_pnt_nxt[ADDR_WIDTH-1:0] - w2r_bin[ADDR_WIDTH-1:0] >= pcnt_max_2))))
     almost_empty <= 1'b1;
   else if (((w2r_bin[ADDR_WIDTH] == rd_pnt_nxt[ADDR_WIDTH]) && (w2r_bin[ADDR_WIDTH-1:0] - rd_pnt_nxt[ADDR_WIDTH-1:0] > pcnt_2)) ||
            ((w2r_bin[ADDR_WIDTH] != rd_pnt_nxt[ADDR_WIDTH]) && (rd_pnt_nxt[ADDR_WIDTH-1:0] - w2r_bin[ADDR_WIDTH-1:0] < pcnt_max_2)))
     almost_empty <= 1'b0;

 always@(posedge rd_clk or negedge rd_rst_n)
   if(~rd_rst_n) 
     rd_data_count <= pcnt_0[ADDR_WIDTH-1:0];
   else 
     rd_data_count <= (w2r_bin[ADDR_WIDTH] == rd_pnt[ADDR_WIDTH])? (w2r_bin[ADDR_WIDTH-1:0] - rd_pnt[ADDR_WIDTH-1:0]) : 
                                                                   (DEPTH - (rd_pnt[ADDR_WIDTH-1:0] - w2r_bin[ADDR_WIDTH-1:0]));

 always@(posedge rd_clk or negedge rd_rst_n)
   if(~rd_rst_n) 
     rd_en_sync <= 1'b0;
   else 
     rd_en_sync <= rd_en;

 always@(posedge rd_clk or negedge rd_rst_n)
   if(~rd_rst_n) 
     underflow <= 1'b0;
   else
     underflow <= empty && rd_en;


 assign ram_clka = wr_clk;
 assign ram_clkb = rd_clk;
 assign ram_ena = 1'b1;
 assign ram_enb = 1'b1;
 assign ram_wea = wr_en;
 assign ram_web = 1'b0;
 assign ram_addra = wr_pnt[ADDR_WIDTH-1:0];
 assign ram_addrb = rd_pnt[ADDR_WIDTH-1:0];
 assign ram_dia = din;
 assign ram_dib = dcnt_0;
 assign dout = ram_dob;
 assign valid = rd_en_sync && ~underflow;


 ram_true_dual #(DATA_WIDTH,ADDR_WIDTH,DISTR) mram_true_dual (.clka(ram_clka),.clkb(ram_clkb),.ena(ram_ena),.enb(ram_enb),.wea(ram_wea),.web(ram_web),.addra(ram_addra),.addrb(ram_addrb),.dia(ram_dia),.dib(ram_dib),.doa(ram_doa),.dob(ram_dob));


endmodule
