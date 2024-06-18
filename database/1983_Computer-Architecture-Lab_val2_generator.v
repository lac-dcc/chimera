// This program was cloned from: https://github.com/matahho/Computer-Architecture-Lab
// License: MIT License

module Val2Generator(
    input memInst, imm,
    input [31:0] valRm,
    input [11:0] shifterOperand,
    output reg [31:0] val2
);
    integer i;

    always @(memInst or imm or valRm or shifterOperand) begin
        val2 = 32'd0;
        if (memInst) begin // LDR, STR
            val2 = {{20{shifterOperand[11]}}, shifterOperand};
        end
        else begin
            if (imm) begin // immediate
                val2 = {24'd0, shifterOperand[7:0]};
                for (i = 0; i < 2 * shifterOperand[11:8]; i = i + 1) begin
                    val2 = {val2[0], val2[31:1]};
                end
            end
            else begin // shift Rm
                case (shifterOperand[6:5])
                    2'b00: val2 = valRm << shifterOperand[11:7];  // LSL
                    2'b01: val2 = valRm >> shifterOperand[11:7];  // LSR
                    2'b10: val2 = $signed(valRm) >>> shifterOperand[11:7]; // ASR
                    2'b11: begin                                  // ROR
                        val2 = valRm;
                        for (i = 0; i < shifterOperand[11:7]; i = i + 1) begin
                            val2 = {val2[0], val2[31:1]};
                        end
                    end
                    default: val2 = 32'd0;
                endcase
            end
        end
    end
endmodule
