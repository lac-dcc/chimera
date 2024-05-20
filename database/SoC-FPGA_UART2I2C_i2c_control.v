// This program was cloned from: https://github.com/abdelazeem201/SoC-FPGA
// License: MIT License

//*************************************************************************
//*   ASIC Fresh Board                                                   *
//*   UART2I2C                                                           *
//*  File : i2c_control.v                                                *  
//*  Author: Abdelazeem                                                  *     
//*  Revision 0.1                                                        * 
//*  Date     2024/01/26                                                 *
//*  Email : a.abdelazeem201@gmail.com                                   *       
//*************************************************************************
`timescale 1ns/1ns

module i2c_control(
	Clk,
	Rst_n,
	
	wrreg_req,
	rdreg_req,
	addr,
	addr_mode,
	wrdata,
	rddata,
	device_id,
	RW_Done,
	
	ack,
	
	dly_cnt_max,
	
	i2c_sclk,
	i2c_sdat
);

	input Clk;
	input Rst_n;
	
	input wrreg_req;
	input rdreg_req;
	input [15:0]addr;
	input addr_mode;
	input [7:0]wrdata;
	output reg[7:0]rddata;
	input [7:0]device_id;
	output reg RW_Done;
	
	output reg ack;

    input [31:0]dly_cnt_max;
    
	output i2c_sclk;
	inout i2c_sdat;
	
	reg [5:0]Cmd;
	reg [7:0]Tx_DATA;
	wire Trans_Done;
	wire ack_o;
	reg Go;
	wire [15:0] reg_addr;
	
	assign reg_addr = addr_mode?addr:{addr[7:0],addr[15:8]};
	
	wire [7:0]Rx_DATA;
	
	localparam 
		WR   = 6'b000001,   
		STA  = 6'b000010,   
		RD   = 6'b000100,   
		STO  = 6'b001000,   
		ACK  = 6'b010000,   
		NACK = 6'b100000;   
	
	i2c_bit_shift i2c_bit_shift(
		.Clk(Clk),
		.Rst_n(Rst_n),
		.Cmd(Cmd),
		.Go(Go),
		.Rx_DATA(Rx_DATA),
		.Tx_DATA(Tx_DATA),
		.Trans_Done(Trans_Done),
		.ack_o(ack_o),
		.i2c_sclk(i2c_sclk),
		.i2c_sdat(i2c_sdat)
	);
	
	reg [7:0]state;
	reg [7:0]cnt;
	reg [31:0]dly_cnt;
	
	localparam
		IDLE         = 8'b0000_0001,   
		WR_REG       = 8'b0000_0010,   
		WAIT_WR_DONE = 8'b0000_0100,   
		WR_REG_DONE  = 8'b0000_1000,   
		RD_REG       = 8'b0001_0000,   
		WAIT_RD_DONE = 8'b0010_0000,   
		RD_REG_DONE  = 8'b0100_0000,   
		WAIT_DLY     = 8'b1000_0000;   
	
	always@(posedge Clk or negedge Rst_n)
	if(!Rst_n)begin
		Cmd <= 6'd0;
		Tx_DATA <= 8'd0;
		Go <= 1'b0;
		rddata <= 0;
		state <= IDLE;
		ack <= 0;
		dly_cnt <= 0;
		cnt <= 0;
	end
	else begin
		case(state)
			IDLE:
				begin
					cnt <= 0;
					dly_cnt <= 0;
					ack <= 0;
					RW_Done <= 1'b0;					
					if(wrreg_req)
						state <= WR_REG;
					else if(rdreg_req)
						state <= RD_REG;
					else
						state <= IDLE;
				end
			
			WR_REG:
				begin
					state <= WAIT_WR_DONE;
					case(cnt)
						0:write_byte(WR | STA, device_id);
						1:write_byte(WR, reg_addr[15:8]);
						2:write_byte(WR, reg_addr[7:0]);
						3:write_byte(WR | STO, wrdata);
						default:;
					endcase
				end
			
			WAIT_WR_DONE:
				begin
					Go <= 1'b0; 
					if(Trans_Done)begin
						ack <= ack | ack_o;
						case(cnt)
							0: begin cnt <= 1; state <= WR_REG;end
							1: 
								begin 
									state <= WR_REG;
									if(addr_mode)
										cnt <= 2; 
									else
										cnt <= 3;
								end
									
							2: begin
									cnt <= 3;
									state <= WR_REG;
								end
							3:state <= WR_REG_DONE;
							default:state <= IDLE;
						endcase
					end
				end
			
			WR_REG_DONE:
				begin

					state <= WAIT_DLY;
				end
				
			RD_REG:
				begin
					state <= WAIT_RD_DONE;
					case(cnt)
						0:write_byte(WR | STA, device_id);
						1:write_byte(WR, reg_addr[15:8]);
						2:write_byte(WR, reg_addr[7:0]);
						3:write_byte(WR | STA, device_id | 8'd1);
						4:read_byte(RD | NACK | STO);
						default:;
					endcase
				end
				
			WAIT_RD_DONE:
				begin
					Go <= 1'b0; 
					if(Trans_Done)begin
						if(cnt <= 3)
							ack <= ack | ack_o;
						case(cnt)
							0: begin cnt <= 1; state <= RD_REG;end
							1: 
								begin 
									state <= RD_REG;
									if(addr_mode)
										cnt <= 2; 
									else
										cnt <= 3;
								end
									
							2: begin
									cnt <= 3;
									state <= RD_REG;
								end
							3:begin
									cnt <= 4;
									state <= RD_REG;
								end
							4:state <= RD_REG_DONE;
							default:state <= IDLE;
						endcase
					end
				end
				
			RD_REG_DONE:
				begin

					rddata <= Rx_DATA;
					state <= WAIT_DLY;				
				end
			default:state <= IDLE;
			
			WAIT_DLY:
			     begin
			         if(dly_cnt <= dly_cnt_max)begin
			             dly_cnt <= dly_cnt + 1'b1;
			             state <= WAIT_DLY;
			         end
			         else begin
			             dly_cnt <= 0;
			             RW_Done <= 1'b1;
			             state <= IDLE;
			         end
			     end
		endcase
	end
	
	task read_byte;
		input [5:0]Ctrl_Cmd;
		begin
			Cmd <= Ctrl_Cmd;
			Go <= 1'b1; 
		end
	endtask
	
	task write_byte;
		input [5:0]Ctrl_Cmd;
		input [7:0]Wr_Byte_Data;
		begin
			Cmd <= Ctrl_Cmd;
			Tx_DATA <= Wr_Byte_Data;
			Go <= 1'b1; 
		end
	endtask

endmodule
