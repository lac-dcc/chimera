// This program was cloned from: https://github.com/HurleyResearch/nRFICE
// License: GNU General Public License v3.0


module simram (
	clock,
	reset,
	addr_i,
	clk_en_i,
	clk_i,
	rst_i,
	wr_data_i,
	wr_en_i,
	rd_data_o
);


input [7:0] addr_i;
input  clk_en_i;
input  clk_i;
input  rst_i;
input [15:0] wr_data_i;
input  wr_en_i;

output [15:0] rd_data_o;


// ------------------------------
//        Define States          
// ------------------------------

parameter [1:0] DUMMY = 2'b10;
parameter [1:0] IDLE = 2'b0;
parameter [1:0] IDLE2 = 2'b1;

parameter  newParameter = 1'b1;



// ------------------------------
//        Definitions          
// ------------------------------


wire [7:0] addr_i;
wire  clk_en_i;
wire  clk_i;
wire [15:0] rd_data_o;
wire  rst_i;
wire [15:0] wr_data_i;
wire  wr_en_i;

reg [15:0] ramValue;

reg [2:0] state;
reg [2:0] next;
// ------------------------------
//       Common Code, not used         
// ------------------------------


// ------------------------------
//       Code Block         
// ------------------------------
assign rd_data_o[15:0] = ramValue[15:0];


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
            state[IDLE] <= 1'b1;
	end
	else state <= next;
end



// ------------------------------
//          Input Block         
// ------------------------------


always @ ( state) begin
	next = 3'b0;
	case (1'b1)
		state[DUMMY]  :  begin
			next[IDLE] = 1'b1;
		end
		state[IDLE]  :  begin
			next[IDLE2] = 1'b1;
		end
		state[IDLE2]  :  begin
			next[DUMMY] = 1'b1;
		end
	endcase
end      // end of input block


// ------------------------------
//         Output Block          
// ------------------------------



always @ (posedge clock or posedge reset) begin 
	if (reset) begin
		ramValue <= 16'hAAA3;
	end
	else begin
		ramValue <= 16'hAAA3;
		case (1'b1)
			state[DUMMY]  :  begin
			end
			state[IDLE]  :  begin
			end
			state[IDLE2]  :  begin
			end

		endcase
	end

end      // end of output always block

endmodule      // end of module simram
