
//--------------------------------------------------------------------------------------------------------
// Module  : huffman_decoder
// Type    : synthesizable, IP's sub module
// Standard: Verilog 2001 (IEEE1364-2001)
//--------------------------------------------------------------------------------------------------------

module huffman_decoder #(
    parameter    NUMCODES = 288,
    parameter    OUTWIDTH = 10
)(
    rstn, clk,
    istart, ien, ibit,
    oen, ocode,
    rdaddr, rddata
);


function  integer clogb2;
    input integer val;
//function automatic integer clogb2(input integer val);
    integer valtmp;
begin
    valtmp = val;
    for (clogb2=0; valtmp>0; clogb2=clogb2+1)
        valtmp = valtmp>>1;
end
endfunction


input                               rstn, clk;
input                               istart, ien, ibit;
output                              oen;
output  [            OUTWIDTH-1:0]  ocode;
output  [clogb2(2*NUMCODES-1)-1:0]  rdaddr;
input   [            OUTWIDTH-1:0]  rddata;

wire                                rstn, clk;
wire                                istart, ien, ibit;
reg                                 oen = 1'b0;
reg    [            OUTWIDTH-1:0]   ocode = 0;
wire   [clogb2(2*NUMCODES-1)-1:0]   rdaddr;
wire   [            OUTWIDTH-1:0]   rddata;

reg    [clogb2(2*NUMCODES-1)-2:0]   tpos = 0;
wire   [clogb2(2*NUMCODES-1)-2:0]   ntpos;
reg                                 ienl = 1'b0;

assign rdaddr = {ntpos, ibit};

assign ntpos = ienl ? ((rddata<NUMCODES) ? 0 : (rddata-NUMCODES)) : tpos;

always @ (posedge clk or negedge rstn)
    if(~rstn)
        ienl <= 1'b0;
    else
        ienl <= istart ? 1'b0 : ien;

always @ (posedge clk or negedge rstn)
    if(~rstn)
        tpos <= 0;
    else begin
        if (istart)
            tpos <= 0;
        else
            tpos <= ntpos;
    end

always @ (*)
    if(ienl && rddata<NUMCODES) begin
        oen   = 1'b1;
        ocode = rddata;
    end else begin
        oen   = 1'b0;
        ocode = 0;
    end

endmodule
