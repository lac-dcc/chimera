`include "tune.v"

// PentEvo project (c) NedoPC 2008-2009
//
// Z80 memory manager: routes ROM/RAM accesses, makes wait-states for 14MHz or stall condition, etc.
//
//
// clk    _/`\_/`\_/`\_/`\_/`\_/`\_/`\_/`\_/`\_/`\_/`\_/`\_/`\_/`\_/`\_/`\_/`\_/`\_/`\_/`\_/`\_/`\_/`\_/`\_/`\_/`\_/`\_/`\_/`\_/`\_/`\
//          |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
// zclk     /```\___/```\___/```\___/```````\_______/```````\_______/```````````````\_______________/```````````````\_______________/`
//          |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
// zpos     `\___/```\___/```\___/```\___________/```\___________/```\___________________________/```\___________________________/```\
//          |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
// zneg     _/```\___/```\___/```\_______/```\___________/```\___________________/```\___________________________/```\________________

module zmem
(
  input  wire clk,
  input  wire c1, c2, c3,
  input  wire zneg, // strobes which show positive and negative edges of zclk

// Z80
  input  wire        rst,
  input  wire [15:0] za,
  output wire [ 7:0] zd_out,  // output to Z80 bus
  output wire        zd_ena,         // output to Z80 bus enable

  input  wire        opfetch,
  input  wire        opfetch_s,
  input  wire        memrd,
  input  wire        memwr,
  input  wire        memwr_s,

  input  wire [ 1:0] turbo,     // 2'b00 - 3.5,
                                // 2'b01 - 7.0,
                                // 2'b1x - 14.0
  input wire [3:0]   cache_en,
  input wire [3:0]   memconf,
  input wire [31:0]  xt_page,

  output wire [4:0]  rompg,
  output wire        csrom,
  output wire        romoe_n,
  output wire        romwe_n,

  output wire        dos,
  output wire        dos_on,
  output wire        dos_off,
  output wire        vdos,
  output reg         pre_vdos,
  input  wire        vdos_on,
  input  wire        vdos_off,

// DRAM
  output wire        cpu_req,
  output wire [20:0] cpu_addr,
  output wire        cpu_wrbsel,
  input  wire [15:0] cpu_rddata,
  input  wire        cpu_next,
  input  wire        cpu_strobe,
  input  wire        cpu_latch,
  output wire        cpu_stall    // for zclock
);

  // controls
  wire rom128   = memconf[0];
  wire w0_we    = memconf[1];
  wire w0_map_n = memconf[2];
  wire w0_ram   = memconf[3];

  // pager
  wire [7:0] xtpage[0:3];
  assign xtpage[0] = vdos ? 8'hFF : {xt_page[7:2], w0_map_n ? xt_page[1:0] : {~dos, rom128}};
  assign xtpage[1] = xt_page[15:8];
  assign xtpage[2] = xt_page[23:16];
  assign xtpage[3] = xt_page[31:24];

  wire [1:0] win = za[15:14];
  wire win0 = ~|win;
  wire ramwr_en = !win0 || w0_we || vdos;
  wire rom_n_ram = win0 && !w0_ram && !vdos;
  wire [7:0] page = xtpage[win];

  // DOS signal control
  reg dos_r;

  assign dos_on = win0 && opfetch_s && (za[13:8]==6'h3D) && rom128 && !w0_map_n;
  assign dos_off = !win0 && opfetch_s && !vdos;
  assign dos = (dos_on || dos_off) ^^ dos_r;    // to make dos appear 1 clock earlier than dos_r

  always @(posedge clk)
  if (rst)
    dos_r <= 1'b0;

  else if (dos_off)
    dos_r <= 1'b0;
  else if (dos_on)
    dos_r <= 1'b1;

  // VDOS signal control
  // vdos switching is delayed till next opfetch due to INIR that writes right after iord cycle

  reg vdos_r;

  assign vdos = opfetch ? pre_vdos : vdos_r;  // vdos appears as soon as first opfetch

  always @(posedge clk)
  if (rst || vdos_off)
  begin
    pre_vdos <= 1'b0;
    vdos_r <= 1'b0;
  end
  else if (vdos_on)
    pre_vdos <= 1'b1;
  else if (opfetch_s)
    vdos_r <= pre_vdos;

  // RAM
  wire cache_hit_en;
  assign zd_ena = !rom_n_ram && memrd;
  wire ramreq = !rom_n_ram && ((memrd && !cache_hit_en) || (memwr && ramwr_en));

// address, data in and data out
  wire [15:0] cache_d;
  wire cache_v;

  assign cpu_wrbsel = za[0];
  assign cpu_addr[20:0] = {page, za[13:1]};
  wire [15:0] mem_d = cpu_latch ? cpu_rddata : cache_d;
  assign zd_out = ~cpu_wrbsel ? mem_d[7:0] : mem_d[15:8];

// Z80 controls

// 7/3.5MHz support
  reg ramreq_r;
  reg pre_ramreq_r;
  reg pending_cpu_req;
  reg stall14_cycrd;
  reg stall14_fin;

  wire dram_beg = ramreq && !pre_ramreq_r && zneg;
  wire cpureq_357 = ramreq && !ramreq_r;
  wire cpureq_14 = dram_beg || pending_cpu_req;
  wire stall357 = cpureq_357 && !cpu_next;
  wire stall14_ini = dram_beg && (!cpu_next || opfetch || memrd);  // no wait at all in write cycles, if next dram cycle is available
  wire stall14_cyc = memrd ? stall14_cycrd : !cpu_next;
  wire stall14 = stall14_ini || stall14_cyc || stall14_fin;

  wire turbo14 = turbo[1];
  assign cpu_req = turbo14 ? cpureq_14 : cpureq_357;
  assign cpu_stall = turbo14 ? stall14 : stall357;

// 14MHz support
  // wait tables:
  //
  // M1 opcode fetch, dram_beg concurs with:
  // c3:      +3
  // c2:      +4
  // c1:      +5
  // c0:      +6
  //
  // memory read, dram_beg concurs with:
  // c3:      +2
  // c2:      +3
  // c1:      +4
  // c0:      +5
  //
  // memory write: no wait
  //
  // special case: if dram_beg pulses 1 when cpu_next is 0,
  // unconditional wait has to be performed until cpu_next is 1, and
  // then wait as if dram_beg would concur with c0

  // memrd, opfetch - wait till c3 && cpu_next,
  // memwr - wait till cpu_next

  always @(posedge clk)
    if (c3 && !cpu_stall)
      ramreq_r <= ramreq;

  always @(posedge clk)
    if (zneg)
      pre_ramreq_r <= ramreq;

  always @(posedge clk)
  if (rst)
    pending_cpu_req <= 1'b0;
  else if (cpu_next && c3)
    pending_cpu_req <= 1'b0;
  else if (dram_beg)
    pending_cpu_req <= 1'b1;

  always @(posedge clk)
  if (rst)
    stall14_cycrd <= 1'b0;
  else if (cpu_next && c3)
    stall14_cycrd <= 1'b0;
  else if (dram_beg && (!c3 || !cpu_next) && (opfetch || memrd))
    stall14_cycrd <= 1'b1;

  always @(posedge clk)
  if (rst)
    stall14_fin <= 1'b0;
  else if (stall14_fin && ((opfetch && c1) || (memrd && c2)))
    stall14_fin <= 1'b0;
  else if (cpu_next && c3 && cpu_req && (opfetch || memrd))
    stall14_fin <= 1'b1;

    // cache
  wire [12:0] cache_a;
  wire [12:0] cpu_hi_addr = {page[7:0], za[13:9]};
  // wire cache_hit = (ch_addr[7:2] != 6'b011100) && (cpu_hi_addr == cache_a) && cache_v;  // debug for BM
  wire cache_hit = (cpu_hi_addr == cache_a) && cache_v;  // asynchronous signal meaning that address requested by CPU is cached and valid
  assign cache_hit_en = cache_hit && cache_en[win];
  wire cache_inv = cache_hit && !rom_n_ram && memwr_s && ramwr_en;    // cache invalidation should be only performed if write happens to cached address

  wire [7:0] ch_addr = cpu_addr[7:0];
  // wire [14:0] cpu_hi_addr = {page[7:0], za[13:7]};
  // wire [14:0] cache_a;
  // wire [7:0] ch_addr = {2'b0, cpu_addr[5:0]};

  altdpram cache_data
  (
    .inclock (clk),
    .outclock (clk),
    .data (cpu_rddata),
    .rdaddress (ch_addr),
    .wraddress (ch_addr),
    .wren (cpu_strobe),
    .q (cache_d),
    .aclr (1'b0),
    .byteena (1'b1),
    .inclocken (1'b1),
    .outclocken (1'b1),
    .rdaddressstall (1'b0),
    .rden (1'b1),
    .wraddressstall (1'b0)
  );

  defparam
    cache_data.indata_aclr = "OFF",
    cache_data.indata_reg = "INCLOCK",
    cache_data.intended_device_family = "ACEX1K",
    cache_data.lpm_type = "altdpram",
    cache_data.outdata_aclr = "OFF",
    cache_data.outdata_reg = "OUTCLOCK",
    cache_data.rdaddress_aclr = "OFF",
    cache_data.rdaddress_reg = "UNREGISTERED",
    cache_data.rdcontrol_aclr = "OFF",
    cache_data.rdcontrol_reg = "UNREGISTERED",
    cache_data.width = 16,
    cache_data.widthad = 8,
    cache_data.wraddress_aclr = "OFF",
    cache_data.wraddress_reg = "INCLOCK",
    cache_data.wrcontrol_aclr = "OFF",
    cache_data.wrcontrol_reg = "INCLOCK";

  altdpram cache_addr
  (
    .inclock (clk),
    .outclock (clk),
    .data ({!cache_inv, cpu_hi_addr}),
    .rdaddress (ch_addr),
    .wraddress (ch_addr),
    .wren (cpu_strobe || cache_inv),
    .q ({cache_v, cache_a}),
    .aclr (1'b0),
    .byteena (1'b1),
    .inclocken (1'b1),
    .outclocken (1'b1),
    .rdaddressstall (1'b0),
    .rden (1'b1),
    .wraddressstall (1'b0)
  );

  defparam
    cache_addr.indata_aclr = "OFF",
    cache_addr.indata_reg = "INCLOCK",
    cache_addr.intended_device_family = "ACEX1K",
    cache_addr.lpm_type = "altdpram",
    cache_addr.outdata_aclr = "OFF",
    cache_addr.outdata_reg = "OUTCLOCK",
    cache_addr.rdaddress_aclr = "OFF",
    cache_addr.rdaddress_reg = "UNREGISTERED",
    cache_addr.rdcontrol_aclr = "OFF",
    cache_addr.rdcontrol_reg = "UNREGISTERED",
    cache_addr.width = 14,
    cache_addr.widthad = 8,
    cache_addr.wraddress_aclr = "OFF",
    cache_addr.wraddress_reg = "INCLOCK",
    cache_addr.wrcontrol_aclr = "OFF",
    cache_addr.wrcontrol_reg = "INCLOCK";

  // ROM chip
  assign csrom = rom_n_ram;
  assign romoe_n = !memrd;
  assign romwe_n = !(memwr && w0_we);
  assign rompg = xtpage[0][4:0];

endmodule
