// This program was cloned from: https://github.com/Rohan7Gupta/pentaRV
// License: Apache License 2.0

module memory(clk, rst, flush, strCtrlM, RegWriteM, MemtoRegM,
                ALUoutM, rdM, r2M, ALUoutW, ReadDataW, rdW, 
                MemtoRegW, RegWriteW,mem_wmask,mem_wdata, mem_rdata);

input clk, rst, flush, RegWriteM, MemtoRegM;
input [2:0] strCtrlM;
input [31:0] ALUoutM, r2M, mem_rdata;
input [4:0] rdM;

output [31:0] ALUoutW, ReadDataW, mem_wdata;
output [4:0] rdW; 
output MemtoRegW, RegWriteW;
output wire [3:0] mem_wmask;

wire [31:0] ReadDataM;


wire mem_byteAccess, mem_halfwordAccess, LOAD_sign;
wire [15:0] LOAD_halfword;
wire  [7:0] LOAD_byte;
wire [31:0] LOAD_data;


//store control
assign mem_byteAccess     = strCtrlM[1:0] == 2'b00;
assign mem_halfwordAccess = strCtrlM[1:0] == 2'b01;

// The memory write mask:
   //    1111                     if writing a word
   //    0011 or 1100             if writing a halfword
   //                                (depending on loadstore_addr[1])
   //    0001, 0010, 0100 or 1000 if writing a byte
   //                                (depending on loadstore_addr[1:0])
assign mem_wmask = mem_byteAccess ?
	(ALUoutM[1] ?
	(ALUoutM[0] ? 4'b1000 : 4'b0100) :
	(ALUoutM[0] ? 4'b0010 : 4'b0001)
) :
	mem_halfwordAccess ?
	(ALUoutM[1] ? 4'b1100 : 4'b0011) :
    4'b1111;

//load control

   // All memory accesses are aligned on 32 bits boundary. For this
   // reason, we need some circuitry that does unaligned halfword
   // and byte load/store, based on:
   // - funct3[1:0]:  00->byte 01->halfword 10->word
   // - mem_addr[1:0]: indicates which byte/halfword is accessed
assign LOAD_halfword = ALUoutM[1] ? mem_rdata[31:16] : mem_rdata[15:0];
assign LOAD_byte = ALUoutM[0] ? LOAD_halfword[15:8] : LOAD_halfword[7:0];

   // LOAD, in addition to strCtrlM[1:0], LOAD depends on:
   // - strCtrlM[2] (instr[14]): 0->do sign expansion   1->no sign expansion
assign LOAD_sign = !strCtrlM[2] & (mem_byteAccess ? LOAD_byte[7] : LOAD_halfword[15]);

assign LOAD_data = mem_byteAccess ? {{24{LOAD_sign}},     LOAD_byte} :
                        mem_halfwordAccess ? {{16{LOAD_sign}}, LOAD_halfword} :
                        mem_rdata ;

assign ReadDataM = LOAD_data;

//Store
wire [31:0] wdata;
assign wdata[ 7: 0] = r2M[7:0];
assign wdata[15: 8] = ALUoutM[0] ? r2M[7:0]  : r2M[15: 8];
assign wdata[23:16] = ALUoutM[1] ? r2M[7:0]  : r2M[23:16];
assign wdata[31:24] = ALUoutM[0] ? r2M[7:0]  :
			    ALUoutM[1] ? r2M[15:8] : r2M[31:24];
assign mem_wdata = (wdata)? wdata : 32'b0;


//pipeline register
reg [31:0] reg_ALUoutM, reg_ReadDataM;
reg [4:0] reg_rdM; 
reg reg_MemtoRegM, reg_RegWriteM;

always @(posedge clk or posedge rst) begin
        if(rst | flush) begin
            reg_RegWriteM <= 1'b0;
            reg_MemtoRegM <= 1'b0;
            reg_rdM <= 5'h00;
            reg_ReadDataM <= 32'h00000000;
            reg_ALUoutM <= 32'h00000000;

        end
        else begin
            reg_RegWriteM <= RegWriteM;
            reg_MemtoRegM <= MemtoRegM;
            reg_rdM <= rdM;
            reg_ReadDataM <= ReadDataM;
            reg_ALUoutM <= ALUoutM;
        end
    end

assign RegWriteW = reg_RegWriteM;
assign MemtoRegW = reg_MemtoRegM;
assign rdW = reg_rdM;
assign ALUoutW = reg_ALUoutM;
assign ReadDataW = reg_ReadDataM;

endmodule