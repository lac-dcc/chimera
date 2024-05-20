// This program was cloned from: https://github.com/sarfrazenator/Sarfraz_TinyTapeout
// License: Apache License 2.0

`default_nettype none

module utm_core_341717091617866324(
    input clock,
    input reset,
    input mode,
    input [2:0] encoded_state_in,
    input [2:0] sym_in,
    input sym_in_valid,
    output [2:0] new_sym,
    output direction,
    output [2:0] encoded_next_state
);

reg [7:0] stored_state;
reg [2:0] symbuf;
reg symbuf_valid;

wire [7:0] state_in;
wire [7:0] state;
wire [7:0] next_state;
wire [2:0] sym;

always @(posedge clock) begin
    if (reset) begin
        stored_state <= 8'h01;
    end
    else if (sym_in_valid && symbuf_valid) begin
        stored_state <= next_state;
    end
    else begin
        stored_state <= stored_state;
    end
end

always @(posedge clock) begin
    if (reset) begin
        symbuf <= 3'b0;
    end
    else if (sym_in_valid) begin
        symbuf <= sym_in;
    end
    else begin
        symbuf <= symbuf;
    end
end

always @(posedge clock) begin
    if (reset) begin
        symbuf_valid <= 0;
    end
    else if (sym_in_valid) begin
        symbuf_valid <= 1;
    end
    else begin
        symbuf_valid <= symbuf_valid;
    end
end

decoder_3to8_341717091617866324 decode_state_in(
    .in(encoded_state_in),
    .out(state_in)
);

assign state = (mode == 0) ? state_in : stored_state;
assign sym = (mode == 0) ? sym_in : symbuf;

direction_341717091617866324 direction_block(
    .state(state),
    .s2(sym[2]),
    .s1(sym[1]),
    .s0(sym[0]),
    .direction(direction)
);

next_state_341717091617866324 next_state_block(
    .state_in(state),
    .s2(sym[2]),
    .s1(sym[1]),
    .s0(sym[0]),
    .state_out(next_state));

new_symbol_341717091617866324 new_sym_block(
    .state_in(state),
    .s2(sym[2]),
    .s1(sym[1]),
    .s0(sym[0]),
    .z2(new_sym[2]),
    .z1(new_sym[1]),
    .z0(new_sym[0])
);

encoder_8to3_341717091617866324 encode_state_out(
    .in(next_state),
    .out(encoded_next_state)
);

endmodule
`default_nettype none
module direction_341717091617866324(
    input [7:0] state,
    input s2,
    input s1,
    input s0,
    // 0 = left, 1 = right
    output direction
);

wire [7:0] state_in;
assign state_in = state;

wire [2:0] sym_in;
assign sym_in = {s2, s1, s0};

reg dir;
assign direction = dir;

