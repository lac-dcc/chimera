// This program was cloned from: https://github.com/Asiadav/OpenPBKDF2
// License: MIT License

/**
*SHA256 encryption module
**/

function [31:0] S0(input [31:0] x);
	begin
		S0 = {x[1:0], x[31:2]} ^ {x[12:0], x[31:13]} ^ {x[21:0], x[31:22]};
	end
endfunction

function [31:0] S1(input [31:0] x);
	begin
		S1 = {x[5:0], x[31:6]} ^ {x[10:0], x[31:11]} ^ {x[24:0], x[31:25]};
	end
endfunction

function [31:0] s0(input [31:0] x);
	begin
		s0 = {x[6:0], x[31:7]} ^ {x[17:0], x[31:18]} ^ {3'b0, x[31:3]};
	end
endfunction

function [31:0] s1(input [31:0] x);
	begin
		s1 = {x[16:0], x[31:17]} ^ {x[18:0], x[31:19]} ^ {10'b0, x[31:10]};
	end
endfunction

function [31:0] message(input [31:0] sixteen, input [31:0] fifteen, input [31:0] seven, input [31:0] two);
	begin
		message = sixteen + s0(fifteen) + seven + s1(two);
	end
endfunction

typedef struct {
    logic [31:0] a;
    logic [31:0] b;
    logic [31:0] c;
    logic [31:0] d;
    logic [31:0] e;
    logic [31:0] f;
    logic [31:0] g;
    logic [31:0] h;
} stage;

module sha256_stage(
    input stage in_stage,
    output stage out_stage,
    input [31:0] w,
    input [31:0] k
);

    logic [0:31] ch, temp1, maj, temp2;
	assign ch = ((in_stage.e & in_stage.f) ^ ((~in_stage.e) & in_stage.g));
	assign temp1 = (in_stage.h + S1(in_stage.e)) + ch + (k + w);
	assign maj = ((in_stage.a & in_stage.b) ^ (in_stage.a & in_stage.c) ^ (in_stage.b & in_stage.c));
	assign temp2 = S0(in_stage.a) + maj;

    assign out_stage.h = in_stage.g;
    assign out_stage.g = in_stage.f;
    assign out_stage.f = in_stage.e;
    assign out_stage.e = in_stage.d + temp1;
    assign out_stage.d = in_stage.c;
    assign out_stage.c = in_stage.b;
    assign out_stage.b = in_stage.a;
    assign out_stage.a = temp1 + temp2;
endmodule

module sha256 (
     input logic clk_i
    ,input logic rst_i
  
    ,input logic in_valid
    ,input [511:0] in
    ,input logic new_hash
    ,output logic in_ready

    ,output logic out_valid
    ,output logic [255:0] out
    ,input logic out_ready);


    localparam H0_INITIAL = 32'h6a09e667;
	localparam H1_INITIAL = 32'hbb67ae85;
	localparam H2_INITIAL = 32'h3c6ef372;
	localparam H3_INITIAL = 32'ha54ff53a;
	localparam H4_INITIAL = 32'h510e527f;
	localparam H5_INITIAL = 32'h9b05688c;
	localparam H6_INITIAL = 32'h1f83d9ab;
	localparam H7_INITIAL = 32'h5be0cd19;

    enum {WAITING, RUNNING, FINISHED} state;

    logic [31:0] K;
	logic [31:0] H [0: 7], H_next [0: 7]; // 8 H values
	logic [31:0] W_history [0:15], W, W_next; // 64 W values
    logic [6:0] cycle; // 0 - 64; 0-63 are message scheduling, 1-64 are compression

    logic [511: 0] saved_in;
    logic saved_new;

	always_ff @(posedge clk_i) begin
		if (rst_i) begin
            in_ready <= 0;
            out_valid <= 0;
            state <= WAITING;

			H[0] <= H0_INITIAL;
			H[1] <= H1_INITIAL;
			H[2] <= H2_INITIAL;
			H[3] <= H3_INITIAL;
			H[4] <= H4_INITIAL;
			H[5] <= H5_INITIAL;
			H[6] <= H6_INITIAL;
			H[7] <= H7_INITIAL;
		end else begin
            // $display("state: %d", state);
			if (state == WAITING) begin
                in_ready <= 1;
                if (in_valid) begin
                    saved_in <= in;
                    saved_new <= new_hash;

                    if (new_hash) begin
                        H[0] <= H0_INITIAL;
                        H[1] <= H1_INITIAL;
                        H[2] <= H2_INITIAL;
                        H[3] <= H3_INITIAL;
                        H[4] <= H4_INITIAL;
                        H[5] <= H5_INITIAL;
                        H[6] <= H6_INITIAL;
                        H[7] <= H7_INITIAL;
                    end

                    state <= RUNNING;
                end
            end else if (state == RUNNING) begin
                in_ready <= 0;
                if (cycle == 64) begin
                    out <= {H_next[0], H_next[1], H_next[2], H_next[3], H_next[4], H_next[5], H_next[6], H_next[7]};
                    
                    H <= H_next;
                    out_valid <= 1;
                    state <= FINISHED;
                end else begin
                    out <= out;
                    out_valid <= 0;
                end

                W_history[15] <= W_history[14];
                W_history[14] <= W_history[13];
                W_history[13] <= W_history[12];
                W_history[12] <= W_history[11];
                W_history[11] <= W_history[10];
                W_history[10] <= W_history[ 9];
                W_history[ 9] <= W_history[ 8];
                W_history[ 8] <= W_history[ 7];
                W_history[ 7] <= W_history[ 6];
                W_history[ 6] <= W_history[ 5];
                W_history[ 5] <= W_history[ 4];
                W_history[ 4] <= W_history[ 3];
                W_history[ 3] <= W_history[ 2];
                W_history[ 2] <= W_history[ 1];
                W_history[ 1] <= W_history[ 0];
                W_history[ 0] <= W_next;
                W <= W_next;

            end else if (state == FINISHED) begin
                //$display("Out: %64h", out);
                if (out_ready == 1) begin
                    out_valid <= 0;
                    state <= WAITING;
                end
            end
		end
	end

	always_ff @(posedge clk_i) begin
		if (rst_i || state != RUNNING) cycle <= 0;
		else cycle <= cycle + 6'b1;
	end

    stage in_stage, out_stage;

    sha256_stage sha_stage
    (
        .in_stage,
        .out_stage,
        .w(W),
        .k(K)
    );

	always_ff @(posedge clk_i) begin
		if (rst_i) begin
			in_stage.a <= H0_INITIAL;
			in_stage.b <= H1_INITIAL;
			in_stage.c <= H2_INITIAL;
			in_stage.d <= H3_INITIAL;
			in_stage.e <= H4_INITIAL;
			in_stage.f <= H5_INITIAL;
			in_stage.g <= H6_INITIAL;
			in_stage.h <= H7_INITIAL;
		end else begin
			if (state == RUNNING) begin
				if (cycle == 0) begin
					in_stage.a <= saved_new ? H0_INITIAL : H[0];
					in_stage.b <= saved_new ? H1_INITIAL : H[1];
					in_stage.c <= saved_new ? H2_INITIAL : H[2];
					in_stage.d <= saved_new ? H3_INITIAL : H[3];
					in_stage.e <= saved_new ? H4_INITIAL : H[4];
					in_stage.f <= saved_new ? H5_INITIAL : H[5];
					in_stage.g <= saved_new ? H6_INITIAL : H[6];
					in_stage.h <= saved_new ? H7_INITIAL : H[7];
				end else begin
					in_stage.a <= out_stage.a;
					in_stage.b <= out_stage.b;
					in_stage.c <= out_stage.c;
					in_stage.d <= out_stage.d;
					in_stage.e <= out_stage.e;
					in_stage.f <= out_stage.f;
					in_stage.g <= out_stage.g;
					in_stage.h <= out_stage.h;
				end
				// if (cycle >= 1) begin
					// $display("Cycle %d", cycle);
					// $display("a  %32b", in_stage.a);
					// $display("b  %32b", in_stage.b);
					// $display("c  %32b", in_stage.c);
					// $display("d  %32b", in_stage.d);
					// $display("e  %32b", in_stage.e);
					// $display("f  %32b", in_stage.f);
					// $display("g  %32b", in_stage.g);
					// $display("h  %32b", in_stage.h);
                    // $display();
				// end
			end
		end
	end

    always_comb begin
        case(cycle)
            0:  W_next  = saved_in[8 * 4 * 15 + 8 * 0 +:32];
            1:  W_next  = saved_in[8 * 4 * 14 + 8 * 0 +:32];
            2:  W_next  = saved_in[8 * 4 * 13 + 8 * 0 +:32];
            3:  W_next  = saved_in[8 * 4 * 12 + 8 * 0 +:32];
            4:  W_next  = saved_in[8 * 4 * 11 + 8 * 0 +:32];
            5:  W_next  = saved_in[8 * 4 * 10 + 8 * 0 +:32];
            6:  W_next  = saved_in[8 * 4 *  9 + 8 * 0 +:32];
            7:  W_next  = saved_in[8 * 4 *  8 + 8 * 0 +:32];
            8:  W_next  = saved_in[8 * 4 *  7 + 8 * 0 +:32];
            9:  W_next  = saved_in[8 * 4 *  6 + 8 * 0 +:32];
            10: W_next  = saved_in[8 * 4 *  5 + 8 * 0 +:32];
            11: W_next  = saved_in[8 * 4 *  4 + 8 * 0 +:32];
            12: W_next  = saved_in[8 * 4 *  3 + 8 * 0 +:32];
            13: W_next  = saved_in[8 * 4 *  2 + 8 * 0 +:32];
            14: W_next  = saved_in[8 * 4 *  1 + 8 * 0 +:32];
            15: W_next  = saved_in[8 * 4 *  0 + 8 * 0 +:32];
            default: W_next =  (W_history[4'd15] + s0(W_history[4'd14])) + (W_history[4'd06] + s1(W_history[4'd01]));
        endcase

        case(cycle)
            default: K = 32'b0;
            01: K = 32'h428a2f98;
            02: K = 32'h71374491;
            03: K = 32'hb5c0fbcf;
            04: K = 32'he9b5dba5;
            05: K = 32'h3956c25b;
            06: K = 32'h59f111f1;
            07: K = 32'h923f82a4;
            08: K = 32'hab1c5ed5;
            09: K = 32'hd807aa98;
            10: K = 32'h12835b01;
            11: K = 32'h243185be;
            12: K = 32'h550c7dc3;
            13: K = 32'h72be5d74;
            14: K = 32'h80deb1fe;
            15: K = 32'h9bdc06a7;
            16: K = 32'hc19bf174;
            17: K = 32'he49b69c1;
            18: K = 32'hefbe4786;
            19: K = 32'h0fc19dc6;
            20: K = 32'h240ca1cc;
            21: K = 32'h2de92c6f;
            22: K = 32'h4a7484aa;
            23: K = 32'h5cb0a9dc;
            24: K = 32'h76f988da;
            25: K = 32'h983e5152;
            26: K = 32'ha831c66d;
            27: K = 32'hb00327c8;
            28: K = 32'hbf597fc7;
            29: K = 32'hc6e00bf3;
            30: K = 32'hd5a79147;
            31: K = 32'h06ca6351;
            32: K = 32'h14292967;
            33: K = 32'h27b70a85;
            34: K = 32'h2e1b2138;
            35: K = 32'h4d2c6dfc;
            36: K = 32'h53380d13;
            37: K = 32'h650a7354;
            38: K = 32'h766a0abb;
            39: K = 32'h81c2c92e;
            40: K = 32'h92722c85;
            41: K = 32'ha2bfe8a1;
            42: K = 32'ha81a664b;
            43: K = 32'hc24b8b70;
            44: K = 32'hc76c51a3;
            45: K = 32'hd192e819;
            46: K = 32'hd6990624;
            47: K = 32'hf40e3585;
            48: K = 32'h106aa070;
            49: K = 32'h19a4c116;
            50: K = 32'h1e376c08;
            51: K = 32'h2748774c;
            52: K = 32'h34b0bcb5;
            53: K = 32'h391c0cb3;
            54: K = 32'h4ed8aa4a;
            55: K = 32'h5b9cca4f;
            56: K = 32'h682e6ff3;
            57: K = 32'h748f82ee;
            58: K = 32'h78a5636f;
            59: K = 32'h84c87814;
            60: K = 32'h8cc70208;
            61: K = 32'h90befffa;
            62: K = 32'ha4506ceb;
            63: K = 32'hbef9a3f7;
            64: K = 32'hc67178f2;
        endcase
    end

    assign H_next[0] = H[0] + out_stage.a;
    assign H_next[1] = H[1] + out_stage.b;
    assign H_next[2] = H[2] + out_stage.c;
    assign H_next[3] = H[3] + out_stage.d;
    assign H_next[4] = H[4] + out_stage.e;
    assign H_next[5] = H[5] + out_stage.f;
    assign H_next[6] = H[6] + out_stage.g;
    assign H_next[7] = H[7] + out_stage.h;
endmodule
