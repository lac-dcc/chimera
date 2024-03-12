module sdram_control (
							 input  wire       CLKIN,
							 input  wire       rst_n,
							 output reg      test_io,      
							 output wire     test_error_led,
							 output	wire [7:0] 	sm_seg,
							 output	wire [3:0] 	sm_bit
							 ) ;

reg [2:0] sd_state ;
reg [1:0] reset_step ;
reg [8:0] burst_cnt ;
reg [8:0] burst_cnt1 ;
reg [20:0] wr_addr ;
reg [20:0] rd_addr ;
reg [1:0] rd_state ;
reg [1:0] wr_state ;

reg[2:0]  sd_cmd;
wire      sd_cmd_ack;
reg[20:0] sd_addr;
reg[7:0]  fifo_q;
reg[7:0]  datacnt;
reg       test_error_tmp;
reg[15:0] error_cnt;
wire [31:0] sd_dataout;


wire      clk_200m;
wire      sd_clk_int;
reg[31:0] sd_dq_int;


wire[10:0] SD_SA;
wire[1:0]  SD_BA;
wire       SD_CS_N;
wire       SD_RAS_N;
wire       SD_CAS_N;
wire       SD_WE_N;
wire[31:0] SD_DQ;
wire       SD_CLK;
//page burst mode

reg test_error;

assign test_error_led = test_error;

wire [9:0]	bcdnum;
wire [3:0] 	sm_bit_reg;
wire [7:0]	sm_seg_reg;	

parameter mode_register = 11'b00000110111    ; 
parameter reg1_register = 13'b0000100101111  ;
parameter reg2_register = 12'b110000110101   ;

