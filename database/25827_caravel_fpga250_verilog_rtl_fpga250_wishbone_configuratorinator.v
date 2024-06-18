// This program was cloned from: https://github.com/ucb-cs250/caravel_fpga250
// License: Apache License 2.0

module wishbone_configuratorinator #(
    parameter BASE_ADDR = 32'h3000_0000
) (
    // Global signals
    input wb_clk_i,
    input wb_rst_i,

    // Wishbone signals
    input wbs_stb_i,
    input wbs_cyc_i,
    input wbs_we_i,
    // Write mask
    input [3:0] wbs_sel_i,
    input [31:0] wbs_data_i,
    input [31:0] wbs_addr_i,
    output reg wbs_ack_o, // Its bad form but its also 1 in the morning
    output reg [31:0] wbs_data_o,

    // Config output
    output cen,
    output [3:0] set_out,
    output [3:0] shift_out
);
    // Bus decoding
    wire selected;
    assign selected = (BASE_ADDR[31:4] == wbs_addr_i[31:4]) ? 1'b1 : 1'b0;

    wire transaction_initiated;
    assign transaction_initiated = wbs_stb_i & wbs_cyc_i & selected;

    // State registers
    reg read_transaction_in_progress;
    reg write_transaction_in_progress;
    reg output_initiated;
    reg [2:0] bits_index;
    reg [3:0] charged; // Heckin write masks
    
    // Bus exposed registers:

    // Management for the block:
    // {~, free_run}
    reg free_run;

    wire [31:0] house_keeping;
    assign house_keeping = {31'b0, free_run};

    // Comprised of 4 8 bit segments
    reg [7:0] bits_d, bits_c, bits_b, bits_a;

    wire [31:0] bitstream;
    assign bitstream = {bits_d, bits_c, bits_b, bits_a};

    // 4 Set output counters, each solves at 255
    reg [7:0] counter_d, counter_c, counter_b, counter_a;
    wire [31:0] counters;
    assign counters = {counter_d, counter_c, counter_b, counter_a};

    // Bus Logic
    always @(posedge wb_clk_i) begin
        // Transaction initiation and read transaction management
        if (transaction_initiated == 1 && !(read_transaction_in_progress || wbs_ack_o)) begin
            read_transaction_in_progress <= 1;
            if (wbs_addr_i[3:0] == 0) begin
                wbs_data_o <= house_keeping;
            end else if (wbs_addr_i[3:0] == 4) begin
                wbs_data_o <= bitstream;
            end else if (wbs_addr_i[3:0] == 8) begin
                wbs_data_o <= counters;
            end else begin
                wbs_data_o <= 0;
            end
            if (wbs_we_i == 1 && read_transaction_in_progress == 0) begin
                write_transaction_in_progress <= 1;
            end
        end
        if (read_transaction_in_progress == 1 && write_transaction_in_progress == 0) begin
            wbs_ack_o <= 1;
            read_transaction_in_progress <= 0;
        end

        // Write management
        if (write_transaction_in_progress == 1) begin
            if (wbs_addr_i[3:0] == 0) begin
                if (wbs_sel_i[0] == 1) free_run <= wbs_data_i[0];
                write_transaction_in_progress <= 0;
            end else if (wbs_addr_i[3:0] == 4) begin
                write_transaction_in_progress <= 0;
            end else if (wbs_addr_i[3:0] == 8) begin
                if (wbs_sel_i[0] == 1) bits_a <= wbs_data_i[7:0];
                if (wbs_sel_i[1] == 1) bits_b <= wbs_data_i[15:8];
                if (wbs_sel_i[2] == 1) bits_c <= wbs_data_i[23:16];
                if (wbs_sel_i[3] == 1) bits_d <= wbs_data_i[31:24];
                bits_index <= 0;
                if (output_initiated == 0) begin
                    charged <= charged | wbs_sel_i;
	        end else begin
		    charged <= 0;
		end
                if ((charged | wbs_sel_i) != 4'b1111) write_transaction_in_progress <= 0;
            end else begin
                write_transaction_in_progress <= 0;
            end
        end

        if (charged == 4'b1111) begin
            charged <= 0;
            output_initiated <= 1;
        end

        if (output_initiated && bits_index != 3'b111) begin
            bits_index <= bits_index + 1;
        end else if (output_initiated) begin
            bits_index <= 0;
            output_initiated <= 0;
            write_transaction_in_progress <= 0;
        end

        if (wbs_ack_o == 1) begin
            wbs_ack_o <= 0;
            wbs_data_o <= 0; // Maybe bad idea?
        end

        if (wb_rst_i == 1) begin
            wbs_data_o <= 0;
            bits_index <= 0;
            output_initiated <= 0;
            free_run <= 0;
            read_transaction_in_progress <= 0;
            write_transaction_in_progress <= 0;
            charged <= 0;
            wbs_ack_o <= 0;
        end
    end

    // Config output management

    assign cen = free_run | output_initiated;

    assign set_out[0] = (counter_a == 8'h00 && output_initiated) ? 1'b1 : 1'b0;
    assign set_out[1] = (counter_b == 8'h00 && output_initiated) ? 1'b1 : 1'b0;
    assign set_out[2] = (counter_c == 8'h00 && output_initiated) ? 1'b1 : 1'b0;
    assign set_out[3] = (counter_d == 8'h00 && output_initiated) ? 1'b1 : 1'b0;

    assign shift_out[0] = (output_initiated) ? bits_a[bits_index] : 1'b0;
    assign shift_out[1] = (output_initiated) ? bits_b[bits_index] : 1'b0;
    assign shift_out[2] = (output_initiated) ? bits_c[bits_index] : 1'b0;
    assign shift_out[3] = (output_initiated) ? bits_d[bits_index] : 1'b0;

    always @(posedge wb_clk_i) begin
        if (wb_rst_i == 1) begin
            counter_a <= 8'hFF;
            counter_b <= 8'hFF;
            counter_c <= 8'hFF;
            counter_d <= 8'hFF;
        end
        else if (output_initiated) begin
            if (counter_a != 8'hFF) counter_a <= counter_a - 1;
            if (counter_b != 8'hFF) counter_b <= counter_b - 1;
            if (counter_c != 8'hFF) counter_c <= counter_c - 1;
            if (counter_d != 8'hFF) counter_d <= counter_d - 1;
        end
        else if (write_transaction_in_progress == 1) begin
            if (wbs_addr_i[3:0] == 4) begin
                if (wbs_sel_i[0] == 1) counter_a <= wbs_data_i[7:0];
                if (wbs_sel_i[1] == 1) counter_b <= wbs_data_i[15:8];
                if (wbs_sel_i[2] == 1) counter_c <= wbs_data_i[23:16];
                if (wbs_sel_i[3] == 1) counter_d <= wbs_data_i[31:24];
            end
        end
    end
endmodule
