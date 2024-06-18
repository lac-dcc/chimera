// This program was cloned from: https://github.com/johnMamish/jfpjc
// License: MIT License

`timescale 1ns/100ps

`define QUANT_TABLE_OFFSET (25)

module jfpjc_multiframe_tb();
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
    wire [7:0] compressor_data_out;
    jfpjc compressor(.nreset(nreset),
                     .clock(clock),

                     .hm01b0_pixclk(hm01b0_pixclk),
                     .hm01b0_pixdata(hm01b0_pixdata),
                     .hm01b0_hsync(hm01b0_hsync),
                     .hm01b0_vsync(hm01b0_vsync),

                     .hsync(compressor_data_good),
                     .data_out(compressor_data_out));

    // generate hm01b0 clock
    always begin
        hm01b0_mclk = 1'b0;
        #2500;
        hm01b0_mclk = 1'b1;
        #2500;
    end

    // generate system clock
    always begin
        clock = 1'b0;
        #500;
        clock = 1'b1;
        #500;
    end

    reg [7:0] jpeg_out [0:(1 << 17)];

    // read output
    integer outbuf_idx; initial outbuf_idx = 0;
    always @(posedge clock) begin : store_output
        if (compressor_data_good) begin
            jpeg_out[outbuf_idx] = compressor_data_out;
            outbuf_idx = outbuf_idx + 1;
        end
    end

    // $readmemh won't take a reg [8*len:1] or a { "./basename", (8'h30 + num), ".hex" } as its
    // file path argument, so this is the only workaround until I write a VPI function.
    reg [7:0] frames_in_0 [0 : (320 * 240) - 1];
    reg [7:0] frames_in_1 [0 : (320 * 240) - 1];
    reg [7:0] frames_in_2 [0 : (320 * 240) - 1];
    integer jpeg_widths [0 : 2];

    localparam lines_per_frame = 240;
    localparam nframes = 3;
    integer i, j, k;
    integer file_handle;
    reg [7:0] fixed_header_info [0:327];
    reg [7:0] frames_in [0 : nframes-1][0 : (320 * 240) - 1];
    reg [7:0] frames_out [0 : nframes-1][0 : (320 * 240) - 1];
    initial begin
        $dumpfile("jfpjc_multiframe_tb.vcd");
        $dumpvars(0, jfpjc_multiframe_tb);

        // set up constant data
        $readmemh("../common_data/jpeg_header_info.hextestcase", fixed_header_info);
        $readmemh("./quantization_table_1s.hextestcase", fixed_header_info, `QUANT_TABLE_OFFSET, `QUANT_TABLE_OFFSET + 63);
        $readmemh("./quantization_table_1s.hextestcase", compressor.quantization_table_ebr.mem, 0, 63);
        $readmemh("./testimg0.hex", frames_in_0);
        for (i = 0; i < 320 * 240; i = i + 1) begin
            frames_in[0][i] = frames_in_0[i];
        end
        $readmemh("./testimg1.hex", frames_in_1);
        for (i = 0; i < 320 * 240; i = i + 1) begin frames_in[1][i] = frames_in_1[i]; end
        $readmemh("./testimg2.hex", frames_in_2);
        for (i = 0; i < 320 * 240; i = i + 1) begin frames_in[2][i] = frames_in_2[i]; end

        for (i = 0; i < 5; i = i + 1) begin
            $dumpvars(1, compressor.dct_buffer_fetch_addr[i]);
        end
        for (i = 0; i < 4; i = i + 1) begin
            $dumpvars(1, compressor.encoder.index[i]);
        end
        $dumpvars(1, compressor.encoder.do_rollback[0]); $dumpvars(1, compressor.encoder.do_rollback[1]);
        $dumpvars(1, compressor.vsync_prev[0]);
        $dumpvars(1, compressor.vsync_prev[1]);

        nreset = 1'b0;
        @(posedge clock);
        @(posedge clock);
        nreset = #1 1'b1;
        for (i = 0; i < nframes; i = i + 1) begin
            for (j = 0; j < 320 * 240; j = j + 1) begin
                hm01b0.hm01b0_image[j] = frames_in[i][j];
            end

            // simulate frame
            for (j = 0; j < lines_per_frame; j = j + 1) begin
                $display("line %d / %d", j, lines_per_frame);
                @(posedge hm01b0_hsync);
            end
            $display("simulating until posedge vsync...");
            $display("outbuf idx = %d", outbuf_idx);
            @(posedge hm01b0_vsync);
            for (j = 0; j < outbuf_idx; j = j + 1) begin
                frames_out[i][j] = jpeg_out[j];
            end
            jpeg_widths[i] = outbuf_idx;
            outbuf_idx = 0;
            $display("Frame %d done", i);
        end

        // write results to files
        $display("Writing %d frames to files", nframes);
        file_handle = $fopen("output0.jpg", "w");
        for (i = 0; i < 9'h148; i = i + 1) begin
            $fwrite(file_handle, "%c", fixed_header_info[i]);
        end
        for (i = 0; i < jpeg_widths[0]; i = i + 1) begin
            $fwrite(file_handle, "%c", frames_out[0][i]);
        end
        $fwrite(file_handle, "\377\331");
        $fclose(file_handle);

        file_handle = $fopen("output1.jpg", "w");
        for (i = 0; i < 9'h148; i = i + 1) begin
            $fwrite(file_handle, "%c", fixed_header_info[i]);
        end
        for (i = 0; i < jpeg_widths[1]; i = i + 1) begin
            $fwrite(file_handle, "%c", frames_out[1][i]);
        end
        $fwrite(file_handle, "\377\331");
        $fclose(file_handle);

        file_handle = $fopen("output2.jpg", "w");
        for (i = 0; i < 9'h148; i = i + 1) begin
            $fwrite(file_handle, "%c", fixed_header_info[i]);
        end
        for (i = 0; i < jpeg_widths[2]; i = i + 1) begin
            $fwrite(file_handle, "%c", frames_out[2][i]);
        end
        $fwrite(file_handle, "\377\331");
        $fclose(file_handle);

        $finish;
    end
endmodule
