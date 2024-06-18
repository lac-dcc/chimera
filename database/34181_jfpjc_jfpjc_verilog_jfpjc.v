// This program was cloned from: https://github.com/johnMamish/jfpjc
// License: MIT License

/**
 * This is the top-level jpeg compressor module.
 *
 * It takes an hm01b0 pixel bus as input and produces a sequence of memory writes on the output
 * which represent a jpeg image.
 *
 * The image is first pulled into a double-buffered bank of iCE40 EBRs, with each bank consisting
 * of 5 EBRs. The input buffer therefore requires 10 EBRs in total.
 *
 * After this, a configurable number of DCT engines read from each of the EBRs in sequence
 */

`timescale 1ns/100ps

module jfpjc(input                      nreset,
             input                      clock,

             input                      hm01b0_pixclk,
             input [7:0]                hm01b0_pixdata,
             input                      hm01b0_hsync,
             input                      hm01b0_vsync,

             output                     hsync,
             output reg                 vsync,
             output     [7:0]           data_out);
    parameter quant_table_file = "";


    ////////////////////////////////////////////////////////////////
    // ingester and ingester buffers
    wire [2:0] ingester_output_block_select;
    wire       ingester_frontbuffer_select;
    wire [8:0] ingester_output_write_addr;
    wire [7:0] ingester_output_pixval;
    wire       ingester_wren;

    // The JPEG algorithm expects values to be 0-centered on [128, 128).
    // The camera values are uint8 on [0, 256), so we subtract 128 from each value to
    // int8 on [-128, 128)
    wire [7:0] adjusted_ingester_output_pixval = ingester_output_pixval + 8'h80;

    reg [8:0] dct_buffer_fetch_addr [0:4];

    camera_ingester ingester(.nreset(nreset),
                             .clock(clock),

                             .pixclk(hm01b0_pixclk),
                             .pixdata(hm01b0_pixdata),
                             .hsync(hm01b0_hsync),
                             .vsync(hm01b0_vsync),

                             .output_block_select(ingester_output_block_select),
                             .frontbuffer_select(ingester_frontbuffer_select),
                             .output_write_addr(ingester_output_write_addr),
                             .output_pixval(ingester_output_pixval),
                             .wren(ingester_wren));

    // 10x EBR
    genvar ingester_ebrs_gi;

    integer ingester_ebrs_gj;
    wire [7:0] ingester_block_dout [0:9];
    wire ingester_block_wren[0:9];
    generate
        for (ingester_ebrs_gi = 0; ingester_ebrs_gi < 10; ingester_ebrs_gi = ingester_ebrs_gi + 1) begin: ebrs
            if (ingester_ebrs_gi < 5) begin
                assign ingester_block_wren[ingester_ebrs_gi] =
                    ((ingester_output_block_select == (ingester_ebrs_gi % 5)) &&
                     (ingester_wren) &&
                     (ingester_frontbuffer_select == 1'h0));
            end else begin
                assign ingester_block_wren[ingester_ebrs_gi] =
                    ((ingester_output_block_select == (ingester_ebrs_gi % 5)) &&
                     (ingester_wren) &&
                     (ingester_frontbuffer_select == 1'h1));
            end
            // The JPEG algorithm expects values to be 0-centered on [128, 128).
            // The camera values are uint8 on [0, 256), so we subtract 128 from each value to
            // int8 on [-128, 128)

            ice40_ebr jpeg_buffer(.din(adjusted_ingester_output_pixval),
                                  .write_en(ingester_block_wren[ingester_ebrs_gi]),
                                  .waddr(ingester_output_write_addr),
                                  .wclk(clock),
                                  .raddr(dct_buffer_fetch_addr[ingester_ebrs_gi % 5]),
                                  .rclk(clock),
                                  .dout(ingester_block_dout[ingester_ebrs_gi]));

            // zero buffer
`ifndef YOSYS
            initial begin
                for (ingester_ebrs_gj = 0; ingester_ebrs_gj < 512; ingester_ebrs_gj = ingester_ebrs_gj + 1) begin
                    jpeg_buffer.mem[ingester_ebrs_gj] = 'h0;
                end
            end
