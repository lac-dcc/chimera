// This program was cloned from: https://github.com/HurleyResearch/nRFICE
// License: GNU General Public License v3.0


module clockstretch (
	clock,
	reset,


	clockOut
);


input  clock;
input  reset;

output  clockOut;


// ------------------------------
//        Define States          
// ------------------------------

parameter [1:0] COUNTING = 2'b0;
parameter [1:0] INTERIM = 2'b1;
parameter [1:0] RESET = 2'b10;

parameter  newParameter = 1'b0;



// ------------------------------
//        Definitions          
// ------------------------------


wire  clock;
wire  clockOut;
wire  reset;

reg [7:0] clockCount;
reg  clockOutReg;

reg [2:0] state;
reg [2:0] next;
// ------------------------------
//       Common Code, not used         
// ------------------------------


// ------------------------------
//       Code Block         
// ------------------------------
assign clockOut = clockOutReg;


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
            state <= 3'b0;
            state[COUNTING] <= 1'b1;
	end
	else state <= next;
end



// ------------------------------
//          Input Block         
// ------------------------------


always @ ( state , clockCount) begin
	next = 3'b0;
	case (1'b1)
		state[COUNTING]  :  begin
			if( clockCount == 8'hf )
				next[INTERIM] = 1'b1;
			else 
				next[COUNTING] = 1'b1;
		end
		state[INTERIM]  :  begin
			next[RESET] = 1'b1;
		end
		state[RESET]  :  begin
			next[COUNTING] = 1'b1;
		end
	endcase
end      // end of input block


// ------------------------------
//         Output Block          
// ------------------------------



always @ (posedge clock or posedge reset) begin 
	if (reset) begin
		clockCount <= 8'b0;
		clockOutReg <= 1'b0;
	end
	else begin
		clockCount <= clockCount[7:0];
		clockOutReg <= clockOutReg;
		case (1'b1)
			state[COUNTING]  :  begin
				clockCount <= clockCount + 1'b1;
			end
			state[INTERIM]  :  begin
			end
			state[RESET]  :  begin
				clockCount <= 8'b0;
				clockOutReg <= ~clockOutReg;
			end

		endcase
	end

end      // end of output always block

endmodule      // end of module clockstretch
