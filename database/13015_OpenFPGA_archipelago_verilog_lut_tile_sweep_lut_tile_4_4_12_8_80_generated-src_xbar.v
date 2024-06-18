// This program was cloned from: https://github.com/haojunliu/OpenFPGA
// License: BSD 2-Clause "Simplified" License

module xbar(input clk, input reset,
    input [14:0] io_xbar_in,
    output [15:0] io_xbar_out,
    input [63:0] io_mux_configs);

    assign io_xbar_out[0] = io_xbar_in[io_mux_configs[3:0]];
    assign io_xbar_out[1] = io_xbar_in[io_mux_configs[7:4]];
    assign io_xbar_out[2] = io_xbar_in[io_mux_configs[11:8]];
    assign io_xbar_out[3] = io_xbar_in[io_mux_configs[15:12]];
    assign io_xbar_out[4] = io_xbar_in[io_mux_configs[19:16]];
    assign io_xbar_out[5] = io_xbar_in[io_mux_configs[23:20]];
    assign io_xbar_out[6] = io_xbar_in[io_mux_configs[27:24]];
    assign io_xbar_out[7] = io_xbar_in[io_mux_configs[31:28]];
    assign io_xbar_out[8] = io_xbar_in[io_mux_configs[35:32]];
    assign io_xbar_out[9] = io_xbar_in[io_mux_configs[39:36]];
    assign io_xbar_out[10] = io_xbar_in[io_mux_configs[43:40]];
    assign io_xbar_out[11] = io_xbar_in[io_mux_configs[47:44]];
    assign io_xbar_out[12] = io_xbar_in[io_mux_configs[51:48]];
    assign io_xbar_out[13] = io_xbar_in[io_mux_configs[55:52]];
    assign io_xbar_out[14] = io_xbar_in[io_mux_configs[59:56]];
    assign io_xbar_out[15] = io_xbar_in[io_mux_configs[63:60]];

endmodule
// This program was cloned from: https://github.com/haojunliu/OpenFPGA
// License: BSD 2-Clause "Simplified" License

module xbar(input clk, input reset,
    input [14:0] io_xbar_in,
    output [15:0] io_xbar_out,
    input [63:0] io_mux_configs);

    assign io_xbar_out[0] = io_xbar_in[io_mux_configs[3:0]];
    assign io_xbar_out[1] = io_xbar_in[io_mux_configs[7:4]];
    assign io_xbar_out[2] = io_xbar_in[io_mux_configs[11:8]];
    assign io_xbar_out[3] = io_xbar_in[io_mux_configs[15:12]];
    assign io_xbar_out[4] = io_xbar_in[io_mux_configs[19:16]];
    assign io_xbar_out[5] = io_xbar_in[io_mux_configs[23:20]];
    assign io_xbar_out[6] = io_xbar_in[io_mux_configs[27:24]];
    assign io_xbar_out[7] = io_xbar_in[io_mux_configs[31:28]];
    assign io_xbar_out[8] = io_xbar_in[io_mux_configs[35:32]];
    assign io_xbar_out[9] = io_xbar_in[io_mux_configs[39:36]];
    assign io_xbar_out[10] = io_xbar_in[io_mux_configs[43:40]];
    assign io_xbar_out[11] = io_xbar_in[io_mux_configs[47:44]];
    assign io_xbar_out[12] = io_xbar_in[io_mux_configs[51:48]];
    assign io_xbar_out[13] = io_xbar_in[io_mux_configs[55:52]];
    assign io_xbar_out[14] = io_xbar_in[io_mux_configs[59:56]];
    assign io_xbar_out[15] = io_xbar_in[io_mux_configs[63:60]];

endmodule
