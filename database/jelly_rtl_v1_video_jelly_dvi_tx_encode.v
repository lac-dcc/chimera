// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2015 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



module jelly_dvi_tx_encode
        (
            input   wire            reset,
            input   wire            clk,
            
            input   wire            in_de,
            input   wire    [7:0]   in_d,
            input   wire            in_c0,
            input   wire            in_c1,
            
            output  wire    [9:0]   out_d
        );
    
    // This operator returns the number of "1"s in argument "x"
    function    [4:0]   N1
        (
            input   [7:0]   x
        );
        integer     i;
        begin
            N1 = 0;
            for ( i = 0; i < 8; i = i + 1 ) begin
                N1 = N1 + {2'd0, x[i]};
            end
        end
    endfunction
    
    // This operator returns the number of "0"s in argument "x"
    function    [4:0]   N0
        (
            input   [7:0]   x
        );
        begin
            N0 = N1(~x);
        end
    endfunction
    
    
    // encode xor
    function    [8:0]   encode_xor
        (
            input   [7:0]   d
        );
        begin
            encode_xor[0] = d[0];
            encode_xor[1] = encode_xor[0] ^ d[1];
            encode_xor[2] = encode_xor[1] ^ d[2];
            encode_xor[3] = encode_xor[2] ^ d[3];
            encode_xor[4] = encode_xor[3] ^ d[4];
            encode_xor[5] = encode_xor[4] ^ d[5];
            encode_xor[6] = encode_xor[5] ^ d[6];
            encode_xor[7] = encode_xor[6] ^ d[7];
            encode_xor[8] = 1'b1;
        end
    endfunction
    
    // encode xnor
    function    [8:0]   encode_xnor
        (
            input   [7:0]   d
        );
        begin
            encode_xnor[0] = d[0];
            encode_xnor[1] = encode_xnor[0] ~^ d[1];
            encode_xnor[2] = encode_xnor[1] ~^ d[2];
            encode_xnor[3] = encode_xnor[2] ~^ d[3];
            encode_xnor[4] = encode_xnor[3] ~^ d[4];
            encode_xnor[5] = encode_xnor[4] ~^ d[5];
            encode_xnor[6] = encode_xnor[5] ~^ d[6];
            encode_xnor[7] = encode_xnor[6] ~^ d[7];
            encode_xnor[8] = 1'b0;
        end
    endfunction
    
    
    // stage 0
    wire                    st0_de = in_de;
    wire                    st0_c0 = in_c0;
    wire                    st0_c1 = in_c1;
    wire            [7:0]   st0_d  = in_d;
    
    // stage 1
    reg                     st1_de;
    reg                     st1_c0;
    reg                     st1_c1;
    reg             [7:0]   st1_d;
    reg                     st1_n_d;
    
    // stage 2
    reg                     st2_de;
    reg                     st2_c0;
    reg                     st2_c1;
    reg             [8:0]   st2_q_m;
    
    // stage 3
    reg                     st3_de;
    reg                     st3_c0;
    reg                     st3_c1;
    reg             [8:0]   st3_q_m;
    reg     signed  [4:0]   st3_n;
    
    // stage 3
    reg                     st4_de;
    reg                     st4_c0;
    reg                     st4_c1;
    reg             [9:0]   st4_q_out;
    reg     signed  [4:0]   st4_cnt;
    
    // stage 5
    reg             [9:0]   st5_d;
    
    
    always @(posedge clk) begin
        if ( reset ) begin
            st1_de    <= 1'b0;
            st1_c0    <= 1'b0;
            st1_c1    <= 1'b0;
            st1_d     <= {8{1'bx}};
            st1_n_d   <= 1'bx;
            
            st2_de    <= 1'b0;
            st2_c0    <= 1'b0;
            st2_c1    <= 1'b0;
            st2_q_m   <= {9{1'bx}};
            
            st3_de    <= 1'b0;
            st3_c0    <= 1'b0;
            st3_c1    <= 1'b0;
            st3_q_m   <= {9{1'bx}};
            st3_n     <= {5{1'bx}};
            
            st4_de    <= 1'b0;
            st4_c0    <= 1'b0;
            st4_c1    <= 1'b0;
            st4_q_out <= {10{1'bx}};
            st4_cnt   <= {5{1'bx}};
            
            st5_d     <= 10'b1101010100;
        end
        else begin
            // stage 1 (bit count)
            st1_de  <= st0_de;
            st1_c0  <= st0_c0;
            st1_c1  <= st0_c1;
            st1_d   <= st0_d;
            st1_n_d <= ((N1(st0_d) > 4) || (N1(st0_d) == 4 && st0_d[0] == 0));
            
            // stage2 (encode)
            st2_de  <= st1_de;
            st2_c0  <= st1_c0;
            st2_c1  <= st1_c1;
            st2_q_m <= st1_n_d ? encode_xnor(st1_d) : encode_xor(st1_d);
            
            // stage 3 (bit count)
            st3_de  <= st2_de;
            st3_c0  <= st2_c0;
            st3_c1  <= st2_c1;
            st3_q_m <= st2_q_m;
            st3_n   <= N1(st2_q_m[7:0]) - N0(st2_q_m[7:0]);
            
            // stage 4 (DC balance)
            st4_de  <= st3_de;
            st4_c0  <= st3_c0;
            st4_c1  <= st3_c1;
            if ( (st4_cnt == 0) || (st3_n == 0) ) begin
                st4_q_out[9]   <= ~st3_q_m[8];
                st4_q_out[8]   <= st3_q_m[8];
                st4_q_out[7:0] <= st3_q_m[8] ? st3_q_m[7:0] : ~st3_q_m[7:0];
                st4_cnt  <= st3_q_m[8] ? (st4_cnt + st3_n) : (st4_cnt - st3_n);
            end
            else begin
                if ( ((st4_cnt) > 0 && (st3_n > 0)) || ((st4_cnt < 0) && (st3_n < 0)) ) begin
                    st4_q_out[9]   <= 1'b1;
                    st4_q_out[8]   <= st3_q_m[8];
                    st4_q_out[7:0] <= ~st3_q_m[7:0];
                    st4_cnt <= st4_cnt + {st3_q_m[8], 1'b0} - st3_n;
                end
                else begin
                    st4_q_out[9]   <= 1'b0;
                    st4_q_out[8]   <= st3_q_m[8];
                    st4_q_out[7:0] <= st3_q_m[7:0];
                    st4_cnt <= st4_cnt - {~st3_q_m[8], 1'b0} + st3_n;
                end
            end
            if ( !st3_de ) begin
                st4_cnt <= 0;
            end
            
            // stage 5 (output)
            if ( st4_de ) begin
                st5_d <= st4_q_out;
            end
            else begin
                case ( {st4_c1, st4_c0} )
                2'b00:      st5_d <= 10'b1101010100;
                2'b01:      st5_d <= 10'b0010101011;
                2'b10:      st5_d <= 10'b0101010100;
                2'b11:      st5_d <= 10'b1010101011;
                default:    st5_d <= {10{1'bx}};
                endcase
            end
        end
    end
    
    assign out_d = st5_d;
    
endmodule


`default_nettype wire


// end of file
