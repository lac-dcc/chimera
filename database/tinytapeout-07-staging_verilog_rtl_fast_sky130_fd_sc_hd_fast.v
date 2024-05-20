// This program was cloned from: https://github.com/TinyTapeout/tinytapeout-07-staging
// License: Apache License 2.0

// sky130_fd_sc_hd_fast.v
// These are simplistic, fast simulation models of the standard library cells
// required by TinyTapeout. The motiviation for having these is that Verilator
// cannot digest the 'primitive' definitions provided in the PDK, as it does not
// support the 'table' construct. Therefore these models stand-in for the PDK
// models testbench simulation.

module sky130_fd_sc_hd__udp_mux_2to1 (
    output wire X ,
    input  wire A0,
    input  wire A1,
    input  wire S
);

    assign X = S ? A1 : A0;

endmodule

module sky130_fd_sc_hd__udp_mux_4to2 (
    output wire X ,
    input  wire A0,
    input  wire A1,
    input  wire A2,
    input  wire A3,
    input  wire S0,
    input  wire S1
);

    wire [3:0] all_inputs;
    wire [1:0] all_select;

    assign all_inputs = {A3, A2, A1, A0};
    assign all_select = {S1, S0};

    assign X = all_inputs[all_select];

endmodule

module sky130_fd_sc_hd__udp_mux_2to1_N (
    output wire Y ,
    input  wire A0,
    input  wire A1,
    input  wire S
);

    assign Y = ~(S ? A1 : A0);

endmodule

