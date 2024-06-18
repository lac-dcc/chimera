// This program was cloned from: https://github.com/szym-mie/vga3
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1ns/1ps
`include "fifo.v"
`include "seqfifo.v"

// Video Memory Managment Unit
// Read request  -> read addresses ADDR+0, ADDR+1, ADDR+2
//                  output 3 bytes to FIFO
// Write request -> write to address ADDR+0
//                  retrieve 1 byte from FIFO
// Normally switches between Read and Write on each cycle
// If one request source exhausted, uses only non-empty queue
// On no requests stays idle, disconnects memory outputs

module vmmu #(
    parameter WRBUFSIZE = 8,   // write buffer size
    parameter WRIWIDTH = 3,    // write index size
    parameter RDBUFSIZE = 8,   // read buffer size
    parameter RDIWIDTH = 3,    // read index size
    parameter RDSTRIDE = 1'b1, // read stride size
    parameter AWIDTH = 18,     // memory address width
    parameter DWIDTH = 8       // memory data width
) (
    // memory clock
    input wire MemClk,

    // client write request interface
    input wire[DWIDTH-1:0] WriteDataIn,
    input wire[AWIDTH-1:0] WriteAddrIn,
    input wire PushWriteReq,

    // client read request interface
    input wire[AWIDTH-1:0] ReadAddrIn,
    input wire PushReadReq,

    // client read retrieve interface
    output wire[DWIDTH-1:0] ReadDataOut,
    input wire ReadDataClkOut,

    // client queue signal interface
    output wire WriteReqQueueFull,
    output wire ReadReqQueueFull,
    output wire ReadDataQueueEmpty,

    // physical memory interface
    output wire[AWIDTH-1:0] MemAddrPort,
    inout wire[DWIDTH-1:0] MemDataPort,
    output reg MemWriteEnable,
    output reg MemOutputEnable
);

// phase state names
localparam PHASE_ADDR_SETUP = 2'b00; // address setup
localparam PHASE_PORT_CHANGE = 2'b01; // port direction change
localparam PHASE_DATA_SETUP = 2'b10; // address stabilized, data setup
localparam PHASE_DATA_SAMPLE = 2'b11; // data stabilized & sample

// queue emptiness mask
localparam MASK_NONE_EMPTY = 2'b00; // empty cycle ahead
localparam MASK_READ_EMPTY = 2'b01; // only write remaining
localparam MASK_WRITE_EMPTY = 2'b10; // only read remaining
localparam MASK_ALL_EMPTY = 2'b11; // cycle between read & writes as usual

// address sources
wire[AWIDTH-1:0] MemWriteAddr;
wire[AWIDTH-1:0] MemReadAddr;

// data sources
wire[DWIDTH-1:0] MemWriteData;
wire[DWIDTH-1:0] MemReadData;

assign MemDataPort = !MemWriteEnable ? MemWriteData : 8'bzzzz_zzzz;
assign MemReadData = MemDataPort;

assign MemAddrPort = !MemWriteEnable ? MemWriteAddr : MemReadAddr;

// internal memory managment push/pop operations
reg PushReadData; // add read-back data to data output queue
reg PopReadReq; // process read request
reg PopWriteReq; // process write request

// internal signal for arbiter
wire WriteReqQueueEmpty;

// write FIFOs

fifo #(
    .BUFSIZE(WRBUFSIZE),
    .IWIDTH(WRIWIDTH),
    .WWIDTH(DWIDTH)
) WriteDataFIFO (
    .DataIn(WriteDataIn),
    .DataOut(MemWriteData),

    .ClkIn(PushWriteReq),
    .ClkOut(PopWriteReq),

    .IsFull(),
    .IsEmpty()
);

fifo #(
    .BUFSIZE(WRBUFSIZE),
    .IWIDTH(WRIWIDTH),
    .WWIDTH(AWIDTH)
) WriteAddrFIFO (
    .DataIn(WriteAddrIn),
    .DataOut(MemWriteAddr),

    .ClkIn(PushWriteReq),
    .ClkOut(PopWriteReq),

    .IsFull(WriteReqQueueFull),
    .IsEmpty(WriteReqQueueEmpty)
);

// Read FIFOs

fifo #(
    .BUFSIZE(RDBUFSIZE),
     .IWIDTH(RDIWIDTH),
    .WWIDTH(DWIDTH)
) ReadDataFIFO (
    .DataIn(MemReadData),
    .DataOut(ReadDataOut),

    .ClkIn(PushReadData),
    .ClkOut(ReadDataClkOut),

    .IsFull(),
    .IsEmpty(ReadDataQueueEmpty)
);

seqfifo #(
    .BUFSIZE(RDBUFSIZE),
    .STRIDE(RDSTRIDE),
    .IWIDTH(RDIWIDTH),
    .WWIDTH(AWIDTH)
) ReadAddrFIFO (
    .DataIn(ReadAddrIn),
    .DataOut(MemReadAddr),

    .ClkIn(PushReadReq),
    .ClkOut(PopReadReq),

    .IsFull(ReadReqQueueFull),
    .IsEmpty(ReadReqQueueEmpty)
);

reg[1:0] PhaseState = 2'b00;
reg WritePhase = 1'b0;
reg EmptyPhase = 1'b0;

wire[1:0] EmptyMask = { WriteReqQueueEmpty, ReadReqQueueEmpty };

always @(posedge MemClk) begin
    // clear internal signals
    PushReadData <= 1'b0;
    PopReadReq <= 1'b0;
    PopWriteReq <= 1'b0;

    case (PhaseState)
        PHASE_ADDR_SETUP: begin
            if (!EmptyPhase) begin
                MemWriteEnable <= ~WritePhase;
                MemOutputEnable <= WritePhase;

                if (WritePhase) PopWriteReq <= 1'b1;
                else PopReadReq <= 1'b1;
            end else begin
                // disconnect output during empty cycles
                MemWriteEnable <= 1'b1;
                MemOutputEnable <= 1'b1;
            end
        end
        PHASE_PORT_CHANGE: begin
            // nothing done here
        end
        PHASE_DATA_SETUP: begin
            // nothing done here
        end
        PHASE_DATA_SAMPLE: begin
            if (!WritePhase) PushReadData <= 1'b1;
                
            case (EmptyMask)
                MASK_NONE_EMPTY: begin
                    WritePhase <= EmptyPhase ? 1'b0 : ~WritePhase;
                    EmptyPhase <= 1'b0;
                end
                MASK_READ_EMPTY: begin
                    WritePhase <= 1'b1;
                    EmptyPhase <= 1'b0;
                end
                MASK_WRITE_EMPTY: begin
                    WritePhase <= 1'b0;
                    EmptyPhase <= 1'b0;
                end
                MASK_ALL_EMPTY: begin
                    EmptyPhase <= 1'b1;
                end
            endcase
        end
    endcase

    PhaseState <= PhaseState + 2'b01;
end

endmodule
