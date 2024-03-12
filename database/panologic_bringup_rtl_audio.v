
module audio(
    input wire  clk12,
    input wire  reset12_,

    output wire audio_mclk,
    output wire audio_bclk,
    output reg  audio_dacdat,
    output reg  audio_daclrc,
    input  wire audio_adcdat,
    output reg  audio_adclrc
    );

//    // DSP Mode, mode B, LRP=0, Slave (Figure 23), 16 bits
//    { WM8750_AUDIO_INTFC_ADDR,          (0<<7) |    // BCLKINV: BCLK not inverted
//                                        (1<<6) |    // MS     : Master mode
//                                        (0<<5) |    // LRSWAP : No L/R swap
//                                        (1<<4) |    // LRP    : DSP mode B: MSB on first clock cycle
//                                        (0<<2) |    // WL     : 16 bits
//                                        (3<<0) },   // FORMAT : DSP mode
//

    assign audio_mclk = clk12;

    // In USB mode, BCLK = MCLK
    assign audio_bclk = clk12;

    reg signed [15:0] sample_left, sample_right;
    reg [31:0] sample;
    reg [8:0]  bit_cntr, bit_cntr_nxt;
    reg [15:0] phase_cntr, phase_cntr_nxt;
    reg audio_daclrc_nxt, audio_dacdat_nxt;
    reg audio_adclrc_nxt;

    localparam max_bit_cntr = 12000/48;     // 48KHz
    
    always @*
    begin
        bit_cntr_nxt    = bit_cntr;
        phase_cntr_nxt  = phase_cntr;

        if (bit_cntr_nxt == max_bit_cntr-1) begin
            bit_cntr_nxt    = 0;
            
            if (phase_cntr == 47) begin         // 1KHz test tone
                phase_cntr_nxt  = 0;
            end
            else begin
                phase_cntr_nxt  = phase_cntr + 1;
            end
        end
        else begin
            bit_cntr_nxt    = bit_cntr + 1;
        end

        audio_daclrc_nxt    = (bit_cntr == 0);
        audio_dacdat_nxt    = |bit_cntr[8:5] ? 1'b0 : sample[~bit_cntr[4:0]];

        audio_adclrc_nxt    = (bit_cntr == 0);
    end

    always @(posedge clk12) 
    begin
        bit_cntr        <= bit_cntr_nxt;
        phase_cntr      <= phase_cntr_nxt;
        audio_daclrc    <= audio_daclrc_nxt;
        audio_dacdat    <= audio_dacdat_nxt;
        audio_adclrc    <= audio_adclrc_nxt;

        if (!reset12_) begin
            bit_cntr        <= 0;
            phase_cntr      <= 0;
            audio_daclrc    <= 1'b0;
            audio_dacdat    <= 1'b0;
            audio_adclrc    <= 1'b0;
        end
    end

    always @*
    begin
        sample_left  = (phase_cntr < 24) ? -16'd8192 : 16'd8192;
        sample_right = (phase_cntr < 24) ? -16'd1024 : 16'd1024;
        sample = { sample_left, sample_right };
    end

endmodule

