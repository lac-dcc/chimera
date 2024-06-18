// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

module isqrt_slice_reg
(
    input             clock,
    input             reset_n,
    input      [31:0] ix,
    input      [31:0] iy,
    output reg [31:0] ox,
    output reg [31:0] oy
);

    parameter [31:0] m = 32'h4000_0000;

    wire [31:0] cox, coy;

    isqrt_slice_comb #(.m (m)) i
    (
        .ix ( ix  ),
        .iy ( iy  ),
        .ox ( cox ),
        .oy ( coy )
    );

    always @(posedge clock or negedge reset_n)
    begin
        if (! reset_n)
        begin
            ox <= 0;
            oy <= 0;
        end
        else
        begin
            ox <= cox;
            oy <= coy;
        end
    end

endmodule
