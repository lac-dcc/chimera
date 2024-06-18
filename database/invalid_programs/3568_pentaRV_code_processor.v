// This program was cloned from: https://github.com/Rohan7Gupta/pentaRV
// License: Apache License 2.0

`include "fetch.v"
`include "decode.v"
`include "execute.v"
`include "memory.v"
`include "writeback.v"
`include "hazard.v"
`include "MEM.v"
`include "CSR_RegFile.v"

module processor(clk,rst,dump);
input clk,rst,dump;

//fetch
wire [31:0] instrD, PCD, PCF, instrF;
reg flush_fetch;

//decode
wire RegWriteE,MemWriteE,PCBranchE,MemtoRegE, JALRctrlE; 
wire [1:0] SrcASelE,SrcBSelE;
wire [3:0] ALUopE;
wire [2:0] strCtrlE;
wire exception_decode;
wire [4:0] cause_decode;
wire [31:0] trap_val_decode;
reg flush_decode;

//execute
wire [4:0] rdE,rs1E,rs2E;
wire [31:0] immE,PCE,r1E,r2E;
reg flush_execute;

wire RegWriteM, MemWriteM, MemtoRegM, PCsrcE;
wire [2:0] strCtrlM;
wire [4:0] rdM;
wire [31:0] ALUoutM, PCplusImmE, r2M;

//memory
wire [31:0] ALUoutW, ReadDataW, mem_wdataM, mem_rdataM;
wire [4:0] rdW; 
wire MemtoRegW, RegWriteW;
wire [31:0] resultW, trap_val_mem;
wire [3:0] mem_wmaskM;
wire exception_mem;
wire [4:0] cause_mem;
reg flush_memory;

//hazard 
wire [1:0] ForwardAE,ForwardBE;
wire hazard_flush;

//csr
wire csr_wr = 0, csr_rd = 0, is_mret = 0;
wire epc_taken;
wire [11:0] csr_addr = 0;
wire [31:0] csr_rdata = 0;
wire [31:0] vector_pc;
reg [31:0] trap_val;

reg exception, interrupt = 0;
reg[4:0] cause;
CSR_RegFile CSRs(
    .clk(clk), 
    .rst(rst), 
    .csr_wr(csr_wr), 
    .csr_rd(csr_rd), 
    .is_mret(is_mret),
    .csr_addr(csr_addr),
    .wdata(resultW), 
    .PC(PCF), 
    .trap_val(trap_val),
    .exception(exception),
    .interrupt(interrupt), //vectored async interrupt
    .cause(cause),
    .epc_taken(epc_taken), //error pc taken or not
    .rdata(csr_rdata), 
    .next_pc(vector_pc)
);
always @ (*) begin
    if(epc_taken || rst) begin
        exception = 0;
        interrupt = 0; // have not implemented interrupt priority
        cause = 0;
    end
    else begin
        exception = exception_mem | exception_decode;
        if(exception_mem) begin
            cause = cause_mem;
            trap_val = trap_val_mem;
        end
        else if(exception_decode) begin
            cause = cause_decode;
            trap_val = trap_val_decode;
        end
    end
end

//flushing
always @ (*) begin
        flush_fetch <= hazard_flush;
        flush_decode <= hazard_flush;
        flush_execute <= hazard_flush;
        flush_memory <= 0;
end
    //exception => flush all 5 stages
    //even if previous instruction was a jump, if exception occurs that gets flushed
always @(negedge clk) begin
    if (exception) begin 
        flush_fetch=1;
        flush_decode=1;
        flush_execute=1;
        flush_memory=1;
    end
    else begin
        flush_fetch=0;
        flush_decode=0;
        flush_execute=0;
        flush_memory=0;
    end
end

MEM memory_file(clk,rst,MemWriteM,MemtoRegM,dump,mem_wmaskM,ALUoutM[31:0],PCF[31:0],
            mem_wdataM,mem_rdataM,instrF, exception_mem, cause_mem, trap_val_mem);

fetch fetch_unit(clk,rst,flush_fetch,epc_taken, vector_pc, PCsrcE,PCplusImmE,PCD, instrD, PCF, instrF);

decode decode_unit(clk,rst,flush_decode, instrD, PCD, RegWriteW, rdW, resultW, 
                strCtrlE, RegWriteE,MemWriteE, MemtoRegE, PCBranchE, 
                ALUopE, SrcASelE, SrcBSelE, immE, PCE, r1E, r2E, rdE, 
                JALRctrlE, rs1E, rs2E, exception_decode, cause_decode, trap_val_decode);

execute execute_unit(clk,rst,flush_execute,resultW, ForwardAE, ForwardBE, JALRctrlE,
                strCtrlE, RegWriteE, MemWriteE, MemtoRegE, PCBranchE, 
                ALUopE, SrcASelE, SrcBSelE, immE, PCE, r1E, r2E, rdE,
                strCtrlM, RegWriteM, MemWriteM, MemtoRegM,
                ALUoutM , PCplusImmE, rdM, r2M, PCsrcE);

memory memory_unit(clk, rst, flush_memory, strCtrlM, RegWriteM, MemtoRegM,
                ALUoutM, rdM, r2M, ALUoutW, ReadDataW, rdW, 
                MemtoRegW, RegWriteW, mem_wmaskM, mem_wdataM,
                mem_rdataM);

writeback writeback_unit( ALUoutW, ReadDataW, MemtoRegW,resultW);

hazard hazard_unit(clk,rst,PCsrcE, RegWriteM, RegWriteW, rdM, rdW, rs1E, rs2E, 
                    ForwardAE, ForwardBE,hazard_flush);

endmodule