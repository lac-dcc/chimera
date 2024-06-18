// This program was cloned from: https://github.com/maxs-well/ad7606-driver-verilog
// License: GNU General Public License v2.0

/**
	*	@Function: AD7606 control
	*	@Date		:	2019/05/09
	*	@Vision	:	v2.0
	*	@Note		:
						reference to the previous design
						AD7606 data sheet
	*	@Author	:	WoodFan
	*	@param clk	:	fpga main clk
	*	@param rst_n:	active low reset signal.
	*	@param en	:	control frequency of sampling
	*	@param start:	active high start sampling signal
	*	@param busy	:	ADC Busy Output, which indicates the status of the conversion
	*	@param fdata:	AD7606 control signal
	*	@param cvtData:ADC data bus used to read from AD7606
	*	@param cs	:	ADC chip select. Active low 
	*	@param rd	:	ADC read request. Active low
	*	@param cvtX	:	ADC convert signal, which falling edge on cvt is used to initiate a conversion.
	*	@param range:	ADC acceptable voltage range, Active High indicate 10V, low indicate 5V
	*	@param phy_rst:ADC reset signal, active high
	*	@param vio	：ADC I/O volatage 
	
	*	@retval chx	:	Channel data read from ADC
	*	@retval update:	ADC data update indicate signal
	*	@retval phy_busy: Output indicates that the ADC is converting
	*/

module AD7606_ctrl 
#(
parameter	RANGE_10V 		   	=	1,
parameter	WAIT_CNT					=	1,
parameter	T2							=	2
)
(
	//system signals
	input						clk		,
	input						rst_n		,
	//time control
	input						en			,
	//contrl start
	input						start		,
	//phy interface and signals
	input						busy		,
	input						fdata		,
	input	[15:0]			cvtData	,
	
	output	reg			cs			,
	output	reg			rd			,
	output					cvtA		,
	output					cvtB		,
	output					range		,
	output	reg			phy_rst	,
	output	reg	[ 2:0]os			,
	
	output	reg	[15:0]ch1		,
	output	reg	[15:0]ch2		,
	output	reg	[15:0]ch3		,
	output	reg	[15:0]ch4		,
	output	reg	[15:0]ch5		,
	output	reg	[15:0]ch6		,
	output	reg	[15:0]ch7		,
	output	reg	[15:0]ch8		,
	output	reg			update	,
	output					phy_busy	,
	
	output						vio		
);
localparam	IDLE	=	4'd0	,
			CVT		=	4'd1	,
			BUSY		=	4'd2	,
			RD_ST		=	4'd3	,
			GET_DATA	=	4'd4	,
			WAIT_TIME= 	4'd6 ;


reg				cvtA_r		;
reg	[3:0]		state 		/* synthesis preserve */;
reg	[3:0]		nxt_state	;
reg	[3:0]		cnt			;
wire	[3:0]		ch_num		;
reg				flag			;

assign	cvtA = cvtA_r;
assign	cvtB = cvtA_r;
assign	ch_num= 4'd8;

assign 	range = (RANGE_10V == 1) ? 1'b1 : 1'b0;
assign	vio = 1'b1			;
assign	phy_busy = busy	;

always @ (posedge clk)
begin
	if (state == CVT && cnt <= T2 - 4'd1)
	begin
		cvtA_r	<=	1'b0;
	end
	else
	begin
		cvtA_r	<=	1'b1;
	end
end

always @ (posedge clk or negedge rst_n)
begin
	if (!rst_n)
		state	<=	IDLE;
	else 
		state	<=	nxt_state;
end

//FSM conditional jump
always @ (state, busy, start, en, flag, update)
begin
	nxt_state	<=	state;
	case (state)
	IDLE:
	begin
		if (!busy && start && en)
			nxt_state <= CVT;
	end
	
	CVT:
	begin
		if (busy)
			nxt_state <= BUSY;
	end
	
	BUSY:
	begin
		if (!busy)
			nxt_state <= RD_ST;
	end
	
	RD_ST:
	begin
		if (flag)
			nxt_state <= GET_DATA;
	end
	
	GET_DATA:
	begin
		if (update)
			nxt_state <= IDLE;
	end
	
	default: nxt_state <= IDLE;
	
	endcase
end

always @ (posedge clk or negedge rst_n)
begin
	if (!rst_n)
	begin
		cs		<=	1'b1;
		rd		<=	1'b1;
		update	<=	'd0;
		
		ch1 	<=	'd0;
		ch2 	<=	'd0;
		ch3 	<=	'd0;
		ch4 	<=	'd0;
		ch5 	<=	'd0;
		ch6 	<=	'd0;
		ch7 	<=	'd0;
		ch8 	<=	'd0;
		phy_rst	<=	1'b1;
		os		<=	'd0;
		cnt		<=	'd0;
		flag	<=	'd0;
	end
	else
	begin
		case (state)
		IDLE:
		begin
			cs	<=	1'b1;
			rd	<=	1'b1;
			update	<=	'd0;
		
			phy_rst	<=	'd0;
			os			<=	'd0;
			cnt		<=  'd0;
		end
		
		CVT:
		begin
			if (cnt <= T2 - 4'd1)
				cnt	<=	cnt + 4'd1;
		end
		
		RD_ST:
		begin
			cs 	<=	1'b0;
			cnt	<=	'd0;
			if (!flag)
			begin
				rd	<=	1'b1;
				flag<=1'b1;
			end
			else
			begin
				rd <=	1'b0;
				flag<=1'b0;
			end
		end
		
		GET_DATA:
		begin
			if (!flag)
			begin
				flag	<=	1'b1;
			end
			else
			begin
				flag	<=	1'b0;
				cnt	<=	cnt + 4'd1;
				case (cnt)
				4'd0:	ch1 <= cvtData;
				4'd1:	ch2 <= cvtData;
				4'd2:	ch3 <= cvtData;
				4'd3:	ch4 <= cvtData;
				4'd4:	ch5 <= cvtData;
				4'd5:	ch6 <= cvtData;
				4'd6:	ch7 <= cvtData;
				4'd7:	ch8 <= cvtData;
				default: ;
				endcase
			end
			
			if (flag && cnt < ch_num - 1)
				rd	<=	1'b0;
			else
				rd	<=	1'b1;
			
			if (cnt >= ch_num - 1)
				update <= 1'b1;
			else
				update <= 1'b0;
		end
		
		default: ;
		endcase
	end
end

endmodule