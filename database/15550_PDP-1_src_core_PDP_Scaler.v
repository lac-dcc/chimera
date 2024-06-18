// This program was cloned from: https://github.com/spacemen3/PDP-1
// License: MIT License

module Scaler_pdp (
	input main_clk,                                              /* Main Clock input, 1280 x 1024 @ 60 Hz is 108 MHz pixel clock */
	input clk,                                                   /* VGA Scaller Clock input, 1280 x 1024 @ 60 Hz is 108 MHz pixel clock */
	
	input [7:0] red_out_internal,                                    /* Outputs RGB values for corresponding pixels */
	input [7:0] green_out_internal,
	input [7:0] blue_out_internal,

	input [10:0] horizontal_counter,                             /* Current video drawing position */
   input [10:0] vertical_counter,                            
	
	output reg [10:0] horizontal_counter_internal,                             /* Current video drawing position */
   output reg [10:0] vertical_counter_internal,                            
	
	output reg [7:0] red_out,                                    /* Outputs RGB values for corresponding pixels */
	output reg [7:0] green_out,
	output reg [7:0] blue_out
	
);

// this is for the Internal video

	parameter DATA_WIDTH = 8;
	parameter COEFF_WIDTH = 9;
	parameter CHANNELS = 3;
	parameter FRACTION_BITS = 8;

	localparam		internal_BPORCH = 'd1;
	localparam		internal_ACTIVE = 'd1024;
	localparam		internal_TOTAL  = 'd1030;



// This is for the external Video

	localparam		VID_H_BPORCH = 'd145;
	localparam		VID_H_ACTIVE = 'd720;
	localparam		VID_H_TOTAL  = 'd1024;
	localparam		VID_V_ACTIVE = 'd720;
	localparam		VID_V_TOTAL  = 'd780;
	localparam		VID_V_BPORCH = 'd8;

wire [8:0] internal_scaler_fraction = 9'b1_01101100;
reg [18:0] Internal_y_scale_adder; // this is the final adder with the scaler
reg [18:0] Internal_x_scale_adder; // this is the final adder with the scaler
wire [23:0] read_color_0, read_color_1, read_color_2, read_color_3;


wire [DATA_WIDTH*CHANNELS-1:0]	readData00;
wire [DATA_WIDTH*CHANNELS-1:0]	readData01;
wire [DATA_WIDTH*CHANNELS-1:0]	readData10;
wire [DATA_WIDTH*CHANNELS-1:0]	readData11;
reg [DATA_WIDTH*CHANNELS-1:0]	readData00Reg;
reg [DATA_WIDTH*CHANNELS-1:0]	readData01Reg;
reg [DATA_WIDTH*CHANNELS-1:0]	readData10Reg;
reg [DATA_WIDTH*CHANNELS-1:0]	readData11Reg;

reg [1:0] internal_y_read_0;
reg [1:0] internal_y_read_1;

reg swap_y;

reg write_BRAM_reg;
wire write_BRAM_wire = (horizontal_counter_internal >= 1 && horizontal_counter_internal < 1024);

always @(posedge main_clk) begin
	write_BRAM_reg <= write_BRAM_wire;
end

reg [1:0]	internal_y_write_counter_final;

always @* begin
	case (Internal_y_scale_adder[9:8])
		2'h3		: internal_y_write_counter_final <= 'd2;
		2'h2		: internal_y_write_counter_final <= 'd1;
		3'h1		: internal_y_write_counter_final <= 'd0;
		default	: internal_y_write_counter_final <= 'd3;
	endcase
end

always @(posedge main_clk) begin
	// This is the starter for the read the video from the high reg video
	if ((vertical_counter >= (VID_V_BPORCH - 2)) && (vertical_counter <= (VID_V_BPORCH + VID_V_ACTIVE))) begin
		// This checks if the line buffers are full
		if (vertical_counter_internal[1:0] != internal_y_write_counter_final) begin			
			horizontal_counter_internal <= horizontal_counter_internal + 1;
			if(horizontal_counter_internal == internal_TOTAL) begin
				horizontal_counter_internal <= 0;
				vertical_counter_internal <= vertical_counter_internal + 1'b1;
				if(vertical_counter_internal == internal_TOTAL) begin
					vertical_counter_internal <= 0;
				end
			end
		end
	end
	else begin
		vertical_counter_internal <= 'b0;
		horizontal_counter_internal <= 'b0;
	end
