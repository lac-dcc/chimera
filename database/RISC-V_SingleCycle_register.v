/*
 * Ask me anything: via repo/issue, or e-mail: vencifreeman16@sjtu.edu.cn.
 * Author: @VenciFreeman (GitHub), copyright 2019.
 * School: Shanghai Jiao Tong University.

 * Description:
 * This file is the registers of RISC-V CPU. 

 * Details:
 * - When we need to read readReg1, readReg2, read data from register file
 *   according to the address in readReg1, readReg2;
 * - When we need to write rd, write data into register file according to the
 *   address in rd;
 * - The operation of writing data to the register file uses sequential logic, and
 *   the operation of reading data from register file using combinational logic;
 * - X0 is a constant zero register in RISC-V. When the target register rd is X0,
 *   the data won't actually be written to X0;
 * - If the read and write register signals are valid at the same time, and if the
 *   read address is the same as the write address, then the data which need to
 *   write can be directly output as read data to achieve data forwarding.

 * History:
 * - 19/12/14: Create this file;
 * - 19/12/23: Modify the format;
 * - 19/12/26: Edit module；
 * - 19/12/28: Finished!

 * Notes:
 * - Single cycle donesn't need data forward.
 */

 module Registers(

    input   wire        clk,
    input   wire        rst,
    input   wire        we,
    input   wire[4:0]   WriteAddr,
    input   wire[31:0]  WriteData,
    input   wire        ReadReg1,
    input   wire        ReadReg2,
    input   wire[4:0]   ReadAddr1,
    input   wire[4:0]   ReadAddr2,
    output  reg [31:0]  ReadData1,
    output  reg [31:0]  ReadData2

    );

    integer i;
    reg [31:0] regFile [0:32];

/*
 * This always part controls the regFile, it's a 32*32 reg.
 */    
always @ (posedge clk) begin
    regFile[5'h0] <= 32'b0;  // Register x0 always equals 0. 
    if (rst)
        for (i = 0; i < 32; i = i + 1)
            regFile[i] <= 32'b0;
    if (!rst && we && WriteAddr != 5'h0) begin
        regFile[WriteAddr] <= WriteData;  // Write data to register.
        $display("x%d = %h", WriteAddr, WriteData);  // Display the change of register.
    end
end

/*
 * This always part controls the signal ReadData1 as rs1. 
 */ 
always @ (*) begin
    if (rst || ReadAddr1 == 5'h0)
        ReadData1 <= 32'b0;
    else if (ReadReg1) begin
        ReadData1 <= regFile[ReadAddr1];
    end else
        ReadData1 <= 32'b0;
end

/*
 * This always part controls the signal ReadData2 as rs2.
 */ 
always @ (*) begin
    if (rst || ReadAddr2 == 5'h0)
        ReadData2 <= 32'b0;
    else if (ReadReg2) begin
        ReadData2 <= regFile[ReadAddr2];
    end else
        ReadData2 <= 32'b0;
end
    
endmodule