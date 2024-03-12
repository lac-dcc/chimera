module TERASIC_IRM(
	clk,  // must be 50 MHZ
	reset_n,
	
	// interrrupt
	irq,
	
	// avalon slave
	s_cs_n,
	s_read,
	s_readdata,
	s_write,
	s_writedata,
	
	// export
	ir
	
);


input			clk;
input			reset_n;
output	reg		irq;
input			s_cs_n;
input			s_read;
output	[31:0]	s_readdata;
input			s_write;
input	[31:0]	s_writedata;
input			ir;

// write to clear interrupt
wire data_ready;
//always @ (posedge clk or posedge data_ready or negedge reset_n)
reg	pre_data_ready;
always @ (posedge clk or negedge reset_n)
begin
	if (~reset_n)
		pre_data_ready <= 1'b0;
	else
		pre_data_ready <= data_ready;
end

always @ (posedge clk or negedge reset_n)
begin
	if (~reset_n)
		irq <= 1'b0;
	else if (~pre_data_ready & data_ready)
		irq <= 1'b1;
	else if (~s_cs_n & s_write)
		irq <= 1'b0; // write any valud to clear interrupt flga
end


IRDA_RECEIVE_Terasic IRDA_RECEIVE_Terasic_inst(
					.iCLK(clk),         //clk   50MHz
					.iRST_n(reset_n),       //reset
					
					.iIRDA(ir),        //IRDA code input
					.iREAD(~s_cs_n & s_read),        //read command
					
					.oDATA_REAY(data_ready),	  //data ready
					.oDATA(s_readdata)         //decode data output
					);


endmodule
