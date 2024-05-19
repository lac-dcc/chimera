// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

`include "config.vh"

// LUTs pre-generated with gen_luts.sh
`include "luts.vh"

module lut
# (
    parameter y_width = 16
)
(
    input            [2:0] octave,
    input            [3:0] note,
    input            [7:0] x,       // Current sample
    output           [7:0] x_max,   // Last sample in a period
    output [y_width - 1:0] y
);

    wire   [y_width - 1:0] lut_y [11:0];
    wire             [7:0] lut_x;
    wire             [7:0] lut_x_max [11:0];

    assign lut_x = x << octave;
    assign x_max = (note < 8'd12) ? (lut_x_max [note] >> octave) : 8'b0;
    assign y = (note < 8'd12) ? (lut_y [note]) : 8'b0;

    lut_C  lut_C  ( .x(lut_x), .y(lut_y [0] ), .x_max(lut_x_max [0] ));
    lut_Cs lut_Cs ( .x(lut_x), .y(lut_y [1] ), .x_max(lut_x_max [1] ));
    lut_D  lut_D  ( .x(lut_x), .y(lut_y [2] ), .x_max(lut_x_max [2] ));
    lut_Ds lut_Ds ( .x(lut_x), .y(lut_y [3] ), .x_max(lut_x_max [3] ));
    lut_E  lut_E  ( .x(lut_x), .y(lut_y [4] ), .x_max(lut_x_max [4] ));
    lut_F  lut_F  ( .x(lut_x), .y(lut_y [5] ), .x_max(lut_x_max [5] ));
    lut_Fs lut_Fs ( .x(lut_x), .y(lut_y [6] ), .x_max(lut_x_max [6] ));
    lut_G  lut_G  ( .x(lut_x), .y(lut_y [7] ), .x_max(lut_x_max [7] ));
    lut_Gs lut_Gs ( .x(lut_x), .y(lut_y [8] ), .x_max(lut_x_max [8] ));
    lut_A  lut_A  ( .x(lut_x), .y(lut_y [9] ), .x_max(lut_x_max [9] ));
    lut_As lut_As ( .x(lut_x), .y(lut_y [10]), .x_max(lut_x_max [10]));
    lut_B  lut_B  ( .x(lut_x), .y(lut_y [11]), .x_max(lut_x_max [11]));

endmodule

module i2s
(
    input       clk,    // CLK - 50 MHz
    input       reset,
    input [2:0] octave,
    input [3:0] note,
    output      mclk,   // MCLK - 12.5 MHz
    output      bclk,   // BCLK - 3.125 MHz serial clock - for a 48 KHz Sample Rate
    output      lrclk,  // LRCLK - 32-bit L, 32-bit R
    output      sdata
);

    reg   [9:0] clk_div;
    reg  [31:0] shift;
    reg   [7:0] cnt;
    wire [15:0] value;
    wire  [7:0] cnt_max;
    wire [15:0] lut_y;

    always @ (posedge clk or posedge reset)
        if (reset)
            clk_div <= 0;
        else
            clk_div <= clk_div + 10'b1;

    assign mclk  = clk_div [1];
    assign bclk  = clk_div [3];
    assign lrclk = clk_div [9];

    always @ (posedge clk or posedge reset)
        if (reset)
            cnt <= 0;
        else if (clk_div [9:0] == 10'b11_1111_1111)
            cnt <= (cnt == cnt_max) ? 8'b0 : cnt + 8'b1;

    assign sdata = shift [31];

    always @ (posedge clk or posedge reset)
        if (reset)
            shift <= 0;
        else
        begin
            if (clk_div [8:0] == 9'b1_1111_1111)
                shift <= value << 16;
            else if (clk_div [3:0] == 4'b1111)
                shift <= shift << 1;
        end

    /*
     * TODO: Exercise 1:
     * Decrease sound level.
     */
    assign value = lut_y;

    lut lut
    (
        .octave ( octave  ),
        .note   ( note    ),
        .x      ( cnt     ),
        .x_max  ( cnt_max ),
        .y      ( lut_y   )
    );

endmodule

module top
(
    input             clk,
    input      [ 3:0] key,
    input      [ 3:0] sw,
    output     [ 7:0] led,

    output reg [ 7:0] abcdefgh,
    output     [ 7:0] digit,

    inout      [15:0] gpio
);
    wire   reset  = ~ key [3];

    reg  [2:0] octave;
    reg  [3:0] note;

    /*
     * TODO: Exercise 2:
     * Change (increase/decrease) music speed.
     */
    reg [23:0] clk_div;

    always @ (posedge clk or posedge reset)
        if (reset)
            clk_div <= 0;
        else
            clk_div <= clk_div + 1;

    reg  [5:0] note_cnt;

    always @ (posedge clk or posedge reset)
        if (reset)
            note_cnt <= 0;
        else
            if (&clk_div && note != silence)
                note_cnt <= note_cnt + 1;

    localparam [3:0] C  = 4'd0,
                     Cs = 4'd1,
                     D  = 4'd2,
                     Ds = 4'd3,
                     E  = 4'd4,
                     F  = 4'd5,
                     Fs = 4'd6,
                     G  = 4'd7,
                     Gs = 4'd8,
                     A  = 4'd9,
                     As = 4'd10,
                     B  = 4'd11;

    localparam [3:0] Df = Cs, Ef = Ds, Gf = Fs, Af = Gs, Bf = As;

    localparam [3:0] silence = 4'd12;

    /*
     * TODO: Exercise 3:
     * Add another soundtrack.
     */

    always @ (*)
        case (note_cnt)
        0:  { octave, note } = { 3'b1, E  };
        1:  { octave, note } = { 3'b1, Ds };
        2:  { octave, note } = { 3'b1, E  };
        3:  { octave, note } = { 3'b1, Ds };
        4:  { octave, note } = { 3'b1, E  };

        5:  { octave, note } = { 3'b0, B  };
        6:  { octave, note } = { 3'b1, D  };
        7:  { octave, note } = { 3'b1, C  };
        8:  { octave, note } = { 3'b0, A  };
        9:  { octave, note } = { 3'b0, A  };

        10: { octave, note } = { 3'b0, C  };
        11: { octave, note } = { 3'b0, E  };
        12: { octave, note } = { 3'b0, A  };
        13: { octave, note } = { 3'b0, B  };
        14: { octave, note } = { 3'b0, B  };

        15: { octave, note } = { 3'b0, E  };
        16: { octave, note } = { 3'b0, Gs };
        17: { octave, note } = { 3'b0, B  };
        18: { octave, note } = { 3'b1, C  };
        19: { octave, note } = { 3'b1, C  };

        20: { octave, note } = { 3'b1, E  };
        21: { octave, note } = { 3'b1, Ds };
        22: { octave, note } = { 3'b1, E  };
        23: { octave, note } = { 3'b1, Ds };
        24: { octave, note } = { 3'b1, E  };

        25: { octave, note } = { 3'b0, B  };
        26: { octave, note } = { 3'b1, D  };
        27: { octave, note } = { 3'b1, C  };
        28: { octave, note } = { 3'b0, A  };
        29: { octave, note } = { 3'b0, A  };

        30: { octave, note } = { 3'b0, C  };
        31: { octave, note } = { 3'b0, E  };
        32: { octave, note } = { 3'b0, A  };
        33: { octave, note } = { 3'b0, B  };
        34: { octave, note } = { 3'b0, B  };

        35: { octave, note } = { 3'b0, E  };
        36: { octave, note } = { 3'b1, C  };
        37: { octave, note } = { 3'b0, B  };
        38: { octave, note } = { 3'b0, A  };
        39: { octave, note } = { 3'b0, A  };

        40: { octave, note } = { 3'b0, B  };
        41: { octave, note } = { 3'b1, C  };
        42: { octave, note } = { 3'b1, D  };
        43: { octave, note } = { 3'b1, E  };
        44: { octave, note } = { 3'b1, E  };
        45: { octave, note } = { 3'b1, E  };

        46: { octave, note } = { 3'b0, G  };
        47: { octave, note } = { 3'b1, F  };
        48: { octave, note } = { 3'b1, E  };
        49: { octave, note } = { 3'b1, D  };
        50: { octave, note } = { 3'b1, D  };
        51: { octave, note } = { 3'b1, D  };

        52: { octave, note } = { 3'b0, F  };
        53: { octave, note } = { 3'b1, E  };
        54: { octave, note } = { 3'b1, D  };
        55: { octave, note } = { 3'b1, C  };
        56: { octave, note } = { 3'b1, C  };
        57: { octave, note } = { 3'b1, C  };

        58: { octave, note } = { 3'b0, E  };
        59: { octave, note } = { 3'b1, D  };
        60: { octave, note } = { 3'b1, C  };
        61: { octave, note } = { 3'b0, B  };

        default: { octave, note } = { 3'b0, silence };
        endcase

//    always @ (*)
//        case (note_cnt)
//        0:  { octave, note } = { 3'b0, G   };
//        1:  { octave, note } = { 3'b1, C   };
//        2:  { octave, note } = { 3'b1, Ef  };
//
//        3:  { octave, note } = { 3'b1, D   };
//        4:  { octave, note } = { 3'b1, C   };
//        5:  { octave, note } = { 3'b1, Ef  };
//        6:  { octave, note } = { 3'b1, C   };
//        7:  { octave, note } = { 3'b1, D   };
//        8:  { octave, note } = { 3'b1, C   };
//        9:  { octave, note } = { 3'b0, Af  };
//        10: { octave, note } = { 3'b0, Bf  };
//
//        11: { octave, note } = { 3'b0, G   };
//        12: { octave, note } = { 3'b0, G   };
//        13: { octave, note } = { 3'b0, G   };
//        13: { octave, note } = { 3'b0, G   };
//
//        14: { octave, note } = { 3'b1, C   };
//        15: { octave, note } = { 3'b1, Ef  };
//        16: { octave, note } = { 3'b1, D   };
//        17: { octave, note } = { 3'b1, C   };
//        18: { octave, note } = { 3'b1, Ef  };
//        19: { octave, note } = { 3'b1, C   };
//        20: { octave, note } = { 3'b1, D   };
//
//        21: { octave, note } = { 3'b1, C   };
//        22: { octave, note } = { 3'b0, G   };
//        23: { octave, note } = { 3'b0, Gf  };
//        24: { octave, note } = { 3'b0, F   };
//        25: { octave, note } = { 3'b0, F   };
//        26: { octave, note } = { 3'b0, F   };
//        default: { octave, note } = { 3'b0, silence };
//        endcase

    assign led  = { 5'b11111, ~ octave };

    wire mclk;
    wire bclk;
    wire lrclk;
    wire sdata;

    assign gpio [1]     = lrclk;
    assign gpio [3]     = sdata;
    assign gpio [5]     = mclk;
    assign gpio [7]     = bclk;

    i2s i2s
    (
        .clk    ( clk       ),
        .reset  ( reset     ),
        .octave ( octave    ),
        .note   ( note      ),
        .mclk   ( mclk      ),
        .bclk   ( bclk      ),
        .lrclk  ( lrclk     ),
        .sdata  ( sdata     )
    );

    assign digit = 8'b1111_1110;

    always @ (posedge clk or posedge reset)
        if (reset)
            abcdefgh <= 8'b11111111;
        else
            case (note)
            4'd0:    abcdefgh <= 8'b01100011;  // C   // abcdefgh
            4'd1:    abcdefgh <= 8'b01100010;  // C#
            4'd2:    abcdefgh <= 8'b10000101;  // D   //   --a--
            4'd3:    abcdefgh <= 8'b10000100;  // D#  //  |     |
            4'd4:    abcdefgh <= 8'b01100001;  // E   //  f     b
            4'd5:    abcdefgh <= 8'b01110001;  // F   //  |     |
            4'd6:    abcdefgh <= 8'b01110000;  // F#  //   --g--
            4'd7:    abcdefgh <= 8'b01000011;  // G   //  |     |
            4'd8:    abcdefgh <= 8'b01000010;  // G#  //  e     c
            4'd9:    abcdefgh <= 8'b00010001;  // A   //  |     |
            4'd10:   abcdefgh <= 8'b00010000;  // A#  //   --d--  h
            4'd11:   abcdefgh <= 8'b11000001;  // B
            default: abcdefgh <= 8'b11111111;
            endcase

endmodule
