// This program was cloned from: https://github.com/sarfrazenator/Sarfraz_TinyTapeout
// License: Apache License 2.0

`default_nettype none

module utm_core_341174563322724948(
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

decoder_3to8_341174563322724948 decode_state_in(
    .in(encoded_state_in),
    .out(state_in)
);

assign state = (mode == 0) ? state_in : stored_state;
assign sym = (mode == 0) ? sym_in : symbuf;

direction_341174563322724948 direction_block(
    .state(state),
    .s2(sym[2]),
    .s1(sym[1]),
    .s0(sym[0]),
    .direction(direction)
);

next_state_341174563322724948 next_state_block(
    .state_in(state),
    .s2(sym[2]),
    .s1(sym[1]),
    .s0(sym[0]),
    .state_out(next_state));

new_symbol_341174563322724948 new_sym_block(
    .state_in(state),
    .s2(sym[2]),
    .s1(sym[1]),
    .s0(sym[0]),
    .z2(new_sym[2]),
    .z1(new_sym[1]),
    .z0(new_sym[0])
);

encoder_8to3_341174563322724948 encode_state_out(
    .in(next_state),
    .out(encoded_next_state)
);

endmodule
`default_nettype none
module direction_341174563322724948(
    input [7:0] state,
    input s2,
    input s1,
    input s0,
    // 0 = left, 1 = right
    output direction
);

wire a,b,c,d,e,f,g,h;

assign a = state[0];
assign b = state[1];
assign c = state[2];
assign d = state[3];
assign e = state[4];
assign f = state[5];
assign g = state[6];
assign h = state[7];

assign direction = ((a | e | f) & s1)
                 | (((a & s0) | b | c | (e & s0) | f | g | h) & s2)
                 | ((d | (e & (~s1) & (~s0))) & (~s2))
                 | (g & (~s1));
endmodule
`default_nettype none
module next_state_341174563322724948(
    input [7:0] state_in,
    input s2,
    input s1,
    input s0,
    output [7:0] state_out
);

wire a,b,c,d,e,f,g,h;

assign a = state_in[0];
assign b = state_in[1];
assign c = state_in[2];
assign d = state_in[3];
assign e = state_in[4];
assign f = state_in[5];
assign g = state_in[6];
assign h = state_in[7];

wire sym_0;
assign sym_0 = (~s2) & (~s1) & (~s0);

// next H
assign state_out[7] = s2 & ((s0 & (b | c)) | h);

// next G
assign state_out[6] = (s2 & ( ((b | c) & (~s0)) | g)) | (f & s1);

// next F
assign state_out[5] = (e & (~s2) & s0) | (f & (~(s2 | s1))) | (s1 & (g | h));

// next E
assign state_out[4] = (a & s2 & (~s0)) | (d & (~s2) & s0) | (e & (s1 | (s2 & s0)));

// next D
assign state_out[3] = (b & s1) | (d & s2) | (e & (~s1) & (~s0));

// next C
assign state_out[2] = (a & (~s2) & s0) | (c & (~(s2 | s1))) | (d & sym_0);

// next B
assign state_out[1] = (a & sym_0) | (b & (~(s2 | s1))) | (c & s1) | (f & s2);

// next A
assign state_out[0] = (a & (s1 | (s2 & s0))) | (d & s1) | ((g | h) & (~(s2 | s1)));

endmodule
`default_nettype none
module new_symbol_341174563322724948(
    input [7:0] state_in,
    input s2,
    input s1,
    input s0,
    output z2,
    output z1,
    output z0
);

wire a,b,c,d,e,f,g,h;

assign a = state_in[0];
assign b = state_in[1];
assign c = state_in[2];
assign d = state_in[3];
assign e = state_in[4];
assign f = state_in[5];
assign g = state_in[6];
assign h = state_in[7];

assign z2 = ((~s2) & b) | (d & s0) | c | (e & (s0 | s1)) | (f & (~(s2 | s1)));
assign z1 = (a & (~s2)) | (d & (s2 | s1) & (~s0)) | (e & s2 & (~s0));
assign z0 = (s0 & ((a & s2) | (~a))) | (h & s1);

endmodule
module decoder_3to8_341174563322724948(
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
module encoder_8to3_341174563322724948(
    input [7:0] in,
    output [2:0] out
);

assign out[0] = in[1] | in[3] | in[5] | in[7];
assign out[1] = in[2] | in[3] | in[6] | in[7];
assign out[2] = in[4] | in[5] | in[6] | in[7];
endmodule
`default_nettype none

module user_module_341174563322724948(
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

utm_core_341174563322724948 core(
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
