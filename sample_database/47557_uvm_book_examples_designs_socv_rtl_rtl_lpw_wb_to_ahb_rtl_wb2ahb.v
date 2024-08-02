// This program was cloned from: https://github.com/yuravg/uvm_book_examples
// License: Apache License 2.0

//File name   : wb2ahb.v
//Title       : 
//Created     : 1999
//Description : Simple Wishbone to AHB bridge
//Limitations : No burst support. No error support. WB side is always
//              big endian.
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
//
//

module wb2ahb (
  // Wishbone ports from WB master
  clk_i,
  rst_i,
  cyc_i,
  stb_i,
  sel_i,
  we_i,
  addr_i,
  data_i,
  data_o,
  ack_o,

  // AHB ports to AHB slave
  hclk,
  hreset_n,
  htrans,
  hsize,
  hburst,
  hwrite,
  haddr,
  hwdata,
  hrdata,
  hready,
  hresp

);

// Parameters
parameter ADDR_WIDTH = 32, DATA_WIDTH = 32;

// Wishbone ports
input  clk_i;
input  rst_i;
input  cyc_i;
input  stb_i;
input  [3:0] sel_i;
input  we_i;
input  [ADDR_WIDTH-1:0] addr_i;
input  [DATA_WIDTH-1:0] data_i;
output [DATA_WIDTH-1:0] data_o; reg [DATA_WIDTH-1:0] data_o;
output ack_o;

// AHB ports
input  hclk;
input  hreset_n;
input  [DATA_WIDTH-1:0] hrdata;
input [1:0] hresp;
input hready;
output  [1:0] htrans;
output  [2:0] hsize;
output  [2:0] hburst;
output  hwrite;
output  [ADDR_WIDTH-1:0] haddr;
output [DATA_WIDTH-1:0] hwdata;

reg  [DATA_WIDTH-1:0] hwdata; 

// Signals
reg ahb_prev_addr_hold;
reg ahb_data_phase;
reg [1:0] trans;
reg [2:0] size;
reg [ADDR_WIDTH-1:0] addr_hold;
reg [1:0] trans_hold;
reg [2:0] size_hold;
reg write_hold;
reg [ADDR_WIDTH-1:0] wb_adr_fixed;

// Fix up the wishbone address for masters that dont do the right thing
// when reading 16-bit or 8-bit data over the 32-bit bus (e.g. opencores
// ethernet core)
always @(addr_i, sel_i) 
begin
  wb_adr_fixed[ADDR_WIDTH-1:2] = addr_i[ADDR_WIDTH-1:2];
  
`ifdef SYSTEM_BIG_ENDIAN
  case (sel_i)
    4'b0001 : wb_adr_fixed[1:0] = 2'b11;
    4'b0010 : wb_adr_fixed[1:0] = 2'b10;
    4'b0100 : wb_adr_fixed[1:0] = 2'b01;
    4'b1000 : wb_adr_fixed[1:0] = 2'b00;
    4'b0011 : wb_adr_fixed[1:0] = 2'b10;
    4'b1100 : wb_adr_fixed[1:0] = 2'b00;
    4'b1111 : wb_adr_fixed[1:0] = 2'b00;
    default : wb_adr_fixed[1:0] = addr_i[1:0];
  endcase
`else
  case (sel_i)
    4'b0001 : wb_adr_fixed[1:0] = 2'b00;
    4'b0010 : wb_adr_fixed[1:0] = 2'b01;
    4'b0100 : wb_adr_fixed[1:0] = 2'b10;
    4'b1000 : wb_adr_fixed[1:0] = 2'b11;
    4'b0011 : wb_adr_fixed[1:0] = 2'b00;
    4'b1100 : wb_adr_fixed[1:0] = 2'b10;
    4'b1111 : wb_adr_fixed[1:0] = 2'b00;
    default : wb_adr_fixed[1:0] = addr_i[1:0];
  endcase
`endif

end

always @(posedge hclk or negedge hreset_n) begin
  if (!hreset_n) 
    ahb_prev_addr_hold <= 0;
  else begin
    if (!ahb_data_phase & stb_i & cyc_i & !hready) 
      ahb_prev_addr_hold <= 1;
    else
      ahb_prev_addr_hold <= 0;
  end
end

assign haddr  = ahb_prev_addr_hold ? addr_hold : wb_adr_fixed;
assign htrans = ahb_prev_addr_hold ? trans_hold : trans;
assign hsize  = ahb_prev_addr_hold ? size_hold : size;
assign hwrite = ahb_prev_addr_hold ? write_hold : we_i;
assign ack_o = ahb_data_phase ? hready : 0;

// Only SINGLE transfers are supported
assign hburst = 3'b000; 

// Endian conversion : WB side is always big-endian, AHB side
// is either little or big endian
`ifdef AHB_BIG_ENDIAN
  // AHB big endian
  always @(data_i, hrdata) begin
    hwdata = data_i;
    data_o = hrdata;
  end
`else
  // AHB little endian
  always @(data_i, hrdata, sel_i) begin
    case (sel_i)
      4'b0001,
      4'b0010,
      4'b0100,
      4'b1000 : 
        begin // Byte access
          hwdata = { data_i[7:0], data_i[15:8], data_i[23:16], data_i[31:24] };
          data_o = { hrdata[7:0], hrdata[15:8], hrdata[23:16], hrdata[31:24] };
        end
      4'b0011,
      4'b1100 : 
        begin // 16-bit access
          hwdata = { data_i[15:0], data_i[31:16] };
          data_o = { hrdata[15:0], hrdata[31:16] };
        end
      default : 
        begin // 32-bit access
          hwdata = data_i;
          data_o = hrdata;
        end
    endcase
  end
`endif

always @(posedge hclk or negedge hreset_n) begin
  if (!hreset_n) 
    ahb_data_phase <= 0;
  else begin
    if (ahb_data_phase & hready)
      ahb_data_phase <= 0;
    else if (!ahb_data_phase & cyc_i & stb_i & hready)
      ahb_data_phase <= 1;
  end
end

always @(posedge hclk or negedge hreset_n) begin
  if (!hreset_n) begin
    addr_hold  <= 0;
    trans_hold <= 0;
    size_hold  <= 0;
    write_hold <= 0;
  end
  else begin
    if (!ahb_prev_addr_hold) begin
      addr_hold  <= wb_adr_fixed;
      trans_hold <= trans;
      size_hold  <= size;
      write_hold <= we_i;
    end
  end
end

always @(ahb_data_phase, cyc_i, stb_i) begin
  if (ahb_data_phase)
    trans <= 2'b00; // Idle transfer
  else if (cyc_i) begin
    if (stb_i)
      trans <= 2'b10; // Non-sequential transfer
    else
      trans <= 2'b01; // Busy transfer
  end
  else
    trans <= 2'b00; // Idle transfer
end

always @(sel_i) begin
  case (sel_i)
    4'b0001,
    4'b0010,
    4'b0100,
    4'b1000 : size = 3'b000; // Byte access
    4'b0011,
    4'b1100 : size = 3'b001; // 16-bit access
    4'b1111 : size = 3'b010; // 32-bit access
    default : size = 3'b010; // defaults to 32-bit access
  endcase
end

endmodule

