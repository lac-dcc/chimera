// This program was cloned from: https://github.com/yuravg/uvm_book_examples
// License: Apache License 2.0

//File name   : ahb2apb.v
//Title       : 
//Created     : 2010
//Description : Simple AHB to APB bridge
//Notes       : 
//----------------------------------------------------------------------
//   Copyright 1999-2010 Cadence Design Systems, Inc.
//   All Rights Reserved Worldwide
//
//   Licensed under the Apache License, Version 2.0 (the
//   "License"); you may not use this file except in
//   compliance with the License.  You may obtain a copy of
//   the License at
//
//       http://www.apache.org/licenses/LICENSE-2.0
//
//   Unless required by applicable law or agreed to in
//   writing, software distributed under the License is
//   distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
//   CONDITIONS OF ANY KIND, either express or implied.  See
//   the License for the specific language governing
//   permissions and limitations under the License.
//----------------------------------------------------------------------

`timescale 1ns/1ps

`include "ahb2apb_defines.v"

module ahb2apb
(
  // AHB signals
  hclk,
  hreset_n,
  hsel,
  haddr,
  htrans,
  hwdata,
  hwrite,
  hrdata,
  hready,
  hresp,
  
  // APB signals common to all APB slaves
  pclk,
  preset_n,
  paddr,
  penable,
  pwrite,
  pwdata
  
  // Slave 0 signals
  `ifdef APB_SLAVE0
  ,psel0
  ,pready0
  ,prdata0
  `endif
  
  // Slave 1 signals
  `ifdef APB_SLAVE1
  ,psel1
  ,pready1
  ,prdata1
  `endif
  
  // Slave 2 signals
  `ifdef APB_SLAVE2
  ,psel2
  ,pready2
  ,prdata2
  `endif
  
  // Slave 3 signals
  `ifdef APB_SLAVE3
  ,psel3
  ,pready3
  ,prdata3
  `endif
  
  // Slave 4 signals
  `ifdef APB_SLAVE4
  ,psel4
  ,pready4
  ,prdata4
  `endif
  
  // Slave 5 signals
  `ifdef APB_SLAVE5
  ,psel5
  ,pready5
  ,prdata5
  `endif
  
  // Slave 6 signals
  `ifdef APB_SLAVE6
  ,psel6
  ,pready6
  ,prdata6
  `endif
  
  // Slave 7 signals
  `ifdef APB_SLAVE7
  ,psel7
  ,pready7
  ,prdata7
  `endif
  
  // Slave 8 signals
  `ifdef APB_SLAVE8
  ,psel8
  ,pready8
  ,prdata8
  `endif
  
  // Slave 9 signals
  `ifdef APB_SLAVE9
  ,psel9
  ,pready9
  ,prdata9
  `endif
  
  // Slave 10 signals
  `ifdef APB_SLAVE10
  ,psel10
  ,pready10
  ,prdata10
  `endif
  
  // Slave 11 signals
  `ifdef APB_SLAVE11
  ,psel11
  ,pready11
  ,prdata11
  `endif
  
  // Slave 12 signals
  `ifdef APB_SLAVE12
  ,psel12
  ,pready12
  ,prdata12
  `endif
  
  // Slave 13 signals
  `ifdef APB_SLAVE13
  ,psel13
  ,pready13
  ,prdata13
  `endif
  
  // Slave 14 signals
  `ifdef APB_SLAVE14
  ,psel14
  ,pready14
  ,prdata14
  `endif
  
  // Slave 15 signals
  `ifdef APB_SLAVE15
  ,psel15
  ,pready15
  ,prdata15
  `endif
  
);

