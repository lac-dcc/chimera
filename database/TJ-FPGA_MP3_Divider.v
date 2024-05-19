// This program was cloned from: https://github.com/DinoMax00/TJ-FPGA_MP3
// License: MIT License

// A divider for all modules and no reset sign
module Divider #(parameter Time=20)
(
    input I_CLK,
    output reg O_CLK
);
    integer counter=0;
    initial O_CLK = 0;
    always @ (posedge I_CLK)
    begin
        if((counter+1)==Time/2)
        begin
            counter <= 0;
            O_CLK <= ~O_CLK;
        end
        else
            counter <= counter+1;
    end
endmodule
