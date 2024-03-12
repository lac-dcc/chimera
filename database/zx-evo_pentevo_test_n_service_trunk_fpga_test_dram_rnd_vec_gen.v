module rnd_vec_gen(

	clk,

	init,

	save,
	restore,
	next,


	out
);

parameter OUT_SIZE = 16; // size of output port, independent of LFSR register size

parameter LFSR_LENGTH   = 55; // LFSR
parameter LFSR_FEEDBACK = 24; //     definition


	input clk;

	input init; // positive initialization strobe, synchronous to clock, its length will determine initial state

	input save,restore,next; // strobes for required events: positive, one clock cycle long


	reg init2;


	output  [OUT_SIZE-1:0] out;
	wire    [OUT_SIZE-1:0] out;


	reg [OUT_SIZE-1:0] rndbase_main  [0:LFSR_LENGTH-1];
	reg [OUT_SIZE-1:0] rndbase_store [0:LFSR_LENGTH-1];


//`define simple_rnd


`ifdef simple_rnd

	reg [OUT_SIZE-1:0] back,front;
	
	always @(posedge clk)
	begin
		if( restore )
			front <= back;
		else if( save )
			back <= front;
		else if( next )
			front <= (front!=0)?(front + 1):2;
	end

	assign out = front;

`else


	assign out = rndbase_main[0];



	always @(posedge clk)
	begin

		init2 <= init;

		if( init && !init2 ) // begin of initialization
		begin
			rndbase_main[0][0] <= 1'b1; // any non-zero init possible
		end
		else if( init && init2 ) // continue of initialization
		begin
			shift_lfsr;
		end
		else // no init, normal work
		begin

			if( restore ) // restore event: higher priority
			begin
				integer i;
				for(i=0;i<LFSR_LENGTH;i=i+1)
					rndbase_main[i] <= rndbase_store[i];
			end
			else
			begin
				if( save ) // save current state
				begin
					integer j;
					for(j=0;j<LFSR_LENGTH;j=j+1)
						rndbase_store[j] <= rndbase_main[j];
				end
				else if( next ) // step to next value
				begin
					shift_lfsr;
				end

			end
		end
	end



	task shift_lfsr;
	begin
		reg [OUT_SIZE-1:0] sum;
		reg [LFSR_LENGTH-1:0] lsbs;

		integer i;

		for(i=0;i<LFSR_LENGTH;i=i+1)
			lsbs[i] = rndbase_main[i][0];

		sum = rndbase_main[LFSR_LENGTH-1] + rndbase_main[LFSR_FEEDBACK-1];

		for(i=1;i<LFSR_LENGTH;i=i+1)
			rndbase_main[i] <= rndbase_main[i-1];

		rndbase_main[0] <= { sum[OUT_SIZE-1:1], (|lsbs)?sum[0]:1'b1 };
	end
	endtask

`endif

endmodule





