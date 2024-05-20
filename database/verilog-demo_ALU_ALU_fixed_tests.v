// This program was cloned from: https://github.com/DingWH03/verilog-demo
// License: GNU General Public License v3.0

module ALU_fixed_tests;

    // Signals
    reg [15:0] A, B;
    reg [3:0] opcode;
    wire [15:0] result;

    // Instantiate ALU
    ALU ALU_inst (
        .A(A),
        .B(B),
        .opcode(opcode),
        .result(result)
    );

    // Testbench
    initial begin  
        $dumpfile("ALU_fixed_tests.vcd");        //生成的vcd文件名称
        $dumpvars(0, ALU_fixed_tests);    //tb模块名称，根据自己的情况修改
        // Test addition (opcode = 0000)
        A = 10;
        B = 20;
        opcode = 4'b0000;
        $display("Addition Test: A = %0d, B = %0d", A, B);
        #1;
        $display("Result: A + B = %0d", result);

        // Test subtraction (opcode = 0001)
        A = 50;
        B = 30;
        opcode = 4'b0001;
        $display("Subtraction Test: A = %0d, B = %0d", A, B);
        #1;
        $display("Result: A - B = %0d", result);

        // Test bitwise AND (opcode = 0010)
        A = 85;
        B = 170;
        opcode = 4'b0010;
        $display("AND Test: A = %0d, B = %0d", A, B);
        #1;
        $display("Result: A & B = %0d", result);

        // Test bitwise OR (opcode = 0011)
        A = 85;
        B = 170;
        opcode = 4'b0011;
        $display("OR Test: A = %0d, B = %0d", A, B);
        #1;
        $display("Result: A | B = %0d", result);

        // Test left shift (opcode = 0100)
        A = 12;
        B = 2;
        opcode = 4'b0100;
        $display("Left Shift Test: A = %0d, B = %0d", A, B);
        #1;
        $display("Result: A << B = %0d", result);

        // Test right shift (opcode = 0101)
        A = 48;
        B = 2;
        opcode = 4'b0101;
        $display("Right Shift Test: A = %0d, B = %0d", A, B);
        #1;
        $display("Result: A >> B = %0d", result);

        // End simulation
        $finish;
    end

endmodule
