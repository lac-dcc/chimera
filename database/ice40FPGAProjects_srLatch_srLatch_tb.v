// This program was cloned from: https://github.com/jasonkaufmann/ice40FPGAProjects
// License: MIT License

`timescale 100 ns / 10 ns

module srLatch_tb ();

localparam DURATION = 10;

reg a;
reg b;

wire q;
wire qNot;

srLatch testLatch (
    .set(a),
    .reset(b),
    .q(q),
    .qNot(qNot)
);

initial begin
    a = 0;
    b = 0;
    #2
    a = 1;
    b = 0;
    #2
    a = 0;
    b = 1;
    #2
    a = 0;
    b = 0;

end

initial begin
        $dumpfile("srLatch_tb.vcd");
        $dumpvars(0, srLatch_tb); //the zero means we wanna see all the variables no matter the depth

        #(DURATION)

        $display("Finished!");
        $finish;
    end
    
endmodule