module sky130_fd_sc_hd__udp_dlatch$lP_pp$PG$N (
    output reg  Q       ,
    input  wire D       ,
    input  wire GATE    ,
    input  wire NOTIFIER,
    input  wire VPWR    ,
    input  wire VGND
);

    always @(*) begin
        if (GATE) Q <= D;
    end

    wire _unused;
    assign _unused = &{ 1'b0, NOTIFIER, VPWR, VGND };

endmodule

module sky130_fd_sc_hd__udp_dlatch$PR_pp$PG$N (
    output reg  Q       ,
    input  wire D       ,
    input  wire GATE    ,
    input  wire RESET   ,
    input  wire NOTIFIER,
    input  wire VPWR    ,
    input  wire VGND
);

    always @(*) begin
        if (RESET) begin
            Q <= 'd0;
        end if (GATE) begin
            Q <= D;
        end
    end

    wire _unused;
    assign _unused = &{ 1'b0, NOTIFIER, VPWR, VGND };

endmodule

module sky130_fd_sc_hd__udp_dlatch$P_pp$PG$N (
    output reg  Q       ,
    input  wire D       ,
    input  wire GATE    ,
    input  wire NOTIFIER,
    input  wire VPWR    ,
    input  wire VGND
);

    always @(*) begin
        if (GATE) Q <= D;
    end

    wire _unused;
    assign _unused = &{ 1'b0, NOTIFIER, VPWR, VGND };

endmodule

module sky130_fd_sc_hd__udp_dff$P_pp$PG$N (
    output reg  Q       ,
    input  wire D       ,
    input  wire CLK     ,
    input  wire NOTIFIER,
    input  wire VPWR    ,
    input  wire VGND
);

    always @(posedge CLK) begin
        Q <= D;
    end

    wire _unused;
    assign _unused = &{ 1'b0, NOTIFIER, VPWR, VGND };

endmodule

module sky130_fd_sc_hd__udp_dff$PS_pp$PG$N (
    output reg  Q       ,
    input  wire D       ,
    input  wire CLK     ,
    input  wire SET    ,
    input  wire NOTIFIER,
    input  wire VPWR    ,
    input  wire VGND
);

    always @(posedge CLK, posedge SET) begin
        if (SET) begin
            Q <= 1'b1;
        end else begin
            Q <= D;
        end
    end

    wire _unused;
    assign _unused = &{ 1'b0, NOTIFIER, VPWR, VGND };

endmodule

module sky130_fd_sc_hd__udp_dff$PR_pp$PG$N (
    output reg  Q       ,
    input  wire D       ,
    input  wire CLK     ,
    input  wire RESET   ,
    input  wire NOTIFIER,
    input  wire VPWR    ,
    input  wire VGND
);

    always @(posedge CLK, posedge RESET) begin
        if (RESET) begin
            Q <= 1'b0;
        end else begin
            Q <= D;
        end
    end

    wire _unused;
    assign _unused = &{ 1'b0, NOTIFIER, VPWR, VGND };

endmodule

module sky130_fd_sc_hd__udp_dff$NSR_pp$PG$N (
    output reg  Q       ,
    input  wire SET     ,
    input  wire RESET   ,
    input  wire CLK_N   ,
    input  wire D       ,
    input  wire NOTIFIER,
    input  wire VPWR    ,
    input  wire VGND
);

    always @(negedge CLK_N, posedge RESET, posedge SET) begin
        if (RESET) begin
            Q <= 1'b0;
        end else if (SET) begin
            Q <= 1'b1;
        end else begin
            Q <= D;
        end
    end

    wire _unused;
    assign _unused = &{ 1'b0, NOTIFIER, VPWR, VGND };

endmodule

module sky130_fd_sc_hd__udp_pwrgood_pp$G (
    output wire UDP_OUT,
    input  wire UDP_IN ,
    input  wire VGND
);

    assign UDP_OUT = UDP_IN && !VGND;

endmodule

module sky130_fd_sc_hd__udp_pwrgood_pp$P (
    output wire UDP_OUT,
    input  wire UDP_IN ,
    input  wire VPWR
);

    assign UDP_OUT = UDP_IN && VPWR;

endmodule

module sky130_fd_sc_hd__udp_pwrgood_pp$PG (
    output wire UDP_OUT,
    input  wire UDP_IN ,
    input  wire VPWR   ,
    input  wire VGND
);

    assign UDP_OUT = UDP_IN && VPWR && !VGND;

endmodule

module sky130_fd_sc_hd__udp_pwrgood$l_pp$PG (
    output wire UDP_OUT,
    input  wire UDP_IN ,
    input  wire VPWR   ,
    input  wire VGND
);

    assign UDP_OUT = UDP_IN && VPWR && !VGND;

endmodule

module sky130_fd_sc_hd__udp_pwrgood$l_pp$PG$S (
    output wire UDP_OUT,
    input  wire UDP_IN ,
    input  wire VPWR   ,
    input  wire VGND   ,
    input  wire SLEEP
);

    assign UDP_OUT = UDP_IN && VPWR && !VGND && !SLEEP;

endmodule


module sky130_fd_sc_hd__a211o_1(
    output wire X   ,
    input  wire A1  ,
    input  wire A2  ,
    input  wire B1  ,
    input  wire C1  ,
    input  wire VPWR,
    input  wire VGND,
    input  wire VPB ,
    input  wire VNB
);

    assign X = ((A1 & A2) | B1 | C1);

    wire _unused;
    assign _unused = &{ 1'b0, VPWR, VGND, VPB, VNB };

endmodule

module sky130_fd_sc_hd__a31o_1(
    output wire X   ,
    input  wire A1  ,
    input  wire A2  ,
    input  wire A3  ,
    input  wire B1  ,
    input  wire VPWR,
    input  wire VGND,
    input  wire VPB ,
    input  wire VNB
);

    assign X = ((A1 & A2 & A3) | B1);

    wire _unused;
    assign _unused = &{ 1'b0, VPWR, VGND, VPB, VNB };

endmodule

module sky130_fd_sc_hd__and2_1(
    output wire X   ,
    input  wire A   ,
    input  wire B   ,
    input  wire VPWR,
    input  wire VGND,
    input  wire VPB ,
    input  wire VNB
);

    assign X = A & B;

    wire _unused;
    assign _unused = &{ 1'b0, VPWR, VGND, VPB, VNB };

endmodule

module sky130_fd_sc_hd__and2_4(
    output wire X   ,
    input  wire A   ,
    input  wire B   ,
    input  wire VPWR,
    input  wire VGND,
    input  wire VPB ,
    input  wire VNB
);

    assign X = A & B;

    wire _unused;
    assign _unused = &{ 1'b0, VPWR, VGND, VPB, VNB };

endmodule

module sky130_fd_sc_hd__and2b_1(
    output wire X   ,
    input  wire A_N ,
    input  wire B   ,
    input  wire VPWR,
    input  wire VGND,
    input  wire VPB ,
    input  wire VNB
);

    assign X = (~A_N) & B;

    wire _unused;
    assign _unused = &{ 1'b0, VPWR, VGND, VPB, VNB };

endmodule

module sky130_fd_sc_hd__and2b_2(
    output wire X   ,
    input  wire A_N ,
    input  wire B   ,
    input  wire VPWR,
    input  wire VGND,
    input  wire VPB ,
    input  wire VNB
);

    assign X = (~A_N) & B;

    wire _unused;
    assign _unused = &{ 1'b0, VPWR, VGND, VPB, VNB };

endmodule

module sky130_fd_sc_hd__and3b_1(
    output wire X   ,
    input  wire A_N ,
    input  wire B   ,
    input  wire C   ,
    input  wire VPWR,
    input  wire VGND,
    input  wire VPB ,
    input  wire VNB
);

    assign X = (~A_N) & B & C;

    wire _unused;
    assign _unused = &{ 1'b0, VPWR, VGND, VPB, VNB };

endmodule

module sky130_fd_sc_hd__and3b_4(
    output wire X   ,
    input  wire A_N ,
    input  wire B   ,
    input  wire C   ,
    input  wire VPWR,
    input  wire VGND,
    input  wire VPB ,
    input  wire VNB
);

    assign X = (~A_N) & B & C;

    wire _unused;
    assign _unused = &{ 1'b0, VPWR, VGND, VPB, VNB };

endmodule

module sky130_fd_sc_hd__and4_1(
    output wire X   ,
    input  wire A   ,
    input  wire B   ,
    input  wire C   ,
    input  wire D   ,
    input  wire VPWR,
    input  wire VGND,
    input  wire VPB ,
    input  wire VNB
);

    assign X = A & B & C & D;

    wire _unused;
    assign _unused = &{ 1'b0, VPWR, VGND, VPB, VNB };

endmodule

module sky130_fd_sc_hd__and4b_1(
    output wire X   ,
    input  wire A_N ,
    input  wire B   ,
    input  wire C   ,
    input  wire D   ,
    input  wire VPWR,
    input  wire VGND,
    input  wire VPB ,
    input  wire VNB
);

    assign X = (~A_N) & B & C & D;

    wire _unused;
    assign _unused = &{ 1'b0, VPWR, VGND, VPB, VNB };

endmodule

module sky130_fd_sc_hd__and4bb_1(
    output wire X   ,
    input  wire A_N ,
    input  wire B_N ,
    input  wire C   ,
    input  wire D   ,
    input  wire VPWR,
    input  wire VGND,
    input  wire VPB ,
    input  wire VNB
);

    assign X = (~A_N) & (~B_N) & C & D;

    wire _unused;
    assign _unused = &{ 1'b0, VPWR, VGND, VPB, VNB };

endmodule

module sky130_fd_sc_hd__buf_1(
    output wire X   ,
    input  wire A   ,
    input  wire VPWR,
    input  wire VGND,
    input  wire VPB ,
    input  wire VNB
);

    assign X = A;

    wire _unused;
    assign _unused = &{ 1'b0, VPWR, VGND, VPB, VNB };

endmodule

module sky130_fd_sc_hd__buf_2(
    output wire X   ,
    input  wire A   ,
    input  wire VPWR,
    input  wire VGND,
    input  wire VPB ,
    input  wire VNB
);

    assign X = A;

    wire _unused;
    assign _unused = &{ 1'b0, VPWR, VGND, VPB, VNB };

endmodule

module sky130_fd_sc_hd__buf_4(
    output wire X   ,
    input  wire A   ,
    input  wire VPWR,
    input  wire VGND,
    input  wire VPB ,
    input  wire VNB
);

    assign X = A;

    wire _unused;
    assign _unused = &{ 1'b0, VPWR, VGND, VPB, VNB };

endmodule

module sky130_fd_sc_hd__clkinv_2(
    output wire Y   ,
    input  wire A   ,
    input  wire VPWR,
    input  wire VGND,
    input  wire VPB ,
    input  wire VNB
);

    assign Y = ~A;

    wire _unused;
    assign _unused = &{ 1'b0, VPWR, VGND, VPB, VNB };

endmodule

module sky130_fd_sc_hd__clkinv_4(
    output wire Y   ,
    input  wire A   ,
    input  wire VPWR,
    input  wire VGND,
    input  wire VPB ,
    input  wire VNB
);

    assign Y = ~A;

    wire _unused;
    assign _unused = &{ 1'b0, VPWR, VGND, VPB, VNB };

endmodule

module sky130_fd_sc_hd__clkbuf_2(
    output wire X   ,
    input  wire A   ,
    input  wire VPWR,
    input  wire VGND,
    input  wire VPB ,
    input  wire VNB
);

    assign X = A;

    wire _unused;
    assign _unused = &{ 1'b0, VPWR, VGND, VPB, VNB };

endmodule

module sky130_fd_sc_hd__clkbuf_4(
    output wire X   ,
    input  wire A   ,
    input  wire VPWR,
    input  wire VGND,
    input  wire VPB ,
    input  wire VNB
);

    assign X = A;

    wire _unused;
    assign _unused = &{ 1'b0, VPWR, VGND, VPB, VNB };

endmodule

module sky130_fd_sc_hd__clkbuf_8(
    output wire X   ,
    input  wire A   ,
    input  wire VPWR,
    input  wire VGND,
    input  wire VPB ,
    input  wire VNB
);

    assign X = A;

    wire _unused;
    assign _unused = &{ 1'b0, VPWR, VGND, VPB, VNB };

endmodule

module sky130_fd_sc_hd__clkdlybuf4s25_1(
    output wire X   ,
    input  wire A   ,
    input  wire VPWR,
    input  wire VGND,
    input  wire VPB ,
    input  wire VNB
);

    assign X = A;

    wire _unused;
    assign _unused = &{ 1'b0, VPWR, VGND, VPB, VNB };

endmodule

module sky130_fd_sc_hd__clkdlybuf4s50_1(
    output wire X   ,
    input  wire A   ,
    input  wire VPWR,
    input  wire VGND,
    input  wire VPB ,
    input  wire VNB
);

    assign X = A;

    wire _unused;
    assign _unused = &{ 1'b0, VPWR, VGND, VPB, VNB };

endmodule

module sky130_fd_sc_hd__clkinv_1(
    output wire Y   ,
    input  wire A   ,
    input  wire VPWR,
    input  wire VGND,
    input  wire VPB ,
    input  wire VNB
);

    assign Y = ~A;

    wire _unused;
    assign _unused = &{ 1'b0, VPWR, VGND, VPB, VNB };

endmodule

module sky130_fd_sc_hd__dfrtp_4(
    output reg  Q      ,
    input  wire CLK    ,
    input  wire D      ,
    input  wire RESET_B,
    input  wire VPWR   ,
    input  wire VGND   ,
    input  wire VPB    ,
    input  wire VNB
);

    wire RESET = ~RESET_B;

    always @(posedge CLK, posedge RESET) begin
        if (RESET) Q <= 'd0;
        else       Q <= D;
    end

    wire _unused;
    assign _unused = &{ 1'b0, VPWR, VGND, VPB, VNB };

endmodule

module sky130_fd_sc_hd__dfrtn_1(
    output reg  Q      ,
    input  wire CLK_N  ,
    input  wire D      ,
    input  wire RESET_B,
    input  wire VPWR   ,
    input  wire VGND   ,
    input  wire VPB    ,
    input  wire VNB
);

    wire CLK   = ~CLK_N;
    wire RESET = ~RESET_B;

    always @(posedge CLK, posedge RESET) begin
        if (RESET) Q <= 'd0;
        else       Q <= D;
    end

    wire _unused;
    assign _unused = &{ 1'b0, VPWR, VGND, VPB, VNB };

endmodule

module sky130_fd_sc_hd__dfrtp_1(
    output reg  Q      ,
    input  wire CLK    ,
    input  wire D      ,
    input  wire RESET_B,
    input  wire VPWR   ,
    input  wire VGND   ,
    input  wire VPB    ,
    input  wire VNB
);

    wire RESET = ~RESET_B;

    always @(posedge CLK, posedge RESET) begin
        if (RESET) Q <= 'd0;
        else       Q <= D;
    end

    wire _unused;
    assign _unused = &{ 1'b0, VPWR, VGND, VPB, VNB };

endmodule

module sky130_fd_sc_hd__dfsbp_1(
    output reg  Q    ,
    output wire Q_N  ,
    input  wire CLK  ,
    input  wire D    ,
    input  wire SET_B,
    input  wire VPWR ,
    input  wire VGND ,
    input  wire VPB  ,
    input  wire VNB
);

    wire SET = ~SET_B;

    always @(posedge CLK, posedge SET) begin
        if (SET) Q <= 'd1;
        else     Q <= D;
    end

    wire _unused;
    assign _unused = &{ 1'b0, VPWR, VGND, VPB, VNB };

assign Q_N = ~Q;

endmodule

module sky130_fd_sc_hd__dfxtp_1(
    output reg  Q   ,
    input  wire CLK ,
    input  wire D   ,
    input  wire VPWR,
    input  wire VGND,
    input  wire VPB ,
    input  wire VNB
);

    always @(posedge CLK) begin
        Q <= D;
    end

    wire _unused;
    assign _unused = &{ 1'b0, VPWR, VGND, VPB, VNB };

endmodule

module sky130_fd_sc_hd__dfxtp_4(
    output reg  Q   ,
    input  wire CLK ,
    input  wire D   ,
    input  wire VPWR,
    input  wire VGND,
    input  wire VPB ,
    input  wire VNB
);

    always @(posedge CLK) begin
        Q <= D;
    end

    wire _unused;
    assign _unused = &{ 1'b0, VPWR, VGND, VPB, VNB };

endmodule

module sky130_fd_sc_hd__dlclkp_1(
    output wire GCLK,
    input  wire GATE,
    input  wire CLK ,
    input  wire VPWR,
    input  wire VGND,
    input  wire VPB ,
    input  wire VNB
);

    reg gate_q;

    always @(negedge CLK) gate_q <= GATE;

    assign GCLK = gate_q & CLK;

    wire _unused;
    assign _unused = &{ 1'b0, VPWR, VGND, VPB, VNB };

endmodule

module sky130_fd_sc_hd__dlxtn_1(
    output reg  Q     ,
    input  wire D     ,
    input  wire GATE_N,
    input  wire VPWR  ,
    input  wire VGND  ,
    input  wire VPB   ,
    input  wire VNB
);

    always @(GATE_N, D) begin
        if (~GATE_N) Q <= D;
    end

    wire _unused;
    assign _unused = &{ 1'b0, VPWR, VGND, VPB, VNB };

endmodule

module sky130_fd_sc_hd__dlxtn_4(
    output reg  Q     ,
    input  wire D     ,
    input  wire GATE_N,
    input  wire VPWR  ,
    input  wire VGND  ,
    input  wire VPB   ,
    input  wire VNB
);

    always @(GATE_N, D) begin
        if (~GATE_N) Q <= D;
    end

    wire _unused;
    assign _unused = &{ 1'b0, VPWR, VGND, VPB, VNB };

endmodule

module sky130_fd_sc_hd__dlxtp_1(
    output reg  Q   ,
    input  wire D   ,
    input  wire GATE,
    input  wire VPWR,
    input  wire VGND,
    input  wire VPB ,
    input  wire VNB
);

    always @(GATE, D) begin
        if (GATE) Q <= D;
    end

    wire _unused;
    assign _unused = &{ 1'b0, VPWR, VGND, VPB, VNB };

endmodule

module sky130_fd_sc_hd__ebufn_1(
    output wire Z   ,
    input  wire A   ,
    input  wire TE_B,
    input  wire VPWR,
    input  wire VGND,
    input  wire VPB ,
    input  wire VNB
);

    assign Z = (~TE_B) ? A : 1'dZ;

    wire _unused;
    assign _unused = &{ 1'b0, VPWR, VGND, VPB, VNB };

endmodule

module sky130_fd_sc_hd__einvp_2(
    output wire Z   ,
    input  wire A   ,
    input  wire TE  ,
    input  wire VPWR,
    input  wire VGND,
    input  wire VPB ,
    input  wire VNB
);

    assign Z = TE ? (~A) : 1'dZ;

    wire _unused;
    assign _unused = &{ 1'b0, VPWR, VGND, VPB, VNB };

endmodule

module sky130_fd_sc_hd__fa_1(
    output wire COUT,
    output wire SUM ,
    input  wire A   ,
    input  wire B   ,
    input  wire CIN ,
    input  wire VPWR,
    input  wire VGND,
    input  wire VPB ,
    input  wire VNB
);

    assign { COUT, SUM } = (A + B + CIN);

    wire _unused;
    assign _unused = &{ 1'b0, VPWR, VGND, VPB, VNB };

endmodule

module sky130_fd_sc_hd__fa_2(
    output wire COUT,
    output wire SUM ,
    input  wire A   ,
    input  wire B   ,
    input  wire CIN ,
    input  wire VPWR,
    input  wire VGND,
    input  wire VPB ,
    input  wire VNB
);

    assign { COUT, SUM } = (A + B + CIN);

    wire _unused;
    assign _unused = &{ 1'b0, VPWR, VGND, VPB, VNB };

endmodule

module sky130_fd_sc_hd__inv_1(
    output wire Y   ,
    input  wire A   ,
    input  wire VPWR,
    input  wire VGND,
    input  wire VPB ,
    input  wire VNB
);

    assign Y = ~A;

    wire _unused;
    assign _unused = &{ 1'b0, VPWR, VGND, VPB, VNB };

endmodule

module sky130_fd_sc_hd__inv_4(
    output wire Y   ,
    input  wire A   ,
    input  wire VPWR,
    input  wire VGND,
    input  wire VPB ,
    input  wire VNB
);

    assign Y = ~A;

    wire _unused;
    assign _unused = &{ 1'b0, VPWR, VGND, VPB, VNB };

endmodule

module sky130_fd_sc_hd__mux2_1(
    output wire X   ,
    input  wire A0  ,
    input  wire A1  ,
    input  wire S   ,
    input  wire VPWR,
    input  wire VGND,
    input  wire VPB ,
    input  wire VNB
);

    assign X = S ? A1 : A0;

    wire _unused;
    assign _unused = &{ 1'b0, VPWR, VGND, VPB, VNB };

endmodule

module sky130_fd_sc_hd__mux2i_1(
    output wire Y   ,
    input  wire A0  ,
    input  wire A1  ,
    input  wire S   ,
    input  wire VPWR,
    input  wire VGND,
    input  wire VPB ,
    input  wire VNB
);

    assign Y = ~(S ? A1 : A0);

    wire _unused;
    assign _unused = &{ 1'b0, VPWR, VGND, VPB, VNB };

endmodule

module sky130_fd_sc_hd__mux4_1(
    output wire X   ,
    input  wire A0  ,
    input  wire A1  ,
    input  wire A2  ,
    input  wire A3  ,
    input  wire S0  ,
    input  wire S1  ,
    input  wire VPWR,
    input  wire VGND,
    input  wire VPB ,
    input  wire VNB
);

    wire [3:0] choices = { A3, A2, A1, A0 };
    wire [1:0] selects = { S1, S0 };

    assign X = choices[selects];

    wire _unused;
    assign _unused = &{ 1'b0, VPWR, VGND, VPB, VNB };

endmodule

module sky130_fd_sc_hd__nand2_1(
    output wire Y   ,
    input  wire A   ,
    input  wire B   ,
    input  wire VPWR,
    input  wire VGND,
    input  wire VPB ,
    input  wire VNB
);

    assign Y = ~(A & B);

    wire _unused;
    assign _unused = &{ 1'b0, VPWR, VGND, VPB, VNB };

endmodule

module sky130_fd_sc_hd__nand2_2(
    output wire Y   ,
    input  wire A   ,
    input  wire B   ,
    input  wire VPWR,
    input  wire VGND,
    input  wire VPB ,
    input  wire VNB
);

    assign Y = ~(A & B);

    wire _unused;
    assign _unused = &{ 1'b0, VPWR, VGND, VPB, VNB };

endmodule

module sky130_fd_sc_hd__nand3_2(
    output wire Y   ,
    input  wire A   ,
    input  wire B   ,
    input  wire C   ,
    input  wire VPWR,
    input  wire VGND,
    input  wire VPB ,
    input  wire VNB
);

    assign Y = ~(A & B & C);

    wire _unused;
    assign _unused = &{ 1'b0, VPWR, VGND, VPB, VNB };

endmodule

module sky130_fd_sc_hd__nand4_1(
    output wire Y   ,
    input  wire A   ,
    input  wire B   ,
    input  wire C   ,
    input  wire D   ,
    input  wire VPWR,
    input  wire VGND,
    input  wire VPB ,
    input  wire VNB
);

    assign Y = ~(A & B & C & D);

    wire _unused;
    assign _unused = &{ 1'b0, VPWR, VGND, VPB, VNB };

endmodule

module sky130_fd_sc_hd__nand4b_1(
    output wire Y   ,
    input  wire A_N ,
    input  wire B   ,
    input  wire C   ,
    input  wire D   ,
    input  wire VPWR,
    input  wire VGND,
    input  wire VPB ,
    input  wire VNB
);

    assign Y = ~((~A_N) & B & C & D);

    wire _unused;
    assign _unused = &{ 1'b0, VPWR, VGND, VPB, VNB };

endmodule

module sky130_fd_sc_hd__nand4bb_1(
    output wire Y   ,
    input  wire A_N ,
    input  wire B_N ,
    input  wire C   ,
    input  wire D   ,
    input  wire VPWR,
    input  wire VGND,
    input  wire VPB ,
    input  wire VNB
);

    assign Y = ~((~A_N) & (~B_N) & C & D);

    wire _unused;
    assign _unused = &{ 1'b0, VPWR, VGND, VPB, VNB };

endmodule

module sky130_fd_sc_hd__nor2_1(
    output wire Y   ,
    input  wire A   ,
    input  wire B   ,
    input  wire VPWR,
    input  wire VGND,
    input  wire VPB ,
    input  wire VNB
);

    assign Y = ~(A | B);

    wire _unused;
    assign _unused = &{ 1'b0, VPWR, VGND, VPB, VNB };

endmodule

module sky130_fd_sc_hd__nor4_1(
    output wire Y   ,
    input  wire A   ,
    input  wire B   ,
    input  wire C   ,
    input  wire D   ,
    input  wire VPWR,
    input  wire VGND,
    input  wire VPB ,
    input  wire VNB
);

    assign Y = ~(A | B | C | D);

    wire _unused;
    assign _unused = &{ 1'b0, VPWR, VGND, VPB, VNB };

endmodule

module sky130_fd_sc_hd__nor4b_1(
    output wire Y   ,
    input  wire A   ,
    input  wire B   ,
    input  wire C   ,
    input  wire D_N ,
    input  wire VPWR,
    input  wire VGND,
    input  wire VPB ,
    input  wire VNB
);

    assign Y = ~(A | B | C | (~D_N));

    wire _unused;
    assign _unused = &{ 1'b0, VPWR, VGND, VPB, VNB };

endmodule

module sky130_fd_sc_hd__o21a_1(
    output wire X   ,
    input  wire A1  ,
    input  wire A2  ,
    input  wire B1  ,
    input  wire VPWR,
    input  wire VGND,
    input  wire VPB ,
    input  wire VNB
);

    assign X = ((A1 | A2) & B1);

    wire _unused;
    assign _unused = &{ 1'b0, VPWR, VGND, VPB, VNB };

endmodule

module sky130_fd_sc_hd__or4_1(
    output wire X   ,
    input  wire A   ,
    input  wire B   ,
    input  wire C   ,
    input  wire D   ,
    input  wire VPWR,
    input  wire VGND,
    input  wire VPB ,
    input  wire VNB
);

    assign X = A | B | C | D;

    wire _unused;
    assign _unused = &{ 1'b0, VPWR, VGND, VPB, VNB };

endmodule

module sky130_fd_sc_hd__or4b_1(
    output wire X   ,
    input  wire A   ,
    input  wire B   ,
    input  wire C   ,
    input  wire D_N ,
    input  wire VPWR,
    input  wire VGND,
    input  wire VPB ,
    input  wire VNB
);

    assign X = A | B | C | (~D_N);

    wire _unused;
    assign _unused = &{ 1'b0, VPWR, VGND, VPB, VNB };

endmodule

module sky130_fd_sc_hd__sdfxtp_1(
    output reg  Q   ,
    input  wire CLK ,
    input  wire D   ,
    input  wire SCD ,
    input  wire SCE ,
    input  wire VPWR,
    input  wire VGND,
    input  wire VPB ,
    input  wire VNB
);

    wire choice;
    assign choice = SCE ? SCD : D;

    always @(posedge CLK) begin
        Q <= choice;
    end

    wire _unused;
    assign _unused = &{ 1'b0, VPWR, VGND, VPB, VNB };

endmodule

module sky130_fd_sc_hd__xnor2_1(
    output wire Y   ,
    input  wire A   ,
    input  wire B   ,
    input  wire VPWR,
    input  wire VGND,
    input  wire VPB ,
    input  wire VNB
);

    assign Y = !(A ^ B);

    wire _unused;
    assign _unused = &{ 1'b0, VPWR, VGND, VPB, VNB };

endmodule

module sky130_fd_sc_hd__xor2_1(
    output wire X   ,
    input  wire A   ,
    input  wire B   ,
    input  wire VPWR,
    input  wire VGND,
    input  wire VPB ,
    input  wire VNB
);
    assign X = A ^ B;

    wire _unused;
    assign _unused = &{ 1'b0, VPWR, VGND, VPB, VNB };

endmodule
