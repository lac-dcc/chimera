// This program was cloned from: https://github.com/M17-Project/OpenHT-fpga
// License: GNU General Public License v3.0

    ddr_rx u_ddr_rx(.rst_i(rst_i),
        .data_i(data_i),
        .clk_i(clk_i),
        .data_o(data_o),
        .sclk_o(sclk_o));
