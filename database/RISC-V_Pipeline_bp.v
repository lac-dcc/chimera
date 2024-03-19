/*
 * Ask me anything: via repo/issue, or e-mail: vencifreeman16@sjtu.edu.cn.
 * Author: @VenciFreeman (GitHub), copyright 2019.
 * School: Shanghai Jiao Tong University.

 * Description:
 * This file determines whether a conditional branch (jump) in the instruction
 * flow of a program is likely to be taken or not.

 * Details:
 * No details.

 * History:
 * - 19/12/27: Create this file;
 * - 19/12/28: Fix some errors;
 * - 19/12/29: Finished!

 * Notes:
 */

module BRANCH_PRE(

	input   wire        rst,
	input   wire[31:0]  pc_i,
	input   wire[31:0]	inst_i,
	input   wire		Branch,
	input   wire		Accept,
	input   wire		Predict,
	input   wire		idSel,
	input   wire[31:0] 	idPC,											
	output  reg         PreBranch,
	output  reg [31:0]  PreAddr,
	output  reg			PreAccept,
	output  reg			PreSel
		
);

	reg [0:9]   AllAddrRec[0:4095];
	reg [1:0]	AllPre[0:1023];
	
	reg [11:0] 	GlobalRec;
	reg [1:0] 	GlobalPre[0:4095];
	
	reg [0:9] 	LocalAddrRec[0:1023];
	reg [1:0]	LocalPre[0:1023];
	
	integer i;

/*
 * This always part controls the signal AllAddrRec.
 */
always @ (*) begin
    if (rst)
        for(i = 0; i < 4096; i = i + 1)
			AllAddrRec[i] = 10'b0;
end

/*
 * This always part controls the signal LocalAddrRec.
 */
always @ (*) begin
    if (rst)
        for(i = 0; i < 1024; i = i + 1)
			LocalAddrRec[i] <= 10'b0;
end

/*
 * This always part controls the signal GlobalRec.
 */
always @ (*) begin
    if (rst)
        GlobalRec <= 1'b0;
    else
        GlobalRec <= (GlobalRec << 1 | Accept);
end

/*
 * This always part controls the signal GlobalPre.
 */
always @ (*) begin
    if (rst)
        for(i = 0; i < 4096; i = i + 1)
			GlobalPre[i] = 2'b0;
    else if ( Branch && Predict && idSel && (GlobalPre[GlobalRec] < 3) )
        GlobalPre[GlobalRec] = GlobalPre[GlobalRec] + 1;
    else if ( Branch && !Predict && idSel && (GlobalPre[GlobalRec] > 0) )
        GlobalPre[GlobalRec] = GlobalPre[GlobalRec] - 1;
end

/*
 * This always part controls the signal LocalPre.
 */
always @ (*) begin
    if (rst)
        for(i = 0; i < 1024; i = i + 1)
			LocalPre[i] <= 2'b0;
    else if ( Branch && Predict && !idSel && (LocalPre[LocalAddrRec[idPC[11:2]]] < 3) )
        LocalPre[LocalAddrRec[idPC[11:2]]] <= LocalPre[LocalAddrRec[idPC[11:2]]] + 1;
    else if ( Branch && !Predict && !idSel && (LocalPre[LocalAddrRec[idPC[11:2]]] > 0) )
        LocalPre[LocalAddrRec[idPC[11:2]]] <= LocalPre[LocalAddrRec[idPC[11:2]]] - 1;
end

/*
 * This always part controls the signal PreBranch.
 */
always @ (*) begin
    if (rst)
        PreBranch <= 1'b0;
    else if (inst_i[6:0] == 7'b1100011)
        PreBranch <= 1'b1;
end

/*
 * This always part controls the signal PreAddr.
 */
always @ (*) begin
    if (rst)
        PreAddr <= 32'b0;
    else if (inst_i[6:0] == 7'b1100011) begin
        if ( AllPre[AllAddrRec[pc_i[13:2]]][1] ) begin
            if ( GlobalPre[GlobalRec][1] )
                PreAddr <= pc_i + {{20{inst_i[31]}}, inst_i[7], inst_i[30:25], inst_i[11:8], 1'b0};
            else
                PreAddr <= pc_i + 4;
        end
        else begin
            if ( LocalPre[LocalAddrRec[pc_i[11:2]]][1] )
                PreAddr <= pc_i + {{20{inst_i[31]}}, inst_i[7], inst_i[30:25], inst_i[11:8], 1'b0};
            else
                PreAddr <= pc_i + 4;
        end
    end
end

/*
 * This always part controls the signal PreAccept.
 */
always @ (*) begin
    if (rst)
        PreAccept <= 1'b0;
    else if (inst_i[6:0] == 7'b1100011) begin
        if ( AllPre[AllAddrRec[pc_i[13:2]]][1] ) begin
            if (GlobalPre[GlobalRec][1])
                PreAccept <= 1'b1;
            else
                PreAccept <= 1'b0;
        end
        else begin
            if ( LocalPre[LocalAddrRec[pc_i[11:2]]][1] )
                PreAccept <= 1'b1;
            else
                PreAccept <= 1'b0;
        end
    end
end

/*
 * This always part controls the signal PreASel.
 */
always @ (*) begin
	if (rst) 
		PreSel <= 1'b0;
	else if (inst_i[6:0] == 7'b1100011) 
		if (AllPre[AllAddrRec[pc_i[13:2]]][1])
			PreSel <= 1'b1;
        else
			PreSel <= 1'b0;
    else
        PreSel <= 1'b0;
end


endmodule