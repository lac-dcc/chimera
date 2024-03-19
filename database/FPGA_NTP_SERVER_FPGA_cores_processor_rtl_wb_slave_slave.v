`timescale 1 ps / 1 ps

`default_nettype none

module wb_slave_slave #
  (
   parameter DATA_BUS_WIDTH = 32,
   parameter ADDR_BUS_WIDTH = 32,
   parameter ADDR_WIDTH = 4,
   parameter ADDR_LSB = $clog2(DATA_BUS_WIDTH/8),
   parameter OTHER_ADDR_BUS_WIDTH = 32,
   parameter OTHER_DATA_BUS_WIDTH = 32
   )
  (
   input  wire  				clk,
   input  wire  				rst,

   // host bus
   output wire					wb_cyc,
   input  wire					wb_stb,
   input  wire					wb_we,
   input  wire [DATA_BUS_WIDTH/8-1:0]		wb_sel,
   input  wire [ADDR_BUS_WIDTH-1:0]		wb_addr,
   input  wire [DATA_BUS_WIDTH-1:0]		wb_data_i,
   output reg					wb_ack,
   output reg  [DATA_BUS_WIDTH-1:0]		wb_data_o,
   output reg					wb_err,

   // other bus
   output wire					other_wb_cyc,
   input  wire					other_wb_stb,
   input  wire					other_wb_we,
   input  wire [DATA_BUS_WIDTH/8-1:0]		other_wb_sel,
   input  wire [OTHER_ADDR_BUS_WIDTH-1:0]	other_wb_addr,
   input  wire [OTHER_DATA_BUS_WIDTH-1:0]	other_wb_data_i,
   output reg					other_wb_ack,
   output reg  [OTHER_DATA_BUS_WIDTH-1:0]	other_wb_data_o,
   output reg					other_wb_err
   );
   
  always @(posedge clk) begin
    wb_ack <= !rst && wb_stb;
    wb_err <= 1'b0;
  end

  always @(posedge clk) begin
      case (wb_addr[ADDR_WIDTH+ADDR_LSB-1:ADDR_LSB])
        0: begin
          wb_data_o[0] <= other_wb_cyc;
          wb_data_o[1] <= other_wb_stb;
          wb_data_o[2] <= other_wb_we;;
          wb_data_o[3] <= other_wb_ack;
          wb_data_o[4] <= other_wb_err;
          wb_data_o[15:5] <= 0;
          wb_data_o[31:16] <= other_wb_sel;
        end
        1: wb_data_o <= other_wb_addr;
        2: wb_data_o <= other_wb_data_i;
        3: wb_data_o <= other_wb_data_o;
        default: wb_data_o <= {DATA_BUS_WIDTH{1'b1}};
      endcase
  end

  always @(posedge clk) begin
    other_wb_ack <= 0;
    other_wb_err <= 0;

    if (rst) begin
      other_wb_data_o <= 32'hffffffff;
    end else if (wb_stb && wb_we) begin
      case (wb_addr[ADDR_WIDTH+ADDR_LSB-1:ADDR_LSB])
        0: begin
          other_wb_ack <= wb_data_o[1];
          other_wb_err <= wb_data_o[0];
        end
        3: other_wb_data_o <= wb_data_i;
      endcase
    end
  end

endmodule // wb_slave_slave

`default_nettype wire
