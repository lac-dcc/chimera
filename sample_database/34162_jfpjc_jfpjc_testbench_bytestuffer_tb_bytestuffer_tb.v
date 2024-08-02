// This program was cloned from: https://github.com/johnMamish/jfpjc
// License: MIT License

`timescale 1ns/100ps


module bytestuffer_tb();
    reg clock;
    reg nreset;

    reg data_in_valid;
    reg [7:0] data_in;

    wire data_out_valid;
    wire [7:0] data_out;
    wire overflow;

    bytestuffer bytestuffer(.clock(clock),
                            .nreset(nreset),
                            .data_in_valid(data_in_valid),
                            .data_in(data_in),
                            .data_out_valid(data_out_valid),
                            .data_out(data_out),
                            .overflow(overflow));


    localparam NUM_TESTS = 10;
    localparam BYTES_PER_TEST = 10000;
    integer data_in_ptr, data_out_ptr;
    reg [7:0] data_in_mem [0 : BYTES_PER_TEST - 1];
    reg [7:0] data_out_mem [0 : (2 * BYTES_PER_TEST) - 1];
    always @(posedge clock) begin : read_data_output_tb
        integer i;
        if (nreset) begin
            if (data_out_valid) begin
                data_out_mem[data_out_ptr] = data_out;
                data_out_ptr = data_out_ptr + 1;
            end
        end else begin
            data_out_ptr = 0;
            for (i = 0; i < (2 * BYTES_PER_TEST); i = i + 1) begin
                data_out_mem[i] = 8'hxx;
            end
        end
    end

    always begin
        clock = 1'b0;
        #500;
        clock = 1'b1;
        #500;
    end

    integer i, j;
    integer ffs_per_255[0 : NUM_TESTS - 1];
    integer testnum, seed_exponential, seed_uniform;
    integer delays [0 : BYTES_PER_TEST - 1];
    initial begin : main
        $dumpfile("bytestuffer_tb.vcd");
        $dumpvars(0, bytestuffer_tb);

        $readmemh("ffs_per_255.hextestcase", ffs_per_255);
        seed_exponential = 0;
        seed_uniform = 0;
        for (testnum = 0; testnum < NUM_TESTS; testnum = testnum + 1) begin : test_loop
            integer i, j;

            // generate test data to feed in.
            for (i = 0; i < BYTES_PER_TEST; i = i + 1) begin : test_setup_loop
                integer r;
                r = $dist_uniform(seed_uniform, 0, 254 + (ffs_per_255[testnum]));
                data_in_mem[i] = (r > 254) ? 8'hff : r;
                delays[i] = $dist_exponential(seed_exponential, 1);
            end

            nreset = 1'b0;
            @(posedge clock);
            @(posedge clock);
            nreset = #1 1'b1;

            // run the test
            for (i = 0; i < BYTES_PER_TEST; i = i + 1) begin : test_execute_loop
                data_in = #1 data_in_mem[i];
                data_in_valid = #1 1'b1;
                @(posedge clock);

                for (j = 0; j < delays[i]; j = j + 1) begin
                    data_in_valid = #1 1'b0;
                    @(posedge clock);
                end
            end

            // wait for a few cycles and then check the results
            for (i = 0; i < 513; i = i + 1) begin
                @(posedge clock);
            end

            // check the results
            i = 0;
            j = 0;
            while (i < BYTES_PER_TEST) begin : test_check_loop
                if (data_in_mem[i] !== data_out_mem[j]) begin
                    $display("Input/Output mismatch at output index 0x%h", j);
                end

                if (data_out_mem[j] == 8'hff) begin
                    j = j + 1;
                    if (data_out_mem[j] !== 8'h00) begin
                        $display("Failed to stuff 00 at output index 0x%h", j);
                    end
                end
                i = i + 1;
                j = j + 1;
            end
        end

        // test overflow detection.
        // If we send in a little less than 1024 (say, 1016) 0xff bytes in a row and then let the
        // buffer drain, it should be ok. If we send in 1024, 0xff bytes in a row, we expect an
        // overflow
        // generate test data to feed in.
        for (i = 0; i < BYTES_PER_TEST; i = i + 1) begin : test_setup_loop
            data_in_mem[i] = 8'hff;
            delays[i] = 0;
        end

        delays[1016] = 1200;

        nreset = 1'b0;
        @(posedge clock);
        @(posedge clock);
        nreset = #1 1'b1;

        for (i = 0; i < 3000; i = i + 1) begin : test_execute_loop
            integer overflow_expected;
            data_in = #1 data_in_mem[i];
            data_in_valid = #1 1'b1;
            @(posedge clock);

            for (j = 0; j < delays[i]; j = j + 1) begin
                data_in_valid = #1 1'b0;
                @(posedge clock);
            end

            overflow_expected = #1 (i >= (1016 + 1024 - 1)) ? 1'b1 : 1'b0;
            if (overflow !== overflow_expected) begin
                $display("overflow expected to be %d, but was %d", overflow_expected, overflow);
            end
        end

        // wait for a few cycles and then check the results
        for (i = 0; i < 513; i = i + 1) begin
            @(posedge clock);
        end
        $finish;
    end
endmodule
