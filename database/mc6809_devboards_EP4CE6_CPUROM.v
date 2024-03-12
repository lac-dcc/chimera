module CPUROM(
                input clka,
                input ena,
                input [9:0] addra,
                output [7:0] douta
             );

    cpuroma cpurom_glue(.address(addra),
                        .clock(clka),
                        .rden(ena),
                        .q(douta)
                       );

endmodule
