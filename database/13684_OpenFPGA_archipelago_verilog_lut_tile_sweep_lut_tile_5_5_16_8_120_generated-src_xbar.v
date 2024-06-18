// This program was cloned from: https://github.com/haojunliu/OpenFPGA
// License: BSD 2-Clause "Simplified" License

module xbar(input clk, input reset,
    input [19:0] io_xbar_in,
    output [24:0] io_xbar_out,
    input [124:0] io_mux_configs);

    assign io_xbar_out[0] = io_xbar_in[io_mux_configs[4:0]];
    assign io_xbar_out[1] = io_xbar_in[io_mux_configs[9:5]];
    assign io_xbar_out[2] = io_xbar_in[io_mux_configs[14:10]];
    assign io_xbar_out[3] = io_xbar_in[io_mux_configs[19:15]];
    assign io_xbar_out[4] = io_xbar_in[io_mux_configs[24:20]];
    assign io_xbar_out[5] = io_xbar_in[io_mux_configs[29:25]];
    assign io_xbar_out[6] = io_xbar_in[io_mux_configs[34:30]];
    assign io_xbar_out[7] = io_xbar_in[io_mux_configs[39:35]];
    assign io_xbar_out[8] = io_xbar_in[io_mux_configs[44:40]];
    assign io_xbar_out[9] = io_xbar_in[io_mux_configs[49:45]];
    assign io_xbar_out[10] = io_xbar_in[io_mux_configs[54:50]];
    assign io_xbar_out[11] = io_xbar_in[io_mux_configs[59:55]];
    assign io_xbar_out[12] = io_xbar_in[io_mux_configs[64:60]];
    assign io_xbar_out[13] = io_xbar_in[io_mux_configs[69:65]];
    assign io_xbar_out[14] = io_xbar_in[io_mux_configs[74:70]];
    assign io_xbar_out[15] = io_xbar_in[io_mux_configs[79:75]];
    assign io_xbar_out[16] = io_xbar_in[io_mux_configs[84:80]];
    assign io_xbar_out[17] = io_xbar_in[io_mux_configs[89:85]];
    assign io_xbar_out[18] = io_xbar_in[io_mux_configs[94:90]];
    assign io_xbar_out[19] = io_xbar_in[io_mux_configs[99:95]];
    assign io_xbar_out[20] = io_xbar_in[io_mux_configs[104:100]];
    assign io_xbar_out[21] = io_xbar_in[io_mux_configs[109:105]];
    assign io_xbar_out[22] = io_xbar_in[io_mux_configs[114:110]];
    assign io_xbar_out[23] = io_xbar_in[io_mux_configs[119:115]];
    assign io_xbar_out[24] = io_xbar_in[io_mux_configs[124:120]];

endmodule
// This program was cloned from: https://github.com/haojunliu/OpenFPGA
// License: BSD 2-Clause "Simplified" License

module xbar(input clk, input reset,
    input [19:0] io_xbar_in,
    output [24:0] io_xbar_out,
    input [124:0] io_mux_configs);

    assign io_xbar_out[0] = io_xbar_in[io_mux_configs[4:0]];
    assign io_xbar_out[1] = io_xbar_in[io_mux_configs[9:5]];
    assign io_xbar_out[2] = io_xbar_in[io_mux_configs[14:10]];
    assign io_xbar_out[3] = io_xbar_in[io_mux_configs[19:15]];
    assign io_xbar_out[4] = io_xbar_in[io_mux_configs[24:20]];
    assign io_xbar_out[5] = io_xbar_in[io_mux_configs[29:25]];
    assign io_xbar_out[6] = io_xbar_in[io_mux_configs[34:30]];
    assign io_xbar_out[7] = io_xbar_in[io_mux_configs[39:35]];
    assign io_xbar_out[8] = io_xbar_in[io_mux_configs[44:40]];
    assign io_xbar_out[9] = io_xbar_in[io_mux_configs[49:45]];
    assign io_xbar_out[10] = io_xbar_in[io_mux_configs[54:50]];
    assign io_xbar_out[11] = io_xbar_in[io_mux_configs[59:55]];
    assign io_xbar_out[12] = io_xbar_in[io_mux_configs[64:60]];
    assign io_xbar_out[13] = io_xbar_in[io_mux_configs[69:65]];
    assign io_xbar_out[14] = io_xbar_in[io_mux_configs[74:70]];
    assign io_xbar_out[15] = io_xbar_in[io_mux_configs[79:75]];
    assign io_xbar_out[16] = io_xbar_in[io_mux_configs[84:80]];
    assign io_xbar_out[17] = io_xbar_in[io_mux_configs[89:85]];
    assign io_xbar_out[18] = io_xbar_in[io_mux_configs[94:90]];
    assign io_xbar_out[19] = io_xbar_in[io_mux_configs[99:95]];
    assign io_xbar_out[20] = io_xbar_in[io_mux_configs[104:100]];
    assign io_xbar_out[21] = io_xbar_in[io_mux_configs[109:105]];
    assign io_xbar_out[22] = io_xbar_in[io_mux_configs[114:110]];
    assign io_xbar_out[23] = io_xbar_in[io_mux_configs[119:115]];
    assign io_xbar_out[24] = io_xbar_in[io_mux_configs[124:120]];

endmodule