always @(*) begin
    /* verilator lint_off CASEINCOMPLETE */
    case (state_in)
        8'h01: begin
            case (sym_in)
            3'b000: begin
                dir = 0;
            end
            3'b001: begin
                dir = 0;
            end
            3'b010: begin
                dir = 1;
            end
            3'b100: begin
                dir = 0;
            end
            3'b101: begin
                dir = 1;
            end
            3'b110: begin
                dir = 1;
            end
            3'b111: begin
                dir = 1;
            end
            endcase
        end
        8'h02: begin
            case (sym_in)
            3'b000: begin
                dir = 0;
            end
            3'b001: begin
                dir = 0;
            end
            3'b010: begin
                dir = 0;
            end
            3'b100: begin
                dir = 1;
            end
            3'b101: begin
                dir = 1;
            end
            3'b110: begin
                dir = 0;
            end
            3'b111: begin
                dir = 0;
            end
            endcase
        end
        8'h04: begin
            case (sym_in)
            3'b000: begin
                dir = 0;
            end
            3'b001: begin
                dir = 0;
            end
            3'b010: begin
                dir = 0;
            end
            3'b100: begin
                dir = 1;
            end
            3'b101: begin
                dir = 1;
            end
            3'b110: begin
                dir = 0;
            end
            3'b111: begin
                dir = 0;
            end
            endcase
        end
        8'h08: begin
            case (sym_in)
            3'b000: begin
                dir = 1;
            end
            3'b001: begin
                dir = 1;
            end
            3'b010: begin
                dir = 1;
            end
            3'b100: begin
                dir = 0;
            end
            3'b101: begin
                dir = 0;
            end
            3'b110: begin
                dir = 0;
            end
            3'b111: begin
                dir = 0;
            end
            endcase
        end
        8'h10: begin
            case (sym_in)
            3'b000: begin
                dir = 1;
            end
            3'b001: begin
                dir = 0;
            end
            3'b010: begin
                dir = 1;
            end
            3'b100: begin
                dir = 1;
            end
            3'b101: begin
                dir = 1;
            end
            3'b110: begin
                dir = 0;
            end
            3'b111: begin
                dir = 1;
            end
            endcase
        end
        8'h20: begin
            case (sym_in)
            3'b000: begin
                dir = 0;
            end
            3'b001: begin
                dir = 0;
            end
            3'b010: begin
                dir = 0;
            end
            3'b100: begin
                dir = 1;
            end
            3'b101: begin
                dir = 1;
            end
            3'b110: begin
                dir = 0;
            end
            3'b111: begin
                dir = 1;
            end
            endcase
        end
        8'h40: begin
            case (sym_in)
            3'b000: begin
                dir = 1;
            end
            3'b001: begin
                dir = 1;
            end
            3'b010: begin
                dir = 0;
            end
            3'b100: begin
                dir = 1;
            end
            3'b101: begin
                dir = 1;
            end
            3'b110: begin
                dir = 1;
            end
            3'b111: begin
                dir = 1;
            end
            endcase
        end
        8'h80: begin
            case (sym_in)
            3'b000: begin
                dir = 0;
            end
            3'b001: begin
                dir = 0;
            end
            3'b010: begin
                dir = 0;
            end
            3'b100: begin
                dir = 1;
            end
            3'b101: begin
                dir = 1;
            end
            3'b110: begin
                dir = 1;
            end
            3'b111: begin
                dir = 1;
            end
            endcase
        end
    endcase
    /* verilator lint_on CASEINCOMPLETE */
end
endmodule
`default_nettype none
module next_state_341717091617866324(
    input [7:0] state_in,
    input s2,
    input s1,
    input s0,
    output [7:0] state_out
);

reg [7:0] next_state;
assign state_out = next_state;

wire [2:0] sym_in;
assign sym_in = {s2, s1, s0};

always @(*) begin
    /* verilator lint_off CASEINCOMPLETE */
    case (state_in)
        8'h01: begin
            case (sym_in)
            3'b000: begin
                next_state = 8'h02;
            end
            3'b001: begin
                next_state = 8'h04;
            end
            3'b010: begin
                next_state = 8'h01;
            end
            3'b100: begin
                next_state = 8'h10;
            end
            3'b101: begin
                next_state = 8'h01;
            end
            3'b110: begin
                next_state = 8'h01;
            end
            3'b111: begin
                next_state = 8'h01;
            end
            endcase
        end
        8'h02: begin
            case (sym_in)
            3'b000: begin
                next_state = 8'h02;
            end
            3'b001: begin
                next_state = 8'h02;
            end
            3'b010: begin
                next_state = 8'h08;
            end
            3'b100: begin
                next_state = 8'h40;
            end
            3'b101: begin
                next_state = 8'h80;
            end
            3'b110: begin
                next_state = 8'h02;
            end
            3'b111: begin
                next_state = 8'h02;
            end
            endcase
        end
        8'h04: begin
            case (sym_in)
            3'b000: begin
                next_state = 8'h04;
            end
            3'b001: begin
                next_state = 8'h04;
            end
            3'b010: begin
                next_state = 8'h02;
            end
            3'b100: begin
                next_state = 8'h40;
            end
            3'b101: begin
                next_state = 8'h80;
            end
            3'b110: begin
                next_state = 8'h04;
            end
            3'b111: begin
                next_state = 8'h04;
            end
            endcase
        end
        8'h08: begin
            case (sym_in)
            3'b000: begin
                next_state = 8'h04;
            end
            3'b001: begin
                next_state = 8'h10;
            end
            3'b010: begin
                next_state = 8'h01;
            end
            3'b100: begin
                next_state = 8'h08;
            end
            3'b101: begin
                next_state = 8'h08;
            end
            3'b110: begin
                next_state = 8'h08;
            end
            3'b111: begin
                next_state = 8'h08;
            end
            endcase
        end
        8'h10: begin
            case (sym_in)
            3'b000: begin
                next_state = 8'h08;
            end
            3'b001: begin
                next_state = 8'h20;
            end
            3'b010: begin
                next_state = 8'h10;
            end
            3'b100: begin
                next_state = 8'h10;
            end
            3'b101: begin
                next_state = 8'h10;
            end
            3'b110: begin
                next_state = 8'h08;
            end
            3'b111: begin
                next_state = 8'h10;
            end
            endcase
        end
        8'h20: begin
            case (sym_in)
            3'b000: begin
                next_state = 8'h20;
            end
            3'b001: begin
                next_state = 8'h20;
            end
            3'b010: begin
                next_state = 8'h20;
            end
            3'b100: begin
                next_state = 8'h02;
            end
            3'b101: begin
                next_state = 8'h02;
            end
            3'b110: begin
                next_state = 8'h20;
            end
            3'b111: begin
                next_state = 8'h40;
            end
            endcase
        end
        8'h40: begin
            case (sym_in)
            3'b000: begin
                next_state = 8'h01;
            end
            3'b001: begin
                next_state = 8'h01;
            end
            3'b010: begin
                next_state = 8'h20;
            end
            3'b100: begin
                next_state = 8'h40;
            end
            3'b101: begin
                next_state = 8'h40;
            end
            3'b110: begin
                next_state = 8'h40;
            end
            3'b111: begin
                next_state = 8'h40;
            end
            endcase
        end
        8'h80: begin
            case (sym_in)
            3'b000: begin
                next_state = 8'h01;
            end
            3'b001: begin
                next_state = 8'h01;
            end
            3'b010: begin
                next_state = 8'h20;
            end
            3'b100: begin
                next_state = 8'h80;
            end
            3'b101: begin
                next_state = 8'h80;
            end
            3'b110: begin
                next_state = 8'h80;
            end
            3'b111: begin
                next_state = 8'h80;
            end
            endcase
        end
    endcase
    /* verilator lint_on CASEINCOMPLETE */
end

endmodule
`default_nettype none
module new_symbol_341717091617866324(
    input [7:0] state_in,
    input s2,
    input s1,
    input s0,
    output z2,
    output z1,
    output z0
);

