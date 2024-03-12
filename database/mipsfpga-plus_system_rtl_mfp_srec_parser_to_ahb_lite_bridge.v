`include "mfp_ahb_lite.vh"

module mfp_srec_parser_to_ahb_lite_bridge
(
    input             clock,
    input             reset_n,

    input      [31:0] write_address,
    input      [ 7:0] write_byte,
    input             write_enable,

    output     [31:0] HADDR,
    output     [ 2:0] HBURST,
    output            HMASTLOCK,
    output     [ 3:0] HPROT,
    output     [ 2:0] HSIZE,
    output     [ 1:0] HTRANS,
    output reg [31:0] HWDATA,
    output            HWRITE
);
    
    assign HBURST    = `HBURST_SINGLE;
    assign HMASTLOCK = 1'b0;
    assign HPROT     = 4'b0;
    
    `ifdef MFP_USE_UART_PROGRAM_LOADER_WORD_ALIGN
        
        // AHB-lite transfer using `HSIZE_4
        reg  [31:0] addr;
        wire firstByte  = write_enable && write_address[1:0] == 2'b00;
        wire lastByte   = write_enable && write_address[1:0] == 2'b11;

        assign HADDR    = addr;
        assign HSIZE    = `HSIZE_4;
        assign HTRANS   = lastByte ? `HTRANS_NONSEQ : `HTRANS_IDLE;
        assign HWRITE   = lastByte;

        always @ (posedge clock) begin
            if(write_enable)
                HWDATA <= { write_byte, HWDATA [31:8] };

            if(firstByte)
                addr <= { 3'b0, write_address [28:0] };
        end

    `else
        // AHB-lite transfer using `HSIZE_1
        assign HADDR     = { 3'b0, write_address [28:0] };
        assign HSIZE     = `HSIZE_1;
        assign HTRANS    = write_enable ? `HTRANS_NONSEQ : `HTRANS_IDLE;
        assign HWRITE    = write_enable;

        wire [31:0] padded_write_byte  = { 24'b0, write_byte };
        wire [ 4:0] write_byte_shift   = { write_address [1:0], 3'b0 };
        wire [31:0] HWDATA_next        = padded_write_byte << write_byte_shift;

        always @ (posedge clock)
            HWDATA <= HWDATA_next;

    `endif

endmodule
