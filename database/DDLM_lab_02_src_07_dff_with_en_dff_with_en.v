// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

module dff_with_en
(
    input       clk,
    input       en,
    input       d,
    output reg  q
);

    always @ (posedge clk)
        if (en)
            q <= d;
 
endmodule