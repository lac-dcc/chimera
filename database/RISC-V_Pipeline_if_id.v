/*
 * Ask me anything: via repo/issue, or e-mail: vencifreeman16@sjtu.edu.cn.
 * Author: @VenciFreeman (GitHub), copyright 2019.
 * School: Shanghai Jiao Tong University.

 * Description:
 * Sequential circult between PC and ID.
 * Details:
 * - Sequential logic;
 * - Pass PC value, inst;
 * - When the pipeline is blocked, pc and inst remain unchanged;
 * - When the branch is established, pc and inst are cleared.

 * History:
 * - 19/12/27: Create this file;
 * - 19/12/28: Fix some errors;
 * - 19/12/29: Finished!

 * Notes:
 */

 module PC_ID(

	input   wire        clk,
	input   wire        rst,
	input   wire[5:0]   stall,	
	input   wire[31:0]	ifPC,
	input   wire[31:0]  ifInst,
	input   wire 		Predict_i,
	output  reg 		Predict_o,
	output  reg[31:0]   idPC,
	output  reg[31:0]   idInst

    );

/*
 * This always part controls the signal idPC.
 */
always @ (*) begin
    if (rst)
        idPC <= 32'b0; 
    else if (!stall[1])
        idPC <= ifPC;
    else if (stall[2:1] ==2'b01)
        idPC <= 32'b0;
end

/*
 * This always part controls the signal idInst.
 */
always @ (*) begin
    if (rst)
        idInst <= 32'b0; 
    else if (!stall[1])
        idInst <= ifInst;
    else if (stall[2:1] ==2'b01)
        idInst <= 32'b0;
end

/*
 * This always part controls the signal Predict_o.
 */
always @ (*) begin
    if (rst)
        Predict_o <= 1'b0; 
    else if (!stall[1])
        Predict_o <= Predict_i;
    else if (stall[2:1] ==2'b01)
        Predict_o <= 1'b0;
end
	
 endmodule