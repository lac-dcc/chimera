module serializer
    #(  parameter INLOGBITS = 6,
        parameter OUTLOGBITS = 3,
        localparam INWIDTH = 1<<INLOGBITS,
        localparam OUTWIDTH = 1<<OUTLOGBITS)
    (
    
    input clk,
    input rst_n,

    input in_valid,
    output reg in_ready,
    input [INWIDTH-1:0] in_data,

    output out_valid,
    input out_ready,
    output [OUTWIDTH-1:0] out_data

);

    localparam LOGBITDIFF = INLOGBITS-OUTLOGBITS ;
    localparam MAXCNT = (1<<LOGBITDIFF)-1;

    reg [LOGBITDIFF-1:0] cnt;
    reg [LOGBITDIFF-1:0] cnt_next;

    reg [INWIDTH-1:0] in_buf;
    wire [INWIDTH-1:0] in_buf_shifted;
    reg [INWIDTH-1:0] in_buf_next;

    assign in_buf_shifted = in_buf >> OUTWIDTH ;
    assign out_data = in_buf[OUTWIDTH-1:0] ;

    reg in_buf_valid;
    reg in_buf_valid_next;
    
    assign out_valid = in_buf_valid;

    always @(*) begin
        in_buf_next = in_buf;
        in_ready = 0;
        in_buf_valid_next = in_buf_valid;
        cnt_next = cnt;
        if (cnt == MAXCNT && !in_buf_valid && in_valid) begin
            in_buf_next = in_data;
            in_buf_valid_next = 1;
            in_ready = 1;
        end
        else if (cnt == 0 && out_ready && in_valid) begin // in_valid better be valid
            cnt_next = cnt - 1'b1;
            in_buf_valid_next = 1;
            in_buf_next = in_data;
            in_ready = 1;
        end
        else if (cnt == 0 && out_ready && !in_valid) begin // should never be here for vga
            in_buf_valid_next = 0;
            in_ready = 1;
        end
        else if (out_ready) begin
            cnt_next = cnt - 1'b1;
            in_buf_next = in_buf_shifted;
            in_ready = 0;
        end
    end
    `REG(clk, cnt, MAXCNT, cnt_next)
    `REG(clk, in_buf_valid, 0, in_buf_valid_next)
    `REG(clk, in_buf, 0, in_buf_next)

endmodule

/*
serializer #(.INLOGBITS(6), .OUTLOGBITS(3)) inst_XXX(
    
    .clk(clk),
    .rst_n(rst_n),

    .in_valid(XXX_in_valid),
    .in_ready(XXX_in_ready),
    .in_data(XXX_in_data),

    .out_valid(XXX_out_valid),
    .out_ready(XXX_out_ready),
    .out_data(XXX_out_data)

);
*/

