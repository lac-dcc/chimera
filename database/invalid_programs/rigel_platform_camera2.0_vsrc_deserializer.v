module deserializer
    #(  parameter INLOGBITS = 3,
        parameter OUTLOGBITS = 6,
        localparam INWIDTH = 1<<INLOGBITS,
        localparam OUTWIDTH = 1<<OUTLOGBITS)
    (
    
    input clk,
    input rst_n,

    input in_valid,
    output reg in_ready,
    input [INWIDTH-1:0] in_data,

    output reg out_valid,
    input out_ready,
    output reg [OUTWIDTH-1:0] out_data

);

    localparam LOGBITDIFF = OUTLOGBITS-INLOGBITS ;
    localparam MAXCNT = (1<<LOGBITDIFF)-1;

    reg out_valid_next;
    reg [LOGBITDIFF-1:0] cnt;
    reg [LOGBITDIFF-1:0] cnt_next;

    wire [OUTWIDTH-1:0] out_data_shifted;
    wire [OUTWIDTH-1:0] out_data_new;
    reg [OUTWIDTH-1:0] out_data_next;

    assign out_data_shifted = (out_data >> INWIDTH);
    assign out_data_new = {in_data,out_data_shifted[OUTWIDTH-INWIDTH-1:0]};

    always @(*) begin
        in_ready = 1;
        out_valid_next = 0;
        out_data_next = out_data;
        cnt_next = cnt;
        if (cnt == 0 && in_valid && out_ready) begin
            out_data_next = out_data_new;
            cnt_next = cnt - 1'b1; // Should wrap
            out_valid_next = 1;
        end
        else if (cnt == 0 && !out_ready) begin
            in_ready = 0;
        end
        else if (in_valid) begin
            out_data_next = out_data_new;
            cnt_next = cnt - 1'b1; // Should wrap
        end
    end
    `REG(clk, cnt, MAXCNT, cnt_next)
    `REG(clk, out_valid, 0, out_valid_next)
    `REG(clk, out_data, 0, out_data_next)

endmodule



/*
deserializer #(.INLOGBITS(3), .OUTLOGBITS(6)) inst_XXX(
    
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
