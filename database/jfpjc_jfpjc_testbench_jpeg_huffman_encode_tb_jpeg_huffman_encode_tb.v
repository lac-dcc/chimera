// This program was cloned from: https://github.com/johnMamish/jfpjc
// License: MIT License

`timescale 1ns/100ps

module jpeg_huffman_encode_tb();
    reg clock;
    reg nreset;
    reg start;

    wire [5:0] fetch_addr;
    wire signed [15:0] src_data_into_huff;

    wire huff_output_wren;
    wire [5:0] huff_output_length;
    wire [31:0] huff_output_data;
    wire        busy;

    reg [31:0] output_memory [0:127];
    reg [4:0] output_lengths [0:127];

    jpeg_huffman_encode huff(.clock(clock),
                             .nreset(nreset),
                             .start(start),

                             .fetch_addr(fetch_addr),
                             .src_data_in(src_data_into_huff),

                             .output_wren(huff_output_wren),
                             .output_length(huff_output_length),
                             .output_data(huff_output_data),

                             .busy(busy));

    // Memory holding 64 int16_t coefficients.
    //
    // Practically all of the coefficients will be in [-128, 127], but they can theoretically be
    // in [-1024, 1023].
    wire [5:0] row_major_index;
    reg  [1:0] encoder_in_buf;
    ice40_ebr #(.addr_width(8), .data_width(16)) sample_memory(.din(16'h0000),
                                                               .write_en(1'b0),
                                                               .waddr(8'h00),
                                                               .wclk(1'b0),

                                                               .raddr({encoder_in_buf, row_major_index}),
                                                               .rclk(clock),
                                                               .dout(src_data_into_huff));

    zig_zag_to_row_major ziggy(.zig_zag_index(fetch_addr),
                               .row_major_index(row_major_index));

    // generate clock
    always begin
        #250;
        clock = ~clock;
        #250;
    end

    integer output_index;
    integer i;
    initial begin
        $dumpfile("jpeg_huffman_encode_tb.vcd");
        $dumpvars(0, jpeg_huffman_encode_tb);

        // icarus / gtkwave take a little extra effort to dump array variables
        for (i = 0; i < 4; i = i + 1) begin
            $dumpvars(1, huff.index[i]);
            $dumpvars(1, huff.valid[i]);
        end

        for (i = 0; i < 2; i = i + 1) begin
            $dumpvars(1, huff.coded_coefficient_reg[i]);
            $dumpvars(1, huff.coded_coefficient_length_reg[i]);
        end

        $readmemh("jpeg_huffman_encode_testcase_3_in.hextestcase", sample_memory.mem);
        output_index = 0;

        clock = 'b0;

        // strobe reset for a few clock cycles
        start = 'b0;
        nreset = 'b0;
        #2000;
        nreset = 'b1;
        #1000;
        for (i = 0; i < 4; i = i + 1) begin
            encoder_in_buf = i;
            #1000;
            start = 'b1;
            #1000;
            start = 'b0;
            while (busy == 1'b1) begin
                if (huff_output_wren) begin
                    $display("packing %h, with length %d", huff.bit_concatenator_data0, huff.bit_concatenator_length0);
                    if (huff.bit_concatenator_length1 > 0) begin
                        $display("packing %h, with length %d", huff.bit_concatenator_data1, huff.bit_concatenator_length1);
                    end
                end
                #1000;
            end
            $display;
            #2000;
        end

        $display("================================================================");
        $display("");

        $readmemh("jpeg_huffman_encode_testcase_2_in.hextestcase", sample_memory.mem);
        output_index = 0;

        clock = 'b0;

        // strobe reset for a few clock cycles
        start = 'b1;
        nreset = 'b0;
        #2000;
        nreset = 'b1;
        start = 'b0;
        while (busy == 1'b1) begin
            if (huff_output_wren) begin
                $display("packing %h, with length %d", huff.bit_concatenator_data0, huff.bit_concatenator_length0);
                if (huff.bit_concatenator_length1 > 0) begin
                    $display("packing %h, with length %d", huff.bit_concatenator_data1, huff.bit_concatenator_length1);
                end
            end

            #1000;
        end

        $finish;
    end
endmodule