`endif
        end
    endgenerate

    ////////////////////////////////////////////////////////////////
    // DCT engines
    // Note that the 5 EBRs here make a special case where I can just have 1 DCT engine per EBR. In
    // other cases, I'd need a routing network between the EBRs and the DCT engines to correctly
    // distribute N EBRs worth of data over M DCT engines.
    wire [1:0] dcts_frontbuffer;
    wire       dct_nreset;
    wire [5:0] dct_fetch_addr [0:4];
    wire [4:0] dcts_finished;
    wire [2:0] mcu_groups_processed;
    wire [7:0] dct_output_read_addr;
    wire signed [15:0] dct_output_read_data [0:4];

    // 5 * (1 + 1) ebr (10x ebr)
    genvar dcts_i;
    generate
        for (dcts_i = 0; dcts_i < 5; dcts_i = dcts_i + 1) begin: dcts
            wire [5:0] dct_result_write_addr;
            wire       dct_result_wren;
            wire signed [7:0] src_data_in;
            assign src_data_in = ((ingester_frontbuffer_select + 1'h1) == 1'h0) ?
                                 ingester_block_dout[dcts_i] :
                                 ingester_block_dout[dcts_i + 5];

            wire signed [15:0] dct_result_out;
            loeffler_dct_88 dct(.clock(clock),
                                .nreset(dct_nreset & nreset),

                                .fetch_addr(dct_fetch_addr[dcts_i]),
                                .src_data_in(src_data_in),

                                .result_write_addr(dct_result_write_addr),
                                .result_wren(dct_result_wren),
                                .result_out(dct_result_out),

                                .finished(dcts_finished[dcts_i]));

            // round and convert 3q12 result to 7q8
            // NB for optimization: only need 3q8 of precision, not 7q8.
            wire signed [15:0] dct_result_out_7q8;
            assign dct_result_out_7q8 = (dct_result_out + 16'sh0008) >>> 4;

            wire [7:0] dct_buffered_write_addr;
            assign dct_buffered_write_addr = {dcts_frontbuffer, dct_result_write_addr};
            ice40_ebr #(.addr_width(8), .data_width(16)) dct_output_mem(.din(dct_result_out_7q8),
                                                                        .write_en(dct_result_wren),
                                                                        .waddr(dct_buffered_write_addr),
                                                                        .wclk(clock),
                                                                        .raddr(dct_output_read_addr),
                                                                        .rclk(clock),
                                                                        .dout(dct_output_read_data[dcts_i]));
        end

        for (dcts_i = 0; dcts_i < 5; dcts_i = dcts_i + 1) begin: dct_addrs
            always @* begin
                dct_buffer_fetch_addr[dcts_i] = { mcu_groups_processed, dct_fetch_addr[dcts_i] };
            end
        end
    endgenerate

    ////////////////////////////////////////////////////////////////
    // DCT engine reset logic
    dct_reset_manager dct_manager(.clock(clock),
                                  .nreset(nreset),
                                  .ingester_frontbuffer_select(ingester_frontbuffer_select),
                                  .dcts_finished(&dcts_finished),
                                  .mcu_groups_processed(mcu_groups_processed),
                                  .dcts_frontbuffer(dcts_frontbuffer),
                                  .dct_nreset(dct_nreset));

    ////////////////////////////////////////////////////////////////
    // quantizer
    wire [1:0] quantizer_readbuf;
    wire [5:0] coefficient_index;
    reg [5:0] coefficient_index_delay;
    wire [2:0] ebr_index;
    wire [1:0] quantizer_output_buffer;
    wire dividend_divisor_valid;
    always @(posedge clock) coefficient_index_delay <= coefficient_index;
    quantizer_manager_fsm quantizer_manager(.clock(clock),
                                            .nreset(nreset),
                                            .dcts_frontbuffer(dcts_frontbuffer),
                                            .quantizer_readbuf(quantizer_readbuf),
                                            .coefficient_index(coefficient_index),
                                            .ebr_index(ebr_index),
                                            .quantizer_output_buffer(quantizer_output_buffer),
                                            .dividend_divisor_valid(dividend_divisor_valid));

    wire signed [15:0] dividend;
    wire        [7:0] divisor;
    reg         [7:0] quotient_tag_in;

    wire [5:0] zigzagged_coefficient_index;
    zig_zag_to_row_major ziggy(.zig_zag_index(coefficient_index),
                               .row_major_index(zigzagged_coefficient_index));
    assign dct_output_read_addr = { quantizer_readbuf, zigzagged_coefficient_index };
    assign dividend = dct_output_read_data[ebr_index];

    // entries in the quantization table shall be stored in zig-zag order.
    // 1 EBR
    ice40_ebr #(.addr_width(9), .data_width(8)) quantization_table_ebr(.din(8'h00),
                                                                       .write_en(1'b0),
                                                                       .waddr(9'h00),
                                                                       .wclk(1'b0),

                                                                       .raddr({ 3'h0, coefficient_index }),
                                                                       .rclk(clock),
                                                                       .dout(divisor));
    defparam quantization_table_ebr.init_file = quant_table_file;

//`define SHIFT_INSTEAD_OF_DIVIDE
`ifdef SHIFT_INSTEAD_OF_DIVIDE
    reg signed [15:0] quotient;
    reg         [7:0] quotient_tag;
    reg               quotient_valid;
    wire signed [15:0]   round_towards_zero_offs;
    assign round_towards_zero_offs = (dividend < 0) ? 16'sh0001 : 16'sh0000;
    always @(posedge clock) begin
        if (nreset) begin
            case (coefficient_index_delay[5:4])
                2'b00:        quotient <= (dividend >>> 3) + round_towards_zero_offs;
                2'b01:        quotient <= (dividend >>> 5) + round_towards_zero_offs;
                2'b10, 2'b11: quotient <= (dividend >>> 6) + round_towards_zero_offs;
            endcase
            quotient_tag <= { quantizer_output_buffer, coefficient_index_delay };
            quotient_valid <= dividend_divisor_valid;
        end else begin
            quotient <= 'hxx;
            quotient_tag <= 'hxx;
            quotient_valid <= 1'b0;
        end
    end
`else
    wire signed [15:0] quotient;
    wire         [7:0] quotient_tag;
    wire               quotient_valid;
    pipelined_divider divider(.nreset(nreset),
                              .clock(clock),

                              .dividend(dividend),
                              .divisor(divisor),
                              .tag({ quantizer_output_buffer, coefficient_index_delay }),
                              .input_valid(dividend_divisor_valid),

                              .quotient(quotient),
                              .tag_out(quotient_tag),
                              .output_valid(quotient_valid));
    defparam divider.dividend_width = 16;
    defparam divider.divisor_width  = 8;
