// This program was cloned from: https://github.com/haojunliu/OpenFPGA
// License: BSD 2-Clause "Simplified" License

module xbar(input clk, input reset,
    input [37:0] io_xbar_in,
    output [49:0] io_xbar_out,
    input [299:0] io_mux_configs);

    assign io_xbar_out[0] = io_xbar_in[io_mux_configs[5:0]];
    assign io_xbar_out[1] = io_xbar_in[io_mux_configs[11:6]];
    assign io_xbar_out[2] = io_xbar_in[io_mux_configs[17:12]];
    assign io_xbar_out[3] = io_xbar_in[io_mux_configs[23:18]];
    assign io_xbar_out[4] = io_xbar_in[io_mux_configs[29:24]];
    assign io_xbar_out[5] = io_xbar_in[io_mux_configs[35:30]];
    assign io_xbar_out[6] = io_xbar_in[io_mux_configs[41:36]];
    assign io_xbar_out[7] = io_xbar_in[io_mux_configs[47:42]];
    assign io_xbar_out[8] = io_xbar_in[io_mux_configs[53:48]];
    assign io_xbar_out[9] = io_xbar_in[io_mux_configs[59:54]];
    assign io_xbar_out[10] = io_xbar_in[io_mux_configs[65:60]];
    assign io_xbar_out[11] = io_xbar_in[io_mux_configs[71:66]];
    assign io_xbar_out[12] = io_xbar_in[io_mux_configs[77:72]];
    assign io_xbar_out[13] = io_xbar_in[io_mux_configs[83:78]];
    assign io_xbar_out[14] = io_xbar_in[io_mux_configs[89:84]];
    assign io_xbar_out[15] = io_xbar_in[io_mux_configs[95:90]];
    assign io_xbar_out[16] = io_xbar_in[io_mux_configs[101:96]];
    assign io_xbar_out[17] = io_xbar_in[io_mux_configs[107:102]];
    assign io_xbar_out[18] = io_xbar_in[io_mux_configs[113:108]];
    assign io_xbar_out[19] = io_xbar_in[io_mux_configs[119:114]];
    assign io_xbar_out[20] = io_xbar_in[io_mux_configs[125:120]];
    assign io_xbar_out[21] = io_xbar_in[io_mux_configs[131:126]];
    assign io_xbar_out[22] = io_xbar_in[io_mux_configs[137:132]];
    assign io_xbar_out[23] = io_xbar_in[io_mux_configs[143:138]];
    assign io_xbar_out[24] = io_xbar_in[io_mux_configs[149:144]];
    assign io_xbar_out[25] = io_xbar_in[io_mux_configs[155:150]];
    assign io_xbar_out[26] = io_xbar_in[io_mux_configs[161:156]];
    assign io_xbar_out[27] = io_xbar_in[io_mux_configs[167:162]];
    assign io_xbar_out[28] = io_xbar_in[io_mux_configs[173:168]];
    assign io_xbar_out[29] = io_xbar_in[io_mux_configs[179:174]];
    assign io_xbar_out[30] = io_xbar_in[io_mux_configs[185:180]];
    assign io_xbar_out[31] = io_xbar_in[io_mux_configs[191:186]];
    assign io_xbar_out[32] = io_xbar_in[io_mux_configs[197:192]];
    assign io_xbar_out[33] = io_xbar_in[io_mux_configs[203:198]];
    assign io_xbar_out[34] = io_xbar_in[io_mux_configs[209:204]];
    assign io_xbar_out[35] = io_xbar_in[io_mux_configs[215:210]];
    assign io_xbar_out[36] = io_xbar_in[io_mux_configs[221:216]];
    assign io_xbar_out[37] = io_xbar_in[io_mux_configs[227:222]];
    assign io_xbar_out[38] = io_xbar_in[io_mux_configs[233:228]];
    assign io_xbar_out[39] = io_xbar_in[io_mux_configs[239:234]];
    assign io_xbar_out[40] = io_xbar_in[io_mux_configs[245:240]];
    assign io_xbar_out[41] = io_xbar_in[io_mux_configs[251:246]];
    assign io_xbar_out[42] = io_xbar_in[io_mux_configs[257:252]];
    assign io_xbar_out[43] = io_xbar_in[io_mux_configs[263:258]];
    assign io_xbar_out[44] = io_xbar_in[io_mux_configs[269:264]];
    assign io_xbar_out[45] = io_xbar_in[io_mux_configs[275:270]];
    assign io_xbar_out[46] = io_xbar_in[io_mux_configs[281:276]];
    assign io_xbar_out[47] = io_xbar_in[io_mux_configs[287:282]];
    assign io_xbar_out[48] = io_xbar_in[io_mux_configs[293:288]];
    assign io_xbar_out[49] = io_xbar_in[io_mux_configs[299:294]];

