// This program was cloned from: https://github.com/lnls-dig/infra-cores
// License: GNU Lesser General Public License v3.0

module rs232_syscon_top_1_0 (
  input clk_i,
  input reset_i,
  input ack_i,
  input err_i,  
  input rs232_rxd_i,
  input [31:0]data_in,
  output [31:0]data_out,
  output rst_o,  
  output stb_o,
  output cyc_o,
  output [31:0]adr_o,
  output we_o,
  output rs232_txd_o,
  output [3:0]sel_o
);

wire syscon_master;

assign sel_o[3] = stb_o;
assign sel_o[2] = stb_o;
assign sel_o[1] = stb_o;
assign sel_o[0] = stb_o;

// Auto-baud
// dat_io -> data_in i data_out
// Magistrala
// Adres: 16 bit
// Dane: 32 bit
rs232_syscon i_rs232_syscon (
  .clk_i(clk_i),
  .reset_i(reset_i),
  .ack_i(ack_i),
  .err_i(err_i),
  .master_bg_i(syscon_master),
  .master_adr_i(),
  .master_stb_i(),
  .master_we_i(),
  .rs232_rxd_i(rs232_rxd_i),
  //.rs232_rxd_i(),
  .data_in(data_in),
  .data_out(data_out),  
  //.dat_io(data),
  .rst_o(rst_o),
  .master_br_o(syscon_master),
  .stb_o(stb_o),
  .cyc_o(cyc_o),
  .adr_o(adr_o),
  .we_o(we_o),
  //.rs232_txd_o()
  .rs232_txd_o(rs232_txd_o)
  );

endmodule