end

wire [9:0]	internal_x_write = horizontal_counter_internal - 1;
wire [1:0]	internal_y_write = vertical_counter_internal - 1;

scaler_main_ram scaler_main_ram_0(
   .address_a		({internal_y_write[1], internal_x_write[9:0]}),
   .address_b		({internal_y_read_0, Internal_x_scale_adder[17:8]}),
   .clock_a			(main_clk),
   .clock_b			(clk),
   .data_a			({red_out_internal, green_out_internal, blue_out_internal}),
   .wren_a			(&{~internal_y_write[0], write_BRAM_reg}),
   .wren_b			(1'b0),
   .q_b				(readData00));
	
scaler_main_ram scaler_main_ram_1(
   .address_a		({internal_y_write[1], internal_x_write[9:0]}),
   .address_b		({internal_y_read_1, Internal_x_scale_adder[17:8]}),
   .clock_a			(main_clk),
   .clock_b			(clk),
   .data_a			({red_out_internal, green_out_internal, blue_out_internal}),
   .wren_a			(&{internal_y_write[0], write_BRAM_reg}),
   .wren_b			(1'b0),
   .q_b				(readData10));
	
scaler_main_ram scaler_main_ram_2(
   .address_a		({internal_y_write[1], internal_x_write[9:0]}),
   .address_b		({internal_y_read_0, Internal_x_scale_adder[17:8] + 1}),
   .clock_a			(main_clk),
   .clock_b			(clk),
   .data_a			({red_out_internal, green_out_internal, blue_out_internal}),
   .wren_a			(&{~internal_y_write[0], write_BRAM_reg}),
   .wren_b			(1'b0),
   .q_b				(readData01));
	
scaler_main_ram scaler_main_ram_3(
   .address_a		({internal_y_write[1], internal_x_write[9:0]}),
   .address_b		({internal_y_read_1, Internal_x_scale_adder[17:8] + 1}),
   .clock_a			(main_clk),
   .clock_b			(clk),
   .data_a			({red_out_internal, green_out_internal, blue_out_internal}),
   .wren_a			(&{internal_y_write[0], write_BRAM_reg}),
   .wren_b			(1'b0),
   .q_b				(readData11));
	
// X scaler address Multipler for the read side
wire [10:0]	internal_x_read;

reg [10:0] x_read_counter;


reg [18:0] Internal_x_scale_0_adder_reg, Internal_x_scale_1_adder_reg, Internal_x_scale_2_adder_reg, Internal_x_scale_3_adder_reg;

always @(posedge clk) begin
	x_read_counter <= (horizontal_counter >= (VID_H_BPORCH) && horizontal_counter <= (VID_H_BPORCH + VID_V_ACTIVE)) ? horizontal_counter - VID_H_BPORCH : 'b0;
	Internal_x_scale_adder <= internal_scaler_fraction * x_read_counter;
end

// Y scaler address Multipler for the read side We only need to care about 4 lines of Virtical lines

reg [10:0] y_read_counter;


reg [18:0] Internal_y_scale_0_adder_reg, Internal_y_scale_1_adder_reg, Internal_y_scale_2_adder_reg, Internal_y_scale_3_adder_reg;


always @(posedge clk) begin
	y_read_counter <= (vertical_counter >= VID_V_BPORCH ) ? vertical_counter - VID_V_BPORCH : 'b0;
	Internal_y_scale_adder <= internal_scaler_fraction * y_read_counter;
end

// This is used for the line selector for the read

always @* begin
	case (Internal_y_scale_adder[9:8])

		2'd3 : begin
			internal_y_read_0 <= 1'b0;
			internal_y_read_1 <= 1'b1;
			swap_y            <= 1'b1;
		end
		2'd2 : begin
			internal_y_read_0 <= 1'b1;
			internal_y_read_1 <= 1'b1;
			swap_y            <= 1'b0;
		end
		2'd1 : begin
			internal_y_read_0 <= 1'b1;
			internal_y_read_1 <= 1'b0;
			swap_y            <= 1'b1;
		end
		default : begin
			internal_y_read_0 <= 1'b0;
			internal_y_read_1 <= 1'b0;
			swap_y            <= 1'b0;
		end
	endcase
end

// Color Multiplyer

// Red Color (I love making real code for this)

wire [COEFF_WIDTH-1:0]	preCoeff00 = (((coeffOne - Internal_x_scale_adder[7:0]) * (coeffOne - Internal_y_scale_adder[7:0]) + (coeffHalf - 1)) >> FRACTION_BITS) & 	{{COEFF_WIDTH{1'b0}}, {COEFF_WIDTH{1'b1}}};
wire [COEFF_WIDTH-1:0]	preCoeff01 = ((Internal_x_scale_adder[7:0] * (coeffOne - Internal_y_scale_adder[7:0]) + (coeffHalf - 1)) >> FRACTION_BITS) & 				{{COEFF_WIDTH{1'b0}}, {COEFF_WIDTH{1'b1}}};
wire [COEFF_WIDTH-1:0]	preCoeff10 = (((coeffOne - Internal_x_scale_adder[7:0]) * Internal_y_scale_adder[7:0] + (coeffHalf - 1)) >> FRACTION_BITS) &				{{COEFF_WIDTH{1'b0}}, {COEFF_WIDTH{1'b1}}};

// We will run 4 stages to the scaller
reg [23:0] dOut;

reg [COEFF_WIDTH-1:0] 	coeff00;		//Top left
reg [COEFF_WIDTH-1:0] 	coeff01;		//Top right
reg [COEFF_WIDTH-1:0]	coeff10;		//Bottom left
reg [COEFF_WIDTH-1:0]	coeff11;		//Bottom right

//Coefficient value of one, format Q1.COEFF_WIDTH-1
wire [COEFF_WIDTH-1:0]	coeffOne = {1'b1, {(COEFF_WIDTH-1){1'b0}}};	//One in MSb, zeros elsewhere
wire [COEFF_WIDTH-1:0]	coeffHalf = {2'b01, {(COEFF_WIDTH-2){1'b0}}};

