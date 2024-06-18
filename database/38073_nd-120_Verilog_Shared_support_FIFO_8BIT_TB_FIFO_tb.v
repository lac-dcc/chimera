// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

module FIFO_testbench;

    // Parameters
    parameter DEPTH = 13;

    // Signals
    reg rst;
    reg wr_en;
    reg rd_en;
    reg [7:0] data_in;
    wire [7:0] data_out;
    wire full;
    wire empty;

    // Instantiate the FIFO module
    FIFO_8BIT #(
        .DEPTH(DEPTH)
    ) fifo_inst (
        .rst(rst),
        .wr_en(wr_en),
        .rd_en(rd_en),
        .data_in(data_in),
        .data_out(data_out),
        .full(full),
        .empty(empty)
    );

    // Test procedure
    initial begin
        $dumpfile("fifo_tb.vcd");
        $dumpvars(0, FIFO_testbench);

        // Initialize signals
        rst = 1;
        wr_en = 0;
        rd_en = 0;
        data_in = 8'b0;

        // Apply reset
        #10 rst = 0;

        // Write some data into the FIFO
        #10 data_in = 8'hA5; wr_en = 1;
        #10 wr_en = 0;

        #10 data_in = 8'h5A; wr_en = 1;
        #10 wr_en = 0;

        // Reset the FIFO
        #10 rst = 1;
        // Clear reset signal
        #10 rst = 0;

        // Write some more data into the FIFO
        #10 data_in = 8'hB5; wr_en = 1;
        #10 wr_en = 0;

        #10 data_in = 8'h6B; wr_en = 1;
        #10 wr_en = 0;


        // Read the data back from the FIFO
        #10 rd_en = 1;
        #10 rd_en = 0;

        #10 rd_en = 1;
        #10 rd_en = 0;

        // Check the full and empty flags
        #10 $display("Full: %b, Empty: %b", full, empty);

        // Overflow the FIFO
         // Write some more data into the FIFO
        #10 data_in = 8'hF0; wr_en = 1;
        #10 wr_en = 0;

        #10 data_in = 8'hF1; wr_en = 1;
        #10 wr_en = 0;

        #10 data_in = 8'hF2; wr_en = 1;
        #10 wr_en = 0;

        #10 data_in = 8'hF3; wr_en = 1;
        #10 wr_en = 0;

        #10 data_in = 8'hF4; wr_en = 1;
        #10 wr_en = 0;

        #10 data_in = 8'hF5; wr_en = 1;
        #10 wr_en = 0;

        #10 data_in = 8'hF6; wr_en = 1;
        #10 wr_en = 0;

        #10 data_in = 8'hF7; wr_en = 1;
        #10 wr_en = 0;

        #10 data_in = 8'hF8; wr_en = 1;
        #10 wr_en = 0;

        #10 data_in = 8'hF9; wr_en = 1;
        #10 wr_en = 0;

        #10 data_in = 8'hFA; wr_en = 1;
        #10 wr_en = 0;

        #10 data_in = 8'hFB; wr_en = 1;
        #10 wr_en = 0;

        #10 data_in = 8'hFC; wr_en = 1;
        #10 wr_en = 0;

        #10 data_in = 8'hFD; wr_en = 1;
        #10 wr_en = 0;

        // Check the full and empty flags
        #10 $display("Full: %b, Empty: %b", full, empty);


        
        // Read the data back from the FIFO
        #10 rd_en = 1;
        #10 rd_en = 0;

        #10 rd_en = 1;
        #10 rd_en = 0;

        #10 rd_en = 1;
        #10 rd_en = 0;

        #10 rd_en = 1;
        #10 rd_en = 0;


        #10 rd_en = 1;
        #10 rd_en = 0;

        #10 rd_en = 1;
        #10 rd_en = 0;


        #10 rd_en = 1;
        #10 rd_en = 0;

        #10 rd_en = 1;
        #10 rd_en = 0;


        #10 rd_en = 1;
        #10 rd_en = 0;

        #10 rd_en = 1;
        #10 rd_en = 0;


        #10 rd_en = 1;
        #10 rd_en = 0;

        #10 rd_en = 1;
        #10 rd_en = 0;


        #10 rd_en = 1;
        #10 rd_en = 0;

        #10 rd_en = 1;
        #10 rd_en = 0;


        #10 rd_en = 1;
        #10 rd_en = 0;

        #10 rd_en = 1;
        #10 rd_en = 0;


        #10 rd_en = 1;
        #10 rd_en = 0;

        #10 rd_en = 1;
        #10 rd_en = 0;


        #10 rd_en = 1;
        #10 rd_en = 0;

        #10 rd_en = 1;
        #10 rd_en = 0;

        // Check the full and empty flags
        #10 $display("Full: %b, Empty: %b", full, empty);


        // End of test
        #10 $finish;
    end

endmodule
