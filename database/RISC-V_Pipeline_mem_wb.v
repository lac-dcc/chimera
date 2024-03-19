/*
 * Ask me anything: via repo/issue, or e-mail: vencifreeman16@sjtu.edu.cn.
 * Author: @VenciFreeman (GitHub), copyright 2019.
 * School: Shanghai Jiao Tong University.

 * Description:
 * Sequential circult between MEM and WB.

 * Details:
 * - Sequential logic;
 * - Pass the result data to be written to the register, the destination
 *   register address, the write register flag and other signals.

 * History:
 * - 19/12/27: Create this file;
 * - 19/12/27: Finished!

 * Notes:
 */
 
module MEM_WB(

	input   wire        clk,
	input   wire        rst,
	input   wire[5:0]   stall,	
	input   wire[4:0]   MemWriteNum,
	input   wire        MemWriteReg,
	input   wire[31:0]	MemWriteData,
	output  reg [4:0]   wbWriteNum,
	output  reg         wbWriteReg,
	output  reg [31:0]	wbWriteData     
	
);

/*
 * This always part controls the signal wbWriteNum.
 */
always @ (posedge clk) begin
    if (rst)
        wbWriteNum <= 5'b0;
    else if (stall[5:4] == 2'b01)
        wbWriteNum <= 5'b0;
    else if (!stall[4])
        wbWriteNum <= MemWriteNum;
end

/*
 * This always part controls the signal wbWriteReg.
 */
always @ (posedge clk) begin
    if (rst)
        wbWriteReg <= 1'b0;
    else if (stall[5:4] == 2'b01)
        wbWriteReg <= 1'b0;
    else if (!stall[4])
        wbWriteReg <= MemWriteReg;
end

/*
 * This always part controls the signal wbWriteData.
 */
always @ (posedge clk) begin
    if (rst)
        wbWriteData <= 32'b0;
    else if (stall[5:4] == 2'b01)
        wbWriteData <= 32'b0;
    else if (!stall[4])
        wbWriteData <= MemWriteData;
end			

endmodule