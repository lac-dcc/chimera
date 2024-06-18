// This program was cloned from: https://github.com/Harminder13/RISC-Computer-Design
// License: MIT License

module SelectAndEncode (
    input wire [31:0] IR,
    input wire [1:0] gra, grb, grc,
    input wire [3:0] rin, rOut,
    input wire [3:0] BAOut,
	 
    output wire [31:0] signExtendedConstant, // Forward this to the Bus
    output reg [15:0] r0In, r1In, r2In, r3In, r4In, r5In, r6In, r7In, r8In, r9In, r10In, r11In, r12In, r13In, r14In, r15In,
    output reg [15:0] r0Out, r1Out, r2Out, r3Out, r4Out, r5Out, r6Out, r7Out, r8Out, r9Out, r10Out, r11Out, r12Out, r13Out, r14Out, r15Out
);

    reg [4:0] raIn, rbIn, rcIn, raOut, rbOut, rcOut, decoderInput, ROut_BAOut;
    reg [15:0] decoderOutput;
	 
	
	 // Sign-extend constant C in IR<18> to 32 bits
    wire [31:0] signExtendedConstantWire;
	 
	 assign signExtendedConstantWire = {{14{IR[18]}}, IR[17:0]};
    assign signExtendedConstant = signExtendedConstantWire;

    always @* begin
	 
        // Extract raIn, rbIn, and rcIn from IR
        raIn = IR[26:23];
        rbIn = IR[22:19];
        rcIn = IR[18:15];

        // Perform AND operations for gra, grb, and grc
        raOut = raIn & gra;
        rbOut = rbIn & grb;
        rcOut = rcIn & grc;

        // Perform OR operation to generate the input for the decoder
        decoderInput = raOut | rbOut | rcOut;

        // 4-to-16 decoder module
        Decoder4to16 decoder (
            .input_bits(decoderInput),
            .output_bits(decoderOutput)
        );
	 
        r15In = rin & decoderOutput;
        r14In = rin & decoderOutput;
        r13In = rin & decoderOutput;
        r12In = rin & decoderOutput;
        r11In = rin & decoderOutput;
        r10In = rin & decoderOutput;
        r9In = rin & decoderOutput;
        r8In = rin & decoderOutput;
        r7In = rin & decoderOutput;
        r6In = rin & decoderOutput;
        r5In = rin & decoderOutput;
        r4In = rin & decoderOutput;
        r3In = rin & decoderOutput;
        r2In = rin & decoderOutput;
        r1In = rin & decoderOutput;
        r0In = rin & decoderOutput;
	 
        ROut_BAOut = BAOut | rOut;
	 
        r15Out = ROut_BAOut & decoderOutput;
        r14Out = ROut_BAOut & decoderOutput;
        r13Out = ROut_BAOut & decoderOutput;
        r12Out = ROut_BAOut & decoderOutput;
        r11Out = ROut_BAOut & decoderOutput;
        r10Out = ROut_BAOut & decoderOutput;
        r9Out = ROut_BAOut & decoderOutput;
        r8Out = ROut_BAOut & decoderOutput;
        r7Out = ROut_BAOut & decoderOutput;
        r6Out = ROut_BAOut & decoderOutput;
        r5Out = ROut_BAOut & decoderOutput;
        r4Out = ROut_BAOut & decoderOutput;
        r3Out = ROut_BAOut & decoderOutput;
        r2Out = ROut_BAOut & decoderOutput;
        r1Out = ROut_BAOut & decoderOutput;
    end

endmodule
