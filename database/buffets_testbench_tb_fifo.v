// 
// Author: Kartik Hegde (kartikhegde.net)
//
// Copyright (c) 2019 Authors of "Buffets: An Efficient and Composable Storage Idiom for Explicit Decoupled Data
// Orchestration".
//
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
// documentation files (the "Software"), to deal in the Software without restriction, including without limitation the
// rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to
// permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all copies or substantial portions of the
// Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
// WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
// COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
// OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.



`include "buffet_defines.v"

module tb;


reg                         clk, nreset_i;

// Data In
reg     [`DATA_WIDTH-1:0]    data_i;
reg                         data_i_valid;
wire                        data_i_ready;
//Data Out
wire    [`DATA_WIDTH-1:0]    data_o;
wire                        data_o_valid;
reg                         data_o_ready;

integer count=0, i=0;

fifo    u_fifo (
            clk,
            nreset_i,
            data_i,
            data_i_valid,
            data_i_ready,
            data_o,
            data_o_valid,
            data_o_ready
        );

// Reset
task TASK_reset;
	begin
		clk 		= 0;
		nreset_i 	= 0;
		#2
		nreset_i 	= 1;
	end
endtask

// Initialize regs
task TASK_init;
    begin
        data_i_valid = 0;
        data_o_ready = 1;
    end
endtask

task TASK_drain;
    begin
        data_o_ready = 1;
        #10
        data_o_ready = 0;
    end
endtask

task TASK_fill;
    begin
        data_o_ready = 0;
        data_i = 34;
        data_i_valid = 1;
        #10
        data_i_valid = 0;
    end
endtask

task TASK_filltest;
    begin
        // Assert ready high and wait till valid data comes
        data_i_valid = 1'b1;
        data_i = 12;
        data_o_ready = 0;
        count = 0;
        while(data_i_ready == 1'b0) begin
            #10
            count = count + 1;
            if(count > 100) begin
                $display("TEST DRAIN FAILED %d", count);
                $finish;
            end
        end

        count = 0;
        while(data_i_ready == 1'b1) begin
            #10
            data_i = 12;
            data_i_valid = 1;
            data_o_ready = 0;
            if(count > 100) begin
                $display("TEST FILL FAILED %d", count);
                $finish;
            end
            count = count + 1;
        end
        data_i_valid = 0;
        $display("TEST FILL PASSED");
    end
endtask

task TASK_draintest;
    begin
        // Assert ready high and wait till valid data comes
        data_o_ready = 1'b1;
        count = 0;
        while(data_o_valid == 1'b0) begin
            #10
            count = count + 1;
            if(count > 100) begin
                $display("TEST DRAIN FAILED %d", count);
                $finish;
            end
        end

        count = 0;
        while(data_o_valid == 1'b1) begin
            #10
            data_i_valid = 0;
            data_o_ready = 1;
            if(count > 100) begin
                $display("TEST DRAIN FAILED %d", count);
                $finish;
            end
            count = count + 1;
        end
        data_o_ready = 0;
        $display("TEST DRAIN PASSED");
    end
endtask

// Main Initial Block

initial begin
	
	TASK_reset;
	TASK_init;

    #10
    TASK_filltest;
    #10
    TASK_draintest;
    #10
    TASK_filltest;
    #10
    TASK_drain;
    TASK_drain;
    TASK_filltest;
    #10
    TASK_draintest;

    // Test till the FIFO fills and back pressure is applied
    $display("ALL TESTS PASSED OK");
    $finish;
end

// Clock Generator
always #5 clk = ~clk;

endmodule
