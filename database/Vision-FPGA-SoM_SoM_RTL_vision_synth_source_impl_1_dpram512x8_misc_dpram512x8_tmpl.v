// This program was cloned from: https://github.com/tinyvision-ai-inc/Vision-FPGA-SoM
// License: MIT License

    dpram512x8 __(.wr_clk_i( ),
        .rd_clk_i( ),
        .rst_i( ),
        .wr_clk_en_i( ),
        .rd_en_i( ),
        .rd_clk_en_i( ),
        .wr_en_i( ),
        .wr_data_i( ),
        .wr_addr_i( ),
        .rd_addr_i( ),
        .rd_data_o( ));
