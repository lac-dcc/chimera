// This program was cloned from: https://github.com/MathBorgess/hardware_studies
// License: MIT License

module srlatch (
    input wire rst, set,
    output reg mag_on
);
    always @(rst, set) begin
        if (rst) 
            mag_on <= 0;
        else if (set)  
            mag_on <= 1;
        else mag_on <= mag_on;
    end
endmodule