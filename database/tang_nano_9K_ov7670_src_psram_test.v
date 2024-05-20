// This program was cloned from: https://github.com/phoenix367/tang_nano_9K_ov7670
// License: MIT License

module psram_test (
                  clk,
                  rst_n,
                  init_done,
                  addr,
                  cmd,
                  cmd_en,
                  wr_data,
                  rd_data,
                  rd_data_valid,
                  data_mask,
                  error
                  );

input                           clk;
input                           rst_n;
input                           init_done;
output                          cmd;
output                          error;
output                          cmd_en;
input [31:0]                    rd_data;
input                           rd_data_valid;



output[31:0]          wr_data;
output[20:0]          addr;
output[3:0] data_mask;


reg   [3:0] data_mask;
reg   [20:0]          addr;
reg   [20:0]          addr_add_w;
reg   [20:0]          addr_add_r;
reg                             cmd;
reg                             cmd_en;
reg   [19:0]                    wr_data;
reg   [19:0]                    wr_data_add;
reg   [19:0]                    check_data;
reg   [5:0]                     next_state;
reg   [5:0]                     curr_state;
reg   [7:0]                     start_cnt;
reg   [5:0]                     WR_CNT;
reg   [5:0]                     RD_CNT;
reg   [16:0]                    WR_CYC_CNT;
reg   [16:0]                    RD_CYC_CNT;
reg   [5:0]                     WAITE_CNT;
reg                             WR_DONE;
reg                             RD_DONE;
reg                             DATA_W_END;
reg                             DATA_R_END;
reg                             error_d;
//=====test state machine=====

localparam  IDLE                = 6'b000001;
localparam  START_WAITE         = 6'b000010;
localparam  WRITE_ALL_ADDR      = 6'b000100;
localparam  WRITE_WAITE         = 6'b001000;
localparam  READ_ALL_ADDR       = 6'b010000;
localparam  CYC_DONE_WAITE      = 6'b100000;
localparam  ADDR_RANGE          = 10'h1FF;//15'h7FFF;

parameter   TCMD128             = 6'd19;// burst 128 = 6'd43;
                                        // burst 64  = 6'd27;
                                        // burst 32  = 6'd19;
                                        // burst 16  = 6'd15;


parameter   NUM128              = 6'd8;// burst 128 = 6'd32;
                                       // burst 64  = 6'd16;
                                       // burst 32  = 6'd8;
                                       // burst 16  = 6'd4;
   

always@(posedge clk or negedge rst_n)
    if(!rst_n)
        curr_state <= IDLE;
    else 
        curr_state <= next_state;

