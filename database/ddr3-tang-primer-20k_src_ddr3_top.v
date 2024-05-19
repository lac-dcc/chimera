// This program was cloned from: https://github.com/nand2mario/ddr3-tang-primer-20k
// License: Apache License 2.0

//
// DDR3 test top level @ 100Mhz
//

`timescale 1ps /1ps

module ddr3_top
(
    input sys_clk,
    input sys_resetn,

    input d7,

	inout  [15:0] DDR3_DQ,   // 16 bit bidirectional data bus
	inout  [1:0] DDR3_DQS,   // DQ strobe for high and low bytes
	output [13:0] DDR3_A,    // 14 bit multiplexed address bus
	output [2:0] DDR3_BA,    // 3 banks
	output DDR3_nCS,  // a single chip select
	output DDR3_nWE,  // write enable
	output DDR3_nRAS, // row address select
	output DDR3_nCAS, // columns address select
	output DDR3_CK,
	output DDR3_nRESET,
	output DDR3_CKE,
    output DDR3_ODT,
    output [1:0] DDR3_DM,

    output [7:0] led,
    output [7:0] led2,

    output uart_txp
);

reg start = 1'b1;      
`ifdef D7_TO_START
    // switch d7 on to start running
    always @(posedge clk) begin
        if (d7) start <= 1;
        if (~sys_resetn) start <= 0;
    end