wire a,b,c,d,e,f,g,h;

wire [2:0] sym_in;
assign sym_in = {s2, s1, s0};

reg [2:0] new_symbol;

always @(*) begin
    new_symbol = 3'b000;
    /* verilator lint_off CASEINCOMPLETE */
    case (state_in)
        8'h01: begin
            case (sym_in)
            3'b000: begin
                new_symbol = 3'b010;
            end
            3'b001: begin
                new_symbol = 3'b010;
            end
            3'b010: begin
                new_symbol = 3'b010;
            end
            3'b100: begin
                new_symbol = 3'b000;
            end
            3'b101: begin
                new_symbol = 3'b001;
            end
            3'b110: begin
                new_symbol = 3'b001;
            end
            3'b111: begin
                new_symbol = 3'b111;
            end
            endcase
        end
        8'h02: begin
            case (sym_in)
            3'b000: begin
                new_symbol = 3'b100;
            end
            3'b001: begin
                new_symbol = 3'b101;
            end
            3'b010: begin
                new_symbol = 3'b100;
            end
            3'b100: begin
                new_symbol = 3'b000;
            end
            3'b101: begin
                new_symbol = 3'b001;
            end
            3'b110: begin
                new_symbol = 3'b110;
            end
            3'b111: begin
                new_symbol = 3'b110;
            end
            endcase
        end
        8'h04: begin
            case (sym_in)
            3'b000: begin
                new_symbol = 3'b100;
            end
            3'b001: begin
                new_symbol = 3'b101;
            end
            3'b010: begin
                new_symbol = 3'b100;
            end
            3'b100: begin
                new_symbol = 3'b100;
            end
            3'b101: begin
                new_symbol = 3'b101;
            end
            3'b110: begin
                new_symbol = 3'b110;
            end
            3'b111: begin
                new_symbol = 3'b110;
            end
            endcase
        end
        8'h08: begin
            case (sym_in)
            3'b000: begin
                new_symbol = 3'b000;
            end
            3'b001: begin
                new_symbol = 3'b101;
            end
            3'b010: begin
                new_symbol = 3'b010;
            end
            3'b100: begin
                new_symbol = 3'b010;
            end
            3'b101: begin
                new_symbol = 3'b101;
            end
            3'b110: begin
                new_symbol = 3'b110;
            end
            3'b111: begin
                new_symbol = 3'b111;
            end
            endcase
        end
        8'h10: begin
            case (sym_in)
            3'b000: begin
                new_symbol = 3'b000;
            end
            3'b001: begin
                new_symbol = 3'b101;
            end
            3'b010: begin
                new_symbol = 3'b100;
            end
            3'b100: begin
                new_symbol = 3'b100;
            end
            3'b101: begin
                new_symbol = 3'b101;
            end
            3'b110: begin
                new_symbol = 3'b111;
            end
            3'b111: begin
                new_symbol = 3'b111;
            end
            endcase
        end
        8'h20: begin
            case (sym_in)
            3'b000: begin
                new_symbol = 3'b100;
            end
            3'b001: begin
                new_symbol = 3'b101;
            end
            3'b010: begin
                new_symbol = 3'b100;
            end
            3'b100: begin
                new_symbol = 3'b000;
            end
            3'b101: begin
                new_symbol = 3'b001;
            end
            3'b110: begin
                new_symbol = 3'b110;
            end
            3'b111: begin
                new_symbol = 3'b110;
            end
            endcase
        end
        8'h40: begin
            case (sym_in)
            3'b000: begin
                new_symbol = 3'b000;
            end
            3'b001: begin
                new_symbol = 3'b001;
            end
            3'b010: begin
                new_symbol = 3'b000;
            end
            3'b100: begin
                new_symbol = 3'b000;
            end
            3'b101: begin
                new_symbol = 3'b001;
            end
            3'b110: begin
                new_symbol = 3'b110;
            end
            3'b111: begin
                new_symbol = 3'b111;
            end
            endcase
        end
        8'h80: begin
            case (sym_in)
            3'b000: begin
                new_symbol = 3'b000;
            end
            3'b001: begin
                new_symbol = 3'b001;
            end
            3'b010: begin
                new_symbol = 3'b001;
            end
            3'b100: begin
                new_symbol = 3'b000;
            end
            3'b101: begin
                new_symbol = 3'b001;
            end
            3'b110: begin
                new_symbol = 3'b110;
            end
            3'b111: begin
                new_symbol = 3'b001;
            end
            endcase
        end
    endcase
    /* verilator lint_on CASEINCOMPLETE */
