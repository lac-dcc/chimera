// This program was cloned from: https://github.com/VeriGOOD-ML/public
// License: Apache License 2.0

`timescale 1ns/1ps

module pe_compute_tb;
// ******************************************************************
// PARAMETERS
// ******************************************************************
    parameter integer dataLen      = 32;
// ******************************************************************


// ******************************************************************
// Wires and Regs
// ******************************************************************
    reg                                 clk;
    reg                                 reset;
	wire                                done;
    reg                                 fail_flag;
// ******************************************************************


// ******************************************************************
// Modules Initialization
// ******************************************************************
    
// ******************************************************************


//--------------------------------------------------------------------------------------
task test_main;
    begin
        for (i=0; i<4; i=i+1) begin
            fn = i;
            print_function(2);
            repeat (10000) begin
                fn_test(i);
            end
            $display ("Passed");
        end
        $display("Testing with Random Functions");
        repeat (10000) begin
            random_test;
        end
        $display ("Passed");
    end
endtask
//--------------------------------------------------------------------------------------

//--------------------------------------------------------------------------------------
task check_fail;
    if (fail_flag && !reset) 
    begin
        $display("%c[1;31m",27);
        $display ("Test Failed");
        $display("%c[0m",27);
        $finish;
    end
endtask
//--------------------------------------------------------------------------------------

//--------------------------------------------------------------------------------------
initial begin
    $display("***************************************");
    $display ("Testing xxx");
    $display("***************************************");
    clk = 0;
    reset = 0;
    @(negedge clk);
    reset = 1;
    @(negedge clk);
    reset = 0;

    test_main;

    $display("%c[1;34m",27);
    $display ("Test Passed");
    $display("%c[0m",27);
    $finish;
end

always #1 clk = ~clk;

always @ (posedge clk)
begin
    check_fail;
end
//--------------------------------------------------------------------------------------

    //initial
    //begin
        //$dumpfile("TB.vcd");
        //$dumpvars(0,pe_compute_tb);
    //end
endmodule
