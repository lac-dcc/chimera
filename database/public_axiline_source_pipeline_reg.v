/*
module pipe_reg_array #(
    parameter bitwidth=8
    parameter pipe=$j$
)(
    input clk,
    input rst,
    input data_in_$i$,
    output data_out_$i$
);

    $%pipe_reg #(
        .bitwidth(bitwidth),
        .pipe(pipe)
    )
    pipe_reg_$i$(
        .clk(clk),
        .rst(rst),
        .data_in(data_in_$i$),
        .data_out(data_out_$i$)
    );%$

endmodule : pipe_reg_array
*/

module pipe_reg #(
    parameter bitwidth =8,
    parameter pipe=4
)(
    input clk,
    input rst,
    input [bitwidth-1:0]data_in,
    output  [bitwidth-1:0] data_out
);
    genvar i;
    generate
        for(i=0;i<pipe;i=i+1)begin:STAGE
            reg [bitwidth-1:0] p;
            if (i==0) begin
                always @(posedge clk)begin
                    if (rst) p<=0;
                    else p<=data_in;
                end
            end else begin
                always @(posedge clk)begin
                    if (rst) p<=0;
                    else p<=STAGE[i-1].p;
                end
            end
        end
    endgenerate

    assign data_out=STAGE[pipe-1].p;

endmodule