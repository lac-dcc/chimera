`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name:    sd_top
//////////////////////////////////////////////////////////////////////////////////
module sd_top(
					input              sd_rstn,

					input              SD_clk,					
					output  reg        SD_cs,
					output  reg        SD_datain,
					input              SD_dataout,
					
	
					output             myvalid_o,
					output   [7:0]     mydata_o,
					output             init_o,
               output             pic_read_done					
   
					
    );


wire [3:0] state_initial;
wire [3:0] state_read;

wire [7:0]rx_o;
wire init_o;
wire read_o;

wire SD_cs_i;
wire SD_cs_r;
wire SD_datain_i;
wire SD_datain_r;


//---------------------------------
//sd card initial				
sd_initial	sd_initial_inst(

			.rst_n         (sd_rstn),				 
			.SD_clk        (SD_clk),
			.SD_cs         (SD_cs_i),
			.SD_datain     (SD_datain_i),
			.SD_dataout    (SD_dataout),
			.rx            (),
			.init_o        (init_o),
			.state         (state_initial)
);

//---------------------------------
//sd card data read	 
sd_read	sd_read_inst(   
			.SD_clk        (SD_clk),
			.SD_cs         (SD_cs_r),
			.SD_datain     (SD_datain_r),
			.SD_dataout    (SD_dataout),
				
			.mydata_o      (mydata_o),
			.myvalid_o     (myvalid_o),
		
			
			.data_come     (),
			
			.init          (init_o),
					
			.mystate       (state_read),
			
			.read_o        (pic_read_done)
						
						
    );

						

//---------------------------------
//sdĞÅºÅÑ¡Ôñ
always @(*)
begin
	if(!init_o)	begin
	      SD_cs<=SD_cs_i;
			SD_datain<=SD_datain_i;
	end
	else begin
	      SD_cs<=SD_cs_r;
			SD_datain<=SD_datain_r;
	end
end

	 
endmodule