endmodule
// This program was cloned from: https://github.com/haojunliu/OpenFPGA
// License: BSD 2-Clause "Simplified" License

module xbar(input clk, input reset,
    input [37:0] io_xbar_in,
    output [49:0] io_xbar_out,
    input [299:0] io_mux_configs);

    assign io_xbar_out[0] = io_xbar_in[io_mux_configs[5:0]];
    assign io_xbar_out[1] = io_xbar_in[io_mux_configs[11:6]];
    assign io_xbar_out[2] = io_xbar_in[io_mux_configs[17:12]];
    assign io_xbar_out[3] = io_xbar_in[io_mux_configs[23:18]];
    assign io_xbar_out[4] = io_xbar_in[io_mux_configs[29:24]];
    assign io_xbar_out[5] = io_xbar_in[io_mux_configs[35:30]];
    assign io_xbar_out[6] = io_xbar_in[io_mux_configs[41:36]];
    assign io_xbar_out[7] = io_xbar_in[io_mux_configs[47:42]];
    assign io_xbar_out[8] = io_xbar_in[io_mux_configs[53:48]];
    assign io_xbar_out[9] = io_xbar_in[io_mux_configs[59:54]];
    assign io_xbar_out[10] = io_xbar_in[io_mux_configs[65:60]];
    assign io_xbar_out[11] = io_xbar_in[io_mux_configs[71:66]];
    assign io_xbar_out[12] = io_xbar_in[io_mux_configs[77:72]];
    assign io_xbar_out[13] = io_xbar_in[io_mux_configs[83:78]];
    assign io_xbar_out[14] = io_xbar_in[io_mux_configs[89:84]];
    assign io_xbar_out[15] = io_xbar_in[io_mux_configs[95:90]];
    assign io_xbar_out[16] = io_xbar_in[io_mux_configs[101:96]];
    assign io_xbar_out[17] = io_xbar_in[io_mux_configs[107:102]];
    assign io_xbar_out[18] = io_xbar_in[io_mux_configs[113:108]];
    assign io_xbar_out[19] = io_xbar_in[io_mux_configs[119:114]];
    assign io_xbar_out[20] = io_xbar_in[io_mux_configs[125:120]];
    assign io_xbar_out[21] = io_xbar_in[io_mux_configs[131:126]];
    assign io_xbar_out[22] = io_xbar_in[io_mux_configs[137:132]];
    assign io_xbar_out[23] = io_xbar_in[io_mux_configs[143:138]];
    assign io_xbar_out[24] = io_xbar_in[io_mux_configs[149:144]];
    assign io_xbar_out[25] = io_xbar_in[io_mux_configs[155:150]];
    assign io_xbar_out[26] = io_xbar_in[io_mux_configs[161:156]];
    assign io_xbar_out[27] = io_xbar_in[io_mux_configs[167:162]];
    assign io_xbar_out[28] = io_xbar_in[io_mux_configs[173:168]];
    assign io_xbar_out[29] = io_xbar_in[io_mux_configs[179:174]];
    assign io_xbar_out[30] = io_xbar_in[io_mux_configs[185:180]];
    assign io_xbar_out[31] = io_xbar_in[io_mux_configs[191:186]];
    assign io_xbar_out[32] = io_xbar_in[io_mux_configs[197:192]];
    assign io_xbar_out[33] = io_xbar_in[io_mux_configs[203:198]];
    assign io_xbar_out[34] = io_xbar_in[io_mux_configs[209:204]];
    assign io_xbar_out[35] = io_xbar_in[io_mux_configs[215:210]];
    assign io_xbar_out[36] = io_xbar_in[io_mux_configs[221:216]];
    assign io_xbar_out[37] = io_xbar_in[io_mux_configs[227:222]];
    assign io_xbar_out[38] = io_xbar_in[io_mux_configs[233:228]];
    assign io_xbar_out[39] = io_xbar_in[io_mux_configs[239:234]];
    assign io_xbar_out[40] = io_xbar_in[io_mux_configs[245:240]];
    assign io_xbar_out[41] = io_xbar_in[io_mux_configs[251:246]];
    assign io_xbar_out[42] = io_xbar_in[io_mux_configs[257:252]];
    assign io_xbar_out[43] = io_xbar_in[io_mux_configs[263:258]];
    assign io_xbar_out[44] = io_xbar_in[io_mux_configs[269:264]];
    assign io_xbar_out[45] = io_xbar_in[io_mux_configs[275:270]];
    assign io_xbar_out[46] = io_xbar_in[io_mux_configs[281:276]];
    assign io_xbar_out[47] = io_xbar_in[io_mux_configs[287:282]];
    assign io_xbar_out[48] = io_xbar_in[io_mux_configs[293:288]];
    assign io_xbar_out[49] = io_xbar_in[io_mux_configs[299:294]];

endmodule
