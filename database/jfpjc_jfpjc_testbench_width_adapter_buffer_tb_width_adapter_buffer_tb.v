// This program was cloned from: https://github.com/johnMamish/jfpjc
// License: MIT License

`timescale 1ns/100ps

module width_adapter_buffer_tb();
    localparam integer in_width = 32;
    localparam integer out_width = 4;

    reg clock;
    reg nreset;
    reg data_in_valid;
    reg [in_width - 1:0] data_in;

    wire data_out_valid;
    wire [out_width - 1:0] data_out;

    defparam ob.input_width = in_width;
    defparam ob.output_width = out_width;

    width_adapter_buffer ob(.clock(clock),
                            .nreset(nreset),

                            .data_in_valid(data_in_valid),
                            .data_in(data_in),

                            .data_out_valid(data_out_valid),
                            .data_out(data_out));

    // generate clock
    always begin
        clock = 1'b0;
        #500;
        clock = 1'b1;
        #500;
    end

    localparam integer mem_size_bits = (1 << 14);
    localparam integer num_input_words = ((mem_size_bits - 1) / in_width) + 1;
    reg [in_width - 1:0] input_mem [0:num_input_words - 1];
    reg [out_width - 1:0] output_mem [0:(mem_size_bits - 1) / out_width];
    integer delays [0:num_input_words - 1];

    // consume output buffer
    integer output_mem_idx;
    always @(posedge clock) begin
        if (nreset) begin
            if (data_out_valid) begin
                output_mem[output_mem_idx] <= data_out;
                output_mem_idx <= output_mem_idx + 1;
            end
        end else begin
            output_mem_idx <= 0;
        end
    end


    localparam integer n_tests = 10;

    integer seed_exponential = 0;
    integer test_idx;
    integer test_bad;
    integer i, j;
    integer input_mem_idx;
    initial begin
        $dumpfile("width_adapter_buffer_tb.vcd");
        $dumpvars(0, width_adapter_buffer_tb);

        for (test_idx = 0; test_idx < n_tests; test_idx = test_idx + 1) begin
            // fill input mem
            for (i = 0; i < num_input_words; i = i + 1) begin
                for (j = 0; j < in_width / 8; j = j + 1) begin
                    input_mem[i][(j * 8) +: 8] = $urandom;
                end

                // use an exponential distribution; we model incoming data as a poisson process
                // with rate in_width / out_width.
                delays[i] = $dist_exponential(seed_exponential, (in_width / out_width));
            end

            nreset = 1'b0;
            @(posedge clock);
            @(posedge clock);
            nreset = #1 1'b1;

            // run until all input used up.
            for (input_mem_idx = 0; input_mem_idx < num_input_words; input_mem_idx = input_mem_idx + 1) begin
                data_in_valid = #1 1'b1;
                data_in = #1 input_mem[input_mem_idx];
                @(posedge clock);
                data_in_valid = #1 1'b0;
                data_in = #1 'hx;

                for (i = 0; i < delays[input_mem_idx]; i = i + 1) begin
                    @(posedge clock);
                end
            end

            // make sure that the buffer has time to catch up; don't let it run forever.
            i = 0;
            while (((input_mem_idx * in_width) != (output_mem_idx * out_width)) && i < 1000) begin
                i = i + 1;
                @(posedge clock);
            end

            // just delay a little bit for gtkwave readability.
            for (i = 0; i < 30; i = i + 1) begin
                @(posedge clock);
            end

            // check for errors
            test_bad = 0;
            for (i = 0; i < num_input_words; i = i + 1) begin
                for (j = 0; j < (in_width / out_width); j = j + 1) begin
                    if (input_mem[i][(j * out_width) +: out_width] !==
                        output_mem[(i * (in_width / out_width) + j)]) begin
                        $display("bad value for input word %d", i);
                        test_bad = 1;
                    end
                end
            end
            if (test_bad == 1) begin
                $finish;
            end
        end

        $finish;
    end

endmodule
