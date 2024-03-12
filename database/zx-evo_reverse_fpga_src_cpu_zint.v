
module zint
(
	input  wire clk,
	input  wire zclk,
	input  wire res,
	input  wire int_start_frm,
	input  wire int_start_lin,
	input  wire int_start_dma,
	input  wire vdos,
	input  wire intack,
	
	input wire [2:0] im2v_frm,
	input wire [2:0] im2v_lin,
	input wire [2:0] im2v_dma,
	input wire [7:0] intmask,
	output wire [7:0] im2vect,
	
	output wire int_n
);

	// In VDOS INTs are focibly disabled.
	// For Frame, Line INT its generation is blocked, it will be lost.
	// For DMA INT only its output is blocked, so DMA ISR will will be processed as soon as returned from VDOS.
	
	assign int_n = int_all ? 1'b0 : 1'bZ;
	wire int_all = int_frm || int_lin || (int_dma && !vdos);
	
	wire dis_int_frm = !intmask[0];
	wire dis_int_lin = !intmask[1];
	wire dis_int_dma = !intmask[2];

	localparam INTFRM = 2'b00;
	localparam INTLIN = 2'b01;
	localparam INTDMA = 2'b10;
	localparam INTDUM = 2'b11;
	
// IM2 Vector priority
	assign im2vect = {vect[int_sel], 1'b1};
	wire [6:0] vect [0:3];
	assign vect[INTFRM] = {4'b1111, im2v_frm};
	assign vect[INTLIN] = {4'b1110, im2v_lin};
	assign vect[INTDMA] = {4'b1101, im2v_dma};
	assign vect[INTDUM] = {4'b1101, im2v_dma};

// INT source latch
	reg intack_r;
	always @(posedge clk)
		intack_r <= intack;
	
	wire intack_s = intack && !intack_r;
	
	reg [1:0] int_sel;
	always @(posedge clk)
		if (intack_s)
		begin
			if (int_frm)
				int_sel <= INTFRM;		// priority 0
			else if (int_lin)
				int_sel <= INTLIN;		// priority 1
			else if (int_dma)
				int_sel <= INTDMA;		// priority 2
		end

// INT generating
	reg int_frm;
	always @(posedge clk)
		if (res || dis_int_frm)
			int_frm <= 1'b0;
		else if (int_start_frm && !vdos)
			int_frm <= 1'b1;
		else if (intctr_fin || intack_s)		// priority 0
			int_frm <= 1'b0;

	reg int_lin;
	always @(posedge clk)
		if (res || dis_int_lin)
			int_lin <= 1'b0;
		else if (int_start_lin && !vdos)
			int_lin <= 1'b1;
		else if (intack_s && !int_frm)		// priority 1
			int_lin <= 1'b0;

	reg int_dma;
	always @(posedge clk)
		if (res || dis_int_dma)
			int_dma <= 1'b0;
		else if (int_start_dma)
			int_dma <= 1'b1;
		else if (intack_s && !int_frm && !int_lin)		// priority 2
			int_dma <= 1'b0;

// INT counter
	reg [4:0] intctr;
	wire intctr_fin = &intctr;   // 32 clks
	
	always @(posedge zclk, posedge int_start_lin)
	begin
		if (int_start_lin)
			intctr <= 0;
		else if (!intctr_fin)
			intctr <= intctr + 1;
	end
			
endmodule
