// This program was cloned from: https://github.com/spacemen3/PDP-1
// License: MIT License

/*The PDP-1 Core running Spacewar! on the Analogue Pocket via openFPGA
Uses the original tape program file of Spacewar! v3.1 1962
Supports Sleep/Wake and Memories (beta)
All colors are assigned via an updatable LUT
Main sense switches are set via an updatable config file */

module tape_rim_drive (

	input							clk,
	input							sys_clk,
	input							reset_internal_n,
	input							reset_n,

	input				[31:0]	bridge_addr,
	input							bridge_wr,
	input				[31:0]	bridge_wr_data,
	
	input 						next_tape_char,

   output 	reg 	[11:0]  	tape_address,
   output 	reg	[17:0]  	tape_data,
   output	reg				tape_write,
	output 	reg				data_wait,
	
	output	reg				rim_mode,
	
	output	reg				run_core,
	
	output 	reg 	[11:0] 	start_address	
);

localparam 	op_jmp   = 6'h30,    
				op_dio   = 6'h1a;

wire [31:0] 	tape_read_data;
reg 				data_move_internal;
wire 				rdempty;

reg [31:0] 		bridge_wr_data_reg;
reg 				fifo_clk_write;

reg 				next_tape_char_reg;
reg [31:0] 		timeout; 
		
wire [7:0] 		data_output;

reg [3:0] 		tape_state;

reg				first_tape_run;

parameter	idle				= 0,
				tape_command_s	= 1,
				tape_address_1	= 2,
				tape_address_2	= 3,
				tape_data_1		= 4,
				tape_data_2		= 5,
				tape_data_3		= 6,
				tape_process	= 7,
				rim_idle			= 8,
				rim_data_1		= 9,
				rim_data_2		= 10,
				rim_data_3		= 11;
				
reg [5:0]	tape_command;



always @(posedge clk) begin
	fifo_clk_write <= (bridge_wr && bridge_addr[31:24] == 16'h0 && |{bridge_wr_data[31], bridge_wr_data[23],bridge_wr_data[15],bridge_wr_data[7],});
	bridge_wr_data_reg <= {bridge_wr_data[ 7: 0], bridge_wr_data[15: 8], bridge_wr_data[23:16], bridge_wr_data[31:24]};
end
			
wire fifo_empty;
			
data_fifo data_fifo(
	.aclr			(~reset_internal_n),
	.data			(bridge_wr_data_reg),
	.rdclk		(sys_clk),
	.rdreq		(data_move_internal),
	.wrclk		(clk),
	.wrreq		(fifo_clk_write),
	.q				(data_output),
	.rdempty		(fifo_empty),
	.wrfull		()
);	



always @* begin
	case(tape_state)
			
				// Inject into PDP-1 Ram
			
				tape_command_s,
				tape_address_1,
				tape_address_2,
				tape_data_1,
				tape_data_2,
				tape_data_3: begin
					if (~fifo_empty) begin
						data_move_internal <= 1'b1;
					end
					else begin
						data_move_internal <= 1'b0;
					end
				end
								
				// Normal mode
				
				
				rim_data_1,
				rim_data_2,
				rim_data_3 : begin
					if (~fifo_empty) begin
						data_move_internal <= 1'b1;
					end
					else begin
						data_move_internal <= 1'b0;
					end
				end
				
				default : begin
					data_move_internal <= 1'b0;
				end
			endcase
end
		  
always @(posedge sys_clk or negedge reset_n) begin
	if (~reset_n) begin
		start_address			<= 1'h0;
		rim_mode  				<= 1'b1;
		timeout					<= 1'b0;
		run_core					<= 1'b1;
		data_wait				<= 1'b1;
		first_tape_run 		<= 1'b0;
	end
	else begin
		next_tape_char_reg 	<= next_tape_char;
		tape_write 				<= 1'b0;
		timeout					<= timeout + 1;
		if (timeout != 32'h2fff_ffff) begin
		
			case(tape_state)
			
				// Inject into PDP-1 Ram
			
				idle : begin
					if (~fifo_empty) begin	
						tape_state <= tape_command_s;
					end
					timeout <= 'b0;
				end
				tape_command_s : begin
					if (data_output[7] && data_move_internal) begin
						tape_state <= tape_address_1;
						tape_command <= data_output[5:0];
						timeout <= 'b0;
					end
				end
				tape_address_1 : begin
					if (data_output[7] && data_move_internal) begin
						tape_state <= tape_address_2;
						tape_address[11:6] <= data_output[5:0];
						timeout <= 'b0;
					end
				end
				tape_address_2 : begin
					if (data_output[7] && data_move_internal) begin
						if (tape_command == op_jmp)  tape_state <= tape_process;
						else tape_state <= tape_data_1;
						tape_address[5:0] <= data_output[5:0];
						timeout <= 'b0;
						start_address <= {tape_address[11:6], data_output[5:0]};
					end
				end
				tape_data_1 : begin
					if (data_output[7] && data_move_internal) begin
						tape_state <= tape_data_2;
						tape_data[17:12] <= data_output[5:0];
						timeout <= 'b0;
					end
				end
				tape_data_2 : begin
					if (data_output[7] && data_move_internal) begin
						tape_state <= tape_data_3;
						tape_data[11: 6] <= data_output[5:0];
						timeout <= 'b0;
					end
				end
				tape_data_3 : begin
					if (data_output[7] && data_move_internal) begin
						tape_state <= tape_process;
						tape_data[ 5: 0] <= data_output[5:0];
						timeout <= 'b0;
						start_address <= tape_address;
					end
				end
				tape_process : begin
					if (tape_command == op_dio) begin
						tape_state <= idle;
						tape_write <= 1'b1;
					end
					else if (tape_command == op_jmp) begin
						tape_state 	<= rim_idle;
						run_core 	<= 1'b0;
						rim_mode		<= 1'b0;
						first_tape_run <= 1'b1;
					end
				end
				
				// Normal mode
				
				rim_idle : begin
					if ((next_tape_char_reg && ~next_tape_char) || first_tape_run) begin
						tape_state 			<= rim_data_1;
						data_wait 			<= 1'b0;
						first_tape_run 	<= 1'b0;
					end
					else begin
						data_wait 			<= 1'b1;
						timeout 				<= 'b0;
					end
				end
				rim_data_1 : begin
					if (data_output[7] && data_move_internal) begin
						tape_state 			<= rim_data_2;
						tape_data[17:12] 	<= data_output[5:0];
						timeout 				<= 'b0;
					end
				end
				rim_data_2 : begin
					if (data_output[7] && data_move_internal) begin
						tape_state 			<= rim_data_3;
						tape_data[11: 6] 	<= data_output[5:0];
						timeout 				<= 'b0;
					end
				end
				rim_data_3 : begin
					if (data_output[7] && data_move_internal) begin
						tape_state 			<= rim_idle;
						tape_data[ 5: 0] 	<= data_output[5:0];
						timeout 				<= 'b0;
					end
				end
			endcase
		end
		else begin
			tape_state 	<= rim_idle;
		end
	end
end

		
endmodule


