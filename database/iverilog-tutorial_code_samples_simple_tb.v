module simple_tb;

   // initial values
   reg [3:0] A = 4'b1010;
   wire [3:0] B;

   initial
     begin
        // vcd dump
        $dumpfile("simple.vcd");
        // the variable 's' is what GTKWave will label the graphs with
        $dumpvars(0, s);
        $monitor("A is %b, B is %b.", A, B);

        // setting each elements values at each time interval, must finish with $finish
        #50 A = 4'b1100;
        #100 A = 4'b0000;
        #100 $finish;
     end

   // stap of module
   simple s(A, B);
endmodule