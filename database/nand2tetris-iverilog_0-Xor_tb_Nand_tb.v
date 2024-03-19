`default_nettype none
module Nand_tb();

    integer file;

    reg a = 0;
    reg b = 0;
    wire out;
    
    Nand Nand(
        .a(a),
        .b(b),
        .out(out)
    );

    task display;
        #1 $fwrite(file, "| %1b | %1b | %1b |\n", a,b,out);
    endtask
      
    initial begin
        $dumpfile("Nand_tb.vcd");
        $dumpvars(0, Nand_tb);
        file = $fopen("Nand.out","w");
        $fwrite(file, "| a | b |out|\n");
        
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
