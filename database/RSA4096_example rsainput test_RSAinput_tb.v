// Test bench file for RSAinput Simulation

`timescale 1 ps/ 1 ps
module RSAinput_tb
  #(parameter WIDTH = 32, ADDR_WIDTH = 7)();
	
	reg [ADDR_WIDTH - 1 : 0] t_reg_addr1;
	reg [ADDR_WIDTH - 1 : 0] t_reg_addr2;
	reg t_reg_clk;
	wire [ADDR_WIDTH - 1 : 0] t_wire_addr1;
	wire [ADDR_WIDTH - 1 : 0] t_wire_addr2;
	wire t_wire_clk; 
	wire [WIDTH - 1 : 0] t_wire_dataoutl;
	wire [WIDTH - 1 : 0] t_wire_dataouth;
	
	assign {t_wire_addr1, t_wire_addr2} = {t_reg_addr1, t_reg_addr2};
	RSAinput tb(
	   .addr1(t_wire_addr1), .addr2(t_wire_addr2), .clk(t_wire_clk),
	   .dataoutl(t_wire_dataoutl), .dataouth(t_wire_dataouth)
	);
	
	initial
	begin
		t_reg_addr1 = 7'b0000000;
		t_reg_addr2 = 7'b0000000;
		t_reg_clk = 0;
		#600  $finish;
	end
	
	// clock
  always
  begin
	   #50 t_reg_clk = ~t_reg_clk;
  end 
	
//	// addr1
//	initial 
//	begin 
//	   t_reg_addr1 = 7'b0000000;
//	   t_reg_addr1 = #230 7'b0000001;
//	   #230;
//	end
//	
//	// addr
//	initial
//	begin
//	   t_reg_addr2 = 7'b0000000;
//	   t_reg_addr2 = #460 7'b0000001;
//	   #460;
//	end
	
endmodule
