// This program was cloned from: https://github.com/navin9212/RISC-V
// License: Apache License 2.0

module register_file_test;
    reg clk_tb;
    reg reset_tb;
    reg [1:0] MtoR_tb;
    reg RegWrite_tb;
    reg AluSrcA_tb;
    reg [1:0] AluSrcB_tb;
    reg [4:0] rs1_tb;
    reg [4:0] rs2_tb;
    reg [4:0] rd_tb;
    reg [31:0] data_tb;
    reg [31:0] AluOut_tb;
    reg [31:0] pc_tb;
    reg [31:0] Imm_tb;
    wire [31:0] wr_data_tb;
    wire [31:0] rsA_tb;
    wire [31:0] rsB_tb;
    wire [31:0] SrcA_tb;
    wire [31:0] SrcB_tb;

register_file r0(
    .clk(clk_tb),
    .reset(reset_tb),
    .MtoR_reg(MtoR_tb),
    .RegWrite_reg(RegWrite_tb),
    .AluSrcA_reg(AluSrcA_tb),
    .AluSrcB_reg(AluSrcB_tb),
    .rs1_reg(rs1_tb),
    .rs2_reg(rs2_tb),
    .rd_reg(rd_tb),
    .data_reg(data_tb),
    .AluOut_reg(AluOut_tb),
    .pc_reg(pc_tb),
    .Imm_reg(Imm_tb),
    .wr_data_reg(wr_data_tb),
    .rsA_reg(rsA_tb),
    .rsB_reg(rsB_tb),
    .SrcA_reg(SrcA_tb),
    .SrcB_reg(SrcB_tb)
);

always #5 clk_tb = ~clk_tb;

//  Initial block to set initial values
initial begin
    clk_tb <= 0;
    reset_tb <= 1;
    MtoR_tb <= 2'b00;
    RegWrite_tb <= 1'b0;
    AluSrcA_tb <= 1'b0;
    AluSrcB_tb <= 2'b00;
    rs1_tb <= 5'b00000;
    rs2_tb <= 5'b00000;
    rd_tb <= 5'b00000;
    data_tb <= 32'h00000000;
    AluOut_tb <= 32'h00000000;
    pc_tb <= 32'h00000000;
    Imm_tb <= 32'h00000000;
    
    #8
    reset_tb <= 0;

    // Set initial values to registers
    r0.register[20] = 32'h11152100;
    r0.register[21] = 32'h36100321;
    r0.register[9] = 32'h00023122;
    
    // Register Write (RegWrite_tb = 1) (R-type)
    MtoR_tb <= 2'b00;
    RegWrite_tb <= 1'b1;
    AluSrcA_tb <= 1'bz;
    AluSrcB_tb <= 2'bzz;
    rs1_tb <= 5'b00011;
    rs2_tb <= 5'b00101;
    rd_tb <= 5'b11001;
    data_tb <= 32'h00001111;
    AluOut_tb <= 32'h00523100;
    pc_tb <= 32'h00001126;
    Imm_tb <= 32'h00000000;
    #10

    // Register Read (RegWrite_tb = 0) (R-type)
    MtoR_tb <= 2'bzz;
    RegWrite_tb <= 1'b0;
    AluSrcA_tb <= 1'bz;
    AluSrcB_tb <= 2'bzz;
    rs1_tb <= 5'b10100;
    rs2_tb <= 5'b10101;
    rd_tb <= 5'b01001;
    data_tb <= 32'h00000000;
    AluOut_tb <= 32'h00000000;
    pc_tb <= 32'h00004326;
    Imm_tb <= 32'h00000000;
    #10
    $finish;
end
endmodule