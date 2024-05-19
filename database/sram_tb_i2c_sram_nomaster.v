// This program was cloned from: https://github.com/bangonkali/sram
// License: MIT License

`timescale 1ns/1ps
`define period 10

// iverilog -o tb_i2c_sram_nomaster.vvp tb_i2c_sram_nomaster.v i2c_sram_embedded.v sram.v && vvp tb_i2c_sram_nomaster.vvp && gtkwave.exe tb_i2c_sram_nomaster.v
// Test the i2c_sram_embedded without using the master. Master behaviour is plotted in tb.
module tb_i2c_sram_nomaster();
	// sram pins
	tri1 sda;
	reg scl;
	reg [6:0] my_addr;
	wire [7:0] curr_data;
	wire [6:0] rcvd_device_address;
	wire [32:0] state;
	wire rcvd_mode;

	// global pins
	reg [32:0] i;
	reg [32:0] b;
	// global sda control
	reg sda_to_sram;
	reg wren_sram;
	wire sda_in;

	assign sda_in = !wren_sram ? sda : 1'bZ;
	assign sda = wren_sram ? sda_to_sram : 1'bZ;

	reg[15:0] memory_data_in;


	// slave params to send
	reg[7:0] send_memory_address;
	reg[6:0] send_device_address;
	reg send_device_mode;
	reg[15:0] send_data;

	i2c_sram_embedded u_sram (
		.sda(sda),
		.scl(scl),
		.my_addr(my_addr),
		.curr_data(curr_data),
		.rcvd_device_address(rcvd_device_address),
		.state(state),
		.rcvd_mode(rcvd_mode)
	);

	initial begin
		$dumpfile("tb_i2c_sram_nomaster.vcd");
		$dumpvars;

		// set the device address for Device under Test.
		#`period u_sram.reset <= 0;
		#`period u_sram.reset <= 1;

		my_addr = 7'b0111100;

		//master_write_to_read(
			//7'b0111100,
			//8'd50,
			//16'd2203

		//);



		//master_read_from_slave(
		//	7'b0111100,
			//8'd102
		//);

		//master_read_from_slave(
			//7'b0111100,
			//8'd186
		//);

		//master_read_from_slave(
			//7'b0111100,
			//8'd233
		//);

		//master_write_to_slave(
			//7'b0111100,
			//8'd50,
			//16'd2203
		//);

		master_read_from_slave(
			7'b0111100,
			8'd50
		);



		//master_write_to_slave(
			//7'b0111100,
			//8'd102,
			//16'd5724
		//);

		//master_write_to_slave(
			//7'b0111100,
			//8'd186,
			//16'd1234
		//);

		//master_write_to_slave(
			//7'b0111100,
			//8'd233,
			//16'd1067
		//);

		//master_read_from_slave(
			//7'b0111100,
			//8'd50
		//);

		//master_read_from_slave(
			//7'b0111100,
			//8'd102
		//);

		///master_read_from_slave(
			//7'b0111100,
			//8'd186
		//);

		//master_read_from_slave(
			//7'b0111100,
			//8'd233
		//);

		$finish;
	end


	task master_write_to_slave;
		input reg[6:0] tinput_send_device_address;
		input reg[7:0] tinput_send_memory_address;
		input reg[15:0] tinput_send_data;

		begin
			send_device_address = tinput_send_device_address;
			send_memory_address = tinput_send_memory_address;
			send_data = tinput_send_data;
			send_device_mode = 0;

			#`period master_send_start();
			master_send_address_and_mode();
			master_send_memory_address();
			// $display("Begin receiving data.");
			master_send_data_part1();
			master_send_data_part2();
			master_send_stop();

			$display("W %d\t%d\t%d\t%d\t%d",$time, send_memory_address, tinput_send_data, u_sram.data_write, u_sram.U_SRAM.mem[send_memory_address]);
		end
	endtask

	task master_read_from_slave;
		input reg[6:0] tinput_send_device_address;
		input reg[7:0] tinput_send_memory_address;

		begin
			send_device_address = tinput_send_device_address;
			send_memory_address = tinput_send_memory_address;
			
			#`period master_send_start();

			send_device_mode = 0; // 1 read
			master_send_address_and_mode();

			master_send_memory_address();

		 	master_send_start();
			send_device_mode = 1; // 1 read
			master_send_address_and_mode();

			master_begin_receive_part1();
			master_begin_receive_part2();
			master_nack_slave();
			master_send_stop();

			$display("R %d\t%d\t%d\t%d\t%d",$time, send_memory_address, memory_data_in, u_sram.data_read, u_sram.U_SRAM.mem[send_memory_address]);
		end
	endtask

	task master_send_address_and_mode;
		begin
			// Send address
			for (i=7; i>0; i=i-1) begin
				#`period
				sda_to_sram =  send_device_address[i-1];
				#`period
				scl = 1;
				#`period
				scl = 0;
			end

			// Send mode 0 (write) and 1 (read)
			#`period
			sda_to_sram =  send_device_mode;
			#`period
			scl = 1;
			#`period
			scl = 0;
			wren_sram = 0;
			#`period
			sda_to_sram =  0; // regardless of previous mode.

			#`period
			scl = 1;
			wren_sram = 0;
			#`period
			scl = 0;

			// disable writing to sda
			wren_sram = 1;

		end
	endtask

	task master_send_memory_address;

		begin
			// enable writing to sda
			if(i==8)begin
			wren_sram = 1;// enable writing to sda
			end

			// Send address
			for (i=8; i>0; i=i-1) begin
				#`period
				sda_to_sram =  send_memory_address[i-1];
				#`period
				scl = 1;
				#`period
				scl = 0;
			end
			wren_sram = 0;

			#`period
			sda_to_sram =  0; // regardless of previous mode.

			#`period
			scl = 1;


			// moment where slave acknowledges

			#`period
			scl = 0;

			// disable writing to sda

		end
	endtask

	task master_begin_receive_part1;
		reg [4:0] g;
		reg is_ack;

		begin
			is_ack = 0;
			// $display("Within master_begin_receive_part1()");
			// enable writing to sda
			wren_sram = 0;
			// $display("wren disabled. Master lsitens to SDA.");

			g = 15;
			repeat (8) begin
				if (g == 8 && is_ack == 1) begin
					wren_sram = 0; // enable writing to sda
				end

				#`period

				#`period scl = 1;
				scl = 1;

				#`period

				memory_data_in[g] <= sda_in;
				// $display("%d mast_counter: %d sda_in:%b", $time, g, sda_in);
				scl = 0;

				g = g - 1;

				if (g==8 && is_ack == 0) begin
					// #`period
					 // enable writing to sda
					sda_to_sram =  0; // ack sda
					is_ack = 1;
				end

			end

			wren_sram = 1;
			sda_to_sram =  0; // ack sda
			#`period

			#`period
			scl = 1;

			#`period
			scl = 0;
			// disable writing to sda
			wren_sram = 0;
		end
	endtask

	task master_nack_slave;
		begin
				#`period
				wren_sram = 1; // enable writing to sda
				sda_to_sram =  1; // ack sda

				#`period
				scl = 1;

				// moment where slave acknowledges

				#`period
				scl = 0;

				// disable writing to sda
				wren_sram = 1;
		end
	endtask

	task master_ack_slave;
		begin
				wren_sram = 1; // enable writing to sda
				sda_to_sram =  0; // ack sda

				#`period
				scl = 1;

				// moment where slave acknowledges

				#`period
				scl = 0;

				// disable writing to sda
				wren_sram = 0;
		end
	endtask

	task master_begin_receive_part2;
		reg [3:0] g;

		begin
			wren_sram = 0;
			// $display("Within master_begin_receive_part1()");
			// enable writing to sda
			// $display("wren disabled. Master lsitens to SDA.");

			g = 7; // para dili mo tugdong ug negative one.
			repeat (8) begin
				#`period
				memory_data_in[g] = sda_in;

				#`period
				scl = 1;

				#`period
				scl = 0;

				g = g - 1;

				end
				if(g==0)begin
				wren_sram = 1;

			end

		end

	endtask

	task master_send_data_part1;
		begin
			// enable writing to sda
			wren_sram = 1;

			// Send address
			for (b=16; b>8; b=b-1) begin
				#`period
				sda_to_sram =  send_data[b-1];
				#`period
				scl = 1;
				#`period
				scl = 0;
			end

			wren_sram = 0;

			#`period
			sda_to_sram =  0; // regardless of previous mode.

			#`period
			scl = 1;

			// moment where slave acknowledges

			#`period
			scl = 0;

			// disable writing to sda

		end
	endtask

	task master_send_data_part2;
		begin
			// enable writing to sda
			wren_sram = 1;

			// Send address
			for (b=8; b>0; b=b-1) begin
				#`period
				sda_to_sram =  send_data[b-1];
				#`period
				scl = 1;
				#`period
				scl = 0;
			end
			wren_sram = 0;

			#`period
			sda_to_sram =  0; // regardless of previous mode.

			#`period
			scl = 1;


			// moment where slave acknowledges

			#`period
			scl = 0;

			// disable writing to sda

		end
	endtask

	task master_send_start;
		begin
			sda_to_sram = 1;
			wren_sram = 1;
			scl = 1;
			#`period
			sda_to_sram = 0;
			#`period
			scl = 0;
		end
	endtask

	task master_send_stop;
		begin
			sda_to_sram = 0;
			wren_sram = 1;
			scl = 0;
			#`period
			scl = 1;
			#`period
			sda_to_sram = 1;
		end
	endtask

endmodule
