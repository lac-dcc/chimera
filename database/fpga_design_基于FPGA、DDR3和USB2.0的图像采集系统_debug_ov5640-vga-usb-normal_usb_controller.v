`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:40:21 05/31/2017 
// Design Name: 
// Module Name:    usb_controller 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
`define USB_command {USB_SLOE,USB_SLWR,USB_SLRD}
module usb_controller(
								usb_clk,
								flagA_EP6EF,flagB_EP6FF,flagC_EP8EF,flagD_EP8FF,
								USB_DATA,USB_FIFO_ADR,PKTEND,USB_SLWR,USB_SLRD,USB_SLOE,
								data_in,data_pulse,nframe,send_out
							);
			input  usb_clk ;
			input  flagA_EP6EF,flagB_EP6FF,flagC_EP8EF,flagD_EP8FF;
			output USB_DATA,USB_FIFO_ADR ;
			output PKTEND;
			output USB_SLWR,USB_SLRD,USB_SLOE;
			
			input  [15:0]data_in   ;
			output data_pulse      ;
			
			input  nframe    ;
			input send_out   ;
			
			reg [15:0]USB_DATA   ;
			reg [1:0]USB_FIFO_ADR;
			reg data_pulse       ;
			reg PKTEND  = 1      ;
			reg USB_SLWR,USB_SLRD,USB_SLOE;
			
			reg [15:0]data_in_buf;
			reg [9:0]counter     ;
			reg flag_counter     ;
			
			//reg [31:0]SC_Code = 32'H7CD215D8 ;
			
			reg [3:0]main_state = power_up  ;
			
			parameter 
				power_up = 4'b0000 ,
				usb_idle = 4'b0001 ,
				usb_sc   = 4'b0010 ,
				usb_head = 4'b0100 ,
				usb_EP6  = 4'b1000 ,
				usb_send = 4'b1001 ,
				usb_delay1= 4'b1010 ,
				usb_delay2= 4'b1011 ;
			parameter 
				usb_write = 3'b101 ,
				usb_read  = 3'b110 ,
				usb_nop   = 3'b111 ;
//////////////////////////////////////////////////
//			always @ ( posedge nframe or posedge usb_clk )
//				 begin
//					if ( nframe )
//						begin
//							data_in_buf <= 0 ;
//						end
//					else
//						begin
//							data_in_buf <= data_in ;
//						end
//				 end
			always @ ( posedge nframe or posedge usb_clk )
				begin
					if ( nframe == 1 )
						begin
							counter <= 0 ;
						end
					else
						if ( flag_counter )
							begin
								counter <= counter + 1 ;
							end
						else
							begin
								counter <= 0 ;
							end
				end
			
			always @ ( posedge nframe or posedge usb_clk )
				begin
					if ( nframe )
						begin
							main_state   <= usb_sc ;
							flag_counter <= 0      ;
							`USB_command <= usb_nop;
							USB_FIFO_ADR <= 2'b10  ;
							data_pulse   <= 0       ;	
						end
					else
						begin
							case ( main_state )
								power_up :
									begin
										main_state   <= power_up ;
										flag_counter <= 0        ;
										data_pulse   <= 0       ;	
										`USB_command <= usb_nop  ;
										USB_FIFO_ADR <= 2'b10    ;
									end
								usb_idle : 
									begin
										flag_counter <= 0       ;
										data_pulse   <= 0       ;	
										`USB_command <= usb_nop ;
//										if ( (~flagB_EP6FF) && flagC_EP8EF )
//											begin
//												main_state <= usb_EP6      ;
//												data_buf   <= data_buf + 1 ;
//												USB_FIFO_ADR <= 2'b10      ;
//												flag_counter <= 1          ;
//												data_pulse   <= 1          ;												
//											end
										 if ( send_out )
											main_state <= usb_send      ;
									end
								usb_send :
									begin
										if ( (~flagB_EP6FF) && flagC_EP8EF )
											begin
												main_state <= usb_delay1    ;
												USB_FIFO_ADR <= 2'b10      ;
												flag_counter <= 0          ;
												data_pulse   <= 1          ;												
											end
									end
								usb_delay1 :
									begin
										main_state <= usb_delay2      ;
										USB_FIFO_ADR <= 2'b10      ;
										flag_counter <= 0          ;
									end
								usb_delay2 :
									begin
										main_state <= usb_EP6      ;
										USB_FIFO_ADR <= 2'b10      ;
										flag_counter <= 1          ;
									end
								usb_sc   :
									begin
										if ( flagA_EP6EF == 1 )
											begin
												main_state   <= usb_sc ;
												//`USB_command <= usb_write ;
											end
										else
											if ( flagA_EP6EF == 0 )
												begin
													main_state   <= usb_head ;
													`USB_command <= usb_nop  ;
													flag_counter <= 1        ;
												end
									end
								usb_head :
									begin
										if ( counter== 256 )
											begin
												main_state   <= usb_idle ;
												`USB_command <= usb_nop  ;
											end
										else
											begin
												`USB_command <= usb_write  ;
											end
										case ( counter[0] )
											1'b0 :
												begin
													USB_DATA <= 16'h7CD2 ;
												end
											1'b1 :
												begin
													USB_DATA <= 16'h15D8 ;
												end
											default :
												begin
													USB_DATA <= 16'h0000 ;
												end
										endcase
									end
								usb_EP6  :
									begin
										USB_DATA     <= data_in  ;
										if ( counter == 256 )
											begin
												main_state   <= usb_idle ;
												`USB_command <= usb_nop  ;
											end
										else
											if ( counter == 253 )
												begin
													data_pulse   <= 0     ;
												end
											else
												begin
													`USB_command <= usb_write ;
												end
									end
								default  :
									begin
										flag_counter <= 0        ;
										`USB_command <= usb_nop  ;
										main_state   <= power_up ;
										USB_DATA     <= 0        ;
									end
							endcase
						end
				end

endmodule
