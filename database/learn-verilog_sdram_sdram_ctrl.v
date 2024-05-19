// This program was cloned from: https://github.com/michaelliao/learn-verilog
// License: GNU General Public License v3.0

/******************************************************************************

SDRAM controller

SDRAM FSM:

                   ┌─────────────┐
                   │   POWERUP   │
                   └─────────────┘
                          │
                          ▼
                   ┌─────────────┐
                   │  PRECHARGE  │
                   └─────────────┘
                          │
                          ▼
                   ┌─────────────┐
                   │AUTO_REFRESH │──┐ x8
                   └─────────────┘◀─┘
                          │
                          ▼
                   ┌─────────────┐
                   │   MR_SET    │
                   └─────────────┘
                          │
                          ▼
                   ┌─────────────┐
                   │  INIT_END   │
                   └─────────────┘
                          │
                          ▼
┌─────────────┐    ┌─────────────┐       ┌─────────────┐
│   ACTIVE    │◀───│    IDLE     │──────▶│   ACTIVE    │
└─────────────┘ ┌─▶└─────────────┘◀────┐ └─────────────┘
       │        │    ▲        │        │        │
       ▼        │    │        ▼        │        ▼
┌─────────────┐ │    │ ┌─────────────┐ │ ┌─────────────┐
│   READ_A    │─┘    │ │  PRECHARGE  │ └─│   WRITE_A   │
└─────────────┘      │ └─────────────┘   └─────────────┘
                     │        │
                     │        ▼
                   ┌─────────────┐
                   │AUTO_REFRESH │
                   └─────────────┘

******************************************************************************/

