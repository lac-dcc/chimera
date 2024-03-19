/*
 * Ask me anything: via repo/issue, or e-mail: vencifreeman16@sjtu.edu.cn.
 * Author: @VenciFreeman (GitHub), copyright 2019.
 * School: Shanghai Jiao Tong University.

 * Description:
 * This file controls signal stall, which about suspended.

 * Details:
 * - When data adventures cannot be resolved through data forwarding, the
 *   pipeline is suspended;
 * - Collect stall request signals from each level. If a level sends a stall
 *   request, all sequential circuits in front of the level are suspended.

 * History:
 * - 19/12/27: Create this file;
 * - 19/12/28: Finished!

 * Notes:
 */

 module STALL(

	input   wire        rst,
	input   wire        StallLoad,
	input   wire        StallBranch,
	output  reg [5:0]   stall       
	
);

/*
 * This always part controls the signal stall.
 */
always @ (*) begin
    if (rst)
        stall <= 6'b0;
    else if (StallBranch)
        stall <= 6'b000010;
    else if (StallLoad)
        stall <= 6'b000111;			
    else
        stall <= 6'b0;
end		

endmodule