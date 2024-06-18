// This program was cloned from: https://github.com/aniketuppin/n-body-gravity-simulator
// License: Apache License 2.0

// (C) 2001-2022 Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files from any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License Subscription 
// Agreement, Intel FPGA IP License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Intel and sold by 
// Intel or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


// ================================================================================
//
// Altera Avalon Data Pattern Generator
//
// A Avalon-ST parallel data pattern generator that is controlled by an
// Avalon-MM slave. Output supports bit width of 32, 40, 50, 64, 66, 80 and 128 bits
// 
// ================================================================================
`timescale 1 ns / 1 ns
(* altera_attribute = "-name IP_TOOL_NAME Altera_Avalon_Data_Pattern_Generator; -name IP_TOOL_VERSION 13.0" *)
module altera_avalon_data_pattern_generator 
#(  
    // ------------------------------------------------
    // Parameters
    // ------------------------------------------------
    parameter ST_DATA_W = 40,
    parameter SYNC_DEPTH = 2,
    parameter BYPASS_ENABLED = 1'b0,
    parameter AVALON_ENABLED = 1'b1,
    parameter FREQ_CNTER_ENABLED = 1'b0
    
)
(
    input reset,
    
    // Avalon-MM slave
    input                           avs_clk,
    input       [2 : 0]             avs_address,
    input                           avs_write,
    input                           avs_read,
    input       [3 : 0]             avs_byteenable,
    input       [31: 0]             avs_writedata,
    output reg  [31: 0]             avs_readdata,
    // Avalon-ST sink 
    output                          asi_clk, //output clk to support conduit mode in Qsys
    input       [ST_DATA_W-1: 0]    asi_data,
    input                           asi_valid,
    output reg                      asi_ready,
    // Avalon-ST source
    input                           aso_clk,
    output reg  [ST_DATA_W-1 : 0]   aso_data,
    output reg                      aso_valid,
    input                           aso_ready
    );
    // ------------------------------------------------
    // Local Paramters
    // ------------------------------------------------
    ///added one more bit in the pattern select register to allow by-pass or custom pattern to happen
    localparam NUM_PATTERNS = 9;
    localparam SYMBOLS_PER_BEAT = 4;// Not used
    localparam BITS_PER_SYMBOL = ST_DATA_W / SYMBOLS_PER_BEAT; // Not used
    localparam ENABLE_ADDR         = 0;
    localparam PATTERN_SET_ADDR    = 1;
    localparam INJECT_ERROR_ADDR   = 2;
    localparam PREAMBLE_SET_ADDR   = 3;
    localparam PREAMBLE_WORD0_ADDR = 4;
    localparam PREAMBLE_WORD1_ADDR = 5;
    localparam PREAMBLE_WORD2_ADDR = 6;
    localparam PREAMBLE_WORD3_ADDR = 7;
	
    // localparam PREAMBLE_WORDL_ADDR = 4;
    // localparam PREAMBLE_WORDH_ADDR = 5;
    localparam ENABLE_BIT          = 0;
    localparam INJECT_ERROR_BIT    = 0;
    localparam ENABLE_PREAMBLE_BIT = 0;
    localparam PREAMBLE_MSB = 15;
    localparam PREAMBLE_LSB = 8;
    localparam SEL_PRBS_7    = 'b1;
    localparam SEL_PRBS_15   = 'b10;
    localparam SEL_PRBS_23   = 'b100;
    localparam SEL_PRBS_31   = 'b1000;
    localparam SEL_HIGH_FREQ = 'b10000;
    localparam SEL_LOW_FREQ  = 'b100000;
    localparam SEL_CRPAT     = 'b1000000;
    localparam SEL_CJPAT     = 'b10000000;
    localparam SEL_CUSTOM    = 'b100000000;
    localparam ST_IDLE       = 0;
    localparam ST_PREAMBLE   = 1;
    localparam ST_PRBS       = 2;
    localparam ST_HIGH_FREQ  = 3;
    localparam ST_LOW_FREQ   = 4;
    localparam ST_CUSTOM     = 5;
    // ------------------------------------------------
    // Internal Signals
    // ------------------------------------------------
    reg [NUM_PATTERNS-1:0] pattern_select /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=D101" */;
	// Expanded sync_character to incorporate up to 128-bit preamble word
    reg [127:0]            sync_character /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=D101" */;
    reg [15:0]             preamble_register /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=D101" */;
    reg                    enable_register;
    reg                    inject_error_register;
    reg                    inject_error_reg;
    reg                    injecting_error;
    reg                    error_injected;
    reg [ST_DATA_W-1 : 0]  prbs;
    reg [2:0]              state;
    reg [ST_DATA_W-1 : 0]  next_data;
    wire [ST_DATA_W-1 : 0] next_data_fliped;
    reg                    next_valid;
    reg [7:0]              local_counter;
    wire inject_error;
    wire error_injected_sync;
    wire enable;
    wire enable_sync;
    wire enable_preamble;
    wire advance_data;
    wire aso_ready_sync;
    wire asi_valid_sync;
    wire advance_prbs;
    wire [7:0] preamble_counter;
    wire [ST_DATA_W-1 : 0] high_frequency;
    wire [ST_DATA_W-1 : 0] low_frequency;
    wire                   reset_sync;
    assign enable_preamble  = preamble_register[ENABLE_PREAMBLE_BIT];
    assign preamble_counter = preamble_register[PREAMBLE_MSB : PREAMBLE_LSB]; 
    // ------------------------------------------------
    // Avalon-MM Slave
    // ------------------------------------------------
    always @(posedge avs_clk or posedge reset) begin
        if (reset) begin
            avs_readdata <= 'b0;
            enable_register <= 'b0;
            inject_error_register <= 'b0;
            pattern_select <= 'b1;
            // TODO maybe this should be K28.5 by default
            sync_character <= 'b0;
            preamble_register <= 'b0;
        end else begin
            // Always self-clearing
            inject_error_register <= 'b0;
            if (error_injected_sync | ~enable_register) begin
                injecting_error <= 'b0;
            end
            if (avs_read) begin
                avs_readdata <= 'b0;
                case (avs_address)
                    ENABLE_ADDR: begin
                        if (avs_byteenable[0]) begin
                            avs_readdata[0] <= enable_sync;
                            avs_readdata[1] <= BYPASS_ENABLED ? 1'b1 : 1'b0;
                            avs_readdata[2] <= AVALON_ENABLED ? 1'b1 : 1'b0;
                            avs_readdata[3] <= AVALON_ENABLED ? aso_ready_sync : 1'b0;
                            avs_readdata[4] <= AVALON_ENABLED ? asi_valid_sync : 1'b0;
                            avs_readdata[5] <= FREQ_CNTER_ENABLED ? 1'b1 : 1'b0;
                        end
                    end
                    PATTERN_SET_ADDR: begin
                        if (avs_byteenable[0]) begin
                            avs_readdata[7:0] <= pattern_select[7:0];
                        end 
                        if (avs_byteenable[1]) begin
                            avs_readdata[8] <= pattern_select[8];
                        end
                    end
                    INJECT_ERROR_ADDR: begin
                        if (avs_byteenable[0]) begin
                            avs_readdata[0] <= injecting_error;
                        end
                    end
                    PREAMBLE_SET_ADDR: begin
                        if (avs_byteenable[0]) begin
                            avs_readdata[7:0] <= preamble_register[7:0];
                        end
                        if (avs_byteenable[1]) begin
                            avs_readdata[15:8] <= preamble_register[15:8];
                        end
                    end
                    PREAMBLE_WORD0_ADDR: begin
                        if (avs_byteenable[0]) begin
                            avs_readdata[7:0] <= sync_character[7:0];
                        end
                        if (avs_byteenable[1]) begin
                            avs_readdata[15:8] <= sync_character[15:8];
                        end
                        if (avs_byteenable[2]) begin
                            avs_readdata[23:16] <= sync_character[23:16];
                        end
                        if (avs_byteenable[3]) begin
                            avs_readdata[31:24] <= sync_character[31:24];
                        end
                    end
                    PREAMBLE_WORD1_ADDR: begin 
                        if (avs_byteenable[0]) begin
                            avs_readdata[7:0] <= sync_character[7+32:0+32];
                        end
					    if (avs_byteenable[1]) begin
                            avs_readdata[15:8] <= sync_character[15+32:8+32];
                        end
                        if (avs_byteenable[2]) begin
                            avs_readdata[23:16] <= sync_character[23+32:16+32];
                        end		
                        if (avs_byteenable[3]) begin
                            avs_readdata[31:24] <= sync_character[31+32:24+32];
                        end						
                    end
                    PREAMBLE_WORD2_ADDR: begin 
                        if (avs_byteenable[0]) begin
                            avs_readdata[7:0] <= sync_character[7+64:0+64];
                        end
					    if (avs_byteenable[1]) begin
                            avs_readdata[15:8] <= sync_character[15+64:8+64];
                        end
                        if (avs_byteenable[2]) begin
                            avs_readdata[23:16] <= sync_character[23+64:16+64];
                        end		
                        if (avs_byteenable[3]) begin
                            avs_readdata[31:24] <= sync_character[31+64:24+64];
                        end						
                    end					
                    PREAMBLE_WORD3_ADDR: begin 
                        if (avs_byteenable[0]) begin
                            avs_readdata[7:0] <= sync_character[7+96:0+96];
                        end
					    if (avs_byteenable[1]) begin
                            avs_readdata[15:8] <= sync_character[15+96:8+96];
                        end
                        if (avs_byteenable[2]) begin
                            avs_readdata[23:16] <= sync_character[23+96:16+96];
                        end		
                        if (avs_byteenable[3]) begin
                            avs_readdata[31:24] <= sync_character[31+96:24+96];
                        end						
                    end						
                    default: begin
                    end
                endcase
            end // end read if block
            else if (avs_write) begin
                // In the middle of a transfer, only the stopping generation and
                // injecting an error is accepted.
                // Setting any other bits are undefined, and actually ignored.
                case (avs_address) 
                   ENABLE_ADDR: begin
                       /* prevent the user from enable the generator when custom pattern
                          selected */
                       if (avs_byteenable[0] && pattern_select != SEL_CUSTOM) begin
                           enable_register <= avs_writedata[ENABLE_BIT];
                       end
                    end
                    INJECT_ERROR_ADDR: begin
                        if (avs_byteenable[0]) begin
                            if (~injecting_error & enable_register) begin
                                inject_error_register <= avs_writedata[INJECT_ERROR_BIT];
                                injecting_error <= avs_writedata[INJECT_ERROR_BIT];
                            end
                        end
                    end
                endcase
                if (~(enable_register | enable_sync)) begin
                    case (avs_address) 
                        PATTERN_SET_ADDR: begin
                            if (avs_byteenable[0]) begin
                                pattern_select[7:0] <= avs_writedata[7:0];
                            end 
                            if (avs_byteenable[1]) begin
                                pattern_select[8]   <= avs_writedata[8];
                            end
                        end
                        PREAMBLE_SET_ADDR: begin
                            if (avs_byteenable[0]) begin
                                preamble_register[7:0] <= avs_writedata[7:0];
                            end
                            if (avs_byteenable[1]) begin
                                preamble_register[15:8] <= avs_writedata[15:8];
                            end
                        end
                        PREAMBLE_WORD0_ADDR: begin
                            if (avs_byteenable[0]) begin
                                sync_character[7:0] <= avs_writedata[7:0];
                            end
                            if (avs_byteenable[1]) begin
                                sync_character[15:8] <= avs_writedata[15:8];
                            end
                            if (avs_byteenable[2]) begin
                                sync_character[23:16] <= avs_writedata[23:16];
                            end
                            if (avs_byteenable[3]) begin
                                sync_character[31:24] <= avs_writedata[31:24];
                            end
                        end
                        PREAMBLE_WORD1_ADDR: begin
                            if (avs_byteenable[0]) begin // Expanded for up to 128-bit here
                                sync_character[39:32] <= avs_writedata[7:0];
                            end
                            if (avs_byteenable[1]) begin
                                sync_character[47:40] <= avs_writedata[15:8];
                            end							
                            if (avs_byteenable[2]) begin
                                sync_character[55:48] <= avs_writedata[23:16];
                            end							
                            if (avs_byteenable[3]) begin
                                sync_character[63:56] <= avs_writedata[31:24];
                            end							
                        end
                        PREAMBLE_WORD2_ADDR: begin
                            if (avs_byteenable[0]) begin
                                sync_character[7+64:0+64] <= avs_writedata[7:0];
                            end
                            if (avs_byteenable[1]) begin
                                sync_character[15+64:8+64] <= avs_writedata[15:8];
                            end
                            if (avs_byteenable[2]) begin
                                sync_character[23+64:16+64] <= avs_writedata[23:16];
                            end
                            if (avs_byteenable[3]) begin
                                sync_character[31+64:24+64] <= avs_writedata[31:24];
                            end
                        end						
                        PREAMBLE_WORD3_ADDR: begin
                            if (avs_byteenable[0]) begin
                                sync_character[7+96:0+96] <= avs_writedata[7:0];
                            end
                            if (avs_byteenable[1]) begin
                                sync_character[15+96:8+96] <= avs_writedata[15:8];
                            end
                            if (avs_byteenable[2]) begin
                                sync_character[23+96:16+96] <= avs_writedata[23:16];
                            end
                            if (avs_byteenable[3]) begin
                                sync_character[31+96:24+96] <= avs_writedata[31:24];
                            end
                        end						
                    endcase
                end
            end // end write if block
        end // end else
    end //end always block
    altera_std_synchronizer #(
        .depth   (SYNC_DEPTH)
    ) enable_register_synchronizer (
        .clk     (aso_clk),
        .reset_n (~reset),
        .din     (enable_register),
        .dout    (enable)
    );
    
    altera_std_synchronizer #(
        .depth   (SYNC_DEPTH)
    ) enabled_synchronizer (
        .clk     (avs_clk),
        .reset_n (~reset),
        .din     (enable),
        .dout    (enable_sync)
    );

    altera_std_synchronizer #(
        .depth   (SYNC_DEPTH)
    ) aso_ready_synchronizer (
        .clk     (avs_clk),
        .reset_n (~reset),
        .din     (aso_ready),
        .dout    (aso_ready_sync)
    );
    altera_std_synchronizer #(
        .depth   (SYNC_DEPTH)
    ) asi_valid_synchronizer (
        .clk     (avs_clk),
        .reset_n (~reset),
        .din     (asi_valid),
        .dout    (asi_valid_sync)
    );
    // ------------------------------------------------
    // Avalon-ST Source
    // ------------------------------------------------
    generate
        if ( SYNC_DEPTH==0) begin
            assign reset_sync = reset;
        end else begin
            altera_reset_synchronizer
            #(
                .DEPTH              (SYNC_DEPTH)
            ) asi_reset_controller (
                .clk        (aso_clk),
                .reset_in   (reset),
                .reset_out  (reset_sync)
            );
        end
    endgenerate
    // We advance data from next_* to aso_* when 
    //  1) previous data is consumed (aso_valid & aso_ready)
    //  2) before we have transmitted (valid is not yet high)
    //  3) when custom pattern is selected
    //  4) when we are in conduit mode
    assign advance_data = ~aso_valid | (aso_valid & aso_ready) | ( pattern_select == SEL_CUSTOM) | ~(|AVALON_ENABLED);
    always @(posedge aso_clk or posedge reset_sync) begin
        if (reset_sync) begin
            inject_error_reg <= 'b0;
            error_injected <= 'b0;
        end else begin
            // Always self-clearing
            error_injected <= 'b0;
            // If back-pressured, inject_error_reg holds the injection,
            // else it clears the injection 
            if (inject_error) begin
                inject_error_reg <= 'b1;
            end
            if (inject_error_reg & advance_data) begin
                inject_error_reg <= 'b0;
                error_injected <= 'b1;
            end
        end
    end
    pulse_handshake_clock_crosser
    #(
        .SYNC_DEPTH (SYNC_DEPTH)
     ) pulser
    (
        .reset       (reset),
        .src_clk     (avs_clk),
        .dst_clk     (aso_clk),
        .in          (enable_register & inject_error_register), 
        .out         (inject_error),
        .ack         (error_injected),
        .done        (error_injected_sync)
    );
    // Output is registered
    always @(posedge aso_clk or posedge reset_sync) begin
        if (reset_sync) begin
            aso_data <= {ST_DATA_W/2{2'h1}}; // Output a pattern of "0101...0101" when reset
            aso_valid <= 1'b0;
        end else begin
            if (~enable && (pattern_select != SEL_CUSTOM)) begin
                aso_data <= {ST_DATA_W/2{2'h1}}; // Output a pattern of "0101...0101" when reset
                aso_valid <= 1'b0;
            end else begin
                if (advance_data) begin
                    if ( AVALON_ENABLED ) begin
                        aso_valid <= next_valid;
                        aso_data <= next_data;
                    end else begin
                        aso_valid <= 'b0;
                        if ( pattern_select != SEL_CUSTOM ) begin
                            aso_data <= next_data_fliped;
                        end else begin
                          //if in by-pass mode, don't flip the data
                            aso_data <= next_data;
                        end
                    end
                end
            end
        end
    end
    // for non-avalon mode, we need to swap the MSB and LSB
    genvar i;
    generate
        if ( BYPASS_ENABLED ) begin
            assign asi_clk = aso_clk;
        end else begin
            assign asi_clk = 'b0;
        end 
        for ( i = 0; i < ST_DATA_W; i = i+1) begin : data_flip
            assign next_data_fliped[ST_DATA_W-1-i] = next_data[i];
        end
    endgenerate
    
    always @(posedge aso_clk or posedge reset_sync) begin
        if (reset_sync) begin
            state <= ST_IDLE;
            next_data <= {ST_DATA_W/2{2'h1}}; // Output a pattern of "0101...0101" when reset
            next_valid <= 1'b0;
            local_counter <= 'b0;
        end else begin
            if (advance_data) begin
                asi_ready <= 1'b0;
                case (state)
                    ST_IDLE : begin
                        next_valid <= 1'b0;
                        next_data <= {ST_DATA_W/2{2'h1}};  // TODO maybe we don't need this
                        if (enable | pattern_select == SEL_CUSTOM) begin
                            if (enable_preamble && preamble_counter > 0) begin
                                state <= ST_PREAMBLE;
                                local_counter <= preamble_counter; 
                            end else begin
                                case (pattern_select)
                                    SEL_PRBS_7,
                                    SEL_PRBS_15,
                                    SEL_PRBS_23,
                                    SEL_PRBS_31 : begin
                                        state <= ST_PRBS;
                                    end
                                    SEL_HIGH_FREQ: begin
                                        state <= ST_HIGH_FREQ;
                                    end
                                    SEL_LOW_FREQ: begin
                                        state <= ST_LOW_FREQ;
                                    end
                                    SEL_CUSTOM: begin
                                        state <= ST_CUSTOM;
                                    end
                                    default: begin
                                        // do nothing. stay in IDLE
                                    end
                                endcase
                            end // end if-else for enable_preamble
                        end // end if enable
                    end // end ST_IDLE
                    ST_PREAMBLE: begin
                        next_data <= inject_error_reg ? sync_character[ST_DATA_W-1:0] ^ 'b1 : sync_character[ST_DATA_W-1:0];
                        next_valid <= 1'b1;
                        if (local_counter > 1) begin
                            local_counter <= local_counter - 1'b1;
                        end else begin
                            case (pattern_select)
                                SEL_PRBS_7,
                                SEL_PRBS_15,
                                SEL_PRBS_23,
                                SEL_PRBS_31 : begin
                                    state <= ST_PRBS;
                                end
                                SEL_HIGH_FREQ: begin
                                    state <= ST_HIGH_FREQ;
                                end
                                SEL_LOW_FREQ: begin
                                    state <= ST_LOW_FREQ;
                                end
                                SEL_CUSTOM: begin
                                    state <= ST_CUSTOM;
                                end
                                default: begin
                                    // invalid pattern selected.
                                    state <= ST_IDLE; 
                                end
                            endcase
                        end
                    end // end ST_PREAMBLE
                    ST_PRBS : begin
                        next_valid <= 1'b1;
                        next_data <= inject_error_reg ? prbs ^ 'b1 : prbs ;
                    end // end ST_PRBS
                    ST_HIGH_FREQ : begin
                        next_valid <= 1'b1;
                        next_data <= inject_error_reg ? high_frequency ^ 'b1 : high_frequency ;
                    end // end ST_HIGH_FREQ
                    ST_LOW_FREQ : begin
                        next_valid <= 1'b1;
                        next_data <= inject_error_reg ? low_frequency ^ 'b1 : low_frequency ;
                    end // end ST_LOW_FREQ
                    ST_CUSTOM : begin
                        next_data <= asi_data;
                        next_valid <= AVALON_ENABLED ? asi_valid : 1'b0;
                        asi_ready <= AVALON_ENABLED ? aso_ready : 1'b0;
                    end // end ST_CUSTOM 
                    default: begin
                        next_data <= 'b0;
                        next_valid <= 'b0;
                        state <= ST_IDLE;
                    end
                endcase
            end // end if advance_data
            // if enable goes low, always go back to idle
            // if custom pattern is select, bypass data when regardless of enable    
            if (~enable && (pattern_select != SEL_CUSTOM) ) begin
                next_data <= {ST_DATA_W/2{2'h1}}; // Output a pattern of "0101...0101" when it's not enabled
                next_valid <= 'b0;
                state <= ST_IDLE;
            end
        end // end if reset block
    end // end always block
    // ------------------------------------------------
    // High/low frequency pattern
    // ------------------------------------------------
generate
        if (ST_DATA_W == 40) begin
            assign high_frequency = 40'hAAAAAAAAAA;
            assign low_frequency  = 40'hF83E0F83E0;
        end else if (ST_DATA_W == 32) begin
            assign high_frequency = 32'hAAAA_AAAA;
            assign low_frequency  = 32'hF0F0_F0F0;
        end else if (ST_DATA_W == 64) begin
			assign high_frequency = 64'hAAAA_AAAA_AAAA_AAAA;
            assign low_frequency  = 64'hF0F0_F0F0_F0F0_F0F0;
		end else if (ST_DATA_W == 66) begin
		    assign high_frequency = 66'h2_AAAA_AAAA_AAAA_AAAA;
            assign low_frequency  = 66'h3_8E38_E38E_38E3_8E38; // Output a 6-bit width symbol for 66-bit low freq pattern
		end else if (ST_DATA_W == 80) begin
		    assign high_frequency = 80'hAAAA_AAAA_AAAA_AAAA_AAAA;
            assign low_frequency  = 80'hF0F0_F0F0_F0F0_F0F0_F0F0;			
		end else if (ST_DATA_W == 128) begin
		    assign high_frequency = 128'hAAAA_AAAA_AAAA_AAAA_AAAA_AAAA_AAAA_AAAA;
            assign low_frequency  = 128'hF0F0_F0F0_F0F0_F0F0_F0F0_F0F0_F0F0_F0F0;
		end else if (ST_DATA_W == 50) begin
		    assign high_frequency = 50'h2_AAAA_AAAA_AAAA;
            assign low_frequency  = 50'h3_E0F8_3E0F_83E0; 
		end 
    endgenerate
    // ------------------------------------------------
    // PRBS block
    // ------------------------------------------------
    // Assign the next PRBS value when:
    //   1.  we are just starting generation (ST_IDLE & enable)
    //          - do not send FFFFFFFFFF seed state
    //   2.  we are in the PRBS states and data gets sent 
    assign advance_prbs  = (((state == ST_IDLE) && enable) || (state == ST_PRBS) && (advance_data));
    generate
        // 40-bit
        if (ST_DATA_W == 40) begin
            always @(posedge aso_clk or posedge reset_sync) begin
                if (reset_sync) begin
                    prbs <= ~0;
                end else begin
                    if (state == ST_IDLE) begin
                        prbs <= ~0;
                    end
                    if (advance_prbs) begin
                        case (pattern_select)
                            SEL_PRBS_7 : begin
                                // PRBS 2^7-1 (T[7,6]) (parallel 40-bit serializer)
                                prbs[0]  <= prbs[0] ^ prbs[3] ^ prbs[4] ^ prbs[5] ;
                                prbs[1]  <= prbs[1] ^ prbs[4] ^ prbs[5] ^ prbs[6] ;
                                prbs[2]  <= prbs[0] ^ prbs[2] ^ prbs[5] ;
                                prbs[3]  <= prbs[1] ^ prbs[3] ^ prbs[6] ;
                                prbs[4]  <= prbs[0] ^ prbs[2] ^ prbs[4] ^ prbs[6] ;
                                prbs[5]  <= prbs[0] ^ prbs[1] ^ prbs[3] ^ prbs[5] ^ prbs[6] ;
                                prbs[6]  <= prbs[0] ^ prbs[1] ^ prbs[2] ^ prbs[4] ;
                                prbs[7]  <= prbs[1] ^ prbs[2] ^ prbs[3] ^ prbs[5] ;
                                prbs[8]  <= prbs[2] ^ prbs[3] ^ prbs[4] ^ prbs[6] ;
                                prbs[9]  <= prbs[0] ^ prbs[3] ^ prbs[4] ^ prbs[5] ^ prbs[6] ;
                                prbs[10] <= prbs[0] ^ prbs[1] ^ prbs[4] ^ prbs[5] ;
                                prbs[11] <= prbs[1] ^ prbs[2] ^ prbs[5] ^ prbs[6] ;
                                prbs[12] <= prbs[0] ^ prbs[2] ^ prbs[3] ;
                                prbs[13] <= prbs[1] ^ prbs[3] ^ prbs[4] ;
                                prbs[14] <= prbs[2] ^ prbs[4] ^ prbs[5] ;
                                prbs[15] <= prbs[3] ^ prbs[5] ^ prbs[6] ;
                                prbs[16] <= prbs[0] ^ prbs[4] ;
                                prbs[17] <= prbs[1] ^ prbs[5] ;
                                prbs[18] <= prbs[2] ^ prbs[6] ;
                                prbs[19] <= prbs[0] ^ prbs[3] ^ prbs[6] ;
                                prbs[20] <= prbs[0] ^ prbs[1] ^ prbs[4] ^ prbs[6] ;
                                prbs[21] <= prbs[0] ^ prbs[1] ^ prbs[2] ^ prbs[5] ^ prbs[6] ;
                                prbs[22] <= prbs[0] ^ prbs[1] ^ prbs[2] ^ prbs[3] ;
                                prbs[23] <= prbs[1] ^ prbs[2] ^ prbs[3] ^ prbs[4] ;
                                prbs[24] <= prbs[2] ^ prbs[3] ^ prbs[4] ^ prbs[5] ;
                                prbs[25] <= prbs[3] ^ prbs[4] ^ prbs[5] ^ prbs[6] ;
                                prbs[26] <= prbs[0] ^ prbs[4] ^ prbs[5] ;
                                prbs[27] <= prbs[1] ^ prbs[5] ^ prbs[6] ;
                                prbs[28] <= prbs[0] ^ prbs[2] ;
                                prbs[29] <= prbs[1] ^ prbs[3] ;
                                prbs[30] <= prbs[2] ^ prbs[4] ;
                                prbs[31] <= prbs[3] ^ prbs[5] ;
                                prbs[32] <= prbs[4] ^ prbs[6] ;
                                prbs[33] <= prbs[0] ^ prbs[5] ^ prbs[6] ;
                                prbs[34] <= prbs[0] ^ prbs[1] ;
                                prbs[35] <= prbs[1] ^ prbs[2] ;
                                prbs[36] <= prbs[2] ^ prbs[3] ;
                                prbs[37] <= prbs[3] ^ prbs[4] ;
                                prbs[38] <= prbs[4] ^ prbs[5] ;
                                prbs[39] <= prbs[5] ^ prbs[6] ;
                            end
                            SEL_PRBS_15 : begin
                                // PRBS 2^15 (T[15, 14]) (parallel 40-bit serializer)
                                prbs[0]  <= prbs[2]  ^ prbs[3]  ^ prbs[4]  ^ prbs[5]  ;
                                prbs[1]  <= prbs[3]  ^ prbs[4]  ^ prbs[5]  ^ prbs[6]  ;
                                prbs[2]  <= prbs[4]  ^ prbs[5]  ^ prbs[6]  ^ prbs[7]  ;
                                prbs[3]  <= prbs[5]  ^ prbs[6]  ^ prbs[7]  ^ prbs[8]  ;
                                prbs[4]  <= prbs[6]  ^ prbs[7]  ^ prbs[8]  ^ prbs[9]  ;
                                prbs[5]  <= prbs[7]  ^ prbs[8]  ^ prbs[9]  ^ prbs[10] ;
                                prbs[6]  <= prbs[8]  ^ prbs[9]  ^ prbs[10] ^ prbs[11] ;
                                prbs[7]  <= prbs[9]  ^ prbs[10] ^ prbs[11] ^ prbs[12] ;
                                prbs[8]  <= prbs[10] ^ prbs[11] ^ prbs[12] ^ prbs[13] ;
                                prbs[9]  <= prbs[11] ^ prbs[12] ^ prbs[13] ^ prbs[14] ;
                                prbs[10] <= prbs[0]  ^ prbs[12] ^ prbs[13] ;          
                                prbs[11] <= prbs[1]  ^ prbs[13] ^ prbs[14] ;
                                prbs[12] <= prbs[0]  ^ prbs[2]  ;
                                prbs[13] <= prbs[1]  ^ prbs[3]  ;
                                prbs[14] <= prbs[2]  ^ prbs[4]  ;
                                prbs[15] <= prbs[3]  ^ prbs[5]  ;
                                prbs[16] <= prbs[4]  ^ prbs[6]  ;
                                prbs[17] <= prbs[5]  ^ prbs[7]  ;
                                prbs[18] <= prbs[6]  ^ prbs[8]  ;
                                prbs[19] <= prbs[7]  ^ prbs[9]  ;
                                prbs[20] <= prbs[8]  ^ prbs[10] ;
                                prbs[21] <= prbs[9]  ^ prbs[11] ;
                                prbs[22] <= prbs[10] ^ prbs[12] ;
                                prbs[23] <= prbs[11] ^ prbs[13] ;
                                prbs[24] <= prbs[12] ^ prbs[14] ;
                                prbs[25] <= prbs[0]  ^ prbs[13] ^ prbs[14] ;
                                prbs[26] <= prbs[0]  ^ prbs[1]  ;
                                prbs[27] <= prbs[1]  ^ prbs[2]  ;
                                prbs[28] <= prbs[2]  ^ prbs[3]  ;
                                prbs[29] <= prbs[3]  ^ prbs[4]  ;
                                prbs[30] <= prbs[4]  ^ prbs[5]  ;
                                prbs[31] <= prbs[5]  ^ prbs[6]  ;
                                prbs[32] <= prbs[6]  ^ prbs[7]  ;
                                prbs[33] <= prbs[7]  ^ prbs[8]  ;
                                prbs[34] <= prbs[8]  ^ prbs[9]  ;
                                prbs[35] <= prbs[9]  ^ prbs[10] ;
                                prbs[36] <= prbs[10] ^ prbs[11] ;
                                prbs[37] <= prbs[11] ^ prbs[12] ;
                                prbs[38] <= prbs[12] ^ prbs[13] ;
                                prbs[39] <= prbs[13] ^ prbs[14] ;
                            end
                            SEL_PRBS_23 : begin
                                // PRBS 2^23-1 (T[23,18]) (parallel 40-bit serializer)
                                prbs[0]  <= prbs[6]  ^ prbs[14] ^ prbs[19] ;
                                prbs[1]  <= prbs[7]  ^ prbs[15] ^ prbs[20] ;
                                prbs[2]  <= prbs[8]  ^ prbs[16] ^ prbs[21] ;
                                prbs[3]  <= prbs[9]  ^ prbs[17] ^ prbs[22] ;
                                prbs[4]  <= prbs[0]  ^ prbs[10] ;
                                prbs[5]  <= prbs[1]  ^ prbs[11] ;
                                prbs[6]  <= prbs[2]  ^ prbs[12] ;
                                prbs[7]  <= prbs[3]  ^ prbs[13] ;
                                prbs[8]  <= prbs[4]  ^ prbs[14] ;
                                prbs[9]  <= prbs[5]  ^ prbs[15] ;
                                prbs[10] <= prbs[6]  ^ prbs[16] ;
                                prbs[11] <= prbs[7]  ^ prbs[17] ;
                                prbs[12] <= prbs[8]  ^ prbs[18] ;
                                prbs[13] <= prbs[9]  ^ prbs[19] ;
                                prbs[14] <= prbs[10] ^ prbs[20] ;
                                prbs[15] <= prbs[11] ^ prbs[21] ;
                                prbs[16] <= prbs[12] ^ prbs[22] ;
                                prbs[17] <= prbs[0]  ^ prbs[13] ^ prbs[18] ;
                                prbs[18] <= prbs[1]  ^ prbs[14] ^ prbs[19] ;
                                prbs[19] <= prbs[2]  ^ prbs[15] ^ prbs[20] ;
                                prbs[20] <= prbs[3]  ^ prbs[16] ^ prbs[21] ;
                                prbs[21] <= prbs[4]  ^ prbs[17] ^ prbs[22] ;
                                prbs[22] <= prbs[0]  ^ prbs[5]  ;
                                prbs[23] <= prbs[1]  ^ prbs[6]  ;
                                prbs[24] <= prbs[2]  ^ prbs[7]  ;
                                prbs[25] <= prbs[3]  ^ prbs[8]  ;
                                prbs[26] <= prbs[4]  ^ prbs[9]  ;
                                prbs[27] <= prbs[5]  ^ prbs[10] ;
                                prbs[28] <= prbs[6]  ^ prbs[11] ;
                                prbs[29] <= prbs[7]  ^ prbs[12] ;
                                prbs[30] <= prbs[8]  ^ prbs[13] ;
                                prbs[31] <= prbs[9]  ^ prbs[14] ;
                                prbs[32] <= prbs[10] ^ prbs[15] ;
                                prbs[33] <= prbs[11] ^ prbs[16] ;
                                prbs[34] <= prbs[12] ^ prbs[17] ;
                                prbs[35] <= prbs[13] ^ prbs[18] ;
                                prbs[36] <= prbs[14] ^ prbs[19] ;
                                prbs[37] <= prbs[15] ^ prbs[20] ;
                                prbs[38] <= prbs[16] ^ prbs[21] ;
                                prbs[39] <= prbs[17] ^ prbs[22] ;
                            end
                            SEL_PRBS_31 : begin
                                // PRBS 2^31-1 (T[31,28]) (parallel 40-bit serializer)
                                prbs[0]  <= prbs[16] ^ prbs[22] ;
                                prbs[1]  <= prbs[17] ^ prbs[23] ;
                                prbs[2]  <= prbs[18] ^ prbs[24] ;
                                prbs[3]  <= prbs[19] ^ prbs[25] ;
                                prbs[4]  <= prbs[20] ^ prbs[26] ;
                                prbs[5]  <= prbs[21] ^ prbs[27] ;
                                prbs[6]  <= prbs[22] ^ prbs[28] ;
                                prbs[7]  <= prbs[23] ^ prbs[29] ;
                                prbs[8]  <= prbs[24] ^ prbs[30] ;
                                prbs[9]  <= prbs[0]  ^ prbs[25] ^ prbs[28] ;
                                prbs[10] <= prbs[1]  ^ prbs[26] ^ prbs[29] ;
                                prbs[11] <= prbs[2]  ^ prbs[27] ^ prbs[30] ;
                                prbs[12] <= prbs[0]  ^ prbs[3]  ;
                                prbs[13] <= prbs[1]  ^ prbs[4]  ;
                                prbs[14] <= prbs[2]  ^ prbs[5]  ;
                                prbs[15] <= prbs[3]  ^ prbs[6]  ;
                                prbs[16] <= prbs[4]  ^ prbs[7]  ;
                                prbs[17] <= prbs[5]  ^ prbs[8]  ;
                                prbs[18] <= prbs[6]  ^ prbs[9]  ;
                                prbs[19] <= prbs[7]  ^ prbs[10] ;
                                prbs[20] <= prbs[8]  ^ prbs[11] ;
                                prbs[21] <= prbs[9]  ^ prbs[12] ;
                                prbs[22] <= prbs[10] ^ prbs[13] ;
                                prbs[23] <= prbs[11] ^ prbs[14] ;
                                prbs[24] <= prbs[12] ^ prbs[15] ;
                                prbs[25] <= prbs[13] ^ prbs[16] ;
                                prbs[26] <= prbs[14] ^ prbs[17] ;
                                prbs[27] <= prbs[15] ^ prbs[18] ;
                                prbs[28] <= prbs[16] ^ prbs[19] ;
                                prbs[29] <= prbs[17] ^ prbs[20] ;
                                prbs[30] <= prbs[18] ^ prbs[21] ;
                                prbs[31] <= prbs[19] ^ prbs[22] ;
                                prbs[32] <= prbs[20] ^ prbs[23] ;
                                prbs[33] <= prbs[21] ^ prbs[24] ;
                                prbs[34] <= prbs[22] ^ prbs[25] ;
                                prbs[35] <= prbs[23] ^ prbs[26] ;
                                prbs[36] <= prbs[24] ^ prbs[27] ;
                                prbs[37] <= prbs[25] ^ prbs[28] ;
                                prbs[38] <= prbs[26] ^ prbs[29] ;
                                prbs[39] <= prbs[27] ^ prbs[30] ;
                            end
                            default: begin
                                prbs <= ~0;
                            end
                       endcase
                    end // end if advance_prbs
                    if (~enable) begin
                        prbs <= ~0;
                    end // end if enable
                end // end if reset_sync
            end //end always for prbs block
        // 32-bit
        end else if (ST_DATA_W == 32)begin
            always @(posedge aso_clk or posedge reset_sync) begin
                if (reset_sync) begin
                    prbs <= ~0;
                end else begin
                    if (state == ST_IDLE) begin
                        prbs <= ~0;
                    end
                    if (advance_prbs) begin
                        case (pattern_select)
                            SEL_PRBS_7 : begin
                                // PRBS 2^7-1 (T[7,6]) (parallel 32-bit serializer)
                               prbs[0]  <= prbs[2] ^ prbs[3] ^ prbs[4] ^ prbs[6] ;
                               prbs[1]  <= prbs[0] ^ prbs[3] ^ prbs[4] ^ prbs[5] ^ prbs[6];
                               prbs[2]  <= prbs[0] ^ prbs[1] ^ prbs[4] ^ prbs[5] ;
                               prbs[3]  <= prbs[1] ^ prbs[2] ^ prbs[5] ^ prbs[6] ;
                               prbs[4]  <= prbs[0] ^ prbs[2] ^ prbs[3];
                               prbs[5]  <= prbs[1] ^ prbs[3] ^ prbs[4];
                               prbs[6]  <= prbs[2] ^ prbs[4] ^ prbs[5];
                               prbs[7]  <= prbs[3] ^ prbs[5] ^ prbs[6];
                               prbs[8]  <= prbs[0] ^ prbs[4] ;
                               prbs[9]  <= prbs[1] ^ prbs[5] ;
                               prbs[10] <= prbs[2] ^ prbs[6] ;
                               prbs[11] <= prbs[0] ^ prbs[3] ^ prbs[6] ;
                               prbs[12] <= prbs[0] ^ prbs[1] ^ prbs[4] ^ prbs[6] ;
                               prbs[13] <= prbs[0] ^ prbs[1] ^ prbs[2] ^ prbs[5] ^ prbs[6];
                               prbs[14] <= prbs[0] ^ prbs[1] ^ prbs[2] ^ prbs[3] ;
                               prbs[15] <= prbs[1] ^ prbs[2] ^ prbs[3] ^ prbs[4] ;
                               prbs[16] <= prbs[2] ^ prbs[3] ^ prbs[4] ^ prbs[5] ;
                               prbs[17] <= prbs[3] ^ prbs[4] ^ prbs[5] ^ prbs[6] ;
                               prbs[18] <= prbs[0] ^ prbs[4] ^ prbs[5] ;
                               prbs[19] <= prbs[1] ^ prbs[5] ^ prbs[6] ;
                               prbs[20] <= prbs[0] ^ prbs[2] ;
                               prbs[21] <= prbs[1] ^ prbs[3] ;
                               prbs[22] <= prbs[2] ^ prbs[4] ;
                               prbs[23] <= prbs[3] ^ prbs[5] ;
                               prbs[24] <= prbs[4] ^ prbs[6] ;
                               prbs[25] <= prbs[0] ^ prbs[5] ^ prbs[6];
                               prbs[26] <= prbs[0] ^ prbs[1] ;
                               prbs[27] <= prbs[1] ^ prbs[2] ;
                               prbs[28] <= prbs[2] ^ prbs[3] ;
                               prbs[29] <= prbs[3] ^ prbs[4] ;
                               prbs[30] <= prbs[4] ^ prbs[5] ;
                               prbs[31] <= prbs[5] ^ prbs[6] ;			
                            end
                            SEL_PRBS_15 : begin
                                // PRBS 2^15 (T[15, 14]) (parallel 32-bit serializer)
                                prbs[0]  <= prbs[10] ^ prbs[11] ^ prbs[12] ^ prbs[13] ;
                                prbs[1]  <= prbs[11] ^ prbs[12] ^ prbs[13] ^ prbs[14] ;
                                prbs[2]  <= prbs[0]  ^ prbs[12] ^ prbs[13] ;
                                prbs[3]  <= prbs[1]  ^ prbs[13] ^ prbs[14] ;
                                prbs[4]  <= prbs[0]  ^ prbs[2]  ;
                                prbs[5]  <= prbs[1]  ^ prbs[3]  ;
                                prbs[6]  <= prbs[2]  ^ prbs[4]  ;
                                prbs[7]  <= prbs[3]  ^ prbs[5]  ;
                                prbs[8]  <= prbs[4]  ^ prbs[6]  ;
                                prbs[9]  <= prbs[5]  ^ prbs[7]  ;
                                prbs[10] <= prbs[6]  ^ prbs[8]  ;
                                prbs[11] <= prbs[7]  ^ prbs[9]  ;
                                prbs[12] <= prbs[8]  ^ prbs[10] ;
                                prbs[13] <= prbs[9]  ^ prbs[11] ;
                                prbs[14] <= prbs[10] ^ prbs[12] ;
                                prbs[15] <= prbs[11] ^ prbs[13] ;
                                prbs[16] <= prbs[12] ^ prbs[14] ;
                                prbs[17] <= prbs[0]  ^ prbs[13] ^ prbs[14] ;
                                prbs[18] <= prbs[0]  ^ prbs[1]  ;
                                prbs[19] <= prbs[1]  ^ prbs[2]  ;
                                prbs[20] <= prbs[2]  ^ prbs[3]  ;
                                prbs[21] <= prbs[3]  ^ prbs[4]  ;
                                prbs[22] <= prbs[4]  ^ prbs[5]  ;
                                prbs[23] <= prbs[5]  ^ prbs[6]  ;
                                prbs[24] <= prbs[6]  ^ prbs[7]  ;
                                prbs[25] <= prbs[7]  ^ prbs[8]  ;
                                prbs[26] <= prbs[8]  ^ prbs[9]  ;
                                prbs[27] <= prbs[9]  ^ prbs[10] ;
                                prbs[28] <= prbs[10] ^ prbs[11] ;
                                prbs[29] <= prbs[11] ^ prbs[12] ;
                                prbs[30] <= prbs[12] ^ prbs[13] ;
                                prbs[31] <= prbs[13] ^ prbs[14] ;
                            end
                            SEL_PRBS_23 : begin
                                // PRBS 2^23-1 (T[23,18]) (parallel 32-bit serializer)
                                prbs[0]  <= prbs[4]  ^ prbs[14] ;
                                prbs[1]  <= prbs[5]  ^ prbs[15] ;
                                prbs[2]  <= prbs[6]  ^ prbs[16] ;
                                prbs[3]  <= prbs[7]  ^ prbs[17] ;
                                prbs[4]  <= prbs[8]  ^ prbs[18] ;
                                prbs[5]  <= prbs[9]  ^ prbs[19] ;
                                prbs[6]  <= prbs[10] ^ prbs[20] ;
                                prbs[7]  <= prbs[11] ^ prbs[21] ;
                                prbs[8]  <= prbs[12] ^ prbs[22] ;
                                prbs[9]  <= prbs[0]  ^ prbs[13] ^ prbs[18] ;
                                prbs[10] <= prbs[1]  ^ prbs[14] ^ prbs[19] ;
                                prbs[11] <= prbs[2]  ^ prbs[15] ^ prbs[20] ;
                                prbs[12] <= prbs[3]  ^ prbs[16] ^ prbs[21] ;
                                prbs[13] <= prbs[4]  ^ prbs[17] ^ prbs[22] ;
                                prbs[14] <= prbs[0]  ^ prbs[5]  ;
                                prbs[15] <= prbs[1]  ^ prbs[6]  ;
                                prbs[16] <= prbs[2]  ^ prbs[7]  ;
                                prbs[17] <= prbs[3]  ^ prbs[8]  ;
                                prbs[18] <= prbs[4]  ^ prbs[9]  ;
                                prbs[19] <= prbs[5]  ^ prbs[10] ;
                                prbs[20] <= prbs[6]  ^ prbs[11] ;
                                prbs[21] <= prbs[7]  ^ prbs[12] ;
                                prbs[22] <= prbs[8]  ^ prbs[13] ;
                                prbs[23] <= prbs[9]  ^ prbs[14] ;
                                prbs[24] <= prbs[10] ^ prbs[15] ;
                                prbs[25] <= prbs[11] ^ prbs[16] ;
                                prbs[26] <= prbs[12] ^ prbs[17] ;
                                prbs[27] <= prbs[13] ^ prbs[18] ;
                                prbs[28] <= prbs[14] ^ prbs[19] ;
                                prbs[29] <= prbs[15] ^ prbs[20] ;
                                prbs[30] <= prbs[16] ^ prbs[21] ;
                                prbs[31] <= prbs[17] ^ prbs[22] ;
                            end
                            SEL_PRBS_31 : begin
                                // PRBS 2^31-1 (T[31,28]) (parallel 32-bit serializer)
                                prbs[0]  <= prbs[24] ^ prbs[30] ;
                                prbs[1]  <= prbs[0]  ^ prbs[25] ^ prbs[28] ;
                                prbs[2]  <= prbs[1]  ^ prbs[26] ^ prbs[29] ;
                                prbs[3]  <= prbs[2]  ^ prbs[27] ^ prbs[30] ;
                                prbs[4]  <= prbs[0]  ^ prbs[3]  ;
                                prbs[5]  <= prbs[1]  ^ prbs[4]  ;
                                prbs[6]  <= prbs[2]  ^ prbs[5]  ;
                                prbs[7]  <= prbs[3]  ^ prbs[6]  ;
                                prbs[8]  <= prbs[4]  ^ prbs[7]  ;
                                prbs[9]  <= prbs[5]  ^ prbs[8]  ;
                                prbs[10] <= prbs[6]  ^ prbs[9]  ;
                                prbs[11] <= prbs[7]  ^ prbs[10] ;
                                prbs[12] <= prbs[8]  ^ prbs[11] ;
                                prbs[13] <= prbs[9]  ^ prbs[12] ;
                                prbs[14] <= prbs[10] ^ prbs[13] ;
                                prbs[15] <= prbs[11] ^ prbs[14] ;
                                prbs[16] <= prbs[12] ^ prbs[15] ;
                                prbs[17] <= prbs[13] ^ prbs[16] ;
                                prbs[18] <= prbs[14] ^ prbs[17] ;
                                prbs[19] <= prbs[15] ^ prbs[18] ;
                                prbs[20] <= prbs[16] ^ prbs[19] ;
                                prbs[21] <= prbs[17] ^ prbs[20] ;
                                prbs[22] <= prbs[18] ^ prbs[21] ;
                                prbs[23] <= prbs[19] ^ prbs[22] ;
                                prbs[24] <= prbs[20] ^ prbs[23] ;
                                prbs[25] <= prbs[21] ^ prbs[24] ;
                                prbs[26] <= prbs[22] ^ prbs[25] ;
                                prbs[27] <= prbs[23] ^ prbs[26] ;
                                prbs[28] <= prbs[24] ^ prbs[27] ;
                                prbs[29] <= prbs[25] ^ prbs[28] ;
                                prbs[30] <= prbs[26] ^ prbs[29] ;
                                prbs[31] <= prbs[27] ^ prbs[30] ;
                            end
                            default: begin
                                prbs <= ~0;
                            end
                       endcase
                    end // end if advance_prbs
                    if (~enable) begin
                        prbs <= ~0;
                    end // end if enable
                end // end if reset_sync
            end //end always for prbs block
        end else if (ST_DATA_W == 64) begin
		    always @(posedge aso_clk or posedge reset_sync) begin
                if (reset_sync) begin
                    prbs <= ~0;
                end else begin
                    if (state == ST_IDLE) begin
                        prbs <= ~0;
                    end
                    if (advance_prbs) begin
                        case (pattern_select)
                            SEL_PRBS_7 : begin
                                // PRBS 2^7-1 (T[7,6]) (parallel 64-bit serializer)
                                    prbs[0] <=  prbs[2] ^ prbs[3] ^ prbs[5] ^ prbs[6] ;
								    prbs[1] <=  prbs[0] ^ prbs[3] ^ prbs[4] ;
      								prbs[2] <=  prbs[1] ^ prbs[4] ^ prbs[5] ;
      								prbs[3] <=  prbs[2] ^ prbs[5] ^ prbs[6] ;
      								prbs[4] <=  prbs[0] ^ prbs[3] ;
      								prbs[5] <=  prbs[1] ^ prbs[4] ;
      								prbs[6] <=  prbs[2] ^ prbs[5] ;
      								prbs[7] <=  prbs[3] ^ prbs[6] ;
      								prbs[8] <=  prbs[0] ^ prbs[4] ^ prbs[6] ;
      								prbs[9] <=  prbs[0] ^ prbs[1] ^ prbs[5] ^ prbs[6] ;
      								prbs[10] <=  prbs[0] ^ prbs[1] ^ prbs[2] ;
      								prbs[11] <=  prbs[1] ^ prbs[2] ^ prbs[3] ;
      								prbs[12] <=  prbs[2] ^ prbs[3] ^ prbs[4] ;
      								prbs[13] <=  prbs[3] ^ prbs[4] ^ prbs[5] ;
      								prbs[14] <=  prbs[4] ^ prbs[5] ^ prbs[6] ;
      								prbs[15] <=  prbs[0] ^ prbs[5] ;
      								prbs[16] <=  prbs[1] ^ prbs[6] ;
      								prbs[17] <=  prbs[0] ^ prbs[2] ^ prbs[6] ;
      								prbs[18] <=  prbs[0] ^ prbs[1] ^ prbs[3] ^ prbs[6] ;
      								prbs[19] <=  prbs[0] ^ prbs[1] ^ prbs[2] ^ prbs[4] ^ prbs[6] ;
      								prbs[20] <=  prbs[0] ^ prbs[1] ^ prbs[2] ^ prbs[3] ^ prbs[5] ^ prbs[6] ;
      								prbs[21] <=  prbs[0] ^ prbs[1] ^ prbs[2] ^ prbs[3] ^ prbs[4] ;
      								prbs[22] <=  prbs[1] ^ prbs[2] ^ prbs[3] ^ prbs[4] ^ prbs[5] ;
      								prbs[23] <=  prbs[2] ^ prbs[3] ^ prbs[4] ^ prbs[5] ^ prbs[6] ;
      								prbs[24] <=  prbs[0] ^ prbs[3] ^ prbs[4] ^ prbs[5] ;
      								prbs[25] <=  prbs[1] ^ prbs[4] ^ prbs[5] ^ prbs[6] ;
      								prbs[26] <=  prbs[0] ^ prbs[2] ^ prbs[5] ;
      								prbs[27] <=  prbs[1] ^ prbs[3] ^ prbs[6] ;
      								prbs[28] <=  prbs[0] ^ prbs[2] ^ prbs[4] ^ prbs[6] ;
      								prbs[29] <=  prbs[0] ^ prbs[1] ^ prbs[3] ^ prbs[5] ^ prbs[6] ;
      								prbs[30] <=  prbs[0] ^ prbs[1] ^ prbs[2] ^ prbs[4] ;
      								prbs[31] <=  prbs[1] ^ prbs[2] ^ prbs[3] ^ prbs[5] ;
      								prbs[32] <=  prbs[2] ^ prbs[3] ^ prbs[4] ^ prbs[6] ;
      								prbs[33] <=  prbs[0] ^ prbs[3] ^ prbs[4] ^ prbs[5] ^ prbs[6] ;
      								prbs[34] <=  prbs[0] ^ prbs[1] ^ prbs[4] ^ prbs[5] ;
      								prbs[35] <=  prbs[1] ^ prbs[2] ^ prbs[5] ^ prbs[6] ;
      								prbs[36] <=  prbs[0] ^ prbs[2] ^ prbs[3] ;
      								prbs[37] <=  prbs[1] ^ prbs[3] ^ prbs[4] ;
      								prbs[38] <=  prbs[2] ^ prbs[4] ^ prbs[5] ;
      								prbs[39] <=  prbs[3] ^ prbs[5] ^ prbs[6] ;
      								prbs[40] <=  prbs[0] ^ prbs[4] ;
      								prbs[41] <=  prbs[1] ^ prbs[5] ;
      								prbs[42] <=  prbs[2] ^ prbs[6] ;
      								prbs[43] <=  prbs[0] ^ prbs[3] ^ prbs[6] ;
      								prbs[44] <=  prbs[0] ^ prbs[1] ^ prbs[4] ^ prbs[6] ;
      								prbs[45] <=  prbs[0] ^ prbs[1] ^ prbs[2] ^ prbs[5] ^ prbs[6] ;
      								prbs[46] <=  prbs[0] ^ prbs[1] ^ prbs[2] ^ prbs[3] ;
      								prbs[47] <=  prbs[1] ^ prbs[2] ^ prbs[3] ^ prbs[4] ;
      								prbs[48] <=  prbs[2] ^ prbs[3] ^ prbs[4] ^ prbs[5] ;
      								prbs[49] <=  prbs[3] ^ prbs[4] ^ prbs[5] ^ prbs[6] ;
      								prbs[50] <=  prbs[0] ^ prbs[4] ^ prbs[5] ;
      								prbs[51] <=  prbs[1] ^ prbs[5] ^ prbs[6] ;
      								prbs[52] <=  prbs[0] ^ prbs[2] ;
      								prbs[53] <=  prbs[1] ^ prbs[3] ;
      								prbs[54] <=  prbs[2] ^ prbs[4] ;
      								prbs[55] <=  prbs[3] ^ prbs[5] ;
      								prbs[56] <=  prbs[4] ^ prbs[6] ;
      								prbs[57] <=  prbs[0] ^ prbs[5] ^ prbs[6] ;
      
      								prbs[58] <=  prbs[0] ^ prbs[1] ;
      
      								prbs[59] <=  prbs[1] ^ prbs[2] ;
      
      								prbs[60] <=  prbs[2] ^ prbs[3] ;
      
      								prbs[61] <=  prbs[3] ^ prbs[4] ;
      
      								prbs[62] <=  prbs[4] ^ prbs[5] ;
      
      								prbs[63] <=  prbs[5] ^ prbs[6] ;
                            end
                            SEL_PRBS_15 : begin
                                // PRBS 2^15 (T[15, 14]) (parallel 64-bit serializer)
                                prbs[0] <=  prbs[6] ^ prbs[7] ^ prbs[10] ^ prbs[11] ; 
								prbs[1] <=  prbs[7] ^ prbs[8] ^ prbs[11] ^ prbs[12] ; 
								prbs[2] <=  prbs[8] ^ prbs[9] ^ prbs[12] ^ prbs[13] ; 
								prbs[3] <=  prbs[9] ^ prbs[10] ^ prbs[13] ^ prbs[14] ; 
								prbs[4] <=  prbs[0] ^ prbs[10] ^ prbs[11] ; 
								prbs[5] <=  prbs[1] ^ prbs[11] ^ prbs[12] ; 
								prbs[6] <=  prbs[2] ^ prbs[12] ^ prbs[13] ; 
								prbs[7] <=  prbs[3] ^ prbs[13] ^ prbs[14] ; 
								prbs[8] <=  prbs[0] ^ prbs[4] ; 
								prbs[9] <=  prbs[1] ^ prbs[5] ; 
								prbs[10] <=  prbs[2] ^ prbs[6] ; 
								prbs[11] <=  prbs[3] ^ prbs[7] ; 
								prbs[12] <=  prbs[4] ^ prbs[8] ; 
								prbs[13] <=  prbs[5] ^ prbs[9] ; 
								prbs[14] <=  prbs[6] ^ prbs[10] ; 
								prbs[15] <=  prbs[7] ^ prbs[11] ; 
								prbs[16] <=  prbs[8] ^ prbs[12] ; 
								prbs[17] <=  prbs[9] ^ prbs[13] ; 
								prbs[18] <=  prbs[10] ^ prbs[14] ; 
								prbs[19] <=  prbs[0] ^ prbs[11] ^ prbs[14] ; 
								prbs[20] <=  prbs[0] ^ prbs[1] ^ prbs[12] ^ prbs[14] ; 
								prbs[21] <=  prbs[0] ^ prbs[1] ^ prbs[2] ^ prbs[13] ^ prbs[14] ; 
								prbs[22] <=  prbs[0] ^ prbs[1] ^ prbs[2] ^ prbs[3] ; 
								prbs[23] <=  prbs[1] ^ prbs[2] ^ prbs[3] ^ prbs[4] ; 
								prbs[24] <=  prbs[2] ^ prbs[3] ^ prbs[4] ^ prbs[5] ; 
								prbs[25] <=  prbs[3] ^ prbs[4] ^ prbs[5] ^ prbs[6] ; 
								prbs[26] <=  prbs[4] ^ prbs[5] ^ prbs[6] ^ prbs[7] ; 
								prbs[27] <=  prbs[5] ^ prbs[6] ^ prbs[7] ^ prbs[8] ; 
								prbs[28] <=  prbs[6] ^ prbs[7] ^ prbs[8] ^ prbs[9] ; 
								prbs[29] <=  prbs[7] ^ prbs[8] ^ prbs[9] ^ prbs[10] ; 
								prbs[30] <=  prbs[8] ^ prbs[9] ^ prbs[10] ^ prbs[11] ; 
								prbs[31] <=  prbs[9] ^ prbs[10] ^ prbs[11] ^ prbs[12] ; 
								prbs[32] <=  prbs[10] ^ prbs[11] ^ prbs[12] ^ prbs[13] ; 
								prbs[33] <=  prbs[11] ^ prbs[12] ^ prbs[13] ^ prbs[14] ; 
								prbs[34] <=  prbs[0] ^ prbs[12] ^ prbs[13] ; 
								prbs[35] <=  prbs[1] ^ prbs[13] ^ prbs[14] ; 
								prbs[36] <=  prbs[0] ^ prbs[2] ; 
								prbs[37] <=  prbs[1] ^ prbs[3] ; 
								prbs[38] <=  prbs[2] ^ prbs[4] ; 
								prbs[39] <=  prbs[3] ^ prbs[5] ; 
								prbs[40] <=  prbs[4] ^ prbs[6] ; 
								prbs[41] <=  prbs[5] ^ prbs[7] ; 
								prbs[42] <=  prbs[6] ^ prbs[8] ; 
								prbs[43] <=  prbs[7] ^ prbs[9] ; 
								prbs[44] <=  prbs[8] ^ prbs[10] ; 
								prbs[45] <=  prbs[9] ^ prbs[11] ; 
								prbs[46] <=  prbs[10] ^ prbs[12] ; 
								prbs[47] <=  prbs[11] ^ prbs[13] ; 
								prbs[48] <=  prbs[12] ^ prbs[14] ; 
								prbs[49] <=  prbs[0] ^ prbs[13] ^ prbs[14] ; 
								prbs[50] <=  prbs[0] ^ prbs[1] ; 
								prbs[51] <=  prbs[1] ^ prbs[2] ; 
								prbs[52] <=  prbs[2] ^ prbs[3] ; 
								prbs[53] <=  prbs[3] ^ prbs[4] ; 
								prbs[54] <=  prbs[4] ^ prbs[5] ; 
								prbs[55] <=  prbs[5] ^ prbs[6] ; 
								prbs[56] <=  prbs[6] ^ prbs[7] ; 
								prbs[57] <=  prbs[7] ^ prbs[8] ; 
								prbs[58] <=  prbs[8] ^ prbs[9] ; 
								prbs[59] <=  prbs[9] ^ prbs[10] ; 
								prbs[60] <=  prbs[10] ^ prbs[11] ; 
								prbs[61] <=  prbs[11] ^ prbs[12] ; 
								prbs[62] <=  prbs[12] ^ prbs[13] ; 
								prbs[63] <=  prbs[13] ^ prbs[14] ; 
                            end
                            SEL_PRBS_23 : begin
                                // PRBS 2^23-1 (T[23,18]) (parallel 64-bit serializer)
                                prbs[0] <=  prbs[0] ^ prbs[5] ^ prbs[8] ^ prbs[18] ;
								prbs[1] <=  prbs[1] ^ prbs[6] ^ prbs[9] ^ prbs[19] ;
								prbs[2] <=  prbs[2] ^ prbs[7] ^ prbs[10] ^ prbs[20] ;
								prbs[3] <=  prbs[3] ^ prbs[8] ^ prbs[11] ^ prbs[21] ;
								prbs[4] <=  prbs[4] ^ prbs[9] ^ prbs[12] ^ prbs[22] ;
								prbs[5] <=  prbs[0] ^ prbs[5] ^ prbs[10] ^ prbs[13] ^ prbs[18] ;
								prbs[6] <=  prbs[1] ^ prbs[6] ^ prbs[11] ^ prbs[14] ^ prbs[19] ;
								prbs[7] <=  prbs[2] ^ prbs[7] ^ prbs[12] ^ prbs[15] ^ prbs[20] ;
								prbs[8] <=  prbs[3] ^ prbs[8] ^ prbs[13] ^ prbs[16] ^ prbs[21] ;
								prbs[9] <=  prbs[4] ^ prbs[9] ^ prbs[14] ^ prbs[17] ^ prbs[22] ;
								prbs[10] <=  prbs[0] ^ prbs[5] ^ prbs[10] ^ prbs[15] ;
								prbs[11] <=  prbs[1] ^ prbs[6] ^ prbs[11] ^ prbs[16] ;
								prbs[12] <=  prbs[2] ^ prbs[7] ^ prbs[12] ^ prbs[17] ;
								prbs[13] <=  prbs[3] ^ prbs[8] ^ prbs[13] ^ prbs[18] ;
								prbs[14] <=  prbs[4] ^ prbs[9] ^ prbs[14] ^ prbs[19] ;
								prbs[15] <=  prbs[5] ^ prbs[10] ^ prbs[15] ^ prbs[20] ;
								prbs[16] <=  prbs[6] ^ prbs[11] ^ prbs[16] ^ prbs[21] ;
								prbs[17] <=  prbs[7] ^ prbs[12] ^ prbs[17] ^ prbs[22] ;
								prbs[18] <=  prbs[0] ^ prbs[8] ^ prbs[13] ;
								prbs[19] <=  prbs[1] ^ prbs[9] ^ prbs[14] ;
								prbs[20] <=  prbs[2] ^ prbs[10] ^ prbs[15] ;
								prbs[21] <=  prbs[3] ^ prbs[11] ^ prbs[16] ;
								prbs[22] <=  prbs[4] ^ prbs[12] ^ prbs[17] ;
								prbs[23] <=  prbs[5] ^ prbs[13] ^ prbs[18] ;
								prbs[24] <=  prbs[6] ^ prbs[14] ^ prbs[19] ;
								prbs[25] <=  prbs[7] ^ prbs[15] ^ prbs[20] ;
								prbs[26] <=  prbs[8] ^ prbs[16] ^ prbs[21] ;
								prbs[27] <=  prbs[9] ^ prbs[17] ^ prbs[22] ;
								prbs[28] <=  prbs[0] ^ prbs[10] ;
								prbs[29] <=  prbs[1] ^ prbs[11] ;
								prbs[30] <=  prbs[2] ^ prbs[12] ;
								prbs[31] <=  prbs[3] ^ prbs[13] ;
								prbs[32] <=  prbs[4] ^ prbs[14] ;
								prbs[33] <=  prbs[5] ^ prbs[15] ;
								prbs[34] <=  prbs[6] ^ prbs[16] ;
								prbs[35] <=  prbs[7] ^ prbs[17] ;
								prbs[36] <=  prbs[8] ^ prbs[18] ;
								prbs[37] <=  prbs[9] ^ prbs[19] ;
								prbs[38] <=  prbs[10] ^ prbs[20] ;
								prbs[39] <=  prbs[11] ^ prbs[21] ;
								prbs[40] <=  prbs[12] ^ prbs[22] ;
								prbs[41] <=  prbs[0] ^ prbs[13] ^ prbs[18] ;
								prbs[42] <=  prbs[1] ^ prbs[14] ^ prbs[19] ;
								prbs[43] <=  prbs[2] ^ prbs[15] ^ prbs[20] ;
								prbs[44] <=  prbs[3] ^ prbs[16] ^ prbs[21] ;
								prbs[45] <=  prbs[4] ^ prbs[17] ^ prbs[22] ;
								prbs[46] <=  prbs[0] ^ prbs[5] ;
								prbs[47] <=  prbs[1] ^ prbs[6] ;
								prbs[48] <=  prbs[2] ^ prbs[7] ;
								prbs[49] <=  prbs[3] ^ prbs[8] ;
								prbs[50] <=  prbs[4] ^ prbs[9] ;
								prbs[51] <=  prbs[5] ^ prbs[10] ;
								prbs[52] <=  prbs[6] ^ prbs[11] ;
								prbs[53] <=  prbs[7] ^ prbs[12] ;
								prbs[54] <=  prbs[8] ^ prbs[13] ;
								prbs[55] <=  prbs[9] ^ prbs[14] ;
								prbs[56] <=  prbs[10] ^ prbs[15] ;
								prbs[57] <=  prbs[11] ^ prbs[16] ;
								prbs[58] <=  prbs[12] ^ prbs[17] ;
								prbs[59] <=  prbs[13] ^ prbs[18] ;
								prbs[60] <=  prbs[14] ^ prbs[19] ;
								prbs[61] <=  prbs[15] ^ prbs[20] ;
								prbs[62] <=  prbs[16] ^ prbs[21] ;
								prbs[63] <=  prbs[17] ^ prbs[22] ;
                            end
                            SEL_PRBS_31 : begin
                                // PRBS 2^31-1 (T[31,28]) (parallel 64-bit serializer)
                                prbs[0] <=  prbs[20] ^ prbs[23] ^ prbs[26] ^ prbs[29] ; 
								prbs[1] <=  prbs[21] ^ prbs[24] ^ prbs[27] ^ prbs[30] ; 
								prbs[2] <=  prbs[0] ^ prbs[22] ^ prbs[25] ; 
								prbs[3] <=  prbs[1] ^ prbs[23] ^ prbs[26] ; 
								prbs[4] <=  prbs[2] ^ prbs[24] ^ prbs[27] ; 
								prbs[5] <=  prbs[3] ^ prbs[25] ^ prbs[28] ; 
								prbs[6] <=  prbs[4] ^ prbs[26] ^ prbs[29] ; 
								prbs[7] <=  prbs[5] ^ prbs[27] ^ prbs[30] ; 
								prbs[8] <=  prbs[0] ^ prbs[6] ; 
								prbs[9] <=  prbs[1] ^ prbs[7] ; 
								prbs[10] <=  prbs[2] ^ prbs[8] ; 
								prbs[11] <=  prbs[3] ^ prbs[9] ; 
								prbs[12] <=  prbs[4] ^ prbs[10] ; 
								prbs[13] <=  prbs[5] ^ prbs[11] ; 
								prbs[14] <=  prbs[6] ^ prbs[12] ; 
								prbs[15] <=  prbs[7] ^ prbs[13] ; 
								prbs[16] <=  prbs[8] ^ prbs[14] ; 
								prbs[17] <=  prbs[9] ^ prbs[15] ; 
								prbs[18] <=  prbs[10] ^ prbs[16] ; 
								prbs[19] <=  prbs[11] ^ prbs[17] ; 
								prbs[20] <=  prbs[12] ^ prbs[18] ; 
								prbs[21] <=  prbs[13] ^ prbs[19] ; 
								prbs[22] <=  prbs[14] ^ prbs[20] ; 
								prbs[23] <=  prbs[15] ^ prbs[21] ; 
								prbs[24] <=  prbs[16] ^ prbs[22] ; 
								prbs[25] <=  prbs[17] ^ prbs[23] ; 
								prbs[26] <=  prbs[18] ^ prbs[24] ; 
								prbs[27] <=  prbs[19] ^ prbs[25] ; 
								prbs[28] <=  prbs[20] ^ prbs[26] ; 
								prbs[29] <=  prbs[21] ^ prbs[27] ; 
								prbs[30] <=  prbs[22] ^ prbs[28] ; 
								prbs[31] <=  prbs[23] ^ prbs[29] ; 
								prbs[32] <=  prbs[24] ^ prbs[30] ; 
								prbs[33] <=  prbs[0] ^ prbs[25] ^ prbs[28] ; 
								prbs[34] <=  prbs[1] ^ prbs[26] ^ prbs[29] ; 
								prbs[35] <=  prbs[2] ^ prbs[27] ^ prbs[30] ; 
								prbs[36] <=  prbs[0] ^ prbs[3] ; 
								prbs[37] <=  prbs[1] ^ prbs[4] ; 
								prbs[38] <=  prbs[2] ^ prbs[5] ; 
								prbs[39] <=  prbs[3] ^ prbs[6] ; 
								prbs[40] <=  prbs[4] ^ prbs[7] ; 
								prbs[41] <=  prbs[5] ^ prbs[8] ; 
								prbs[42] <=  prbs[6] ^ prbs[9] ; 
								prbs[43] <=  prbs[7] ^ prbs[10] ; 
								prbs[44] <=  prbs[8] ^ prbs[11] ; 
								prbs[45] <=  prbs[9] ^ prbs[12] ; 
								prbs[46] <=  prbs[10] ^ prbs[13] ; 
								prbs[47] <=  prbs[11] ^ prbs[14] ; 
								prbs[48] <=  prbs[12] ^ prbs[15] ; 
								prbs[49] <=  prbs[13] ^ prbs[16] ; 
								prbs[50] <=  prbs[14] ^ prbs[17] ; 
								prbs[51] <=  prbs[15] ^ prbs[18] ; 
								prbs[52] <=  prbs[16] ^ prbs[19] ; 
								prbs[53] <=  prbs[17] ^ prbs[20] ; 
								prbs[54] <=  prbs[18] ^ prbs[21] ; 
								prbs[55] <=  prbs[19] ^ prbs[22] ; 
								prbs[56] <=  prbs[20] ^ prbs[23] ; 
								prbs[57] <=  prbs[21] ^ prbs[24] ; 
								prbs[58] <=  prbs[22] ^ prbs[25] ; 
								prbs[59] <=  prbs[23] ^ prbs[26] ; 
								prbs[60] <=  prbs[24] ^ prbs[27] ; 
								prbs[61] <=  prbs[25] ^ prbs[28] ; 
								prbs[62] <=  prbs[26] ^ prbs[29] ; 
								prbs[63] <=  prbs[27] ^ prbs[30] ; 
                            end
                            default: begin
                                prbs <= ~0;
                            end
                       endcase
                    end // end if advance_prbs
                    if (~enable) begin
                        prbs <= ~0;
                    end // end if enable
                end // end if reset_sync
            end //end always for prbs block
		end else if (ST_DATA_W == 66) begin
		    always @(posedge aso_clk or posedge reset_sync) begin
                if (reset_sync) begin
                    prbs <= ~0;
                end else begin
                    if (state == ST_IDLE) begin
                        prbs <= ~0;
                    end
                    if (advance_prbs) begin
                        case (pattern_select)
                            SEL_PRBS_7 : begin
                                // PRBS 2^7-1 (T[7,6]) (parallel 66-bit serializer)
                                prbs[0] <=  prbs[0] ^  prbs[1] ^  prbs[3] ^  prbs[4] ; 
								prbs[1] <=  prbs[1] ^  prbs[2] ^  prbs[4] ^  prbs[5] ; 
								prbs[2] <=  prbs[2] ^  prbs[3] ^  prbs[5] ^  prbs[6] ; 
								prbs[3] <=  prbs[0] ^  prbs[3] ^  prbs[4] ; 
								prbs[4] <=  prbs[1] ^  prbs[4] ^  prbs[5] ; 
								prbs[5] <=  prbs[2] ^  prbs[5] ^  prbs[6] ; 
								prbs[6] <=  prbs[0] ^  prbs[3] ; 
								prbs[7] <=  prbs[1] ^  prbs[4] ; 
								prbs[8] <=  prbs[2] ^  prbs[5] ; 
								prbs[9] <=  prbs[3] ^  prbs[6] ; 
								prbs[10] <=  prbs[0] ^  prbs[4] ^  prbs[6] ; 
								prbs[11] <=  prbs[0] ^  prbs[1] ^  prbs[5] ^  prbs[6] ; 
								prbs[12] <=  prbs[0] ^  prbs[1] ^  prbs[2] ; 
								prbs[13] <=  prbs[1] ^  prbs[2] ^  prbs[3] ; 
								prbs[14] <=  prbs[2] ^  prbs[3] ^  prbs[4] ; 
								prbs[15] <=  prbs[3] ^  prbs[4] ^  prbs[5] ; 
								prbs[16] <=  prbs[4] ^  prbs[5] ^  prbs[6] ; 
								prbs[17] <=  prbs[0] ^  prbs[5] ; 
								prbs[18] <=  prbs[1] ^  prbs[6] ; 
								prbs[19] <=  prbs[0] ^  prbs[2] ^  prbs[6] ; 
								prbs[20] <=  prbs[0] ^  prbs[1] ^  prbs[3] ^  prbs[6] ; 
								prbs[21] <=  prbs[0] ^  prbs[1] ^  prbs[2] ^  prbs[4] ^  prbs[6] ; 
								prbs[22] <=  prbs[0] ^  prbs[1] ^  prbs[2] ^  prbs[3] ^  prbs[5] ^  prbs[6] ; 
								prbs[23] <=  prbs[0] ^  prbs[1] ^  prbs[2] ^  prbs[3] ^  prbs[4] ; 
								prbs[24] <=  prbs[1] ^  prbs[2] ^  prbs[3] ^  prbs[4] ^  prbs[5] ; 
								prbs[25] <=  prbs[2] ^  prbs[3] ^  prbs[4] ^  prbs[5] ^  prbs[6] ; 
								prbs[26] <=  prbs[0] ^  prbs[3] ^  prbs[4] ^  prbs[5] ; 
								prbs[27] <=  prbs[1] ^  prbs[4] ^  prbs[5] ^  prbs[6] ; 
								prbs[28] <=  prbs[0] ^  prbs[2] ^  prbs[5] ; 
								prbs[29] <=  prbs[1] ^  prbs[3] ^  prbs[6] ; 
								prbs[30] <=  prbs[0] ^  prbs[2] ^  prbs[4] ^  prbs[6] ; 
								prbs[31] <=  prbs[0] ^  prbs[1] ^  prbs[3] ^  prbs[5] ^  prbs[6] ; 
								prbs[32] <=  prbs[0] ^  prbs[1] ^  prbs[2] ^  prbs[4] ; 
								prbs[33] <=  prbs[1] ^  prbs[2] ^  prbs[3] ^  prbs[5] ; 
								prbs[34] <=  prbs[2] ^  prbs[3] ^  prbs[4] ^  prbs[6] ; 
								prbs[35] <=  prbs[0] ^  prbs[3] ^  prbs[4] ^  prbs[5] ^  prbs[6] ; 
								prbs[36] <=  prbs[0] ^  prbs[1] ^  prbs[4] ^  prbs[5] ; 
								prbs[37] <=  prbs[1] ^  prbs[2] ^  prbs[5] ^  prbs[6] ; 
								prbs[38] <=  prbs[0] ^  prbs[2] ^  prbs[3] ; 
								prbs[39] <=  prbs[1] ^  prbs[3] ^  prbs[4] ; 
								prbs[40] <=  prbs[2] ^  prbs[4] ^  prbs[5] ; 
								prbs[41] <=  prbs[3] ^  prbs[5] ^  prbs[6] ; 
								prbs[42] <=  prbs[0] ^  prbs[4] ; 
								prbs[43] <=  prbs[1] ^  prbs[5] ; 
								prbs[44] <=  prbs[2] ^  prbs[6] ; 
								prbs[45] <=  prbs[0] ^  prbs[3] ^  prbs[6] ; 
								prbs[46] <=  prbs[0] ^  prbs[1] ^  prbs[4] ^  prbs[6] ; 
								prbs[47] <=  prbs[0] ^  prbs[1] ^  prbs[2] ^  prbs[5] ^  prbs[6] ; 
								prbs[48] <=  prbs[0] ^  prbs[1] ^  prbs[2] ^  prbs[3] ; 
								prbs[49] <=  prbs[1] ^  prbs[2] ^  prbs[3] ^  prbs[4] ; 
								prbs[50] <=  prbs[2] ^  prbs[3] ^  prbs[4] ^  prbs[5] ; 
								prbs[51] <=  prbs[3] ^  prbs[4] ^  prbs[5] ^  prbs[6] ; 
								prbs[52] <=  prbs[0] ^  prbs[4] ^  prbs[5] ; 
								prbs[53] <=  prbs[1] ^  prbs[5] ^  prbs[6] ; 
								prbs[54] <=  prbs[0] ^  prbs[2] ; 
								prbs[55] <=  prbs[1] ^  prbs[3] ; 
								prbs[56] <=  prbs[2] ^  prbs[4] ; 
								prbs[57] <=  prbs[3] ^  prbs[5] ; 
								prbs[58] <=  prbs[4] ^  prbs[6] ; 
								prbs[59] <=  prbs[0] ^  prbs[5] ^  prbs[6] ; 
								prbs[60] <=  prbs[0] ^  prbs[1] ; 
								prbs[61] <=  prbs[1] ^  prbs[2] ; 
								prbs[62] <=  prbs[2] ^  prbs[3] ; 
								prbs[63] <=  prbs[3] ^  prbs[4] ; 
								prbs[64] <=  prbs[4] ^  prbs[5] ; 
								prbs[65] <=  prbs[5] ^  prbs[6] ; 
                            end
                            SEL_PRBS_15 : begin
                                // PRBS 2^15 (T[15, 14]) (parallel 66-bit serializer)
                                prbs[0] <=  prbs[4] ^ prbs[5] ^ prbs[8] ^ prbs[9]; 
								prbs[1] <=  prbs[5] ^ prbs[6] ^ prbs[9] ^ prbs[10]; 
								prbs[2] <=  prbs[6] ^ prbs[7] ^ prbs[10] ^ prbs[11]; 
								prbs[3] <=  prbs[7] ^ prbs[8] ^ prbs[11] ^ prbs[12]; 
								prbs[4] <=  prbs[8] ^ prbs[9] ^ prbs[12] ^ prbs[13]; 
								prbs[5] <=  prbs[9] ^ prbs[10] ^ prbs[13] ^ prbs[14]; 
								prbs[6] <=  prbs[0] ^ prbs[10] ^ prbs[11]; 
								prbs[7] <=  prbs[1] ^ prbs[11] ^ prbs[12]; 
								prbs[8] <=  prbs[2] ^ prbs[12] ^ prbs[13]; 
								prbs[9] <=  prbs[3] ^ prbs[13] ^ prbs[14]; 
								prbs[10] <=  prbs[0] ^ prbs[4]; 
								prbs[11] <=  prbs[1] ^ prbs[5]; 
								prbs[12] <=  prbs[2] ^ prbs[6]; 
								prbs[13] <=  prbs[3] ^ prbs[7]; 
								prbs[14] <=  prbs[4] ^ prbs[8]; 
								prbs[15] <=  prbs[5] ^ prbs[9]; 
								prbs[16] <=  prbs[6] ^ prbs[10]; 
								prbs[17] <=  prbs[7] ^ prbs[11]; 
								prbs[18] <=  prbs[8] ^ prbs[12]; 
								prbs[19] <=  prbs[9] ^ prbs[13]; 
								prbs[20] <=  prbs[10] ^ prbs[14]; 
								prbs[21] <=  prbs[0] ^ prbs[11] ^ prbs[14]; 
								prbs[22] <=  prbs[0] ^ prbs[1] ^ prbs[12] ^ prbs[14]; 
								prbs[23] <=  prbs[0] ^ prbs[1] ^ prbs[2] ^ prbs[13] ^ prbs[14]; 
								prbs[24] <=  prbs[0] ^ prbs[1] ^ prbs[2] ^ prbs[3]; 
								prbs[25] <=  prbs[1] ^ prbs[2] ^ prbs[3] ^ prbs[4]; 
								prbs[26] <=  prbs[2] ^ prbs[3] ^ prbs[4] ^ prbs[5]; 
								prbs[27] <=  prbs[3] ^ prbs[4] ^ prbs[5] ^ prbs[6]; 
								prbs[28] <=  prbs[4] ^ prbs[5] ^ prbs[6] ^ prbs[7]; 
								prbs[29] <=  prbs[5] ^ prbs[6] ^ prbs[7] ^ prbs[8]; 
								prbs[30] <=  prbs[6] ^ prbs[7] ^ prbs[8] ^ prbs[9]; 
								prbs[31] <=  prbs[7] ^ prbs[8] ^ prbs[9] ^ prbs[10]; 
								prbs[32] <=  prbs[8] ^ prbs[9] ^ prbs[10] ^ prbs[11]; 
								prbs[33] <=  prbs[9] ^ prbs[10] ^ prbs[11] ^ prbs[12]; 
								prbs[34] <=  prbs[10] ^ prbs[11] ^ prbs[12] ^ prbs[13]; 
								prbs[35] <=  prbs[11] ^ prbs[12] ^ prbs[13] ^ prbs[14]; 
								prbs[36] <=  prbs[0] ^ prbs[12] ^ prbs[13]; 
								prbs[37] <=  prbs[1] ^ prbs[13] ^ prbs[14]; 
								prbs[38] <=  prbs[0] ^ prbs[2]; 
								prbs[39] <=  prbs[1] ^ prbs[3]; 
								prbs[40] <=  prbs[2] ^ prbs[4]; 
								prbs[41] <=  prbs[3] ^ prbs[5]; 
								prbs[42] <=  prbs[4] ^ prbs[6]; 
								prbs[43] <=  prbs[5] ^ prbs[7]; 
								prbs[44] <=  prbs[6] ^ prbs[8]; 
								prbs[45] <=  prbs[7] ^ prbs[9]; 
								prbs[46] <=  prbs[8] ^ prbs[10]; 
								prbs[47] <=  prbs[9] ^ prbs[11]; 
								prbs[48] <=  prbs[10] ^ prbs[12]; 
								prbs[49] <=  prbs[11] ^ prbs[13]; 
								prbs[50] <=  prbs[12] ^ prbs[14]; 
								prbs[51] <=  prbs[0] ^ prbs[13] ^ prbs[14]; 
								prbs[52] <=  prbs[0] ^ prbs[1]; 
								prbs[53] <=  prbs[1] ^ prbs[2]; 
								prbs[54] <=  prbs[2] ^ prbs[3]; 
								prbs[55] <=  prbs[3] ^ prbs[4]; 
								prbs[56] <=  prbs[4] ^ prbs[5]; 
								prbs[57] <=  prbs[5] ^ prbs[6]; 
								prbs[58] <=  prbs[6] ^ prbs[7]; 
								prbs[59] <=  prbs[7] ^ prbs[8]; 
								prbs[60] <=  prbs[8] ^ prbs[9]; 
								prbs[61] <=  prbs[9] ^ prbs[10]; 
								prbs[62] <=  prbs[10] ^ prbs[11]; 
								prbs[63] <=  prbs[11] ^ prbs[12]; 
								prbs[64] <=  prbs[12] ^ prbs[13]; 
								prbs[65] <=  prbs[13] ^ prbs[14]; 
                            end
                            SEL_PRBS_23 : begin
                                // PRBS 2^23-1 (T[23,18]) (parallel 66-bit serializer)
                                prbs[0] <=  prbs[3] ^ prbs[6] ^ prbs[21] ; 
								prbs[1] <=  prbs[4] ^ prbs[7] ^ prbs[22] ; 
								prbs[2] <=  prbs[0] ^ prbs[5] ^ prbs[8] ^ prbs[18] ; 
								prbs[3] <=  prbs[1] ^ prbs[6] ^ prbs[9] ^ prbs[19] ; 
								prbs[4] <=  prbs[2] ^ prbs[7] ^ prbs[10] ^ prbs[20] ; 
								prbs[5] <=  prbs[3] ^ prbs[8] ^ prbs[11] ^ prbs[21] ; 
								prbs[6] <=  prbs[4] ^ prbs[9] ^ prbs[12] ^ prbs[22] ; 
								prbs[7] <=  prbs[0] ^ prbs[5] ^ prbs[10] ^ prbs[13] ^ prbs[18] ; 
								prbs[8] <=  prbs[1] ^ prbs[6] ^ prbs[11] ^ prbs[14] ^ prbs[19] ; 
								prbs[9] <=  prbs[2] ^ prbs[7] ^ prbs[12] ^ prbs[15] ^ prbs[20] ; 
								prbs[10] <=  prbs[3] ^ prbs[8] ^ prbs[13] ^ prbs[16] ^ prbs[21] ; 
								prbs[11] <=  prbs[4] ^ prbs[9] ^ prbs[14] ^ prbs[17] ^ prbs[22] ; 
								prbs[12] <=  prbs[0] ^ prbs[5] ^ prbs[10] ^ prbs[15] ; 
								prbs[13] <=  prbs[1] ^ prbs[6] ^ prbs[11] ^ prbs[16] ; 
								prbs[14] <=  prbs[2] ^ prbs[7] ^ prbs[12] ^ prbs[17] ; 
								prbs[15] <=  prbs[3] ^ prbs[8] ^ prbs[13] ^ prbs[18] ; 
								prbs[16] <=  prbs[4] ^ prbs[9] ^ prbs[14] ^ prbs[19] ; 
								prbs[17] <=  prbs[5] ^ prbs[10] ^ prbs[15] ^ prbs[20] ; 
								prbs[18] <=  prbs[6] ^ prbs[11] ^ prbs[16] ^ prbs[21] ; 
								prbs[19] <=  prbs[7] ^ prbs[12] ^ prbs[17] ^ prbs[22] ; 
								prbs[20] <=  prbs[0] ^ prbs[8] ^ prbs[13] ; 
								prbs[21] <=  prbs[1] ^ prbs[9] ^ prbs[14] ; 
								prbs[22] <=  prbs[2] ^ prbs[10] ^ prbs[15] ; 
								prbs[23] <=  prbs[3] ^ prbs[11] ^ prbs[16] ; 
								prbs[24] <=  prbs[4] ^ prbs[12] ^ prbs[17] ; 
								prbs[25] <=  prbs[5] ^ prbs[13] ^ prbs[18] ; 
								prbs[26] <=  prbs[6] ^ prbs[14] ^ prbs[19] ; 
								prbs[27] <=  prbs[7] ^ prbs[15] ^ prbs[20] ; 
								prbs[28] <=  prbs[8] ^ prbs[16] ^ prbs[21] ; 
								prbs[29] <=  prbs[9] ^ prbs[17] ^ prbs[22] ; 
								prbs[30] <=  prbs[0] ^ prbs[10] ; 
								prbs[31] <=  prbs[1] ^ prbs[11] ; 
								prbs[32] <=  prbs[2] ^ prbs[12] ; 
								prbs[33] <=  prbs[3] ^ prbs[13] ; 
								prbs[34] <=  prbs[4] ^ prbs[14] ; 
								prbs[35] <=  prbs[5] ^ prbs[15] ; 
								prbs[36] <=  prbs[6] ^ prbs[16] ; 
								prbs[37] <=  prbs[7] ^ prbs[17] ; 
								prbs[38] <=  prbs[8] ^ prbs[18] ; 
								prbs[39] <=  prbs[9] ^ prbs[19] ; 
								prbs[40] <=  prbs[10] ^ prbs[20] ; 
								prbs[41] <=  prbs[11] ^ prbs[21] ; 
								prbs[42] <=  prbs[12] ^ prbs[22] ; 
								prbs[43] <=  prbs[0] ^ prbs[13] ^ prbs[18] ; 
								prbs[44] <=  prbs[1] ^ prbs[14] ^ prbs[19] ; 
								prbs[45] <=  prbs[2] ^ prbs[15] ^ prbs[20] ; 
								prbs[46] <=  prbs[3] ^ prbs[16] ^ prbs[21] ; 
								prbs[47] <=  prbs[4] ^ prbs[17] ^ prbs[22] ; 
								prbs[48] <=  prbs[0] ^ prbs[5] ; 
								prbs[49] <=  prbs[1] ^ prbs[6] ; 
								prbs[50] <=  prbs[2] ^ prbs[7] ; 
								prbs[51] <=  prbs[3] ^ prbs[8] ; 
								prbs[52] <=  prbs[4] ^ prbs[9] ; 
								prbs[53] <=  prbs[5] ^ prbs[10] ; 
								prbs[54] <=  prbs[6] ^ prbs[11] ; 
								prbs[55] <=  prbs[7] ^ prbs[12] ; 
								prbs[56] <=  prbs[8] ^ prbs[13] ; 
								prbs[57] <=  prbs[9] ^ prbs[14] ; 
								prbs[58] <=  prbs[10] ^ prbs[15] ; 
								prbs[59] <=  prbs[11] ^ prbs[16] ; 
								prbs[60] <=  prbs[12] ^ prbs[17] ; 
								prbs[61] <=  prbs[13] ^ prbs[18] ; 
								prbs[62] <=  prbs[14] ^ prbs[19] ; 
								prbs[63] <=  prbs[15] ^ prbs[20] ; 
								prbs[64] <=  prbs[16] ^ prbs[21] ; 
								prbs[65] <=  prbs[17] ^ prbs[22] ; 
                            end
                            SEL_PRBS_31 : begin
                                // PRBS 2^31-1 (T[31,28]) (parallel 66-bit serializer)
                                prbs[0] <=  prbs[18] ^ prbs[21] ^ prbs[24] ^ prbs[27]; 
								prbs[1] <=  prbs[19] ^ prbs[22] ^ prbs[25] ^ prbs[28]; 
								prbs[2] <=  prbs[20] ^ prbs[23] ^ prbs[26] ^ prbs[29]; 
								prbs[3] <=  prbs[21] ^ prbs[24] ^ prbs[27] ^ prbs[30]; 
								prbs[4] <=  prbs[0] ^ prbs[22] ^ prbs[25]; 
								prbs[5] <=  prbs[1] ^ prbs[23] ^ prbs[26]; 
								prbs[6] <=  prbs[2] ^ prbs[24] ^ prbs[27]; 
								prbs[7] <=  prbs[3] ^ prbs[25] ^ prbs[28]; 
								prbs[8] <=  prbs[4] ^ prbs[26] ^ prbs[29]; 
								prbs[9] <=  prbs[5] ^ prbs[27] ^ prbs[30]; 
								prbs[10] <=  prbs[0] ^ prbs[6]; 
								prbs[11] <=  prbs[1] ^ prbs[7]; 
								prbs[12] <=  prbs[2] ^ prbs[8]; 
								prbs[13] <=  prbs[3] ^ prbs[9]; 
								prbs[14] <=  prbs[4] ^ prbs[10]; 
								prbs[15] <=  prbs[5] ^ prbs[11]; 
								prbs[16] <=  prbs[6] ^ prbs[12]; 
								prbs[17] <=  prbs[7] ^ prbs[13]; 
								prbs[18] <=  prbs[8] ^ prbs[14]; 
								prbs[19] <=  prbs[9] ^ prbs[15]; 
								prbs[20] <=  prbs[10] ^ prbs[16]; 
								prbs[21] <=  prbs[11] ^ prbs[17]; 
								prbs[22] <=  prbs[12] ^ prbs[18]; 
								prbs[23] <=  prbs[13] ^ prbs[19]; 
								prbs[24] <=  prbs[14] ^ prbs[20]; 
								prbs[25] <=  prbs[15] ^ prbs[21]; 
								prbs[26] <=  prbs[16] ^ prbs[22]; 
								prbs[27] <=  prbs[17] ^ prbs[23]; 
								prbs[28] <=  prbs[18] ^ prbs[24]; 
								prbs[29] <=  prbs[19] ^ prbs[25]; 
								prbs[30] <=  prbs[20] ^ prbs[26]; 
								prbs[31] <=  prbs[21] ^ prbs[27]; 
								prbs[32] <=  prbs[22] ^ prbs[28]; 
								prbs[33] <=  prbs[23] ^ prbs[29]; 
								prbs[34] <=  prbs[24] ^ prbs[30]; 
								prbs[35] <=  prbs[0] ^ prbs[25] ^ prbs[28]; 
								prbs[36] <=  prbs[1] ^ prbs[26] ^ prbs[29]; 
								prbs[37] <=  prbs[2] ^ prbs[27] ^ prbs[30]; 
								prbs[38] <=  prbs[0] ^ prbs[3]; 
								prbs[39] <=  prbs[1] ^ prbs[4]; 
								prbs[40] <=  prbs[2] ^ prbs[5]; 
								prbs[41] <=  prbs[3] ^ prbs[6]; 
								prbs[42] <=  prbs[4] ^ prbs[7]; 
								prbs[43] <=  prbs[5] ^ prbs[8]; 
								prbs[44] <=  prbs[6] ^ prbs[9]; 
								prbs[45] <=  prbs[7] ^ prbs[10]; 
								prbs[46] <=  prbs[8] ^ prbs[11]; 
								prbs[47] <=  prbs[9] ^ prbs[12]; 
								prbs[48] <=  prbs[10] ^ prbs[13]; 
								prbs[49] <=  prbs[11] ^ prbs[14]; 
								prbs[50] <=  prbs[12] ^ prbs[15]; 
								prbs[51] <=  prbs[13] ^ prbs[16]; 
								prbs[52] <=  prbs[14] ^ prbs[17]; 
								prbs[53] <=  prbs[15] ^ prbs[18]; 
								prbs[54] <=  prbs[16] ^ prbs[19]; 
								prbs[55] <=  prbs[17] ^ prbs[20]; 
								prbs[56] <=  prbs[18] ^ prbs[21]; 
								prbs[57] <=  prbs[19] ^ prbs[22]; 
								prbs[58] <=  prbs[20] ^ prbs[23]; 
								prbs[59] <=  prbs[21] ^ prbs[24]; 
								prbs[60] <=  prbs[22] ^ prbs[25]; 
								prbs[61] <=  prbs[23] ^ prbs[26]; 
								prbs[62] <=  prbs[24] ^ prbs[27]; 
								prbs[63] <=  prbs[25] ^ prbs[28]; 
								prbs[64] <=  prbs[26] ^ prbs[29]; 
								prbs[65] <=  prbs[27] ^ prbs[30]; 
                            end
                            default: begin
                                prbs <= ~0;
                            end
                       endcase
                    end // end if advance_prbs
                    if (~enable) begin
                        prbs <= ~0;
                    end // end if enable
                end // end if reset_sync
            end //end always for prbs block
        end else if (ST_DATA_W == 80)begin
            always @(posedge aso_clk or posedge reset_sync) begin
                if (reset_sync) begin
                    prbs <= ~0;
                end else begin
                    if (state == ST_IDLE) begin
                        prbs <= ~0;
                    end
                    if (advance_prbs) begin
                        case (pattern_select)
                            SEL_PRBS_7 : begin
                                // PRBS 2^7-1 (T[7,6]) (parallel 80-bit serializer)
								prbs[0] <=  prbs[0] ^ prbs[2] ^ prbs[3] ^ prbs[6] ; 
								prbs[1] <=  prbs[0] ^ prbs[1] ^ prbs[3] ^ prbs[4] ^ prbs[6] ; 
								prbs[2] <=  prbs[0] ^ prbs[1] ^ prbs[2] ^ prbs[4] ^ prbs[5] ^ prbs[6] ; 
								prbs[3] <=  prbs[0] ^ prbs[1] ^ prbs[2] ^ prbs[3] ^ prbs[5] ; 
								prbs[4] <=  prbs[1] ^ prbs[2] ^ prbs[3] ^ prbs[4] ^ prbs[6] ; 
								prbs[5] <=  prbs[0] ^ prbs[2] ^ prbs[3] ^ prbs[4] ^ prbs[5] ^ prbs[6] ; 
								prbs[6] <=  prbs[0] ^ prbs[1] ^ prbs[3] ^ prbs[4] ^ prbs[5] ; 
								prbs[7] <=  prbs[1] ^ prbs[2] ^ prbs[4] ^ prbs[5] ^ prbs[6] ; 
								prbs[8] <=  prbs[0] ^ prbs[2] ^ prbs[3] ^ prbs[5] ; 
								prbs[9] <=  prbs[1] ^ prbs[3] ^ prbs[4] ^ prbs[6] ; 
								prbs[10] <=  prbs[0] ^ prbs[2] ^ prbs[4] ^ prbs[5] ^ prbs[6] ; 
								prbs[11] <=  prbs[0] ^ prbs[1] ^ prbs[3] ^ prbs[5] ; 
								prbs[12] <=  prbs[1] ^ prbs[2] ^ prbs[4] ^ prbs[6] ; 
								prbs[13] <=  prbs[0] ^ prbs[2] ^ prbs[3] ^ prbs[5] ^ prbs[6] ; 
								prbs[14] <=  prbs[0] ^ prbs[1] ^ prbs[3] ^ prbs[4] ; 
								prbs[15] <=  prbs[1] ^ prbs[2] ^ prbs[4] ^ prbs[5] ; 
								prbs[16] <=  prbs[2] ^ prbs[3] ^ prbs[5] ^ prbs[6] ; 
								prbs[17] <=  prbs[0] ^ prbs[3] ^ prbs[4] ; 
								prbs[18] <=  prbs[1] ^ prbs[4] ^ prbs[5] ; 
								prbs[19] <=  prbs[2] ^ prbs[5] ^ prbs[6] ; 
								prbs[20] <=  prbs[0] ^ prbs[3] ; 
								prbs[21] <=  prbs[1] ^ prbs[4] ; 
								prbs[22] <=  prbs[2] ^ prbs[5] ; 
								prbs[23] <=  prbs[3] ^ prbs[6] ; 
								prbs[24] <=  prbs[0] ^ prbs[4] ^ prbs[6] ; 
								prbs[25] <=  prbs[0] ^ prbs[1] ^ prbs[5] ^ prbs[6] ; 
								prbs[26] <=  prbs[0] ^ prbs[1] ^ prbs[2] ; 
								prbs[27] <=  prbs[1] ^ prbs[2] ^ prbs[3] ; 
								prbs[28] <=  prbs[2] ^ prbs[3] ^ prbs[4] ; 
								prbs[29] <=  prbs[3] ^ prbs[4] ^ prbs[5] ; 
								prbs[30] <=  prbs[4] ^ prbs[5] ^ prbs[6] ; 
								prbs[31] <=  prbs[0] ^ prbs[5] ; 
								prbs[32] <=  prbs[1] ^ prbs[6] ; 
								prbs[33] <=  prbs[0] ^ prbs[2] ^ prbs[6] ; 
								prbs[34] <=  prbs[0] ^ prbs[1] ^ prbs[3] ^ prbs[6] ; 
								prbs[35] <=  prbs[0] ^ prbs[1] ^ prbs[2] ^ prbs[4] ^ prbs[6] ; 
								prbs[36] <=  prbs[0] ^ prbs[1] ^ prbs[2] ^ prbs[3] ^ prbs[5] ^ prbs[6] ; 
								prbs[37] <=  prbs[0] ^ prbs[1] ^ prbs[2] ^ prbs[3] ^ prbs[4] ; 
								prbs[38] <=  prbs[1] ^ prbs[2] ^ prbs[3] ^ prbs[4] ^ prbs[5] ; 
								prbs[39] <=  prbs[2] ^ prbs[3] ^ prbs[4] ^ prbs[5] ^ prbs[6] ; 
								prbs[40] <=  prbs[0] ^ prbs[3] ^ prbs[4] ^ prbs[5] ; 
								prbs[41] <=  prbs[1] ^ prbs[4] ^ prbs[5] ^ prbs[6] ; 
								prbs[42] <=  prbs[0] ^ prbs[2] ^ prbs[5] ; 
								prbs[43] <=  prbs[1] ^ prbs[3] ^ prbs[6] ; 
								prbs[44] <=  prbs[0] ^ prbs[2] ^ prbs[4] ^ prbs[6] ; 
								prbs[45] <=  prbs[0] ^ prbs[1] ^ prbs[3] ^ prbs[5] ^ prbs[6] ; 
								prbs[46] <=  prbs[0] ^ prbs[1] ^ prbs[2] ^ prbs[4] ; 
								prbs[47] <=  prbs[1] ^ prbs[2] ^ prbs[3] ^ prbs[5] ; 
								prbs[48] <=  prbs[2] ^ prbs[3] ^ prbs[4] ^ prbs[6] ; 
								prbs[49] <=  prbs[0] ^ prbs[3] ^ prbs[4] ^ prbs[5] ^ prbs[6] ; 
								prbs[50] <=  prbs[0] ^ prbs[1] ^ prbs[4] ^ prbs[5] ; 
								prbs[51] <=  prbs[1] ^ prbs[2] ^ prbs[5] ^ prbs[6] ; 
								prbs[52] <=  prbs[0] ^ prbs[2] ^ prbs[3] ; 
								prbs[53] <=  prbs[1] ^ prbs[3] ^ prbs[4] ; 
								prbs[54] <=  prbs[2] ^ prbs[4] ^ prbs[5] ; 
								prbs[55] <=  prbs[3] ^ prbs[5] ^ prbs[6] ; 
								prbs[56] <=  prbs[0] ^ prbs[4] ; 
								prbs[57] <=  prbs[1] ^ prbs[5] ; 
								prbs[58] <=  prbs[2] ^ prbs[6] ; 
								prbs[59] <=  prbs[0] ^ prbs[3] ^ prbs[6] ; 
								prbs[60] <=  prbs[0] ^ prbs[1] ^ prbs[4] ^ prbs[6] ; 
								prbs[61] <=  prbs[0] ^ prbs[1] ^ prbs[2] ^ prbs[5] ^ prbs[6] ; 
								prbs[62] <=  prbs[0] ^ prbs[1] ^ prbs[2] ^ prbs[3] ; 
								prbs[63] <=  prbs[1] ^ prbs[2] ^ prbs[3] ^ prbs[4] ; 
								prbs[64] <=  prbs[2] ^ prbs[3] ^ prbs[4] ^ prbs[5] ; 
								prbs[65] <=  prbs[3] ^ prbs[4] ^ prbs[5] ^ prbs[6] ; 
								prbs[66] <=  prbs[0] ^ prbs[4] ^ prbs[5] ; 
								prbs[67] <=  prbs[1] ^ prbs[5] ^ prbs[6] ; 
								prbs[68] <=  prbs[0] ^ prbs[2] ; 
								prbs[69] <=  prbs[1] ^ prbs[3] ; 
								prbs[70] <=  prbs[2] ^ prbs[4] ; 
								prbs[71] <=  prbs[3] ^ prbs[5] ; 
								prbs[72] <=  prbs[4] ^ prbs[6] ; 
								prbs[73] <=  prbs[0] ^ prbs[5] ^ prbs[6] ; 
								prbs[74] <=  prbs[0] ^ prbs[1] ; 
								prbs[75] <=  prbs[1] ^ prbs[2] ; 
								prbs[76] <=  prbs[2] ^ prbs[3] ; 
								prbs[77] <=  prbs[3] ^ prbs[4] ; 
								prbs[78] <=  prbs[4] ^ prbs[5] ; 
								prbs[79] <=  prbs[5] ^ prbs[6] ; 
			
                            end
                            SEL_PRBS_15 : begin
                                // PRBS 2^15 (T[15, 14]) (parallel 80-bit serializer)
								prbs[0] <=  prbs[4] ^ prbs[6] ^ prbs[8] ^ prbs[10] ; 
								prbs[1] <=  prbs[5] ^ prbs[7] ^ prbs[9] ^ prbs[11] ; 
								prbs[2] <=  prbs[6] ^ prbs[8] ^ prbs[10] ^ prbs[12] ; 
								prbs[3] <=  prbs[7] ^ prbs[9] ^ prbs[11] ^ prbs[13] ; 
								prbs[4] <=  prbs[8] ^ prbs[10] ^ prbs[12] ^ prbs[14] ; 
								prbs[5] <=  prbs[0] ^ prbs[9] ^ prbs[11] ^ prbs[13] ^ prbs[14] ; 
								prbs[6] <=  prbs[0] ^ prbs[1] ^ prbs[10] ^ prbs[12] ; 
								prbs[7] <=  prbs[1] ^ prbs[2] ^ prbs[11] ^ prbs[13] ; 
								prbs[8] <=  prbs[2] ^ prbs[3] ^ prbs[12] ^ prbs[14] ; 
								prbs[9] <=  prbs[0] ^ prbs[3] ^ prbs[4] ^ prbs[13] ^ prbs[14] ; 
								prbs[10] <=  prbs[0] ^ prbs[1] ^ prbs[4] ^ prbs[5] ; 
								prbs[11] <=  prbs[1] ^ prbs[2] ^ prbs[5] ^ prbs[6] ; 
								prbs[12] <=  prbs[2] ^ prbs[3] ^ prbs[6] ^ prbs[7] ; 
								prbs[13] <=  prbs[3] ^ prbs[4] ^ prbs[7] ^ prbs[8] ; 
								prbs[14] <=  prbs[4] ^ prbs[5] ^ prbs[8] ^ prbs[9] ; 
								prbs[15] <=  prbs[5] ^ prbs[6] ^ prbs[9] ^ prbs[10] ; 
								prbs[16] <=  prbs[6] ^ prbs[7] ^ prbs[10] ^ prbs[11] ; 
								prbs[17] <=  prbs[7] ^ prbs[8] ^ prbs[11] ^ prbs[12] ; 
								prbs[18] <=  prbs[8] ^ prbs[9] ^ prbs[12] ^ prbs[13] ; 
								prbs[19] <=  prbs[9] ^ prbs[10] ^ prbs[13] ^ prbs[14] ; 
								prbs[20] <=  prbs[0] ^ prbs[10] ^ prbs[11] ; 
								prbs[21] <=  prbs[1] ^ prbs[11] ^ prbs[12] ; 
								prbs[22] <=  prbs[2] ^ prbs[12] ^ prbs[13] ; 
								prbs[23] <=  prbs[3] ^ prbs[13] ^ prbs[14] ; 
								prbs[24] <=  prbs[0] ^ prbs[4] ; 
								prbs[25] <=  prbs[1] ^ prbs[5] ; 
								prbs[26] <=  prbs[2] ^ prbs[6] ; 
								prbs[27] <=  prbs[3] ^ prbs[7] ; 
								prbs[28] <=  prbs[4] ^ prbs[8] ; 
								prbs[29] <=  prbs[5] ^ prbs[9] ; 
								prbs[30] <=  prbs[6] ^ prbs[10] ; 
								prbs[31] <=  prbs[7] ^ prbs[11] ; 
								prbs[32] <=  prbs[8] ^ prbs[12] ; 
								prbs[33] <=  prbs[9] ^ prbs[13] ; 
								prbs[34] <=  prbs[10] ^ prbs[14] ; 
								prbs[35] <=  prbs[0] ^ prbs[11] ^ prbs[14] ; 
								prbs[36] <=  prbs[0] ^ prbs[1] ^ prbs[12] ^ prbs[14] ; 
								prbs[37] <=  prbs[0] ^ prbs[1] ^ prbs[2] ^ prbs[13] ^ prbs[14] ; 
								prbs[38] <=  prbs[0] ^ prbs[1] ^ prbs[2] ^ prbs[3] ; 
								prbs[39] <=  prbs[1] ^ prbs[2] ^ prbs[3] ^ prbs[4] ; 
								prbs[40] <=  prbs[2] ^ prbs[3] ^ prbs[4] ^ prbs[5] ; 
								prbs[41] <=  prbs[3] ^ prbs[4] ^ prbs[5] ^ prbs[6] ; 
								prbs[42] <=  prbs[4] ^ prbs[5] ^ prbs[6] ^ prbs[7] ; 
								prbs[43] <=  prbs[5] ^ prbs[6] ^ prbs[7] ^ prbs[8] ; 
								prbs[44] <=  prbs[6] ^ prbs[7] ^ prbs[8] ^ prbs[9] ; 
								prbs[45] <=  prbs[7] ^ prbs[8] ^ prbs[9] ^ prbs[10] ; 
								prbs[46] <=  prbs[8] ^ prbs[9] ^ prbs[10] ^ prbs[11] ; 
								prbs[47] <=  prbs[9] ^ prbs[10] ^ prbs[11] ^ prbs[12] ; 
								prbs[48] <=  prbs[10] ^ prbs[11] ^ prbs[12] ^ prbs[13] ; 
								prbs[49] <=  prbs[11] ^ prbs[12] ^ prbs[13] ^ prbs[14] ; 
								prbs[50] <=  prbs[0] ^ prbs[12] ^ prbs[13] ; 
								prbs[51] <=  prbs[1] ^ prbs[13] ^ prbs[14] ; 
								prbs[52] <=  prbs[0] ^ prbs[2] ; 
								prbs[53] <=  prbs[1] ^ prbs[3] ; 
								prbs[54] <=  prbs[2] ^ prbs[4] ; 
								prbs[55] <=  prbs[3] ^ prbs[5] ; 
								prbs[56] <=  prbs[4] ^ prbs[6] ; 
								prbs[57] <=  prbs[5] ^ prbs[7] ; 
								prbs[58] <=  prbs[6] ^ prbs[8] ; 
								prbs[59] <=  prbs[7] ^ prbs[9] ; 
								prbs[60] <=  prbs[8] ^ prbs[10] ; 
								prbs[61] <=  prbs[9] ^ prbs[11] ; 
								prbs[62] <=  prbs[10] ^ prbs[12] ; 
								prbs[63] <=  prbs[11] ^ prbs[13] ; 
								prbs[64] <=  prbs[12] ^ prbs[14] ; 
								prbs[65] <=  prbs[0] ^ prbs[13] ^ prbs[14] ; 
								prbs[66] <=  prbs[0] ^ prbs[1] ; 
								prbs[67] <=  prbs[1] ^ prbs[2] ; 
								prbs[68] <=  prbs[2] ^ prbs[3] ; 
								prbs[69] <=  prbs[3] ^ prbs[4] ; 
								prbs[70] <=  prbs[4] ^ prbs[5] ; 
								prbs[71] <=  prbs[5] ^ prbs[6] ; 
								prbs[72] <=  prbs[6] ^ prbs[7] ; 
								prbs[73] <=  prbs[7] ^ prbs[8] ; 
								prbs[74] <=  prbs[8] ^ prbs[9] ; 
								prbs[75] <=  prbs[9] ^ prbs[10] ; 
								prbs[76] <=  prbs[10] ^ prbs[11] ; 
								prbs[77] <=  prbs[11] ^ prbs[12] ; 
								prbs[78] <=  prbs[12] ^ prbs[13] ; 
								prbs[79] <=  prbs[13] ^ prbs[14] ; 
                            end
                            SEL_PRBS_23 : begin
                                // PRBS 2^23-1 (T[23,18]) (parallel 80-bit serializer)
								prbs[0] <=  prbs[10] ^ prbs[12] ^ prbs[15] ; 
								prbs[1] <=  prbs[11] ^ prbs[13] ^ prbs[16] ; 
								prbs[2] <=  prbs[12] ^ prbs[14] ^ prbs[17] ; 
								prbs[3] <=  prbs[13] ^ prbs[15] ^ prbs[18] ; 
								prbs[4] <=  prbs[14] ^ prbs[16] ^ prbs[19] ; 
								prbs[5] <=  prbs[15] ^ prbs[17] ^ prbs[20] ; 
								prbs[6] <=  prbs[16] ^ prbs[18] ^ prbs[21] ; 
								prbs[7] <=  prbs[17] ^ prbs[19] ^ prbs[22] ; 
								prbs[8] <=  prbs[0] ^ prbs[20] ; 
								prbs[9] <=  prbs[1] ^ prbs[21] ; 
								prbs[10] <=  prbs[2] ^ prbs[22] ; 
								prbs[11] <=  prbs[0] ^ prbs[3] ^ prbs[18] ; 
								prbs[12] <=  prbs[1] ^ prbs[4] ^ prbs[19] ; 
								prbs[13] <=  prbs[2] ^ prbs[5] ^ prbs[20] ; 
								prbs[14] <=  prbs[3] ^ prbs[6] ^ prbs[21] ; 
								prbs[15] <=  prbs[4] ^ prbs[7] ^ prbs[22] ; 
								prbs[16] <=  prbs[0] ^ prbs[5] ^ prbs[8] ^ prbs[18] ; 
								prbs[17] <=  prbs[1] ^ prbs[6] ^ prbs[9] ^ prbs[19] ; 
								prbs[18] <=  prbs[2] ^ prbs[7] ^ prbs[10] ^ prbs[20] ; 
								prbs[19] <=  prbs[3] ^ prbs[8] ^ prbs[11] ^ prbs[21] ; 
								prbs[20] <=  prbs[4] ^ prbs[9] ^ prbs[12] ^ prbs[22] ; 
								prbs[21] <=  prbs[0] ^ prbs[5] ^ prbs[10] ^ prbs[13] ^ prbs[18] ; 
								prbs[22] <=  prbs[1] ^ prbs[6] ^ prbs[11] ^ prbs[14] ^ prbs[19] ; 
								prbs[23] <=  prbs[2] ^ prbs[7] ^ prbs[12] ^ prbs[15] ^ prbs[20] ; 
								prbs[24] <=  prbs[3] ^ prbs[8] ^ prbs[13] ^ prbs[16] ^ prbs[21] ; 
								prbs[25] <=  prbs[4] ^ prbs[9] ^ prbs[14] ^ prbs[17] ^ prbs[22] ; 
								prbs[26] <=  prbs[0] ^ prbs[5] ^ prbs[10] ^ prbs[15] ; 
								prbs[27] <=  prbs[1] ^ prbs[6] ^ prbs[11] ^ prbs[16] ; 
								prbs[28] <=  prbs[2] ^ prbs[7] ^ prbs[12] ^ prbs[17] ; 
								prbs[29] <=  prbs[3] ^ prbs[8] ^ prbs[13] ^ prbs[18] ; 
								prbs[30] <=  prbs[4] ^ prbs[9] ^ prbs[14] ^ prbs[19] ; 
								prbs[31] <=  prbs[5] ^ prbs[10] ^ prbs[15] ^ prbs[20] ; 
								prbs[32] <=  prbs[6] ^ prbs[11] ^ prbs[16] ^ prbs[21] ; 
								prbs[33] <=  prbs[7] ^ prbs[12] ^ prbs[17] ^ prbs[22] ; 
								prbs[34] <=  prbs[0] ^ prbs[8] ^ prbs[13] ; 
								prbs[35] <=  prbs[1] ^ prbs[9] ^ prbs[14] ; 
								prbs[36] <=  prbs[2] ^ prbs[10] ^ prbs[15] ; 
								prbs[37] <=  prbs[3] ^ prbs[11] ^ prbs[16] ; 
								prbs[38] <=  prbs[4] ^ prbs[12] ^ prbs[17] ; 
								prbs[39] <=  prbs[5] ^ prbs[13] ^ prbs[18] ; 
								prbs[40] <=  prbs[6] ^ prbs[14] ^ prbs[19] ; 
								prbs[41] <=  prbs[7] ^ prbs[15] ^ prbs[20] ; 
								prbs[42] <=  prbs[8] ^ prbs[16] ^ prbs[21] ; 
								prbs[43] <=  prbs[9] ^ prbs[17] ^ prbs[22] ; 
								prbs[44] <=  prbs[0] ^ prbs[10] ; 
								prbs[45] <=  prbs[1] ^ prbs[11] ; 
								prbs[46] <=  prbs[2] ^ prbs[12] ; 
								prbs[47] <=  prbs[3] ^ prbs[13] ; 
								prbs[48] <=  prbs[4] ^ prbs[14] ; 
								prbs[49] <=  prbs[5] ^ prbs[15] ; 
								prbs[50] <=  prbs[6] ^ prbs[16] ; 
								prbs[51] <=  prbs[7] ^ prbs[17] ; 
								prbs[52] <=  prbs[8] ^ prbs[18] ; 
								prbs[53] <=  prbs[9] ^ prbs[19] ; 
								prbs[54] <=  prbs[10] ^ prbs[20] ; 
								prbs[55] <=  prbs[11] ^ prbs[21] ; 
								prbs[56] <=  prbs[12] ^ prbs[22] ; 
								prbs[57] <=  prbs[0] ^ prbs[13] ^ prbs[18] ; 
								prbs[58] <=  prbs[1] ^ prbs[14] ^ prbs[19] ; 
								prbs[59] <=  prbs[2] ^ prbs[15] ^ prbs[20] ; 
								prbs[60] <=  prbs[3] ^ prbs[16] ^ prbs[21] ; 
								prbs[61] <=  prbs[4] ^ prbs[17] ^ prbs[22] ; 
								prbs[62] <=  prbs[0] ^ prbs[5] ; 
								prbs[63] <=  prbs[1] ^ prbs[6] ; 
								prbs[64] <=  prbs[2] ^ prbs[7] ; 
								prbs[65] <=  prbs[3] ^ prbs[8] ; 
								prbs[66] <=  prbs[4] ^ prbs[9] ; 
								prbs[67] <=  prbs[5] ^ prbs[10] ; 
								prbs[68] <=  prbs[6] ^ prbs[11] ; 
								prbs[69] <=  prbs[7] ^ prbs[12] ; 
								prbs[70] <=  prbs[8] ^ prbs[13] ; 
								prbs[71] <=  prbs[9] ^ prbs[14] ; 
								prbs[72] <=  prbs[10] ^ prbs[15] ; 
								prbs[73] <=  prbs[11] ^ prbs[16] ; 
								prbs[74] <=  prbs[12] ^ prbs[17] ; 
								prbs[75] <=  prbs[13] ^ prbs[18] ; 
								prbs[76] <=  prbs[14] ^ prbs[19] ; 
								prbs[77] <=  prbs[15] ^ prbs[20] ; 
								prbs[78] <=  prbs[16] ^ prbs[21] ; 
								prbs[79] <=  prbs[17] ^ prbs[22] ; 
                            end
                            SEL_PRBS_31 : begin
                                // PRBS 2^31-1 (T[31,28]) (parallel 80-bit serializer)
								prbs[0] <=  prbs[4] ^ prbs[7] ^ prbs[10] ^ prbs[13] ; 
								prbs[1] <=  prbs[5] ^ prbs[8] ^ prbs[11] ^ prbs[14] ; 
								prbs[2] <=  prbs[6] ^ prbs[9] ^ prbs[12] ^ prbs[15] ; 
								prbs[3] <=  prbs[7] ^ prbs[10] ^ prbs[13] ^ prbs[16] ; 
								prbs[4] <=  prbs[8] ^ prbs[11] ^ prbs[14] ^ prbs[17] ; 
								prbs[5] <=  prbs[9] ^ prbs[12] ^ prbs[15] ^ prbs[18] ; 
								prbs[6] <=  prbs[10] ^ prbs[13] ^ prbs[16] ^ prbs[19] ; 
								prbs[7] <=  prbs[11] ^ prbs[14] ^ prbs[17] ^ prbs[20] ; 
								prbs[8] <=  prbs[12] ^ prbs[15] ^ prbs[18] ^ prbs[21] ; 
								prbs[9] <=  prbs[13] ^ prbs[16] ^ prbs[19] ^ prbs[22] ; 
								prbs[10] <=  prbs[14] ^ prbs[17] ^ prbs[20] ^ prbs[23] ; 
								prbs[11] <=  prbs[15] ^ prbs[18] ^ prbs[21] ^ prbs[24] ; 
								prbs[12] <=  prbs[16] ^ prbs[19] ^ prbs[22] ^ prbs[25] ; 
								prbs[13] <=  prbs[17] ^ prbs[20] ^ prbs[23] ^ prbs[26] ; 
								prbs[14] <=  prbs[18] ^ prbs[21] ^ prbs[24] ^ prbs[27] ; 
								prbs[15] <=  prbs[19] ^ prbs[22] ^ prbs[25] ^ prbs[28] ; 
								prbs[16] <=  prbs[20] ^ prbs[23] ^ prbs[26] ^ prbs[29] ; 
								prbs[17] <=  prbs[21] ^ prbs[24] ^ prbs[27] ^ prbs[30] ; 
								prbs[18] <=  prbs[0] ^ prbs[22] ^ prbs[25] ; 
								prbs[19] <=  prbs[1] ^ prbs[23] ^ prbs[26] ; 
								prbs[20] <=  prbs[2] ^ prbs[24] ^ prbs[27] ; 
								prbs[21] <=  prbs[3] ^ prbs[25] ^ prbs[28] ; 
								prbs[22] <=  prbs[4] ^ prbs[26] ^ prbs[29] ; 
								prbs[23] <=  prbs[5] ^ prbs[27] ^ prbs[30] ; 
								prbs[24] <=  prbs[0] ^ prbs[6] ; 
								prbs[25] <=  prbs[1] ^ prbs[7] ; 
								prbs[26] <=  prbs[2] ^ prbs[8] ; 
								prbs[27] <=  prbs[3] ^ prbs[9] ; 
								prbs[28] <=  prbs[4] ^ prbs[10] ; 
								prbs[29] <=  prbs[5] ^ prbs[11] ; 
								prbs[30] <=  prbs[6] ^ prbs[12] ; 
								prbs[31] <=  prbs[7] ^ prbs[13] ; 
								prbs[32] <=  prbs[8] ^ prbs[14] ; 
								prbs[33] <=  prbs[9] ^ prbs[15] ; 
								prbs[34] <=  prbs[10] ^ prbs[16] ; 
								prbs[35] <=  prbs[11] ^ prbs[17] ; 
								prbs[36] <=  prbs[12] ^ prbs[18] ; 
								prbs[37] <=  prbs[13] ^ prbs[19] ; 
								prbs[38] <=  prbs[14] ^ prbs[20] ; 
								prbs[39] <=  prbs[15] ^ prbs[21] ; 
								prbs[40] <=  prbs[16] ^ prbs[22] ; 
								prbs[41] <=  prbs[17] ^ prbs[23] ; 
								prbs[42] <=  prbs[18] ^ prbs[24] ; 
								prbs[43] <=  prbs[19] ^ prbs[25] ; 
								prbs[44] <=  prbs[20] ^ prbs[26] ; 
								prbs[45] <=  prbs[21] ^ prbs[27] ; 
								prbs[46] <=  prbs[22] ^ prbs[28] ; 
								prbs[47] <=  prbs[23] ^ prbs[29] ; 
								prbs[48] <=  prbs[24] ^ prbs[30] ; 
								prbs[49] <=  prbs[0] ^ prbs[25] ^ prbs[28] ; 
								prbs[50] <=  prbs[1] ^ prbs[26] ^ prbs[29] ; 
								prbs[51] <=  prbs[2] ^ prbs[27] ^ prbs[30] ; 
								prbs[52] <=  prbs[0] ^ prbs[3] ; 
								prbs[53] <=  prbs[1] ^ prbs[4] ; 
								prbs[54] <=  prbs[2] ^ prbs[5] ; 
								prbs[55] <=  prbs[3] ^ prbs[6] ; 
								prbs[56] <=  prbs[4] ^ prbs[7] ; 
								prbs[57] <=  prbs[5] ^ prbs[8] ; 
								prbs[58] <=  prbs[6] ^ prbs[9] ; 
								prbs[59] <=  prbs[7] ^ prbs[10] ; 
								prbs[60] <=  prbs[8] ^ prbs[11] ; 
								prbs[61] <=  prbs[9] ^ prbs[12] ; 
								prbs[62] <=  prbs[10] ^ prbs[13] ; 
								prbs[63] <=  prbs[11] ^ prbs[14] ; 
								prbs[64] <=  prbs[12] ^ prbs[15] ; 
								prbs[65] <=  prbs[13] ^ prbs[16] ; 
								prbs[66] <=  prbs[14] ^ prbs[17] ; 
								prbs[67] <=  prbs[15] ^ prbs[18] ; 
								prbs[68] <=  prbs[16] ^ prbs[19] ; 
								prbs[69] <=  prbs[17] ^ prbs[20] ; 
								prbs[70] <=  prbs[18] ^ prbs[21] ; 
								prbs[71] <=  prbs[19] ^ prbs[22] ; 
								prbs[72] <=  prbs[20] ^ prbs[23] ; 
								prbs[73] <=  prbs[21] ^ prbs[24] ; 
								prbs[74] <=  prbs[22] ^ prbs[25] ; 
								prbs[75] <=  prbs[23] ^ prbs[26] ; 
								prbs[76] <=  prbs[24] ^ prbs[27] ; 
								prbs[77] <=  prbs[25] ^ prbs[28] ; 
								prbs[78] <=  prbs[26] ^ prbs[29] ; 
								prbs[79] <=  prbs[27] ^ prbs[30] ; 
                            end
                            default: begin
                                prbs <= ~0;
                            end
                       endcase
                    end // end if advance_prbs
                    if (~enable) begin
                        prbs <= ~0;
                    end // end if enable
                end // end if reset_sync
            end //end always for prbs block
		end else if (ST_DATA_W == 128) begin 
		    always @(posedge aso_clk or posedge reset_sync) begin
                if (reset_sync) begin
                    prbs <= ~0;
                end else begin
                    if (state == ST_IDLE) begin
                        prbs <= ~0;
                    end
                    if (advance_prbs) begin
                        case (pattern_select)
                            SEL_PRBS_7 : begin
                                // PRBS 2^7-1 (T[7,6]) (parallel 128-bit serializer)
                                prbs[0] <=  prbs[5] ^ prbs[6] ; 
								prbs[1] <=  prbs[0] ; 
								prbs[2] <=  prbs[1] ; 
								prbs[3] <=  prbs[2] ; 
								prbs[4] <=  prbs[3] ; 
								prbs[5] <=  prbs[4] ; 
								prbs[6] <=  prbs[5] ; 
								prbs[7] <=  prbs[6] ; 
								prbs[8] <=  prbs[0] ^ prbs[6] ; 
								prbs[9] <=  prbs[0] ^ prbs[1] ^ prbs[6] ; 
								prbs[10] <=  prbs[0] ^ prbs[1] ^ prbs[2] ^ prbs[6] ; 
								prbs[11] <=  prbs[0] ^ prbs[1] ^ prbs[2] ^ prbs[3] ^ prbs[6] ; 
								prbs[12] <=  prbs[0] ^ prbs[1] ^ prbs[2] ^ prbs[3] ^ prbs[4] ^ prbs[6] ; 
								prbs[13] <=  prbs[0] ^ prbs[1] ^ prbs[2] ^ prbs[3] ^ prbs[4] ^ prbs[5] ^ prbs[6] ; 
								prbs[14] <=  prbs[0] ^ prbs[1] ^ prbs[2] ^ prbs[3] ^ prbs[4] ^ prbs[5] ; 
								prbs[15] <=  prbs[1] ^ prbs[2] ^ prbs[3] ^ prbs[4] ^ prbs[5] ^ prbs[6] ; 
								prbs[16] <=  prbs[0] ^ prbs[2] ^ prbs[3] ^ prbs[4] ^ prbs[5] ; 
								prbs[17] <=  prbs[1] ^ prbs[3] ^ prbs[4] ^ prbs[5] ^ prbs[6] ; 
								prbs[18] <=  prbs[0] ^ prbs[2] ^ prbs[4] ^ prbs[5] ; 
								prbs[19] <=  prbs[1] ^ prbs[3] ^ prbs[5] ^ prbs[6] ; 
								prbs[20] <=  prbs[0] ^ prbs[2] ^ prbs[4] ; 
								prbs[21] <=  prbs[1] ^ prbs[3] ^ prbs[5] ; 
								prbs[22] <=  prbs[2] ^ prbs[4] ^ prbs[6] ; 
								prbs[23] <=  prbs[0] ^ prbs[3] ^ prbs[5] ^ prbs[6] ; 
								prbs[24] <=  prbs[0] ^ prbs[1] ^ prbs[4] ; 
								prbs[25] <=  prbs[1] ^ prbs[2] ^ prbs[5] ; 
								prbs[26] <=  prbs[2] ^ prbs[3] ^ prbs[6] ; 
								prbs[27] <=  prbs[0] ^ prbs[3] ^ prbs[4] ^ prbs[6] ; 
								prbs[28] <=  prbs[0] ^ prbs[1] ^ prbs[4] ^ prbs[5] ^ prbs[6] ; 
								prbs[29] <=  prbs[0] ^ prbs[1] ^ prbs[2] ^ prbs[5] ; 
								prbs[30] <=  prbs[1] ^ prbs[2] ^ prbs[3] ^ prbs[6] ; 
								prbs[31] <=  prbs[0] ^ prbs[2] ^ prbs[3] ^ prbs[4] ^ prbs[6] ; 
								prbs[32] <=  prbs[0] ^ prbs[1] ^ prbs[3] ^ prbs[4] ^ prbs[5] ^ prbs[6] ; 
								prbs[33] <=  prbs[0] ^ prbs[1] ^ prbs[2] ^ prbs[4] ^ prbs[5] ; 
								prbs[34] <=  prbs[1] ^ prbs[2] ^ prbs[3] ^ prbs[5] ^ prbs[6] ; 
								prbs[35] <=  prbs[0] ^ prbs[2] ^ prbs[3] ^ prbs[4] ; 
								prbs[36] <=  prbs[1] ^ prbs[3] ^ prbs[4] ^ prbs[5] ; 
								prbs[37] <=  prbs[2] ^ prbs[4] ^ prbs[5] ^ prbs[6] ; 
								prbs[38] <=  prbs[0] ^ prbs[3] ^ prbs[5] ; 
								prbs[39] <=  prbs[1] ^ prbs[4] ^ prbs[6] ; 
								prbs[40] <=  prbs[0] ^ prbs[2] ^ prbs[5] ^ prbs[6] ; 
								prbs[41] <=  prbs[0] ^ prbs[1] ^ prbs[3] ; 
								prbs[42] <=  prbs[1] ^ prbs[2] ^ prbs[4] ; 
								prbs[43] <=  prbs[2] ^ prbs[3] ^ prbs[5] ; 
								prbs[44] <=  prbs[3] ^ prbs[4] ^ prbs[6] ; 
								prbs[45] <=  prbs[0] ^ prbs[4] ^ prbs[5] ^ prbs[6] ; 
								prbs[46] <=  prbs[0] ^ prbs[1] ^ prbs[5] ; 
								prbs[47] <=  prbs[1] ^ prbs[2] ^ prbs[6] ; 
								prbs[48] <=  prbs[0] ^ prbs[2] ^ prbs[3] ^ prbs[6] ; 
								prbs[49] <=  prbs[0] ^ prbs[1] ^ prbs[3] ^ prbs[4] ^ prbs[6] ; 
								prbs[50] <=  prbs[0] ^ prbs[1] ^ prbs[2] ^ prbs[4] ^ prbs[5] ^ prbs[6] ; 
								prbs[51] <=  prbs[0] ^ prbs[1] ^ prbs[2] ^ prbs[3] ^ prbs[5] ; 
								prbs[52] <=  prbs[1] ^ prbs[2] ^ prbs[3] ^ prbs[4] ^ prbs[6] ; 
								prbs[53] <=  prbs[0] ^ prbs[2] ^ prbs[3] ^ prbs[4] ^ prbs[5] ^ prbs[6] ; 
								prbs[54] <=  prbs[0] ^ prbs[1] ^ prbs[3] ^ prbs[4] ^ prbs[5] ; 
								prbs[55] <=  prbs[1] ^ prbs[2] ^ prbs[4] ^ prbs[5] ^ prbs[6] ; 
								prbs[56] <=  prbs[0] ^ prbs[2] ^ prbs[3] ^ prbs[5] ; 
								prbs[57] <=  prbs[1] ^ prbs[3] ^ prbs[4] ^ prbs[6] ; 
								prbs[58] <=  prbs[0] ^ prbs[2] ^ prbs[4] ^ prbs[5] ^ prbs[6] ; 
								prbs[59] <=  prbs[0] ^ prbs[1] ^ prbs[3] ^ prbs[5] ; 
								prbs[60] <=  prbs[1] ^ prbs[2] ^ prbs[4] ^ prbs[6] ; 
								prbs[61] <=  prbs[0] ^ prbs[2] ^ prbs[3] ^ prbs[5] ^ prbs[6] ; 
								prbs[62] <=  prbs[0] ^ prbs[1] ^ prbs[3] ^ prbs[4] ; 
								prbs[63] <=  prbs[1] ^ prbs[2] ^ prbs[4] ^ prbs[5] ; 
								prbs[64] <=  prbs[2] ^ prbs[3] ^ prbs[5] ^ prbs[6] ; 
								prbs[65] <=  prbs[0] ^ prbs[3] ^ prbs[4] ; 
								prbs[66] <=  prbs[1] ^ prbs[4] ^ prbs[5] ; 
								prbs[67] <=  prbs[2] ^ prbs[5] ^ prbs[6] ; 
								prbs[68] <=  prbs[0] ^ prbs[3] ; 
								prbs[69] <=  prbs[1] ^ prbs[4] ; 
								prbs[70] <=  prbs[2] ^ prbs[5] ; 
								prbs[71] <=  prbs[3] ^ prbs[6] ; 
								prbs[72] <=  prbs[0] ^ prbs[4] ^ prbs[6] ; 
								prbs[73] <=  prbs[0] ^ prbs[1] ^ prbs[5] ^ prbs[6] ; 
								prbs[74] <=  prbs[0] ^ prbs[1] ^ prbs[2] ; 
								prbs[75] <=  prbs[1] ^ prbs[2] ^ prbs[3] ; 
								prbs[76] <=  prbs[2] ^ prbs[3] ^ prbs[4] ; 
								prbs[77] <=  prbs[3] ^ prbs[4] ^ prbs[5] ; 
								prbs[78] <=  prbs[4] ^ prbs[5] ^ prbs[6] ; 
								prbs[79] <=  prbs[0] ^ prbs[5] ; 
								prbs[80] <=  prbs[1] ^ prbs[6] ; 
								prbs[81] <=  prbs[0] ^ prbs[2] ^ prbs[6] ; 
								prbs[82] <=  prbs[0] ^ prbs[1] ^ prbs[3] ^ prbs[6] ; 
								prbs[83] <=  prbs[0] ^ prbs[1] ^ prbs[2] ^ prbs[4] ^ prbs[6] ; 
								prbs[84] <=  prbs[0] ^ prbs[1] ^ prbs[2] ^ prbs[3] ^ prbs[5] ^ prbs[6] ; 
								prbs[85] <=  prbs[0] ^ prbs[1] ^ prbs[2] ^ prbs[3] ^ prbs[4] ; 
								prbs[86] <=  prbs[1] ^ prbs[2] ^ prbs[3] ^ prbs[4] ^ prbs[5] ; 
								prbs[87] <=  prbs[2] ^ prbs[3] ^ prbs[4] ^ prbs[5] ^ prbs[6] ; 
								prbs[88] <=  prbs[0] ^ prbs[3] ^ prbs[4] ^ prbs[5] ; 
								prbs[89] <=  prbs[1] ^ prbs[4] ^ prbs[5] ^ prbs[6] ; 
								prbs[90] <=  prbs[0] ^ prbs[2] ^ prbs[5] ; 
								prbs[91] <=  prbs[1] ^ prbs[3] ^ prbs[6] ; 
								prbs[92] <=  prbs[0] ^ prbs[2] ^ prbs[4] ^ prbs[6] ; 
								prbs[93] <=  prbs[0] ^ prbs[1] ^ prbs[3] ^ prbs[5] ^ prbs[6] ; 
								prbs[94] <=  prbs[0] ^ prbs[1] ^ prbs[2] ^ prbs[4] ; 
								prbs[95] <=  prbs[1] ^ prbs[2] ^ prbs[3] ^ prbs[5] ; 
								prbs[96] <=  prbs[2] ^ prbs[3] ^ prbs[4] ^ prbs[6] ; 
								prbs[97] <=  prbs[0] ^ prbs[3] ^ prbs[4] ^ prbs[5] ^ prbs[6] ; 
								prbs[98] <=  prbs[0] ^ prbs[1] ^ prbs[4] ^ prbs[5] ; 
								prbs[99] <=  prbs[1] ^ prbs[2] ^ prbs[5] ^ prbs[6] ; 
								prbs[100] <=  prbs[0] ^ prbs[2] ^ prbs[3] ; 
								prbs[101] <=  prbs[1] ^ prbs[3] ^ prbs[4] ; 
								prbs[102] <=  prbs[2] ^ prbs[4] ^ prbs[5] ; 
								prbs[103] <=  prbs[3] ^ prbs[5] ^ prbs[6] ; 
								prbs[104] <=  prbs[0] ^ prbs[4] ; 
								prbs[105] <=  prbs[1] ^ prbs[5] ; 
								prbs[106] <=  prbs[2] ^ prbs[6] ; 
								prbs[107] <=  prbs[0] ^ prbs[3] ^ prbs[6] ; 
								prbs[108] <=  prbs[0] ^ prbs[1] ^ prbs[4] ^ prbs[6] ; 
								prbs[109] <=  prbs[0] ^ prbs[1] ^ prbs[2] ^ prbs[5] ^ prbs[6] ; 
								prbs[110] <=  prbs[0] ^ prbs[1] ^ prbs[2] ^ prbs[3] ; 
								prbs[111] <=  prbs[1] ^ prbs[2] ^ prbs[3] ^ prbs[4] ; 
								prbs[112] <=  prbs[2] ^ prbs[3] ^ prbs[4] ^ prbs[5] ; 
								prbs[113] <=  prbs[3] ^ prbs[4] ^ prbs[5] ^ prbs[6] ; 
								prbs[114] <=  prbs[0] ^ prbs[4] ^ prbs[5] ; 
								prbs[115] <=  prbs[1] ^ prbs[5] ^ prbs[6] ; 
								prbs[116] <=  prbs[0] ^ prbs[2] ; 
								prbs[117] <=  prbs[1] ^ prbs[3] ; 
								prbs[118] <=  prbs[2] ^ prbs[4] ; 
								prbs[119] <=  prbs[3] ^ prbs[5] ; 
								prbs[120] <=  prbs[4] ^ prbs[6] ; 
								prbs[121] <=  prbs[0] ^ prbs[5] ^ prbs[6] ; 
								prbs[122] <=  prbs[0] ^ prbs[1] ; 
                                prbs[123] <=  prbs[1] ^ prbs[2] ; 
								prbs[124] <=  prbs[2] ^ prbs[3] ; 
								prbs[125] <=  prbs[3] ^ prbs[4] ; 
								prbs[126] <=  prbs[4] ^ prbs[5] ; 
								prbs[127] <=  prbs[5] ^ prbs[6] ; 
                            end
                            SEL_PRBS_15 : begin
                                // PRBS 2^15 (T[15, 14]) (parallel 128-bit serializer)
                                prbs[0] <=  prbs[6] ^ prbs[7] ^ prbs[12] ^ prbs[14] ; 
								prbs[1] <=  prbs[0] ^ prbs[7] ^ prbs[8] ^ prbs[13] ^ prbs[14] ; 
								prbs[2] <=  prbs[0] ^ prbs[1] ^ prbs[8] ^ prbs[9] ; 
								prbs[3] <=  prbs[1] ^ prbs[2] ^ prbs[9] ^ prbs[10] ; 
								prbs[4] <=  prbs[2] ^ prbs[3] ^ prbs[10] ^ prbs[11] ; 
								prbs[5] <=  prbs[3] ^ prbs[4] ^ prbs[11] ^ prbs[12] ; 
								prbs[6] <=  prbs[4] ^ prbs[5] ^ prbs[12] ^ prbs[13] ; 
								prbs[7] <=  prbs[5] ^ prbs[6] ^ prbs[13] ^ prbs[14] ; 
								prbs[8] <=  prbs[0] ^ prbs[6] ^ prbs[7] ; 
								prbs[9] <=  prbs[1] ^ prbs[7] ^ prbs[8] ; 
								prbs[10] <=  prbs[2] ^ prbs[8] ^ prbs[9] ; 
								prbs[11] <=  prbs[3] ^ prbs[9] ^ prbs[10] ; 
								prbs[12] <=  prbs[4] ^ prbs[10] ^ prbs[11] ; 
								prbs[13] <=  prbs[5] ^ prbs[11] ^ prbs[12] ; 
								prbs[14] <=  prbs[6] ^ prbs[12] ^ prbs[13] ; 
								prbs[15] <=  prbs[7] ^ prbs[13] ^ prbs[14] ; 
								prbs[16] <=  prbs[0] ^ prbs[8] ; 
								prbs[17] <=  prbs[1] ^ prbs[9] ; 
								prbs[18] <=  prbs[2] ^ prbs[10] ; 
								prbs[19] <=  prbs[3] ^ prbs[11] ; 
								prbs[20] <=  prbs[4] ^ prbs[12] ; 
								prbs[21] <=  prbs[5] ^ prbs[13] ; 
								prbs[22] <=  prbs[6] ^ prbs[14] ; 
								prbs[23] <=  prbs[0] ^ prbs[7] ^ prbs[14] ; 
								prbs[24] <=  prbs[0] ^ prbs[1] ^ prbs[8] ^ prbs[14] ; 
								prbs[25] <=  prbs[0] ^ prbs[1] ^ prbs[2] ^ prbs[9] ^ prbs[14] ; 
								prbs[26] <=  prbs[0] ^ prbs[1] ^ prbs[2] ^ prbs[3] ^ prbs[10] ^ prbs[14] ; 
								prbs[27] <=  prbs[0] ^ prbs[1] ^ prbs[2] ^ prbs[3] ^ prbs[4] ^ prbs[11] ^ prbs[14] ; 
								prbs[28] <=  prbs[0] ^ prbs[1] ^ prbs[2] ^ prbs[3] ^ prbs[4] ^ prbs[5] ^ prbs[12] ^ prbs[14] ; 
								prbs[29] <=  prbs[0] ^ prbs[1] ^ prbs[2] ^ prbs[3] ^ prbs[4] ^ prbs[5] ^ prbs[6] ^ prbs[13] ^ prbs[14] ; 
								prbs[30] <=  prbs[0] ^ prbs[1] ^ prbs[2] ^ prbs[3] ^ prbs[4] ^ prbs[5] ^ prbs[6] ^ prbs[7] ; 
								prbs[31] <=  prbs[1] ^ prbs[2] ^ prbs[3] ^ prbs[4] ^ prbs[5] ^ prbs[6] ^ prbs[7] ^ prbs[8] ; 
								prbs[32] <=  prbs[2] ^ prbs[3] ^ prbs[4] ^ prbs[5] ^ prbs[6] ^ prbs[7] ^ prbs[8] ^ prbs[9] ; 
								prbs[33] <=  prbs[3] ^ prbs[4] ^ prbs[5] ^ prbs[6] ^ prbs[7] ^ prbs[8] ^ prbs[9] ^ prbs[10] ; 
								prbs[34] <=  prbs[4] ^ prbs[5] ^ prbs[6] ^ prbs[7] ^ prbs[8] ^ prbs[9] ^ prbs[10] ^ prbs[11] ; 
								prbs[35] <=  prbs[5] ^ prbs[6] ^ prbs[7] ^ prbs[8] ^ prbs[9] ^ prbs[10] ^ prbs[11] ^ prbs[12] ; 
								prbs[36] <=  prbs[6] ^ prbs[7] ^ prbs[8] ^ prbs[9] ^ prbs[10] ^ prbs[11] ^ prbs[12] ^ prbs[13] ; 
								prbs[37] <=  prbs[7] ^ prbs[8] ^ prbs[9] ^ prbs[10] ^ prbs[11] ^ prbs[12] ^ prbs[13] ^ prbs[14] ; 
								prbs[38] <=  prbs[0] ^ prbs[8] ^ prbs[9] ^ prbs[10] ^ prbs[11] ^ prbs[12] ^ prbs[13] ; 
								prbs[39] <=  prbs[1] ^ prbs[9] ^ prbs[10] ^ prbs[11] ^ prbs[12] ^ prbs[13] ^ prbs[14] ; 
								prbs[40] <=  prbs[0] ^ prbs[2] ^ prbs[10] ^ prbs[11] ^ prbs[12] ^ prbs[13] ; 
								prbs[41] <=  prbs[1] ^ prbs[3] ^ prbs[11] ^ prbs[12] ^ prbs[13] ^ prbs[14] ; 
								prbs[42] <=  prbs[0] ^ prbs[2] ^ prbs[4] ^ prbs[12] ^ prbs[13] ; 
								prbs[43] <=  prbs[1] ^ prbs[3] ^ prbs[5] ^ prbs[13] ^ prbs[14] ; 
								prbs[44] <=  prbs[0] ^ prbs[2] ^ prbs[4] ^ prbs[6] ; 
								prbs[45] <=  prbs[1] ^ prbs[3] ^ prbs[5] ^ prbs[7] ; 
								prbs[46] <=  prbs[2] ^ prbs[4] ^ prbs[6] ^ prbs[8] ; 
								prbs[47] <=  prbs[3] ^ prbs[5] ^ prbs[7] ^ prbs[9] ; 
								prbs[48] <=  prbs[4] ^ prbs[6] ^ prbs[8] ^ prbs[10] ; 
								prbs[49] <=  prbs[5] ^ prbs[7] ^ prbs[9] ^ prbs[11] ; 
								prbs[50] <=  prbs[6] ^ prbs[8] ^ prbs[10] ^ prbs[12] ; 
								prbs[51] <=  prbs[7] ^ prbs[9] ^ prbs[11] ^ prbs[13] ; 
								prbs[52] <=  prbs[8] ^ prbs[10] ^ prbs[12] ^ prbs[14] ; 
								prbs[53] <=  prbs[0] ^ prbs[9] ^ prbs[11] ^ prbs[13] ^ prbs[14] ; 
								prbs[54] <=  prbs[0] ^ prbs[1] ^ prbs[10] ^ prbs[12] ; 
								prbs[55] <=  prbs[1] ^ prbs[2] ^ prbs[11] ^ prbs[13] ; 
								prbs[56] <=  prbs[2] ^ prbs[3] ^ prbs[12] ^ prbs[14] ; 
								prbs[57] <=  prbs[0] ^ prbs[3] ^ prbs[4] ^ prbs[13] ^ prbs[14] ; 
								prbs[58] <=  prbs[0] ^ prbs[1] ^ prbs[4] ^ prbs[5] ; 
								prbs[59] <=  prbs[1] ^ prbs[2] ^ prbs[5] ^ prbs[6] ; 
								prbs[60] <=  prbs[2] ^ prbs[3] ^ prbs[6] ^ prbs[7] ; 
								prbs[61] <=  prbs[3] ^ prbs[4] ^ prbs[7] ^ prbs[8] ; 
								prbs[62] <=  prbs[4] ^ prbs[5] ^ prbs[8] ^ prbs[9] ; 
								prbs[63] <=  prbs[5] ^ prbs[6] ^ prbs[9] ^ prbs[10] ; 
								prbs[64] <=  prbs[6] ^ prbs[7] ^ prbs[10] ^ prbs[11] ; 
								prbs[65] <=  prbs[7] ^ prbs[8] ^ prbs[11] ^ prbs[12] ; 
								prbs[66] <=  prbs[8] ^ prbs[9] ^ prbs[12] ^ prbs[13] ; 
								prbs[67] <=  prbs[9] ^ prbs[10] ^ prbs[13] ^ prbs[14] ; 
								prbs[68] <=  prbs[0] ^ prbs[10] ^ prbs[11] ; 
								prbs[69] <=  prbs[1] ^ prbs[11] ^ prbs[12] ; 
								prbs[70] <=  prbs[2] ^ prbs[12] ^ prbs[13] ; 
								prbs[71] <=  prbs[3] ^ prbs[13] ^ prbs[14] ; 
								prbs[72] <=  prbs[0] ^ prbs[4] ; 
								prbs[73] <=  prbs[1] ^ prbs[5] ; 
								prbs[74] <=  prbs[2] ^ prbs[6] ; 
								prbs[75] <=  prbs[3] ^ prbs[7] ; 
								prbs[76] <=  prbs[4] ^ prbs[8] ; 
								prbs[77] <=  prbs[5] ^ prbs[9] ; 
								prbs[78] <=  prbs[6] ^ prbs[10] ; 
								prbs[79] <=  prbs[7] ^ prbs[11] ; 
								prbs[80] <=  prbs[8] ^ prbs[12] ; 
								prbs[81] <=  prbs[9] ^ prbs[13] ; 
								prbs[82] <=  prbs[10] ^ prbs[14] ; 
								prbs[83] <=  prbs[0] ^ prbs[11] ^ prbs[14] ; 
								prbs[84] <=  prbs[0] ^ prbs[1] ^ prbs[12] ^ prbs[14] ; 
								prbs[85] <=  prbs[0] ^ prbs[1] ^ prbs[2] ^ prbs[13] ^ prbs[14] ; 
								prbs[86] <=  prbs[0] ^ prbs[1] ^ prbs[2] ^ prbs[3] ; 
								prbs[87] <=  prbs[1] ^ prbs[2] ^ prbs[3] ^ prbs[4] ; 
								prbs[88] <=  prbs[2] ^ prbs[3] ^ prbs[4] ^ prbs[5] ; 
								prbs[89] <=  prbs[3] ^ prbs[4] ^ prbs[5] ^ prbs[6] ; 
								prbs[90] <=  prbs[4] ^ prbs[5] ^ prbs[6] ^ prbs[7] ; 
								prbs[91] <=  prbs[5] ^ prbs[6] ^ prbs[7] ^ prbs[8] ; 
								prbs[92] <=  prbs[6] ^ prbs[7] ^ prbs[8] ^ prbs[9] ; 
								prbs[93] <=  prbs[7] ^ prbs[8] ^ prbs[9] ^ prbs[10] ; 
								prbs[94] <=  prbs[8] ^ prbs[9] ^ prbs[10] ^ prbs[11] ; 
								prbs[95] <=  prbs[9] ^ prbs[10] ^ prbs[11] ^ prbs[12] ; 
								prbs[96] <=  prbs[10] ^ prbs[11] ^ prbs[12] ^ prbs[13] ; 
								prbs[97] <=  prbs[11] ^ prbs[12] ^ prbs[13] ^ prbs[14] ; 
								prbs[98] <=  prbs[0] ^ prbs[12] ^ prbs[13] ; 
								prbs[99] <=  prbs[1] ^ prbs[13] ^ prbs[14] ; 
								prbs[100] <=  prbs[0] ^ prbs[2] ; 
								prbs[101] <=  prbs[1] ^ prbs[3] ; 
								prbs[102] <=  prbs[2] ^ prbs[4] ; 
								prbs[103] <=  prbs[3] ^ prbs[5] ; 
								prbs[104] <=  prbs[4] ^ prbs[6] ; 
								prbs[105] <=  prbs[5] ^ prbs[7] ; 
								prbs[106] <=  prbs[6] ^ prbs[8] ; 
								prbs[107] <=  prbs[7] ^ prbs[9] ; 
								prbs[108] <=  prbs[8] ^ prbs[10] ; 
								prbs[109] <=  prbs[9] ^ prbs[11] ; 
								prbs[110] <=  prbs[10] ^ prbs[12] ; 
								prbs[111] <=  prbs[11] ^ prbs[13] ; 
								prbs[112] <=  prbs[12] ^ prbs[14] ; 
								prbs[113] <=  prbs[0] ^ prbs[13] ^ prbs[14] ; 
								prbs[114] <=  prbs[0] ^ prbs[1] ; 
								prbs[115] <=  prbs[1] ^ prbs[2] ; 
								prbs[116] <=  prbs[2] ^ prbs[3] ; 
								prbs[117] <=  prbs[3] ^ prbs[4] ; 
								prbs[118] <=  prbs[4] ^ prbs[5] ; 
								prbs[119] <=  prbs[5] ^ prbs[6] ; 
								prbs[120] <=  prbs[6] ^ prbs[7] ; 
								prbs[121] <=  prbs[7] ^ prbs[8] ; 
								prbs[122] <=  prbs[8] ^ prbs[9] ; 
								prbs[123] <=  prbs[9] ^ prbs[10] ; 
								prbs[124] <=  prbs[10] ^ prbs[11] ; 
								prbs[125] <=  prbs[11] ^ prbs[12] ; 
								prbs[126] <=  prbs[12] ^ prbs[13] ; 
								prbs[127] <=  prbs[13] ^ prbs[14] ; 
                            end
                            SEL_PRBS_23 : begin
                                // PRBS 2^23-1 (T[23,18]) (parallel 128-bit serializer)
                                prbs[0] <=  prbs[0] ^ prbs[3] ^ prbs[8] ^ prbs[10] ^ prbs[13] ^ prbs[16] ^ prbs[21] ; 
								prbs[1] <=  prbs[1] ^ prbs[4] ^ prbs[9] ^ prbs[11] ^ prbs[14] ^ prbs[17] ^ prbs[22] ; 
								prbs[2] <=  prbs[0] ^ prbs[2] ^ prbs[5] ^ prbs[10] ^ prbs[12] ^ prbs[15] ; 
								prbs[3] <=  prbs[1] ^ prbs[3] ^ prbs[6] ^ prbs[11] ^ prbs[13] ^ prbs[16] ; 
								prbs[4] <=  prbs[2] ^ prbs[4] ^ prbs[7] ^ prbs[12] ^ prbs[14] ^ prbs[17] ; 
								prbs[5] <=  prbs[3] ^ prbs[5] ^ prbs[8] ^ prbs[13] ^ prbs[15] ^ prbs[18] ; 
								prbs[6] <=  prbs[4] ^ prbs[6] ^ prbs[9] ^ prbs[14] ^ prbs[16] ^ prbs[19] ; 
								prbs[7] <=  prbs[5] ^ prbs[7] ^ prbs[10] ^ prbs[15] ^ prbs[17] ^ prbs[20] ; 
								prbs[8] <=  prbs[6] ^ prbs[8] ^ prbs[11] ^ prbs[16] ^ prbs[18] ^ prbs[21] ; 
								prbs[9] <=  prbs[7] ^ prbs[9] ^ prbs[12] ^ prbs[17] ^ prbs[19] ^ prbs[22] ; 
								prbs[10] <=  prbs[0] ^ prbs[8] ^ prbs[10] ^ prbs[13] ^ prbs[20] ; 
								prbs[11] <=  prbs[1] ^ prbs[9] ^ prbs[11] ^ prbs[14] ^ prbs[21] ; 
								prbs[12] <=  prbs[2] ^ prbs[10] ^ prbs[12] ^ prbs[15] ^ prbs[22] ; 
								prbs[13] <=  prbs[0] ^ prbs[3] ^ prbs[11] ^ prbs[13] ^ prbs[16] ^ prbs[18] ; 
								prbs[14] <=  prbs[1] ^ prbs[4] ^ prbs[12] ^ prbs[14] ^ prbs[17] ^ prbs[19] ; 
								prbs[15] <=  prbs[2] ^ prbs[5] ^ prbs[13] ^ prbs[15] ^ prbs[18] ^ prbs[20] ; 
								prbs[16] <=  prbs[3] ^ prbs[6] ^ prbs[14] ^ prbs[16] ^ prbs[19] ^ prbs[21] ; 
								prbs[17] <=  prbs[4] ^ prbs[7] ^ prbs[15] ^ prbs[17] ^ prbs[20] ^ prbs[22] ; 
								prbs[18] <=  prbs[0] ^ prbs[5] ^ prbs[8] ^ prbs[16] ^ prbs[21] ; 
								prbs[19] <=  prbs[1] ^ prbs[6] ^ prbs[9] ^ prbs[17] ^ prbs[22] ; 
								prbs[20] <=  prbs[0] ^ prbs[2] ^ prbs[7] ^ prbs[10] ; 
								prbs[21] <=  prbs[1] ^ prbs[3] ^ prbs[8] ^ prbs[11] ; 
								prbs[22] <=  prbs[2] ^ prbs[4] ^ prbs[9] ^ prbs[12] ; 
								prbs[23] <=  prbs[3] ^ prbs[5] ^ prbs[10] ^ prbs[13] ; 
								prbs[24] <=  prbs[4] ^ prbs[6] ^ prbs[11] ^ prbs[14] ; 
								prbs[25] <=  prbs[5] ^ prbs[7] ^ prbs[12] ^ prbs[15] ; 
								prbs[26] <=  prbs[6] ^ prbs[8] ^ prbs[13] ^ prbs[16] ; 
								prbs[27] <=  prbs[7] ^ prbs[9] ^ prbs[14] ^ prbs[17] ; 
								prbs[28] <=  prbs[8] ^ prbs[10] ^ prbs[15] ^ prbs[18] ; 
								prbs[29] <=  prbs[9] ^ prbs[11] ^ prbs[16] ^ prbs[19] ; 
								prbs[30] <=  prbs[10] ^ prbs[12] ^ prbs[17] ^ prbs[20] ; 
								prbs[31] <=  prbs[11] ^ prbs[13] ^ prbs[18] ^ prbs[21] ; 
								prbs[32] <=  prbs[12] ^ prbs[14] ^ prbs[19] ^ prbs[22] ; 
								prbs[33] <=  prbs[0] ^ prbs[13] ^ prbs[15] ^ prbs[18] ^ prbs[20] ; 
								prbs[34] <=  prbs[1] ^ prbs[14] ^ prbs[16] ^ prbs[19] ^ prbs[21] ; 
								prbs[35] <=  prbs[2] ^ prbs[15] ^ prbs[17] ^ prbs[20] ^ prbs[22] ; 
								prbs[36] <=  prbs[0] ^ prbs[3] ^ prbs[16] ^ prbs[21] ; 
								prbs[37] <=  prbs[1] ^ prbs[4] ^ prbs[17] ^ prbs[22] ; 
								prbs[38] <=  prbs[0] ^ prbs[2] ^ prbs[5] ; 
								prbs[39] <=  prbs[1] ^ prbs[3] ^ prbs[6] ; 
								prbs[40] <=  prbs[2] ^ prbs[4] ^ prbs[7] ; 
								prbs[41] <=  prbs[3] ^ prbs[5] ^ prbs[8] ; 
								prbs[42] <=  prbs[4] ^ prbs[6] ^ prbs[9] ; 
								prbs[43] <=  prbs[5] ^ prbs[7] ^ prbs[10] ; 
								prbs[44] <=  prbs[6] ^ prbs[8] ^ prbs[11] ; 
								prbs[45] <=  prbs[7] ^ prbs[9] ^ prbs[12] ; 
								prbs[46] <=  prbs[8] ^ prbs[10] ^ prbs[13] ; 
								prbs[47] <=  prbs[9] ^ prbs[11] ^ prbs[14] ; 
								prbs[48] <=  prbs[10] ^ prbs[12] ^ prbs[15] ; 
								prbs[49] <=  prbs[11] ^ prbs[13] ^ prbs[16] ; 
								prbs[50] <=  prbs[12] ^ prbs[14] ^ prbs[17] ; 
								prbs[51] <=  prbs[13] ^ prbs[15] ^ prbs[18] ; 
								prbs[52] <=  prbs[14] ^ prbs[16] ^ prbs[19] ; 
								prbs[53] <=  prbs[15] ^ prbs[17] ^ prbs[20] ; 
								prbs[54] <=  prbs[16] ^ prbs[18] ^ prbs[21] ; 
								prbs[55] <=  prbs[17] ^ prbs[19] ^ prbs[22] ; 
								prbs[56] <=  prbs[0] ^ prbs[20] ; 
								prbs[57] <=  prbs[1] ^ prbs[21] ; 
								prbs[58] <=  prbs[2] ^ prbs[22] ; 
								prbs[59] <=  prbs[0] ^ prbs[3] ^ prbs[18] ; 
								prbs[60] <=  prbs[1] ^ prbs[4] ^ prbs[19] ; 
								prbs[61] <=  prbs[2] ^ prbs[5] ^ prbs[20] ; 
								prbs[62] <=  prbs[3] ^ prbs[6] ^ prbs[21] ; 
								prbs[63] <=  prbs[4] ^ prbs[7] ^ prbs[22] ; 
								prbs[64] <=  prbs[0] ^ prbs[5] ^ prbs[8] ^ prbs[18] ; 
								prbs[65] <=  prbs[1] ^ prbs[6] ^ prbs[9] ^ prbs[19] ; 
								prbs[66] <=  prbs[2] ^ prbs[7] ^ prbs[10] ^ prbs[20] ; 
								prbs[67] <=  prbs[3] ^ prbs[8] ^ prbs[11] ^ prbs[21] ; 
								prbs[68] <=  prbs[4] ^ prbs[9] ^ prbs[12] ^ prbs[22] ; 
								prbs[69] <=  prbs[0] ^ prbs[5] ^ prbs[10] ^ prbs[13] ^ prbs[18] ; 
								prbs[70] <=  prbs[1] ^ prbs[6] ^ prbs[11] ^ prbs[14] ^ prbs[19] ; 
								prbs[71] <=  prbs[2] ^ prbs[7] ^ prbs[12] ^ prbs[15] ^ prbs[20] ; 
								prbs[72] <=  prbs[3] ^ prbs[8] ^ prbs[13] ^ prbs[16] ^ prbs[21] ; 
								prbs[73] <=  prbs[4] ^ prbs[9] ^ prbs[14] ^ prbs[17] ^ prbs[22] ; 
								prbs[74] <=  prbs[0] ^ prbs[5] ^ prbs[10] ^ prbs[15] ; 
								prbs[75] <=  prbs[1] ^ prbs[6] ^ prbs[11] ^ prbs[16] ; 
								prbs[76] <=  prbs[2] ^ prbs[7] ^ prbs[12] ^ prbs[17] ; 
								prbs[77] <=  prbs[3] ^ prbs[8] ^ prbs[13] ^ prbs[18] ; 
								prbs[78] <=  prbs[4] ^ prbs[9] ^ prbs[14] ^ prbs[19] ; 
								prbs[79] <=  prbs[5] ^ prbs[10] ^ prbs[15] ^ prbs[20] ; 
								prbs[80] <=  prbs[6] ^ prbs[11] ^ prbs[16] ^ prbs[21] ; 
								prbs[81] <=  prbs[7] ^ prbs[12] ^ prbs[17] ^ prbs[22] ; 
								prbs[82] <=  prbs[0] ^ prbs[8] ^ prbs[13] ; 
								prbs[83] <=  prbs[1] ^ prbs[9] ^ prbs[14] ; 
								prbs[84] <=  prbs[2] ^ prbs[10] ^ prbs[15] ; 
								prbs[85] <=  prbs[3] ^ prbs[11] ^ prbs[16] ; 
								prbs[86] <=  prbs[4] ^ prbs[12] ^ prbs[17] ; 
								prbs[87] <=  prbs[5] ^ prbs[13] ^ prbs[18] ; 
								prbs[88] <=  prbs[6] ^ prbs[14] ^ prbs[19] ; 
								prbs[89] <=  prbs[7] ^ prbs[15] ^ prbs[20] ; 
								prbs[90] <=  prbs[8] ^ prbs[16] ^ prbs[21] ; 
								prbs[91] <=  prbs[9] ^ prbs[17] ^ prbs[22] ; 
								prbs[92] <=  prbs[0] ^ prbs[10] ; 
								prbs[93] <=  prbs[1] ^ prbs[11] ; 
								prbs[94] <=  prbs[2] ^ prbs[12] ; 
								prbs[95] <=  prbs[3] ^ prbs[13] ; 
								prbs[96] <=  prbs[4] ^ prbs[14] ; 
								prbs[97] <=  prbs[5] ^ prbs[15] ; 
								prbs[98] <=  prbs[6] ^ prbs[16] ; 
								prbs[99] <=  prbs[7] ^ prbs[17] ; 
								prbs[100] <=  prbs[8] ^ prbs[18] ; 
								prbs[101] <=  prbs[9] ^ prbs[19] ; 
								prbs[102] <=  prbs[10] ^ prbs[20] ; 
								prbs[103] <=  prbs[11] ^ prbs[21] ; 
								prbs[104] <=  prbs[12] ^ prbs[22] ; 
								prbs[105] <=  prbs[0] ^ prbs[13] ^ prbs[18] ; 
								prbs[106] <=  prbs[1] ^ prbs[14] ^ prbs[19] ; 
								prbs[107] <=  prbs[2] ^ prbs[15] ^ prbs[20] ; 
								prbs[108] <=  prbs[3] ^ prbs[16] ^ prbs[21] ; 
								prbs[109] <=  prbs[4] ^ prbs[17] ^ prbs[22] ; 
								prbs[110] <=  prbs[0] ^ prbs[5] ; 
								prbs[111] <=  prbs[1] ^ prbs[6] ; 
								prbs[112] <=  prbs[2] ^ prbs[7] ; 
								prbs[113] <=  prbs[3] ^ prbs[8] ; 
								prbs[114] <=  prbs[4] ^ prbs[9] ; 
								prbs[115] <=  prbs[5] ^ prbs[10] ; 
								prbs[116] <=  prbs[6] ^ prbs[11] ; 
								prbs[117] <=  prbs[7] ^ prbs[12] ; 
								prbs[118] <=  prbs[8] ^ prbs[13] ; 
								prbs[119] <=  prbs[9] ^ prbs[14] ; 
								prbs[120] <=  prbs[10] ^ prbs[15] ; 
								prbs[121] <=  prbs[11] ^ prbs[16] ; 
								prbs[122] <=  prbs[12] ^ prbs[17] ; 
								prbs[123] <=  prbs[13] ^ prbs[18] ; 
								prbs[124] <=  prbs[14] ^ prbs[19] ; 
								prbs[125] <=  prbs[15] ^ prbs[20] ; 
								prbs[126] <=  prbs[16] ^ prbs[21] ; 
								prbs[127] <=  prbs[17] ^ prbs[22] ; 
                            end
                            SEL_PRBS_31 : begin
                                // PRBS 2^31-1 (T[31,28]) (parallel 128-bit serializer)
                                prbs[0] <=  prbs[12] ^ prbs[15] ^ prbs[24] ^ prbs[27] ; 
								prbs[1] <=  prbs[13] ^ prbs[16] ^ prbs[25] ^ prbs[28] ; 
								prbs[2] <=  prbs[14] ^ prbs[17] ^ prbs[26] ^ prbs[29] ; 
								prbs[3] <=  prbs[15] ^ prbs[18] ^ prbs[27] ^ prbs[30] ; 
								prbs[4] <=  prbs[0] ^ prbs[16] ^ prbs[19] ; 
								prbs[5] <=  prbs[1] ^ prbs[17] ^ prbs[20] ; 
								prbs[6] <=  prbs[2] ^ prbs[18] ^ prbs[21] ; 
								prbs[7] <=  prbs[3] ^ prbs[19] ^ prbs[22] ; 
								prbs[8] <=  prbs[4] ^ prbs[20] ^ prbs[23] ; 
								prbs[9] <=  prbs[5] ^ prbs[21] ^ prbs[24] ; 
								prbs[10] <=  prbs[6] ^ prbs[22] ^ prbs[25] ; 
								prbs[11] <=  prbs[7] ^ prbs[23] ^ prbs[26] ; 
								prbs[12] <=  prbs[8] ^ prbs[24] ^ prbs[27] ; 
								prbs[13] <=  prbs[9] ^ prbs[25] ^ prbs[28] ; 
								prbs[14] <=  prbs[10] ^ prbs[26] ^ prbs[29] ; 
								prbs[15] <=  prbs[11] ^ prbs[27] ^ prbs[30] ; 
								prbs[16] <=  prbs[0] ^ prbs[12] ; 
								prbs[17] <=  prbs[1] ^ prbs[13] ; 
								prbs[18] <=  prbs[2] ^ prbs[14] ; 
								prbs[19] <=  prbs[3] ^ prbs[15] ; 
								prbs[20] <=  prbs[4] ^ prbs[16] ; 
								prbs[21] <=  prbs[5] ^ prbs[17] ; 
								prbs[22] <=  prbs[6] ^ prbs[18] ; 
								prbs[23] <=  prbs[7] ^ prbs[19] ; 
								prbs[24] <=  prbs[8] ^ prbs[20] ; 
								prbs[25] <=  prbs[9] ^ prbs[21] ; 
								prbs[26] <=  prbs[10] ^ prbs[22] ; 
								prbs[27] <=  prbs[11] ^ prbs[23] ; 
								prbs[28] <=  prbs[12] ^ prbs[24] ; 
								prbs[29] <=  prbs[13] ^ prbs[25] ; 
								prbs[30] <=  prbs[14] ^ prbs[26] ; 
								prbs[31] <=  prbs[15] ^ prbs[27] ; 
								prbs[32] <=  prbs[16] ^ prbs[28] ; 
								prbs[33] <=  prbs[17] ^ prbs[29] ; 
								prbs[34] <=  prbs[18] ^ prbs[30] ; 
								prbs[35] <=  prbs[0] ^ prbs[19] ^ prbs[28] ; 
								prbs[36] <=  prbs[1] ^ prbs[20] ^ prbs[29] ; 
								prbs[37] <=  prbs[2] ^ prbs[21] ^ prbs[30] ; 
								prbs[38] <=  prbs[0] ^ prbs[3] ^ prbs[22] ^ prbs[28] ; 
								prbs[39] <=  prbs[1] ^ prbs[4] ^ prbs[23] ^ prbs[29] ; 
								prbs[40] <=  prbs[2] ^ prbs[5] ^ prbs[24] ^ prbs[30] ; 
								prbs[41] <=  prbs[0] ^ prbs[3] ^ prbs[6] ^ prbs[25] ^ prbs[28] ; 
								prbs[42] <=  prbs[1] ^ prbs[4] ^ prbs[7] ^ prbs[26] ^ prbs[29] ; 
								prbs[43] <=  prbs[2] ^ prbs[5] ^ prbs[8] ^ prbs[27] ^ prbs[30] ; 
								prbs[44] <=  prbs[0] ^ prbs[3] ^ prbs[6] ^ prbs[9] ; 
								prbs[45] <=  prbs[1] ^ prbs[4] ^ prbs[7] ^ prbs[10] ; 
								prbs[46] <=  prbs[2] ^ prbs[5] ^ prbs[8] ^ prbs[11] ; 
								prbs[47] <=  prbs[3] ^ prbs[6] ^ prbs[9] ^ prbs[12] ; 
								prbs[48] <=  prbs[4] ^ prbs[7] ^ prbs[10] ^ prbs[13] ; 
								prbs[49] <=  prbs[5] ^ prbs[8] ^ prbs[11] ^ prbs[14] ; 
								prbs[50] <=  prbs[6] ^ prbs[9] ^ prbs[12] ^ prbs[15] ; 
								prbs[51] <=  prbs[7] ^ prbs[10] ^ prbs[13] ^ prbs[16] ; 
								prbs[52] <=  prbs[8] ^ prbs[11] ^ prbs[14] ^ prbs[17] ; 
								prbs[53] <=  prbs[9] ^ prbs[12] ^ prbs[15] ^ prbs[18] ; 
								prbs[54] <=  prbs[10] ^ prbs[13] ^ prbs[16] ^ prbs[19] ; 
								prbs[55] <=  prbs[11] ^ prbs[14] ^ prbs[17] ^ prbs[20] ; 
								prbs[56] <=  prbs[12] ^ prbs[15] ^ prbs[18] ^ prbs[21] ; 
								prbs[57] <=  prbs[13] ^ prbs[16] ^ prbs[19] ^ prbs[22] ; 
								prbs[58] <=  prbs[14] ^ prbs[17] ^ prbs[20] ^ prbs[23] ; 
								prbs[59] <=  prbs[15] ^ prbs[18] ^ prbs[21] ^ prbs[24] ; 
								prbs[60] <=  prbs[16] ^ prbs[19] ^ prbs[22] ^ prbs[25] ; 
								prbs[61] <=  prbs[17] ^ prbs[20] ^ prbs[23] ^ prbs[26] ; 
								prbs[62] <=  prbs[18] ^ prbs[21] ^ prbs[24] ^ prbs[27] ; 
								prbs[63] <=  prbs[19] ^ prbs[22] ^ prbs[25] ^ prbs[28] ; 
								prbs[64] <=  prbs[20] ^ prbs[23] ^ prbs[26] ^ prbs[29] ; 
								prbs[65] <=  prbs[21] ^ prbs[24] ^ prbs[27] ^ prbs[30] ; 
								prbs[66] <=  prbs[0] ^ prbs[22] ^ prbs[25] ; 
								prbs[67] <=  prbs[1] ^ prbs[23] ^ prbs[26] ; 
								prbs[68] <=  prbs[2] ^ prbs[24] ^ prbs[27] ; 
								prbs[69] <=  prbs[3] ^ prbs[25] ^ prbs[28] ; 
								prbs[70] <=  prbs[4] ^ prbs[26] ^ prbs[29] ; 
								prbs[71] <=  prbs[5] ^ prbs[27] ^ prbs[30] ; 
								prbs[72] <=  prbs[0] ^ prbs[6] ; 
								prbs[73] <=  prbs[1] ^ prbs[7] ; 
								prbs[74] <=  prbs[2] ^ prbs[8] ; 
								prbs[75] <=  prbs[3] ^ prbs[9] ; 
								prbs[76] <=  prbs[4] ^ prbs[10] ; 
								prbs[77] <=  prbs[5] ^ prbs[11] ; 
								prbs[78] <=  prbs[6] ^ prbs[12] ; 
								prbs[79] <=  prbs[7] ^ prbs[13] ; 
								prbs[80] <=  prbs[8] ^ prbs[14] ; 
								prbs[81] <=  prbs[9] ^ prbs[15] ; 
								prbs[82] <=  prbs[10] ^ prbs[16] ; 
								prbs[83] <=  prbs[11] ^ prbs[17] ; 
								prbs[84] <=  prbs[12] ^ prbs[18] ; 
								prbs[85] <=  prbs[13] ^ prbs[19] ; 
								prbs[86] <=  prbs[14] ^ prbs[20] ; 
								prbs[87] <=  prbs[15] ^ prbs[21] ; 
								prbs[88] <=  prbs[16] ^ prbs[22] ; 
								prbs[89] <=  prbs[17] ^ prbs[23] ; 
								prbs[90] <=  prbs[18] ^ prbs[24] ; 
								prbs[91] <=  prbs[19] ^ prbs[25] ; 
								prbs[92] <=  prbs[20] ^ prbs[26] ; 
								prbs[93] <=  prbs[21] ^ prbs[27] ; 
								prbs[94] <=  prbs[22] ^ prbs[28] ; 
								prbs[95] <=  prbs[23] ^ prbs[29] ; 
								prbs[96] <=  prbs[24] ^ prbs[30] ; 
								prbs[97] <=  prbs[0] ^ prbs[25] ^ prbs[28] ; 
								prbs[98] <=  prbs[1] ^ prbs[26] ^ prbs[29] ; 
								prbs[99] <=  prbs[2] ^ prbs[27] ^ prbs[30] ; 
								prbs[100] <=  prbs[0] ^ prbs[3] ; 
								prbs[101] <=  prbs[1] ^ prbs[4] ; 
								prbs[102] <=  prbs[2] ^ prbs[5] ; 
								prbs[103] <=  prbs[3] ^ prbs[6] ; 
								prbs[104] <=  prbs[4] ^ prbs[7] ; 
								prbs[105] <=  prbs[5] ^ prbs[8] ; 
								prbs[106] <=  prbs[6] ^ prbs[9] ; 
								prbs[107] <=  prbs[7] ^ prbs[10] ; 
								prbs[108] <=  prbs[8] ^ prbs[11] ; 
								prbs[109] <=  prbs[9] ^ prbs[12] ; 
								prbs[110] <=  prbs[10] ^ prbs[13] ; 
								prbs[111] <=  prbs[11] ^ prbs[14] ; 
								prbs[112] <=  prbs[12] ^ prbs[15] ; 
								prbs[113] <=  prbs[13] ^ prbs[16] ; 
								prbs[114] <=  prbs[14] ^ prbs[17] ; 
								prbs[115] <=  prbs[15] ^ prbs[18] ; 
								prbs[116] <=  prbs[16] ^ prbs[19] ; 
								prbs[117] <=  prbs[17] ^ prbs[20] ; 
								prbs[118] <=  prbs[18] ^ prbs[21] ; 
								prbs[119] <=  prbs[19] ^ prbs[22] ; 
								prbs[120] <=  prbs[20] ^ prbs[23] ; 
								prbs[121] <=  prbs[21] ^ prbs[24] ; 
								prbs[122] <=  prbs[22] ^ prbs[25] ; 
								prbs[123] <=  prbs[23] ^ prbs[26] ; 
								prbs[124] <=  prbs[24] ^ prbs[27] ; 
								prbs[125] <=  prbs[25] ^ prbs[28] ; 
								prbs[126] <=  prbs[26] ^ prbs[29] ; 
								prbs[127] <=  prbs[27] ^ prbs[30] ; 
                            end
                            default: begin
                                prbs <= ~0;
                            end
                       endcase
                    end // end if advance_prbs
                    if (~enable) begin
                        prbs <= ~0;
                    end // end if enable
                end // end if reset_sync
            end //end always for prbs block
		end else begin // 50-bit
		    always @(posedge aso_clk or posedge reset_sync) begin
                if (reset_sync) begin
                    prbs <= ~0;
                end else begin
                    if (state == ST_IDLE) begin
                        prbs <= ~0;
                    end
                    if (advance_prbs) begin
                        case (pattern_select)
                            SEL_PRBS_7 : begin
                                // PRBS 2^7-1 (T[7,6]) (parallel 50-bit serializer)
								prbs[0] <=  prbs[4] ^ prbs[5] ^ prbs[6]; 
								prbs[1] <=  prbs[0] ^ prbs[5]; 
								prbs[2] <=  prbs[1] ^ prbs[6]; 
								prbs[3] <=  prbs[0] ^ prbs[2] ^ prbs[6]; 
								prbs[4] <=  prbs[0] ^ prbs[1] ^ prbs[3] ^ prbs[6]; 
								prbs[5] <=  prbs[0] ^ prbs[1] ^ prbs[2] ^ prbs[4] ^ prbs[6]; 
								prbs[6] <=  prbs[0] ^ prbs[1] ^ prbs[2] ^ prbs[3] ^ prbs[5] ^ prbs[6]; 
								prbs[7] <=  prbs[0] ^ prbs[1] ^ prbs[2] ^ prbs[3] ^ prbs[4]; 
								prbs[8] <=  prbs[1] ^ prbs[2] ^ prbs[3] ^ prbs[4] ^ prbs[5]; 
								prbs[9] <=  prbs[2] ^ prbs[3] ^ prbs[4] ^ prbs[5] ^ prbs[6]; 
								prbs[10] <=  prbs[0] ^ prbs[3] ^ prbs[4] ^ prbs[5]; 
								prbs[11] <=  prbs[1] ^ prbs[4] ^ prbs[5] ^ prbs[6]; 
								prbs[12] <=  prbs[0] ^ prbs[2] ^ prbs[5]; 
								prbs[13] <=  prbs[1] ^ prbs[3] ^ prbs[6]; 
								prbs[14] <=  prbs[0] ^ prbs[2] ^ prbs[4] ^ prbs[6]; 
								prbs[15] <=  prbs[0] ^ prbs[1] ^ prbs[3] ^ prbs[5] ^ prbs[6]; 
								prbs[16] <=  prbs[0] ^ prbs[1] ^ prbs[2] ^ prbs[4]; 
								prbs[17] <=  prbs[1] ^ prbs[2] ^ prbs[3] ^ prbs[5]; 
								prbs[18] <=  prbs[2] ^ prbs[3] ^ prbs[4] ^ prbs[6]; 
								prbs[19] <=  prbs[0] ^ prbs[3] ^ prbs[4] ^ prbs[5] ^ prbs[6]; 
								prbs[20] <=  prbs[0] ^ prbs[1] ^ prbs[4] ^ prbs[5]; 
								prbs[21] <=  prbs[1] ^ prbs[2] ^ prbs[5] ^ prbs[6]; 
								prbs[22] <=  prbs[0] ^ prbs[2] ^ prbs[3]; 
								prbs[23] <=  prbs[1] ^ prbs[3] ^ prbs[4]; 
								prbs[24] <=  prbs[2] ^ prbs[4] ^ prbs[5]; 
								prbs[25] <=  prbs[3] ^ prbs[5] ^ prbs[6]; 
								prbs[26] <=  prbs[0] ^ prbs[4]; 
								prbs[27] <=  prbs[1] ^ prbs[5]; 
								prbs[28] <=  prbs[2] ^ prbs[6]; 
								prbs[29] <=  prbs[0] ^ prbs[3] ^ prbs[6]; 
								prbs[30] <=  prbs[0] ^ prbs[1] ^ prbs[4] ^ prbs[6]; 
								prbs[31] <=  prbs[0] ^ prbs[1] ^ prbs[2] ^ prbs[5] ^ prbs[6]; 
								prbs[32] <=  prbs[0] ^ prbs[1] ^ prbs[2] ^ prbs[3]; 
								prbs[33] <=  prbs[1] ^ prbs[2] ^ prbs[3] ^ prbs[4]; 
								prbs[34] <=  prbs[2] ^ prbs[3] ^ prbs[4] ^ prbs[5]; 
								prbs[35] <=  prbs[3] ^ prbs[4] ^ prbs[5] ^ prbs[6]; 
								prbs[36] <=  prbs[0] ^ prbs[4] ^ prbs[5]; 
								prbs[37] <=  prbs[1] ^ prbs[5] ^ prbs[6]; 
								prbs[38] <=  prbs[0] ^ prbs[2]; 
								prbs[39] <=  prbs[1] ^ prbs[3]; 
								prbs[40] <=  prbs[2] ^ prbs[4]; 
								prbs[41] <=  prbs[3] ^ prbs[5]; 
								prbs[42] <=  prbs[4] ^ prbs[6]; 
								prbs[43] <=  prbs[0] ^ prbs[5] ^ prbs[6]; 
								prbs[44] <=  prbs[0] ^ prbs[1]; 
								prbs[45] <=  prbs[1] ^ prbs[2]; 
								prbs[46] <=  prbs[2] ^ prbs[3]; 
								prbs[47] <=  prbs[3] ^ prbs[4]; 
								prbs[48] <=  prbs[4] ^ prbs[5]; 
								prbs[49] <=  prbs[5] ^ prbs[6]; 
                            end
                            SEL_PRBS_15 : begin
                                // PRBS 2^15 (T[15, 14]) (parallel 50-bit serializer)
                                prbs[0] <=  prbs[6] ^ prbs[10]; 
								prbs[1] <=  prbs[7] ^ prbs[11]; 
								prbs[2] <=  prbs[8] ^ prbs[12]; 
								prbs[3] <=  prbs[9] ^ prbs[13]; 
								prbs[4] <=  prbs[10] ^ prbs[14]; 
								prbs[5] <=  prbs[0] ^ prbs[11] ^ prbs[14]; 
								prbs[6] <=  prbs[0] ^ prbs[1] ^ prbs[12] ^ prbs[14]; 
								prbs[7] <=  prbs[0] ^ prbs[1] ^ prbs[2] ^ prbs[13] ^ prbs[14]; 
								prbs[8] <=  prbs[0] ^ prbs[1] ^ prbs[2] ^ prbs[3]; 
								prbs[9] <=  prbs[1] ^ prbs[2] ^ prbs[3] ^ prbs[4]; 
								prbs[10] <=  prbs[2] ^ prbs[3] ^ prbs[4] ^ prbs[5]; 
								prbs[11] <=  prbs[3] ^ prbs[4] ^ prbs[5] ^ prbs[6]; 
								prbs[12] <=  prbs[4] ^ prbs[5] ^ prbs[6] ^ prbs[7]; 
								prbs[13] <=  prbs[5] ^ prbs[6] ^ prbs[7] ^ prbs[8]; 
								prbs[14] <=  prbs[6] ^ prbs[7] ^ prbs[8] ^ prbs[9]; 
								prbs[15] <=  prbs[7] ^ prbs[8] ^ prbs[9] ^ prbs[10]; 
								prbs[16] <=  prbs[8] ^ prbs[9] ^ prbs[10] ^ prbs[11]; 
								prbs[17] <=  prbs[9] ^ prbs[10] ^ prbs[11] ^ prbs[12]; 
								prbs[18] <=  prbs[10] ^ prbs[11] ^ prbs[12] ^ prbs[13]; 
								prbs[19] <=  prbs[11] ^ prbs[12] ^ prbs[13] ^ prbs[14]; 
								prbs[20] <=  prbs[0] ^ prbs[12] ^ prbs[13]; 
								prbs[21] <=  prbs[1] ^ prbs[13] ^ prbs[14]; 
								prbs[22] <=  prbs[0] ^ prbs[2]; 
								prbs[23] <=  prbs[1] ^ prbs[3]; 
								prbs[24] <=  prbs[2] ^ prbs[4]; 
								prbs[25] <=  prbs[3] ^ prbs[5]; 
								prbs[26] <=  prbs[4] ^ prbs[6]; 
								prbs[27] <=  prbs[5] ^ prbs[7]; 
								prbs[28] <=  prbs[6] ^ prbs[8]; 
								prbs[29] <=  prbs[7] ^ prbs[9]; 
								prbs[30] <=  prbs[8] ^ prbs[10]; 
								prbs[31] <=  prbs[9] ^ prbs[11]; 
								prbs[32] <=  prbs[10] ^ prbs[12]; 
								prbs[33] <=  prbs[11] ^ prbs[13]; 
								prbs[34] <=  prbs[12] ^ prbs[14]; 
								prbs[35] <=  prbs[0] ^ prbs[13] ^ prbs[14]; 
								prbs[36] <=  prbs[0] ^ prbs[1]; 
								prbs[37] <=  prbs[1] ^ prbs[2]; 
								prbs[38] <=  prbs[2] ^ prbs[3]; 
								prbs[39] <=  prbs[3] ^ prbs[4]; 
								prbs[40] <=  prbs[4] ^ prbs[5]; 
								prbs[41] <=  prbs[5] ^ prbs[6]; 
								prbs[42] <=  prbs[6] ^ prbs[7]; 
								prbs[43] <=  prbs[7] ^ prbs[8]; 
								prbs[44] <=  prbs[8] ^ prbs[9]; 
								prbs[45] <=  prbs[9] ^ prbs[10]; 
								prbs[46] <=  prbs[10] ^ prbs[11]; 
								prbs[47] <=  prbs[11] ^ prbs[12]; 
								prbs[48] <=  prbs[12] ^ prbs[13]; 
								prbs[49] <=  prbs[13] ^ prbs[14]; 
                            end
                            SEL_PRBS_23 : begin
                                // PRBS 2^23-1 (T[23,18]) (parallel 50-bit serializer)
                                prbs[0] <=  prbs[4] ^ prbs[9] ^ prbs[14] ^ prbs[19]; 
								prbs[1] <=  prbs[5] ^ prbs[10] ^ prbs[15] ^ prbs[20]; 
								prbs[2] <=  prbs[6] ^ prbs[11] ^ prbs[16] ^ prbs[21]; 
								prbs[3] <=  prbs[7] ^ prbs[12] ^ prbs[17] ^ prbs[22]; 
								prbs[4] <=  prbs[0] ^ prbs[8] ^ prbs[13]; 
								prbs[5] <=  prbs[1] ^ prbs[9] ^ prbs[14]; 
								prbs[6] <=  prbs[2] ^ prbs[10] ^ prbs[15]; 
								prbs[7] <=  prbs[3] ^ prbs[11] ^ prbs[16]; 
								prbs[8] <=  prbs[4] ^ prbs[12] ^ prbs[17]; 
								prbs[9] <=  prbs[5] ^ prbs[13] ^ prbs[18]; 
								prbs[10] <=  prbs[6] ^ prbs[14] ^ prbs[19]; 
								prbs[11] <=  prbs[7] ^ prbs[15] ^ prbs[20]; 
								prbs[12] <=  prbs[8] ^ prbs[16] ^ prbs[21]; 
								prbs[13] <=  prbs[9] ^ prbs[17] ^ prbs[22]; 
								prbs[14] <=  prbs[0] ^ prbs[10]; 
								prbs[15] <=  prbs[1] ^ prbs[11]; 
								prbs[16] <=  prbs[2] ^ prbs[12]; 
								prbs[17] <=  prbs[3] ^ prbs[13]; 
								prbs[18] <=  prbs[4] ^ prbs[14]; 
								prbs[19] <=  prbs[5] ^ prbs[15]; 
								prbs[20] <=  prbs[6] ^ prbs[16]; 
								prbs[21] <=  prbs[7] ^ prbs[17]; 
								prbs[22] <=  prbs[8] ^ prbs[18]; 
								prbs[23] <=  prbs[9] ^ prbs[19]; 
								prbs[24] <=  prbs[10] ^ prbs[20]; 
								prbs[25] <=  prbs[11] ^ prbs[21]; 
								prbs[26] <=  prbs[12] ^ prbs[22]; 
								prbs[27] <=  prbs[0] ^ prbs[13] ^ prbs[18]; 
								prbs[28] <=  prbs[1] ^ prbs[14] ^ prbs[19]; 
								prbs[29] <=  prbs[2] ^ prbs[15] ^ prbs[20]; 
								prbs[30] <=  prbs[3] ^ prbs[16] ^ prbs[21]; 
								prbs[31] <=  prbs[4] ^ prbs[17] ^ prbs[22]; 
								prbs[32] <=  prbs[0] ^ prbs[5]; 
								prbs[33] <=  prbs[1] ^ prbs[6]; 
								prbs[34] <=  prbs[2] ^ prbs[7]; 
								prbs[35] <=  prbs[3] ^ prbs[8]; 
								prbs[36] <=  prbs[4] ^ prbs[9]; 
								prbs[37] <=  prbs[5] ^ prbs[10]; 
								prbs[38] <=  prbs[6] ^ prbs[11]; 
								prbs[39] <=  prbs[7] ^ prbs[12]; 
								prbs[40] <=  prbs[8] ^ prbs[13]; 
								prbs[41] <=  prbs[9] ^ prbs[14]; 
								prbs[42] <=  prbs[10] ^ prbs[15]; 
								prbs[43] <=  prbs[11] ^ prbs[16]; 
								prbs[44] <=  prbs[12] ^ prbs[17]; 
								prbs[45] <=  prbs[13] ^ prbs[18]; 
								prbs[46] <=  prbs[14] ^ prbs[19]; 
								prbs[47] <=  prbs[15] ^ prbs[20]; 
								prbs[48] <=  prbs[16] ^ prbs[21]; 
								prbs[49] <=  prbs[17] ^ prbs[22]; 
                            end
                            SEL_PRBS_31 : begin
                                // PRBS 2^31-1 (T[31,28]) (parallel 50-bit serializer)
                                prbs[0] <=  prbs[6] ^ prbs[12] ; 
								prbs[1] <=  prbs[7] ^ prbs[13] ; 
								prbs[2] <=  prbs[8] ^ prbs[14] ; 
								prbs[3] <=  prbs[9] ^ prbs[15] ; 
								prbs[4] <=  prbs[10] ^ prbs[16] ; 
								prbs[5] <=  prbs[11] ^ prbs[17] ; 
								prbs[6] <=  prbs[12] ^ prbs[18] ; 
								prbs[7] <=  prbs[13] ^ prbs[19] ; 
								prbs[8] <=  prbs[14] ^ prbs[20] ; 
								prbs[9] <=  prbs[15] ^ prbs[21] ; 
								prbs[10] <=  prbs[16] ^ prbs[22] ; 
								prbs[11] <=  prbs[17] ^ prbs[23] ; 
								prbs[12] <=  prbs[18] ^ prbs[24] ; 
								prbs[13] <=  prbs[19] ^ prbs[25] ; 
								prbs[14] <=  prbs[20] ^ prbs[26] ; 
								prbs[15] <=  prbs[21] ^ prbs[27] ; 
								prbs[16] <=  prbs[22] ^ prbs[28] ; 
								prbs[17] <=  prbs[23] ^ prbs[29] ; 
								prbs[18] <=  prbs[24] ^ prbs[30] ; 
								prbs[19] <=  prbs[0] ^ prbs[25] ^ prbs[28] ; 
								prbs[20] <=  prbs[1] ^ prbs[26] ^ prbs[29] ; 
								prbs[21] <=  prbs[2] ^ prbs[27] ^ prbs[30] ; 
								prbs[22] <=  prbs[0] ^ prbs[3] ; 
								prbs[23] <=  prbs[1] ^ prbs[4] ; 
								prbs[24] <=  prbs[2] ^ prbs[5] ; 
								prbs[25] <=  prbs[3] ^ prbs[6] ; 
								prbs[26] <=  prbs[4] ^ prbs[7] ; 
								prbs[27] <=  prbs[5] ^ prbs[8] ; 
								prbs[28] <=  prbs[6] ^ prbs[9] ; 
								prbs[29] <=  prbs[7] ^ prbs[10] ; 
								prbs[30] <=  prbs[8] ^ prbs[11] ; 
								prbs[31] <=  prbs[9] ^ prbs[12] ; 
								prbs[32] <=  prbs[10] ^ prbs[13] ; 
								prbs[33] <=  prbs[11] ^ prbs[14] ; 
								prbs[34] <=  prbs[12] ^ prbs[15] ; 
								prbs[35] <=  prbs[13] ^ prbs[16] ; 
								prbs[36] <=  prbs[14] ^ prbs[17] ; 
								prbs[37] <=  prbs[15] ^ prbs[18] ; 
								prbs[38] <=  prbs[16] ^ prbs[19] ; 
								prbs[39] <=  prbs[17] ^ prbs[20] ; 
								prbs[40] <=  prbs[18] ^ prbs[21] ; 
								prbs[41] <=  prbs[19] ^ prbs[22] ; 
								prbs[42] <=  prbs[20] ^ prbs[23] ; 
								prbs[43] <=  prbs[21] ^ prbs[24] ; 
								prbs[44] <=  prbs[22] ^ prbs[25] ; 
								prbs[45] <=  prbs[23] ^ prbs[26] ; 
								prbs[46] <=  prbs[24] ^ prbs[27] ; 
								prbs[47] <=  prbs[25] ^ prbs[28] ; 
								prbs[48] <=  prbs[26] ^ prbs[29] ; 
								prbs[49] <=  prbs[27] ^ prbs[30] ; 
                            end
                            default: begin
                                prbs <= ~0;
                            end
                       endcase
                    end // end if advance_prbs
                    if (~enable) begin
                        prbs <= ~0;
                    end // end if enable
                end // end if reset_sync
            end //end always for prbs block
		end // end if ST_DATA_W
    endgenerate
endmodule
module pulse_handshake_clock_crosser
#(
    parameter SYNC_DEPTH = 2
)
(
    input      reset,
    input      src_clk,
    input      dst_clk,
    input      in,
    input      ack,
    output     out,
    output     done
);
    wire toggle;
    wire toggle_sync;
    wire pulse_ok;
    // Clock cross the pulse to the destination clock domain
    pulse_clock_crosser
    #(
        .SYNC_DEPTH (SYNC_DEPTH)
    ) mm_to_st_pulser (
        .reset       (reset),
        .src_clk     (src_clk),
        .dst_clk     (dst_clk),
        .in          (in & pulse_ok),
        .toggle      (toggle),
        .toggle_sync (),
        .out         (out)
    );
    // Clock cross the pulse back to indicate completion
    pulse_clock_crosser
    #(
        .SYNC_DEPTH (SYNC_DEPTH)
    ) st_to_mm_pulser (
        .reset       (reset),
        .src_clk     (dst_clk),
        .dst_clk     (src_clk),
        .in          (ack),
        .toggle      (),
        .toggle_sync (toggle_sync),
        .out         (done)
    );
    // Back-to-back pulses are considered a single pulse
    assign pulse_ok = toggle ~^ toggle_sync;
endmodule
module pulse_clock_crosser
#(
    parameter SYNC_DEPTH = 2
)
(
    input      reset,
    input      src_clk,
    input      dst_clk,
    input      in,
    output reg toggle,
    output     toggle_sync,
    output     out
);
    reg toggle_sync_reg = 'b0;
    always @(posedge src_clk or posedge reset) begin
      if (reset) begin
          toggle <= 'b0;
      end else begin
          if (in) begin
              toggle <= ~toggle;
          end
      end
    end
    altera_std_synchronizer
    #(
        .depth   (SYNC_DEPTH)
    ) synchronizer (
        .reset_n (~reset),
        .clk     (dst_clk),
        .din     (toggle),
        .dout    (toggle_sync)
    );
    always @(posedge dst_clk or posedge reset) begin
      if (reset) begin
          toggle_sync_reg <= 'b0;
      end else begin
          toggle_sync_reg <= toggle_sync;
      end
    end
    assign out = toggle_sync ^ toggle_sync_reg;
endmodule
