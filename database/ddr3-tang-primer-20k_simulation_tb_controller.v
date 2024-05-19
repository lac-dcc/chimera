// This program was cloned from: https://github.com/nand2mario/ddr3-tang-primer-20k
// License: Apache License 2.0

//
// Test bench of ddr3_controller.v with Micro DDR3 model
// nand2mario, 2022.9
// 

`timescale 1ps / 1ps

module tb;

    // sg125=DDR3-1600
    `define sg125
    `include "1024Mb_ddr3_parameters.vh"

    // DDR3 ports
    reg                         rst_n;
    reg                         ck;
    wire                        ck_n = ~ck;
    wire                        cke;
    wire                        cs_n;
    wire                        ras_n;
    wire                        cas_n;
    wire                        we_n;
    wire           [BA_BITS-1:0] ba;
    wire         [ADDR_BITS-1:0] a;
    wire          [DM_BITS-1:0] dm;
    wire          [DQ_BITS-1:0] dq;
    wire         [DQS_BITS-1:0] dqs;
    wire         [DQS_BITS-1:0] dqs_n = ~dqs;
    wire         [DQS_BITS-1:0] tdqs_n = 2'bzz;
    wire                        odt;

    // Controller ports
    reg             pclk;       // 100Mhz primary clock
    reg             fclk;       // 400Mhz fast clock
    reg [25:0]      addr;
    reg             rd, wr, refresh;    // command pins
    reg [15:0]      din;
    wire [15:0]     dout;
    wire            data_ready, busy;

    real                        tck;
    reg     [(AL_MAX+CL_MAX):0] odt_fifo;

    wire [7:0]      wstep;
    wire [1:0]      rclkpos;
    wire [2:0]      rclksel;
    wire            wlevel_done;
    wire            rcalib_done;

    wire ddr_nrst;
    wire ddr_ck;

    // Micron DDR3 memory module
    ddr3 sdramddr3_0 (
        ddr_nrst, ddr_ck, ~ddr_ck, cke, 
        cs_n, ras_n, cas_n, we_n, 
        dm, ba, a, dq, dqs, dqs_n,
        tdqs_n, odt
    );

    // Our DDR3 controller, main clock=200Mhz, memory clock(x2)=400Mhz, DDR3-800
    ddr3_controller #(/*.FREQ(200_000_000),*/ .ROW_WIDTH(13), .COL_WIDTH(10)) u_sdram (
        .pclk(pclk), .fclk(fclk), .ck(ck), .resetn(rst_n),
        .addr(addr), .rd(rd), .wr(wr), .refresh(refresh),
        .din(din), .dout(dout), .data_ready(data_ready), .busy(busy),
        .write_level_done(wlevel_done), .wstep(wstep), 
        .read_calib_done(rcalib_done), .rclkpos(rclkpos), .rclksel(rclksel), 

        .DDR3_nRESET(ddr_nrst),
        .DDR3_CK(ddr_ck),
        .DDR3_CKE(cke),

        .DDR3_nCS(cs_n),    // a single chip select
        .DDR3_nRAS(ras_n),  // row address select
        .DDR3_nCAS(cas_n),  // columns address select
        .DDR3_nWE(we_n),    // write enable

        .DDR3_DM(dm),
        .DDR3_BA(ba),      // two banks
        .DDR3_A(a),        // 13 bit multiplexed address bus
        .DDR3_DQ(dq),      // 16 bit bidirectional data bus
        .DDR3_DQS(dqs),    // DQ strobes

        .DDR3_ODT(odt)
    );

    //
    // clock initialization and generation
    //
    initial begin
        $timeformat (-9, 1, " ns", 1);
        tck <= 2500;                // DDR-800, tck = 2.5ns
        // tck <= 1875;                // DDR-1066, tck = 1.875ns
        fclk <= 1'b1;               // fclk is 400Mhz
        ck <= 1'b1;                 // ck is 90-degree shifted fclk
        pclk <= 1'b1;               // pclk is 100Mhz
        odt_fifo <= 0;

        forever begin
            #(tck/4) ck = ~ck;
            #(tck/4) fclk = ~fclk;
            #(tck/4) ck = ~ck;
            #(tck/4) fclk = ~fclk;
            #(tck/4) ck = ~ck;
            #(tck/4) fclk = ~fclk;
            #(tck/4) ck = ~ck;
            #(tck/4) fclk = ~fclk;
            pclk = ~pclk;
        end
    end

    initial begin
    end
    //
    // functions and tasks
    //
    function integer ceil;
        input number;
        real number;
        if (number > $rtoi(number))
            ceil = $rtoi(number) + 1;
        else
            ceil = number;
    endfunction

    function integer max;
        input arg1;
        input arg2;
        integer arg1;
        integer arg2;
        if (arg1 > arg2)
            max = arg1;
        else
            max = arg2;
    endfunction

    task test_done;
        begin
            $display ("%m at time %t: INFO: Simulation is Complete", $time);
            $finish(0);
        end
    endtask

    task write(input [26:0] a, input [15:0] v);
        begin
            wait(busy == 1'b0);
            @ (posedge pclk);
            wr <= 1'b1;
            addr <= a;
            din <= v;

            @ (posedge pclk);
            wr <= 1'b0;
            @ (posedge pclk);
        end
    endtask

    time start_time;
    task verify(input [26:0] a, input [15:0] expected);
        begin
            wait(busy == 1'b0);
            @ (posedge pclk);
            rd <= 1'b1;
            addr <= a;
            
            @ (posedge pclk);
            rd <= 1'b0;

            start_time <= $time;
            #0.01 wait(data_ready == 1'b1 || $time > start_time + 200_000);        // timeout is 200ns
            // if (rburst) begin
            //     $display("RBURST=1");
            //     if (~data_ready)
            //         wait(data_ready == 1'b1 || $time > start_time + 200_000);
            // end
            @ (posedge pclk);
            $display("READ: dout=%h, data_ready=%d, time=%d", dout, data_ready, $time);
            if (dout != expected)
                $display("ERROR: mismatch, expecting %h", expected);
        end
    endtask

    integer i, j;

    initial begin : test
        $dumpfile("controller.vcd");
        $dumpvars(0, tb);

        $display("Powering up and reset the controller");
        rst_n <= 1'b0;
        rd <= 1'b0; wr <= 1'b0; refresh <= 1'b0;
        # (10000);      // 10ns reset pulse
        @ (negedge ck) rst_n = 1'b1;

        // write 16'h1234 to address 25'h000_1000
        write(26'h1000, 16'h1234);
        write(26'h1001, 16'h5678);
        write(26'hf0000, 16'h8765);
        write(26'hf0008, 16'habcd);

        verify(26'h1000, 16'h1234);
        verify(26'h1001, 16'h5678);
        verify(26'hf0008, 16'habcd);
        verify(26'hf0000, 16'h8765);

        // Do reading calibration
        // for (i = 1; i < 3; i++) begin       // 1, 2
        //     for (j = 0; j < 8; j++) begin
        //         $display("Reading with rclkpos=%d, rclksel=%d", i, j);
        //         set_read_timing(i,j);
        //         verify(26'h1000, 16'h1234);
        //         # (50_000);     // wait 5 pclk cycles
        //     end
        // end

        # (50_000);     // keep running for 50ns

        // we are all done
        test_done;

    end

endmodule
