/*
 * Ask me anything: via repo/issue, or e-mail: vencifreeman16@sjtu.edu.cn.
 * Author: @VenciFreeman (GitHub), copyright 2019.
 * School: Shanghai Jiao Tong University.

 * Description:
 * Sequential circult between EX and MEM.

 * Details:
 * - Sequential logic: Pass the calculated result data in ex.v, target register
 *   address, write register flag and other signals.
 * - When the pipeline is blocked, the above signals remain unchanged or cleared
 *   (Bubble).

 * History:
 * - 19/12/27: Create this file;
 * - 19/12/28: Fix some errors;
 * - 19/12/29: Finished!

 * Notes:
 */

 module EX_MEM(

	input   wire        clk,
	input   wire        rst,
	input   wire[5:0]	stall,	
	input   wire[4:0]   exWriteNum,  
	input   wire        exWriteReg,
	input   wire[31:0]	exWriteData, 
	input   wire[4:0]   exALUop,
	input   wire[31:0]  exAddr,
	input   wire[31:0]  exReg,
	output  reg [4:0]   memALUop,
	output  reg [31:0]  memAddr,
	output  reg [31:0]  memReg,
	output  reg [4:0]   memWriteNum,
	output  reg         memWriteReg,
	output  reg [31:0]	memWriteData

);

/*
 * This always part controls the signal memWriteNum.
 */
always @ (posedge clk) begin
    if (rst)
        memWriteNum <= 5'b0;
    else if (stall[4:3] == 2'b01)
        memWriteNum <= 5'b0;
    else if (!stall[3])
        memWriteNum <= exWriteNum;
end

/*
 * This always part controls the signal memWriteReg.
 */
always @ (posedge clk) begin
    if (rst)
        memWriteReg <= 1'b0;
    else if (stall[4:3] == 2'b01)
        memWriteReg <= 1'b0;
    else if (!stall[3])
        memWriteReg <= exWriteReg;
end

/*
 * This always part controls the signal memWriteData.
 */
always @ (posedge clk) begin
    if (rst)
        memWriteData <= 32'b0;
    else if (stall[4:3] == 2'b01)
        memWriteData <= 32'b0;
    else if (!stall[3])
        memWriteData <= exWriteData;
end

/*
 * This always part controls the signal memALUop.
 */
always @ (posedge clk) begin
    if (rst)
        memALUop <= 5'b0;
    else if (stall[4:3] == 2'b01)
        memALUop <= 5'b0;
    else if (!stall[3])
        memALUop <= exALUop;
end

/*
 * This always part controls the signal memAddr.
 */
always @ (posedge clk) begin
    if (rst)
        memAddr <= 32'b0;
    else if (stall[4:3] == 2'b01)
        memAddr <= 32'b0;
    else if (!stall[3])
        memAddr <= exAddr;
end

/*
 * This always part controls the signal memReg.
 */
always @ (posedge clk) begin
    if (rst)
        memReg <= 32'b0;
    else if (stall[4:3] == 2'b01)
        memReg <= 32'b0;
    else if (!stall[3])
        memReg <= exReg;
end

endmodule