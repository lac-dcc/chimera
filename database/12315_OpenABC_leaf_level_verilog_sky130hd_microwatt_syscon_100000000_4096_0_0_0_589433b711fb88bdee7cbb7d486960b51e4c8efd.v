// This program was cloned from: https://github.com/NYU-MLDA/OpenABC
// License: BSD 3-Clause "New" or "Revised" License

module syscon_100000000_4096_0_0_0_589433b711fb88bdee7cbb7d486960b51e4c8efd(clk, rst, \wishbone_in.adr , \wishbone_in.dat , \wishbone_in.sel , \wishbone_in.cyc , \wishbone_in.stb , \wishbone_in.we , \wishbone_out.dat , \wishbone_out.ack , \wishbone_out.stall , dram_at_0, core_reset, soc_reset);
  wire _00_;
  wire _01_;
  wire _02_;
  wire _03_;
  wire _04_;
  wire _05_;
  wire _06_;
  wire _07_;
  wire [63:0] _08_;
  wire [63:0] _09_;
  wire _10_;
  wire _11_;
  wire _12_;
  wire _13_;
  wire _14_;
  wire _15_;
  wire _16_;
  wire _17_;
  wire _18_;
  wire _19_;
  wire _20_;
  wire _21_;
  wire [63:0] _22_;
  wire [31:0] _23_;
  reg [33:0] _24_;
  wire _25_;
  wire _26_;
  wire _27_;
  wire _28_;
  wire _29_;
  wire _30_;
  wire _31_;
  wire _32_;
  wire _33_;
  wire _34_;
  wire _35_;
  wire [2:0] _36_;
  reg [2:0] _37_;
  input clk;
  wire clk;
  output core_reset;
  wire core_reset;
  output dram_at_0;
  wire dram_at_0;
  wire [39:0] info_clk;
  wire [31:0] info_fl_off;
  wire info_has_bram;
  wire info_has_dram;
  wire info_has_leth;
  wire info_has_lsdc;
  wire info_has_spif;
  wire info_has_uart;
  wire info_has_urt1;
  wire [63:0] reg_braminfo;
  wire [63:0] reg_clkinfo;
  wire [2:0] reg_ctrl;
  wire [63:0] reg_ctrl_out;
  wire [63:0] reg_dramiinfo;
  wire [63:0] reg_draminfo;
  wire [63:0] reg_info;
  wire [63:0] reg_out;
  wire [63:0] reg_spiinfo;
  wire [63:0] reg_uart0info;
  wire [63:0] reg_uart1info;
  input rst;
  wire rst;
  output soc_reset;
  wire soc_reset;
  wire uinfo_16550;
  wire [31:0] uinfo_freq;
  wire [33:0] wb_rsp;
  input [29:0] \wishbone_in.adr ;
  wire [29:0] \wishbone_in.adr ;
  input \wishbone_in.cyc ;
  wire \wishbone_in.cyc ;
  input [31:0] \wishbone_in.dat ;
  wire [31:0] \wishbone_in.dat ;
  input [3:0] \wishbone_in.sel ;
  wire [3:0] \wishbone_in.sel ;
  input \wishbone_in.stb ;
  wire \wishbone_in.stb ;
  input \wishbone_in.we ;
  wire \wishbone_in.we ;
  output \wishbone_out.ack ;
  wire \wishbone_out.ack ;
  output [31:0] \wishbone_out.dat ;
  wire [31:0] \wishbone_out.dat ;
  output \wishbone_out.stall ;
  wire \wishbone_out.stall ;
  assign _00_ = 1'h0 ? 1'h1 : reg_ctrl[0];
  assign _01_ = 1'h1 ? 1'h1 : 1'h0;
  assign _02_ = 1'h1 ? 1'h1 : 1'h0;
  assign _03_ = 1'h1 ? 1'h1 : 1'h0;
  assign _04_ = 1'h1 ? 1'h1 : 1'h0;
  assign _05_ = 1'h0 ? 1'h1 : 1'h0;
  assign _06_ = 1'h0 ? 1'h1 : 1'h0;
  assign _07_ = 1'h0 ? 1'h1 : 1'h0;
  assign _08_ = 1'h1 ? 64'h0000000000000000 : 64'h0000000000000000;
  assign _09_ = 1'h1 ? 64'h0000000000000000 : 64'h0000000000000000;
  assign _10_ = 1'h1 ? 1'h1 : 1'h0;
  assign _11_ = \wishbone_in.cyc  & \wishbone_in.stb ;
  assign _12_ = \wishbone_in.adr [6:1] == 6'h00;
  assign _13_ = \wishbone_in.adr [6:1] == 6'h01;
  assign _14_ = \wishbone_in.adr [6:1] == 6'h02;
  assign _15_ = \wishbone_in.adr [6:1] == 6'h03;
  assign _16_ = \wishbone_in.adr [6:1] == 6'h06;
  assign _17_ = \wishbone_in.adr [6:1] == 6'h04;
  assign _18_ = \wishbone_in.adr [6:1] == 6'h05;
  assign _19_ = \wishbone_in.adr [6:1] == 6'h07;
  assign _20_ = \wishbone_in.adr [6:1] == 6'h08;
  assign _21_ = \wishbone_in.adr [6:1] == 6'h09;
  function [63:0] \1971 ;
    input [63:0] a;
    input [639:0] b;
    input [9:0] s;
    (* parallel_case *)
    casez (s)
      10'b?????????1:
        \1971  = b[63:0];
      10'b????????1?:
        \1971  = b[127:64];
      10'b???????1??:
        \1971  = b[191:128];
      10'b??????1???:
        \1971  = b[255:192];
      10'b?????1????:
        \1971  = b[319:256];
      10'b????1?????:
        \1971  = b[383:320];
      10'b???1??????:
        \1971  = b[447:384];
      10'b??1???????:
        \1971  = b[511:448];
      10'b?1????????:
        \1971  = b[575:512];
      10'b1?????????:
        \1971  = b[639:576];
      default:
        \1971  = a;
    endcase
  endfunction
  assign _22_ = \1971 (64'h0000000000000000, { reg_uart1info, reg_uart0info, reg_spiinfo, reg_ctrl_out, reg_clkinfo, reg_dramiinfo, reg_draminfo, reg_braminfo, reg_info, 64'hf00daa5500010001 }, { _21_, _20_, _19_, _18_, _17_, _16_, _15_, _14_, _13_, _12_ });
  assign _23_ = \wishbone_in.adr [0] ? reg_out[63:32] : reg_out[31:0];
  always @(posedge clk)
    _24_ <= wb_rsp;
  assign _25_ = \wishbone_in.cyc  & \wishbone_in.stb ;
  assign _26_ = _25_ & \wishbone_in.we ;
  assign _27_ = \wishbone_in.adr [6:1] == 6'h05;
  assign _28_ = ~ \wishbone_in.adr [0];
  assign _29_ = _27_ & _28_;
  assign _30_ = _26_ & _29_;
  assign _31_ = _30_ ? \wishbone_in.dat [2] : reg_ctrl[2];
  assign _32_ = reg_ctrl[2] ? 1'h0 : _31_;
  assign _33_ = _30_ ? \wishbone_in.dat [1] : reg_ctrl[1];
  assign _34_ = reg_ctrl[1] ? 1'h0 : _33_;
  assign _35_ = _30_ ? \wishbone_in.dat [0] : reg_ctrl[0];
  assign _36_ = rst ? 3'h0 : { _32_, _34_, _35_ };
  always @(posedge clk)
    _37_ <= _36_;
  assign reg_out = _22_;
  assign reg_ctrl = _37_;
  assign reg_ctrl_out = { 61'h0000000000000000, reg_ctrl };
  assign reg_info = { 55'h00000000000000, info_has_lsdc, 1'h0, info_has_urt1, 1'h1, info_has_leth, info_has_spif, info_has_bram, info_has_dram, info_has_uart };
  assign reg_braminfo = 64'h0000000000001000;
  assign reg_draminfo = _08_;
  assign reg_dramiinfo = _09_;
  assign reg_clkinfo = { 24'h000000, info_clk };
  assign reg_spiinfo = { 32'h00000000, info_fl_off };
  assign reg_uart0info = { 31'h00000000, uinfo_16550, uinfo_freq };
  assign reg_uart1info = { 32'h00000001, uinfo_freq };
  assign info_has_dram = _02_;
  assign info_has_bram = _03_;
  assign info_has_uart = _01_;
  assign info_has_spif = _04_;
  assign info_has_leth = _05_;
  assign info_has_lsdc = _06_;
  assign info_has_urt1 = _07_;
  assign info_clk = 40'h0005f5e100;
  assign info_fl_off = 32'd0;
  assign uinfo_16550 = _10_;
  assign uinfo_freq = 32'd100000000;
  assign wb_rsp = { 1'h0, _11_, _23_ };
  assign \wishbone_out.dat  = _24_[31:0];
  assign \wishbone_out.ack  = _24_[32];
  assign \wishbone_out.stall  = _24_[33];
  assign dram_at_0 = _00_;
  assign core_reset = reg_ctrl[1];
  assign soc_reset = reg_ctrl[2];
endmodule