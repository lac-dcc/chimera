module sdram_top_apb (
  input         clock,
  input         reset,
  input  [31:0] in_paddr,
  input         in_psel,
  input         in_penable,
  input  [2:0]  in_pprot,
  input         in_pwrite,
  input  [31:0] in_pwdata,
  input  [3:0]  in_pstrb,
  output        in_pready,
  output [31:0] in_prdata,
  output        in_pslverr,

  output        sdram_clk,
  output        sdram_cke,
  output        sdram_cs,
  output        sdram_ras,
  output        sdram_cas,
  output        sdram_we,
  output [12:0] sdram_a,
  output [ 1:0] sdram_ba,
  output [ 1:0] sdram_dqm,
  inout  [15:0] sdram_dq
);

  wire sdram_dout_en;
  wire [15:0] sdram_dout;
  assign sdram_dq = sdram_dout_en ? sdram_dout : 16'bz;

  typedef enum [1:0] { ST_IDLE, ST_WAIT_ACCEPT, ST_WAIT_ACK } state_t;
  reg [1:0] state;
  wire req_accept;

  always @(posedge clock) begin
    if (reset) state <= ST_IDLE;
    else
      case (state)
        ST_IDLE: state <= (is_read || is_write ? (req_accept ? ST_WAIT_ACK : ST_WAIT_ACCEPT) : ST_IDLE);
        ST_WAIT_ACCEPT: state <= req_accept ? ST_WAIT_ACK : ST_WAIT_ACCEPT;
        ST_WAIT_ACK: if (in_pready) state <= ST_IDLE;
        default: state <= state;
      endcase
  end

  wire is_read  = ((in_psel && !in_penable) || (state == ST_WAIT_ACCEPT)) && !in_pwrite;
  wire is_write = ((in_psel && !in_penable) || (state == ST_WAIT_ACCEPT)) &&  in_pwrite;
  sdram_axi_core #(
    .SDRAM_MHZ(100),
    .SDRAM_ADDR_W(24),
    .SDRAM_COL_W(9),
    .SDRAM_READ_LATENCY(2)
  ) u_sdram_ctrl(
    .clk_i(clock),
    .rst_i(reset),
    .inport_wr_i(is_write ? in_pstrb : 4'b0),
    .inport_rd_i(is_read),
    .inport_len_i(0),
    .inport_addr_i(in_paddr),
    .inport_write_data_i(in_pwdata),
    .inport_accept_o(req_accept),
    .inport_ack_o(in_pready),
    .inport_error_o(in_pslverr),
    .inport_read_data_o(in_prdata),

    .sdram_clk_o(sdram_clk),
    .sdram_cke_o(sdram_cke),
    .sdram_cs_o(sdram_cs),
    .sdram_ras_o(sdram_ras),
    .sdram_cas_o(sdram_cas),
    .sdram_we_o(sdram_we),
    .sdram_dqm_o(sdram_dqm),
    .sdram_addr_o(sdram_a),
    .sdram_ba_o(sdram_ba),
    .sdram_data_input_i(sdram_dq),
    .sdram_data_output_o(sdram_dout),
    .sdram_data_out_en_o(sdram_dout_en)
  );

endmodule
