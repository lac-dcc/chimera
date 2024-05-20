// This program was cloned from: https://github.com/pyamnihc/tt06_um_ks_pyamnihc
// License: Apache License 2.0

`default_nettype none

module tt_um_ks_pyamnihc (
    input  wire [7:0] ui_in,    // Dedicated inputs - connected to the input switches
    output wire [7:0] uo_out,   // Dedicated outputs - connected to the 7 segment display
    input  wire [7:0] uio_in,   // IOs: Bidirectional Input path
    output wire [7:0] uio_out,  // IOs: Bidirectional Output path
    output wire [7:0] uio_oe,   // IOs: Bidirectional Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);
    // SPI param.
    localparam SPI_INST_WIDTH = 1;
    localparam SPI_ADDR_WIDTH = 7;
    localparam SPI_DATA_WIDTH = 8;
    localparam SPI_NUM_CONFIG_REG = 8;
    localparam SPI_NUM_STATUS_REG = 2;

    // I2S param.
    localparam I2S_AUDIO_DW = 8;

    // KS param.
    localparam KS_MAX_LENGTH = 32;
    localparam KS_DATA_WIDTH = 8;
    localparam KS_PRBS_WIDTH = 2;
    localparam KS_EXTN_BITS = 4;
    localparam KS_FRAC_BITS = 4;

    // clock dividers
    reg [3:0] clk_rise_counter;
    wire clk_r16;
    always @(posedge clk) begin
        if (!rst_n) clk_rise_counter <= 'b0;
        else clk_rise_counter <= clk_rise_counter + 1;
    end
    assign clk_r16 = clk_rise_counter[3];

    // SPI register map
    wire sck_i;
    assign sck_i = uio_in[0];
    wire sdi_i;
    assign sdi_i = uio_in[1];
    wire sdo_o;
    assign uio_out[2] = sdo_o;
    wire cs_ni;
    assign cs_ni = uio_in[3];
    
    // i2s tx
    wire i2s_sck_o;
    assign uio_out[4] = i2s_sck_o;
    wire i2s_ws_o;
    assign uio_out[5] = i2s_ws_o;
    wire i2s_sd_o;
    assign uio_out[6] = i2s_sd_o;

    assign uio_out[0] = 1'b0;
    assign uio_out[1] = 1'b0;
    assign uio_out[3] = 1'b0;
    
    assign uio_oe = 8'b1111_0100;
    assign uo_out[0] = rst_n;
    assign uo_out[1] = rst_n_prbs_15;
    assign uo_out[2] = rst_n_prbs_7;
    assign uo_out[3] = rst_n_ks_string;
    assign uo_out[4] = freeze_prbs_7;
    assign uo_out[5] = freeze_prbs_15;
    assign uo_out[6] = i2s_noise_sel;
    assign uo_out[7] = pluck;

    // prbs tx
    assign uio_out[7] = prbs_15;
    
    // register map, packed to unpacked
    wire [SPI_DATA_WIDTH*SPI_NUM_CONFIG_REG-1:0] config_bus_o;
    wire [SPI_DATA_WIDTH*SPI_NUM_STATUS_REG-1:0] status_bus_i;

    wire [SPI_DATA_WIDTH-1:0] config_arr [SPI_NUM_CONFIG_REG-1:0];
    genvar i;
    generate
        for (i = 0; i < SPI_NUM_CONFIG_REG; i = i + 1) begin
            assign config_arr[i] = config_bus_o[SPI_DATA_WIDTH*(i+1)-1:SPI_DATA_WIDTH*i];
        end
    endgenerate
    
    wire [SPI_DATA_WIDTH-1:0] status_arr [SPI_NUM_CONFIG_REG-1:0];
    generate
        for (i = 0; i < SPI_NUM_STATUS_REG; i = i + 1) begin
            assign status_bus_i[SPI_DATA_WIDTH*(i+1)-1:SPI_DATA_WIDTH*i] = status_arr[i];
        end
    endgenerate

    assign status_arr[0] = 8'hC0;
    assign status_arr[1] = 8'h01;
    
    // SPI peripheral
    wire [SPI_ADDR_WIDTH-1:0] spi_addr;
    wire [SPI_DATA_WIDTH-1:0] spi_write_data, spi_read_data;
    wire spi_write_en, spi_read_en;

    spi_slave_mem_interface #(.INST_WIDTH(SPI_INST_WIDTH),
                .ADDR_WIDTH(SPI_ADDR_WIDTH),
                .DATA_WIDTH(SPI_DATA_WIDTH)
    ) spi_slave_mem_interface_0 (
        .sck_i(sck_i),
        .sdi_i(sdi_i),
        .sdo_o(sdo_o),
        .cs_ni(cs_ni && rst_n),
        .addr_o(spi_addr),
        .write_data_o(spi_write_data),
        .write_en_o(spi_write_en),
        .read_data_i(spi_read_data),
        .read_en_o(spi_read_en)
    );

    // Register map
    register_map #( .ADDR_WIDTH(SPI_ADDR_WIDTH),
                    .DATA_WIDTH(SPI_DATA_WIDTH),
                    .NUM_CONFIG_REG(SPI_NUM_CONFIG_REG),
                    .NUM_STATUS_REG(SPI_NUM_STATUS_REG)
    ) register_map_0 (
        .clk_i(clk),
        .rst_ni(rst_n),
        .addr_i(spi_addr),
        .write_data_i(spi_write_data),
        .write_en_i(spi_write_en),
        .read_data_o(spi_read_data),
        .read_en_i(spi_read_en),
        .config_bus_o(config_bus_o),
        .status_bus_i(status_bus_i)
    );
    
    // prbs15
    wire rst_n_prbs_15;
    assign rst_n_prbs_15 = ~config_arr[0][0] && ~ui_in[0];
    wire [14:0] lfsr_init_15;
    assign lfsr_init_15 = {~config_arr[2][6:0], ~config_arr[1][7:0]};
    wire load_prbs_15;
    assign load_prbs_15 = config_arr[2][7] || ui_in[1];
    wire freeze_prbs_15;
    assign freeze_prbs_15 = config_arr[0][4] || ui_in[2];
    wire prbs_15;
    wire [14:0] prbs_frame_15;

    prbs15 prbs15_0 (
        .clk_i(clk_r16),
        .rst_ni(rst_n && rst_n_prbs_15),
        .lfsr_init_i(lfsr_init_15),
        .load_prbs_i(load_prbs_15),
        .freeze_i(freeze_prbs_15),
        .prbs_o(prbs_15),
        .prbs_frame_o(prbs_frame_15)
    );

    // prbs7
    wire rst_n_prbs_7;
    assign rst_n_prbs_7 = ~config_arr[0][1] && ~ui_in[0];
    wire [6:0] lfsr_init_7;
    assign lfsr_init_7 = config_arr[3][6:0];
    wire load_prbs_7;
    assign load_prbs_7 = config_arr[3][7] || ui_in[1];
    wire freeze_prbs_7;
    assign freeze_prbs_7 = config_arr[0][5] || ui_in[3];
    wire prbs_7;
    wire [6:0] prbs_frame_7;

    prbs7 prbs7_0 (
        .clk_i(clk_r16),
        .rst_ni(rst_n && rst_n_prbs_7),
        .lfsr_init_i(lfsr_init_7),
        .load_prbs_i(load_prbs_7),
        .freeze_i(freeze_prbs_7),
        .prbs_o(prbs_7),
        .prbs_frame_o(prbs_frame_7)
    );
    
    // i2s sample select
    wire i2s_noise_sel = config_arr[0][7] || ui_in[4];
    wire [I2S_AUDIO_DW-1:0] l_data, r_data; 
    assign l_data = i2s_noise_sel ? prbs_frame_15[I2S_AUDIO_DW-1:0] : ks_sample;
    assign r_data = i2s_noise_sel ? {1'b0, prbs_frame_7} : ks_sample;

    reg [I2S_AUDIO_DW-1:0] l_data_reg, r_data_reg; 
    wire l_load_en, r_load_en;
    
    always @(negedge i2s_sck_o) begin
        if (l_load_en == 1) l_data_reg <= l_data;
        else l_data_reg <= l_data_reg;
        if (r_load_en == 1) r_data_reg <= r_data;
        else r_data_reg <= r_data_reg;
    end

    // i2s tx
    assign i2s_sck_o = ~clk;
    assign i2s_ws_o = clk_r16;

    i2s_tx #(
        .AUDIO_DW(I2S_AUDIO_DW)
    ) i2s_tx_0 (
        .sck_i(i2s_sck_o),
        .ws_i(i2s_ws_o),
        .sd_o(i2s_sd_o),
        .l_data_i(l_data_reg),
        .r_data_i(r_data_reg),
        .l_load_en_o(l_load_en),
        .r_load_en_o(r_load_en)
    );

    // ks string
    wire ks_clk;
    assign ks_clk = clk_r16;
    wire rst_n_ks_string;
    assign rst_n_ks_string = ~config_arr[0][2] && ~ui_in[5];
    wire ks_freeze;
    assign ks_freeze = config_arr[0][7];
    wire pluck;
    assign pluck = config_arr[4][0] || ui_in[6];
    wire round_en;
    assign round_en = config_arr[4][1];
    wire toggle_pattern_prbs_n;
    assign toggle_pattern_prbs_n = config_arr[4][2];
    wire drum_string_n;
    assign drum_string_n = config_arr[4][3];
    wire fine_tune_en;
    assign fine_tune_en = config_arr[4][4];
    wire dynamics_en;
    assign dynamics_en = config_arr[4][5];
    wire [KS_DATA_WIDTH-1:0] fine_tune_C;
    assign fine_tune_C = config_arr[5];
    wire [KS_DATA_WIDTH-1:0] dynamics_R;
    assign dynamics_R = config_arr[6];
    wire clip_noise;
    assign clip_noise = config_arr[4][6];
    wire [KS_PRBS_WIDTH-1:0] prbs_data;
    assign prbs_data = {prbs_15, prbs_7};
    wire [KS_DATA_WIDTH-1:0] ks_period;
    assign ks_period = ~config_arr[7];

    wire [KS_DATA_WIDTH-1:0] ks_sample;

    ks_string #(
        .MAX_LENGTH(KS_MAX_LENGTH),
        .DATA_WIDTH(KS_DATA_WIDTH),
        .PRBS_WIDTH(KS_PRBS_WIDTH),
        .EXTN_BITS(KS_EXTN_BITS),
        .FRAC_BITS(KS_FRAC_BITS)
    ) ks_string_0 (
        .clk_i(ks_clk),
        .rst_ni(rst_n && rst_n_ks_string),
        .freeze_i(ks_freeze),
        .pluck_i(pluck),
        .round_en_i(round_en),
        .toggle_pattern_prbs_ni(toggle_pattern_prbs_n), 
        .drum_string_ni(drum_string_n),
        .fine_tune_en_i(fine_tune_en),
        .fine_tune_C_i(fine_tune_C),
        .dynamics_en_i(dynamics_en),
        .dynamics_R_i(dynamics_R),
        .clip_noise_i(clip_noise),
        .prbs_data_i(prbs_data),
        .period_i(ks_period),
        .ks_sample_o(ks_sample)
    );

endmodule
