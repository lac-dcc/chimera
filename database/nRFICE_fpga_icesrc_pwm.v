// This program was cloned from: https://github.com/HurleyResearch/nRFICE
// License: GNU General Public License v3.0


module pwm (
	clock,
	reset,

	counter,
	ramSafe,

	pwmOut
);


input  clock;
input [15:0] counter;
input  ramSafe;
input  reset;

output  pwmOut;


// ------------------------------
//        Define States          
// ------------------------------

parameter [2:0] CONFIGRAM1 = 3'b10;
parameter [2:0] CONFIGRAM2 = 3'b11;
parameter [2:0] CONFIGRAM3 = 3'b100;
parameter [2:0] CONFIGURE = 3'b01;
parameter [2:0] IDLE = 3'b00;

parameter  newParameter = 1'b1;



// ------------------------------
//        Definitions          
// ------------------------------


wire  clock;
wire [15:0] counter;
wire  ramSafe;
wire  reset;

reg [15:0] onTime;
reg  pwmOut;

reg [4:0] state;
reg [4:0] next;
// ------------------------------
//       Common Code, not used         
// ------------------------------


// ------------------------------
//       Code Block         
// ------------------------------
// hopefully no code block


// ------------------------------
//       Input Buffering         
// ------------------------------



always @ (posedge clock or posedge reset) begin 
	if (reset) begin
	end
	else begin
	end
end


// ------------------------------
//   State Switching Block       
// ------------------------------


always @ (posedge clock or posedge reset) begin
	if (reset)	begin
            state <= 5'b0;
            state[IDLE] <= 1'b1;
	end
	else state <= next;
end



// ------------------------------
//          Input Block         
// ------------------------------


always @ ( state , counter , ramSafe) begin
	next = 5'b0;
	case (1'b1)
		state[CONFIGRAM1]  :  begin
			next[CONFIGRAM2] = 1'b1;
		end
		state[CONFIGRAM2]  :  begin
			next[CONFIGRAM3] = 1'b1;
		end
		state[CONFIGRAM3]  :  begin
			next[IDLE] = 1'b1;
		end
		state[CONFIGURE]  :  begin
			next[CONFIGRAM1] = 1'b1;
		end
		state[IDLE]  :  begin
			if( counter >= 16'hefff && ramSafe == 1'b1 )
				next[CONFIGURE] = 1'b1;
			else 
				next[IDLE] = 1'b1;
		end
	endcase
end      // end of input block


// ------------------------------
//         Output Block          
// ------------------------------



always @ (posedge clock or posedge reset) begin 
	if (reset) begin
		onTime <= 16'b0;
		pwmOut <= 1'b0;
	end
	else begin
		onTime <= onTime;
		pwmOut <= pwmOut;
		case (1'b1)
			state[CONFIGRAM1]  :  begin
			end
			state[CONFIGRAM2]  :  begin
			end
			state[CONFIGRAM3]  :  begin
			end
			state[CONFIGURE]  :  begin
			end
			state[IDLE]  :  begin
			end

		endcase
	end

end      // end of output always block

endmodule      // end of module pwm
