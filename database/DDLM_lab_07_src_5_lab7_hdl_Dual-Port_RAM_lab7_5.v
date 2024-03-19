module hexto7segment
(
    input      [3:0]               in_hex,
    output reg [6:0]               out_7seg
);

always @in_hex
    case (in_hex)
        4'b0000 :             //Digit 0
            out_7seg = 7'b1000000;
        4'b0001 :            //Digit 1
            out_7seg = 7'b1111001  ;
        4'b0010 :            //Digit 2
            out_7seg = 7'b0100100 ; 
        4'b0011 :             //Digit 3
            out_7seg = 7'b0110000 ;
        4'b0100 :            //Digit 4
            out_7seg = 7'b0011001 ;
        4'b0101 :            //Digit 5
            out_7seg = 7'b0010010 ;  
        4'b0110 :            //Digit 6
            out_7seg = 7'b0000010 ;
        4'b0111 :            //Digit 7
            out_7seg = 7'b1111000;
        4'b1000 :            //Digit 8
            out_7seg = 7'b0000000;
        4'b1001 :            //Digit 9
            out_7seg = 7'b0011000 ;
        4'b1010 :            //Digit A
            out_7seg = 7'b0001000 ; 
        4'b1011 :            //Digit B
            out_7seg = 7'b0000011;
        4'b1100 :            //Digit C
            out_7seg = 7'b1000110 ;
        4'b1101 :            //Digit D
            out_7seg = 7'b0100001 ;
        4'b1110 :            //Digit E
            out_7seg = 7'b0000110 ;
        4'b1111 :            //Digit F
            out_7seg = 7'b0001110 ;
    endcase
endmodule

module dc2
(
   input      [1:0]               a,
   output reg [3:0]               dc_out
);

always @a
    case (a)
        2'b00	:	dc_out = 4'b0001;
        2'b01	:	dc_out = 4'b0010;
        2'b10	:	dc_out = 4'b0100;
        2'b11	:	dc_out = 4'b1000;
    endcase
endmodule


module register
#(
    parameter SIZE = 4
)
(
    input                          ena, 
    input                          clk,
	input                          rst_n,
    input      [SIZE - 1 : 0]      d,
    output reg [SIZE - 1 : 0]      q
);
    always @ (posedge clk or negedge rst_n)
        if (! rst_n)
            q <= {SIZE {1'b0}};
        else if (ena)
            q <= d;
endmodule

module dual_port_RAM
#(parameter DATA_WIDTH=8, parameter ADDR_WIDTH=4)
(
    input                          we, 
    input                          clk,
    // Read port:
    input      [(DATA_WIDTH-1):0]  data_in,
    input      [(ADDR_WIDTH-1):0]  read_addr, 
    // Write port:
    input      [(ADDR_WIDTH-1):0]  write_addr,
    output reg [(DATA_WIDTH-1):0]  data_out
);
    // Declare the array variable
    reg [DATA_WIDTH-1:0] dp_ram [0:2**ADDR_WIDTH-1];
    
    always @ (posedge clk)
    begin
        // Write
        if (we)
            dp_ram [write_addr] <= data_in;
 
         // Read
        data_out <= dp_ram [read_addr];
    end
endmodule

module lab7_5
#(
	parameter DATA_WIDTH=8, 
	parameter ADDR_WIDTH=4
)
(
    input                          clk,
	input                          rst_n, 
    input      [9:0]               SW,
    output     [7:0]               HEX0,
    output     [7:0]               HEX1,
    output     [7:0]               HEX2,
    output     [7:0]               HEX3,
    output     [7:0]               HEX4,
    output     [7:0]               HEX5
);

	wire       [3:0]               w_we;          //DC output for write enable
	wire	   [(DATA_WIDTH-1):0]  data_in_reg;   //data_in register output
	wire	   [(ADDR_WIDTH-1):0]  read_addr_reg; //read_addr register output
	wire	   [(ADDR_WIDTH-1):0]  write_addr_reg;//write_addr register output
	wire	   [(DATA_WIDTH-1):0]  data_out;      //memory output
	
	dc2 dc2in4 (.a(SW[9:8]), .dc_out(w_we[3:0]));
	assign HEX0[7] = ~w_we[0];
	assign HEX1[7] = ~w_we[0];
	assign HEX2[7] = ~w_we[3];
	assign HEX3[7] = ~w_we[3];
	assign HEX4[7] = ~w_we[1];
	assign HEX5[7] = ~w_we[2];
	
	
	register #(8) register_data_in (.ena(w_we[0]), .clk(clk), .rst_n(rst_n), .d(SW[7:0]), .q(data_in_reg));
	register #(4) register_read_addr (.ena(w_we[1]), .clk(clk), .rst_n(rst_n), .d(SW[3:0]), .q(read_addr_reg));
	register #(4) register_write_addr (.ena(w_we[2]), .clk(clk), .rst_n(rst_n), .d(SW[3:0]), .q(write_addr_reg));
	
	hexto7segment hexto7segment_data_in0 (.in_hex(data_in_reg[3:0]), .out_7seg(HEX0[6:0]));
	hexto7segment hexto7segment_data_in1 (.in_hex(data_in_reg[7:4]), .out_7seg(HEX1[6:0]));
	hexto7segment hexto7segment_data_out0 (.in_hex(data_out[3:0]), .out_7seg(HEX2[6:0]));
	hexto7segment hexto7segment_data_out1 (.in_hex(data_out[7:4]), .out_7seg(HEX3[6:0]));
	hexto7segment hexto7segment_read_addr (.in_hex(read_addr_reg), .out_7seg(HEX4[6:0]));
	hexto7segment hexto7segment_write_addr (.in_hex(write_addr_reg), .out_7seg(HEX5[6:0]));
	
	dual_port_RAM #(8,4) dual_port_RAM 
	(
		.we(w_we[3]), 
		.clk(clk), 
		.data_in(data_in_reg), 
		.read_addr(read_addr_reg),
		.write_addr(write_addr_reg),
		.data_out(data_out)
	);
	
endmodule

