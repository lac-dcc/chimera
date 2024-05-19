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



module jelly_hdmi_rx_decode
        #(
            parameter DVI_ONLYIN = 0
        )
        (
            input   wire            reset,
            input   wire            clk,
            
            input   wire    [9:0]   in_d,
            
            output  wire            out_de,
            output  wire    [7:0]   out_d,
            output  wire            out_c0,
            output  wire            out_c1,
            
            output  wire            out_ade,
            output  wire    [3:0]   out_terc4
        );
    
    integer             i;
    reg     [9:0]       tmp_d;
    
    // stage 0
    reg     [9:0]       st0_d;
    
    // stage 1
    reg                 st1_c0;
    reg                 st1_c1;
    reg                 st1_de;
    reg     [7:0]       st1_d;
    reg                 st1_video_guard_band_c0;
    reg                 st1_video_guard_band_c1;
    reg                 st1_video_guard_band_c2;
    reg                 st1_data_guard_band_c1;
    reg                 st1_data_guard_band_c2;
    reg                 st1_ade;
    reg     [3:0]       st1_terc4;
    
    reg                 st2_de;
    reg                 st2_c0;
    reg                 st2_c1;
    reg     [7:0]       st2_d;
    reg                 st2_ade;
    reg     [3:0]       st2_terc4;
    
    always @(posedge clk) begin
        if ( reset ) begin
            st0_d                   <= {10{1'bx}};
            
            st1_de                  <= 1'b0;
            st1_c0                  <= 1'b0;
            st1_c1                  <= 1'b0;
            st1_d                   <= {8{1'bx}};
            st1_video_guard_band_c0 <= 1'bx;
            st1_video_guard_band_c1 <= 1'bx;
            st1_video_guard_band_c2 <= 1'bx;
            st1_data_guard_band_c1  <= 1'bx;
            st1_data_guard_band_c2  <= 1'bx;
            st1_ade                 <= 1'b0;
            st1_terc4               <= {4{1'bx}};
            
            st2_de                  <= 1'b0;
            st2_c0                  <= 1'b0;
            st2_c1                  <= 1'b0;
            st2_d                   <= {8{1'bx}};
            st2_ade                 <= 1'b0;
            st2_terc4               <= {4{1'bx}};
        end
        else begin
            // stage 0
            st0_d                   <= in_d;

            
            // stage 1
            st1_de                  <= 1'b0;
            st1_video_guard_band_c0 <= 1'b0;
            st1_video_guard_band_c1 <= 1'b0;
            st1_video_guard_band_c2 <= 1'b0;
            st1_data_guard_band_c1  <= 1'b0;
            st1_data_guard_band_c2  <= 1'b0;
            case ( st0_d )
            10'b1101010100: {st1_c1, st1_c0} <= 2'b00;
            10'b0010101011: {st1_c1, st1_c0} <= 2'b01;
            10'b0101010100: {st1_c1, st1_c0} <= 2'b10;
            10'b1010101011: {st1_c1, st1_c0} <= 2'b11;
            default:        st1_de           <= 1'b1;
            endcase
            
            tmp_d = st0_d;
            if ( tmp_d[9] == 1'b1 ) begin
                tmp_d[7:0] = ~tmp_d[7:0];
            end
            if ( tmp_d[8] == 1'b1 ) begin
                st1_d[0] <= tmp_d[0];
                st1_d[1] <= tmp_d[1] ^ tmp_d[0];
                st1_d[2] <= tmp_d[2] ^ tmp_d[1];
                st1_d[3] <= tmp_d[3] ^ tmp_d[2];
                st1_d[4] <= tmp_d[4] ^ tmp_d[3];
                st1_d[5] <= tmp_d[5] ^ tmp_d[4];
                st1_d[6] <= tmp_d[6] ^ tmp_d[5];
                st1_d[7] <= tmp_d[7] ^ tmp_d[6];
            end
            else begin
                st1_d[0] <= tmp_d[0];
                st1_d[1] <= tmp_d[1] ~^ tmp_d[0];
                st1_d[2] <= tmp_d[2] ~^ tmp_d[1];
                st1_d[3] <= tmp_d[3] ~^ tmp_d[2];
                st1_d[4] <= tmp_d[4] ~^ tmp_d[3];
                st1_d[5] <= tmp_d[5] ~^ tmp_d[4];
                st1_d[6] <= tmp_d[6] ~^ tmp_d[5];
                st1_d[7] <= tmp_d[7] ~^ tmp_d[6];
            end
            
            if ( !DVI_ONLYIN ) begin
                st1_ade <= 1'b0;
                case ( st0_d )
                10'b1011001100: st1_video_guard_band_c0 <= 1'b1;
                10'b0100110011: st1_video_guard_band_c1 <= 1'b1;
                10'b1011001100: st1_video_guard_band_c2 <= 1'b1;
                10'b0100110011: st1_data_guard_band_c1  <= 1'b1;
                10'b0100110011: st1_data_guard_band_c2  <= 1'b1;
                10'b1010011100: {st1_ade, st1_terc4} <= {1'b1, 4'b0000};
                10'b1001100011: {st1_ade, st1_terc4} <= {1'b1, 4'b0001};
                10'b1011100100: {st1_ade, st1_terc4} <= {1'b1, 4'b0010};
                10'b1011100010: {st1_ade, st1_terc4} <= {1'b1, 4'b0011};
                10'b0101110001: {st1_ade, st1_terc4} <= {1'b1, 4'b0100};
                10'b0100011110: {st1_ade, st1_terc4} <= {1'b1, 4'b0101};
                10'b0110001110: {st1_ade, st1_terc4} <= {1'b1, 4'b0110};
                10'b0100111100: {st1_ade, st1_terc4} <= {1'b1, 4'b0111};
                10'b1011001100: {st1_ade, st1_terc4} <= {1'b1, 4'b1000};
                10'b0100111001: {st1_ade, st1_terc4} <= {1'b1, 4'b1001};
                10'b0110011100: {st1_ade, st1_terc4} <= {1'b1, 4'b1010};
                10'b1011000110: {st1_ade, st1_terc4} <= {1'b1, 4'b1011};
                10'b1010001110: {st1_ade, st1_terc4} <= {1'b1, 4'b1100};
                10'b1001110001: {st1_ade, st1_terc4} <= {1'b1, 4'b1101};
                10'b0101100011: {st1_ade, st1_terc4} <= {1'b1, 4'b1110};
                10'b1011000011: {st1_ade, st1_terc4} <= {1'b1, 4'b1111};
                endcase
            end
            else begin
                st1_video_guard_band_c0 <= 1'b0;
                st1_video_guard_band_c1 <= 1'b0;
                st1_video_guard_band_c2 <= 1'b0;
                st1_data_guard_band_c1  <= 1'b0;
                st1_data_guard_band_c2  <= 1'b0;
                {st1_ade, st1_terc4}    <= {1'b0, 4'b0000};
            end
            
            
            // stage2
            st2_c0 <= st1_c0;
            st2_c1 <= st1_c1;
            if ( st1_ade ) begin
                st2_de    <= 1'b0;
                st2_d     <= {8{1'b0}};
                st2_ade   <= 1'b1;
                st2_terc4 <= st1_terc4;
            end
            else begin
                st2_de    <= st1_de;
                st2_d     <= st1_de ? st1_d : {8{1'b0}};
                st2_ade   <= 1'b0;
                st2_terc4 <= {4{1'b0}};
            end
        end
    end
    
    assign out_de    = st2_de;
    assign out_d     = st2_d;
    assign out_c0    = st2_c0;
    assign out_c1    = st2_c1;
    
    assign out_ade   = st2_ade;
    assign out_terc4 = st2_terc4;
    
endmodule


`default_nettype wire


// end of file
