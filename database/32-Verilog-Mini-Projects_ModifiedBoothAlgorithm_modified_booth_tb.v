module MBA_mod_tb;

    // Inputs
    reg [7:0] a;
    reg [7:0] b;
    reg clock;

    // Outputs
    wire [15:0] p;

    // Variables
    integer j,k;

    // Instantiate the Unit Under Test (UUT)
    MBA_module uut (
        .p(p), 
        .a(a), 
        .b(b), 
        .clock(clock)
    );

    initial clock = 0;
    always #5 clock = ~clock;

    initial
    begin
        a=0;
        b=0;
        for (j=1; j<10; j=j+1)
            for (k=1; k<11; k=k+1)
                begin
                    a=j;
                    b=k;
                    #20 $display("a * b = %d * %d = p = %d", a, b, p);
                end
    end      
endmodule
