// This program was cloned from: https://github.com/chriz2600/time-sleuth
// License: MIT License


module data_cross(
    input clkIn,
    input clkOut,
    input [WIDTH-1:0] dataIn,
    output reg [WIDTH-1:0] dataOut
);
    parameter WIDTH = 24;
    
    reg wrreq = 0;
    reg rdreq = 0;
    reg wrfull;
    reg rdempty;
    reg [WIDTH-1:0] dataIn_reg = 0;

    data_fifo #(
        .WIDTH(WIDTH)
    ) fifo (
        .wrclk(clkIn),
        .data(dataIn_reg),
        .wrreq(wrreq),
        .wrfull(wrfull),

        .rdclk(clkOut),
        .rdreq(rdreq),
        .rdempty(rdempty),
        .q(dataOut)
    );

    always @(posedge clkIn) begin
        dataIn_reg <= dataIn;
        if (dataIn_reg != dataIn) begin
            wrreq <= 1'b1;
        end else begin
            wrreq <= 1'b0;
        end
    end

    always @(posedge clkOut) begin
        if (~rdempty) begin
            rdreq <= 1'b1;
        end else begin
            rdreq <= 1'b0;
        end
    end

endmodule
