`include "mfp_ahb_lite.vh"

// simply ram with HREADY support
module mfp_ahb_ram_busy
#(
    parameter ADDR_WIDTH = 6,
    parameter DELAY_VAL  = 2
)
(
    //ABB-Lite side
    input                       HCLK,    
    input                       HRESETn,
    input       [31:0]          HADDR,
    input       [ 2:0]          HBURST,
    input                       HMASTLOCK,  // ignored
    input       [ 3:0]          HPROT,      // ignored
    input                       HSEL,
    input       [ 2:0]          HSIZE,
    input       [ 1:0]          HTRANS,
    input       [31:0]          HWDATA,
    input                       HWRITE,
    input                       HREADY,
    output      [31:0]          HRDATA,
    output                      HREADYOUT,
    output                      HRESP,
    input                       SI_Endian   // ignored
);
    assign HRESP  = 1'b0;

    parameter   S_INIT          = 0,
                S_IDLE          = 1,
                S_READ          = 2,
                S_WRITE         = 3,
                S_WAIT          = 4;

    reg     [  4 : 0 ]      State, Next;
    reg     [ 31 : 0 ]      HADDR_old;
    reg     [  3 : 0 ]      Delay;

    assign  HREADYOUT = (State == S_IDLE);
    wire    NeedAction = HTRANS != `HTRANS_IDLE && HSEL && HREADY;
    wire    DelayFinished = ( ~| Delay );

    always @ (posedge HCLK) begin
        if (~HRESETn)
            State <= S_INIT;
        else
            State <= Next;
    end

    always @ (*) begin
        Next = State;
        case(State)
            S_INIT:         Next = S_IDLE;
            S_IDLE:         Next = ~NeedAction ? S_IDLE : (HWRITE ? S_WRITE : S_READ);
            S_READ:         Next = S_WAIT;
            S_WRITE:        Next = S_WAIT;
            S_WAIT:         Next = DelayFinished ? S_IDLE : S_WAIT;
        endcase
    end

    always @ (posedge HCLK) begin
        case(State)
            S_INIT:         HADDR_old   <= 32'b0;
            S_IDLE:         if(NeedAction) HADDR_old <= HADDR;
            S_READ:         Delay <= DELAY_VAL;
            S_WRITE:        Delay <= DELAY_VAL;
            S_WAIT:         Delay <= Delay - 1;
        endcase
    end

    wire write_enable = (State == S_WRITE);
    wire [ ADDR_WIDTH - 1 : 0 ] read_addr  = HADDR_old [ ADDR_WIDTH - 1 + 2 : 2];
    wire [ ADDR_WIDTH - 1 : 0 ] write_addr = HADDR_old [ ADDR_WIDTH - 1 + 2 : 2];

    mfp_dual_port_ram
    #(
        .ADDR_WIDTH ( ADDR_WIDTH ),
        .DATA_WIDTH ( 32         )
    )
    ram
    (
        .clk          ( HCLK            ),
        .read_addr    ( read_addr       ),
        .write_addr   ( write_addr      ),
        .write_data   ( HWDATA          ),
        .write_enable ( write_enable    ),
        .read_data    ( HRDATA          )
    );

endmodule