parameter 
  APB_SLAVE0_START_ADDR  = 32'h00800000,
  APB_SLAVE0_END_ADDR    = 32'h0080FFFF,
  APB_SLAVE1_START_ADDR  = 32'h00810000,
  APB_SLAVE1_END_ADDR    = 32'h0081FFFF,
  APB_SLAVE2_START_ADDR  = 32'h00820000,
  APB_SLAVE2_END_ADDR    = 32'h0082FFFF,
  APB_SLAVE3_START_ADDR  = 32'h00830000,
  APB_SLAVE3_END_ADDR    = 32'h0083FFFF,
  APB_SLAVE4_START_ADDR  = 32'h00840000,
  APB_SLAVE4_END_ADDR    = 32'h0084FFFF,
  APB_SLAVE5_START_ADDR  = 32'h00850000,
  APB_SLAVE5_END_ADDR    = 32'h0085FFFF,
  APB_SLAVE6_START_ADDR  = 32'h00860000,
  APB_SLAVE6_END_ADDR    = 32'h0086FFFF,
  APB_SLAVE7_START_ADDR  = 32'h00870000,
  APB_SLAVE7_END_ADDR    = 32'h0087FFFF,
  APB_SLAVE8_START_ADDR  = 32'h00880000,
  APB_SLAVE8_END_ADDR    = 32'h0088FFFF,
  APB_SLAVE9_START_ADDR  = 32'h00890000,
  APB_SLAVE9_END_ADDR    = 32'h0089FFFF,
  APB_SLAVE10_START_ADDR  = 32'h008A0000,
  APB_SLAVE10_END_ADDR    = 32'h008AFFFF,
  APB_SLAVE11_START_ADDR  = 32'h008B0000,
  APB_SLAVE11_END_ADDR    = 32'h008BFFFF,
  APB_SLAVE12_START_ADDR  = 32'h008C0000,
  APB_SLAVE12_END_ADDR    = 32'h008CFFFF,
  APB_SLAVE13_START_ADDR  = 32'h008D0000,
  APB_SLAVE13_END_ADDR    = 32'h008DFFFF,
  APB_SLAVE14_START_ADDR  = 32'h008E0000,
  APB_SLAVE14_END_ADDR    = 32'h008EFFFF,
  APB_SLAVE15_START_ADDR  = 32'h008F0000,
  APB_SLAVE15_END_ADDR    = 32'h008FFFFF;

  // AHB signals
input        hclk;
input        hreset_n;
input        hsel;
input[31:0]  haddr;
input[1:0]   htrans;
input[31:0]  hwdata;
input        hwrite;
output[31:0] hrdata;
reg   [31:0] hrdata;
output       hready;
output[1:0]  hresp;
  
  // APB signals common to all APB slaves
output       pclk;
output       preset_n;
output[31:0] paddr;
reg   [31:0] paddr;
output       penable;
reg          penable;
output       pwrite;
reg          pwrite;
output[31:0] pwdata;
  
  // Slave 0 signals
`ifdef APB_SLAVE0
  output      psel0;
  input       pready0;
  input[31:0] prdata0;
`endif
  
  // Slave 1 signals
`ifdef APB_SLAVE1
  output      psel1;
  input       pready1;
  input[31:0] prdata1;
`endif
  
  // Slave 2 signals
`ifdef APB_SLAVE2
  output      psel2;
  input       pready2;
  input[31:0] prdata2;
`endif
  
  // Slave 3 signals
`ifdef APB_SLAVE3
  output      psel3;
  input       pready3;
  input[31:0] prdata3;
`endif
  
  // Slave 4 signals
`ifdef APB_SLAVE4
  output      psel4;
  input       pready4;
  input[31:0] prdata4;
`endif
  
  // Slave 5 signals
`ifdef APB_SLAVE5
  output      psel5;
  input       pready5;
  input[31:0] prdata5;
`endif
  
  // Slave 6 signals
`ifdef APB_SLAVE6
  output      psel6;
  input       pready6;
  input[31:0] prdata6;
`endif
  
  // Slave 7 signals
`ifdef APB_SLAVE7
  output      psel7;
  input       pready7;
  input[31:0] prdata7;
`endif
  
  // Slave 8 signals
`ifdef APB_SLAVE8
  output      psel8;
  input       pready8;
  input[31:0] prdata8;
`endif
  
  // Slave 9 signals
`ifdef APB_SLAVE9
  output      psel9;
  input       pready9;
  input[31:0] prdata9;
`endif
  
  // Slave 10 signals
