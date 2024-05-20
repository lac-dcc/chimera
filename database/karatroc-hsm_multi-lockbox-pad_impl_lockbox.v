// This program was cloned from: https://github.com/katherinezhao02/karatroc-hsm
// License: MIT License

module lockbox #(
    parameter TAGS = 2,
    parameter TAG_WIDTH = 16,
    parameter WIDTH = 128
) (
    input i_clk,
    input i_rst_n,
    input i_en,
    input i_op,
    input [TAG_WIDTH-1:0] i_tag,
    input [WIDTH-1:0] i_secret,
    input [WIDTH-1:0] i_password,
    output [WIDTH-1:0] o_out,
    output o_valid
);

// state
reg row_valid [TAGS-1:0];
reg [TAG_WIDTH-1:0] tags [TAGS-1:0];
reg [WIDTH-1:0] secret [TAGS-1:0];
reg [WIDTH-1:0] password [TAGS-1:0];

// outputs
reg [WIDTH-1:0] returned_value;
reg output_valid;

// control-related
reg [1:0] state;
// 0 => idle
// 1 => searching
// 2 => found? processing
reg store_pass;

reg saved_op;
reg [TAG_WIDTH-1:0] saved_tag;
reg [WIDTH-1:0] saved_secret;
reg [WIDTH-1:0] saved_password;

reg [1:0] search_index;
reg [1:0] found_index;

always @(posedge i_clk) begin
    if (!i_rst_n) begin
        returned_value <= 0;
        output_valid <= 0;
        state <= 0;
    end else if (state == 2'b00) begin
        // idle
        if (i_en && output_valid == 0) begin
            saved_op <= i_op;
            saved_tag <= i_tag;
            saved_secret <= i_secret;
            saved_password <= i_password;

            state <= 2'b01;
            search_index <= 0;
            found_index <= TAGS; // invalid
            store_pass <= 0;
        end
        output_valid <= 0;
        returned_value <= 0; // note: verification caught this line being missing
    end else if (state == 2'b01) begin
        // searching
        if (saved_op == 0) begin
            // get, searching for matching
            if (search_index == TAGS) begin
                state <= 2'b10;
            end else begin
                if (row_valid[search_index] && tags[search_index] == saved_tag) begin
                    found_index <= search_index;
                end
                search_index <= search_index + 1;
            end
        end else begin
            // store, searching for matching first, empty otherwise
            if (store_pass == 0) begin
                if (search_index == TAGS) begin
                    search_index <= 0;
                    store_pass <= 1;
                end else begin
                    if (row_valid[search_index] && tags[search_index] == saved_tag) begin
                        found_index <= search_index;
                    end
                    search_index <= search_index + 1;
                end
            end else begin
                if (search_index == TAGS) begin
                    state <= 2'b10;
                end else begin
                    if (found_index == TAGS && !row_valid[search_index]) begin
                        found_index <= search_index;
                    end
                    search_index <= search_index + 1;
                end
            end
        end
    end else if (state == 2'b10) begin
        // processing
        if (saved_op == 0) begin
            // get
            if (found_index < TAGS) begin
                if (row_valid[found_index] && password[found_index] == saved_password) begin
                    returned_value <= secret[found_index];
                end else begin
                    returned_value <= 0;
                end
                row_valid[found_index] <= 0; // note, we don't clear secret or password here!
            end else begin
                returned_value <= 0;
            end
        end else begin
            // store
            if (found_index < TAGS) begin
                row_valid[found_index] <= 1;
                tags[found_index] <= saved_tag;
                secret[found_index] <= saved_secret;
                password[found_index] <= saved_password;
                returned_value <= 1;
            end else begin
                returned_value <= 0;
            end
        end
        output_valid <= 1;
        state <= 2'b00;
    end
end

assign o_out = returned_value;
assign o_valid = output_valid;

endmodule
