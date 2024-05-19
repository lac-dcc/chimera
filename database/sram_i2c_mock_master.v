// This program was cloned from: https://github.com/bangonkali/sram
// License: MIT License

`timescale 1ns/1ps
module i2c_mock_master (clock,reset,address,write_data,start,write,read_data,ready,error,scl,sda);

input clock,reset,start,write;
inout sda;
output reg [7:0] read_data;
input [7:0] write_data;
output ready,error,scl;
input [6:0] address;

wire sda_in;
reg sda_dir;
reg sda_out;

reg [3:0] nstate,cstate;
//reg [6:0] address;
reg [7:0] to_out;
reg [3:0] count;
reg done_address,done_data,ready,error,scl;

//parameters
parameter idle = 4'd0;
parameter handshake0 = 4'd1;
parameter handshake1 = 4'd2;
parameter write0 = 4'd3;
parameter write1 = 4'd4;
parameter write2 = 4'd5;
parameter readack1 = 4'd6;
parameter readack2 = 4'd7;
parameter stop0 = 4'd8;
parameter stop1 = 4'd9;
parameter stop2 = 4'd10;

assign sda_in = sda;
assign sda = sda_dir ? sda_out: 1'bZ;

always @(posedge clock) begin
	if (reset)
		cstate <= idle;
	else
		cstate <= nstate;
end

always @(*) begin
	case (cstate)
		idle: begin
			if (start)
				nstate <= handshake0;
			else
				nstate <= idle;
		end

		handshake0:	nstate <= handshake1;

		handshake1:	nstate <= write0;

		write0: begin
			if (count > 0)
				nstate <= write1;
			else
				nstate <= readack1;
		end
		write1:		nstate <= write2;

		write2: 	nstate <= write0;

		readack1:	nstate <= readack2;

		readack2: begin
			if (done_data)
				nstate <= stop0;
			else
				nstate <= write0;
		end
		stop0:		nstate <= stop1;

		stop1:		nstate <= stop2;

		stop2:		nstate <= idle;
	endcase
end

always @(posedge clock) begin
	if (reset) begin
			ready <= 1'b1;
			error <= 0;
			done_address <= 0;
			done_data <= 0;
			scl <= 1'b1;
			sda_out <= 1'b1;
			sda_dir <= 1'b0;
	end else begin
	 
	case(cstate)

	idle: begin
			if (start) begin
				ready <= 0;
				error <= 0;
				done_address <= 0;
				done_data <= 0;
				sda_out <= 1'b1;
				sda_dir <= 1'b1;
			end else begin
				ready <= 1'b1;
				error <= 0;
				done_address <= 0;
				done_data <= 0;
				sda_out <= 1'b1;
				sda_dir <= 0;

			end
	end
	 
	handshake0: begin
			ready <= 0;
			sda_out <= 0;
			sda_dir <= 1'b1;
			to_out <= {address,~write};//set to_out to {adress,0}
			count <= 4'd8;
	end

	handshake1:	scl <= 1'b0;

	write0: begin
			if (count > 0) begin
				if (write||done_address==0)// papasok sa else kung write=0
				begin
					sda_dir <= 1'b1;
					sda_out <= to_out[count-1];
				end else
					sda_dir <= 0;
			end else begin
				scl <= 1'b0; //read acknowledge
				if(done_address)
					done_data <= 1'b1;
				else
					done_address <= 1'b1;

				if((!write) && done_data)//for read_data
				begin
					sda_out <= 1'b0;
					sda_dir <= 1'b1;
				end else
					sda_dir <= 1'b0;

			end
	end

	write1: begin
			scl <= 1'b1;
			if(!write && done_address)// for reading data
			begin
				sda_dir <= 1'b0;
				to_out[count-1] <= sda_in;
				count <= count - 4'd1;
			end else
			begin
				sda_dir <= 1'b1; // for writing data
				count <= count - 4'd1;
			end
	end

	write2:		scl <= 1'b0;

	readack1: begin
			scl <= 1'b1;
			if (write==0 && done_data) //read data
			begin
				sda_dir <= 1'b1;
				sda_out <= 1'b0;
				read_data <= to_out;
				error <= 0;
			end else

			if(sda_in==1'b0) //ACK received
			begin
				if(done_address && done_data==1'b0)
				begin
					if(write)
					begin
						count <= 4'd8;
						to_out <= write_data;
					end else
					begin
						count <= 4'd8;
						to_out <= 0;
					end
					done_data <= 0;
				end else
					error <= 0; //data written, next state is stop
			end else
				error <= 1'b1; //error detected
		end

	readack2:
			scl <= 1'b0;

	stop0:
		begin
			sda_out <= 1'b0;
			sda_dir <= 1'b1;
		end
	stop1:
			scl <= 1'b1;

	stop2:
		begin
			ready <= 1'b1;
			sda_out <= 1'b1;
			sda_dir <= 1'b0;
		end

	endcase
	end
end
endmodule
