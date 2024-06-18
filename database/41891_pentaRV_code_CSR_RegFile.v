// This program was cloned from: https://github.com/Rohan7Gupta/pentaRV
// License: Apache License 2.0


`timescale 1ns / 1ps
module CSR_RegFile(
    input wire clk, rst, csr_wr, csr_rd, is_mret,
    input wire [11:0] csr_addr,
    input wire [31:0] wdata, PC, trap_val,
    input wire exception,
    input wire interrupt, //vectored async interrupt
    input wire [4:0] cause,
    output reg epc_taken, //error pc taken or not
    output reg [31:0] rdata, next_pc
);

    reg [31:0] mvendorid = 0, marchid = 0 ;//processor information
    reg [31:0] mepc, mtvec , mcause, mtval;//exception
    reg [31:0] mstatus = 0, mie = 0, mip = 0;//interrupt not implemented
    initial begin
        mtvec = {30'd2048, 2'b0};
    end

    always @(posedge clk) begin
        if (rst) begin
            mepc    <= 0;
            mcause  <= 0;
            mtval   <= 0;
            mstatus <= 0; //set vale according to requirement
            mie     <= 0; //set vale according to requirement
            mip     <= 0; //set vale according to requirement
            next_pc <= 0;
            epc_taken <= 0;
        end
        else if (csr_wr) begin
            case (csr_addr)
                12'h304: mie     <= wdata;//need to add write restrictions
                12'h344: mip     <= wdata;//need to add write restrictions
                12'h305: mtvec[1:0]   <= wdata[1:0];
                12'h300: mstatus <= wdata;//need to add write restrictions
            endcase
        end
    end

    always @* begin
        rdata = 0;
        if (csr_rd) begin
            case (csr_addr)
                12'hf11: rdata = mvendorid;
                12'hf12: rdata = marchid;
                12'h300: rdata = mstatus;
                12'h304: rdata = mie;
                12'h305: rdata = mtvec;
                12'h341: rdata = mepc;
                12'h343: rdata = mcause;
                12'h343: rdata = mtval;
                12'h344: rdata = mip;

            endcase
        end
    end

    always @(negedge clk) begin
        if (exception) begin
            mepc = PC;
            mcause = {27'b0, cause};
            next_pc = {mtvec[31:2], 2'b0};
            mtval = trap_val;//address of faulty instruction
            epc_taken = 1;
            $display("Exception alert, atleast learn to write proper code");
            $monitor("Simtime = %g, mepc = %h, mcause = %h, mtval = %b, next_pc = %h", $time , mepc, mcause, mtval, next_pc);
        end
        else if (interrupt ) begin //vectored interrupt
            mepc = PC;
            mcause = {1'b1, 26'b0, cause};
            //mstatus mie mip
            if(mtvec[1:0]) begin
                next_pc = {mtvec[31:2],2'b0} + {27'b0,cause}*4;
            end
            else begin
                next_pc = {mtvec[31:2],2'b0};
            end
            epc_taken = 1;
            
        end 
        else if (is_mret) begin
            next_pc = mepc;
        end
        else epc_taken = 0;
    end
endmodule
