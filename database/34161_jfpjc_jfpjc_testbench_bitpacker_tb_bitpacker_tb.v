// This program was cloned from: https://github.com/johnMamish/jfpjc
// License: MIT License

`timescale 1ns/100ps

module bitpacker_tb();
    reg clock;
    reg nreset;
    reg data_in_valid;
    reg [31:0] data_in;
    reg [5:0] input_length;

    wire data_out_valid;
    wire [31:0] data_out;

    reg [31:0] data_in_mem [0:32];
    reg [31:0] data_out_mem [0:31];

    reg [5:0] lengths [0:255];

    bitpacker bp(.clock(clock),
                 .nreset(nreset),

                 .data_in_valid(data_in_valid),
                 .data_in(data_in),
                 .input_length(input_length),

                 .data_out_valid(data_out_valid),
                 .data_out(data_out));

    // generate clock
    always begin
        #250;
        clock = ~clock;
        #250;
    end

    integer length_accum;
    integer test_idx;
    integer i;
    integer read_idx;
    integer read_bit_idx;
    integer read_number;
    integer write_idx;
    integer test_bad;
    reg [63:0] data_in_concat;
    initial begin
        $dumpfile("bitpacker_tb.vcd");
        $dumpvars(0, bitpacker_tb);

        for (test_idx = 0; test_idx < 1000; test_idx = test_idx + 1) begin
            // setup data_in
            for (i = 0; i < 32; i = i + 1) begin
                data_in_mem[i] = $urandom;
                data_out_mem[i] = 32'h0;
            end
            data_in_mem[32] = 32'h0;

            test_bad = 0;

            // setup lengths
            length_accum = 0;
            i = 0;
            while (length_accum < (32 * 32)) begin
                lengths[i] = $urandom % 33;
                length_accum = length_accum + lengths[i];
                i = i + 1;
            end

            for (i = i; i < 256; i = i + 1) begin
                lengths[i] = 0;
            end

            clock = 'b0;

            // test
            read_idx = 0;
            read_bit_idx = 0;
            write_idx = 0;
            read_number = 0;
            nreset = 1'b0;
            #1000;
            nreset = 1'b1;
            while (write_idx < 32) begin
                // calculate inputs by shifting bits in
                data_in_valid = 'b1;
                data_in_concat = { data_in_mem[read_idx + 1], data_in_mem[read_idx] };
                data_in = data_in_concat >> read_bit_idx;
                input_length = lengths[read_number];

                // advance read pointer
                read_bit_idx = read_bit_idx + lengths[read_number];
                read_number = read_number + 1;
                while (read_bit_idx >= 32) begin
                    read_idx = read_idx + 1;
                    read_bit_idx = read_bit_idx - 32;
                end

                // advance write pointer if appropriate
                if (data_out_valid) begin
                    data_out_mem[write_idx] = data_out;
                    write_idx = write_idx + 1;
                end
                #1000;
            end

            // check results
            for (i = 0; i < 32; i++) begin
                if (data_out_mem[i] != data_in_mem[i]) begin
                    $display("bad result at loc %d. Expected %h, got %h.", i, data_in_mem[i], data_out_mem[i]);
                    test_bad = 1;
                end
            end

            if (test_bad == 0) begin
                $display("test %d good", test_idx);
            end
        end
        $finish;
    end

endmodule