always@(*)begin
    next_state = curr_state;
    case(curr_state)
        IDLE: 
            next_state = START_WAITE;
        
        START_WAITE: 
            if(start_cnt  == 'd152)
                next_state = WRITE_ALL_ADDR;
        
        WRITE_ALL_ADDR:
            if(WR_DONE && DATA_W_END) 
            next_state = WRITE_WAITE;
        
        WRITE_WAITE: 
            if(WAITE_CNT == 'd63)
                next_state = READ_ALL_ADDR;
        
        READ_ALL_ADDR:
            if(RD_DONE && DATA_R_END)
            next_state = CYC_DONE_WAITE;
            
        CYC_DONE_WAITE:  
            next_state = IDLE;  
      
        default: next_state = IDLE;
       endcase
      end

//===== ST_MC_CTRL=====

always@(posedge clk or negedge rst_n)
    if(!rst_n)
     start_cnt <= 'b0;
    else if(curr_state == CYC_DONE_WAITE)
     start_cnt <= 'b0;
    else if(start_cnt  == 'd152)
     start_cnt <= start_cnt;
    else if((curr_state ==  START_WAITE) && init_done)
     start_cnt <= start_cnt + 1'b1;

always@(posedge clk or negedge rst_n)
    if(!rst_n)
     WAITE_CNT <= 'b0;
    else if(curr_state == CYC_DONE_WAITE)
     WAITE_CNT <= 'b0;
    else if(WAITE_CNT == 'd63)
     WAITE_CNT <= WAITE_CNT;
    else if(curr_state == WRITE_WAITE) 
     WAITE_CNT <= WAITE_CNT + 1'b1;


//=====BURST WRITE =====

always@(posedge clk or negedge rst_n)
    if(!rst_n)
     WR_CNT <= 'd0;
    else if(WR_CNT == (TCMD128 - 1'b1))
     WR_CNT <= 'd0;
    else if(curr_state == WRITE_ALL_ADDR)
     WR_CNT <= WR_CNT + 1'b1;

always@(posedge clk or negedge rst_n)
    if(!rst_n)
     WR_CYC_CNT <= 'd0;
    else if(curr_state == CYC_DONE_WAITE)
     WR_CYC_CNT <= 'd0;
    else if((cmd == 1'b1) && (cmd_en == 1'b1))
     WR_CYC_CNT <= WR_CYC_CNT + 1'b1;

always@(posedge clk or negedge rst_n)
    if(!rst_n)
     WR_DONE <= 'd0;
    else if(curr_state == CYC_DONE_WAITE)
     WR_DONE <= 'd0;
    else if(WR_CYC_CNT == ADDR_RANGE)
     WR_DONE <= 1'b1;

always@(posedge clk or negedge rst_n)
    if(!rst_n)
     DATA_W_END <= 'd0;
    else if(curr_state == CYC_DONE_WAITE)
     DATA_W_END <= 'd0;
    else if(WR_CNT == (TCMD128 - 2'd2))
     DATA_W_END <= 1'b1;
    else 
     DATA_W_END <= 1'b0;

//=====BURST READ =====
  
always@(posedge clk or negedge rst_n)
    if(!rst_n)
     RD_CNT <= 'd0;
     else if(RD_CNT == (TCMD128 - 1'b1))
     RD_CNT <= 'd0;
    else if(curr_state == READ_ALL_ADDR)
     RD_CNT <= RD_CNT + 1'b1;

always@(posedge clk or negedge rst_n)
    if(!rst_n)
     RD_CYC_CNT <= 'd0;
    else if(curr_state == CYC_DONE_WAITE)
     RD_CYC_CNT <= 'd0;
    else if((cmd == 1'b0) && (cmd_en == 1'b1))
     RD_CYC_CNT <= RD_CYC_CNT + 1'b1;

always@(posedge clk or negedge rst_n)
    if(!rst_n)
     RD_DONE <= 'd0;
    else if(curr_state == CYC_DONE_WAITE)
     RD_DONE <= 'd0;
    else if(RD_CYC_CNT == ADDR_RANGE)
     RD_DONE <= 1'b1; 

always@(posedge clk or negedge rst_n)
    if(!rst_n)
     DATA_R_END <= 'd0;
    else if(curr_state == CYC_DONE_WAITE)
     DATA_R_END <= 'd0;
    else if(RD_CNT == (TCMD128 - 2'd2))
     DATA_R_END <= 1'b1;
    else 
     DATA_R_END <= 1'b0;

//===== pSRAM CTRL =====
always@(posedge clk or negedge rst_n)
 if(!rst_n)
   begin
   cmd         <= 1'b0;
   cmd_en      <= 1'b0;
   addr        <=  'b0;
   wr_data     <=  'b0;
   data_mask   <=  'b0;
   addr_add_w  <=  'b0;
   addr_add_r  <=  'b0;
   wr_data_add <=  'b0;
   end
 else if((WR_CNT == 'd0) && (curr_state == WRITE_ALL_ADDR))
   begin
   cmd         <= 1'b1;
   cmd_en      <= 1'b1;
   addr        <= addr_add_w;
   wr_data     <= wr_data_add;              
   data_mask   <=  'b0;
   addr_add_w  <= addr_add_w + NUM128*2;
   wr_data_add <= wr_data_add + 1'b1;   
   end
 else if((WR_CNT !== 'd0) && (WR_CNT < NUM128) && (curr_state == WRITE_ALL_ADDR))
   begin
   cmd         <= 1'b0;
   cmd_en      <= 1'b0;
   addr        <=  'b0;
   wr_data     <= wr_data_add;              
   data_mask   <=  'b0;  
   addr_add_w  <= addr_add_w;
   wr_data_add <= wr_data_add + 1'b1;  
   end
 else if((RD_CNT == 'd0) && (curr_state == READ_ALL_ADDR))
   begin
   cmd         <= 1'b0;
   cmd_en      <= 1'b1;
   addr        <= addr_add_r;              
   data_mask   <=  'b0;
   addr_add_r  <= addr_add_r + NUM128*2;
   end
 else if(curr_state == CYC_DONE_WAITE)
   begin
   cmd         <= 1'b0;
   cmd_en      <= 1'b0;
   addr        <=  'b0;
   wr_data     <=  'b0;
   data_mask   <=  'b0;
   addr_add_w  <=  'b0;
   addr_add_r  <=  'b0;
   wr_data_add <=  'b0;
   end
 else
   begin
   cmd         <= 1'b0;
   cmd_en      <= 1'b0;
   addr        <=  'b0;
   wr_data     <=  'b0;
   data_mask   <=  'b0;
   end

//=====check read_valid and read data=====

always@(posedge clk or negedge rst_n)
 if(!rst_n)
    check_data <= 'b0;
 else if(curr_state == WRITE_ALL_ADDR)
    check_data <= 'b0;
 else if(rd_data_valid)
    check_data <= check_data + 1'b1;

always@(posedge clk or negedge rst_n)
 if(!rst_n)
  error_d <= 1'b0;
 else if(rd_data_valid && (check_data !== rd_data))
  error_d <= 1'b1;

assign error = error_d;

endmodule
