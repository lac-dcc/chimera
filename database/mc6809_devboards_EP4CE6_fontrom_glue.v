module  fontrom(
                    input   clka, 
                    input [10:0] addra,
                    output [7:0] douta
                );

    fontroma    fontrom_glue(
                    .address(addra),
                    .clock(clka),
                    .q(douta)
                    );

endmodule
                
