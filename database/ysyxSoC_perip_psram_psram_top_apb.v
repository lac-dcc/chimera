module psram_top_apb (
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

  output qspi_sck,
  output qspi_ce_n,
  inout  [3:0] qspi_dio
);

  wire [3:0] din, dout, douten;
  wire ack;
  EF_PSRAM_CTRL_wb u0 (
    .clk_i(clock),
    .rst_i(reset),
    .adr_i(in_paddr),
    .dat_i(in_pwdata),
    .dat_o(in_prdata),
    .sel_i(in_pstrb),
    .cyc_i(in_psel),
    .stb_i(in_psel),
    .ack_o(ack),
    .we_i(in_pwrite),
  
    .sck(qspi_sck),
    .ce_n(qspi_ce_n),
    .din(din),
    .dout(dout),
    .douten(douten)
  );
  
  assign in_pready = ack && in_psel;
  assign in_pslverr = 1'b0;
  assign qspi_dio[0] = douten[0] ? dout[0] : 1'bz;
  assign qspi_dio[1] = douten[1] ? dout[1] : 1'bz;
  assign qspi_dio[2] = douten[2] ? dout[2] : 1'bz;
  assign qspi_dio[3] = douten[3] ? dout[3] : 1'bz;
  assign din = qspi_dio;

endmodule
