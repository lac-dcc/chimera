module lab7_7

#(
	parameter DATA_WIDTH=8, 
	parameter PTR_WIDTH=2
)

(
    input  clock,
    input  rst_n,
    input  push,
    input  pop,

    input  [DATA_WIDTH - 1:0] write_data,
    output reg [DATA_WIDTH - 1:0] read_data
);

    reg [DATA_WIDTH - 1:0] stack [0:2**PTR_WIDTH - 1];
	reg [PTR_WIDTH - 1:0] pointer;

 
	always @(posedge clock or negedge rst_n) 
	  begin
		if (!rst_n)
			pointer <= {PTR_WIDTH {1'b0}};
			
		else case ( {push, pop} )
			2'b10:  begin
				if (pointer < 2**PTR_WIDTH - 1) begin
						stack[pointer] <= write_data;
						pointer <= pointer + 1;  
					end
				else
					stack[pointer] <= write_data;
				end
			2'b01: begin 
				if (pointer != 0) begin
				read_data <= stack [pointer-1];
					pointer <= pointer - 1;
				end
				else
					read_data <= 0;
				end
			default: read_data <= stack [pointer];
			endcase
		end
	
endmodule



