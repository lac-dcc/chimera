`include "shift_reg_4bit_lab.v"     //shift_reg_4bit_lab( in, en, Q, clk );
module test_shift_reg_4bit_lab();

    reg en, in , clk; 
    wire [3:0] Q;

    shift_reg_4bit_lab shr(in, en, Q, clk);

    initial 
        clk = 0;
    
    always
        #2 clk = ~clk;
    
    initial 
        $monitor(" in = ", in ," en = ", en,  " clk = ",clk, " Q = %b", Q);
    
    initial 
        begin
            in = 0;     en = 0;
           #4 in = 1;     en = 1;
           #4 in = 1;     en = 0;
           #4 in = 0;     en = 1;
           #5 $finish;
        end

endmodule