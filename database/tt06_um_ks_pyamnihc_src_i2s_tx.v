// This program was cloned from: https://github.com/pyamnihc/tt06_um_ks_pyamnihc
// License: Apache License 2.0

module i2s_tx #(
        parameter AUDIO_DW = 8
        ) (
	input sck_i,
	input ws_i,
        output sd_o,
	input [AUDIO_DW-1:0] l_data_i,
	input [AUDIO_DW-1:0] r_data_i,
        output l_load_en_o,
        output r_load_en_o
);
// referenced from, i2s spec. at https://www.nxp.com/docs/en/user-manual/UM11732.pdf

    reg wsd[1:0];
    always @(posedge sck_i) begin
        wsd[0] <= ws_i;
        wsd[1] <= wsd[0];
    end
    assign l_load_en_o = wsd[1] & !wsd[0];
    assign r_load_en_o = !wsd[1] & wsd[0];
    
    wire wsp;
    assign wsp = wsd[0] ^ wsd[1];

    reg [AUDIO_DW-1:0] sd_shift_reg;
    wire [AUDIO_DW-1:0] l_data, r_data;
    assign l_data = !wsd[0] ? l_data_i : {AUDIO_DW{1'b0}};
    assign r_data = wsd[0] ? r_data_i : {AUDIO_DW{1'b0}};

    always @(negedge sck_i) begin
        if (wsp == 1) sd_shift_reg <= l_data | r_data;
        else sd_shift_reg <= {sd_shift_reg[AUDIO_DW-2:0], 1'b0};
    end
    assign sd_o = sd_shift_reg[AUDIO_DW-1];

endmodule