seg4 #(.CNT_TIME(12000_000)) ux_seg(  	
		.clk_24m		(CLKIN), 
		.rst_n			(rst_n),		
		.sm_bit_num		({22'd0,bcdnum[9:0]}),         
		.sm_seg			(sm_seg_reg),    
		.sm_bit			(sm_bit_reg) 
);


assign sm_seg = sm_seg_reg;	
assign sm_bit = sm_bit_reg;	

bin2bcd u2(
.b(sd_dataout[7:0]),
.p(bcdnum)
);


sdr_sdram  u_sdram(
			.CLK(clk_200m),
			.RESET_N(rst_n),
			.ADDR(sd_addr),
			.CMD (sd_cmd),
			.CMDACK(sd_cmd_ack),
			.DATAIN({fifo_q,fifo_q,fifo_q,fifo_q}),
			.DATAOUT(sd_dataout),
			
			.SA(SD_SA),
			.BA(SD_BA),
			.CS_N(SD_CS_N),
			.RAS_N(SD_RAS_N),
			.CAS_N(SD_CAS_N),
			.WE_N(SD_WE_N),
			.DQ(SD_DQ)
			);
								
pll1   u_sys_pll(
			.refclk(CLKIN),
			.clk0_out(clk_200m),
			.clk1_out(sd_clk_int)
			);
						 

EG_LOGIC_ODDR ODDR_0(.q(SD_CLK), .clk(sd_clk_int), .d0(1'b0), .d1(1'b1), .rst(1'b0));


SDRAM U_EG_SDRAM_2M_32(
    		.clk		(SD_CLK),
    		.ras_n		(SD_RAS_N),
   			.cas_n		(SD_CAS_N),
    		.we_n		(SD_WE_N),
    		.addr		(SD_SA),
    		.ba			(SD_BA),
    		.dq			(SD_DQ),
    		.cs_n		(SD_CS_N),
    		.cke		(1'b1),
    		.dm0		(1'b0),
    		.dm1		(1'b0),
    		.dm2		(1'b0),
    		.dm3		(1'b0)
			);
								

always@(posedge clk_200m or negedge rst_n)begin 
	if(!rst_n)begin 
		error_cnt <= 16'd0;
		test_error <= 1'b0;
	end 
	else begin 
		if(test_error_tmp)begin 
			error_cnt <= error_cnt + 1'b1;
		end 
		if(error_cnt == 16'hffff)begin 
			test_error <= 1'b1;
		end 
	end 
end 
	
always @(posedge clk_200m or negedge rst_n) begin
	if(!rst_n) begin
		reset_step 	 <= 2'd0 ;
		sd_cmd		 <= 3'b100;       //  
		burst_cnt 	 <= 9'd0 ;
		burst_cnt1   <= 9'd0 ;
		sd_state 	 <= 3'd0 ;
		wr_state     <= 2'd0 ;
		rd_state     <= 2'd0 ;
		sd_addr      <= 21'd0;
		wr_addr      <= 21'd0;
		rd_addr      <= 21'd0;
		fifo_q       <= 8'd0;
		datacnt      <= 8'd0;
		//test_error <= 1'b0;
	end
	else begin
		sd_dq_int  <= SD_DQ;
		test_io <= test_error_tmp;
		case (sd_state)
			3'd0 : begin
						case (reset_step)
							2'd0  : 	begin
											if(sd_cmd_ack) begin
												reset_step <= 2'd2 ;
												sd_cmd <= 3'b101 ;
												sd_addr <= {10'd0,mode_register};
											end
											else begin
												sd_cmd <= 3'b100 ;
											end
										end
							2'd1  :	begin                                   // may don't need to config reg2
											if(sd_cmd_ack) begin
												reset_step <= reset_step + 1'b1 ;
												sd_cmd <= 3'b111 ;
												sd_addr <= {9'd0,reg2_register};
											end
											else begin
												sd_cmd <= 3'b101 ;
											end
										end
							2'd2	:	begin
											if(sd_cmd_ack) begin
												reset_step <= reset_step + 1'b1 ;
												sd_cmd <= 3'b110 ;
												sd_addr <= {8'd0,reg1_register};
											end
											else begin
												sd_cmd <= 3'b101 ;
											end
										end
							2'd3	:	begin
											if(sd_cmd_ack) begin
												reset_step <= 2'd0 ;
												sd_cmd <= 3'b000 ;
												rd_addr <= 21'd0 ;
												wr_addr <= 21'd0;
												sd_state <= sd_state + 1'b1;
											end
											else begin
												sd_cmd <= 3'b110 ;
											end
										end
						endcase
					end
			3'd1	:	begin
						case(wr_state)
							2'd0 : begin
										sd_cmd  <= 3'b010;
										wr_state <= 2'd1;
										sd_addr <= wr_addr; 
							end 
							2'd1 : begin	
										if(sd_cmd_ack)begin
											wr_state <= wr_state + 1'b1;
											sd_cmd   <= 3'b000;
										end 
							end
							2'd2 : begin
										if(burst_cnt == 9'd255)begin 
											burst_cnt <= 8'd0;
											wr_state <= 2'd3;
										end
										else begin
											burst_cnt <= burst_cnt + 1'b1;
										end
										if(burst_cnt == 9'd253)begin
											sd_cmd <= 3'd4;
										end 
										fifo_q  <= fifo_q + 1'b1;	
							end 
							2'd3 : begin
									if(sd_cmd_ack) begin 
										if(wr_addr[20:8] == 13'h1fff)begin
											wr_addr <= 21'd0;
											sd_state <= sd_state + 1'b1;
										end 
										else begin 
											wr_addr[20:8] <= wr_addr[20:8] + 13'd1;
										end
										wr_state <= 2'd0;
									end 	
										fifo_q <= 8'd0;
							end 
						endcase 
											
			end
			3'd2	:	begin
					case(rd_state)
						2'd0 : begin
							sd_cmd  <= 3'b001;
							rd_state <= 2'd1;
							sd_addr <= rd_addr; 
						end 
						2'd1 : begin	
							if(sd_cmd_ack)begin
								rd_state <= rd_state + 1'b1;
								sd_cmd   <= 3'b000;
							end 
						end
						2'd2 : begin
							 if(burst_cnt1 < 9'd260)begin
								burst_cnt1 <= burst_cnt1 + 1'b1;
							 end
							 else begin
								burst_cnt1 <= 9'd0;
								rd_state <= 2'd3;
								if(rd_addr[20:8] == 13'h1fff)begin
									rd_addr <= 13'd0;
									sd_state <= 3'd1;
								end
								else begin	
									rd_addr[20:8] <= rd_addr[20:8] + 1'b1;
								end 
							 end
						    if(burst_cnt1 == 9'd255 )begin
								sd_cmd <= 3'd4;
						    end
						    else if(sd_cmd_ack)begin
								sd_cmd <= 3'd0;
						    end 
							 if(burst_cnt1 > 9'd6)begin
									datacnt <= datacnt + 1'b1;
							 end 
							 if(burst_cnt1 > 9'd6 && burst_cnt1 < 9'd250)begin
									if(sd_dq_int != {datacnt,datacnt,datacnt,datacnt}) begin 
										test_error_tmp <= 1'b1;
									end
									else begin 
										test_error_tmp <= 1'b0;
									end
							 end 
						end
						2'd3 : begin
								burst_cnt1 <= 8'd0;
								rd_state <= 2'd0;
								sd_cmd <= 3'd0;
								datacnt <= 8'd0;
						end 
						endcase 
			end
			3'd3	:	begin
			end
		endcase
	end
end

endmodule
						