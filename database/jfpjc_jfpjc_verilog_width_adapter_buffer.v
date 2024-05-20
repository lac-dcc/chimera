// This program was cloned from: https://github.com/johnMamish/jfpjc
// License: MIT License

/**
 * This output buffer takes 32-bit inputs and outputs them in parallel as 8-bit words.
 *
 * It consumes 2 EBRs internally.
 *
 * In the basic use case for jfpjc, this module ingests up to 32 bits per clock cycle, but can only
 * output 8 bits per clock cycle. This means that - on average - we can support a maximum of 1 valid
 * input word every 4 clock cycles. This is completely appropriate for our JPEG application, as
 * discussed below:
 *
 * What's the longest Huffman-coded MCU that we could have?
 * DC component:   (9 bits huffman) + (11 bits value) = 20 bits
 * AC components: ((16 bits huffman) + (10 bits value)) * 63 = 1638 bits
 * total = 1658 bits = 207.25 bytes
 * round it up to 256 bytes; that's 1/2 EBR every MCU.
 * We get 1 MCU every 64 clock cycles, worst case scenario. Amortized we get 5 MCUs every
 * 915 clock cycles. This is a worst case scenario of 1280 bytes / 915 clock cycles, which will
 * overrun the output circuitry. It's worth pointing out, however, that this worst-case scenario
 * is EXTRAORDINARILY unlikely (and indeed impossible with 8-bit precision). Moreover, with sane
 * quantization, it is impossible.
 *
 * If we find that it ever happens, we can just clock the output buffers twice as fast as the
 * rest of the circuitry, and it will be fine.
 */

`timescale 1ns/100ps

module width_adapter_buffer(input                      clock,
                            input                      nreset,

                            input                      data_in_valid,
                            input [input_width - 1:0]  data_in,

                            output reg                 data_out_valid,
                            output reg [output_width - 1:0] data_out);
    // input_width must be equal to k * output_width for some k > 1.
    // buffer_depth must be a power of 2.
    parameter integer input_width = 32, output_width = 8, buffer_width = 16, buffer_depth = 256;
    parameter integer num_ebrs = (((input_width - 1) / buffer_width) + 1);
    parameter integer ratio = (input_width / output_width);
    parameter [$clog2(ratio) - 1 : 0] data_out_latch_slice_select_max_value = ratio - 1;

    reg [$clog2(buffer_depth) - 1 : 0] data_in_ptr;
    reg [$clog2(buffer_depth) - 1 : 0] data_out_ptr;
    wire [input_width  - 1 : 0] data_out_wire;
    reg [$clog2(ratio) - 1 : 0] data_out_latch_slice_select;
    reg data_out_latch_valid;

    genvar i;
    generate
        for (i = 0; i < num_ebrs; i = i + 1) begin: buffers
            ice40_ebr #(.addr_width($clog2(buffer_depth)), .data_width(buffer_width))
            buffer(.din(data_in[(i * buffer_width) +: buffer_width]),
                   .write_en(data_in_valid),
                   .waddr(data_in_ptr),
                   .wclk(clock),

                   .raddr(data_out_ptr),
                   .rclk(clock),
                   .dout(data_out_wire[(i * buffer_width) +: buffer_width]));
        end
    endgenerate

    // logic for advancing input pointer.
    always @(posedge clock) begin
        if (nreset) begin
            if (data_in_valid) begin
                data_in_ptr <= data_in_ptr + 'h1;
            end else begin
                data_in_ptr <= data_in_ptr;
            end
        end else begin
            data_in_ptr <= 'h0;
        end
    end

    // data_out_latch_valid[1] tells us if the data_out_latch presently holds valid data
    // that's unused.
    // we want to set it when we latch in new data.
    // we want to clear it when we've used up the data.

    // logic for advancing output pointer.
    // We only want to latch a new output word if there's a valid word to read on the output of
    // the buffer EBRs AND we aren't already processing a word.
    always @(posedge clock) begin
        if (nreset) begin
            if (data_in_ptr != data_out_ptr) begin
                data_out_latch_valid <= 1'b1;
            end else if (data_out_latch_slice_select == data_out_latch_slice_select_max_value) begin
                data_out_latch_valid <= 1'b0;
            end else begin
                data_out_latch_valid <= data_out_latch_valid;
            end

            if (!data_out_latch_valid ||
                (data_out_latch_slice_select == data_out_latch_slice_select_max_value)) begin
                data_out_latch_slice_select <= 'h0;
            end else begin
                data_out_latch_slice_select <= data_out_latch_slice_select + 'h1;
            end

            if (data_out_latch_valid &&
                (data_out_latch_slice_select == (data_out_latch_slice_select_max_value - 2'h1))) begin
                data_out_ptr <= data_out_ptr + 'h1;
            end else begin
                data_out_ptr <= data_out_ptr;
            end

            data_out <= data_out_wire[(data_out_latch_slice_select * output_width) +: output_width];
            data_out_valid <= data_out_latch_valid;
        end else begin
            data_out_ptr <= 'h0;
            data_out_latch_valid <= 'h0;
            data_out_latch_slice_select <= 'h0;
        end
    end
endmodule
