// This program was cloned from: https://github.com/conboy/elec374-cpu
// License: MIT License

`timescale 1ns/10ps

module andi_tb; 	
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
wire [31:0] zlo_data;

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
	.zlo_data(zlo_data),
    .con_out(con_out)
);

// FSM signals
parameter start = 5'b00000; 
parameter T0_ldi = 5'b00001;
parameter T1_ldi = 5'b00010;
parameter T2_ldi = 5'b00011;
parameter T3_ldi = 5'b00100;
parameter T4_ldi = 5'b00101;
parameter T5_ldi = 5'b00110;
parameter T0_andi = 5'b00111; 
parameter T1_andi = 5'b01000;
parameter T2_andi = 5'b01001;
parameter T3_andi = 5'b01010;
parameter T4_andi = 5'b01011;
parameter T5_andi = 5'b01100;

reg	[3:0] present_state = start;

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
            start       : present_state = T0_ldi;
            T0_ldi  	: present_state = T1_ldi;
            T1_ldi  	: present_state = T2_ldi;
            T2_ldi  	: present_state = T3_ldi;
            T3_ldi  	: present_state = T4_ldi;
            T4_ldi  	: present_state = T5_ldi;
            T5_ldi  	: present_state = T0_andi;
            T0_andi     : present_state = T1_andi;
			T1_andi     : present_state = T2_andi;
			T2_andi     : present_state = T3_andi;
			T3_andi     : present_state = T4_andi;
			T4_andi     : present_state = T5_andi;
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
		end
		
		// present_state: 1
		T0_ldi: begin
			pc_out <= 1; mar_enable <= 1; pc_increment <= 1; 
			#20 mar_enable <= 0; pc_increment <= 0; z_enable <= 1;
			#20 pc_out <= 0; z_enable <= 0;
		end

		// present_state: 2
		T1_ldi: begin
			// 
			read <= 1; mdr_enable <= 1; pc_enable <= 1; zlo_out <= 1;
			#20 read <= 0; mdr_enable <= 0; pc_enable <= 0; zlo_out <= 0;
		end

		// present_state: 3
		T2_ldi: begin
			mdr_out <= 1; ir_enable <= 1; 
			#20 mdr_out<= 0; ir_enable <= 0;
		end

		// present_state: 4
		T3_ldi: begin	
			grb <= 1; ba_out <= 1; y_enable <= 1;
			#20 grb <= 0; ba_out <= 0; y_enable <= 0;
		end

		// present_state: 5
		T4_ldi: begin	
			c_sign_extended_out <= 1;  z_enable <= 1;
			#20 c_sign_extended_out <= 0; z_enable <= 0;
		end

		// present_state: 6
		T5_ldi: begin
			zlo_out <= 1; gra <= 1; r_in <= 1;
			#20 zlo_out <= 0; gra <= 0;  r_in <= 0;
		end

		// present_state: 7
		T0_andi: begin
			pc_out <= 1; mar_enable <= 1; pc_increment <= 1; 
			#20 mar_enable <= 0; pc_increment <= 0; z_enable <= 1;
			#20 pc_out <= 0; z_enable <= 0;
		end

		// present_state: 8
		T1_andi: begin
			read <= 1; mdr_enable <= 1; pc_enable <= 1; zlo_out <= 1;
			#20 read <= 0; mdr_enable <= 0; pc_enable <= 0; zlo_out <= 0;
		end

		// present_state: 9
		T2_andi: begin
			mdr_out <= 1; ir_enable <= 1; 
			#20 mdr_out<= 0; ir_enable <= 0;
		end

		// present_state: a
		T3_andi: begin	
			grb <= 1; r_out <= 1; y_enable <= 1;
			#20 grb <= 0; r_out <= 0; y_enable <= 0;
		end

		// present_state: b
		T4_andi: begin	
			c_sign_extended_out <= 1;  z_enable <= 1;
			#20 c_sign_extended_out <= 0; z_enable <= 0;
		end

		// present_state: c
		T5_andi: begin
			zlo_out <= 1; gra <= 1; r_in <= 1;
			#20 zlo_out <= 0; gra <= 0;  r_in <= 0;
		end
	endcase
end
endmodule