`endif

reg rd, wr, refresh;
reg [25:0] addr;
reg [15:0] din;
wire [127:0] dout128;
wire [15:0] dout;

localparam FREQ=99_800_000;

localparam [25:0] START_ADDR = 26'h0;
localparam [25:0] TOTAL_SIZE = 8*1024*1024;       // Test 8MB
//localparam [25:0] TOTAL_SIZE = 32*1024*1024;       // Test 64MB

Gowin_rPLL pll(
    .clkout(clk_x4),    // 398.25 Mhz
    .clkoutp(clk_ck),   // 90-degree shifted
    .lock(lock),        
    .clkoutd(clk),      // 99.56 Mhz
    .clkin(sys_clk)     // 27 Mhz
);

wire [7:0] wstep;
reg [1:0] rclkpos;
reg [2:0] rclksel;
wire [63:0] debug;

ddr3_controller #(.ROW_WIDTH(13), .COL_WIDTH(10)) u_ddr3 (
    .pclk(clk), .fclk(clk_x4), .ck(clk_ck), .resetn(sys_resetn & lock),
	.addr(addr), .rd(rd), .wr(wr), .refresh(refresh),
	.din(din), .dout128(dout128), .dout(dout), .data_ready(data_ready), .busy(busy),
    .write_level_done(write_level_done), .wstep(wstep),       // write leveling status
    .read_calib_done(read_calib_done), .rclkpos(rclkpos), .rclksel(rclksel),        // read calibration status
    .debug(debug),

    .DDR3_nRESET(DDR3_nRESET),
    .DDR3_DQ(DDR3_DQ),      // 16 bit bidirectional data bus
    .DDR3_DQS(DDR3_DQS),    // DQ strobes
    .DDR3_A(DDR3_A),        // 13 bit multiplexed address bus
    .DDR3_BA(DDR3_BA),      // two banks
    .DDR3_nCS(DDR3_nCS),    // a single chip select
    .DDR3_nWE(DDR3_nWE),    // write enable
    .DDR3_nRAS(DDR3_nRAS),  // row address select
    .DDR3_nCAS(DDR3_nCAS),  // columns address select
    .DDR3_CK(DDR3_CK),
    .DDR3_CKE(DDR3_CKE),
    .DDR3_ODT(DDR3_ODT),
    .DDR3_DM(DDR3_DM)
);

localparam INIT = 0;
localparam PRINT_STATUS = 1;
localparam WRITE1 = 2;
localparam WRITE2 = 3;
localparam WRITE3 = 4;
localparam READ_START = 5;
localparam READ = 6;
localparam READ_DONE = 7;
localparam WRITE_BLOCK = 8;
localparam VERIFY_BLOCK = 9;
localparam WIPE = 10;
localparam FINISH = 11;

reg [7:0] state, end_state;
reg [7:0] work_counter; // 10ms per state to give UART time to print one line of message
reg [7:0] latency_write1, latency_write2, latency_read;

reg error_bit;

reg refresh_needed;
reg refresh_executed;   // pulse from main FSM

// 7.8us refresh
reg [11:0] refresh_time;
localparam REFRESH_COUNT=FREQ/1000/1000*7813/1000;       // one refresh every 781 cycles for 100Mhz

always @(posedge clk) begin
    if (state) begin
        refresh_time <= refresh_time == (REFRESH_COUNT*2-2) ? (REFRESH_COUNT*2-2) : refresh_time + 1;
        if (refresh_time == REFRESH_COUNT) 
            refresh_needed <= 1;
        if (refresh_executed) begin
            refresh_time <= refresh_time - REFRESH_COUNT;
            refresh_needed <= 0;
        end
        if (~sys_resetn) begin
            refresh_time <= 0;
            refresh_needed <= 0;
        end
    end
end

reg refresh_cycle;
reg [23:0] refresh_count;
reg [24:0] refresh_addr;

reg [63:0] debug_dq_in_buf [15:0];
reg [3:0] debug_cycle;
reg [19:0] tick_counter;        // 0.01s max
reg tick;
reg result_to_print;            // pulse for print control to print a line of result
reg [15:0] expected, actual;
reg [127:0] actual128;
reg [25:0] addr_read;
reg wlevel_feedback;
reg wlevel_done = 0;
reg rlevel_done = 0;
reg [7:0] read_level_cnt;

// LED module in right-bottom PMOD
assign led = ~{state[3:0], busy, error_bit, read_calib_done, write_level_done}; 
assign led2 = ~wstep;       // for write leveling
//assign led2 = ~{read_calib_done, 2'b0, rclkpos[1:0], rclksel[2:0]};   // for read calib

typedef logic [7:0] BYTE;
typedef logic [25:0] ADDR;

always @(posedge clk) begin
    wr <= 0; rd <= 0; refresh <= 0; refresh_executed <= 0;
    work_counter <= work_counter + 1;
    tick_counter <= tick_counter == 0 ? 0 : tick_counter - 20'd1;
    tick <= tick_counter == 20'd1;

    case (state)
        // wait for busy==0 (controller initialization done)
        INIT: if (lock && sys_resetn && !busy && start) begin
            state <= PRINT_STATUS;
            tick_counter <= 20'd100_000;
        end
        PRINT_STATUS: if (tick) begin
            tick_counter <= 20'd100_000;
            work_counter <= 0;
            addr = START_ADDR;
            state <= WRITE1;
        end

        // Part 1 - single write/read test
        WRITE1: if (tick) begin 
            wr <= 1'b1;
            addr <= 26'h0000;
            din <= 16'h1122;
            work_counter <= 0;
            state <= WRITE2;      /* WRITE2 */
            tick_counter <= 20'd100_000;        // 1ms
        end
        WRITE2: if (tick) begin 
            wr <= 1'b1;
            addr <= 26'h0001;
            din <= 16'h3344;
            work_counter <= 0;
            state <= WRITE3;      /* WRITE2 */
            tick_counter <= 20'd100_000;        // 1ms
        end
        WRITE3: if (tick) begin
            if (busy) error_bit <= 1;
            // record write latency and issue another write command
            latency_write1 <= work_counter[7:0]; 
            wr <= 1'b1;
            addr <= 26'h0002;
            din <= 16'h5566;
            state <= READ_START;
            work_counter <= 0;
            debug_cycle <= 0;
            tick_counter <= 20'd100_000;        // wait 1ms
        end

        READ_START: if (tick) begin
            addr[15:0] <= 16'h0000;
            tick_counter <= 20'd100_000;        // wait 1ms
            state <= READ;
        end
        READ: begin
            result_to_print <= 0;
            if (tick) begin
                // issue one read command every tick
                if (addr[15:0] == 16'h0003) begin
                    tick_counter <= 20'd200_000;    // wait 2ms
                    state <= READ_DONE;
                end else begin
                    rd <= 1'b1;
                    tick_counter <= 20'd200_000;    // wait 2ms
                end
            end else if (data_ready) begin
                actual <= dout;
                actual128 <= dout128;
                addr_read <= addr;
                result_to_print <= 1'b1;
                addr[15:0] <= addr[15:0] + 16'd1;
            end
        end
        READ_DONE: begin
            state <= WIPE;
            work_counter <= 0;
            addr <= START_ADDR;
        end

        // Part 2 - bulk write/read test
        WIPE: begin
            if (addr == ADDR'(START_ADDR + TOTAL_SIZE)) begin
                work_counter <= 0;
                addr <= START_ADDR;
                state <= WRITE_BLOCK;
            end else begin
                if (work_counter == 0) begin
                    if (!refresh_needed) begin
                        wr <= 1'b1;
                        din <= 0;
                        refresh_cycle <= 0;
                    end else begin
                        refresh <= 1'b1;
                        refresh_executed <= 1'b1;
                        refresh_cycle <= 1'b1;
                        refresh_count <= refresh_count + 1;
                        refresh_addr <= addr;
                    end
                end else if (!wr && !refresh && !busy) begin
                    work_counter <= 0;
                    if (!refresh_cycle)
                        addr <= addr + 1;
                end
            end
        end

        WRITE_BLOCK: begin
            // write some data
            if (addr == ADDR'(START_ADDR + TOTAL_SIZE)) begin
                state <= VERIFY_BLOCK;
                work_counter <= 0;
                addr <= START_ADDR;
            end else begin
                if (work_counter == 0) begin
                    if (!refresh_needed) begin
                        wr <= 1'b1;
                        din <= addr[15:0] ^ {6'b0, addr[25:16]} ^ 16'd59;
                        refresh_cycle <= 0;
                    end else begin
                        refresh <= 1'b1;
                        refresh_executed <= 1'b1;
                        refresh_cycle <= 1'b1;
                        refresh_count <= refresh_count + 1;
                        refresh_addr <= addr;
                    end
                end else if (!wr && !refresh && !busy) begin
                    work_counter <= 0;
                    if (!refresh_cycle)
                        addr <= addr + 1;
                end
            end
        end

        VERIFY_BLOCK: begin
            if (addr == ADDR'(START_ADDR + TOTAL_SIZE)) begin
                end_state <= state;
                state <= FINISH;
            end else begin
                if (work_counter == 0) begin
                    // send next read request or refresh
                    if (!refresh_needed) begin
                        rd <= 1'b1;
                        refresh_cycle <= 1'b0;
                    end else begin
                        refresh <= 1'b1;
                        refresh_executed <= 1'b1;
                        refresh_cycle <= 1'b1;
                        refresh_count <= refresh_count + 1;
                        refresh_addr <= addr;
                    end
                end else if (data_ready) begin
                    // verify result
                    expected <= addr[15:0] ^ {6'b0, addr[25:16]} ^ 16'd59;
                    actual <= dout;
                    actual128 <= dout128;
                    if (dout[7:0] != BYTE'(addr ^ {6'b0, addr[25:16]} ^ 16'd59)) begin       // only test lower byte
                        error_bit <= 1'b1;
                        end_state <= state;
                        state <= FINISH;
                    end
                end else if (!rd && !refresh && !busy) begin
                    work_counter <= 0;      // start next read
                    if (!refresh_cycle) begin
                        addr <= addr + 1;
                    end
                end
            end
        end




    endcase

    if (~sys_resetn) begin
        error_bit <= 1'b0;
        tick <= 1'b0;
        tick_counter <= 20'd100_000;        // wait 1ms for everything to initialize
        latency_write1 <= 0; latency_write2 <= 0; latency_read <= 0;
        refresh_count <= 0;
        state <= INIT;
    end
end


`include "print.v"
defparam tx.uart_freq=115200;
defparam tx.clk_freq=FREQ;
assign print_clk = clk;
assign txp = uart_txp;

