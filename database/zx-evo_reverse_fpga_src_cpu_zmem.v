
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

module zmem(

	input  wire clk,
	input  wire c0, c1, c2, c3,
	input  wire zneg, // strobes which show positive and negative edges of zclk
	input  wire zpos,

// Z80
	input  wire rst,
	input  wire [15:0] za,
	output wire [ 7:0] zd_out,  // output to Z80 bus
	output wire zd_ena,         // output to Z80 bus enable

	input  wire opfetch,
	input  wire opfetch_s,
	input  wire mreq,
    input  wire memrd,
    input  wire memwr,
	input  wire memwr_s,

	input  wire [ 1:0] turbo, 	  // 2'b00 - 3.5,
	                              // 2'b01 - 7.0,
	                              // 2'b1x - 14.0
	input wire cache_en,
	input wire [3:0] memconf,
	input wire [31:0] xt_page,

	output wire [4:0] rompg,
	output wire csrom,
	output wire romoe_n,
	output wire romwe_n,

	output wire dos,
  	output wire dos_on,
	output wire dos_off,
	output wire vdos,
	input wire vdos_on,
	input wire vdos_off,

// DRAM
	output wire        cpu_req,
	output wire [20:0] cpu_addr,
	output wire        cpu_wrbsel,
	input  wire [15:0] cpu_rddata,
	input  wire        cpu_next,
	input  wire        cpu_strobe,
	input  wire        cpu_latch,
	output wire        cpu_stall,    // for zclock

	input wire testkey,		// DEBUG!!!

	input wire intt,		// DEBUG!!!
	output wire [2:0] tst
);

	// assign tst = {ramwr_s, cpu_req, intt};
	assign tst = {1'b0, cpu_stall, 1'b0};
	// assign tst = ttt;
	// reg [2:0] ttt;
	// always@*
		// if (cpu_req)
			// ttt = 4;
		// else
			// ttt = 0;


// pager
    wire [1:0] win = za[15:14];
    wire win0 = ~|win;
    wire rw_en = !win0 || memconf[1] || vdos;
    wire [7:0] page = xtpage[win];

	assign rompg = xtpage[0][4:0];
    assign csrom = win0 && !memconf[3] && !vdos;

    wire [7:0] xtpage[0:3];
    assign xtpage[0] = vdos ? 8'hFF : {xt_page[7:2], memconf[2] ? xt_page[1:0] : {~dos, memconf[0]}};
    assign xtpage[1] = xt_page[15:8];
    assign xtpage[2] = xt_page[23:16];
    assign xtpage[3] = xt_page[31:24];


