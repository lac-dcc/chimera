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

module tb_buffet_update;

parameter IDX_WIDTH     = `IDX_WIDTH; // Index width
parameter DATA_WIDTH    = `DATA_WIDTH; // Data width

reg                   clk, nreset_i;

// Send credits to producer
// Matches FIFO fills.
wire [IDX_WIDTH-1:0]  credit_out;
wire                  credit_valid;
reg                   credit_ready;

// Operation: Fill(Data) -> void;
// Matches FIFO fills.
reg  [DATA_WIDTH-1:0] push_data;
reg                   push_data_valid;
wire                  push_data_ready;
// Asserted to 1 as producer will not send w/o credit.

// Operation: Read(Index, bool) -> Data
reg  [IDX_WIDTH-1:0]  read_idx;
reg                   read_idx_valid;
reg                   read_will_update;
wire [DATA_WIDTH-1:0] read_data;
wire                  read_data_valid;
reg                   read_data_ready;
wire                  read_idx_ready;

// Operation: Shrink(Size) -> void
// Shrinks share the same port as read in order to maintain ordering.
// read_idx will be considered as shrink size.
reg                 is_shrink;
reg  [IDX_WIDTH-1:0]  update_idx;
reg                   update_idx_valid;
reg  [DATA_WIDTH-1:0] update_data;
reg                   update_data_valid;
wire                  update_ready;
wire                  update_receive_ack;

reg [DATA_WIDTH-1:0] data_received;

reg [DATA_WIDTH-1:0] ref_data [4:0];
integer             count=0, i;

buffet  u_buffet(
			clk,
			nreset_i,
            // Read Port
            read_data,
            read_data_ready,
            read_data_valid,
            read_idx,
            read_idx_valid,
            read_idx_ready,
            read_will_update,
            // Write Port
            push_data,
            push_data_valid,
            push_data_ready,
            //Update Port
            update_data,
            update_data_valid,
            update_idx,
            update_idx_valid,
            update_ready,
            update_receive_ack,
            // Shrink Port
            is_shrink,
            // Credits
            credit_ready,
            credit_out,
            credit_valid

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
        read_idx_valid = 0;
        update_idx_valid = 0;
        update_data_valid = 0;
        push_data_valid = 0;
        credit_ready = 0;
    end
endtask

task TASK_fill;
    input [DATA_WIDTH-1:0] data;
    begin
        push_data = data;
        push_data_valid = 1;
        #10
        push_data_valid = 0;
    end
endtask

task TASK_shrink;
    input [`IDX_WIDTH-1:0] idx;
    begin
        read_idx = idx;
        read_idx_valid = 1;
        is_shrink = 1;
        read_will_update = 0;
        #10
        read_idx_valid = 0;
        is_shrink = 0;
    end
endtask

task TASK_read;
    input [`IDX_WIDTH-1:0] idx;
    output [DATA_WIDTH-1:0] data;
    begin
        read_idx = idx;
        read_idx_valid = 1;
        is_shrink = 0;
        read_will_update = 0;
        read_data_ready = 1;
        #10
        read_idx_valid = 0;
        count = 0;
        while(read_data_valid == 0) begin
            #10
            count = count + 1;
            if(count > 1000) begin
                $display("TIMED OUT WAITING FOR READ");
                $finish;
            end
        end
        read_data_ready = 0;
        data = read_data;
    end
endtask

task TASK_readupdate;
    input [`IDX_WIDTH-1:0] idx;
    output [DATA_WIDTH-1:0] data;
    begin
        read_idx = idx;
        read_idx_valid = 1;
        is_shrink = 0;
        read_will_update = 1;
        read_data_ready = 1;
        #10
        read_idx_valid = 0;
        count = 0;
        while(read_data_valid == 0) begin
            #10
            count = count + 1;
            if(count > 1000) begin
                $display("TIMED OUT WAITING FOR READ");
                $finish;
            end
        end
        read_data_ready = 0;
        read_will_update = 0;
        data = read_data;
    end
endtask

task TASK_readtimeout;
    input [`IDX_WIDTH-1:0] idx;
    output [DATA_WIDTH-1:0] data;
    begin
        read_idx = idx;
        read_idx_valid = 1;
        is_shrink = 0;
        read_will_update = 0;
        read_data_ready = 1;
        #10
        count = 0;
        read_idx_valid = 0;
        while(count <100) begin
            #10
            count = count + 1;
            if(read_data_valid == 1) begin
                $display("EXPECTED TIME OUT, TEST FAILED");
                $finish;
            end
        end
        read_data_ready = 0;
        data = read_data;
    end
endtask
task TASK_update;
    input [`IDX_WIDTH-1:0] idx;
    input [DATA_WIDTH-1:0] data;
    begin
        update_idx = idx;
        update_data = data;
        update_idx_valid = 1;
        update_data_valid = 1;
        is_shrink = 0;
        read_will_update = 0;
        #10
        update_idx_valid = 0;
        update_data_valid = 0;
        count = 0;
        while(update_receive_ack == 0) begin
            #10
            count = count + 1;
            if(count > 1000) begin
                $display("TIMED OUT WAITING FOR update ack");
                $finish;
            end
        end
    end
endtask

task TASK_getcredit;
    output [`IDX_WIDTH-1:0] credit;
    begin
        credit_ready = 1;
        //Wait till the credit high comes out
        while(credit_valid == 0) begin
            #10
            count = count + 1;
            if(count > 1000) begin
                $display("TIMED OUT WAITING FOR RESP");
                $finish;
            end
        end

        credit = credit_out;
    end
endtask

task TASK_nop;
    input [7:0] iterations;
    integer cnt;
    begin
        cnt =0;
        while(cnt < iterations) begin
            #10
            cnt = cnt + 1;
        end
    end
endtask


initial begin

	TASK_reset;
	TASK_init;

    // fill some random data
    for(i=0; i<5;i=i+1)
        ref_data[i] = $random;

    // Write some data
    for(i=0; i<5;i=i+1)
        TASK_fill(ref_data[i]);
    TASK_nop(5);

    // Read that data with marking them for future update
    for(i=0; i<5;i=i+1) begin
        TASK_readupdate(i, data_received);
        if(data_received != ref_data[i]) begin
            $display("TEST FAILED, data: %d", data_received);
            $finish;
        end
    end

    // Try reading the same data without updating it, it should time-out.
    TASK_readtimeout(1, data_received);

    // Update the data
    TASK_update(1, $random);

    // Now the read should go through
    TASK_read(1, data_received);

    $display("\n\n\t\t *** UPDATE TEST PASSED ***\n\n");
    $finish;
end


// Clock Generator
always #5 clk = ~clk;

endmodule

