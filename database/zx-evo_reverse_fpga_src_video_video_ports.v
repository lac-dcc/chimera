// This module latches all port parameters for video from Z80

module video_ports (

// clocks
	input wire clk,

	input wire [ 7:0] d,
    input wire res,
    input wire int_start,
    input wire line_start_s,

// port write strobes
    input wire zborder_wr,
    input wire border_wr,
    input wire zvpage_wr,
    input wire vpage_wr,
    input wire vconf_wr,
    input wire gx_offsl_wr,
    input wire gx_offsh_wr,
    input wire gy_offsl_wr,
    input wire gy_offsh_wr,
    input wire t0x_offsl_wr,
    input wire t0x_offsh_wr,
    input wire t0y_offsl_wr,
    input wire t0y_offsh_wr,
    input wire t1x_offsl_wr,
    input wire t1x_offsh_wr,
    input wire t1y_offsl_wr,
    input wire t1y_offsh_wr,
    input wire tsconf_wr,
    input wire palsel_wr,
    input wire tmpage_wr,
    input wire t0gpage_wr,
    input wire t1gpage_wr,
    input wire sgpage_wr,
    input wire hint_beg_wr ,
    input wire vint_begl_wr,
    input wire vint_begh_wr,

// video parameters
	output reg [7:0] border,
	output reg [7:0] vpage,
	output reg [7:0] vconf,
	output reg [8:0] gx_offs,
	output reg [8:0] gy_offs,
	output reg [8:0] t0x_offs,
	output reg [8:0] t0y_offs,
	output reg [8:0] t1x_offs,
	output reg [8:0] t1y_offs,
	output reg [7:0] palsel,
	output reg [7:0] hint_beg,
	output reg [8:0] vint_beg,
	output reg [7:0] tsconf,
	output reg [7:0] tmpage,
	output reg [7:0] t0gpage,
	output reg [7:0] t1gpage,
	output reg [7:0] sgpage

 );

    reg [7:0] vpage_r;
    reg [7:0] vconf_r;
    reg [7:0] t0gpage_r;
    reg [7:0] t1gpage_r;
    reg [8:0] gx_offs_r;
    reg [8:0] t0x_offs_r;
    reg [8:0] t1x_offs_r;
	reg [7:0] palsel_r;
	
	wire [8:0] vint_beg_inc = vint_beg + vint_inc;
	wire [8:0] vint_beg_next = {(vint_beg_inc[8:6] == 3'b101) ? 3'b0 : vint_beg_inc[8:6], vint_beg_inc[5:0]};	// if over 319 lines, decrement 320
	reg [3:0] vint_inc;
	always @(posedge clk)
		if (res)
		begin
			vint_beg <= 9'd0;
			vint_inc <= 4'b0;
		end
			
		else if (vint_begl_wr)
			vint_beg[7:0] <= d;
			
		else if (vint_begh_wr)
		begin
			vint_beg[8] <= d[0];
			vint_inc <= d[7:4];
		end
		
		else if (int_start)
			vint_beg <= vint_beg_next;
		
	always @(posedge clk)
		if (res)
		begin
			vpage_r     <= 8'h05;
   			vconf_r     <= 8'h00;
			gx_offs_r   <= 9'b0;
			palsel_r    <= 8'h0F;
			gy_offs     <= 9'b0;
			tsconf      <= 8'b0;
			hint_beg    <= 8'd1;
        end

        else
        begin
            if (zborder_wr  )   border          <= {5'b11110, d[2:0]};
            if (border_wr   )   border          <= d;
			if (gy_offsl_wr	)   gy_offs[7:0]    <= d;
			if (gy_offsh_wr	)   gy_offs[8]      <= d[0];
			if (t0y_offsl_wr)   t0y_offs[7:0]   <= d;
			if (t0y_offsh_wr)   t0y_offs[8]     <= d[0];
			if (t1y_offsl_wr)   t1y_offs[7:0]   <= d;
			if (t1y_offsh_wr)   t1y_offs[8]     <= d[0];
			if (tsconf_wr   )   tsconf          <= d;
			if (tmpage_wr	)   tmpage          <= d;
			if (sgpage_wr	)   sgpage          <= d;
			if (hint_beg_wr )   hint_beg        <= d;
			
            if (zvpage_wr	)   vpage_r         <= {6'b000001, d[3], 1'b1};
            if (vpage_wr	)   vpage_r         <= d;
            if (vconf_wr    )   vconf_r         <= d;
			if (gx_offsl_wr	)   gx_offs_r[7:0]  <= d;
			if (gx_offsh_wr	)   gx_offs_r[8]    <= d[0];
			if (palsel_wr   )   palsel_r        <= d;
			if (t0x_offsl_wr)   t0x_offs_r[7:0] <= d;
			if (t0x_offsh_wr)   t0x_offs_r[8]   <= d[0];
			if (t1x_offsl_wr)   t1x_offs_r[7:0] <= d;
			if (t1x_offsh_wr)   t1x_offs_r[8]   <= d[0];
			if (t0gpage_wr	)   t0gpage_r       <= d;
			if (t1gpage_wr	)   t1gpage_r       <= d;
			// if (t0x_offsl_wr)   t0x_offs[7:0] <= d;
			// if (t0x_offsh_wr)   t0x_offs[8]   <= d[0];
			// if (t1x_offsl_wr)   t1x_offs[7:0] <= d;
			// if (t1x_offsh_wr)   t1x_offs[8]   <= d[0];
			// if (t0gpage_wr	)   t0gpage       <= d;
			// if (t1gpage_wr	)   t1gpage       <= d;
        end


// latching regs at line start, delaying hires for 1 line
    always @(posedge clk)
		if (res)
		begin
			vpage       <= 8'h05;
   			vconf       <= 8'h00;
			gx_offs     <= 9'b0;
			palsel      <= 8'h0F;
		end

		else if (zvpage_wr)
			vpage <= {6'b000001, d[3], 1'b1};

		else if (line_start_s)
		begin
			vpage   <= vpage_r;
			vconf   <= vconf_r;
			gx_offs <= gx_offs_r;
			palsel  <= palsel_r;
			t0x_offs <= t0x_offs_r;
			t1x_offs <= t1x_offs_r;
			t0gpage <= t0gpage_r;
			t1gpage <= t1gpage_r;
		end


 endmodule