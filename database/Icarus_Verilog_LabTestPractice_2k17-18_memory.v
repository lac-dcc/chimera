`ifndef MEMORY
`define MEMORY
    module memory();
    reg [7:0] membyte [0:15];
    integer i;
    initial begin
        for (i = 0; i < 16; i = i+1) begin

            if( i%2 == 0)
                membyte[i] = 8'b1100_1100;
            else
                membyte[i] = 8'b1010_1010;

        end
    end
    endmodule
`endif