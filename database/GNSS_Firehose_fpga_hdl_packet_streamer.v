// Buffer and Ethernet MAC
//
// GNSS Firehose
// Copyright (c) 2012 Peter Monta <pmonta@gmail.com>

module packet_streamer(
  input clk, reset,
  input [15:0] source_data,
  input source_en,
  input source_packet_end,
  input tx_clk,
  output reg [7:0] tx_data,
  output reg [1:0] tx_ctl,
  output reg [15:0] packet_count,
  input streamer_enable,
  input [47:0] mac_addr,
  input cmd_ready,
  output reg [5:0] cmd_addr,
  input [7:0] cmd_data
);

  reg [10:0] waddr;
  wire flag = waddr[10];
  wire wen0, wen1;

  reg [10:0] raddr;
  wire [7:0] data0, data1;

// ping-pong buffers

  dpram_10_16 _ram0(
    clk, waddr[9:0], source_data, wen0,
    tx_clk, raddr, data0
  );

  dpram_10_16 _ram1(
    clk, waddr[9:0], source_data, wen1,
    tx_clk, raddr, data1
  );

// ADC cycle counter

  reg [63:0] c;
  always @(posedge clk)
    c <= c+1;

// write source data to the two ping-ponged RAMs

  reg [63:0] ticks;
  reg [10:0] packet_length_w;

  always @(posedge clk)
    if (reset) begin
      waddr <= 0;
      ticks <= 0;
    end else begin
      if (source_en) begin
        if (source_packet_end) begin
	  waddr <= {~waddr[10],10'd0};
	  packet_length_w <= {waddr[9:0]+1,1'b0};
        end else
          waddr <= waddr+1;
        if (waddr[9:0]==10'd8)
          ticks <= c;
      end
    end

  assign wen0 = source_en && !flag;
  assign wen1 = source_en && flag;

// read from RAMs, construct Ethernet frames

  reg crc_reset, crc_en;
  wire [31:0] crc;

  crc _crc(tx_clk, crc_reset, crc_en, tx_data, crc);

  localparam [6:0]
    IDLE = 7'd0,
    PREAMBLE_0 = 7'd1,
    PREAMBLE_1 = 7'd2,
    PREAMBLE_2 = 7'd3,
    PREAMBLE_3 = 7'd4,
    PREAMBLE_4 = 7'd5,
    PREAMBLE_5 = 7'd6,
    PREAMBLE_6 = 7'd7,
    PREAMBLE_7 = 7'd8,
    DEST_0 = 7'd9,
    DEST_1 = 7'd10,
    DEST_2 = 7'd11,
    DEST_3 = 7'd12,
    DEST_4 = 7'd13,
    DEST_5 = 7'd14,
    SRC_0 = 7'd15,
    SRC_1 = 7'd16,
    SRC_2 = 7'd17,
    SRC_3 = 7'd18,
    SRC_4 = 7'd19,
    SRC_5 = 7'd20,
    TYPELEN_0 = 7'd21,
    TYPELEN_1 = 7'd22,
    TICKS_0 = 7'd23,
    TICKS_1 = 7'd24,
    TICKS_2 = 7'd25,
    TICKS_3 = 7'd26,
    TICKS_4 = 7'd27,
    TICKS_5 = 7'd28,
    TICKS_6 = 7'd29,
    TICKS_7 = 7'd30,
    PAYLOAD = 7'd31,
    FCS_0 = 7'd32,
    FCS_1 = 7'd33,
    FCS_2 = 7'd34,
    FCS_3 = 7'd35,
    IPG_0 = 7'd36,
    IPG_1 = 7'd37,
    IPG_2 = 7'd38,
    IPG_3 = 7'd39,
    IPG_4 = 7'd40,
    IPG_5 = 7'd41,
    IPG_6 = 7'd42,
    IPG_7 = 7'd43,
    IPG_8 = 7'd44,
    IPG_9 = 7'd45,
    IPG_10 = 7'd46,
    IPG_11 = 7'd47,
    CMD_PREAMBLE_0 = 7'd48,
    CMD_PREAMBLE_1 = 7'd49,
    CMD_PREAMBLE_2 = 7'd50,
    CMD_PREAMBLE_3 = 7'd51,
    CMD_PREAMBLE_4 = 7'd52,
    CMD_PREAMBLE_5 = 7'd53,
    CMD_PREAMBLE_6 = 7'd54,
    CMD_PREAMBLE_7 = 7'd55,
    CMD_DEST_0 = 7'd56,
    CMD_DEST_1 = 7'd57,
    CMD_DEST_2 = 7'd58,
    CMD_DEST_3 = 7'd59,
    CMD_DEST_4 = 7'd60,
    CMD_DEST_5 = 7'd61,
    CMD_SRC_0 = 7'd62,
    CMD_SRC_1 = 7'd63,
    CMD_SRC_2 = 7'd64,
    CMD_SRC_3 = 7'd65,
    CMD_SRC_4 = 7'd66,
    CMD_SRC_5 = 7'd67,
    CMD_TYPELEN_0 = 7'd68,
    CMD_TYPELEN_1 = 7'd69,
    CMD_PAYLOAD = 7'd70;

  reg [6:0] state;
  reg flag_1, flag_2;
  reg [23:0] t;
  reg [63:0] pticks;
  reg [10:0] packet_length;

  reg cmd_ready_1, cmd_ready_2, cmd_begin;

  wire tx_clk_reset;
  reset_gen _reset(tx_clk, tx_clk_reset);

  always @(posedge tx_clk)
    if (tx_clk_reset) begin
      flag_1 <= 0;
      flag_2 <= 0;
      tx_ctl <= 2'b00;
      crc_en <= 0;
      crc_reset <= 1;
      state <= IDLE;
      packet_count <= 0;
      cmd_ready_1 <= 0;
      cmd_ready_2 <= 0;
      cmd_begin <= 0;
    end else begin
      flag_1 <= flag;
      flag_2 <= flag_1;
      cmd_ready_1 <= cmd_ready;
      cmd_ready_2 <= cmd_ready_1;
      if (cmd_ready_2 && ~cmd_ready_1)
        cmd_begin <= 1;
      else if (state==CMD_PREAMBLE_0)
        cmd_begin <= 0;
      case (state)
        IDLE:
          if (cmd_begin) begin
            state <= CMD_PREAMBLE_0;
            crc_reset <= 1;
            tx_ctl <= 2'b00;
          end else if ((flag_1 ^ flag_2)  && streamer_enable) begin
            state <= PREAMBLE_0;
            crc_reset <= 1;
            pticks <= ticks;
            packet_length <= packet_length_w;
            packet_count <= packet_count + 1;
            tx_ctl <= 2'b00;
          end else
            tx_ctl <= 2'b00;
        PREAMBLE_0: begin tx_data <= 8'h55; tx_ctl <= 2'b11; state <= PREAMBLE_1; end                     // send a payload packet of quantized samples
        PREAMBLE_1: begin tx_data <= 8'h55; state <= PREAMBLE_2; end
        PREAMBLE_2: begin tx_data <= 8'h55; state <= PREAMBLE_3; end
        PREAMBLE_3: begin tx_data <= 8'h55; state <= PREAMBLE_4; end
        PREAMBLE_4: begin tx_data <= 8'h55; state <= PREAMBLE_5; end
        PREAMBLE_5: begin tx_data <= 8'h55; state <= PREAMBLE_6; end
        PREAMBLE_6: begin tx_data <= 8'h55; state <= PREAMBLE_7; end
        PREAMBLE_7: begin tx_data <= 8'hd5; state <= DEST_0; end
        DEST_0: begin crc_reset <= 0; crc_en <= 1; tx_data <= 8'hff; state <= DEST_1; end
        DEST_1: begin tx_data <= 8'hff; state <= DEST_2; end
        DEST_2: begin tx_data <= 8'hff; state <= DEST_3; end
        DEST_3: begin tx_data <= 8'hff; state <= DEST_4; end
        DEST_4: begin tx_data <= 8'hff; state <= DEST_5; end
        DEST_5: begin tx_data <= 8'hff; state <= SRC_0; end
        SRC_0: begin tx_data <= mac_addr[47:40]; state <= SRC_1; end
        SRC_1: begin tx_data <= mac_addr[39:32]; state <= SRC_2; end
        SRC_2: begin tx_data <= mac_addr[31:24]; state <= SRC_3; end
        SRC_3: begin tx_data <= mac_addr[23:16]; state <= SRC_4; end
        SRC_4: begin tx_data <= mac_addr[15:8]; state <= SRC_5; end
        SRC_5: begin tx_data <= mac_addr[7:0]; state <= TYPELEN_0; end
        TYPELEN_0: begin tx_data <= 8'h88; state <= TYPELEN_1; end
        TYPELEN_1: begin tx_data <= 8'hb5; state <= TICKS_0; end
        TICKS_0: begin tx_data <= pticks[63:56]; state <= TICKS_1; end
        TICKS_1: begin tx_data <= pticks[55:48]; state <= TICKS_2; end
        TICKS_2: begin tx_data <= pticks[47:40]; state <= TICKS_3; end
        TICKS_3: begin tx_data <= pticks[39:32]; state <= TICKS_4; end
        TICKS_4: begin tx_data <= pticks[31:24]; state <= TICKS_5; end
        TICKS_5: begin tx_data <= pticks[23:16]; state <= TICKS_6; end
        TICKS_6: begin tx_data <= pticks[15:8]; raddr <= 0; state <= TICKS_7; end
        TICKS_7: begin tx_data <= pticks[7:0]; raddr <= 1; state <= PAYLOAD; end
        PAYLOAD:
          begin
            tx_data <= flag ? data0 : data1;
            raddr <= raddr+1;
            if (raddr==packet_length)
              state <= FCS_0;
          end
        FCS_0: begin crc_en <= 0; tx_data <= crc[31:24]; t <= crc[23:0]; state <= FCS_1; end
        FCS_1: begin tx_data <= t[23:16]; state <= FCS_2; end
        FCS_2: begin tx_data <= t[15:8]; state <= FCS_3; end
        FCS_3: begin tx_data <= t[7:0]; state <= IPG_0; end
        IPG_0: begin tx_ctl <= 2'b00; state <= IPG_1; end
        IPG_1: begin state <= IPG_2; end
        IPG_2: begin state <= IPG_3; end
        IPG_3: begin state <= IPG_4; end
        IPG_4: begin state <= IPG_5; end
        IPG_5: begin state <= IPG_6; end
        IPG_6: begin state <= IPG_7; end
        IPG_7: begin state <= IPG_8; end
        IPG_8: begin state <= IPG_9; end
        IPG_9: begin state <= IPG_10; end
        IPG_10: begin state <= IPG_11; end
        IPG_11: begin state <= IDLE; end

        CMD_PREAMBLE_0: begin tx_data <= 8'h55; tx_ctl <= 2'b11; state <= CMD_PREAMBLE_1; end               // send a 64-byte status packet
        CMD_PREAMBLE_1: begin tx_data <= 8'h55; state <= CMD_PREAMBLE_2; end
        CMD_PREAMBLE_2: begin tx_data <= 8'h55; state <= CMD_PREAMBLE_3; end
        CMD_PREAMBLE_3: begin tx_data <= 8'h55; state <= CMD_PREAMBLE_4; end
        CMD_PREAMBLE_4: begin tx_data <= 8'h55; state <= CMD_PREAMBLE_5; end
        CMD_PREAMBLE_5: begin tx_data <= 8'h55; state <= CMD_PREAMBLE_6; end
        CMD_PREAMBLE_6: begin tx_data <= 8'h55; state <= CMD_PREAMBLE_7; end
        CMD_PREAMBLE_7: begin tx_data <= 8'hd5; state <= CMD_DEST_0; end
        CMD_DEST_0: begin crc_reset <= 0; crc_en <= 1; tx_data <= 8'hff; state <= CMD_DEST_1; end
        CMD_DEST_1: begin tx_data <= 8'hff; state <= CMD_DEST_2; end
        CMD_DEST_2: begin tx_data <= 8'hff; state <= CMD_DEST_3; end
        CMD_DEST_3: begin tx_data <= 8'hff; state <= CMD_DEST_4; end
        CMD_DEST_4: begin tx_data <= 8'hff; state <= CMD_DEST_5; end
        CMD_DEST_5: begin tx_data <= 8'hff; state <= CMD_SRC_0; end
        CMD_SRC_0: begin tx_data <= mac_addr[47:40]; state <= CMD_SRC_1; end
        CMD_SRC_1: begin tx_data <= mac_addr[39:32]; state <= CMD_SRC_2; end
        CMD_SRC_2: begin tx_data <= mac_addr[31:24]; state <= CMD_SRC_3; end
        CMD_SRC_3: begin tx_data <= mac_addr[23:16]; state <= CMD_SRC_4; end
        CMD_SRC_4: begin tx_data <= mac_addr[15:8]; state <= CMD_SRC_5; end
        CMD_SRC_5: begin tx_data <= mac_addr[7:0]; state <= CMD_TYPELEN_0; end
        CMD_TYPELEN_0: begin tx_data <= 8'h88; cmd_addr <= 0; state <= CMD_TYPELEN_1; end
        CMD_TYPELEN_1: begin tx_data <= 8'hb6; cmd_addr <= 1; state <= CMD_PAYLOAD; end
        CMD_PAYLOAD:
          begin
            tx_data <= cmd_data;
            cmd_addr <= cmd_addr+1;
            if (cmd_addr==6'd0)
              state <= FCS_0;
          end
      endcase
    end

endmodule
