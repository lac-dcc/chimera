// This program was cloned from: https://github.com/johnMamish/jfpjc
// License: MIT License

`timescale 1ns/100ps

`define QUANT_TABLE_OFFSET (25)

module jfpjc_tb();
    reg clock;
    reg nreset;

    //hm01b0
    wire       hm01b0_pixclk;
    wire [7:0] hm01b0_pixdata;
    wire       hm01b0_hsync;
    wire       hm01b0_vsync;
    hm01b0_sim hm01b0(.mclk(),
                      .nreset(nreset),

                      .clock(hm01b0_pixclk),
                      .pixdata(hm01b0_pixdata),
                      .hsync(hm01b0_hsync),
                      .vsync(hm01b0_vsync));

    defparam hm01b0.internal_oscillator_enable = 1;
    defparam hm01b0.internal_oscillator_frequency = 8 * 0.003 * 0.9999;

    defparam hm01b0.left_active_padding = 2;
    defparam hm01b0.right_active_padding = 2;
    defparam hm01b0.top_active_padding = 2;
    defparam hm01b0.bottom_active_padding = 2;

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
                     .data_out(compressor_data_out));
    defparam compressor.quant_table_file = "./quantization_table.hextestcase";

    defparam compressor.ingester.left_active_padding = 2;
    defparam compressor.ingester.right_active_padding = 2;
    defparam compressor.ingester.top_active_padding = 2;
    defparam compressor.ingester.bottom_active_padding = 2;

    // generate system clock
    always begin clock = 0; #(500.0 / 12.0); clock = 1; #(500.0 / 12.0); end

    reg [7:0] huffman_out [0:(1 << 17)];

    // empty out DCT output buffers whenever a new result is available.
    reg signed [15:0] dct_result [0:(320 * 240) - 1];
    integer outbuf_idx; initial outbuf_idx = 0;
    always @(posedge clock) begin : store_output
        if (compressor_data_good) begin
            huffman_out[outbuf_idx] = compressor_data_out;
            outbuf_idx = outbuf_idx + 1;
        end
    end

    integer i, j, k;
    reg signed [15:0] dct_testmem [0:(320 * 240) - 1];
    reg signed [15:0] test;
    reg signed [7:0] test2;
    integer file_handle;
    reg [7:0] fixed_header_info [0:327];
    initial begin
        $dumpfile("jfpjc_tb.vcd");
        $dumpvars(0, jfpjc_tb);

        $readmemh("./testimg.hex", hm01b0.hm01b0_image);

        $readmemh("../common_data/jpeg_header_info.hextestcase", fixed_header_info);
        $readmemh("./quantization_table.hextestcase", fixed_header_info, `QUANT_TABLE_OFFSET, `QUANT_TABLE_OFFSET + 64);
        //$readmemh("./quantization_table.hextestcase", compressor.quantization_table_ebr.mem);

        for (i = 0; i < 5; i = i + 1) begin
            $dumpvars(1, compressor.dct_buffer_fetch_addr[i]);
        end
        for (i = 0; i < 4; i = i + 1) begin
            $dumpvars(1, compressor.encoder.index[i]);
            $dumpvars(1, compressor.encoder.valid[i]);
        end
        $dumpvars(1, compressor.encoder.do_rollback[0]); $dumpvars(1, compressor.encoder.do_rollback[1]);

        //
        clock = 1'b0;
        nreset = 1'b0;
        #5000;
        nreset = 1'b1;

        // read some number of lines in
`define LINES_TO_READ (260)
        for (i = 0; i < `LINES_TO_READ; i = i + 1) begin
            $fwrite(32'h8000_0002, "line %d / %d%c[1A\n", i, `LINES_TO_READ, 8'o33);
            @(posedge hm01b0_hsync);
            @(negedge hm01b0_hsync);
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
        $fwrite(file_handle, "\377\331");
        $fclose(file_handle);

        $finish;
    end
endmodule
