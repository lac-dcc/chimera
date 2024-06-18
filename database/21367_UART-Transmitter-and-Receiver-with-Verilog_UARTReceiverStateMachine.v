// This program was cloned from: https://github.com/SimNabong/UART-Transmitter-and-Receiver-with-Verilog
// License: MIT License

//state machine that takes the uart data with parity bit
module UARTReceiverStateMachine(
	input Rx_in, //received UART data from the Master
	input clk, //clk that will have a modified rate
	input reset, //synchronous reset
	output [8:0] Dout, //9-Bits sent to the P-checker
	output wire Mreset //sends a bit to the master to reset the masters(transmitters) signal
);

	//states of the state machine
	parameter Idle=4'd0,Start=4'd1,d0=4'd2,d1=4'd3,d2=4'd4,d3=4'd5,d4=4'd6,d5=4'd7,d6=4'd8,d7=4'd9,ParityB=4'd10,Stop=4'd11,Error=4'd12;
	
	reg [3:0] state,next_state; //place holder
	reg [8:0] Drs; //temp data that might get sent to the Parity checker
	
	
	always@(posedge clk) begin //updates the state machine
		if(Mreset)
			state <= Idle;
		else
			state <= next_state;					
	end
	
	always@(*)begin //dictates what the state of the machine moves to depending on the "state" and the input Rx_in 
		case(state)
			Idle: 	next_state=(~Rx_in)?Start:Idle;
			Start:	next_state=d0;
			d0:		next_state=d1;
			d1:		next_state=d2;
			d2:		next_state=d3;
			d3:		next_state=d4;
			d4:		next_state=d5;
			d5:		next_state=d6;
			d6:		next_state=d7;
			d7:		next_state=ParityB;
			ParityB:	next_state=(Rx_in)?Stop:Error;
			Stop:		next_state=(Rx_in)?Idle:Start;
			Error:	next_state=(Rx_in)?Idle:Error;
			default:	next_state=Idle;
		endcase
	end
	
	
	always@(posedge clk)begin //places the data bits and the parity bit to the temporary register
		if(reset)
			Drs <= 9'd0;
		else
			case(next_state)
				d0:Drs[0] <= Rx_in;
				d1:Drs[1] <= Rx_in;
				d2:Drs[2] <= Rx_in;
				d3:Drs[3] <= Rx_in;
				d4:Drs[4] <= Rx_in;
				d5:Drs[5] <= Rx_in;
				d6:Drs[6] <= Rx_in;
				d7:Drs[7] <= Rx_in;
				ParityB:Drs[8] <= Rx_in;
				Error: Drs <= 9'd0;
				default: Drs <= Drs;
			endcase
	end
	

	assign Dout = (next_state==Stop)?Drs:Dout; //if condition is met, data and parity bit which was stored in Drs is sent to the parity checker, else nothing gets sent.
	assign Mreset = reset||state==Error||(state==Stop&&next_state==Idle); //resets the state machine
		
endmodule
