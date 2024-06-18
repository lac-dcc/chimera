// This program was cloned from: https://github.com/johnMamish/jfpjc
// License: MIT License

`timescale 1ns/100ps

`include "fixed_point_consts.v"

module loeffler_dct_8_tb();
    reg clock;
    reg nreset;


    wire [7:0] fetch_data;
    wire [2:0] fetch_addr;

    wire [15:0] result_out;
    wire  [2:0] result_write_addr;
    wire        result_wren;
    wire        result_clk;

    // memory holding the 8 (int8_t) elements that we want to take the dct of.
    ice40_ebr #(.addr_width(9), .data_width(8))  data_rom (.din(8'h00),
                                                           .write_en(1'b0),
                                                           .waddr(9'h00),
                                                           .wclk(1'b0),

                                                           .raddr({ 6'h0, fetch_addr }),
                                                           .rclk(clock),
                                                           .dout(fetch_data));


    wire [4:0] scratchpad_read_addr;
    wire [15:0] scratchpad_read_data;

    wire [4:0] scratchpad_write_addr;
    wire       scratchpad_wren;
    wire [15:0] scratchpad_write_data;

    wire dct_done;
    loeffler_dct_8 dct(.clock(clock),
                       .nreset(nreset),

                       .fetch_addr(fetch_addr),
                       .src_data_in({ {8{fetch_data[7]}}, fetch_data[7:0] }),

                       .scratchpad_read_addr(scratchpad_read_addr),
                       .scratchpad_read_data(scratchpad_read_data),

                       .result_write_addr(result_write_addr),
                       .result_wren(result_wren),
                       .result_out(result_out),

                       .scratchpad_write_addr(scratchpad_write_addr),
                       .scratchpad_wren(scratchpad_wren),
                       .scratchpad_write_data(scratchpad_write_data),

                       .read_src_scratchpad(),
                       .finished(dct_done));


    ice40_ebr #(.addr_width(8), .data_width(16)) scratchpad(.din(scratchpad_write_data),
                                                            .write_en(scratchpad_wren),
                                                            .waddr({3'h0, scratchpad_write_addr}),
                                                            .wclk(clock),
                                                            .raddr({3'h0, scratchpad_read_addr}),
                                                            .rclk(clock),
                                                            .dout(scratchpad_read_data));

    ice40_ebr #(.addr_width(8), .data_width(16)) output_mem(.din(result_out),
                                                            .write_en(result_wren),
                                                            .waddr({5'h0, result_write_addr}),
                                                            .wclk(clock),
                                                            .raddr(8'h0),
                                                            .rclk(1'b0),
                                                            .dout());

    // generate clock
    always
    begin
        #490;
        clock = ~clock;
        #10;
    end

    integer i;
    reg [15:0] scratchpad_result [7:0];
    initial begin
        clock = 'b0;

        $dumpfile("loeffler_dct_8_tb.vcd");
        $dumpvars(0, loeffler_dct_8_tb);

        // strobe reset for a few microseconds

        // let it run for 57 uinstructions with testcase 1
        nreset = 1'b0; #3000;
        $readmemh("dct_testcase_1_in.hex", data_rom.mem);
        nreset = 1'b1;
        while (dct_done == 1'b0) begin
            #1000;
        end
        #1000;
        for (i = 0; i < 8; i = i + 1) begin
            $display("%h", output_mem.mem[i]);
        end
        $writememh("scratchpad_mem_state_1.hex", dct.scratchpad.mem, 0, 23);
        $writememh("output_1.hex", output_mem.mem, 0, 7);

        // let it run for 57 uinstructions with testcase 2
        nreset = 1'b0; #3000;
        $readmemh("dct_testcase_2_in.hex", data_rom.mem);
        nreset = 1'b1;
        while (dct_done == 1'b0) begin
            #1000;
        end
        #1000;
        for (i = 0; i < 8; i = i + 1) begin
            $display("%h", output_mem.mem[i]);
        end
        $writememh("scratchpad_mem_state_2.hex", dct.scratchpad.mem, 0, 23);
        $writememh("output_2.hex", output_mem.mem, 0, 7);

        // let it run for 57 uinstructions with testcase 3
        nreset = 1'b0; #3000;
        $readmemh("dct_testcase_3_in.hex", data_rom.mem);
        nreset = 1'b1;
        while (dct_done == 1'b0) begin
            #1000;
        end
        #1000;
        for (i = 0; i < 8; i = i + 1) begin
            $display("%h", output_mem.mem[i]);
        end
        $writememh("scratchpad_mem_state_3.hex", dct.scratchpad.mem, 0, 23);
        $writememh("output_3.hex", output_mem.mem, 0, 7);

        // check the result
        for (i = 0; i < 8; i = i + 1) begin
            if (dct.scratchpad.mem[i] != scratchpad_result[i]) begin
                $display("bad result at location %d. %h != %h", i, dct.scratchpad.mem[i], scratchpad_result[i]);
            end
        end

        $finish;
    end
endmodule
