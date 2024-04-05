
`include "mfp_ahb_lite.vh"

module mfp_ahb_lite_slave
#(
    parameter   ADDR_WIDTH = 32,
                ADDR_START = 0,
                ADDR_END   = (ADDR_START + ADDR_WIDTH - 1)
)
(
    input                                HCLK,
    input                                HRESETn,
    input      [                31 : 0 ] HADDR,
    input      [                 2 : 0 ] HSIZE,
    input      [                 1 : 0 ] HTRANS,
    input                                HWRITE,
    input                                HSEL,
    input                                HREADY,
    output reg                           HREADYOUT,

    output                               read_enable,
    output     [ ADDR_END : ADDR_START ] read_addr,
    output reg                           write_enable,
    output     [ ADDR_END : ADDR_START ] write_addr,
    output reg [                 3 : 0 ] write_mask
);
    wire   request       = HTRANS != `HTRANS_IDLE && HSEL && HREADY;
    wire   read_request  = request & !HWRITE;
    wire   write_request = request & HWRITE;

    wire [ ADDR_END : ADDR_START ] ADDR = HADDR [ ADDR_END : ADDR_START ];
    reg  [ ADDR_END : ADDR_START ] ADDR_old;

    reg    read_pending;
    assign write_addr   = ADDR_old;
    assign read_addr    = read_request ? ADDR : ADDR_old;
    assign read_enable  = read_request | read_pending;

    wire   read_after_write = read_enable & write_enable 
                            & (read_addr == write_addr);

    wire [3:0] mask = ( HSIZE == `HSIZE_1 ) ? 4'b0001 << HADDR [1:0] : (
                      ( HSIZE == `HSIZE_2 ) ? (HADDR [1] ? 4'b1100 : 4'b0011) : (
                      ( HSIZE == `HSIZE_4 ) ? 4'b1111 : 4'b0000 ));

    always @ (posedge HCLK) begin
        if(~HRESETn) begin
            write_enable    <= 1'b0;
            write_mask      <= 4'b0;
            read_pending    <= 1'b0;
            ADDR_old        <= { ADDR_WIDTH { 1'b0 }};
            HREADYOUT       <= 1'b1;
            end
        else begin
            write_enable    <= write_request;
            write_mask      <= write_request ? mask : 4'b0;

            if(request)
                ADDR_old    <= ADDR;

            HREADYOUT       <= !read_after_write;
            read_pending    <= read_after_write;
        end
    end

endmodule
