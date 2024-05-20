// This program was cloned from: https://github.com/vrteee/tt07-mini-aie-cgra
// License: Apache License 2.0

// data_in[7:6] -> state
//   state = 00: CONFIG(WEIGHT)
//   state = 01: CONFIG(NEXT_PE, OP)
//   state = 10: START(OPERAND)
//   state = 11: END(OUTPUT)

module compute_tile
(
    input wire clk, 
    input wire rst_n,
    input [7:0] switch_data_in,
    output reg [7:0] switch_data_out,
    output reg [7:0] next_pe_data_out,
    input [7:0] next_pe_data_in,
    input [7:0] prev_pe_data_in,
    output reg [7:0] prev_pe_data_out
);

    reg op_type;
    reg [3:0] weight;

    reg has_next_core;
    reg next_core_offset;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            op_type <= 1'b0;
            weight <= 4'b0000;
            next_pe_data_out <= 8'b00000000;
            prev_pe_data_out <= 8'b00000000;

            has_next_core <= 1'b0;
            next_core_offset <= 1'b0;
            switch_data_out <= 8'b00000000;
        
        end else if (switch_data_in[7:6] == 2'b00) begin
            // $display("compute_tile config weight: %d", switch_data_in);
            weight <= switch_data_in[3:0];
        
        end else if (switch_data_in[7:6] == 2'b01) begin
            has_next_core <= 1'b1;
            next_core_offset <= switch_data_in[4];
            op_type <= switch_data_in[0];
        
        end else begin
            if (has_next_core) begin
                next_pe_data_out <= switch_data_in;
                // case (next_core_offset)
                //     1'b0: next_pe_data_out <= switch_data_in;
                //     1'b1: prev_pe_data_out <= switch_data_in;
                // endcase
            end else begin
                switch_data_out <= weight + prev_pe_data_in + next_pe_data_in;
                // case (op_type) 
                //     1'b0: switch_data_out <= weight + prev_pe_data_in + next_pe_data_in;
                //     1'b1: switch_data_out <= weight & prev_pe_data_in & next_pe_data_in;
                // endcase    
            end
        end
    end
endmodule