// DOS signal control
	assign dos_on = win0 && opfetch_s && (za[13:8]==6'h3D) && memconf[0] && !memconf[2];
	assign dos_off = !win0 && opfetch_s && !vdos;

	assign dos = (dos_on || dos_off) ^^ dos_r;		// to make dos appear 1 clock earlier than dos_r

    reg dos_r;
	always @(posedge clk)
	if (rst)
		dos_r <= 1'b0;

	else if (dos_off)
			dos_r <= 1'b0;
	else if (dos_on)
			dos_r <= 1'b1;


// VDOS signal control
    // vdos turn on/off is delayed till next opfetch due to INIR that writes right after iord cycle
	assign vdos = opfetch ? pre_vdos : vdos_r;	// vdos appears as soon as first opfetch

    reg pre_vdos, vdos_r;
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


// address, data in and data out
	assign cpu_wrbsel = za[0];
	assign cpu_addr[20:0] = {page, za[13:1]};
	// wire [15:0] mem_d = cpu_latch ? cpu_rddata : cache_d;
	
	reg [15:0] mem_d;
	always @(posedge clk)
		if (cpu_strobe)
			mem_d <= cpu_rddata;
			
	assign zd_out = ~cpu_wrbsel ? mem_d[7:0] : mem_d[15:8];

// Z80 controls
	assign romoe_n = !memrd;
	assign romwe_n = !(memwr && rw_en);

	wire ramreq = mreq && !csrom;
	wire ramrd = memrd && !csrom;
	wire ramwr = memwr && !csrom && rw_en;
	wire ramwr_s = memwr_s && !csrom && rw_en;
	assign zd_ena = memrd && !csrom;
	
	assign cpu_req = turbo14 ? cpureq_14 : cpureq_357;
	assign cpu_stall = turbo14 ? stall14 : stall357;

	wire turbo14 = turbo[1];
		
// 7/3.5MHz support
	wire cpureq_357 = (ramrd_zs && !cache_hit_en) || ramwr_zs;
	wire stall357 = cpureq_357 && !cpu_next;

	wire ramwr_zs = ramwr && !ramwr_zr;
	wire ramrd_zs = ramrd && !ramrd_zr;

	reg ramrd_zr, ramwr_zr;
	always @(posedge clk)
		if (c3 && !cpu_stall)
		begin
			ramrd_zr <= ramrd;
			ramwr_zr <= ramwr;
		end

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
	
	wire cpureq_14 = dram_beg || pending_cpu_req;
	wire stall14 = stall14_ini || stall14_cyc || stall14_fin;
	
	wire dram_beg = (!cache_hit_en || memwr) && zneg && ramreq_s_n;
	
	wire ramreq_s_n = ramreq_r_n && ramreq;
	reg ramreq_r_n;
	always @(posedge clk) if (zneg)
		ramreq_r_n <= !mreq;

	reg pending_cpu_req;
	always @(posedge clk)
	if (rst)
		pending_cpu_req <= 1'b0;
	else if (cpu_next && c3)
		pending_cpu_req <= 1'b0;
	else if (dram_beg)
		pending_cpu_req <= 1'b1;

	wire stall14_ini = dram_beg && (!cpu_next || opfetch || memrd);	// no wait at all in write cycles, if next dram cycle is available
	wire stall14_cyc = memrd ? stall14_cycrd : !cpu_next;


	reg stall14_cycrd;
	always @(posedge clk)
	if (rst)
		stall14_cycrd <= 1'b0;
	else if (cpu_next && c3)
		stall14_cycrd <= 1'b0;
	else if (dram_beg && (!c3 || !cpu_next) && (opfetch || memrd))
		stall14_cycrd <= 1'b1;

	reg stall14_fin;
	always @(posedge clk)
	if (rst)
		stall14_fin <= 1'b0;
	else if (stall14_fin && ((opfetch && cc[0]) || (memrd && cc[1])))
		stall14_fin <= 1'b0;
	else if (cpu_next && c3 && cpu_req && (opfetch || memrd))
		stall14_fin <= 1'b1;

    wire [1:0] cc = turbo[0] ? {c1, c0} : {c2, c1};	// normal or overclock

// cache
	// wire cache_hit = (ch_addr[7:2] != 6'b011100) && (cpu_hi_addr == cache_a) && cache_v;	// debug for BM
	wire cache_hit = (cpu_hi_addr == cache_a) && cache_v;	// asynchronous signal meaning that address requested by CPU is cached and valid
	// wire cache_hit_en = cache_hit && cache_en;
	wire cache_hit_en = 0;
	wire cache_inv = ramwr_s && cache_hit;		// cache invalidation should be only performed if write happens to cached address

	wire [12:0] cpu_hi_addr = {page[7:0], za[13:9]};
	wire [12:0] cache_a;
	wire [7:0] ch_addr = cpu_addr[7:0];

	wire [15:0] cache_d;
	wire cache_v;

// cache_data cache_data (
		// .clock (clk),
		// .data (cpu_rddata),
		// .rdaddress (ch_addr),
		// .wraddress (ch_addr),
		// .wren (cpu_strobe),
		// .q (cache_d)
// );

// cache_addr cache_addr (
		// .clock (clk),
		// .data ({!cache_inv, cpu_hi_addr}),
		// .rdaddress (ch_addr),
		// .wraddress (ch_addr),
		// .wren (cpu_strobe || cache_inv),
		// .q ({cache_v, cache_a})
// );

endmodule
