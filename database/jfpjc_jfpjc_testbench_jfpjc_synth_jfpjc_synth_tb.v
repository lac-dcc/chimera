// This program was cloned from: https://github.com/johnMamish/jfpjc
// License: MIT License

/**
 * put the synthesized jfpjc and the RTL jfpjc next to each other and see if they produce the same
 * output cycle-by-cycle.
 */

`timescale 1ns/100ps

`define QUANT_TABLE_OFFSET (25)

module jfpjc_synth_tb();
    reg clock;
    reg nreset;

    //hm01b0
    reg hm01b0_mclk;          // 100kHz
    wire       hm01b0_pixclk;
    wire [7:0] hm01b0_pixdata;
    wire       hm01b0_hsync;
    wire       hm01b0_vsync;
    hm01b0_sim hm01b0(.mclk(hm01b0_mclk),
                      .nreset(nreset),

                      .clock(hm01b0_pixclk),
                      .pixdata(hm01b0_pixdata),
                      .hsync(hm01b0_hsync),
                      .vsync(hm01b0_vsync));

    wire compressor_data_good;
    wire compressor_vsync;
    wire [7:0] compressor_data_out;
    jfpjc compressor(.nreset(nreset),
                     .clock(clock),

                     .hm01b0_pixclk(hm01b0_pixclk),
                     .hm01b0_pixdata(hm01b0_pixdata),
                     .hm01b0_hsync(hm01b0_hsync),
                     .hm01b0_vsync(hm01b0_vsync),

                     .hsync(compressor_data_good),
                     .vsync(compressor_vsync),
                     .data_out(compressor_data_out));
    defparam compressor.quant_table_file = "./quantization_table.hextestcase";

    wire compressor_synth_data_good;
    wire compressor_synth_vsync;
    wire [7:0] compressor_synth_data_out;
    jfpjc_synth compressor_synth(.nreset(nreset),
                                 .clock(clock),

                                 .hm01b0_pixclk(hm01b0_pixclk),
                                 .hm01b0_pixdata(hm01b0_pixdata),
                                 .hm01b0_hsync(hm01b0_hsync),
                                 .hm01b0_vsync(hm01b0_vsync),

                                 .hsync(compressor_synth_data_good),
                                 .vsync(compressor_synth_vsync),
                                 .data_out(compressor_synth_data_out));
    //defparam compressor.quant_table_file = "./quantization_table.hextestcase"

    // generate hm01b0 clock
    always begin
        #1250; hm01b0_mclk = ~hm01b0_mclk; #1250;
    end

    // generate system clock
    always begin
        #250; clock = ~clock; #250;
    end

    // store output results in buffers
    reg [7:0] huffman_out [0:(1 << 17)];
    reg [7:0] synth_huffman_out [0:(1 << 17)];
    integer outbuf_idx; initial outbuf_idx = 0;
    integer synth_outbuf_idx; initial synth_outbuf_idx = 0;
    always @(posedge clock) begin : store_output
        if (compressor_data_good) begin
            huffman_out[outbuf_idx] = compressor_data_out;
            outbuf_idx = outbuf_idx + 1;
        end

        if (compressor_synth_data_good) begin
            synth_huffman_out[synth_outbuf_idx] = compressor_synth_data_out;
            synth_outbuf_idx = synth_outbuf_idx + 1;
        end
    end

    integer i, j, k;
    integer file_handle;
    reg [7:0] fixed_header_info [0:327];
    initial begin
        $dumpfile("jfpjc_synth_tb.vcd");
        $dumpvars(0, jfpjc_synth_tb);

        //$readmemh("../pictures/checkerboard_highfreq_80x80.hex", hm01b0.hm01b0_image);
        $readmemh("../pictures/boat_gray.hex", hm01b0.hm01b0_image);

        $readmemh("../common_data/jpeg_header_info.hextestcase", fixed_header_info);
        $readmemh("quantization_table.hextestcase", fixed_header_info, `QUANT_TABLE_OFFSET, `QUANT_TABLE_OFFSET + 64);
        //$readmemh("quantization_table.hextestcase", compressor.quantization_table_ebr.mem);
        $readmemh("quantization_table.hextestcase", compressor_synth.compressor.quantization_table_ebr.mem);

        //
        clock = 1'b0;
        hm01b0_mclk = 1'b0;
        nreset = 1'b0;
        #5000;
        nreset = 1'b1;

        // read some number of lines in
`define LINES_TO_READ (260)
        for (i = 0; i < `LINES_TO_READ; i = i + 1) begin
            $display("line %d / %d", i, `LINES_TO_READ);
            while (!((hm01b0_hsync == 0))) begin
                #1000;
            end
            while (!((hm01b0_hsync == 1))) begin
                #1000;
            end
        end

        for (i = 0; i < outbuf_idx; i = i + 1) begin
             $write("%h ", huffman_out[i]);
        end
        $display();

        file_handle = $fopen("output.jpg", "w");
        for (i = 0; i < 9'h148; i = i + 1) begin
            $fwrite(file_handle, "%c", fixed_header_info[i]);
        end
        for (i = 0; i < outbuf_idx; i = i + 1) begin
            $fwrite(file_handle, "%c", huffman_out[i]);
        end
        $fclose(file_handle);

        file_handle = $fopen("output_synth.jpg", "w");
        for (i = 0; i < 9'h148; i = i + 1) begin
            $fwrite(file_handle, "%c", fixed_header_info[i]);
        end
        for (i = 0; i < synth_outbuf_idx; i = i + 1) begin
            $fwrite(file_handle, "%c", synth_huffman_out[i]);
        end
        $fclose(file_handle);

        $finish;
    end
endmodule
