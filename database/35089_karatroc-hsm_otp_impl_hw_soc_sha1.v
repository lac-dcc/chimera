// This program was cloned from: https://github.com/katherinezhao02/karatroc-hsm
// License: MIT License

module sha1(
    input clk,
    input reset_n,
    input cs,
    input we,
    input [7:0] address,
    input [31:0] write_data,
    output [31:0] read_data
);

// Constants

localparam ADDR_CTRL        = 8'h08;
localparam CTRL_INIT_BIT    = 0;
localparam CTRL_NEXT_BIT    = 1;

localparam ADDR_STATUS      = 8'h09;
localparam STATUS_READY_BIT = 0;

localparam ADDR_BLOCK0    = 8'h10;
localparam ADDR_BLOCK15   = 8'h1f;

localparam ADDR_DIGEST0   = 8'h20;

localparam STATE_IDLE = 2'b00;
localparam STATE_ROUNDS = 2'b01;
localparam STATE_DONE = 2'b10;

parameter SHA1_H0_0 = 32'h67452301;
parameter SHA1_H0_1 = 32'hefcdab89;
parameter SHA1_H0_2 = 32'h98badcfe;
parameter SHA1_H0_3 = 32'h10325476;
parameter SHA1_H0_4 = 32'hc3d2e1f0;

// Registers

reg [1:0] state;
reg [1:0] state_new;
reg [31:0] w_mem [0:15]; // doubles as location where blocks are written
reg [3:0] w_waddr;
reg w_wen;
reg [31:0] w_wdata;
reg w15_wen;
reg [31:0] w15_wdata;
reg [6:0] t;
reg [6:0] t_new;
reg [31:0] h0;
reg [31:0] h0_new;
reg [31:0] h1;
reg [31:0] h1_new;
reg [31:0] h2;
reg [31:0] h2_new;
reg [31:0] h3;
reg [31:0] h3_new;
reg [31:0] h4;
reg [31:0] h4_new;
reg h_wen;
reg [31:0] a;
reg [31:0] a_new;
reg [31:0] b;
reg [31:0] b_new;
reg [31:0] c;
reg [31:0] c_new;
reg [31:0] d;
reg [31:0] d_new;
reg [31:0] e;
reg [31:0] e_new;
reg a_e_wen;
reg [31:0] T;

// Register update

always @(posedge clk) begin
    if (!reset_n) begin
        state <= STATE_IDLE;
    end else begin
        state <= state_new;
        t <= t_new;
        if (w15_wen) begin
            w_mem[0] <= w_mem[1];
            w_mem[1] <= w_mem[2];
            w_mem[2] <= w_mem[3];
            w_mem[3] <= w_mem[4];
            w_mem[4] <= w_mem[5];
            w_mem[5] <= w_mem[6];
            w_mem[6] <= w_mem[7];
            w_mem[7] <= w_mem[8];
            w_mem[8] <= w_mem[9];
            w_mem[9] <= w_mem[10];
            w_mem[10] <= w_mem[11];
            w_mem[11] <= w_mem[12];
            w_mem[12] <= w_mem[13];
            w_mem[13] <= w_mem[14];
            w_mem[14] <= w_mem[15];
            w_mem[15] <= w15_wdata;
        end
        if (w_wen) begin
            w_mem[w_waddr] <= w_wdata;
        end
        if (h_wen) begin
            h0 <= h0_new;
            h1 <= h1_new;
            h2 <= h2_new;
            h3 <= h3_new;
            h4 <= h4_new;
        end
        if (a_e_wen) begin
            a <= a_new;
            b <= b_new;
            c <= c_new;
            d <= d_new;
            e <= e_new;
        end
    end
end

// Continuous assignment

