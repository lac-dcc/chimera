`timescale 1 ps / 1 ps

`default_nettype none

module mirror_wb_slave #
  (
   parameter ADDR_WIDTH = 4,
   parameter DATA_WIDTH = 32
   )
  (
   input  wire                          clk_i,
   input  wire                          rstn_i,

   // host bus
   input  wire                          wren_i,
   input  wire                          rden_i,
   input  wire [ADDR_WIDTH-1:0]         addr_i,
   input  wire [DATA_WIDTH-1:0]         data_i,
   output reg  [DATA_WIDTH-1:0]         data_o,
   output reg                           ack_o,

   // wishbone slave
   output wire                          wb_cyc_i,
   input  wire                          wb_stb_i,
   input  wire                          wb_we_i,
   input  wire [DATA_WIDTH-1:0]         wb_adr_i,
   input  wire [DATA_WIDTH-1:0]         wb_dat_i,
   input  wire [DATA_WIDTH/8-1:0]       wb_sel_i,
   output reg  [DATA_WIDTH-1:0]         wb_dat_o,
   output reg                           wb_ack_o,
   output reg                           wb_err_o
   );
   
  always @(posedge clk_i) begin
      ack_o <= rden_i || wren_i;
  end

  always @(posedge clk_i) begin
    if (!rstn_i || !rden_i) begin
       // the output has to be zero if there is no actual read access
      data_o <= {DATA_WIDTH{1'b0}};
    end else begin
      case (addr_i)
        0: begin
          data_o[0]     <= wb_cyc_i;
          data_o[1]     <= wb_stb_i;
          data_o[2]     <= wb_we_i;
          data_o[3]     <= wb_ack_o;
          data_o[4]     <= wb_err_o;
          data_o[15:5]  <= 0;
          data_o[31:16] <= wb_sel_i;
        end
        1: data_o <= wb_adr_i;
        2: data_o <= wb_dat_i;
        3: data_o <= wb_dat_o;
        default: data_o <= {DATA_WIDTH{1'b1}};
      endcase // case (addr)
    end
  end

  always @(posedge clk_i) begin
    wb_ack_o <= 0;
    wb_err_o <= 0;

    if (!rstn_i) begin
      wb_dat_o <= {DATA_WIDTH{1'b1}};
    end else begin
      if (wren_i) begin
        case (addr_i)
          0: begin
            wb_ack_o <= data_i[3];
            wb_err_o <= data_i[4];
          end
          3: wb_dat_o <= data_i;
        endcase
      end
    end
  end

endmodule // mirror_wb_slave

`default_nettype wire
