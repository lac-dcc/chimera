`default_nettype none

module REG_tb;

    reg clk  = 0;
    reg rstn = 1; // not active

    reg [7:0] iInbox = 8'b00000000;
    reg [7:0] iAlu = 8'b00000011;
    reg [7:0] iMem = 8'b00000001;
    reg [1:0] muxR;
    reg wR;

    wire signed [7:0] R;

    // Instanciate DUT
    REG register0 (
        .clk(clk),
        .iInbox(iInbox),
        .iAlu(iAlu),
        .iMem(iMem),
        .muxR(muxR),
        .R(R),
        .wR(wR)
    );

    // Simulate clock
    //always #1 clk = ~clk;

    // Start simulation
    initial begin

        $dumpfile("register_tb.vcd");
        $dumpvars(0, register_tb);

        #1  muxR = 2'b00;
        #1  wR = 1;
        #1  clk  = 1; // posedge clk
        #1  clk  = 0; 
        #1  wR = 0;

        #1  muxR = 2'b01;
        #1  wR = 1;
        #1  clk  = 1; // posedge clk
        #1  clk  = 0; 
        #1  wR = 0;

        #1  muxR = 2'b10;
        #1  wR = 1;
        #1  clk  = 1; // posedge clk
        #1  clk  = 0; 
        #1  wR = 0;

        #1  muxR = 2'b11;
        #1  wR = 1;
        #1  clk  = 1; // posedge clk
        #1  clk  = 0; 
        #1  wR = 0;

        #10 $finish;
    end


endmodule
