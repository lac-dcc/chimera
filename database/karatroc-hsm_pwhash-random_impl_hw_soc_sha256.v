// This program was cloned from: https://github.com/katherinezhao02/karatroc-hsm
// License: MIT License

module sha256(
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

parameter SHA256_H0_0 = 32'h6a09e667;
parameter SHA256_H0_1 = 32'hbb67ae85;
parameter SHA256_H0_2 = 32'h3c6ef372;
parameter SHA256_H0_3 = 32'ha54ff53a;
parameter SHA256_H0_4 = 32'h510e527f;
parameter SHA256_H0_5 = 32'h9b05688c;
parameter SHA256_H0_6 = 32'h1f83d9ab;
parameter SHA256_H0_7 = 32'h5be0cd19;

reg [31:0] k[63:0];
initial begin
    k[00] = 32'h428a2f98;
    k[01] = 32'h71374491;
    k[02] = 32'hb5c0fbcf;
    k[03] = 32'he9b5dba5;
    k[04] = 32'h3956c25b;
    k[05] = 32'h59f111f1;
    k[06] = 32'h923f82a4;
    k[07] = 32'hab1c5ed5;
    k[08] = 32'hd807aa98;
    k[09] = 32'h12835b01;
    k[10] = 32'h243185be;
    k[11] = 32'h550c7dc3;
    k[12] = 32'h72be5d74;
    k[13] = 32'h80deb1fe;
    k[14] = 32'h9bdc06a7;
    k[15] = 32'hc19bf174;
    k[16] = 32'he49b69c1;
    k[17] = 32'hefbe4786;
    k[18] = 32'h0fc19dc6;
    k[19] = 32'h240ca1cc;
    k[20] = 32'h2de92c6f;
    k[21] = 32'h4a7484aa;
    k[22] = 32'h5cb0a9dc;
    k[23] = 32'h76f988da;
    k[24] = 32'h983e5152;
    k[25] = 32'ha831c66d;
    k[26] = 32'hb00327c8;
    k[27] = 32'hbf597fc7;
    k[28] = 32'hc6e00bf3;
    k[29] = 32'hd5a79147;
    k[30] = 32'h06ca6351;
    k[31] = 32'h14292967;
    k[32] = 32'h27b70a85;
    k[33] = 32'h2e1b2138;
    k[34] = 32'h4d2c6dfc;
    k[35] = 32'h53380d13;
    k[36] = 32'h650a7354;
    k[37] = 32'h766a0abb;
    k[38] = 32'h81c2c92e;
    k[39] = 32'h92722c85;
    k[40] = 32'ha2bfe8a1;
    k[41] = 32'ha81a664b;
    k[42] = 32'hc24b8b70;
    k[43] = 32'hc76c51a3;
    k[44] = 32'hd192e819;
    k[45] = 32'hd6990624;
    k[46] = 32'hf40e3585;
    k[47] = 32'h106aa070;
    k[48] = 32'h19a4c116;
    k[49] = 32'h1e376c08;
    k[50] = 32'h2748774c;
    k[51] = 32'h34b0bcb5;
    k[52] = 32'h391c0cb3;
    k[53] = 32'h4ed8aa4a;
    k[54] = 32'h5b9cca4f;
    k[55] = 32'h682e6ff3;
    k[56] = 32'h748f82ee;
    k[57] = 32'h78a5636f;
    k[58] = 32'h84c87814;
    k[59] = 32'h8cc70208;
    k[60] = 32'h90befffa;
    k[61] = 32'ha4506ceb;
    k[62] = 32'hbef9a3f7;
    k[63] = 32'hc67178f2;
end

// Registers

reg [1:0] state;
reg [1:0] state_new;
reg [31:0] w_mem [0:15]; // doubles as location where blocks are written
reg [3:0] w_waddr;
reg w_wen;
reg [31:0] w_wdata;
reg w15_wen;
reg [31:0] w15_wdata;
reg [5:0] t;
reg [5:0] t_new;
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
reg [31:0] h5;
reg [31:0] h5_new;
reg [31:0] h6;
reg [31:0] h6_new;
reg [31:0] h7;
reg [31:0] h7_new;
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
reg [31:0] f;
reg [31:0] f_new;
reg [31:0] g;
reg [31:0] g_new;
reg [31:0] h;
reg [31:0] h_new;
reg a_h_wen;
reg [31:0] t1;
reg [31:0] t2;

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
            h5 <= h5_new;
            h6 <= h6_new;
            h7 <= h7_new;
        end
        if (a_h_wen) begin
            a <= a_new;
            b <= b_new;
            c <= c_new;
            d <= d_new;
            e <= e_new;
            f <= f_new;
            g <= g_new;
            h <= h_new;
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
    (address == ADDR_DIGEST0 + 5) ? h5 :
    (address == ADDR_DIGEST0 + 6) ? h6 :
    (address == ADDR_DIGEST0 + 7) ? h7 :
    32'h0;

// Logic

always @* begin
    w15_wen = 0;
    w15_wdata = 32'h0;
    w_wen = 0;
    w_waddr = 4'h0;
    w_wdata = 32'h0;
    h_wen = 0;
    a_h_wen = 0;
    state_new = state;
    t_new = t;
    h0_new = h0;
    h1_new = h1;
    h2_new = h2;
    h3_new = h3;
    h4_new = h4;
    h5_new = h5;
    h6_new = h6;
    h7_new = h7;
    a_new = a;
    b_new = b;
    c_new = c;
    d_new = d;
    e_new = e;
    f_new = f;
    g_new = g;
    h_new = h;
    t1 = 32'h0;
    t2 = 32'h0;

    case (state)
        STATE_IDLE: begin
            if (cs && we) begin
                if (address == ADDR_CTRL) begin
                    if (write_data[CTRL_INIT_BIT] || write_data[CTRL_NEXT_BIT]) begin
                        state_new = STATE_ROUNDS;
                        t_new = 6'h0;
                        if (write_data[CTRL_INIT_BIT]) begin
                            h0_new = SHA256_H0_0;
                            h1_new = SHA256_H0_1;
                            h2_new = SHA256_H0_2;
                            h3_new = SHA256_H0_3;
                            h4_new = SHA256_H0_4;
                            h5_new = SHA256_H0_5;
                            h6_new = SHA256_H0_6;
                            h7_new = SHA256_H0_7;
                            h_wen = 1;
                            a_new = SHA256_H0_0;
                            b_new = SHA256_H0_1;
                            c_new = SHA256_H0_2;
                            d_new = SHA256_H0_3;
                            e_new = SHA256_H0_4;
                            f_new = SHA256_H0_5;
                            g_new = SHA256_H0_6;
                            h_new = SHA256_H0_7;
                            a_h_wen = 1;
                        end else begin
                            a_new = h0;
                            b_new = h1;
                            c_new = h2;
                            d_new = h3;
                            e_new = h4;
                            f_new = h5;
                            g_new = h6;
                            h_new = h7;
                            a_h_wen = 1;
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
            w15_wdata = sig1(w_mem[14]) + w_mem[9] + sig0(w_mem[1]) + w_mem[0];
            w15_wen = 1;

            // counter
            if (t == 6'd63) begin
                state_new = STATE_DONE;
            end
            t_new = t + 1;

            // round function
            t1 = h + sum1(e) + ch(e, f, g) + k[t] + w_mem[0];
            t2 = sum0(a) + maj(a, b, c);
            h_new = g;
            g_new = f;
            f_new = e;
            e_new = d + t1;
            d_new = c;
            c_new = b;
            b_new = a;
            a_new = t1 + t2;
            a_h_wen = 1;
        end
        STATE_DONE: begin
            h_wen = 1;
            h0_new = h0 + a;
            h1_new = h1 + b;
            h2_new = h2 + c;
            h3_new = h3 + d;
            h4_new = h4 + e;
            h5_new = h5 + f;
            h6_new = h6 + g;
            h7_new = h7 + h;
            state_new = STATE_IDLE;
        end
        2'b11: begin
            // unreachable
        end
    endcase
end

function [31:0] ch(input [31:0] x, input [31:0] y, input [31:0] z);
    ch = (x & y) ^ ((~x) & z);
endfunction

function [31:0] maj(input [31:0] x, input [31:0] y, input [31:0] z);
    maj = (x & y) ^ (x & z) ^ (y & z);
endfunction

function [31:0] sum0(input [31:0] x);
    sum0 = {x[1:0], x[31:2]} ^ {x[12:0], x[31:13]} ^ {x[21:0], x[31:22]};
endfunction

function [31:0] sum1(input [31:0] x);
    sum1 = {x[5:0], x[31:6]} ^ {x[10:0], x[31:11]} ^ {x[24:0], x[31:25]};
endfunction

function [31:0] sig0(input [31:0] x);
    sig0 = {x[6:0], x[31:7]} ^ {x[17:0], x[31:18]} ^ {3'h0, x[31:3]};
endfunction

function [31:0] sig1(input [31:0] x);
    sig1 = {x[16:0], x[31:17]} ^ {x[18:0], x[31:19]} ^ {10'h0, x[31:10]};
endfunction

endmodule
