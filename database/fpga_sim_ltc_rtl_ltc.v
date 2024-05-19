// This program was cloned from: https://github.com/sam210723/fpga
// License: MIT License

/**
 * SMPTE 12M Linear Timecode (LTC) Encoder
 */

module ltc(
    input  wire reset_n,
    input  wire clk,
    output wire ltc
);

    /*
     *  SMPTE 12M Linear Timecode (LTC) Frame Format
     *  https://en.wikipedia.org/wiki/Linear_timecode#Longitudinal_timecode_data_format
     *  
     *  OFFSET  LEN  USE
     *  0x00    4    Frame (units)
     *  0x04    4    User Field 1
     *  0x08    2    Frame (tens)
     *  0x0A    1    Drop Frame Flag
     *  0x0B    1    Color Frame Flag
     *  0x0C    4    User Field 2
     *  0x10    4    Second (units)
     *  0x14    4    User Field 3
     *  0x18    3    Second (tens)
     *  0x1B    1    Binary Group Flag 0 (BGF0) @ 25 FPS / Polarity Correction Bit
     *  0x1C    4    User Field 4
     *  0x20    4    Minute (units)
     *  0x24    4    User Field 5
     *  0x28    3    Minute (tens)
     *  0x2B    1    Binary Group Flag 2 (BGF2) @ 25 FPS / Binary Group Flag 0 (BGF0)
     *  0x2C    4    User Field 6
     *  0x30    4    Hour (units)
     *  0x34    4    User Field 7
     *  0x38    2    Hour (tens)
     *  0x3A    1    Binary Group Flag 1 (External Sync Source Flag)
     *  0x3B    1    Polarity Correction Bit @ 25 FPS / Binary Group Flag 2 (BGF2)
     *  0x3C    4    User Field 8
     *  0x40    16   Sync Word (0011 1111 1111 1101, 0x3FFD)
     */

    // Module Parameters
    parameter CLK_FREQ;             // System Clock Frequency (Hz)
    parameter LTC_FPS;              // Frames per second
    localparam FRAME_LEN = 80;      // LTC Frame Length

    // Registers
    reg  [63:0] frame = 64'h0;      // LTC Frame Registers
    reg  [15:0] sync = 16'h3FFD;    // SMPTE 12M Sync Word
    reg   [6:0] pointer = 7'h00;    // Encoder Pointer
    reg   [4:0] time_hour;          // Timestamp Hour Value
    reg   [5:0] time_minute;        // Timestamp Minute Value
    reg   [5:0] time_second;        // Timestamp Second Value
    reg   [4:0] time_frame;         // Timestamp Frame Value
    reg         tick = 1'b0;        // Encoder Bit Period Tick
    reg         out;                // Output Signal Buffer

    // LTC Encoder Clock Divider
    wire clk_ltc;
    clk_div #(
        CLK_FREQ,                   // Input Clock Frequency (Hz)
        LTC_FPS * FRAME_LEN * 2     // Output Clock Frequency (Hz)
    )
    clk_div_ltc(
        .reset_n(reset_n),          // Reset Flag
        .clk_i(clk),                // Input Clock
        .clk_o(clk_ltc)             // Output Clock
    );

    // Encoder Sync Period Flag
    wire syncing;
    assign syncing = pointer[6];

    // Differential Manchester (Biphase Mark) Encoder
    always @(posedge clk_ltc) begin
        if (syncing) begin  // Encode Sync Word
            if (~tick) begin
                if (sync[pointer[3:0]]) out <= ~out;
            end else begin
                out <= ~out;
            end
        end else begin      // Encode LTC Frame
            if (~tick) begin
                if (frame[pointer[5:0]]) out <= ~out;
            end else begin
                out <= ~out;
            end
        end

        // Increment Registers
        if (tick) pointer <= pointer + 1;
        tick <= ~tick;

        // Reset Pointer Register and Increment Timestamp
        if (pointer == 7'd79 && tick) begin
            pointer <= 0;

            // Increment Frame
            time_frame <= time_frame + 1;

            // Increment Second and Reset Frame
            if (time_frame == LTC_FPS - 1) begin
                time_frame <= 0;
                time_second <= time_second + 1;

                // Increment Minute and Reset Second
                if (time_second == 59) begin
                    time_second <= 0;
                    time_minute <= time_minute + 1;

                    // Incrememt Hour and Reset Minute
                    if (time_minute == 59) begin
                        time_minute <= 0;
                        time_hour <= time_hour + 1;

                        // Reset Hour
                        if (time_hour == 23) time_hour <= 0;
                    end
                end
            end
        end
    end

    // Output Signal
    assign ltc = out && reset_n;
endmodule