`ifdef APB_SLAVE10
  output      psel10;
  input       pready10;
  input[31:0] prdata10;
`endif
  
  // Slave 11 signals
`ifdef APB_SLAVE11
  output      psel11;
  input       pready11;
  input[31:0] prdata11;
`endif
  
  // Slave 12 signals
`ifdef APB_SLAVE12
  output      psel12;
  input       pready12;
  input[31:0] prdata12;
`endif
  
  // Slave 13 signals
`ifdef APB_SLAVE13
  output      psel13;
  input       pready13;
  input[31:0] prdata13;
`endif
  
  // Slave 14 signals
`ifdef APB_SLAVE14
  output      psel14;
  input       pready14;
  input[31:0] prdata14;
`endif
  
  // Slave 15 signals
`ifdef APB_SLAVE15
  output      psel15;
  input       pready15;
  input[31:0] prdata15;
`endif
 
reg         ahb_addr_phase;
reg         ahb_data_phase;
wire        valid_ahb_trans;
wire        pready_muxed;
wire [31:0] prdata_muxed;
reg  [31:0] haddr_reg;
reg         hwrite_reg;
reg  [2:0]  apb_state;
wire [2:0]  apb_state_idle;
wire [2:0]  apb_state_setup;
wire [2:0]  apb_state_access;
reg  [15:0] slave_select;
wire [15:0] pready_vector;
reg  [15:0] psel_vector;
wire [31:0] prdata0_q;
wire [31:0] prdata1_q;
wire [31:0] prdata2_q;
wire [31:0] prdata3_q;
wire [31:0] prdata4_q;
wire [31:0] prdata5_q;
wire [31:0] prdata6_q;
wire [31:0] prdata7_q;
wire [31:0] prdata8_q;
wire [31:0] prdata9_q;
wire [31:0] prdata10_q;
wire [31:0] prdata11_q;
wire [31:0] prdata12_q;
wire [31:0] prdata13_q;
wire [31:0] prdata14_q;
wire [31:0] prdata15_q;

assign pclk     = hclk;
assign preset_n = hreset_n;
assign hready   = ahb_addr_phase;
assign pwdata   = hwdata;
assign hresp  = 2'b00;

