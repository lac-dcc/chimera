`timescale 1ns/1ps
`include "inst.vh"
module shifter_tb;
// ******************************************************************
// PARAMETERS
// ******************************************************************
    parameter integer DATA_WIDTH  = 16;
    parameter integer NUM_DATA    = 4;
    parameter integer VERBOSITY   = 1;
// ******************************************************************

// ******************************************************************
// Localparams
// ******************************************************************
    localparam integer SHIFTER_DATA_WIDTH = DATA_WIDTH * NUM_DATA;
    localparam integer CTRL_WIDTH         = `C_LOG_2 (NUM_DATA);
// ******************************************************************

// ******************************************************************
// Wires and Regs
// ******************************************************************
    reg                              ACLK;
    reg                              ARESETN;
    reg                              RD_EN;
    reg                              WR_EN;
    reg  [SHIFTER_DATA_WIDTH-1:0]    DATA_IN;
    reg  [CTRL_WIDTH        -1:0]    CTRL_IN;
    wire [SHIFTER_DATA_WIDTH-1:0]    DATA_OUT;

    reg                              fail_flag;
    wire                             reset = !ARESETN;
    integer i;
// ******************************************************************

shifter
#(
    .DATA_WIDTH ( DATA_WIDTH    ),
    .NUM_DATA   ( NUM_DATA      )
) u_shifter (
    .ACLK       ( ACLK          ),
    .ARESETN    ( ARESETN       ),
    .RD_EN      ( RD_EN         ),
    //.WR_EN      ( WR_EN         ),
    .DATA_IN    ( DATA_IN       ),
    .CTRL_IN    ( CTRL_IN       ),
    .DATA_OUT   ( DATA_OUT      )
);

//--------------------------------------------------------------------------------------
task test_random_inputs;

    reg   [SHIFTER_DATA_WIDTH-1:0] expected_data;
    reg   [SHIFTER_DATA_WIDTH-1:0] received_data;

    begin
        // Generate Random Inputs
        rand_inputs;
        // Get Expected Data
        expected_data = expected_data_function(DATA_IN, CTRL_IN);

        RD_EN = 1'b1;
        @(negedge ACLK);
        WR_EN = 1'b1;

        // Get Data From PE
        @(negedge ACLK);
        received_data = DATA_OUT;

        if (received_data !== expected_data)
        begin
            $display ("\tError: Expected data:%h Recieved data:%h", expected_data, received_data);
            print_inputs(2);
            fail_flag = 1'b1;
        end
        else begin
            if (VERBOSITY > 1) $display ("\tInfo: Expected data:%d Recieved data:%d", expected_data, received_data);
        end

        RD_EN = 1'b0;
        WR_EN = 1'b0;

    end
endtask
//--------------------------------------------------------------------------------------

//--------------------------------------------------------------------------------------
task rand_inputs;
    begin
        for (i=0; i<NUM_DATA; i=i+1)
        begin
            DATA_IN[i*DATA_WIDTH+:DATA_WIDTH] = $random % 8 + 8;
        end
        CTRL_IN = $random;
        print_inputs(1);
    end
endtask
//--------------------------------------------------------------------------------------

//--------------------------------------------------------------------------------------
task print_inputs;
    input [2:0] verbosity;
    begin
        if (verbosity > 1) begin
            $display ("DATA Input = %h, CTRL Input = %h", DATA_IN, CTRL_IN);
        end
    end
endtask
//--------------------------------------------------------------------------------------

//--------------------------------------------------------------------------------------
function [SHIFTER_DATA_WIDTH-1 :0] expected_data_function;

    input [SHIFTER_DATA_WIDTH-1 :0] data_in;
    input [CTRL_WIDTH        -1 :0] control;

    reg [SHIFTER_DATA_WIDTH*2-1:0] tmp;

    begin
        tmp = {data_in, data_in} >> (control * DATA_WIDTH);
        expected_data_function = tmp;
    end
endfunction
//--------------------------------------------------------------------------------------

//--------------------------------------------------------------------------------------
task test_main;
    begin
        repeat (10000) begin
            test_random_inputs;
        end
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
task test_pass;
    begin
        $display("%c[1;32m",27);
        $display ("Test Passed");
        $display("%c[0m",27);
        $finish;
    end
endtask
//--------------------------------------------------------------------------------------

//--------------------------------------------------------------------------------------
initial begin
    $display("***************************************");
    $display ("Testing Shifter");
    $display("***************************************");
    ACLK = 0;
    ARESETN = 1;
    @(negedge ACLK);
    ARESETN = 0;
    @(negedge ACLK);
    ARESETN = 1;

    test_main;

    test_pass;
end

always #1 ACLK = ~ACLK;

always @ (posedge ACLK)
begin
    check_fail;
end
//--------------------------------------------------------------------------------------

    initial
    begin
        $dumpfile("hw-imp/bin/waveform/shifter.vcd");
        $dumpvars(0,shifter_tb);
    end
endmodule
