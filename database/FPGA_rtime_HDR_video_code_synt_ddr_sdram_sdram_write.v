// This program was cloned from: https://github.com/sh-vlad/FPGA_rtime_HDR_video
// License: Apache License 2.0

//////////////////////////////////////////////////////
//Name File     : sdram_write                       //
//Author        : Andrey Papushin                   //
//Email         : andrey.papushin@gmail.com         //
//Standart      : IEEE 1800—2009(SystemVerilog-2009)//
//Start design  : 03.04.2018                        //
//Last revision : 30.04.2018                        //
//////////////////////////////////////////////////////
module sdram_write
(
	input  wire  						    clk_100         	 ,    
	input  wire 						    reset_n         	 ,
	input  wire                             start_frame          ,
	input  wire                             start_write_image2ddr,  
	
	input  wire [7:0]                       r_fb		         ,
	input  wire [7:0]                       g_fb		         ,
	input  wire [7:0]                       b_fb		         ,
	input  wire                             data_fb_valid        ,
	input  wire  [31:0]                     reg_addr_buf_1  	 ,  
	input  wire  [31:0]                     reg_addr_buf_2  	 ,  
	output wire                             end_frame            ,
	output wire                             _ready_read          ,
	sdram_ifc.sdram_write_master_port       f2h_sdram2             
);
reg [63:0]                       data_ddr             ;
reg [1:0]                        valid_data_ddr       ;
reg [1:0]                        running_write_ddr;
always_ff @(posedge clk_100  or negedge reset_n)
	if (~reset_n)
		valid_data_ddr <= 2'd0;
	else if(valid_data_ddr == 2'd2 & data_fb_valid )
		valid_data_ddr <= 2'd1;
	else if(valid_data_ddr == 2'd2 & !data_fb_valid )
		valid_data_ddr <= 2'd0;
	else if(data_fb_valid)
		valid_data_ddr <= valid_data_ddr + 2'd1;
	
always_ff @(posedge clk_100  or negedge reset_n)
	if (~reset_n)
		data_ddr <= 64'd0;
	else if(data_fb_valid)
		data_ddr <= {data_ddr[31:0],8'd0, b_fb[7:0], g_fb[7:0], r_fb[7:0]};


wire         [95:0]     data_fifo_frame  ;
wire ready_write_ddr  =   running_write_ddr[1];
wire last_burst;

assign _ready_read = running_write_ddr[1];
write_to_buf_frame write_to_buf_frame_inst
(
	.clk_100     		 (clk_100           ),
    .reset_n     		 (reset_n           ),
	.reg_addr_buf_1      (reg_addr_buf_1    ),
	.start_frame         (start_frame     ), 
	.valid_data_ddr      (valid_data_ddr & ready_write_ddr   ),
	.data_ddr            (data_ddr          ), 
	.end_frame           (end_frame          ), 
	.last_burst          (last_burst          ), 
    .data_fifo_frame     (data_fifo_frame   )  // ->
);

reg        run_read_fifo_64 ; // read one burst from fifo
reg        running_read     ; 
reg [28:0] data_address     ; 
reg [ 7:0] data_burstcount  ; 
reg [ 6:0] count_unit_burst ; 
reg        s                ; 
reg [95:0] reg_data_fifo_out; 
reg [ 7:0] max_units_in_fifo; 
reg [15:0] count_full       ; 
reg [7:0]  sh_reg_200MHz    ; 


wire [ 8:0] usedw              ; 
wire [95:0] data_fifo_out      ; 
wire        full               ; 
wire        empty              ; 
wire        sh_running_read    ; 
wire        sh_ready_read      ; 
wire        sh_rdrec           ; 
wire        sh3_end_read_fifo  ; 
wire        end_read_fifo_burst; 
wire        end_read_fifo      ; 
/* FiFo loaded 64 unit, can start read*/ 
wire ready_read            = (usedw >= 'd30) & !f2h_sdram2.waitrequest & !run_read_fifo_64;
wire p_ready_read          = ready_read & !sh_ready_read; 
wire start_read            = p_ready_read & !running_read; 
wire start_read_burst_fifo = p_ready_read & !run_read_fifo_64; 
reg ctrl_buff;
wire rdreq                 = run_read_fifo_64 & !f2h_sdram2.waitrequest & !empty;
wire p_rdreq = rdreq & !sh_rdrec & !sh_running_read;
wire [95:0] data_fifo_in  = data_fifo_frame;
wire        data_write     =  data_fifo_in[93] ;
reg [1:0]reg_end;
always_ff @(posedge clk_100  or negedge reset_n)
	if (~reset_n)
		reg_end <= 2'd0;
	else if(end_read_fifo & last_burst)
		reg_end <= 2'd1;
	else if(reg_end == 2'd1)
		reg_end <= 2'd3;
always_ff @(posedge clk_100  or negedge reset_n)
	if (~reset_n)
		running_read <= 1'd0;
	else if(end_read_fifo)
		running_read <= 1'd0;
	else if(start_read  )
		running_read <= 1'd1;
		
always_ff @(posedge clk_100  or negedge reset_n)
	if (~reset_n)
		ctrl_buff <= 1'd0;
	else if(start_frame & ready_write_ddr)
		ctrl_buff <= ~ctrl_buff;	
always_ff @(posedge clk_100  or negedge reset_n)
	if (~reset_n)
		run_read_fifo_64 <= 1'd0;
	else if(end_read_fifo_burst)
		run_read_fifo_64 <= 1'd0;
	else if(start_read_burst_fifo  )
		run_read_fifo_64 <= 1'd1;
always_ff @(posedge clk_100  or negedge reset_n)
	if (~reset_n)
		running_write_ddr <='0;
	else if(start_write_image2ddr)
		running_write_ddr <=2'b01;
	else if(running_write_ddr[0] & start_frame)
		running_write_ddr[1] <=1'b1;
always_ff @(posedge clk_100  or negedge reset_n)
	if (~reset_n)
		sh_reg_200MHz <= 8'd0;
	else         
		sh_reg_200MHz <= {f2h_sdram2.write, sh_reg_200MHz[5:3], end_read_fifo, rdreq, ready_read, running_read};	
always_ff @(posedge clk_100  or negedge reset_n)
	if (~reset_n)
		s <= 1'd0;
	else if(p_ready_read)
		s <= 1'd1;	
	else if( !(data_fifo_out[94] | data_fifo_out[95]))
		s <= 1'd0;	
always_ff @(posedge clk_100  or negedge reset_n)
	if (~reset_n)
		reg_data_fifo_out <= 96'd0;
	else if(!f2h_sdram2.waitrequest)
		reg_data_fifo_out <=  { (data_fifo_out[93] & run_read_fifo_64 & !p_rdreq) ,data_fifo_out[92:0]};
always_ff @(posedge clk_100  or negedge reset_n)
	if (~reset_n)
		data_burstcount <= 8'd0;
	else if(!f2h_sdram2.waitrequest)
		data_burstcount <= 8'd32;

// fifo
sdram_fifo sdram_fifo_inst 
(
	.wrclk   (clk_100        ),
	.rdclk   (clk_100        ),
	.data    (data_fifo_in   ),
	.rdreq   (rdreq          ),//
	.wrreq   (data_write     ),
	.rdempty (empty          ),
	.wrfull  (full           ),
	.q       (data_fifo_out  ),
	.rdusedw (usedw          )
);	
wire n_write_sdram = !f2h_sdram2.write &  sh_reg_200MHz[7];
/* delay signal */
assign sh_running_read            = sh_reg_200MHz[0];
assign sh_ready_read              = sh_reg_200MHz[1];
assign sh_rdrec                   = sh_reg_200MHz[2];
assign sh3_end_read_fifo          = sh_reg_200MHz[5];                           
assign end_read_fifo              = data_fifo_out[94] & running_read & !s;
assign end_read_fifo_burst        = data_fifo_out[95] & run_read_fifo_64 & !s;

/* interface  avl_sdram to  */
assign f2h_sdram2.write      = reg_data_fifo_out[93];// 
assign f2h_sdram2.writedata  = { reg_data_fifo_out[31:0], reg_data_fifo_out[63:32] };//reg_data_fifo_out[63:0];	
assign f2h_sdram2.address    = data_address; //
assign f2h_sdram2.byteenable = 8'HFF; 
assign f2h_sdram2.burstcount = data_burstcount;		


// addr_sdram_write
always_ff @(posedge clk_100  or negedge reset_n)
	if (~reset_n)
		data_address <= 29'd0;
	else if(start_frame & !ctrl_buff & !ready_write_ddr)
		data_address <= reg_addr_buf_1[28:0];
	else if(start_frame & !ctrl_buff & ready_write_ddr)
		data_address <= reg_addr_buf_2[28:0];
	else if(start_frame & ctrl_buff & ready_write_ddr)
		data_address <= reg_addr_buf_1[28:0];
	else if(n_write_sdram)
		data_address <= data_address + 29'd32;

endmodule