`endif

    reg [1:0] huffman_encoder_buffer_sel;
    wire [5:0] huffman_encoder_fetch_addr;
    wire [15:0] huffman_encoder_src_data_in;
    ice40_ebr #(.addr_width(8), .data_width(16))
        quotient_output_mem(.din(quotient),
                            .write_en(quotient_valid),
                            .waddr(quotient_tag),
                            .wclk(clock),
                            .raddr({ huffman_encoder_buffer_sel, huffman_encoder_fetch_addr }),
                            .rclk(clock),
                            .dout(huffman_encoder_src_data_in));


    reg [10 : 0] num_mcus_encoded_this_frame;
    wire huffman_encoder_done_this_frame = (num_mcus_encoded_this_frame >= 1200);
    wire huffman_encoder_output_wren;
    wire [31:0] huffman_encoder_output_data;
    wire [5:0] huffman_encoder_output_length;
    wire       huffman_encoder_busy;
    reg        huffman_encoder_start;
    jpeg_huffman_encode encoder(.clock(clock),
                                .nreset(nreset && (!huffman_encoder_done_this_frame)),
                                .start(huffman_encoder_start),

                                .fetch_addr(huffman_encoder_fetch_addr),
                                .src_data_in(huffman_encoder_src_data_in),

                                .output_wren(huffman_encoder_output_wren),
                                .output_length(huffman_encoder_output_length),
                                .output_data(huffman_encoder_output_data),

                                .busy(huffman_encoder_busy));

    reg vsync_prev [0:2];
    reg [7:0] quotient_tag_next;
    reg huffman_encoder_busy_delay;
    always @(posedge clock) begin
        if (nreset) begin
            { vsync_prev[2], vsync_prev[1], vsync_prev[0] } <= { vsync_prev[1], vsync_prev[0], hm01b0_vsync };

            huffman_encoder_busy_delay <= huffman_encoder_busy;
            if (!huffman_encoder_busy && huffman_encoder_busy_delay) begin
                huffman_encoder_buffer_sel <= huffman_encoder_buffer_sel + 2'h1;
            end else begin
                huffman_encoder_buffer_sel <= huffman_encoder_buffer_sel;
            end

            if (!vsync_prev[2] && vsync_prev[1]) begin
                num_mcus_encoded_this_frame <= 'h0;
            end else if (!huffman_encoder_busy && huffman_encoder_busy_delay) begin
                num_mcus_encoded_this_frame <= num_mcus_encoded_this_frame + 'h1;
            end else begin
                num_mcus_encoded_this_frame <= num_mcus_encoded_this_frame;
            end

            if (quotient_valid) begin
                quotient_tag_next <= quotient_tag + 8'h1;
            end else begin
                quotient_tag_next <= quotient_tag_next;
            end

            // huffman_encoder_start can be derived with only combinational logic, but making it
            // behave nicely right at reset would be a pain; we'd need to initialize
            // "quotient_tag_next" to be
            if ((huffman_encoder_buffer_sel != (quotient_tag_next[7:6])) &&
                (!huffman_encoder_busy_delay) &&
                !huffman_encoder_done_this_frame) begin
                huffman_encoder_start <= 1'b1;
            end else begin
                huffman_encoder_start <= 1'b0;
            end
        end else begin
            huffman_encoder_busy_delay <= 1'b0;
            huffman_encoder_buffer_sel <= 2'h0;
            quotient_tag_next <= 8'h0;
            huffman_encoder_start <= 1'b0;
            num_mcus_encoded_this_frame <= 'h0;
            { vsync_prev[2], vsync_prev[1], vsync_prev[0] } <= { hm01b0_vsync, hm01b0_vsync, hm01b0_vsync };
        end
    end

    // flush remaining bits in bitpacker out once encoder is finished.
`define BIT_PACKER_FLUSH_STATE_IDLE 2'b00
`define BIT_PACKER_FLUSH_STATE_FLUSH 2'b01
`define BIT_PACKER_FLUSH_STATE_RESET 2'b10
    reg  [1:0] bit_packer_flush_state;
    reg        bit_packer_data_in_wren;
    reg  [5:0] bit_packer_data_in_length;
    reg [31:0] bit_packer_data_in;
    reg        bit_packer_force_reset;
    reg  [1:0] bit_packer_flush_state_next;

    always @* begin
        if (nreset) begin
            case (bit_packer_flush_state)
                `BIT_PACKER_FLUSH_STATE_IDLE: begin
                    bit_packer_data_in_wren = huffman_encoder_output_wren;
                    bit_packer_data_in_length = huffman_encoder_output_length;
                    bit_packer_data_in = huffman_encoder_output_data;
                    bit_packer_force_reset = 1'b0;
                    bit_packer_flush_state_next = huffman_encoder_done_this_frame ?
                                                  `BIT_PACKER_FLUSH_STATE_FLUSH : `BIT_PACKER_FLUSH_STATE_IDLE;
                end

                `BIT_PACKER_FLUSH_STATE_FLUSH: begin
                    bit_packer_data_in_wren = 1'b1;
                    bit_packer_data_in_length = 'd32;
                    bit_packer_data_in = 32'hffff_ffff;
                    bit_packer_force_reset = 1'b0;
                    bit_packer_flush_state_next = `BIT_PACKER_FLUSH_STATE_RESET;
                end

                `BIT_PACKER_FLUSH_STATE_RESET: begin
                    bit_packer_data_in_wren = 1'b0;
                    bit_packer_data_in_length = 'd0;
                    bit_packer_data_in = 32'hxxxx_xxxx;
                    bit_packer_force_reset = 1'b1;
                    bit_packer_flush_state_next = huffman_encoder_done_this_frame ?
                                                  `BIT_PACKER_FLUSH_STATE_RESET : `BIT_PACKER_FLUSH_STATE_IDLE;
                end

                default: begin
                    bit_packer_data_in_wren = 1'bx;
                    bit_packer_data_in_length = 'hx;
                    bit_packer_data_in = 32'hxxxx_xxxx;
                    bit_packer_force_reset = 1'b0;
                    bit_packer_flush_state_next = 'hx;
                end
            endcase // case (bit_packer_flush_state)
        end else begin
            bit_packer_data_in_wren = 1'bx;
            bit_packer_data_in_length = 'hx;
            bit_packer_data_in = 32'hxxxx_xxxx;
            bit_packer_force_reset = 1'b0;
            bit_packer_flush_state_next = `BIT_PACKER_FLUSH_STATE_IDLE;
        end
    end

    always @(posedge clock) bit_packer_flush_state <= bit_packer_flush_state_next;

    wire bit_packer_data_out_valid;
    wire [31:0] bit_packer_data_out;
    bitpacker packer(.clock(clock),
                     .nreset(nreset && !bit_packer_force_reset),

                     .data_in_valid(bit_packer_data_in_wren),
                     .data_in(bit_packer_data_in),
                     .input_length(bit_packer_data_in_length),

                     .data_out_valid(bit_packer_data_out_valid),
                     .data_out(bit_packer_data_out));


    wire [31:0] bit_packer_le;
    wire        wab_data_out_valid;
    wire  [7:0] wab_data_out;
    assign bit_packer_le = {bit_packer_data_out[0 +: 8], bit_packer_data_out[8 +: 8], bit_packer_data_out[16 +: 8], bit_packer_data_out[24 +: 8]};
    width_adapter_buffer wab(.clock(clock),
                             .nreset(nreset),

                             .data_in_valid(bit_packer_data_out_valid),
                             .data_in(bit_packer_le),

                             .data_out_valid(wab_data_out_valid),
                             .data_out(wab_data_out));
    defparam wab.input_width = 32;
    defparam wab.output_width = 8;

    bytestuffer bytestuffer(.clock(clock),
                            .nreset(nreset),
                            .data_in_valid(wab_data_out_valid),
                            .data_in(wab_data_out),
                            .data_out_valid(hsync),
                            .data_out(data_out));

    // VSYNC has to stay high until all data for the current frame has been evacuated from the
    // pipeline. Until we get to the end of the huffman encoder, it's easy to keep track of whether
    // this is still a halfway-processed frame working its way through the pipeline. After the
    // huffman encoder, we still have bitpacking and ff 00 bytestuffing to do; it would take
    // some revisions to the hardware to figure out whether those parts of the pipeline are fully
    // evacuated or not.
    //
    // This is a gross hack: we count the number of clock cycles after the huffman encoder has
    // finished the last MCU in the frame. Because of the buffer sizes in the post-huffman encoder
    // output chain, here's an upper bound for how long data can live in the pipeline after
    // that before it's all evacuated.
    localparam [15:0] max_output_pipeline_lifetime = 16'd256;
    reg [15:0] huffman_finished_counter;
    always @(posedge clock) begin
        if (nreset) begin
            if (huffman_encoder_done_this_frame) begin
                huffman_finished_counter <= (huffman_finished_counter == max_output_pipeline_lifetime) ?
                                            huffman_finished_counter : (huffman_finished_counter + 16'h0001);
            end else begin
                huffman_finished_counter <= 16'h0000;
            end

            if (bit_packer_data_out_valid) begin
                vsync <= 1'b1;
            end else if (huffman_finished_counter >= max_output_pipeline_lifetime) begin
                vsync <= 1'b0;
            end else begin
                vsync <= vsync;
            end
        end else begin
            huffman_finished_counter <= 8'h00;
            vsync <= 1'b0;
        end
    end
endmodule
