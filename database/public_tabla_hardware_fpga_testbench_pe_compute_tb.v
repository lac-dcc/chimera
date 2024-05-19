// This program was cloned from: https://github.com/VeriGOOD-ML/public
// License: Apache License 2.0

`timescale 1ns/1ps
`include "inst.vh"

module pe_compute_tb;
// ******************************************************************
// PARAMETERS
// ******************************************************************
    parameter integer dataLen       = 32;
    parameter integer logNumFn      = 3;
    parameter integer VERBOSITY     = 1;
// ******************************************************************

// ******************************************************************
// Wires and Regs
// ******************************************************************
    wire signed [dataLen  - 1 : 0 ]     resultOut;
    wire                                done;
    reg  signed [dataLen  - 1 : 0 ]     operand1;
    reg                                 operand1_v;
    reg                                 operand1_req;
    reg  signed [dataLen  - 1 : 0 ]     operand2;
    reg                                 operand2_v;
    reg                                 operand2_req;
    reg  signed [dataLen  - 1 : 0 ]     operand3;
    reg                                 operand3_v;
    reg                                 operand3_req;
    reg  [logNumFn - 1 : 0 ]            fn;
    reg                                 fail_flag;
    reg                                 clk;
    reg                                 reset;
    integer                             i;
    integer                             max_functions;
    integer                             function_id;
// ******************************************************************

//--------------------------------------------------------------------------------------
	pe_compute #(
		.dataLen        ( dataLen           ),
		.logNumFn       ( logNumFn          )
	) u_dut (
		.operand1       ( operand1          ),
		.operand1_v     ( operand1_v        ),
		.operand1_req   ( operand1_req      ),
		.operand2       ( operand2          ),
		.operand2_v     ( operand2_v        ),
		.operand2_req   ( operand2_req      ),
		.operand3       ( operand3          ),
		.operand3_v     ( operand3_v        ),
		.operand3_req   ( operand3_req      ),
		.fn             ( fn                ),
		.resultOut      ( resultOut         ),
		.done           ( done              )
	);
//--------------------------------------------------------------------------------------

//--------------------------------------------------------------------------------------
task test_random_inputs;

    reg   [dataLen-1:0] expected_data;
    reg   [dataLen-1:0] received_data;

    begin
        // Generate Random Inputs
        rand_inputs;
        // Get Expected Data
        expected_data = expected_data_function(operand1,
                                               operand1_v,
                                               operand1_req,
                                               operand2,
                                               operand2_v,
                                               operand2_req,
                                               operand3,
                                               operand3_v,
                                               operand3_req,
                                               fn);

        // Get Data From PE
        @(negedge clk);
        received_data = resultOut;

        if (received_data !== expected_data)
        begin
            $display ("\tError: Expected data:%d Recieved data:%d", expected_data, received_data);
            print_function(2);
            print_inputs(2);
            fail_flag = 1'b1;
        end
        else begin
            if (VERBOSITY > 1) $display ("\tInfo: Expected data:%d Recieved data:%d", expected_data, received_data);
        end
    end
endtask
//--------------------------------------------------------------------------------------

//--------------------------------------------------------------------------------------
task fn_test;

    input [logNumFn-1:0] function_input;

    begin
        // Use Random Function
        fn = function_input;
        test_random_inputs;
    end
endtask
//--------------------------------------------------------------------------------------


//--------------------------------------------------------------------------------------
task random_test;
    begin
        // Use Random Function
        rand_function;
        test_random_inputs;
    end
endtask
//--------------------------------------------------------------------------------------

//--------------------------------------------------------------------------------------
task rand_function;
    begin
        fn = ($random) % 3;
        print_function(1);
    end
endtask
//--------------------------------------------------------------------------------------
task print_function;
    input [2:0] verbosity;
    begin
        if (verbosity > 1) begin
            case(fn)
                `FN_ADD: $display ("Testing ADD operation");
                `FN_SUB: $display ("Testing SUB operation");
                `FN_MUL: $display ("Testing MUL operation");
                `FN_COM: $display ("Testing COM operation");
                `FN_DIV: $display ("Testing DIV operation");
                `FN_SQR: $display ("Testing SQR operation");
                `FN_SIG: $display ("Testing SIG operation");
                `FN_GAU: $display ("Testing GAU operation");
                default: begin
                    $display ("Error : Unknown Function");
                    //$finish;
                end
            endcase
        end
    end
endtask
//--------------------------------------------------------------------------------------

//--------------------------------------------------------------------------------------
task rand_inputs;
    begin
        operand1 = $random % 8 + 8;
        operand1_v = 1;
        operand1_req = 1;
        operand2 = $random % 8 + 8;
        operand2_v = 1;
        operand2_req = 1;
        operand3 = $random % 8 + 8;
        operand3_v = 1;
        operand3_req = 1;
        print_inputs(1);
    end
endtask
//--------------------------------------------------------------------------------------
task print_inputs;
    input [2:0] verbosity;
    begin
        if (verbosity > 1) begin
            $display ("Operand 1 = %h", operand1);
            $display ("Operand 2 = %h", operand2);
            $display ("Operand 3 = %h", operand3);
        end
    end
endtask
//--------------------------------------------------------------------------------------

//--------------------------------------------------------------------------------------
function signed [dataLen-1 :0] expected_data_function;

    input signed [dataLen-1 :0] operand1;
    input                       operand1_v;
    input                       operand1_req;
    input signed [dataLen-1 :0] operand2;
    input                       operand2_v;
    input                       operand2_req;
    input signed [dataLen-1 :0] operand3;
    input                       operand3_v;
    input                       operand3_req;
    input        [logNumFn-1:0] fn;

    begin
        expected_data_function = 0;
        case(fn)
            `FN_ADD: begin
                if (operand1_v && operand2_v) begin
                    expected_data_function = operand1 + operand2;
                end
            end
            `FN_SUB: begin
                if (operand1_v && operand2_v) begin
                    expected_data_function = operand1 - operand2;
                end
            end
            `FN_MUL: begin
                if (operand1_v && operand2_v) begin
                    expected_data_function = operand1 * operand2;
                    if (VERBOSITY > 1) $display ("Expected Data  = %d  =  %d * %d", expected_data_function, operand1, operand2);
                end
            end
            `FN_COM: begin
                if (operand1_v && operand2_v) begin
                    expected_data_function = operand1 > operand2;
                    if (VERBOSITY > 1) $display ("Expected Data  = %d  =  %d > %d", expected_data_function, operand1, operand2);
                end
            end
            `FN_DIV: begin
                if (operand1_v && operand2_v) begin
                    expected_data_function = operand1 + operand2;
                end
            end
            `FN_SQR: begin
                if (operand1_v && operand2_v) begin
                    expected_data_function = operand1 + operand2;
                end
            end
            `FN_SIG: begin
                if (operand1_v && operand2_v) begin
                    expected_data_function = operand1 + operand2;
                end
            end
            `FN_GAU: begin
                if (operand1_v && operand2_v) begin
                    expected_data_function = operand1 + operand2;
                end
            end
            default: begin
                $display ("Error : Unknown Function");
                fail_flag = 1;
            end
        endcase
    end
endfunction
//--------------------------------------------------------------------------------------

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
    $display ("Testing PE");
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
