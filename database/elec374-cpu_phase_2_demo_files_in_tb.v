// This program was cloned from: https://github.com/conboy/elec374-cpu
// License: MIT License

`timescale 1ns/10ps

module in_tb; 	
reg pc_out; 
reg zlo_out;
reg zhi_out;
reg hi_out;
reg lo_out;
reg outport_enable;
reg inport_enable;
reg inport_out;
reg mdr_out;
reg mar_enable; 
reg z_enable;
reg lo_enable;
reg hi_enable;
reg pc_enable; 
reg mdr_enable; 
reg read;
reg ir_enable; 
reg y_enable;
reg pc_increment; 
reg r15_enable;
reg c_sign_extended_out;
reg clk; 
reg clr;
reg con_enable;
reg ram_write;
reg r_in;
reg r_out;
reg gra;
reg grb;
reg grc;
reg ba_out;
reg [31:0] inport_in;
wire [31:0] zlo_data;
wire [31:0] outport_data;

// Instantiate the DUT
datapath DUT(
	.pc_out(pc_out), 
	.zlo_out(zlo_out), 
	.zhi_out(zhi_out),
    .hi_out(hi_out),
    .lo_out(lo_out),
	.mdr_out(mdr_out), 
	.mar_enable(mar_enable), 
	.z_enable(z_enable), 
	.pc_enable(pc_enable), 
	.mdr_enable(mdr_enable), 
	.read(read), 
	.ir_enable(ir_enable), 
	.y_enable(y_enable), 
	.pc_increment(pc_increment),
    .r15_enable(r15_enable),
	.lo_enable(lo_enable),
	.hi_enable(hi_enable),
    .outport_enable(outport_enable),
    .inport_enable(inport_enable),
    .inport_out(inport_out),
	.c_sign_extended_out(c_sign_extended_out),
	.clr(clr), 
	.clk(clk),
    .con_enable(con_enable),
    .ram_write(ram_write),
    .r_in(r_in),
    .r_out(r_out),
    .gra(gra),
    .grb(grb),
    .grc(grc),
    .ba_out(ba_out),
	.inport_in(inport_in),
	.zlo_data(zlo_data),
	.outport_data(outport_data),
    .con_out(con_out)
);

// FSM signals
parameter start = 5'b00000; 
parameter inport_ld = 5'b00001;
parameter T0_in = 5'b00010;
parameter T1_in = 5'b00011;
parameter T2_in = 5'b00100;
parameter T3_in = 5'b00101;
parameter T4_in = 5'b00110;

reg	[4:0] present_state = start;

// Initialize the clock signals
initial begin
	clk = 0;
	clr = 0;
	forever #10 clk = ~ clk;
end

// FSM changes on positive edge of clock every two clock cycles
reg toggle = 0;

// Toggle the counter on every clock cycle
always @(posedge clk)
begin
    toggle <= ~toggle;
end

always @(posedge clk)
begin
    if (toggle == 1)  // Check if toggle is set to change the state
    begin
        case (present_state)
            start       : present_state = inport_ld;
            inport_ld  	: present_state = T0_in;
            T0_in	  	: present_state = T1_in;
            T1_in	  	: present_state = T2_in;
			T2_in	  	: present_state = T3_in;
			T3_in	  	: present_state = T4_in;
        endcase
    end
end

always @(present_state)
begin
	case (present_state)
		// present_state: 0
		// Set all signals to 0
		start: begin	
			pc_out <= 0; zlo_out <= 0; zhi_out <= 0; lo_enable <= 0; hi_enable <= 0; mdr_out <= 0;
			pc_enable <= 0; mdr_enable <= 0; mar_enable <= 0; 
			ir_enable <= 0; y_enable <= 0; pc_increment <= 0;   
			read <= 0;  z_enable <= 0; con_enable <= 0; ram_write <= 0; 
			r_in <= 0; r_out <= 0; gra <= 0; grb <= 0; grc <= 0; ba_out <= 0;
			c_sign_extended_out <= 0; hi_out <= 0; lo_out <= 0; r15_enable <= 0;
            outport_enable <= 0; inport_enable <= 0; inport_out <= 0;
			inport_in <= 32'h0000beef;
		end

		// present_state: 1
		inport_ld: begin
			inport_enable <= 1; inport_out <= 1;
			#20 inport_enable <= 0; inport_out <= 0;
		end

		// present_state: 7
		T0_in: begin
			pc_out <= 1; mar_enable <= 1; pc_increment <= 1; 
			#20 mar_enable <= 0; pc_increment <= 0; z_enable <= 1;
			#20 pc_out <= 0; z_enable <= 0;
		end

		// present_state: 8
		T1_in: begin
			read <= 1; mdr_enable <= 1; pc_enable <= 1; zlo_out <= 1;
			#20 read <= 0; mdr_enable <= 0; pc_enable <= 0; zlo_out <= 0;
		end

		// present_state: 9
		T2_in: begin
			mdr_out <= 1; ir_enable <= 1; 
			#20 mdr_out<= 0; ir_enable <= 0;
		end

		// present_state: a
		T3_in: begin	
			inport_out <= 1; gra <= 1; r_in <= 1;
            #20 inport_out <= 0; gra <= 0; r_in <= 0;
		end
	endcase
end
endmodule