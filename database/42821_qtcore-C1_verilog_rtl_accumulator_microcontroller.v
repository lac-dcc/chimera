// This program was cloned from: https://github.com/kiwih/qtcore-C1
// License: Apache License 2.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: New York University
// Engineer: ChatGPT GPT-4 Mar 23 version; Hammond Pearce (prompting + assembly + top-level module definition)
// 
// Last Edited Date: 04/19/2023
//////////////////////////////////////////////////////////////////////////////////

`default_nettype none
module accumulator_microcontroller #(
    parameter MEM_SIZE = 256  // Set MEM_SIZE to 256 by default
) 
(
    input wire clk,
    input wire rst,
    input wire scan_enable,
    input wire scan_in,
    output wire scan_out,
    input wire proc_en,
    output wire halt,

    input wire [7:0] IO_in,     // Updated to 8-bit IO_in bus
    output wire [7:0] IO_out,   // Updated to 8-bit IO_out bus
    output wire INT_out,        // New interrupt output

    input wire [7:0] SIG_IN,    // New signal input SIG_IN
    output wire [5:0] SIG_OUT   // New signal output SIG_OUT
);

    
    // Internal Wires

// Wires between the Control Unit and the Datapath
wire PC_write_enable, ACC_write_enable, IR_load_enable, Memory_write_enable, CSR_write_enable, SEG_write_enable;
wire [1:0] PC_mux_select, ACC_mux_select, Memory_address_mux_select, SEG_mux_select;
wire [3:0] ALU_opcode;
wire ALU_inputB_mux_select;
wire illegal_segment_execution;
wire ZF; // zero flag from ALU

// PC - Program Counter
wire [7:0] PC, PC_plus_one, PC_plus_offset, PC_minus_offset, next_PC;

// ACC - Accumulator
wire [7:0] ACC, next_ACC;

// IR - Instruction Register
wire [7:0] IR, next_IR;

// SEG - Segment Register
wire [3:0] SEG, next_SEG;

// ALU - Arithmetic and Logic Unit
wire [7:0] ALU_result;

// Memory
wire [7:0] M_address;
wire [7:0] M_data_in, M_data_out;

// CSR - Control/Status Register
wire [2:0] CSR_address;
wire [7:0] CSR_data_in, CSR_data_out;

// Immediate Values
wire [7:0] IMM;

// Sign + Offset for Branching Instructions
wire sign;
wire [2:0] offset;

// Scan chain
wire scan_in_PC, scan_out_PC;       // Scan chain connections for PC
wire scan_in_ACC, scan_out_ACC;     // Scan chain connections for ACC
wire scan_in_IR, scan_out_IR;       // Scan chain connections for IR
wire scan_in_SEG, scan_out_SEG;     // Scan chain connections for SEG
wire scan_in_memory, scan_out_memory; // Scan chain connections for memory
wire scan_in_CSR, scan_out_CSR;     // Scan chain connections for CSR
// Define scan chain wires for Control Unit
wire scan_in_CU, scan_out_CU;

control_unit ctrl_unit (
    .clk(clk),                              // Connected to the clock
    .rst(rst),                              // Connected to the reset signal
    .processor_enable(proc_en),             // Connected to the processor enable signal
    .illegal_segment_execution(illegal_segment_execution), // Illegal segment execution signal
    .processor_halted(halt),                // Connected to the processor halted signal
    .instruction(IR),                       // Connected to the instruction register output
    .ZF(ZF),                                // Zero Flag input from ALU
    .PC_write_enable(PC_write_enable),      // Enables writing to the PC
    .PC_mux_select(PC_mux_select),          // Selects the input for the PC multiplexer
    .ACC_write_enable(ACC_write_enable),    // Enables writing to the ACC
    .ACC_mux_select(ACC_mux_select),        // Selects the input for the ACC multiplexer
    .IR_load_enable(IR_load_enable),        // Enables loading new instruction into IR from memory
    .ALU_opcode(ALU_opcode),                // Control signal specifying the ALU operation
    .ALU_inputB_mux_select(ALU_inputB_mux_select), // Selects input B for the ALU multiplexer
    .Memory_write_enable(Memory_write_enable), // Enables writing to memory
    .Memory_address_mux_select(Memory_address_mux_select), // Selects input for memory address multiplexer
    .CSR_write_enable(CSR_write_enable),    // Enables writing to CSR
    .SEG_write_enable(SEG_write_enable),    // Enables writing to the Segment Register
    .SEG_mux_select(SEG_mux_select),        // Selects the input for the Segment Register multiplexer
    .scan_enable(scan_enable),            // Scan chain enable signal
    .scan_in(scan_in_CU),                 // Scan chain input
    .scan_out(scan_out_CU)                // Scan chain output
);

// Multiplexer for selecting SEG input
wire [3:0] SEG_input;
wire [3:0] IMM4 = IR[3:0];   // Immediate 4-bit value from instruction
assign SEG_input = (SEG_mux_select) ? ACC[3:0] : IMM4;

// SEG register instantiation
shift_register #(
    .WIDTH(4)  // Set width to 4 bits
) SEG_Register (
    .clk(clk),
    .rst(rst),
    .enable(SEG_write_enable),
    .data_in(SEG_input),
    .data_out(SEG),
    .scan_enable(scan_enable),
    .scan_in(scan_in_SEG),
    .scan_out(scan_out_SEG)
);

// Define a 3-bit immediate value from the bottom three bits of the IR
wire [2:0] IMM3 = IR[2:0];  

// Multiplexer for selecting PC input
wire [7:0] PC_input;
assign PC_input = (PC_mux_select == 2'b00) ? PC + 8'b00000001 :   // PC + 1 for FETCH cycle
                  (PC_mux_select == 2'b01) ? ACC :                // ACC for JMP and JSR
                  (PC_mux_select == 2'b10) ? PC + {5'b0, IMM3} - 1 :  // PC + IMM - 1 for forward branches
                  PC - {5'b0, IMM3} - 1;                              // PC - IMM - 1 for backward branches

// PC register instantiation
shift_register #(
    .WIDTH(8)  // Set width to 8 bits
) PC_Register (
    .clk(clk),
    .rst(rst),
    .enable(PC_write_enable),
    .data_in(PC_input),
    .data_out(PC),
    .scan_enable(scan_enable),            // Scan chain enable signal
    .scan_in(scan_in_PC),                 // Scan chain input
    .scan_out(scan_out_PC)                // Scan chain output
);

// IR register instantiation
shift_register #(
    .WIDTH(8)  // Set width to 8 bits
) IR_Register (
    .clk(clk),
    .rst(rst),
    .enable(IR_load_enable),
    .data_in(M_data_out),
    .data_out(IR),
    .scan_enable(scan_enable),           // Scan chain enable signal
    .scan_in(scan_in_IR),                // Scan chain input
    .scan_out(scan_out_IR)               // Scan chain output
);

// Multiplexer for selecting ACC input
wire [7:0] ACC_input;
assign ACC_input = (ACC_mux_select == 2'b00) ? ALU_result :
                   (ACC_mux_select == 2'b01) ? M_data_out :
                   (ACC_mux_select == 2'b10) ? PC :
                   CSR_data_out;

// ACC register instantiation
shift_register #(
    .WIDTH(8)  // Set width to 8 bits
) ACC_Register (
    .clk(clk),
    .rst(rst),
    .enable(ACC_write_enable),
    .data_in(ACC_input),
    .data_out(ACC),
    .scan_enable(scan_enable),          // Scan chain enable signal
    .scan_in(scan_in_ACC),              // Scan chain input
    .scan_out(scan_out_ACC)             // Scan chain output
);

// Define the ALU B input multiplexer
wire [7:0] ALU_inputB;
assign IMM = IR[3:0];
assign ALU_inputB = (ALU_inputB_mux_select == 1'b0) ? M_data_out : IMM;

// ALU instantiation
alu ALU (
    .A(ACC),
    .B(ALU_inputB),
    .opcode(ALU_opcode),
    .Y(ALU_result)
);

// Multiplexer for selecting the memory address input
wire [7:0] M_address_input;
assign M_address_input = (Memory_address_mux_select == 2'b00) ? {SEG, IR[3:0]} :
                         (Memory_address_mux_select == 2'b01) ? ACC :
                         PC;

// Memory bank instantiation
memory_bank #(
    .ADDR_WIDTH(8),
    .DATA_WIDTH(8),
    .MEM_SIZE(MEM_SIZE)
) mem_bank (
    .clk(clk),
    .rst(rst),
    .address(M_address_input),      // Connect the multiplexer output to the memory bank's address input
    .data_in(ACC),                  // Example connection, replace with appropriate input
    .write_enable(Memory_write_enable),  // Connect the control unit's memory write enable signal
    .data_out(M_data_out),          // Example connection, replace with appropriate output
    .scan_enable(scan_enable),      // Scan chain enable signal
    .scan_in(scan_in_memory),       // Scan chain input
    .scan_out(scan_out_memory)      // Scan chain output
);

wire [7:0] SEGEXE_L_OUT;   // Declare new wire for SEGEXE_L_OUT
wire [7:0] SEGEXE_H_OUT;   // Declare new wire for SEGEXE_H_OUT

wire [2:0] CSR_addr;             // Renamed wire for CSR address

// Extract bottom 3 bits of the output of the instruction register (IR)
assign CSR_addr = IR[2:0];

Control_Status_Registers #(
    .WIDTH(8)  // Set WIDTH to 8
) csr_inst (
    .clk(clk),
    .rst(rst),
    .addr(CSR_addr),                   // Connect CSR_addr to the bottom 3 bits of IR
    .data_in(ACC),                     // Connect data_in to ACC
    .wr_enable(CSR_write_enable),      // Connect wr_enable to CSR_write_enable
    .IO_IN(IO_in),                     // Connect IO_in to IO_IN
    .SIG_IN(SIG_IN),                   // Connect SIG_IN to SIG_IN
    .processor_enable(proc_en),        // Connect processor_enable to top-level proc_en
    .scan_enable(scan_enable),
    .scan_in(scan_in_CSR),             // Renamed scan_in signal as scan_in_CSR
    .scan_out(scan_out_CSR),           // Renamed scan_out signal as scan_out_CSR
    .data_out(CSR_data_out),           // Connect data_out to CSR_data_out
    .SEGEXE_L_OUT(SEGEXE_L_OUT),       // Connect SEGEXE_L_OUT to new wire
    .SEGEXE_H_OUT(SEGEXE_H_OUT),       // Connect SEGEXE_H_OUT to new wire
    .IO_OUT(IO_out),                   // Connect IO_out to IO_OUT
    .SIG_OUT(SIG_OUT),                 // Connect SIG_OUT to SIG_OUT
    .INT_OUT(INT_out)
);



assign scan_in_CU = scan_in;           // Input to Control Unit (CU)
assign scan_in_SEG = scan_out_CU;      // Input to SEG register
assign scan_in_PC = scan_out_SEG;      // Input to PC register
assign scan_in_IR = scan_out_PC;       // Input to IR register
assign scan_in_ACC = scan_out_IR;      // Input to ACC register
assign scan_in_CSR = scan_out_ACC;     // Input to CSR module
assign scan_in_memory = scan_out_CSR;  // Input to memory bank
assign scan_out = scan_out_memory;     // Output of memory bank (final scan chain output)

assign ZF = (ACC == 8'b00000000);  // Set ZF to 1 when ACC is 0, otherwise 0

// Extracting the segment address from the upper 4 bits of PC
wire [3:0] seg_addr;
assign seg_addr = PC[7:4];

// Instantiating the SegmentCheck module
SegmentCheck Segment_Check (
    .seg_addr(seg_addr),
    .SEGEXE_H(SEGEXE_H_OUT),
    .SEGEXE_L(SEGEXE_L_OUT),
    .illegal_segment_address(illegal_segment_execution)
);


endmodule

module SegmentCheck(
  input wire [3:0] seg_addr,
  input wire [7:0] SEGEXE_H,
  input wire [7:0] SEGEXE_L,
  output reg illegal_segment_address
);
  
  always @(*) begin
    if (seg_addr < 8) begin
      illegal_segment_address = SEGEXE_L[seg_addr] == 1'b0;
    end
    else if (seg_addr < 16) begin
      illegal_segment_address = SEGEXE_H[seg_addr-8] == 1'b0;
    end
    else begin
      illegal_segment_address = 1'b1;  // By default, indicate illegal if out of 16
    end
  end

endmodule



`default_nettype wire