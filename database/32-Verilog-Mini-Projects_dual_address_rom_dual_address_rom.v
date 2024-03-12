module dual_port_rom 
	(input clk,
	 input wr_en,
	 input [3:0] addr_in_0,
	 input [3:0] addr_in_1,
	 input port_en_0,
	 input port_en_1,
	 output [7:0] data_out_0,
	 output [7:0] data_out_1);

reg   [4:0] raddr;
reg[7:0] rom [7:0];

 always @(posedge clk)
 begin
    if (port_en_0 == 1 && wr_en == 1)
       raddr <= addr_in_0;
 end

 always @(raddr) 
 begin
    if (port_en_0 == 1 && wr_en == 1)
       case(raddr)
   4'b0000: rom[raddr] = 8'b00100100;
   4'b0001: rom[raddr] = 8'b00100011;
   4'b0010: rom[raddr] = 8'b11100010;
   4'b0011: rom[raddr] = 8'b00100001;
   4'b0100: rom[raddr] = 8'b01000101;
   4'b0101: rom[raddr] = 8'b10101110;
   4'b0110: rom[raddr] = 8'b11001011;
   4'b0111: rom[raddr] = 8'b00000000;
   4'b1000: rom[raddr] = 8'b10100011;
   4'b1001: rom[raddr] = 8'b00101010;
   4'b1010: rom[raddr] = 8'b11101100;
   4'b1011: rom[raddr] = 8'b00100010;
   4'b1100: rom[raddr] = 8'b01000000;
   4'b1101: rom[raddr] = 8'b10100000;
   4'b1110: rom[raddr] = 8'b00001100;
   4'b1111: rom[raddr] = 8'b00000000;
   default: rom[raddr] = 8'bXXXXXXXX;
       endcase
 end
assign data_out_0 = port_en_0 ? rom[addr_in_0] : 'dZ;   
assign data_out_1 = port_en_1 ? rom[addr_in_1] : 'dZ;  
endmodule

module dual_port_rom_tb;

    // Inputs
    reg clk;
    reg wr_en;
    reg [3:0] addr_in_0;
    reg [3:0] addr_in_1;
    reg port_en_0;
    reg port_en_1;

    // Outputs
    wire [7:0] data_out_0;
    wire [7:0] data_out_1;
    
    integer i;

    // Instantiate the Unit Under Test (UUT)
    dual_port_rom uut (
        .clk(clk), 
        .wr_en(wr_en),  
        .addr_in_0(addr_in_0), 
        .addr_in_1(addr_in_1), 
        .port_en_0(port_en_0), 
        .port_en_1(port_en_1), 
        .data_out_0(data_out_0), 
        .data_out_1(data_out_1)
    );
    
    always
        #5 clk = ~clk;

    initial begin
        // Initialize Inputs
        clk = 1;
        addr_in_1 = 0;
        port_en_0 = 0;
        port_en_1 = 0;
        wr_en = 0;
        addr_in_0 = 0;  
        #20
        port_en_0 = 1;  
        wr_en = 1;
      for(i=1; i <= 16; i = i + 1) begin
            addr_in_0 = i-1;
            #10;
        end
        wr_en = 0;
        port_en_0 = 0;  
        //Read from port 1, all the locations of ROM.
        port_en_1 = 1;  
        for(i=1; i <= 16; i = i + 1) begin
            addr_in_1 = i-1;
            #10;
        end
        port_en_1 = 0;
    end
      
endmodule
