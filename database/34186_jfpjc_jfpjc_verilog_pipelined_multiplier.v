// This program was cloned from: https://github.com/johnMamish/jfpjc
// License: MIT License

/**
 * This pipelined multiplier will hopefully infer an iCE40 sysDSP block
 */

`timescale 1ns/100ps

module pipelined_multiplier(input                    clock,
                            input                    nreset,
                            input signed [15:0]      a,
                            input signed [15:0]      b,
                            output signed [31:0]     out);
    parameter SB_MAC16 = 1;
    generate
        if (SB_MAC16 == 1) begin
`ifdef YOSYS
            // SB_MAC16 has async resets inside, so we need to buffer the reset signal by one
            // cycle.
            reg reset;
            always @(posedge clock) begin
                reset <= !nreset;
            end

            SB_MAC16 #(.NEG_TRIGGER(1'b0),    //
                       .C_REG(1'b0),          // C0 on block diagram
                       .A_REG(1'b0),          // C1 on block diagram
                       .B_REG(1'b0),          // C2
                       .D_REG(1'b0),          // C3
                       .TOP_8x8_MULT_REG(1'b1),     // C4
                       .BOT_8x8_MULT_REG(1'b1),     // C5
                       .PIPELINE_16x16_MULT_REG1(1'b1),    // C6
                       .PIPELINE_16x16_MULT_REG2(1'b1),    // C7
                       .TOPOUTPUT_SELECT(2'b11),           // C8,9
                       .TOPADDSUB_LOWERINPUT(2'b00),       // C10,11
                       .TOPADDSUB_UPPERINPUT(1'b0),        // C12
                       .TOPADDSUB_CARRYSELECT(2'b00),      // C13,14
                       .BOTOUTPUT_SELECT(2'b11),           // C15,16
                       .BOTADDSUB_LOWERINPUT(2'b00),       // C17,18
                       .BOTADDSUB_UPPERINPUT(1'b0),        // C19
                       .BOTADDSUB_CARRYSELECT(2'b00),      // C20,21
                       .MODE_8x8(1'b0),                    // labelled "8x8 powersave"
                       .A_SIGNED(1'b1),
                       .B_SIGNED(1'b1)
                       ) mul16_lo_hi (.A(a),
                                      .AHOLD(1'b0),
                                      .B(b),
                                      .BHOLD(1'b0),
                                      .C(16'h0000),
                                      .D(16'h0000),
                                      .CHOLD(1'b1),
                                      .DHOLD(1'b1),

                                      .IRSTTOP                    (reset), //keep hold register in reset
                                      .IRSTBOT                    (reset), //keep hold register in reset
                                      .ORSTTOP                    (reset), //keep hold register in reset
                                      .ORSTBOT                    (reset), //keep hold register in reset
                                      .OLOADTOP                   (1'b0), //keep unused signals quiet
                                      .OLOADBOT                   (1'b0), //keep unused signals quiet
                                      .ADDSUBTOP                  (1'b0), //unused
                                      .ADDSUBBOT                  (1'b0), //unused
                                      .OHOLDTOP                   (1'b1), //keep hold register stable
                                      .OHOLDBOT                   (1'b1), //keep hold register stable

                                      .CE(1'b1),
                                      .CLK(clock),

                                      // .CO(1'b0), .ACCUMCO(1'b0), .SIGNEXTOUT(1'b0),
                                      .CI(1'b0), .ACCUMCI(1'b0), .SIGNEXTIN(1'b0),
                                      .O(out));
`else // !`ifdef YOSYS
            localparam depth = 2;
            reg signed [31:0] internal [(depth - 1) : 0];
            integer i;

            assign out = internal[depth - 1];

            always @ (posedge clock)
            begin
                // registering input of the multiplier
                internal[0] <= a * b;
                for (i = 1; i < depth; i = i + 1)
                  internal [i] <= internal [i - 1];
            end
`endif
        end else begin
            localparam depth = 2;
            reg signed [31:0] internal [(depth - 1) : 0];
            integer i;

            assign out = internal[depth - 1];

            always @ (posedge clock)
            begin
                // registering input of the multiplier
                internal[0] <= a * b;
                for (i = 1; i < depth; i = i + 1)
                  internal [i] <= internal [i - 1];
            end
        end
    endgenerate
endmodule
