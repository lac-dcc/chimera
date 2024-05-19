// This program was cloned from: https://github.com/Canaan-Creative/MM
// License: The Unlicense


`include "twi_define.v"
module twi_core (
input        clk    , 
input        rst    ,
input        wr     , //we
input  [7:0] data_in,//dat1
input  [7:0] wr_addr,//adr1 
output [7:0] i2cr   ,
output [7:0] i2rd   ,
output twi_scl_o    ,
input  twi_sda_i    ,
output twi_sda_oen
);

parameter TWI_F     = 3 ;

parameter START_SDA = 600/TWI_F+1 ;
parameter SDA_SET   = 700/TWI_F+1 ;
parameter SDA_WAIT  = 600/TWI_F+1 ;

parameter START_SCL = START_SDA+100/TWI_F+1 ;
parameter TWI_DONE  = START_SCL+1300/TWI_F+1 ;
parameter STOP_SCL  = 100/TWI_F+1 ;

reg [7:0] rd_buf ;
reg [11:0] cnt ;
reg done ;
reg [3:0] byte_cnt ;

reg [7:0] i2wd_r ;
reg [7:0] i2rd_r ;
assign i2wd = i2wd_r ;
assign i2rd = rd_buf ;

reg en_r , init_r ;
reg [2:0] cmd_r ;

wire cmd_start = cmd_r == 3'b000 && en_r ;
wire cmd_wr    = cmd_r == 3'b001 && en_r ;
wire cmd_rd    = cmd_r == 3'b010 && en_r ;
wire cmd_stop  = cmd_r == 3'b011 && en_r ;
wire cmd_rd_no = cmd_r == 3'b100 && en_r ;

assign i2cr = {1'b0,cmd_r,1'b0,done,init_r,en_r};
//register twir
always @ ( posedge clk ) begin
	if( rst ) begin
		en_r   <= 1'b0 ;
		init_r <= 1'b0 ;
		cmd_r  <= 3'b0 ;
	end
	else if( wr_addr == `I2CR && wr ) begin
		en_r   <= data_in[0] ;
		init_r <= data_in[1] ;
		cmd_r  <= data_in[6:4] ;
	end
	else begin
		init_r <= 1'b0 ;
	end
end


always @ ( posedge clk ) begin
	if( rst )
		i2wd_r <= 8'b0 ;
	else if( wr_addr == `I2WD && wr )
		i2wd_r <= data_in ;
	else if( cmd_wr && cnt == (SDA_SET*2+SDA_WAIT) )
		i2wd_r <= {i2wd_r[6:0],1'b1};
end


always @ ( posedge clk ) begin
	if( rst )
		done <= 1'b0 ;
	else if( wr_addr == `I2CR && wr )
		done <= data_in[2] ;
	else if( init_r )
		done <= 1'b0 ;
	else if( (cmd_start || cmd_stop ) && cnt == TWI_DONE )
		done <= 1'b1 ;
	else if( (cmd_wr || cmd_rd) && byte_cnt == 9 )
		done <= 1'b1 ;

end

always @ ( posedge clk ) begin
	if( rst )
		byte_cnt <= 4'b0 ;
	else if( init_r )
		byte_cnt <= 4'b0 ;
	else if( (cmd_wr || cmd_rd) && (cnt == (SDA_SET*2+SDA_WAIT)) )
		byte_cnt <= byte_cnt + 4'b1 ; 
end

always @ ( posedge clk ) begin
	if( rst || ~en_r )
		cnt <= 12'b0 ;
	else if( (cmd_start || cmd_stop ) && init_r )
		cnt <= 12'b1 ;
	else if( (cmd_start || cmd_stop ) && cnt != 0 )
		cnt <= cnt + 12'b1 ;
	else if( (cmd_wr || cmd_rd) && init_r )
		cnt <= 12'b0 ;
	else if( (cmd_wr || cmd_rd) && cnt < (SDA_SET*2+SDA_WAIT) && byte_cnt < 9 )
		cnt <= cnt + 12'b1 ;
	else if( (cmd_wr || cmd_rd) && cnt == (SDA_SET*2+SDA_WAIT) )
		cnt <= 12'b0 ;
end

reg scl_o ;
always @ ( posedge clk ) begin
	if( rst || ~en_r ) begin
		scl_o  <= 1'b1 ;
	end
	else if( cmd_start ) begin
		if( cnt == START_SCL )
			scl_o <= 1'b0 ; 
	end
	else if( cmd_wr || cmd_rd ) begin
		scl_o <= cnt == 12'b0   ? 1'b0 : 
			 cnt == SDA_SET ? 1'b1 : 
			 cnt == (SDA_SET+SDA_WAIT) ? 1'b0 : scl_o ;
	end
	else if( cmd_stop && cnt == SDA_SET ) begin
		scl_o <= 1'b1 ;
	end
end

reg sda_oen ;
always @ ( posedge clk ) begin
	if( rst || ~en_r ) begin
		sda_oen <= 1'b1 ;
	end
	else if( cmd_start ) begin
		if( cnt == START_SDA ) 
			sda_oen <= 1'b0 ;
	end
	else if( cmd_wr ) begin
		sda_oen <= i2wd_r[7] ;
	end
	else if( cmd_rd ) begin
		if( byte_cnt == 8 || byte_cnt == 9)
			sda_oen <= 1'b0 ;//master read ack
		else
			sda_oen <= 1'b1 ;
	end
	else if( cmd_stop ) begin
		if( init_r )
			sda_oen <= 1'b0 ;
		else if( cnt == STOP_SCL+SDA_SET )
			sda_oen <= 1'b1 ;
	end
	else if( cmd_rd_no ) begin
		sda_oen <= 1'b1 ;//master read no ack
	end

end

always @ ( posedge clk ) begin
	if( rst )
		rd_buf <= 8'b0 ;
	else if( cmd_rd && cnt == (SDA_SET+100) && byte_cnt <=7)
		rd_buf <= {rd_buf[6:0],twi_sda_i} ;
end

assign twi_scl_o    = scl_o ;
assign twi_sda_oen  = sda_oen ;

endmodule

