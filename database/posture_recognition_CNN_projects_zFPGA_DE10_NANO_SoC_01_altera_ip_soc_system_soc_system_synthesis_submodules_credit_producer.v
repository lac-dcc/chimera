// ----------------------------------------------------------
// Credit producer block
//
// This module produces symbol and packet credits by snooping
// on the valid, ready and eop signals. 
//
// A symbol credit is added whenever symbols_per_credit symbols
// have been detected, or whenever eop is detected.
//
// Packet credits are only incremented on a valid eop.
//
// @author jyeap
// ----------------------------------------------------------

module credit_producer (

    clk,
    reset_n,

    in_valid,
    in_ready,
    in_endofpacket,
    
    symbol_credits,
    packet_credits

);

    parameter SYMBOLS_PER_CREDIT    = 1;
    parameter SYMBOLS_PER_BEAT      = 1;
    parameter USE_SYMBOL_CREDITS    = 1;
    parameter USE_PACKET_CREDITS    = 1;
    parameter USE_PACKETS           = 1;

    input clk;
    input reset_n;

    input in_valid;
    input in_ready;
    input in_endofpacket;

    output reg [15 : 0] symbol_credits;
    output reg [15 : 0] packet_credits;

    // ----------------------------------------------------------
    // Internal Signals
    // ----------------------------------------------------------
    reg beat;
    reg eop_beat;
    reg [15 : 0] sym_count;
    reg [15 : 0] next_sym_count;
    reg rollover;

    always @* begin
        beat = in_valid && in_ready;

        if (USE_PACKETS)
            eop_beat = beat && in_endofpacket;
        else
            eop_beat = 0;
    end

    // ----------------------------------------------------------
    // Symbol Credits
    // ----------------------------------------------------------
generate

    // ----------------------------------------------------------
    // Simplest case first: symbols_per_beat is a multiple (n) of symbols_per_credit.
    //
    // Because the interface is wider than a credit, each beat of data always adds 
    // (n) to the symbol credits.
    //
    // This always works for non-packetized interfaces. For packetized interfaces
    // symbols_per_credit must be >= symbols_per_beat, which implies that this
    // only works for symbols_per_beat == symbols_per_credit.
    // ----------------------------------------------------------

    if (SYMBOLS_PER_BEAT % SYMBOLS_PER_CREDIT == 0) begin

        always @(posedge clk or negedge reset_n) begin
            if (!reset_n)
                symbol_credits <= 0;
            else if (beat)
                symbol_credits <= symbol_credits + SYMBOLS_PER_BEAT/SYMBOLS_PER_CREDIT;
        end

    end

    // ----------------------------------------------------------
    // Next case: symbols_per_credit is a multiple of symbols_per_beat
    //
    // We need two counters. One counts the number of symbols received,
    // and resets once it has reached symbols_per_credit or endofpacket.
    // The other is the symbol credit counter which increments whenever
    // the first counter resets.
    // ----------------------------------------------------------

    else if (SYMBOLS_PER_CREDIT % SYMBOLS_PER_BEAT == 0) begin

        always @* begin
            next_sym_count = sym_count;
            
            if (beat)
                next_sym_count = sym_count + SYMBOLS_PER_BEAT;
        end

        always @* begin
            rollover =  (next_sym_count == SYMBOLS_PER_CREDIT) || eop_beat;
        end

        always @(posedge clk or negedge reset_n) begin
            if (!reset_n)
                sym_count <= 0;
            else if (rollover)
                sym_count <= 0;
            else
                sym_count <= next_sym_count;
        end

        always @(posedge clk or negedge reset_n) begin
            if (!reset_n)
                symbol_credits <= 0;
            else if (rollover)
                symbol_credits <= symbol_credits + 1;
        end

    end

endgenerate

    // ----------------------------------------------------------
    // Packet Credits
    //
    // When you see EOP, up go the packet credits. Always.
    // ----------------------------------------------------------
    
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n)
            packet_credits <= 0;
        else if (eop_beat)
            packet_credits <= packet_credits + 1;
    end


endmodule