always @(posedge clk) begin
//	coeff00 <= Internal_x_scale_adder < coeffHalf && Internal_y_scale_adder < coeffHalf ? coeffOne : {COEFF_WIDTH{1'b0}};
//	coeff01 <= Internal_x_scale_adder >= coeffHalf && Internal_y_scale_adder < coeffHalf ? coeffOne : {COEFF_WIDTH{1'b0}};
//	coeff10 <= Internal_x_scale_adder < coeffHalf && Internal_y_scale_adder >= coeffHalf ? coeffOne : {COEFF_WIDTH{1'b0}};
//	coeff11 <= Internal_x_scale_adder >= coeffHalf && Internal_y_scale_adder >= coeffHalf ? coeffOne : {COEFF_WIDTH{1'b0}};
			coeff00 <= preCoeff00;
			coeff01 <= preCoeff01;
			coeff10 <= preCoeff10;
			coeff11 <= ((Internal_x_scale_adder[7:0] * Internal_y_scale_adder[7:0] + (coeffHalf - 1)) >> FRACTION_BITS) &								{{COEFF_WIDTH{1'b0}}, {COEFF_WIDTH{1'b1}}};
	red_out 		<= dOut[23:16];
	green_out 	<= dOut[15:8];
	blue_out 	<= dOut[7:0];
end



wire rst = 0;

reg [(DATA_WIDTH+COEFF_WIDTH)*CHANNELS-1:0]	product00, product01, product10, product11;

