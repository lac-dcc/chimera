`include "seqDetect.v"

module test_seqDetect();

    reg inSeq, clk, reset;
    wire [2:0] state;
    integer i;

    always @(posedge clk)
        $display("inSeq = ", inSeq, " reset = ", reset);

    seqDetect sq(inSeq, clk, reset);

    reg [0:15] sequence;

    initial begin
        clk = 1'b0;
        reset = 1'b0;
        reset = 1'b1;
        sequence = 16'b1011_0000_1011_0000;
        #5 reset = 1'b0;

        for (i = 0; i < 16 ; i = i+1 ) begin
             inSeq = sequence[i];
            #2 clk = 1'b1;
            #2 clk = 1'b0;
        end
    end

endmodule