// This program was cloned from: https://github.com/abdelazeem201/SoC-FPGA
// License: MIT License

module uart_2_i2c(
    clk50M,
    rst_i,
    i2c_sclk,
    i2c_sdat,
    uart_rx,
    uart_tx
);
    input clk50M;
    input rst_i;
    inout i2c_sdat;
    output i2c_sclk;
    input uart_rx;
    output uart_tx;

	wire [15:0] addr;
    wire ack;
    wire RW_Done;
      
    wire eeprom_rd_done; 
	wire eeprom_wr_done; 
    
    wire [127:0]eeprom_rddata;
    wire wrreg_req;
    wire rdreg_req;
    wire [7:0]wrdata;
    wire [7:0]rddata;
    
    wire [15:0]address;
    wire [127:0]cmd_data;
    wire [7:0]num_cmd;
    wire cmdvalid,clk50M_g,rst_n;
//for ISE     
BUFG clock_g (
              .I   (clk50M),
              .O   (clk50M_g)
              );
//for modelsim 
//assign clk50M_g = clk50M
assign rst_n = !rst_i;
	 convert convert(
		  .clk50M(clk50M_g),
		  .rst_n(rst_n),
		  .rddata(rddata),
		  .RW_Done(RW_Done),
		  .ack(ack),
		  .address(address),
		  .cmd_data(cmd_data),
		  .num_cmd(num_cmd),
		  .cmdvalid(cmdvalid),
		  .eeprom_rddata(eeprom_rddata),	
		  .wrdata(wrdata),
		  .wrreg_req(wrreg_req),
		  .rdreg_req(rdreg_req),
		  .addr(addr),
		  .eeprom_rd_done(eeprom_rd_done),
		  .eeprom_wr_done(eeprom_wr_done)
	 );

    
    i2c_control i2c_control(
        .Clk(clk50M_g), 
        .Rst_n(rst_n), 
        
        .wrreg_req(wrreg_req),
        .rdreg_req(rdreg_req),
        .addr(addr),
        .addr_mode(1'b1),
        .wrdata(wrdata),
        .rddata(rddata),
        .device_id(8'b1010_0000),
        .RW_Done(RW_Done),
        .ack(ack),
    `ifdef DO_SIM
        .dly_cnt_max(250-1),
    `else
        .dly_cnt_max(250000-1),
    `endif
        .i2c_sclk(i2c_sclk),
        .i2c_sdat(i2c_sdat)
    );
    
    wire rx_done;
    wire [7:0]rx_data;
    uart_byte_rx uart_byte_rx( 
        .Clk(clk50M_g),
        .Reset_n(rst_n),
        .Baud_Set(3'd4),
        .uart_rx(uart_rx),
        .Data(rx_data),
        .Rx_Done(rx_done) 
    );

    uart_cmd uart_cmd(
        .Clk(clk50M_g),
        .Reset_n(rst_n),
        .rx_data(rx_data),
        .rx_done(rx_done),
        .address(address),
        .data(cmd_data),
        .num_cmd(num_cmd),
        .cmdvalid(cmdvalid)
    );
    
    uart_data_tx
    #(
        .DATA_WIDTH(128),
        .MSB_FIRST(1)
    )
    uart_data_tx(
        .Clk(clk50M_g),
        .Rst_n(rst_n),
        .data(eeprom_rddata),
        .send_en(eeprom_rd_done),   
        .Baud_Set(3'd4),  
        .uart_tx(uart_tx),  
        .Tx_Done(),   
        .uart_state()
    );

endmodule
