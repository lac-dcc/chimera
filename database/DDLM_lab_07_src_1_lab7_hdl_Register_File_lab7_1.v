module register
#(
    parameter SIZE = 4
)
(
    input                          ena, 
    input                          clk,
    input      [SIZE - 1 : 0]      d,
    output reg [SIZE - 1 : 0]      q
);
    always @ (posedge clk)
	if (ena) 
            q <= d;
endmodule    

module lab7_1
#(
	parameter DATA_WIDTH=4, 
	parameter ADDR_WIDTH=2
)
(
    input                          clk,
    input      [6:0]               SW,
    output     [3:0]               LEDR
);

	reg        [3:0]               w_we;          //DC output for write enable
	reg        [3:0]               mux_out;       //mux out 
	wire	   [(DATA_WIDTH-1):0]  reg0;          //output register 0
	wire	   [(DATA_WIDTH-1):0]  reg1;          //output register 1
	wire	   [(DATA_WIDTH-1):0]  reg2;          //output register 2
	wire	   [(DATA_WIDTH-1):0]  reg3;          //output register 3
	
	// DC
	always @(SW[6:4])
		begin
			if (SW[6]) 
				case (SW[5:4])
					2'b00    :    w_we = 4'b0001;
					2'b01    :    w_we = 4'b0010;
					2'b10    :    w_we = 4'b0100;
					2'b11    :    w_we = 4'b1000;
					default	 :    w_we = 4'b0000;
				endcase
			else 
				w_we = 4'b0000;
		end
	
	//mux
	always @*
    case (SW[5:4])
        2'b00    :    mux_out = reg0;
        2'b01    :    mux_out = reg1;
        2'b10    :    mux_out = reg2; 
        2'b11    :    mux_out = reg3;
		default	 :    mux_out = 4'b0000;
    endcase

	assign LEDR = mux_out;
	
	register #(4) register0 (.ena(w_we[0]), .clk(clk), .d(SW[3:0]), .q(reg0));
	register #(4) register1 (.ena(w_we[1]), .clk(clk), .d(SW[3:0]), .q(reg1));
	register #(4) register2 (.ena(w_we[2]), .clk(clk), .d(SW[3:0]), .q(reg2));
	register #(4) register3 (.ena(w_we[3]), .clk(clk), .d(SW[3:0]), .q(reg3));
	
	
endmodule

