module runlength_shifter_tb();

localparam	AMPLITUDE_PRECISION	= 16;

reg		r_arst;
reg		r_sysclk;
reg		r_we;
wire	[19:0]w_eob;
wire	[4:0]w_runlength[0:19];
wire	[AMPLITUDE_PRECISION-1:0]w_B[0:19];
reg		[4:0]r_ptr;
wire	w_ready;
reg		r_ready;
wire	w_de;
wire	[AMPLITUDE_PRECISION-1:0]o_B;

reg		r_test_state_1P;

localparam	s_test_0	= 1'b0;
localparam	s_test_1	= 1'b1;

wire	i_eob;
wire	[4:0]i_runlength;
wire	[AMPLITUDE_PRECISION-1:0]i_B;

assign	i_eob		= w_eob[r_ptr];
assign	i_runlength	= w_runlength[r_ptr];
assign	i_B			= w_B[r_ptr];

assign	w_runlength[0]	= 5'd0;	assign	w_eob[0]	= 1'b0;	assign	w_B[0]	= 16'h1;
assign	w_runlength[1]	= 5'd1;	assign	w_eob[1]	= 1'b0;	assign	w_B[1]	= 16'h2;
assign	w_runlength[2]	= 5'd0;	assign	w_eob[2]	= 1'b0;	assign	w_B[2]	= 16'h3;
assign	w_runlength[3]	= 5'd0;	assign	w_eob[3]	= 1'b0;	assign	w_B[3]	= 16'h4;
assign	w_runlength[4]	= 5'd0;	assign	w_eob[4]	= 1'b0;	assign	w_B[4]	= 16'h5;
assign	w_runlength[5]	= 5'd0;	assign	w_eob[5]	= 1'b0;	assign	w_B[5]	= 16'h6;
assign	w_runlength[6]	= 5'd0;	assign	w_eob[6]	= 1'b0;	assign	w_B[6]	= 16'h7;
assign	w_runlength[7]	= 5'd0;	assign	w_eob[7]	= 1'b0;	assign	w_B[7]	= 16'h8;
assign	w_runlength[8]	= 5'd0;	assign	w_eob[8]	= 1'b0;	assign	w_B[8]	= 16'h9;
assign	w_runlength[9]	= 5'd0;	assign	w_eob[9]	= 1'b0;	assign	w_B[9]	= 16'hA;
assign	w_runlength[10]	= 5'd0;	assign	w_eob[10]	= 1'b0;	assign	w_B[10]	= 16'hB;
assign	w_runlength[11]	= 5'd0;	assign	w_eob[11]	= 1'b0;	assign	w_B[11]	= 16'hC;
assign	w_runlength[12]	= 5'd0;	assign	w_eob[12]	= 1'b0;	assign	w_B[12]	= 16'hD;
assign	w_runlength[13]	= 5'd0;	assign	w_eob[13]	= 1'b0;	assign	w_B[13]	= 16'hE;
assign	w_runlength[14]	= 5'd0;	assign	w_eob[14]	= 1'b0;	assign	w_B[14]	= 16'hF;
assign	w_runlength[15]	= 5'd0;	assign	w_eob[15]	= 1'b0;	assign	w_B[15]	= 16'h10;
assign	w_runlength[16]	= 5'd0;	assign	w_eob[16]	= 1'b0;	assign	w_B[16]	= 16'h11;
assign	w_runlength[17]	= 5'd5;	assign	w_eob[17]	= 1'b0;	assign	w_B[17]	= 16'h12;
assign	w_runlength[18]	= 5'd0;	assign	w_eob[18]	= 1'b0;	assign	w_B[18]	= 16'h13;
assign	w_runlength[19]	= 5'd0;	assign	w_eob[19]	= 1'b1;	assign	w_B[19]	= 16'h14;

runlength_shifter
#(
	.AMPLITUDE_PRECISION(AMPLITUDE_PRECISION)
)
inst_runlength_shifter
(
	.i_arst		(r_arst),
	.i_sysclk	(r_sysclk),
	.i_we		(r_we),
	.i_eob		(i_eob),
	.i_runlength(i_runlength),
	.i_B		(i_B),
	.o_ready	(w_ready),
	.i_ready	(r_ready),
	.o_de		(w_de),
	.o_B		(o_B)
);

initial
begin
	r_arst	<= 1'b1;
	#10	r_arst	<= 1'b0;
end

initial
begin
	r_sysclk	<= 1'b1;
	forever
		#2.5	r_sysclk	<= ~r_sysclk;
end

always@(posedge r_arst or posedge r_sysclk)
begin
	if (r_arst)
	begin
		r_test_state_1P	<= s_test_0;
		r_ptr			<= {5{1'b0}};
		r_we			<= 1'b1;
		r_ready			<= 1'b1;
	end
	else
	begin
		case (r_test_state_1P)
			s_test_0:
			begin
				if (w_ready)
				begin
					r_ptr	<= r_ptr+1'b1;
					if (r_ptr == 5'd19)
					begin
						r_test_state_1P	<= s_test_1;
						r_ptr			<= {5{1'b0}};
					end
				end
			end
			
			s_test_1:
			begin
				r_ready	<= 1'b1;
				if (w_ready)
				begin
					r_ready	<= 1'b0;
					r_ptr	<= r_ptr+1'b1;
					if (r_ptr == 5'd19)
					begin
						r_ptr	<= r_ptr;
					end
				end
			end
		endcase
	end
end

endmodule
