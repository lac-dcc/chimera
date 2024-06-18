// This program was cloned from: https://github.com/johnMamish/jfpjc
// License: MIT License

`timescale 1ns/100ps

module loeffler_dct_88_tb();
    reg clock;
    reg nreset;


    wire [7:0] fetch_data;
    wire [5:0] fetch_addr;

    wire [15:0] result_out;
    wire  [5:0] result_write_addr;
    wire        result_wren;
    wire        result_clk;

    wire dct_finished;

    // memory holding the 64 (int8_t) elements that we want to take the dct of.
    ice40_ebr #(.addr_width(9), .data_width(8))  data_rom (.din(8'h00),
                                                           .write_en(1'b0),
                                                           .waddr(9'h00),
                                                           .wclk(1'b0),

                                                           .raddr({ 3'h0, fetch_addr }),
                                                           .rclk(clock),
                                                           .dout(fetch_data));

    loeffler_dct_88 dct_88(.clock(clock),
                           .nreset(nreset),

                           .fetch_addr(fetch_addr),
                           .src_data_in(fetch_data),

                           .result_write_addr(result_write_addr),
                           .result_wren(result_wren),
                           .result_out(result_out),

                           .finished(dct_finished));

    ice40_ebr #(.addr_width(8), .data_width(16)) output_mem(.din(result_out),
                                                            .write_en(result_wren),
                                                            .waddr({2'h0, result_write_addr}),
                                                            .wclk(clock),
                                                            .raddr(8'h0),
                                                            .rclk(1'b0),
                                                            .dout());

    // generate clock
    always begin
        #490;
        clock = ~clock;
        #10;
    end

    integer i;
    initial begin
        clock = 'b0;

        $dumpfile("loeffler_dct_88_tb.vcd");
        $dumpvars(0, loeffler_dct_88_tb);

        for (i = 0; i < 256; i = i + 1) begin
            //dct_88.tempmem.mem[i] = 16'hf10f;
            dct_88.tempmem.mem[i] = 16'hxxxx;
        end

        nreset = 1'b0; #3000;
        nreset = 1'b1;
        $readmemh("dct88_testcase_2_in.hex", data_rom.mem);
        while (dct_finished != 1'b1) begin
            #1000;
        end
        #1000;

        $writememh("scratchpad_mem_state_1.hex", dct_88.tempmem.mem, 0, 96);
        $writememh("output_2.hex", output_mem.mem, 0, 64);

        for (i = 0; i < 64; i = i + 1) begin
            $write("%h, ", output_mem.mem[i]);
            if ((i % 8) == 7) begin
                $write("\n");
            end
        end

        $finish;
    end
endmodule
