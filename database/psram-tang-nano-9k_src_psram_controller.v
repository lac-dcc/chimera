//
// PSRAM/HyperRAM controller for Tang Nano 9K / Gowin GW1NR-LV9QN88PC6/15.
// Feng Zhou, 2022.8
//
// This is a word or byte based, non-bursting controller for accessing the on-chip HyperRAM.
// - 1:1 clock design. Memory and main logic work under the same clock.
// - Low latency. Under default settings, write latency is 7 cycles (1x) or 10 cycles (2x). 
//   Read latency is 12 cycles (1x) or 15 cycles(2x). In my test, 2x latency happens about 
//   0.05% of time.

module PsramController #(
    parameter FREQ=81_000_000,// Actual clk frequency, to time 150us initialization delay
    parameter LATENCY=3       // tACC (Initial Latency) in W955D8MBYA datasheet:
                              // 3 (max 83Mhz), 4 (max 104Mhz), 5 (max 133Mhz) or 6 (max 166Mhz)
) (
    input clk,
    input clk_p,              // phase-shifted clock for driving O_psram_ck
    input resetn,
    input read,               // Set to 1 to read from RAM
    input write,              // Set to 1 to write to RAM
    input [21:0] addr,        // Byte address to read / write
    input [15:0] din,         // Data word to write
    input byte_write,         // When writing, only write one byte instead of the whole word. 
                              // addr[0]==1 means we write the upper half of din. lower half otherwise.
    output reg [15:0] dout,   // Last read data. Read is always word-based.
    output busy,              // 1 while an operation is in progress

    // HyperRAM physical interface. Gowin interface is for 2 dies. 
    // We currently only use the first die (4MB).
    output [1:0] O_psram_ck,
    inout [1:0] IO_psram_rwds,
    inout [15:0] IO_psram_dq,
    output [1:0] O_psram_cs_n
);

reg [2:0] state;
localparam [2:0] INIT_ST = 3'd0;
localparam [2:0] CONFIG_ST= 3'd1;
localparam [2:0] IDLE_ST = 3'd2;
localparam [2:0] READ_ST = 3'd3;
localparam [2:0] WRITE_ST = 3'd4;

reg cfg_now, dq_oen, ram_cs_n, ck_e, ck_e_p;
reg wait_for_rd_data;
reg ub;                     // 1 for upper byte
reg [15:0] w_din;
reg [23:0] cycles_sr;       // shift register counting cycles
reg [63:0] dq_sr;           // shifts left 8-bit every cycle

// DDR input output signals
wire [7:0] dq_out_ris = dq_sr[63:56];
wire [7:0] dq_out_fal = dq_sr[55:48];
wire [7:0] dq_in_ris;
wire [7:0] dq_in_fal;
reg rwds_out_ris, rwds_out_fal, rwds_oen;
wire rwds_in_ris, rwds_in_fal;
reg additional_latency;

assign busy = (state != IDLE_ST);

localparam [3:0] CR_LATENCY = LATENCY == 3 ? 4'b1110 :
                              LATENCY == 4 ? 4'b1111 :
                              LATENCY == 5 ? 4'b0 :
                              LATENCY == 6 ? 4'b0001 : 4'b1110;

