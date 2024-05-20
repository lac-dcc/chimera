// This program was cloned from: https://github.com/pyamnihc/tt06_um_ks_pyamnihc
// License: Apache License 2.0

`default_nettype none
`timescale 1ns/1ps

module tb();
    initial begin
        $dumpfile("tb.vcd");
        $dumpvars(0,tb);
        #1;
    end

    // SPI param.
    localparam SPI_INST_WIDTH = 1;
    localparam SPI_ADDR_WIDTH = 7;
    localparam SPI_DATA_WIDTH = 8;
    localparam SPI_NUM_CONFIG_REG = 8;
    localparam SPI_NUM_STATUS_REG = 4;

    // I2S param.
    localparam I2S_AUDIO_DW = 8;

    // KS param.
    localparam KS_MAX_LENGTH = 48;
    localparam KS_DATA_WIDTH = 8;
    localparam KS_PRBS_WIDTH = 2;
    localparam KS_EXTN_BITS = 4;
    localparam KS_FRAC_BITS = 4;

    localparam SPI_FRAME_WIDTH = SPI_INST_WIDTH+SPI_ADDR_WIDTH+SPI_DATA_WIDTH;
    localparam USED_ADDR_WIDTH = 3;

    localparam CLK_PERIOD = 62500/16;
    localparam SPI_CLK_PERIOD = 1000000;
    localparam MAX_CLOCKS = 1048576;
    localparam TEST_COUNT = 8;

    localparam SCK_PERIOD = 62500/16;
    localparam WS_PERIOD = 2*AUDIO_DW*SCK_PERIOD;
    localparam MAX_SAMPLES = 32;
    localparam AUDIO_DW = 8;
    
    reg clk, rst_n;
    reg [SPI_DATA_WIDTH-1:0] rand_addr_arr [TEST_COUNT-1:0];
    reg [SPI_DATA_WIDTH-1:0] rand_val_arr [SPI_NUM_CONFIG_REG+SPI_NUM_STATUS_REG-1:0];
    reg [SPI_ADDR_WIDTH-1:0] rand_addr;
    reg [SPI_DATA_WIDTH-1:0] rand_val;
    integer count_i;
    reg fail_flag;

    reg finish;
    
    initial begin
        clk = 0;
    end
    always #(CLK_PERIOD/2) clk = !clk;

    initial begin
        finish = 0;
        rst_n = 1;
        #(10*CLK_PERIOD) init_design();
        #(10*CLK_PERIOD) init_spi();
        #(10*CLK_PERIOD) prbs_init();
        spi_read(0);
        $display("regmap reset val 0x%0h", spi_read_data);
        // test_immediate_write_read();
        // test_all_write_then_all_read();
        #(10*CLK_PERIOD) init_ks_string();
        #(10*CLK_PERIOD) set_ks_period(30);
        #(10*CLK_PERIOD) pluck_ks_string();
        #(10*CLK_PERIOD) spi_read(8);
        #(10*CLK_PERIOD) spi_read(9);


        #(MAX_CLOCKS*CLK_PERIOD) finish = 1;
        // #(32*CLK_PERIOD)    $finish;
    end

    reg [I2S_AUDIO_DW-1:0] sd_buffer, recv_l_data, recv_r_data;
    initial begin 
        sd_buffer = 0;
    end
    always @(posedge i2s_sck) begin
        sd_buffer <= {sd_buffer[I2S_AUDIO_DW-2:0], i2s_sd};
    end
    
    reg wsd[1:0];
    always @(posedge i2s_sck) begin
        wsd[0] <= i2s_ws;
        wsd[1] <= wsd[0];
    end
    
    wire wsp;
    assign wsp = wsd[0] ^ wsd[1];

    reg [31:0] sample_count;
    initial begin
        sample_count = 0;
    end
    always @(negedge i2s_sck) begin
        if (wsp == 1'b1) begin
            sample_count <= sample_count + 1;
            if (i2s_ws == 1'b1) begin
                recv_l_data <= sd_buffer;
//                $display("recv: 0x%0h", recv_l_data);

            end else if (i2s_ws == 1'b0) begin
                recv_r_data <= sd_buffer;
//                $display("recv: 0x%0h", recv_r_data);
            end
        end else if (sample_count >= MAX_SAMPLES) finish = 1;
    end

    reg [63:0] clk_count;
    initial clk_count = 0;
    always @(posedge clk) begin
        clk_count <= clk_count + 1;
    end
    
    reg sck_i, cs_ni;
    wire sdi_i, sdo_o;
    wire i2s_sck, i2s_ws;
    wire i2s_sd;

    // wire up the inputs and outputs
    // reg  clk;
    // reg  rst_n;
    reg  ena;
    wire  [7:0] ui_in;
    assign ui_in = 8'h00;
    wire  [7:0] uio_in;

    wire [6:0] segments = uo_out[6:0];
    wire [7:0] uo_out;
    wire [7:0] uio_out;
    wire [7:0] uio_oe;

    tt_um_ks_pyamnihc tt_um_ks_pyamnihc (
    // include power ports for the Gate Level test
    `ifdef GL_TEST
        .VPWR( 1'b1),
        .VGND( 1'b0),
    `endif
        .ui_in      (ui_in),    // Dedicated inputs
        .uo_out     (uo_out),   // Dedicated outputs
        .uio_in     (uio_in),   // IOs: Input path
        .uio_out    (uio_out),  // IOs: Output path
        .uio_oe     (uio_oe),   // IOs: Enable path (active high: 0=input, 1=output)
        .ena        (ena),      // enable - goes high when design is selected
        .clk        (clk),      // clock
        .rst_n      (rst_n)     // not reset
        );

    assign uio_in[0] = sck_i;
    assign uio_in[1] = sdi_i;
    assign sdo_o = uio_out[2];
    assign uio_in[3] = cs_ni;
    assign i2s_sck = uio_out[4];
    assign i2s_ws = uio_out[5];
    assign i2s_sd = uio_out[6];
    
    assign uio_oe = 8'b1100_0100;

// tasks
    task init_design ();
        begin
            #(32*CLK_PERIOD) rst_n = 1;
            #(32*CLK_PERIOD) rst_n = 0;
            #(32*CLK_PERIOD) rst_n = 1;
        end
    endtask

    task init_spi();
        begin
            #(32*CLK_PERIOD)    cs_ni = 1;
                                sck_i = 0;
            #(32*CLK_PERIOD) spi_write(0, 8'h00);
        end
    endtask
    
    assign sdi_i = spi_write_frame[SPI_FRAME_WIDTH-1];
    reg [SPI_FRAME_WIDTH-1:0] spi_write_frame;
    task spi_write (
        input [SPI_ADDR_WIDTH-1:0] addr,
        input [SPI_DATA_WIDTH-1:0] data
    );
        begin
            spi_write_frame = {1'b0, addr, data};
            #(10*CLK_PERIOD)    cs_ni = 0;
                                sck_i = 0;

            repeat(2*(SPI_FRAME_WIDTH)) begin
                #(SPI_CLK_PERIOD/2) sck_i = !sck_i;
                if (sck_i == 0) spi_write_frame = {spi_write_frame[SPI_FRAME_WIDTH-2:0], spi_write_frame[SPI_FRAME_WIDTH-1]};
            end

            #(SPI_CLK_PERIOD/2) cs_ni = 1;
        end
    endtask
   
    reg [SPI_FRAME_WIDTH-1:0] spi_read_frame;
    wire [SPI_DATA_WIDTH-1:0] spi_read_data;
    assign spi_read_data = spi_read_frame[SPI_DATA_WIDTH-1:0];
    task spi_read (
        input [SPI_ADDR_WIDTH-1:0] addr
    );
        begin
            spi_write_frame = {1'b1, addr, 8'b0};
            spi_read_frame = 'b0;
            #(32*CLK_PERIOD)    cs_ni = 0;
                                sck_i = 0;

            repeat(2*(SPI_FRAME_WIDTH)) begin
                #(SPI_CLK_PERIOD/2) sck_i = !sck_i;
                if (sck_i == 0) spi_write_frame = {spi_write_frame[SPI_FRAME_WIDTH-2:0], spi_write_frame[SPI_FRAME_WIDTH-1]};
                if (sck_i == 1) spi_read_frame = {spi_read_frame[SPI_FRAME_WIDTH-2:0], sdo_o};
            end

            #(SPI_CLK_PERIOD/2) cs_ni = 1;
        end
    endtask

// prbs test
    reg [31:0] prbs_sample_reg;
    task prbs_init ();
        begin
            // reset prbs
            #(32*CLK_PERIOD) spi_write(0, 8'h00);
            #(32*CLK_PERIOD) spi_write(0, 8'h03);
            #(32*CLK_PERIOD) spi_write(0, 8'h00);
            
            // load prbs
            // prbs_15
            #(32*CLK_PERIOD) spi_write(1, 8'h00);
            #(32*CLK_PERIOD) spi_write(2, 8'h00);
            #(32*CLK_PERIOD) spi_write(2, 8'h80);
            #(32*CLK_PERIOD) spi_write(2, 8'h00);


            // prbs_7
            #(32*CLK_PERIOD) spi_write(3, 8'h00);
            #(32*CLK_PERIOD) spi_write(3, 8'h80);
            #(32*CLK_PERIOD) spi_write(3, 8'h00);

            #(32*CLK_PERIOD) prbs_sample_reg = 0;
            repeat(32) begin
                @(posedge i2s_ws) prbs_sample_reg = {prbs_sample_reg[30:0], uio_out[7]};
            end
            $display("prbs sample: %0b", prbs_sample_reg);
        end
    endtask

// register map test
    task test_immediate_write_read ();
        begin
            fail_flag = 0;
            // immediate write and read
            for (count_i = 0; count_i < TEST_COUNT; count_i = count_i + 1) begin
                rand_addr = {$random} % (1 << USED_ADDR_WIDTH);
                rand_addr = rand_addr | 1;
                rand_val = {$random} % (1 << SPI_DATA_WIDTH);
                rand_val = {$random} % (1 << SPI_DATA_WIDTH);

                if (rand_addr < SPI_NUM_CONFIG_REG) begin
                    #(32*CLK_PERIOD) spi_write(rand_addr, rand_val);
                end else begin
                    if (rand_addr < SPI_NUM_CONFIG_REG + SPI_NUM_STATUS_REG/2) rand_val = 8'h00;
                    else if ((rand_addr >= SPI_NUM_CONFIG_REG + SPI_NUM_STATUS_REG/2) &&
                                (rand_addr < SPI_NUM_CONFIG_REG + SPI_NUM_STATUS_REG)) rand_val = 8'hff;
                    else rand_val = 8'bXXXX_XXXX;
                end

                #(32*CLK_PERIOD) spi_read(rand_addr);
                $display("addr: 0x%0h, val: 0x%0h, read val: 0x%0h", rand_addr, rand_val, spi_read_data);
                if (spi_read_data != rand_val) begin
                    $display("Immediate write and read failed for addr: ",
                                "0x%0h, data: 0x%0h, readback: 0x%0h", rand_addr, rand_val, spi_read_data);
                    fail_flag = 1;
                end
            end
            if (fail_flag == 0) begin
                $display("SUCCESS:Immediate write and read");
            end
        end
    endtask

    task test_all_write_then_all_read ();
        begin
            fail_flag = 0;
            // all write then all read
            for (count_i = 0; count_i < TEST_COUNT; count_i = count_i + 1) begin
                rand_addr = {$random} % (1 << USED_ADDR_WIDTH);
                rand_addr = rand_addr | 1;
                rand_val = {$random} % (1 << SPI_DATA_WIDTH);

                if (rand_addr < SPI_NUM_CONFIG_REG) begin
                    #(32*CLK_PERIOD) spi_write(rand_addr, rand_val);
                end else begin
                    if (rand_addr < SPI_NUM_CONFIG_REG + SPI_NUM_STATUS_REG/2) rand_val = 8'h00;
                    else if ((rand_addr >= SPI_NUM_CONFIG_REG + SPI_NUM_STATUS_REG/2) &&
                                (rand_addr < SPI_NUM_CONFIG_REG + SPI_NUM_STATUS_REG)) rand_val = 8'hff;
                      else rand_val = 8'bXXXX_XXXX;
                end
                rand_addr_arr[count_i] = rand_addr;
                rand_val_arr[rand_addr] = rand_val;

                $display("addr: 0x%0h, val: 0x%0h", rand_addr, rand_val);
            end
            for (count_i = 0; count_i < TEST_COUNT; count_i = count_i + 1) begin
                #(32*CLK_PERIOD) spi_read(rand_addr_arr[count_i]);
                $display("read val: 0x%0h", spi_read_data);

                if (spi_read_data != rand_val_arr[rand_addr_arr[count_i]]) begin
                        $display("all write followed by all read failed for", 
                                    " addr: 0x%0h, readback: 0x%0h", 
                                    rand_addr_arr[count_i], spi_read_data);
                        fail_flag = 1;
                end
            end
            if (fail_flag == 0) begin
                $display("SUCCESS:all write followed by all read");
            end
        end
    endtask

// KS Test
    task init_ks_string ();
        begin
            #(32*CLK_PERIOD) spi_write(4, 8'h00);
            #(32*CLK_PERIOD) spi_write(5, 8'h00);
            #(32*CLK_PERIOD) spi_write(6, 8'h00);
            #(32*CLK_PERIOD) set_ks_period(KS_MAX_LENGTH);

            #(32*CLK_PERIOD) spi_write(0, 8'h00);
            #(32*CLK_PERIOD) spi_write(0, 8'h04);
            #(32*CLK_PERIOD) spi_write(0, 8'h00);

            // enable direct prbs output
            // #(32*CLK_PERIOD) spi_write(0, 8'h80);
        end
    endtask

    task set_ks_period (
        input [KS_DATA_WIDTH-1:0] ks_period
    );
        begin
            #(32*CLK_PERIOD) spi_write(7, ~ks_period);
        end
    endtask
    
    task pluck_ks_string ();
        begin
            #(32*CLK_PERIOD) spi_write(4, 8'h00);
            #(32*CLK_PERIOD) spi_write(4, 8'h01);
            #(32*CLK_PERIOD) spi_write(4, 8'h00);
        end
    endtask


endmodule
