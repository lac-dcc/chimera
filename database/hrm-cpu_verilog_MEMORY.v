// This program was cloned from: https://github.com/adumont/hrm-cpu
// License: GNU General Public License v3.0

`default_nettype none

module MEMORY (
        input  wire [7:0] ADDR,
        input  wire       clk,
        input  wire [7:0] R,
        input  wire       srcA,
        input  wire       wM,
        input  wire       wAR,
        input  wire       mmio, // Memory Mapped IO
        input  wire       rst,
        output wire [7:0] M,
        output wire [7:0] o_leds
    );

    wire [7:0] AR_d;

    parameter ROMFILE = "";

    // MUX: select what goes into AR
    assign AR_d = ( srcA == 0 ) ? ADDR : M ;

    // AR: Address Register
    reg [7:0] AR_q;

    always @(posedge clk)
    begin
        if( wAR )
            AR_q <= AR_d;
        else
            AR_q <= AR_q;
    end

    mem_wrapper #(  ) mem_wrapper0 (
        .clk( clk ),
        .addr( AR_q ),
        .dout( M ),
        .write_en( wM ),
        .mmio( mmio ),
        .din( R ),
        .o_leds( o_leds ),
        .rst( rst )
    );
    defparam mem_wrapper0.ROMFILE = ROMFILE;

`ifndef SYNTHESIS
    always @(R)
       $display("%t DEBUG AR_q=%h", $time, AR_q);
    always @(M)
       $display("%t DEBUG M=%h", $time, M);
`endif

endmodule
