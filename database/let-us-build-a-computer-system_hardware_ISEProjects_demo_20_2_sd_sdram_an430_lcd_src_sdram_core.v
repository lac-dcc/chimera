// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

`timescale 1ns / 1ps
module sdram_core
#
(
	parameter T_RP                    =  4,
	parameter T_RC                    =  6,
	parameter T_MRD                   =  6,
	parameter T_RCD                   =  2,
	parameter T_WR                    =  3,
	parameter CASn                    =  3,
	parameter SDR_BA_WIDTH            =  2,
	parameter SDR_ROW_WIDTH           =  13,
	parameter SDR_COL_WIDTH           =  9,
	parameter SDR_DQ_WIDTH            =  16,
	parameter SDR_DQM_WIDTH           =  SDR_DQ_WIDTH/8,
	parameter APP_ADDR_WIDTH          =  SDR_BA_WIDTH + SDR_ROW_WIDTH + SDR_COL_WIDTH,
	parameter APP_BURST_WIDTH         =  10
)
(
	input                             clk,
	input                             rst,                 //reset signal,high for reset
	//write
	input                             wr_burst_req,        //  write request
	input[SDR_DQ_WIDTH-1:0]           wr_burst_data,       //  write data
	input[APP_BURST_WIDTH-1:0]        wr_burst_len,        //  write data length, ahead of wr_burst_req
	input[APP_ADDR_WIDTH-1:0]         wr_burst_addr,       //  write base address of sdram write buffer
	output                            wr_burst_data_req,   //  wrtie data request, 1 clock ahead
	output                            wr_burst_finish,     //  write data is end
	//read
	input                             rd_burst_req,        //  read request
	input[APP_BURST_WIDTH-1:0]        rd_burst_len,        //  read data length, ahead of rd_burst_req
	input[APP_ADDR_WIDTH-1:0]         rd_burst_addr,       //  read base address of sdram read buffer
	output[SDR_DQ_WIDTH-1:0]          rd_burst_data,       //  read data to internal
	output                            rd_burst_data_valid, //  read data enable (valid)
	output                            rd_burst_finish,     //  read data is end
	//sdram
	output                            sdram_cke,           //clock enable
	output                            sdram_cs_n,          //chip select
	output                            sdram_ras_n,         //row select
	output                            sdram_cas_n,         //colum select
	output                            sdram_we_n,          //write enable
	output[SDR_BA_WIDTH-1:0]          sdram_ba,            //bank address
	output[SDR_ROW_WIDTH-1:0]         sdram_addr,          //address
	output[SDR_DQM_WIDTH-1:0]         sdram_dqm,           //data mask
	inout[SDR_DQ_WIDTH-1: 0]          sdram_dq             //data
);

// State machine code
localparam     S_INIT_NOP  = 5'd0;       //Wait for the power on stable 200us end
localparam     S_INIT_PRE  = 5'd1;       //Precharge state
localparam     S_INIT_TRP  = 5'd2;       //Wait for precharge to complete
localparam     S_INIT_AR1  = 5'd3;       //First self refresh
localparam     S_INIT_TRF1 = 5'd4;       //Wait for the first time since end refresh
localparam     S_INIT_AR2  = 5'd5;       //Second self refresh
localparam     S_INIT_TRF2 = 5'd6;       //Wait for the second time since end refresh
localparam     S_INIT_MRS  = 5'd7;       //Mode register set
localparam     S_INIT_TMRD = 5'd8;       //Wait for the mode register set complete
localparam     S_INIT_DONE = 5'd9;       //The initialization is done
localparam     S_IDLE      = 5'd10;      //Idle state
localparam     S_ACTIVE    = 5'd11;      //Row activation, read and write
localparam     S_TRCD      = 5'd12;      //Row activation wait
localparam     S_READ      = 5'd13;      //Read data state
localparam     S_CL        = 5'd14;      //Wait for latency
localparam     S_RD        = 5'd15;      //Read data
localparam     S_WRITE     = 5'd16;      //Write data state
localparam     S_WD        = 5'd17;      //Write data
localparam     S_TWR       = 5'd18;      //Wait for the write data and the self refresh end
localparam     S_PRE       = 5'd19 ;     //Precharge
localparam     S_TRP       = 5'd20 ;     //Wait for precharge to complete
localparam     S_AR        = 5'd21;      //Self-Refresh
localparam     S_TRFC      = 5'd22;      //Wait for the self refresh

reg                         read_flag;
wire                        done_200us;        //After power on, the 200us input is stable at the end of the flag bit
reg                         sdram_ref_req;     // SDRAM self refresh request signal
wire                        sdram_ref_ack;     // SDRAM self refresh request response signal
reg[SDR_BA_WIDTH-1:0]       sdram_ba_r;
reg[SDR_ROW_WIDTH-1:0]      sdram_addr_r;
reg                         ras_n_r;
reg                         cas_n_r;
reg                         we_n_r;
wire[APP_ADDR_WIDTH-1:0]    sys_addr;
reg[14:0]                   cnt_200us;
reg[10:0]                   cnt_7p5us;
reg[SDR_DQ_WIDTH-1:0]       sdr_dq_out;
reg[SDR_DQ_WIDTH-1:0]       sdr_dq_in;
reg                         sdr_dq_oe;
reg[9:0]                    cnt_clk_r; //Clock count
reg                         cnt_rst_n; //Clock count reset signal
reg[4:0]                    state;
reg                         wr_burst_data_req_d0;
reg                         wr_burst_data_req_d1;
reg                         rd_burst_data_valid_d0;
reg                         rd_burst_data_valid_d1;

wire end_trp       =  (cnt_clk_r   == T_RP) ? 1'b1 : 1'b0;
wire end_trfc      =  (cnt_clk_r   == T_RC) ? 1'b1 : 1'b0;
wire end_tmrd      =  (cnt_clk_r   == T_MRD) ? 1'b1 : 1'b0;
wire end_trcd      =  (cnt_clk_r   == T_RCD-1) ? 1'b1 : 1'b0;
wire end_tcl       =  (cnt_clk_r   == CASn-1) ? 1'b1 : 1'b0;
wire end_rdburst   =  (cnt_clk_r   == rd_burst_len-4) ? 1'b1 : 1'b0;
wire end_tread     =  (cnt_clk_r   == rd_burst_len+2) ? 1'b1 : 1'b0;
wire end_wrburst   =  (cnt_clk_r   == wr_burst_len-1) ? 1'b1 : 1'b0;
wire end_twrite    =  (cnt_clk_r   == wr_burst_len-1) ? 1'b1 : 1'b0;
wire end_twr       =  (cnt_clk_r   == T_WR) ? 1'b1 : 1'b0;


always@(posedge clk or posedge rst)
begin
	if(rst == 1'b1)
	begin
		wr_burst_data_req_d0 <= 1'b0;
		wr_burst_data_req_d1 <= 1'b0;
		rd_burst_data_valid_d0 <= 1'b0;
		rd_burst_data_valid_d1 <= 1'b0;
	end
	else
	begin
		wr_burst_data_req_d0 <= wr_burst_data_req;
		wr_burst_data_req_d1 <= wr_burst_data_req_d0;
		rd_burst_data_valid_d0 <= rd_burst_data_valid;
		rd_burst_data_valid_d1 <= rd_burst_data_valid_d0;
	end
end

assign wr_burst_finish = ~wr_burst_data_req_d0 & wr_burst_data_req_d1;
assign rd_burst_finish = ~rd_burst_data_valid_d0 & rd_burst_data_valid_d1;
assign rd_burst_data = sdr_dq_in;

assign sdram_dqm = {SDR_DQM_WIDTH{1'b0}};
assign sdram_dq = sdr_dq_oe ? sdr_dq_out : {SDR_DQ_WIDTH{1'bz}};
assign sdram_cke = 1'b1;
assign sdram_cs_n = 1'b0;
assign sdram_ba = sdram_ba_r;
assign sdram_addr = sdram_addr_r;
assign {sdram_ras_n,sdram_cas_n,sdram_we_n} = {ras_n_r,cas_n_r,we_n_r};
assign sys_addr = read_flag ? rd_burst_addr:wr_burst_addr;        //Read / write address bus switching control
// power on 200us time, done_200us=1
always@(posedge clk or posedge rst)
begin
	if(rst == 1'b1)
		cnt_200us <= 15'd0;
	else if(cnt_200us < 15'd20_000)
		cnt_200us <= cnt_200us + 1'b1; 
end

assign done_200us = (cnt_200us == 15'd20_000);

//------------------------------------------------------------------------------
//7.5uS timer, every 8192 rows of 64ms storage for a Auto refresh
//------------------------------------------------------------------------------
always@(posedge clk or posedge rst)
begin
	if(rst == 1'b1)
		cnt_7p5us <= 11'd0;
	else if(cnt_7p5us < 11'd750)
		cnt_7p5us <= cnt_7p5us+1'b1;
	else
		cnt_7p5us <= 11'd0;
end

always@(posedge clk or posedge rst)
begin
	if(rst == 1'b1)
		sdram_ref_req <= 1'b0;
	else if(cnt_7p5us == 11'd749)
		sdram_ref_req <= 1'b1;   
	else if(sdram_ref_ack)
		sdram_ref_req <= 1'b0; 
end
//SDRAM state machine
always@(posedge clk or posedge rst)
begin
	if(rst == 1'b1)
		state <= S_INIT_NOP;
	else
		begin
			case (state)
				S_INIT_NOP:
					state <= done_200us ? S_INIT_PRE : S_INIT_NOP;     //After the end of the 200us / reset into the next state
				S_INIT_PRE:
					state <= S_INIT_TRP;     //Precharge state
				S_INIT_TRP:
					state <= (end_trp) ? S_INIT_AR1 : S_INIT_TRP;         //Precharge, waits for T_RP clock cycles
				S_INIT_AR1:
					state <= S_INIT_TRF1;    //First self refresh
				S_INIT_TRF1:
					state <= (end_trfc) ? S_INIT_AR2 : S_INIT_TRF1;           //Wait for first self refresh end, T_RC clock cycles
				S_INIT_AR2:
					state <= S_INIT_TRF2;    //Second self refresh
				S_INIT_TRF2:
					state <= (end_trfc) ?  S_INIT_MRS : S_INIT_TRF2;       //Wait for second self refresh end T_RC clock cycles
				S_INIT_MRS:
					state <= S_INIT_TMRD;//Mode register set£¨MRS£©
				S_INIT_TMRD:
					state <= (end_tmrd) ? S_INIT_DONE : S_INIT_TMRD;      //wait mode register setting is complete with T_MRD clock cycles
				S_INIT_DONE:
					state <= S_IDLE;        // SDRAM initialization setting complete flag
				S_IDLE:
					if(sdram_ref_req)
						begin
						state <= S_AR;      //The timing of self refresh request
						read_flag <= 1'b1;
						end
					else if(wr_burst_req)
						begin
						state <= S_ACTIVE;  //write SDRAM
						read_flag <= 1'b0;
						end
					else if(rd_burst_req)
						begin
						state <= S_ACTIVE;  //read SDRAM
						read_flag <= 1'b1;
						end
					else
						begin
						state <= S_IDLE;
						read_flag <= 1'b1;
						end
				//row active
				S_ACTIVE:
					if(T_RCD == 0)
						 if(read_flag) state <= S_READ;
						 else state <= S_WRITE;
					else state <= S_TRCD;
				//row active wait
				S_TRCD:
					if(end_trcd)
						 if(read_flag) state <= S_READ;
						 else state <= S_WRITE;
					else state <= S_TRCD;
				//read data 
				S_READ:
					state <= S_CL;
				//read data wait 
				S_CL:
					state <= (end_tcl) ? S_RD : S_CL;
				//read data
				S_RD:
					state <= (end_tread) ? S_PRE : S_RD;
				//Write data state
				S_WRITE:
					state <= S_WD;
				//write data
				S_WD:
					state <= (end_twrite) ? S_TWR : S_WD;
				//Wait for writing data and ending with self refresh
				S_TWR:
					state <= (end_twr) ? S_PRE : S_TWR;
				//Manual Precharge
				S_PRE:
				    state <= S_TRP ;
				//wait after precharge
				S_TRP:
				    state <= (end_trp) ? S_IDLE : S_TRP ;
				//Self-Refresh
				S_AR:
					state <= S_TRFC;
				//Self-Refresh wait
				S_TRFC:
					state <= (end_trfc) ? S_IDLE : S_TRFC;
				default:
					state <= S_INIT_NOP;
			endcase
		end
end

assign sdram_ref_ack = (state == S_AR);// SDRAM self refresh response signal

//1 clock to write ahead
assign wr_burst_data_req = ((state == S_TRCD) & ~read_flag) | (state == S_WRITE)|((state == S_WD) & (cnt_clk_r < wr_burst_len - 2'd2));
//Read the SDRAM response signal
assign rd_burst_data_valid = (state == S_RD) & (cnt_clk_r >= 10'd1) & (cnt_clk_r < rd_burst_len + 2'd1);

//Time delay for generating SDRAM sequential operation
always@(posedge clk or posedge rst)
begin
	if(rst == 1'b1)
		cnt_clk_r <= 10'd0;         
	else if(!cnt_rst_n)
		cnt_clk_r <= 10'd0;  
	else
		cnt_clk_r <= cnt_clk_r+1'b1;
end

//Counter control logic
always@(*) 
begin
	case (state)
		S_INIT_NOP: cnt_rst_n <= 1'b0;
		S_INIT_PRE: cnt_rst_n <= 1'b1;                   //Precharge delay count start
		S_INIT_TRP: cnt_rst_n <= (end_trp) ? 1'b0:1'b1;  //Wait until the precharge delay count is over and the counter is cleared
		S_INIT_AR1,S_INIT_AR2:cnt_rst_n <= 1'b1;          //Self refresh count start
		S_INIT_TRF1,S_INIT_TRF2:cnt_rst_n <= (end_trfc) ? 1'b0:1'b1;   //Wait until the refresh count is finished, and the counter is cleared
		S_INIT_MRS: cnt_rst_n <= 1'b1;          //Mode register setting, time counting start
		S_INIT_TMRD: cnt_rst_n <= (end_tmrd) ? 1'b0:1'b1;   //Wait until the refresh count is finished, and the counter is cleared
		S_IDLE:    cnt_rst_n <= 1'b0;
		S_ACTIVE:  cnt_rst_n <= 1'b1;
		S_TRCD:    cnt_rst_n <= (end_trcd) ? 1'b0:1'b1;
		S_CL:      cnt_rst_n <= (end_tcl) ? 1'b0:1'b1;
		S_RD:      cnt_rst_n <= (end_tread) ? 1'b0:1'b1;
		S_WD:      cnt_rst_n <= (end_twrite) ? 1'b0:1'b1;
		S_TWR:     cnt_rst_n <= (end_twr) ? 1'b0:1'b1;
		S_TRP:     cnt_rst_n <= (end_trp) ? 1'b0:1'b1;
		S_TRFC:    cnt_rst_n <= (end_trfc) ? 1'b0:1'b1;
		default:   cnt_rst_n <= 1'b0;
	endcase
end

always@(posedge clk or posedge rst)
begin
	if(rst == 1'b1)
		sdr_dq_out <= 16'd0; 
	else if((state == S_WRITE) | (state == S_WD))
		sdr_dq_out <= wr_burst_data; 
end
//Bidirectional data  directional control logic
always@(posedge clk or posedge rst)
begin
	if(rst == 1'b1)
		sdr_dq_oe <= 1'b0;
	else if((state == S_WRITE) | (state == S_WD))
		sdr_dq_oe <= 1'b1;
	else
		sdr_dq_oe <= 1'b0;
end

//Reads data from the SDRAM
always@(posedge clk or posedge rst)
begin
	if(rst == 1'b1)
		sdr_dq_in <= 16'd0;
	else if(state == S_RD)
		sdr_dq_in <= sdram_dq;
end

always@(posedge clk or posedge rst)
begin
	if(rst == 1'b1) 
	begin
		{ras_n_r,cas_n_r,we_n_r} <= 3'b111;
		sdram_ba_r <= {SDR_BA_WIDTH{1'b1}};
		sdram_addr_r <= {SDR_ROW_WIDTH{1'b1}};
	end
	else
		case(state)
			S_INIT_NOP,S_INIT_TRP,S_INIT_TRF1,S_INIT_TRF2,S_INIT_TMRD: 
			begin
				{ras_n_r,cas_n_r,we_n_r} <= 3'b111;
				sdram_ba_r <= {SDR_BA_WIDTH{1'b1}};
				sdram_addr_r <= {SDR_ROW_WIDTH{1'b1}};
			end
			S_INIT_PRE: 
			begin
				{ras_n_r,cas_n_r,we_n_r} <= 3'b010;
				sdram_ba_r <= {SDR_BA_WIDTH{1'b1}};
				sdram_addr_r <= {SDR_ROW_WIDTH{1'b1}};
			end
			S_INIT_AR1,S_INIT_AR2: 
			begin
				{ras_n_r,cas_n_r,we_n_r} <= 3'b001;
				sdram_ba_r <= {SDR_BA_WIDTH{1'b1}};
				sdram_addr_r <= {SDR_ROW_WIDTH{1'b1}};
			end
			S_INIT_MRS:
			begin   //Mode register setting, which can be set according to actual needs
				{ras_n_r,cas_n_r,we_n_r} <= 3'b000;
				sdram_ba_r <= {SDR_BA_WIDTH{1'b0}};  
				sdram_addr_r <= {
					3'b000,
					1'b0,           //Operation mode setting (set here to A9=0, ie burst read / burst write)
					2'b00,          //Operation mode setting ({A8, A7}=00), the current operation is set for mode register
					3'b011,         //CAS latency setting
					1'b0,           //Burst mode
					3'b111          //Burst length ,full page
					};
			end
			S_IDLE,S_TRCD,S_CL,S_TRFC,S_TWR,S_TRP: 
			begin
				{ras_n_r,cas_n_r,we_n_r} <= 3'b111;
				sdram_ba_r <= {SDR_BA_WIDTH{1'b1}};
				sdram_addr_r <= {SDR_ROW_WIDTH{1'b1}};
			end
			S_ACTIVE: 
			begin
				{ras_n_r,cas_n_r,we_n_r} <= 3'b011;
				sdram_ba_r <= sys_addr[APP_ADDR_WIDTH - 1:APP_ADDR_WIDTH - SDR_BA_WIDTH];  
				sdram_addr_r <= sys_addr[SDR_COL_WIDTH + SDR_ROW_WIDTH - 1:SDR_COL_WIDTH]; 
			end
			S_READ: 
			begin
				{ras_n_r,cas_n_r,we_n_r} <= 3'b101;
				sdram_ba_r <= sys_addr[APP_ADDR_WIDTH - 1:APP_ADDR_WIDTH - SDR_BA_WIDTH];  
				sdram_addr_r <= {4'b0000,sys_addr[8:0]};//Column address A10=0, set read enable, without auto precharge
			end
			S_RD: 
			begin
				if(end_rdburst)
					{ras_n_r,cas_n_r,we_n_r} <= 3'b110;
				else begin
					{ras_n_r,cas_n_r,we_n_r} <= 3'b111;
					sdram_ba_r <= {SDR_BA_WIDTH{1'b1}};
					sdram_addr_r <= {SDR_ROW_WIDTH{1'b1}};
				end
			end
			S_WRITE: 
			begin
				{ras_n_r,cas_n_r,we_n_r} <= 3'b100;
				sdram_ba_r <= sys_addr[APP_ADDR_WIDTH - 1:APP_ADDR_WIDTH - SDR_BA_WIDTH];  
				sdram_addr_r <= {4'b0000,sys_addr[8:0]};//Column address A10=0, set write enable, without auto precharge
			end
			S_WD: 
			begin
				if(end_wrburst) {ras_n_r,cas_n_r,we_n_r} <= 3'b110;
				else begin
					{ras_n_r,cas_n_r,we_n_r} <= 3'b111;
					sdram_ba_r <= {SDR_BA_WIDTH{1'b1}};
					sdram_addr_r <= {SDR_ROW_WIDTH{1'b1}};
				end
			end
			S_PRE: 
			begin
				{ras_n_r,cas_n_r,we_n_r} <= 3'b010;
				sdram_ba_r <= {SDR_BA_WIDTH{1'b1}};
				sdram_addr_r <= {SDR_ROW_WIDTH{1'b1}};
			end
			S_AR: 
			begin
				{ras_n_r,cas_n_r,we_n_r} <= 3'b001;
				sdram_ba_r <= {SDR_BA_WIDTH{1'b1}};
				sdram_addr_r <= {SDR_ROW_WIDTH{1'b1}};
			end
			default: 
			begin
				{ras_n_r,cas_n_r,we_n_r} <= 3'b111;
				sdram_ba_r <= {SDR_BA_WIDTH{1'b1}};
				sdram_addr_r <= {SDR_ROW_WIDTH{1'b1}};
			end
		endcase
end

endmodule