generate
genvar channel;
	for(channel = 0; channel < CHANNELS; channel = channel + 1)
		begin : blend_mult_generate
			always @(posedge clk or posedge rst)
			begin
				if(rst)
				begin
					//productxx[channel] <= 0;
					product00[ (DATA_WIDTH+COEFF_WIDTH)*(channel+1)-1 : (DATA_WIDTH+COEFF_WIDTH)*channel] <= 0;
					product01[ (DATA_WIDTH+COEFF_WIDTH)*(channel+1)-1 : (DATA_WIDTH+COEFF_WIDTH)*channel] <= 0;
					product10[ (DATA_WIDTH+COEFF_WIDTH)*(channel+1)-1 : (DATA_WIDTH+COEFF_WIDTH)*channel] <= 0;
					product11[ (DATA_WIDTH+COEFF_WIDTH)*(channel+1)-1 : (DATA_WIDTH+COEFF_WIDTH)*channel] <= 0;
					
					//readDataxxReg[channel] <= 0;
					readData00Reg[ DATA_WIDTH*(channel+1)-1 : DATA_WIDTH*channel ] <= 0;
					readData01Reg[ DATA_WIDTH*(channel+1)-1 : DATA_WIDTH*channel ] <= 0;
					readData10Reg[ DATA_WIDTH*(channel+1)-1 : DATA_WIDTH*channel ] <= 0;
					readData11Reg[ DATA_WIDTH*(channel+1)-1 : DATA_WIDTH*channel ] <= 0;
					
					//dOut[channel] <= 0;
					dOut[ DATA_WIDTH*(channel+1)-1 : DATA_WIDTH*channel ] <= 0;
				end
				else
				begin
					//readDataxxReg[channel] <= readDataxx[channel];
					readData00Reg[ DATA_WIDTH*(channel+1)-1 : DATA_WIDTH*channel ] <= swap_y ? readData10[ DATA_WIDTH*(channel+1)-1 : DATA_WIDTH*channel ] : readData00[ DATA_WIDTH*(channel+1)-1 : DATA_WIDTH*channel ];
					readData01Reg[ DATA_WIDTH*(channel+1)-1 : DATA_WIDTH*channel ] <= swap_y ? readData11[ DATA_WIDTH*(channel+1)-1 : DATA_WIDTH*channel ] : readData01[ DATA_WIDTH*(channel+1)-1 : DATA_WIDTH*channel ];
					readData10Reg[ DATA_WIDTH*(channel+1)-1 : DATA_WIDTH*channel ] <= swap_y ? readData00[ DATA_WIDTH*(channel+1)-1 : DATA_WIDTH*channel ] : readData10[ DATA_WIDTH*(channel+1)-1 : DATA_WIDTH*channel ];
					readData11Reg[ DATA_WIDTH*(channel+1)-1 : DATA_WIDTH*channel ] <= swap_y ? readData01[ DATA_WIDTH*(channel+1)-1 : DATA_WIDTH*channel ] : readData11[ DATA_WIDTH*(channel+1)-1 : DATA_WIDTH*channel ];
				
					//productxx[channel] <= readDataxxReg[channel] * coeffxx
					product00[ (DATA_WIDTH+COEFF_WIDTH)*(channel+1)-1 : (DATA_WIDTH+COEFF_WIDTH)*channel] <= readData00Reg[ DATA_WIDTH*(channel+1)-1 : DATA_WIDTH*channel ] * coeff00;
					product01[ (DATA_WIDTH+COEFF_WIDTH)*(channel+1)-1 : (DATA_WIDTH+COEFF_WIDTH)*channel] <= readData01Reg[ DATA_WIDTH*(channel+1)-1 : DATA_WIDTH*channel ] * coeff01;
					product10[ (DATA_WIDTH+COEFF_WIDTH)*(channel+1)-1 : (DATA_WIDTH+COEFF_WIDTH)*channel] <= readData10Reg[ DATA_WIDTH*(channel+1)-1 : DATA_WIDTH*channel ] * coeff10;
					product11[ (DATA_WIDTH+COEFF_WIDTH)*(channel+1)-1 : (DATA_WIDTH+COEFF_WIDTH)*channel] <= readData11Reg[ DATA_WIDTH*(channel+1)-1 : DATA_WIDTH*channel ] * coeff11;
					
					if (horizontal_counter >= VID_H_BPORCH && horizontal_counter < VID_H_BPORCH + VID_H_ACTIVE) begin
					dOut[ DATA_WIDTH*(channel+1)-1 : DATA_WIDTH*channel ] <=
							(((product00[ (DATA_WIDTH+COEFF_WIDTH)*(channel+1)-1 : (DATA_WIDTH+COEFF_WIDTH)*channel]) + 
							(product01[ (DATA_WIDTH+COEFF_WIDTH)*(channel+1)-1 : (DATA_WIDTH+COEFF_WIDTH)*channel]) +
							(product10[ (DATA_WIDTH+COEFF_WIDTH)*(channel+1)-1 : (DATA_WIDTH+COEFF_WIDTH)*channel]) +
							(product11[ (DATA_WIDTH+COEFF_WIDTH)*(channel+1)-1 : (DATA_WIDTH+COEFF_WIDTH)*channel])) >> FRACTION_BITS) & ({ {COEFF_WIDTH{1'b0}}, {DATA_WIDTH{1'b1}} });
				
					end
					else begin
						dOut[ DATA_WIDTH*(channel+1)-1 : DATA_WIDTH*channel ] <= 24'h0;
					end
				end
			end
		end
endgenerate

endmodule