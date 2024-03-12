`timescale 1ns / 1ps
//filename:crc7.v
//Author:lichenlin
//Creat:2011-09-17 6pm
//comit:????crc7????

module crc7(
	sys_clk,
	indata,
	indata_req,
	
	table_read_rden,
	table_read_address,
	table_read_data,
	
	outdata,
	outdata_en
	);
	
input sys_clk;
input[39:0] indata;//????????
input indata_req;//????

output	table_read_rden;//??????
output[7:0]	table_read_address;
input[7:0]	table_read_data;

output[6:0] outdata;//???????
output outdata_en;//???????????

parameter	crc_idle=2'd0;
parameter	crc_convert=2'd1;
parameter	crc_outdata=2'd2;
reg[1:0]	crc_state;
reg[39:0]	indata_temp;

reg	table_read_rden;//??????
reg[7:0]	table_read_address;

reg	outdata_en;
reg[5:0]	byte_counter;
reg[6:0]	outdata;
reg[6:0]	crc_temp;
reg[39:0]	tempdata;

initial
	begin
		crc_state<=crc_idle;
		indata_temp<=0;
		
		table_read_rden=0;
		table_read_address=0;
		
		outdata_en<=0;
		byte_counter<=0;
		outdata<=0;	
		crc_temp<=0;	
	end

always @(posedge sys_clk)
begin
	case(crc_state)
		crc_idle:
			begin
				if(indata_req)
					begin
						crc_state<=crc_convert;
						indata_temp<=indata[39:0];
						outdata_en<=1'b0;
					end
			end
		crc_convert:
			begin
				case(byte_counter)
					0:
						begin
							table_read_rden<=1'b1;
							table_read_address<=indata_temp[39:32];//????????
							byte_counter<=1;
						end
					3:
						begin
							table_read_rden<=1'b1;
							table_read_address<={table_read_data[6:0],1'b0}^indata_temp[31:24];//?????
							byte_counter<=4;
						end
					6:
						begin
							table_read_rden<=1'b1;
							table_read_address<={table_read_data[6:0],1'b0}^{indata_temp[23:16]};//?????
							byte_counter<=7;
						end
					9:
						begin
							table_read_rden<=1'b1;
							table_read_address<={table_read_data[6:0],1'b0}^{indata_temp[15:8]};//?????
							byte_counter<=10;
						end
					12:
						begin
							indata_temp<=0;
							table_read_rden<=1'b1;
							table_read_address<={table_read_data[6:0],1'b0}^{indata_temp[7:0]};//?????
							byte_counter<=13;
						end
					15:
						begin
							table_read_rden<=1'b0;
							crc_temp<=table_read_data[6:0];
							byte_counter<=0;
							crc_state<=crc_outdata;
						end
					default:
						begin
							byte_counter<=byte_counter+1'd1;
						end
				endcase
			end
		crc_outdata:
			begin
				outdata<=crc_temp;
				outdata_en<=1'b1;
				crc_state<=crc_idle;
			end
	endcase			
end

endmodule


	
	
