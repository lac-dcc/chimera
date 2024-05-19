// This program was cloned from: https://github.com/lmxyy/Computer-Architecture-Task-2
// License: MIT License

`ifdef uart_com.v
`else
 `define uart_com.v
// ----------------------------------------------------------------------------------------------------
 `include "buf_que.v"
 `include "defines.v"

module uart_com
  #(
    parameter BAUDRATE = 9600,
    parameter CLOCKRATE = 100000000
    )
   (
    input 	clk,
    input 	rst,
   
    input 	send_flag,
    input [7:0] send_data,
    input 	recv_flag, 
    input [7:0] recv_data,

    output 	sendable,
    output 	receivable,

    input 	Rx,
    output reg 	Tx
    );

   localparam SAMPLE_INTERVAL = CLOCKRATE / BAUDRATE;
   
   localparam STATUS_IDLE = 0;
   localparam STATUS_BEGIN = 1;
   localparam STATUS_DATA = 2;
   localparam STATUS_VALID = 4;
   localparam STATUS_END = 8;
   
   // --------------------------------------------------Receive--------------------------------------------------
   // Computer to FPGA
   reg 		recv_write_flag;
   reg [7:0] 	recv_write_data;
   wire 	recv_empty,recv_full;

   buf_que recv_buffer
     (
      .clk(clk),
      .rst(rst),
      
      .read_flag(recv_flag),
      .read_data(recv_data),
      
      .write_flag(recv_write_flag),
      .write_data(recv_write_data),
      
      .empty(recv_empty),
      .full(recv_full)
      );
   
   assign receivable = !recv_empty;

   reg [3:0] 	recv_status;
   reg [2:0] 	recv_bit;
   reg 		recv_parity;
   
   integer 	recv_counter;
   reg 		recv_clock;

   wire 	recv_sample = (recv_counter == SAMPLE_INTERVAL/2); // 输送1bit需要的时钟周期数目

   always @ (posedge clk)
     begin
	if (rst == `RstEnable)
	  begin
	     recv_write_flag <= 0;
	     recv_write_data <= 0;
	     recv_status <= STATUS_IDLE;
	     recv_bit <= 0;
	     recv_parity <= 0;
	     recv_counter <= 0;
	     recv_clock <= 0;
	  end
	else
	  begin
	     recv_write_flag <= 0;
	     
	     if (recv_clock)	// 一个传输周期开始
	       begin
		  if (recv_counter == SAMPLE_INTERVAL-1) 
		    recv_counter <= 0;
		  else recv_counter <= recv_counter+1;
	       end
	     
	     if (recv_status == STATUS_IDLE)
	       begin
		  if (!Rx)
		    begin
		       recv_status <= STATUS_BEGIN; // 进入起始位
		       recv_counter <= 0;
		       recv_clock <= 1;
		    end
	       end
	     else if (recv_sample)
	       begin
		  case (recv_status)
		    
		    STATUS_BEGIN:
		      begin
			 if(!Rx) 
			   begin
			      recv_status <= STATUS_DATA;
			      recv_bit <= 0;
			      recv_parity <= 0;
			   end 
			 else 
			   begin
			      recv_status <= STATUS_IDLE;
			      recv_clock <= 0;
			   end
		      end // case: STATUS_BEGIN
		    
		    STATUS_DATA:
		      begin
			 recv_parity <= recv_parity^Rx;
			 recv_write_data[recv_bit] <= Rx;
			 recv_bit <= recv_bit+1;
			 if (recv_bit == 7)
			   recv_status <= STATUS_VALID;
		      end // case: STATUS_DATA

		    STATUS_VALID:
		      begin
			 if (recv_parity == Rx&&!recv_full)
			   recv_write_flag <= 1;
			 recv_status <= STATUS_END;
		      end // case: STATUS_VALID

		    STATUS_END:
		      begin
			 recv_status <= STATUS_IDLE;
			 recv_clock <= 0;
		      end

		  endcase // case (recv_status)
	       end
	  end
     end // always @ (posedge clk)
   
   // --------------------------------------------------Send--------------------------------------------------
   // FPGA to Computer
   
   reg 		   send_read_flag;
   wire [7:0] 	   send_read_data;
   reg [7:0] 	   send_read_data_buf;
   wire 	   send_empty, send_full;

   buf_que send_buffer
     (
      .clk(clk),
      .rst(rst),
      
      .read_flag(send_read_flag),
      .read_data(send_read_data),
      
      .write_flag(send_flag),
      .write_data(send_data),
      
      .empty(send_empty),
      .full(send_full)
      );

   assign sendable = !send_full;

   reg [3:0] 	   send_status;
   reg [2:0] 	   send_bit;
   reg 		   send_parity;

   integer 	   send_counter;

   always @ (posedge clk)
     begin
	if (rst == `RstEnable) send_counter <= 0;
	else
	  begin
	     send_counter <= send_counter+1;
	     if (send_counter == SAMPLE_INTERVAL-1) send_counter <= 0;
	  end
     end
   
   always @ (posedge clk)
     begin
	if (rst == `RstEnable)
	  begin
	     send_read_flag <= 0;
	     send_read_data_buf <= 0;
	     send_status <= STATUS_IDLE;
	     send_bit <= 0;
	     send_parity <= 0;
	     Tx <= 1;
	  end
	else
	  begin
	     send_read_flag <= 0;
	     if (send_counter == 0)
	       begin
		  case (send_status)

		    STATUS_IDLE:
		      begin
			 send_read_data_buf <= send_read_data;
			 send_read_flag <= 1;
			 Tx <= 0;
			 send_status <= STATUS_DATA;
			 send_bit <= 0;
			 send_parity <= 0;
		      end

		    STATUS_DATA:
		      begin
			 Tx <= send_read_data_buf[send_bit];
			 send_parity <= send_parity^send_read_data_buf[send_bit];
			 send_bit <= send_bit+1;
			 if (send_bit == 7)
			   send_status <= STATUS_VALID;
		      end
		    
		    STATUS_VALID:
		      begin
			 Tx <= send_parity;
			 send_status <= STATUS_END;
		      end

		    STATUS_END:
		      begin
			 Tx <= 1;
			 send_status <= STATUS_IDLE;
		      end

		  endcase
	       end
	  end
     end // always @ (posedge clk)   
   
endmodule // uart_com

// ----------------------------------------------------------------------------------------------------
`endif
