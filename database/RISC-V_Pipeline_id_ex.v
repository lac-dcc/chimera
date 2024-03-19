/*
 * Ask me anything: via repo/issue, or e-mail: vencifreeman16@sjtu.edu.cn.
 * Author: @VenciFreeman (GitHub), copyright 2019.
 * School: Shanghai Jiao Tong University.

 * Description:
 * Sequential circult between ID and EX.

 * Details:
 * - Sequential logic;
 * - Pass the decoded ALUop, source operand, destination register address,
 *   write register flag and other signals in id.v;
 * - When the pipeline is blocked, the above signals remain unchanged or
 *   cleared (Bubble).

 * History:
 * - 19/12/27: Create this file;
 * - 19/12/28: Fix some errors;
 * - 19/12/29: Finished!

 * Notes:
 */

module ID_EX(

	input   wire        clk,
	input   wire        rst,
	input   wire[5:0]   stall,
	input   wire[4:0]   idALUop,
	input   wire[31:0]  idReg1,
	input   wire[31:0]  idReg2,
	input   wire[4:0]   idWriteNum,
	input   wire        idWriteReg,	
	input   wire[31:0]  idLinkAddr,
	input   wire[31:0]  idInst,	
	output  reg [4:0]   exALUop,
	output  reg [31:0]  exLinkAddr,
	output  reg [31:0]  exInst,
	output  reg [31:0]  exReg1,
	output  reg [31:0]  exReg2,
	output  reg [4:0]   exWriteNum,
	output  reg         exWriteReg
	
);

/*
 * This always part controls the signal exALUop.
 */
always @ (posedge clk) begin
    if (rst)
        exALUop <= 5'b0;
    else if (stall[3:2] == 2'b01)
        exALUop <= 5'b0;
    else if (!stall[2]) begin
        casex (idInst)
            32'bxxxxxxxxxxxxxxxxxxxxxxxxx1101111: exALUop <= 5'b10000;  // jal
            32'bxxxxxxxxxxxxxxxxx000xxxxx1100011: exALUop <= 5'b10001;  // beq
            32'bxxxxxxxxxxxxxxxxx100xxxxx1100011: exALUop <= 5'b10010;  // blt
            32'bxxxxxxxxxxxxxxxxx010xxxxx0000011: exALUop <= 5'b10100;  // lw
            32'bxxxxxxxxxxxxxxxxx010xxxxx0100011: exALUop <= 5'b10101;  // sw
            32'bxxxxxxxxxxxxxxxxx000xxxxx0010011: exALUop <= 5'b01100;  // addi
            32'b0000000xxxxxxxxxx000xxxxx0110011: exALUop <= 5'b01101;  // add
            32'b0100000xxxxxxxxxx000xxxxx0110011: exALUop <= 5'b01110;  // sub
            32'b0000000xxxxxxxxxx001xxxxx0110011: exALUop <= 5'b01000;  // sll
            32'b0000000xxxxxxxxxx100xxxxx0110011: exALUop <= 5'b00110;  // xor
            32'b0000000xxxxxxxxxx101xxxxx0110011: exALUop <= 5'b01001;  // srl
            32'b0000000xxxxxxxxxx110xxxxx0110011: exALUop <= 5'b00101;  // or
            32'b0000000xxxxxxxxxx111xxxxx0110011: exALUop <= 5'b00100;  // and
            default: exALUop <= 5'b0;
        endcase
    end
end

/*
 * This always part controls the signal exReg1.
 */
always @ (posedge clk) begin
    if (rst)
        exReg1 <= 32'b0;
    else if (stall[3:2] == 2'b01)
        exReg1 <= 32'b0;
    else if (!stall[2])
        exReg1 <= idReg1;
end

/*
 * This always part controls the signal exReg2.
 */
always @ (posedge clk) begin
    if (rst)
        exReg2 <= 32'b0;
    else if (stall[3:2] == 2'b01)
        exReg2 <= 32'b0;
    else if (!stall[2])
        exReg2 <= idReg2;
end

/*
 * This always part controls the signal exWriteNum.
 */
always @ (posedge clk) begin
    if (rst)
        exWriteNum <= 5'b0;
    else if (stall[3:2] == 2'b01)
        exWriteNum <= 5'b0;
    else if (!stall[2])
        exWriteNum <= idWriteNum;
end

/*
 * This always part controls the signal exWriteReg.
 */
always @ (posedge clk) begin
    if (rst)
        exWriteReg <= 1'b0;
    else if (stall[3:2] == 2'b01)
        exWriteReg <= 1'b0;
    else if (!stall[2])
        exWriteReg <= idWriteReg;
end

/*
 * This always part controls the signal exLinkAddr.
 */
always @ (posedge clk) begin
    if (rst)
        exLinkAddr <= 32'b0;
    else if (stall[3:2] == 2'b01)
        exLinkAddr <= 32'b0;
    else if (!stall[2])
        exLinkAddr <= idLinkAddr;
end

/*
 * This always part controls the signal exInst.
 */
always @ (posedge clk) begin
    if (rst)
        exInst <= 32'b0;
    else if (stall[3:2] == 2'b01)
        exInst <= 32'b0;
    else if (!stall[2])
        exInst <= idInst;
end

endmodule