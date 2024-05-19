// This program was cloned from: https://github.com/VeriGOOD-ML/public
// License: Apache License 2.0

`timescale 1ns/1ps

module sqrt_tb;
// ******************************************************************
// PARAMETERS
// ******************************************************************
    parameter integer dataLen      = 32;
    parameter integer sqrtLen  = dataLen / 2;
    parameter integer remainderLen = dataLen / 2 + 1;
// ******************************************************************


// ******************************************************************
// Wires and Regs
// ******************************************************************
    reg                                 clk;
    reg                                 reset;
    reg [dataLen - 1 : 0]               in;
	wire [sqrtLen - 1 :0]               out;
	wire signed [remainderLen - 1: 0]   rout;
	wire                                done;
    reg                                 fail_flag;
// ******************************************************************


// ******************************************************************
// Modules Initialization
// ******************************************************************
	sqrt #(
		.inLen      (dataLen)
	) sqrt_uint (
		.in         (in),
	  	.out        (out),
	  	.rout       (rout),
	  	.done       (done)
	);
// ******************************************************************


//--------------------------------------------------------------------------------------
task test_main;
    reg [sqrtLen-1:0]           expected_q;
    reg [sqrtLen-1:0]           received_q;
    reg signed  [remainderLen-1:0]  expected_r;
    reg signed  [remainderLen-1:0]  received_r;

    begin
        repeat (1) begin
            in = 131072;
            @(posedge done);
            received_q = out;
            received_r = rout;
            expected_q = 2;
            expected_r = 1;
            if (received_q !== expected_q || received_r !== expected_r) begin
                $display ("\tError: Input is:%d", in);
                $display ("\tError: Expected sqrt:%d Recieved sqrt:%d", expected_q, received_q);
                $display ("\tError: Expected remainder:%d Recieved remainder:%d", expected_r, received_r);
                fail_flag = 1'b1;
            end
            else begin
                $display ("\tInfo: Input is:%d", in);
                $display ("\tInfo: Expected sqrt:%d Recieved sqrt:%d", expected_q, received_q);
                $display ("\tInfo: Expected remainder:%d Recieved remainder:%d", expected_r, received_r);
            end
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
    $display ("Testing sqrt");
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

