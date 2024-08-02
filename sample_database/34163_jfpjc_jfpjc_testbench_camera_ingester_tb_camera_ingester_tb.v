// This program was cloned from: https://github.com/johnMamish/jfpjc
// License: MIT License

//`include "hm01b0_sim.v"
//`include "ice40_ebr.v"

`timescale 1ns/100ps

module camera_ingester_tb();
    reg clock;
    always begin clock = 0; #(500.0 / 12.0); clock = 1; #(500.0 / 12.0); end

    reg nreset;

    localparam IMAGE_WIDTH = 320;
    localparam IMAGE_HEIGHT = 240;
    localparam LINES_TO_READ = 256;
    localparam MCUS_PER_BUFFER = 8;

    ////////////////////////////////////////////////////////////////
    // Instantiate camera simulator
    wire       hm01b0_pixclk;
    wire [7:0] hm01b0_pixdata;
    wire       hm01b0_hsync;
    wire       hm01b0_vsync;

    hm01b0_sim hm01b0(.mclk(clock),
                      .nreset(nreset),

                      .clock(hm01b0_pixclk),
                      .pixdata(hm01b0_pixdata),
                      .hsync(hm01b0_hsync),
                      .vsync(hm01b0_vsync));
    defparam hm01b0.width = IMAGE_WIDTH;
    defparam hm01b0.height = IMAGE_HEIGHT;

    // These defparams set it up so that the hm01b0 has its own seperate oscillator which
    // generates a pixclk with a freq of 3MHz - 0.01%.
    defparam hm01b0.internal_oscillator_enable = 1;
    defparam hm01b0.internal_oscillator_frequency = 8 * 0.003 * 0.9999;

    defparam hm01b0.left_active_padding = 2;
    defparam hm01b0.right_active_padding = 2;
    defparam hm01b0.top_active_padding = 2;
    defparam hm01b0.bottom_active_padding = 2;

    ////////////////////////////////////////////////////////////////
    // Instantiate DUT
    wire [2:0] output_ebr_select;
    wire       frontbuffer_select;
    wire [8:0] output_write_addr;
    wire [7:0] output_pixval;
    wire       wren;

    camera_ingester ingester(.clock(clock),
                             .nreset(nreset),

                             .pixclk(hm01b0_pixclk),
                             .pixdata(hm01b0_pixdata),
                             .hsync(hm01b0_hsync),
                             .vsync(hm01b0_vsync),

                             .frontbuffer_select(frontbuffer_select),

                             .output_block_select(output_ebr_select),
                             .output_write_addr(output_write_addr),
                             .output_pixval(output_pixval),

                             .wren(wren));

    defparam ingester.left_active_padding = 2;
    defparam ingester.right_active_padding = 2;
    defparam ingester.top_active_padding = 2;
    defparam ingester.bottom_active_padding = 2;

    initial ingester.frontbuffer_select = 0;

    ////////////////////////////////////////////////////////////////
    // Buffer indexing
    // When the ingester is part of a system, it bounces back and forth between 2 buffers; for
    // testing, instead we will hook it up to a bunch of buffers
    localparam NUMBER_OF_BUFFERS = LINES_TO_READ / 8;
    reg [($clog2(NUMBER_OF_BUFFERS) - 1):0] buffer_index;
    initial buffer_index = 0;
    always @(posedge frontbuffer_select, negedge frontbuffer_select) buffer_index <= buffer_index + 1;

    ////////////////////////////////////////////////////////////////
    // Instantiate output buffers
    genvar gi, gij;
    wire block_wren[0:(NUMBER_OF_BUFFERS * 5) - 1];
    wire [7:0] all_results [0:(NUMBER_OF_BUFFERS * 5)-1][0:511];
    generate
        for (gi = 0; gi < NUMBER_OF_BUFFERS * 5; gi = gi + 1) begin: ebrs
            assign block_wren[gi] = (((output_ebr_select == (gi % 5)) && wren) &&
                                     (buffer_index == (gi / 5)));

            ice40_ebr image_buffer(.din(output_pixval),
                                   .write_en(block_wren[gi]),
                                   .waddr(output_write_addr),
                                   .wclk(clock),
                                   .raddr(9'h0),
                                   .rclk(1'h0),
                                   .dout());

            for (gij = 0; gij < 512; gij = gij + 1) begin
                assign all_results[gi][gij] = image_buffer.mem[gij];
            end

            initial begin: ebrs_initialize
                integer j;
                for (j = 0; j < 512; j = j + 1) begin
                    image_buffer.mem[j] = 'h0;
                end
            end
        end
    endgenerate

    initial begin: main
        integer i, j, k;
        integer mcu_x, mcu_y, x, y, image_index;
        integer total_lines_to_read;
        reg [7:0] init_pixel_val;
        reg [7:0] pixel_check_val;
        reg       pixel_check_failed;

        $dumpfile("camera_ingester_tb.vcd");
        $dumpvars(0, camera_ingester_tb);
        for (i = 0; i < 2; i = i + 1) $dumpvars(1, ingester.pixclk_prev[i]);

        // initialize camera; the pattern should be such that ascending numbers are stored in
        // ascending buffer locations
        init_pixel_val = 0;
        for (mcu_y = 0; mcu_y < $ceil(LINES_TO_READ / 8.0); mcu_y = mcu_y + 1) begin
            for(mcu_x = 0; mcu_x < $ceil(IMAGE_WIDTH / 8.0); mcu_x = mcu_x + 1) begin
                for (y = 0; (y < 8) && ((y + (mcu_y * 8)) < LINES_TO_READ); y = y + 1) begin
                    for (x = 0; (x < 8) && ((x + (mcu_x * 8)) < IMAGE_WIDTH); x = x + 1) begin
                        image_index = ((IMAGE_WIDTH * ((8 * mcu_y) + y)) +
                                       ((8 * mcu_x) + x));
                        hm01b0.hm01b0_image[image_index] = init_pixel_val;
                        init_pixel_val = init_pixel_val + 1;
                    end
                end
            end
        end

        clock = 1'b0;
        nreset = 1'b0;
        #5000;
        nreset = 1'b1;

        // read some number of lines
        if (LINES_TO_READ / IMAGE_HEIGHT)
          total_lines_to_read = (LINES_TO_READ +
                                 ((LINES_TO_READ / IMAGE_HEIGHT) + 1) * hm01b0.top_active_padding +
                                 (LINES_TO_READ / IMAGE_HEIGHT) * hm01b0.bottom_active_padding);
        for (i = 0; i < total_lines_to_read; i = i + 1) begin
            $fwrite(32'h8000_0002, "line %d / %d%c[1A\n", i, total_lines_to_read, 8'o33);
            @(posedge hm01b0_hsync);
            @(negedge hm01b0_hsync);
            #1000;
        end
        $fwrite(32'h8000_0002, "\n");

        // print
        pixel_check_val = 0;
        pixel_check_failed = 0;
        for (i = 0; i < IMAGE_WIDTH * LINES_TO_READ; i = i + 1) begin: buffer_print_block
            integer buffer_number, mcu_number, buffer_x, buffer_mcu_index, buffer_set_index, buffer_addr;
            reg [7:0] p;

            mcu_number = i / 64;
            buffer_x = i % 64;
            buffer_mcu_index = (mcu_number / 5) % 8;
            buffer_addr = (buffer_mcu_index * 64) + buffer_x;

            buffer_set_index = (mcu_number / (5 * 8));
            buffer_number = (5 * buffer_set_index) + (mcu_number % 5);

            p = all_results[buffer_number][buffer_addr];

            if (p != pixel_check_val) begin
                if (!pixel_check_failed) begin
                    $display("first bad value %02h at buffer %04d index %04d; expected %02h",
                             p, buffer_number, buffer_addr, pixel_check_val);
                    $display("i = %d\n", i);
                end

                pixel_check_failed = 1;
            end

            pixel_check_val = pixel_check_val + 1;
        end

        if (pixel_check_failed)
          $display("Testbench failed.");
        else
          $display("Testbench passed.");

        $finish;
    end
endmodule