reg[3:0] state_0;
reg[3:0] state_1;
reg[3:0] state_old;
wire[3:0] state_new = state_1;

reg [7:0] print_counters = 0, print_counters_p;
reg [7:0] print_stat = 0, print_stat_p;

typedef logic [3:0] NIB;

always@(posedge clk)begin
    state_1<=state_0;
    state_0<=state;

    if(state_0==state_1) begin //stable value
        state_old<=state_new;

        if(state_old!=state_new)begin//state changes
            if(state_new==INIT)`print("Initializing SDRAM\n",STR);
          
            if (state_new==PRINT_STATUS) begin
                if (write_level_done && read_calib_done) 
                    `print("Write leveling and read calib successful. \n\n{WSTEP[7:0], rclkpos[3:0], rclksel[3:0]}=", STR);
                else
                    `print("Write leveling or read calibration failed. \n\n{WSTEP[7:0], rclkpos[3:0], rclksel[3:0]}=", STR);
            end

            if(state_new==WRITE1)
                    `print({wstep, NIB'(rclkpos), NIB'(rclksel)}, 2);

            if (state_new==WRITE2) `print("\n\n1 - Single write/read tests:\n", STR);
          
            if(state_new==FINISH) begin
                if(error_bit)
                    `print("\n\n2 - Bulk write/read tests: ERROR. See below for actual dout.\n",STR);
                else
                    `print("\n\n2 - Bulk write/read tests: SUCCESS.\n",STR);
                print_stat <= 1;
            end      
        end
    end

    if (result_to_print) print_counters <= 1'b1;        // trigger result printing

    print_counters_p <= print_counters;
    if (print_counters != 0 && print_counters == print_counters_p && print_state == PRINT_IDLE_STATE) begin
        case (print_counters)
        8'd1: `print("\n", STR);
        8'd2: `print(addr_read[15:0], 2);
        8'd3: `print("=", STR);
        8'd4: `print(actual, 2);
//        8'd4: `print(actual128[127:0], 16);      // print everything for debug
        endcase
        print_counters <= print_counters == 8'd255 ? 0 : print_counters + 1;
    end

    print_stat_p <= print_stat;
    if (print_stat != 0 && print_stat == print_stat_p && print_state == PRINT_IDLE_STATE) begin
        case (print_stat)
        8'd1: `print("\nFinal address=", STR);
        8'd2: `print({6'b0, addr[25:0]}, 4);
        8'd3: `print("\nError=", STR);
        8'd4: `print({7'b0, error_bit}, 1);
        8'd5: `print("\nExpected=", STR);
        8'd6: `print(expected[15:0], 2);
        8'd7: `print("\nActual=", STR);
        8'd8: `print(actual[15:0], 2);
//        8'd10: `print(actual128, 16);
//        8'd17: `print("\nRefresh counts=", STR);
//        8'd18: `print(refresh_count, 3);
//        8'd19: `print("\nLast refresh address=", STR);
//        8'd20: `print(refresh_addr[23:0], 3);
        8'd255: `print("\n\n", STR);
        endcase
        print_stat <= print_stat == 8'd255 ? 0 : print_stat + 1;
    end
end


endmodule

