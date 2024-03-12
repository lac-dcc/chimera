`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Design Name: 
// Module Name: sif_fifo
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module sif_fifo
# (
  parameter w = 16,
  parameter d = 1024
)
(
  input           clk,
  input           rst_n,
  input           up_vld,
  input   [w-1:0] up_dat,
  output          up_rdy,
  output          dn_vld,
  output  [w-1:0] dn_dat,
  input           dn_rdy
); // sif_fifo
localparam half_fp_bits = 16;
localparam num_fifo = w/half_fp_bits;
genvar i;

wire full;
wire empty;
wire rd_en;

reg  vld_reg;

wire srst;

wire                      fulls[num_fifo-1:0];
wire                      emptys[num_fifo-1:0];
wire   [half_fp_bits-1:0] up_dats[num_fifo-1:0];
wire                      dn_vlds[num_fifo-1:0];
wire  [half_fp_bits-1:0]  dn_dats[num_fifo-1:0];
wire                      dn_rdys[num_fifo-1:0];


assign srst = 1'b0;

// get output
generate
  if((w == 16) & (d == 1024))          // no overflow, add 0 prefix
  begin
    naive_fifo_16b_1024 u_fifo (
      .clk(clk),                  // input wire clk
      .rst(!rst_n),                // input wire srst
      .din(up_dat),                  // input wire [7 : 0] din
      .wr_en(up_vld),              // input wire wr_en
      .rd_en(rd_en),              // input wire rd_en
      .dout(dn_dat),                // output wire [7 : 0] dout
      .full(full),                // output wire full
      .almost_full(),
      .empty(empty),              // output wire empty
      .wr_rst_busy(),  // output wire wr_rst_busy
      .rd_rst_busy()  // output wire rd_rst_busy
    );
  end
  else if((w > 16) & (d == 1024)) begin
    for(i=0 ; i<num_fifo ; i=i+1)
    begin : ASSIGN_MULTIPLE_FIFO
      assign up_dats[i] = up_dat[(half_fp_bits*i + half_fp_bits-1) : (half_fp_bits*i)];
      naive_fifo_16b_1024 u_fifo (
        .clk(clk),                  // input wire clk
        .rst(!rst_n),                // input wire srst
        .din(up_dats[i]),                  // input wire [7 : 0] din
        .wr_en(up_vld),              // input wire wr_en
        .rd_en(rd_en),              // input wire rd_en
        .dout(dn_dats[i]),                // output wire [7 : 0] dout
        .full(),                // output wire full
        .almost_full(fulls[i]),
        .empty(emptys[i]),              // output wire empty
        .wr_rst_busy(),  // output wire wr_rst_busy
        .rd_rst_busy()  // output wire rd_rst_busy
      );
      assign dn_dat[(half_fp_bits*i + half_fp_bits-1) : (half_fp_bits*i)] = dn_dats[i];
    end
    assign empty = emptys[0];
    assign full = fulls[0];
  end
  else begin
    illegal_parameter_condition_triggered_will_instantiate_an non_existing_module();
  end
endgenerate 

// up stream control
assign up_rdy = ~full;

// dn stream control
assign rd_en = dn_rdy | ~vld_reg;

always @ (posedge clk or negedge rst_n)
  if (!rst_n)
    vld_reg <= 1'b0;
  else
    vld_reg <= (rd_en & ~(vld_reg ^ empty)) ? ~vld_reg : vld_reg;

assign dn_vld = vld_reg;

endmodule // sif_fifo