// Respond to NONSEQ or SEQ transfers
assign valid_ahb_trans = ((htrans == 2'b10) || (htrans == 2'b11)) && (hsel == 1'b1);

always @(posedge hclk) begin
  if (hreset_n == 1'b0) begin
    ahb_addr_phase <= 1'b1;
    ahb_data_phase <= 1'b0;
    haddr_reg      <= 'b0;
    hwrite_reg     <= 1'b0;
    hrdata         <= 'b0;
  end
  else begin
    if (ahb_addr_phase == 1'b1 && valid_ahb_trans == 1'b1) begin
      ahb_addr_phase <= 1'b0;
      ahb_data_phase <= 1'b1;
      haddr_reg      <= haddr;
      hwrite_reg     <= hwrite;
    end
    if (ahb_data_phase == 1'b1 && pready_muxed == 1'b1 && apb_state == apb_state_access) begin
      ahb_addr_phase <= 1'b1;
      ahb_data_phase <= 1'b0;
      hrdata         <= prdata_muxed;
    end
  end
end

// APB state machine state definitions
assign apb_state_idle   = 3'b001;
assign apb_state_setup  = 3'b010;
assign apb_state_access = 3'b100;

// APB state machine
always @(posedge hclk or negedge hreset_n) begin
  if (hreset_n == 1'b0) begin
    apb_state   <= apb_state_idle;
    psel_vector <= 1'b0;
    penable     <= 1'b0;
    paddr       <= 1'b0;
    pwrite      <= 1'b0;
  end  
  else begin
    
    // IDLE -> SETUP
    if (apb_state == apb_state_idle) begin
      if (ahb_data_phase == 1'b1) begin
        apb_state   <= apb_state_setup;
        psel_vector <= { slave_select[15], slave_select[14], slave_select[13], slave_select[12], slave_select[11], slave_select[10],
                           slave_select[9], slave_select[8], slave_select[7], slave_select[6], slave_select[5], slave_select[4],
                           slave_select[3], slave_select[1], slave_select[1], slave_select[0] };
        paddr       <= haddr_reg;
        pwrite      <= hwrite_reg;
      end  
    end
    
    // SETUP -> TRANSFER
    if (apb_state == apb_state_setup) begin
      apb_state <= apb_state_access;
      penable   <= 1'b1;
    end
    
    // TRANSFER -> SETUP or
    // TRANSFER -> IDLE
    if (apb_state == apb_state_access) begin
      if (pready_muxed == 1'b1) begin
      
        // TRANSFER -> SETUP
        if (valid_ahb_trans == 1'b1) begin
          apb_state   <= apb_state_setup;
          penable     <= 1'b0;
          psel_vector <= { slave_select[15], slave_select[14], slave_select[13], slave_select[12], slave_select[11], slave_select[10],
                           slave_select[9], slave_select[8], slave_select[7], slave_select[6], slave_select[5], slave_select[4],
                           slave_select[3], slave_select[2], slave_select[1], slave_select[0] };
          paddr       <= haddr_reg;
          pwrite      <= hwrite_reg;
        end  
        
        // TRANSFER -> IDLE
        else begin
          apb_state   <= apb_state_idle;      
          penable     <= 1'b0;
          psel_vector <= 'b0;
        end  
      end
    end
    
  end
end

always @(posedge hclk or negedge hreset_n) begin
  if (hreset_n == 1'b0)
    slave_select <= 'b0;
  else begin  
  `ifdef APB_SLAVE0
     slave_select[0]   <= valid_ahb_trans && (haddr >= APB_SLAVE0_START_ADDR)  && (haddr <= APB_SLAVE0_END_ADDR);
   `else
     slave_select[0]   <= 1'b0;
   `endif
   
   `ifdef APB_SLAVE1
     slave_select[1]   <= valid_ahb_trans && (haddr >= APB_SLAVE1_START_ADDR)  && (haddr <= APB_SLAVE1_END_ADDR);
   `else
     slave_select[1]   <= 1'b0;
   `endif  
     
   `ifdef APB_SLAVE2  
     slave_select[2]   <= valid_ahb_trans && (haddr >= APB_SLAVE2_START_ADDR)  && (haddr <= APB_SLAVE2_END_ADDR);
   `else
     slave_select[2]   <= 1'b0;
   `endif  
     
   `ifdef APB_SLAVE3  
     slave_select[3]   <= valid_ahb_trans && (haddr >= APB_SLAVE3_START_ADDR)  && (haddr <= APB_SLAVE3_END_ADDR);
   `else
     slave_select[3]   <= 1'b0;
   `endif  
     
   `ifdef APB_SLAVE4  
     slave_select[4]   <= valid_ahb_trans && (haddr >= APB_SLAVE4_START_ADDR)  && (haddr <= APB_SLAVE4_END_ADDR);
   `else
     slave_select[4]   <= 1'b0;
   `endif  
     
   `ifdef APB_SLAVE5  
     slave_select[5]   <= valid_ahb_trans && (haddr >= APB_SLAVE5_START_ADDR)  && (haddr <= APB_SLAVE5_END_ADDR);
   `else
     slave_select[5]   <= 1'b0;
   `endif  
     
   `ifdef APB_SLAVE6  
     slave_select[6]   <= valid_ahb_trans && (haddr >= APB_SLAVE6_START_ADDR)  && (haddr <= APB_SLAVE6_END_ADDR);
   `else
     slave_select[6]   <= 1'b0;
   `endif  
     
   `ifdef APB_SLAVE7  
     slave_select[7]   <= valid_ahb_trans && (haddr >= APB_SLAVE7_START_ADDR)  && (haddr <= APB_SLAVE7_END_ADDR);
   `else
     slave_select[7]   <= 1'b0;
   `endif  
     
   `ifdef APB_SLAVE8  
     slave_select[8]   <= valid_ahb_trans && (haddr >= APB_SLAVE8_START_ADDR)  && (haddr <= APB_SLAVE8_END_ADDR);
   `else
     slave_select[8]   <= 1'b0;
   `endif  
     
   `ifdef APB_SLAVE9  
     slave_select[9]   <= valid_ahb_trans && (haddr >= APB_SLAVE9_START_ADDR)  && (haddr <= APB_SLAVE9_END_ADDR);
   `else
     slave_select[9]   <= 1'b0;
   `endif  
     
   `ifdef APB_SLAVE10  
     slave_select[10]  <= valid_ahb_trans && (haddr >= APB_SLAVE10_START_ADDR) && (haddr <= APB_SLAVE10_END_ADDR);
   `else
     slave_select[10]   <= 1'b0;
   `endif  
     
   `ifdef APB_SLAVE11  
     slave_select[11]  <= valid_ahb_trans && (haddr >= APB_SLAVE11_START_ADDR) && (haddr <= APB_SLAVE11_END_ADDR);
   `else
     slave_select[11]   <= 1'b0;
   `endif  
     
   `ifdef APB_SLAVE12  
     slave_select[12]  <= valid_ahb_trans && (haddr >= APB_SLAVE12_START_ADDR) && (haddr <= APB_SLAVE12_END_ADDR);
   `else
     slave_select[12]   <= 1'b0;
   `endif  
     
   `ifdef APB_SLAVE13  
     slave_select[13]  <= valid_ahb_trans && (haddr >= APB_SLAVE13_START_ADDR) && (haddr <= APB_SLAVE13_END_ADDR);
   `else
     slave_select[13]   <= 1'b0;
   `endif  
     
   `ifdef APB_SLAVE14  
     slave_select[14]  <= valid_ahb_trans && (haddr >= APB_SLAVE14_START_ADDR) && (haddr <= APB_SLAVE14_END_ADDR);
   `else
     slave_select[14]   <= 1'b0;
   `endif  
     
   `ifdef APB_SLAVE15  
     slave_select[15]  <= valid_ahb_trans && (haddr >= APB_SLAVE15_START_ADDR) && (haddr <= APB_SLAVE15_END_ADDR);
   `else
     slave_select[15]   <= 1'b0;
   `endif  
  end
end

assign pready_muxed = |(psel_vector & pready_vector);
assign prdata_muxed = prdata0_q  | prdata1_q  | prdata2_q  | prdata3_q  |
                      prdata4_q  | prdata5_q  | prdata6_q  | prdata7_q  |
                      prdata8_q  | prdata9_q  | prdata10_q | prdata11_q |
                      prdata12_q | prdata13_q | prdata14_q | prdata15_q ;

`ifdef APB_SLAVE0
  assign psel0            = psel_vector[0];
  assign pready_vector[0] = pready0;
  assign prdata0_q        = (psel0 == 1'b1) ? prdata0 : 'b0;
`else
  assign pready_vector[0] = 1'b0;
  assign prdata0_q        = 'b0;
`endif

`ifdef APB_SLAVE1
  assign psel1            = psel_vector[1];
  assign pready_vector[1] = pready1;
  assign prdata1_q        = (psel1 == 1'b1) ? prdata1 : 'b0;
`else
  assign pready_vector[1] = 1'b0;
  assign prdata1_q        = 'b0;
`endif

`ifdef APB_SLAVE2
  assign psel2            = psel_vector[2];
  assign pready_vector[2] = pready2;
  assign prdata2_q        = (psel2 == 1'b1) ? prdata2 : 'b0;
`else
  assign pready_vector[2] = 1'b0;
  assign prdata2_q        = 'b0;
`endif

`ifdef APB_SLAVE3
  assign psel3            = psel_vector[3];
  assign pready_vector[3] = pready3;
  assign prdata3_q        = (psel3 == 1'b1) ? prdata3 : 'b0;
`else
  assign pready_vector[3] = 1'b0;
  assign prdata3_q        = 'b0;
`endif

`ifdef APB_SLAVE4
  assign psel4            = psel_vector[4];
  assign pready_vector[4] = pready4;
  assign prdata4_q        = (psel4 == 1'b1) ? prdata4 : 'b0;
`else
  assign pready_vector[4] = 1'b0;
  assign prdata4_q        = 'b0;
`endif

`ifdef APB_SLAVE5
  assign psel5            = psel_vector[5];
  assign pready_vector[5] = pready5;
  assign prdata5_q        = (psel5 == 1'b1) ? prdata5 : 'b0;
`else
  assign pready_vector[5] = 1'b0;
  assign prdata5_q        = 'b0;
`endif

`ifdef APB_SLAVE6
  assign psel6            = psel_vector[6];
  assign pready_vector[6] = pready6;
  assign prdata6_q        = (psel6 == 1'b1) ? prdata6 : 'b0;
`else
  assign pready_vector[6] = 1'b0;
  assign prdata6_q        = 'b0;
`endif

`ifdef APB_SLAVE7
  assign psel7            = psel_vector[7];
  assign pready_vector[7] = pready7;
  assign prdata7_q        = (psel7 == 1'b1) ? prdata7 : 'b0;
`else
  assign pready_vector[7] = 1'b0;
  assign prdata7_q        = 'b0;
`endif

`ifdef APB_SLAVE8
  assign psel8            = psel_vector[8];
  assign pready_vector[8] = pready8;
  assign prdata8_q        = (psel8 == 1'b1) ? prdata8 : 'b0;
`else
  assign pready_vector[8] = 1'b0;
  assign prdata8_q        = 'b0;
`endif

`ifdef APB_SLAVE9
  assign psel9            = psel_vector[9];
  assign pready_vector[9] = pready9;
  assign prdata9_q        = (psel9 == 1'b1) ? prdata9 : 'b0;
`else
  assign pready_vector[9] = 1'b0;
  assign prdata9_q        = 'b0;
`endif

`ifdef APB_SLAVE10
  assign psel10            = psel_vector[10];
  assign pready_vector[10] = pready10;
  assign prdata10_q        = (psel10 == 1'b1) ? prdata10 : 'b0;
`else
  assign pready_vector[10] = 1'b0;
  assign prdata10_q        = 'b0;
`endif

`ifdef APB_SLAVE11
  assign psel11            = psel_vector[11];
  assign pready_vector[11] = pready11;
  assign prdata11_q        = (psel11 == 1'b1) ? prdata11 : 'b0;
`else
  assign pready_vector[11] = 1'b0;
  assign prdata11_q        = 'b0;
`endif

`ifdef APB_SLAVE12
  assign psel12            = psel_vector[12];
  assign pready_vector[12] = pready12;
  assign prdata12_q        = (psel12 == 1'b1) ? prdata12 : 'b0;
`else
  assign pready_vector[12] = 1'b0;
  assign prdata12_q        = 'b0;
`endif

`ifdef APB_SLAVE13
  assign psel13            = psel_vector[13];
  assign pready_vector[13] = pready13;
  assign prdata13_q        = (psel13 == 1'b1) ? prdata13 : 'b0;
`else
  assign pready_vector[13] = 1'b0;
  assign prdata13_q        = 'b0;
`endif

`ifdef APB_SLAVE14
  assign psel14            = psel_vector[14];
  assign pready_vector[14] = pready14;
  assign prdata14_q        = (psel14 == 1'b1) ? prdata14 : 'b0;
`else
  assign pready_vector[14] = 1'b0;
  assign prdata14_q        = 'b0;
`endif

`ifdef APB_SLAVE15
  assign psel15            = psel_vector[15];
  assign pready_vector[15] = pready15;
  assign prdata15_q        = (psel15 == 1'b1) ? prdata15 : 'b0;
`else
  assign pready_vector[15] = 1'b0;
  assign prdata15_q        = 'b0;
`endif



// Add the one hot psel assertion here, 
// note that pselx signals are derived from psel_vector signal, 
// so use psel_vector to write this assertion
// No more than 1 psel output signal should ever be asserted at the same time


endmodule
