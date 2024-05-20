// This program was cloned from: https://github.com/johnMamish/jfpjc
// License: MIT License

`timescale 1ns/100ps

`define QUANT_TABLE_OFFSET (25)

module jfpjc_tb();
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
    defparam hm01b0.width = 324;
    defparam hm01b0.height = 244;

    wire roi_vsync, roi_hsync, roi_pixclk;
    vsync_hsync_roi trim(.pixclk_in(hm01b0_pixclk), .hsync_in(hm01b0_hsync), .vsync_in(hm01b0_vsync),
                         .pixclk_out(roi_pixclk), .hsync_out(roi_hsync), .vsync_out(roi_vsync));
    defparam trim.roi_width = 320; defparam trim.roi_height = 240;
    defparam trim.left_padding = 2; defparam trim.right_padding = 2;
    defparam trim.top_padding = 2; defparam trim.bottom_padding = 2;

    wire compressor_data_good;
    wire [7:0] compressor_data_out;
    jfpjc compressor(.nreset(nreset),
                     .clock(clock),

                     .hm01b0_pixclk(roi_pixclk),
                     .hm01b0_pixdata(hm01b0_pixdata),
                     .hm01b0_hsync(roi_hsync),
                     .hm01b0_vsync(roi_vsync),

                     .hsync(compressor_data_good),
                     .data_out(compressor_data_out));

    // generate hm01b0 clock
    always begin
        #1250; hm01b0_mclk = ~hm01b0_mclk; #1250;
    end

    // generate system clock
    always begin
        #250; clock = ~clock; #250;
    end

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
        //$dumpfile("jfpjc_tb.vcd");
        //$dumpvars(0, jfpjc_tb);

        $readmemh("./testimg.hex", hm01b0.hm01b0_image);

        $readmemh("../common_data/jpeg_header_info.hextestcase", fixed_header_info);
        $readmemh("./quantization_table_1s.hextestcase", fixed_header_info, `QUANT_TABLE_OFFSET, `QUANT_TABLE_OFFSET + 63);
        $readmemh("./quantization_table_1s.hextestcase", compressor.quantization_table_ebr.mem, 0, 63);

        //
        clock = 1'b0;
        hm01b0_mclk = 1'b0;
        nreset = 1'b0;
        #5000;
        nreset = 1'b1;

        // read some number of lines in
`define LINES_TO_READ (260)
        for (i = 0; i < `LINES_TO_READ; i = i + 1) begin
            $fwrite(32'h8000_0002, "line %d / %d%c[1A\n", i, `LINES_TO_READ, 8'o33);
            while (!((hm01b0_hsync == 0))) begin
                #1000;
            end
            while (!((hm01b0_hsync == 1))) begin
                #1000;
            end
        end

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
