// This program was cloned from: https://github.com/chandana38/RISCVerse
// License: MIT License


module reg_sign_tb;

    // Signals
	reg clk;
	reg rst;
	reg [31:0] instr_reg_fetch;
	reg [31:0] alu_control_decode;
	wire [31:0] operand_a;
	wire [31:0] operand_b;
	wire [31:0] imm_data_decode;
	
    // Instantiate the sign_extension module
reg_sign reg_sign_inst(
	.clk(clk),
        .rst(rst),
        .instr_reg_fetch(instr_reg_fetch),
	.alu_control_decode(alu_control_decode),
	.operand_a(operand_a),
	.operand_b(operand_b),
        .imm_data_decode(imm_data_decode)
        );


initial begin
	clk = 0;
	forever #5 clk = ~clk;  
end

    // Initial values
initial begin
        $dumpfile("reg_sign.vcd");
        $dumpvars(0, reg_sign_tb);

	
        // Reset
        rst = 0;
        instr_reg_fetch = 32'h0;
        alu_control_decode = 32'b10; 
        #10; 
        
        rst = 1;
        reg_sign_inst.reg_bank_inst.reg_bank[4] = 32'h11111111;		// 00100
        reg_sign_inst.reg_bank_inst.reg_bank[6] = 32'h10000678;		//00110
	reg_sign_inst.reg_bank_inst.reg_bank[21] = 32'h12345678;	// 10101
	reg_sign_inst.reg_bank_inst.reg_bank[22] = 32'h10101010;	// 10110
	reg_sign_inst.reg_bank_inst.reg_bank[31] = 32'hABCDABCD;	// 11111

        // Test different opcodes
        
        #20; instr_reg_fetch = 32'b10111110010000110111111110110011; // r_type
        
        #20; instr_reg_fetch = 32'b10111110011010101111111110010011; // i_type

        #20; instr_reg_fetch = 32'b10111111010110110111111110100011; // s_type

        #20; instr_reg_fetch = 32'b10111111011011111111111111100011; // b_type

        #20; instr_reg_fetch = 32'b10111111111100100111111110000011; // l_type

        #20; alu_control_decode = 32'b0; 
        instr_reg_fetch = 32'b10111110010000110111111110110011; // r_type
        
        #20
        $finish;
end

endmodule
	
	

