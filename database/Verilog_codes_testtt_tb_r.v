// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module ripple_carry_adder_tb;
    reg [3:0] a, b;
    reg cin;
    wire cout;
    wire [3:0] s;
    adder_4bit uut(a, b, cin, s, cout);

    initial begin 
        $dumpfile("ripple_carry_adder.vcd");
        $dumpvars(1);
        #10; 
        $finish;
    end

    initial begin
        a = 4'b0000;
        b = 4'b0001;
        cin = 0;

        a = 4'b0101;
        b = 4'b0101;
        cin = 1;
        #5;
        

        $finish;
    end
endmodule