end

assign z2 = new_symbol[2];
assign z1 = new_symbol[1];
assign z0 = new_symbol[0];

endmodule
module decoder_3to8_341717091617866324(
    input [2:0] in,
    output [7:0] out
);

assign out[0] = (~in[2]) & (~in[1]) & (~in[0]);
assign out[1] = (~in[2]) & (~in[1]) & ( in[0]);
assign out[2] = (~in[2]) & ( in[1]) & (~in[0]);
assign out[3] = (~in[2]) & ( in[1]) & ( in[0]);
assign out[4] = ( in[2]) & (~in[1]) & (~in[0]);
assign out[5] = ( in[2]) & (~in[1]) & ( in[0]);
assign out[6] = ( in[2]) & ( in[1]) & (~in[0]);
assign out[7] = ( in[2]) & ( in[1]) & ( in[0]);

endmodule
module encoder_8to3_341717091617866324(
    input [7:0] in,
    output [2:0] out
);

assign out[0] = in[1] | in[3] | in[5] | in[7];
assign out[1] = in[2] | in[3] | in[6] | in[7];
assign out[2] = in[4] | in[5] | in[6] | in[7];
endmodule
`default_nettype none

module user_module_341717091617866324(
  input [7:0] io_in,
  output [7:0] io_out
);

wire mode;
wire clock;
wire reset;

wire direction;

wire sym_valid;
wire [2:0] sym_in;
wire [2:0] new_sym;

// 1-hot state in & out
wire [7:0] state_in;
wire [7:0] state_out;

// 3-bit dense encoding of state in & out
wire [2:0] encoded_state_in;
wire [2:0] encoded_state_out;

assign mode = io_in[7];
assign clock = io_in[0];
assign reset = (mode == 0) ? 1'b1 : io_in[1];

assign encoded_state_in = (mode == 0) ? io_in[3:1] : 3'b0;
assign io_out[7:5] = encoded_state_out;

assign sym_valid = (mode == 0) ? 1'b0 : io_in[2];
assign sym_in = io_in[6:4];
assign io_out[4:2] = new_sym;

assign io_out[1] = direction;
assign io_out[0] = 1'b0;

utm_core_341717091617866324 core(
    .clock(clock),
    .reset(reset),
    .mode(mode),
    .encoded_state_in(encoded_state_in),
    .sym_in(sym_in),
    .sym_in_valid(sym_valid),
    .new_sym(new_sym),
    .direction(direction),
    .encoded_next_state(encoded_state_out)
);

endmodule
