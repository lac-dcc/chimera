`ifndef FULLADDER_1BIT
`define FULLADDER_1BIT
    module fullAdder1bit(
        input a,
        input b,
        input cin,
        output sum,
        output cout);

        // initial
        //     $display("FA_IP = ")

        // initial
        //     $monitor("fa i/p: ",cin,b,a," fa o/p: ",cout,sum);
        
        assign {cout,sum} = a+b+cin;


    endmodule
`endif