assign read_data =
    (address == ADDR_STATUS) ? {31'h0, state == STATE_IDLE} :
    (address == ADDR_DIGEST0 + 0) ? h0 :
    (address == ADDR_DIGEST0 + 1) ? h1 :
    (address == ADDR_DIGEST0 + 2) ? h2 :
    (address == ADDR_DIGEST0 + 3) ? h3 :
    (address == ADDR_DIGEST0 + 4) ? h4 :
    32'h0;

// Logic

always @* begin
    w15_wen = 0;
    w15_wdata = 32'h0;
    w_wen = 0;
    w_waddr = 4'h0;
    w_wdata = 32'h0;
    h_wen = 0;
    a_e_wen = 0;
    state_new = state;
    t_new = t;
    h0_new = h0;
    h1_new = h1;
    h2_new = h2;
    h3_new = h3;
    h4_new = h4;
    a_new = a;
    b_new = b;
    c_new = c;
    d_new = d;
    e_new = e;
    T = 32'h0;

    case (state)
        STATE_IDLE: begin
            if (cs && we) begin
                if (address == ADDR_CTRL) begin
                    if (write_data[CTRL_INIT_BIT] || write_data[CTRL_NEXT_BIT]) begin
                        state_new = STATE_ROUNDS;
                        t_new = 7'h0;
                        if (write_data[CTRL_INIT_BIT]) begin
                            h0_new = SHA1_H0_0;
                            h1_new = SHA1_H0_1;
                            h2_new = SHA1_H0_2;
                            h3_new = SHA1_H0_3;
                            h4_new = SHA1_H0_4;
                            h_wen = 1;
                            a_new = SHA1_H0_0;
                            b_new = SHA1_H0_1;
                            c_new = SHA1_H0_2;
                            d_new = SHA1_H0_3;
                            e_new = SHA1_H0_4;
                            a_e_wen = 1;
                        end else begin
                            a_new = h0;
                            b_new = h1;
                            c_new = h2;
                            d_new = h3;
                            e_new = h4;
                            a_e_wen = 1;
                        end
                    end
                end else if (ADDR_BLOCK0 <= address && address <= ADDR_BLOCK15) begin
                    w_waddr = address[3:0];
                    w_wdata = write_data;
                    w_wen = 1;
                end
            end
        end
        STATE_ROUNDS: begin
            // message schedule
            w15_wdata = rotl1(w_mem[13] ^ w_mem[8] ^ w_mem[2] ^ w_mem[0]);
            w15_wen = 1;

            // counter
            if (t == 7'd79) begin
                state_new = STATE_DONE;
            end
            t_new = t + 1;

            // round function
            T = rotl5(a) + f(t, b, c, d) + e + k(t) + w_mem[0];
            e_new = d;
            d_new = c;
            c_new = rotl30(b);
            b_new = a;
            a_new = T;
            a_e_wen = 1;
        end
        STATE_DONE: begin
            h_wen = 1;
            h0_new = h0 + a;
            h1_new = h1 + b;
            h2_new = h2 + c;
            h3_new = h3 + d;
            h4_new = h4 + e;
            state_new = STATE_IDLE;
        end
        2'b11: begin
            // unreachable
        end
    endcase
end

function [31:0] k(input [6:0] t);
    k = (t <= 7'd19) ? 32'h5a827999 :
        (t <= 7'd39) ? 32'h6ed9eba1 :
        (t <= 7'd59) ? 32'h8f1bbcdc :
        32'hca62c1d6;
endfunction

function [31:0] ch(input [31:0] x, input [31:0] y, input [31:0] z);
    ch = (x & y) ^ ((~x) & z);
endfunction

function [31:0] parity(input [31:0] x, input [31:0] y, input [31:0] z);
    parity = x ^ y ^ z;
endfunction

function [31:0] maj(input [31:0] x, input [31:0] y, input [31:0] z);
    maj = (x & y) ^ (x & z) ^ (y & z);
endfunction

function [31:0] f(input [6:0] t, input [31:0] x, input [31:0] y, input [31:0] z);
    f = (t <= 7'd19) ? ch(x, y, z) :
        (t <= 7'd39) ? parity(x, y, z) :
        (t <= 7'd59) ? maj(x, y, z) :
        parity(x, y, z);
endfunction

function [31:0] rotl1(input [31:0] x);
    rotl1 = {x[30:0], x[31]};
endfunction

function [31:0] rotl5(input [31:0] x);
    rotl5 = {x[26:0], x[31:27]};
endfunction

function [31:0] rotl30(input [31:0] x);
    rotl30 = {x[1:0], x[31:2]};
endfunction

endmodule