module sdram_ctrl #(
    parameter CLK = 100_000_000, // default to 100 MHz
    parameter IO_DATA_WIDTH = 32, // input / output data width: 16, 32, 64, default to 32.
    parameter SDR_DATA_WIDTH = 16, // data width: 8 / 16, default to 16
    parameter SDR_BA_WIDTH = 2, // bank width, default to 2
    parameter SDR_ROW_WIDTH = 13, // row width, default to 13
    parameter SDR_COL_WIDTH = 9, // col width, default to 9
    parameter SDR_INIT_AREF_COUNT = 8, // auto refresh count when init: 1 ~ 15, default to 8
    parameter SDR_CL = 3, // CAS Latency: 1, 2, 3
    parameter SDR_TPOWERUP = 200_000, // SDR_tPowerUp = 200 us, wait time for power up
    parameter SDR_TRCD = 20, // tRCD = 20 ns, wait time for active
    parameter SDR_TRP = 20, // tRP = 20 ns, wait time for precharge
    parameter SDR_TRFC = 70, // tRFC = 70 ns, wait time for auto refresh
    parameter SDR_REFRESH_CYCLE_TIME = 64_000_000 // refresh cycle = 64 ms, change only for test
)
(
    input clk,
    input clk_for_sdr,
    input rst_n,
    inout [SDR_DATA_WIDTH-1:0] inout_data, // SDRAM数据线

    input [31:0] in_addr, // 读写请求地址，需对齐

    input in_rd_req, // 读请求信号
    output out_rd_ack, // 已接受读请求(读输入采样已完成)
    output [IO_DATA_WIDTH-1:0] out_rd_data, // 读数据输出
    output out_rd_done, // 读数据输出有效

    input in_wr_req, // 写请求信号
    input [IO_DQM_WIDTH-1:0] in_wr_dqm, // 写字节掩码输入
    input [IO_DATA_WIDTH-1:0] in_wr_data, // 写数据输入
    output [SDR_DQM_WIDTH-1:0] out_wr_dqm, // 写字节掩码输出至SDR
    output out_wr_ack, // 已接受写请求(写输入采样已完成)
    output out_wr_done, // 写数据完成

    output sdr_clk,
    output reg [3:0] cmd,
    output reg [SDR_BA_WIDTH-1:0] ba, // bank
    output reg [SDR_ROW_WIDTH-1:0] addr
);

    // SDRAM command: CS#, RAS#, CAS#, WE#
    localparam
        SDR_OP_LOAD_MR    = 4'b0000, // 0
        SDR_OP_AUTO_REF   = 4'b0001, // 1
        SDR_OP_PRECHARGE  = 4'b0010, // 2
        SDR_OP_ACTIVE     = 4'b0011, // 3
        SDR_OP_WRITE      = 4'b0100, // 4
        SDR_OP_READ       = 4'b0101, // 5
        SDR_OP_BURST_TERM = 4'b0110, // 6
        SDR_OP_NOP        = 4'b0111; // 7

    // ba / addr min / max value: b00...0, b11...1:
    localparam
        SDR_BA_MIN = {SDR_BA_WIDTH{1'b0}},
        SDR_BA_MAX = {SDR_BA_WIDTH{1'b1}},
        SDR_ADDR_MIN = {SDR_ROW_WIDTH{1'b0}},
        SDR_ADDR_MAX = {SDR_ROW_WIDTH{1'b1}};

    // address 地址到 BA / ROW / COL 的映射:
    localparam
        IGNORE_LOWER_BITS = SDR_DATA_WIDTH / 8 - 1,
        COL_L = IGNORE_LOWER_BITS,
        COL_H = COL_L + SDR_COL_WIDTH - 1,
        ROW_L = COL_H + 1,
        ROW_H = ROW_L + SDR_ROW_WIDTH - 1,
        BA_L = ROW_H + 1,
        BA_H = BA_L + SDR_BA_WIDTH - 1;

    // Data mask width:
    localparam
        IO_DQM_WIDTH = IO_DATA_WIDTH / 8,
        SDR_DQM_WIDTH = SDR_DATA_WIDTH / 8;

    // RW count:
    localparam SDR_RW_DATA_COUNT = 32 / SDR_DATA_WIDTH;

    // how many rows should be refreshed in 64 ms:
    localparam SDR_ROWS_COUNT = 1 << SDR_ROW_WIDTH;

    // time in ns per 1 clock cycle:
    localparam TIME_PER_CLK = 1_000_000_000 / CLK;

    localparam
        CLK_POWER_UP = SDR_TPOWERUP / TIME_PER_CLK, // power up clock cycles
        CLK_TRP = SDR_TRP / TIME_PER_CLK, // tRP clock cycles
        CLK_TRFC = SDR_TRFC / TIME_PER_CLK, // tRFC clock cycles
        CLK_TRCD = SDR_TRCD / TIME_PER_CLK, // tRCD clock cycles
        CLK_TMRD = 2, // tMRD clock cycles
        CLK_BUFFER = 10; // a buffer clock cycles

    localparam SDR_MR_CAS_LATENCY = SDR_CL == 1 ? 3'b001 :
                                   (SDR_CL == 2 ? 3'b010 :
                                   (SDR_CL == 3 ? 3'b011 : 3'b011));

    // set SDR_MR_BURST_LENGTH by clocks of RW:
    localparam SDR_MR_BURST_LENGTH = SDR_RW_DATA_COUNT == 1 ? 3'b000 :
                                    (SDR_RW_DATA_COUNT == 2 ? 3'b001 :
                                    (SDR_RW_DATA_COUNT == 4 ? 3'b010 :
                                    (SDR_RW_DATA_COUNT == 8 ? 3'b011 : 3'b111)));

    // aref count range:
    localparam CNT_AREF_REQ_MAX = SDR_REFRESH_CYCLE_TIME / TIME_PER_CLK / SDR_ROWS_COUNT - CLK_TRP - 2 * CLK_TRFC - CLK_BUFFER;

    localparam
        CNT_0 = 8'b0,
        CNT_1 = 8'b1,
        CNT_AREF_REQ_0 = 13'b0;

    localparam
        // init status:
        STATE_INIT_POWERUP      = 4'h1,
        STATE_INIT_PRECHARGE    = 4'h2,
        STATE_INIT_AUTO_REFRESH = 4'h3,
        STATE_INIT_MR_SET       = 4'h4,
        STATE_INIT_END          = 4'h5,
        // aref status:
        STATE_AREF_PRECHARGE    = 4'h6,
        STATE_AREF_AUTO_REFRESH = 4'h7,
        STATE_AREF_DONE         = 4'h8,
        // write status:
        STATE_WR_ACTIVE         = 4'h9,
        STATE_WR_WRITE_A        = 4'ha,
        // read status:
        STATE_RD_ACTIVE         = 4'hb,
        STATE_RD_READ_A         = 4'hc,
        // idle state:
        STATE_IDLE              = 4'h0;

    // read write cache:
    reg [31:0] addr_cache;
    reg [IO_DATA_WIDTH-1:0] rd_full_data_cache;
    reg [SDR_DATA_WIDTH-1:0] rd_data_cache;
    reg [IO_DATA_WIDTH-1:0] wr_full_data_cache;
    reg [SDR_DATA_WIDTH-1:0] wr_data_cache;
    reg [IO_DQM_WIDTH-1:0] wr_dqm_cache;
    reg [SDR_DQM_WIDTH-1:0] wr_dqm_out;
    reg wr_en;
    reg rd_en;

    // sdram clock:
    assign sdr_clk = clk_for_sdr;

    assign inout_data = wr_en ? wr_data_cache : {SDR_DATA_WIDTH{1'bz}};
    assign out_wr_dqm = wr_en ? wr_dqm_out : {SDR_DQM_WIDTH{1'b0}};
    assign out_rd_done = rd_en;
    assign out_rd_data = rd_en ? rd_full_data_cache : {SDR_DATA_WIDTH{1'b0}};

    // fsm state:
    reg [3:0] state;

    // set to 1 when init done:
    reg flag_init_end;

    // shared cnt: 0 ~ 255:
    reg [7:0] cnt;

    // init阶段 powerup 计数 0 ~ 20_000:
    reg [15:0] cnt_init_powerup;

    // init阶段 auto_fefresh 计数:
    reg [3:0] cnt_init_aref;

    // 0 ~ 1: auto refresh count
    reg cnt_aref;

    // aref counter for 0 ~ 8191:
    reg [12:0] cnt_aref_req;

    // aref request signal:
    reg aref_req;

    // fsm:
    always @ (posedge clk or negedge rst_n) begin
        if (! rst_n) begin
            state <= STATE_INIT_POWERUP;
            cnt_init_powerup <= 16'b0;
            cnt <= CNT_0;
            wr_en <= 1'b0;
            rd_en <= 1'b0;
        end else begin
            case (state)
                // idle status ////////////////////////////////////////////////

                STATE_IDLE: begin
                    if (aref_req == 1'b1) begin
                        // 请求刷新=1时进入 AREF_PRECHARGE 状态:
                        state <= STATE_AREF_PRECHARGE;
                        cnt <= CNT_0;
                    end else if (in_rd_req == 1'b1) begin
                        // 请求读=1时进入读状态:
                        state <= STATE_RD_ACTIVE;
                        cnt <= CNT_0;
                        // 输入数据采样:
                        addr_cache <= in_addr;
                    end else if (in_wr_req == 1'b1) begin
                        // 请求写=1时进入写状态:
                        state <= STATE_WR_ACTIVE;
                        cnt <= CNT_0;
                        // 输入数据采样:
                        addr_cache <= in_addr;
                        wr_full_data_cache <= in_wr_data;
                        wr_dqm_cache <= in_wr_dqm;
                    end
                end

                // read status ////////////////////////////////////////////////

                STATE_RD_ACTIVE: begin
                    // 等待 CLK_TRCD 个时钟后进入 READ_A 状态:
                    if (cnt == CLK_TRCD) begin
                        state <= STATE_RD_READ_A;
                        cnt <= CNT_0;
                    end else begin
                        cnt <= cnt + 1;
                    end
                end

                STATE_RD_READ_A: begin
                    // 读取延迟 SDR_CL + 读取次数 SDR_RW_DATA_COUNT
                    if (cnt >= SDR_CL - 1 && cnt < (SDR_CL - 1 + SDR_RW_DATA_COUNT)) begin
                        // 读入高位:
                        rd_full_data_cache[IO_DATA_WIDTH - 1 : IO_DATA_WIDTH - SDR_DATA_WIDTH] <= inout_data;
                        if (IO_DATA_WIDTH > SDR_DATA_WIDTH) begin
                            rd_full_data_cache[IO_DATA_WIDTH - SDR_DATA_WIDTH - 1 : 0] <= rd_full_data_cache[IO_DATA_WIDTH - 1 : SDR_DATA_WIDTH];
                        end
                    end
                    if (cnt == (SDR_CL - 1 + SDR_RW_DATA_COUNT)) begin
                        rd_en <= 1'b1;
                    end else if (cnt == (SDR_CL + SDR_RW_DATA_COUNT)) begin
                        rd_en <= 1'b0;
                    end
                    // 下一个状态:
                    if (cnt == (SDR_CL + SDR_RW_DATA_COUNT + CLK_TRP - 2)) begin
                        state <= STATE_IDLE;
                    end else begin
                        cnt <= cnt + 1;
                    end
                end

                // write status ////////////////////////////////////////////////

                STATE_WR_ACTIVE: begin
                    // 等待 CLK_TRCD 个时钟后进入 WRITE_A 状态:
                    if (cnt == CLK_TRCD - 1) begin
                        state <= STATE_WR_WRITE_A;
                        cnt <= CNT_0;
                        // 在下一个状态 WRITE_A 之前准备好写入数据:
                        wr_en <= 1'b1;
                        wr_data_cache <= wr_full_data_cache[SDR_DATA_WIDTH-1:0];
                        wr_dqm_out <= wr_dqm_cache[SDR_DQM_WIDTH-1:0];
                        if (IO_DATA_WIDTH > SDR_DATA_WIDTH) begin
                            // 向右移位以便下次继续写入低位:
                            wr_full_data_cache <= wr_full_data_cache >> SDR_DATA_WIDTH;
                            wr_dqm_cache <= wr_dqm_cache >> SDR_DQM_WIDTH;
                        end
                    end else begin
                        cnt <= cnt + 1;
                    end
                end

                STATE_WR_WRITE_A: begin
                    // 写入次数 SDR_RW_DATA_COUNT + precharge时间 CLK_TRP:
                    if (cnt == (SDR_RW_DATA_COUNT + CLK_TRP - 1)) begin
                        state <= STATE_IDLE;
                    end else begin
                        // 写入低位:
                        if (cnt < SDR_RW_DATA_COUNT) begin
                            wr_data_cache <= wr_full_data_cache[SDR_DATA_WIDTH-1:0];
                            wr_dqm_out <= wr_dqm_cache[SDR_DQM_WIDTH-1:0];
                            if (IO_DATA_WIDTH > SDR_DATA_WIDTH) begin
                                // 向右移位以便下次继续写入低位:
                                wr_full_data_cache <= wr_full_data_cache >> SDR_DATA_WIDTH;
                                wr_dqm_cache <= wr_dqm_cache >> SDR_DQM_WIDTH;
                            end
                        end
                        if (cnt == SDR_RW_DATA_COUNT - 1) begin
                            wr_en <= 1'b0;
                        end
                        cnt <= cnt + 1;
                    end
                end

                // init status ////////////////////////////////////////////////

                STATE_INIT_POWERUP: begin
                    // 上电后等待CLK_POWER_UP个时钟后进入INIT_PRECHARGE状态:
                    if (cnt_init_powerup == CLK_POWER_UP) begin
                        state <= STATE_INIT_PRECHARGE;
                        cnt <= CNT_0;
                    end else begin
                        cnt_init_powerup <= cnt_init_powerup + 1;
                    end
                end

                STATE_INIT_PRECHARGE: begin
                    // 保持 precharge 状态 CLK_TRP 个时钟周期:
                    if (cnt == CLK_TRP - 1) begin
                        state <= STATE_INIT_AUTO_REFRESH;
                        cnt <= CNT_0;
                        cnt_init_aref <= 4'b0;
                    end else begin
                        cnt <= cnt + 1;
                    end
                end

                STATE_INIT_AUTO_REFRESH: begin
                    // 满足 SDR_INIT_AREF_COUNT 次数后进入 MR_SET 状态:
                    if (cnt == CLK_TRFC - 1 && cnt_init_aref == SDR_INIT_AREF_COUNT - 1) begin
                        state <= STATE_INIT_MR_SET;
                        cnt <= CNT_0;
                    end else begin
                        if (cnt == CLK_TRFC - 1) begin
                            // 再次进入INIT_AUTO_REFRESH状态:
                            state <= STATE_INIT_AUTO_REFRESH;
                            cnt_init_aref <= cnt_init_aref + 1;
                            cnt <= CNT_0;
                        end else begin
                            cnt <= cnt + 1;
                        end
                    end
                end

                STATE_INIT_MR_SET: begin
                    // 保持当前状态CLK_TMRD个时钟周期:
                    if (cnt == CLK_TMRD - 1) begin
                        // 进入INIT_END状态:
                        state <= STATE_INIT_END;
                    end else begin
                        cnt <= cnt + 1;
                    end
                end

                STATE_INIT_END: begin
                    // 初始化完成,进入IDLE状态:
                    state <= STATE_IDLE;
                end

                // aref status ////////////////////////////////////////////////

                STATE_AREF_PRECHARGE: begin
                    // 保持当前状态CLK_TRP个时钟周期:
                    if (cnt == CLK_TRP - 1) begin
                        // 进入AREF_AUTO_REFRESH状态:
                        state <= STATE_AREF_AUTO_REFRESH;
                        cnt <= CNT_0;
                        cnt_aref <= 1'b0;
                    end else begin
                        cnt <= cnt + 1;
                    end
                end

                STATE_AREF_AUTO_REFRESH: begin
                    // 保持当前状态CLK_TRFC个时钟周期:
                    if (cnt == CLK_TRFC - 1) begin
                        if (cnt_aref == 1'b1) begin
                            // 两次刷新后进入AREF_DONE状态:
                            state <= STATE_AREF_DONE;
                        end else begin
                            // 一次刷新后再返回STATE_AREF_AUTO_REFRESH状态:
                            state <= STATE_AREF_AUTO_REFRESH;
                            cnt <= CNT_0;
                            cnt_aref <= 1'b1;
                        end
                    end else begin
                        cnt <= cnt + 1;
                    end
                end
                STATE_AREF_DONE: begin
                    state <= STATE_IDLE;
                end

                // default to powerup status //////////////////////////////////
                default: begin
                    state <= STATE_INIT_POWERUP;
                end
            endcase
        end
    end

    // 组合逻辑输出 cmd / ba / addr:
    always @ (*) begin
        // 仅在计数器=0时对指定状态输出命令:
        if (cnt == CNT_0) begin
            case (state)
            STATE_INIT_PRECHARGE, STATE_AREF_PRECHARGE: begin
                // init / aref 输出 precharge 命令:
                cmd = SDR_OP_PRECHARGE;
                ba = SDR_BA_MAX;
                addr = SDR_ADDR_MAX; // A10 = 1 = All banks
            end
            STATE_INIT_AUTO_REFRESH, STATE_AREF_AUTO_REFRESH: begin
                // init / aref 输出 auto refresh 命令:
                cmd = SDR_OP_AUTO_REF;
                ba = SDR_BA_MAX;
                addr = SDR_ADDR_MAX;
            end
            STATE_RD_ACTIVE, STATE_WR_ACTIVE: begin
                // read / write 输出 active 命令:
                cmd = SDR_OP_ACTIVE;
                ba = addr_cache[BA_H:BA_L]; // BA
                addr = addr_cache[ROW_H:ROW_L]; // Row
            end
            STATE_RD_READ_A: begin
                // 输出 read 命令:
                cmd = SDR_OP_READ;
                ba = addr_cache[BA_H:BA_L];
                // set A10 = 1 to enable auto precharge:
                addr = {{(SDR_ROW_WIDTH-11){1'b0}}, 1'b1, {(10-SDR_COL_WIDTH){1'b0}}, addr_cache[COL_H:COL_L]};
            end
            STATE_WR_WRITE_A: begin
                // 输出 write 命令:
                cmd = SDR_OP_WRITE;
                ba = addr_cache[BA_H:BA_L];
                // set A10 = 1 to enable auto precharge:
                addr = {{(SDR_ROW_WIDTH-11){1'b0}}, 1'b1, {(10-SDR_COL_WIDTH){1'b0}}, addr_cache[COL_H:COL_L]};
            end
            STATE_INIT_MR_SET: begin
                cmd = SDR_OP_LOAD_MR;
                ba = SDR_BA_MIN;
                // Reserved         = 000 = Reserved (保留)
                // Write Burst Mode = 0   = Programmed Burst Length (指定突发长度)
                // Operation Mode   = 00  = Standard Operation (标准模式)
                // CAS Latency      = 011 = 3 (延迟3个时钟周期)
                // Burst Type       = 0   = Sequential (顺序读写)
                // Burst Length     = 001 = 2 (突发长度=2)
                addr = {{SDR_ROW_WIDTH-10{1'b0}}, { 1'b0, 2'b00, SDR_MR_CAS_LATENCY, 1'b0, SDR_MR_BURST_LENGTH }};
            end
            default: begin
                cmd <= SDR_OP_NOP;
                ba <= SDR_BA_MAX;
                addr <= SDR_ADDR_MAX;
            end
            endcase
        end else begin
            cmd <= SDR_OP_NOP;
            ba <= SDR_BA_MAX;
            addr <= SDR_ADDR_MAX;
        end
    end

    // flag_init_end 信号:
    always @ (posedge clk or negedge rst_n) begin
        if (! rst_n) begin
            flag_init_end <= 1'b0;
        end else if (state == STATE_INIT_END) begin
            flag_init_end <= 1'b1;
        end
    end

    // Auto_Refresh Request 计数循环: cnt_aref_req = 0 ~ CNT_AREF_REQ_MAX:
    always @ (posedge clk or negedge rst_n) begin
        if (! rst_n) begin
            cnt_aref_req <= CNT_AREF_REQ_0;
        end else if (flag_init_end == 1'b1) begin
            if (cnt_aref_req == CNT_AREF_REQ_MAX) begin
                cnt_aref_req <= CNT_AREF_REQ_0;
            end else begin
                cnt_aref_req <= cnt_aref_req + 1;
            end
        end else begin
            cnt_aref_req <= CNT_AREF_REQ_0;
        end
    end

    // 请求 Auto Refresh 信号 aref_req:
    always @ (posedge clk or negedge rst_n) begin
        if (! rst_n) begin
            aref_req <= 1'b0;
        end else if (cnt_aref_req == CNT_AREF_REQ_MAX) begin
            // 计数到 CNT_AREF_REQ_MAX 请求 aref_req=1:
            aref_req <= 1'b1;
        end else if (state == STATE_AREF_DONE) begin
            // 进入 AREF_DONE 状态时结束 aref_req:
            aref_req <= 1'b0;
        end
    end

endmodule
