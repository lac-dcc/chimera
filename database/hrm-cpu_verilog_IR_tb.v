`default_nettype none

module IR_tb;

    reg clk  = 0;
    reg wIR = 0;

    reg  [7:0] nIR;
    wire [7:0] rIR;

    // Instanciate DUT
    IR IR0 (
        .clk(clk),
        .wIR(wIR),
        .nIR(nIR), // input
        .rIR(rIR) // output
    );

    // Simulate clock
    //always #1 clk = ~clk;

    // Start simulation
    initial begin

        $dumpfile("IR_tb.vcd");
        $dumpvars(0, IR_tb);

        #1  nIR = 8'h00;
        #1  wIR = 1;
        #1  clk  = 1; // posedge clk
        #1  clk  = 0; 
        #1  wIR = 0;

        #1  nIR = 8'h10;
        #1  wIR = 1;
        #1  clk  = 1; // posedge clk
        #1  clk  = 0; 
        #1  wIR = 0;

        #1  nIR = 8'h20;
        #1  wIR = 0;  // on purpose we don't set it to 1 here.
                      // --> rIR should remain unchanged (8'h10)
        #1  clk  = 1; // posedge clk
        #1  clk  = 0; 
        #1  wIR = 0;

        #1  nIR = 8'h30;
        #1  wIR = 1;
        #1  clk  = 1; // posedge clk
        #1  clk  = 0; 
        #1  wIR = 0;

        #10 $finish;
    end


endmodule