// Main FSM for HyperRAM read/write
always @(posedge clk) begin
    cycles_sr <= {cycles_sr[22:0], 1'b0};
    dq_sr <= {dq_sr[47:0], 16'b0};          // shift 16-bits each cycle
    ck_e_p <= ck_e;

    if (state == INIT_ST && cfg_now) begin
        cycles_sr <= 24'b1;
        ram_cs_n <= 0;
        state <= CONFIG_ST;
    end
    if (state == CONFIG_ST) begin
        if (cycles_sr[0]) begin
            dq_sr <= {8'h60, 8'h00, 8'h01, 8'h00, 8'h00, 8'h00, 8'h8f, CR_LATENCY, 4'h7};      // last byte, 'e' (3 cycle latency max 83Mhz), '7' (variable 1x/2x latency)
            dq_oen <= 0;
            ck_e <= 1;      // this needs to be earlier 1 cycle to allow for phase shifted clk_p
        end 
        if (cycles_sr[4]) begin
            state <= IDLE_ST;
            ck_e <= 0;
            cycles_sr <= 24'b1;
            dq_oen <= 1;
            ram_cs_n <= 1;
        end
    end
    if (state == IDLE_ST) begin
        rwds_oen <= 1;
        ck_e <= 0;
        ram_cs_n <= 1;
        if (read || write) begin
            // start read/write operation
            dq_sr <= {~write, 13'b010_0000_0000_00, addr[21:4], 13'b0, addr[3:1], 16'b0000_0100_1101_0100};
                    //      14-bit                     18-bit   13-bit   3-bit             total 48-bit CA
            ram_cs_n <= 0;
            ck_e <= 1;
            dq_oen <= 0;
            wait_for_rd_data <= 0;
            w_din <= din;
            cycles_sr <= 32'b10;    // start from cycle 1
            state <= write ? WRITE_ST : READ_ST;
        end
    end

    if (state == READ_ST)  begin
        if (cycles_sr[3]) begin
            // command sent, now wait for result
            dq_oen <= 1;
        end 
        if (cycles_sr[9])
            wait_for_rd_data <= 1;
        if (wait_for_rd_data && (rwds_in_ris ^ rwds_in_fal)) begin     // sample rwds falling edge to get a word / \_
            dout <= {dq_in_ris, dq_in_fal};
            ram_cs_n <= 1;
            ck_e <= 0;
            state <= IDLE_ST;
        end
    end

    if (state == WRITE_ST) begin
        if (cycles_sr[5])
            additional_latency <= rwds_in_fal;  // sample RWDS to see if we need additional latency
        // Write timing is trickier - we sample RWDS at cycle 5 to determine whether we need to wait another tACC.
        // If it is low, data starts at 2+LATENCY. If high, then data starts at 2+LATENCY*2.
        if (cycles_sr[2+LATENCY] && (LATENCY == 3 ? ~rwds_in_fal : ~additional_latency)
            || cycles_sr[2+LATENCY*2])
        begin
            rwds_oen <= 0;
            rwds_out_ris <= byte_write ? ~addr[0] : 1'b0;       // RWDS is data mask (1 means not writing)
            rwds_out_fal <= byte_write ? addr[0] : 1'b0;
            dq_sr[63:48] <= w_din;
            state <= IDLE_ST;
        end
    end

    if (~resetn) begin
        state <= INIT_ST;
        ram_cs_n <= 1;
        ck_e <= 0;
    end 
end


// 150us initialization delay
//
// Generate cfg_now pulse after 150us delay
//
localparam INIT_TIME = FREQ / 1000 * 160 / 1000;
reg  [$clog2(INIT_TIME+1):0]   rst_cnt;
reg rst_done, rst_done_p1, cfg_busy;
  
always @(posedge clk) begin
    rst_done_p1 <= rst_done;
    cfg_now     <= rst_done & ~rst_done_p1;// Rising Edge Detect

    if (rst_cnt != INIT_TIME) begin      // count to 160 us
        rst_cnt  <= rst_cnt[14:0] + 1;
        rst_done <= 0;
        cfg_busy <= 1;
    end else begin
        rst_done <= 1;
        cfg_busy <= 0;
    end

    if (~resetn) begin
        rst_cnt  <= 15'd0;
        rst_done <= 0;
        cfg_busy <= 1;
    end
end

// Tristate DDR output
wire dq_out_tbuf[7:0];
wire dq_oen_tbuf[7:0];
ODDR oddr_cs_n(
    .CLK(clk), .D0(ram_cs_n), .D1(ram_cs_n), .Q0(cs_n_tbuf)
);
assign O_psram_cs_n[0] = cs_n_tbuf;
ODDR oddr_rwds(
    .CLK(clk), .D0(rwds_out_ris), .D1(rwds_out_fal), .TX(rwds_oen), .Q0(rwds_tbuf), .Q1(rwds_oen_tbuf)
);
assign IO_psram_rwds[0] = rwds_oen_tbuf ? 1'bz : rwds_tbuf;

genvar i1;
generate
    for (i1=0; i1<=7; i1=i1+1) begin: gen_i1
        ODDR oddr_dq_i1(
            .CLK(clk), .D0(dq_out_ris[i1]), .D1(dq_out_fal[i1]), .TX(dq_oen), .Q0(dq_out_tbuf[i1]), .Q1(dq_oen_tbuf[i1])
        );
        assign IO_psram_dq[i1] = dq_oen_tbuf[i1] ? 1'bz : dq_out_tbuf[i1];
    end
endgenerate
// Note: ck uses phase-shifted clock clk_p
ODDR oddr_ck(
    .CLK(clk_p), .D0(ck_e_p), .D1(1'b0), .Q0(ck_tbuf)
);
assign O_psram_ck[0] = ck_tbuf;


// Tristate DDR input
IDDR iddr_rwds(
    .CLK(clk), .D(IO_psram_rwds[0]), .Q0(rwds_in_ris), .Q1(rwds_in_fal)
);
genvar i2;
generate
    for (i2=0; i2<=7; i2=i2+1) begin: gen_i2
        IDDR iddr_dq_i2(
            .CLK(clk), .D(IO_psram_dq[i2]), .Q0(dq_in_ris[i2]), .Q1(dq_in_fal[i2])
        );
    end
endgenerate

endmodule


