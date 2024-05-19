// This program was cloned from: https://github.com/M17-Project/OpenHT-fpga
// License: GNU General Public License v3.0

    fifo_in_samples __(.wr_clk_i( ),
        .rd_clk_i( ),
        .rst_i( ),
        .rp_rst_i( ),
        .wr_en_i( ),
        .rd_en_i( ),
        .wr_data_i( ),
        .full_o( ),
        .empty_o( ),
        .almost_empty_o( ),
        .rd_data_o( ));
