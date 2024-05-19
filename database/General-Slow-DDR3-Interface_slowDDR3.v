// This program was cloned from: https://github.com/ZiyangYE/General-Slow-DDR3-Interface
// License: BSD 3-Clause "New" or "Revised" License

// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : slowDDR3


`define InitState_binary_sequential_type [2:0]
`define InitState_binary_sequential_WAIT0 3'b000
`define InitState_binary_sequential_CKE 3'b001
`define InitState_binary_sequential_MRS2 3'b010
`define InitState_binary_sequential_MRS3 3'b011
`define InitState_binary_sequential_MRS1 3'b100
`define InitState_binary_sequential_MRS0 3'b101
`define InitState_binary_sequential_ZQCL 3'b110
`define InitState_binary_sequential_WAIT1 3'b111

`define WorkState_binary_sequential_type [1:0]
`define WorkState_binary_sequential_IDLE 2'b00
`define WorkState_binary_sequential_READ 2'b01
`define WorkState_binary_sequential_WRITE 2'b10
`define WorkState_binary_sequential_REFRESH 2'b11


module slowDDR3 (
  input               inv_clk,
  output reg [13:0]   phyIO_address,
  output reg [2:0]    phyIO_bank,
  output              phyIO_cs,
  output reg          phyIO_cas,
  output reg          phyIO_ras,
  output reg          phyIO_we,
  output reg          phyIO_clk_p,
  output reg          phyIO_clk_n,
  output reg          phyIO_cke,
  output              phyIO_odt,
  output reg          phyIO_rst_n,
  output     [1:0]    phyIO_dm,
   inout     [15:0]   phyIO_dq,
   inout     [1:0]    phyIO_dqs_p,
   inout     [1:0]    phyIO_dqs_n,
  output reg          sysIO_dataRd_valid,
  input               sysIO_dataRd_ready,
  output reg [15:0]   sysIO_dataRd_payload,
  input               sysIO_dataWr_valid,
  output reg          sysIO_dataWr_ready,
  input      [15:0]   sysIO_dataWr_payload,
  input      [26:0]   sysIO_address,
  output reg          sysIO_initFin,
  input               clk,
  input               resetn
);
  reg                 _zz_phyIO_dqs_n;
  reg                 _zz_phyIO_dqs_p;
  reg                 _zz_phyIO_dq;
  wire       [15:0]   dqWire;
  wire       [1:0]    dqsPWire;
  wire       [1:0]    dqsNWire;
  reg                 dqOut;
  reg        `InitState_binary_sequential_type initState_1;
  reg        `WorkState_binary_sequential_type workState_1;
  reg        [3:0]    refreshCount;
  reg                 refreshIssued;
  reg                 clkGen_clk;
  reg        [23:0]   timer_counter;
  wire                when_slowDDR3_l163;
  reg                 timer_tick;
  reg        [7:0]    timer_wkCnt;
  wire                when_slowDDR3_l169;
  reg                 dqsOut;
  reg                 dqIn;
  reg                 IOArea_clk;
  reg        [4:0]    IOArea_cnt;
  wire                when_slowDDR3_l178;
  wire                when_slowDDR3_l184;
  wire                when_slowDDR3_l190;
  wire                when_slowDDR3_l191;
  wire                when_slowDDR3_l194;
  reg        [1:0]    IOArea_dqsPReg;
  reg        [1:0]    IOArea_dqsNReg;
  (* async_reg = "true" *) reg        [15:0]   IOArea_dqOutArea_dqReg;
  reg        [15:0]   IOArea_dqInP;
  reg        [15:0]   IOArea_dqInN;
  wire                _zz_1;
  wire                _zz_2;
  (* async_reg = "true" *) reg        [7:0]    _zz_IOArea_dqInP;
  (* async_reg = "true" *) reg        [7:0]    _zz_IOArea_dqInN;
  wire                _zz_3;
  wire                _zz_4;
  (* async_reg = "true" *) reg        [7:0]    _zz_IOArea_dqInP_1;
  (* async_reg = "true" *) reg        [7:0]    _zz_IOArea_dqInN_1;
  reg                 IOArea_intInValid;
  wire                when_slowDDR3_l240;
  wire                when_slowDDR3_l241;
  wire                when_slowDDR3_l244;
  wire                when_slowDDR3_l251;
  wire                when_slowDDR3_l304;
  wire                when_slowDDR3_l324;
  wire                when_slowDDR3_l331;
  wire                when_slowDDR3_l336;
  wire                when_slowDDR3_l343;
  wire                when_slowDDR3_l349;
  wire                when_slowDDR3_l353;
  wire                when_slowDDR3_l365;
  wire                when_slowDDR3_l368;
  wire                when_slowDDR3_l371;
  wire                when_slowDDR3_l374;
  wire                when_slowDDR3_l377;
  wire                when_slowDDR3_l391;
  wire                when_slowDDR3_l395;
  wire                when_slowDDR3_l399;
  wire                when_slowDDR3_l402;
  wire                when_slowDDR3_l407;
  wire                when_slowDDR3_l408;
  `ifndef SYNTHESIS
  reg [39:0] initState_1_string;
  reg [55:0] workState_1_string;
  `endif


  assign phyIO_dq = _zz_phyIO_dq ? dqWire : 16'bzzzzzzzzzzzzzzzz;
  assign phyIO_dqs_p = _zz_phyIO_dqs_p ? dqsPWire : 2'bzz;
  assign phyIO_dqs_n = _zz_phyIO_dqs_n ? dqsNWire : 2'bzz;
  `ifndef SYNTHESIS
  always @(*) begin
    case(initState_1)
      `InitState_binary_sequential_WAIT0 : initState_1_string = "WAIT0";
      `InitState_binary_sequential_CKE : initState_1_string = "CKE  ";
      `InitState_binary_sequential_MRS2 : initState_1_string = "MRS2 ";
      `InitState_binary_sequential_MRS3 : initState_1_string = "MRS3 ";
      `InitState_binary_sequential_MRS1 : initState_1_string = "MRS1 ";
      `InitState_binary_sequential_MRS0 : initState_1_string = "MRS0 ";
      `InitState_binary_sequential_ZQCL : initState_1_string = "ZQCL ";
      `InitState_binary_sequential_WAIT1 : initState_1_string = "WAIT1";
      default : initState_1_string = "?????";
    endcase
  end
  always @(*) begin
    case(workState_1)
      `WorkState_binary_sequential_IDLE : workState_1_string = "IDLE   ";
      `WorkState_binary_sequential_READ : workState_1_string = "READ   ";
      `WorkState_binary_sequential_WRITE : workState_1_string = "WRITE  ";
      `WorkState_binary_sequential_REFRESH : workState_1_string = "REFRESH";
      default : workState_1_string = "???????";
    endcase
  end
  `endif

  always @(*) begin
    _zz_phyIO_dqs_n = 1'b0;
    if(dqOut) begin
      _zz_phyIO_dqs_n = 1'b1;
    end
  end

  always @(*) begin
    _zz_phyIO_dqs_p = 1'b0;
    if(dqOut) begin
      _zz_phyIO_dqs_p = 1'b1;
    end
  end

  always @(*) begin
    _zz_phyIO_dq = 1'b0;
    if(dqOut) begin
      _zz_phyIO_dq = 1'b1;
    end
  end

  assign phyIO_cs = 1'b0;
  assign phyIO_odt = 1'b0;
  assign phyIO_dm = 2'b00;
  assign when_slowDDR3_l163 = (clkGen_clk == 1'b0);
  assign when_slowDDR3_l169 = (clkGen_clk == 1'b0);
  assign when_slowDDR3_l178 = (dqsOut == 1'b0);
  assign when_slowDDR3_l184 = ((dqsOut == 1'b0) && (dqIn == 1'b0));
  assign when_slowDDR3_l190 = (dqsOut == 1'b1);
  assign when_slowDDR3_l191 = (IOArea_cnt == 5'h01);
  assign when_slowDDR3_l194 = (IOArea_cnt == 5'h09);
  assign dqWire = IOArea_dqOutArea_dqReg;
  assign _zz_1 = phyIO_dqs_p[0];
  assign _zz_2 = phyIO_dqs_n[0];
  always @(*) begin
    IOArea_dqInP[7 : 0] = _zz_IOArea_dqInP;
    IOArea_dqInP[15 : 8] = _zz_IOArea_dqInP_1;
  end

  always @(*) begin
    IOArea_dqInN[7 : 0] = _zz_IOArea_dqInN;
    IOArea_dqInN[15 : 8] = _zz_IOArea_dqInN_1;
  end

  assign _zz_3 = phyIO_dqs_p[1];
  assign _zz_4 = phyIO_dqs_n[1];
  assign when_slowDDR3_l240 = (dqIn == 1'b1);
  assign when_slowDDR3_l241 = (IOArea_cnt == 5'h0);
  assign when_slowDDR3_l244 = (IOArea_cnt == 5'h08);
  assign when_slowDDR3_l251 = IOArea_cnt[0];
  assign dqsPWire = IOArea_dqsPReg;
  assign dqsNWire = IOArea_dqsNReg;
  assign when_slowDDR3_l304 = (clkGen_clk == 1'b0);
  assign when_slowDDR3_l324 = (((sysIO_dataRd_ready == 1'b0) && (sysIO_dataWr_valid == 1'b0)) && (4'b0000 < refreshCount));
  assign when_slowDDR3_l331 = ((sysIO_dataRd_ready == 1'b1) && (sysIO_dataWr_valid == 1'b0));
  assign when_slowDDR3_l336 = (sysIO_dataWr_valid == 1'b1);
  assign when_slowDDR3_l343 = (timer_wkCnt == 8'h08);
  assign when_slowDDR3_l349 = (timer_wkCnt == 8'h0);
  assign when_slowDDR3_l353 = ((4'b1000 < refreshCount) || (((refreshCount != 4'b0000) && (sysIO_dataWr_ready == 1'b0)) && (sysIO_dataRd_valid == 1'b0)));
  assign when_slowDDR3_l365 = (timer_wkCnt == 8'h0b);
  assign when_slowDDR3_l368 = (timer_wkCnt == 8'h0a);
  assign when_slowDDR3_l371 = (timer_wkCnt == 8'h05);
  assign when_slowDDR3_l374 = (timer_wkCnt == 8'h0);
  assign when_slowDDR3_l377 = (4'b1000 < refreshCount);
  assign when_slowDDR3_l391 = (timer_wkCnt == 8'h11);
  assign when_slowDDR3_l395 = (timer_wkCnt == 8'h10);
  assign when_slowDDR3_l399 = (timer_wkCnt == 8'h0b);
  assign when_slowDDR3_l402 = (timer_wkCnt == 8'h05);
  assign when_slowDDR3_l407 = (timer_wkCnt == 8'h0);
  assign when_slowDDR3_l408 = (4'b1000 < refreshCount);
  always @(posedge clk or negedge resetn) begin
    if(!resetn) begin
      phyIO_address <= 14'h3fff;
      phyIO_bank <= 3'b000;
      phyIO_cas <= 1'b1;
      phyIO_ras <= 1'b1;
      phyIO_we <= 1'b1;
      phyIO_clk_p <= 1'b0;
      phyIO_clk_n <= 1'b1;
      phyIO_cke <= 1'b0;
      phyIO_rst_n <= 1'b0;
      dqOut <= 1'b0;
      sysIO_dataRd_payload <= 16'h0;
      sysIO_dataRd_valid <= 1'b0;
      sysIO_dataWr_ready <= 1'b0;
      sysIO_initFin <= 1'b0;
      initState_1 <= `InitState_binary_sequential_WAIT0;
      workState_1 <= `WorkState_binary_sequential_IDLE;
      refreshCount <= 4'b0000;
      refreshIssued <= 1'b0;
      clkGen_clk <= 1'b0;
      timer_counter <= 24'h002710;
      timer_wkCnt <= 8'h0;
      dqsOut <= 1'b0;
      dqIn <= 1'b0;
      IOArea_clk <= 1'b0;
      IOArea_cnt <= 5'h0;
      IOArea_dqsPReg <= 2'b00;
      IOArea_dqsNReg <= 2'b00;
      IOArea_intInValid <= 1'b0;
    end else begin
      clkGen_clk <= (! clkGen_clk);
      phyIO_clk_p <= clkGen_clk;
      phyIO_clk_n <= (! clkGen_clk);
      if(when_slowDDR3_l163) begin
        timer_counter <= (timer_counter - 24'h000001);
      end
      if(when_slowDDR3_l169) begin
        timer_wkCnt <= (timer_wkCnt - 8'h01);
      end
      if(when_slowDDR3_l178) begin
        IOArea_clk <= 1'b1;
      end else begin
        IOArea_clk <= (! IOArea_clk);
      end
      if(when_slowDDR3_l184) begin
        IOArea_cnt <= 5'h0;
      end else begin
        IOArea_cnt <= (IOArea_cnt + 5'h01);
      end
      if(when_slowDDR3_l190) begin
        if(when_slowDDR3_l191) begin
          sysIO_dataWr_ready <= 1'b1;
        end
        if(when_slowDDR3_l194) begin
          sysIO_dataWr_ready <= 1'b0;
        end
      end
      IOArea_dqsPReg <= (IOArea_clk ? 2'b11 : 2'b00);
      IOArea_dqsNReg <= ((! IOArea_clk) ? 2'b11 : 2'b00);
      if(when_slowDDR3_l240) begin
        if(when_slowDDR3_l241) begin
          IOArea_intInValid <= 1'b1;
        end
        if(when_slowDDR3_l244) begin
          IOArea_intInValid <= 1'b0;
        end
      end
      sysIO_dataRd_valid <= IOArea_intInValid;
      if(IOArea_intInValid) begin
        if(when_slowDDR3_l251) begin
          sysIO_dataRd_payload <= IOArea_dqInP;
        end else begin
          sysIO_dataRd_payload <= IOArea_dqInN;
        end
      end
      if(when_slowDDR3_l304) begin
        phyIO_cas <= 1'b1;
        phyIO_ras <= 1'b1;
        phyIO_we <= 1'b1;
        if(sysIO_initFin) begin
          if(timer_tick) begin
            refreshCount <= (refreshCount + 4'b0001);
            timer_counter <= 24'h000186;
          end else begin
            if(refreshIssued) begin
              refreshCount <= (refreshCount - 4'b0001);
              refreshIssued <= 1'b0;
            end
          end
          case(workState_1)
            `WorkState_binary_sequential_IDLE : begin
              if(when_slowDDR3_l324) begin
                workState_1 <= `WorkState_binary_sequential_REFRESH;
                timer_wkCnt <= 8'h08;
              end
              if(when_slowDDR3_l331) begin
                workState_1 <= `WorkState_binary_sequential_READ;
                timer_wkCnt <= 8'h0b;
              end
              if(when_slowDDR3_l336) begin
                workState_1 <= `WorkState_binary_sequential_WRITE;
                timer_wkCnt <= 8'h11;
              end
            end
            `WorkState_binary_sequential_REFRESH : begin
              if(when_slowDDR3_l343) begin
                phyIO_ras <= 1'b0;
                phyIO_cas <= 1'b0;
                refreshIssued <= 1'b1;
              end
              if(when_slowDDR3_l349) begin
                if(when_slowDDR3_l353) begin
                  timer_wkCnt <= 8'h08;
                end else begin
                  workState_1 <= `WorkState_binary_sequential_IDLE;
                end
              end
            end
            `WorkState_binary_sequential_READ : begin
              if(when_slowDDR3_l365) begin
                phyIO_ras <= 1'b0;
                phyIO_bank <= sysIO_address[12 : 10];
                phyIO_address <= sysIO_address[26 : 13];
              end
              if(when_slowDDR3_l368) begin
                phyIO_cas <= 1'b0;
                phyIO_bank <= sysIO_address[12 : 10];
                phyIO_address[10] <= 1'b1;
                phyIO_address[11] <= 1'b0;
                phyIO_address[9 : 0] <= sysIO_address[9 : 0];
              end
              if(when_slowDDR3_l371) begin
                dqIn <= 1'b1;
              end
              if(when_slowDDR3_l374) begin
                dqIn <= 1'b0;
                if(when_slowDDR3_l377) begin
                  workState_1 <= `WorkState_binary_sequential_REFRESH;
                  timer_wkCnt <= 8'h08;
                end else begin
                  if(sysIO_dataRd_ready) begin
                    timer_wkCnt <= 8'h0b;
                  end else begin
                    workState_1 <= `WorkState_binary_sequential_IDLE;
                  end
                end
              end
            end
            default : begin
              if(when_slowDDR3_l391) begin
                phyIO_ras <= 1'b0;
                phyIO_bank <= sysIO_address[12 : 10];
                phyIO_address <= sysIO_address[26 : 13];
              end
              if(when_slowDDR3_l395) begin
                phyIO_cas <= 1'b0;
                phyIO_we <= 1'b0;
                phyIO_bank <= sysIO_address[12 : 10];
                phyIO_address[10] <= 1'b1;
                phyIO_address[11] <= 1'b0;
                phyIO_address[9 : 0] <= sysIO_address[9 : 0];
                dqOut <= 1'b1;
              end
              if(when_slowDDR3_l399) begin
                dqsOut <= 1'b1;
              end
              if(when_slowDDR3_l402) begin
                dqOut <= 1'b0;
                dqsOut <= 1'b0;
              end
              if(when_slowDDR3_l407) begin
                if(when_slowDDR3_l408) begin
                  workState_1 <= `WorkState_binary_sequential_REFRESH;
                  timer_wkCnt <= 8'h08;
                end else begin
                  if(sysIO_dataWr_valid) begin
                    timer_wkCnt <= 8'h11;
                  end else begin
                    workState_1 <= `WorkState_binary_sequential_IDLE;
                  end
                end
              end
            end
          endcase
        end else begin
          case(initState_1)
            `InitState_binary_sequential_WAIT0 : begin
              if(timer_tick) begin
                phyIO_rst_n <= 1'b1;
                timer_counter <= 24'h0061a8;
                initState_1 <= `InitState_binary_sequential_CKE;
              end
            end
            `InitState_binary_sequential_CKE : begin
              if(timer_tick) begin
                phyIO_cke <= 1'b1;
                timer_counter <= 24'h000008;
                initState_1 <= `InitState_binary_sequential_MRS2;
              end
            end
            `InitState_binary_sequential_MRS2 : begin
              if(timer_tick) begin
                phyIO_cas <= 1'b0;
                phyIO_ras <= 1'b0;
                phyIO_we <= 1'b0;
                phyIO_address <= 14'h0008;
                phyIO_bank <= 3'b010;
                timer_counter <= 24'h000004;
                initState_1 <= `InitState_binary_sequential_MRS3;
              end
            end
            `InitState_binary_sequential_MRS3 : begin
              if(timer_tick) begin
                phyIO_cas <= 1'b0;
                phyIO_ras <= 1'b0;
                phyIO_we <= 1'b0;
                phyIO_address <= 14'h0;
                phyIO_bank <= 3'b011;
                timer_counter <= 24'h000004;
                initState_1 <= `InitState_binary_sequential_MRS1;
              end
            end
            `InitState_binary_sequential_MRS1 : begin
              if(timer_tick) begin
                phyIO_cas <= 1'b0;
                phyIO_ras <= 1'b0;
                phyIO_we <= 1'b0;
                phyIO_address <= 14'h0001;
                phyIO_bank <= 3'b001;
                timer_counter <= 24'h000004;
                initState_1 <= `InitState_binary_sequential_MRS0;
              end
            end
            `InitState_binary_sequential_MRS0 : begin
              if(timer_tick) begin
                phyIO_cas <= 1'b0;
                phyIO_ras <= 1'b0;
                phyIO_we <= 1'b0;
                phyIO_address <= 14'h0320;
                phyIO_bank <= 3'b000;
                timer_counter <= 24'h00000c;
                initState_1 <= `InitState_binary_sequential_ZQCL;
              end
            end
            `InitState_binary_sequential_ZQCL : begin
              if(timer_tick) begin
                phyIO_we <= 1'b0;
                phyIO_address <= 14'h0400;
                timer_counter <= 24'h000400;
                initState_1 <= `InitState_binary_sequential_WAIT1;
              end
            end
            default : begin
              if(timer_tick) begin
                sysIO_initFin <= 1'b1;
                timer_counter <= 24'h000186;
              end
            end
          endcase
        end
      end
    end
  end

  always @(posedge clk) begin
    timer_tick <= (timer_counter == 24'h0);
  end

  always @(posedge inv_clk) begin
    IOArea_dqOutArea_dqReg <= sysIO_dataWr_payload;
  end

  always @(posedge _zz_1) begin
    _zz_IOArea_dqInP <= phyIO_dq[7 : 0];
  end

  always @(posedge _zz_2) begin
    _zz_IOArea_dqInN <= phyIO_dq[7 : 0];
  end

  always @(posedge _zz_3) begin
    _zz_IOArea_dqInP_1 <= phyIO_dq[15 : 8];
  end

  always @(posedge _zz_4) begin
    _zz_IOArea_dqInN_1 <= phyIO_dq[15 : 8];
  end


endmodule
