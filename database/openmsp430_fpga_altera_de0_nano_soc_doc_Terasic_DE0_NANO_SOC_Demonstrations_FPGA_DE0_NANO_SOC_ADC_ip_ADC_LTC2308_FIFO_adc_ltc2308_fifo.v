/* note for avalon interface
	bus type: nagtive
	read legacy = 0 (to consistent to FIFO)

*/

module adc_ltc2308_fifo(
	// avalon slave port
	slave_clk,
	slave_reset_n,
	slave_chipselect_n,
	slave_addr,
	slave_read_n,
	slave_wrtie_n,
	slave_readdata,
	slave_wriredata,
	
	adc_clk, // max 40mhz
	// adc interface
	ADC_CONVST,
	ADC_SCK,
	ADC_SDI,
	ADC_SDO
);

	// avalon slave port
input									slave_clk;
input									slave_reset_n;
input									slave_chipselect_n;
input				  					slave_addr;
input									slave_read_n;
input									slave_wrtie_n;
output	reg	[15:0]			slave_readdata;
input				[15:0]			slave_wriredata;



input								adc_clk;

output		          		ADC_CONVST;
output		          		ADC_SCK;
output	            		ADC_SDI;
input 		          		ADC_SDO;


////////////////////////////////////
// avalon slave port
`define WRITE_REG_START_CH				0
`define WRITE_REG_MEASURE_NUM			1

// write for control
reg 				measure_fifo_start;
reg  [11:0] 	measure_fifo_num;
reg	[2:0]		measure_fifo_ch;
always @ (posedge slave_clk or negedge slave_reset_n)	
begin
	if (~slave_reset_n)
		measure_fifo_start <= 1'b0;
	else if (~slave_chipselect_n && ~slave_wrtie_n && slave_addr == `WRITE_REG_START_CH)   
		{measure_fifo_ch, measure_fifo_start} <= slave_wriredata[3:0]; 
	else if (~slave_chipselect_n && ~slave_wrtie_n && slave_addr == `WRITE_REG_MEASURE_NUM)   
		measure_fifo_num <= slave_wriredata;
end

///////////////////////
// read 
`define READ_REG_MEASURE_DONE	0
`define READ_REG_ADC_VALUE		1
wire slave_read_status;
wire slave_read_data;


assign slave_read_status = (~slave_chipselect_n && ~slave_read_n && slave_addr == `READ_REG_MEASURE_DONE) ?1'b1:1'b0;
assign slave_read_data = (~slave_chipselect_n && ~slave_read_n && slave_addr == `READ_REG_ADC_VALUE) ?1'b1:1'b0;

reg measure_fifo_done;
always @ (posedge slave_clk)	
begin
	if (slave_read_status)   
		slave_readdata <= {11'b0, measure_fifo_done};
	else if (slave_read_data)   
		slave_readdata <= fifo_q;
end

reg pre_slave_read_data;
always @ (posedge slave_clk or negedge slave_reset_n)	
begin
	if (~slave_reset_n)
		pre_slave_read_data <= 1'b0;
	else
		pre_slave_read_data <= slave_read_data;
end

// read ack for adc data. (note. Slave_read_data is read lency=2, so slave_read_data is assert two clock)
assign fifo_rdreq = (pre_slave_read_data & slave_read_data)?1'b1:1'b0;

////////////////////////////////////
// create triggle message: adc_reset_n

reg pre_measure_fifo_start;
always @ (posedge adc_clk)	
begin
	pre_measure_fifo_start <= measure_fifo_start;
end

wire adc_reset_n;
assign adc_reset_n = (~pre_measure_fifo_start & measure_fifo_start)?1'b0:1'b1;

////////////////////////////////////
// control measure_start 
reg [11:0] measure_count;

reg config_first;
reg wait_measure_done;
reg measure_start;
wire measure_done;
wire [11:0] measure_dataread;

always @ (posedge adc_clk or negedge adc_reset_n)	
begin
	if (~adc_reset_n)
	begin
		measure_start <= 1'b0;
		config_first <= 1'b1;
		measure_count <= 0;
		measure_fifo_done <= 1'b0;
		wait_measure_done <= 1'b0;
	end 
	else if (~measure_fifo_done & ~measure_start & ~wait_measure_done)
	begin
		measure_start <= 1'b1;
		wait_measure_done <= 1'b1;
	end
	else if (wait_measure_done) // && measure_start)
	begin
		measure_start <= 1'b0;
		if (measure_done)
		begin
			if (config_first)
				config_first <= 1'b0;
			else
			begin	// read data and save into fifo
				
				if (measure_count < measure_fifo_num) // && ~fifo_wrfull)
				begin
					measure_count <= measure_count + 1;
					wait_measure_done <= 1'b0;
				end
				else
					measure_fifo_done <= 1'b1;
			end
		end
	end
end


// write data into fifo

reg pre_measure_done;

always @ (posedge adc_clk or negedge adc_reset_n)	
begin
	if (~adc_reset_n)
		pre_measure_done <= 1'b0;
	else
		pre_measure_done <= measure_done;
end

assign fifo_wrreq = (~pre_measure_done & measure_done & ~config_first)?1'b1:1'b0;


///////////////////////////////////////
// SPI

adc_ltc2308 adc_ltc2308_inst(
	.clk(adc_clk), // max 40mhz

	// start measure
	.measure_start(measure_start), // posedge triggle
	.measure_done(measure_done),
	.measure_ch(measure_fifo_ch),
	.measure_dataread(measure_dataread),	
	

	// adc interface
	.ADC_CONVST(ADC_CONVST),
	.ADC_SCK(ADC_SCK),
	.ADC_SDI(ADC_SDI),
	.ADC_SDO(ADC_SDO) 
);


///////////////////////////////////////
// FIFO
wire fifo_wrfull;
wire fifo_rdempty;
wire  fifo_wrreq;
wire [11:0]	 fifo_q;
wire fifo_rdreq;

	
adc_data_fifo adc_data_fifo_inst(
	.aclr(~adc_reset_n),
	.data(measure_dataread),
	.rdclk(slave_clk),
	.rdreq(fifo_rdreq),
	.wrclk(adc_clk),
	.wrreq(fifo_wrreq),
	.q(fifo_q),
	.rdempty(fifo_rdempty),
	.wrfull(fifo_wrfull) 
);	

	
endmodule
	