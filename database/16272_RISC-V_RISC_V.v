// This program was cloned from: https://github.com/MihVuongNguyen/RISC-V
// License: Apache License 2.0

module RISC_V (
    input clk, rst,
    output [31:0] to_mem_data, to_mem_addr,
    output Mem_W_en
);

wire [31:0] mem_data_out, curr_inst, curr_inst_addr, data_a, data_b, Immd_val;
wire BrLT, PC_sel, Reg_W_en, A_sel, B_sel, BrEQ;
wire [3:0] ALU_sel;
wire [2:0] Imm_sel, load_sel;
wire [1:0] WB_sel;

Control Control_unit(
    .instruction(curr_inst),
    .BrEQ(BrEQ), 
    .BrLT(BrLT),
    .ALU_sel(ALU_sel),
    .Imm_sel(Imm_sel),
    .load_sel(load_sel),
    .PC_sel(PC_sel), 
    .Reg_W_en(Reg_W_en), 
    .Mem_W_en(Mem_W_en), 
    .A_sel(A_sel), 
    .B_sel(B_sel), 
    .WB_sel(WB_sel)
);


Data_Path Data_Path(
    .ALU_sel(ALU_sel),
    .Imm_sel(Imm_sel),
    .load_sel(load_sel),
    .PC_sel(PC_sel), 
    .Reg_W_en(Reg_W_en), 
    .A_sel(A_sel), 
    .B_sel(B_sel), 
    .WB_sel(WB_sel),
    .current_instr(curr_inst), 
    .data_mem_out(mem_data_out),
    .clk(clk),
    .rst(rst),
    .BrEQ(BrEQ), 
    .BrLT(BrLT),
    .current_inst_addr_to_Imem(curr_inst_addr), 
    .data_to_mem(to_mem_data), 
    .addr_to_mem(to_mem_addr)
);

Inst_memory Instruction_Memory(
    .addres(curr_inst_addr),
    .inst_out(curr_inst)
);

data_memory Data_Memory(
    .data_in(to_mem_data),
    .address(to_mem_addr),
    .Write_en(Mem_W_en), 
    .clk(clk),
    .rst(rst),
    .data_out(mem_data_out)
);

endmodule