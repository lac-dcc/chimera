`default_nettype none
module Or_tb();

    integer file;

    reg a = 0;
    reg b = 0;
    wire out;
    
    Or Or_0(
        .a(a),
        .b(b),
        .out(out)
    );

    task display;
        #1 $fwrite(file, "|   %1b   |   %1b   |   %1b   |\n", a,b,out);
    endtask
      
    initial begin
        $dumpfile("Or_tb.vcd");
        $dumpvars(0, Or_tb);
        file = $fopen("Or.out","w");
        $fwrite(file, "|   a   |   b   |  out  |\n");
        
        a=0;b=0;
        display();
          
        a=0;b=1;
        display();
        
        a=1;b=0;
        display();
        
        a=1;b=1;
        display();
        $finish();    
    end

endmodule
